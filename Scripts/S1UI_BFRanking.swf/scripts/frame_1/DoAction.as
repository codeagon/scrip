function buildList(teamListData)
{
   listReset();
   var _loc11_ = lib.util.ExtString.split(teamListData,"\n");
   var _loc12_ = _loc11_.length;
   var _loc10_ = 0;
   if(_loc12_ <= 0)
   {
      container_mc.defaultStr._visible = true;
      container_mc.defaultStr.text = defaultStr2;
   }
   else
   {
      container_mc.defaultStr._visible = false;
   }
   var _loc7_ = 0;
   while(_loc7_ < _loc12_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc11_[_loc7_],"\t");
      var _loc9_ = _loc2_.length - 3;
      var _loc5_ = ColumsEdit[0];
      var _loc8_ = ColumsEdit.length;
      var _loc4_ = container_mc.teamListMc.attachMovie("line","line_" + _loc7_,container_mc.teamListMc.getNextHighestDepth());
      _loc4_._y = _loc10_;
      _loc10_ = _loc10_ + 30;
      setRankArrow(_loc4_,_loc2_[0],_loc2_[1],_loc2_[2]);
      var _loc1_ = 0;
      while(_loc1_ < _loc9_)
      {
         if(_loc1_ <= _loc8_)
         {
            var _loc6_ = _loc2_[_loc1_ + 3];
            var _loc3_ = ColumsEdit[_loc1_ + 1];
            createText(_loc4_,"Txt_" + _loc1_,_loc6_,_loc5_,0,_loc3_,30);
            _loc5_ = _loc5_ + _loc3_;
         }
         _loc1_ = _loc1_ + 1;
      }
      _loc7_ = _loc7_ + 1;
   }
}
function setRankArrow(_targetMc, _typeIcon, _typeNum, _rankNum)
{
   _targetMc.rankArrow.gotoAndStop(Number(_typeIcon) + 1);
   _targetMc.change_txt.textAutoSize = "shrink";
   if(_typeIcon == "0" || _typeIcon == "2")
   {
      _targetMc.change_txt.textColor = lib.info.TextColor.BFRank_ArrayDown;
      _targetMc.change_txt.text = "[" + _typeNum + "]";
   }
   else if(_typeIcon == "1")
   {
      _targetMc.change_txt.textColor = lib.info.TextColor.BFRank_ArrayUp;
      _targetMc.change_txt.text = "[" + _typeNum + "]";
   }
   else
   {
      _targetMc.change_txt.text = "";
   }
   _targetMc.rank_txt.setText(_rankNum);
   if(Number(_rankNum) < TOPLINE)
   {
      _targetMc.effect_mc.gotoAndStop("over");
   }
   else
   {
      _targetMc.effect_mc.gotoAndStop("out");
   }
}
function createText(_targetMc, _targetName, _txt, _posX, _posY, _w, _h)
{
   var _loc1_ = (TextField)_targetMc[_targetName];
   if(!_loc1_)
   {
      _loc1_ = _targetMc.createTextField(_targetName,_targetMc.getNextHighestDepth(),_posX,_posY,_w,_h);
   }
   if(_txt == undefined)
   {
      _txt = "";
   }
   _loc1_.wordWrap = false;
   _loc1_.multiline = false;
   _loc1_.selectable = false;
   _loc1_.html = true;
   _loc1_.verticalAlign = "center";
   _loc1_.setNewTextFormat(textFormat);
   _loc1_.setText(_txt);
   return _loc1_;
}
function setLineType(_LNum, _CNum)
{
   if(_LNum != undefined && _LNum != "")
   {
      var _loc1_ = lib.util.ExtString.split(_LNum,"\t");
      container_mc.sortBtn.labels = _loc1_;
   }
   else
   {
      container_mc.sortBtn.labels = LABELS_DEFAULT;
   }
   if(_CNum != undefined && _CNum != "")
   {
      ColumsEdit = lib.util.ExtString.split(_CNum,"\t");
      container_mc.sortBtn.colums = ColumsEdit;
   }
   else
   {
      ColumsEdit = COLUMS_DEFAULT;
      container_mc.sortBtn.colums = COLUMS_DEFAULT;
   }
}
function listReset()
{
   var _loc1_ = container_mc.teamListMc;
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
function ToGame_BFRanking_Init()
{
   fscommand("ToGame_BFRanking_Init");
}
function ToGame_BFRanking_CloseUI()
{
   fscommand("ToGame_BFRanking_CloseUI");
}
function ToGame_BFRanking_RequestSetTab(num)
{
   getURL("FSCommand:ToGame_BFRanking_RequestSetTab",num);
}
function ToGame_BFRanking_RequestSort(num)
{
   getURL("FSCommand:ToGame_BFRanking_RequestSort",num);
}
function tab_release(num, noRequestEvent)
{
   if(noRequestEvent == "0")
   {
      ToGame_BFRanking_RequestSetTab(num);
   }
   TabNumber = num;
}
function ToGame_BFRanking_RequestServer(_num)
{
   getURL("FSCommand:ToGame_BFRanking_RequestServer",_num);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "BFRanking";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.defaultStr.textColor = lib.info.TextColor.GENERAL_DISABLE;
container_mc.defaultStr.verticalAlign = "center";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var list_mcY = container_mc.teamListMc._y;
var scrollBar = container_mc.moviescroll1;
scrollBar.addListener(container_mc.teamListMc);
container_mc.teamListMc.onScroll = function()
{
   container_mc.teamListMc._y = list_mcY - arguments[0];
};
scrollBar.setWheel(container_mc.teamListMc);
scrollBar.wheelDelta = 1;
scrollBar.pageSize = 0;
scrollBar.displaySize = container_mc.mask_mc._height;
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.rowHeight = 30;
scrollBar.scroll = 0;
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
var TOTALLISTLINES = 18;
var FULLCOLOR = lib.info.TextColor.LIST_PERSONNEL_FULL.toString(16);
var lineH = lib.manager.UISkin.LISTLINE_HEIGHT;
var teamListMcY = container_mc.teamListMc._y;
var teamListData = [];
var defaultStr2 = lib.util.UIString.getUIString("$276014");
var BFStr1 = lib.util.UIString.getUIString("$276015");
var BFStr2 = lib.util.UIString.getUIString("$276016");
var BFStr3 = lib.util.UIString.getUIString("$276017");
var newStr = lib.util.UIString.getUIString("$276013");
var UpdateStr1 = lib.util.UIString.getUIString("$276023");
var UpdateStr2 = lib.util.UIString.getUIString("$276019");
var TOPLINE = 5;
var TabNumber = 0;
var SortTotal = 10;
var LABELS_DEFAULT = ["$276004","$276005","$276022","$276006","$276008","$276009","$276010","$276021"];
var COLUMS_DEFAULT = [110,165,96,165,96,183,70,224];
var ColumsEdit = [];
myListener.OnGame_BFRanking_SetList = function(teamList, topClassNum)
{
   if(topClassNum != "" && topClassNum != undefined)
   {
      TOPLINE = topClassNum;
   }
   buildList(teamList);
   m_tab.setTab(TabNumber,1);
   tab_release(TabNumber,1);
   scrollBar.pageSize = container_mc.teamListMc._height;
};
myListener.OnGame_BFRanking_SetTabList = function(tabList)
{
   container_mc.tabBtn.clear();
   var _loc1_ = lib.util.ExtString.split(tabList,"\t");
   container_mc.tabBtn.labels = _loc1_;
   m_tab = container_mc.tabBtn.tab;
   m_tab.setRelease(tab_release);
};
myListener.OnGame_BFRanking_SetTabIndex = function(tabNum)
{
   TabNumber = tabNum;
   m_tab.setTab(TabNumber,1);
};
myListener.OnGame_BFRanking_UpdateData = function(data1)
{
   container_mc.timeFd.setText("<font color=\'#d7d7d7\'>" + UpdateStr1 + "</font>" + " " + "<font color=\'" + "#80e71c" + "\'>" + data1 + "</font>");
};
myListener.OnGame_BFRanking_UserRank = function(_num)
{
   var _loc2_ = container_mc.teamListMc["line_" + _num];
   _loc2_.effect_mc.gotoAndStop("active");
   var _loc1_ = 0;
   while(_loc1_ < SortTotal - 3)
   {
      _loc2_["Txt_" + _loc1_].textColor = lib.info.TextColor.GENERAL_EMPHASIS;
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_BFRanking_SetSortChange = function(_Data)
{
   var _loc5_ = lib.util.ExtString.split(_Data,"\n");
   SortTotal = _loc5_.length;
   var _loc4_ = [];
   var _loc3_ = [];
   var _loc2_ = 0;
   while(_loc2_ < SortTotal)
   {
      var _loc1_ = lib.util.ExtString.split(_loc5_[_loc2_],"\t");
      _loc4_.push(_loc1_[0]);
      if(_loc1_[1] > 0)
      {
         _loc3_.push(_loc1_[1]);
      }
      _loc2_ = _loc2_ + 1;
   }
   setLineType(_loc4_,_loc3_);
};
var textFormat = new TextFormat("$NormalFont",16,14145495,false,false,false,null,null,"center",5,5,0,0);
var comboListner = {};
comboListner.onChanged = function(_targetMc, _id, _index)
{
   if(_id == undefined)
   {
      return undefined;
   }
   ToGame_BFRanking_RequestServer(_index);
};
myListener.OnGame_BFRanking_SetServer = function(_server, _selectIndex)
{
   var _loc1_ = lib.util.ExtString.split(_server,"\t");
   container_mc.comboBox.removeListener(comboListner);
   container_mc.comboBox.data = _loc1_;
   container_mc.comboBox.selectedIndex = _selectIndex;
   container_mc.combo_txt.text = _loc1_[_selectIndex];
   container_mc.comboBox.addListener(comboListner);
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_BFRanking_CloseUI);
var m_tab = container_mc.tabBtn.tab;
container_mc.sortBtn.onSelected = function(index)
{
   ToGame_BFRanking_RequestSort(index);
};
setLineType();
ToGame_BFRanking_Init();
