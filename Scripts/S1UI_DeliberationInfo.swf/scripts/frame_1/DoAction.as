function ToGame_DeliberationInfo_CloseUI()
{
   fscommand("ToGame_DeliberationInfo_CloseUI");
}
function closeUI()
{
   ToGame_DeliberationInfo_CloseUI();
}
var UI = this;
var UIname = "DeliberationInfo";
UI._visible = false;
bWidgetOpen = true;
var useUIMode = false;
var myListener = new Object();
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
   _global.gbUIMode = bShow;
   if(useUIMode)
   {
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
var close_btn = new lib.util.TxtBtn(x_mc);
close_btn.setRelease(closeUI);
_global.EventBroadCaster.addListener(myListener);
fscommand("ToGame_DeliberationInfo_Init");
