function coolTime(_iconMc)
{
   _iconMc.icon.gotoAndStop("stop");
}
var UI = this;
var bWidgetOpen = true;
var UIname = "NewsIcon";
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
var INTERVAL = 3000;
var iconWidth;
var iconSpace = 5;
var noteTimer;
UI.noteIcon._visible = false;
myListener.OnGame_NewsIcon_Note = function(type)
{
   UI.noteIcon.gotoAndStop(Number(type) + 1);
   UI.noteIcon._visible = true;
   clearTimeout(noteTimer);
   UI.noteIcon.icon.gotoAndPlay(1);
   noteTimer = setTimeout(coolTime,INTERVAL,UI.noteIcon);
};
myListener.OnGame_NewsIcon_ClearNote = function()
{
   UI.noteIcon._visible = false;
};
lib.Debuger.trace("newsIcon !!! " + this);
lib.Debuger.trace("newsIcon !!! " + this._x + "  " + this._y);
