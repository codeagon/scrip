class g4.view.debugger.test.testData.PartyLootingSettingTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   var distributionType = 0;
   var highGrade = false;
   var highGradeDistributionType = 1;
   var equipItem = false;
   var possibleClassOnly = false;
   var dice = false;
   var noLootingOnBattleMode = false;
   function PartyLootingSettingTestData()
   {
      super(g4.view.ViewID.PARTY_LOOTING_SETTING,"파티 분배 설정",[new g4.view.debugger.test.testData.TestDataModel("데이터 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=자유획득",this,this.setValue,["distributionType",0]),new g4.view.debugger.test.testData.TestDataModel("1=순차분배",this,this.setValue,["distributionType",1]),new g4.view.debugger.test.testData.TestDataModel("높은 등급 다른 방식으로 분배 O",this,this.setValue,["highGrade",1]),new g4.view.debugger.test.testData.TestDataModel("높은 등급 다른 방식으로 분배 X",this,this.setValue,["highGrade",0]),new g4.view.debugger.test.testData.TestDataModel("높은 등급 분배 방식 1=랜덤분배",this,this.setValue,["highGradeDistributionType",1]),new g4.view.debugger.test.testData.TestDataModel("높은 등급 분배 방식 2=주사위굴림",this,this.setValue,["highGradeDistributionType",2]),new g4.view.debugger.test.testData.TestDataModel("장비 아이템 무조건 O",this,this.setValue,["equipItem",true]),new g4.view.debugger.test.testData.TestDataModel("장비 아이템 무조건 X",this,this.setValue,["equipItem",false]),new g4.view.debugger.test.testData.TestDataModel("사용 가능 클래스만 O",this,this.setValue,["possibleClassOnly",true]),new g4.view.debugger.test.testData.TestDataModel("사용 가능 클래스만 X",this,this.setValue,["possibleClassOnly",false]),new g4.view.debugger.test.testData.TestDataModel("귀속 아이템 주사위 굴림 O",this,this.setValue,["dice",true]),new g4.view.debugger.test.testData.TestDataModel("귀속 아이템 주사위 굴림 X",this,this.setValue,["dice",false]),new g4.view.debugger.test.testData.TestDataModel("전투 상태 루팅 금지 O",this,this.setValue,["noLootingOnBattleMode",true]),new g4.view.debugger.test.testData.TestDataModel("전투 상태 루팅 금지 X",this,this.setValue,["noLootingOnBattleMode",false])])]);
   }
   function setValue(propName, value)
   {
      this[propName] = value;
      this.OnGame_PartyLootingSetting_SetOption();
   }
   function OnGame_PartyLootingSetting_SetOption()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyLootingSetting_SetOption",this.distributionType,this.highGrade,this.highGradeDistributionType,this.equipItem,this.possibleClassOnly,this.dice,this.noLootingOnBattleMode);
   }
}
