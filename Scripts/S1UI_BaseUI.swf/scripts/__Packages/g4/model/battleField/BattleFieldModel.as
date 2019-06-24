class g4.model.battleField.BattleFieldModel extends g4.model.Model
{
   var _playerCount = 0;
   function BattleFieldModel()
   {
      super();
      this.modelCallbacks = new g4.model.battleField.BattleFieldModelCallbacks();
      this.modelCalls = new g4.model.battleField.BattleFieldModelCalls();
   }
   function __get__playerCount()
   {
      return this._playerCount;
   }
   function $OnGame_BFScoreBoard_SetData(batteMode, myScore, myGoalScore, otherScore, otherGoalScore, myBlink, otherBlink, endTime, warningTime, myTeamName, otherTeamName, totalPlayerCount)
   {
      this._playerCount = totalPlayerCount;
      this.sendEvent(g4.model.GameModelEventType.BATTLE_FIELD_PLAYER_COUNT_CHANGE);
   }
}
