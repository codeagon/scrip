class g4.view.debugger.test.testData.PartyWindowTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   var targetMemberIndex = 0;
   var _diceDistributionData_value = 0;
   var _diceDistributionData_flag = 0;
   var _diceDistributionIcon_grade = 0;
   var _diceDistributionIcon_sealed = 0;
   var _setSameWorld_state = false;
   var _setSameWorld_inRange = false;
   var _setClazz_clazz = 0;
   var _setClazz_gageType = 0;
   var _setClazz_position = 0;
   var autoIncreasedBuffID = 1000;
   var _addBuff_fixedID = -1;
   var _addBuff_type = 0;
   var _addBuff_group = 0;
   var _addBuff_stackCount = 0;
   var _addBuff_time = 10;
   var _addBuff_relaxMerit = false;
   function PartyWindowTestData()
   {
      super(g4.view.ViewID.PARTY_WINDOW,"파티",[new g4.view.debugger.test.testData.TestDataModel("멤버 상태 관련",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("멤버 구성",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("1",this,this.addMembers,[1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.addMembers,[2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.addMembers,[3]),new g4.view.debugger.test.testData.TestDataModel("4",this,this.addMembers,[4]),new g4.view.debugger.test.testData.TestDataModel("5",this,this.addMembers,[5])]),new g4.view.debugger.test.testData.TestDataModel("모든 멤버 제거",this,this.clearMembers),new g4.view.debugger.test.testData.TestDataModel("타겟 멤버 선택",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0",this,this.member_setTargetMemberIndex,[0]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.member_setTargetMemberIndex,[1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.member_setTargetMemberIndex,[2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.member_setTargetMemberIndex,[3])]),new g4.view.debugger.test.testData.TestDataModel("멤버 이름 변경 (길게)",this,this.updateMemberName,[true]),new g4.view.debugger.test.testData.TestDataModel("멤버 이름 변경 (짧게)",this,this.updateMemberName,[false]),new g4.view.debugger.test.testData.TestDataModel("멤버 레벨 변경",this,this.updateMemberLevel),new g4.view.debugger.test.testData.TestDataModel("직업 관련 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("직업",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=검투사",this,this.setClazz_clazz,[0]),new g4.view.debugger.test.testData.TestDataModel("1=창기사",this,this.setClazz_clazz,[1]),new g4.view.debugger.test.testData.TestDataModel("2=무사",this,this.setClazz_clazz,[2]),new g4.view.debugger.test.testData.TestDataModel("3=광전사",this,this.setClazz_clazz,[3]),new g4.view.debugger.test.testData.TestDataModel("4=마법사",this,this.setClazz_clazz,[4]),new g4.view.debugger.test.testData.TestDataModel("5=궁사",this,this.setClazz_clazz,[5]),new g4.view.debugger.test.testData.TestDataModel("6=사제",this,this.setClazz_clazz,[6]),new g4.view.debugger.test.testData.TestDataModel("7=정령사",this,this.setClazz_clazz,[7]),new g4.view.debugger.test.testData.TestDataModel("8=비검사",this,this.setClazz_clazz,[8]),new g4.view.debugger.test.testData.TestDataModel("9=마도공학자",this,this.setClazz_clazz,[9]),new g4.view.debugger.test.testData.TestDataModel("10=권술사",this,this.setClazz_clazz,[10]),new g4.view.debugger.test.testData.TestDataModel("11=인술사",this,this.setClazz_clazz,[11]),new g4.view.debugger.test.testData.TestDataModel("12=창술사",this,this.setClazz_clazz,[12]),new g4.view.debugger.test.testData.TestDataModel("20=공성병기",this,this.setClazz_clazz,[20]),new g4.view.debugger.test.testData.TestDataModel("21=비공정",this,this.setClazz_clazz,[21]),new g4.view.debugger.test.testData.TestDataModel("22=몬스터",this,this.setClazz_clazz,[22])]),new g4.view.debugger.test.testData.TestDataModel("추가 게이지 표시여부",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=없음",this,this.setClazz_gageType,[0]),new g4.view.debugger.test.testData.TestDataModel("1=ST게이지",this,this.setClazz_gageType,[1]),new g4.view.debugger.test.testData.TestDataModel("2=DG게이지",this,this.setClazz_gageType,[2])]),new g4.view.debugger.test.testData.TestDataModel("포지션",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=guard",this,this.setClazz_position,[0]),new g4.view.debugger.test.testData.TestDataModel("1=dealer",this,this.setClazz_position,[1]),new g4.view.debugger.test.testData.TestDataModel("2=healer",this,this.setClazz_position,[2])])]),new g4.view.debugger.test.testData.TestDataModel("상태 아이콘들",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("연합 파티 O",this,this.setPartyRaid,[true]),new g4.view.debugger.test.testData.TestDataModel("연합 파티 X",this,this.setPartyRaid,[false]),new g4.view.debugger.test.testData.TestDataModel("각성 O",this,this.setAwaken,[true]),new g4.view.debugger.test.testData.TestDataModel("각성 X",this,this.setAwaken,[false]),new g4.view.debugger.test.testData.TestDataModel("전투상태 O",this,this.setBattleState,[true]),new g4.view.debugger.test.testData.TestDataModel("전투상태 X",this,this.setBattleState,[false])]),new g4.view.debugger.test.testData.TestDataModel("업적 등급 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=일반",this,this.setAchievement,[0]),new g4.view.debugger.test.testData.TestDataModel("1=브론즈",this,this.setAchievement,[1]),new g4.view.debugger.test.testData.TestDataModel("2=실버",this,this.setAchievement,[2]),new g4.view.debugger.test.testData.TestDataModel("3=골드",this,this.setAchievement,[3]),new g4.view.debugger.test.testData.TestDataModel("4=다이아",this,this.setAchievement,[4]),new g4.view.debugger.test.testData.TestDataModel("5=챔피언",this,this.setAchievement,[5])]),new g4.view.debugger.test.testData.TestDataModel("HP 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("current 0 / max 100 / add 0",this,this.setHP,[0,100,0]),new g4.view.debugger.test.testData.TestDataModel("current 10 / max 100 / add 0",this,this.setHP,[10,100,0]),new g4.view.debugger.test.testData.TestDataModel("current 20 / max 100 / add 0",this,this.setHP,[20,100,0]),new g4.view.debugger.test.testData.TestDataModel("current 50 / max 100 / add 0",this,this.setHP,[50,100,0]),new g4.view.debugger.test.testData.TestDataModel("current 100 / max 100 / add 0",this,this.setHP,[100,100,0]),new g4.view.debugger.test.testData.TestDataModel("current 0 / max 100 / add 100",this,this.setHP,[0,100,100]),new g4.view.debugger.test.testData.TestDataModel("current 10 / max 100 / add 100",this,this.setHP,[10,100,100]),new g4.view.debugger.test.testData.TestDataModel("current 20 / max 100 / add 100",this,this.setHP,[20,100,100]),new g4.view.debugger.test.testData.TestDataModel("current 50 / max 100 / add 100",this,this.setHP,[50,100,100]),new g4.view.debugger.test.testData.TestDataModel("current 100 / max 100 / add 100",this,this.setHP,[100,100,100])]),new g4.view.debugger.test.testData.TestDataModel("MP 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("current 0 / max 100 / add 0",this,this.setMP,[0,100,0]),new g4.view.debugger.test.testData.TestDataModel("current 10 / max 100 / add 0",this,this.setMP,[10,100,0]),new g4.view.debugger.test.testData.TestDataModel("current 20 / max 100 / add 0",this,this.setMP,[20,100,0]),new g4.view.debugger.test.testData.TestDataModel("current 50 / max 100 / add 0",this,this.setMP,[50,100,0]),new g4.view.debugger.test.testData.TestDataModel("current 100 / max 100 / add 0",this,this.setMP,[100,100,0]),new g4.view.debugger.test.testData.TestDataModel("current 0 / max 100 / add 100",this,this.setMP,[0,100,100]),new g4.view.debugger.test.testData.TestDataModel("current 10 / max 100 / add 100",this,this.setMP,[10,100,100]),new g4.view.debugger.test.testData.TestDataModel("current 20 / max 100 / add 100",this,this.setMP,[20,100,100]),new g4.view.debugger.test.testData.TestDataModel("current 50 / max 100 / add 100",this,this.setMP,[50,100,100]),new g4.view.debugger.test.testData.TestDataModel("current 100 / max 100 / add 100",this,this.setMP,[100,100,100])]),new g4.view.debugger.test.testData.TestDataModel("디버프 상태 표시 O",this,this.setDebuffState,[true]),new g4.view.debugger.test.testData.TestDataModel("디버프 상태 표시 X",this,this.setDebuffState,[false]),new g4.view.debugger.test.testData.TestDataModel("주사위 분배",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("시작 : 0=주사위 분배",this,this.diceDistributionStart,[0]),new g4.view.debugger.test.testData.TestDataModel("시작 : 1=담당자 분배",this,this.diceDistributionStart,[1]),new g4.view.debugger.test.testData.TestDataModel("값 입력",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("주사위 값 : 0",this,this.diceDistributionData_value,[0]),new g4.view.debugger.test.testData.TestDataModel("주사위 값 : 50",this,this.diceDistributionData_value,[50]),new g4.view.debugger.test.testData.TestDataModel("주사위 값 : 100",this,this.diceDistributionData_value,[100]),new g4.view.debugger.test.testData.TestDataModel("주사위 값 : 150",this,this.diceDistributionData_value,[150]),new g4.view.debugger.test.testData.TestDataModel("주사위 값 : 200",this,this.diceDistributionData_value,[200]),new g4.view.debugger.test.testData.TestDataModel("주사위 값 : 250",this,this.diceDistributionData_value,[250]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("0=최고값아님",this,this.diceDistributionData_flag,[false]),new g4.view.debugger.test.testData.TestDataModel("1=최고값",this,this.diceDistributionData_flag,[true])]),new g4.view.debugger.test.testData.TestDataModel("아이콘",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("아이템등급",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=일반",this,this.diceDistributionIcon_grade,[0]),new g4.view.debugger.test.testData.TestDataModel("1=고급",this,this.diceDistributionIcon_grade,[1]),new g4.view.debugger.test.testData.TestDataModel("2=희귀",this,this.diceDistributionIcon_grade,[2]),new g4.view.debugger.test.testData.TestDataModel("3=전설",this,this.diceDistributionIcon_grade,[3])]),new g4.view.debugger.test.testData.TestDataModel("봉인",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=봉인아님",this,this.diceDistributionIcon_sealed,[0]),new g4.view.debugger.test.testData.TestDataModel("1=일반봉인",this,this.diceDistributionIcon_sealed,[1]),new g4.view.debugger.test.testData.TestDataModel("2=태고의봉인",this,this.diceDistributionIcon_sealed,[2])])]),new g4.view.debugger.test.testData.TestDataModel("끝",this,this.diceDistributionEnd)]),new g4.view.debugger.test.testData.TestDataModel("파티장/파티원 상태 등",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("파티장 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=파티원",this,this.setPartyMaster,[0]),new g4.view.debugger.test.testData.TestDataModel("1=일반파티장",this,this.setPartyMaster,[1]),new g4.view.debugger.test.testData.TestDataModel("2=연합파티장",this,this.setPartyMaster,[2])]),new g4.view.debugger.test.testData.TestDataModel("파티원 대기상태",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=확인중",this,this.setPartyRaidReady,[0]),new g4.view.debugger.test.testData.TestDataModel("1=전투 준비 상태",this,this.setPartyRaidReady,[1]),new g4.view.debugger.test.testData.TestDataModel("2=전투 준비중",this,this.setPartyRaidReady,[2])])]),new g4.view.debugger.test.testData.TestDataModel("Blur 상태 관련",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("접속 O",this,this.setConnection,[true]),new g4.view.debugger.test.testData.TestDataModel("접속 X",this,this.setConnection,[false]),new g4.view.debugger.test.testData.TestDataModel("생존 O",this,this.setSurvival,[true]),new g4.view.debugger.test.testData.TestDataModel("생존 X",this,this.setSurvival,[false]),new g4.view.debugger.test.testData.TestDataModel("위치",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("같은월드 O",this,this.setSameWorld_state,[true]),new g4.view.debugger.test.testData.TestDataModel("같은월드 X",this,this.setSameWorld_state,[false]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("경험치사정권 O",this,this.setSameWorld_inRange,[true]),new g4.view.debugger.test.testData.TestDataModel("경험치사정권 X",this,this.setSameWorld_inRange,[false])])])]),new g4.view.debugger.test.testData.TestDataModel("버프 관련",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("버프 ID 고정 X",this,this.addBuff_fixedID,[-1]),new g4.view.debugger.test.testData.TestDataModel("버프 ID 고정 1",this,this.addBuff_fixedID,[1]),new g4.view.debugger.test.testData.TestDataModel("버프 ID 고정 2",this,this.addBuff_fixedID,[2]),new g4.view.debugger.test.testData.TestDataModel("버프 ID 고정 3",this,this.addBuff_fixedID,[3]),new g4.view.debugger.test.testData.TestDataModel("버프 ID 고정 4",this,this.addBuff_fixedID,[4]),new g4.view.debugger.test.testData.TestDataModel("버프 ID 고정 5",this,this.addBuff_fixedID,[5]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("0=버프",this,this.addBuff_type,[0]),new g4.view.debugger.test.testData.TestDataModel("1=디버프",this,this.addBuff_type,[1]),new g4.view.debugger.test.testData.TestDataModel("2=상태약화디버프",this,this.addBuff_type,[2]),new g4.view.debugger.test.testData.TestDataModel("3=지속피해디버프",this,this.addBuff_type,[3]),new g4.view.debugger.test.testData.TestDataModel("4=행동불능디버프",this,this.addBuff_type,[4]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("0=그룹없음",this,this.addBuff_group,[0]),new g4.view.debugger.test.testData.TestDataModel("1=기타",this,this.addBuff_group,[1]),new g4.view.debugger.test.testData.TestDataModel("2=도핑",this,this.addBuff_group,[2]),new g4.view.debugger.test.testData.TestDataModel("3=스킬",this,this.addBuff_group,[3]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("릴렉스메리트 버프 O",this,this.addBuff_relaxMerit,[true]),new g4.view.debugger.test.testData.TestDataModel("릴렉스메리트 버프 X",this,this.addBuff_relaxMerit,[false]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("중첩개수 0",this,this.addBuff_stackCount,[0]),new g4.view.debugger.test.testData.TestDataModel("중첩개수 1",this,this.addBuff_stackCount,[1]),new g4.view.debugger.test.testData.TestDataModel("중첩개수 10",this,this.addBuff_stackCount,[10]),new g4.view.debugger.test.testData.TestDataModel("중첩개수 100",this,this.addBuff_stackCount,[100]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("시간 1",this,this.addBuff_time,[1]),new g4.view.debugger.test.testData.TestDataModel("시간 10",this,this.addBuff_time,[10]),new g4.view.debugger.test.testData.TestDataModel("시간 50",this,this.addBuff_time,[50]),new g4.view.debugger.test.testData.TestDataModel("시간 61",this,this.addBuff_time,[61]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("버프 추가하기",this,this.addBuff),new g4.view.debugger.test.testData.TestDataModel("버프 추가하기 (x10)",this,this.addBuffs,[10]),new g4.view.debugger.test.testData.TestDataModel("버프 제거하기",this,this.removeBuff),new g4.view.debugger.test.testData.TestDataModel("버프 모두 제거",this,this.removeBuffAll),new g4.view.debugger.test.testData.TestDataModel("지속 시간 멈춤 O",this,this.setTimePause,[true]),new g4.view.debugger.test.testData.TestDataModel("지속 시간 멈춤 X",this,this.setTimePause,[false])]),new g4.view.debugger.test.testData.TestDataModel("파티 상태 관련",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("dismissDisible O",this,this.OnGame_PartyWindow_SetDismissDisable,[true]),new g4.view.debugger.test.testData.TestDataModel("dismissDisible X",this,this.OnGame_PartyWindow_SetDismissDisable,[false]),new g4.view.debugger.test.testData.TestDataModel("banDisible O",this,this.OnGame_PartyWindow_SetBanDisable,[true]),new g4.view.debugger.test.testData.TestDataModel("banDisible X",this,this.OnGame_PartyWindow_SetBanDisable,[false]),new g4.view.debugger.test.testData.TestDataModel("inParty O",this,this.OnGame_PartyWindow_SetInParty,[true]),new g4.view.debugger.test.testData.TestDataModel("inParty X",this,this.OnGame_PartyWindow_SetInParty,[false]),new g4.view.debugger.test.testData.TestDataModel("OnGameEventAmIPartyMaster",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=파티원",this,this.OnGameEventAmIPartyMaster,[0]),new g4.view.debugger.test.testData.TestDataModel("1=파티장",this,this.OnGameEventAmIPartyMaster,[1]),new g4.view.debugger.test.testData.TestDataModel("2=연합파티장",this,this.OnGameEventAmIPartyMaster,[2]),new g4.view.debugger.test.testData.TestDataModel("3=연합파티원",this,this.OnGameEventAmIPartyMaster,[3]),new g4.view.debugger.test.testData.TestDataModel("4=연합파티분배담당",this,this.OnGameEventAmIPartyMaster,[4])]),new g4.view.debugger.test.testData.TestDataModel("OnGame_PartyWindow_SetPartyMemberState",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("파티 멤버 2명, 초대권한 1명",this,this.OnGame_PartyWindow_SetPartyMemberState,[2,1]),new g4.view.debugger.test.testData.TestDataModel("파티 멤버 2명, 초대권한 2명",this,this.OnGame_PartyWindow_SetPartyMemberState,[2,2]),new g4.view.debugger.test.testData.TestDataModel("파티 멤버 5명, 초대권한 0명",this,this.OnGame_PartyWindow_SetPartyMemberState,[5,0]),new g4.view.debugger.test.testData.TestDataModel("파티 멤버 10명, 초대권한 3명",this,this.OnGame_PartyWindow_SetPartyMemberState,[10,3])])]),new g4.view.debugger.test.testData.TestDataModel("일괄 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("#1",this,this.batchSetting1),new g4.view.debugger.test.testData.TestDataModel("멤버 구성 테스트",this,this.test_member),new g4.view.debugger.test.testData.TestDataModel("버프일괄설정",this,this.addManyBuffs1)])]);
   }
   function uiLoadComplete()
   {
      this.batchSetting1();
   }
   function member_setTargetMemberIndex(memberIndex)
   {
      this.targetMemberIndex = memberIndex;
   }
   function addMembers(count)
   {
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      var _loc3_ = 0;
      var _loc5_ = count;
      _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc2_ = _loc3_;
         _loc4_ = "username_" + _loc2_;
         this.OnGameEventPartyWindowShow(_loc2_,true);
         g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventPartyMemberAdd",_loc2_,_loc4_);
         this.OnGame_PartyWindow_SetSameWorld(_loc2_,true,true);
         this.OnGame_PartyWindow_SetSurvival(_loc2_,true);
         this.OnGame_PartyWindow_SetConnection(_loc2_,true);
         _loc3_ = _loc3_ + 1;
      }
   }
   function updateMemberName(bLong)
   {
      var _loc2_ = undefined;
      if(bLong)
      {
         _loc2_ = "very_very_very_very_long_username_" + this.randRange(100,999);
      }
      else
      {
         _loc2_ = "username_" + this.randRange(100,999);
      }
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventPartyMemberUpdateUserName",this.targetMemberIndex,_loc2_);
   }
   function updateMemberLevel()
   {
      var _loc2_ = this.randRange(0,99);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventPartyMemberUpdateUserLevel",this.targetMemberIndex,_loc2_);
   }
   function clearMembers()
   {
      var _loc2_ = undefined;
      var _loc3_ = 5;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this.OnGameEventPartyWindowShow(_loc2_,false);
         _loc2_ = _loc2_ + 1;
      }
   }
   function OnGameEventPartyWindowShow(memberID, show)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventPartyWindowShow",memberID,show);
   }
   function setBattleState(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventPartyMemberUpdateBattleState",this.targetMemberIndex,value);
   }
   function setMP(current, max, maxAdd)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventPartyMemberUpdateMP",this.targetMemberIndex,current,max,maxAdd);
   }
   function setHP(current, max, maxAdd)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventPartyMemberUpdateHP",this.targetMemberIndex,current,max,maxAdd);
   }
   function setAchievement(grade)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_AchievementRating",this.targetMemberIndex,grade);
   }
   function setDebuffState(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_DebuffState",this.targetMemberIndex,value);
   }
   function diceDistributionStart(type)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventPartyMember_DiceDistributionStart",this.targetMemberIndex,type);
   }
   function diceDistributionData_value(value)
   {
      this._diceDistributionData_value = value;
      this.diceDistributionData();
   }
   function diceDistributionData_flag(flag)
   {
      this._diceDistributionData_flag = flag;
      this.diceDistributionData();
   }
   function diceDistributionData()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventPartyMember_DiceDistributionData",this.targetMemberIndex,this._diceDistributionData_value,this._diceDistributionData_flag);
   }
   function diceDistributionIcon_grade(grade)
   {
      this._diceDistributionIcon_grade = grade;
      this.diceDistributionIcon();
   }
   function diceDistributionIcon_sealed(sealed)
   {
      this._diceDistributionIcon_sealed = sealed;
      this.diceDistributionIcon();
   }
   function diceDistributionIcon()
   {
      var _loc2_ = [];
      _loc2_.push(this.targetMemberIndex);
      _loc2_.push("Icon_1_TEX");
      _loc2_.push(this._diceDistributionIcon_grade);
      _loc2_.push(this._diceDistributionIcon_sealed);
      var _loc3_ = _loc2_.join("\t");
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventPartyMember_DiceDistributionIcon",_loc3_);
   }
   function diceDistributionEnd()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventPartyMember_DiceDistributionEnd",this.targetMemberIndex);
   }
   function setAwaken(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_SetAwaken",this.targetMemberIndex,value);
   }
   function setPartyRaid(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_SetPartyRaid",this.targetMemberIndex,value);
   }
   function setPartyRaidReady(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_SetPartyRaidReady",this.targetMemberIndex,value);
   }
   function setPartyMaster(type)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_SetPartyMaster",this.targetMemberIndex,type);
   }
   function setSameWorld_state(value)
   {
      this._setSameWorld_state = value;
      this.setSameWorld();
   }
   function setSameWorld_inRange(value)
   {
      this._setSameWorld_inRange = value;
      this.setSameWorld();
   }
   function setSameWorld()
   {
      this.OnGame_PartyWindow_SetSameWorld(this.targetMemberIndex,this._setSameWorld_state,this._setSameWorld_inRange);
   }
   function OnGame_PartyWindow_SetSameWorld(memberID, inSameWorld, inRange)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_SetSameWorld",memberID,inSameWorld,inRange);
   }
   function setSurvival(value)
   {
      this.OnGame_PartyWindow_SetSurvival(this.targetMemberIndex,value);
   }
   function OnGame_PartyWindow_SetSurvival(memberID, survival)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_SetSurvival",memberID,survival);
   }
   function setConnection(value)
   {
      this.OnGame_PartyWindow_SetConnection(this.targetMemberIndex,value);
   }
   function OnGame_PartyWindow_SetConnection(memberID, connected)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_SetConnection",memberID,connected);
   }
   function setClazz_clazz(value)
   {
      this._setClazz_clazz = value;
      this.setClazz();
   }
   function setClazz_gageType(value)
   {
      this._setClazz_gageType = value;
      this.setClazz();
   }
   function setClazz_position(value)
   {
      this._setClazz_position = value;
      this.setClazz();
   }
   function setClazz()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_SetClass",this.targetMemberIndex,this._setClazz_clazz,this._setClazz_gageType,this._setClazz_position);
   }
   function addBuff_fixedID(value)
   {
      this._addBuff_fixedID = value;
   }
   function addBuff_type(type)
   {
      this._addBuff_type = type;
   }
   function addBuff_group(group)
   {
      this._addBuff_group = group;
   }
   function addBuff_stackCount(value)
   {
      this._addBuff_stackCount = value;
   }
   function addBuff_time(time)
   {
      this._addBuff_time = time;
   }
   function addBuff_relaxMerit(value)
   {
      this._addBuff_relaxMerit = value;
   }
   function addBuffs(count)
   {
      while((count = count - 1) >= 0)
      {
         this.addBuff();
      }
   }
   function addBuff()
   {
      var _loc2_ = undefined;
      if(this._addBuff_fixedID != -1)
      {
         _loc2_ = this._addBuff_fixedID;
      }
      else
      {
         _loc2_ = this.autoIncreasedBuffID = this.autoIncreasedBuffID + 1;
      }
      var _loc4_ = undefined;
      if(this._addBuff_type == 0)
      {
         _loc4_ = "Icon_1_TEX";
      }
      else
      {
         _loc4_ = "Icon_2_TEX";
      }
      var _loc3_ = this._addBuff_time * 1000;
      var _loc5_ = _loc3_ * 2;
      this.OnGame_PartyWindow_AddBuff(this.targetMemberIndex,this.autoIncreasedBuffID = this.autoIncreasedBuffID + 1,this._addBuff_stackCount,this._addBuff_type,this._addBuff_group,this._addBuff_relaxMerit,_loc4_,_loc3_,_loc5_);
   }
   function OnGame_PartyWindow_AddBuff(memberID, buffID, stackCount, buffType, buffGroup, relaxMerit, image, timeRemaining, timeMax)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_AddBuff",memberID,buffID,stackCount,buffType,buffGroup,relaxMerit,image,timeRemaining,timeMax);
   }
   function removeBuff()
   {
      var _loc2_ = undefined;
      if(this._addBuff_fixedID != -1)
      {
         _loc2_ = this._addBuff_fixedID;
      }
      else
      {
         this.autoIncreasedBuffID = this.autoIncreasedBuffID - 1;
         _loc2_ = this.autoIncreasedBuffID;
      }
      if(_loc2_ < 0)
      {
         return undefined;
      }
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_RemoveBuff",this.targetMemberIndex,_loc2_,this._addBuff_group);
   }
   function removeBuffAll()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_ClearBuff",this.targetMemberIndex);
   }
   function setTimePause(bPause)
   {
      var _loc2_ = undefined;
      if(this._addBuff_fixedID != -1)
      {
         _loc2_ = this._addBuff_fixedID;
      }
      else
      {
         _loc2_ = this.autoIncreasedBuffID;
      }
      this.OnGame_PartyWindow_SetTimePause(this.targetMemberIndex,_loc2_,bPause);
   }
   function OnGame_PartyWindow_SetDismissDisable(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_SetDismissDisable",value);
   }
   function OnGame_PartyWindow_SetBanDisable(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_SetBanDisable",value);
   }
   function OnGame_PartyWindow_SetInParty(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_SetInParty",value);
   }
   function OnGameEventAmIPartyMaster(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventAmIPartyMaster",value);
   }
   function OnGame_PartyWindow_SetPartyMemberState(totalCount, hasInvitationCount)
   {
      var _loc4_ = [];
      var _loc2_ = undefined;
      var _loc1_ = undefined;
      var _loc5_ = totalCount;
      _loc1_ = 0;
      while(_loc1_ < _loc5_)
      {
         var _loc3_ = _loc1_ < hasInvitationCount;
         _loc2_ = [];
         _loc2_.push(_loc1_);
         _loc2_.push("이름_" + _loc1_);
         _loc2_.push(!_loc3_?2:1);
         _loc4_.push(_loc2_.join("\t"));
         _loc1_ = _loc1_ + 1;
      }
      _loc4_.sort(function(a, b)
      {
         return Math.random() >= 0.5?1:-1;
      }
      );
      var _loc7_ = _loc4_.join("\n");
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_SetPartyMemberState",_loc7_);
   }
   function batchSetting1()
   {
      this.addMembers(4);
      this.OnGame_PartyWindow_SetDismissDisable(false);
      this.OnGame_PartyWindow_SetBanDisable(false);
      this.OnGame_PartyWindow_SetInParty(true);
      this.OnGameEventAmIPartyMaster(2);
      this.OnGame_PartyWindow_SetPartyMemberState(20,10);
   }
   function test_member()
   {
      var _loc2_ = 1;
      var _loc1_ = "검투사";
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventPartyMemberAdd",_loc2_,_loc1_);
   }
   function addManyBuffs1()
   {
      var _loc2_ = 0;
      this.add10Buffs(_loc2_,0,0,1000);
      this.add10Buffs(_loc2_,0,1,2000);
      this.add10Buffs(_loc2_,0,2,3000);
      this.add10Buffs(_loc2_,0,3,4000);
      this.add10Buffs(_loc2_,2,0,5000);
   }
   function add10Buffs(memberID, buffType, buffGroup, startBuffID)
   {
      var _loc5_ = 1;
      var _loc6_ = false;
      var _loc4_ = undefined;
      if(buffType == 0)
      {
         _loc4_ = "Icon_1_TEX";
      }
      else
      {
         _loc4_ = "Icon_2_TEX";
      }
      var _loc13_ = 60;
      var _loc3_ = _loc13_ * 1000;
      var _loc8_ = _loc3_ * 2;
      var _loc1_ = undefined;
      var _loc7_ = 10;
      _loc1_ = 0;
      while(_loc1_ < _loc7_)
      {
         var _loc2_ = startBuffID + _loc1_;
         g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_AddBuff",memberID,_loc2_,_loc5_,buffType,buffGroup,_loc6_,_loc4_,_loc3_,_loc8_);
         _loc1_ = _loc1_ + 1;
      }
   }
   function OnGame_PartyWindow_SetTimePause(memberID, id, bPause)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindow_SetTimePause",memberID,id,bPause);
   }
}
