function ToGame_LogOut_GotoCharacterSelect()
{
   fscommand("ToGame_LogOut_GotoCharacterSelect");
}
function ToGame_LogOut_QuitGame()
{
   fscommand("ToGame_LogOut_QuitGame");
}
function ToGame_LogOut_CloseUI()
{
   fscommand("ToGame_LogOut_CloseUI");
}
var UI = this;
UI._visible = false;
bWidgetOpen = false;
var myListener = new Object();
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == "logout")
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
};
_global.EventBroadCaster.addListener(myListener);
var btn0_btn = new lib.util.TxtBtn(container_mc.btn0_mc,container_mc.txt0);
var btn1_btn = new lib.util.TxtBtn(container_mc.btn1_mc,container_mc.txt1);
var btn2_btn = new lib.util.TxtBtn(container_mc.btn2_mc,container_mc.txt2);
btn0_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
btn1_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
btn2_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
btn0_btn.setRelease(ToGame_LogOut_GotoCharacterSelect);
btn1_btn.setRelease(ToGame_LogOut_QuitGame);
btn2_btn.setRelease(ToGame_LogOut_CloseUI);
fscommand("ToGame_LogOut_Init");
