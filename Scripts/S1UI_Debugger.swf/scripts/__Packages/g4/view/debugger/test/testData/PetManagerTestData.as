class g4.view.debugger.test.testData.PetManagerTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function PetManagerTestData()
   {
      super(g4.view.ViewID.PET_MANAGER,"펫",[new g4.view.debugger.test.testData.TestDataModel("펫 정보 설정(이름, 설명)",this,this.setPetData),new g4.view.debugger.test.testData.TestDataModel("펫 기력 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0/100",this,this.OnGame_PetManager_Energy,[0,100]),new g4.view.debugger.test.testData.TestDataModel("10/100",this,this.OnGame_PetManager_Energy,[10,100]),new g4.view.debugger.test.testData.TestDataModel("20/100",this,this.OnGame_PetManager_Energy,[20,100]),new g4.view.debugger.test.testData.TestDataModel("30/100",this,this.OnGame_PetManager_Energy,[30,100]),new g4.view.debugger.test.testData.TestDataModel("50/100",this,this.OnGame_PetManager_Energy,[50,100]),new g4.view.debugger.test.testData.TestDataModel("1000/100",this,this.OnGame_PetManager_Energy,[100,100])]),new g4.view.debugger.test.testData.TestDataModel("펫 스킬 슬롯 데이터 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("슬롯인덱스 0",this,this.setUpdateSlot,["slotIndex",0]),new g4.view.debugger.test.testData.TestDataModel("슬롯인덱스 1",this,this.setUpdateSlot,["slotIndex",1]),new g4.view.debugger.test.testData.TestDataModel("슬롯인덱스 2",this,this.setUpdateSlot,["slotIndex",2]),new g4.view.debugger.test.testData.TestDataModel("슬롯인덱스 3",this,this.setUpdateSlot,["slotIndex",3]),new g4.view.debugger.test.testData.TestDataModel("슬롯인덱스 4",this,this.setUpdateSlot,["slotIndex",4]),new g4.view.debugger.test.testData.TestDataModel("슬롯인덱스 5",this,this.setUpdateSlot,["slotIndex",5]),new g4.view.debugger.test.testData.TestDataModel("슬롯인덱스 6",this,this.setUpdateSlot,["slotIndex",6]),new g4.view.debugger.test.testData.TestDataModel("슬롯인덱스 7",this,this.setUpdateSlot,["slotIndex",7]),new g4.view.debugger.test.testData.TestDataModel("스킬타입 0=단독사용",this,this.setUpdateSlot,["skillType",0]),new g4.view.debugger.test.testData.TestDataModel("스킬타입 1=액티브",this,this.setUpdateSlot,["skillType",1]),new g4.view.debugger.test.testData.TestDataModel("스킬타입 2=패시브",this,this.setUpdateSlot,["skillType",2]),new g4.view.debugger.test.testData.TestDataModel("skillID 100",this,this.setUpdateSlot,["skillID",100]),new g4.view.debugger.test.testData.TestDataModel("skillID 200",this,this.setUpdateSlot,["skillID",200]),new g4.view.debugger.test.testData.TestDataModel("skillID 300",this,this.setUpdateSlot,["skillID",300]),new g4.view.debugger.test.testData.TestDataModel("image a",this,this.setUpdateSlot,["image","img://a.png"]),new g4.view.debugger.test.testData.TestDataModel("image b",this,this.setUpdateSlot,["image","img://b.png"]),new g4.view.debugger.test.testData.TestDataModel("image c",this,this.setUpdateSlot,["image","img://c.png"]),new g4.view.debugger.test.testData.TestDataModel("skillName 스킬이름_100",this,this.setUpdateSlot,["skillName","스킬이름_100"]),new g4.view.debugger.test.testData.TestDataModel("skillName 스킬이름_200",this,this.setUpdateSlot,["skillName","스킬이름_200"]),new g4.view.debugger.test.testData.TestDataModel("skillName 스킬이름_300",this,this.setUpdateSlot,["skillName","스킬이름_300"]),new g4.view.debugger.test.testData.TestDataModel("remainingTime NaN",this,this.setUpdateSlot,["remainingTime",NaN]),new g4.view.debugger.test.testData.TestDataModel("remainingTime 0",this,this.setUpdateSlot,["remainingTime",0]),new g4.view.debugger.test.testData.TestDataModel("remainingTime 1000",this,this.setUpdateSlot,["remainingTime",1000]),new g4.view.debugger.test.testData.TestDataModel("remainingTime 5000",this,this.setUpdateSlot,["remainingTime",5000]),new g4.view.debugger.test.testData.TestDataModel("remainingTime 50000",this,this.setUpdateSlot,["remainingTime",50000]),new g4.view.debugger.test.testData.TestDataModel("totalTime NaN",this,this.setUpdateSlot,["totalTime",NaN]),new g4.view.debugger.test.testData.TestDataModel("totalTime 0",this,this.setUpdateSlot,["totalTime",0]),new g4.view.debugger.test.testData.TestDataModel("totalTime 1000",this,this.setUpdateSlot,["totalTime",1000]),new g4.view.debugger.test.testData.TestDataModel("totalTime 5000",this,this.setUpdateSlot,["totalTime",5000]),new g4.view.debugger.test.testData.TestDataModel("totalTime 10000",this,this.setUpdateSlot,["totalTime",10000]),new g4.view.debugger.test.testData.TestDataModel("totalTime 50000",this,this.setUpdateSlot,["totalTime",50000])]),new g4.view.debugger.test.testData.TestDataModel("스킬 활성화 O",this,this.setSkillEnabled,[true]),new g4.view.debugger.test.testData.TestDataModel("스킬 활성화 X",this,this.setSkillEnabled,[false]),new g4.view.debugger.test.testData.TestDataModel("스킬 쿨타임 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0 / 0",this,this.setCoolTime,[0,0]),new g4.view.debugger.test.testData.TestDataModel("0 / 10000",this,this.setCoolTime,[0,10000]),new g4.view.debugger.test.testData.TestDataModel("1000 / 10000",this,this.setCoolTime,[1000,10000]),new g4.view.debugger.test.testData.TestDataModel("2000 / 10000",this,this.setCoolTime,[2000,10000]),new g4.view.debugger.test.testData.TestDataModel("5000 / 10000",this,this.setCoolTime,[5000,10000]),new g4.view.debugger.test.testData.TestDataModel("10000 / 10000",this,this.setCoolTime,[10000,10000])]),new g4.view.debugger.test.testData.TestDataModel("toggle O",this,this.setToggle,[true]),new g4.view.debugger.test.testData.TestDataModel("toggle X",this,this.setToggle,[false]),new g4.view.debugger.test.testData.TestDataModel("disabled O",this,this.OnGame_PetManager_SetDisable,[true]),new g4.view.debugger.test.testData.TestDataModel("disabled X",this,this.OnGame_PetManager_SetDisable,[false]),new g4.view.debugger.test.testData.TestDataModel("기간제 O",this,this.setTerm,[true]),new g4.view.debugger.test.testData.TestDataModel("기간제 X",this,this.setTerm,[false])]);
      this.init();
   }
   function init()
   {
      this.setTestValue("data_1","slotIndex",0);
      this.setTestValue("data_1","skillType",0);
      this.setTestValue("data_1","skillID",100);
      this.setTestValue("data_1","image","img://dummy.png");
      this.setTestValue("data_1","skillName","스킬이름_100");
      this.setTestValue("data_1","remainingTime",5000);
      this.setTestValue("data_1","totalTime",10000);
   }
   function setPetData()
   {
      var _loc3_ = "펫 이름 " + this.randRange(0,999);
      var _loc2_ = "펫 설명 " + this.randRange(0,999);
      this.OnGame_PetManager_SetPetData(_loc3_,_loc2_);
   }
   function setUpdateSlot(propName, value)
   {
      this.setTestValue("data_1",propName,value);
      this._setUpdateSlot();
   }
   function _setUpdateSlot()
   {
      var _loc2_ = this.getTestValue("data_1","slotIndex");
      var _loc3_ = this.getTestValue("data_1","skillType");
      var _loc6_ = this.getTestValue("data_1","skillID");
      var _loc4_ = this.getTestValue("data_1","image");
      var _loc7_ = this.getTestValue("data_1","skillName");
      var _loc5_ = this.getTestValue("data_1","remainingTime");
      var _loc8_ = this.getTestValue("data_1","totalTime");
      this.OnGame_PetManager_SetUpdateSlot(_loc2_,_loc3_,_loc6_,_loc4_,_loc7_,_loc5_,_loc8_);
   }
   function setToggle(value)
   {
      var _loc2_ = this.getTestValue("data_1","skillID");
      this.OnGame_PetManager_SetToggle(_loc2_,value);
   }
   function setTerm(isTerm)
   {
      var _loc2_ = this.randRange(2020,2050) + "년 " + this.randRange(1,12) + "월 까지";
      this.OnGame_PetManager_SetTerm(isTerm,_loc2_);
   }
   function setSkillEnabled(enabled)
   {
      var _loc2_ = this.getTestValue("data_1","skillID");
      this.OnGameEventSetSkillEnable(_loc2_,enabled);
   }
   function setCoolTime(remainingTime, totalTime)
   {
      var _loc2_ = this.getTestValue("data_1","skillID");
      this.OnGameEventSetSkillCoolTime(_loc2_,remainingTime,totalTime);
   }
   function OnGame_PetManager_SetPetData(petName, petGuide)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PetManager_SetPetData",petName,petGuide);
   }
   function OnGame_PetManager_Energy(currentEnergy, maxEnergy)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PetManager_Energy",currentEnergy,maxEnergy);
   }
   function OnGame_PetManager_SetUpdateSlot(slotIndex, skillType, skillID, image, skillName, remainingTime, totalTime)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PetManager_SetUpdateSlot",slotIndex,skillType,skillID,image,skillName,remainingTime,totalTime);
   }
   function OnGame_PetManager_SetToggle(skillID, toggleOn)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PetManager_SetToggle",skillID,toggleOn);
   }
   function OnGame_PetManager_SetDisable(disable)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PetManager_SetDisable",disable);
   }
   function OnGame_PetManager_SetTerm(isTermPet, date)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PetManager_SetTerm",isTermPet,date);
   }
   function OnGameEventSetSkillEnable(skillID, bEnable)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventSetSkillEnable",skillID,bEnable);
   }
   function OnGameEventSetSkillCoolTime(skillID, remainingTime, totalTime)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventSetSkillCoolTime",skillID,remainingTime,totalTime);
   }
}
