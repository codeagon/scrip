function ToGame_BFTeamCreation_Init()
{
   lib.Debuger.trace("ToGame_BFTeamCreation_Init");
   fscommand("ToGame_BFTeamCreation_Init");
}
function ToGame_BFTeamCreation_CloseUI()
{
   lib.Debuger.trace("ToGame_BFTeamCreation_CloseUI");
   fscommand("ToGame_BFTeamCreation_CloseUI");
}
function ToGame_BFTeamCreation_Confirm()
{
   var _loc2_ = container_mc.introduceFd.text;
   var _loc1_ = "";
   var _loc3_ = Number(container_mc.passwdCheck.checked);
   if(_loc2_ == "" || _loc2_ == undefined)
   {
      container_mc.introduceFd.text = messageCaution;
      Selection.setFocus(container_mc.introduceFd);
      return undefined;
   }
   if(_loc3_ == 1)
   {
      _loc1_ = container_mc.passwdFd.text;
      if(_loc1_ == "" || _loc1_ == undefined || _loc1_ == passCaution)
      {
         container_mc.passwdGuideFd.text = passCaution;
         Selection.setFocus(container_mc.passwdFd);
         return undefined;
      }
   }
   lib.Debuger.trace("ToGame_BFTeamCreation_Confirm : " + _loc2_ + "\t" + _loc3_ + "\t" + _loc1_);
   getURL("FSCommand:ToGame_BFTeamCreation_Confirm",_loc2_ + "\t" + _loc3_ + "\t" + _loc1_);
}
function setApplyState()
{
   var _loc3_ = container_mc.introduceFd.text;
   var _loc1_ = lib.util.ExtString.trim(_loc3_);
   var _loc2_ = _loc1_ != "" && _loc1_ != undefined;
   _loc3_ = container_mc.passwdFd.text;
   _loc1_ = lib.util.ExtString.trim(_loc3_);
   if(container_mc.passwdCheck.checked)
   {
      _loc2_ = _loc1_ != "" && _loc1_ != undefined && _loc2_;
   }
   apply_btn.setEnabled(_loc2_);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "BFTeamCreation";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.lbFd0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.lbFd1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
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
var PASSWRD_MAXLENGTH = 8;
var messageCaution;
var passCaution;
var str3;
var NameTextLength_Local = 0;
myListener.OnGame_BFTeamCreation_SetData = function(introMessage, passwordGuide)
{
   if(messageCaution == undefined)
   {
      messageCaution = lib.util.ExtString.trim(introMessage);
   }
   if(passCaution == undefined)
   {
      passCaution = lib.util.ExtString.trim(passwordGuide);
   }
   container_mc.introduceFd.caption = introMessage;
   container_mc.passwdGuideFd.caption = passwordGuide;
   Selection.setFocus(container_mc.introduceFd);
};
var close_btn = container_mc.txtBtn1.txtBtn;
var apply_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
close_btn.setRelease(ToGame_BFTeamCreation_CloseUI);
apply_btn.setRelease(ToGame_BFTeamCreation_Confirm);
x_btn.setRelease(ToGame_BFTeamCreation_CloseUI);
container_mc.passwdCheck.onChanged = function(_check)
{
   lib.Debuger.trace("passwdCheck");
   lib.Debuger.trace("_check : " + _check);
   if(_check)
   {
      container_mc.passwdFd.type = "input";
      container_mc.passwdFd.maxChars = PASSWRD_MAXLENGTH;
      container_mc.passwdFd.selectable = true;
      container_mc.passwdGuideFd.text = "";
      Selection.setFocus(container_mc.passwdFd);
      apply_btn.setEnabled(false);
      passwdFd.textField.tabEnabled = true;
   }
   else
   {
      var _loc2_ = container_mc.introduceFd.text;
      setApplyState();
      container_mc.passwdFd.selectable = false;
      container_mc.passwdFd.text = passCaution;
      container_mc.passwdFd.textColor = lib.info.TextColor.GENERAL_DISABLE;
      Selection.setFocus(null);
      passwdFd.textField.tabEnabled = false;
   }
};
var introduceFd = new lib.util.ExtTextField(container_mc.introduceFd,0,container_mc.introduceFd_focus);
var passwdFd = new lib.util.ExtTextField(container_mc.passwdFd,0,container_mc.passwdFd_focus);
lib.manager.Focus.addFocusGroup(UIname,1,[introduceFd,passwdFd]);
passwdFd.textField.tabEnabled = false;
introduceFd.onKillFocusEvent = function()
{
   var _loc3_ = this.text;
   var _loc2_ = lib.util.ExtString.trim(_loc3_);
   if(_loc2_ == "" || _loc2_ == undefined || _loc2_ == messageCaution)
   {
      this.text = messageCaution;
      this.textField.textColor = lib.info.TextColor.GENERAL_DISABLE;
      setApplyState();
   }
};
introduceFd.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc1_ = NameTextLength_Local;
   }
   else
   {
      _loc1_ = 16;
   }
   lib.util.StrByteLen.getLenth3(container_mc.introduceFd,_loc1_);
   lib.Debuger.trace("NameTextLength_Local : " + NameTextLength_Local);
   setApplyState();
};
introduceFd.onEnterKey = function()
{
   if(apply_btn.btn.enabled)
   {
      ToGame_BFTeamCreation_Confirm();
   }
};
passwdFd.onChanged = function()
{
   setApplyState();
};
passwdFd.onSetFocusEvent = function()
{
   setApplyState();
};
passwdFd.onKillFocusEvent = function()
{
   str = this.text;
   if(str == "" || str == undefined)
   {
      container_mc.passwdGuideFd.text = passCaution;
      this.textField.textColor = lib.info.TextColor.GENERAL_DISABLE;
   }
};
passwdFd.onEnterKey = function()
{
   if(apply_btn.btn.enabled)
   {
      ToGame_BFTeamCreation_Confirm();
   }
};
myListener.OnGame_BFTeamCreation_LengthLocal = function(lengthnum)
{
   lib.Debuger.trace("OnGame_BFTeamCreation_LengthLocal : " + lengthnum);
   NameTextLength_Local = lengthnum;
};
container_mc.passwdCheck.checked = false;
container_mc.passwdFd.selectable = false;
ToGame_BFTeamCreation_Init();
