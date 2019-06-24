class g4.model.party.PartyModelCallbacks extends g4.model.ModelCallbacks
{
   function PartyModelCallbacks()
   {
      super();
      this.registerGameInterface("OnGame_PartyWindow_SetInParty",this.OnGame_PartyWindow_SetInParty);
      this.registerGameInterface("OnGameEventAmIPartyMaster",this.OnGameEventAmIPartyMaster);
      this.registerGameInterface("OnGame_PartyWindow_SetDismissDisable",this.OnGame_PartyWindow_SetDismissDisable);
      this.registerGameInterface("OnGame_PartyWindow_SetBanDisable",this.OnGame_PartyWindow_SetBanDisable);
      this.registerGameInterface("OnGame_PartyWindow_SetPartyMemberState",this.OnGame_PartyWindow_SetPartyMemberState);
      this.registerGameInterface("OnGame_PartyLootingSetting_SetOption",this.OnGame_PartyLootingSetting_SetOption);
      this.registerGameInterface("OnGame_PartyAbnormalitySetting_SetOption",this.OnGame_PartyAbnormalitySetting_SetOption);
      this.registerGameInterface("OnGame_PartyRaidAbnormalitySetting_SetOption",this.OnGame_PartyRaidAbnormalitySetting_SetOption);
   }
   function OnGame_PartyWindow_SetInParty(bParty)
   {
      bParty = g4.util.Converter.toBoolean(bParty);
      g4.model.GameModel.partyModel.$OnGame_PartyWindow_SetInParty(bParty);
   }
   function OnGameEventAmIPartyMaster(type)
   {
      type = Number(type);
      g4.model.GameModel.partyModel.$OnGameEventAmIPartyMaster(type);
   }
   function OnGame_PartyWindow_SetDismissDisable(flag)
   {
      flag = g4.util.Converter.toBoolean(flag);
      g4.model.GameModel.partyModel.$OnGame_PartyWindow_SetDismissDisable(flag);
   }
   function OnGame_PartyWindow_SetBanDisable(flag)
   {
      flag = g4.util.Converter.toBoolean(flag);
      g4.model.GameModel.partyModel.$OnGame_PartyWindow_SetBanDisable(flag);
   }
   function OnGame_PartyWindow_SetPartyMemberState(memberList)
   {
      g4.model.GameModel.partyModel.$OnGame_PartyWindow_SetPartyMemberState(memberList);
   }
   function OnGame_PartyLootingSetting_SetOption(distributionType, highGrade, highGradeDistributionType, equipItem, possibleClassOnly, dice, noLootingOnBattleMode)
   {
      distributionType = Number(distributionType);
      highGrade = g4.util.Converter.toBoolean(highGrade);
      highGradeDistributionType = Number(highGradeDistributionType);
      equipItem = g4.util.Converter.toBoolean(equipItem);
      possibleClassOnly = g4.util.Converter.toBoolean(possibleClassOnly);
      dice = g4.util.Converter.toBoolean(dice);
      noLootingOnBattleMode = g4.util.Converter.toBoolean(noLootingOnBattleMode);
      g4.model.GameModel.partyModel.$OnGame_PartyLootingSetting_SetOption(distributionType,highGrade,highGradeDistributionType,equipItem,possibleClassOnly,dice,noLootingOnBattleMode);
   }
   function OnGame_PartyAbnormalitySetting_SetOption(type, other, battleConsumable, skillAndGlyph)
   {
      type = Number(type);
      other = g4.util.Converter.toBoolean(other);
      battleConsumable = g4.util.Converter.toBoolean(battleConsumable);
      skillAndGlyph = g4.util.Converter.toBoolean(skillAndGlyph);
      g4.model.GameModel.partyModel.$OnGame_PartyAbnormalitySetting_SetOption(type,other,battleConsumable,skillAndGlyph);
   }
   function OnGame_PartyRaidAbnormalitySetting_SetOption(type, skillAndGlyph, battleConsumable, allHarmful, removableHarmful, myPartySimply)
   {
      g4.model.GameModel.partyModel.$OnGame_PartyRaidAbnormalitySetting_SetOption(type,skillAndGlyph,battleConsumable,allHarmful,removableHarmful,myPartySimply);
   }
}
