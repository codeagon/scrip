function initCrosshair()
{
   container_mc.clear();
   lib.display.DrawBitmapData.draw(container_mc,UI[type + "BgBm"],UI[type + "Pos"],UI[type + "Pos"],0,0,UI[type + "Size"],UI[type + "Size"]);
   container_mc.distanceFd.text = "";
   container_mc.distance_txt.text = "";
   container_mc.levelFd.text = "";
   container_mc.lockNumFd._visible = false;
   myListener.OnGame_Crosshair_Aimed(false);
   myListener.OnGame_Crosshair_Position(xPos,yPos);
}
function removeHit()
{
}
function playLockOn(mc)
{
   var _loc1_ = mc.attachMovie("lockon_4","lockon_4",mc.getNextHighestDepth());
   _loc1_._x = -33;
   _loc1_._y = -35;
}
var UI = this;
UI._visible = false;
var UIname = "Crosshair";
bWidgetOpen = true;
var xPos = 64;
var yPos = 64;
var bAimed = false;
var bLock = false;
var type = "";
var crossStyle = "0";
var normalBgBm = flash.display.BitmapData.loadBitmap("normalBg");
var normalSize = 100;
var normalPos = -64;
var smallBgBm = flash.display.BitmapData.loadBitmap("smallBg");
var smallSize = 100;
var smallPos = -64;
var lockBgBm = flash.display.BitmapData.loadBitmap("lockBg");
var axis = new lib.util.AxisResetter();
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var mStr = lib.util.UIString.getUIString("$001065");
var lvStr = lib.util.UIString.getUIString("$221004");
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      UI._visible = bWidgetOpen;
      if(!bWidgetOpen)
      {
         UI._visible = false;
      }
      else
      {
         UI._visible = true;
         container_mc._visible = !_global.gbUIMode;
      }
   }
};
var prevUImode = false;
var UImode = false;
var custommanager = lib.manager.CustomScaleManger.getInstance();
myListener.OnGameEventChangeUIMode = function(bUIMode)
{
   prevUImode = Number(UImode);
   UImode = Number(_global.gbUIMode);
   if(bWidgetOpen)
   {
      if(!UImode && prevUImode)
      {
         container_mc._visible = true;
      }
      else if(UImode)
      {
         container_mc._visible = false;
      }
   }
};
myListener.OnGame_Crosshair_Name = function(crossType)
{
   type = crossType.toLowerCase();
   initCrosshair();
};
myListener.OnGame_Crosshair_Style = function(style)
{
   crossStyle = style;
};
var aimedMc = null;
myListener.OnGame_Crosshair_Aimed = function(bFlag)
{
   bAimed = Number(bFlag);
   delete aimedMc.onEnterFrame;
   if(aimedMc)
   {
      delete aimedMc.onEnterFrame;
      aimedMc.num = aimedMc._currentframe;
   }
   if(bAimed)
   {
      container_mc.clear();
      if(type == "normal")
      {
         if(aimedMc == null)
         {
            aimedMc = container_mc.attachMovie("aimedMc","aimedMc",1);
            aimedMc.num = 1;
         }
         else if(aimedMc.num < 17)
         {
            aimedMc.play();
         }
      }
      else if(aimedMc == null)
      {
         aimedMc = container_mc.attachMovie("aimedMc2","aimedMc",1);
         aimedMc.num = 1;
      }
      else if(aimedMc.num < 17)
      {
         aimedMc.play();
      }
   }
   else
   {
      aimedMc.onEnterFrame = function()
      {
         this.num = this.num - 1;
         if(this.num == 1)
         {
            delete this.onEnterFrame;
            this.removeMovieClip();
            container_mc.clear();
            lib.display.DrawBitmapData.draw(container_mc,UI[type + "BgBm"],UI[type + "Pos"],UI[type + "Pos"],0,0,UI[type + "Size"],UI[type + "Size"]);
            aimedMc = null;
         }
         else
         {
            this.gotoAndStop(this.num);
         }
      };
   }
};
myListener.OnGame_Crosshair_Hit = function()
{
   delete aimedMc.onEnterFrame;
   aimedMc.num = 25;
   if(!bAimed)
   {
      myListener.OnGame_Crosshair_Aimed(false);
      return undefined;
   }
   aimedMc.onEnterFrame = function()
   {
      this.num = this.num - 1;
      if(this.num > 16)
      {
         this.gotoAndStop(this.num);
      }
      else
      {
         delete aimedMc.onEnterFrame;
      }
   };
};
myListener.OnGame_ChangeStageSize = function(w, h)
{
   container_mc._x = lib.info.AlignInfo.xRatioToPixel(xPos);
   container_mc._y = lib.info.AlignInfo.yRatioToPixel(yPos);
   custommanager.removeCustomScale(container_mc,UIname);
   custommanager.addCustomScale(container_mc,UIname);
};
myListener.OnGame_Crosshair_Position = function(x, y)
{
   xPos = Number(x);
   yPos = Number(y);
   container_mc._x = lib.info.AlignInfo.xRatioToPixel(xPos);
   container_mc._y = lib.info.AlignInfo.yRatioToPixel(yPos);
   custommanager.removeCustomScale(container_mc,UIname);
   custommanager.addCustomScale(container_mc,UIname);
};
myListener.OnGame_Crosshair_Distance = function(distance)
{
   distance = Number(distance);
   if(distance < 0)
   {
      container_mc.distanceFd.text = "";
      container_mc.distanceFd2.text = "";
   }
   else
   {
      container_mc.distanceFd.text = Number(distance);
      container_mc.distanceFd2.text = mStr;
      container_mc.distanceFd2._x = 28 + container_mc.distanceFd.textWidth / 2;
   }
};
myListener.OnGame_Crosshair_Level = function(level)
{
   level = Number(level);
   if(level < 0)
   {
      container_mc.levelFd.text = "";
      container_mc.levelFd2.text = "";
   }
   else
   {
      container_mc.levelFd.text = lvStr;
      container_mc.levelFd2.text = level;
      container_mc.levelFd2._x = container_mc.levelFd.textWidth / 2 - 49;
   }
};
myListener.OnGame_Crosshair_SetLock = function(bTrue, lockedNum)
{
   bLock = Number(bTrue);
   container_mc.lockNumFd.text = lockedNum;
   var _loc1_ = container_mc.lockMc;
   if(bLock)
   {
      if(_loc1_ == undefined)
      {
         _loc1_ = container_mc.attachMovie("lockMc","lockMc",3);
         _loc1_._x = 0;
         _loc1_._y = 0;
         var _loc2_ = _loc1_.attachMovie("lockonMc","lockonMc",_loc1_.getNextHighestDepth());
         gs.TweenLite.to(_loc2_,0.2,{_width:76,_height:76,onComplete:playLockOn,onCompleteParams:[_loc1_]});
         container_mc.lockNumFd._visible = true;
      }
      container_mc.clear();
   }
   else
   {
      lib.display.DrawBitmapData.draw(container_mc,UI[type + "BgBm"],UI[type + "Pos"],UI[type + "Pos"],0,0,UI[type + "Size"],UI[type + "Size"]);
      container_mc.lockNumFd._visible = false;
      _loc1_.removeMovieClip();
      myListener.OnGame_Crosshair_Aimed(false);
   }
};
myListener.OnGame_Crosshair_SetBlink = function(bTrue)
{
};
