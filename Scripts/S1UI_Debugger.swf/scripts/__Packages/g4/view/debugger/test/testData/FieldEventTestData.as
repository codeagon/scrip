class g4.view.debugger.test.testData.FieldEventTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function FieldEventTestData()
   {
      super(g4.view.ViewID.FIELD_EVENT,null,[new g4.view.debugger.test.testData.TestDataModel("OnGame_FieldEvent_SetTitle",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("0",this,this.OnGame_FieldEvent_SetTitle,[0]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.OnGame_FieldEvent_SetTitle,[1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.OnGame_FieldEvent_SetTitle,[2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.OnGame_FieldEvent_SetTitle,[3]),new g4.view.debugger.test.testData.TestDataModel("4",this,this.OnGame_FieldEvent_SetTitle,[4]),new g4.view.debugger.test.testData.TestDataModel("5",this,this.OnGame_FieldEvent_SetTitle,[5])])]);
   }
   function OnGame_FieldEvent_SetTitle(type)
   {
      var _loc1_ = "가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다라마바사가나다";
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_FieldEvent_SetTitle",_loc1_,type);
   }
}
