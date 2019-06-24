stop();
_global.gfxExtensions = true;
var UI = this;
var selectMc;
var clickTime = 0;
var ScrollMc;
var ScrollCheck = false;
var _mouseListener = {};
var myListener = new Object();
var wating_mcl = new MovieClipLoader();
var mclListener = new Object();
wating_mcl.addListener(mclListener);
var waitingMc = this.createEmptyMovieClip("waitingMc",2);
var isWaiting = false;
_global.EventBroadCaster.addListener(myListener);
var FrameTimeCheck = 11;
var ChBtn_StartCheck = false;
var ChBtn_RefreshCheck = false;
var ChBtn_SystemCheck = false;
var ChBtn_ExitCheck = false;
var ChBtn_CreditCheck = false;
var ChBtn_OverFrame = 8;
var ChBtn_EndFrame = 34;
var ChannelList_Totalnum = 0;
var ChannelList_Array = new Array();
var ChannelList_Check = false;
var OneClickTime = 0;
var ListColor1 = new Array();
var ListColor2 = new Array();
var ListColor3 = new Array();
var ListColor4 = new Array();
var waitingMc_x = 390;
var waitingMc_y = 420;
var SaveData = lib.gamedata.HistoryData.getHistoryData("CreditMembers");
function ToGame_SelectServer_Init()
{
   UI.container_mc.Testtxt1.text = UI.container_mc.Testtxt1.text + "init";
   fscommand("ToGame_SelectServer_Init");
}
function Variable_Init()
{
   ChBtn_StartCheck = false;
   ChBtn_RefreshCheck = false;
   ChBtn_SystemCheck = false;
   ChBtn_ExitCheck = false;
   ChBtn_CreditCheck = false;
   ChannelList_Check = false;
   OneClickTime = 0;
   selectMc = undefined;
   ScrollMc.removeMovieClip();
   ScrollMc = undefined;
}
function ChannelList_Make(arr1)
{
   if(ChannelList_Check == false)
   {
      ChannelList_Check = true;
      var _loc2_ = 0;
      while(_loc2_ < arr1.length - 1)
      {
         ChannelList_Totalnum = _loc2_ + 1;
         var _loc1_ = UI.container_mc.ListMc.attachMovie("List","List" + ChannelList_Totalnum,UI.container_mc.ListMc.getNextHighestDepth());
         _loc1_.index = _loc2_;
         _loc1_._y = _loc1_._height * _loc2_;
         _loc1_._x = 0;
         _loc1_._y = _loc1_._height / 2 * (ChannelList_Totalnum - 1);
         _loc1_._alpha = -50;
         gs.TweenLite.killTweensOf(_loc1_,false);
         gs.TweenLite.to(_loc1_,0.3,{delay:0.01 * ChannelList_Totalnum,_y:_loc1_._height * (ChannelList_Totalnum - 1),_alpha:100,ease:gs.easing.Back.easeOut,onComplete:onFinishTween,onCompleteParams:[ChannelList_Totalnum],overwrite:2});
         var _loc3_ = new Array();
         _loc3_ = arr1[_loc2_].split("\t");
         ChannelList_TxtData(_loc1_,_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3]);
         _loc2_ = _loc2_ + 1;
      }
      ChannelList_Check = false;
      ListScrollBar(ChannelList_Totalnum * 47);
   }
}
function onFinishTween(num1)
{
   if(num1 == ChannelList_Array.length - 1)
   {
      ChannelList_Check = false;
   }
}
function ChannelList_Remove()
{
   if(ChannelList_Totalnum > 0)
   {
      var _loc1_ = 1;
      while(_loc1_ <= ChannelList_Totalnum)
      {
         UI.container_mc.ListMc["List" + _loc1_].removeMovieClip();
         _loc1_ = _loc1_ + 1;
      }
   }
}
function ChannelList_TxtData(mc, txt1, txt2, txt3, txt4)
{
   mc.Over._alpha = 0;
   mc.Out._alpha = 0;
   txt2 = ChannelList_MakeInfo(mc,txt2);
   mc.id1_txt.textColor = lib.info.TextColor.UI_LOBBY_UI_LISTACTIVE;
   mc.id2_txt.textColor = lib.info.TextColor.UI_LOBBY_UI_LISTACTIVE;
   mc.id3_txt.textColor = lib.info.TextColor.UI_LOBBY_UI_LISTACTIVE;
   mc.id4_txt.textColor = lib.info.TextColor.UI_LOBBY_UI_LISTACTIVE;
   mc.id1_txt.htmlText = txt1;
   mc.id2_txt.htmlText = txt2;
   mc.id3_txt.htmlText = txt3;
   mc.id4_txt.htmlText = txt4;
   ChannelListBtn_Action(mc);
}
function ChannelList_MakeInfo(mc, txt)
{
   var _loc9_ = txt.indexOf("<info ");
   mc.infoValue = "";
   if(_loc9_ != -1)
   {
      var _loc10_ = txt.indexOf("/>");
      var _loc12_ = txt.substring(0,_loc9_);
      var _loc11_ = txt.substring(_loc10_ + 2);
      var _loc5_ = txt.substring(_loc9_,_loc10_);
      txt = _loc12_ + _loc11_;
      var _loc3_ = ["icon","text"];
      var _loc1_ = 0;
      while(_loc1_ < _loc3_.length)
      {
         var _loc2_ = _loc5_.indexOf(_loc3_[_loc1_] + "=\"");
         if(_loc2_ != -1)
         {
            var _loc6_ = _loc5_.indexOf("\"",_loc2_ + _loc3_[_loc1_].length + 2);
            if(0 == _loc1_)
            {
               ChannelList_MakeIcon(mc,_loc5_.substring(_loc2_ + _loc3_[_loc1_].length + 2,_loc6_));
            }
            else if(1 == _loc1_)
            {
               var _loc4_ = _loc5_.substring(_loc2_ + _loc3_[_loc1_].length + 2,_loc6_);
               lib.Debuger.trace("infoStr : " + _loc4_);
               if(_loc4_ != "")
               {
                  mc.infoValue = _loc4_;
               }
            }
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   return txt;
}
function ChannelList_MakeIcon(mc, txt)
{
   mc.tagMc.gotoAndStop(Number(txt) + 1);
}
function ListScrollBar(listHeight)
{
   var _loc5_ = 0;
   var _loc4_ = 47;
   var _loc3_ = UI.container_mc.ListMcMask._height;
   scrollBar = UI.container_mc.ListScrollbar;
   var _loc2_ = {};
   scrollBar.addListener(_loc2_);
   _loc2_.onScroll = function()
   {
      UI.container_mc.ListMc._y = -47 - arguments[0];
   };
   if(listHeight == undefined)
   {
      scrollBar.__set__pageSize(UI.container_mc.ListMc._height);
   }
   else
   {
      scrollBar.__set__pageSize(listHeight);
   }
   scrollBar.__set__displaySize(_loc3_);
   scrollBar.__set__rowHeight(_loc4_ + _loc5_);
   scrollBar.__set__scroll(0);
   var _loc6_ = 0;
   var _loc9_ = 47;
   var _loc7_ = 440;
   scrollBar.setWheel(UI.container_mc.ListMc);
}
function ChannelList_Select(id)
{
   var _loc2_ = -1;
   var _loc1_ = 1;
   while(_loc1_ <= ChannelList_Totalnum)
   {
      if(id + 1 == _loc1_)
      {
         _loc2_ = _loc1_;
      }
      _loc1_ = _loc1_ + 1;
   }
   var _loc4_ = UI.container_mc.ListMc["List" + _loc2_];
   selectMc = _loc4_;
   gs.TweenLite.to(_loc4_.Over,0.7,{_alpha:100,ease:gs.easing.Strong.easeOut,overwrite:1});
   scrollBar.__set__scroll(_loc4_.index);
}
function TitleText(mc)
{
   mc.TitleText.titleFd.textColor = lib.info.TextColor.UI_LOBBY_UI_TITLE_ACTIVE;
   mc.TitleText.titleFd.htmlText = "$011002";
}
function TabText(mc)
{
   mc.fieldMc.text_0.textColor = lib.info.TextColor.UI_LOBBY_UI_TAB;
   mc.fieldMc.text_1.textColor = lib.info.TextColor.UI_LOBBY_UI_TAB;
   mc.fieldMc.text_2.textColor = lib.info.TextColor.UI_LOBBY_UI_TAB;
   mc.fieldMc.text_3.textColor = lib.info.TextColor.UI_LOBBY_UI_TAB;
   mc.fieldMc.text_0.htmlText = "$011004";
   mc.fieldMc.text_1.htmlText = "$011005";
   mc.fieldMc.text_2.htmlText = "$011006";
   mc.fieldMc.text_3.htmlText = "$011007";
}
function ChnnelBtn_TxtData(mc)
{
   var _loc4_ = new TextFormat();
   var _loc6_ = new TextFormat();
   var _loc5_ = new TextFormat();
   var _loc3_ = new TextFormat();
   var _loc2_ = new TextFormat();
   mc.ChBtn_StarText.txt.htmlText = "$011008";
   mc.ChBtn_RefreshText.txt.htmlText = "$011011";
   UI.BackMc.ChBtn_SystemText.txt.htmlText = "$011010";
   UI.BackMc.ChBtn_ExitText.txt.htmlText = "$011009";
   UI.BackMc.ChBtn_CreditText.txt.htmlText = "$011023";
   mc.ChBtn_StarText.txt.verticalAlign = "center";
   mc.ChBtn_RefreshText.txt.verticalAlign = "center";
   UI.BackMc.ChBtn_SystemText.txt.verticalAlign = "center";
   UI.BackMc.ChBtn_ExitText.txt.verticalAlign = "center";
   UI.BackMc.ChBtn_CreditText.txt.verticalAlign = "center";
   mc.ChBtn_StarText.txt.textAutoSize = "shrink";
   mc.ChBtn_RefreshText.txt.textAutoSize = "shrink";
   UI.BackMc.ChBtn_SystemText.txt.textAutoSize = "shrink";
   UI.BackMc.ChBtn_ExitText.txt.textAutoSize = "shrink";
   UI.BackMc.ChBtn_CreditText.txt.textAutoSize = "shrink";
}
function clearInfo()
{
   infoMc.infoFd.htmlText = "";
   gs.TweenLite.killTweensOf(infoMc,false);
   gs.TweenLite.to(infoMc,0.7,{_alpha:0,ease:gs.easing.Strong.easeOut,overwrite:1});
}
function setInfo(str, yPos)
{
   infoMc._visible = true;
   infoMc.infoFd.htmlText = str;
   gs.TweenLite.to(infoMc,0.7,{_alpha:100,ease:gs.easing.Strong.easeOut,overwrite:1});
   infoMc._y = yPos + container_mc._y + container_mc.ListMc._y - 20;
}
function selectList(mc)
{
   var _loc1_ = 1;
   while(_loc1_ <= ChannelList_Totalnum)
   {
      gs.TweenLite.to(UI.container_mc.ListMc["List" + _loc1_].Over,0.7,{_alpha:0,ease:gs.easing.Strong.easeOut,overwrite:1});
      _loc1_ = _loc1_ + 1;
   }
   selectMc = mc;
   gs.TweenLite.to(mc.Over,0.7,{_alpha:100,ease:gs.easing.Strong.easeOut,overwrite:1});
   var _loc2_ = getTimer() - OneClickTime;
   OneClickTime = getTimer();
   if(_loc2_ <= 300)
   {
      if(ChBtn_StartCheck == false)
      {
         ChBtn_StartCheck = true;
         lib.util.FrameSeeker.seek(UI.container_mc.ChBtn_Start.Btn2,ChBtn_OverFrame,ChBtn_EndFrame);
         UI.container_mc.ChBtn_Start.onEnterFrame = function()
         {
            if(UI.container_mc.ChBtn_Start.Btn2._currentframe >= ChBtn_EndFrame)
            {
               UI.container_mc.ChBtn_Start.onEnterFrame = null;
               ChBtn_StartCheck = false;
            }
         };
         ToGame_SelectServer_Login(selectMc.index);
      }
   }
   Sound_Play("click");
}
function ChannelListBtn_Action(mc)
{
   mc.onRollOver = function()
   {
      gs.TweenLite.to(mc.Over,0.7,{_alpha:100,ease:gs.easing.Strong.easeOut,overwrite:1});
      if(mc.infoValue != "")
      {
         setInfo(mc.infoValue,mc._y);
      }
      else
      {
         clearInfo();
      }
   };
   mc.onRollOut = function()
   {
      if(selectMc != mc)
      {
         gs.TweenLite.to(mc.Over,0.7,{_alpha:0,ease:gs.easing.Strong.easeOut,overwrite:1});
         if(mc.infoValue != "")
         {
            clearInfo();
         }
      }
   };
   mc.onReleaseOutside = function()
   {
      selectList(mc);
      clearInfo();
   };
   mc.onRelease = function()
   {
      selectList(mc);
   };
}
function TabBtn_Action()
{
   var _loc2_ = 1;
   while(_loc2_ <= 4)
   {
      UI.container_mc["ch_TabHit" + _loc2_].onRollOver = function()
      {
         UI.container_mc["ch_Tab" + this._name.substr(-1)].gotoAndStop("over");
      };
      UI.container_mc["ch_TabHit" + _loc2_].onRollOut = function()
      {
         UI.container_mc["ch_Tab" + this._name.substr(-1)].gotoAndStop("normal");
      };
      UI.container_mc["ch_TabHit" + _loc2_].onPress = function()
      {
         UI.container_mc["ch_Tab" + this._name.substr(-1)].gotoAndStop("click");
      };
      UI.container_mc["ch_TabHit" + _loc2_].onRelease = UI.container_mc["ch_TabHit" + _loc2_].onReleaseOutside = function()
      {
         if(ChannelList_Check == false)
         {
            lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
            ChannelList_Remove();
            Variable_Init();
            ToGame_SelectServer_RequestSortData(Number(this._name.substr(-1)) - 1);
         }
         UI.container_mc["ch_Tab" + this._name.substr(-1)].gotoAndStop("over");
      };
      _loc2_ = _loc2_ + 1;
   }
}
function ChnnelBtn_Action()
{
   UI.container_mc.ChBtn_Start.onRollOver = function()
   {
      if(ChBtn_StartCheck == false)
      {
         lib.util.FrameSeeker.seek(this.Btn2,1,ChBtn_OverFrame);
      }
   };
   UI.container_mc.ChBtn_Start.onRollOut = function()
   {
      if(ChBtn_StartCheck == false)
      {
         lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,1);
      }
   };
   UI.container_mc.ChBtn_Start.onRelease = UI.container_mc.ChBtn_Start.onReleaseOutside = function()
   {
      if(ChBtn_StartCheck == false)
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         ChBtn_StartCheck = true;
         lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,ChBtn_EndFrame);
         UI.container_mc.ChBtn_Start.onEnterFrame = function()
         {
            if(UI.container_mc.ChBtn_Start.Btn2._currentframe >= ChBtn_EndFrame)
            {
               UI.container_mc.ChBtn_Start.onEnterFrame = null;
               ChBtn_StartCheck = false;
            }
         };
         ToGame_SelectServer_Login(selectMc.index);
      }
   };
   UI.container_mc.ChBtn_Refresh.onRollOver = function()
   {
      if(ChBtn_RefreshCheck == false)
      {
         lib.util.FrameSeeker.seek(this.Btn2,1,ChBtn_OverFrame);
      }
   };
   UI.container_mc.ChBtn_Refresh.onRollOut = function()
   {
      if(ChBtn_RefreshCheck == false)
      {
         if(this.Btn2._currentframe != ChBtn_EndFrame)
         {
            lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,1);
         }
      }
      else if(ChBtn_RefreshCheck == true)
      {
         ChBtn_RefreshCheck = false;
      }
   };
   UI.container_mc.ChBtn_Refresh.onRelease = UI.container_mc.ChBtn_Refresh.onReleaseOutside = function()
   {
      if(ChBtn_RefreshCheck == false)
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         if(ChannelList_Check == false)
         {
            ChannelList_Remove();
            Variable_Init();
            ToGame_SelectServer_Refresh();
         }
         ChBtn_RefreshCheck = true;
         lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,ChBtn_EndFrame);
         UI.container_mc.ChBtn_Refresh.onEnterFrame = function()
         {
            if(UI.container_mc.ChBtn_Refresh.Btn2._currentframe == ChBtn_EndFrame)
            {
               ChBtn_RefreshCheck = false;
               UI.container_mc.ChBtn_Refresh.onEnterFrame = null;
            }
         };
      }
   };
   UI.BackMc.ChBtn_System.onRollOver = function()
   {
      if(ChBtn_SystemCheck == false)
      {
         lib.util.FrameSeeker.seek(this.Btn2,1,ChBtn_OverFrame);
      }
   };
   UI.BackMc.ChBtn_System.onRollOut = function()
   {
      if(ChBtn_SystemCheck == false)
      {
         if(this.Btn2._currentframe != ChBtn_EndFrame)
         {
            lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,1);
         }
      }
      else if(ChBtn_SystemCheck == true)
      {
         ChBtn_SystemCheck = false;
      }
   };
   UI.BackMc.ChBtn_System.onRelease = UI.BackMc.ChBtn_System.onReleaseOutside = function()
   {
      if(ChBtn_SystemCheck == false)
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         ToGame_MainMenu_Call();
         ChBtn_SystemCheck = true;
         lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,ChBtn_EndFrame);
         UI.BackMc.ChBtn_System.onEnterFrame = function()
         {
            if(UI.BackMc.ChBtn_System.Btn2._currentframe == ChBtn_EndFrame)
            {
               ChBtn_SystemCheck = false;
               UI.BackMc.ChBtn_System.onEnterFrame = null;
            }
         };
      }
   };
   UI.BackMc.ChBtn_Credit.onRollOver = function()
   {
      if(ChBtn_CreditCheck == false)
      {
         lib.util.FrameSeeker.seek(this.Btn2,1,ChBtn_OverFrame);
      }
   };
   UI.BackMc.ChBtn_Credit.onRollOut = function()
   {
      if(ChBtn_CreditCheck == false)
      {
         if(this.Btn2._currentframe != ChBtn_EndFrame)
         {
            lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,1);
         }
      }
      else if(ChBtn_CreditCheck == true)
      {
         ChBtn_CreditCheck = false;
      }
   };
   UI.BackMc.ChBtn_Credit.onRelease = UI.BackMc.ChBtn_Credit.onReleaseOutside = function()
   {
      if(ChBtn_CreditCheck == false && ChBtn_StartCheck == false)
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         ChBtn_CreditCheck = true;
         lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,ChBtn_EndFrame);
         UI.BackMc.ChBtn_Credit.onEnterFrame = function()
         {
            if(UI.BackMc.ChBtn_Credit.Btn2._currentframe == ChBtn_OverFrame + 2)
            {
               ChBtn_CreditCheck = false;
               UI.BackMc.ChBtn_Credit.onEnterFrame = null;
               ToGame_CreditMembers_Show();
            }
         };
      }
   };
   UI.BackMc.ChBtn_Exit.onRollOver = function()
   {
      if(ChBtn_ExitCheck == false)
      {
         lib.util.FrameSeeker.seek(this.Btn2,1,ChBtn_OverFrame);
      }
   };
   UI.BackMc.ChBtn_Exit.onRollOut = function()
   {
      if(ChBtn_ExitCheck == false)
      {
         lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,1);
      }
      else if(ChBtn_ExitCheck == true)
      {
         ChBtn_ExitCheck = false;
      }
   };
   UI.BackMc.ChBtn_Exit.onRelease = UI.BackMc.ChBtn_Exit.onReleaseOutside = function()
   {
      if(ChBtn_ExitCheck == false)
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         ToGame_SelectServer_Cancel();
         ChBtn_ExitCheck = true;
         lib.util.FrameSeeker.seek(this.Btn2,ChBtn_OverFrame,ChBtn_EndFrame);
         UI.BackMc.ChBtn_Exit.onEnterFrame = function()
         {
            if(UI.BackMc.ChBtn_Exit.Btn2._currentframe == ChBtn_EndFrame)
            {
               UI.BackMc.ChBtn_Exit.onEnterFrame = null;
            }
         };
      }
   };
}
function FrameCheckAction()
{
   UI.container_mc.ListScrollbar._visible = false;
   UI.BackMc.CopyRightMc.txt.text = "$014006";
   UI.onEnterFrame = function()
   {
      if(UI.container_mc._currentframe == FrameTimeCheck)
      {
         ChannelList_Remove();
         Variable_Init();
         TabBtn_Action();
         TitleText(UI.container_mc);
         TabText(UI.container_mc);
         ChnnelBtn_TxtData(UI.container_mc);
         ToGame_SelectServer_Init();
         UI.container_mc.ListScrollbar._visible = true;
      }
      if(UI.container_mc._currentframe >= 17)
      {
         UI.onEnterFrame = null;
         ChnnelBtn_Action();
      }
   };
}
function ToGame_MainMenu_Call()
{
   getUrl("FSCommand:ToGame_MainMenu_RequestShowUI", "SystemOption\t1");
}
function ToGame_SelectServer_Cancel()
{
   fscommand("ToGame_SelectServer_Cancel");
}
function ToGame_SelectServer_Refresh()
{
   fscommand("ToGame_SelectServer_Refresh");
}
function ToGame_SelectServer_Login(serverId)
{
   fscommand("ToGame_SystemOption_CloseUI");
   getURL("FSCommand:ToGame_SelectServer_Login",serverId);
   fscommand("ToGame_CreditMembers_BackToLobby");
}
function ToGame_SelectServer_RequestSortData(sortType)
{
   getURL("FSCommand:ToGame_SelectServer_RequestSortData",sortType);
}
function ToGame_CreditMembers_Show()
{
   fscommand("ToGame_CreditMembers_Show");
}
function Sound_Play(type)
{
   if(type == "click")
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
   }
}
function ToGame_ServerWaiting_Exit()
{
   fscommand("ToGame_ServerWaiting_Exit");
   wating_mcl.unloadClip(waitingMc);
   container_mc._visible = true;
   isWaiting = false;
}
if(SaveData == undefined)
{
   SaveData = new Object();
}
infoMc._visible = false;
infoMc._alpha = 0;
infoMc.hitTestDisable = true;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == "selectserver")
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
         Mouse.addListener(_mouseListener);
      }
      else
      {
         UI._visible = false;
         Mouse.removeListener(_mouseListener);
      }
   }
};
myListener.OnGame_ChangeStageSize = function(width, height)
{
   lib.Debuger.trace("OnGame_ChangeStageSize");
   if(width == undefined || height == undefined)
   {
      return undefined;
   }
   UI.BackMc._y = lib.info.AlignInfo.yRatioToPixel(100);
   UI.Logo._y = lib.info.AlignInfo.yRatioToPixel(4);
   UI.container_mc._y = UI.Logo._y + 420;
   UI.waitingMc._x = UI.Logo._x - waitingMc_x;
   UI.waitingMc._y = UI.Logo._y + waitingMc_y;
};
myListener.OnGame_SetUIPosition = function()
{
   _level0.OnGameEvent("OnGameEvent_SystemOption_LobbyOpen",lib.info.AlignInfo.xRatioToPixel(72),lib.info.AlignInfo.yRatioToPixel(20));
};
myListener.OnGame_KeyDown = function(code)
{
   if(SaveData.set_visible != true)
   {
      if(code == 13)
      {
         if(ChBtn_StartCheck == false)
         {
            ChBtn_StartCheck = true;
            lib.util.FrameSeeker.seek(UI.container_mc.ChBtn_Start.Btn2,ChBtn_OverFrame,ChBtn_EndFrame);
            UI.container_mc.ChBtn_Start.onEnterFrame = function()
            {
               if(UI.container_mc.ChBtn_Start.Btn2._currentframe >= ChBtn_EndFrame)
               {
                  UI.container_mc.ChBtn_Start.onEnterFrame = null;
                  ChBtn_StartCheck = false;
               }
            };
            ToGame_SelectServer_Login(selectMc.index);
            Sound_Play("click");
         }
      }
   }
};
myListener.OnGame_SelectServer_SetData = function(dataList, _defaultServerId)
{
   if(ChBtn_RefreshCheck == false)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      if(ChannelList_Check == false)
      {
         ChannelList_Remove();
         Variable_Init();
      }
   }
   ChannelList_Array = new Array();
   ChannelList_Array = dataList.split("\n");
   UI.container_mc.Testtxt3.text = UI.container_mc.Testtxt3.text + ChannelList_Array.length;
   ChannelList_Make(ChannelList_Array);
   ChannelList_Select(_defaultServerId);
};
myListener.OnGame_SelectServer_Disappear = function()
{
   UI.container_mc.gotoAndPlay("end");
   UI.BackMc.gotoAndPlay("end");
   UI.Logo.gotoAndPlay("end");
};
var scrollBar;
UI.infoMc.infoFd.verticalAlign = "center";
mclListener.onLoadInit = function(target_mc)
{
   target_mc.setData(this.loadData[0],this.loadData[1],this.loadData[2],this.loadData[3]);
   var _loc4_ = target_mc._width;
   var _loc3_ = target_mc._height;
   target_mc._x = Stage.width / 2 - _loc4_ / 2;
   target_mc._y = Stage.height / 2 - _loc3_ / 2;
   UI.waitingMc._x = UI.Logo._x - waitingMc_x;
   UI.waitingMc._y = UI.Logo._y + waitingMc_y;
   isWaiting = true;
};
myListener.OnGame_SelectWaiting_SetData = function(_serverName, _users, _delayTime, _buffMessage)
{
   mclListener.loadData = arguments;
   if(!isWaiting)
   {
      wating_mcl.loadClip(lib.info.LoadURL.SERVER_WAITING_UI,waitingMc);
   }
   else
   {
      waitingMc.setData(_serverName,_users,_delayTime,_buffMessage);
   }
   container_mc._visible = false;
   UI.waitingMc._x = UI.Logo._x - waitingMc_x;
   UI.waitingMc._y = UI.Logo._y + waitingMc_y;
};
myListener.OnGame_SelectWaiting_Close = function()
{
   wating_mcl.unloadClip(waitingMc);
   container_mc._visible = true;
   isWaiting = false;
};
myListener.OnGame_ChangeStageSize(Stage.width,Stage.height);
FrameCheckAction();
container_mc.Btn1.onRelease = function()
{
   this._parent.gotoAndPlay("start");
   ChannelList_Remove();
   FrameCheckAction();
};
container_mc.Btn2.onRelease = function()
{
   this._parent.gotoAndPlay("end");
};
container_mc.Btn3.onRelease = function()
{
};
