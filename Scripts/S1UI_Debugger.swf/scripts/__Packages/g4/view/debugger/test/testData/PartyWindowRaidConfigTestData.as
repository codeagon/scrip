class g4.view.debugger.test.testData.PartyWindowRaidConfigTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function PartyWindowRaidConfigTestData()
   {
      super(g4.view.ViewID.PARTY_WINDOW_RAID_CONFIG,"공격대 구성",[new g4.view.debugger.test.testData.TestDataModel("더미데이터 설정",this,this.setDummyData)]);
   }
   function setDummyData()
   {
      var _loc16_ = true;
      var _loc14_ = [];
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc15_ = 30;
      _loc3_ = 0;
      while(_loc3_ < _loc15_)
      {
         var _loc4_ = this.randValueOne(-1,0,1);
         var _loc7_ = false;
         var _loc8_ = false;
         var _loc6_ = this.randRange(1,65);
         var _loc5_ = "name_" + this.randRange(0,99);
         var _loc9_ = this.randRange(0,10);
         var _loc13_ = 2;
         var _loc12_ = true;
         var _loc11_ = 1;
         var _loc10_ = _loc3_;
         _loc2_ = [];
         _loc2_.push(_loc4_);
         _loc2_.push(_loc7_);
         _loc2_.push(_loc8_);
         _loc2_.push(_loc6_);
         _loc2_.push(_loc5_);
         _loc2_.push(_loc9_);
         _loc2_.push(_loc13_);
         _loc2_.push(_loc12_);
         _loc2_.push(_loc11_);
         _loc2_.push(_loc10_);
         _loc14_.push(_loc2_.join("\t"));
         _loc3_ = _loc3_ + 1;
      }
      this.OnGame_PartyWindowRaidConfig_SetData(_loc14_.join("\n"),_loc16_);
   }
   function OnGame_PartyWindowRaidConfig_SetData(teamList, isMaster)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidConfig_SetData",teamList,isMaster);
   }
}
