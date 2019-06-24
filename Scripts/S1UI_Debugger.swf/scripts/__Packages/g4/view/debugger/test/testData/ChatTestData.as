class g4.view.debugger.test.testData.ChatTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   var setWriting_channelIndex = 0;
   var setWriting_tabID = 0;
   var ChangeInputChannel_channelNum = 0;
   var ChangeInputChannel_notClear = false;
   var chatMode = false;
   var toggleChatMode_intervalID = 0;
   var tabID = 0;
   var changeInputChannel_intervalID = 0;
   function ChatTestData()
   {
      super(g4.view.ViewID.CHAT_2,"채팅",[new g4.view.debugger.test.testData.TestDataModel("더미데이터 #1",this,this.setDummyData),new g4.view.debugger.test.testData.TestDataModel("테스트 케이스",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("입력 채널 변경 시작",this,this.changeInputChannel,[true]),new g4.view.debugger.test.testData.TestDataModel("입력 채널 변경 중지",this,this.changeInputChannel,[false])]),new g4.view.debugger.test.testData.TestDataModel("기능",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("초기화",this,this.OnGame_Chat_ResetInfo),new g4.view.debugger.test.testData.TestDataModel("전체 탭 일괄 추가.",this,this.addTabAll),new g4.view.debugger.test.testData.TestDataModel("탭 추가",this,this.addTab),new g4.view.debugger.test.testData.TestDataModel("탭 갱신",this,this.updateTab),new g4.view.debugger.test.testData.TestDataModel("탭 갱신 (긴 이름)",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("1",this,this.updateTabForName,[1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.updateTabForName,[2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.updateTabForName,[3]),new g4.view.debugger.test.testData.TestDataModel("4",this,this.updateTabForName,[4]),new g4.view.debugger.test.testData.TestDataModel("5",this,this.updateTabForName,[5]),new g4.view.debugger.test.testData.TestDataModel("6",this,this.updateTabForName,[6]),new g4.view.debugger.test.testData.TestDataModel("7",this,this.updateTabForName,[7]),new g4.view.debugger.test.testData.TestDataModel("8",this,this.updateTabForName,[8]),new g4.view.debugger.test.testData.TestDataModel("9",this,this.updateTabForName,[9]),new g4.view.debugger.test.testData.TestDataModel("10",this,this.updateTabForName,[10]),new g4.view.debugger.test.testData.TestDataModel("11",this,this.updateTabForName,[11]),new g4.view.debugger.test.testData.TestDataModel("12",this,this.updateTabForName,[12]),new g4.view.debugger.test.testData.TestDataModel("13",this,this.updateTabForName,[13]),new g4.view.debugger.test.testData.TestDataModel("14",this,this.updateTabForName,[14]),new g4.view.debugger.test.testData.TestDataModel("15",this,this.updateTabForName,[15]),new g4.view.debugger.test.testData.TestDataModel("16",this,this.updateTabForName,[16]),new g4.view.debugger.test.testData.TestDataModel("17",this,this.updateTabForName,[17]),new g4.view.debugger.test.testData.TestDataModel("18",this,this.updateTabForName,[18]),new g4.view.debugger.test.testData.TestDataModel("19",this,this.updateTabForName,[19]),new g4.view.debugger.test.testData.TestDataModel("20",this,this.updateTabForName,[20])]),new g4.view.debugger.test.testData.TestDataModel("탭 갱신 커스텀",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("탭ID",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0",this,this.updateTabCustom_setData,["tabID",0]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.updateTabCustom_setData,["tabID",1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.updateTabCustom_setData,["tabID",2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.updateTabCustom_setData,["tabID",3]),new g4.view.debugger.test.testData.TestDataModel("4",this,this.updateTabCustom_setData,["tabID",4]),new g4.view.debugger.test.testData.TestDataModel("5",this,this.updateTabCustom_setData,["tabID",5])]),new g4.view.debugger.test.testData.TestDataModel("타입",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("메인탭(0)",this,this.updateTabCustom_setData,["type",0]),new g4.view.debugger.test.testData.TestDataModel("분리탭(1)",this,this.updateTabCustom_setData,["type",1])]),new g4.view.debugger.test.testData.TestDataModel("갱신 적용",this,this.updateTabCustom)]),new g4.view.debugger.test.testData.TestDataModel("채팅 모드 (0=축소모드)",this,this.OnGame_Chat_SetChatMode,[0]),new g4.view.debugger.test.testData.TestDataModel("채팅 모드 (1=확장모드)",this,this.OnGame_Chat_SetChatMode,[1]),new g4.view.debugger.test.testData.TestDataModel("채팅 잠금 설정(O)",this,this.OnGame_Chat_SetLock,[true]),new g4.view.debugger.test.testData.TestDataModel("채팅 잠금 설정(X)",this,this.OnGame_Chat_SetLock,[false]),new g4.view.debugger.test.testData.TestDataModel("채널 정보 설정",this,this.OnGame_Chat_SetChannelInfo),new g4.view.debugger.test.testData.TestDataModel("채널 목록 설정(콤보박스)",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0개",this,this.OnGame_Chat_SetChannelList,[0]),new g4.view.debugger.test.testData.TestDataModel("1개",this,this.OnGame_Chat_SetChannelList,[1]),new g4.view.debugger.test.testData.TestDataModel("2개",this,this.OnGame_Chat_SetChannelList,[2]),new g4.view.debugger.test.testData.TestDataModel("3개",this,this.OnGame_Chat_SetChannelList,[3]),new g4.view.debugger.test.testData.TestDataModel("4개",this,this.OnGame_Chat_SetChannelList,[4]),new g4.view.debugger.test.testData.TestDataModel("5개",this,this.OnGame_Chat_SetChannelList,[5]),new g4.view.debugger.test.testData.TestDataModel("6개",this,this.OnGame_Chat_SetChannelList,[6]),new g4.view.debugger.test.testData.TestDataModel("7개",this,this.OnGame_Chat_SetChannelList,[7]),new g4.view.debugger.test.testData.TestDataModel("8개",this,this.OnGame_Chat_SetChannelList,[8]),new g4.view.debugger.test.testData.TestDataModel("9개",this,this.OnGame_Chat_SetChannelList,[9]),new g4.view.debugger.test.testData.TestDataModel("10개",this,this.OnGame_Chat_SetChannelList,[10]),new g4.view.debugger.test.testData.TestDataModel("11개",this,this.OnGame_Chat_SetChannelList,[11]),new g4.view.debugger.test.testData.TestDataModel("12개",this,this.OnGame_Chat_SetChannelList,[12]),new g4.view.debugger.test.testData.TestDataModel("13개",this,this.OnGame_Chat_SetChannelList,[13]),new g4.view.debugger.test.testData.TestDataModel("14개",this,this.OnGame_Chat_SetChannelList,[14])]),new g4.view.debugger.test.testData.TestDataModel("상단",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("공지/메가폰",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("공지/메가폰 표시(O)",this,this.OnGame_Chat_NoticeView,[true]),new g4.view.debugger.test.testData.TestDataModel("공지/메가폰 표시(X)",this,this.OnGame_Chat_NoticeView,[false]),new g4.view.debugger.test.testData.TestDataModel("모드 설정(0=공지사항/메가폰)",this,this.OnGame_Chat_SetNoticeMode,[0]),new g4.view.debugger.test.testData.TestDataModel("모드 설정(1=공지사항)",this,this.OnGame_Chat_SetNoticeMode,[1]),new g4.view.debugger.test.testData.TestDataModel("모드 설정(2=메가폰)",this,this.OnGame_Chat_SetNoticeMode,[2]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("공지 추가",this,this.OnGame_Chat_SetNotice),new g4.view.debugger.test.testData.TestDataModel("메가폰 추가",this,this.OnGame_Chat_SetShout)]),new g4.view.debugger.test.testData.TestDataModel("채팅 제재(O)",this,this.OnGame_Chat_SetPunishment,[true]),new g4.view.debugger.test.testData.TestDataModel("채팅 제재(X)",this,this.OnGame_Chat_SetPunishment,[false])]),new g4.view.debugger.test.testData.TestDataModel("하단",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("채팅 입력 모드(O)",this,this.OnGame_Chat_ChangeChatMode,[true]),new g4.view.debugger.test.testData.TestDataModel("채팅 입력 모드(X)",this,this.OnGame_Chat_ChangeChatMode,[false]),new g4.view.debugger.test.testData.TestDataModel("채팅 입력 모드 토글 시작",this,this.toggleChatMode,[true]),new g4.view.debugger.test.testData.TestDataModel("채팅 입력 모드 토글 중지",this,this.toggleChatMode,[false]),new g4.view.debugger.test.testData.TestDataModel("채널 목록 항목 텍스트 변경",this,this.OnGame_Chat_UpdateChannelList),new g4.view.debugger.test.testData.TestDataModel("채널 변경",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=일반",this,this.OnGame_Chat_ChangeChannel,[0]),new g4.view.debugger.test.testData.TestDataModel("3=가드",this,this.OnGame_Chat_ChangeChannel,[3]),new g4.view.debugger.test.testData.TestDataModel("4=거래",this,this.OnGame_Chat_ChangeChannel,[4]),new g4.view.debugger.test.testData.TestDataModel("7=귓속말",this,this.OnGame_Chat_ChangeChannel,[7]),new g4.view.debugger.test.testData.TestDataModel("27=전체",this,this.OnGame_Chat_ChangeChannel,[27])]),new g4.view.debugger.test.testData.TestDataModel("입력중 채널 변경",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("채널 0",this,this.ChangeInputChannel_setChannelNum,[0]),new g4.view.debugger.test.testData.TestDataModel("채널 3",this,this.ChangeInputChannel_setChannelNum,[3]),new g4.view.debugger.test.testData.TestDataModel("채널 4",this,this.ChangeInputChannel_setChannelNum,[4]),new g4.view.debugger.test.testData.TestDataModel("채널 7",this,this.ChangeInputChannel_setChannelNum,[7]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("clear O",this,this.ChangeInputChannel_setNotClear,[false]),new g4.view.debugger.test.testData.TestDataModel("clear X",this,this.ChangeInputChannel_setNotClear,[true]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("변경하기",this,this.OnGame_Chat_ChangeInputChannel)]),new g4.view.debugger.test.testData.TestDataModel("언어 설정(0=영어)",this,this.OnGame_Chat_SetLanguageInfo,[0]),new g4.view.debugger.test.testData.TestDataModel("언어 설정(1=한글)",this,this.OnGame_Chat_SetLanguageInfo,[1]),new g4.view.debugger.test.testData.TestDataModel("아이템 링크 추가",this,this.OnGame_Chat_AddLink),new g4.view.debugger.test.testData.TestDataModel("입력 텍스트 추가",this,this.OnGame_Chat_AddInputText)]),new g4.view.debugger.test.testData.TestDataModel("채팅 추가",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=일반",this,this.setChannelIndex,[0]),new g4.view.debugger.test.testData.TestDataModel("7=귓속말",this,this.setChannelIndex,[7]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("탭ID : 0",this,this.setTabID,[0]),new g4.view.debugger.test.testData.TestDataModel("탭ID : 1",this,this.setTabID,[1]),new g4.view.debugger.test.testData.TestDataModel("탭ID : 2",this,this.setTabID,[2]),new g4.view.debugger.test.testData.TestDataModel("탭ID : 3",this,this.setTabID,[3]),new g4.view.debugger.test.testData.TestDataModel("탭ID : 4",this,this.setTabID,[4]),new g4.view.debugger.test.testData.TestDataModel("탭ID : 5",this,this.setTabID,[5]),new g4.view.debugger.test.testData.TestDataModel("탭ID : 6",this,this.setTabID,[6]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("addParam : 0",this,this.setData_SetWriting,["addParam",0]),new g4.view.debugger.test.testData.TestDataModel("addParam : 1",this,this.setData_SetWriting,["addParam",1]),new g4.view.debugger.test.testData.TestDataModel("addParam : 2",this,this.setData_SetWriting,["addParam",2]),new g4.view.debugger.test.testData.TestDataModel("addParam : 3",this,this.setData_SetWriting,["addParam",3]),new g4.view.debugger.test.testData.TestDataModel("addParam : 4",this,this.setData_SetWriting,["addParam",4]),new g4.view.debugger.test.testData.TestDataModel("addParam : 5",this,this.setData_SetWriting,["addParam",5]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("채팅 추가",this,this.OnGame_Chat_SetWriting),new g4.view.debugger.test.testData.TestDataModel("채팅 추가 X100",this,this.OnGame_Chat_SetWriting,[100]),new g4.view.debugger.test.testData.TestDataModel("채팅 추가 (특수문자)",this,this.addChatWithSpecialChars)]),new g4.view.debugger.test.testData.TestDataModel("OnGame_Chat_Refresh",this,this.OnGame_Chat_Refresh),new g4.view.debugger.test.testData.TestDataModel("OnGame_Chat_RemakeToHtml",this,this.OnGame_Chat_RemakeToHtml),new g4.view.debugger.test.testData.TestDataModel("채팅 닫기",this,this.OnGame_Chat_Close),new g4.view.debugger.test.testData.TestDataModel("OnGame_Chat_SetInteractionMenu",this,this.OnGame_Chat_SetInteractionMenu),new g4.view.debugger.test.testData.TestDataModel("OnGame_Chat_SaveTabInfo",this,this.OnGame_Chat_SaveTabInfo),new g4.view.debugger.test.testData.TestDataModel("OnGame_Chat_SetShoutNum",this,this.OnGame_Chat_SetShoutNum),new g4.view.debugger.test.testData.TestDataModel("OnGame_Chat_EnableCahnnel",this,this.OnGame_Chat_EnableCahnnel)])]);
      this.init();
   }
   function uiLoadComplete()
   {
      this.setDummyData();
   }
   function init()
   {
      this.updateTabCustom_data = {};
      this.updateTabCustom_data.tabID = 0;
      this.updateTabCustom_data.type = 0;
      this.data_SetWriting = {};
      this.data_SetWriting.addParam = 0;
   }
   function setDummyData()
   {
      this.OnGame_Chat_ResetInfo();
      this.addTabAll();
      this.OnGame_Chat_SetChannelInfo();
      this.OnGame_Chat_SetChannelList(5);
      this.OnGame_Chat_SetWriting();
   }
   function OnGame_Chat_ResetInfo()
   {
      this.tabID = 0;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_ResetInfo");
   }
   function addTabAll()
   {
      var _loc3_ = [{index:0,name:"기본"},{index:1,name:"월드"},{index:2,name:"로그"},{index:3,name:"귓속말"}];
      var _loc4_ = undefined;
      var _loc5_ = undefined;
      var _loc11_ = -1;
      var _loc10_ = -1;
      var _loc7_ = 328;
      var _loc9_ = 216;
      var _loc13_ = 100;
      var _loc12_ = 100;
      var _loc14_ = 0;
      var _loc8_ = false;
      var _loc2_ = undefined;
      var _loc6_ = _loc3_.length;
      _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         _loc4_ = _loc3_[_loc2_].index;
         _loc5_ = _loc3_[_loc2_].name;
         g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_AddTab",_loc4_,_loc5_,_loc11_,_loc10_,_loc7_,_loc9_,_loc13_,_loc12_,_loc14_,_loc8_);
         _loc2_ = _loc2_ + 1;
      }
      this.tabID = 4;
   }
   function addTab()
   {
      this.tabID = this.tabID + 1;
      var _loc2_ = this.tabID;
      var _loc5_ = "새 탭";
      var _loc8_ = -1;
      var _loc7_ = -1;
      var _loc3_ = 328;
      var _loc6_ = 216;
      var _loc10_ = 100;
      var _loc9_ = 100;
      var _loc11_ = 0;
      var _loc4_ = false;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_AddTab",_loc2_,_loc5_,_loc8_,_loc7_,_loc3_,_loc6_,_loc10_,_loc9_,_loc11_,_loc4_);
   }
   function updateTab()
   {
      var _loc6_ = [{index:0,name:"기본"},{index:1,name:"월드"},{index:2,name:"파티"},{index:3,name:"길드"},{index:4,name:"시스템"},{index:5,name:"귓속말"},{index:6,name:"메가폰"}];
      var _loc7_ = undefined;
      var _loc8_ = undefined;
      var _loc4_ = -1;
      var _loc3_ = -1;
      var _loc10_ = 328;
      var _loc12_ = 216;
      var _loc14_ = 100;
      var _loc13_ = 100;
      var _loc5_ = 0;
      var _loc11_ = false;
      var _loc2_ = undefined;
      var _loc9_ = _loc6_.length;
      _loc2_ = 0;
      while(_loc2_ < _loc9_)
      {
         _loc7_ = _loc6_[_loc2_].index;
         _loc8_ = _loc6_[_loc2_].name + this.randRange(0,99);
         if(_loc2_ < 3)
         {
            _loc5_ = 0;
            _loc4_ = -1;
            _loc3_ = -1;
         }
         else
         {
            _loc5_ = 1;
            _loc4_ = 100;
            _loc3_ = 100;
         }
         g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_UpdateTab",_loc7_,_loc8_,_loc4_,_loc3_,_loc10_,_loc12_,_loc14_,_loc13_,_loc5_,_loc11_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateTabForName(nameLength)
   {
      var _loc6_ = [{index:0,name:"기본"},{index:1,name:"월드"},{index:2,name:"파티"},{index:3,name:"길드"},{index:4,name:"시스템"},{index:5,name:"귓속말"},{index:6,name:"메가폰"}];
      var _loc4_ = 0;
      var _loc1_ = "";
      var _loc12_ = -1;
      var _loc11_ = -1;
      var _loc8_ = 328;
      var _loc10_ = 216;
      var _loc14_ = 100;
      var _loc13_ = 100;
      var _loc15_ = 0;
      var _loc9_ = false;
      var _loc3_ = undefined;
      var _loc7_ = _loc6_.length;
      _loc3_ = 0;
      while(_loc3_ < _loc7_)
      {
         _loc4_ = _loc6_[_loc3_].index;
         _loc1_ = "";
         var _loc2_ = 0;
         while(_loc2_ < nameLength)
         {
            if(_loc1_.length > 0)
            {
               _loc1_ = _loc1_ + " ";
            }
            _loc1_ = _loc1_ + String(_loc2_ = _loc2_ + 1);
         }
         g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_UpdateTab",_loc4_,_loc1_,_loc12_,_loc11_,_loc8_,_loc10_,_loc14_,_loc13_,_loc15_,_loc9_);
         _loc3_ = _loc3_ + 1;
      }
   }
   function updateTabCustom_setData(name, value)
   {
      this.updateTabCustom_data[name] = value;
   }
   function updateTabCustom()
   {
      var _loc6_ = this.updateTabCustom_data.tabID;
      var _loc4_ = "탭이름_" + this.randRange(0,99);
      var _loc8_ = this.randRange(0,1600);
      var _loc7_ = this.randRange(0,900);
      var _loc2_ = this.randRange(300,900);
      var _loc5_ = this.randRange(200,900);
      var _loc10_ = 100;
      var _loc9_ = 100;
      var _loc11_ = this.updateTabCustom_data.type;
      var _loc3_ = false;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_UpdateTab",_loc6_,_loc4_,_loc8_,_loc7_,_loc2_,_loc5_,_loc10_,_loc9_,_loc11_,_loc3_);
   }
   function OnGame_Chat_SetChatMode(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_SetChatMode",value);
   }
   function OnGame_Chat_SetLock(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_SetLock",value);
   }
   function OnGame_Chat_SetChannelInfo()
   {
      var _loc1_ = "0\t일반\t0xffffff\t0\t1\t1\t1\n213\t메가폰\t0x00ffff\t0\t1\t1\t1\n1\t파티\t0x0196ff\t0\t1\t1\t1\n2\t길드\t0x40fb40\t0\t1\t1\t1\n3\t가드\t0xaaa7ff\t0\t1\t1\t1\n4\t거래\t0xc37a81\t0\t1\t1\t1\n5\t팀\t0xff7d00\t0\t1\t1\t1\n7\t귓속말\t0xff7eff\t1\t1\t1\t0\n32\t공격대\t0xffcc00\t2\t1\t1\t1\n33\t공격대장\t0xff7d00\t0\t1\t1\t1\n25\t공격대장알림\t0xff7d00\t2\t1\t1\t1\n19\t흥정\t0xffbf8f\t0\t1\t1\t0\n215\t파티찾기(레벨 제한)\t0x44ccff\t0\t1\t1\t1\n20\t파티찾기(모든 레벨 보기)\t0x44ccff\t0\t1\t1\t1\n21\t파티장알림\t0x44ddff\t0\t1\t1\t1\n214\t길드홍보\t0x8cc73e\t0\t1\t1\t1\n27\t전체\t0xf0ff89\t0\t1\t1\t1\n26\t감정표현\t0xffb9b9\t0\t0\t0\t1\n212\t롤플레이\t0xffb9b9\t0\t0\t0\t1\n9\t인사\t0xfff799\t0\t1\t1\t1\n101\t자신의 공격\t0xc4ced0\t0\t0\t0\t0\n102\t자신의 치명타 공격\t0xffb368\t0\t0\t0\t0\n105\t자신의 낙하 데미지\t0xff4f88\t0\t0\t0\t0\n103\t소형 몬스터에 의한 피해\t0xff4f88\t0\t0\t0\t0\n104\t소형 몬스터에 의한 치명 피해\t0xed145b\t0\t0\t0\t0\n106\t일반 몬스터에 의한 피해\t0xff4f88\t0\t0\t0\t0\n107\t일반 몬스터에 의한 치명 피해\t0xed145b\t0\t0\t0\t0\n108\t중형 몬스터에 의한 피해\t0xff4f88\t0\t0\t0\t0\n109\t중형 몬스터에 의한 치명 피해\t0xed145b\t0\t0\t0\t0\n24\t공지\t0xf0ff89\t0\t0\t1\t0\n201\t정보\t0xc8c8b6\t0\t0\t0\t0\n202\t월드 정보\t0xc8c8b6\t0\t0\t0\t0\n203\t오류 정보\t0xee1c24\t0\t0\t0\t0\n204\t파티 정보\t0xd4cfbc\t0\t0\t0\t0\n205\t길드 정보\t0x40fb40\t0\t0\t0\t0\n206\t팀 정보\t0xd9d9d9\t0\t0\t0\t0\n207\t인터랙션 정보\t0xff6565\t0\t0\t0\t0\n208\t경고\t0xee1c24\t0\t0\t0\t0\n216\t아이템 획득(일반)\t0xc8c8b6\t0\t0\t0\t0\n217\t아이템 획득(고급)\t0xc8c8b6\t0\t0\t0\t0\n218\t아이템 획득(희귀)\t0xc8c8b6\t0\t0\t0\t0\n219\t아이템 획득(전설)\t0xc8c8b6\t0\t0\t0\t0\n210\t경험치 획득\t0xc8c8b6\t0\t0\t0\t0\n211\t화폐 획득\t0xc8c8b6\t0\t0\t0\t0\n11\t개인채널1\t0xd5ffc6\t0\t1\t1\t0\n12\t개인채널2\t0xd5ffc6\t0\t1\t1\t0\n13\t개인채널3\t0xd5ffc6\t0\t1\t1\t0\n14\t개인채널4\t0xd5ffc6\t0\t1\t1\t0\n15\t개인채널5\t0xd5ffc6\t0\t1\t1\t0\n16\t개인채널6\t0xd5ffc6\t0\t1\t1\t0\n17\t개인채널7\t0xd5ffc6\t0\t1\t1\t0\n18\t개인채널8\t0xd5ffc6\t0\t1\t1\t0";
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_SetChannelInfo",_loc1_);
   }
   function OnGame_Chat_SetChannelList(count)
   {
      var _loc7_ = this.toggleBoolean("OnGame_Chat_SetChannelList");
      var _loc3_ = undefined;
      if(_loc7_)
      {
         _loc3_ = ["0\t일반(/s)","3\t가드(/a)","4\t거래(/t)","7\t귓속말(/w)","27\t전체(/y)"];
      }
      else
      {
         _loc3_ = ["0\t일반(/s)","32\t공격대(/h)","25\t공격대장알림(/n)","21\t파티장알림(/n)","1\t파티(/p)"];
      }
      var _loc4_ = [];
      var _loc2_ = undefined;
      var _loc5_ = count;
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc4_.push(_loc3_[_loc2_ % _loc3_.length]);
         _loc2_ = _loc2_ + 1;
      }
      var _loc6_ = _loc4_.join("\n");
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_SetChannelList",_loc6_);
   }
   function setChannelIndex(channelIndex)
   {
      this.setWriting_channelIndex = channelIndex;
   }
   function setTabID(tabID)
   {
      this.setWriting_tabID = tabID;
   }
   function OnGame_Chat_SetWriting(count)
   {
      if(isNaN(count))
      {
         count = 1;
      }
      var _loc4_ = undefined;
      var _loc7_ = count;
      _loc4_ = 0;
      while(_loc4_ < _loc7_)
      {
         var _loc2_ = this.setWriting_channelIndex;
         var _loc5_ = "어서오세요. 테라의 세상에 오신걸 환영합니다. " + this.randRange(0,999);
         var _loc6_ = "유저명" + this.randRange(0,999);
         var _loc3_ = -1;
         if(_loc2_ == 7)
         {
            _loc3_ = this.randRange(0,1);
         }
         this._OnGame_Chat_SetWriting(_loc2_,_loc5_,_loc6_,_loc3_);
         _loc4_ = _loc4_ + 1;
      }
   }
   function addChatWithSpecialChars()
   {
      var _loc2_ = this.setWriting_channelIndex;
      var _loc4_ = "특수문자 테스트 ♪♪♬♬" + this.randRange(0,999);
      var _loc5_ = "유저명" + this.randRange(0,999);
      var _loc3_ = -1;
      if(_loc2_ == 7)
      {
         _loc3_ = this.randRange(0,1);
      }
      this._OnGame_Chat_SetWriting(_loc2_,_loc4_,_loc5_,_loc3_);
   }
   function setData_SetWriting(name, value)
   {
      this.data_SetWriting[name] = value;
   }
   function _OnGame_Chat_SetWriting(channelIndex, writing, id, wisperType)
   {
      var _loc3_ = String(this.setWriting_tabID);
      writing = "<FONT>" + writing + "</FONT>";
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_SetWriting",channelIndex,writing,id,this.data_SetWriting.addParam,_loc3_,wisperType);
   }
   function OnGame_Chat_Refresh()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_Refresh");
   }
   function OnGame_Chat_ChangeChatMode(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_ChangeChatMode",value);
   }
   function toggleChatMode(start)
   {
      if(this.toggleChatMode_intervalID != 0)
      {
         clearInterval(this.toggleChatMode_intervalID);
         this.toggleChatMode_intervalID = 0;
      }
      if(start)
      {
         this.toggleChatMode_intervalID = setInterval(this,"_toggleChatMode",1000);
      }
   }
   function _toggleChatMode()
   {
      this.chatMode = !this.chatMode;
      this.OnGame_Chat_ChangeChatMode(this.chatMode);
   }
   function OnGame_Chat_AddLink()
   {
      var _loc5_ = this.randRange(1,5);
      var _loc3_ = "32285@27@brute0001";
      var _loc2_ = "(+500) 테스트속옷_일반_성능레벨65";
      var _loc4_ = 3;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_AddLink",_loc5_,_loc3_,_loc2_,_loc4_);
   }
   function OnGame_Chat_AddInputText()
   {
      var _loc2_ = "텍스트" + this.randRange(0,999);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_AddInputText",_loc2_);
   }
   function OnGame_Chat_SetInteractionMenu()
   {
      var _loc2_ = "유저명" + this.randRange(0,999);
      var _loc3_ = this.randRange(0,10);
      var _loc5_ = "직업" + this.randRange(0,999);
      var _loc4_ = this.randRange(1,65);
      var _loc6_ = "0\t메뉴1\n1\t메뉴2\n2\t메뉴3\n3\t메뉴4\n4\t메뉴5";
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_SetInteractionMenu",_loc2_,_loc3_,_loc5_,_loc4_,_loc6_);
   }
   function OnGame_Chat_SaveTabInfo()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_SaveTabInfo");
   }
   function OnGame_Chat_EnableCahnnel()
   {
      var _loc4_ = this.randRange(0,1);
      var _loc3_ = this.randRange(0,1);
      var _loc2_ = this.randRange(0,2);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_EnableCahnnel",_loc4_,_loc3_,_loc2_);
   }
   function ChangeInputChannel_setChannelNum(value)
   {
      this.ChangeInputChannel_channelNum = value;
   }
   function ChangeInputChannel_setNotClear(value)
   {
      this.ChangeInputChannel_notClear = value;
   }
   function OnGame_Chat_ChangeInputChannel()
   {
      var _loc2_ = "대상유저이름" + this.randRange(0,999);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_ChangeInputChannel",this.ChangeInputChannel_channelNum,_loc2_,this.ChangeInputChannel_notClear);
   }
   function OnGame_Chat_SetPunishment(bShow)
   {
      var _loc1_ = undefined;
      if(bShow)
      {
         _loc1_ = "2018/02/25/17/42/33";
      }
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_SetPunishment",bShow,_loc1_);
   }
   function OnGame_Chat_NoticeView(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_NoticeView",value);
   }
   function OnGame_Chat_SetNoticeMode(type)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_SetNoticeMode",type);
   }
   function OnGame_Chat_SetNotice()
   {
      var _loc2_ = "공지 텍스트 " + this.randRange(0,999);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_SetNotice",_loc2_);
      this._OnGame_Chat_SetWriting(24,_loc2_,"",-1);
   }
   function OnGame_Chat_SetShout()
   {
      var _loc3_ = "메가폰 텍스트";
      var _loc5_ = "0xFF0000";
      var _loc2_ = "유저명";
      var _loc4_ = "0x00FF00";
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_SetShout",_loc3_,_loc5_,_loc2_,_loc4_);
      this._OnGame_Chat_SetWriting(213,_loc3_,_loc2_,-1);
   }
   function OnGame_Chat_RemakeToHtml()
   {
      var _loc4_ = this.randRange(0,1);
      var _loc2_ = "변환할 메시지";
      var _loc3_ = "받을사람";
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_RemakeToHtml",_loc4_,_loc2_,_loc3_);
   }
   function OnGame_Chat_Close()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_Close");
   }
   function OnGame_Chat_SetShoutNum()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_SetShoutNum");
   }
   function OnGame_Chat_UpdateChannelList()
   {
      var _loc3_ = this.randValueOne(0,3,4);
      var _loc2_ = "";
      switch(_loc3_)
      {
         case 0:
            _loc2_ = "일반(/s)";
            break;
         case 3:
            _loc2_ = "가드(/a)";
            break;
         case 4:
            _loc2_ = "거래(/t)";
      }
      _loc2_ = _loc2_ + (" " + this.randRange(0,99));
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_UpdateChannelList",_loc3_,_loc2_);
   }
   function OnGame_Chat_ChangeChannel(channelID)
   {
      var _loc2_ = "대상유저명" + this.randRange(0,99);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_ChangeChannel",channelID,_loc2_);
   }
   function OnGame_Chat_SetLanguageInfo(language)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_Chat_SetLanguageInfo",language);
   }
   function changeInputChannel(start)
   {
      if(this.changeInputChannel_intervalID != 0)
      {
         clearInterval(this.changeInputChannel_intervalID);
         this.changeInputChannel_intervalID = 0;
      }
      if(start)
      {
         this.changeInputChannel_intervalID = setInterval(this,"_changeInputChannel",1000);
      }
   }
   function _changeInputChannel()
   {
      var _loc2_ = this.randValueOne(0,3,4,7,27);
      this.OnGame_Chat_ChangeChannel(_loc2_);
   }
}
