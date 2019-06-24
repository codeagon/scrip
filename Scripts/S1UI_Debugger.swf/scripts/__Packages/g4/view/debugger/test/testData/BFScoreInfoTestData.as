class g4.view.debugger.test.testData.BFScoreInfoTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function BFScoreInfoTestData()
   {
      super(g4.view.ViewID.BF_SCORE_INFO,null,[new g4.view.debugger.test.testData.TestDataModel("쿠마스",this,this.setDummyData_kumas),new g4.view.debugger.test.testData.TestDataModel("명예의 전장",this,this.setDummyData_honor),new g4.view.debugger.test.testData.TestDataModel("OnGame_BFInfoBoard_Close",this,this.OnGame_BFInfoBoard_Close)]);
   }
   function uiLoadComplete()
   {
      this.setDummyData_kumas();
   }
   function generateList(myRank, count)
   {
      var _loc3_ = [];
      var _loc2_ = undefined;
      var _loc4_ = count;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         var _loc1_ = [];
         _loc1_[0] = 0;
         _loc1_[1] = 0;
         if(_loc2_ == 0)
         {
            _loc1_[2] = myRank;
         }
         else
         {
            _loc1_[2] = _loc2_ + 1;
         }
         _loc1_[3] = "이름 " + _loc2_;
         _loc1_[4] = "직업 " + _loc2_;
         _loc1_[5] = 200;
         _loc1_[6] = 300;
         _loc1_[7] = 12345;
         _loc3_.push(_loc1_.join("\t"));
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_.join("\n");
   }
   function setDummyData_kumas()
   {
      this.OnGame_BFInfoBoard_Close();
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFReward_SetRewardVisible",1);
      var _loc6_ = 3;
      var _loc2_ = "0\t0\t-\t이름1\t직업1\t30\t150\t15020\n0\t0\t2\t이름2\t직업2\t200\t300\t400";
      var _loc3_ = _loc2_;
      var _loc8_ = 360;
      var _loc7_ = "333\n444";
      var _loc5_ = 33333;
      var _loc4_ = 1;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFInfoBoard_SetData",_loc6_,_loc2_,_loc3_,_loc8_,_loc7_,_loc5_,_loc4_);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFInfoBoard_SetMyIndex",0);
   }
   function setDummyData_honor()
   {
      this.OnGame_BFInfoBoard_Close();
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFReward_SetRewardVisible",0);
      var _loc6_ = 0;
      var _loc2_ = "0\t0\t-\t이름1\t직업1\t30\t150\t15020\n0\t0\t2\t이름2\t직업2\t200\t300\t400";
      var _loc3_ = _loc2_;
      var _loc8_ = 360;
      var _loc7_ = "333\n444";
      var _loc5_ = 33333;
      var _loc4_ = 1;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFInfoBoard_SetData",_loc6_,_loc2_,_loc3_,_loc8_,_loc7_,_loc5_,_loc4_);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFInfoBoard_SetMyIndex",0);
   }
   function OnGame_BFInfoBoard_Close()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BFInfoBoard_Close");
   }
}
