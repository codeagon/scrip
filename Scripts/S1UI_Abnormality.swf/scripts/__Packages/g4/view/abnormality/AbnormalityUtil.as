class g4.view.abnormality.AbnormalityUtil
{
   function AbnormalityUtil()
   {
   }
   static function getOptionValueByGroupID(groupID)
   {
      switch(groupID)
      {
         case g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_OTHER:
            return g4.model.GameModel.mainModel.abnormalityData.other;
         case g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_BATTLE_CONSUMABLE:
            return g4.model.GameModel.mainModel.abnormalityData.battleConsumable;
         case g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_SKILL_AND_GLYPH:
            return g4.model.GameModel.mainModel.abnormalityData.skillAndGlyph;
         default:
            return false;
      }
   }
}
