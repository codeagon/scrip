function showFirstSymbol(bTrue)
{
   if(bTrue)
   {
      UI.attachMovie("scene1","scene1",UI.getNextHighestDepth());
      myListener.OnGame_ChangeStageSize();
   }
   else
   {
      bShowFisrtSymbol = false;
      showBlackBg(false);
      UI.attachMovie("scene1","scene1",UI.getNextHighestDepth());
      myListener.OnGame_ChangeStageSize();
   }
}
function showBlackBg(bTrue)
{
   if(bTrue)
   {
      var _loc2_ = UI.createEmptyMovieClip("mask_mc",UI.getNextHighestDepth());
      _loc2_.beginFill(0);
      _loc2_.moveTo(0,0);
      _loc2_.lineTo(Stage.width,0);
      _loc2_.lineTo(Stage.width,Stage.height);
      _loc2_.lineTo(0,Stage.height);
      _loc2_.endFill();
      _loc2_._x = lib.info.AlignInfo.xRatioToPixel(0);
      _loc2_._y = lib.info.AlignInfo.yRatioToPixel(0);
   }
   else
   {
      UI.mask_mc.onEnterFrame = function()
      {
         this._alpha = this._alpha - 5;
         if(this._alpha <= 0)
         {
            delete this.onEnterFrame;
            this.removeMovieClip();
         }
      };
   }
}
function gotoServer()
{
   UI.scene1.black.onEnterFrame = function()
   {
      this._alpha = this._alpha - 5;
      if(this._alpha <= 0)
      {
         delete this.onEnterFrame;
         _root.showLoadingSymbols = false;
         _root.OnGameEvent("OnGameEventShowUI","LoadingSymbols",0);
         this._parent.unloadMovie();
      }
   };
}
function sceneFinished()
{
   _root.OnGameEvent("OnGameEventShowUI","LoadingSymbols",0);
}
function ToGame_LoadingSymbols_StartScene()
{
   fscommand("ToGame_LoadingSymbols_StartScene");
}
function ToGame_LoadingSymbols_EndScene()
{
   fscommand("ToGame_LoadingSymbols_EndScene");
}
var UI = this;
var UIname = "LoadingSymbols";
var bWindowOpen = true;
var thisMode = null;
scene3.centerTxt_mc.txt.autoSize = true;
scene3.centerTxt_mc.txt.verticalAlign = "center";
scene3._visible = false;
scene2._visible = false;
scene1._visible = false;
txt_mc._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = Number(bShow);
      scene3._visible = false;
      scene2._visible = false;
      scene1._visible = false;
      txt_mc._visible = false;
      UI._visible = bShow;
   }
};
var bShowFisrtSymbol = false;
var fadeInTime = 1.2;
var fadeFreezeTime = 1;
var fadeOutTime = 1.2;
myListener.OnGame_LoadingSymbols_GoToServerSelect = function()
{
   lib.util.FrameSeeker.seek(UI.scene1,UI.scene1._currentframe,UI.scene1._totalframes,gotoServer);
};
myListener.OnGame_LoadingSymbols_Show = function(bShow, fadeTime, mode, msg1, msg2)
{
   if(mode != undefined)
   {
      mode = Number(mode);
      thisMode = mode;
   }
   bShow = Number(bShow);
   fadeTime = Number(fadeTime);
   if(fadeTime <= 0)
   {
      fadeTime = 0.0001;
   }
   if(bShow)
   {
      myListener.OnGame_ChangeStageSize();
      if(thisMode == 1)
      {
         ToGame_LoadingSymbols_StartScene();
         scene1._visible = true;
         scene2._visible = false;
         scene3._visible = false;
         txt_mc._visible = false;
         _root.showLoadingSymbols = true;
         bShowFisrtSymbol = true;
         showBlackBg(true);
         showFirstSymbol(true);
      }
      else if(thisMode == 2)
      {
         scene2.deliberation_mc.txt.text = msg2;
         scene1._visible = false;
         scene2._alpha = 0;
         scene2._visible = true;
         scene3._visible = false;
         txt_mc._alpha = 0;
         txt_mc._visible = true;
         txt_mc.txt.text = msg1;
         gs.TweenLite.killTweensOf(scene2,false);
         gs.TweenLite.killTweensOf(txt_mc,false);
         gs.TweenLite.to(scene2,fadeTime,{_alpha:100,ease:Regular.easeOut});
         gs.TweenLite.to(txt_mc,fadeTime,{_alpha:100,ease:Regular.easeOut});
      }
      else if(thisMode == 3)
      {
         scene1._visible = false;
         scene2._visible = false;
         scene3._visible = false;
         txt_mc._alpha = 0;
         txt_mc._visible = true;
         txt_mc.txt.text = msg1;
         gs.TweenLite.killTweensOf(txt_mc,false);
         gs.TweenLite.to(txt_mc,fadeTime,{_alpha:100,ease:Regular.easeOut});
      }
   }
   else if(thisMode == 2)
   {
      gs.TweenLite.killTweensOf(scene2,false);
      gs.TweenLite.killTweensOf(txt_mc,false);
      gs.TweenLite.to(scene2,fadeTime,{_alpha:0,ease:Regular.easeOut,onComplete:sceneFinished});
      gs.TweenLite.to(txt_mc,fadeTime,{_alpha:0,ease:Regular.easeOut});
   }
   else if(thisMode == 3)
   {
      gs.TweenLite.killTweensOf(txt_mc,false);
      gs.TweenLite.to(txt_mc,fadeTime,{_alpha:0,ease:Regular.easeOut});
   }
};
myListener.OnGame_ChangeStageSize = function(w, h)
{
   scene3.deliberation_mc._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 99;
   scene3.deliberation_mc._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 1;
   scene3.ci_mc._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 99;
   scene3.ci_mc._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 99;
   scene3.unreal_mc._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 1;
   scene3.unreal_mc._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 99;
   scene2.deliberation_mc._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 99;
   scene2.deliberation_mc._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 1;
   scene2.unreal_mc._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 1;
   scene2.unreal_mc._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 99;
   scene2.ci_mc._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 99;
   scene2.ci_mc._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 99;
   txt_mc._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 50;
   txt_mc._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 99;
   scene1.scene3.deliberation_mc._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 99;
   scene1.scene3.deliberation_mc._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 1;
   scene1.scene3.ci_mc._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 99;
   scene1.scene3.ci_mc._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 99;
   scene1.scene3.unreal_mc._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 1;
   scene1.scene3.unreal_mc._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * 99;
   scene1.scene3.black._width = Stage.width;
   scene1.scene3.black._height = Stage.height;
   scene1.scene3.black._x = lib.info.AlignInfo.xRatioToPixel(0);
   scene1.scene3.black._y = lib.info.AlignInfo.yRatioToPixel(0);
};
