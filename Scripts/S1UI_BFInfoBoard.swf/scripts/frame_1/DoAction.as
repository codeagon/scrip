function ToGame_BFInfoBoard_Init()
{
   lib.Debuger.trace("ToGame_BFInfoBoard_Init");
   fscommand("ToGame_BFInfoBoard_Init");
}
function ToGame_BFInfoBoard_CloseUI()
{
   lib.Debuger.trace("ToGame_BFInfoBoard_CloseUI");
   fscommand("ToGame_BFInfoBoard_CloseUI");
}
function ToGame_BFInfoBoard_RequestReward()
{
   lib.Debuger.trace("ToGame_BFInfoBoard_RequestReward ");
   fscommand("ToGame_BFInfoBoard_RequestReward");
}
function ToGame_BFInfoBoard_RequestGiveUp()
{
   lib.Debuger.trace("ToGame_BFInfoBoard_RequestGiveUp ");
   fscommand("ToGame_BFInfoBoard_RequestGiveUp");
}
function createTeamData(teamList)
{
   teamList = lib.util.ExtString.split(teamList,"\n");
   var _loc8_ = teamList.length;
   var _loc4_ = [];
   var _loc3_ = 0;
   while(_loc3_ < _loc8_)
   {
      _loc4_[_loc3_] = [];
      var _loc5_ = lib.util.ExtString.split(teamList[_loc3_],"\t");
      var _loc6_ = _loc5_.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         var _loc1_ = _loc5_[_loc2_];
         if(isNaN(Number(_loc1_)))
         {
            trace("tV  " + _loc1_);
            _loc4_[_loc3_].push(_loc1_);
         }
         else
         {
            _loc4_[_loc3_].push(Number(_loc1_));
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc3_ = _loc3_ + 1;
   }
   return _loc4_;
}
function buildList(teamIndex, sortIndex)
{
   listReset(teamIndex);
   var _loc5_ = undefined;
   var _loc12_ = undefined;
   var _loc6_ = undefined;
   var _loc8_ = undefined;
   var _loc10_ = false;
   if(teamIndex == 0)
   {
      _loc5_ = redTeamListData;
      _loc6_ = container_mc.redListMc;
      _loc10_ = sortIndex == redSortFieldIndex;
      _loc8_ = sortIndex;
      redSortFieldIndex = sortIndex;
   }
   else
   {
      _loc5_ = blueTeamListData;
      _loc6_ = container_mc.blueListMc;
      _loc10_ = sortIndex == blueSortFieldIndex;
      _loc8_ = sortIndex;
      blueSortFieldIndex = sortIndex;
   }
   if(_loc10_)
   {
      _loc5_.reverse();
   }
   else if(_loc8_ == 3 || _loc8_ == 4)
   {
      _loc5_.sortOn(_loc8_,Array.NUMERIC);
      _loc5_.reverse();
   }
   else
   {
      _loc5_.sortOn(_loc8_,Array.NUMERIC);
   }
   var _loc7_ = _loc5_.length;
   var _loc4_ = 0;
   while(_loc4_ < _loc7_)
   {
      var _loc3_ = _loc5_[_loc4_];
      var _loc2_ = _loc6_.attachMovie("line","line" + _loc4_,_loc6_.getNextHighestDepth());
      if(lineH == undefined)
      {
      }
      _loc2_._y = lineH * _loc4_;
      _loc5_[_loc4_] = _loc3_;
      _loc2_.txt0.setText(_loc3_[0]);
      _loc2_.txt1.setText(_loc3_[1]);
      _loc2_.txt2.setText(CLASSNAME_STR[Number(_loc3_[2])]);
      _loc2_.txt3.setText(_loc3_[3]);
      if(Number(_loc3_[4]) == -1)
      {
         _loc2_.txt4.setText("-");
      }
      else
      {
         _loc2_.txt4.setText(_loc3_[4]);
      }
      if(Number(_loc3_[5]) == 1)
      {
         _loc2_.meMc.gotoAndStop(2);
      }
      else
      {
         _loc2_.meMc.gotoAndStop(1);
      }
      _loc2_.masterMc._visible = Number(_loc3_[6]);
      if(Number(_loc3_[0]) <= RANK)
      {
         _loc2_.rankMc.gotoAndStop(2);
      }
      else
      {
         _loc2_.rankMc.gotoAndStop(1);
      }
      _loc2_.hit.onRollOver = function()
      {
         this._parent.effect_mc.gotoAndStop("over");
      };
      _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
      {
         this._parent.effect_mc.gotoAndStop("out");
      };
      _loc4_ = _loc4_ + 1;
   }
   _loc12_.pageSize = _loc6_._height;
}
function listReset(teamIndex)
{
   var _loc3_ = undefined;
   var _loc1_ = undefined;
   if(teamIndex == 0)
   {
      _loc1_ = container_mc.redListMc;
   }
   else
   {
      _loc1_ = container_mc.blueListMc;
   }
   for(var _loc2_ in _loc1_)
   {
      if(typeof _loc1_[_loc2_] == "movieclip")
      {
         lib.manager.ToolTip.remove(_loc1_[_loc2_]);
         _loc1_[_loc2_].removeMovieClip();
      }
   }
   _loc3_.scroll = 0;
}
function setEndTimeText(endTime)
{
   if(Number(endTime) == -1)
   {
      container_mc.bfColseFd.text = "";
      endTimeIs = undefined;
      return undefined;
   }
   endTimeIs = Number(endTime);
   var _loc2_ = int(Number(endTime) / 60);
   var _loc1_ = Number(endTime) % 60;
   if(_loc2_ < 10)
   {
      _loc2_ = "0" + _loc2_;
   }
   if(_loc1_ < 10)
   {
      _loc1_ = "0" + _loc1_;
   }
   var _loc4_ = _loc2_ + ":" + _loc1_;
   if(ENDTIMEALERT_TIME > Number(endTime))
   {
      container_mc.bfColseFd.textColor = ENDTIMEALERT_COLOR;
   }
   else
   {
      container_mc.bfColseFd.textColor = lib.info.TextColor.GENERAL_NORMAL;
   }
   container_mc.bfColseFd.text = _loc4_;
}
function setEndTimer()
{
   while(interValId.length > 0)
   {
      clearInterval(interValId.pop());
   }
   if(endTimeIs > 0)
   {
      interValId.push(setInterval(setTime,SEC));
   }
}
function setTime()
{
   endTimeIs = endTimeIs - 1;
   if(endTimeIs <= 0)
   {
      while(interValId.length > 0)
      {
         clearInterval(interValId.pop());
      }
   }
   setEndTimeText(endTimeIs);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = true;
var UIname = "BFInfoBoard";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         while(interValId.length > 0)
         {
            clearInterval(interValId.pop());
         }
         UI._visible = false;
      }
   }
};
myListener.OnGameEventShowUI = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      while(interValId.length > 0)
      {
         clearInterval(interValId.pop());
      }
   }
};
var TOTALLISTLINES = 12;
var CLASSNAME_STR = ["$013020","$013021","$013022","$013023","$013024","$013025","$013026","$013027"];
var RANK = 3;
var REDNAME_STR = lib.util.UIString.getUIString("$271002");
var BLUENAME_STR = lib.util.UIString.getUIString("$271003");
var BATTLETIME_STR = lib.util.UIString.getUIString("$271009");
var OUTTIME_STR = lib.util.UIString.getUIString("$271010");
var MINUTE_STR = lib.util.UIString.getUIString("$101067");
var SEC_STR = lib.util.UIString.getUIString("$101068");
var ENDTIMEALERT_TIME = 30;
var ENDTIMEALERT_COLOR = lib.info.TextColor.GENERAL_CRITICAL;
var SEC = 1000;
var selectedTeamLine;
var lineH = lib.manager.UISkin.LISTLINE_HEIGHT;
var redTeamListMcY = container_mc.redListMc._y;
var blueTeamListMcY = container_mc.blueListMc._y;
var redTeamListData = [];
var blueTeamListData = [];
var redSortFieldIndex = 0;
var blueSortFieldIndex = 0;
var endTimeIs;
while(interValId.length > 0)
{
   clearInterval(interValId.pop());
}
var interValId = [];
container_mc.redNameFd.textColor = lib.info.TextColor.BLUE_TEAM;
container_mc.blueNameFd.textColor = lib.info.TextColor.RED_TEAM;
myListener.OnGame_BFInfoBoard_SetData = function(redTeamList, blueTeamList, redServerName, blueServerName, battleTime, outRemainTime, battleState, battleResult, redName, blueName)
{
   redTeamListData = [];
   blueTeamListData = [];
   redSortFieldIndex = -1;
   blueSortFieldIndex = -1;
   redTeamListData = createTeamData(redTeamList);
   blueTeamListData = createTeamData(blueTeamList);
   buildList(0,0);
   buildList(1,0);
   container_mc.redNameFd.text = redName + "(" + redServerName + ")";
   container_mc.blueNameFd.text = blueName + "(" + blueServerName + ")";
   container_mc.battleTimeLb.autoSize = true;
   container_mc.bfColseLb.autoSize = true;
   container_mc.battleTimeLb.text = BATTLETIME_STR;
   container_mc.bfColseLb.text = OUTTIME_STR;
   var _loc1_ = "";
   var _loc2_ = int(Number(battleTime) / 60);
   var _loc3_ = Number(battleTime) % 60;
   if(_loc2_ > 0)
   {
      _loc1_ = _loc1_ + (_loc2_ + MINUTE_STR);
   }
   if(_loc3_ > 0)
   {
      _loc1_ = _loc1_ + (" " + _loc3_ + SEC_STR);
   }
   container_mc.battleTimeFd.text = _loc1_;
   if(Number(outRemainTime) != -1)
   {
      container_mc.bfColseFd._visible = true;
      container_mc.bfColseLb._visible = true;
      container_mc.bfColseFdBgMc._visible = true;
      setEndTimeText(outRemainTime);
      setEndTimer();
   }
   else
   {
      setEndTimeText(outRemainTime);
      setEndTimer();
      container_mc.bfColseFd._visible = false;
      container_mc.bfColseLb._visible = false;
      container_mc.bfColseFdBgMc._visible = false;
   }
   if(Number(battleResult) == 1)
   {
      container_mc.redWinMc.gotoAndStop(2);
      container_mc.blueWinMc.gotoAndStop(3);
   }
   else if(Number(battleResult) == 2)
   {
      container_mc.redWinMc.gotoAndStop(3);
      container_mc.blueWinMc.gotoAndStop(2);
   }
   else if(Number(battleResult) == 3)
   {
      container_mc.redWinMc.gotoAndStop(4);
      container_mc.blueWinMc.gotoAndStop(4);
   }
   else
   {
      container_mc.redWinMc.gotoAndStop(1);
      container_mc.blueWinMc.gotoAndStop(1);
   }
   reward_btn.setEnabled(Boolean(Number(battleState)));
   giveup_btn.setEnabled(!Boolean(Number(battleState)));
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_BFInfoBoard_CloseUI);
var reward_btn = container_mc.txtBtn1.txtBtn;
reward_btn.setRelease(ToGame_BFInfoBoard_RequestReward);
var giveup_btn = container_mc.txtBtn0.txtBtn;
giveup_btn.setRelease(ToGame_BFInfoBoard_RequestGiveUp);
container_mc.sortBtn0.onSelected = function(index)
{
   buildList(0,index);
};
container_mc.sortBtn1.onSelected = function(index)
{
   buildList(1,index);
};
ToGame_BFInfoBoard_Init();
