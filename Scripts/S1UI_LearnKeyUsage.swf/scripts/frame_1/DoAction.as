function ToGame_LearnKeyUsage_CloseUI()
{
   fscommand("ToGame_LearnKeyUsage_CloseUI");
   trace("ToGame_LearnKeyUsage_CloseUI");
}
function closeUI()
{
   ToGame_LearnKeyUsage_CloseUI();
}
var UI = this;
var UIname = "LearnKeyUsage";
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
myListener.OnGame_LearnKeyUsage_SetUseChangeUIMode = function(bTrue)
{
   useUIMode = Number(bTrue);
   if(useUIMode)
   {
      if(_global.gbUIMode)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
      x_mc._visible = true;
   }
   else
   {
      UI._visible = true;
      x_mc._visible = false;
   }
};
var close_btn = new lib.util.TxtBtn(x_mc);
close_btn.setRelease(closeUI);
_global.EventBroadCaster.addListener(myListener);
fd0.verticalAlign = "center";
fd1.verticalAlign = "center";
fscommand("ToGame_LearnKeyUsage_Init");
