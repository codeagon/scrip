class g4.view.debugger.test.testData.CharacterWindowTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function CharacterWindowTestData()
   {
      super(g4.view.ViewID.CHARACTER_WINDOW,null,[new g4.view.debugger.test.testData.TestDataModel("OnGame_CharacterWindow_SetAwaken(true)",this,this.OnGame_CharacterWindow_SetAwaken,[true]),new g4.view.debugger.test.testData.TestDataModel("OnGame_CharacterWindow_SetAwaken(false)",this,this.OnGame_CharacterWindow_SetAwaken,[false])]);
   }
   function OnGame_CharacterWindow_SetAwaken(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_CharacterWindow_SetAwaken",value);
   }
}
