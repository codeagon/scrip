class g4.view.abnormality.BuffArea extends gfx.core.UIComponent
{
   var shownPopUpGroupID = -1;
   var rollOutCount = 0;
   var alignmentGroupButtonStartX = 0;
   var alignmentGroupButtonStartY = 0;
   var alignmentGroupButtonWidth = 0;
   var alignmentGroupButtonHeight = 0;
   var alignmentGroupButtonGapX = 0;
   var alignmentGroupButtonGapY = 0;
   var alignmentBuffSlotStartX = 0;
   var alignmentBuffSlotStartY = 0;
   var alignmentBuffSlotWidth = 0;
   var alignmentBuffSlotHeight = 0;
   var alignmentBuffSlotGapX = 0;
   var alignmentBuffSlotGapY = 0;
   function BuffArea()
   {
      super();
   }
   function configUI()
   {
      super.configUI();
      this.buffDataManager = new g4.view.abnormality.BuffDataManager();
      this.buffSlotArray = [];
      this.unusedBuffSlotArray = [];
      this.usedBuffSlotArray = [];
      this.usedBuffSlotMap = {};
      var _loc3_ = 10;
      while((_loc3_ = _loc3_ - 1) >= 0)
      {
         this.unusedBuffSlotArray.push(this.createBuffSlot());
      }
      this.groupButtonIDArray = [];
      this.groupButtonMap = {};
      this.configGroupButton(this.mc_button_group_other,g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_OTHER);
      this.configGroupButton(this.mc_button_group_battle,g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_BATTLE_CONSUMABLE);
      this.configGroupButton(this.mc_button_group_skill,g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_SKILL_AND_GLYPH);
      this.cleanUp();
      this.rearrange();
      g4.model.GameModel.addEventListener(g4.view.ViewID.ABNORMALITY,g4.model.GameModelEventType.ABNORMALITY_DATA_CHANGED,this,"model_abnormalityDataChangeHandler");
   }
   function isVerticalAlignment()
   {
      switch(g4.view.abnormality.AbnormalityGlobals.alignmentType)
      {
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_UP:
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_DOWN:
            return true;
         default:
            return false;
      }
   }
   function updateByAlignmentType()
   {
      this.alignmentGroupButtonStartX = 0;
      this.alignmentGroupButtonStartY = 0;
      this.alignmentGroupButtonWidth = 0;
      this.alignmentGroupButtonHeight = 0;
      this.alignmentGroupButtonGapX = 0;
      this.alignmentGroupButtonGapY = 0;
      this.alignmentBuffSlotStartX = 0;
      this.alignmentBuffSlotStartY = 0;
      this.alignmentBuffSlotWidth = 0;
      this.alignmentBuffSlotHeight = 0;
      this.alignmentBuffSlotGapX = 0;
      this.alignmentBuffSlotGapY = 0;
      switch(g4.view.abnormality.AbnormalityGlobals.alignmentType)
      {
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_LEFT:
            this.alignmentGroupButtonStartX = - g4.view.abnormality.AbnormalityConstants.GROUP_BUTTON_WIDTH;
            this.alignmentGroupButtonWidth = - g4.view.abnormality.AbnormalityConstants.GROUP_BUTTON_WIDTH;
            this.alignmentGroupButtonGapX = - g4.view.abnormality.AbnormalityConstants.GROUP_BUTTON_GAP;
            this.alignmentBuffSlotStartX = - g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_WIDTH;
            this.alignmentBuffSlotWidth = - g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_WIDTH;
            this.alignmentBuffSlotGapX = - g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_GAP;
            break;
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_RIGHT:
            this.alignmentGroupButtonWidth = g4.view.abnormality.AbnormalityConstants.GROUP_BUTTON_WIDTH;
            this.alignmentGroupButtonGapX = g4.view.abnormality.AbnormalityConstants.GROUP_BUTTON_GAP;
            this.alignmentBuffSlotWidth = g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_WIDTH;
            this.alignmentBuffSlotGapX = g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_GAP;
            break;
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_UP:
            this.alignmentGroupButtonStartY = - g4.view.abnormality.AbnormalityConstants.GROUP_BUTTON_HEIGHT;
            this.alignmentGroupButtonHeight = - g4.view.abnormality.AbnormalityConstants.GROUP_BUTTON_HEIGHT;
            this.alignmentGroupButtonGapY = - g4.view.abnormality.AbnormalityConstants.GROUP_BUTTON_GAP;
            this.alignmentBuffSlotStartY = - g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_HEIGHT;
            this.alignmentBuffSlotHeight = - g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_HEIGHT;
            this.alignmentBuffSlotGapY = - g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_GAP;
            break;
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_DOWN:
            this.alignmentGroupButtonHeight = g4.view.abnormality.AbnormalityConstants.GROUP_BUTTON_HEIGHT;
            this.alignmentGroupButtonGapY = g4.view.abnormality.AbnormalityConstants.GROUP_BUTTON_GAP;
            this.alignmentBuffSlotHeight = g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_HEIGHT;
            this.alignmentBuffSlotGapY = g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_GAP;
      }
      this.rearrange();
   }
   function isEnabledGroupPopUp(groupID)
   {
      return g4.view.abnormality.AbnormalityUtil.getOptionValueByGroupID(groupID) && this.buffDataManager.hasData(groupID);
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
      this.rollOverGroupButton = this.getGroupButton(this.shownPopUpGroupID);
      var _loc5_ = g4.view.abnormality.AbnormalityConstants.BUFF_POPUP_COLUMN_COUNT;
      var _loc6_ = this.buffDataManager.getAllBuffDatasByGroupID(groupID);
      var _loc14_ = _loc6_.length;
      var _loc15_ = Math.ceil(_loc14_ / _loc5_);
      var _loc17_ = Math.min(_loc14_,_loc5_);
      var _loc13_ = g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_WIDTH * _loc17_ + g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_GAP * Math.max(0,_loc17_ - 1) + g4.view.abnormality.AbnormalityConstants.BUFF_POPUP_BG_PADDING * 2;
      var _loc12_ = g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_HEIGHT * _loc15_ + g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_GAP * Math.max(0,_loc15_ - 1) + g4.view.abnormality.AbnormalityConstants.BUFF_POPUP_BG_PADDING * 2;
      var _loc10_ = 0;
      var _loc11_ = 0;
      switch(g4.view.abnormality.AbnormalityGlobals.alignmentType)
      {
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_LEFT:
            _loc10_ = this.rollOverGroupButton._x + g4.view.abnormality.AbnormalityConstants.GROUP_BUTTON_WIDTH - _loc13_;
            _loc11_ = this.rollOverGroupButton._y - _loc12_ - g4.view.abnormality.AbnormalityConstants.BUFF_POPUP_BG_MARGIN;
            break;
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_RIGHT:
            _loc10_ = this.rollOverGroupButton._x;
            _loc11_ = this.rollOverGroupButton._y - _loc12_ - g4.view.abnormality.AbnormalityConstants.BUFF_POPUP_BG_MARGIN;
            break;
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_UP:
            _loc10_ = this.rollOverGroupButton._x - _loc13_ - g4.view.abnormality.AbnormalityConstants.BUFF_POPUP_BG_MARGIN;
            _loc11_ = this.rollOverGroupButton._y + g4.view.abnormality.AbnormalityConstants.GROUP_BUTTON_WIDTH - _loc12_;
            break;
         case g4.view.abnormality.AbnormalityConstants.BUFF_ALIGNMENT_TYPE_DOWN:
            _loc10_ = this.rollOverGroupButton._x - _loc13_ - g4.view.abnormality.AbnormalityConstants.BUFF_POPUP_BG_MARGIN;
            _loc11_ = this.rollOverGroupButton._y;
      }
      this.mc_bg._x = _loc10_;
      this.mc_bg._y = _loc11_;
      this.mc_bg._width = _loc13_;
      this.mc_bg._height = _loc12_;
      this.mc_bg._visible = true;
      this.popupBuffSlotArray = [];
      var _loc9_ = _loc10_ + g4.view.abnormality.AbnormalityConstants.BUFF_POPUP_BG_PADDING;
      var _loc8_ = _loc11_ + g4.view.abnormality.AbnormalityConstants.BUFF_POPUP_BG_PADDING;
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc2_ = undefined;
      var _loc7_ = _loc14_;
      _loc2_ = 0;
      while(_loc2_ < _loc7_)
      {
         _loc4_ = (g4.view.abnormality.BuffData)_loc6_[_loc2_];
         _loc3_ = this.getOrCreateBuffSlot(_loc4_.id);
         _loc3_.setData(_loc4_);
         _loc3_.__get__targetMovieClip()._x = _loc9_ + (g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_WIDTH + g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_GAP) * (_loc2_ % _loc5_);
         _loc3_.__get__targetMovieClip()._Y = _loc8_ + (g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_HEIGHT + g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_GAP) * Math.floor(_loc2_ / _loc5_);
         _loc3_.__get__targetMovieClip()._visible = true;
         this.popupBuffSlotArray.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
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
         (g4.view.abnormality.BuffSlot)this.popupBuffSlotArray[_loc2_].__get__targetMovieClip()._visible = false;
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
      else if((this.rollOutCount = this.rollOutCount + 1) >= g4.view.abnormality.AbnormalityConstants.BUFF_POPUP_HIDE_DELAY_FRAME)
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
         return (g4.view.abnormality.BuffSlot)this.unusedBuffSlotArray.pop();
      }
      return null;
   }
   function createBuffSlot()
   {
      var _loc3_ = this.attachMovie("$Abnormality.BuffSlot","buff_slot_" + this.buffSlotArray.length,this.getNextHighestDepth());
      var _loc2_ = new g4.view.abnormality.BuffSlot(_loc3_);
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
   function cleanUp()
   {
      this.mc_bg._visible = false;
      this.hideBuffGroupPopUp();
   }
   function addBuff(id, stackCnt, type, group, bRelaxMerit, img, remainTime, totalTime, currentTime)
   {
      this.buffDataManager.addBuff(id,stackCnt,type,group,bRelaxMerit,img,remainTime,totalTime,currentTime);
      this.rearrange();
   }
   function updateBuff(id, group, stackCnt, useRelaxMerit, img, remain, total, currentTime)
   {
      this.buffDataManager.updateBuff(id,group,stackCnt,useRelaxMerit,img,remain,total,currentTime);
      this.rearrange();
   }
   function removeBuff(id)
   {
      this.buffDataManager.removeBuff(id);
      this.rearrange();
   }
   function holdBuff(id, group)
   {
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
         _loc3_ = (g4.view.abnormality.BuffSlot)this.usedBuffSlotArray[_loc2_];
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
      var _loc4_ = 0;
      var _loc5_ = undefined;
      var _loc3_ = undefined;
      var _loc6_ = this.groupButtonIDArray.length;
      var _loc2_ = undefined;
      _loc3_ = 0;
      while(_loc3_ < _loc6_)
      {
         _loc5_ = this.groupButtonIDArray[_loc3_];
         _loc2_ = this.getGroupButton(_loc5_);
         if(this.isEnabledGroupPopUp(_loc5_))
         {
            _loc2_._visible = true;
            _loc2_._x = this.alignmentGroupButtonStartX + (this.alignmentGroupButtonWidth + this.alignmentGroupButtonGapX) * _loc4_;
            _loc2_._y = this.alignmentGroupButtonStartY + (this.alignmentGroupButtonHeight + this.alignmentGroupButtonGapY) * _loc4_;
            _loc4_ = _loc4_ + 1;
         }
         else
         {
            _loc2_._visible = false;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(this.isVerticalAlignment())
      {
         return (this.alignmentGroupButtonHeight + this.alignmentGroupButtonGapY) * _loc4_;
      }
      return (this.alignmentGroupButtonWidth + this.alignmentGroupButtonGapX) * _loc4_;
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
      this.hideAllSlots();
      this.releaseRemovedSlots();
      var _loc6_ = this.rearrangeGroupButtons();
      var _loc3_ = 0;
      var _loc2_ = 0;
      if(this.isVerticalAlignment())
      {
         _loc2_ = _loc6_;
      }
      else
      {
         _loc3_ = _loc6_;
      }
      var _loc4_ = false;
      var _loc5_ = this.buffDataManager.getBuffDatas();
      if(_loc5_ != null && _loc5_.length > 0)
      {
         this.rearrangeBuffSlots(_loc5_,_loc3_,_loc2_);
         _loc4_ = true;
      }
      _loc3_ = 0;
      _loc2_ = 0;
      if(this.isVerticalAlignment())
      {
         if(_loc4_)
         {
            _loc3_ = g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_WIDTH;
         }
      }
      else if(_loc4_)
      {
         _loc2_ = g4.view.abnormality.AbnormalityConstants.BUFF_SLOT_HEIGHT;
      }
      this.rearrangeBuffSlots(this.buffDataManager.getDebuffDatas(),_loc3_,_loc2_);
      if(this.shownPopUpGroupID != -1)
      {
         this.showBuffGroupPopUp(this.shownPopUpGroupID);
      }
   }
   function rearrangeBuffSlots(array, startX, startY)
   {
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc2_ = undefined;
      var _loc5_ = array != null?array.length:0;
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc4_ = (g4.view.abnormality.BuffData)array[_loc2_];
         _loc3_ = this.getOrCreateBuffSlot(_loc4_.id);
         _loc3_.setData(_loc4_);
         _loc3_.__get__targetMovieClip()._x = startX + this.alignmentBuffSlotStartX + (this.alignmentBuffSlotWidth + this.alignmentBuffSlotGapX) * _loc2_;
         _loc3_.__get__targetMovieClip()._y = startY + this.alignmentBuffSlotStartY + (this.alignmentBuffSlotHeight + this.alignmentBuffSlotGapY) * _loc2_;
         _loc3_.__get__targetMovieClip()._visible = true;
         _loc2_ = _loc2_ + 1;
      }
   }
   function hideAllSlots()
   {
      var _loc2_ = undefined;
      var _loc3_ = this.usedBuffSlotArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (g4.view.abnormality.BuffSlot)this.usedBuffSlotArray[_loc2_].__get__targetMovieClip()._visible = false;
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
   function model_abnormalityDataChangeHandler(event)
   {
      this.rearrange();
   }
}
