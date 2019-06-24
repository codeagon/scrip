function ToGame_BFInputPassword_Init()
{
   lib.Debuger.trace("ToGame_BFInputPassword_Init");
   fscommand("ToGame_BFInputPassword_Init");
}
function ToGame_BFInputPassword_CloseUI()
{
   lib.Debuger.trace("ToGame_BFInputPassword_CloseUI");
   fscommand("ToGame_BFInputPassword_CloseUI");
}
function ToGame_BFInputPassword_Confirm()
{
   var _loc1_ = container_mc.passwdFd.text;
   if(_loc1_ == "" || _loc1_ == undefined || _loc1_ == passCaution)
   {
      Selection.setFocus(container_mc.passwdFd);
      return undefined;
   }
   Selection.setFocus(null);
   lib.Debuger.trace("ToGame_BFInputPassword_Confirm: " + _loc1_);
   getURL("FSCommand:ToGame_BFInputPassword_Confirm",_loc1_);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "BFInputPassword";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.guidFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.passwdGuideFd.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.guidFd.verticalAlign = "center";
container_mc.passwdGuideFd.verticalAlign = "center";
container_mc.passwdFd.verticalAlign = "bottom";
var NameTextLength_Local = 0;
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
   container_mc.ToolTip._visible = bShow;
};
var passCaution;
myListener.OnGame_BFInputPassword_SetData = function(passwordGuide)
{
   if(passCaution == undefined)
   {
      passCaution = lib.util.ExtString.trim(passwordGuide);
   }
   container_mc.passwdGuideFd.text = passwordGuide;
   Selection.setFocus(container_mc.passwdFd);
};
var apply_btn = container_mc.txtBtn0.txtBtn;
var close_btn = container_mc.txtBtn1.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
apply_btn.setRelease(ToGame_BFInputPassword_Confirm);
close_btn.setRelease(ToGame_BFInputPassword_CloseUI);
x_btn.setRelease(ToGame_BFInputPassword_CloseUI);
var passwdFd = new lib.util.ExtTextField(container_mc.passwdFd,0,container_mc.passwdFd_focus);
passwdFd.onChanged = function()
{
   var _loc4_ = this.text;
   var _loc3_ = lib.util.ExtString.trim(_loc4_);
   apply_btn.setEnabled(_loc3_ != "" && _loc3_ != undefined);
   var _loc2_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc2_ = NameTextLength_Local;
   }
   else
   {
      _loc2_ = 8;
   }
   lib.util.StrByteLen.getLenth3(container_mc.passwdFd,_loc2_);
   lib.Debuger.trace("NameTextLength_Local : " + NameTextLength_Local);
};
passwdFd.onEnterKey = function()
{
   if(apply_btn.btn.enabled)
   {
      ToGame_BFInputPassword_Confirm();
   }
};
myListener.OnGame_BFInputPassword_LengthLocal = function(lengthnum)
{
   lib.Debuger.trace("OnGame_BFInputPassword_LengthLocal : " + lengthnum);
   NameTextLength_Local = lengthnum;
};
apply_btn.setEnabled(false);
ToGame_BFInputPassword_Init();
