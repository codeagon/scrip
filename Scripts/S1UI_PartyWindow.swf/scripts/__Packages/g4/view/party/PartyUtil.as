class g4.view.party.PartyUtil
{
   function PartyUtil()
   {
   }
   static function getOptionValueByGroupID(groupID)
   {
      switch(groupID)
      {
         case g4.view.party.PartyConstants.BUFF_GROUP_ID_OTHER:
            return g4.model.GameModel.partyModel.partyAbnormalityData.other;
         case g4.view.party.PartyConstants.BUFF_GROUP_ID_BATTLE_CONSUMABLE:
            return g4.model.GameModel.partyModel.partyAbnormalityData.battleConsumable;
         case g4.view.party.PartyConstants.BUFF_GROUP_ID_SKILL_AND_GLYPH:
            return g4.model.GameModel.partyModel.partyAbnormalityData.skillAndGlyph;
         default:
            return false;
      }
   }
}
