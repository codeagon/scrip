function ToGame_EventAlim_Click()
{
   fscommand("ToGame_EventAlim_Click");
}
function ToGame_EventAlim_Init()
{
   fscommand("ToGame_EventAlim_Init");
}
function ToGame_EventAlim_ClickButton()
{
   fscommand("ToGame_EventAlim_ClickButton");
}
function balloonEffect()
{
   var _loc2_ = container_mc.balloonMc._alpha >= 100?0:100;
   var _loc1_ = container_mc.balloonMc._alpha >= 100?0.3:0.5;
   var _loc5_ = container_mc.balloonMc._alpha >= 100?1:0;
   gs.TweenLite.to(container_mc.balloonMc,_loc1_,{_alpha:_loc2_,delay:_loc5_,ease:Strong.easeOut,onComplete:balloonEffect});
}
function folderOn()
{
   alimMode = 1;
   container_mc.gotoAndStop(1);
   changeMode();
}
function folderOff()
{
   alimMode = 0;
   container_mc.gotoAndStop(2);
   changeMode();
}
function changeMode()
{
   if(alimMode == 0)
   {
      gs.TweenLite.killTweensOf(container_mc.balloonMc,false);
      container_mc.balloonMc._visible = false;
      container_mc.balloonMc._alpha = 0;
      container_mc.button._visible = false;
      if(container_mc.effect.efffect)
      {
         container_mc.effect.effect.removeMovieClip();
      }
      setDrag(container_mc.btn,folderOn);
   }
   else
   {
      container_mc.titleTxt.text = title_txt;
      container_mc.timeTxt.text = time_txt;
      var _loc1_ = new lib.util.TxtBtn(container_mc.folderBtn);
      _loc1_.setRelease(folderOff);
      container_mc.button._visible = true;
      if(bBalloon)
      {
         gs.TweenLite.killTweensOf(container_mc.balloonMc,false);
         container_mc.balloonMc._visible = true;
         container_mc.balloonMc._alpha = 0;
         balloonEffect();
      }
      setDrag(container_mc.openBtn,ToGame_EventAlim_Click);
   }
}
function setDrag(mc, func)
{
   mc.onRollOver = function()
   {
      UI.stopDrag();
      this.gotoAndStop(2);
   };
   mc.onRollOut = mc.onReleaseOutside = function()
   {
      UI.stopDrag();
      this.gotoAndStop(1);
   };
   mc.onPress = function()
   {
      clickX = UI._x;
      clickY = UI._y;
      var _loc3_ = lib.info.AlignInfo.yRatioToPixel(0);
      var _loc2_ = lib.info.AlignInfo.yRatioToPixel(100);
      UI.startDrag(false,-10,_loc3_ - 15,Stage.width - 30,_loc2_ - 50);
      this.gotoAndStop(1);
   };
   mc.onRelease = function()
   {
      UI.stopDrag();
      if(UI._x > clickX + 5 || UI._x < clickX - 5 || UI._y > clickY + 5 || UI._y < clickY - 5)
      {
         lib.info.AlignInfo.savePos(UI,true);
      }
      else
      {
         func();
      }
      this.gotoAndStop(1);
   };
}
_global.gfxExtensions = true;
var UI = this;
var UIname = "EventAlim";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var title_txt = "";
var time_txt = "";
var bBalloonVisible = false;
var alimMode = 1;
container_mc.balloonMc._visible = false;
container_mc._visible = false;
var balloon_x = [103,107];
var balloon_y = [70,88];
var balloon_txt_x = [42,33];
var balloon_txt_y = [26,30];
var balloon_txt_w = [91,100];
var balloon_txt_h = [56,43];
var balloon_bg_h = [107,68];
var button = new lib.util.TxtBtn(container_mc.button.mc,container_mc.button.txt);
button.setTextColor("0xFFCD47","0xFFECA8","0xFFCD47",lib.info.TextColor.BTN_UINIQUE_DISABLE);
button.setRelease(ToGame_EventAlim_ClickButton);
container_mc.balloonMc.txt.verticalAlign = "center";
container_mc.balloonMc.hitTestDisable = true;
var buttonStr = lib.util.UIString.getUIString("$012079");
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(bWindowOpen)
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
   if(!_global.gbUIMode)
   {
      container_mc.folderBtn._visible = false;
   }
   else
   {
      container_mc.folderBtn._visible = true;
   }
};
myListener.OnGame_EventAlim_SetTitle = function(titleStr)
{
   title_txt = titleStr;
   if(alimMode == 1)
   {
      container_mc.titleTxt.text = title_txt;
   }
   if(container_mc._visible == false)
   {
      container_mc.onEnterFrame = function()
      {
         delete this.onEnterFrame;
         this._visible = true;
         this.effect.attachMovie("effect","effect",this.effect.getNextHighestDepth());
      };
   }
};
myListener.OnGame_EventAlim_SetTime = function(timeStr)
{
   time_txt = timeStr;
   if(alimMode == 1)
   {
      container_mc.timeTxt.text = time_txt;
   }
};
myListener.OnGame_EventAlim_SetBalloon = function(balloonType, balloonStr, bVisible)
{
   bBalloonVisible = Boolean(Number(bVisible));
   gs.TweenLite.killTweensOf(container_mc.balloonMc,false);
   container_mc.balloonMc._visible = bBalloonVisible;
   container_mc.balloonMc._alpha = 0;
   if(bBalloonVisible == false)
   {
      return undefined;
   }
   balloonType = Number(balloonType);
   var _loc5_ = balloonType + 1;
   var _loc2_ = container_mc.balloonMc.txt;
   var _loc3_ = container_mc.balloonMc["bg_" + balloonType];
   container_mc.balloonMc.bg_0._visible = balloonType == 0;
   container_mc.balloonMc.bg_1._visible = balloonType == 1;
   _loc2_.verticalAlign = "center";
   var _loc4_ = balloon_txt_h[balloonType];
   container_mc.balloonMc.gotoAndStop(_loc5_);
   _loc3_._height = balloon_bg_h[balloonType];
   _loc2_._x = balloon_txt_x[balloonType];
   _loc2_._y = balloon_txt_y[balloonType];
   _loc2_._width = balloon_txt_w[balloonType];
   _loc2_._height = balloon_txt_h[balloonType];
   _loc2_.htmlText = balloonStr;
   if(_loc4_ < _loc2_.textHeight)
   {
      _loc2_._height = _loc2_.textHeight + 5;
      _loc3_._height = _loc3_._height + (_loc2_.textHeight - _loc4_);
      _loc3_._height = balloonType != 0?_loc3_._height + 3:_loc3_._height + 5;
   }
   if(alimMode == 1)
   {
      balloonEffect();
      gs.TweenLite.to(container_mc.balloonMc,0.5,{_alpha:100,ease:Strong.easeOut});
   }
};
myListener.OnGame_EventAlim_SetButton = function(bEnabled, tooltipStr)
{
   bEnabled = Boolean(Number(bEnabled));
   button.setText(buttonStr);
   button.setEnabled(bEnabled);
   lib.manager.ToolTip.remove(container_mc.button);
   if(tooltipStr != "" && tooltipStr != undefined)
   {
      lib.manager.ToolTip.add(container_mc.button,tooltipStr,1);
   }
};
var clickX = 0;
var clickY = 0;
changeMode();
ToGame_EventAlim_Init();
