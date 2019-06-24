function ToGame_LobbyEventPopUp_Init()
{
   fscommand("ToGame_LobbyEventPopUp_Init");
}
function ToGame_LobbyEventPopUp_CloseUI()
{
   fscommand("ToGame_LobbyEventPopUp_CloseUI");
}
function ToGame_LobbyEventPopUp_ClickEventButton(id)
{
   var _loc1_ = container_mc.inputTF.text;
   lib.Debuger.trace("ToGame_LobbyEventPopUp_ClickEventButton : " + id + ", " + _loc1_);
   getURL("FSCommand:ToGame_LobbyEventPopUp_ClickEventButton",id + "\t" + _loc1_);
}
function initEventPopup()
{
   container_mc.descTF.verticalAlign = "center";
   container_mc.infoTF.verticalAlign = "center";
   container_mc.button_0.btn.onRelease2 = container_mc.button_1.btn.onRelease2 = function()
   {
      var _loc2_ = this._parent.id;
      ToGame_LobbyEventPopUp_ClickEventButton(_loc2_);
   };
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "LobbyEventPopUp";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var eventInputTF = new lib.util.ExtTextField(container_mc.inputTF,0,container_mc.inputTF_focus);
var eventButton_0 = container_mc.button_0.txtBtn;
var eventButton_1 = container_mc.button_1.txtBtn;
var eventInputLimitLen = 0;
var s_DefaultName = lib.util.UIString.getUIString("$013051");
eventInputTF.caption = s_DefaultName;
eventInputTF.onChanged = function(changed)
{
   lib.util.StrByteLen.getLenth3(container_mc.inputTF,eventInputLimitLen);
};
eventInputTF.onEnterKey = function()
{
   Selection.setFocus(null);
};
eventInputTF.onKillFocusEvent = function()
{
};
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
myListener.OnGame_LobbyEventPopUp_SetEventPopup = function(type, titleStr, descStr, infoStr, dateStr, limitLen, buttonData)
{
   var _loc10_ = Number(type) + 1;
   container_mc.gotoAndStop(_loc10_);
   container_mc.infoTF.textColor = "0xA5E0FF";
   eventInputTF.maxschar = eventInputLimitLen = Number(limitLen);
   container_mc.titleTF.text = titleStr;
   container_mc.descTF.htmlText = descStr;
   container_mc.infoTF.htmlText = infoStr;
   container_mc.dateTF.htmlText = "";
   var _loc8_ = lib.util.ExtString.split(buttonData,"\n");
   var _loc9_ = _loc8_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc9_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc8_[_loc1_],"\t");
      var _loc7_ = _loc2_[0];
      var _loc6_ = _loc2_[1];
      var _loc5_ = _loc2_[2];
      var _loc3_ = container_mc["button_" + _loc1_];
      var _loc4_ = _loc3_.txtBtn;
      _loc3_.id = _loc7_;
      _loc4_.setEnabled(_loc5_);
      _loc4_.setText(_loc6_);
      _loc1_ = _loc1_ + 1;
   }
   Selection.setFocus(container_mc.inputTF);
};
myListener.OnGame_LobbyEventPopUp_SetEventPopupErrorMessage = function(errorStr)
{
   container_mc.infoTF.htmlText = errorStr;
   container_mc.infoTF.textColor = "0x990000";
};
initEventPopup();
ToGame_LobbyEventPopUp_Init();
