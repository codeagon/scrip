class g4.view.debugger.test.testData.BeautyShopTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   var itemCount = 100;
   function BeautyShopTestData()
   {
      super(g4.view.ViewID.BEAUTY_SHOP,"뷰티샵",[new g4.view.debugger.test.testData.TestDataModel("더미 데이터 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("결과 선택 X",this,this.setDummyData,["isResultCancel",false]),new g4.view.debugger.test.testData.TestDataModel("결과 선택 O",this,this.setDummyData,["isResultCancel",true]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("이미지 슬롯 개수 0",this,this.setDummyData,["imageCount",0]),new g4.view.debugger.test.testData.TestDataModel("이미지 슬롯 개수 1",this,this.setDummyData,["imageCount",1]),new g4.view.debugger.test.testData.TestDataModel("이미지 슬롯 개수 5",this,this.setDummyData,["imageCount",5]),new g4.view.debugger.test.testData.TestDataModel("이미지 슬롯 개수 10",this,this.setDummyData,["imageCount",10]),new g4.view.debugger.test.testData.TestDataModel("이미지 슬롯 개수 20",this,this.setDummyData,["imageCount",20]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("색상 슬롯 개수 0",this,this.setDummyData,["colorCount",0]),new g4.view.debugger.test.testData.TestDataModel("색상 슬롯 개수 1",this,this.setDummyData,["colorCount",1]),new g4.view.debugger.test.testData.TestDataModel("색상 슬롯 개수 5",this,this.setDummyData,["colorCount",5]),new g4.view.debugger.test.testData.TestDataModel("색상 슬롯 개수 10",this,this.setDummyData,["colorCount",10]),new g4.view.debugger.test.testData.TestDataModel("색상 슬롯 개수 20",this,this.setDummyData,["colorCount",20]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("최대 선택 개수 1",this,this.setDummyData,["maxSelectionCount",1]),new g4.view.debugger.test.testData.TestDataModel("최대 선택 개수 3",this,this.setDummyData,["maxSelectionCount",3]),new g4.view.debugger.test.testData.TestDataModel("최대 선택 개수 5",this,this.setDummyData,["maxSelectionCount",5]),new g4.view.debugger.test.testData.TestDataModel("최대 선택 개수 10",this,this.setDummyData,["maxSelectionCount",10])]),new g4.view.debugger.test.testData.TestDataModel("결과 설정",this,this.OnGame_BeautyShop_SetResult),new g4.view.debugger.test.testData.TestDataModel("아이템 개수 -1",this,this.OnGame_BeautyShop_FocusItem)]);
      this.init();
   }
   function uiLoadComplete()
   {
      this._setDummyData();
   }
   function init()
   {
      this.setTestValue("group1","isResultCancel",false);
      this.setTestValue("group1","imageCount",5);
      this.setTestValue("group1","colorCount",5);
      this.setTestValue("group1","maxSelectionCount",5);
   }
   function setDummyData(propName, value)
   {
      this.setTestValue("group1",propName,value);
      this._setDummyData();
   }
   function _setDummyData()
   {
      var _loc8_ = this.getTestValue("group1","maxSelectionCount");
      var _loc10_ = "아주 멋진 헤어 쿠폰";
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BeautyShop_SetTitle",_loc10_);
      this.itemCount = 100;
      this.OnGame_BeautyShop_FocusItem();
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BeautyShop_SelectCount",_loc8_);
      var _loc5_ = [];
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      var _loc6_ = this.getTestValue("group1","imageCount");
      _loc4_ = _loc6_;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = [];
         _loc3_[0] = _loc2_;
         _loc3_[1] = "img://dummy.png";
         _loc3_[2] = "0";
         _loc5_.push(_loc3_.join("\t"));
         _loc2_ = _loc2_ + 1;
      }
      var _loc9_ = this.getTestValue("group1","colorCount");
      _loc4_ = _loc9_;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = [];
         _loc3_[0] = _loc6_ + _loc2_;
         _loc3_[1] = "0";
         _loc3_[2] = this.randRange(0,255) + "," + this.randRange(0,255) + "," + this.randRange(0,255);
         _loc5_.push(_loc3_.join("\t"));
         _loc2_ = _loc2_ + 1;
      }
      var _loc12_ = _loc5_.join("\n");
      var _loc7_ = [];
      _loc4_ = _loc8_;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc7_.push(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
      var _loc11_ = _loc7_.join("\t");
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BeautyShop_SetRandomSlot",_loc12_,_loc11_);
   }
   function OnGame_BeautyShop_FocusItem()
   {
      var _loc2_ = 1001;
      var _loc3_ = this.getTestValue("group1","isResultCancel");
      this.itemCount = this.itemCount - 1;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BeautyShop_FocusItem",_loc2_,"img://dummy.png",this.itemCount,_loc3_);
   }
   function OnGame_BeautyShop_SetResult()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_BeautyShop_SetResult",1,"img://dummy.png",this.randRange(0,255) + "," + this.randRange(0,255) + "," + this.randRange(0,255));
   }
}
