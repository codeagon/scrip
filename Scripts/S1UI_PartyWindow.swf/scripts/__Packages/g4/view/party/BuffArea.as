class g4.view.party.BuffArea extends gfx.core.UIComponent
{
   var shownPopUpGroupID = -1;
   var rollOutCount = 0;
   var importantModeShowAll = false;
   function BuffArea()
   {
      super();
   }
   function configUI()
   {
      this.buffDataManager = new g4.view.party.BuffDataManager();
      this.buffSlotArray = [];
      this.unusedBuffSlotArray = [];
      this.usedBuffSlotArray = [];
      this.usedBuffSlotMap = {};
      var _loc2_ = 10;
      while((_loc2_ = _loc2_ - 1) >= 0)
      {
         this.unusedBuffSlotArray.push(this.createBuffSlot());
      }
      this.groupButtonIDArray = [];
      this.groupButtonMap = {};
      this.configGroupButton(this.mc_button_group_other,g4.view.party.PartyConstants.BUFF_GROUP_ID_OTHER);
      this.configGroupButton(this.mc_button_group_battle,g4.view.party.PartyConstants.BUFF_GROUP_ID_BATTLE_CONSUMABLE);
      this.configGroupButton(this.mc_button_group_skill,g4.view.party.PartyConstants.BUFF_GROUP_ID_SKILL_AND_GLYPH);
      this.cleanUp();
      this.rearrange();
      g4.model.GameModel.addEventListener(g4.view.ViewID.PARTY_WINDOW,g4.model.GameModelEventType.PARTY_ABNORMALITY_DATA_CHANGED,this,"model_partyAbnormalityDataChangeHandler");
   }
   function setCheckArea(mc)
   {
      this.mc_slot_area_check = mc;
      this.mc_slot_area_check._visible = false;
   }
   function cleanUp()
   {
      this.mc_bg._visible = false;
      this.hideBuffGroupPopUp();
   }
   function configGroupButton(mc, groupID)
   {
      mc.onRollOver = gfx.utils.Delegate.create(this,function()
      {
         mc.gotoAndStop(2);
         this.showBuffGroupPopUp(groupID);
      }
      );
      mc.onRollOut = gfx.utils.Delegate.create(this,function()
      {
         mc.gotoAndStop(1);
      }
      );
      this.groupButtonIDArray.push(groupID);
      this.groupButtonMap[groupID] = mc;
   }
   function getGroupButton(groupID)
   {
      return this.groupButtonMap[groupID];
   }
   function rearrangeGroupButtons()
   {
      var _loc2_ = 0;
      var _loc5_ = undefined;
      var _loc4_ = undefined;
      var _loc6_ = this.groupButtonIDArray.length;
      var _loc3_ = undefined;
      _loc4_ = 0;
      while(_loc4_ < _loc6_)
      {
         _loc5_ = this.groupButtonIDArray[_loc4_];
         _loc3_ = this.getGroupButton(_loc5_);
         if(this.isEnabledGroupPopUp(_loc5_))
         {
            if(_loc2_ > 0)
            {
               _loc2_ = _loc2_ + g4.view.party.PartyConstants.BUFF_SLOT_GAP;
            }
            _loc3_._visible = true;
            _loc3_._x = _loc2_;
            _loc2_ = _loc2_ + g4.view.party.PartyConstants.BUFF_SLOT_WIDTH;
         }
         else
         {
            _loc3_._visible = false;
         }
         _loc4_ = _loc4_ + 1;
      }
      return _loc2_;
   }
   function hideAllGroupButtons()
   {
      var _loc2_ = undefined;
      var _loc3_ = this.groupButtonIDArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this.getGroupButton(this.groupButtonIDArray[_loc2_])._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function rearrange()
   {
      g4.util.UIUtil.callLater(this,"_rearrange");
   }
   function _rearrange()
   {
      if(g4.model.GameModel.partyModel.partyAbnormalityData.type == g4.model.GameConstants.PARTY_ABNORMALITY_VIEW_TYPE_IMPORTANT)
      {
         this.hideBuffGroupPopUp();
         g4.util.UIUtil.addEnterFrameListener(this,"checkImportantModeShowAll");
         this.rearrangeShowImportantMode();
      }
      else
      {
         g4.util.UIUtil.removeEnterFrameListener(this,"checkImportantModeShowAll");
         this.importantModeShowAll = false;
         this.rearrangeShowAllMode();
      }
   }
   function rearrangeSlotAtMainArea(array, startX, startY)
   {
      var _loc3_ = 0;
      var _loc2_ = undefined;
      var _loc5_ = undefined;
      var _loc4_ = undefined;
      var _loc6_ = array != null?array.length:0;
      _loc4_ = 0;
      while(_loc4_ < _loc6_)
      {
         _loc5_ = (g4.view.party.BuffData)array[_loc4_];
         _loc2_ = this.getOrCreateBuffSlot(_loc5_.id);
         _loc2_.setData(_loc5_);
         if(_loc3_ > 0)
         {
            _loc3_ = _loc3_ + g4.view.party.PartyConstants.BUFF_SLOT_GAP;
         }
         _loc2_.__get__targetMovieClip()._x = startX + _loc3_;
         _loc2_.__get__targetMovieClip()._y = startY;
         _loc2_.__get__targetMovieClip()._visible = true;
         _loc3_ = _loc3_ + g4.view.party.PartyConstants.BUFF_SLOT_WIDTH;
         _loc4_ = _loc4_ + 1;
      }
   }
   function hideAllSlots()
   {
      var _loc2_ = undefined;
      var _loc3_ = this.usedBuffSlotArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (g4.view.party.BuffSlot)this.usedBuffSlotArray[_loc2_].__get__targetMovieClip()._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function releaseRemovedSlots()
   {
      var _loc3_ = this.buffDataManager.getRemovedBuffIDs();
      if(_loc3_ == null || _loc3_.length == 0)
      {
         return undefined;
      }
      var _loc2_ = undefined;
      var _loc4_ = _loc3_.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         this.releaseBuffSlot(_loc3_[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function rearrangeShowAllMode()
   {
      var _loc2_ = this.rearrangeGroupButtons();
      if(_loc2_ > 0)
      {
         _loc2_ = _loc2_ + g4.view.party.PartyConstants.BUFF_SLOT_GAP;
      }
      this.hideAllSlots();
      this.releaseRemovedSlots();
      this.rearrangeSlotAtMainArea(this.buffDataManager.getBuffDatasShowAllMode(),_loc2_,0);
      if(this.shownPopUpGroupID != -1)
      {
         this.showBuffGroupPopUp(this.shownPopUpGroupID);
      }
   }
   function rearrangeShowImportantMode()
   {
      this.hideAllGroupButtons();
      this.hideAllSlots();
      this.releaseRemovedSlots();
      if(this.importantModeShowAll)
      {
         var _loc3_ = this.buffDataManager.getAllBuffDatas();
         this.rearrangeSlotAtMainArea(_loc3_,0,0);
         var _loc2_ = _loc3_ != null?_loc3_.length:0;
         if(_loc2_ > 0)
         {
            this.mc_bg._width = g4.view.party.PartyConstants.BUFF_SLOT_WIDTH * _loc2_ + g4.view.party.PartyConstants.BUFF_SLOT_GAP * Math.max(0,_loc2_ - 1) + g4.view.party.PartyConstants.BUFF_BG_PADDING * 2;
            this.mc_bg._height = g4.view.party.PartyConstants.BUFF_SLOT_HEIGHT + g4.view.party.PartyConstants.BUFF_BG_PADDING * 2;
            this.mc_bg._x = - g4.view.party.PartyConstants.BUFF_BG_PADDING;
            this.mc_bg._y = - g4.view.party.PartyConstants.BUFF_BG_PADDING;
            this.mc_bg._visible = true;
         }
         else
         {
            this.mc_bg._visible = false;
         }
      }
      else
      {
         this.rearrangeSlotAtMainArea(this.buffDataManager.getBuffDatasImportantMode(),0,0);
         this.mc_bg._visible = false;
      }
   }
   function checkImportantModeShowAll()
   {
      var _loc3_ = undefined;
      if(this.importantModeShowAll)
      {
         _loc3_ = this.mc_slot_area_check.hitTest(_root._xmouse,_root._ymouse,false) || this.mc_bg.hitTest(_root._xmouse,_root._ymouse,false);
         if(_loc3_)
         {
            this.rollOutCount = 0;
         }
         else if((this.rollOutCount = this.rollOutCount + 1) >= g4.view.party.PartyConstants.BUFF_POPUP_HIDE_DELAY_FRAME)
         {
            this.importantModeShowAll = false;
            this.rearrange();
         }
      }
      else
      {
         _loc3_ = this.mc_slot_area_check.hitTest(_root._xmouse,_root._ymouse,false);
         if(_loc3_)
         {
            this.importantModeShowAll = true;
            this.rearrange();
         }
      }
   }
   function isEnabledGroupPopUp(groupID)
   {
      return g4.view.party.PartyUtil.getOptionValueByGroupID(groupID) && this.buffDataManager.hasData(groupID);
   }
   function showBuffGroupPopUp(groupID)
   {
      this.hideBuffGroupPopUp();
      if(!this.isEnabledGroupPopUp(groupID))
      {
         return undefined;
      }
      if(groupID == this.shownPopUpGroupID)
      {
         return undefined;
      }
      this.shownPopUpGroupID = groupID;
      this.rollOverGroupButton = this.getGroupButton(groupID);
      var _loc12_ = this.rollOverGroupButton._x;
      var _loc14_ = this.rollOverGroupButton._y + g4.view.party.PartyConstants.BUFF_SLOT_HEIGHT;
      this.popupBuffSlotArray = [];
      var _loc9_ = _loc12_ + g4.view.party.PartyConstants.BUFF_BG_PADDING;
      var _loc8_ = _loc14_ + g4.view.party.PartyConstants.BUFF_BG_PADDING;
      var _loc5_ = g4.view.party.PartyConstants.BUFF_POPUP_COLUMN_COUNT;
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc7_ = this.buffDataManager.getAllBuffDatasByGroupID(groupID);
      var _loc2_ = undefined;
      var _loc6_ = _loc7_.length;
      _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         _loc4_ = (g4.view.party.BuffData)_loc7_[_loc2_];
         _loc3_ = this.getOrCreateBuffSlot(_loc4_.id);
         _loc3_.setData(_loc4_);
         _loc3_.__get__targetMovieClip()._x = _loc9_ + (g4.view.party.PartyConstants.BUFF_SLOT_WIDTH + g4.view.party.PartyConstants.BUFF_SLOT_GAP) * (_loc2_ % _loc5_);
         _loc3_.__get__targetMovieClip()._Y = _loc8_ + (g4.view.party.PartyConstants.BUFF_SLOT_WIDTH + g4.view.party.PartyConstants.BUFF_SLOT_GAP) * Math.floor(_loc2_ / _loc5_);
         _loc3_.__get__targetMovieClip()._visible = true;
         this.popupBuffSlotArray.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      var _loc11_ = Math.ceil(_loc6_ / _loc5_);
      var _loc13_ = Math.min(_loc6_,_loc5_);
      var _loc16_ = g4.view.party.PartyConstants.BUFF_SLOT_WIDTH * _loc13_ + g4.view.party.PartyConstants.BUFF_SLOT_GAP * Math.max(0,_loc13_ - 1) + g4.view.party.PartyConstants.BUFF_BG_PADDING * 2;
      var _loc15_ = g4.view.party.PartyConstants.BUFF_SLOT_WIDTH * _loc11_ + g4.view.party.PartyConstants.BUFF_SLOT_GAP * Math.max(0,_loc11_ - 1) + g4.view.party.PartyConstants.BUFF_BG_PADDING * 2;
      this.mc_bg._x = _loc12_;
      this.mc_bg._y = _loc14_;
      this.mc_bg._width = _loc16_;
      this.mc_bg._height = _loc15_;
      this.mc_bg._visible = true;
      g4.util.UIUtil.addEnterFrameListener(this,"checkBuffGroupPopUpRollOut");
   }
   function hideBuffGroupPopUp()
   {
      if(this.shownPopUpGroupID == -1)
      {
         return undefined;
      }
      this.shownPopUpGroupID = -1;
      g4.util.UIUtil.removeEnterFrameListener(this,"checkBuffGroupPopUpRollOut");
      this.rollOutCount = 0;
      this.rollOverGroupButton = null;
      this.mc_bg._visible = false;
      var _loc2_ = undefined;
      var _loc3_ = this.popupBuffSlotArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (g4.view.party.BuffSlot)this.popupBuffSlotArray[_loc2_].__get__targetMovieClip()._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function checkBuffGroupPopUpRollOut()
   {
      if(this.rollOverGroupButton == null || this.rollOverGroupButton._visible == false)
      {
         this.hideBuffGroupPopUp();
         return undefined;
      }
      var _loc3_ = this.rollOverGroupButton.hitTest(_root._xmouse,_root._ymouse,false) || this.mc_bg.hitTest(_root._xmouse,_root._ymouse,false);
      if(_loc3_)
      {
         this.rollOutCount = 0;
      }
      else if((this.rollOutCount = this.rollOutCount + 1) >= g4.view.party.PartyConstants.BUFF_POPUP_HIDE_DELAY_FRAME)
      {
         this.hideBuffGroupPopUp();
      }
   }
   function getOrCreateBuffSlot(buffID)
   {
      var _loc2_ = this.usedBuffSlotMap[buffID];
      if(_loc2_ == null)
      {
         _loc2_ = this.getUnusedBuffSlot();
         if(_loc2_ == null)
         {
            _loc2_ = this.createBuffSlot();
         }
         this.usedBuffSlotArray.push(_loc2_);
         this.usedBuffSlotMap[buffID] = _loc2_;
      }
      return _loc2_;
   }
   function getUnusedBuffSlot()
   {
      if(this.unusedBuffSlotArray.length > 0)
      {
         return (g4.view.party.BuffSlot)this.unusedBuffSlotArray.pop();
      }
      return null;
   }
   function createBuffSlot()
   {
      var _loc3_ = this.attachMovie("$Party.BuffSlot","buff_slot_" + this.buffSlotArray.length,this.getNextHighestDepth());
      var _loc2_ = new g4.view.party.BuffSlot(_loc3_);
      _loc2_.addEventListener("remove",this,"buffSlot_removeHandler");
      this.buffSlotArray.push(_loc2_);
      return _loc2_;
   }
   function releaseBuffSlot(id)
   {
      if(this.usedBuffSlotMap[id] == null)
      {
         return undefined;
      }
      var _loc2_ = this.usedBuffSlotMap[id];
      delete this.usedBuffSlotMap.id;
      g4.util.ArrayUtil.removeElement(this.usedBuffSlotArray,_loc2_);
      _loc2_.cleanUp();
      this.unusedBuffSlotArray.push(_loc2_);
   }
   function addBuff(id, stackCnt, type, group, bRelaxMerit, img, remain, total, currentTime)
   {
      this.buffDataManager.addBuff(id,stackCnt,type,group,bRelaxMerit,img,remain,total,currentTime);
      this.rearrange();
   }
   function removeBuff(id)
   {
      this.buffDataManager.removeBuff(id);
      this.rearrange();
   }
   function clearAllBuffs()
   {
      this.buffDataManager.clearAllBuffs();
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = this.usedBuffSlotArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = (g4.view.party.BuffSlot)this.usedBuffSlotArray[_loc2_];
         _loc3_.cleanUp();
         this.unusedBuffSlotArray.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      this.usedBuffSlotArray = [];
      this.usedBuffSlotMap = {};
      this.rearrange();
   }
   function setTimePause(id, bPause)
   {
      this.buffDataManager.setTimePause(id,bPause);
      this.rearrange();
   }
   function buffSlot_removeHandler(event)
   {
      this.buffDataManager.removeBuff(event.id);
      this.rearrange();
   }
   function model_partyAbnormalityDataChangeHandler(event)
   {
      this.rearrange();
   }
}
