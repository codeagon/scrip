class g4.model.main.MainModel extends g4.model.Model
{
   var uiMode = false;
   var resolutionX = 0;
   var resolutionY = 0;
   function MainModel()
   {
      super();
      this.modelCallbacks = new g4.model.main.MainModelCallbacks();
      this.modelCalls = new g4.model.main.MainModelCalls();
      this.abnormalityData = new g4.model.main.AbnormalityData();
   }
   function openInteractionMenuCommon(menuDataArray, closeHandler, openHandler)
   {
      var _loc2_ = {};
      _loc2_.menuDataArray = menuDataArray;
      _loc2_.closeHandler = closeHandler;
      _loc2_.openHandler = openHandler;
      this.sendEvent(g4.model.GameModelEventType.INTERACTION_MENU_OPEN_COMMON,_loc2_);
   }
   function closeInteractionMenu()
   {
      this.sendEvent(g4.model.GameModelEventType.INTERACTION_MENU_CLOSE);
   }
   function $OnGameEventChangeUIMode(value)
   {
      if(value == this.uiMode)
      {
         return undefined;
      }
      this.uiMode = value;
      this.sendEvent(g4.model.GameModelEventType.MAIN_UI_MODE_CHANGED);
   }
   function $OnGame_ChangeResolution(w, h)
   {
      if(w == this.resolutionX && h == this.resolutionY)
      {
         return undefined;
      }
      this.resolutionX = w;
      this.resolutionY = h;
      this.sendEvent(g4.model.GameModelEventType.MAIN_RESOLUTION_CHANGED);
   }
   function $OnGame_ChangeStageSize(w, h)
   {
      this.sendEvent(g4.model.GameModelEventType.MAIN_STAGE_SIZE_CHANGE);
   }
   function $OnGame_InteractionMenu_Close()
   {
      this.closeInteractionMenu();
   }
   function $OnGame_AbnormalityOption_SetOption(other, battleConsumable, skillAndGlyph)
   {
      this.abnormalityData.other = other;
      this.abnormalityData.battleConsumable = battleConsumable;
      this.abnormalityData.skillAndGlyph = skillAndGlyph;
      this.sendEvent(g4.model.GameModelEventType.ABNORMALITY_DATA_CHANGED);
   }
   function ToGame_InteractionMenu_Select(selectedMenuIndex)
   {
      this.modelCalls.ToGame_InteractionMenu_Select(selectedMenuIndex);
   }
   function ToGame_InteractionMenu_CloseUI()
   {
      this.modelCalls.ToGame_InteractionMenu_CloseUI();
   }
   function ToGame_AbnormalityOption_Open()
   {
      this.modelCalls.ToGame_AbnormalityOption_Open();
   }
   function ToGame_AbnormalityOption_Close()
   {
      this.modelCalls.ToGame_AbnormalityOption_Close();
   }
   function ToGame_AbnormalityOption_SaveOption(data)
   {
      this.modelCalls.ToGame_AbnormalityOption_SaveOption(data.other,data.battleConsumable,data.skillAndGlyph);
   }
}
