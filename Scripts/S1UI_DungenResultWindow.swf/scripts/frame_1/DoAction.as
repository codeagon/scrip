function timeOutFunc()
{
   ToGame_DungenResultWindow_Close();
}
function ToGame_DungenResultWindow_Init()
{
   fscommand("ToGame_DungenResultWindow_Init");
   lib.Debuger.trace("ToGame_DungenResultWindow_Init");
}
function ToGame_DungenResultWindow_Close()
{
   fscommand("ToGame_DungenResultWindow_Close");
   lib.Debuger.trace("ToGame_DungenResultWindow_Close");
}
var UI = this;
UI._visible = true;
var bWidgetOpen = true;
var UIname = "DungenResultWindow";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
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
var DELAYTIME = 3000;
myListener.OnGame_DungenResultWindow_SetResult = function(_result)
{
   _result = Number(_result);
   var _loc1_ = "Fail";
   if(_result)
   {
      _loc1_ = "Clear";
      lib.manager.UISound.play(1199);
   }
   else
   {
      lib.manager.UISound.play(1200);
   }
   container_mc.attachMovie(_loc1_,"resultMc",1);
   setTimeout(timeOutFunc,DELAYTIME);
};
ToGame_DungenResultWindow_Init();
