function buildList(_listDataArray)
{
   listReset();
   var _loc4_ = _listDataArray.length;
   var _loc6_ = undefined;
   var _loc5_ = undefined;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc3_ = DungeonListData[_loc1_];
      var _loc2_ = undefined;
      _loc2_ = container_mc.list_mc.lineBox.attachMovie("line","line" + _loc1_,container_mc.list_mc.lineBox.getNextHighestDepth());
      _loc2_._y = lineH * _loc1_;
      _loc2_.index = _loc1_;
      buildListSet(_loc2_,_loc3_);
      _loc1_ = _loc1_ + 1;
   }
}
function buildListSet(_lineMc, _dungeonData, _textColor)
{
   _lineMc.index0 = Number(_dungeonData[0]);
   _lineMc.index1 = _dungeonData[1];
   _lineMc.index2 = _dungeonData[2];
   _lineMc.index3 = _dungeonData[3];
   _lineMc.index4 = _dungeonData[4];
   _lineMc.index5 = _dungeonData[5];
   _lineMc.index6 = _dungeonData[6];
   _lineMc.index7 = _dungeonData[7];
   var _loc2_ = _textColor;
   if(_loc2_ == Null)
   {
      _loc2_ = lib.info.TextColor.GENERAL_CONTENTS;
   }
   if(_lineMc.index0 != "" || _lineMc.index0 != undefined)
   {
      _lineMc.txt0.textAutoSize = "shrink";
      _lineMc.txt0.text = _lineMc.index0;
      if(_lineMc.index0 > 3)
      {
         _lineMc.rankMc._visible = false;
      }
      else
      {
         _lineMc.rankMc.gotoAndStop(_lineMc.index0);
      }
   }
   if(_lineMc.index1 != "" || _lineMc.index1 != undefined)
   {
      _lineMc.txt1.setText(_lineMc.index1);
   }
   if(_lineMc.index2 != "" || _lineMc.index2 != undefined)
   {
      _lineMc.txt2.setText(_lineMc.index2);
   }
   if(_lineMc.index3 != "" || _lineMc.index3 != undefined)
   {
      _lineMc.txt3.setText(_lineMc.index3);
   }
   if(_lineMc.index4 != "" || _lineMc.index4 != undefined)
   {
      _lineMc.txt4.setText(_lineMc.index4);
   }
   if(_lineMc.index5 != "" || _lineMc.index5 != undefined)
   {
      _lineMc.txt5.setText(_lineMc.index5);
   }
   if(_lineMc.index6 != "" || _lineMc.index6 != undefined)
   {
      _lineMc.txt6.setText(_lineMc.index6);
   }
   if(_lineMc.index7 == 1)
   {
      _lineMc.gotoAndStop(2);
   }
   _lineMc.txt0.textColor = _loc2_;
   _lineMc.txt1.textColor = _loc2_;
   _lineMc.txt2.textColor = _loc2_;
   _lineMc.txt3.textColor = _loc2_;
   _lineMc.txt4.textColor = _loc2_;
   _lineMc.txt5.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
   _lineMc.txt6.textColor = _loc2_;
}
function ToGame_DungeonRanking_Init()
{
   fscommand("ToGame_DungeonRanking_Init");
}
function ToGame_DungeonRanking_CloseUI()
{
   fscommand("ToGame_DungeonRanking_CloseUI");
}
function ToGame_DungeonRanking_RequestSort(_num)
{
   getURL("FSCommand:ToGame_DungeonRanking_RequestSort",_num);
}
function ToGame_DungeonRanking_RequestSeason(_num)
{
   getURL("FSCommand:ToGame_DungeonRanking_RequestSeason",_num);
}
function ToGame_DungeonRanking_RequestRanking(_sortType)
{
   getURL("FSCommand:ToGame_DungeonRanking_RequestRanking",_sortType);
}
function ToGame_DungeonRanking_SelectTab(_num)
{
   getURL("FSCommand:ToGame_DungeonRanking_SelectTab",_num);
}
function tab_request()
{
   ToGame_DungeonRanking_RequestRanking(tab_btn.clickNum);
}
function tab_dungeon(_num, _noRequestEvent)
{
   if(_noRequestEvent == "0")
   {
      ToGame_DungeonRanking_SelectTab(_num);
   }
}
function listReset()
{
   lib.Debuger.trace("리셋");
   container_mc.list_mc.line_User.removeMovieClip();
   var _loc1_ = container_mc.list_mc.lineBox;
   for(var _loc2_ in _loc1_)
   {
      if(typeof _loc1_[_loc2_] == "movieclip")
      {
         _loc1_[_loc2_].removeMovieClip();
      }
   }
   scrollBar.pageSize = 0;
   scrollBar.scroll = 0;
}
var UI = this;
UI._visible = false;
var UIname = "DungeonRanking";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIname,UI,container_mc.lock_mc);
container_mc.title_box.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.title_box.verticalAlign = "center";
container_mc.list_mc.defaultStr.textColor = lib.info.TextColor.GENERAL_DISABLE;
container_mc.list_mc.defaultStr.setText(lib.util.UIString.getUIString("$111039"));
var TOTALLISTLINES = 18;
var DungeonMode = [];
var SeasomMode = [];
var DungeonListData = [];
var UpdateStr1 = lib.util.UIString.getUIString("$460039");
var defaultStr2 = lib.util.UIString.getUIString("$$111039");
var newStr = lib.util.UIString.getUIString("$276013");
var lineH = lib.manager.UISkin.LISTLINE_HEIGHT;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_DungeonRanking_CloseUI);
var tab_btn = new lib.util.TabBtn([container_mc.tabBtn_0,container_mc.tabBtn_1],[container_mc.tabBtn_txt0,container_mc.tabBtn_txt1]);
tab_btn.setRelease(tab_request);
container_mc.blind0._visible = false;
container_mc.blind1._visible = false;
var list_mcY = container_mc.list_mc.lineBox._y;
var scrollBar = container_mc.list_mc.scrollbar;
scrollBar.addListener(container_mc.list_mc.lineBox);
container_mc.list_mc.lineBox.onScroll = function()
{
   container_mc.list_mc.lineBox._y = list_mcY - arguments[0];
};
scrollBar.setWheel(container_mc.list_mc.lineBox);
scrollBar.wheelDelta = 1;
scrollBar.pageSize = 0;
scrollBar.displaySize = container_mc.list_mc.mask_mc._height;
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.rowHeight = 30;
scrollBar.scroll = 0;
var CustomScaleEvent;
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
      if(UI._visible == true)
      {
         CustomScaleEvent = new CustomScaleEvent();
         CustomScaleEvent.CustomScaleEventCheck(UI,UIname);
      }
      else
      {
         CustomScaleEvent.CustomScaleEventRemoveCheck();
      }
   }
};
myListener.OnGameEventChangeUIMode = function(_bShow)
{
   if(_global.gbUIMode && bWindowOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
myListener.OnGame_DungeonRanking_SetTab = function(_dungeons)
{
   DungeonMode = lib.util.ExtString.split(_dungeons,"\t");
   container_mc.tabBtn.labels = DungeonMode;
   container_mc.tabBtn.tab.setRelease(tab_dungeon);
};
myListener.OnGame_DungeonRanking_SelectTab = function(_index)
{
   container_mc.list_mc.line_User.removeMovieClip();
   container_mc.tabBtn.tab.setTab(_index,1);
};
myListener.OnGame_DungeonRanking_SetSeason = function(_seasons, _selectIndex)
{
   SeasomMode = lib.util.ExtString.split(_seasons,"\t");
   container_mc.comboBox.data = SeasomMode;
   container_mc.comboBox.removeListener(comboListner);
   container_mc.comboBox.selectedIndex = _selectIndex;
   container_mc.comboBox.addListener(comboListner);
};
myListener.OnGame_DungeonRanking_SetList = function(_list, _flag)
{
   var _loc6_ = lib.util.ExtString.split(_list,"\n");
   var _loc7_ = _loc6_.length;
   DungeonListData = [];
   tab_btn.preActivedNum = _flag;
   tab_btn.activedNum = _flag;
   if(_flag == 0)
   {
      container_mc.tabBtn_0.gotoAndStop(4);
      container_mc.tabBtn_txt0.textColor = lib.info.TextColor.TAB_ACTIVE;
      container_mc.tabBtn_1.gotoAndStop(1);
      container_mc.tabBtn_txt1.textColor = lib.info.TextColor.TAB_NORMAL;
   }
   else
   {
      container_mc.tabBtn_1.gotoAndStop(4);
      container_mc.tabBtn_txt1.textColor = lib.info.TextColor.TAB_ACTIVE;
      container_mc.tabBtn_0.gotoAndStop(1);
      container_mc.tabBtn_txt0.textColor = lib.info.TextColor.TAB_NORMAL;
   }
   var _loc2_ = 0;
   while(_loc2_ < _loc7_)
   {
      DungeonListData[_loc2_] = [];
      var _loc4_ = lib.util.ExtString.split(_loc6_[_loc2_],"\t");
      var _loc5_ = _loc4_.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc5_)
      {
         var _loc3_ = _loc4_[_loc1_];
         DungeonListData[_loc2_].push(_loc3_);
         _loc1_ = _loc1_ + 1;
      }
      _loc2_ = _loc2_ + 1;
   }
   buildList(DungeonListData);
   if(_loc6_.length <= 0)
   {
      container_mc.list_mc.defaultStr._visible = true;
      container_mc.list_mc.defaultStr.text = defaultStr2;
   }
   else
   {
      container_mc.list_mc.defaultStr._visible = false;
   }
   scrollBar.pageSize = container_mc.list_mc.lineBox._height;
};
myListener.OnGame_DungeonRanking_SetScore = function(_list)
{
   var _loc2_ = lib.util.ExtString.split(_list,"\t");
   var _loc1_ = undefined;
   container_mc.list_mc.line_User.removeMovieClip();
   if(_loc2_.length < 1)
   {
      return undefined;
   }
   _loc1_ = container_mc.list_mc.attachMovie("line","line_User",container_mc.list_mc.getNextHighestDepth());
   _loc1_.gotoAndStop(3);
   buildListSet(_loc1_,_loc2_,lib.info.TextColor.GENERAL_EMPHASIS);
   _loc1_.rankMc._visible = false;
   _loc1_.txt0._visible = true;
   _loc1_._x = 9;
   _loc1_._y = 640;
};
myListener.OnGame_DungeonRanking_UpdateData = function(data1)
{
   container_mc.list_mc.timeFd.setText("<font color=\'#d7d7d7\'>" + UpdateStr1 + "</font>" + " " + "<font color=\'" + "#80e71c" + "\'>" + data1 + "</font>");
};
var RankGroupLine;
myListener.OnGame_DungeonRanking_SetSubTab = function(index, type)
{
   var _loc1_ = undefined;
   if(type == 0)
   {
      _loc1_ = lib.info.TextColor.TAB_NORMAL;
   }
   else
   {
      _loc1_ = lib.info.TextColor.GENERAL_DISABLE;
      if(index == 0)
      {
         tab_btn.preActivedNum = 1;
         tab_btn.activedNum = 1;
         container_mc.tabBtn_1.gotoAndStop(4);
         container_mc.tabBtn_txt1.textColor = lib.info.TextColor.TAB_ACTIVE;
      }
      else
      {
         tab_btn.preActivedNum = 0;
         tab_btn.activedNum = 0;
         container_mc.tabBtn_0.gotoAndStop(4);
         container_mc.tabBtn_txt0.textColor = lib.info.TextColor.TAB_ACTIVE;
      }
   }
   container_mc.blindBtn._visible = Boolean(Number(type));
   container_mc["tabBtn_txt" + index].textColor = _loc1_;
   container_mc["tabBtn_" + index].gotoAndStop(1);
};
var comboListner = {};
comboListner.onChanged = function(_targetMc, _id, _index)
{
   if(_id == undefined)
   {
      return undefined;
   }
   ToGame_DungeonRanking_RequestSeason(_index);
};
container_mc.list_mc.sortBtn.onSelected = function(_index)
{
   ToGame_DungeonRanking_RequestSort(_index);
};
ToGame_DungeonRanking_Init();
