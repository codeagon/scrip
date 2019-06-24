class g4.model.GameModel
{
   function GameModel()
   {
      super();
      g4.model.GameModel.uiModel = new g4.model.ui.UIModel();
      g4.model.GameModel.mainModel = new g4.model.main.MainModel();
      g4.model.GameModel.partyModel = new g4.model.party.PartyModel();
      g4.model.GameModel.battleFieldModel = new g4.model.battleField.BattleFieldModel();
      g4.model.GameModel.chatModel = new g4.model.chat.ChatModel();
   }
   static function addEventListener(viewID, type, scope, callback)
   {
      g4.model.GameModelEventDispatcher.addEventListener(viewID,type,scope,callback);
   }
   static function removeAllEventListeners(viewID)
   {
      g4.model.GameModelEventDispatcher.removeAllEventListeners(viewID);
   }
}
