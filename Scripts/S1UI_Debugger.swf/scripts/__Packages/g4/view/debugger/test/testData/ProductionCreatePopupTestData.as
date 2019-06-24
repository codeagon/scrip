class g4.view.debugger.test.testData.ProductionCreatePopupTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function ProductionCreatePopupTestData()
   {
      super(g4.view.ViewID.PRODUCTION_CREATE_POP_UP,null,[new g4.view.debugger.test.testData.TestDataModel("연속제작",this,this.uiLoadComplete)]);
   }
   function uiLoadComplete()
   {
      var _loc2_ = 6;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_ProductionCreatePopUp_SetTitle","크림");
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_ProductionCreatePopUp_SetTargetItem","2\t0.0","204117\t크림\timg://item__206022\t0\t761187093");
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_ProductionCreatePopUp_UpdateProgressLinear",_loc2_);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_ProductionCreatePopUp_UpdateTotalProgress","0","1");
      gs.TweenLite.delayedCall(_loc2_ + 1,this.onComplete,null,this);
   }
   function onComplete()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_ProductionCreatePopUp_UpdateTotalProgress","1","1");
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_ProductionCreatePopUp_SetTargetItem","2\t0.0","204117\t크림\timg://item__206022\t0\t761187293");
   }
}
