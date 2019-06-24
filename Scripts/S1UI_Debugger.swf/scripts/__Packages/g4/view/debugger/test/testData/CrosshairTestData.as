class g4.view.debugger.test.testData.CrosshairTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function CrosshairTestData()
   {
      super(g4.view.ViewID.CROSSHAIR,null,[new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Name(NORMAL)",this,this.OnGame_Crosshair_Name,["NORMAL"]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Name(SMALL)",this,this.OnGame_Crosshair_Name,["SMALL"]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Position(50, 44)",this,this.OnGame_Crosshair_Position,[50,44]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Position(50, 50)",this,this.OnGame_Crosshair_Position,[50,50]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Level(-1)",this,this.OnGame_Crosshair_Level,[-1]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Level(0)",this,this.OnGame_Crosshair_Level,[0]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Level(1)",this,this.OnGame_Crosshair_Level,[1]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Level(10)",this,this.OnGame_Crosshair_Level,[10]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Aimed(true)",this,this.OnGame_Crosshair_Aimed,[true]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Aimed(false)",this,this.OnGame_Crosshair_Aimed,[false]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Distance(9)",this,this.OnGame_Crosshair_Distance,[9]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Distance(1)",this,this.OnGame_Crosshair_Distance,[1]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Distance(0)",this,this.OnGame_Crosshair_Distance,[0]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Distance(-1)",this,this.OnGame_Crosshair_Distance,[-1]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_SetLock",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("lock : true",this,this.setData_setLock,["lock",true]),new g4.view.debugger.test.testData.TestDataModel("lock : false",this,this.setData_setLock,["lock",false]),new g4.view.debugger.test.testData.TestDataModel("count : 0",this,this.setData_setLock,["count",0]),new g4.view.debugger.test.testData.TestDataModel("count : 1",this,this.setData_setLock,["count",1]),new g4.view.debugger.test.testData.TestDataModel("count : 2",this,this.setData_setLock,["count",2]),new g4.view.debugger.test.testData.TestDataModel("count : 10",this,this.setData_setLock,["count",10])]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Hit",this,this.OnGame_Crosshair_Hit),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Style(0)",this,this.OnGame_Crosshair_Style,[0]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_Style(1)",this,this.OnGame_Crosshair_Style,[1]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_SetBlink(true)",this,this.OnGame_Crosshair_SetBlink,[true]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Crosshair_SetBlink(false)",this,this.OnGame_Crosshair_SetBlink,[false])]);
      this.init();
   }
   function uiLoadComplete()
   {
      this.processFirst();
   }
   function init()
   {
      this.setLockData = {};
      this.setLockData.lock = true;
      this.setLockData.count = 1;
   }
   function processFirst()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventChangeUIMode",true);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventChangeUIMode",false);
      this.OnGame_Crosshair_Name("NORMAL");
      this.OnGame_Crosshair_Position(50,44);
      this.OnGame_Crosshair_Level(5);
      this.OnGame_Crosshair_Distance(10);
   }
   function setData_setLock(name, value)
   {
      this.setLockData[name] = value;
      this.OnGame_Crosshair_SetLock(this.setLockData.lock,this.setLockData.count);
   }
   function OnGame_Crosshair_Name(type)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Crosshair_Name",type);
   }
   function OnGame_Crosshair_Style(style)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Crosshair_Style",style);
   }
   function OnGame_Crosshair_Aimed(bFlag)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Crosshair_Aimed",bFlag);
   }
   function OnGame_Crosshair_Hit()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent();
   }
   function OnGame_Crosshair_Position(x, y)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Crosshair_Position",x,y);
   }
   function OnGame_Crosshair_Distance(distance)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Crosshair_Distance",distance);
   }
   function OnGame_Crosshair_Level(level)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Crosshair_Level",level);
   }
   function OnGame_Crosshair_SetLock(bTrue, lockedNum)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Crosshair_SetLock",bTrue,lockedNum);
   }
   function OnGame_Crosshair_SetBlink(bTrue)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Crosshair_SetBlink",bTrue);
   }
}
