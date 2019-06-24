class g4.model.party.PartyModelCalls extends g4.model.ModelCalls
{
   function PartyModelCalls()
   {
      super();
   }
   function ToGame_PartyWindow_LeaveParty()
   {
      this.sendToGame("ToGame_PartyWindow_LeaveParty");
   }
   function ToGame_PartyWindow_DismissParty()
   {
      this.sendToGame("ToGame_PartyWindow_DismissParty");
   }
   function ToGame_PartyWindowRaidInfo_CheckReadyForBattle()
   {
      this.sendToGame("ToGame_PartyWindowRaidInfo_CheckReadyForBattle");
   }
   function ToGame_PartyWindow_ResetAllDungeons()
   {
      this.sendToGame("ToGame_PartyWindow_ResetAllDungeons");
   }
   function ToGame_PartyWindow_BanPartyMember(memberIndex)
   {
      this.sendToGame("ToGame_PartyWindow_BanPartyMember",String(memberIndex));
   }
   function ToGame_PartyWindow_ChangePartyMaster(memberIndex)
   {
      this.sendToGame("ToGame_PartyWindow_ChangePartyMaster",String(memberIndex));
   }
   function ToGame_PartyWindow_SetPermissionInvitation(memberIndex, flag)
   {
      this.sendToGame("ToGame_PartyWindow_SetPermissionInvitation",memberIndex + "\t" + g4.util.Converter.booleanToNumber(flag));
   }
   function ToGame_PartyWindow_DiceDistributionStart_End(memberID)
   {
      this.sendToGame("ToGame_PartyWindow_DiceDistributionStart_End",String(memberID));
   }
   function ToGame_PartyWindow_DiceDistributionData_End(memberID)
   {
      this.sendToGame("ToGame_PartyWindow_DiceDistributionData_End",String(memberID));
   }
   function ToGame_PartyWindow_DiceDistributionIcon_End(memberID)
   {
      this.sendToGame("ToGame_PartyWindow_DiceDistributionIcon_End",String(memberID));
   }
   function ToGame_PartyWindow_Init()
   {
      this.sendToGame("ToGame_PartyWindow_Init");
   }
   function ToGame_PartyWindow_CallMenu(memberID)
   {
      this.sendToGame("ToGame_PartyWindow_CallMenu",String(memberID));
   }
   function ToGame_PartyWindowRaidInfo_Init()
   {
      this.sendToGame("ToGame_PartyWindowRaidInfo_Init");
   }
   function ToGame_PartyWindowRaidInfo_InteractionMenu(groupID, memberID)
   {
      this.sendToGame("ToGame_PartyWindowRaidInfo_InteractionMenu",groupID + "\t" + memberID);
   }
   function ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart_End(groupID, memberID)
   {
      this.sendToGame("ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart_End",groupID + "\t" + memberID);
   }
   function ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionData_End(groupID, memberID)
   {
      this.sendToGame("ToGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart_End",groupID + "\t" + memberID);
   }
   function ToGame_PartyLootingSetting_Open()
   {
      this.sendToGame("ToGame_PartyLootingSetting_Open");
   }
   function ToGame_PartyLootingSetting_Close()
   {
      this.sendToGame("ToGame_PartyLootingSetting_Close");
   }
   function ToGame_PartyLootingSetting_SaveOption(distributionType, highGrade, highGradeDistributionType, equipItem, possibleClassOnly, dice, noLootingOnBattleMode)
   {
      var _loc2_ = [distributionType,g4.util.Converter.booleanToNumber(highGrade),highGradeDistributionType,g4.util.Converter.booleanToNumber(equipItem),g4.util.Converter.booleanToNumber(possibleClassOnly),g4.util.Converter.booleanToNumber(dice),g4.util.Converter.booleanToNumber(noLootingOnBattleMode)];
      this.sendToGame("ToGame_PartyLootingSetting_SaveOption",_loc2_.join("\t"));
   }
   function ToGame_PartyAbnormalitySetting_Open()
   {
      this.sendToGame("ToGame_PartyAbnormalitySetting_Open");
   }
   function ToGame_PartyAbnormalitySetting_Close()
   {
      this.sendToGame("ToGame_PartyAbnormalitySetting_Close");
   }
   function ToGame_PartyAbnormalitySetting_SaveOption(type, other, battleConsumable, skillAndGlyph)
   {
      var _loc2_ = [type,g4.util.Converter.booleanToNumber(other),g4.util.Converter.booleanToNumber(battleConsumable),g4.util.Converter.booleanToNumber(skillAndGlyph)];
      this.sendToGame("ToGame_PartyAbnormalitySetting_SaveOption",_loc2_.join("\t"));
   }
   function ToGame_PartyRaidAbnormalitySetting_Open()
   {
      this.sendToGame("ToGame_PartyRaidAbnormalitySetting_Open");
   }
   function ToGame_PartyRaidAbnormalitySetting_Close()
   {
      this.sendToGame("ToGame_PartyRaidAbnormalitySetting_Close");
   }
   function ToGame_PartyRaidAbnormalitySetting_SaveOption(type, skillAndGlyph, battleConsumable, allHarmful, removableHarmful, myPartySimply)
   {
      var _loc2_ = [type,g4.util.Converter.booleanToNumber(skillAndGlyph),g4.util.Converter.booleanToNumber(battleConsumable),g4.util.Converter.booleanToNumber(allHarmful),g4.util.Converter.booleanToNumber(removableHarmful),g4.util.Converter.booleanToNumber(myPartySimply)];
      this.sendToGame("ToGame_PartyRaidAbnormalitySetting_SaveOption",_loc2_.join("\t"));
   }
}
