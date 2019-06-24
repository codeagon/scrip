_global.gfxExtensions = true;
var UI = this;
var UIname = "GageBar";
var bWidgetOpen = true;
UI._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var EXPSPACE = 0.2;
var BARWIDTH = 300;
var MAXLEVELSKINS = 7;
var MAXFULL = 28;
var relaxMode = false;
var chargeMode = false;
var rlaxLevle;
var chLevel;
var chL;
var totalLevel;
var chargeSc = 0;
var maskWidth = Hp_Bar.barMc.maksMc._width;
var rspeed = 0.45;
var condY = conMc._y;
var barTX = -1;
var chargeTween;
var chargeTween2;
var axis = new lib.util.AxisResetter();
var timeValue;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      var _loc1_ = new lib.controls.CustomScaleEvent();
      _loc1_.CustomScaleEventCheck(UI,UIname);
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
myListener.OnGame_Gage_SetCombo = function(gageValue, startZone, endZone, bShow)
{
   if(chargeMode)
   {
      return undefined;
   }
   chargeTween.clear();
   chargeTween2.clear();
   delete Hp_Bar.barMc.onEnterFrame;
   Hp_Bar.barMc.onEnterFrame = null;
   bShow = Boolean(Number(bShow));
   Hp_Bar._visible = bShow;
   if(bShow)
   {
      Hp_Bar.barMc.colMc.setMask(Hp_Bar.barMc.maksMc);
      Hp_Bar.barMc.colMc._visible = true;
      Hp_Bar.barMc.fireMc._visible = true;
      Hp_Bar.barMc.line_0._visible = true;
      Hp_Bar.barMc.line_1._visible = true;
      var _loc1_ = 1;
      while(_loc1_ <= MAXLEVELSKINS)
      {
         Hp_Bar.barMc["ce" + _loc1_]._visible = false;
         Hp_Bar.barMc["c" + _loc1_]._visible = false;
         _loc1_ = _loc1_ + 1;
      }
      Hp_Bar.barMc.maksMc._xscale = Number(gageValue);
      Hp_Bar.barMc.fireMc._x = Hp_Bar.barMc.maksMc._x + Hp_Bar.barMc.maksMc._width - 1;
      Hp_Bar.barMc.line_0._x = maskWidth * (Number(startZone) / 100);
      Hp_Bar.barMc.line_1._x = maskWidth * (Number(endZone) / 100);
   }
   else
   {
      Hp_Bar.barMc.colMc._visible = false;
      Hp_Bar.barMc.fireMc._visible = false;
      Hp_Bar.barMc.line_0._visible = false;
      Hp_Bar.barMc.line_1._visible = false;
   }
};
myListener.OnGame_Gage_SetCollection = function(gageValue, _show)
{
   if(chargeMode)
   {
      return undefined;
   }
   chargeTween.clear();
   chargeTween2.clear();
   Hp_Bar.barMc.tValue._visible = false;
   Hp_Bar.barMc.colMc.setMask(Hp_Bar.barMc.maksMc);
   Hp_Bar.barMc.colMc._visible = true;
   Hp_Bar.barMc.line_0._visible = false;
   Hp_Bar.barMc.line_1._visible = false;
   var _loc1_ = 1;
   while(_loc1_ <= MAXLEVELSKINS)
   {
      Hp_Bar.barMc["ce" + _loc1_]._visible = false;
      Hp_Bar.barMc["c" + _loc1_]._visible = false;
      _loc1_ = _loc1_ + 1;
   }
   Hp_Bar._visible = Number(_show);
   if(Number(_show))
   {
      Hp_Bar.barMc.fireMc._visible = true;
      relaxMode = false;
      gageMotion(Hp_Bar.barMc,Number(gageValue));
   }
   else
   {
      Hp_Bar.barMc.colMc._visible = false;
      Hp_Bar.barMc.fireMc._visible = false;
      delete Hp_Bar.barMc.onEnterFrame;
   }
};
myListener.OnGame_Gage_SetTime = function($time, $show)
{
   if(Number($show))
   {
      Hp_Bar.barMc.fireMc._visible = true;
      relaxMode = false;
      gageMotion(Hp_Bar.barMc,Number(gageValue));
   }
   else
   {
      Hp_Bar.barMc.colMc._visible = false;
      Hp_Bar.barMc.fireMc._visible = false;
      delete Hp_Bar.barMc.onEnterFrame;
   }
};
myListener.OnGame_Gage_SetCharge = function(chargeLevel, total, time)
{
   chargeMode = true;
   Hp_Bar.barMc.tValue._visible = false;
   Hp_Bar._alpha = 100;
   delete Hp_Bar.barMc.onEnterFrame;
   Hp_Bar.barMc.fireMc._visible = true;
   Hp_Bar.barMc.failMc.gotoAndStop(1);
   Hp_Bar.barMc.colMce.gotoAndStop(1);
   Hp_Bar.barMc.line_0._visible = false;
   Hp_Bar.barMc.line_1._visible = false;
   chLevel = Number(chargeLevel);
   totalLevelCount = Number(total) - 1;
   startLevel = MAXLEVELSKINS - totalLevelCount + 1;
   chL = startLevel + chLevel - 1;
   Hp_Bar._visible = true;
   Hp_Bar.barMc.colMc._visible = false;
   var _loc1_ = 1;
   while(_loc1_ <= MAXLEVELSKINS)
   {
      Hp_Bar.barMc["ce" + _loc1_]._visible = false;
      Hp_Bar.barMc["ce" + _loc1_].gotoAndStop(1);
      Hp_Bar.barMc["c" + _loc1_]._visible = _loc1_ == chL - 1 && chLevel != 1 || _loc1_ == chL;
      _loc1_ = _loc1_ + 1;
   }
   if(chL <= MAXLEVELSKINS)
   {
      chrageMotion(Hp_Bar.barMc.maksMc,Number(time));
   }
   else
   {
      Hp_Bar.barMc["ce" + MAXLEVELSKINS]._visible = true;
      Hp_Bar.barMc["ce" + MAXLEVELSKINS].gotoAndPlay(2);
   }
};
myListener.OnGame_Gage_SetGather = function(chargeLevel, total, time)
{
   chargeMode = true;
   Hp_Bar.barMc.tValue._visible = true;
   Hp_Bar._alpha = 100;
   delete Hp_Bar.barMc.onEnterFrame;
   Hp_Bar.barMc.fireMc._visible = true;
   Hp_Bar.barMc.failMc.gotoAndStop(1);
   Hp_Bar.barMc.colMce.gotoAndStop(1);
   Hp_Bar.barMc.line_0._visible = false;
   Hp_Bar.barMc.line_1._visible = false;
   chLevel = Number(chargeLevel);
   totalLevelCount = Number(total) - 1;
   startLevel = MAXLEVELSKINS - totalLevelCount + 1;
   chL = startLevel + chLevel - 1;
   Hp_Bar._visible = true;
   Hp_Bar.barMc.colMc._visible = false;
   var _loc1_ = 1;
   while(_loc1_ <= MAXLEVELSKINS)
   {
      Hp_Bar.barMc["ce" + _loc1_]._visible = false;
      Hp_Bar.barMc["ce" + _loc1_].gotoAndStop(1);
      Hp_Bar.barMc["c" + _loc1_]._visible = _loc1_ == chL - 1 && chLevel != 1 || _loc1_ == chL;
      _loc1_ = _loc1_ + 1;
   }
   if(chL <= MAXLEVELSKINS)
   {
      chrageMotionGather(Hp_Bar.barMc.maksMc,Number(time));
   }
   else
   {
      Hp_Bar.barMc["ce" + MAXLEVELSKINS]._visible = true;
      Hp_Bar.barMc["ce" + MAXLEVELSKINS].gotoAndPlay(2);
   }
};
myListener.OnGame_Gage_CancelCharge = function()
{
   chargeTween.clear();
   chargeTween2.clear();
   Hp_Bar._visible = false;
   chargeMode = false;
   var _loc1_ = 1;
   while(_loc1_ <= MAXLEVELSKINS)
   {
      Hp_Bar.barMc["ce" + _loc1_]._visible = false;
      Hp_Bar.barMc["ce" + _loc1_].gotoAndStop(1);
      _loc1_ = _loc1_ + 1;
   }
};
Hp_Bar.barMc.maksMc._xscale = 0;
Hp_Bar.barMc.line_0._visible = false;
Hp_Bar.barMc.line_1._visible = false;
Hp_Bar._visible = false;
function gageMotion(mc, sc)
{
   delete mc.onEnterFrame;
   if(sc < mc.maksMc._xscale)
   {
      mc.maksMc._xscale = 1;
      mc.fireMc._x = barTX;
   }
   mc.onEnterFrame = function()
   {
      this.maksMc._xscale = this.maksMc._xscale + rspeed * (sc - this.maksMc._xscale);
      this.fireMc._x = this.maksMc._x + this.maksMc._width - 1;
      if(Math.abs(this.maksMc._xscale - sc) <= 0.1)
      {
         this.maksMc._xscale = sc;
         this.fireMc._x = this.maksMc._x + this.maksMc._width - 1;
         delete this.onEnterFrame;
      }
   };
}
function gageCancel()
{
   var c = 0;
   Hp_Bar.barMc.fireMc._visible = false;
   delete Hp_Bar.barMc.onEnterFrame;
   Hp_Bar.barMc.onEnterFrame = function()
   {
      if(c++ > 9)
      {
         Hp_Bar._alpha = Hp_Bar._alpha + 0.4 * (- Hp_Bar._alpha);
         if(Hp_Bar._alpha < 5)
         {
            Hp_Bar._visible = false;
            Hp_Bar._alpha = 100;
            Hp_Bar.barMc.maksMc._xscale = 0;
            delete Hp_Bar.barMc.onEnterFrame;
         }
      }
   };
}
function chrageMotion(mc, time)
{
   delete mc.onEnterFrame;
   timeValue = time;
   mc._xscale = 0;
   var _loc3_ = Hp_Bar.barMc["c" + chL];
   _loc3_.setMask(mc);
   if(chLevel == 1)
   {
      if(totalLevelCount + 1 == 1)
      {
         chargeTween = gs.TweenLite.to(mc,time - EXPSPACE,{_xscale:100,onComplete:chargeFinish});
      }
      else
      {
         chargeTween = gs.TweenLite.to(mc,time - EXPSPACE,{_xscale:100});
      }
   }
   else
   {
      chargeFinish();
      chargeTween = gs.TweenLite.to(mc,time - EXPSPACE,{_xscale:100});
   }
   Hp_Bar.barMc.fireMc._x = barTX;
   chargeTween2 = gs.TweenLite.to(Hp_Bar.barMc.fireMc,time - EXPSPACE,{_x:BARWIDTH});
}
function chrageMotionGather(mc, time)
{
   delete mc.onEnterFrame;
   timeValue = time;
   mc._xscale = 0;
   var _loc3_ = Hp_Bar.barMc["c" + chL];
   _loc3_.setMask(mc);
   if(chLevel == 1)
   {
      if(totalLevelCount + 1 == 1)
      {
         chargeTween = gs.TweenLite.to(mc,time - EXPSPACE,{_xscale:100,onComplete:chargeFinish,onUpdate:chargeTick,ease:gs.easing.Linear.easeNone});
      }
      else
      {
         chargeTween = gs.TweenLite.to(mc,time - EXPSPACE,{_xscale:100,onUpdate:chargeTick,ease:gs.easing.Linear.easeNone});
      }
   }
   else
   {
      chargeFinish();
      chargeTween = gs.TweenLite.to(mc,time - EXPSPACE,{_xscale:100,onUpdate:chargeTick,ease:gs.easing.Linear.easeNone});
   }
   Hp_Bar.barMc.fireMc._x = barTX;
   chargeTween2 = gs.TweenLite.to(Hp_Bar.barMc.fireMc,time - EXPSPACE,{_x:BARWIDTH,ease:gs.easing.Linear.easeNone});
}
function chargeTick()
{
   var _loc1_ = String(Math.round((100 - Hp_Bar.barMc.maksMc._xscale) / 100 * timeValue * 10) / 10);
   if(_loc1_.indexOf(".") == -1)
   {
      _loc1_ = _loc1_ + ".0";
   }
   Hp_Bar.barMc.tValue.text = String(_loc1_) + lib.util.UIString.getUIString("$005033");
}
function chargeFinish()
{
   var _loc1_ = Hp_Bar.barMc["ce" + (chL - 1)];
   var _loc2_ = Hp_Bar.barMc["c" + (chL - 1)];
   _loc2_.setMask(null);
   _loc1_._visible = true;
   _loc1_.gotoAndPlay(2);
}
if(_global.gfxPlayer)
{
   UI._visible = true;
}
