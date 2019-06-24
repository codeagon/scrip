class g4.view.debugger.test.testData.RankingDisplayTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function RankingDisplayTestData()
   {
      super(g4.view.ViewID.RANKING_DISPLAY,"지하의 격전장 내 순위 표시",[new g4.view.debugger.test.testData.TestDataModel("순위 설정.",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("-",this,this.setRanking,["-"]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.setRanking,["1"]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.setRanking,["2"]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.setRanking,["3"]),new g4.view.debugger.test.testData.TestDataModel("4",this,this.setRanking,["4"]),new g4.view.debugger.test.testData.TestDataModel("5",this,this.setRanking,["5"]),new g4.view.debugger.test.testData.TestDataModel("6",this,this.setRanking,["6"]),new g4.view.debugger.test.testData.TestDataModel("7",this,this.setRanking,["7"]),new g4.view.debugger.test.testData.TestDataModel("8",this,this.setRanking,["8"]),new g4.view.debugger.test.testData.TestDataModel("9",this,this.setRanking,["9"]),new g4.view.debugger.test.testData.TestDataModel("10",this,this.setRanking,["10"]),new g4.view.debugger.test.testData.TestDataModel("11",this,this.setRanking,["11"]),new g4.view.debugger.test.testData.TestDataModel("12",this,this.setRanking,["12"]),new g4.view.debugger.test.testData.TestDataModel("13",this,this.setRanking,["13"]),new g4.view.debugger.test.testData.TestDataModel("14",this,this.setRanking,["14"]),new g4.view.debugger.test.testData.TestDataModel("15",this,this.setRanking,["15"])])]);
   }
   function setRanking(ranking)
   {
      var _loc8_ = undefined;
      var _loc9_ = undefined;
      var _loc4_ = [];
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc5_ = 5;
      _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = [];
         _loc2_[0] = this.randRange(1,15);
         _loc2_[1] = "이름_" + _loc3_;
         _loc2_[2] = Math.floor(Math.random() * 1000);
         _loc2_[3] = 0;
         _loc2_[4] = 0;
         _loc2_[5] = Math.random() >= 0.5?1:0;
         if(_loc3_ == 2)
         {
            _loc2_[0] = ranking;
            _loc2_[4] = 1;
         }
         _loc4_.push(_loc2_.join("\t"));
         _loc3_ = _loc3_ + 1;
      }
      var _loc7_ = _loc4_.join("\n");
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_RankAround_SetRankList",_loc7_);
   }
}
