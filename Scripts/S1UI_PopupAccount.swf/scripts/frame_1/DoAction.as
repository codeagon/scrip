function ToGame_PopupAccount_BtnEvent()
{
   lib.Debuger.trace("ToGame_PopupAccount_BtnEvent  ");
   fscommand("ToGame_PopupAccount_BtnEvent");
}
function ToGame_PopupAccount_Close()
{
   lib.Debuger.trace("ToGame_PopupAccount_Close  ");
   fscommand("ToGame_PopupAccount_Close");
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "PopupAccount";
container_mc.bodyFd.verticalAlign = "center";
container_mc.titleFd.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
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
myListener.OnGame_PopupAccount_setLayout = function(titleStr, bodyStr, btnStr)
{
   container_mc.titleFd.text = titleStr;
   container_mc.bodyFd.htmlText = bodyStr;
   Btn0.setText(btnStr);
};
var closeBtn = new lib.util.TxtBtn(container_mc.xmc);
var Btn0 = container_mc.btn0.txtBtn;
closeBtn.setRelease(function()
{
   ToGame_PopupAccount_Close();
}
);
Btn0.setRelease(function()
{
   ToGame_PopupAccount_BtnEvent();
}
);
var scrollbar = container_mc.scrollbar;
scrollbar.setTextField(container_mc.bodyFd);
fscommand("ToGame_PopupAccount_Init");
