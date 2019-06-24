class g4.view.debugger.test.testData.StyleShopTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function StyleShopTestData()
   {
      super(g4.view.ViewID.STYLE_SHOP,"스타일 샵",[new g4.view.debugger.test.testData.TestDataModel("더미 데이터 설정 #1",this,this.setDummyData1),new g4.view.debugger.test.testData.TestDataModel("더미 데이터 설정 #2",this,this.setDummyData2)]);
      this.init();
   }
   function init()
   {
   }
   function setDummyData1()
   {
      var _loc4_ = true;
      var _loc5_ = undefined;
      var _loc2_ = this.createColorList(10,0);
      var _loc3_ = "색상 선택 1";
      this.OnGame_StyleShop_SetColor(_loc4_,_loc5_,_loc2_,_loc3_);
   }
   function setDummyData2()
   {
      var _loc4_ = true;
      var _loc5_ = undefined;
      var _loc2_ = this.createColorList(5,10);
      var _loc3_ = "색상 선택 2";
      this.OnGame_StyleShop_SetColor(_loc4_,_loc5_,_loc2_,_loc3_);
   }
   function createColorList(imageCount, colorCount)
   {
      var _loc4_ = [];
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc5_ = undefined;
      _loc5_ = imageCount;
      _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = [];
         _loc2_.push(_loc3_);
         _loc2_.push("img://dummy.png");
         _loc2_.push("0");
         _loc2_.push(_loc3_ != 0?0:1);
         _loc4_.push(_loc2_.join("\t"));
         _loc3_ = _loc3_ + 1;
      }
      _loc5_ = colorCount;
      _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = [];
         _loc2_.push(imageCount + _loc3_);
         _loc2_.push("0");
         _loc2_.push(this.randRange(0,255) + "," + this.randRange(0,255) + "," + this.randRange(0,255));
         _loc2_.push(0);
         _loc4_.push(_loc2_.join("\t"));
         _loc3_ = _loc3_ + 1;
      }
      return _loc4_.length <= 0?"":_loc4_.join("\n");
   }
   function OnGame_StyleShop_SetColor(visible, img, colorDataList, infoText)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_StyleShop_SetColor",visible,img,colorDataList,infoText);
   }
}
