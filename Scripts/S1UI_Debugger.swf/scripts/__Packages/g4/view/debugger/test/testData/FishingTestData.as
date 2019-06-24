class g4.view.debugger.test.testData.FishingTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function FishingTestData()
   {
      super(g4.view.ViewID.FISHING,"낚시",[new g4.view.debugger.test.testData.TestDataModel("F키 누름",this,this.init,null)],"g4.view.fishing");
   }
   function uiLoadComplete()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Fishing_SetMessage","무언가 걸렸습니다. F키를 눌러 낚아 올리세요.\t30초 후 물고기를 자동으로 낚습니다.");
   }
   function init()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Fishing_CreateBox","0\t82\t75.000000\n",0);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Fishing_Start",30,"F",1);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Fishing_FishPosition",22);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Fishing_Pulling",false);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Fishing_SetBoxState",0,1,75,0);
   }
   function testTick()
   {
      clearInterval(this._testInterval);
      this._testInterval = setInterval(this,"testTick2",1000);
   }
   function testTick2()
   {
      clearInterval(this._testInterval);
   }
}
