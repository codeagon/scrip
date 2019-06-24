class g4.model.main.MainModelCallbacks extends g4.model.ModelCallbacks
{
   function MainModelCallbacks()
   {
      super();
      this.registerGameInterface("OnGameEventChangeUIMode",this.OnGameEventChangeUIMode);
      this.registerGameInterface("OnGame_ChangeResolution",this.OnGame_ChangeResolution);
      this.registerGameInterface("OnGame_ChangeStageSize",this.OnGame_ChangeStageSize);
      this.registerGameInterface("OnGame_InteractionMenu_Open",this.OnGame_InteractionMenu_Open);
      this.registerGameInterface("OnGame_InteractionMenu_Close",this.OnGame_InteractionMenu_Close);
      this.registerGameInterface("OnGame_InteractionMenu_UpdatePosition",this.OnGame_InteractionMenu_UpdatePosition);
      this.registerGameInterface("OnGame_AbnormalityOption_SetOption",this.OnGame_AbnormalityOption_SetOption);
   }
   function OnGameEventChangeUIMode(uiMode)
   {
      uiMode = g4.util.Converter.toBoolean(uiMode);
      g4.model.GameModel.mainModel.$OnGameEventChangeUIMode(uiMode);
   }
   function OnGame_ChangeResolution(w, h)
   {
      w = Number(w);
      h = Number(h);
      g4.model.GameModel.mainModel.$OnGame_ChangeResolution(w,h);
   }
   function OnGame_ChangeStageSize(w, h)
   {
      w = Number(w);
      h = Number(h);
      g4.model.GameModel.mainModel.$OnGame_ChangeStageSize(w,h);
   }
   function OnGame_InteractionMenu_Open(x, y, dataList)
   {
      x = Number(x);
      y = Number(y);
      var _loc2_ = {};
      _loc2_.x = x;
      _loc2_.y = y;
      _loc2_.dataList = dataList;
      this.sendEvent(g4.model.GameModelEventType.INTERACTION_MENU_OPEN_DEFAULT,_loc2_);
   }
   function OnGame_InteractionMenu_Close()
   {
      g4.model.GameModel.mainModel.$OnGame_InteractionMenu_Close();
   }
   function OnGame_InteractionMenu_UpdatePosition(x, y)
   {
      x = Number(x);
      y = Number(y);
      var _loc2_ = {};
      _loc2_.x = x;
      _loc2_.y = y;
      this.sendEvent(g4.model.GameModelEventType.INTERACTION_MENU_MOVE,_loc2_);
   }
   function OnGame_AbnormalityOption_SetOption(other, battleConsumable, skillAndGlyph)
   {
      other = g4.util.Converter.toBoolean(other);
      battleConsumable = g4.util.Converter.toBoolean(battleConsumable);
      skillAndGlyph = g4.util.Converter.toBoolean(skillAndGlyph);
      g4.model.GameModel.mainModel.$OnGame_AbnormalityOption_SetOption(other,battleConsumable,skillAndGlyph);
   }
}
