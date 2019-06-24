class g4.view.partyRaid.BuffArea extends gfx.core.UIComponent
{
   var showAllMode = false;
   var updateBuffItemPositionFlag = true;
   function BuffArea()
   {
      super();
      this.buffIDArray = [];
      this.buffIDMap = {};
      this.debuffIDArray = [];
      this.debuffIDMap = {};
      this.buffIDToTypeMap = {};
      this.buffItemArray = [];
      this.unusedBuffItemArray = [];
      this.usedBuffItemMap = {};
   }
   function configUI()
   {
      this.cleanUp();
      this.createBuffItems(10);
      this.updateByUIMode();
      g4.model.GameModel.addEventListener(g4.view.ViewID.PARTY_WINDOW_RAID_INFO,g4.model.GameModelEventType.MAIN_UI_MODE_CHANGED,this,"model_mainUIModeChangeHandler");
   }
   function draw()
   {
      if(this.updateBuffItemPositionFlag)
      {
         this.updateBuffItemPositionFlag = false;
         this.updateBuffItemPosition();
      }
   }
   function cleanUp()
   {
      this.buffRemoveAll(NaN);
   }
   function isBuff(type)
   {
      return type == 0;
   }
   function updateBuffItemPosition()
   {
      if(this.showAllMode)
      {
         this.updateBuffItemPositionAll();
      }
      else
      {
         this.updateBuffItemPositionSome();
      }
   }
   function hideAllBuffItems()
   {
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      _loc4_ = this.buffIDArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this.getBuffItem(this.buffIDArray[_loc2_]);
         _loc3_._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      _loc4_ = this.debuffIDArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = this.getBuffItem(this.debuffIDArray[_loc2_]);
         _loc3_._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateBuffItemPositionSome()
   {
      this.hideAllBuffItems();
      var _loc10_ = 5;
      var _loc9_ = Math.min(_loc10_,this.debuffIDArray.length);
      var _loc11_ = Math.min(_loc10_ - _loc9_,this.buffIDArray.length);
      var _loc5_ = g4.view.partyRaid.PartyRaidConstants.BUFF_SLOT_COLUMN_COUNT;
      var _loc8_ = g4.view.partyRaid.PartyRaidConstants.BUFF_SLOT_SIZE;
      var _loc7_ = g4.view.partyRaid.PartyRaidConstants.BUFF_SLOT_SIZE;
      var _loc2_ = undefined;
      var _loc4_ = 0;
      var _loc3_ = undefined;
      var _loc6_ = undefined;
      _loc6_ = _loc11_;
      _loc3_ = 0;
      while(_loc3_ < _loc6_)
      {
         _loc2_ = this.getBuffItem(this.buffIDArray[_loc3_]);
         _loc2_._visible = true;
         _loc2_._x = _loc8_ * (_loc4_ % _loc5_);
         _loc2_._y = _loc7_ * Math.floor(_loc4_ / _loc5_);
         _loc4_ = _loc4_ + 1;
         _loc3_ = _loc3_ + 1;
      }
      _loc6_ = _loc9_;
      _loc3_ = 0;
      while(_loc3_ < _loc6_)
      {
         _loc2_ = this.getBuffItem(this.debuffIDArray[_loc3_]);
         _loc2_._visible = true;
         _loc2_._x = _loc8_ * (_loc4_ % _loc5_);
         _loc2_._y = _loc7_ * Math.floor(_loc4_ / _loc5_);
         _loc4_ = _loc4_ + 1;
         _loc3_ = _loc3_ + 1;
      }
      this.mc_bg._visible = false;
   }
   function updateBuffItemPositionAll()
   {
      var _loc5_ = g4.view.partyRaid.PartyRaidConstants.BUFF_SLOT_COLUMN_COUNT;
      var _loc7_ = g4.view.partyRaid.PartyRaidConstants.BUFF_SLOT_SIZE;
      var _loc6_ = g4.view.partyRaid.PartyRaidConstants.BUFF_SLOT_SIZE;
      var _loc2_ = undefined;
      var _loc4_ = 0;
      var _loc3_ = undefined;
      var _loc8_ = undefined;
      _loc8_ = this.buffIDArray.length;
      _loc3_ = 0;
      while(_loc3_ < _loc8_)
      {
         _loc2_ = this.getBuffItem(this.buffIDArray[_loc3_]);
         _loc2_._visible = true;
         _loc2_._x = _loc7_ * (_loc4_ % _loc5_);
         _loc2_._y = _loc6_ * Math.floor(_loc4_ / _loc5_);
         _loc4_ = _loc4_ + 1;
         _loc3_ = _loc3_ + 1;
      }
      _loc8_ = this.debuffIDArray.length;
      _loc3_ = 0;
      while(_loc3_ < _loc8_)
      {
         _loc2_ = this.getBuffItem(this.debuffIDArray[_loc3_]);
         _loc2_._visible = true;
         _loc2_._x = _loc7_ * (_loc4_ % _loc5_);
         _loc2_._y = _loc6_ * Math.floor(_loc4_ / _loc5_);
         _loc4_ = _loc4_ + 1;
         _loc3_ = _loc3_ + 1;
      }
      if(_loc4_ <= _loc5_)
      {
         this.mc_bg._visible = false;
         return undefined;
      }
      this.mc_bg._visible = true;
      var _loc10_ = g4.view.partyRaid.PartyRaidConstants.BUFF_BG_PADDING * 2 + _loc7_ * _loc5_;
      var _loc9_ = g4.view.partyRaid.PartyRaidConstants.BUFF_BG_PADDING * 2 + _loc6_ * Math.ceil(_loc4_ / _loc5_);
      this.mc_bg._x = - g4.view.partyRaid.PartyRaidConstants.BUFF_BG_PADDING;
      this.mc_bg._y = - g4.view.partyRaid.PartyRaidConstants.BUFF_BG_PADDING;
      this.mc_bg._width = _loc10_;
      this.mc_bg._height = _loc9_;
   }
   function buffAdd(id, stackCnt, type, bRelaxMerit, img, remain, total)
   {
      this.buffIDToTypeMap[id] = type;
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      if(this.isBuff(type))
      {
         _loc3_ = this.buffIDArray;
         _loc2_ = this.buffIDMap;
      }
      else
      {
         _loc3_ = this.debuffIDArray;
         _loc2_ = this.debuffIDMap;
      }
      this._buffAdd(_loc3_,_loc2_,id,type,img);
   }
   function _buffAdd(array, map, id, type, img)
   {
      if(map[id])
      {
         g4.util.ArrayUtil.removeElement(array,id);
      }
      array.push(id);
      map[id] = true;
      var _loc3_ = this.getOrCreateBuffItem(id);
      _loc3_.setData(type,img);
      this.updateBuffItemPositionFlag = true;
      this.invalidate();
   }
   function buffRemove(id)
   {
      if(this.buffIDMap[id])
      {
         g4.util.ArrayUtil.removeElement(this.buffIDArray,id);
         delete this.buffIDMap.id;
      }
      else if(this.debuffIDMap[id])
      {
         g4.util.ArrayUtil.removeElement(this.debuffIDArray,id);
         delete this.debuffIDMap.id;
      }
      this.releaseBuffItem(id);
      this.updateBuffItemPositionFlag = true;
      this.invalidate();
   }
   function buffRemoveAll(type)
   {
      var _loc4_ = false;
      var _loc5_ = false;
      if(isNaN(type))
      {
         _loc4_ = true;
         _loc5_ = true;
      }
      else
      {
         _loc4_ = this.isBuff(type);
         _loc5_ = !_loc4_;
      }
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      if(_loc4_)
      {
         _loc3_ = this.buffIDArray.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.releaseBuffItem(this.buffIDArray[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         this.buffIDArray = [];
         this.buffIDMap = {};
      }
      if(_loc5_)
      {
         _loc3_ = this.debuffIDArray.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.releaseBuffItem(this.debuffIDArray[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         this.debuffIDArray = [];
         this.debuffIDMap = {};
      }
      this.updateBuffItemPositionFlag = true;
      this.invalidate();
   }
   function setTimePause(id, bPause)
   {
      var _loc2_ = this.getBuffItem(id);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setTimePause(bPause);
   }
   function createBuffItems(count)
   {
      while((count = count - 1) >= 0)
      {
         var _loc2_ = this.createBuffItem();
         this.unusedBuffItemArray.push(_loc2_);
      }
   }
   function createBuffItem()
   {
      var _loc2_ = (g4.view.partyRaid.BuffItem)this.attachMovie("$PartyRaid.BuffItem","mc_buff_item_" + this.buffItemArray.length,this.getNextHighestDepth());
      _loc2_.cleanUp();
      _loc2_._visible = false;
      this.buffItemArray.push(_loc2_);
      return _loc2_;
   }
   function getOrCreateBuffItem(id)
   {
      var _loc2_ = this.usedBuffItemMap[id];
      if(_loc2_ == null)
      {
         if(this.unusedBuffItemArray.length > 0)
         {
            _loc2_ = (g4.view.partyRaid.BuffItem)this.unusedBuffItemArray.pop();
         }
         else
         {
            _loc2_ = this.createBuffItem();
         }
         this.usedBuffItemMap[id] = _loc2_;
      }
      return _loc2_;
   }
   function releaseBuffItem(id)
   {
      var _loc2_ = this.usedBuffItemMap[id];
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.cleanUp();
      _loc2_._visible = false;
      delete this.usedBuffItemMap.id;
      this.unusedBuffItemArray.push(_loc2_);
   }
   function getBuffItem(id)
   {
      return this.usedBuffItemMap[id];
   }
   function updateByUIMode()
   {
      if(g4.model.GameModel.mainModel.uiMode)
      {
         g4.util.UIUtil.addEnterFrameListener(this,"enterFrameHandler");
      }
      else
      {
         g4.util.UIUtil.removeEnterFrameListener(this,"enterFrameHandler");
      }
   }
   function enterFrameHandler()
   {
      var _loc2_ = this.contains(this,Mouse.getTopMostEntity(true));
      if(this.showAllMode)
      {
         if(!_loc2_)
         {
            this.showAllMode = false;
            this.updateBuffItemPositionFlag = true;
            this.invalidate();
         }
      }
      else if(_loc2_)
      {
         this.showAllMode = true;
         this.updateBuffItemPositionFlag = true;
         this.invalidate();
      }
   }
   function contains(parent, child)
   {
      var _loc1_ = child;
      while(true)
      {
         if(_loc1_ == null)
         {
            break;
         }
         if(_loc1_ == parent)
         {
            return true;
         }
         _loc1_ = _loc1_._parent;
      }
      return false;
   }
   function model_mainUIModeChangeHandler(event)
   {
      this.updateByUIMode();
   }
}
