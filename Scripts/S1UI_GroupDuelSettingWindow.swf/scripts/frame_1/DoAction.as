function ToGame_GroupDuelSettingWindow_Init()
{
   lib.Debuger.trace("ToGame_GroupDuelSettingWindow_Init");
   fscommand("ToGame_GroupDuelSettingWindow_Init");
}
function ToGame_GroupDuelSettingWindow_CloseUI()
{
   lib.Debuger.trace("ToGame_GroupDuelSettingWindow_CloseUI");
   fscommand("ToGame_GroupDuelSettingWindow_CloseUI");
}
function ToGame_GroupDuelSettingWindow_SettingData()
{
   Selection.setFocus(null);
   var _loc1_ = lib.util.ExtString.trim(container_mc.inputTxt.text);
   var _loc2_ = container_mc.combobox01.selectedIndex;
   var _loc3_ = container_mc.combobox02.selectedIndex;
   lib.Debuger.trace("ToGame_GroupDuelSettingWindow_SettingData  " + _loc1_ + "  " + _loc2_ + "  " + _loc3_);
   getURL("FSCommand:ToGame_GroupDuelSettingWindow_SettingData",_loc1_ + "\t" + _loc2_ + "\t" + _loc3_);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "GroupDuelSettingWindow";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.guidFd.verticalAlign = "bottom";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   lib.Debuger.trace("GroupDuelSettingWindow  ");
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
var windata = [lib.util.UIString.getUIString("$172006"),lib.util.UIString.getUIString("$172007"),lib.util.UIString.getUIString("$172008"),lib.util.UIString.getUIString("$172009"),lib.util.UIString.getUIString("$172010"),lib.util.UIString.getUIString("$172011"),lib.util.UIString.getUIString("$172012"),lib.util.UIString.getUIString("$172013"),lib.util.UIString.getUIString("$172014"),lib.util.UIString.getUIString("$172015"),lib.util.UIString.getUIString("$172016")];
var joindata = [lib.util.UIString.getUIString("$172017"),lib.util.UIString.getUIString("$172018")];
var caption = container_mc.inputTxt.text;
var NameTextLength_Local = 0;
myListener.OnGame_GroupDuelSettingWindow_SetSettingData = function(propagandaMsg, index, enableToJoin)
{
   input_txt.text = propagandaMsg;
   if(Selection.getFocus() == container_mc.inputTxt)
   {
      Selection.setSelection(0,container_mc.inputTxt.text.length);
   }
   container_mc.combobox01.selectedIndex = Number(index);
   container_mc.combobox02.selectedIndex = Number(enableToJoin);
};
var close_btn = container_mc.txtBtn1.txtBtn;
var apply_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
close_btn.setRelease(ToGame_GroupDuelSettingWindow_CloseUI);
apply_btn.setRelease(ToGame_GroupDuelSettingWindow_SettingData);
x_btn.setRelease(ToGame_GroupDuelSettingWindow_CloseUI);
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
      _loc2_ = 100;
   }
   lib.util.StrByteLen.getLenth3(container_mc.inputTxt,_loc2_);
   lib.Debuger.trace("NameTextLength_Local : " + NameTextLength_Local);
};
input_txt.onEnterKey = function()
{
   if(this.text != "")
   {
      ToGame_GroupDuelSettingWindow_SettingData();
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
container_mc.combobox01.data = windata;
container_mc.combobox02.data = joindata;
myListener.OnGame_GroupDuelSettingWindow_LengthLocal = function(lengthnum)
{
   lib.Debuger.trace("OnGame_GroupDuelSettingWindow_LengthLocal : " + lengthnum);
   NameTextLength_Local = lengthnum;
};
setText();
container_mc.combobox01.selectedIndex = 0;
container_mc.combobox02.selectedIndex = 1;
ToGame_GroupDuelSettingWindow_Init();
