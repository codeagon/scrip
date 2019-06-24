function callEndAni(mc)
{
   container_mc._visible = true;
   if(mc._type == "start0")
   {
      container_mc.levelMc.gotoAndPlay(2);
   }
   else
   {
      container_mc.levelMc.gotoAndPlay(17);
   }
   isStart = false;
   mc.removeMovieClip();
}
function ToGame_BlackQuestAlim_Init()
{
   fscommand("ToGame_BlackQuestAlim_Init");
}
function ToGame_BlackQuestAlim_Close()
{
   fscommand("ToGame_BlackQuestAlim_Close");
}
function ToGame_BlackQuestAlim_QuestDetail()
{
   fscommand("ToGame_BlackQuestAlim_QuestDetail");
}
var UI = this;
var UIname = "BlackQuestAlim";
UI._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var bWidgetOpen = true;
var COLOR_TASK_COMPLETE = lib.info.TextColor.UI_QUESTINFO_FULL.toString(16);
var COLOR_TASK_NOCOMPLETE = lib.info.TextColor.UI_QUESTINFO_SHORT.toString(16);
var isStart = false;
var centerPosX = lib.info.AlignInfo.xRatioToPixel(50);
var centerPosY = lib.info.AlignInfo.yRatioToPixel(25);
var drightPosX = container_mc._x;
var drightPosY = container_mc._y;
var rightPosX = container_mc._x;
var rightPosY = container_mc._y;
var posX = centerPosX;
var posY = centerPosY;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == "blackquestalim")
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
myListener.OnGameEventChangeUIMode = function(bShow)
{
   container_mc.questMc.bg_mc._visible = _global.gbUIMode && bWidgetOpen;
};
myListener.OnGame_BlackQuestAlim_StartQuest = function(level, maxlevel)
{
   if(level == undefined)
   {
      return undefined;
   }
   var _loc3_ = level != maxlevel?"start0":"start1";
   isStart = true;
   var _loc1_ = UI.attachMovie(_loc3_,"startMc",UI.getNextHighestDepth());
   _loc1_._type = _loc3_;
   _loc1_._xscale = _loc1_._yscale = 120;
   _loc1_._x = lib.info.AlignInfo.xRatioToPixel(50) / lib.info.AlignInfo.scaleRatio;
   _loc1_._y = lib.info.AlignInfo.yRatioToPixel(25) / lib.info.AlignInfo.scaleRatio;
   if(level != undefined)
   {
      _loc1_.txtMc.txt.text = level;
   }
   lib.manager.UISound.play("2086");
};
myListener.OnGame_BlackQuestAlim_AddQuest = function(questName, questMission, level, maxlevel)
{
   if(questName == undefined)
   {
      return undefined;
   }
   container_mc._visible = !isStart;
   if(level != undefined)
   {
      container_mc.levelMc.txtMc0.txt.text = level;
      container_mc.levelMc.txtMc1.txt.text = level;
   }
   container_mc.levelMc.txtMc1.txt.textColor = 8447772;
   container_mc.levelMc.txtMc0.txt.textColor = 14145495;
   var _loc6_ = lib.util.ExtString.split(questMission,"\n");
   var _loc7_ = _loc6_.length;
   container_mc.questMc.txt0.textColor = 32511;
   container_mc.questMc.txt0.setText("");
   container_mc.questMc.txt0.setText(questName);
   container_mc.questMc.txt1.htmlText = "";
   container_mc.questMc.focus_mc._visible = false;
   var _loc4_ = 0;
   while(_loc4_ < _loc7_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
      if(_loc2_[0] == "" || _loc2_[0] == undefined)
      {
         break;
      }
      var _loc1_ = _loc2_[0];
      var _loc3_ = _loc2_[1];
      var _loc5_ = _loc2_[2];
      if(_loc3_ != undefined && _loc3_ != "")
      {
         _loc1_ = _loc1_ + (" &lt;" + _loc3_ + "/" + _loc5_ + "&gt;");
         if(_loc3_ == _loc5_)
         {
            _loc1_ = "<font color=\'#" + COLOR_TASK_COMPLETE + "\'>" + _loc1_ + "</font>";
         }
         else
         {
            _loc1_ = "<font color=\'#" + COLOR_TASK_NOCOMPLETE + "\'>" + _loc1_ + "</font>";
         }
      }
      else
      {
         _loc1_ = "<font color=\'#FCFBA5\'>" + _loc1_ + "</font>";
      }
      container_mc.questMc.txt1.htmlText = container_mc.questMc.txt1.htmlText + (_loc1_ + "<br>");
      _loc4_ = _loc4_ + 1;
   }
   container_mc.questMc.txt1._height = container_mc.questMc.txt1.textHeight + 4;
   container_mc.questMc.bg_mc._height = container_mc.questMc.txt1._height + container_mc.questMc.txt1._y + 4;
   container_mc.questMc.focus_mc._height = container_mc.questMc.bg_mc._height + 8;
   container_mc.questMc.focus_mc._visible = false;
   container_mc.questMc.bg_mc.onRollOver = function()
   {
      container_mc.questMc.focus_mc._visible = true;
   };
   container_mc.questMc.bg_mc.onRollOut = function()
   {
      container_mc.questMc.focus_mc._visible = false;
   };
   container_mc.questMc.bg_mc.onRelease = function()
   {
      container_mc.questMc.focus_mc._visible = false;
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      ToGame_BlackQuestAlim_QuestDetail();
   };
   if(isStart)
   {
      return undefined;
   }
   if(Number(level) < Number(maxlevel))
   {
      container_mc.levelMc.gotoAndPlay("s1");
   }
   else
   {
      container_mc.levelMc.gotoAndPlay("s2");
   }
};
container_mc.hit.onPress = function()
{
   UI._alpha = 70;
   var _loc1_ = com.bluehole.tera.managers.LayoutManager.getDragEdgesByHit(UI);
   UI.startDrag(false,_loc1_.xMin,_loc1_.yMin,_loc1_.xMax,_loc1_.yMax);
};
container_mc.hit.onRelease = container_mc.hit.onReleaseOutside = function()
{
   UI._alpha = 100;
   UI.stopDrag();
   com.bluehole.tera.managers.LayoutManager.saveUIPositon(UI,3,1);
};
container_mc._visible = false;
ToGame_BlackQuestAlim_Init();
