class g4.view.partyRaid.PartyRaid extends g4.core.View
{
   var draggingGroupID = -1;
   var snapType = g4.view.partyRaid.PartyRaidConstants.GROUP_SNAP_TYPE_NONE;
   var autoPositionMode = true;
   function PartyRaid(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.PARTY_WINDOW_RAID_INFO;
   }
   function configUI()
   {
      this.checkDoneGroupIDMap = {};
      this.partyRaidGroupArray = [];
      this.partyRaidGroupMap = {};
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = g4.view.partyRaid.PartyRaidConstants.GROUP_COUNT;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = (g4.view.partyRaid.PartyRaidGroup)this.__get__targetMovieClip()["mc_party_raid_" + _loc2_];
         _loc3_.init(_loc2_);
         this.partyRaidGroupArray.push(_loc3_);
         this.partyRaidGroupMap[_loc2_] = _loc3_;
         _loc2_ = _loc2_ + 1;
      }
      this.updateMenuButtonVisible();
      g4.util.UIUtil.callLater(this,"updateByOption");
      g4.util.UIUtil.callLater(this,"ToGame_PartyWindowRaidInfo_Init");
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_SetUIPosition",gfx.utils.Delegate.create(this,this.OnGame_SetUIPosition));
      this.registerGameInterface("OnGame_ResetUIPosition",gfx.utils.Delegate.create(this,this.OnGame_ResetUIPosition));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberVisibleSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberVisibleSet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberMasterSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberMasterSet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberSet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberRemove",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberRemove));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberClassSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberClassSet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberIDSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberIDSet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberOffSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberOffSet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberHpSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberHpSet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberMpSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberMpSet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberDieSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberDieSet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberReadySet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberReadySet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionData",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionData));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionEnd",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionEnd));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberDangerStateSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberDangerStateSet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberDebuffStateSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberDebuffStateSet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberBuffSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberBuffSet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberRemoveBuffSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberRemoveBuffSet));
      this.registerGameInterface("OnGame_PartyWindowRaidInfo_PartyRaidMemberAllRemoveBuffSet",gfx.utils.Delegate.create(this,this.OnGame_PartyWindowRaidInfo_PartyRaidMemberAllRemoveBuffSet));
      g4.model.GameModel.addEventListener(g4.view.ViewID.PARTY_WINDOW_RAID_INFO,g4.model.GameModelEventType.MAIN_STAGE_SIZE_CHANGE,this,"model_mainStageSizeChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.PARTY_WINDOW_RAID_INFO,g4.model.GameModelEventType.PARTY_RAID_RESET_POSITION,this,"model_partyRaidResetPositionHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.PARTY_WINDOW_RAID_INFO,g4.model.GameModelEventType.PARTY_RAID_ABNORMALITY_DATA_CHANGED,this,"model_partyRaidAbnormalityDataChangeHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.PARTY_WINDOW_RAID_INFO,g4.model.GameModelEventType.PARTY_RAID_START_DRAG,this,"model_partyRaidStartDragHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.PARTY_WINDOW_RAID_INFO,g4.model.GameModelEventType.PARTY_RAID_STOP_DRAG,this,"model_partyRaidStopDragHandler");
   }
   function ToGame_PartyWindowRaidInfo_Init()
   {
      g4.model.GameModel.partyModel.ToGame_PartyWindowRaidInfo_Init();
   }
   function isDetailMode()
   {
      return g4.model.GameModel.partyModel.partyRaidAbnormalityData.type == g4.model.GameConstants.PARTY_RAID_ABNORMALITY_VIEW_TYPE_DETAIL;
   }
   function updateByOption()
   {
      var _loc4_ = this.isDetailMode();
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc5_ = this.partyRaidGroupArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc3_ = (g4.view.partyRaid.PartyRaidGroup)this.partyRaidGroupArray[_loc2_];
         _loc3_.setDetailMode(_loc4_);
         _loc2_ = _loc2_ + 1;
      }
      this.updateGroupPosition();
   }
   function updateMenuButtonVisible()
   {
      var _loc4_ = true;
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc5_ = this.partyRaidGroupArray.length;
      _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = (g4.view.partyRaid.PartyRaidGroup)this.partyRaidGroupArray[_loc3_];
         if(_loc2_.__get__visible() && _loc4_)
         {
            _loc4_ = false;
            _loc2_.setMenuButtonVisible(true);
         }
         else
         {
            _loc2_.setMenuButtonVisible(false);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function resetUIPosition()
   {
      this.autoPositionMode = true;
      this.updateGroupPosition();
   }
   function updateGroupPosition()
   {
      if(this.autoPositionMode)
      {
         this.rearrangeGroupPosition();
      }
      else
      {
         this.adjustGroupPosition();
      }
   }
   function adjustGroupPosition()
   {
      var _loc14_ = this.getVisibleGroups();
      if(_loc14_ == null || _loc14_.length == 0)
      {
         return undefined;
      }
      var _loc10_ = [];
      var _loc8_ = undefined;
      var _loc7_ = undefined;
      var _loc11_ = _loc14_.length;
      _loc7_ = 0;
      while(_loc7_ < _loc11_)
      {
         _loc8_ = (g4.view.partyRaid.PartyRaidGroup)_loc14_[_loc7_];
         if(_loc8_.combinedGroupIDLeft == -1 && _loc8_.combinedGroupIDTop == -1)
         {
            _loc10_.push(_loc8_.getID());
         }
         _loc7_ = _loc7_ + 1;
      }
      if(_loc10_.length == 0)
      {
         return undefined;
      }
      var _loc13_ = g4.view.partyRaid.PartyRaidConstants.GROUP_WIDTH;
      var _loc12_ = !this.isDetailMode()?g4.view.partyRaid.PartyRaidConstants.GROUP_SIMPLE_HEIGHT:g4.view.partyRaid.PartyRaidConstants.GROUP_DETAIL_HEIGHT;
      var _loc3_ = {};
      var _loc6_ = undefined;
      var _loc5_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      _loc11_ = _loc10_.length;
      _loc7_ = 0;
      while(_loc7_ < _loc11_)
      {
         var _loc9_ = Number(_loc10_[_loc7_]);
         _loc3_[_loc9_] = true;
         _loc6_ = [_loc9_];
         while(_loc6_.length > 0)
         {
            _loc5_ = Number(_loc6_.pop());
            _loc2_ = this.getGroupByID(_loc5_);
            if(_loc2_ != null)
            {
               if(!_loc3_[_loc5_] && _loc2_.combinedGroupIDLeft != -1 && _loc3_[_loc2_.combinedGroupIDLeft])
               {
                  _loc4_ = this.getGroupByID(_loc2_.combinedGroupIDLeft);
                  if(_loc4_ != null)
                  {
                     _loc2_._x = _loc4_._x + _loc13_;
                     _loc2_._y = _loc4_._y;
                     _loc3_[_loc5_] = true;
                  }
               }
               if(!_loc3_[_loc5_] && _loc2_.combinedGroupIDTop != -1 && _loc3_[_loc2_.combinedGroupIDTop])
               {
                  _loc4_ = this.getGroupByID(_loc2_.combinedGroupIDTop);
                  if(_loc4_ != null)
                  {
                     _loc2_._x = _loc4_._x;
                     _loc2_._y = _loc4_._y + _loc12_;
                     _loc3_[_loc5_] = true;
                  }
               }
               if(_loc2_.combinedGroupIDRight != -1 && !_loc3_[_loc2_.combinedGroupIDRight])
               {
                  _loc6_.push(_loc2_.combinedGroupIDRight);
               }
               if(_loc2_.combinedGroupIDBottom != -1 && !_loc3_[_loc2_.combinedGroupIDBottom])
               {
                  _loc6_.push(_loc2_.combinedGroupIDBottom);
               }
            }
         }
         _loc7_ = _loc7_ + 1;
      }
   }
   function rearrangeGroupPosition()
   {
      var _loc6_ = this.getVisibleGroups();
      if(_loc6_ == null || _loc6_.length == 0)
      {
         return undefined;
      }
      var _loc16_ = lib.info.AlignInfo.xPixelToRatio(lib.info.AlignInfo.zeroPointX + g4.view.partyRaid.PartyRaidConstants.GROUP_START_X);
      var _loc15_ = lib.info.AlignInfo.yPixelToRatio(lib.info.AlignInfo.zeroPointY + g4.view.partyRaid.PartyRaidConstants.GROUP_START_Y);
      var _loc11_ = lib.info.AlignInfo.zeroPointX + _loc16_ * lib.info.AlignInfo.onePercentPixelW;
      var _loc10_ = lib.info.AlignInfo.zeroPointY + _loc15_ * lib.info.AlignInfo.onePercentPixelH;
      var _loc14_ = g4.view.partyRaid.PartyRaidConstants.GROUP_WIDTH;
      var _loc12_ = !this.isDetailMode()?g4.view.partyRaid.PartyRaidConstants.GROUP_SIMPLE_HEIGHT:g4.view.partyRaid.PartyRaidConstants.GROUP_DETAIL_HEIGHT;
      var _loc7_ = _loc6_.length;
      var _loc3_ = this.getColumnCount(_loc7_);
      var _loc2_ = undefined;
      var _loc9_ = 0;
      var _loc17_ = undefined;
      var _loc4_ = undefined;
      var _loc5_ = undefined;
      var _loc8_ = undefined;
      var _loc13_ = _loc7_;
      _loc8_ = 0;
      while(_loc8_ < _loc13_)
      {
         _loc2_ = (g4.view.partyRaid.PartyRaidGroup)_loc6_[_loc8_];
         _loc4_ = _loc9_ % _loc3_;
         _loc5_ = Math.floor(_loc9_ / _loc3_);
         _loc2_._x = _loc11_ + _loc14_ * _loc4_;
         _loc2_._y = _loc10_ + _loc12_ * _loc5_;
         _loc2_.combinedGroupIDLeft = this.getGroupIDByRelativeIndex(_loc4_ - 1,_loc5_,_loc3_,_loc7_,_loc6_);
         _loc2_.combinedGroupIDTop = this.getGroupIDByRelativeIndex(_loc4_,_loc5_ - 1,_loc3_,_loc7_,_loc6_);
         _loc2_.combinedGroupIDRight = this.getGroupIDByRelativeIndex(_loc4_ + 1,_loc5_,_loc3_,_loc7_,_loc6_);
         _loc2_.combinedGroupIDBottom = this.getGroupIDByRelativeIndex(_loc4_,_loc5_ + 1,_loc3_,_loc7_,_loc6_);
         _loc9_ = _loc9_ + 1;
         _loc8_ = _loc8_ + 1;
      }
   }
   function getGroupIDByRelativeIndex(columnIndex, rowIndex, columnCount, totalCount, visibleGroupArray)
   {
      if(rowIndex < 0 || columnIndex < 0 || columnIndex > columnCount - 1)
      {
         return -1;
      }
      var _loc1_ = rowIndex * columnCount + columnIndex;
      if(_loc1_ < 0 || _loc1_ > totalCount - 1)
      {
         return -1;
      }
      return (g4.view.partyRaid.PartyRaidGroup)visibleGroupArray[_loc1_].getID();
   }
   function getVisibleGroups()
   {
      var _loc4_ = [];
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc5_ = this.partyRaidGroupArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc3_ = (g4.view.partyRaid.PartyRaidGroup)this.partyRaidGroupArray[_loc2_];
         if(_loc3_.__get__visible())
         {
            _loc4_.push(_loc3_);
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc4_.length != 0?_loc4_:null;
   }
   function getVisibleGroupsCount()
   {
      var _loc3_ = 0;
      var _loc2_ = undefined;
      var _loc4_ = this.partyRaidGroupArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         if((g4.view.partyRaid.PartyRaidGroup)this.partyRaidGroupArray[_loc2_].__get__visible())
         {
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function getColumnCount(totalGroupCount)
   {
      return totalGroupCount != 4?3:2;
   }
   function getGroupByID(groupID)
   {
      return this.partyRaidGroupMap[groupID];
   }
   function setGroupVisible(groupID, visible)
   {
      var _loc3_ = this.getGroupByID(groupID);
      if(_loc3_ == null)
      {
         return undefined;
      }
      _loc3_.setVisible(visible);
      if(!visible && !this.autoPositionMode)
      {
         var _loc2_ = undefined;
         _loc2_ = this.getGroupByID(_loc3_.combinedGroupIDLeft);
         if(_loc2_ != null)
         {
            _loc2_.combinedGroupIDRight = -1;
         }
         _loc2_ = this.getGroupByID(_loc3_.combinedGroupIDTop);
         if(_loc2_ != null)
         {
            _loc2_.combinedGroupIDBottom = -1;
         }
         _loc2_ = this.getGroupByID(_loc3_.combinedGroupIDRight);
         if(_loc2_ != null)
         {
            _loc2_.combinedGroupIDLeft = -1;
         }
         _loc2_ = this.getGroupByID(_loc3_.combinedGroupIDBottom);
         if(_loc2_ != null)
         {
            _loc2_.combinedGroupIDTop = -1;
         }
         _loc3_.combinedGroupIDLeft = -1;
         _loc3_.combinedGroupIDTop = -1;
         _loc3_.combinedGroupIDRight = -1;
         _loc3_.combinedGroupIDBottom = -1;
      }
      this.updateGroupPosition();
      this.updateMenuButtonVisible();
   }
   function setMaster(groupID, memberID, isMaster)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setMaster(memberID,isMaster);
   }
   function setMemberVisible(groupID, memberID, visible)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setMemberVisible(memberID,visible);
   }
   function setClazz(groupID, memberID, classType)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setClazz(memberID,classType);
   }
   function setName(groupID, memberID, userName, isMe)
   {
      var _loc3_ = this.getGroupByID(groupID);
      if(_loc3_ == null)
      {
         return undefined;
      }
      _loc3_.setName(memberID,userName,isMe);
      if(isMe)
      {
         var _loc2_ = undefined;
         var _loc4_ = g4.view.partyRaid.PartyRaidConstants.GROUP_COUNT;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc3_ = this.getGroupByID(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.setMyTeam(_loc2_ == groupID);
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function setConnected(groupID, memberID, connected)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setConnected(memberID,connected);
   }
   function setHP(groupID, memberID, currentHP, maxHP)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setHP(memberID,currentHP,maxHP);
   }
   function setMP(groupID, memberID, currentMP, maxMP)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setMP(memberID,currentMP,maxMP);
   }
   function setDead(groupID, memberID, isDead)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setDead(memberID,isDead);
   }
   function setReady(groupID, memberID, type)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setReady(memberID,type);
   }
   function diceStart(groupID, memberID)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.diceStart(memberID);
   }
   function diceSetValue(groupID, memberID, value, isMax)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.diceSetValue(memberID,value,isMax);
   }
   function diceEnd(groupID, memberID)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.diceEnd(memberID);
   }
   function setDangerous(groupID, memberID, isDangerous)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setDangerous(memberID,isDangerous);
   }
   function setDebuffState(groupID, memberID, isDebuff)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setDebuffState(memberID,isDebuff);
   }
   function buffAdd(groupID, memberID, id, stackCnt, type, bRelaxMerit, img, remain, total)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.buffAdd(memberID,id,stackCnt,type,bRelaxMerit,img,remain,total);
   }
   function buffRemove(groupID, memberID, id)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.buffRemove(memberID,id);
   }
   function buffRemoveAll(groupID, memberID, type)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.buffRemoveAll(memberID,type);
   }
   function setTimePause(groupID, memberID, id, bPause)
   {
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setTimePause(memberID,id,bPause);
   }
   function startGroupDragTracking()
   {
      this.draggingGroupID = g4.view.partyRaid.PartyRaidGlobals.draggingGroupID;
      this.draggingGroup = this.getGroupByID(this.draggingGroupID);
      if(this.draggingGroup == null)
      {
         return undefined;
      }
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      _loc2_ = this.draggingGroup;
      while(true)
      {
         if(_loc2_ == null)
         {
            break;
         }
         _loc4_ = _loc2_.combinedGroupIDTop;
         _loc3_ = _loc2_.combinedGroupIDRight;
         _loc2_.combinedGroupIDTop = -1;
         _loc2_ = this.getGroupByID(_loc4_);
         if(_loc2_ != null)
         {
            _loc2_.combinedGroupIDBottom = -1;
         }
         _loc2_ = this.getGroupByID(_loc3_);
      }
      _loc2_ = this.draggingGroup;
      while(true)
      {
         if(_loc2_ == null)
         {
            break;
         }
         _loc4_ = _loc2_.combinedGroupIDLeft;
         _loc3_ = _loc2_.combinedGroupIDBottom;
         _loc2_.combinedGroupIDLeft = -1;
         _loc2_ = this.getGroupByID(_loc4_);
         if(_loc2_ != null)
         {
            _loc2_.combinedGroupIDRight = -1;
         }
         _loc2_ = this.getGroupByID(_loc3_);
      }
      this.groupDragTracking();
      Mouse.addListener(this);
   }
   function stopGroupDragTracking()
   {
      Mouse.removeListener(this);
      this.groupDragTracking();
      this.combineSnappingGroup();
      this.setSnappingGroup(null);
      this.draggingGroupID = -1;
      this.draggingGroup = null;
   }
   function combineSnappingGroup()
   {
      if(this.draggingGroup == null || this.snappingGroup == null || this.snapType == g4.view.partyRaid.PartyRaidConstants.GROUP_SNAP_TYPE_NONE)
      {
         return undefined;
      }
      var _loc3_ = g4.view.partyRaid.PartyRaidConstants.GROUP_WIDTH;
      var _loc2_ = !this.isDetailMode()?g4.view.partyRaid.PartyRaidConstants.GROUP_SIMPLE_HEIGHT:g4.view.partyRaid.PartyRaidConstants.GROUP_DETAIL_HEIGHT;
      if(this.snapType == g4.view.partyRaid.PartyRaidConstants.GROUP_SNAP_TYPE_RIGHT)
      {
         this.draggingGroup._x = this.snappingGroup._x + _loc3_;
         this.draggingGroup._y = this.snappingGroup._y;
         this.adjustCombinedGroupsPosition();
         this.checkTopBottomCombineMoveRight(this.getTopRightGroup(this.snappingGroup),this.draggingGroup);
         this.checkTopBottomCombineMoveRight(this.draggingGroup,this.getBottomRightGroup(this.snappingGroup));
         this.checkLeftRightCombineMoveDown(this.snappingGroup,this.draggingGroup);
         this.checkLeftRightCombineMoveDown(this.draggingGroup,this.getRightBottomGroup(this.getGroupByID(this.draggingGroup.combinedGroupIDTop)));
      }
      else
      {
         this.draggingGroup._x = this.snappingGroup._x;
         this.draggingGroup._y = this.snappingGroup._y + _loc2_;
         this.adjustCombinedGroupsPosition();
         this.checkLeftRightCombineMoveDown(this.getLeftBottomGroup(this.snappingGroup),this.draggingGroup);
         this.checkLeftRightCombineMoveDown(this.draggingGroup,this.getRightBottomGroup(this.snappingGroup));
         this.checkTopBottomCombineMoveRight(this.snappingGroup,this.draggingGroup);
         this.checkTopBottomCombineMoveRight(this.draggingGroup,this.getBottomRightGroup(this.getGroupByID(this.draggingGroup.combinedGroupIDLeft)));
      }
   }
   function getTopRightGroup(group)
   {
      if(group == null)
      {
         return null;
      }
      group = this.getGroupByID(group.combinedGroupIDTop);
      if(group == null)
      {
         return null;
      }
      return this.getGroupByID(group.combinedGroupIDRight);
   }
   function getBottomRightGroup(group)
   {
      if(group == null)
      {
         return null;
      }
      group = this.getGroupByID(group.combinedGroupIDBottom);
      if(group == null)
      {
         return null;
      }
      return this.getGroupByID(group.combinedGroupIDRight);
   }
   function getLeftBottomGroup(group)
   {
      if(group == null)
      {
         return null;
      }
      group = this.getGroupByID(group.combinedGroupIDLeft);
      if(group == null)
      {
         return null;
      }
      return this.getGroupByID(group.combinedGroupIDBottom);
   }
   function getRightBottomGroup(group)
   {
      if(group == null)
      {
         return null;
      }
      group = this.getGroupByID(group.combinedGroupIDRight);
      if(group == null)
      {
         return null;
      }
      return this.getGroupByID(group.combinedGroupIDBottom);
   }
   function checkTopBottomCombineMoveRight(topGroup, bottomGroup)
   {
      while(true)
      {
         if(topGroup == null || bottomGroup == null)
         {
            break;
         }
         if(topGroup.combinedGroupIDBottom != -1 || bottomGroup.combinedGroupIDTop != -1)
         {
            break;
         }
         topGroup.combinedGroupIDBottom = bottomGroup.getID();
         bottomGroup.combinedGroupIDTop = topGroup.getID();
         topGroup = this.getGroupByID(topGroup.combinedGroupIDRight);
         bottomGroup = this.getGroupByID(bottomGroup.combinedGroupIDRight);
      }
   }
   function checkLeftRightCombineMoveDown(leftGroup, rightGroup)
   {
      while(true)
      {
         if(leftGroup == null || rightGroup == null)
         {
            break;
         }
         if(leftGroup.combinedGroupIDRight != -1 || rightGroup.combinedGroupIDLeft != -1)
         {
            break;
         }
         leftGroup.combinedGroupIDRight = rightGroup.getID();
         rightGroup.combinedGroupIDLeft = leftGroup.getID();
         leftGroup = this.getGroupByID(leftGroup.combinedGroupIDBottom);
         rightGroup = this.getGroupByID(rightGroup.combinedGroupIDBottom);
      }
   }
   function groupDragTracking()
   {
      this.adjustCombinedGroupsPosition();
      this.checkSnappingGroup();
   }
   function adjustCombinedGroupsPosition()
   {
      var _loc2_ = undefined;
      var _loc3_ = g4.view.partyRaid.PartyRaidConstants.GROUP_COUNT;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this.checkDoneGroupIDMap[_loc2_] = false;
         _loc2_ = _loc2_ + 1;
      }
      this.checkGroupIDArray = [this.draggingGroupID];
      while(this.checkGroupIDArray.length > 0)
      {
         this.adjustNextCombinedGroupPosition();
      }
   }
   function adjustNextCombinedGroupPosition()
   {
      var _loc3_ = Number(this.checkGroupIDArray.pop());
      if(this.checkDoneGroupIDMap[_loc3_])
      {
         return undefined;
      }
      this.checkDoneGroupIDMap[_loc3_] = true;
      var _loc2_ = this.getGroupByID(_loc3_);
      if(_loc2_ == null)
      {
         return undefined;
      }
      var _loc5_ = g4.view.partyRaid.PartyRaidConstants.GROUP_WIDTH;
      var _loc4_ = !this.isDetailMode()?g4.view.partyRaid.PartyRaidConstants.GROUP_SIMPLE_HEIGHT:g4.view.partyRaid.PartyRaidConstants.GROUP_DETAIL_HEIGHT;
      this._adjustCombinedGroupPosition(_loc2_.combinedGroupIDLeft,_loc2_._x,_loc2_._y,- _loc5_,0);
      this._adjustCombinedGroupPosition(_loc2_.combinedGroupIDTop,_loc2_._x,_loc2_._y,0,- _loc4_);
      this._adjustCombinedGroupPosition(_loc2_.combinedGroupIDRight,_loc2_._x,_loc2_._y,_loc5_,0);
      this._adjustCombinedGroupPosition(_loc2_.combinedGroupIDBottom,_loc2_._x,_loc2_._y,0,_loc4_);
   }
   function _adjustCombinedGroupPosition(groupID, x, y, offsetX, offsetY)
   {
      if(groupID == -1)
      {
         return undefined;
      }
      if(this.checkDoneGroupIDMap[groupID])
      {
         return undefined;
      }
      var _loc2_ = this.getGroupByID(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_._x = x + offsetX;
      _loc2_._y = y + offsetY;
      this.checkGroupIDArray.push(groupID);
   }
   function checkSnappingGroup()
   {
      var _loc13_ = this.getVisibleGroups();
      if(_loc13_ == null || _loc13_.length < 2)
      {
         return undefined;
      }
      var _loc6_ = 20;
      var _loc12_ = 30;
      var _loc10_ = 50;
      var _loc4_ = g4.view.partyRaid.PartyRaidConstants.GROUP_WIDTH;
      var _loc3_ = !this.isDetailMode()?g4.view.partyRaid.PartyRaidConstants.GROUP_SIMPLE_HEIGHT:g4.view.partyRaid.PartyRaidConstants.GROUP_DETAIL_HEIGHT;
      var _loc2_ = undefined;
      var _loc11_ = undefined;
      var _loc9_ = g4.view.partyRaid.PartyRaidConstants.GROUP_SNAP_TYPE_NONE;
      var _loc7_ = 1.7976931348623157e308;
      var _loc5_ = undefined;
      var _loc8_ = undefined;
      var _loc14_ = _loc13_.length;
      _loc8_ = 0;
      while(_loc8_ < _loc14_)
      {
         _loc2_ = (g4.view.partyRaid.PartyRaidGroup)_loc13_[_loc8_];
         if(_loc2_ != this.draggingGroup)
         {
            if(_loc2_.combinedGroupIDRight == -1 && this.draggingGroup._x >= _loc2_._x + _loc4_ - _loc6_ && this.draggingGroup._x < _loc2_._x + _loc4_ + _loc6_ && this.draggingGroup._y + _loc3_ / 2 >= _loc2_._y + _loc10_ && this.draggingGroup._y + _loc3_ / 2 < _loc2_._y + _loc3_ - _loc10_)
            {
               _loc5_ = Math.abs(_loc2_._x + _loc4_ - this.draggingGroup._x);
               if(_loc5_ < _loc7_)
               {
                  _loc7_ = _loc5_;
                  _loc11_ = _loc2_;
                  _loc9_ = g4.view.partyRaid.PartyRaidConstants.GROUP_SNAP_TYPE_RIGHT;
               }
            }
            if(_loc2_.combinedGroupIDBottom == -1 && this.draggingGroup._x + _loc4_ / 2 >= _loc2_._x + _loc12_ & this.draggingGroup._x + _loc4_ / 2 < _loc2_._x + _loc4_ - _loc12_ && this.draggingGroup._y >= _loc2_._y + _loc3_ - _loc6_ && this.draggingGroup._y < _loc2_._y + _loc3_ + _loc6_)
            {
               _loc5_ = Math.abs(_loc2_._y + _loc3_ - this.draggingGroup._y);
               if(_loc5_ < _loc7_)
               {
                  _loc7_ = _loc5_;
                  _loc11_ = _loc2_;
                  _loc9_ = g4.view.partyRaid.PartyRaidConstants.GROUP_SNAP_TYPE_BOTTOM;
               }
            }
         }
         _loc8_ = _loc8_ + 1;
      }
      this.setSnappingGroup(_loc11_,_loc9_);
   }
   function setSnappingGroup(group, snapType)
   {
      if(group == this.snappingGroup)
      {
         if(this.snappingGroup == null)
         {
            this.snapType = g4.view.partyRaid.PartyRaidConstants.GROUP_SNAP_TYPE_NONE;
         }
         else
         {
            this.snappingGroup.setSnapType(snapType);
            this.snapType = snapType;
         }
      }
      else
      {
         if(this.snappingGroup != null)
         {
            this.snappingGroup.setSnapType(g4.view.partyRaid.PartyRaidConstants.GROUP_SNAP_TYPE_NONE);
            this.snappingGroup = null;
            this.snapType = g4.view.partyRaid.PartyRaidConstants.GROUP_SNAP_TYPE_NONE;
         }
         if(group != null)
         {
            this.snappingGroup = group;
            this.snappingGroup.setSnapType(snapType);
            this.snapType = snapType;
         }
      }
   }
   function OnGame_SetUIPosition(bLocked, UIName, posXRatio, posYRatio, notRatio)
   {
      var _loc3_ = undefined;
      var _loc10_ = g4.view.partyRaid.PartyRaidConstants.GROUP_COUNT;
      _loc3_ = 0;
      while(_loc3_ < _loc10_)
      {
         if("mc_party_raid_" + _loc3_ == UIName)
         {
            var _loc2_ = this.getGroupByID(_loc3_);
            if(_loc2_ != null && _loc2_.__get__visible())
            {
               bLocked = g4.util.Converter.toBoolean(bLocked);
               posXRatio = Number(posXRatio);
               posYRatio = Number(posYRatio);
               if(bLocked)
               {
                  if(!(posXRatio == 0 && posYRatio == 0))
                  {
                     var _loc4_ = this.__get__targetMovieClip()._xscale * 0.01;
                     _loc2_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * posXRatio * _loc4_;
                     var _loc9_ = com.bluehole.tera.managers.LayoutManager.getOriginCoord(_loc2_);
                     var _loc8_ = 1 / lib.info.AlignInfo.onePercentPixelH / _loc4_;
                     _loc2_._y = posYRatio / _loc8_ + _loc9_.y;
                  }
               }
            }
            return undefined;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function OnGame_ResetUIPosition()
   {
      this.resetUIPosition();
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberVisibleSet(groupID, visible)
   {
      groupID = Number(groupID);
      visible = g4.util.Converter.toBoolean(visible);
      this.setGroupVisible(groupID,visible);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberMasterSet(groupID, memberID, isMaster)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      isMaster = g4.util.Converter.toBoolean(isMaster);
      this.setMaster(groupID,memberID,isMaster);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberSet(groupID, memberID)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      this.setMemberVisible(groupID,memberID,true);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberRemove(groupID, memberID)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      this.setMemberVisible(groupID,memberID,false);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberClassSet(groupID, memberID, classType)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      classType = Number(classType);
      this.setClazz(groupID,memberID,classType);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberIDSet(groupID, memberID, userName, isMe)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      isMe = g4.util.Converter.toBoolean(isMe);
      this.setName(groupID,memberID,userName,isMe);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberOffSet(groupID, memberID, connected)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      connected = g4.util.Converter.toBoolean(connected);
      this.setConnected(groupID,memberID,connected);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberHpSet(groupID, memberID, currentHP, maxHP)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      currentHP = Number(currentHP);
      maxHP = Number(maxHP);
      this.setHP(groupID,memberID,currentHP,maxHP);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberMpSet(groupID, memberID, currentMP, maxMP)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      currentMP = Number(currentMP);
      maxMP = Number(maxMP);
      this.setMP(groupID,memberID,currentMP,maxMP);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberDieSet(groupID, memberID, isDead)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      isDead = g4.util.Converter.toBoolean(isDead);
      this.setDead(groupID,memberID,isDead);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberReadySet(groupID, memberID, type)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      type = Number(type);
      this.setReady(groupID,memberID,type);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart(groupID, memberID)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      this.diceStart(groupID,memberID);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionData(groupID, memberID, value, isMax)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      value = Number(value);
      isMax = g4.util.Converter.toBoolean(isMax);
      this.diceSetValue(groupID,memberID,value,isMax);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionEnd(groupID, memberID)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      this.diceEnd(groupID,memberID);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberDangerStateSet(groupID, memberID, isDangerous)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      isDangerous = g4.util.Converter.toBoolean(isDangerous);
      this.setDangerous(groupID,memberID,isDangerous);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberDebuffStateSet(groupID, memberID, isDebuff)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      isDebuff = g4.util.Converter.toBoolean(isDebuff);
      this.setDebuffState(groupID,memberID,isDebuff);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberBuffSet(groupID, memberID, id, stackCnt, type, bRelaxMerit, img, remain, total)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      id = Number(id);
      stackCnt = Number(stackCnt);
      type = Number(type);
      bRelaxMerit = g4.util.Converter.toBoolean(bRelaxMerit);
      remain = Number(remain);
      total = Number(total);
      this.buffAdd(groupID,memberID,id,stackCnt,type,bRelaxMerit,img,remain,total);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberRemoveBuffSet(groupID, memberID, id)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      id = Number(id);
      this.buffRemove(groupID,memberID,id);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberAllRemoveBuffSet(groupID, memberID, type)
   {
      groupID = Number(groupID);
      memberID = Number(memberID);
      type = Number(type);
      this.buffRemoveAll(groupID,memberID,type);
   }
   function onMouseMove()
   {
      this.groupDragTracking();
   }
   function model_mainStageSizeChangeHandler(event)
   {
      this.resetUIPosition();
   }
   function model_partyRaidResetPositionHandler(event)
   {
      this.resetUIPosition();
   }
   function model_partyRaidAbnormalityDataChangeHandler(event)
   {
      this.updateByOption();
   }
   function model_partyRaidStartDragHandler(event)
   {
      this.autoPositionMode = false;
      this.startGroupDragTracking();
   }
   function model_partyRaidStopDragHandler(event)
   {
      this.stopGroupDragTracking();
   }
}
