class g4.view.debugger.test.testData.PartyAbnormalitySettingTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   var _setOption_value = {type:0,other:true,battle:true,skill:true};
   function PartyAbnormalitySettingTestData()
   {
      super(g4.view.ViewID.PARTY_ABNORMALITY_SETTING,"파티 이상상태 설정",[new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("0=중요정보만보기",this,this.setOption_value,["type",0]),new g4.view.debugger.test.testData.TestDataModel("1=모두보기",this,this.setOption_value,["type",1]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("기타 O",this,this.setOption_value,["other",true]),new g4.view.debugger.test.testData.TestDataModel("기타 X",this,this.setOption_value,["other",false]),new g4.view.debugger.test.testData.TestDataModel("전투 O",this,this.setOption_value,["battle",true]),new g4.view.debugger.test.testData.TestDataModel("전투 X",this,this.setOption_value,["battle",false]),new g4.view.debugger.test.testData.TestDataModel("스킬 O",this,this.setOption_value,["skill",true]),new g4.view.debugger.test.testData.TestDataModel("스킬 X",this,this.setOption_value,["skill",false])]);
   }
   function setOption_value(type, value)
   {
      this._setOption_value[type] = value;
      this.setOption();
   }
   function setOption()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyAbnormalitySetting_SetOption",this._setOption_value.type,this._setOption_value.other,this._setOption_value.battle,this._setOption_value.skill);
   }
}
