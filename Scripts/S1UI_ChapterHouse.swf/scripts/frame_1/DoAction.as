function getZone(zoneId)
{
   var _loc1_ = undefined;
   for(element in zone_array)
   {
      if(zone_array[element].id == zoneId)
      {
         _loc1_ = zone_array[element];
         return _loc1_;
      }
   }
   return null;
}
function getQuest(questId)
{
   var _loc1_ = undefined;
   for(element in quest_array)
   {
      if(quest_array[element].id == questId)
      {
         _loc1_ = quest_array[element];
         return _loc1_;
      }
   }
   return null;
}
function ToGame_ChapterHouse_ShowQuestStartDialog(questId)
{
   getURL("FSCommand:ToGame_ChapterHouse_ShowQuestStartDialog",questId);
}
function ToGame_ChapterHouse_SelectTab(stat)
{
   getURL("FSCommand:ToGame_ChapterHouse_SelectTab",stat);
}
function ToGame_ChapterHouse_CloseUI()
{
   fscommand("ToGame_ChapterHouse_CloseUI");
}
function release(num)
{
   ToGame_ChapterHouse_SelectTab(num);
   var _loc1_ = 0;
   while(_loc1_ < 5)
   {
      if(_loc1_ == num)
      {
         container_mc["con_tab" + _loc1_]._visible = true;
      }
      else
      {
         container_mc["con_tab" + _loc1_]._visible = false;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function closeUI()
{
   ToGame_ChapterHouse_CloseUI();
}
var UI = this;
UI._visible = false;
var UIname = "ChapterHouse";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var clickZone;
var clickQuest;
var clickStat;
var completeStr = lib.util.UIString.getUIString("$181018");
var questNumStr = lib.util.UIString.getUIString("$091004");
var STR_STEP = lib.util.UIString.getUIString("$091008");
var STR_FAIL = lib.util.UIString.getUIString("$091009");
var STR_REPEAT = lib.util.UIString.getUIString("$091010");
var STR_TIMELIMIT = lib.util.UIString.getUIString("$091011");
var STR_REAPEATNTIME = lib.util.UIString.getUIString("$091012");
var STR_INFINITY = lib.util.UIString.getUIString("$091021");
var levelStr = lib.util.UIString.getUIString("$091027");
var LISTROWS = 11;
var ROWSPACE = 0;
var lineHeight = 30;
var contentsHeight = container_mc.con_tab0.mask_mc._height;
var i = 0;
while(i < 5)
{
   var con = container_mc["con_tab" + i];
   con._visible = false;
   var scrollBar = con.scrollbar;
   var targetContent = con.list;
   var targetMask = con.mask_mc;
   scrollBar.addListener(targetContent);
   targetContent.onScroll = function()
   {
      this._y = - arguments[0];
   };
   scrollBar.setWheel(targetContent);
   scrollBar.wheelDelta = 1;
   scrollBar.pageSize = 0;
   scrollBar.displaySize = contentsHeight - 50;
   scrollBar.defaultBarSizeRatio = 0.3333333333333333;
   scrollBar.rowHeight = lineHeight + ROWSPACE;
   scrollBar.scroll = 0;
   targetContent.onSelected = function(id, isParent)
   {
      this._parent.scrollbar.pageSize = this.calculateListHight();
   };
   i++;
}
bWidgetOpen = false;
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
myListener.OnGame_ChapterHouse_SetTabUse = function(dataList)
{
   var _loc4_ = dataList.split("\n");
   if(_loc4_[_loc4_.length - 1] == "0" || _loc4_[_loc4_.length - 1] == "undefined" || _loc4_[_loc4_.length - 1] == "")
   {
      _loc4_.pop();
   }
   var _loc2_ = 0;
   while(_loc2_ < _loc4_.length)
   {
      var _loc1_ = _loc4_[_loc2_].split("\t");
      if(_loc1_.length != 1)
      {
         var _loc3_ = Number(_loc1_[0]);
         var _loc5_ = _loc1_[1];
         var _loc6_ = Number(_loc1_[2]);
         tab.setText(_loc3_,_loc5_);
         tab.setVisible(_loc3_,_loc6_);
      }
      _loc2_ = _loc2_ + 1;
   }
};
myListener.OnGame_ChapterHouse_SetTab = function(stat)
{
   tab.setTab(stat,1);
};
var zone_array = new Array();
var quest_array = new Array();
myListener.OnGame_ChapterHouse_SetTitleText = function(str)
{
   container_mc.title_txt.setText(str);
};
myListener.OnGame_ChapterHouse_AddQuest = function(questData)
{
   var _loc2_ = questData.split("\t");
   if(_loc2_.length != 1)
   {
      var _loc9_ = Number(_loc2_[0]);
      var _loc11_ = _loc2_[1];
      var _loc10_ = _loc2_[2];
      var _loc7_ = _loc2_[3];
      var _loc6_ = Number(_loc2_[4]);
      var _loc8_ = _loc2_[5];
      var _loc14_ = _loc2_[6];
      var _loc12_ = Number(_loc2_[7]);
      var _loc13_ = Number(_loc2_[8]);
      var _loc3_ = container_mc["con_tab" + _loc14_];
      var _loc5_ = _loc3_.list.addData(_loc9_,_loc11_,_loc10_,_loc7_,_loc12_,_loc13_);
      _loc3_.list.showCheckBox(_loc9_,0);
      _loc3_.list.showCheckBox(_loc10_,0);
      _loc3_.list.useDefaultColorDepth1 = true;
      _loc3_.list.useDefaultColorDepth2 = false;
      var _loc4_ = undefined;
      if(_loc8_ != "0")
      {
         _loc4_ = "[" + levelStr + _loc8_ + "] " + _loc7_;
      }
      else
      {
         _loc4_ = _loc7_;
      }
      if(_loc6_ == 0)
      {
         _loc5_.txt.setText("<font color=\'#" + lib.info.TextColor.UI_QUESTJOURNAL_LEVEL0.toString(16) + "\' >" + _loc4_ + "</font>");
      }
      else if(_loc6_ == 1)
      {
         _loc5_.txt.setText("<font color=\'#" + lib.info.TextColor.UI_QUESTJOURNAL_LEVEL1.toString(16) + "\' >" + _loc4_ + "</font>");
      }
      else if(_loc6_ == 2)
      {
         _loc5_.txt.setText("<font color=\'#" + lib.info.TextColor.UI_QUESTJOURNAL_LEVEL2.toString(16) + "\' >" + _loc4_ + "</font>");
      }
      else if(_loc6_ == 3)
      {
         _loc5_.txt.setText("<font color=\'#" + lib.info.TextColor.UI_QUESTJOURNAL_LEVEL3.toString(16) + "\' >" + _loc4_ + "</font>");
      }
      _loc5_.hit.onRelease2 = function()
      {
         ToGame_ChapterHouse_ShowQuestStartDialog(this._parent.id);
      };
      _loc3_.scrollbar.pageSize = _loc3_.list._height;
   }
};
myListener.OnGame_ChapterHouse_UpdateQuest = function(questData)
{
   var _loc1_ = questData.split("\t");
   if(_loc1_.length != 1)
   {
      var _loc9_ = _loc1_[0];
      var _loc6_ = _loc1_[1];
      var _loc3_ = Number(_loc1_[2]);
      var _loc5_ = _loc1_[3];
      var _loc7_ = _loc1_[4];
      var _loc8_ = container_mc["con_tab" + _loc7_];
      var _loc4_ = _loc8_.list.getSub(_loc9_);
      var _loc2_ = undefined;
      if(_loc5_ != "0")
      {
         _loc2_ = "[" + levelStr + _loc5_ + "] " + _loc6_;
      }
      else
      {
         _loc2_ = _loc6_;
      }
      if(_loc3_ == 0)
      {
         _loc4_.txt.setText("<font color=\'#" + lib.info.TextColor.UI_QUESTJOURNAL_LEVEL0.toString(16) + "\' >" + _loc2_ + "</font>");
      }
      else if(_loc3_ == 1)
      {
         _loc4_.txt.setText("<font color=\'#" + lib.info.TextColor.UI_QUESTJOURNAL_LEVEL1.toString(16) + "\' >" + _loc2_ + "</font>");
      }
      else if(_loc3_ == 2)
      {
         _loc4_.txt.setText("<font color=\'#" + lib.info.TextColor.UI_QUESTJOURNAL_LEVEL2.toString(16) + "\' >" + _loc2_ + "</font>");
      }
      else if(_loc3_ == 3)
      {
         _loc4_.txt.setText("<font color=\'#" + lib.info.TextColor.UI_QUESTJOURNAL_LEVEL3.toString(16) + "\' >" + _loc2_ + "</font>");
      }
   }
};
myListener.OnGame_ChapterHouse_RemoveQuest = function(questId, whenTab)
{
   var _loc1_ = container_mc["con_tab" + whenTab];
   _loc1_.list.removeData(questId);
};
myListener.OnGame_ChapterHouse_Clear = function(whenTab)
{
   if(whenTab != undefined)
   {
      var _loc2_ = container_mc["con_tab" + whenTab];
      _loc2_.list.clear();
      _loc2_.scrollbar.pageSize = 0;
   }
   else
   {
      var _loc1_ = 0;
      while(_loc1_ < 5)
      {
         _loc2_ = container_mc["con_tab" + _loc1_];
         _loc2_.list.clear();
         _loc2_.scrollbar.pageSize = 0;
         _loc1_ = _loc1_ + 1;
      }
   }
};
var CON_TAB_Y = 86;
var SCROLL_HEIGHT = 581;
var MASK_HEIGHT = 580;
var PROGRESS_PLUS = 70;
myListener.OnGame_ChapterHouse_AddProgressCount = function(whenTab, preCount, maxCount)
{
   if(whenTab != undefined)
   {
      var _loc1_ = container_mc["con_tab" + whenTab];
      var _loc2_ = undefined;
      if(_loc1_.progressMc)
      {
         _loc2_ = _loc1_.progressMc;
      }
      else
      {
         _loc2_ = _loc1_.attachMovie("progressMc","progressMc",_loc1_.getNextHighestDepth());
      }
      _loc2_._x = 9;
      _loc2_._y = 10 - PROGRESS_PLUS;
      _loc2_.txt.htmlText = lib.util.UIString.getUIString("$091036") + "(" + preCount + "/" + maxCount + ")";
      _loc2_.maskMc._width = 440 * preCount / maxCount;
      _loc1_._y = CON_TAB_Y + PROGRESS_PLUS;
      _loc1_.mask_mc._height = MASK_HEIGHT - PROGRESS_PLUS;
      _loc1_.scrollbar.displaySize = contentsHeight - 50 - PROGRESS_PLUS;
      _loc1_.scrollbar.resize(SCROLL_HEIGHT - PROGRESS_PLUS);
      _loc1_.scrollbar.pageSize = _loc1_.list._height;
   }
};
myListener.OnGame_ChapterHouse_RemoveProgressCount = function(whenTab)
{
   if(whenTab != undefined)
   {
      var _loc1_ = container_mc["con_tab" + whenTab];
      if(_loc1_.progressMc)
      {
         _loc1_.progressMc.removeMovieClip();
      }
      _loc1_._y = CON_TAB_Y;
      _loc1_.mask_mc._height = MASK_HEIGHT;
      _loc1_.scrollbar.displaySize = contentsHeight - 50;
      _loc1_.scrollbar.resize(SCROLL_HEIGHT);
      _loc1_.scrollbar.pageSize = _loc1_.list._height;
   }
};
myListener.OnGame_ChapterHouse_SetGuide = function(enable, txt)
{
   container_mc.tipMc._visible = Boolean(Number(enable));
   container_mc.tipMc.tipTxt.text = txt;
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var tab = container_mc.tabBtn.tab;
container_mc.tabBtn.labels = ["첫번째탭","두번째탭","세번째탭","네번째탭"];
tab.setRelease(release);
tab.setTab(0,1);
container_mc.tipMc._visible = false;
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
fscommand("ToGame_ChapterHouse_Init");
