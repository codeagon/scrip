class g4.view.party.Party extends g4.core.View
{
   function Party(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.PARTY_WINDOW;
   }
   function configUI()
   {
      this.partyMemberSlotUsingMarkArray = [];
      this.partyMemberSlotArray = [];
      this.partyMemberSlotMap = {};
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = g4.view.party.PartyConstants.PARTY_MEMBER_SLOT_COUNT;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = (g4.view.party.PartyMemberSlot)this.__get__targetMovieClip()["mc_party_window_" + _loc2_];
         _loc3_.init(_loc2_);
         this.setPartyMemberPositionByPercent(_loc3_,this.getInitialPositionPercentX(_loc2_),this.getInitialPositionPercentY(_loc2_));
         this.partyMemberSlotUsingMarkArray.push(false);
         this.partyMemberSlotArray.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      g4.util.UIUtil.callLater(this,"ToGame_PartyWindow_Init");
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_SetUIPosition",gfx.utils.Delegate.create(this,this.OnGame_SetUIPosition));
      this.registerGameInterface("OnGame_ResetUIPosition",gfx.utils.Delegate.create(this,this.OnGame_ResetUIPosition));
      this.registerGameInterface("OnGameEventPartyMemberAdd",gfx.utils.Delegate.create(this,this.OnGameEventPartyMemberAdd));
      this.registerGameInterface("OnGameEventPartyMemberUpdateUserName",gfx.utils.Delegate.create(this,this.OnGameEventPartyMemberUpdateUserName));
      this.registerGameInterface("OnGameEventPartyMemberUpdateUserLevel",gfx.utils.Delegate.create(this,this.OnGameEventPartyMemberUpdateUserLevel));
      this.registerGameInterface("OnGameEventPartyWindowShow",gfx.utils.Delegate.create(this,this.OnGameEventPartyWindowShow));
      this.registerGameInterface("OnGameEventPartyMemberUpdateBattleState",gfx.utils.Delegate.create(this,this.OnGameEventPartyMemberUpdateBattleState));
      this.registerGameInterface("OnGameEventPartyMemberUpdateMP",gfx.utils.Delegate.create(this,this.OnGameEventPartyMemberUpdateMP));
      this.registerGameInterface("OnGameEventPartyMemberUpdateHP",gfx.utils.Delegate.create(this,this.OnGameEventPartyMemberUpdateHP));
      this.registerGameInterface("OnGame_PartyWindow_AchievementRating",gfx.utils.Delegate.create(this,this.OnGame_PartyWindow_AchievementRating));
      this.registerGameInterface("OnGame_PartyWindow_DebuffState",gfx.utils.Delegate.create(this,this.OnGame_PartyWindow_DebuffState));
      this.registerGameInterface("OnGame_PartyWindow_SetClass",gfx.utils.Delegate.create(this,this.OnGame_PartyWindow_SetClass));
      this.registerGameInterface("OnGame_PartyWindow_SetConnection",gfx.utils.Delegate.create(this,this.OnGame_PartyWindow_SetConnection));
      this.registerGameInterface("OnGame_PartyWindow_SetSurvival",gfx.utils.Delegate.create(this,this.OnGame_PartyWindow_SetSurvival));
      this.registerGameInterface("OnGame_PartyWindow_SetSameWorld",gfx.utils.Delegate.create(this,this.OnGame_PartyWindow_SetSameWorld));
      this.registerGameInterface("OnGame_PartyWindow_SetPartyMaster",gfx.utils.Delegate.create(this,this.OnGame_PartyWindow_SetPartyMaster));
      this.registerGameInterface("OnGame_PartyWindow_SetPartyRaidReady",gfx.utils.Delegate.create(this,this.OnGame_PartyWindow_SetPartyRaidReady));
      this.registerGameInterface("OnGame_PartyWindow_SetPartyRaid",gfx.utils.Delegate.create(this,this.OnGame_PartyWindow_SetPartyRaid));
      this.registerGameInterface("OnGame_PartyWindow_SetAwaken",gfx.utils.Delegate.create(this,this.OnGame_PartyWindow_SetAwaken));
      this.registerGameInterface("OnGameEventPartyMember_DiceDistributionStart",gfx.utils.Delegate.create(this,this.OnGameEventPartyMember_DiceDistributionStart));
      this.registerGameInterface("OnGameEventPartyMember_DiceDistributionData",gfx.utils.Delegate.create(this,this.OnGameEventPartyMember_DiceDistributionData));
      this.registerGameInterface("OnGameEventPartyMember_DiceDistributionIcon",gfx.utils.Delegate.create(this,this.OnGameEventPartyMember_DiceDistributionIcon));
      this.registerGameInterface("OnGameEventPartyMember_DiceDistributionEnd",gfx.utils.Delegate.create(this,this.OnGameEventPartyMember_DiceDistributionEnd));
      this.registerGameInterface("OnGame_PartyWindow_AddBuff",gfx.utils.Delegate.create(this,this.OnGame_PartyWindow_AddBuff));
      this.registerGameInterface("OnGame_PartyWindow_RemoveBuff",gfx.utils.Delegate.create(this,this.OnGame_PartyWindow_RemoveBuff));
      this.registerGameInterface("OnGame_PartyWindow_ClearBuff",gfx.utils.Delegate.create(this,this.OnGame_PartyWindow_ClearBuff));
   }
   function ToGame_PartyWindow_Init()
   {
      g4.model.GameModel.partyModel.ToGame_PartyWindow_Init();
   }
   function showUI()
   {
      if(!this.__get__targetMovieClip().bWindowOpen)
      {
         _root.OnGameEvent("OnGameEventShowUI",g4.view.ViewID.PARTY_WINDOW,true);
      }
   }
   function getSlotAt(index)
   {
      if(index < 0 || index >= g4.view.party.PartyConstants.PARTY_MEMBER_SLOT_COUNT)
      {
         return null;
      }
      return this.partyMemberSlotArray[index];
   }
   function getOrCreateMemberSlotByID(memberID)
   {
      var _loc2_ = this.partyMemberSlotMap[memberID];
      if(_loc2_ == null)
      {
         var _loc3_ = g4.util.ArrayUtil.indexOf(this.partyMemberSlotUsingMarkArray,false);
         if(_loc3_ != -1)
         {
            this.partyMemberSlotUsingMarkArray[_loc3_] = true;
            _loc2_ = this.partyMemberSlotArray[_loc3_];
            this.partyMemberSlotMap[memberID] = _loc2_;
         }
      }
      return _loc2_;
   }
   function getMemberSlotByID(memberID)
   {
      return this.partyMemberSlotMap[memberID];
   }
   function addMember(memberID)
   {
      var _loc2_ = this.getOrCreateMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setMemberID(memberID);
   }
   function removeMember(memberID)
   {
      var _loc2_ = this.partyMemberSlotMap[memberID];
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.cleanUp();
      delete this.partyMemberSlotMap.memberID;
      var _loc3_ = g4.util.ArrayUtil.indexOf(this.partyMemberSlotArray,_loc2_);
      if(_loc3_ != -1)
      {
         this.partyMemberSlotUsingMarkArray[_loc3_] = false;
      }
   }
   function setMemberName(memberID, name)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setName(name);
   }
   function setMemberLevel(memberID, level)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setLevel(level);
   }
   function setMemberBattleState(memberID, battleState)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setBattleState(battleState);
   }
   function setMemberHP(memberID, current, max, maxAdd)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setHP(current,max,maxAdd);
   }
   function setMemberMP(memberID, current, max, maxAdd)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setMP(current,max,maxAdd);
   }
   function setMemberAchievementRating(memberID, rating)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setAchievementRating(rating);
   }
   function setMemberDebuffState(memberID, debuffState)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setDebuffState(debuffState);
   }
   function setMemberClazz(memberID, clazz, gageType, position)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setClazz(clazz,gageType,position);
   }
   function setMemberConnection(memberID, connected)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setConnection(connected);
   }
   function setMemberSurvival(memberID, survival)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setSurvival(survival);
   }
   function setMemberSameWorld(memberID, inSameWorld, inRange)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setSameWorld(inSameWorld,inRange);
   }
   function setMemberPartyMasterState(memberID, state)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setPartyMasterState(state);
   }
   function setMemberPartyRaidReady(memberID, state)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setPartyRaidReady(state);
   }
   function setMemberPartyRaid(memberID, isRaidParty)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setPartyRaid(isRaidParty);
   }
   function setMemberAwaken(memberID, awaken)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setAwaken(awaken);
   }
   function setDiceDistributionStart(memberID, type)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setDiceDistributionStart(type);
   }
   function setDiceDistributionData(memberID, value, isHighestValue)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setDiceDistributionData(value,isHighestValue);
   }
   function setDiceDistributionIcon(data)
   {
      if(data == null || data.length == 0)
      {
         return undefined;
      }
      var _loc2_ = data.split("\t");
      if(_loc2_.length != 4)
      {
         return undefined;
      }
      var _loc4_ = Number(_loc2_[0]);
      var _loc3_ = this.getMemberSlotByID(_loc4_);
      if(_loc3_ == null)
      {
         return undefined;
      }
      _loc3_.setDiceDistributionIcon(_loc2_[1],Number(_loc2_[2]),Number(_loc2_[3]));
   }
   function setDiceDistributionEnd(memberID)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setDiceDistributionEnd();
   }
   function addBuff(memberID, id, stackCnt, type, group, bRelaxMerit, img, remain, total, currentTime)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.addBuff(id,stackCnt,type,group,bRelaxMerit,img,remain,total,currentTime);
   }
   function removeBuff(memberID, id)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.removeBuff(id);
   }
   function clearBuff(memberID)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.clearBuff();
   }
   function setTimePause(memberID, id, bPause)
   {
      var _loc2_ = this.getMemberSlotByID(memberID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.setTimePause(id,bPause);
   }
   function setPartyMemberPositionByPercent(slot, percentX, percentY)
   {
      slot._x = lib.info.AlignInfo.zeroPointX + percentX * lib.info.AlignInfo.onePercentPixelW;
      slot._y = lib.info.AlignInfo.zeroPointY + percentY * lib.info.AlignInfo.onePercentPixelH;
   }
   function getInitialPositionPercentX(index)
   {
      if(index < 0 || index > g4.view.party.PartyConstants.PARTY_MEMBER_SLOT_COUNT - 1)
      {
         return 0;
      }
      var _loc1_ = g4.view.party.PartyConstants.MEMBER_SLOT_START_X;
      return lib.info.AlignInfo.xPixelToRatio(lib.info.AlignInfo.zeroPointX + _loc1_);
   }
   function getInitialPositionPercentY(index)
   {
      if(index < 0 || index > g4.view.party.PartyConstants.PARTY_MEMBER_SLOT_COUNT - 1)
      {
         return 0;
      }
      var _loc1_ = g4.view.party.PartyConstants.MEMBER_SLOT_START_Y + (g4.view.party.PartyConstants.MEMBER_SLOT_START_HEIGHT + g4.view.party.PartyConstants.MEMBER_SLOT_START_GAP) * index;
      return lib.info.AlignInfo.yPixelToRatio(lib.info.AlignInfo.zeroPointY + _loc1_);
   }
   function OnGame_SetUIPosition(bLocked, UIName, percentX, percentY, notRatio)
   {
      var _loc2_ = undefined;
      var _loc7_ = g4.view.party.PartyConstants.PARTY_MEMBER_SLOT_COUNT;
      _loc2_ = 0;
      while(_loc2_ < _loc7_)
      {
         if("mc_party_window_" + _loc2_ == UIName)
         {
            var _loc4_ = this.getSlotAt(_loc2_);
            if(_loc4_ != null)
            {
               bLocked = g4.util.Converter.toBoolean(bLocked);
               percentX = Number(percentX);
               percentY = Number(percentY);
               if(!bLocked)
               {
                  percentX = this.getInitialPositionPercentX(_loc2_);
                  percentY = this.getInitialPositionPercentY(_loc2_);
               }
               this.setPartyMemberPositionByPercent(_loc4_,percentX,percentY);
            }
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function OnGame_ResetUIPosition()
   {
      var _loc2_ = undefined;
      var _loc6_ = g4.view.party.PartyConstants.PARTY_MEMBER_SLOT_COUNT;
      _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         var _loc3_ = this.getSlotAt(_loc2_);
         if(_loc3_ != null)
         {
            var _loc5_ = this.getInitialPositionPercentX(_loc2_);
            var _loc4_ = this.getInitialPositionPercentY(_loc2_);
            this.setPartyMemberPositionByPercent(_loc3_,_loc5_,_loc4_);
            lib.info.AlignInfo.savePos(_loc3_,0);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function OnGameEventPartyMemberAdd(memberID, name)
   {
      memberID = Number(memberID);
      this.showUI();
      this.addMember(memberID);
      this.setMemberName(memberID,name);
   }
   function OnGameEventPartyMemberUpdateUserName(memberID, name)
   {
      memberID = Number(memberID);
      this.setMemberName(memberID,name);
   }
   function OnGameEventPartyMemberUpdateUserLevel(memberID, level)
   {
      memberID = Number(memberID);
      level = Number(level);
      this.setMemberLevel(memberID,level);
   }
   function OnGameEventPartyWindowShow(memberID, bShow)
   {
      memberID = Number(memberID);
      bShow = g4.util.Converter.toBoolean(bShow);
      this.showUI();
      if(bShow)
      {
         this.addMember(memberID);
      }
      else
      {
         this.removeMember(memberID);
      }
   }
   function OnGameEventPartyMemberUpdateBattleState(memberID, battleState)
   {
      memberID = Number(memberID);
      battleState = g4.util.Converter.toBoolean(battleState);
      this.setMemberBattleState(memberID,battleState);
   }
   function OnGameEventPartyMemberUpdateHP(memberID, current, max, maxAdd)
   {
      memberID = Number(memberID);
      current = Number(current);
      max = Number(max);
      maxAdd = Number(maxAdd);
      this.setMemberHP(memberID,current,max,maxAdd);
   }
   function OnGameEventPartyMemberUpdateMP(memberID, current, max, maxAdd)
   {
      memberID = Number(memberID);
      current = Number(current);
      max = Number(max);
      maxAdd = Number(maxAdd);
      this.setMemberMP(memberID,current,max,maxAdd);
   }
   function OnGame_PartyWindow_AchievementRating(memberID, rating)
   {
      memberID = Number(memberID);
      rating = Number(rating);
      this.setMemberAchievementRating(memberID,rating);
   }
   function OnGame_PartyWindow_DebuffState(memberID, debuffState)
   {
      memberID = Number(memberID);
      debuffState = g4.util.Converter.toBoolean(debuffState);
      this.setMemberDebuffState(memberID,debuffState);
   }
   function OnGame_PartyWindow_SetClass(memberID, clazz, gageType, position)
   {
      memberID = Number(memberID);
      clazz = Number(clazz);
      gageType = Number(gageType);
      position = Number(position);
      this.setMemberClazz(memberID,clazz,gageType,position);
   }
   function OnGame_PartyWindow_SetConnection(memberID, connected)
   {
      memberID = Number(memberID);
      connected = g4.util.Converter.toBoolean(connected);
      this.setMemberConnection(memberID,connected);
   }
   function OnGame_PartyWindow_SetSurvival(memberID, survival)
   {
      memberID = Number(memberID);
      survival = g4.util.Converter.toBoolean(survival);
      this.setMemberSurvival(memberID,survival);
   }
   function OnGame_PartyWindow_SetSameWorld(memberID, inSameWorld, inRange)
   {
      memberID = Number(memberID);
      inSameWorld = g4.util.Converter.toBoolean(inSameWorld);
      inRange = g4.util.Converter.toBoolean(inRange);
      this.setMemberSameWorld(memberID,inSameWorld,inRange);
   }
   function OnGame_PartyWindow_SetPartyMaster(memberID, state)
   {
      memberID = Number(memberID);
      state = Number(state);
      this.setMemberPartyMasterState(memberID,state);
   }
   function OnGame_PartyWindow_SetPartyRaidReady(memberID, state)
   {
      memberID = Number(memberID);
      state = Number(state);
      this.setMemberPartyRaidReady(memberID,state);
   }
   function OnGame_PartyWindow_SetPartyRaid(memberID, isRaidParty)
   {
      memberID = Number(memberID);
      isRaidParty = g4.util.Converter.toBoolean(isRaidParty);
      this.setMemberPartyRaid(memberID,isRaidParty);
   }
   function OnGame_PartyWindow_SetAwaken(memberID, awaken)
   {
      memberID = Number(memberID);
      awaken = g4.util.Converter.toBoolean(awaken);
      this.setMemberAwaken(memberID,awaken);
   }
   function OnGameEventPartyMember_DiceDistributionStart(memberID, type)
   {
      memberID = Number(memberID);
      type = Number(type);
      this.setDiceDistributionStart(memberID,type);
   }
   function OnGameEventPartyMember_DiceDistributionData(memberID, value, isHighestValue)
   {
      memberID = Number(memberID);
      value = Number(value);
      isHighestValue = g4.util.Converter.toBoolean(isHighestValue);
      this.setDiceDistributionData(memberID,value,isHighestValue);
   }
   function OnGameEventPartyMember_DiceDistributionIcon(data)
   {
      this.setDiceDistributionIcon(data);
   }
   function OnGameEventPartyMember_DiceDistributionEnd(memberID)
   {
      memberID = Number(memberID);
      this.setDiceDistributionEnd(memberID);
   }
   function OnGame_PartyWindow_AddBuff(memberID, id, stackCnt, type, group, bRelaxMerit, img, remain, total, buffName)
   {
      memberID = Number(memberID);
      id = Number(id);
      stackCnt = Number(stackCnt);
      type = Number(type);
      group = Number(group);
      bRelaxMerit = false;
      remain = Math.abs(Number(remain));
      total = Math.abs(Number(total));
      var _loc7_ = getTimer();
      this.addBuff(memberID,id,stackCnt,type,group,bRelaxMerit,img,remain,total,_loc7_);
   }
   function OnGame_PartyWindow_RemoveBuff(memberID, id, group)
   {
      memberID = Number(memberID);
      id = Number(id);
      this.removeBuff(memberID,id);
   }
   function OnGame_PartyWindow_ClearBuff(memberID)
   {
      memberID = Number(memberID);
      this.clearBuff(memberID);
   }
}
