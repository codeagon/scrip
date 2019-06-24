class g4.view.debugger.test.testData.PartyWindowRaidInfoTestData extends g4.view.debugger.test.testData.UITestDataModel
{
   var targetGroupIndex = 0;
   var targetMemberIndex = 0;
   var _dice_input_value = 10;
   var _dice_input_isMax = false;
   var autoIncreasedBuffID = 1000;
   var _addBuff_fixedID = -1;
   var _addBuff_type = 0;
   var _addBuff_stackCount = 0;
   var _addBuff_time = 10;
   var _addBuff_relaxMerit = false;
   function PartyWindowRaidInfoTestData()
   {
      super(g4.view.ViewID.PARTY_WINDOW_RAID_INFO,"공격대",[new g4.view.debugger.test.testData.TestDataModel("멤버 상태 관련",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("타겟 그룹 선택",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0",this,this.setTargetGroupIndex,[0]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.setTargetGroupIndex,[1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.setTargetGroupIndex,[2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.setTargetGroupIndex,[3]),new g4.view.debugger.test.testData.TestDataModel("4",this,this.setTargetGroupIndex,[4]),new g4.view.debugger.test.testData.TestDataModel("5",this,this.setTargetGroupIndex,[5])]),new g4.view.debugger.test.testData.TestDataModel("타겟 멤버 선택",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0",this,this.setTargetMemberIndex,[0]),new g4.view.debugger.test.testData.TestDataModel("1",this,this.setTargetMemberIndex,[1]),new g4.view.debugger.test.testData.TestDataModel("2",this,this.setTargetMemberIndex,[2]),new g4.view.debugger.test.testData.TestDataModel("3",this,this.setTargetMemberIndex,[3]),new g4.view.debugger.test.testData.TestDataModel("4",this,this.setTargetMemberIndex,[4])]),new g4.view.debugger.test.testData.TestDataModel("연합파티 표시 O",this,this.setGroupVisible,[true]),new g4.view.debugger.test.testData.TestDataModel("연합파티 표시 X",this,this.setGroupVisible,[false]),new g4.view.debugger.test.testData.TestDataModel("멤버 추가",this,this.addMember),new g4.view.debugger.test.testData.TestDataModel("멤버 제거",this,this.removeMember),new g4.view.debugger.test.testData.TestDataModel("접속 O",this,this.setOnline,[true]),new g4.view.debugger.test.testData.TestDataModel("접속 X",this,this.setOnline,[false]),new g4.view.debugger.test.testData.TestDataModel("이름 설정 : 본인 O",this,this.setUserName,[true]),new g4.view.debugger.test.testData.TestDataModel("이름 설정 : 본인 X",this,this.setUserName,[false]),new g4.view.debugger.test.testData.TestDataModel("파티장 O",this,this.setMaster,[true]),new g4.view.debugger.test.testData.TestDataModel("파티장 X",this,this.setMaster,[false]),new g4.view.debugger.test.testData.TestDataModel("직업",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0=검투사",this,this.setClassType,[0]),new g4.view.debugger.test.testData.TestDataModel("1=창기사",this,this.setClassType,[1]),new g4.view.debugger.test.testData.TestDataModel("2=무사",this,this.setClassType,[2]),new g4.view.debugger.test.testData.TestDataModel("3=광전사",this,this.setClassType,[3]),new g4.view.debugger.test.testData.TestDataModel("4=마법사",this,this.setClassType,[4]),new g4.view.debugger.test.testData.TestDataModel("5=궁사",this,this.setClassType,[5]),new g4.view.debugger.test.testData.TestDataModel("6=사제",this,this.setClassType,[6]),new g4.view.debugger.test.testData.TestDataModel("7=정령사",this,this.setClassType,[7]),new g4.view.debugger.test.testData.TestDataModel("8=비검사",this,this.setClassType,[8]),new g4.view.debugger.test.testData.TestDataModel("9=마도공학자",this,this.setClassType,[9]),new g4.view.debugger.test.testData.TestDataModel("10=권술사",this,this.setClassType,[10]),new g4.view.debugger.test.testData.TestDataModel("11=인술사",this,this.setClassType,[11]),new g4.view.debugger.test.testData.TestDataModel("12=창술사",this,this.setClassType,[12]),new g4.view.debugger.test.testData.TestDataModel("20=공성병기",this,this.setClassType,[20]),new g4.view.debugger.test.testData.TestDataModel("21=비공정",this,this.setClassType,[21]),new g4.view.debugger.test.testData.TestDataModel("22=몬스터",this,this.setClassType,[22])]),new g4.view.debugger.test.testData.TestDataModel("HP",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0 / 200",this,this.setHP,[0,200]),new g4.view.debugger.test.testData.TestDataModel("5 / 200",this,this.setHP,[5,200]),new g4.view.debugger.test.testData.TestDataModel("10 / 200",this,this.setHP,[10,200]),new g4.view.debugger.test.testData.TestDataModel("20 / 200",this,this.setHP,[20,200]),new g4.view.debugger.test.testData.TestDataModel("100 / 200",this,this.setHP,[100,200]),new g4.view.debugger.test.testData.TestDataModel("150 / 200",this,this.setHP,[150,200]),new g4.view.debugger.test.testData.TestDataModel("200 / 200",this,this.setHP,[200,200])]),new g4.view.debugger.test.testData.TestDataModel("MP",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0 / 200",this,this.setMP,[0,200]),new g4.view.debugger.test.testData.TestDataModel("5 / 200",this,this.setMP,[5,200]),new g4.view.debugger.test.testData.TestDataModel("10 / 200",this,this.setMP,[10,200]),new g4.view.debugger.test.testData.TestDataModel("20 / 200",this,this.setMP,[20,200]),new g4.view.debugger.test.testData.TestDataModel("100 / 200",this,this.setMP,[100,200]),new g4.view.debugger.test.testData.TestDataModel("150 / 200",this,this.setMP,[150,200]),new g4.view.debugger.test.testData.TestDataModel("200 / 200",this,this.setMP,[200,200])]),new g4.view.debugger.test.testData.TestDataModel("사망 O",this,this.setDead,[true]),new g4.view.debugger.test.testData.TestDataModel("사망 X",this,this.setDead,[false]),new g4.view.debugger.test.testData.TestDataModel("대기 상태 : 0=대기없음",this,this.setReadyType,[0]),new g4.view.debugger.test.testData.TestDataModel("대기 상태 : 1=전투 준비 확인",this,this.setReadyType,[1]),new g4.view.debugger.test.testData.TestDataModel("대기 상태 : 2=전투 준비중",this,this.setReadyType,[2]),new g4.view.debugger.test.testData.TestDataModel("주사위 분배 : 시작",this,this.dice_start),new g4.view.debugger.test.testData.TestDataModel("주사위 분배 : 값 입력",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("0",this,this.dice_input_value,[0]),new g4.view.debugger.test.testData.TestDataModel("10",this,this.dice_input_value,[10]),new g4.view.debugger.test.testData.TestDataModel("100",this,this.dice_input_value,[100]),new g4.view.debugger.test.testData.TestDataModel("200",this,this.dice_input_value,[200]),new g4.view.debugger.test.testData.TestDataModel("400",this,this.dice_input_value,[400]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("최고값 O",this,this.dice_input_isMax,[true]),new g4.view.debugger.test.testData.TestDataModel("최고값 X",this,this.dice_input_isMax,[false])]),new g4.view.debugger.test.testData.TestDataModel("주사위 분배 : 끝",this,this.dice_end),new g4.view.debugger.test.testData.TestDataModel("위험 상태 O",this,this.setDangerous,[true]),new g4.view.debugger.test.testData.TestDataModel("위험 상태 X",this,this.setDangerous,[false]),new g4.view.debugger.test.testData.TestDataModel("디버프 상태 O",this,this.setDebuffState,[true]),new g4.view.debugger.test.testData.TestDataModel("디버프 상태 X",this,this.setDebuffState,[false])]),new g4.view.debugger.test.testData.TestDataModel("버프 관련",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("버프 ID 고정 X",this,this.addBuff_fixedID,[-1]),new g4.view.debugger.test.testData.TestDataModel("버프 ID 고정 1",this,this.addBuff_fixedID,[1]),new g4.view.debugger.test.testData.TestDataModel("버프 ID 고정 2",this,this.addBuff_fixedID,[2]),new g4.view.debugger.test.testData.TestDataModel("버프 ID 고정 3",this,this.addBuff_fixedID,[3]),new g4.view.debugger.test.testData.TestDataModel("버프 ID 고정 4",this,this.addBuff_fixedID,[4]),new g4.view.debugger.test.testData.TestDataModel("버프 ID 고정 5",this,this.addBuff_fixedID,[5]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("0=버프",this,this.addBuff_type,[0]),new g4.view.debugger.test.testData.TestDataModel("1=디버프",this,this.addBuff_type,[1]),new g4.view.debugger.test.testData.TestDataModel("2=상태약화디버프",this,this.addBuff_type,[2]),new g4.view.debugger.test.testData.TestDataModel("3=지속피해디버프",this,this.addBuff_type,[3]),new g4.view.debugger.test.testData.TestDataModel("4=행동불능디버프",this,this.addBuff_type,[4]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("릴렉스메리트 버프 O",this,this.addBuff_relaxMerit,[true]),new g4.view.debugger.test.testData.TestDataModel("릴렉스메리트 버프 X",this,this.addBuff_relaxMerit,[false]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("중첩개수 0",this,this.addBuff_stackCount,[0]),new g4.view.debugger.test.testData.TestDataModel("중첩개수 1",this,this.addBuff_stackCount,[1]),new g4.view.debugger.test.testData.TestDataModel("중첩개수 10",this,this.addBuff_stackCount,[10]),new g4.view.debugger.test.testData.TestDataModel("중첩개수 100",this,this.addBuff_stackCount,[100]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("시간 1",this,this.addBuff_time,[1]),new g4.view.debugger.test.testData.TestDataModel("시간 10",this,this.addBuff_time,[10]),new g4.view.debugger.test.testData.TestDataModel("시간 50",this,this.addBuff_time,[50]),new g4.view.debugger.test.testData.TestDataModel("시간 61",this,this.addBuff_time,[61]),new g4.view.debugger.test.testData.TestDataModel("----------"),new g4.view.debugger.test.testData.TestDataModel("버프 추가하기",this,this.addBuff),new g4.view.debugger.test.testData.TestDataModel("버프 제거하기",this,this.removeBuff),new g4.view.debugger.test.testData.TestDataModel("버프 모두 제거",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("인자없음(null)=버프/디버프 관계없이 모두제거",this,this.removeBuffAll),new g4.view.debugger.test.testData.TestDataModel("0=버프모두제거",this,this.removeBuffAll,[0]),new g4.view.debugger.test.testData.TestDataModel("1=디버프모두제거",this,this.removeBuffAll,[1]),new g4.view.debugger.test.testData.TestDataModel("2=휴식상태모두제거",this,this.removeBuffAll,[2])]),new g4.view.debugger.test.testData.TestDataModel("지속 시간 멈춤 O",this,this.setTimePause,[true]),new g4.view.debugger.test.testData.TestDataModel("지속 시간 멈춤 X",this,this.setTimePause,[false])]),new g4.view.debugger.test.testData.TestDataModel("더미 데이터 설정",this,this.setDummyData),new g4.view.debugger.test.testData.TestDataModel("공격대원 정보창 위치 초기화",this,this.resetPosition)]);
   }
   function uiLoadComplete()
   {
      this.setDummyData();
   }
   function setDummyData()
   {
      var _loc2_ = undefined;
      var _loc3_ = 6;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this.showGroup(_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function showGroup(groupID)
   {
      this.PartyRaidMemberVisibleSet(groupID,true);
      var _loc2_ = undefined;
      var _loc3_ = 5;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this.showMember(groupID,_loc2_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function showMember(groupID, memberID)
   {
      this.PartyRaidMemberSet(groupID,memberID);
      this.PartyRaidMemberOffSet(groupID,memberID,true);
      var _loc4_ = "PARY_RAID_LONG_USER_NAME_" + groupID + "_" + memberID;
      var _loc5_ = groupID == 0 && memberID == 0;
      this.PartyRaidMemberIDSet(groupID,memberID,_loc4_,_loc5_);
      this.PartyRaidMemberMasterSet(groupID,memberID,false);
      this.PartyRaidMemberClassSet(groupID,memberID,1);
      this.PartyRaidMemberHpSet(groupID,memberID,100,100);
      this.PartyRaidMemberMpSet(groupID,memberID,100,100);
      this.PartyRaidMemberDieSet(groupID,memberID,false);
      this.PartyRaidMemberReadySet(groupID,memberID,0);
      this.PartyRaidMember_DiceDistributionEnd(groupID,memberID);
      this.PartyRaidMemberDangerStateSet(groupID,memberID,false);
      this.PartyRaidMemberDebuffStateSet(groupID,memberID,false);
   }
   function setTargetGroupIndex(index)
   {
      this.targetGroupIndex = index;
   }
   function setTargetMemberIndex(index)
   {
      this.targetMemberIndex = index;
   }
   function setGroupVisible(bVisible)
   {
      this.PartyRaidMemberVisibleSet(this.targetGroupIndex,bVisible);
   }
   function setMaster(bMaster)
   {
      this.PartyRaidMemberMasterSet(this.targetGroupIndex,this.targetMemberIndex,bMaster);
   }
   function addMember()
   {
      this.PartyRaidMemberSet(this.targetGroupIndex,this.targetMemberIndex);
   }
   function removeMember()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberRemove",this.targetGroupIndex,this.targetMemberIndex);
   }
   function setClassType(classType)
   {
      this.PartyRaidMemberClassSet(this.targetGroupIndex,this.targetMemberIndex,classType);
   }
   function setUserName(isMe)
   {
      var _loc2_ = "UserName_" + this.randRange(0,1000);
      this.PartyRaidMemberIDSet(this.targetGroupIndex,this.targetMemberIndex,_loc2_,isMe);
   }
   function setOnline(bOnline)
   {
      this.PartyRaidMemberOffSet(this.targetGroupIndex,this.targetMemberIndex,bOnline);
   }
   function setHP(current, max)
   {
      this.PartyRaidMemberHpSet(this.targetGroupIndex,this.targetMemberIndex,current,max);
   }
   function setMP(current, max)
   {
      this.PartyRaidMemberMpSet(this.targetGroupIndex,this.targetMemberIndex,current,max);
   }
   function setDead(bDead)
   {
      this.PartyRaidMemberDieSet(this.targetGroupIndex,this.targetMemberIndex,bDead);
   }
   function setReadyType(type)
   {
      this.PartyRaidMemberReadySet(this.targetGroupIndex,this.targetMemberIndex,type);
   }
   function dice_start()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionStart",this.targetGroupIndex,this.targetMemberIndex);
   }
   function dice_input_value(value)
   {
      this._dice_input_value = value;
      this.dice_input();
   }
   function dice_input_isMax(value)
   {
      this._dice_input_isMax = value;
      this.dice_input();
   }
   function dice_input()
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionData",this.targetGroupIndex,this.targetMemberIndex,this._dice_input_value,this._dice_input_isMax);
   }
   function dice_end()
   {
      this.PartyRaidMember_DiceDistributionEnd(this.targetGroupIndex,this.targetMemberIndex);
   }
   function setDangerous(bDangerous)
   {
      this.PartyRaidMemberDangerStateSet(this.targetGroupIndex,this.targetMemberIndex,bDangerous);
   }
   function setDebuffState(bDebuff)
   {
      this.PartyRaidMemberDebuffStateSet(this.targetGroupIndex,this.targetMemberIndex,bDebuff);
   }
   function resetPosition()
   {
      g4.model.GameModel.partyModel.partyRaidResetPosition();
   }
   function addBuff_fixedID(value)
   {
      this._addBuff_fixedID = value;
   }
   function addBuff_type(type)
   {
      this._addBuff_type = type;
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
      var _loc4_ = "Icon_1_TEX";
      var _loc3_ = this._addBuff_time * 1000;
      var _loc5_ = _loc3_ * 2;
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberBuffSet",this.targetGroupIndex,this.targetMemberIndex,this.autoIncreasedBuffID = this.autoIncreasedBuffID + 1,this._addBuff_stackCount,this._addBuff_type,this._addBuff_relaxMerit,_loc4_,_loc3_,_loc5_);
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
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberRemoveBuffSet",this.targetGroupIndex,this.targetMemberIndex,_loc2_);
   }
   function removeBuffAll(type)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberAllRemoveBuffSet",this.targetGroupIndex,this.targetMemberIndex,type);
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
      this.OnGame_PartyWindowRaidInfo_PartyRaidMemberSetTimePause(this.targetGroupIndex,this.targetMemberIndex,_loc2_,bPause);
   }
   function PartyRaidMemberVisibleSet(groupID, visible)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberVisibleSet",groupID,visible);
   }
   function PartyRaidMemberSet(groupID, memberID)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberSet",groupID,memberID);
   }
   function PartyRaidMemberOffSet(groupID, memberID, isConnected)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberOffSet",groupID,memberID,isConnected);
   }
   function PartyRaidMemberIDSet(groupID, memberID, userName, isMe)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberIDSet",groupID,memberID,userName,isMe);
   }
   function PartyRaidMemberMasterSet(groupID, memberID, isMaster)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberMasterSet",groupID,memberID,isMaster);
   }
   function PartyRaidMemberClassSet(groupID, memberID, classType)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberClassSet",groupID,memberID,classType);
   }
   function PartyRaidMemberHpSet(groupID, memberID, current, max)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberHpSet",groupID,memberID,current,max);
   }
   function PartyRaidMemberMpSet(groupID, memberID, current, max)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberMpSet",groupID,memberID,current,max);
   }
   function PartyRaidMemberDieSet(groupID, memberID, isDead)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberDieSet",groupID,memberID,isDead);
   }
   function PartyRaidMemberReadySet(groupID, memberID, type)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberReadySet",groupID,memberID,type);
   }
   function PartyRaidMemberDangerStateSet(groupID, memberID, isDangerour)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberDangerStateSet",groupID,memberID,isDangerour);
   }
   function PartyRaidMemberDebuffStateSet(groupID, memberID, isDebuff)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberDebuffStateSet",groupID,memberID,isDebuff);
   }
   function PartyRaidMember_DiceDistributionEnd(groupID, memberID)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMember_DiceDistributionEnd",groupID,memberID);
   }
   function OnGame_PartyWindowRaidInfo_PartyRaidMemberSetTimePause(groupID, memberID, id, bPause)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_PartyWindowRaidInfo_PartyRaidMemberSetTimePause",groupID,memberID,id,bPause);
   }
}
