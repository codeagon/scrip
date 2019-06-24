function hide()
{
   container_mc.gageMc.onEnterFrame = function()
   {
      this._alpha = this._alpha - 20;
      if(this._alpha <= 0)
      {
         this._alpha = 0;
         container_mc.gageMc._visible = false;
         WingPosition();
         AllHide();
         delete this.onEnterFrame;
      }
   };
   autoHide = false;
   remainTime = null;
   totalTime = null;
   startedTime = null;
   aimTime = null;
}
function moveProgress()
{
   var _loc2_ = getTimer() + totalTime;
   var _loc1_ = undefined;
   if(direction == 0)
   {
      _loc1_ = aimTime - _loc2_ + remainTime;
      if(_loc1_ < 0)
      {
         _loc1_ = 0;
      }
      container_mc.gageMc.mask_mc._xscale = 100 - _loc1_ / totalTime * 100;
   }
   else
   {
      _loc1_ = Math.abs(aimTime - _loc2_ + remainTime);
      container_mc.gageMc.mask_mc._xscale = _loc1_ / totalTime * 100;
   }
   container_mc.gageMc.rightMc._x = container_mc.gageMc.mask_mc._x + container_mc.gageMc.mask_mc._width - 22;
   var _loc3_ = false;
   if(_loc1_ <= 100)
   {
      clearInterval(UI.timerInterval);
      if(direction == 0)
      {
         container_mc.gageMc.mask_mc._xscale = 100;
         container_mc.gageMc.expMc.gotoAndPlay(2);
      }
      else
      {
         container_mc.gageMc.mask_mc._xscale = 0;
      }
      container_mc.gageMc.rightMc._x = container_mc.gageMc.mask_mc._x + container_mc.gageMc.mask_mc._width - 22;
      if(autoHide)
      {
         hide();
      }
      ToGame_ProgressBar_End();
   }
   updateAfterEvent();
}
function startProgress()
{
   clearInterval(UI.timerInterval);
   aimTime = getTimer() + totalTime;
   UI.timerInterval = setInterval(UI,"moveProgress",2);
   ToGame_ProgressBar_Start();
}
function ToGame_ProgressBar_CloseUI()
{
   fscommand("ToGame_ProgressBar_CloseUI");
}
function ToGame_ProgressBar_End()
{
   fscommand("ToGame_ProgressBar_End");
}
function ToGame_ProgressBar_Start()
{
   fscommand("ToGame_ProgressBar_Start");
}
function WingPosition()
{
   if(container_mc.gageMc._visible)
   {
      container_mc.wingMc._y = -80;
   }
   else
   {
      container_mc.wingMc._y = 80;
   }
}
function GuideHide(type)
{
   gs.TweenLite.killTweensOf(container_mc.guideMc,false);
   if(type)
   {
      container_mc.guideMc._visible = true;
      container_mc.guideMc._alpha = 0;
      gs.TweenLite.to(container_mc.guideMc,0.3,{_alpha:100,ease:easing.Strong.easeOut});
   }
   else
   {
      gs.TweenLite.to(container_mc.guideMc,0.3,{_alpha:0,ease:easing.Strong.easeOut,onComplete:GuideComplete});
   }
}
function GuideComplete()
{
   container_mc.guideMc._visible = false;
}
function WingHide(type)
{
   gs.TweenLite.killTweensOf(container_mc.wingMc,false);
   if(type)
   {
      container_mc.wingMc._visible = true;
      container_mc.wingMc._alpha = 0;
      gs.TweenLite.to(container_mc.wingMc,0.3,{_alpha:100,ease:easing.Strong.easeOut});
   }
   else
   {
      gs.TweenLite.to(container_mc.wingMc,0.3,{_alpha:0,ease:easing.Strong.easeOut,onComplete:HideComplete});
   }
}
function HideComplete()
{
   container_mc.wingMc._visible = false;
   AllHide();
}
function AllHide()
{
   var _loc2_ = container_mc.gageMc._visible;
   var _loc1_ = container_mc.wingMc._visible;
   if(!_loc2_ && !_loc1_)
   {
      UI._visible = false;
   }
}
var UI = this;
UI._visible = false;
var UIname = "ProgressBar";
bWidgetOpen = false;
var autoHide = false;
container_mc.gageMc.name_txt.autoSize = "center";
var maskWidth = 485;
var defaultX = container_mc._x;
var defaultY = container_mc._y;
var defaultRightX = container_mc.gageMc.rightMc._x;
var myListener = new Object();
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         clearInterval(UI.timerInterval);
         UI._visible = false;
      }
   }
};
container_mc.gageMc._visible = false;
container_mc.wingMc._visible = false;
container_mc.guideMc._visible = false;
container_mc.wingMc._alpha = 0;
container_mc.guideMc._alpha = 0;
var remainTime = null;
var totalTime = null;
var startedTime = null;
var aimTime = null;
var timerInterval = 1;
var direction = 0;
myListener.OnGame_ProgressBar_SetDirection = function(dir)
{
   direction = Number(dir);
};
myListener.OnGame_ProgressBar_SetPosition = function(x, y)
{
   container_mc._x = Number(x);
   container_mc._y = Number(y);
   if(x == "DEFAULT")
   {
      container_mc._x = defaultX;
      container_mc._y = defaultY;
   }
};
myListener.OnGame_ProgressBar_SetData = function(textStr, remain, total, settingType, bAutoHide)
{
   remain = Number(remain);
   total = Number(total);
   settingType = Number(settingType);
   bAutoHide = Number(bAutoHide);
   autoHide = bAutoHide;
   container_mc.gageMc.name_txt.text = textStr;
   UI._visible = true;
   container_mc.gageMc._visible = true;
   container_mc.gageMc.rightMc._visible = true;
   if(settingType == 0 || settingType == undefined || settingType == "undefined" || settingType == "")
   {
      container_mc.gageMc.body_mc.gotoAndStop(1);
      container_mc.gageMc._alpha = 100;
      delete container_mc.gageMc.onEnterFrame;
      remainTime = remain;
      totalTime = total;
      startMaskPoint = totalTime - remainTime;
      if(remainTime <= 0)
      {
         clearInterval(UI.timerInterval);
         hide();
      }
      else
      {
         startedTime = getTimer();
         aimTime = startedTime + totalTime;
         startProgress();
      }
   }
   else if(settingType == 1)
   {
      clearInterval(UI.timerInterval);
      container_mc.gageMc.mask_mc._xscale = remain / total * 100;
      container_mc.gageMc.rightMc._x = container_mc.gageMc.mask_mc._x + container_mc.gageMc.mask_mc._width - 22;
      if(remain == total)
      {
         container_mc.gageMc.expMc.gotoAndPlay(2);
         clearInterval(UI.timerInterval);
         hide();
      }
   }
   WingPosition();
};
myListener.OnGame_ProgressBar_Cancel = function(textStr)
{
   if(textStr != "" && textStr != "undefined" && textStr != undefined)
   {
      container_mc.gageMc.name_txt.text = textStr;
   }
   clearInterval(UI.timerInterval);
   delete container_mc.gageMc.onEnterFrame;
   container_mc.gageMc.body_mc.gotoAndStop(2);
   container_mc.gageMc.mask_mc._xscale = 0;
   container_mc.gageMc.rightMc._x = defaultRightX;
   container_mc.gageMc.rightMc._visible = false;
   var removeCnt = 0;
   var removing = false;
   container_mc.gageMc.failMc.gotoAndPlay(2);
   container_mc.gageMc.onEnterFrame = function()
   {
      removeCnt++;
      if(removeCnt >= 9)
      {
         if(!removing)
         {
            removing = true;
         }
         else
         {
            this._alpha = this._alpha - 20;
            if(this._alpha <= 0)
            {
               this._alpha = 0;
               container_mc.gageMc._visible = false;
               delete this.onEnterFrame;
            }
         }
      }
   };
};
_global.EventBroadCaster.addListener(myListener);
var currentNum = 0;
var totalNum = 0;
var prevNum = 0;
var dangerTime = 0;
var dangerMode = false;
myListener.OnGame_ProgressBar_SetWing = function(wingMode, textStr, remain, total, danger)
{
   UI._visible = true;
   WingPosition();
   if(wingMode == "0")
   {
      WingHide(false);
   }
   else
   {
      if(container_mc.wingMc._alpha != 100)
      {
         WingHide(true);
      }
      var _loc1_ = Number(wingMode);
      if(_loc1_ < 2)
      {
         container_mc.wingMc.bar._visible = false;
         container_mc.wingMc.rightMc._visible = false;
      }
      else
      {
         container_mc.wingMc.bar._visible = true;
         container_mc.wingMc.rightMc._visible = true;
      }
      container_mc.wingMc.bar.gotoAndStop(_loc1_);
      container_mc.wingMc.bg.gotoAndStop(_loc1_);
   }
   currentNum = remain;
   totalNum = total;
   dangerTime = danger;
   var _loc2_ = currentNum / totalNum * 100;
   container_mc.wingMc.mask_mc._xscale = _loc2_;
   container_mc.wingMc.rightMc._x = _loc2_ * 3 - 130;
   container_mc.wingMc.name_txt.text = textStr;
};
container_mc.gageMc.hitTestDisable = true;
container_mc.wingMc.hitTestDisable = true;
container_mc.wingMc.rightMc._visible = false;
myListener.OnGame_ProgressBar_WingGuide = function(guideMode, textData)
{
   if(guideMode == "0")
   {
      GuideHide(false);
   }
   else
   {
      GuideHide(true);
   }
   if(textData)
   {
      var _loc1_ = lib.util.ExtString.split(textData,"\t");
      container_mc.guideMc.txt0.text = _loc1_[0];
      container_mc.guideMc.txt1_0.text = _loc1_[1];
      container_mc.guideMc.txt1_1.text = _loc1_[2];
      container_mc.guideMc.txt1_2.text = _loc1_[3];
      container_mc.guideMc.txt1_3.text = _loc1_[4];
      container_mc.guideMc.txt2.text = _loc1_[5];
      container_mc.guideMc.txt3.text = _loc1_[6];
      container_mc.guideMc.txt4.text = _loc1_[7];
   }
};
myListener.OnGame_ProgressBar_UpDateWing = function(textStr, current, down)
{
   container_mc.wingMc.name_txt.text = textStr;
   currentNum = Number(current);
   var _loc1_ = 0;
   _loc1_ = currentNum / totalNum * 100;
   prevNum = currentNum;
   if(dangerTime)
   {
      lib.Debuger.trace(dangerTime + ">" + current);
      if(dangerTime > current && !dangerMode)
      {
         dangerMode = true;
         container_mc.wingMc.bg.dangerMc.gotoAndPlay(2);
      }
      else if(dangerTime < current)
      {
         dangerMode = false;
         container_mc.wingMc.bg.dangerMc.gotoAndStop(1);
      }
   }
   var _loc3_ = _loc1_ * 3 - 130;
   gs.TweenLite.killTweensOf(container_mc.wingMc.mask_mc,false);
   gs.TweenLite.killTweensOf(container_mc.wingMc.effectMc,false);
   gs.TweenLite.to(container_mc.wingMc.mask_mc,0.5,{_xscale:_loc1_,ease:easing.Strong.easeOut});
   gs.TweenLite.to(container_mc.wingMc.rightMc,0.5,{_x:_loc3_,ease:easing.Strong.easeOut});
   if(down == "1")
   {
      container_mc.wingMc.downMc.gotoAndPlay(2);
   }
   else
   {
      container_mc.wingMc.downMc.gotoAndStop(1);
   }
   WingPosition();
};
fscommand("ToGame_ProgressBar_Init");
