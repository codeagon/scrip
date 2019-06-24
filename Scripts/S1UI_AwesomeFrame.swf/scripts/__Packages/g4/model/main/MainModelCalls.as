class g4.model.main.MainModelCalls extends g4.model.ModelCalls
{
   function MainModelCalls()
   {
      super();
   }
   function ToGame_InteractionMenu_Select(selectedMenuIndex)
   {
      this.sendToGame("ToGame_InteractionMenu_Select",String(selectedMenuIndex));
   }
   function ToGame_InteractionMenu_CloseUI()
   {
      this.sendToGame("ToGame_InteractionMenu_CloseUI");
   }
   function ToGame_AbnormalityOption_Open()
   {
      this.sendToGame("ToGame_AbnormalityOption_Open");
   }
   function ToGame_AbnormalityOption_Close()
   {
      this.sendToGame("ToGame_AbnormalityOption_Close");
   }
   function ToGame_AbnormalityOption_SaveOption(other, battleConsumable, skillAndGlyph)
   {
      var _loc2_ = [g4.util.Converter.booleanToNumber(other),g4.util.Converter.booleanToNumber(battleConsumable),g4.util.Converter.booleanToNumber(skillAndGlyph)];
      this.sendToGame("ToGame_AbnormalityOption_SaveOption",_loc2_.join("\t"));
   }
}
