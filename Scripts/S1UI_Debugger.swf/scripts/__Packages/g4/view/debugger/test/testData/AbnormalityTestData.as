class g4.view.debugger.test.testData.AbnormalityTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   var buffID = 0;
   var buffType = 0;
   var buffGroup = 0;
   function AbnormalityTestData()
   {
      super(g4.view.ViewID.ABNORMALITY,"이상상태",[new g4.view.debugger.test.testData.TestDataModel("버프/디버프 추가",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("type",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=버프",this,this.setBuffType,[0]),new g4.view.debugger.test.testData.TestDataModel("1=디버프",this,this.setBuffType,[1]),new g4.view.debugger.test.testData.TestDataModel("2=상태약화디버프",this,this.setBuffType,[2]),new g4.view.debugger.test.testData.TestDataModel("3=지속피해디버프",this,this.setBuffType,[3]),new g4.view.debugger.test.testData.TestDataModel("4=행동불능디버프",this,this.setBuffType,[4])]),new g4.view.debugger.test.testData.TestDataModel("group",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=그룹없음",this,this.setBuffGroup,[0]),new g4.view.debugger.test.testData.TestDataModel("1=기타",this,this.setBuffGroup,[1]),new g4.view.debugger.test.testData.TestDataModel("2=도핑",this,this.setBuffGroup,[2]),new g4.view.debugger.test.testData.TestDataModel("3=스킬",this,this.setBuffGroup,[3])]),new g4.view.debugger.test.testData.TestDataModel("추가하기",this,this.addBuff)]),new g4.view.debugger.test.testData.TestDataModel("테스트 #1",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("버프 추가",this,this.test1_addBuff),new g4.view.debugger.test.testData.TestDataModel("버프 갱신",this,this.test1_updateBuff)]),new g4.view.debugger.test.testData.TestDataModel("값 지정 테스트",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("id",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("1",this,this.test2_setProp,["id",1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.test2_setProp,["id",2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.test2_setProp,["id",3]),new g4.view.debugger.test.testData.TestDataModel("4",this,this.test2_setProp,["id",4]),new g4.view.debugger.test.testData.TestDataModel("5",this,this.test2_setProp,["id",5]),new g4.view.debugger.test.testData.TestDataModel("6",this,this.test2_setProp,["id",6]),new g4.view.debugger.test.testData.TestDataModel("7",this,this.test2_setProp,["id",7]),new g4.view.debugger.test.testData.TestDataModel("8",this,this.test2_setProp,["id",8]),new g4.view.debugger.test.testData.TestDataModel("9",this,this.test2_setProp,["id",9]),new g4.view.debugger.test.testData.TestDataModel("10",this,this.test2_setProp,["id",10])]),new g4.view.debugger.test.testData.TestDataModel("type",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=버프",this,this.test2_setProp,["type",0]),new g4.view.debugger.test.testData.TestDataModel("1=디버프",this,this.test2_setProp,["type",1]),new g4.view.debugger.test.testData.TestDataModel("2=상태약화디버프",this,this.test2_setProp,["type",2]),new g4.view.debugger.test.testData.TestDataModel("3=지속피해디버프",this,this.test2_setProp,["type",3]),new g4.view.debugger.test.testData.TestDataModel("4=행동불능디버프",this,this.test2_setProp,["type",4])]),new g4.view.debugger.test.testData.TestDataModel("group",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=그룹없음",this,this.test2_setProp,["group",0]),new g4.view.debugger.test.testData.TestDataModel("1=기타",this,this.test2_setProp,["group",1]),new g4.view.debugger.test.testData.TestDataModel("2=도핑",this,this.test2_setProp,["group",2]),new g4.view.debugger.test.testData.TestDataModel("3=스킬",this,this.test2_setProp,["group",3])]),new g4.view.debugger.test.testData.TestDataModel("amount",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("0",this,this.test2_setProp,["amount",0]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.test2_setProp,["amount",1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.test2_setProp,["amount",2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.test2_setProp,["amount",3]),new g4.view.debugger.test.testData.TestDataModel("10",this,this.test2_setProp,["amount",10]),new g4.view.debugger.test.testData.TestDataModel("100",this,this.test2_setProp,["amount",100])]),new g4.view.debugger.test.testData.TestDataModel("remainTime",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("NaN",this,this.test2_setProp,["remainTime",NaN]),new g4.view.debugger.test.testData.TestDataModel("0",this,this.test2_setProp,["remainTime",0]),new g4.view.debugger.test.testData.TestDataModel("1초",this,this.test2_setProp,["remainTime",1000]),new g4.view.debugger.test.testData.TestDataModel("5초",this,this.test2_setProp,["remainTime",5000]),new g4.view.debugger.test.testData.TestDataModel("10초",this,this.test2_setProp,["remainTime",10000]),new g4.view.debugger.test.testData.TestDataModel("1분",this,this.test2_setProp,["remainTime",60000]),new g4.view.debugger.test.testData.TestDataModel("30분",this,this.test2_setProp,["remainTime",1800000]),new g4.view.debugger.test.testData.TestDataModel("1시간",this,this.test2_setProp,["remainTime",3600000]),new g4.view.debugger.test.testData.TestDataModel("2시간",this,this.test2_setProp,["remainTime",7200000]),new g4.view.debugger.test.testData.TestDataModel("하루",this,this.test2_setProp,["remainTime",86400000]),new g4.view.debugger.test.testData.TestDataModel("이틀",this,this.test2_setProp,["remainTime",172800000])]),new g4.view.debugger.test.testData.TestDataModel("totalTime",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("NaN",this,this.test2_setProp,["totalTime",NaN]),new g4.view.debugger.test.testData.TestDataModel("0",this,this.test2_setProp,["totalTime",0]),new g4.view.debugger.test.testData.TestDataModel("1초",this,this.test2_setProp,["totalTime",1000]),new g4.view.debugger.test.testData.TestDataModel("5초",this,this.test2_setProp,["totalTime",5000]),new g4.view.debugger.test.testData.TestDataModel("10초",this,this.test2_setProp,["totalTime",10000]),new g4.view.debugger.test.testData.TestDataModel("1분",this,this.test2_setProp,["totalTime",60000]),new g4.view.debugger.test.testData.TestDataModel("30분",this,this.test2_setProp,["totalTime",1800000]),new g4.view.debugger.test.testData.TestDataModel("1시간",this,this.test2_setProp,["totalTime",3600000]),new g4.view.debugger.test.testData.TestDataModel("2시간",this,this.test2_setProp,["totalTime",7200000]),new g4.view.debugger.test.testData.TestDataModel("하루",this,this.test2_setProp,["totalTime",86400000]),new g4.view.debugger.test.testData.TestDataModel("이틀",this,this.test2_setProp,["totalTime",172800000])]),new g4.view.debugger.test.testData.TestDataModel("버프 추가",this,this.test2_addBuff),new g4.view.debugger.test.testData.TestDataModel("버프 갱신",this,this.test2_updateBuff),new g4.view.debugger.test.testData.TestDataModel("버프 제거",this,this.test2_removeBuff),new g4.view.debugger.test.testData.TestDataModel("모든 버프 제거",this,this.test2_clearBuff),new g4.view.debugger.test.testData.TestDataModel("지속 시간 멈춤 O",this,this.test2_setTimePause,[true]),new g4.view.debugger.test.testData.TestDataModel("지속 시간 멈춤 X",this,this.test2_setTimePause,[false])]),new g4.view.debugger.test.testData.TestDataModel("대량 추가",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("#1",this,this.addManyBuffs),new g4.view.debugger.test.testData.TestDataModel("모든 버프 제거",this,this.OnGame_Abnormality_ClearBuff)])]);
      this.init();
   }
   function init()
   {
      this.test2_data = {};
      this.test2_setProp("id",1);
      this.test2_setProp("amount",1);
      this.test2_setProp("type",0);
      this.test2_setProp("group",1);
      this.test2_setProp("remainTime",10000);
      this.test2_setProp("totalTime",20000);
   }
   function setBuffType(buffType)
   {
      this.buffType = buffType;
   }
   function setBuffGroup(buffGroup)
   {
      this.buffGroup = buffGroup;
   }
   function addBuff()
   {
      var _loc4_ = this.buffID = this.buffID + 1;
      var _loc8_ = this.randRange(1,100);
      var _loc9_ = this.buffType;
      var _loc3_ = this.buffGroup;
      var _loc5_ = false;
      var _loc2_ = "";
      var _loc6_ = 10000;
      var _loc7_ = 20000;
      this.OnGame_Abnormality_AddBuff(this.buffID = this.buffID + 1,_loc8_,_loc9_,_loc3_,_loc5_,_loc2_,_loc6_,_loc7_);
   }
   function test1_addBuff()
   {
      var _loc4_ = 4020012;
      var _loc8_ = 1;
      var _loc9_ = 0;
      var _loc3_ = 0;
      var _loc5_ = false;
      var _loc2_ = "";
      var _loc6_ = 5000;
      var _loc7_ = 12000;
      this.OnGame_Abnormality_AddBuff(_loc4_,_loc8_,_loc9_,_loc3_,_loc5_,_loc2_,_loc6_,_loc7_);
   }
   function test1_updateBuff()
   {
      var _loc4_ = 4020012;
      var _loc8_ = 2;
      var _loc3_ = 0;
      var _loc5_ = false;
      var _loc2_ = "";
      var _loc6_ = 5000;
      var _loc7_ = 12000;
      this.OnGame_Abnormality_UpdateBuff(_loc4_,_loc3_,_loc8_,_loc5_,_loc2_,_loc6_,_loc7_);
   }
   function test2_setProp(propName, value)
   {
      this.test2_data[propName] = value;
   }
   function test2_getProp(propName)
   {
      return this.test2_data[propName];
   }
   function test2_addBuff()
   {
      var _loc4_ = this.test2_data.id;
      var _loc8_ = this.test2_data.amount;
      var _loc9_ = this.test2_data.type;
      var _loc3_ = this.test2_data.group;
      var _loc5_ = false;
      var _loc2_ = "";
      var _loc6_ = this.test2_data.remainTime;
      var _loc7_ = this.test2_data.totalTime;
      this.OnGame_Abnormality_AddBuff(_loc4_,_loc8_,_loc9_,_loc3_,_loc5_,_loc2_,_loc6_,_loc7_);
   }
   function test2_updateBuff()
   {
      var _loc4_ = this.test2_data.id;
      var _loc8_ = this.test2_data.amount;
      var _loc3_ = this.test2_data.group;
      var _loc5_ = false;
      var _loc2_ = "";
      var _loc6_ = this.test2_data.remainTime;
      var _loc7_ = this.test2_data.totalTime;
      this.OnGame_Abnormality_UpdateBuff(_loc4_,_loc3_,_loc8_,_loc5_,_loc2_,_loc6_,_loc7_);
   }
   function test2_removeBuff()
   {
      var _loc3_ = this.test2_data.id;
      var _loc2_ = this.test2_data.group;
      this.OnGame_Abnormality_RemoveBuff(_loc3_,_loc2_);
   }
   function test2_clearBuff()
   {
      this.OnGame_Abnormality_ClearBuff();
   }
   function test2_setTimePause(bPause)
   {
      var _loc2_ = this.test2_getProp("id");
      this.OnGame_Abnormality_SetTimePause(_loc2_,bPause);
   }
   function addManyBuffs()
   {
      var _loc3_ = undefined;
      var _loc13_ = undefined;
      var _loc2_ = undefined;
      var _loc12_ = undefined;
      _loc13_ = 4;
      _loc12_ = 10;
      _loc3_ = 0;
      while(_loc3_ < _loc13_)
      {
         _loc2_ = 0;
         while(_loc2_ < _loc12_)
         {
            var _loc6_ = this.buffID = this.buffID + 1;
            var _loc10_ = this.randRange(1,100);
            var _loc11_ = 0;
            var _loc5_ = _loc3_;
            var _loc7_ = false;
            var _loc4_ = "";
            var _loc8_ = this.test2_data.remainTime;
            var _loc9_ = this.test2_data.totalTime;
            this.OnGame_Abnormality_AddBuff(this.buffID = this.buffID + 1,_loc10_,_loc11_,_loc5_,_loc7_,_loc4_,_loc8_,_loc9_);
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < _loc13_)
      {
         _loc2_ = 0;
         while(_loc2_ < _loc12_)
         {
            var _loc6_ = this.buffID = this.buffID + 1;
            _loc10_ = this.randRange(1,100);
            _loc11_ = _loc3_ + 1;
            _loc5_ = 0;
            _loc7_ = false;
            _loc4_ = "";
            _loc8_ = 10000;
            _loc9_ = 20000;
            this.OnGame_Abnormality_AddBuff(this.buffID = this.buffID + 1,_loc10_,_loc11_,_loc5_,_loc7_,_loc4_,_loc8_,_loc9_);
            _loc2_ = _loc2_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function OnGame_Abnormality_AddBuff(id, amount, type, group, bRelaxMerit, iconImg, remainTime, totalTime)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Abnormality_AddBuff",id,amount,type,group,bRelaxMerit,iconImg,remainTime,totalTime);
   }
   function OnGame_Abnormality_UpdateBuff(id, amount, group, bRelaxMerit, iconImg, remainTime, totalTime)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Abnormality_UpdateBuff",id,group,amount,bRelaxMerit,iconImg,remainTime,totalTime);
   }
   function OnGame_Abnormality_RemoveBuff(id, group)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Abnormality_RemoveBuff",id,group);
   }
   function OnGame_Abnormality_ClearBuff()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Abnormality_ClearBuff");
   }
   function OnGame_Abnormality_SetTimePause(id, bPause)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Abnormality_SetTimePause",id,bPause);
   }
}
