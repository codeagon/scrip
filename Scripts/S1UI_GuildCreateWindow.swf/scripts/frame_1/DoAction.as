function ToGame_GuildCreateWindow_Init()
{
   fscommand("ToGame_GuildCreateWindow_Init");
   lib.Debuger.trace("ToGame_GuildCreateWindow_Init");
}
function ToGame_GuildCreateWindow_Close()
{
   fscommand("ToGame_GuildCreateWindow_Close");
   lib.Debuger.trace("ToGame_GuildCreateWindow_Close");
}
function ToGameRequestGuildCreate(guildName)
{
   getURL("FSCommand:ToGameRequestGuildCreate",guildName);
   lib.Debuger.trace("ToGameRequestGuildCreate:" + guildName);
}
function ToGameCheckGuildName(guildName)
{
   guildName = lib.util.ExtString.trim(guildName);
   if(inputNameCaption == guildName || guildName == "")
   {
      return undefined;
   }
   myListener.OnGameEventGuildNameCheckResult(true,guildName);
   getURL("FSCommand:ToGameCheckGuildName",guildName);
   lib.Debuger.trace("ToGameCheckGuildName:" + guildName);
}
function sendData()
{
   var _loc1_ = container_mc.text_GuildName.text;
   ToGameRequestGuildCreate(_loc1_);
}
function closeUI()
{
   ToGame_GuildCreateWindow_Close();
}
function checkName()
{
   var _loc1_ = container_mc.text_GuildName.text;
   ToGameCheckGuildName(_loc1_);
}
var UI = this;
UI._visible = false;
var UIname = "guildcreatewindow";
_global.gfxExtensions = true;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
this.bWindowOpen = false;
this.bFocused = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.notice_txt.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.guideFd0.verticalAlign = "bottom";
container_mc.guideFd1.verticalAlign = "center";
container_mc.conditionFd0.verticalAlign = "center";
container_mc.conditionFd1.verticalAlign = "center";
container_mc.conditionFd2.verticalAlign = "center";
container_mc.text_Guild2.verticalAlign = "bottom";
var inputNameCaption = container_mc.text_GuildName.text;
var guildName = "";
var LEVEL_STR = lib.util.UIString.getUIString("$121009");
var LEVELNEED_STR = lib.util.UIString.getUIString("$121010");
var GOLD_STR1 = lib.util.UIString.getUIString("$121016");
var GOLD_STR2 = lib.util.UIString.getUIString("$121017");
var GOLDNEED_STR = lib.util.UIString.getUIString("$121012");
var PARTY_STR = lib.util.UIString.getUIString("$121013");
var PARTYNEED_STR = lib.util.UIString.getUIString("$121014");
var ACTIVECOLOR = lib.info.TextColor.GENERAL_EMPHASIS.toString(16);
var DEACTIVECOLOR = lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16);
container_mc.guideFd.verticalAlign = "center";
var NameTextLength_Local = 0;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
   bFocused = false;
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWindowOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
myListener.OnGame_GuildCreateWindow_UpdateCondition = function(bLevel, bGold, bParty)
{
   bLevel = Number(bLevel);
   bGold = Number(bGold);
   bParty = Number(bParty);
   if(bLevel)
   {
      container_mc.conditionFd0.htmlText = "<font color=\'#" + ACTIVECOLOR + "\'>" + LEVEL_STR + "</font>" + "  <img src=\'icon_conditionCheck_ok\' vspace=\'-6\'>";
   }
   else
   {
      container_mc.conditionFd0.htmlText = "<font color=\'#" + DEACTIVECOLOR + "\'>" + LEVEL_STR + "</font>" + "  <img src=\'icon_conditionCheck_no\' vspace=\'-6\'>";
   }
   if(bGold)
   {
      var _loc5_ = lib.util.GoldCurrency.SetGoldText(GOLD_STR2);
      container_mc.conditionFd1.htmlText = "<font color=\'#" + ACTIVECOLOR + "\'>" + GOLD_STR1 + " " + _loc5_ + "</font>" + "  <img src=\'icon_conditionCheck_ok\' vspace=\'-6\'>";
   }
   else
   {
      _loc5_ = lib.util.GoldCurrency.SetGoldText(GOLD_STR2);
      container_mc.conditionFd1.htmlText = "<font color=\'#" + DEACTIVECOLOR + "\'>" + GOLD_STR1 + " " + _loc5_ + "</font>" + "  <img src=\'icon_conditionCheck_no\' vspace=\'-6\'>";
   }
   lib.Debuger.trace("GOLD_STR : " + GOLD_STR);
   if(bParty)
   {
      container_mc.conditionFd2.htmlText = "<font color=\'#" + ACTIVECOLOR + "\'>" + PARTY_STR + "</font>" + "  <img src=\'icon_conditionCheck_ok\' vspace=\'-6\'>";
   }
   else
   {
      container_mc.conditionFd2.htmlText = "<font color=\'#" + DEACTIVECOLOR + "\'>" + PARTY_STR + "</font>" + "  <img src=\'icon_conditionCheck_no\' vspace=\'-6\'>";
   }
   var _loc1_ = Boolean(Number(bLevel)) && Boolean(Number(bGold)) && Boolean(Number(bParty));
   container_mc.text_GuildName.selectable = _loc1_;
   if(_loc1_)
   {
      Selection.setFocus(container_mc.text_GuildName);
   }
};
var send_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
send_btn.setEnabled(false);
send_btn.setRelease(sendData);
x_btn.setRelease(closeUI);
var guildNameFd = new lib.util.ExtTextField(container_mc.text_GuildName,0,container_mc.text_GuildName_focus);
container_mc.text_GuildName.data = container_mc.text_GuildName.text;
container_mc.text_GuildName.change = false;
guildNameFd.onChanged = function()
{
   if(lib.util.ExtString.trim(this.text) == "" || this.text == undefined)
   {
      this.text = "";
   }
   this.textField.change = this.text != "";
   send_btn.setEnabled(this.textField.change);
   var _loc2_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc2_ = NameTextLength_Local;
   }
   else
   {
      _loc2_ = 30;
   }
   lib.util.StrByteLen.getLenth3(container_mc.text_GuildName,_loc2_);
   lib.Debuger.trace("NameTextLength_Local : " + NameTextLength_Local);
};
guildNameFd.onEnterKey = function()
{
   if(send_btn.btn.enabled)
   {
      sendData();
   }
};
myListener.OnGame_GuildCreateWindow_LengthLocal = function(lengthnum)
{
   lib.Debuger.trace("OnGame_GuildCreateWindow_LengthLocal : " + lengthnum);
   NameTextLength_Local = Number(lengthnum);
};
myListener.OnGame_GuildCreateWindow_UpdateCondition(0,0,0);
ToGame_GuildCreateWindow_Init();
