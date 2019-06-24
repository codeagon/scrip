function ToGame_SkillWindowPopUp_Init()
{
   fscommand("ToGame_SkillWindowPopUp_Init");
}
function ToGame_SkillWindowPopUp_Enter()
{
   ToGame_SkillWindowPopUp_Select(1);
   ToGame_SkillWindowPopUp_Input(container_mc.inputFd1.text);
   ToGame_SkillWindowPopUp_Select(2);
   ToGame_SkillWindowPopUp_Input(container_mc.inputFd2.text);
   ToGame_SkillWindowPopUp_Select(3);
   ToGame_SkillWindowPopUp_Input(container_mc.inputFd3.text);
   ToGame_SkillWindowPopUp_Select(4);
   ToGame_SkillWindowPopUp_Input(container_mc.inputFd4.text);
   fscommand("ToGame_SkillWindowPopUp_CloseUI");
}
function ToGame_SkillWindowPopUp_CloseUI()
{
   fscommand("ToGame_SkillWindowPopUp_CloseUI");
}
function ToGame_SkillWindowPopUp_Select(index)
{
   getURL("FSCommand:ToGame_SkillWindowPopUp_Select",index);
}
function ToGame_SkillWindowPopUp_Input(str)
{
   getURL("FSCommand:ToGame_SkillWindowPopUp_Input",str);
}
function drawSlot(_tgMc, _id, _img)
{
   lib.manager.ToolTip.add(_tgMc,_id,6);
   lib.display.DrawBitmapData.draw(_tgMc,_img,0,0,0,0,64,64,1);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "SkillWindowPopUp";
container_mc.UIDrager.setData(UIName,UI);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var btnSound = lib.manager.UISound.MAIN_BTN;
container_mc.inputFd1.verticalAlign = "center";
container_mc.inputFd2.verticalAlign = "center";
container_mc.inputFd3.verticalAlign = "center";
container_mc.inputFd4.verticalAlign = "center";
var textFieldMc1 = new lib.util.ExtTextField(container_mc.inputFd1,0,container_mc.inputFd_focus1);
var textFieldMc2 = new lib.util.ExtTextField(container_mc.inputFd2,0,container_mc.inputFd_focus2);
var textFieldMc3 = new lib.util.ExtTextField(container_mc.inputFd3,0,container_mc.inputFd_focus3);
var textFieldMc4 = new lib.util.ExtTextField(container_mc.inputFd4,0,container_mc.inputFd_focus4);
textFieldMc1.caption = lib.util.UIString.getUIString("$083015");
textFieldMc2.caption = lib.util.UIString.getUIString("$083016");
textFieldMc3.caption = lib.util.UIString.getUIString("$083017");
textFieldMc4.caption = lib.util.UIString.getUIString("$083018");
var InputLen = 80;
textFieldMc1.onEnterKey = function()
{
   Selection.setFocus(null);
};
textFieldMc2.onEnterKey = function()
{
   Selection.setFocus(null);
};
textFieldMc3.onEnterKey = function()
{
   Selection.setFocus(null);
};
textFieldMc4.onEnterKey = function()
{
   Selection.setFocus(null);
};
textFieldMc1.onChanged = function()
{
   lib.util.StrByteLen.getLenth3(container_mc.inputFd1,InputLen);
};
textFieldMc2.onChanged = function()
{
   lib.util.StrByteLen.getLenth3(container_mc.inputFd2,InputLen);
};
textFieldMc3.onChanged = function()
{
   lib.util.StrByteLen.getLenth3(container_mc.inputFd3,InputLen);
};
textFieldMc4.onChanged = function()
{
   lib.util.StrByteLen.getLenth3(container_mc.inputFd4,InputLen);
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_SkillWindowPopUp_CloseUI);
var enter_btn = container_mc.txtBtn0.txtBtn;
enter_btn.setRelease(ToGame_SkillWindowPopUp_Enter);
var cancle_btn = container_mc.txtBtn1.txtBtn;
cancle_btn.setRelease(ToGame_SkillWindowPopUp_CloseUI);
container_mc.tipText.verticalAlign = "center";
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
myListener.OnGame_SkillWindowPopUp_SetTitle = function(str)
{
   container_mc.titleTxt.htmlText = str;
};
myListener.OnGame_SkillWindowPopUp_Skill = function(_data)
{
   var _loc1_ = lib.util.ExtString.split(_data,"\t");
   drawSlot(container_mc.itemSlot,_loc1_[0],_loc1_[1]);
   container_mc.nameTxt.text = _loc1_[2];
   container_mc.txt0.text = _loc1_[3];
   container_mc.txt1.text = _loc1_[4];
};
var focusSkill = 1;
myListener.OnGame_SkillWindowPopUp_InitSelect = function(index)
{
   focusSkill = index;
};
myListener.OnGame_SkillWindowPopUp_SetData = function(_data)
{
   container_mc["inputFd" + focusSkill].text = _data;
};
myListener.OnGame_SkillWindowPopUp_Tip = function(str)
{
   container_mc.tipText.htmlText = str;
};
var pressed = null;
ToGame_SkillWindowPopUp_Init();
