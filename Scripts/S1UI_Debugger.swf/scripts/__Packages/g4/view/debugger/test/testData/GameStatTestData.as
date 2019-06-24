class g4.view.debugger.test.testData.GameStatTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function GameStatTestData()
   {
      super(g4.view.ViewID.GAME_STAT,"시간 표시",[new g4.view.debugger.test.testData.TestDataModel("시간 표시 O",this,this.setTimeVisible,[true]),new g4.view.debugger.test.testData.TestDataModel("시간 표시 X",this,this.setTimeVisible,[false]),new g4.view.debugger.test.testData.TestDataModel("FPS 표시 O",this,this.setFPSVisible,[true]),new g4.view.debugger.test.testData.TestDataModel("FPS 표시 X",this,this.setFPSVisible,[false]),new g4.view.debugger.test.testData.TestDataModel("FPS 설정",this,this.OnGame_GameStat_setStat)]);
   }
   function setTimeVisible(visible)
   {
      lib.gamedata.CustomizedUIDataCollection.getInstance().saveData(lib.gamedata.CustomizedUIDataKey.CLOCKWINDOW_SHOW_BOOLEAN,visible);
   }
   function setFPSVisible(visible)
   {
      lib.gamedata.CustomizedUIDataCollection.getInstance().saveData(lib.gamedata.CustomizedUIDataKey.FPS_SHOW_BOOLEAN,visible);
   }
   function OnGame_GameStat_setStat()
   {
      var _loc2_ = this.randRange(1,99);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_GameStat_setStat",_loc2_);
   }
}
