class g4.model.battleField.BattleFieldModelCallbacks extends g4.model.ModelCallbacks
{
   function BattleFieldModelCallbacks()
   {
      super();
      this.registerGameInterface("OnGame_BFScoreBoard_SetData",this.OnGame_BFScoreBoard_SetData);
   }
   function OnGame_BFScoreBoard_SetData(batteMode, myScore, myGoalScore, otherScore, otherGoalScore, myBlink, otherBlink, endTime, warningTime, myTeamName, otherTeamName, totalPlayerCount)
   {
      g4.model.GameModel.battleFieldModel.$OnGame_BFScoreBoard_SetData(batteMode,myScore,myGoalScore,otherScore,otherGoalScore,myBlink,otherBlink,endTime,warningTime,myTeamName,otherTeamName,totalPlayerCount);
   }
}
