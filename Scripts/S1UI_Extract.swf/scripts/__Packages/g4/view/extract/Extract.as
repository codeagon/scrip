class g4.view.extract.Extract extends g4.core.View implements g4.gameInterface.IExtract
{
   var nItemHeight = 54;
   function Extract($targetMovie)
   {
      super($targetMovie);
   }
   function getUIName()
   {
      return "Extract";
   }
   function configUI()
   {
      this.__get__targetMovieClip().container_mc.UIDragger.setData(this.getUIName(),this.__get__targetMovieClip());
      this.bClose = this.__get__targetMovieClip().container_mc.bClose;
      this.bConfirm = this.__get__targetMovieClip().container_mc.bConfirm;
      this.bCancel = this.__get__targetMovieClip().container_mc.bCancel;
      this.textField = this.__get__targetMovieClip().container_mc.textField;
      this.listGroup = this.__get__targetMovieClip().container_mc.listGroup;
      this.tCount = this.__get__targetMovieClip().container_mc.tCount;
      this.mBackground = this.__get__targetMovieClip().container_mc.mBackground;
      this.mDrop = this.__get__targetMovieClip().container_mc.mDrop;
      this.mAddPoint = this.listGroup.mAddPoint;
      this.mArea = this.listGroup.mArea;
      this.scrollBar = this.listGroup.scrollBar;
      this.scrollBar.__set__pageSize(this.mAddPoint._height);
      this.scrollBar.__set__rowHeight(this.nItemHeight);
      this.scrollBar.__set__displaySize(403);
      this.mDrop.onScroll = g4.util.Delegate.create(this,this.scrHandlerScroll);
      this.scrollBar.setWheel(this.mDrop);
      this.scrollBar.addListener(this.mDrop);
      this.textField.text = lib.util.UIString.getUIString("$152007");
      this.bConfirm.__set__label(lib.util.UIString.getUIString("$152008"));
      this.bCancel.__set__label(lib.util.UIString.getUIString("$152009"));
      this._itemsActive = [];
      this._itemsPool = [];
      this.bClose.addEventListener(gfx.events.EventTypes.CLICK,this,"ToGame_Extract_Close");
      this.bCancel.addEventListener(gfx.events.EventTypes.CLICK,this,"ToGame_Extract_Close");
      this.bConfirm.addEventListener(gfx.events.EventTypes.CLICK,this,"ToGame_Extract_Confirm");
      this.bConfirm.__set__disabled(true);
      this.checkCount();
      this.mDrop.GetName = function()
      {
         return "Extract";
      };
      this.ToGame_Extract_Init();
      if(_global.gfxPlayer)
      {
         this.setViewVisible(true);
         this.OnGame_Extract_AddItem(33,"",1,"111",1);
         this.OnGame_Extract_AddItem(34,"",1,"222",1);
         this.OnGame_Extract_AddItem(35,"",1,"333",1);
         this.OnGame_Extract_AddItem(36,"",1,"444",1);
         this.OnGame_Extract_AddItem(37,"",1,"555",1);
         this.OnGame_Extract_AddItem(38,"",1,"666",1);
         this.OnGame_Extract_AddItem(39,"",1,"777",1);
         this.OnGame_Extract_AddItem(40,"",1,"888",1);
         this.OnGame_Extract_AddItem(41,"",1,"999",1);
         this.OnGame_Extract_AddItem(42,"",1,"000",1);
         this.OnGame_Extract_AddItem(43,"",1,"--",1);
         this.OnGame_Extract_AddItem(44,"",1,"마르고 닳도록 하느님이 보우하사 우리나라",3);
      }
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_Extract_AddItem",g4.util.Delegate.create(this,this.OnGame_Extract_AddItem));
      this.registerGameInterface("OnGame_Extract_RemoveItem",g4.util.Delegate.create(this,this.OnGame_Extract_RemoveItem));
      this.registerGameInterface("OnGame_Extract_SetButtonState",g4.util.Delegate.create(this,this.OnGame_Extract_SetButtonState));
      this.registerGameInterface("OnGame_Extract_ClearList",g4.util.Delegate.create(this,this.OnGame_Extract_ClearList));
      this.registerGameInterface("OnGame_MouseDown",g4.util.Delegate.create(this,this.OnGame_MouseDown));
   }
   function scrHandlerScroll($position)
   {
      this.mAddPoint._y = - $position;
   }
   function itemHandlerDelete(event)
   {
      this.ToGame_Extract_RemoveItem(event.itemID);
   }
   function getItem($id)
   {
      var _loc3_ = undefined;
      var _loc4_ = this._itemsActive.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         if((g4.view.extract.ExtractItem)this._itemsActive[_loc2_].itemID == $id)
         {
            _loc3_ = this._itemsActive[_loc2_];
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc3_ != null)
      {
         return _loc3_;
      }
      if(this._itemsPool.length > 0)
      {
         _loc3_ = (g4.view.extract.ExtractItem)this._itemsPool.pop();
      }
      else
      {
         var _loc6_ = this.mAddPoint.getNextHighestDepth();
         _loc3_ = (g4.view.extract.ExtractItem)this.mAddPoint.attachMovie("ExtractItem","ExtractItem__" + _loc6_,_loc6_);
         _loc3_.addEventListener("delete",this,"itemHandlerDelete");
      }
      _loc3_.__set__visible(true);
      this._itemsActive.push(_loc3_);
      return _loc3_;
   }
   function checkScroll()
   {
      this.scrollBar.__set__pageSize(this.mAddPoint._height);
   }
   function checkPosition()
   {
      var _loc3_ = this._itemsActive.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this._itemsActive[_loc2_]._y = _loc2_ * this.nItemHeight;
         _loc2_ = _loc2_ + 1;
      }
   }
   function checkCount()
   {
      this.tCount.text = this._itemsActive.length + "/20";
   }
   function OnGame_Extract_AddItem($id, $icon, $grade, $name, $quantity)
   {
      var _loc3_ = this.getItem($id);
      _loc3_.setData($id,$icon,$grade,$name,$quantity);
      this.checkPosition();
      this.checkScroll();
      var _loc2_ = this._itemsActive.length * this.nItemHeight;
      this.scrollBar.setScrollPosition(_loc2_);
      this.checkCount();
   }
   function OnGame_Extract_RemoveItem($id)
   {
      var _loc4_ = this._itemsActive.length;
      var _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = (g4.view.extract.ExtractItem)this._itemsActive[_loc3_];
         if(_loc2_.itemID == $id)
         {
            this._itemsActive.splice(_loc3_,1);
            _loc2_.resetData();
            _loc2_._y = 0;
            _loc2_.__set__visible(false);
            this._itemsPool.push(_loc2_);
            this.checkPosition();
            this.checkScroll();
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      this.checkCount();
   }
   function OnGame_Extract_SetButtonState($state)
   {
      this.bConfirm.__set__disabled($state == 0);
   }
   function OnGame_Extract_ClearList()
   {
      while(this._itemsActive.length > 0)
      {
         var _loc2_ = (g4.view.extract.ExtractItem)this._itemsActive.pop();
         _loc2_.resetData();
         _loc2_.__set__visible(false);
         this._itemsPool.push(_loc2_);
      }
      this.checkCount();
   }
   function OnGame_MouseDown($button, $target)
   {
      if(!this.__get__targetMovieClip().bWindowOpen)
      {
         return undefined;
      }
      if($button == 2)
      {
         var _loc4_ = this._itemsActive.length;
         var _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if((g4.view.extract.ExtractItem)this._itemsActive[_loc3_].cover.hitTest(_root._xmouse,_root._ymouse))
            {
               (g4.view.extract.ExtractItem)this._itemsActive[_loc3_].deleteHandlerClick(null);
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function ToGame_Extract_Init()
   {
      fscommand("ToGame_Extract_Init");
   }
   function ToGame_Extract_Confirm($result)
   {
      var _loc3_ = "";
      var _loc4_ = this._itemsActive.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = _loc3_ + ((g4.view.extract.ExtractItem)this._itemsActive[_loc2_].itemID + "\t");
         _loc2_ = _loc2_ + 1;
      }
      getURL("FSCommand:ToGame_Extract_Confirm",_loc3_);
   }
   function ToGame_Extract_Clear()
   {
      fscommand("ToGame_Extract_Clear");
   }
   function ToGame_Extract_Close()
   {
      fscommand("ToGame_Extract_Close");
   }
   function ToGame_Extract_RemoveItem($id)
   {
      getURL("FSCommand:ToGame_Extract_RemoveItem",$id);
      if(_global.gfxPlayer)
      {
         this.OnGame_Extract_RemoveItem($id);
      }
   }
}
