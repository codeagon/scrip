var UI = this;
UI._visible = false;
var UIname = "PopupResult";
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
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
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
var container_Width = 0;
var container_Height = 0;
var boardMc;
var PopupType = 0;
container_mc._visible = false;
var BF_Str = ["$520003","$520005","$520004","$520006"];
myListener.OnGame_PopupResult_Init = function(_type)
{
   container_mc._visible = false;
   PopupType = _type;
   boardMc = container_mc.attachMovie("board_" + PopupType,"board",container_mc.getNextHighestDepth());
   container_Width = boardMc._width - 118;
   container_Height = boardMc._height;
   hit._width = container_Width;
   hit._height = container_Height;
   var _loc1_ = new lib.util.TxtBtn(boardMc.btn,boardMc.txt);
   _loc1_.setRelease(myListener.ToGame_PopupResult_CloseUI);
   var _count = 0;
   boardMc.onEnterFrame = function()
   {
      _count++;
      if(_count > 3)
      {
         UI._x = UI._x - container_Width / 2;
         UI._y = UI._y - container_Height / 2;
         container_mc._visible = true;
         delete boardMc.onEnterFrame;
      }
   };
};
myListener.OnGame_PopupResult_SetBFResultData = function(_PositionType, _ResultType, _DataList, _TipTxt)
{
   boardMc.mainTxt._alpha = 0;
   boardMc.scoreTxt0._alpha = 0;
   boardMc.scoreTxt1._alpha = 0;
   boardMc.tipTxt._alpha = 0;
   boardMc.mainTxt._xscale = 300;
   boardMc.mainTxt._yscale = 300;
   if(_ResultType == 0)
   {
      boardMc.mainTxt.gotoAndStop(1);
      boardMc.mainTxt.txt.text = lib.util.UIString.getUIString(BF_Str[_PositionType]);
   }
   else
   {
      boardMc.mainTxt.gotoAndStop(2);
      boardMc.mainTxt.txt.text = lib.util.UIString.getUIString(BF_Str[Number(_PositionType) + 2]);
   }
   var _loc1_ = lib.util.ExtString.split(_DataList,"\t");
   boardMc.scoreTxt0.text = _loc1_[0];
   boardMc.scoreTxt1.text = _loc1_[1];
   boardMc.tipTxt.htmlText = _TipTxt;
   gs.TweenLite.to(boardMc.mainTxt,0.5,{_xscale:100,_yscale:100,_alpha:100,ease:gs.easing.Expo.easeInOut});
   gs.TweenLite.to(boardMc.scoreTxt0,1,{delay:0.25,_alpha:100});
   gs.TweenLite.to(boardMc.scoreTxt1,1,{delay:0.5,_alpha:100});
   gs.TweenLite.to(boardMc.tipTxt,1,{delay:0.75,_alpha:100});
};
myListener.ToGame_PopupResult_CloseUI = function()
{
   lib.Debuger.trace("ToGame_PopupResult_Close");
   fscommand("ToGame_PopupResult_Close");
};
fscommand("ToGame_PopupResult_Init");
