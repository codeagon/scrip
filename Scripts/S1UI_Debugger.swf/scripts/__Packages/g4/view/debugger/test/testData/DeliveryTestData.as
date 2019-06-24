class g4.view.debugger.test.testData.DeliveryTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function DeliveryTestData()
   {
      super(g4.view.ViewID.DELIVERY,"낚시 납품소",[new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("타입설정 : 0=골드",this,this.OnGame_Delivery_SetType,[0]),new g4.view.debugger.test.testData.TestDataModel("타입설정 : 1=메달",this,this.OnGame_Delivery_SetType,[1]),new g4.view.debugger.test.testData.TestDataModel("타입설정 : 2=평판코인",this,this.OnGame_Delivery_SetType,[2]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("제목 설정",this,this.setTitle),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("설명 설정",this,this.setDescription),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("납품 가능 목록 설정 : 골드 0",this,this.setDeliverableListGold,[0]),new g4.view.debugger.test.testData.TestDataModel("납품 가능 목록 설정 : 골드 1",this,this.setDeliverableListGold,[1]),new g4.view.debugger.test.testData.TestDataModel("납품 가능 목록 설정 : 골드 5",this,this.setDeliverableListGold,[5]),new g4.view.debugger.test.testData.TestDataModel("납품 가능 목록 설정 : 골드 10",this,this.setDeliverableListGold,[10]),new g4.view.debugger.test.testData.TestDataModel("납품 가능 목록 설정 : 골드 100",this,this.setDeliverableListGold,[100]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("납품 가능 목록 설정 : 메달 0",this,this.setDeliverableListMedal,[0]),new g4.view.debugger.test.testData.TestDataModel("납품 가능 목록 설정 : 메달 1",this,this.setDeliverableListMedal,[1]),new g4.view.debugger.test.testData.TestDataModel("납품 가능 목록 설정 : 메달 5",this,this.setDeliverableListMedal,[5]),new g4.view.debugger.test.testData.TestDataModel("납품 가능 목록 설정 : 메달 100",this,this.setDeliverableListMedal,[100]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("납품 목록 설정 : 0",this,this.setDeliveryList,[0]),new g4.view.debugger.test.testData.TestDataModel("납품 목록 설정 : 1",this,this.setDeliveryList,[1]),new g4.view.debugger.test.testData.TestDataModel("납품 목록 설정 : 2",this,this.setDeliveryList,[2]),new g4.view.debugger.test.testData.TestDataModel("납품 목록 설정 : 5",this,this.setDeliveryList,[5]),new g4.view.debugger.test.testData.TestDataModel("납품 목록 설정 : 8",this,this.setDeliveryList,[8]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("결과 설정 : 골드",this,this.setResultMoney),new g4.view.debugger.test.testData.TestDataModel("결과 설정 : 메달",this,this.setResultMedal),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("결과 설정 : 납품 가능 개수 : 0/0",this,this.OnGame_Delivery_SetRemainingDeliveryCount,[0,0]),new g4.view.debugger.test.testData.TestDataModel("결과 설정 : 납품 가능 개수 : 1/10",this,this.OnGame_Delivery_SetRemainingDeliveryCount,[1,10]),new g4.view.debugger.test.testData.TestDataModel("결과 설정 : 납품 가능 개수 : 8/100",this,this.OnGame_Delivery_SetRemainingDeliveryCount,[8,100]),new g4.view.debugger.test.testData.TestDataModel("----------")]);
      this.init();
   }
   function init()
   {
   }
   function setDeliverableListGold(count)
   {
      var _loc6_ = undefined;
      if(count > 0)
      {
         var _loc4_ = [];
         var _loc2_ = undefined;
         var _loc3_ = undefined;
         var _loc5_ = count;
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc2_ = [];
            _loc2_.push(_loc3_);
            _loc2_.push(_loc3_);
            _loc2_.push("img://dummy.png");
            _loc2_.push("아이템이름_" + _loc3_);
            _loc2_.push(this.randRange(999,9999999));
            _loc2_.push(this.randRange(0,1));
            _loc2_.push(this.randRange(0,5));
            _loc2_.push(this.randRange(0,1));
            _loc2_.push(this.randRange(0,1));
            _loc4_.push(_loc2_.join("\t"));
            _loc3_ = _loc3_ + 1;
         }
         _loc6_ = _loc4_.join("\n");
      }
      this.OnGame_Delivery_SetDeliverableListGold(_loc6_);
   }
   function setDeliverableListMedal(count)
   {
      var _loc6_ = undefined;
      if(count > 0)
      {
         var _loc4_ = [];
         var _loc2_ = undefined;
         var _loc3_ = undefined;
         var _loc5_ = count;
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc2_ = [];
            _loc2_.push(_loc3_);
            _loc2_.push(_loc3_);
            _loc2_.push("img://dummy.png");
            _loc2_.push("아이템이름_" + _loc3_);
            _loc2_.push(this.randRange(99,9999));
            _loc2_.push(this.randRange(0,1));
            _loc2_.push(this.randRange(1,20));
            _loc2_.push(this.randRange(0,5));
            _loc2_.push(this.randRange(0,1));
            _loc2_.push(this.randRange(0,1));
            _loc4_.push(_loc2_.join("\t"));
            _loc3_ = _loc3_ + 1;
         }
         _loc6_ = _loc4_.join("\n");
      }
      this.OnGame_Delivery_SetDeliverableListMedal(_loc6_);
   }
   function setDeliveryList(count)
   {
      var _loc6_ = undefined;
      if(count > 0)
      {
         var _loc4_ = [];
         var _loc2_ = undefined;
         var _loc3_ = undefined;
         var _loc5_ = count;
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc2_ = [];
            _loc2_.push(_loc3_);
            _loc2_.push(_loc3_);
            _loc2_.push("img://dummy.png");
            _loc2_.push("아이템이름_" + _loc3_);
            _loc2_.push(this.randRange(99,9999));
            _loc2_.push(this.randRange(1,99));
            _loc2_.push(this.randRange(0,1));
            _loc2_.push(this.randRange(0,5));
            _loc2_.push(this.randRange(0,1));
            _loc2_.push(this.randRange(0,1));
            _loc2_.push(this.randRange(0,1));
            _loc4_.push(_loc2_.join("\t"));
            _loc3_ = _loc3_ + 1;
         }
         _loc6_ = _loc4_.join("\n");
      }
      this.OnGame_Delivery_SetDeliveryList(_loc6_);
   }
   function setResultMoney()
   {
      var _loc3_ = this.randRange(0,9999);
      var _loc2_ = this.randRange(0,999999);
      this.OnGame_Delivery_SetResultMoney(_loc3_,_loc2_);
   }
   function setResultMedal()
   {
      var _loc3_ = this.randRange(0,9999);
      var _loc2_ = this.randRange(0,999999);
      this.OnGame_Delivery_SetResultMedal(_loc3_,_loc2_);
   }
   function setTitle()
   {
      this.OnGame_Delivery_SetTitle("낚시 납품소 " + this.randRange(0,999));
   }
   function setDescription()
   {
      this.OnGame_Delivery_SetDescription("낚시 납품 설명" + this.randRange(0,999));
   }
   function OnGame_Delivery_SetType(type)
   {
      var _loc1_ = "img://__Icon_Items.ReputationPointCoin";
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Delivery_SetType",type,_loc1_);
   }
   function OnGame_Delivery_SetDeliverableListGold(dataList)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Delivery_SetDeliverableListGold",dataList);
   }
   function OnGame_Delivery_SetDeliverableListMedal(dataList)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Delivery_SetDeliverableListMedal",dataList);
   }
   function OnGame_Delivery_SetDeliveryList(dataList)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Delivery_SetDeliveryList",dataList);
   }
   function OnGame_Delivery_SetResultMoney(acquirement, total)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Delivery_SetResultMoney",acquirement,total);
   }
   function OnGame_Delivery_SetResultMedal(acquirement, total)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Delivery_SetResultMedal",acquirement,total);
   }
   function OnGame_Delivery_SetRemainingDeliveryCount(currentCount, totalCount)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Delivery_SetRemainingDeliveryCount",currentCount,totalCount);
   }
   function OnGame_Delivery_SetTitle(title)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Delivery_SetTitle",title);
   }
   function OnGame_Delivery_SetDescription(description)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Delivery_SetDescription",description);
   }
}
