class g4.view.partyRaid.PartyRaidGroup extends gfx.core.UIComponent
{
   var id = -1;
   var combinedGroupIDLeft = -1;
   var combinedGroupIDTop = -1;
   var combinedGroupIDRight = -1;
   var combinedGroupIDBottom = -1;
   var firstTime = true;
   var menuButtonVisible = false;
   function PartyRaidGroup()
   {
      super();
   }
   function configUI()
   {
      super.configUI();
      var _loc6_ = this.getNextHighestDepth() + g4.view.partyRaid.PartyRaidConstants.MEMBER_COUNT_IN_GROUP - 1;
      this.partyRaidGroupMemberArray = [];
      this.partyRaidGroupMemberMap = {};
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc5_ = g4.view.partyRaid.PartyRaidConstants.MEMBER_COUNT_IN_GROUP;
      _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc4_ = (g4.view.partyRaid.PartyRaidGroupMember)this["mc_member_" + _loc3_];
         _loc4_.init(this.id,_loc3_);
         _loc4_.swapDepths(_loc6_ - _loc3_);
         this.partyRaidGroupMemberArray.push(_loc4_);
         this.partyRaidGroupMemberMap[_loc3_] = _loc4_;
         _loc3_ = _loc3_ + 1;
      }
      this.mc_snap_right.swapDepths(this.getNextHighestDepth());
      g4.util.UIUtil.setMouseEnabled(this.mc_snap_right,false);
      this.mc_snap_bottom.swapDepths(this.getNextHighestDepth());
      g4.util.UIUtil.setMouseEnabled(this.mc_snap_bottom,false);
      this.button_menu.addEventListener("click",this,"button_menu_clickHandler");
      this.UIDrager.setData(this._name,this);
      this.UIDrager.adjustDragLimit(0,0,0,-40 * lib.info.AlignInfo.scaleRatio);
      this.UIDrager.onPress2 = gfx.utils.Delegate.create(this,this.UIDrager_onPressHandler);
      this.UIDrager.onRelease2 = gfx.utils.Delegate.create(this,this.UIDrager_onReleaseHandler);
      this.text_title.verticalAlign = "center";
      g4.util.UIUtil.setMouseEnabled(this.text_title,false);
      g4.util.UIUtil.setTextFieldStyle(this.text_title,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.cleanUp();
      this.updateByUIMode();
      g4.model.GameModel.addEventListener(g4.view.ViewID.PARTY_WINDOW_RAID_INFO,g4.model.GameModelEventType.MAIN_UI_MODE_CHANGED,this,"model_mainUIModeChangeHandler");
   }
   function updateByUIMode()
   {
      this.mc_bg._visible = g4.model.GameModel.mainModel.uiMode;
      this.updateButtonVisible();
   }
   function setMenuButtonVisible(visible)
   {
      this.menuButtonVisible = visible;
      this.updateButtonVisible();
   }
   function updateButtonVisible()
   {
      this.button_menu.__set__visible(this.menuButtonVisible && g4.model.GameModel.mainModel.uiMode);
   }
   function setDetailMode(detailMode)
   {
      var _loc5_ = g4.view.partyRaid.PartyRaidConstants.GROUP_ROW_START_Y;
      var _loc4_ = undefined;
      var _loc8_ = undefined;
      if(detailMode)
      {
         _loc4_ = g4.view.partyRaid.PartyRaidConstants.GROUP_DETAIL_ROW_HEIGHT;
         _loc8_ = g4.view.partyRaid.PartyRaidConstants.GROUP_DETAIL_HEIGHT;
      }
      else
      {
         _loc4_ = g4.view.partyRaid.PartyRaidConstants.GROUP_SIMPLE_ROW_HEIGHT;
         _loc8_ = g4.view.partyRaid.PartyRaidConstants.GROUP_SIMPLE_HEIGHT;
      }
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc6_ = g4.view.partyRaid.PartyRaidConstants.MEMBER_COUNT_IN_GROUP;
      _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         _loc3_ = (g4.view.partyRaid.PartyRaidGroupMember)this.partyRaidGroupMemberArray[_loc2_];
         _loc3_.setDetailMode(detailMode);
         _loc3_._y = _loc5_ + _loc4_ * _loc2_;
         _loc2_ = _loc2_ + 1;
      }
      this.mc_bg._height = _loc8_;
      this.mc_snap_right._x = g4.view.partyRaid.PartyRaidConstants.GROUP_WIDTH;
      this.mc_snap_right._height = _loc8_;
      this.mc_snap_bottom._y = _loc8_;
   }
   function setSnapType(snapType)
   {
      switch(snapType)
      {
         case g4.view.partyRaid.PartyRaidConstants.GROUP_SNAP_TYPE_NONE:
            this.mc_snap_right._visible = false;
            this.mc_snap_bottom._visible = false;
            break;
         case g4.view.partyRaid.PartyRaidConstants.GROUP_SNAP_TYPE_RIGHT:
            this.mc_snap_right._visible = true;
            this.mc_snap_bottom._visible = false;
            break;
         case g4.view.partyRaid.PartyRaidConstants.GROUP_SNAP_TYPE_BOTTOM:
            this.mc_snap_right._visible = false;
            this.mc_snap_bottom._visible = true;
      }
   }
   function getMemberByID(memberID)
   {
      return this.partyRaidGroupMemberMap[memberID];
   }
   function init(id)
   {
      this.id = id;
      this.text_title.text = lib.util.UIString.getUIString("$023511") + " " + (id + 1);
   }
   function getID()
   {
      return this.id;
   }
   function cleanUp()
   {
      this._visible = false;
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = g4.view.partyRaid.PartyRaidConstants.MEMBER_COUNT_IN_GROUP;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = (g4.view.partyRaid.PartyRaidGroupMember)this.partyRaidGroupMemberArray[_loc2_];
         _loc3_.setVisible();
         _loc2_ = _loc2_ + 1;
      }
      this.setSnapType(g4.view.partyRaid.PartyRaidConstants.GROUP_SNAP_TYPE_NONE);
   }
   function setVisible(visible)
   {
      if(visible)
      {
         this._visible = true;
         if(this.firstTime)
         {
            this.firstTime = false;
            _root.ToGame_RequestSetUIPosition(this._name);
         }
      }
      else
      {
         this.cleanUp();
      }
   }
   function setMaster(memberID, isMaster)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setMaster(isMaster);
   }
   function setMemberVisible(memberID, visible)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setVisible(visible);
   }
   function setClazz(memberID, classType)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setClazz(classType);
   }
   function setName(memberID, userName, isMe)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setName(userName,isMe);
   }
   function setMyTeam(bMyTeam)
   {
      if(bMyTeam)
      {
         this.text_title.textColor = g4.view.partyRaid.PartyRaidConstants.TEXT_COLOR_MY_GROUP;
      }
      else
      {
         this.text_title.textColor = g4.view.partyRaid.PartyRaidConstants.TEXT_COLOR_OTHER_GROUP;
      }
   }
   function setConnected(memberID, connected)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setConnected(connected);
   }
   function setHP(memberID, currentHP, maxHP)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setHP(currentHP,maxHP);
   }
   function setMP(memberID, currentMP, maxMP)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setMP(currentMP,maxMP);
   }
   function setDead(memberID, isDead)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setDead(isDead);
   }
   function setReady(memberID, type)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setReady(type);
   }
   function diceStart(memberID)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.diceStart();
   }
   function diceSetValue(memberID, value, isMax)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.diceSetValue(value,isMax);
   }
   function diceEnd(memberID)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.diceEnd();
   }
   function setDangerous(memberID, isDangerous)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setDangerous(isDangerous);
   }
   function setDebuffState(memberID, isDebuff)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setDebuffState(isDebuff);
   }
   function buffAdd(memberID, id, stackCnt, type, bRelaxMerit, img, remain, total)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.buffAdd(id,stackCnt,type,bRelaxMerit,img,remain,total);
   }
   function buffRemove(memberID, id)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.buffRemove(id);
   }
   function buffRemoveAll(memberID, type)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.buffRemoveAll(type);
   }
   function setTimePause(memberID, id, bPause)
   {
      var _loc2_ = this.getMemberByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setTimePause(id,bPause);
   }
   function button_menu_clickHandler(event)
   {
      g4.model.GameModel.uiModel.openPartyRaidInteractionMenu();
   }
   function UIDrager_onPressHandler()
   {
      g4.view.partyRaid.PartyRaidGlobals.draggingGroupID = this.id;
      g4.model.GameModel.partyModel.partyRaidStartDrag();
   }
   function UIDrager_onReleaseHandler()
   {
      g4.model.GameModel.partyModel.partyRaidStopDrag();
      g4.view.partyRaid.PartyRaidGlobals.draggingGroupID = -1;
   }
   function model_mainUIModeChangeHandler(event)
   {
      this.updateByUIMode();
   }
}
