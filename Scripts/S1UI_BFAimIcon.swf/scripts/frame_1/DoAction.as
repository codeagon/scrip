function ToGame_BFAlimIcon_Init()
{
   fscommand("ToGame_BFAlimIcon_Init");
}
function ToGame_BFUI_Open()
{
   fscommand("ToGame_BFUI_Open");
}
var UI = this;
UI._visible = true;
var bWidgetOpen = true;
var UIname = "BFAlimIcon";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var btnStr = lib.util.UIString.getUIString("$273001");
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
myListener.OnGame_BFAlimIcon_SetKey = function(keycode)
{
   opneBtn.setText(btnStr);
   if(keycode != "" && keycode != undefined)
   {
      opneBtn.setText(btnStr + "(" + lib.info.KeyMap.toKeyCode(keycode) + ")");
   }
};
myListener.OnGame_Start_SetKey = function(keycode)
{
   opneBtn.setText(btnStr);
   if(keycode != "" && keycode != undefined)
   {
      opneBtn.setText(btnStr + "(" + lib.info.KeyMap.toKeyCode(keycode) + ")");
   }
};
var opneBtn = container_mc.btn.txtBtn;
opneBtn.setVisible(false);
container_mc.iconMc.onEnterFrame = function()
{
   if(this._currentframe == this._totalframes)
   {
      opneBtn.setVisible(true);
      delete this.onEnterFrame;
   }
};
opneBtn.setRelease(ToGame_BFUI_Open);
ToGame_BFAlimIcon_Init();
