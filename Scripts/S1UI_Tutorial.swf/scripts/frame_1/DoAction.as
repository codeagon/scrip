function setLifeTime(target)
{
   target.cnt = 0;
   target.onEnterFrame = function()
   {
      this.cnt = this.cnt + 1;
      if(this.cnt >= 24 * lifeTime)
      {
         delete this.onEnterFrame;
         normalFadeOut(this);
      }
   };
}
function normalFadeOut(target)
{
   var _loc2_ = new mx.transitions.Tween(target,"_alpha",mx.transitions.easing.Regular.easeOut,target._alpha,0,normalFadeOutTime,true);
   _loc2_.target = target;
   _loc2_.onMotionFinished = function()
   {
      this.target.removeMovieClip();
      currentNumOfMsg--;
   };
}
function pushedFadeOut(target)
{
   var _loc2_ = new mx.transitions.Tween(target,"_alpha",mx.transitions.easing.Regular.easeOut,target._alpha,0,pushedFadeOutTime,true);
   _loc2_.target = target;
   _loc2_.onMotionFinished = function()
   {
      this.target.removeMovieClip();
   };
}
function pushMessage(target)
{
   for(mc in container_mc)
   {
      if(typeof container_mc[mc] == "movieclip")
      {
         var _loc1_ = container_mc[mc];
         _loc1_.currentLine = _loc1_.currentLine + 1;
         var _loc2_ = new mx.transitions.Tween(_loc1_,"_y",mx.transitions.easing.Regular.easeOut,_loc1_._y,(- lineHeight) * _loc1_.currentLine,pushTime,true);
         if(_loc1_.currentLine == 1)
         {
            new mx.transitions.Tween(_loc1_,"_alpha",mx.transitions.easing.Regular.easeOut,_loc1_._alpha,100,pushTime,true);
         }
         else if(_loc1_.currentLine == maxLine + 1)
         {
            pushedFadeOut(_loc1_);
         }
      }
   }
}
var UI = this;
var UIname = "Tutorial";
var lifeTime = 5;
var lineHeight = 60;
var maxLine = 3;
var currentNumOfMsg = 0;
var fadeInTime = 0.3;
var normalFadeOutTime = 6;
var pushedFadeOutTime = fadeInTime;
var pushTime = 0.5;
container_mc.str_txt.textColor = lib.info.TextColor.SYSTEM_TUTORIAL;
bWindowOpen = true;
var myListener = new Object();
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
myListener.OnGame_ChangeStageSize = function(w, h)
{
   UI._x = lib.info.AlignInfo.xRatioToPixel(50);
   UI._y = lib.info.AlignInfo.yRatioToPixel(82);
};
UI._x = lib.info.AlignInfo.xRatioToPixel(50);
UI._y = lib.info.AlignInfo.yRatioToPixel(82);
myListener.OnGame_Tutorial_Add = function(type, str)
{
   type = Number(type);
   var _loc2_ = container_mc.getNextHighestDepth();
   var _loc1_ = container_mc.attachMovie("tutorialMessage","tutorialMessage" + _loc2_,_loc2_);
   if(container_mc["tutorialMessage" + (_loc2_ - 1)])
   {
      _loc1_._y = container_mc["tutorialMessage" + (_loc2_ - 1)]._y + container_mc["tutorialMessage" + (_loc2_ - 1)]._height;
   }
   _loc1_._alpha = 0;
   _loc1_.currentLine = 0;
   _loc1_.txt.autoSize = true;
   _loc1_.txt.text = str;
   _loc1_.txt._x = (- _loc1_.txt._width) / 2;
   _loc1_.symbol._x = _loc1_.txt._x - _loc1_.symbol._width * 2.5;
   _loc1_.cnt = 0;
   setLifeTime(_loc1_);
   pushMessage(_loc1_);
};
_global.EventBroadCaster.addListener(myListener);
fscommand("ToGame_Tutorial_Init");
