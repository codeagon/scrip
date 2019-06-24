class g4.view.debugger.test.testData.ToolTipTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function ToolTipTestData()
   {
      super(g4.view.ViewID.TOOL_TIP,"툴팁",[new g4.view.debugger.test.testData.TestDataModel("OnGame_FieldEventToolTip_Open",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("0",this,this.OnGame_FieldEventToolTip_Open_0),new g4.view.debugger.test.testData.TestDataModel("1 0",this,this.OnGame_FieldEventToolTip_Open_1,[0]),new g4.view.debugger.test.testData.TestDataModel("1 1",this,this.OnGame_FieldEventToolTip_Open_1,[1]),new g4.view.debugger.test.testData.TestDataModel("1 2",this,this.OnGame_FieldEventToolTip_Open_1,[2]),new g4.view.debugger.test.testData.TestDataModel("1 3",this,this.OnGame_FieldEventToolTip_Open_1,[3]),new g4.view.debugger.test.testData.TestDataModel("1 4",this,this.OnGame_FieldEventToolTip_Open_1,[4]),new g4.view.debugger.test.testData.TestDataModel("1 5",this,this.OnGame_FieldEventToolTip_Open_1,[5])]),new g4.view.debugger.test.testData.TestDataModel("만렙필드컨텐츠 툴팁",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("보상",this,this.OnGame_FieldEventToolTip_Open_Reward),new g4.view.debugger.test.testData.TestDataModel("마커 (보상 없음)",this,this.OnGame_FieldEventToolTip_Open_Marker,[0]),new g4.view.debugger.test.testData.TestDataModel("마커 (보상 1)",this,this.OnGame_FieldEventToolTip_Open_Marker,[1]),new g4.view.debugger.test.testData.TestDataModel("마커 (보상 2)",this,this.OnGame_FieldEventToolTip_Open_Marker,[2]),new g4.view.debugger.test.testData.TestDataModel("마커 (보상 3)",this,this.OnGame_FieldEventToolTip_Open_Marker,[3]),new g4.view.debugger.test.testData.TestDataModel("마커 (보상 4)",this,this.OnGame_FieldEventToolTip_Open_Marker,[4]),new g4.view.debugger.test.testData.TestDataModel("마커 (보상 5)",this,this.OnGame_FieldEventToolTip_Open_Marker,[5])])]);
   }
   function OnGame_FieldEventToolTip_Open_0()
   {
      var _loc12_ = ["녹테늄 강화탄","특성 경험치++","용의 날개 비늘","장비 숙련도","평판 포인트","골드","경험치"];
      var _loc14_ = ["img://__Icon_Items.Union_Supplies5_Tex","img://__icon_items.ep_grow100_tex","img://__Icon_Items.q_backshell_Tex","img://__Icon_Items.VIP_Growth_Tex","img://__Icon_Items.ReputationPoint_Tex","img://item__20000000","img://item__20000001"];
      var _loc9_ = [0,0,1,0,0,0,0];
      var _loc11_ = [140,0,1,400,60,1200000,216000];
      var _loc13_ = [0,0,0,0,1,2,3];
      var _loc10_ = _loc9_.length;
      var _loc7_ = "[현재 목표 달성 시 지급 보상]\n";
      var _loc8_ = "[추가 보상]\n";
      var _loc1_ = 0;
      while(_loc1_ < _loc10_)
      {
         var _loc4_ = _loc12_[_loc1_];
         var _loc3_ = _loc14_[_loc1_];
         var _loc6_ = _loc9_[_loc1_];
         var _loc2_ = _loc11_[_loc1_];
         var _loc5_ = _loc13_[_loc1_];
         _loc7_ = _loc7_ + _loc4_ + "\t" + _loc3_ + "\t" + _loc6_ + "\t" + _loc2_ + "\t" + _loc5_ + "\n";
         _loc8_ = _loc8_ + _loc4_ + "\t" + _loc3_ + "\t" + _loc6_ + "\t" + _loc2_ + "\t" + _loc5_ + "\n";
         _loc1_ = _loc1_ + 1;
      }
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_FieldEventToolTip_Open",0,_loc7_,_loc8_);
   }
   function OnGame_FieldEventToolTip_Open_1(type)
   {
      var _loc3_ = "바라카니아 방어";
      var _loc5_ = "바라카니아 구릉지에 반 연합 세력이 침공해 왔습니다. 적이 해당 지역을 장악하기 전에 격퇴해 주세요.";
      var _loc2_ = "4분30초";
      type;
      var _loc1_ = "포화";
      var _loc4_ = _loc3_ + "\t" + _loc5_ + "\t" + _loc2_ + "\t" + type + "\t" + _loc1_;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_FieldEventToolTip_Open",1,_loc4_);
   }
   function OnGame_FieldEventToolTip_Open_Reward()
   {
      var _loc2_ = [["수호자 임무 보석 상자","img://item__98582",2,1,0],["장비 숙련도","img://item__20000022",0,30,0],["평판 포인트","img://item__20000008",0,250,1]];
      var _loc3_ = [];
      var _loc1_ = undefined;
      var _loc4_ = _loc2_.length;
      _loc1_ = 0;
      while(_loc1_ < _loc4_)
      {
         _loc3_.push(_loc2_[_loc1_].join("\t"));
         _loc1_ = _loc1_ + 1;
      }
      var _loc7_ = 0;
      var _loc6_ = "버튼 클릭 시 지급 보상  (일일 제한 0/40)\n" + _loc3_.join("\n");
      var _loc5_ = null;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_FieldEventToolTip_Open",_loc7_,_loc6_,_loc5_);
   }
   function OnGame_FieldEventToolTip_Open_Marker(rewardCount)
   {
      var _loc3_ = [["수호자 임무 보석 상자","img://item__98582",2,0],["장비 숙련도","img://item__20000022",0,0],["평판 포인트","img://item__20000008",0,1]];
      var _loc8_ = 1;
      var _loc7_ = "<font color=\'#63ac5d\'>콜드락 보급물자 배달</font>\t웬디고 감시소에서 콜드락까지 보급물자를 배달해 주십시오. 마을 수비에 반드시 필요한 물자입니다.\t03:40\t0\t<font color=\'#0cc408\'>입장가능</font>";
      var _loc6_ = undefined;
      if(rewardCount > 0)
      {
         var _loc4_ = [];
         _loc4_.push("* 추가 획득 가능한 보상");
         _loc4_.push("컨텐츠 성공 시 위의 보상이 확률적으로 우편 지급되며, 기여도 순위가 높을수록 더 많은 보상을 획득할 가능성이 높아집니다.");
         var _loc1_ = 0;
         var _loc5_ = rewardCount;
         _loc1_ = 0;
         while(_loc1_ < _loc5_)
         {
            var _loc2_ = _loc3_[_loc1_ % _loc3_.length];
            _loc4_.push(_loc2_.join("\t"));
            _loc1_ = _loc1_ + 1;
         }
         _loc6_ = _loc4_.join("\n");
      }
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_FieldEventToolTip_Open",_loc8_,_loc7_,_loc6_);
   }
}
