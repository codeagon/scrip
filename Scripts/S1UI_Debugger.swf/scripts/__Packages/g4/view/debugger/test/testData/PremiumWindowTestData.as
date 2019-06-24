class g4.view.debugger.test.testData.PremiumWindowTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function PremiumWindowTestData()
   {
      super(g4.view.ViewID.PREMIUM_SLOT_PANEL,"프리미엄 혜택",[new g4.view.debugger.test.testData.TestDataModel("혜택 목록 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("사용불가 O",this,this.setBenefitData,["impossible",true]),new g4.view.debugger.test.testData.TestDataModel("사용불가 X",this,this.setBenefitData,["impossible",false]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("그룹1 0",this,this.setBenefitData,["count1",0]),new g4.view.debugger.test.testData.TestDataModel("그룹1 5",this,this.setBenefitData,["count1",5]),new g4.view.debugger.test.testData.TestDataModel("그룹1 15",this,this.setBenefitData,["count1",15]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("그룹2 0",this,this.setBenefitData,["count2",0]),new g4.view.debugger.test.testData.TestDataModel("그룹2 5",this,this.setBenefitData,["count2",5]),new g4.view.debugger.test.testData.TestDataModel("그룹2 15",this,this.setBenefitData,["count2",15])]),new g4.view.debugger.test.testData.TestDataModel("혜택 목록 강조 설정(하단)",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("그룹1 X",this,this.setHighlightIDList,["count1",null]),new g4.view.debugger.test.testData.TestDataModel("그룹1 0, 1",this,this.setHighlightIDList,["count1",[0,1]]),new g4.view.debugger.test.testData.TestDataModel("그룹1 3, 6, 9",this,this.setHighlightIDList,["count1",[3,6,9]]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("그룹2 X",this,this.setHighlightIDList,["count2",null]),new g4.view.debugger.test.testData.TestDataModel("그룹2 2, 3",this,this.setHighlightIDList,["count2",[102,103]]),new g4.view.debugger.test.testData.TestDataModel("그룹2 6, 7, 8",this,this.setHighlightIDList,["count2",[106,107,108]])]),new g4.view.debugger.test.testData.TestDataModel("대상 ID 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0",this,this.setTestValue,["data_1","id",0]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.setTestValue,["data_1","id",1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.setTestValue,["data_1","id",2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.setTestValue,["data_1","id",3]),new g4.view.debugger.test.testData.TestDataModel("4",this,this.setTestValue,["data_1","id",4]),new g4.view.debugger.test.testData.TestDataModel("5",this,this.setTestValue,["data_1","id",5]),new g4.view.debugger.test.testData.TestDataModel("6",this,this.setTestValue,["data_1","id",6]),new g4.view.debugger.test.testData.TestDataModel("7",this,this.setTestValue,["data_1","id",7]),new g4.view.debugger.test.testData.TestDataModel("8",this,this.setTestValue,["data_1","id",8]),new g4.view.debugger.test.testData.TestDataModel("9",this,this.setTestValue,["data_1","id",9]),new g4.view.debugger.test.testData.TestDataModel("10",this,this.setTestValue,["data_1","id",10])]),new g4.view.debugger.test.testData.TestDataModel("쿨타임 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("3000, 20000",this,this.setCoolTime,[3000,20000]),new g4.view.debugger.test.testData.TestDataModel("10000, 20000",this,this.setCoolTime,[10000,20000]),new g4.view.debugger.test.testData.TestDataModel("15000, 20000",this,this.setCoolTime,[15000,20000]),new g4.view.debugger.test.testData.TestDataModel("20000, 20000",this,this.setCoolTime,[20000,20000]),new g4.view.debugger.test.testData.TestDataModel("0, 0",this,this.setCoolTime,[0,0])]),new g4.view.debugger.test.testData.TestDataModel("쿨타임 설정(전체)",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("3000, 20000",this,this.setCoolTimeAll,[3000,20000]),new g4.view.debugger.test.testData.TestDataModel("10000, 20000",this,this.setCoolTimeAll,[10000,20000]),new g4.view.debugger.test.testData.TestDataModel("15000, 20000",this,this.setCoolTimeAll,[15000,20000]),new g4.view.debugger.test.testData.TestDataModel("20000, 20000",this,this.setCoolTimeAll,[20000,20000]),new g4.view.debugger.test.testData.TestDataModel("0, 0",this,this.setCoolTimeAll,[0,0])]),new g4.view.debugger.test.testData.TestDataModel("슬롯 등록 상태 O",this,this.setSlotToggle,[true]),new g4.view.debugger.test.testData.TestDataModel("슬롯 등록 상태 X",this,this.setSlotToggle,[false])]);
      this.init();
   }
   function init()
   {
      this.setTestValue("data_1","id",0);
      this.setTestValue("benefitData","count1",0);
      this.setTestValue("benefitData","count2",0);
      this.setTestValue("benefitHighlight","count1",null);
      this.setTestValue("benefitHighlight","count2",null);
   }
   function setBenefitData(key, value)
   {
      lib.Debuger.trace("g4.view.debugger.test.testData.PremiumWindowTestData.setBenefitData > key : " + key + ", value : " + value);
      this.setTestValue("benefitData",key,value);
      this.showBenefitData();
   }
   function showBenefitData()
   {
      var _loc4_ = this.getTestValue("benefitData","count1");
      var _loc2_ = this.getTestValue("benefitData","count2");
      var _loc3_ = this.generateBenefitDataList(_loc4_,0);
      var _loc5_ = this.generateBenefitDataList(_loc2_,100);
      this.OnGame_PremiumWindow_SetBenefitData(_loc3_,_loc5_);
   }
   function setHighlightIDList(key, count)
   {
      this.setTestValue("benefitHighlight",key,count);
      var _loc4_ = this.getTestValue("benefitHighlight","count1");
      var _loc3_ = this.getTestValue("benefitHighlight","count2");
      var _loc2_ = [];
      if(_loc4_ != null && _loc4_.length > 0)
      {
         _loc2_ = _loc2_.concat(_loc4_);
      }
      if(_loc3_ != null && _loc3_.length > 0)
      {
         _loc2_ = _loc2_.concat(_loc3_);
      }
      var _loc5_ = _loc2_.length <= 0?"":_loc2_.join("\t");
      this.OnGame_PremiumWindow_SetHighlightIDList(_loc5_);
   }
   function generateBenefitDataList($count, $firstID)
   {
      var _loc10_ = ["img://__Icon_Items.FireWorks_Ding_Exclam_Tex","img://__Icon_Items.fallfestival_coin_Tex","img://__Icon_Items.Union_Collect3_Tex"];
      var _loc11_ = [];
      var _loc2_ = undefined;
      var _loc3_ = 0;
      while(_loc3_ < $count)
      {
         var _loc4_ = $firstID + _loc3_;
         var _loc6_ = _loc10_[_loc3_ % _loc10_.length];
         var _loc5_ = "name_" + _loc4_;
         var _loc7_ = this.randRange(1,999);
         var _loc8_ = this.getTestValue("benefitData","impossible");
         var _loc9_ = this.randRange(0,3);
         _loc2_ = [];
         _loc2_.push(_loc4_);
         _loc2_.push(_loc6_);
         _loc2_.push(_loc5_);
         _loc2_.push(_loc7_);
         _loc2_.push(_loc8_);
         _loc2_.push(_loc9_);
         _loc11_.push(_loc2_.join("\t"));
         _loc3_ = _loc3_ + 1;
      }
      return _loc11_.length != 0?_loc11_.join("\n"):null;
   }
   function _setCoolTime(id, remainingTime, totalTime)
   {
      this.OnGame_PremiumWindow_CoolTime(id,remainingTime,totalTime);
   }
   function setCoolTime(remainingTime, totalTime)
   {
      this._setCoolTime(this.getTestValue("data_1","id"),remainingTime,totalTime);
   }
   function setCoolTimeAll(remainingTime, totalTime)
   {
      var _loc2_ = 0;
      while(_loc2_ < 16)
      {
         this._setCoolTime(_loc2_,remainingTime,totalTime);
         this._setCoolTime(100 + _loc2_,remainingTime,totalTime);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setSlotToggle(registered)
   {
      this.OnGame_PremiumWindow_SetToggle(this.getTestValue("data_1","id"),registered);
   }
   function OnGame_PremiumWindow_SetBenefitData(dataList1, dataList2)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PremiumWindow_SetBenefitData",dataList1,dataList2);
   }
   function OnGame_PremiumWindow_SetHighlightIDList(idList)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PremiumWindow_SetHighlightIDList",idList);
   }
   function OnGame_PremiumWindow_CoolTime(id, remainingTime, totalTime)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PremiumWindow_CoolTime",id,remainingTime,totalTime);
   }
   function OnGame_PremiumWindow_SetToggle(id, isActive)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PremiumWindow_SetToggle",id,isActive);
   }
}
