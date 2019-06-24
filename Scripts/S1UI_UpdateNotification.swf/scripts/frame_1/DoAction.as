function ToGame_UpdateNotification_Init()
{
   fscommand("ToGame_UpdateNotification_Init");
}
function ToGame_UpdateNotification_CloseUI()
{
   fscommand("ToGame_UpdateNotification_CloseUI");
}
function ToGame_UpdateNotification_GotoLocation(target)
{
   getURL("FSCommand:ToGame_UpdateNotification_GotoLocation",target);
}
function testbtn00func()
{
   lib.Debuger.trace("testbtn00func");
   myListener.OnGame_UpdateNotification_SetTextData("12ldhaklshdkajshdkajhsdkja");
}
function testbtn01func()
{
   lib.Debuger.trace("testbtn01func");
   myListener.OnGame_UpdateNotification_SetTitleTextData("제목은 내가 정하는걸로~");
}
stop();
_global.gfxExtensions = true;
var UI = this;
var UIname = "UpdateNotification";
var bWidgetOpen = false;
UI._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var x_btn = new lib.util.TxtBtn(container_mc.xmc);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.textname.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.txt1.textAutoSize = "shrink";
container_mc.txt1.htmlText = "<img src=\'icon_notice\' vspace=\'-2\'> " + lib.util.UIString.getUIString("$464002");
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
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
};
myListener.OnGame_ChangeStageSize = function()
{
};
myListener.OnGame_UpdateNotification_SetTitleTextData = function(_data)
{
   container_mc.textname.htmlText = _data;
};
myListener.OnGame_UpdateNotification_SetTextData = function(_data)
{
   container_mc.txt0.htmlText = "";
   var _loc1_ = _data;
   _loc1_ = lib.util.ExtString.replace(_loc1_,"{H}","<font color=\'#cffaff\' size=\'18\'>");
   _loc1_ = lib.util.ExtString.replace(_loc1_,"{A}","<li><img src=\'bl1\' vspace=\'2\'> <font color=\'#ffffff\' size=\'15\'>");
   _loc1_ = lib.util.ExtString.replace(_loc1_,"{B}","<li>  <img src=\'bl2\' vspace=\'3\'><font color=\'#cccccc\' size=\'14\'>");
   _loc1_ = lib.util.ExtString.replace(_loc1_,"{/A}","</font></li>");
   _loc1_ = lib.util.ExtString.replace(_loc1_,"{/B}","</font></li>");
   _loc1_ = lib.util.ExtString.replace(_loc1_,"{E}","<font color=\'#A9D623\'>");
   _loc1_ = lib.util.ExtString.replace(_loc1_,"{W}","<font color=\'#d31e00\'>");
   _loc1_ = lib.util.ExtString.replace(_loc1_,"{/H}","</font><br>");
   _loc1_ = lib.util.ExtString.replace(_loc1_,"{/E}","</font>");
   _loc1_ = lib.util.ExtString.replace(_loc1_,"{/W}","</font>");
   var _loc2_ = 1;
   while(_loc2_ < 20)
   {
      _loc1_ = lib.util.ExtString.replace(_loc1_,"{" + _loc2_ + "}","<img src=\'n" + _loc2_ + "\' vspace=\'-3\'><font color=\'#05a9f6\' size=\'15\'>");
      _loc1_ = lib.util.ExtString.replace(_loc1_,"{/" + _loc2_ + "}","</font>");
      _loc2_ = _loc2_ + 1;
   }
   _loc1_ = lib.util.ExtString.replace(_loc1_,"{","<");
   _loc1_ = lib.util.ExtString.replace(_loc1_,"}",">");
   container_mc.txt0.htmlText = _loc1_;
   container_mc.scrollbar.setTextField(container_mc.txt0);
   container_mc.scrollbar.scroll = 0;
};
x_btn.setRelease(ToGame_UpdateNotification_CloseUI);
ToGame_UpdateNotification_Init();
var test_btn00 = testbtn00.txtBtn;
test_btn00.setRelease(function()
{
   testbtn00func();
}
);
var test_btn01 = testbtn01.txtBtn;
test_btn01.setRelease(function()
{
   testbtn01func();
}
);
