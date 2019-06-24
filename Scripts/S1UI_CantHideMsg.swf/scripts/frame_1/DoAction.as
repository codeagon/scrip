function alphaOut()
{
   gs.TweenLite.killTweensOf(container_mc,false);
   clearInterval(id);
   gs.TweenLite.to(container_mc,0.4,{_alpha:0,ease:Regular.easeOut,onComplete:onMotionFinished2});
}
function onMotionFinished()
{
   id = setTimeout(alphaOut,continueTime);
   container_mc.str_txt.text = viewData;
   container_mc.str_txt._width = container_mc.str_txt.textWidth + 7;
   gs.TweenLite.to(container_mc,0.4,{_alpha:100,ease:Regular.easeOut});
}
function onMotionFinished2()
{
   container_mc._visible = false;
}
var UI = this;
var UIname = "CantHideMsg";
container_mc._alpha = 0;
logo_mc._visible = false;
bWindowOpen = true;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.hitTestDisable = true;
logo_mc.hitTestDisable = true;
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
var id = 1;
var viewData;
var continueTime = 2500;
myListener.OnGame_CantHideMsg_SetMsg = function(data)
{
   gs.TweenLite.killTweensOf(container_mc,false);
   clearInterval(id);
   container_mc._visible = true;
   viewData = data;
   gs.TweenLite.to(container_mc,0.3,{_alpha:0,ease:Strong.easeOut,onComplete:onMotionFinished});
};
myListener.OnGame_CantHideMsg_ShowLogo = function(bTrue)
{
   bTrue = Number(bTrue);
   logo_mc._visible = bTrue;
};
myListener.OnGame_ScaleUI = function()
{
   myListener.OnGame_ChangeStageSize();
};
myListener.OnGame_ChangeStageSize = function(w, h)
{
   container_mc._x = lib.info.AlignInfo.xRatioToPixel(0);
   container_mc._y = lib.info.AlignInfo.yRatioToPixel(100);
   logo_mc._y = lib.info.AlignInfo.yRatioToPixel(100);
   logo_mc._x = lib.info.AlignInfo.xRatioToPixel(100);
};
