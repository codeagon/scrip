class g4.model.party.PartyModel extends g4.model.Model
{
   var isInParty = false;
   var partyMyState = g4.model.GameConstants.PARTY_MY_STATE_PARTY_MEMBER;
   var dismissDisible = true;
   var banDisible = true;
   function PartyModel()
   {
      super();
      this.modelCallbacks = new g4.model.party.PartyModelCallbacks();
      this.modelCalls = new g4.model.party.PartyModelCalls();
      this.partyDistributionData = new g4.model.party.PartyDistributionData();
      this.partyAbnormalityData = new g4.model.party.PartyAbnormalityData();
      this.partyRaidAbnormalityData = new g4.model.party.PartyRaidAbnormalityData();
   }
   function getPartyMemberCount()
   {
      if(this.partyMemberDataArray == null)
      {
         return 0;
      }
      return this.partyMemberDataArray.length;
   }
   function partyRaidResetPosition()
   {
      this.sendEvent(g4.model.GameModelEventType.PARTY_RAID_RESET_POSITION);
   }
   function partyRaidStartDrag()
   {
      this.sendEvent(g4.model.GameModelEventType.PARTY_RAID_START_DRAG);
   }
   function partyRaidStopDrag()
   {
      this.sendEvent(g4.model.GameModelEventType.PARTY_RAID_STOP_DRAG);
   }
   function $OnGame_PartyWindow_SetInParty(bParty)
   {
      if(bParty == this.isInParty)
      {
         return undefined;
      }
      this.isInParty = bParty;
      this.sendEvent(g4.model.GameModelEventType.PARTY_STATE_CHANGED);
   }
   function $OnGameEventAmIPartyMaster(state)
   {
      if(state == this.partyMyState)
      {
         return undefined;
      }
      this.partyMyState = state;
      this.sendEvent(g4.model.GameModelEventType.PARTY_STATE_CHANGED);
   }
   function $OnGame_PartyWindow_SetDismissDisable(flag)
   {
      if(flag == this.dismissDisible)
      {
         return undefined;
      }
      this.dismissDisible = flag;
      this.sendEvent(g4.model.GameModelEventType.PARTY_MENU_RESTRICTION_CHANGED);
   }
   function $OnGame_PartyWindow_SetBanDisable(flag)
   {
      if(flag == this.banDisible)
      {
         return undefined;
      }
      this.banDisible = flag;
      this.sendEvent(g4.model.GameModelEventType.PARTY_MENU_RESTRICTION_CHANGED);
   }
   function $OnGame_PartyWindow_SetPartyMemberState(memberList)
   {
      var _loc5_ = [];
      var _loc2_ = undefined;
      var _loc6_ = lib.util.ExtString.split(memberList,"\n");
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc7_ = _loc6_.length;
      _loc3_ = 0;
      while(_loc3_ < _loc7_)
      {
         _loc4_ = lib.util.ExtString.split(_loc6_[_loc3_],"\t");
         _loc2_ = new g4.model.party.PartyMemberData();
         _loc2_.index = Number(_loc4_[0]);
         _loc2_.name = String(_loc4_[1]);
         _loc2_.hasInvitation = Number(_loc4_[2]) == 1;
         _loc5_.push(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
      _loc5_.sort(function(a, b)
      {
         if(a.index < b.index)
         {
            return -1;
         }
         a.index > b.index;
         return 1;
      }
      );
      this.partyMemberDataArray = _loc5_.length != 0?_loc5_:null;
      this.sendEvent(g4.model.GameModelEventType.PARTY_MEMBER_DATA_CHANGED);
   }
   function $OnGame_PartyLootingSetting_SetOption(distributionType, highGrade, highGradeDistributionType, equipItem, possibleClassOnly, dice, noLootingOnBattleMode)
   {
      this.partyDistributionData.distributionType = distributionType;
      this.partyDistributionData.highGrade = highGrade;
      this.partyDistributionData.highGradeDistributionType = highGradeDistributionType;
      this.partyDistributionData.equipItem = equipItem;
      this.partyDistributionData.possibleClassOnly = possibleClassOnly;
      this.partyDistributionData.dice = dice;
      this.partyDistributionData.noLootingOnBattleMode = noLootingOnBattleMode;
      this.sendEvent(g4.model.GameModelEventType.PARTY_DISTRIBUTION_DATA_CHANGED);
   }
   function $OnGame_PartyAbnormalitySetting_SetOption(type, other, battleConsumable, skillAndGlyph)
   {
      this.partyAbnormalityData.type = type;
      this.partyAbnormalityData.other = other;
      this.partyAbnormalityData.battleConsumable = battleConsumable;
      this.partyAbnormalityData.skillAndGlyph = skillAndGlyph;
      this.sendEvent(g4.model.GameModelEventType.PARTY_ABNORMALITY_DATA_CHANGED);
   }
   function $OnGame_PartyRaidAbnormalitySetting_SetOption(type, skillAndGlyph, battleConsumable, allHarmful, removableHarmful, myPartySimply)
   {
      this.partyRaidAbnormalityData.type = type;
      this.partyRaidAbnormalityData.skillAndGlyph = skillAndGlyph;
      this.partyRaidAbnormalityData.battleConsumable = battleConsumable;
      this.partyRaidAbnormalityData.allHarmful = allHarmful;
      this.partyRaidAbnormalityData.removableHarmful = removableHarmful;
      this.partyRaidAbnormalityData.myPartySimply = myPartySimply;
      this.sendEvent(g4.model.GameModelEventType.PARTY_RAID_ABNORMALITY_DATA_CHANGED);
   }
   function ToGame_PartyWindow_LeaveParty()
   {
      this.modelCalls.ToGame_PartyWindow_LeaveParty();
   }
   function ToGame_PartyWindow_DismissParty()
   {
      this.modelCalls.ToGame_PartyWindow_DismissParty();
   }
   function ToGame_PartyWindowRaidInfo_CheckReadyForBattle()
   {
      this.modelCalls.ToGame_PartyWindowRaidInfo_CheckReadyForBattle();
   }
   function ToGame_PartyWindow_ResetAllDungeons()
   {
      this.modelCalls.ToGame_PartyWindow_ResetAllDungeons();
   }
   function ToGame_PartyWindow_BanPartyMember(memberIndex)
   {
      this.modelCalls.ToGame_PartyWindow_BanPartyMember(memberIndex);
   }
   function ToGame_PartyWindow_ChangePartyMaster(memberIndex)
   {
      this.modelCalls.ToGame_PartyWindow_ChangePartyMaster(memberIndex);
   }
   function ToGame_PartyWindow_SetPermissionInvitation(memberIndex, flag)
   {
      this.modelCalls.ToGame_PartyWindow_SetPermissionInvitation(memberIndex,flag);
   }
   function ToGame_PartyAbnormalitySetting_Open()
   {
      this.modelCalls.ToGame_PartyAbnormalitySetting_Open();
   }
   function ToGame_PartyWindow_DiceDistributionStart_End(memberID)
   {
      this.modelCalls.ToGame_PartyWindow_DiceDistributionStart_End(memberID);
   }
   function ToGame_PartyWindow_DiceDistributionData_End(memberID)
   {
      this.modelCalls.ToGame_PartyWindow_DiceDistributionData_End(memberID);
   }
   function ToGame_PartyWindow_DiceDistributionIcon_End(memberID)
   {
      this.modelCalls.ToGame_PartyWindow_DiceDistributionIcon_End(memberID);
   }
   function ToGame_PartyWindow_Init()
   {
      this.modelCalls.ToGame_PartyWindow_Init();
   }
   function ToGame_PartyWindow_CallMenu(memberID)
   {
      this.modelCalls.ToGame_PartyWindow_CallMenu(memberID);
   }
   function ToGame_PartyWindowRaidInfo_Init()
   {
      this.modelCalls.ToGame_PartyWindowRaidInfo_Init();
   }
   function ToGame_PartyWindowRaidInfo_InteractionMenu(groupID, memberID)
   {
      this.modelCalls.ToGame_PartyWindowRaidInfo_InteractionMenu(groupID,memberID);
   }
   function ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart_End(groupID, memberID)
   {
      this.modelCalls.ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart_End(groupID,memberID);
   }
   function ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionData_End(groupID, memberID)
   {
      this.modelCalls.ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionData_End(groupID,memberID);
   }
   function ToGame_PartyLootingSetting_Open()
   {
      this.modelCalls.ToGame_PartyLootingSetting_Open();
   }
   function ToGame_PartyLootingSetting_Close()
   {
      this.modelCalls.ToGame_PartyLootingSetting_Close();
   }
   function ToGame_PartyLootingSetting_SaveOption(distributionType, highGrade, highGradeDistributionType, equipItem, possibleClassOnly, dice, noLootingOnBattleMode)
   {
      this.modelCalls.ToGame_PartyLootingSetting_SaveOption(distributionType,highGrade,highGradeDistributionType,equipItem,possibleClassOnly,dice,noLootingOnBattleMode);
   }
   function ToGame_PartyRaidAbnormalitySetting_Open()
   {
      this.modelCalls.ToGame_PartyRaidAbnormalitySetting_Open();
   }
   function ToGame_PartyAbnormalitySetting_Close()
   {
      this.modelCalls.ToGame_PartyAbnormalitySetting_Close();
   }
   function ToGame_PartyAbnormalitySetting_SaveOption(type, other, battleConsumable, skillAndGlyph)
   {
      this.modelCalls.ToGame_PartyAbnormalitySetting_SaveOption(type,other,battleConsumable,skillAndGlyph);
   }
   function ToGame_PartyRaidAbnormalitySetting_Close()
   {
      this.modelCalls.ToGame_PartyRaidAbnormalitySetting_Close();
   }
   function ToGame_PartyRaidAbnormalitySetting_SaveOption(data)
   {
      this.modelCalls.ToGame_PartyRaidAbnormalitySetting_SaveOption(data.type,data.skillAndGlyph,data.battleConsumable,data.allHarmful,data.removableHarmful,data.myPartySimply);
   }
}
