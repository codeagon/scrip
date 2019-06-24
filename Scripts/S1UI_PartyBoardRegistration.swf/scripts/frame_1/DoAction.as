function ToGame_PartyBoardRegistration_Init()
{
   lib.Debuger.trace("ToGame_PartyBoardRegistration_Init");
   fscommand("ToGame_PartyBoardRegistration_Init");
}
function ToGame_PartyBoardRegistration_CloseUI()
{
   lib.Debuger.trace("ToGame_PartyBoardRegistration_CloseUI");
   fscommand("ToGame_PartyBoardRegistration_CloseUI");
}
function ToGame_PartyBoardRegistration_Confirm()
{
   Selection.setFocus(null);
   getURL("FSCommand:ToGame_PartyBoardRegistration_Confirm",input_txt.text);
   trace("ToGame_PartyBoardRegistration_Confirm: " + input_txt.text);
}
function ToGame_PartyBoardRegistration_PartyWindowRaidSetCheck(flag)
{
   lib.Debuger.trace("ToGame_PartyBoardRegistration_PartyWindowRaidSetCheck : " + flag);
   getURL("FSCommand:ToGame_PartyBoardRegistration_PartyWindowRaidSetCheck",flag);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "PartyBoardRegistration";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.guideFd.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.guideFd.verticalAlign = "center";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
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
var selectedCamp = null;
myListener.OnGame_PartyBoardRegistration_SetCampList = function(dataList, defaultId)
{
   var _loc3_ = dataList.split("\n");
   if(_loc3_[_loc3_.length - 1] == "0" || _loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.splice(_loc3_.length - 1,1);
   }
   var _loc6_ = [];
   var _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      var _loc2_ = _loc3_[_loc1_].split("\t");
      _loc6_[_loc1_] = {id:_loc2_[0],label:_loc2_[1]};
      _loc1_ = _loc1_ + 1;
   }
   defaultId = Number(defaultId);
   container_mc.combobox01.defaultSelect = defaultId;
   container_mc.combobox01.data = _loc6_;
   selectedCamp = defaultId;
   var _loc8_ = {};
   _loc8_.onChanged = function(target, id, index)
   {
      container_mc.combobox01.defV = id;
      selectedCamp = id;
   };
   container_mc.combobox01.addListener(_loc8_);
};
myListener.OnGame_PartyBoardRegistration_SetInputText = function(msg)
{
   input_txt.text = msg;
   if(Selection.getFocus() == container_mc.inputTxt)
   {
      Selection.setSelection(0,container_mc.inputTxt.text.length);
   }
};
myListener.OnGame_PartyBoardRegistration_PartyWindowRaidSetCheck = function(flag)
{
   lib.Debuger.trace("OnGame_PartyBoardRegistration_SetCheck");
   container_mc.checkBtn.checked = Boolean(Number(flag));
};
myListener.OnGame_PartyBoardRegistration_PartyWindowRaidSetEnabledCheck = function(flag)
{
   lib.Debuger.trace("OnGame_PartyBoardRegistration_PartyWindowRaidSetEnabledCheck");
   container_mc.checkBtn.setEnabled(Boolean(flag));
   container_mc.check_txt.textColor = !Boolean(flag)?lib.info.TextColor.GENERAL_DISABLE:14145495;
};
var close_btn = container_mc.txtBtn1.txtBtn;
var apply_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
close_btn.setRelease(ToGame_PartyBoardRegistration_CloseUI);
apply_btn.setRelease(ToGame_PartyBoardRegistration_Confirm);
x_btn.setRelease(ToGame_PartyBoardRegistration_CloseUI);
container_mc.checkBtn.onChanged = function(changed)
{
   ToGame_PartyBoardRegistration_PartyWindowRaidSetCheck(Number(this.checked));
};
var input_txt = new lib.util.ExtTextField(container_mc.inputTxt,0,container_mc.inputTxt_focus);
input_txt.caption = container_mc.inputTxt.text;
input_txt.onChanged = function()
{
   if(this.text != "")
   {
      apply_btn.setEnabled(true);
   }
   else
   {
      apply_btn.setEnabled(false);
   }
   var _loc2_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc2_ = NameTextLength_Local;
   }
   else
   {
      _loc2_ = 60;
   }
   lib.util.StrByteLen.getLenth3(container_mc.inputTxt,_loc2_);
   lib.Debuger.trace("NameTextLength_Local : " + NameTextLength_Local);
};
input_txt.onEnterKey = function()
{
   if(this.text != "")
   {
      ToGame_PartyBoardRegistration_Confirm();
   }
};
container_mc.x_mc.onEnterFrame = function()
{
   if(input_txt.textField != undefined)
   {
      Selection.setFocus(input_txt.textField);
      delete this.onEnterFrame;
   }
};
myListener.OnGame_PartyBoardRegistration_LengthLocal = function(lengthnum)
{
   lib.Debuger.trace("OnGame_PartyBoardRegistration_LengthLocal : " + lengthnum);
   NameTextLength_Local = lengthnum;
};
ToGame_PartyBoardRegistration_Init();
