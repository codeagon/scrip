function buildList(fieldIndex)
{
   listReset();
   teamListData.reverse();
   var _loc13_ = teamListData.length;
   var _loc7_ = "";
   var _loc14_ = -1;
   var _loc16_ = false;
   var _loc17_ = false;
   var _loc15_ = 0;
   fieldIndex.sortOn("name1");
   var _loc6_ = undefined;
   var _loc12_ = 0;
   var _loc9_ = 0;
   var _loc4_ = 0;
   while(_loc4_ < _loc13_)
   {
      if(_loc7_ != fieldIndex[_loc4_].name1)
      {
         _loc7_ = fieldIndex[_loc4_].name1;
         _loc6_ = container_mc.teamListMc.attachMovie("LevelListMc","LevelListMc" + _loc4_,container_mc.teamListMc.getNextHighestDepth());
         if(_loc12_ != 0)
         {
            _loc6_._y = container_mc.teamListMc._height + 2;
         }
         _loc12_ = _loc12_ + 1;
         _loc6_.txt.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         var _loc8_ = String(_loc7_);
         var _loc11_ = _loc8_.substr(0,2);
         var _loc10_ = _loc8_.substr(5,2);
         if(Number(_root.MyLevel) >= Number(_loc11_) && Number(_root.MyLevel) <= Number(_loc10_))
         {
            _loc6_.txt.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
         }
         else
         {
            _loc6_.txt.textColor = lib.info.TextColor.GENERAL_DISABLE;
         }
         _loc6_.txt.text = LEVELENTER_STR + " : " + _loc7_;
         _loc9_ = 0;
      }
      var _loc3_ = _loc6_.attachMovie("line","line" + _loc4_,_loc6_.getNextHighestDepth());
      _loc3_.IconMc1._visible = false;
      _loc3_.IconMc2._visible = false;
      _loc3_.txt0.setText(fieldIndex[_loc4_].name0);
      _loc3_.txt1.setText(LEVELENTER_STR + " " + fieldIndex[_loc4_].name1);
      _loc3_.txt2.setText(" <font color=\'" + UI["ENTERCOLOR" + fieldIndex[_loc4_].name2] + "\'>" + UI["ENTERSTATE" + fieldIndex[_loc4_].name2] + "</font>");
      _loc3_.txt3.setText(" <font color=\'" + UI["ENTERCOLOR" + fieldIndex[_loc4_].name4] + "\'>" + UI["ENTERSTATE" + fieldIndex[_loc4_].name4] + "</font>");
      _loc3_._y = 34 + _loc9_ * _loc3_._height;
      _loc3_.txt0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
      _loc6_.bg._height = _loc6_._height;
      timeData.push(Number(fieldIndex[_loc4_].name3));
      setEndTimeText(Number(fieldIndex[_loc4_].name3),_loc3_.txt4);
      if(Number(fieldIndex[_loc4_].name2) == 2)
      {
         _loc3_.IconMc1._visible = true;
         _loc3_.IconMc1._x = _loc3_.txt2._x + _loc3_.txt2.textWidth + 3;
         _loc3_.IconMc1.onRollOver = function()
         {
            lib.manager.ToolTip.add(this,"$275027",1);
         };
         _loc3_.IconMc1.onRollOut = function()
         {
            lib.manager.ToolTip.remove(this);
         };
      }
      else
      {
         _loc3_.IconMc1._visible = false;
      }
      if(Number(fieldIndex[_loc4_].name4) == 2)
      {
         _loc3_.IconMc2._visible = true;
         _loc3_.IconMc2._x = _loc3_.txt3._x + _loc3_.txt3.textWidth + 3;
         _loc3_.IconMc2.onRollOver = function()
         {
            lib.manager.ToolTip.add(this,"$275027",1);
         };
         _loc3_.IconMc2.onRollOut = function()
         {
            lib.manager.ToolTip.remove(this);
         };
      }
      else
      {
         _loc3_.IconMc2._visible = false;
      }
      _loc9_ = _loc9_ + 1;
      _loc4_ = _loc4_ + 1;
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
   timeData = [];
   endTimeIs = 0;
   setEndTimer();
}
function setEndTimeText(endTime, target)
{
   if(Number(endTime) == -1)
   {
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
   var _loc4_ = "";
   if(_loc5_ != 0)
   {
      _loc4_ = _loc4_ + (_loc5_ + HSTR + " ");
   }
   if(_loc2_ != "00")
   {
      _loc4_ = _loc4_ + (_loc2_ + MSTR + " ");
   }
   if(_loc1_ != "00" || endTime <= 0)
   {
      _loc4_ = _loc4_ + (_loc1_ + SSTR);
   }
   target.setText(TENTER_STR + " " + _loc4_);
   target._width = target.textWidth + 3;
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
   var _loc1_ = 0;
   while(_loc1_ < total)
   {
      if(timeData[_loc1_] != 0)
      {
         timeData[_loc1_] = timeData[_loc1_] - 1;
         setEndTimeText(timeData[_loc1_],container_mc.teamListMc["line" + _loc1_].txt4);
      }
      _loc1_ = _loc1_ + 1;
   }
}
function ToGame_BFAdmission_Init()
{
   fscommand("ToGame_BFAdmission_Init");
}
function ToGame_BFAdmission_Close()
{
   fscommand("ToGame_BFAdmission_Close");
}
function ListScrollBar(bool)
{
   var _loc2_ = undefined;
   var _loc6_ = 0;
   var _loc5_ = 60;
   var _loc3_ = undefined;
   if(bool == true)
   {
      _loc3_ = UI.container_mc.ListMaskMc._height;
   }
   else
   {
      _loc3_ = 5000;
   }
   _loc2_ = UI.container_mc.moviescroll1;
   var _loc4_ = {};
   _loc2_.addListener(_loc4_);
   _loc4_.onScroll = function()
   {
      UI.container_mc.teamListMc._y = 88 - arguments[0];
   };
   _loc2_.setWheel(UI.container_mc.teamListMc);
   if(listHeight == undefined)
   {
      _loc2_.__set__pageSize(UI.container_mc.teamListMc._height);
   }
   else
   {
      _loc2_.__set__pageSize(listHeight);
   }
   _loc2_.__set__displaySize(_loc3_);
   _loc2_.__set__rowHeight(_loc5_ + _loc6_);
   _loc2_.__set__scroll(0);
   var _loc7_ = 0;
   var _loc9_ = 60;
   var _loc8_ = 620;
}
var UI = this;
UI._visible = false;
var UIname = "BFAdmission";
var bWidgetOpen = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var CENTER_STR = lib.util.UIString.getUIString("$275018");
var NENTER_STR = lib.util.UIString.getUIString("$275019");
var TENTER_STR = lib.util.UIString.getUIString("$275020");
var ENTERSTATE0 = lib.util.UIString.getUIString("$275021");
var ENTERSTATE1 = lib.util.UIString.getUIString("$275028");
var ENTERSTATE2 = lib.util.UIString.getUIString("$275028");
var LEVELENTER_STR = lib.util.UIString.getUIString("$275024");
var ENTERCOLOR0 = "#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16);
var ENTERCOLOR1 = "#" + lib.info.TextColor.GENERAL_EMPHASIS.toString(16);
var ENTERCOLOR2 = "#" + lib.info.TextColor.GENERAL_EMPHASIS.toString(16);
var SEC = 1000;
var HSTR = lib.util.UIString.getUIString("$101082");
var MSTR = lib.util.UIString.getUIString("$101067");
var SSTR = lib.util.UIString.getUIString("$101068");
var containY = container_mc.infoContainer._y;
var selectedTeamLine;
var lineH = 60;
var teamListData = [];
var sortFieldIndex = 0;
var sortReverse = false;
var listCurrentPage = 0;
var SEC = 1000;
var endTimeIs;
var interValId = [];
var timeData = [];
var total = 0;
var testarr = new Array();
var testarrcheck = new Array();
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      while(interValId.length > 0)
      {
         clearInterval(interValId.pop());
      }
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
      while(interValId.length > 0)
      {
         clearInterval(interValId.pop());
      }
      UI._visible = false;
   }
};
myListener.OnGame_BFAdmission_SetData = function(teamList)
{
   listReset();
   teamList = lib.util.ExtString.split(teamList,"\n");
   var _loc9_ = teamList.length;
   teamListData = new Array();
   testarr = new Array();
   testarrcheck = new Array();
   var _loc1_ = 0;
   while(_loc1_ < _loc9_)
   {
      teamListData[_loc1_] = new Array();
      var _loc2_ = lib.util.ExtString.split(teamList[_loc1_],"\t");
      testarr = new Array();
      testarr.push({name0:_loc2_[0],name1:_loc2_[1],name2:_loc2_[2],name3:_loc2_[3],name4:_loc2_[4]});
      testarrcheck[_loc1_] = new Array();
      testarrcheck[_loc1_] = testarr[0];
      _loc1_ = _loc1_ + 1;
   }
   var _loc10_ = String(testarrcheck[0].name1);
   var _loc12_ = _loc10_.substr(0,2);
   var _loc11_ = _loc10_.substr(5,2);
   buildList(testarrcheck);
   ListScrollBar(true);
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_BFAdmission_Close);
ToGame_BFAdmission_Init();
