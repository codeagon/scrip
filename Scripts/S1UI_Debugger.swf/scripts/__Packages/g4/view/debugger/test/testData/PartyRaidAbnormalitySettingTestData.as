class g4.view.debugger.test.testData.PartyRaidAbnormalitySettingTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   var OPTION_TYPE = 0;
   var OPTION_CHECK_1 = 1;
   var OPTION_CHECK_2 = 2;
   var OPTION_CHECK_3 = 3;
   var OPTION_CHECK_4 = 4;
   var OPTION_CHECK_5 = 5;
   function PartyRaidAbnormalitySettingTestData()
   {
      super(g4.view.ViewID.PARTY_RAID_ABNORMALITY_SETTING,"공격대 이상상태 설정",[new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("0=간략보기",this,this.setOptionValue,[this.OPTION_TYPE,0]),new g4.view.debugger.test.testData.TestDataModel("1=상세보기",this,this.setOptionValue,[this.OPTION_TYPE,1]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("스킬/문장 O",this,this.setOptionValue,[this.OPTION_CHECK_1,true]),new g4.view.debugger.test.testData.TestDataModel("스킬/문장 X",this,this.setOptionValue,[this.OPTION_CHECK_1,false]),new g4.view.debugger.test.testData.TestDataModel("전투 소모품 O",this,this.setOptionValue,[this.OPTION_CHECK_2,true]),new g4.view.debugger.test.testData.TestDataModel("전투 소모품 X",this,this.setOptionValue,[this.OPTION_CHECK_2,false]),new g4.view.debugger.test.testData.TestDataModel("모든 해로운 O",this,this.setOptionValue,[this.OPTION_CHECK_3,true]),new g4.view.debugger.test.testData.TestDataModel("모든 해로운 X",this,this.setOptionValue,[this.OPTION_CHECK_3,false]),new g4.view.debugger.test.testData.TestDataModel("해제 가능한 해로운 O",this,this.setOptionValue,[this.OPTION_CHECK_4,true]),new g4.view.debugger.test.testData.TestDataModel("해제 가능한 해로운 X",this,this.setOptionValue,[this.OPTION_CHECK_4,false]),new g4.view.debugger.test.testData.TestDataModel("내 파티 간략 O",this,this.setOptionValue,[this.OPTION_CHECK_5,true]),new g4.view.debugger.test.testData.TestDataModel("내 파티 간략 X",this,this.setOptionValue,[this.OPTION_CHECK_5,false])]);
      this.optionValueMap = {};
      this._setOptionValue(this.OPTION_TYPE,0);
      this._setOptionValue(this.OPTION_CHECK_1,false);
      this._setOptionValue(this.OPTION_CHECK_2,false);
      this._setOptionValue(this.OPTION_CHECK_3,false);
      this._setOptionValue(this.OPTION_CHECK_4,false);
      this._setOptionValue(this.OPTION_CHECK_5,false);
   }
   function setOptionValue(type, value)
   {
      this._setOptionValue(type,value);
      this.setOption();
   }
   function _setOptionValue(type, value)
   {
      this.optionValueMap[type] = value;
   }
   function _getOptionValue(type)
   {
      return this.optionValueMap[type];
   }
   function setOption()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyRaidAbnormalitySetting_SetOption",this._getOptionValue(this.OPTION_TYPE),this._getOptionValue(this.OPTION_CHECK_1),this._getOptionValue(this.OPTION_CHECK_2),this._getOptionValue(this.OPTION_CHECK_3),this._getOptionValue(this.OPTION_CHECK_4),this._getOptionValue(this.OPTION_CHECK_5));
   }
}
