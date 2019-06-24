class g4.view.debugger.test.testData.BFMatchingProcessTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function BFMatchingProcessTestData()
   {
      super(g4.view.ViewID.BF_MATCHING_PROCESS,"매칭 신청 확인",[new g4.view.debugger.test.testData.TestDataModel("기본 데이터 설정(제목, 버튼 등)",this,this.setDummyData),new g4.view.debugger.test.testData.TestDataModel("전장 목록 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0",this,this.setBattleFieldList,[0]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.setBattleFieldList,[1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.setBattleFieldList,[2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.setBattleFieldList,[3]),new g4.view.debugger.test.testData.TestDataModel("10",this,this.setBattleFieldList,[10]),new g4.view.debugger.test.testData.TestDataModel("20",this,this.setBattleFieldList,[20])]),new g4.view.debugger.test.testData.TestDataModel("크리스탈 옵션",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("O",this,this.OnGame_BFMatchingProcess_SetCrystalOptionVisible,[true]),new g4.view.debugger.test.testData.TestDataModel("X",this,this.OnGame_BFMatchingProcess_SetCrystalOptionVisible,[false])]),new g4.view.debugger.test.testData.TestDataModel("동행파티원정보",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0",this,this.setPartyMember,[0]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.setPartyMember,[1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.setPartyMember,[2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.setPartyMember,[3]),new g4.view.debugger.test.testData.TestDataModel("4",this,this.setPartyMember,[4]),new g4.view.debugger.test.testData.TestDataModel("5",this,this.setPartyMember,[5])]),new g4.view.debugger.test.testData.TestDataModel("예상 대기 시간",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("없음",this,this.setRemainTime,[null]),new g4.view.debugger.test.testData.TestDataModel("30분",this,this.setRemainTime,["30분"]),new g4.view.debugger.test.testData.TestDataModel("1시간",this,this.setRemainTime,["1시간"]),new g4.view.debugger.test.testData.TestDataModel("1시간30분",this,this.setRemainTime,["1시간30분"])]),new g4.view.debugger.test.testData.TestDataModel("진행 시간",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("없음",this,this.setProgressTime,[null]),new g4.view.debugger.test.testData.TestDataModel("30분",this,this.setProgressTime,["30분"]),new g4.view.debugger.test.testData.TestDataModel("1시간",this,this.setProgressTime,["1시간"]),new g4.view.debugger.test.testData.TestDataModel("1시간30분",this,this.setProgressTime,["1시간30분"])]),new g4.view.debugger.test.testData.TestDataModel("파티장 지원 여부",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("정보없음",this,this.OnGame_BFMatchingProcess_PartyMasterAgree,[""]),new g4.view.debugger.test.testData.TestDataModel("username/지원없음",this,this.OnGame_BFMatchingProcess_PartyMasterAgree,["username/지원없음"]),new g4.view.debugger.test.testData.TestDataModel("username/지원있음",this,this.OnGame_BFMatchingProcess_PartyMasterAgree,["username/지원있음"])])]);
      this.init();
   }
   function init()
   {
   }
   function setDummyData()
   {
      var _loc2_ = "전장 파티 매칭 신청 확인";
      var _loc4_ = 1;
      var _loc6_ = "신청";
      var _loc3_ = 2;
      var _loc5_ = "취소";
      this.OnGame_BFMatchingProcess_SetDisplay(_loc2_,_loc4_,_loc6_,_loc3_,_loc5_);
   }
   function setBattleFieldList(count)
   {
      var _loc6_ = undefined;
      if(count > 0)
      {
         var _loc4_ = [];
         var _loc3_ = undefined;
         var _loc5_ = count;
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            var _loc2_ = [];
            _loc2_.push(this.randRange(1,65));
            _loc2_.push("전장_" + _loc3_);
            _loc4_.push(_loc2_.join("\t"));
            _loc3_ = _loc3_ + 1;
         }
         _loc6_ = _loc4_.join("\n");
      }
      this.OnGame_BFMatchingProcess_BFList(_loc6_);
   }
   function setRemainTime(value)
   {
      this.setTestValue("time","remainTime",value);
      this.setTime();
   }
   function setProgressTime(value)
   {
      this.setTestValue("time","progressTime",value);
      this.setTime();
   }
   function setTime()
   {
      var _loc2_ = this.getTestValue("time","remainTime");
      var _loc3_ = this.getTestValue("time","progressTime");
      this.OnGame_BFMatchingProcess_SetProcessTime(_loc2_,_loc3_);
   }
   function setPartyMember(count)
   {
      var _loc5_ = undefined;
      if(count > 0)
      {
         var _loc3_ = [];
         var _loc2_ = undefined;
         var _loc4_ = count;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc3_.push("username_" + _loc2_);
            _loc2_ = _loc2_ + 1;
         }
         _loc5_ = _loc3_.join("\t");
      }
      this.OnGame_BFMatchingProcess_PartyMember(_loc5_);
   }
   function OnGame_BFMatchingProcess_PartyMember(members)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFMatchingProcess_PartyMember",members);
   }
   function OnGame_BFMatchingProcess_PartyMasterAgree(data)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFMatchingProcess_PartyMasterAgree",data);
   }
   function OnGame_BFMatchingProcess_SetProcessTime(remaintime, progresstime)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFMatchingProcess_SetProcessTime",remaintime,progresstime);
   }
   function OnGame_BFMatchingProcess_SetDisplay(title, btn0_Id, btn0_Name, btn1_Id, btn1_Name)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFMatchingProcess_SetDisplay",title,btn0_Id,btn0_Name,btn1_Id,btn1_Name);
   }
   function OnGame_BFMatchingProcess_BFList(data)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFMatchingProcess_BFList",data);
   }
   function OnGame_BFMatchingProcess_SetCrystalOptionVisible(bVisible)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFMatchingProcess_SetCrystalOptionVisible",bVisible);
   }
}
