class g4.view.debugger.test.testData.AbnormalityOptionTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function AbnormalityOptionTestData()
   {
      super(g4.view.ViewID.ABNORMALITY_OPTION,"내 이상상태 설정",[new g4.view.debugger.test.testData.TestDataModel("기타 이상상태 간략 보기 O",this,this.setOption,["other",true]),new g4.view.debugger.test.testData.TestDataModel("기타 이상상태 간략 보기 X",this,this.setOption,["other",false]),new g4.view.debugger.test.testData.TestDataModel("전투 소모품 이상상태 간략 보기 O",this,this.setOption,["battleConsumable",true]),new g4.view.debugger.test.testData.TestDataModel("전투 소모품 이상상태 간략 보기 X",this,this.setOption,["battleConsumable",false]),new g4.view.debugger.test.testData.TestDataModel("스킬/문장 이상상태 간략 보기 O",this,this.setOption,["skillAndGlyph",true]),new g4.view.debugger.test.testData.TestDataModel("스킬/문장 이상상태 간략 보기 X",this,this.setOption,["skillAndGlyph",false])]);
      this.init();
   }
   function init()
   {
      this.data = {};
      this.data.other = false;
      this.data.battleConsumable = false;
      this.data.skillAndGlyph = false;
   }
   function setOption(name, value)
   {
      this.data[name] = value;
      this.OnGame_AbnormalityOption_SetOption(this.data.other,this.data.battleConsumable,this.data.skillAndGlyph);
   }
   function OnGame_AbnormalityOption_SetOption(other, battleConsumable, skillAndGlyph)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_AbnormalityOption_SetOption",other,battleConsumable,skillAndGlyph);
   }
}
