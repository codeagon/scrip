class g4.view.debugger.test.testData.QuestTaskInfoTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function QuestTaskInfoTestData()
   {
      super(g4.view.ViewID.QUEST_TASK_INFO,null,[new g4.view.debugger.test.testData.TestDataModel("더미 데이터 설정 1",this,this.setDummyData1),new g4.view.debugger.test.testData.TestDataModel("더미 데이터 설정 2",this,this.setDummyData2),new g4.view.debugger.test.testData.TestDataModel("OnGame_QuestTaskInfo_FieldEventOnOff",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("true",this,this.OnGame_QuestTaskInfo_FieldEventOnOff,[true]),new g4.view.debugger.test.testData.TestDataModel("false",this,this.OnGame_QuestTaskInfo_FieldEventOnOff,[false])])]);
   }
   function uiLoadComplete()
   {
      this.setDummyData1();
   }
   function setDummyData1()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_QuestTaskInfo_AddQuestInfo","1\t1\t3\t000000\t0\t1\t0\t0\t1\t\x01\t2\t0\t1","아우이거머진짜이름긴아이템인데이것좀모아와야쓰것다~\t100\t100\t1\n왜삭제는안되는것인가\t100\t100\t1",0,0);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_QuestTaskInfo_UpdateList","0\t1\t2");
   }
   function setDummyData2()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_QuestTaskInfo_UpdateList","0\t1\t2\n1\t0\t1\n2\t2\t3");
   }
   function OnGame_QuestTaskInfo_FieldEventOnOff(bOn)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_QuestTaskInfo_FieldEventOnOff",bOn);
   }
}
