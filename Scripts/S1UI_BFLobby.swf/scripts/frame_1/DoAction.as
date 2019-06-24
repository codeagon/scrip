function setEndTimeText(endTime)
{
   if(Number(endTime) == -1)
   {
      container_mc.timeFd.setText("");
      endTimeIs = undefined;
      return undefined;
   }
   endTimeIs = Number(endTime);
   var _loc5_ = int(Number(endTime) / 3600);
   var _loc2_ = int(Number(endTime) % 3600 / 60);
   var _loc1_ = Number(endTime) % 60;
   if(_loc2_ < 10)
   {
      _loc2_ = "0" + _loc2_;
   }
   if(_loc1_ < 10)
   {
      _loc1_ = "0" + _loc1_;
   }
   var _loc3_ = "";
   if(_loc5_ != 0)
   {
      _loc3_ = _loc3_ + (_loc5_ + HSTR + " ");
   }
   if(_loc2_ != "00")
   {
      _loc3_ = _loc3_ + (_loc2_ + MSTR + " ");
   }
   if(_loc1_ != "00" || endTimeIs <= 0)
   {
      _loc3_ = _loc3_ + (_loc1_ + SSTR);
   }
   container_mc.timeFd.setText("<img src=\'icon_time\' vspace=\'-4\'>" + _loc3_);
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
function buildList(fieldIndex)
{
   var _loc12_ = -1;
   var temparray = new Array();
   var _loc3_ = 0;
   while(_loc3_ < 20)
   {
      container_mc["Btn" + _loc3_]._visible = false;
      _loc3_ = _loc3_ + 1;
   }
   listReset();
   teamListData.sortOn(fieldIndex,Array.NUMERIC);
   if(sortReverse)
   {
      teamListData.reverse();
   }
   var _loc11_ = teamListData.length;
   _loc3_ = 0;
   while(_loc3_ < _loc11_)
   {
      var _loc4_ = teamListData[_loc3_];
      var _loc2_ = container_mc.teamListMc.attachMovie("line","line" + _loc3_,container_mc.teamListMc.getNextHighestDepth());
      _loc2_._y = lineH * _loc3_;
      teamListData[_loc3_] = _loc4_;
      _loc2_.index = _loc3_;
      _loc2_.id = _loc4_[0];
      temparray.push(_loc2_.id);
      _loc2_.txt0.text = _loc4_[0];
      _loc2_.txt1.setText(_loc4_[5]);
      _loc2_.txt2.setText(_loc4_[1]);
      var _loc6_ = Number(_loc4_[2]);
      var _loc8_ = Number(_loc4_[3]);
      var _loc7_ = _loc6_ + "/" + _loc8_;
      if(_loc6_ == _loc8_)
      {
         _loc7_ = "<font color=\'#80e71c\'>" + _loc7_ + "</font>";
      }
      _loc2_.txt3.setText(_loc7_);
      if(Number(_loc4_[4]) == 1)
      {
         _loc2_.txt4.setText("<font color=\'#707070\'>" + PRIVATE_STR + "</font>");
      }
      else
      {
         _loc2_.txt4.setText(PUBLIC_STR);
      }
      container_mc["Btn" + _loc3_]._visible = true;
      var _loc5_ = container_mc["Btn" + _loc3_].txtBtn;
      container_mc["Btn" + _loc3_].id = _loc2_.index;
      if(Number(_loc4_[6]) == 1)
      {
         _loc5_.setText("$275032");
         _loc5_.setEnabled(false);
      }
      else if(_loc4_[7] != "" || _loc4_[7] != null || _loc4_[7] != undefined)
      {
         if(Number(_loc4_[7]) == Number(_loc4_[0]))
         {
            _loc5_.setText("$275033");
            _loc5_.setEnabled(true);
            selectedTeamLine.effect_mc.gotoAndStop("out");
            selectedTeamLine = _loc2_;
         }
         else
         {
            _loc5_.setText("$275032");
            _loc5_.setEnabled(true);
         }
      }
      else
      {
         _loc5_.setText("$275032");
         _loc5_.setEnabled(true);
      }
      if(_loc6_ == _loc8_)
      {
         _loc5_.setEnabled(false);
      }
      _loc2_.hit.onRollOver = function()
      {
         if(this._parent != selectedTeamLine)
         {
            this._parent.effect_mc.gotoAndStop("over");
         }
         else
         {
            this._parent.effect_mc.gotoAndStop("press");
         }
      };
      _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
      {
         if(this._parent != selectedTeamLine)
         {
            this._parent.effect_mc.gotoAndStop("out");
         }
         else
         {
            this._parent.effect_mc.gotoAndStop("active");
         }
      };
      container_mc["Btn" + _loc3_].btn.onRollOver2 = function()
      {
         container_mc.teamListMc["line" + this._parent.id].effect_mc.gotoAndStop("over");
      };
      container_mc["Btn" + _loc3_].btn.onRollOut2 = function()
      {
         container_mc.teamListMc["line" + this._parent.id].effect_mc.gotoAndStop("out");
      };
      container_mc["Btn" + _loc3_].btn.onPress2 = function()
      {
         container_mc.teamListMc["line" + this._parent.id].effect_mc.gotoAndStop("active");
      };
      container_mc["Btn" + _loc3_].btn.onRelease2 = function()
      {
         container_mc.teamListMc["line" + this._parent.id].effect_mc.gotoAndStop("over");
         var _loc2_ = temparray[this._parent._name.substr(3,4)];
         ToGame_BFLobby_BFTeamJoin(_loc2_);
      };
      container_mc["Btn" + _loc3_].btn.onReleaseOutside2 = function()
      {
         var _loc2_ = container_mc.teamListMc["line" + this._parent.id];
         if(_loc2_ != selectedTeamLine)
         {
            _loc2_.effect_mc.gotoAndStop("out");
         }
         else
         {
            _loc2_.effect_mc.gotoAndStop("active");
         }
      };
      _loc3_ = _loc3_ + 1;
   }
}
function listReset()
{
   selectedTeamLine = undefined;
   var _loc1_ = container_mc.teamListMc;
   for(var _loc2_ in _loc1_)
   {
      if(typeof _loc1_[_loc2_] == "movieclip")
      {
         lib.manager.ToolTip.remove(_loc1_[_loc2_].hit);
         _loc1_[_loc2_].removeMovieClip();
      }
   }
}
function ToGame_BFLobby_Init()
{
   fscommand("ToGame_BFLobby_Init");
}
function ToGame_BFLobby_CloseUI()
{
   fscommand("ToGame_BFLobby_CloseUI");
}
function ToGame_BFLobby_BFTeamCreation()
{
   fscommand("ToGame_BFLobby_BFTeamCreation");
}
function ToGame_BFLobby_BFTeamJoin(num)
{
   getURL("FSCommand:ToGame_BFLobby_BFTeamJoin",num);
}
function ToGame_BFLobby_RequestBFTeamList(page)
{
   sortFieldIndex = 0;
   sortReverse = false;
   if(page == undefined)
   {
      page = listCurrentPage;
   }
   lib.Debuger.trace("ToGame_BFLobby_RequestBFTeamList : " + page);
   getURL("FSCommand:ToGame_BFLobby_RequestBFTeamList",page);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "BFLobby";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_2.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_3.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_4.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_5.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_6.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.nameFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.memberLimitFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.scoreFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.levelFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.enterFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.timeFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.nenterFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
var TOTALLISTLINES = 16;
var FULLCOLOR = lib.info.TextColor.LIST_PERSONNEL_FULL.toString(16);
var PIVATECOLOR = lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16);
var PRIVATE_STR = lib.util.UIString.getUIString("$275016");
var PUBLIC_STR = lib.util.UIString.getUIString("$275017");
var BFNAME_STR = lib.util.UIString.getUIString("$275005");
var BFMEMBERS_STR = lib.util.UIString.getUIString("$275006");
var SCORE_STR = lib.util.UIString.getUIString("$275007");
var LEVEL_STR = lib.util.UIString.getUIString("$275031");
var CENTER_STR = lib.util.UIString.getUIString("$275018");
var NENTER_STR = lib.util.UIString.getUIString("$275019");
var TENTER_STR = lib.util.UIString.getUIString("$275020");
var ENTERSTATE0 = lib.util.UIString.getUIString("$275021");
var ENTERSTATE1 = lib.util.UIString.getUIString("$275028");
var ENTERSTATE2 = lib.util.UIString.getUIString("$275028");
var ENTERCOLOR0 = "#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16);
var ENTERCOLOR1 = "#" + lib.info.TextColor.GENERAL_EQUIPPED.toString(16);
var ENTERCOLOR2 = "#" + lib.info.TextColor.GENERAL_EQUIPPED.toString(16);
var HSTR = lib.util.UIString.getUIString("$101082");
var MSTR = lib.util.UIString.getUIString("$101067");
var SSTR = lib.util.UIString.getUIString("$101068");
var selectedTeamLine;
var lineH = lib.manager.UISkin.LISTLINE_HEIGHT;
var teamListMcY = container_mc.teamListMc._y;
var teamListData = [];
var sortFieldIndex = 0;
var sortReverse = false;
var listCurrentPage = 0;
var SEC = 1000;
var endTimeIs;
var interValId = [];
var i = 0;
while(i < 20)
{
   container_mc["Btn" + i]._visible = false;
   i++;
}
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
myListener.OnGame_BFLobby_SetBFInfo = function(mapImg, __name, userLimit, winPoint, desc, admission, admissionTime, nextadmission, leveldata)
{
   admission = Number(admission);
   nextadmission = Number(nextadmission);
   lib.util.DrawBitmap.draw(container_mc.mapImgMc,mapImg);
   container_mc.mapImgMc._yscale = container_mc.mapImgMc._xscale = 126;
   container_mc.nameFd.setText(__name);
   container_mc.memberLimitFd.setText(userLimit);
   container_mc.scoreFd.setText(winPoint);
   container_mc.levelFd.setText(leveldata);
   container_mc.enterFd.setText(UI["ENTERSTATE" + admission]);
   container_mc.nenterFd.setText(UI["ENTERSTATE" + nextadmission]);
   container_mc.IconMc1._x = container_mc.enterFd._x + container_mc.enterFd.textWidth + 2;
   container_mc.IconMc2._x = container_mc.nenterFd._x + container_mc.nenterFd.textWidth + 2;
   container_mc.nenterFd.wordWrap = true;
   setEndTimeText(Number(admissionTime));
   setEndTimer();
   container_mc.descFd.htmlText = desc;
   lib.util.ExtString.alignJoint(container_mc.descFd);
   container_mc.textscroll1.setTextField(container_mc.descFd);
   if(admission >= 1)
   {
      container_mc.enterFd.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
   }
   else
   {
      container_mc.enterFd.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
   }
   if(nextadmission >= 1)
   {
      container_mc.nenterFd.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
   }
   else
   {
      container_mc.nenterFd.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
   }
   container_mc.IconMc1._visible = false;
   container_mc.IconMc2._visible = false;
   if(admission == 2)
   {
      container_mc.IconMc1._visible = true;
   }
   if(nextadmission == 2)
   {
      container_mc.IconMc2._visible = true;
   }
   IconTip();
};
lib.manager.ToolTip.add(container_mc.IconMc1,"$275027",1);
lib.manager.ToolTip.add(container_mc.IconMc2,"$275027",1);
myListener.OnGame_BFLobby_SetTeamList = function(teamList, currentPage, totalPages)
{
   teamList = lib.util.ExtString.split(teamList,"\n");
   var _loc7_ = teamList.length;
   teamListData = [];
   var _loc2_ = 0;
   while(_loc2_ < _loc7_)
   {
      teamListData[_loc2_] = [];
      var _loc4_ = lib.util.ExtString.split(teamList[_loc2_],"\t");
      var _loc5_ = _loc4_.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc5_)
      {
         var _loc3_ = _loc4_[_loc1_];
         teamListData[_loc2_].push(_loc3_);
         _loc1_ = _loc1_ + 1;
      }
      _loc2_ = _loc2_ + 1;
   }
   listCurrentPage = currentPage;
   container_mc.pageMc.setPage(Number(currentPage),Number(totalPages));
   buildList(sortFieldIndex);
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_BFLobby_CloseUI);
var creation_btn = container_mc.creationBtn.txtBtn;
creation_btn.setRelease(ToGame_BFLobby_BFTeamCreation);
var reload_btn = container_mc.reloadBtn.txtBtn;
reload_btn.setRelease(function()
{
   ToGame_BFLobby_RequestBFTeamList(currentPage);
}
);
container_mc.textscroll1.setTextField(container_mc.descFd);
container_mc.pageMc.setPage(0,0);
container_mc.pageMc.onChanged = function(page)
{
   ToGame_BFLobby_RequestBFTeamList(page);
};
container_mc.sortBtn.onSelected = function(index)
{
   if(index == 3)
   {
      index = 4;
   }
   if(sortFieldIndex == index)
   {
      sortReverse = !sortReverse;
   }
   sortFieldIndex = index;
   buildList(sortFieldIndex);
};
ToGame_BFLobby_Init();
