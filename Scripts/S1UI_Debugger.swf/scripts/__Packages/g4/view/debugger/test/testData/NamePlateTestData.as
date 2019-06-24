class g4.view.debugger.test.testData.NamePlateTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   function NamePlateTestData()
   {
      super("NamePlate","네임 플레이트",[new g4.view.debugger.test.testData.TestDataModel("OnGame_NamePlate_SetPcName #1",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("상단 아이콘 개수 0",this,this.setPCName_setProp,["topIconCount",0]),new g4.view.debugger.test.testData.TestDataModel("상단 아이콘 개수 1",this,this.setPCName_setProp,["topIconCount",1]),new g4.view.debugger.test.testData.TestDataModel("상단 아이콘 개수 2",this,this.setPCName_setProp,["topIconCount",2]),new g4.view.debugger.test.testData.TestDataModel("상단 아이콘 개수 3",this,this.setPCName_setProp,["topIconCount",3]),new g4.view.debugger.test.testData.TestDataModel("상단 아이콘 개수 4",this,this.setPCName_setProp,["topIconCount",4]),new g4.view.debugger.test.testData.TestDataModel("상단 아이콘 개수 5",this,this.setPCName_setProp,["topIconCount",5]),new g4.view.debugger.test.testData.TestDataModel("하단 아이콘 : 연맹 O",this,this.setPCName_setProp,["bottomIconAlliance",true]),new g4.view.debugger.test.testData.TestDataModel("하단 아이콘 : 연맹 X",this,this.setPCName_setProp,["bottomIconAlliance",false]),new g4.view.debugger.test.testData.TestDataModel("하단 아이콘 : 길드 O",this,this.setPCName_setProp,["bottomIconGuild",true]),new g4.view.debugger.test.testData.TestDataModel("하단 아이콘 : 길드 X",this,this.setPCName_setProp,["bottomIconGuild",false]),new g4.view.debugger.test.testData.TestDataModel("하단 아이콘 : 길드등급 O",this,this.setPCName_setProp,["bottomIconGuildGrade",true]),new g4.view.debugger.test.testData.TestDataModel("하단 아이콘 : 길드등급 X",this,this.setPCName_setProp,["bottomIconGuildGrade",false]),new g4.view.debugger.test.testData.TestDataModel("칭호 O",this,this.setPCName_setProp,["titleName",true]),new g4.view.debugger.test.testData.TestDataModel("칭호 X",this,this.setPCName_setProp,["titleName",false]),new g4.view.debugger.test.testData.TestDataModel("PC이름 O",this,this.setPCName_setProp,["pcName",true]),new g4.view.debugger.test.testData.TestDataModel("PC이름 X",this,this.setPCName_setProp,["pcName",false]),new g4.view.debugger.test.testData.TestDataModel("길드이름 O",this,this.setPCName_setProp,["guildName",true]),new g4.view.debugger.test.testData.TestDataModel("길드이름 X",this,this.setPCName_setProp,["guildName",false])]),new g4.view.debugger.test.testData.TestDataModel("OnGame_NamePlate_GetPosition",this,this.OnGame_NamePlate_GetPosition),new g4.view.debugger.test.testData.TestDataModel("OnGame_NamePlate_SetName",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("#1",this,this.OnGame_NamePlate_SetName_1),new g4.view.debugger.test.testData.TestDataModel("#2",this,this.OnGame_NamePlate_SetName_2),new g4.view.debugger.test.testData.TestDataModel("#3",this,this.OnGame_NamePlate_SetName_3),new g4.view.debugger.test.testData.TestDataModel("#4",this,this.OnGame_NamePlate_SetName_4)]),new g4.view.debugger.test.testData.TestDataModel("OnGame_NamePlate_SetCastleName",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("#1",this,this.OnGame_NamePlate_SetCastleName_1),new g4.view.debugger.test.testData.TestDataModel("#2",this,this.OnGame_NamePlate_SetCastleName_2)])]);
      this.init();
   }
   function init()
   {
      this.setPCNameData = {};
      this.setPCNameData.topIconCount = 1;
      this.setPCNameData.bottomIconAlliance = true;
      this.setPCNameData.bottomIconGuild = true;
      this.setPCNameData.bottomIconGuildGrade = true;
      this.setPCNameData.titleName = true;
      this.setPCNameData.pcName = true;
      this.setPCNameData.guildName = true;
   }
   function setPCName_setProp(name, value)
   {
      this.setPCNameData[name] = value;
      this.OnGame_NamePlate_SetPcName();
   }
   function OnGame_NamePlate_SetPcName()
   {
      var _loc2_ = "";
      var _loc10_ = "";
      var _loc8_ = "";
      var _loc9_ = "";
      var _loc7_ = "";
      var _loc4_ = ["img://__Icon_System.artisanMaster_Armor_Tex","img://__Icon_System.artisanMaster_Weapon_Tex","img://__Icon_System.artisanMaster_Potion_Tex","img://__Icon_System.artisanMaster_Enchant_Tex"];
      var _loc3_ = undefined;
      var _loc5_ = this.setPCNameData.topIconCount;
      _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         if(_loc2_.length > 0)
         {
            _loc2_ = _loc2_ + "\t";
         }
         _loc2_ = _loc2_ + this.randValueOne(_loc4_);
         _loc3_ = _loc3_ + 1;
      }
      var _loc6_ = ["","",""];
      if(this.setPCNameData.bottomIconAlliance)
      {
         var _loc11_ = ["img://__Icon_System.UnionFlag_AL","img://__Icon_System.UnionFlag_KA","img://__Icon_System.UnionFlag_VK"];
         _loc6_[0] = this.randValueOne(_loc11_);
      }
      if(this.setPCNameData.bottomIconGuild)
      {
         var _loc12_ = ["img://__Icon_Items.FireWorks_Ding_Exclam_Tex","img://__Icon_Items.fallfestival_coin_Tex","img://__Icon_Items.Union_Collect3_Tex"];
         _loc6_[1] = this.randValueOne(_loc12_);
      }
      if(this.setPCNameData.bottomIconGuildGrade)
      {
         _loc6_[2] = "img://__Icon_System.UnionFlag_VK";
      }
      _loc10_ = _loc6_.join("\t");
      if(this.setPCNameData.titleName)
      {
         _loc8_ = "등에 꽂힌 칼 주인\t#999999";
      }
      if(this.setPCNameData.pcName)
      {
         _loc9_ = "엘린은엘린엘린해*\t#F0F0F0";
      }
      if(this.setPCNameData.guildName)
      {
         _loc7_ = "[세계제일의공주님길드에어서오게]\t#999999";
      }
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_NamePlate_SetPcName",_loc2_,_loc10_,_loc8_,_loc9_,_loc7_);
   }
   function OnGame_NamePlate_SetName_1()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_NamePlate_SetName","10{@img:Gold_smalltoken}+\t#ffb033");
   }
   function OnGame_NamePlate_SetName_2()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_NamePlate_SetName");
   }
   function OnGame_NamePlate_SetName_3()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_NamePlate_SetName","10{@img:img://__Icon_System.FreeHuntingNamedMonster64}adsadsa{@img:img://__WMap_Marker.MARKER_UNIONQUEST_STARTABLE}adsad{@img:img://__Icon_System.Icon_Union_AL}테스트+\t#ffb033","{@img:img://__WMap_Marker.MARKER_UNIONQUEST_STARTABLE}10{@img:Gold_smalltoken}+\t#ffb033");
   }
   function OnGame_NamePlate_SetName_4()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_NamePlate_SetName","{@img:Icon_Title_Rare}업적타이틀{@img:Icon_Title_Unique}\t#D7D7D","캐릭명\t#D7D7D");
   }
   function OnGame_NamePlate_GetPosition()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_NamePlate_GetPosition");
   }
   function OnGame_NamePlate_SetCastleName(guildIcon, guildName, pcName)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_NamePlate_SetCastleName",guildIcon,guildName,pcName);
   }
   function OnGame_NamePlate_SetCastleName_1()
   {
      this.OnGame_NamePlate_SetCastleName("img://__Icon_Items.FireWorks_Ding_Exclam_Tex","길드이름\tFF0000","PC이름\t#00FFFF");
   }
   function OnGame_NamePlate_SetCastleName_2()
   {
      this.OnGame_NamePlate_SetCastleName("img://__Icon_Items.fallfestival_coin_Tex","길드이름100\tFF0000","PC이름100\t#00FFFF");
   }
}
