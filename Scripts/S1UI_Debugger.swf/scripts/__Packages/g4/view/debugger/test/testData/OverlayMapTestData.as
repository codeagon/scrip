class g4.view.debugger.test.testData.OverlayMapTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function OverlayMapTestData()
   {
      super(g4.view.ViewID.OVERLAY_MAP_2,null,[new g4.view.debugger.test.testData.TestDataModel("더미 데이터 설정 1",this,this.setDummyData1),new g4.view.debugger.test.testData.TestDataModel("더미 데이터 설정 2",this,this.setDummyData2),new g4.view.debugger.test.testData.TestDataModel("OnGame_OverlayMap_SetScale",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("-1",this,this.OnGame_OverlayMap_SetScale,[-1]),new g4.view.debugger.test.testData.TestDataModel("0",this,this.OnGame_OverlayMap_SetScale,[0]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.OnGame_OverlayMap_SetScale,[1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.OnGame_OverlayMap_SetScale,[2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.OnGame_OverlayMap_SetScale,[3]),new g4.view.debugger.test.testData.TestDataModel("4",this,this.OnGame_OverlayMap_SetScale,[4]),new g4.view.debugger.test.testData.TestDataModel("5",this,this.OnGame_OverlayMap_SetScale,[5]),new g4.view.debugger.test.testData.TestDataModel("6",this,this.OnGame_OverlayMap_SetScale,[6]),new g4.view.debugger.test.testData.TestDataModel("7",this,this.OnGame_OverlayMap_SetScale,[7]),new g4.view.debugger.test.testData.TestDataModel("8",this,this.OnGame_OverlayMap_SetScale,[8]),new g4.view.debugger.test.testData.TestDataModel("9",this,this.OnGame_OverlayMap_SetScale,[9]),new g4.view.debugger.test.testData.TestDataModel("10",this,this.OnGame_OverlayMap_SetScale,[10]),new g4.view.debugger.test.testData.TestDataModel("11",this,this.OnGame_OverlayMap_SetScale,[11])])]);
   }
   function uiLoadComplete()
   {
      this.setDummyData1();
   }
   function setDummyData1()
   {
      var _loc3_ = 0;
      var _loc2_ = 0;
      var _loc4_ = "";
      var _loc5_ = "";
      var _loc1_ = "더미 데이터 1";
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_OverlayMap_Init","WMap_SWN_Field_01_Over","field",_loc3_,_loc2_,_loc4_,_loc5_,_loc1_);
   }
   function setDummyData2()
   {
      var _loc3_ = 0;
      var _loc2_ = 0;
      var _loc4_ = "";
      var _loc5_ = "";
      var _loc1_ = "더미 데이터 2";
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_OverlayMap_Init","WMap_RNW_A_Field_Over","field",_loc3_,_loc2_,_loc4_,_loc5_,_loc1_);
   }
   function OnGame_OverlayMap_SetScale(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_OverlayMap_SetScale",value);
   }
}
