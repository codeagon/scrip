class g4.view.debugger.test.testData.RankAroundTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   var scoreCount = 0;
   function RankAroundTestData()
   {
      super(g4.view.ViewID.RANK_AROUND,null,[new g4.view.debugger.test.testData.TestDataModel("더미 데이터 설정",this,this.setDummyData),new g4.view.debugger.test.testData.TestDataModel("획득 점수 항목 개수 설정",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("0",this,this.OnGame_RankAround_SetScoreTitle,[0]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.OnGame_RankAround_SetScoreTitle,[1]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.OnGame_RankAround_SetScoreTitle,[3]),new g4.view.debugger.test.testData.TestDataModel("10",this,this.OnGame_RankAround_SetScoreTitle,[10])]),new g4.view.debugger.test.testData.TestDataModel("획득 점수 설정",this,this.OnGame_RankAround_SetScoreValue),new g4.view.debugger.test.testData.TestDataModel("순위 정보 설정.",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("1위",this,this.OnGame_RankAround_SetRankList,[1]),new g4.view.debugger.test.testData.TestDataModel("2위",this,this.OnGame_RankAround_SetRankList,[2]),new g4.view.debugger.test.testData.TestDataModel("3위",this,this.OnGame_RankAround_SetRankList,[3]),new g4.view.debugger.test.testData.TestDataModel("4위",this,this.OnGame_RankAround_SetRankList,[4]),new g4.view.debugger.test.testData.TestDataModel("5위",this,this.OnGame_RankAround_SetRankList,[5]),new g4.view.debugger.test.testData.TestDataModel("6위",this,this.OnGame_RankAround_SetRankList,[6])]),new g4.view.debugger.test.testData.TestDataModel("순위 정보 설정.",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("0건",this,this.OnGame_RankAround_SetRankList2,[0]),new g4.view.debugger.test.testData.TestDataModel("3건",this,this.OnGame_RankAround_SetRankList2,[3])]),new g4.view.debugger.test.testData.TestDataModel("시간 관련",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("OnGame_BFScoreBoard_SetBattleState",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("-1=대기중",this,this.OnGame_BFScoreBoard_SetBattleState,[-1]),new g4.view.debugger.test.testData.TestDataModel("0=전투중",this,this.OnGame_BFScoreBoard_SetBattleState,[0]),new g4.view.debugger.test.testData.TestDataModel("1=내팀우승",this,this.OnGame_BFScoreBoard_SetBattleState,[1]),new g4.view.debugger.test.testData.TestDataModel("2=내팀패배",this,this.OnGame_BFScoreBoard_SetBattleState,[2]),new g4.view.debugger.test.testData.TestDataModel("3=무승부",this,this.OnGame_BFScoreBoard_SetBattleState,[3])]),new g4.view.debugger.test.testData.TestDataModel("OnGame_BFScoreBoard_SetTimer",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("랜덤",this,this.OnGame_BFScoreBoard_SetTimer),new g4.view.debugger.test.testData.TestDataModel("10",this,this.OnGame_BFScoreBoard_SetTimer,[10]),new g4.view.debugger.test.testData.TestDataModel("100",this,this.OnGame_BFScoreBoard_SetTimer,[100])]),new g4.view.debugger.test.testData.TestDataModel("OnGame_BFScoreBoard_SetData",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("5=대혼전",this,this.OnGame_BFScoreBoard_SetData,[5]),new g4.view.debugger.test.testData.TestDataModel("0=명예의전장",this,this.OnGame_BFScoreBoard_SetData,[0])])])]);
   }
   function uiLoadComplete()
   {
      this.setDummyData();
   }
   function setDummyData()
   {
      this.OnGame_RankAround_SetScoreTitle(3);
      this.OnGame_RankAround_SetScoreValue();
      this.OnGame_RankAround_SetRankList(1);
      this.OnGame_BFScoreBoard_SetData(5);
   }
   function OnGame_RankAround_SetScoreTitle(count)
   {
      this.scoreCount = count;
      var _loc3_ = [];
      var _loc2_ = undefined;
      var _loc4_ = this.scoreCount;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_.push("제목 " + _loc2_);
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = _loc3_.join("\t");
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_RankAround_SetScoreTitle",_loc5_);
   }
   function OnGame_RankAround_SetScoreValue()
   {
      var _loc3_ = [];
      var _loc2_ = undefined;
      var _loc4_ = this.scoreCount;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_.push(this.randRange(0,99999999));
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = _loc3_.join("\t");
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_RankAround_SetScoreValue",_loc5_);
   }
   function OnGame_RankAround_SetRankList(myRank)
   {
      var _loc5_ = undefined;
      if(myRank < 5)
      {
         _loc5_ = [1,2,3,4,5];
      }
      else
      {
         _loc5_ = [];
         _loc5_.push(1);
         _loc5_.push("");
         _loc5_.push(myRank - 1);
         _loc5_.push(myRank);
         _loc5_.push(myRank + 1);
      }
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc7_ = [];
      var _loc1_ = undefined;
      var _loc2_ = undefined;
      var _loc8_ = 5;
      _loc2_ = 0;
      while(_loc2_ < _loc8_)
      {
         _loc1_ = [];
         _loc3_ = String(_loc5_[_loc2_]);
         if(_loc3_ == "")
         {
            _loc1_[0] = "";
            _loc1_[1] = "";
            _loc1_[2] = "";
            _loc1_[3] = "";
            _loc1_[4] = "";
            _loc1_[5] = "";
         }
         else
         {
            _loc4_ = Number(_loc3_);
            _loc1_[0] = _loc4_;
            _loc1_[1] = "이름_" + _loc2_;
            _loc1_[2] = Math.floor(Math.random() * 1000);
            _loc1_[3] = 0;
            _loc1_[4] = _loc4_ != myRank?0:1;
            _loc1_[5] = Math.random() >= 0.5?1:0;
         }
         _loc7_.push(_loc1_.join("\t"));
         _loc2_ = _loc2_ + 1;
      }
      var _loc9_ = _loc7_.join("\n");
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_RankAround_SetRankList",_loc9_);
   }
   function OnGame_RankAround_SetRankList2(dataCount)
   {
      var _loc3_ = [];
      var _loc1_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = dataCount;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc1_ = [];
         _loc1_[0] = _loc2_ + 1;
         _loc1_[1] = "이름_" + _loc2_;
         _loc1_[2] = Math.floor(Math.random() * 1000);
         _loc1_[3] = 0;
         _loc1_[4] = _loc2_ != 0?0:1;
         _loc1_[5] = Math.random() >= 0.5?1:0;
         _loc3_.push(_loc1_.join("\t"));
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = _loc3_.join("\n");
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_RankAround_SetRankList",_loc5_);
   }
   function OnGame_BFScoreBoard_SetBattleState(state)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFScoreBoard_SetBattleState",state);
   }
   function OnGame_BFScoreBoard_SetTimer(value)
   {
      if(isNaN(value))
      {
         value = this.randRange(0,360);
      }
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFScoreBoard_SetTimer",value);
   }
   function OnGame_BFScoreBoard_SetData(batteMode)
   {
      var _loc11_ = 0;
      var _loc7_ = 0;
      var _loc12_ = 0;
      var _loc8_ = 0;
      var _loc9_ = 0;
      var _loc5_ = 0;
      var _loc3_ = 360;
      var _loc1_ = 20;
      var _loc6_ = null;
      var _loc4_ = null;
      var _loc10_ = null;
      var _loc2_ = null;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFScoreBoard_SetData",batteMode,_loc11_,_loc7_,_loc12_,_loc8_,_loc9_,_loc5_,_loc3_,_loc1_,_loc6_,_loc4_,_loc10_,_loc2_);
   }
}
