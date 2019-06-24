class lib.gamedata.ItemCollection_MyInventory extends lib.gamedata.GameDataCollectionImpl
{
   static var _this = null;
   function ItemCollection_MyInventory()
   {
      super();
   }
   static function getInstance()
   {
      if(lib.gamedata.ItemCollection_MyInventory._this == null)
      {
         lib.gamedata.ItemCollection_MyInventory._this = new lib.gamedata.ItemCollection_MyInventory();
         lib.gamedata.ItemCollection_MyInventory._this.createOnGameListener(lib.gamedata.ItemCollection_MyInventory._this);
      }
      return lib.gamedata.ItemCollection_MyInventory._this;
   }
   function updateData(data)
   {
      this.dispatchEvent({type:gfx.events.EventTypes.UPDATE,id:data.getId(),target:data,data:data});
   }
   function coolTimeHandler(event)
   {
      this.dispatchEvent({type:event.type,target:event.target,id:event.getId(),data:event.target});
   }
   function processUpdateData(itemInfo)
   {
      var _loc10_ = itemInfo[0];
      var _loc15_ = itemInfo[1];
      var _loc11_ = itemInfo[2];
      var _loc8_ = itemInfo[3];
      var _loc12_ = itemInfo[4];
      var _loc16_ = itemInfo[5];
      var _loc9_ = itemInfo[6];
      var _loc13_ = itemInfo[7];
      var _loc7_ = itemInfo[8];
      var _loc14_ = itemInfo[9];
      var _loc4_ = this.getData(_loc10_);
      var _loc5_ = {id:_loc10_,img:_loc15_,stackedNum:_loc11_,bStackable:_loc8_,disableState:_loc12_,grade:_loc16_,bNew:_loc9_,sealType:_loc13_,bMasterpiece:_loc7_,durability:_loc14_};
      var _loc3_ = new lib.gamedata.Item(_loc5_);
      var _loc6_ = _loc4_ == null?false:true;
      if(_loc6_)
      {
         if(!_loc4_.checkEqual(_loc3_))
         {
            _loc4_.updateData(_loc5_);
            this.updateData(_loc3_);
         }
      }
      else
      {
         this.addData(_loc3_);
         _loc3_.addEventListener(gfx.events.EventTypes.COOLTIME_END,this,"coolTimeHandler");
         _loc3_.addEventListener(gfx.events.EventTypes.COOLTIME_START,this,"coolTimeHandler");
         _loc3_.addEventListener(gfx.events.EventTypes.COOLTIME_TICK,this,"coolTimeHandler");
         _loc3_.addEventListener(gfx.events.EventTypes.COOLTIME_UPDATE,this,"coolTimeHandler");
      }
   }
   function clear(dontDispatch)
   {
      if(dontDispatch)
      {
         this.data_array.splice(0,this.getLength());
      }
      else
      {
         super.clear();
      }
   }
   function createOnGameListener(collection)
   {
      this.myListener = new Object();
      _global.EventBroadCaster.addListener(this.myListener);
      this.myListener.OnGameEventSetInvenItemList = function(itemDataList)
      {
         var _loc9_ = collection.getLength();
         var _loc6_ = new Array(_loc9_);
         var _loc8_ = new Array();
         var _loc7_ = new Array();
         var _loc5_ = lib.util.ExtString.split(itemDataList,"\n");
         var _loc2_ = 0;
         while(_loc2_ < _loc5_.length)
         {
            var _loc3_ = lib.util.ExtString.split(_loc5_[_loc2_],"\t");
            var _loc4_ = Number(_loc3_[0]);
            _loc6_[_loc4_] = 1;
            _loc2_ = _loc2_ + 1;
         }
         _loc2_ = 0;
         while(_loc2_ < this.totalItemSlotNum)
         {
            if(_loc6_[_loc2_] == 1)
            {
               _loc8_.push(_loc2_);
            }
            else
            {
               _loc7_.push(_loc2_);
            }
            _loc2_ = _loc2_ + 1;
         }
         this.OnGame_InventoryWindow_RemoveItem(_loc7_.join("\n"));
         this.OnGame_InventoryWindow_UpdateItem(itemDataList);
      };
      this.myListener.OnGame_InventoryWindow_AddItem = function(dataList)
      {
         this.OnGame_InventoryWindow_UpdateItem(dataList);
      };
      this.myListener.OnGame_InventoryWindow_UpdateItem = function(dataList)
      {
         var _loc3_ = lib.util.ExtString.split(dataList,"\n");
         var _loc1_ = 0;
         while(_loc1_ < _loc3_.length)
         {
            var _loc2_ = lib.util.ExtString.split(_loc3_[_loc1_],"\t");
            collection.processUpdateData(_loc2_);
            _loc1_ = _loc1_ + 1;
         }
      };
      this.myListener.OnGame_InventoryWindow_RemoveItem = function(dataList)
      {
         var _loc3_ = lib.util.ExtString.split(dataList,"\n");
         var _loc1_ = 0;
         while(_loc1_ < _loc3_.length)
         {
            var _loc2_ = lib.util.ExtString.split(_loc3_[_loc1_],"\t");
            collection.removeData(_loc2_[0]);
            _loc1_ = _loc1_ + 1;
         }
      };
      this.myListener.OnGame_InventoryWindow_ClearItem = function()
      {
         collection.clear();
      };
      this.myListener.OnGame_InventoryWindow_SetItemCoolTime = function(itemIndexs, remain, total)
      {
         var _loc3_ = lib.util.ExtString.split(itemIndexs,"\t");
         var _loc1_ = 0;
         while(_loc1_ < _loc3_.length)
         {
            var _loc2_ = collection.getData(_loc3_[_loc1_]);
            _loc2_.setCoolTime(remain,total);
            _loc1_ = _loc1_ + 1;
         }
      };
      this.myListener.OnGame_InventoryWindow_SetSlotLine = function(wantLineNum, bClear)
      {
         this.totalItemSlotNum = wantLineNum * 8;
      };
      this.myListener.OnGame_LogOut = function()
      {
         collection.clear();
      };
   }
}
