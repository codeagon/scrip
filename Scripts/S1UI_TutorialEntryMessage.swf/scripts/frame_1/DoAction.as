function MsgMotion()
{
   IntervalClear();
   msgmc.play();
   UI.onEnterFrame = function()
   {
      if(msgmc._currentframe == 19)
      {
         delete UI.onEnterFrame;
         blindmc.gotoAndPlay(2);
         ToGame_TutorialEntryMessage_Close();
      }
   };
}
function fadeMotion_IN()
{
   IntervalClear();
   blindmc.gotoAndStop(11);
   lib.Debuger.trace("fadeMotion_IN");
   blindmc.onEnterFrame = function()
   {
      blindmc.nextFrame();
      if(blindmc._currentframe == FADEIN_FRAME)
      {
         delete blindmc.onEnterFrame;
         ToGame_TutorialEntryMessage_Close();
      }
   };
}
function fadeMotion_OUT()
{
   IntervalClear();
   blindmc.gotoAndStop(91);
   blindmc.onEnterFrame = function()
   {
      blindmc.nextFrame();
      if(blindmc._currentframe == FADEOUT_FRAME)
      {
         delete blindmc.onEnterFrame;
         ToGame_TutorialEntryMessage_Close();
      }
   };
}
function IntervalClear()
{
   var _loc2_ = settimeList.length;
   if(_loc2_ == 0)
   {
      return undefined;
   }
   var _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      clearInterval(settimeList[_loc1_]);
      _loc1_ = _loc1_ + 1;
   }
   settimeList = [];
}
function ToGame_TutorialEntryMessage_Init()
{
   lib.Debuger.trace("ToGame_TutorialEntryMessage_Init");
   fscommand("ToGame_TutorialEntryMessage_Init");
}
function ToGame_TutorialEntryMessage_Close()
{
   lib.Debuger.trace("ToGame_TutorialEntryMessage_Close");
   fscommand("ToGame_TutorialEntryMessage_Close");
}
var UIname = "TutorialEntryMessage";
var UI = this;
UI._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var settimetd;
var settimeList = [];
var FADEIN_FRAME = 90;
var FADEOUT_FRAME = 170;
msgmc.msgmc.gotoAndStop(1);
msgmc.msgmc.txt0._visible = false;
msgmc.msgmc.txt1._visible = false;
msgmc.msgmc.txt2._visible = false;
msgmc.msgmc.txt0.verticalAlign = "center";
msgmc.msgmc.txt1.verticalAlign = "center";
msgmc.msgmc.txt2.verticalAlign = "center";
msgmc2.msgmc.gotoAndStop(1);
msgmc2.msgmc.txt3._visible = false;
msgmc2.msgmc.txt3.verticalAlign = "center";
myListener.OnGame_ScaleUI = function()
{
   myListener.OnGame_ChangeStageSize();
};
myListener.OnGame_ChangeStageSize = function(w, h)
{
   hit._width = Stage.width;
   hit._height = Stage.height;
   hit._x = lib.info.AlignInfo.xRatioToPixel(0);
   hit._y = lib.info.AlignInfo.yRatioToPixel(0);
   msgmc._x = lib.info.AlignInfo.xRatioToPixel(50);
   msgmc._y = lib.info.AlignInfo.yRatioToPixel(50);
   msgmc2._x = lib.info.AlignInfo.xRatioToPixel(50);
   msgmc2._y = lib.info.AlignInfo.yRatioToPixel(50);
   blindmc._width = Stage.width + 20;
   blindmc._height = Stage.height + 20;
   blindmc._x = lib.info.AlignInfo.xRatioToPixel(0) - 10;
   blindmc._y = lib.info.AlignInfo.yRatioToPixel(0) - 10;
   blindmask._width = Stage.width;
   blindmask._height = Stage.height;
   blindmask._x = lib.info.AlignInfo.xRatioToPixel(0);
   blindmask._y = lib.info.AlignInfo.yRatioToPixel(0);
};
bWidgetOpen = false;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      UI._visible = bWidgetOpen;
      if(!bShow)
      {
         IntervalClear();
         delete UI.onEnterFrame;
         delete blindmc.onEnterFrame;
         blindmc.gotoAndStop(1);
      }
   }
};
myListener.OnGame_TutorialEntryMessage_SetDate = function(_type, _sec, _msg)
{
   blindmc.gotoAndStop(1);
   msgmc.msgmc.gotoAndStop(1);
   msgmc.msgmc.txt0._visible = false;
   msgmc.msgmc.txt1._visible = false;
   msgmc.msgmc.txt2._visible = false;
   IntervalClear();
   delete UI.onEnterFrame;
   if(_type == 0)
   {
      msgmc.msgmc.txt0._visible = true;
      msgmc.msgmc.txt0.htmlText = _msg;
   }
   else if(_type == 1)
   {
      msgmc.msgmc.txt1._visible = true;
      msgmc.msgmc.txt1.htmlText = _msg;
   }
   else if(_type == 2)
   {
      msgmc.msgmc.txt2._visible = true;
      msgmc.msgmc.txt2.htmlText = _msg;
   }
   msgmc.gotoAndPlay(2);
   UI.onEnterFrame = function()
   {
      if(msgmc._currentframe >= 10)
      {
         delete UI.onEnterFrame;
         settimetd = setInterval(MsgMotion,_sec);
         settimeList.push(settimetd);
      }
   };
};
myListener.OnGame_TutorialEntryMessage_Effect_SetData = function(_type, _sec)
{
   UI.onEnterFrame = null;
   IntervalClear();
   delete blindmc.onEnterFrame;
   msgmc.gotoAndStop(1);
   msgmc.msgmc.gotoAndStop(1);
   if(_type == 0)
   {
      settimetd = setInterval(fadeMotion_IN,_sec);
      settimeList.push(settimetd);
   }
   else
   {
      settimetd = setInterval(fadeMotion_OUT,_sec);
      settimeList.push(settimetd);
   }
};
myListener.OnGame_ChangeStageSize();
ToGame_TutorialEntryMessage_Init();
