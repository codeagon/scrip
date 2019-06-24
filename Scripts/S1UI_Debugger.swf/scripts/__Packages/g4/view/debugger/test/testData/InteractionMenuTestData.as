class g4.view.debugger.test.testData.InteractionMenuTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   var isCharInfo = false;
   function InteractionMenuTestData()
   {
      super(g4.view.ViewID.INTERACTION_MENU,"인터랙션 메뉴",[new g4.view.debugger.test.testData.TestDataModel("캐릭터 정보 O",this,this.setCharInfo,[true]),new g4.view.debugger.test.testData.TestDataModel("캐릭터 정보 X",this,this.setCharInfo,[false]),new g4.view.debugger.test.testData.TestDataModel("메뉴 열기 ",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0",this,this.openMenu,[0]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.openMenu,[1]),new g4.view.debugger.test.testData.TestDataModel("5",this,this.openMenu,[5]),new g4.view.debugger.test.testData.TestDataModel("10",this,this.openMenu,[10]),new g4.view.debugger.test.testData.TestDataModel("20",this,this.openMenu,[20])]),new g4.view.debugger.test.testData.TestDataModel("위치 변경 ",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0, 0",this,this.changePosition,[0,0]),new g4.view.debugger.test.testData.TestDataModel("100, 100",this,this.changePosition,[100,100]),new g4.view.debugger.test.testData.TestDataModel("500, 500",this,this.changePosition,[500,500]),new g4.view.debugger.test.testData.TestDataModel("1920, 1080",this,this.changePosition,[1920,1080]),new g4.view.debugger.test.testData.TestDataModel("랜덤",this,this.changePositionRandom)]),new g4.view.debugger.test.testData.TestDataModel("메뉴 닫기",this,this.closeMenu)]);
   }
   function setCharInfo(value)
   {
      this.isCharInfo = value;
   }
   function openMenu(menuCount)
   {
      var _loc10_ = 1920;
      var _loc7_ = 1200;
      var _loc9_ = this.randRange(100,_loc10_ - 100);
      var _loc8_ = this.randRange(100,_loc7_ - 100);
      var _loc3_ = [];
      var _loc2_ = undefined;
      var _loc4_ = menuCount;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_.push("메뉴_" + _loc2_);
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = _loc3_.join("\n");
      if(this.isCharInfo)
      {
         var _loc6_ = this.randValueOne("UserName사제[휴먼 남 사제/65]","NickName검투사[휴먼 여 검투사/1]");
         _loc5_ = _loc6_ + "\n" + _loc5_;
      }
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_InteractionMenu_Open",_loc9_,_loc8_,_loc5_);
   }
   function changePositionRandom()
   {
      var _loc5_ = 1920;
      var _loc2_ = 1200;
      var _loc4_ = this.randRange(100,_loc5_ - 100);
      var _loc3_ = this.randRange(100,_loc2_ - 100);
      this.changePosition(_loc4_,_loc3_);
   }
   function changePosition(x, y)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_InteractionMenu_UpdatePosition",x,y);
   }
   function closeMenu()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_InteractionMenu_Close");
   }
}
