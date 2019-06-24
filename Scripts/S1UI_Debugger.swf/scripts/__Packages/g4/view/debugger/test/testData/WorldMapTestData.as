class g4.view.debugger.test.testData.WorldMapTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   var valueIndex = 0;
   function WorldMapTestData()
   {
      super(g4.view.ViewID.WORLD_MAP_2,"월드맵",[new g4.view.debugger.test.testData.TestDataModel("더미 데이터 설정",this,this.setDummyData),new g4.view.debugger.test.testData.TestDataModel("비행비전투 데이터 설정",this,this.setFlyingNBData),new g4.view.debugger.test.testData.TestDataModel("OnGame_WorldMap_SetFieldEventButton",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("buttonState:0, buttonMode:0",this,this.OnGame_WorldMap_SetFieldEventButton,[0,0]),new g4.view.debugger.test.testData.TestDataModel("buttonState:1, buttonMode:0",this,this.OnGame_WorldMap_SetFieldEventButton,[1,0]),new g4.view.debugger.test.testData.TestDataModel("buttonState:2, buttonMode:0",this,this.OnGame_WorldMap_SetFieldEventButton,[2,0]),new g4.view.debugger.test.testData.TestDataModel("buttonState:0, buttonMode:1",this,this.OnGame_WorldMap_SetFieldEventButton,[0,1]),new g4.view.debugger.test.testData.TestDataModel("buttonState:1, buttonMode:1",this,this.OnGame_WorldMap_SetFieldEventButton,[1,1]),new g4.view.debugger.test.testData.TestDataModel("buttonState:2, buttonMode:1",this,this.OnGame_WorldMap_SetFieldEventButton,[2,1])]),new g4.view.debugger.test.testData.TestDataModel("OnGame_WorldMap_SetFieldEventInfo",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("visible true",this,this.OnGame_WorldMap_SetFieldEventInfo,[true]),new g4.view.debugger.test.testData.TestDataModel("visible false",this,this.OnGame_WorldMap_SetFieldEventInfo,[false])]),new g4.view.debugger.test.testData.TestDataModel("OnGame_WorldMap_SetFieldEventInfo2",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("visible true",this,this.OnGame_WorldMap_SetFieldEventInfo2,[true]),new g4.view.debugger.test.testData.TestDataModel("visible false",this,this.OnGame_WorldMap_SetFieldEventInfo2,[false])])]);
   }
   function uiLoadComplete()
   {
      this.setDummyData();
   }
   function setDummyData()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_WorldMap_SetMode",0);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_WorldMap_Init","새로제작한 월드맵","img://__WMap_ANC.WMap_ANC_Gard","UP_LINK" + random(100),0,0,"","","","","");
   }
   function setFlyingNBData()
   {
      this.setBG();
      var _loc22_ = "";
      var _loc26_ = "";
      var _loc23_ = ["img://__WMap_Marker.MARKER_FIELD_EVENT_SMALL","img://__WMap_Marker.MARKER_FIELD_EVENT_MEDIUM","img://__WMap_Marker.MARKER_FLYING_NB_SMALL","img://__WMap_Marker.MARKER_FLYING_NB_LARGE"];
      var _loc24_ = ["MARKER_FIELD_EVENT_SMALL","MARKER_FIELD_EVENT_MEDIUM","MARKER_FLYING_NB_SMALL","MARKER_FLYING_NB_LARGE"];
      var _loc2_ = undefined;
      var _loc25_ = _loc23_.length;
      _loc2_ = 0;
      while(_loc2_ < _loc25_)
      {
         var _loc3_ = _loc2_;
         var _loc19_ = 200 + _loc2_ * 100;
         var _loc17_ = 200;
         var _loc13_ = 0;
         var _loc12_ = -32;
         var _loc10_ = -32;
         var _loc5_ = _loc23_[_loc2_];
         var _loc14_ = "";
         var _loc18_ = "";
         var _loc11_ = 10;
         var _loc15_ = _loc24_[_loc2_];
         var _loc8_ = 0;
         var _loc16_ = "id_" + _loc3_;
         var _loc20_ = -1;
         var _loc9_ = -1;
         var _loc4_ = 1;
         var _loc21_ = 1;
         var _loc6_ = 2;
         var _loc7_ = 0;
         _loc22_ = _loc22_ + (_loc3_ + "\t" + _loc19_ + "\t" + _loc17_ + "\t" + _loc13_ + "\t" + _loc12_ + "\t" + _loc10_ + "\t" + _loc5_ + "\t" + _loc14_ + "\t" + _loc18_ + "\t" + _loc11_ + "\t" + _loc15_ + "\t" + _loc8_ + "\t" + _loc16_ + "\t" + _loc20_ + "\t" + _loc9_ + "\t" + _loc4_ + "\t" + _loc21_ + "\t" + _loc6_ + "\t" + _loc7_ + "\n");
         _loc2_ = _loc2_ + 1;
      }
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_WorldMap_AddImage",_loc22_);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_WorldMap_SetFieldEventTime",0,"3:55",0);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_WorldMap_SetFieldEventTime",1,"10:55",1);
   }
   function setBG()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_WorldMap_AddImage","1\t0\t0\t0\t0\t0\timg://__WMap_DG_TOD.WMap_DG_TOD_B1F\t0\t\t0\t0\t0");
   }
   function OnGame_WorldMap_SetFieldEventButton(buttonState, buttonMode)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_WorldMap_SetFieldEventButton",buttonState,buttonMode);
   }
   function OnGame_WorldMap_SetFieldEventInfo(bVisible)
   {
      var _loc5_ = "제목 " + this.randRange(0,10);
      var _loc2_ = this.randRange(0,999);
      var _loc7_ = this.randRange(999,9999);
      var _loc3_ = this.randRange(10,20);
      var _loc4_ = Math.random() > 0.5;
      var _loc6_ = Math.random() > 0.5;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_WorldMap_SetFieldEventInfo",bVisible,_loc5_,_loc2_,_loc7_,_loc3_,_loc4_,_loc6_);
   }
   function OnGame_WorldMap_SetFieldEventInfo2(visible)
   {
      var _loc6_ = "제목 " + this.randRange(0,999);
      var _loc5_ = this.randRange(0,10);
      var _loc7_ = this.randRange(10,99);
      var _loc3_ = 0;
      var _loc2_ = 0;
      this.valueIndex = this.valueIndex + 1;
      var _loc4_ = this.valueIndex % 3;
      if(_loc4_ == 0)
      {
         _loc3_ = 0;
         _loc2_ = 0;
      }
      else if(_loc4_ == 1)
      {
         _loc3_ = 5;
         _loc2_ = 17;
      }
      else if(_loc4_ == 2)
      {
         _loc3_ = 230;
         _loc2_ = 9929;
      }
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_WorldMap_SetFieldEventInfo2",visible,_loc6_,_loc5_,_loc7_,_loc3_,_loc2_);
   }
}
