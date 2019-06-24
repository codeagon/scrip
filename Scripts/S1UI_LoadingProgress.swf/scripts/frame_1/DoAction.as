var UIname = "LoadingProgress";
var bWidgetOpen = true;
UI = this;
UI._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = Number(bShow);
      if(bWidgetOpen)
      {
         container_mc.progressTxt.text = "0%";
         container_mc.maskMc._xscale = 0;
         UI._visible = true;
      }
      else
      {
         container_mc.progressTxt.text = "100%";
         container_mc.maskMc._xscale = 100;
         UI._visible = false;
      }
   }
};
myListener.OnGameEvent_LoadingProgress_SetProgress = function(rat)
{
   rat = Number(rat);
   container_mc.progressTxt.text = int(rat) + "%";
   container_mc.maskMc._xscale = int(rat);
};
ToGame_LoadingProgress_Init();
