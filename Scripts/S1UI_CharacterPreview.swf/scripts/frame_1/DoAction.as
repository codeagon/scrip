function makePressInterval(targetMc, targetFunction, param1)
{
   delete targetMc.onEnterFrame;
   targetMc.onEnterFrame = function()
   {
      targetFunction(param1);
   };
}
function clearPressInterval(targetMc)
{
   delete targetMc.onEnterFrame;
}
function ToGame_CharacterPreview_PressControlBtn(btnType)
{
   getURL("FSCommand:ToGame_CharacterPreview_PressControlBtn",btnType);
}
function ToGame_CharacterPreview_CloseUI()
{
   fscommand("ToGame_CharacterPreview_CloseUI");
}
function ToGame_CharacterPreview_ClickChangeModeBtn()
{
   fscommand("ToGame_CharacterPreview_ClickChangeModeBtn");
}
var UI = this;
UI._visible = false;
var UIname = "CharacterPreview";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var control = container_mc.characterController_mc;
var exitKeyString = "ESC";
var left_btn = new lib.util.TxtBtn(control.left_mc);
var right_btn = new lib.util.TxtBtn(control.right_mc);
var up_btn = new lib.util.TxtBtn(control.up_mc);
var down_btn = new lib.util.TxtBtn(control.down_mc);
var center_btn = new lib.util.TxtBtn(control.center_mc);
left_btn.setPress(function()
{
   makePressInterval(control.left_mc,ToGame_CharacterPreview_PressControlBtn,"left");
}
);
right_btn.setPress(function()
{
   makePressInterval(control.right_mc,ToGame_CharacterPreview_PressControlBtn,"right");
}
);
up_btn.setPress(function()
{
   makePressInterval(control.up_mc,ToGame_CharacterPreview_PressControlBtn,"up");
}
);
down_btn.setPress(function()
{
   makePressInterval(control.down_mc,ToGame_CharacterPreview_PressControlBtn,"down");
}
);
center_btn.setPress(function()
{
   makePressInterval(control.center_mc,ToGame_CharacterPreview_PressControlBtn,"center");
}
);
left_btn.setRelease(function()
{
   clearPressInterval(control.left_mc);
}
);
left_btn.setReleaseOutside(function()
{
   clearPressInterval(control.left_mc);
}
);
right_btn.setRelease(function()
{
   clearPressInterval(control.right_mc);
}
);
right_btn.setReleaseOutside(function()
{
   clearPressInterval(control.right_mc);
}
);
up_btn.setRelease(function()
{
   clearPressInterval(control.up_mc);
}
);
up_btn.setReleaseOutside(function()
{
   clearPressInterval(control.up_mc);
}
);
down_btn.setRelease(function()
{
   clearPressInterval(control.down_mc);
}
);
down_btn.setReleaseOutside(function()
{
   clearPressInterval(control.down_mc);
}
);
center_btn.setRelease(function()
{
   clearPressInterval(control.center_mc);
}
);
center_btn.setReleaseOutside(function()
{
   clearPressInterval(control.center_mc);
}
);
lib.manager.ToolTip.add(control.x,lib.util.UIString.getUIString("$431001"),1);
lib.manager.ToolTip.add(control.change_mc,lib.util.UIString.getUIString("$431002"),1);
var change_btn = new lib.util.TxtBtn(control.change_mc);
var x_btn = new lib.util.TxtBtn(control.x);
change_btn.setRelease(ToGame_CharacterPreview_ClickChangeModeBtn);
x_btn.setRelease(ToGame_CharacterPreview_CloseUI);
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
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
myListener.OnGame_CharacterPreview_SetExitKey = function(keyString)
{
   if(keyString != undefined)
   {
      exitKeyString = keyString;
   }
   container_mc.btn0.txtBtn.setText(lib.util.UIString.getUIString("$102158") + "(" + keyString + ")");
};
fscommand("ToGame_CharacterPreview_Init");
