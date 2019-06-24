function reduceMotion(sc)
{
   delete container_mc.onEnterFrame;
   container_mc.tgY = MAXFULL + 100 - 100 * (sc / 100);
   container_mc.countMc._alpha = 0;
   container_mc.onEnterFrame = function()
   {
      this.aniMc._y = this.aniMc._y + 0.1 * (this.tgY - this.aniMc._y);
      this.countMc._alpha = this.countMc._alpha + 0.3 * (alp - this.countMc._alpha);
      if(this.countMc._alpha > 99)
      {
         this.aniMc._y = this.tgY;
         this.countMc._alpha = alp;
         delete this.onEnterFrame;
      }
      updateAfterEvent();
   };
}
function changeRelaxMode(m)
{
   container_mc.levelMc.txt.autoSize = "center";
   if(m == 1)
   {
      container_mc.levelMc.txt.text = lib.info.ToolTipStr.CONDBAD;
   }
   else if(m == 2)
   {
      container_mc.levelMc.txt.text = lib.info.ToolTipStr.CONDNORMAL;
   }
   else if(m == 3)
   {
      container_mc.levelMc.txt.text = lib.info.ToolTipStr.CONDGOOD;
   }
   else if(m == 4)
   {
      container_mc.levelMc.txt.text = lib.info.ToolTipStr.CONDBEST;
   }
   container_mc.levelMc.barMc._width = Math.max(defaultBarW,container_mc.levelMc.txt.textWidth + 60);
   container_mc.gotoAndStop(m);
}
function openMotion()
{
   delete this.onEnterFrame;
   container_mc._y = condY + 300;
   container_mc._alpha = 0;
   container_mc._y = condY;
   container_mc._alpha = 100;
   container_mc.wingMc.gotoAndPlay(2);
}
_global.gfxExtensions = true;
var UI = this;
var UIname = "GageRest";
var bWidgetOpen = true;
UI._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var EXPSPACE = 0.2;
var BARWIDTH = 300;
var MAXFULL = 28;
var relaxMode = false;
var chargeMode = false;
var rlaxLevle;
var chLevel;
var totalLevel;
var chargeSc = 0;
var maskWidth = Hp_Bar.Bar_Mask1._width;
var rspeed = 0.3;
var condY = container_mc._y;
var alp = container_mc.countMc._alpha;
var defaultBarW = 192;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == "gagebar")
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         getURL("FSCommand:ToGame_RequestSetUIPosition",UIname);
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGame_Gage_SetRelax = function(gageValue, relaxState, _show)
{
   _show = Number(_show);
   UI.swapDepths(UI._parent.getNextHighestDepth());
   if(!container_mc._visible && _show == 1)
   {
      openMotion();
   }
   container_mc._visible = _show;
   if(_show)
   {
      container_mc.hitTestDisable = false;
   }
   else
   {
      container_mc.hitTestDisable = true;
   }
   if(container_mc._visible)
   {
      container_mc.countMc.countFd.text = gageValue;
      container_mc.ff._x = container_mc.countMc._x + container_mc.countMc.countFd.textWidth / 2 - 4;
      var _loc4_ = Math.min(Number(gageValue),100);
      if(relaxMode)
      {
         reduceMotion(_loc4_);
      }
      else
      {
         _loc4_ = Math.min(Number(gageValue),100);
         container_mc.aniMc._y = MAXFULL + 100 - 100 * (_loc4_ / 100);
      }
      relaxMode = true;
   }
   if(rlaxLevle != relaxState)
   {
      changeRelaxMode(Number(relaxState));
   }
   rlaxLevle = relaxState;
};
container_mc._visible = false;
