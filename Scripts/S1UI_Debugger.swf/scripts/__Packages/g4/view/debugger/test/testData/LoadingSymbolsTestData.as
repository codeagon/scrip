class g4.view.debugger.test.testData.LoadingSymbolsTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function LoadingSymbolsTestData()
   {
      super(g4.view.ViewID.LOADING_SYMBOLS,null,[new g4.view.debugger.test.testData.TestDataModel("OnGame_LoadingSymbols_Show(true, 1)",this,this.OnGame_LoadingSymbols_Show,[true,1]),new g4.view.debugger.test.testData.TestDataModel("OnGame_LoadingSymbols_Show(true, 2)",this,this.OnGame_LoadingSymbols_Show,[true,2]),new g4.view.debugger.test.testData.TestDataModel("OnGame_LoadingSymbols_Show(true, 3)",this,this.OnGame_LoadingSymbols_Show,[true,3]),new g4.view.debugger.test.testData.TestDataModel("OnGame_LoadingSymbols_Show(false, 1)",this,this.OnGame_LoadingSymbols_Show,[false,1]),new g4.view.debugger.test.testData.TestDataModel("OnGame_LoadingSymbols_Show(false, 2)",this,this.OnGame_LoadingSymbols_Show,[false,2]),new g4.view.debugger.test.testData.TestDataModel("OnGame_LoadingSymbols_Show(false, 3)",this,this.OnGame_LoadingSymbols_Show,[false,3])]);
   }
   function OnGame_LoadingSymbols_Show(bShow, mode)
   {
      var _loc4_ = 5;
      var _loc3_ = "msg1 " + this.randRange(1000,9999);
      var _loc2_ = "msg2 " + this.randRange(1000,9999);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_LoadingSymbols_Show",bShow,_loc4_,mode,_loc3_,_loc2_);
   }
}
