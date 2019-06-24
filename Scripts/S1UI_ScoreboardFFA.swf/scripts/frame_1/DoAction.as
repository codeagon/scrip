var UI = this;
UI._visible = false;
var UIname = "ScoreboardFFA";
this.bWindowOpen = false;
var myListener = new Object();
function scrollRegister(maskMc, maskedMc, scrollBarMc, posY)
{
   scrollBarMc.addListener(maskedMc);
   maskedMc.onScroll = function()
   {
      maskedMc._y = posY - arguments[0];
   };
   scrollBarMc.setWheel(maskedMc);
   scrollBarMc.wheelDelta = 1;
   scrollBarMc.pageSize = 0;
   scrollBarMc.displaySize = maskMc._height;
   scrollBarMc.defaultBarSizeRatio = 0.3333333333333333;
   scrollBarMc.rowHeight = LINE_HEIGHT;
   scrollBarMc.scroll = 0;
}
function updateScrollBar(maskedMc, scrollBarMc)
{
   scrollBarMc.pageSize = maskedMc._height;
   scrollBarMc.scroll = 0;
}
function transTime(sTime)
{
   var _loc4_ = lib.util.UIString.getUIString("$101067");
   var _loc5_ = lib.util.UIString.getUIString("$101068");
   var _loc1_ = "";
   var _loc2_ = int(Number(sTime) / 60);
   var _loc3_ = Number(sTime) % 60;
   if(_loc2_ > 0)
   {
      _loc1_ = _loc1_ + (_loc2_ + _loc4_);
   }
   if(_loc3_ > 0)
   {
      _loc1_ = _loc1_ + (" " + _loc3_ + _loc5_);
   }
   return _loc1_;
}
function listReset()
{
   var _loc1_ = container_mc.infomationContainer;
   for(var _loc2_ in _loc1_)
   {
      if(typeof _loc1_[_loc2_] == "movieclip")
      {
         _loc1_[_loc2_].removeMovieClip();
      }
   }
   updateScrollBar(container_mc.infomationContainer,infomationScrollBar);
}
function init()
{
}
function ToGame_BFScoreBoard_CloseUI()
{
   lib.Debuger.trace("ToGame_BFScoreBoard_CloseUI");
   fscommand("ToGame_BFScoreBoard_CloseUI");
}
function ToGame_ScoreboardFFA_Init()
{
}
function test()
{
   UI._visible = true;
   var _loc1_ = "1\t김재경1\t마법사1\t10\t10\t10\t1000\t0\t0\t0\n";
   _loc1_ = _loc1_ + "2\t김재경2\t마법사2\t20\t20\t20\t2000\t0\t0\t0\n";
   _loc1_ = _loc1_ + "3\t김재경3\t마법사3\t30\t30\t20\t3000\t0\t0\t1\n";
   _loc1_ = _loc1_ + "4\t김재경4\t마법사4\t40\t40\t20\t4000\t1\t0\t0\n";
   _loc1_ = _loc1_ + "5\t김재경5\t마법사5\t50\t50\t20\t5000\t1\t0\t1\n";
   _loc1_ = _loc1_ + "6\t김재경6\t마법사6\t60\t60\t20\t6000\t1\t0\t0\n";
   _loc1_ = _loc1_ + "7\t김재경7\t마법사7\t70\t70\t20\t7000\t1\t0\t1\n";
   _loc1_ = _loc1_ + "8\t김재경8\t마법사8\t80\t80\t20\t8000\t0\t0\t0\n";
   _loc1_ = _loc1_ + "9\t김재경9\t마법사9\t90\t90\t20\t9000\t0\t0\t0\n";
   _loc1_ = _loc1_ + "10\t김재경10\t마법사10\t100\t20\t20\t10000\t1\t0\t0\n";
   _loc1_ = _loc1_ + "11\t김재경11\t마법사11\t110\t20\t20\t10\t0\t0\t0\n";
   _loc1_ = _loc1_ + "12\t김재경12\t마법사12\t120\t20\t20\t20\t1\t0\t0\n";
   _loc1_ = _loc1_ + "13\t김재경13\t마법사13\t130\t20\t20\t30\t0\t0\t0\n";
   _loc1_ = _loc1_ + "14\t마지막\t마법사14\t140\t20\t20\t40\t1\t1\t1\n";
   var _loc2_ = "100\t100\t1000\n200\t200\t2000";
   myListener.OnGame_ScoreboardFFA_SetTeamInfo(_loc2_);
   myListener.OnGame_ScoreboardFFA_AddPlayerList(_loc1_);
   myListener.OnGame_ScoreboardFFA_RewardData("100","450","1901");
   myListener.OnGame_ScoreboardFFA_ResultData("1위","360","250");
   myListener.OnGame_ScoreboardFFA_ShowResult(1);
   container_mc.rankTF.text = "순위";
   container_mc.characterNameTF.text = "캐릭터명";
   container_mc.classTF.text = "클래스";
   container_mc.kdaTF.text = "킬/데스/어시스트";
   container_mc.totalScoreTF.text = "종합점수";
   container_mc.defaultInfoMc.winTF.text = "승리의 인도자 평판 포인트";
   container_mc.defaultInfoMc.buffTF.text = "광기의 학살자 평판 포인트";
   container_mc.defaultInfoMc.userScoreTF.text = "개인 평점";
   container_mc.resultInfoMc.myRankTF.text = "순위";
   container_mc.resultInfoMc.battleTimeTF.text = "전투 시간";
   container_mc.resultInfoMc.endBattleTimeTF.text = "전투 이탈까지 남은 시간";
   close_btn_0.setText("전장에서 나가기");
   container_mc.teamA.killTitleTF.text = "킬";
   container_mc.teamA.deathTitleTF.text = "데스";
   container_mc.teamA.totalTitleTF.text = "종합";
   container_mc.teamB.killTitleTF.text = "킬";
   container_mc.teamB.deathTitleTF.text = "데스";
   container_mc.teamB.totalTitleTF.text = "종합";
}
if(_global.EventBroadCaster)
{
   _global.EventBroadCaster.addListener(myListener);
}
var Labels = [];
var Colums = [];
var TextCoulms = [];
var LINE_HEIGHT = 24;
var CATE_HEIGHT = 36;
var columMax = 795;
var prevFocus = -1;
var nListTotal;
var infomationListY = container_mc.infomationContainer._y;
var infomationScrollBar = container_mc.infomationScroll;
scrollRegister(container_mc.infomationMask,container_mc.infomationContainer,infomationScrollBar,infomationListY);
var close_btn_0 = container_mc.resultInfoMc.exitBtn.txtBtn;
close_btn_0.setRelease(ToGame_BFScoreBoard_CloseUI);
var rankStr = lib.util.UIString.getUIString("$700000");
var characterNameStr = lib.util.UIString.getUIString("$700001");
var classStr = lib.util.UIString.getUIString("$700002");
var kdaStr = lib.util.UIString.getUIString("$700003");
var totalScoreStr = lib.util.UIString.getUIString("$700004");
var point0ScoreStr = lib.util.UIString.getUIString("$700005");
var point1ScoreStr = lib.util.UIString.getUIString("$700006");
var userScoreStr = lib.util.UIString.getUIString("$700007");
var myRankStr = lib.util.UIString.getUIString("$700008");
var battleTimeStr = lib.util.UIString.getUIString("$700009");
var endBattleTimeStr = lib.util.UIString.getUIString("$700010");
var exitBtnStr = lib.util.UIString.getUIString("$700011");
var totalKillStr = lib.util.UIString.getUIString("$700012");
var totalDeathStr = lib.util.UIString.getUIString("$700013");
var totalScoreStr = lib.util.UIString.getUIString("$700014");
container_mc.rankTF.text = rankStr;
container_mc.characterNameTF.text = characterNameStr;
container_mc.classTF.text = classStr;
container_mc.kdaTF.text = kdaStr;
container_mc.totalScoreTF.text = totalScoreStr;
container_mc.defaultInfoMc.winTF.text = point0ScoreStr;
container_mc.defaultInfoMc.buffTF.text = point1ScoreStr;
container_mc.defaultInfoMc.userScoreTF.text = userScoreStr;
container_mc.resultInfoMc.myRankTF.text = myRankStr;
container_mc.resultInfoMc.battleTimeTF.text = battleTimeStr;
container_mc.resultInfoMc.endBattleTimeTF.text = endBattleTimeStr;
container_mc.teamA.killTitleTF.text = totalKillStr;
container_mc.teamA.deathTitleTF.text = totalDeathStr;
container_mc.teamA.totalTitleTF.text = totalScoreStr;
container_mc.teamB.killTitleTF.text = totalKillStr;
container_mc.teamB.deathTitleTF.text = totalDeathStr;
container_mc.teamB.totalTitleTF.text = totalScoreStr;
close_btn_0.setText(exitBtnStr);
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGame_ScoreboardFFA_SetTeamInfo = function(teamScore)
{
   var _loc5_ = lib.util.ExtString.split(teamScore,"\n");
   var _loc4_ = _loc5_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc4_)
   {
      var _loc3_ = _loc2_ % _loc4_;
      var _loc1_ = lib.util.ExtString.split(_loc5_[_loc3_],"\t");
      if(_loc2_ == 0)
      {
         container_mc.teamA.killTF.text = _loc1_[0];
         container_mc.teamA.deathTF.text = _loc1_[1];
         container_mc.teamA.totalTF.text = _loc1_[2];
      }
      if(_loc2_ == 1)
      {
         container_mc.teamB.killTF.text = _loc1_[0];
         container_mc.teamB.deathTF.text = _loc1_[1];
         container_mc.teamB.totalTF.text = _loc1_[2];
      }
      _loc2_ = _loc2_ + 1;
   }
};
myListener.OnGame_ScoreboardFFA_AddPlayerList = function(_dataList)
{
   var _loc7_ = infomationScrollBar.scroll;
   listReset();
   var _loc6_ = lib.util.ExtString.split(_dataList,"\n");
   var _loc5_ = _loc6_.length;
   nListTotal = _loc5_;
   var _loc3_ = 0;
   while(_loc3_ < _loc5_)
   {
      var _loc4_ = _loc3_ % _loc5_;
      var _loc2_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
      var _loc1_ = container_mc.infomationContainer.attachMovie("ListMc","listMc" + _loc2_[0],container_mc.infomationContainer.getNextHighestDepth());
      _loc1_._x = 0;
      _loc1_._y = 32 * _loc3_;
      _loc1_.gotoAndStop(Number(_loc2_[7]) + 1);
      if(_loc2_[8] == "0")
      {
         _loc1_.myMc._visible = false;
         _loc1_.numTF.text = _loc2_[0];
         _loc1_.nameTF.text = _loc2_[1];
         _loc1_.classTF.text = _loc2_[2];
         _loc1_.kdaTF.text = _loc2_[3] + "/" + _loc2_[4] + "/" + _loc2_[5];
         _loc1_.scoreTF.text = _loc2_[6];
      }
      else
      {
         _loc1_.myMc._visible = true;
         _loc1_.myMc.numTF.text = _loc2_[0];
         _loc1_.myMc.nameTF.text = _loc2_[1];
         _loc1_.myMc.classTF.text = _loc2_[2];
         _loc1_.myMc.kdaTF.text = _loc2_[3] + "/" + _loc2_[4] + "/" + _loc2_[5];
         _loc1_.myMc.scoreTF.text = _loc2_[6];
      }
      if(_loc2_[9] == "0")
      {
         _loc1_.numTF.textColor = _loc1_.nameTF.textColor = _loc1_.classTF.textColor = _loc1_.kdaTF.textColor = _loc1_.scoreTF.textColor = 16777215;
         _loc1_.myMc.numTF.textColor = _loc1_.myMc.nameTF.textColor = _loc1_.myMc.classTF.textColor = _loc1_.myMc.kdaTF.textColor = _loc1_.myMc.scoreTF.textColor = 16777215;
      }
      else
      {
         _loc1_.numTF.textColor = _loc1_.nameTF.textColor = _loc1_.classTF.textColor = _loc1_.kdaTF.textColor = _loc1_.scoreTF.textColor = 7697781;
      }
      _loc3_ = _loc3_ + 1;
   }
   updateScrollBar(container_mc.infomationContainer,infomationScrollBar);
   UI._visible = true;
   if(nListTotal > 10)
   {
      infomationScrollBar._visible = true;
   }
   else
   {
      infomationScrollBar._visible = false;
   }
   infomationScrollBar.scroll = _loc7_ <= infomationScrollBar.pageSize?_loc7_:0;
};
myListener.OnGame_ScoreboardFFA_RewardData = function(iReputRew, cReputRew, gradeRew)
{
   container_mc.defaultInfoMc.point0TF.text = iReputRew.toString();
   container_mc.defaultInfoMc.point1TF.text = cReputRew.toString();
   container_mc.defaultInfoMc.point2TF.text = gradeRew.toString();
};
myListener.OnGame_BFInfoBoard_SetResultTip = function(tip)
{
   container_mc.resultInfoMc.resultTip.htmlText = tip;
};
myListener.OnGame_ScoreboardFFA_ResultData = function(rank, battleTime, remainTime)
{
   container_mc.resultInfoMc.point0TF.text = rank.toString();
   container_mc.resultInfoMc.point1TF.text = transTime(battleTime.toString());
   container_mc.resultInfoMc.point2TF.text = transTime(remainTime.toString());
};
myListener.OnGame_ScoreboardFFA_SetEndTimer = function(outRemainTime)
{
   container_mc.resultInfoMc.point2TF.text = transTime(outRemainTime.toString());
};
myListener.OnGame_ScoreboardFFA_ShowResult = function(iShow)
{
   container_mc.defaultInfoMc._visible = container_mc.resultInfoMc._visible = iShow;
   container_mc.defaultInfoMc._y = 427;
   container_mc.resultInfoMc._y = container_mc.defaultInfoMc._y + container_mc.defaultInfoMc._height;
};
myListener.OnGame_ScoreboardFFA_Close = function()
{
   UI._visible = false;
};
myListener.OnGame_ScoreboardFFA_ShowResult(0);
container_mc.teamB.gotoAndStop(2);
ToGame_ScoreboardFFA_Init();
UI._visible = false;
