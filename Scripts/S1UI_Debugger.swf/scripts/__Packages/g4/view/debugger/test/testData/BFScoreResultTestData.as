class g4.view.debugger.test.testData.BFScoreResultTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   var hasScore = false;
   function BFScoreResultTestData()
   {
      super(g4.view.ViewID.BF_SCORE_RESULT,"접근성 좋은 전장 결과",[new g4.view.debugger.test.testData.TestDataModel("더미 데이터 설정",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("15건",this,this.setDummyData,[15]),new g4.view.debugger.test.testData.TestDataModel("10건",this,this.setDummyData,[10]),new g4.view.debugger.test.testData.TestDataModel("1건",this,this.setDummyData,[1])]),new g4.view.debugger.test.testData.TestDataModel("내 점수 표시",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("블루팀 0",this,this.OnGame_BFInfoBoard_SetMyIndex,[0,0]),new g4.view.debugger.test.testData.TestDataModel("블루팀 5",this,this.OnGame_BFInfoBoard_SetMyIndex,[5,0]),new g4.view.debugger.test.testData.TestDataModel("블루팀 10",this,this.OnGame_BFInfoBoard_SetMyIndex,[10,0]),new g4.view.debugger.test.testData.TestDataModel("블루팀 15",this,this.OnGame_BFInfoBoard_SetMyIndex,[15,0]),new g4.view.debugger.test.testData.TestDataModel("레드팀 0",this,this.OnGame_BFInfoBoard_SetMyIndex,[0,1]),new g4.view.debugger.test.testData.TestDataModel("레드팀 5",this,this.OnGame_BFInfoBoard_SetMyIndex,[5,1]),new g4.view.debugger.test.testData.TestDataModel("레드팀 10",this,this.OnGame_BFInfoBoard_SetMyIndex,[10,1]),new g4.view.debugger.test.testData.TestDataModel("레드팀 15",this,this.OnGame_BFInfoBoard_SetMyIndex,[15,1])]),new g4.view.debugger.test.testData.TestDataModel("보상 설정",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("보상 있음 : 5개",this,this.setRewardData,[5]),new g4.view.debugger.test.testData.TestDataModel("보상 있음 : 3개",this,this.setRewardData,[3]),new g4.view.debugger.test.testData.TestDataModel("보상 없음 : 100점",this,this.setNoRewardData,[100]),new g4.view.debugger.test.testData.TestDataModel("보상 있음 : 500점",this,this.setNoRewardData,[500]),new g4.view.debugger.test.testData.TestDataModel("보상 있음 : 3000점",this,this.setNoRewardData,[3000])]),new g4.view.debugger.test.testData.TestDataModel("OnGame_BFScoreBoard_SetBattleState",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("-1",this,this.OnGame_BFScoreBoard_SetBattleState,[-1]),new g4.view.debugger.test.testData.TestDataModel("0",this,this.OnGame_BFScoreBoard_SetBattleState,[0]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.OnGame_BFScoreBoard_SetBattleState,[1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.OnGame_BFScoreBoard_SetBattleState,[2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.OnGame_BFScoreBoard_SetBattleState,[3])]),new g4.view.debugger.test.testData.TestDataModel("OnGame_BFInfoBoard_SetEndTimer",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("-1",this,this.OnGame_BFInfoBoard_SetEndTimer,[-1]),new g4.view.debugger.test.testData.TestDataModel("10",this,this.OnGame_BFInfoBoard_SetEndTimer,[10]),new g4.view.debugger.test.testData.TestDataModel("50",this,this.OnGame_BFInfoBoard_SetEndTimer,[50]),new g4.view.debugger.test.testData.TestDataModel("100",this,this.OnGame_BFInfoBoard_SetEndTimer,[100])]),new g4.view.debugger.test.testData.TestDataModel("OnGame_BFInfoBoard_Close",this,this.OnGame_BFInfoBoard_Close)]);
   }
   function uiLoadComplete()
   {
      this.setDummyData(15);
   }
   function setDummyData(count)
   {
      this.hasScore = !this.hasScore;
      var _loc3_ = [];
      var _loc4_ = [];
      var _loc2_ = undefined;
      var _loc5_ = count;
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc3_.push(this.createScoreRow());
         _loc4_.push(this.createScoreRow());
         _loc2_ = _loc2_ + 1;
      }
      var _loc7_ = _loc3_.join("\n");
      var _loc6_ = _loc4_.join("\n");
      this._setDummyData(_loc7_,_loc6_);
   }
   function createScoreRow()
   {
      var _loc2_ = [];
      _loc2_.push(0);
      _loc2_.push(0);
      if(this.hasScore)
      {
         _loc2_.push(this.randRange(1,15));
      }
      else
      {
         _loc2_.push("-");
      }
      _loc2_.push("캐릭명 " + this.randRange(1,999));
      _loc2_.push(this.randRange(0,12));
      if(this.hasScore)
      {
         _loc2_.push(this.randRange(1,999));
         _loc2_.push(this.randRange(1,999));
         _loc2_.push(this.randRange(1,999));
         _loc2_.push(this.randRange(1,999));
         _loc2_.push(this.randRange(400,4000));
      }
      else
      {
         _loc2_.push(0);
         _loc2_.push(0);
         _loc2_.push(0);
         _loc2_.push(0);
         _loc2_.push(0);
      }
      return _loc2_.join("\t");
   }
   function _setDummyData(myTeamList, otherTeamList)
   {
      this.OnGame_BFInfoBoard_Close();
      this.OnGame_BFScoreBoard_SetBattleState(3);
      this.setRewardData(5);
      var _loc4_ = 5;
      var _loc6_ = 0;
      var _loc5_ = 0;
      var _loc3_ = 0;
      var _loc2_ = 3;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFInfoBoard_SetData",_loc4_,myTeamList,otherTeamList,_loc6_,_loc5_,_loc3_,_loc2_);
      this.OnGame_BFInfoBoard_SetMyIndex(0,0);
   }
   function OnGame_BFInfoBoard_SetEndTimer(endTime)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFInfoBoard_SetEndTimer",endTime);
   }
   function OnGame_BFInfoBoard_Close()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFInfoBoard_Close");
   }
   function OnGame_BFInfoBoard_SetMyIndex(myIndex, myTeamIndex)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFInfoBoard_SetMyIndex",myIndex,myTeamIndex);
   }
   function setRewardData(count)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFReward_SetRewardVisible",2);
      var _loc4_ = [];
      var _loc3_ = undefined;
      var _loc5_ = count;
      _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         var _loc2_ = [];
         _loc2_.push(98523);
         _loc2_.push("img://item__98523");
         _loc2_.push("변화의 증거");
         _loc2_.push(this.randRange(1,10));
         _loc4_.push(_loc2_.join("\t"));
         _loc3_ = _loc3_ + 1;
      }
      var _loc6_ = _loc4_.join("\n");
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFRewardItem_SetData",true,_loc6_);
   }
   function setNoRewardData(minScore)
   {
      var _loc1_ = "전투 점수가 " + minScore + "점을 넘지 못해서 보상을 얻지 못했습니다.";
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFRewardItem_SetData",false,_loc1_);
   }
   function OnGame_BFScoreBoard_SetBattleState(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFScoreBoard_SetBattleState",value);
   }
}
