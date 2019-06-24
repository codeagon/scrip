function rateButtonLeft()
{
   var _loc1_ = rateNum - rateCount;
   if(_loc1_ <= rateMin)
   {
      _loc1_ = rateMin;
      left_btn.setEnabled(false);
      min_btn.setEnabled(false);
   }
   right_btn.setEnabled(true);
   max_btn.setEnabled(true);
   rateNum = _loc1_;
   slider_mc.setData(rateMin,"",rateMax,"",rateNum);
   ToGame_GuildWindowPopUp_SetRate(rateNum);
}
function rateButtonRight()
{
   var _loc1_ = rateNum + rateCount;
   if(_loc1_ >= rateMax)
   {
      _loc1_ = rateMax;
      right_btn.setEnabled(false);
      max_btn.setEnabled(false);
   }
   left_btn.setEnabled(true);
   min_btn.setEnabled(true);
   rateNum = _loc1_;
   slider_mc.setData(rateMin,"",rateMax,"",rateNum);
   ToGame_GuildWindowPopUp_SetRate(rateNum);
}
function limitLength(txdMc, limitL)
{
   var _loc2_ = txdMc.length;
   var _loc3_ = txdMc.text;
   if(_loc2_ > limitL)
   {
      var _loc4_ = new String(_loc3_);
      var _loc1_ = new String();
      _loc1_ = _loc4_.substr(0,limitL);
      txdMc.text = _loc1_;
   }
}
function ToGame_GuildWindowPopUp_Init()
{
   fscommand("ToGame_GuildWindowPopUp_Init");
}
function ToGame_GuildWindowPopUp_CloseUI()
{
   fscommand("ToGame_GuildWindowPopUp_CloseUI");
}
function ToGame_GuildWindowPopUp_SetRate(num)
{
   getURL("FSCommand:ToGame_GuildWindowPopUp_SetRate",num);
}
function ToGame_GuildWindowPopUp_PayEnter()
{
   fscommand("ToGame_GuildWindowPopUp_PayEnter");
}
function ToGame_GuildWindowPopUp_PayCancel()
{
   fscommand("ToGame_GuildWindowPopUp_PayCancel");
}
function ToGame_GuildWindowPopUp_RegistTargetGuild()
{
   var _loc1_ = container_mc.warMc.targetFd.text;
   if("" == _loc1_ || "undefined" == _loc1_ || undefined == _loc1_)
   {
      lib.Debuger.trace("ToGame_GuildWindowPopUp_RegistTargetGuild return : " + _loc1_);
      return undefined;
   }
   clearGuildWarInfo();
   targetBtn.setEnabled(false);
   lib.Debuger.trace("ToGame_GuildWindowPopUp_RegistTargetGuild : " + _loc1_);
   getURL("FSCommand:ToGame_GuildWindowPopUp_RegistTargetGuild",_loc1_);
}
function ToGame_GuildWindowPopUp_StartGuildWar()
{
   lib.Debuger.trace("ToGame_GuildWindowPopUp_StartGuildWar");
   fscommand("ToGame_GuildWindowPopUp_StartGuildWar");
}
function initGuildWarContainer()
{
   var _loc1_ = container_mc.warMc;
   _loc1_.blueAni._visible = false;
   _loc1_.redAni._visible = false;
   _loc1_.blueAni._x = BLUE_ANI_POS[0];
   _loc1_.redAni._x = 300;
   _loc1_.myName.textAutoSize = "shrink";
   _loc1_.targetName.textAutoSize = "shrink";
}
function clearGuildWarInfo()
{
   var _loc1_ = container_mc.warMc;
   lib.util.DrawBitmap.draw(_loc1_.myIcon,"");
   _loc1_.myName.text = "";
   lib.util.DrawBitmap.draw(_loc1_.targetIcon,"");
   _loc1_.targetName.text = "";
   _loc1_.targetFd.text = "";
   _loc1_.bg.gotoAndStop(0);
   _loc1_.blueAni._visible = false;
   _loc1_.redAni._visible = false;
   targetBtn.setEnabled(false);
   confirmBtn.setEnabled(false);
}
function setGuildWarInfo(myGuildData, targetGuildData)
{
   var _loc3_ = lib.util.ExtString.split(myGuildData,"\t");
   var _loc6_ = _loc3_[0];
   var _loc5_ = _loc3_[1];
   var _loc2_ = lib.util.ExtString.split(targetGuildData,"\t");
   var _loc4_ = _loc2_[0];
   var _loc7_ = _loc2_[1];
   var _loc1_ = container_mc.warMc;
   _loc1_.myName.text = _loc6_;
   lib.util.DrawBitmap.draw(_loc1_.myIcon,_loc5_,GUILD_WAR_IMG_SIZE,GUILD_WAR_IMG_SIZE);
   _loc1_.targetName.text = _loc4_;
   _loc1_.targetFd.text = _loc4_;
   lib.util.DrawBitmap.draw(_loc1_.targetIcon,_loc7_,GUILD_WAR_IMG_SIZE,GUILD_WAR_IMG_SIZE);
   targetBtn.setEnabled(false);
   confirmBtn.setEnabled(true);
}
function setGuildWarGuide(guideStr0, guideStr1)
{
   var _loc1_ = container_mc.warMc.guideMc;
   guideScroll.scroll = 0;
   _loc1_.guideFd_0.htmlText = guideStr0;
   _loc1_.guideFd_1.htmlText = guideStr1;
   var _loc3_ = "" == guideStr0?0:_loc1_.guideFd_0.textHeight + 5;
   var _loc4_ = "" == guideStr1?0:_loc1_.guideFd_1.textHeight + 5;
   var _loc5_ = !("" == guideStr0 || "" == guideStr1)?3:2;
   _loc1_.guideFd_0._height = _loc3_;
   _loc1_.guideFd_1._height = _loc4_;
   var _loc8_ = _loc3_ + _loc4_ + _loc5_ * 5;
   var _loc2_ = 20;
   if(_loc8_ < scrollDisplaySize)
   {
      _loc2_ = (scrollDisplaySize - _loc3_ - _loc4_) / _loc5_;
   }
   _loc1_.guideFd_0._y = _loc2_;
   _loc1_.guideIcon_0._y = _loc2_ + 2;
   _loc1_.guideFd_1._y = "" == guideStr0?_loc2_:_loc2_ * 2 + _loc3_;
   _loc1_.guideIcon_1._y = "" == guideStr1?0:_loc1_.guideFd_1._y + 2;
   _loc1_.hit._height = _loc5_ * _loc2_ + _loc3_ + _loc4_;
   guideScroll.pageSize = _loc1_._height;
   _loc1_.guideIcon_0._visible = "" != guideStr0;
   _loc1_.guideIcon_1._visible = "" != guideStr1;
}
var UI = this;
UI._visible = false;
var UIname = "GuildWindowPopUp";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.rateMc.tipTxt0.htmlText = lib.util.UIString.getUIString("$123243");
container_mc.rateMc.tipTxt1.htmlText = lib.util.UIString.getUIString("$123244");
container_mc.rateMc.tipTxt2.htmlText = lib.util.UIString.getUIString("$123246");
var x_btn = new lib.util.TxtBtn(container_mc.xBtn);
x_btn.setRelease(ToGame_GuildWindowPopUp_CloseUI);
var rateMin = 1;
var rateMax = 99;
var rateNum = 50;
var rateCount = 1;
container_mc.titleTxt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var slider_mc = container_mc.rateMc.slider;
slider_mc.setData(rateMin,rateMin,rateMax,rateMax,rateNum);
slider_mc.valueMc._x = 32;
slider_mc.valueMc._y = -103;
slider_mc.valueMc.bgMc._width = 167;
slider_mc.valueMc.txt._width = 166;
slider_mc.valueMc.txt.textColor = "0xE7C55F";
slider_mc.valueMc.focus_mc._width = 175;
slider_mc.isProtageValue = false;
slider_mc.valueMc.txt.maxChars = 3;
container_mc.rateMc.minTxt.text = rateMin;
container_mc.rateMc.maxTxt.text = rateMax;
var left_btn = new lib.util.TxtBtn(container_mc.rateMc.left_mc);
var right_btn = new lib.util.TxtBtn(container_mc.rateMc.right_mc);
left_btn.setRelease(rateButtonLeft);
right_btn.setRelease(rateButtonRight);
slider_mc.onChanged = function(num)
{
   rateNum = num;
   ToGame_GuildWindowPopUp_SetRate(rateNum);
   if(num >= rateMax)
   {
      left_btn.setEnabled(true);
      right_btn.setEnabled(false);
      right_btn.gotoAndStop(4);
   }
   else if(num <= rateMin)
   {
      right_btn.setEnabled(true);
      left_btn.setEnabled(false);
      left_btn.gotoAndStop(4);
   }
   else
   {
      right_btn.setEnabled(true);
      left_btn.setEnabled(true);
   }
};
var click_btn = container_mc.rateMc.clickBtn.txtBtn;
click_btn.setRelease(ToGame_GuildWindowPopUp_PayEnter);
var cancel_btn = container_mc.rateMc.cancelBtn.txtBtn;
cancel_btn.setRelease(ToGame_GuildWindowPopUp_PayCancel);
var BLUE_ANI_POS = [278,155];
var GUILD_WAR_IMG_SIZE = 46;
var GUILD_WAR_TARGET_DEFAULT_STR = lib.util.UIString.getUIString("$127004");
var targetGuildNameLimitedLengthLocal = 30;
var scrollDisplaySize = container_mc.warMc.guideMaskMc._height;
var guidePosY = container_mc.warMc.guideMc._y;
var guideScroll = container_mc.warMc.guideScroll;
guideScroll.addListener(container_mc.warMc.guideMc);
container_mc.warMc.guideMc.onScroll = function()
{
   container_mc.warMc.guideMc._y = guidePosY - arguments[0];
};
guideScroll.setWheel(container_mc.warMc.guideMc);
guideScroll.wheelDelta = 1;
guideScroll.pageSize = 0;
guideScroll.displaySize = scrollDisplaySize;
guideScroll.defaultBarSizeRatio = 0.3333333333333333;
guideScroll.rowHeight = 30;
guideScroll.scroll = 0;
var targetBtn = container_mc.warMc.targetBtn.txtBtn;
targetBtn.setRelease(ToGame_GuildWindowPopUp_RegistTargetGuild);
targetBtn.setEnabled(false);
var confirmBtn = container_mc.warMc.confirmBtn.txtBtn;
confirmBtn.setRelease(ToGame_GuildWindowPopUp_StartGuildWar);
confirmBtn.setEnabled(false);
var targetFd = new lib.util.ExtTextField(container_mc.warMc.targetFd,0,container_mc.warMc.targetFocus);
targetFd.onEnterKey = function()
{
   Selection.setFocus(null);
};
targetFd.onChanged = function()
{
   limitLength(container_mc.warMc.targetFd,targetGuildNameLimitedLengthLocal);
   var _loc2_ = this.text;
   if("" == _loc2_ || undefined == _loc2_ || "undefined" == _loc2_)
   {
      targetBtn.setEnabled(false);
   }
   else
   {
      targetBtn.setEnabled(true);
   }
};
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(_bShow)
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
var UiMode = 0;
myListener.OnGame_GuildWindowPopUp_SetMode = function(modeType, titleStr)
{
   UiMode = modeType;
   container_mc.titleTxt.text = titleStr;
   container_mc.warMc._visible = "0" == modeType;
   container_mc.rateMc._visible = "1" == modeType;
   container_mc.gotoAndStop(Number(modeType) + 1);
   slider_mc.valueMc.txt.selectable = true;
   slider_mc.valueMc.focus_mc.firstFocus = slider_mc.valueMc.txt;
   Selection.setFocus(slider_mc.valueMc.txt);
};
myListener.OnGame_GuildWindowPopUp_SetRate = function(count0, count1)
{
   container_mc.rateMc.goldTxt0.text = count0;
   container_mc.rateMc.goldTxt1.text = count1;
};
myListener.OnGame_GuildWindowPopUp_SetGuildMoney = function(count)
{
   container_mc.rateMc.goldTxt2.text = count;
};
myListener.OnGame_GuildWindowPopUp_SetScope = function(num, min, max)
{
   rateMin = min;
   rateMax = max;
   slider_mc.setData(rateMin,"",rateMax,"",num);
   container_mc.rateMc.minTxt.text = min + "%";
   container_mc.rateMc.maxTxt.text = max + "%";
};
myListener.OnGame_GuildWindowPopUp_SetGuildWarInfo = function(myData, targetData, warType)
{
   clearGuildWarInfo();
   var _loc1_ = container_mc.warMc;
   warType = Number(warType);
   var _loc3_ = warType + 2;
   _loc1_.bg.gotoAndStop(_loc3_);
   _loc1_.blueAni._x = BLUE_ANI_POS[warType];
   setGuildWarInfo(myData,targetData);
   _loc1_.blueAni._visible = true;
   _loc1_.redAni._visible = warType == 1;
};
myListener.OnGame_GuildWindowPopUp_SetGuildWarCost = function(cost, bWar)
{
   var _loc1_ = container_mc.warMc;
   _loc1_.costFd.text = cost;
};
myListener.OnGame_GuildWindowPopUp_SetGuildWarGuide = function(guideStr0, guideStr1)
{
   guideStr0 = !("undefined" == guideStr0 || undefined == guideStr0)?guideStr0:"";
   guideStr1 = !("undefined" == guideStr1 || undefined == guideStr1)?guideStr1:"";
   setGuildWarGuide(guideStr0,guideStr1);
};
var guildWarGuideStr0 = lib.util.UIString.getUIString("$127024");
var guildWarGuideStr1 = lib.util.UIString.getUIString("$127025");
setGuildWarGuide(guildWarGuideStr0,guildWarGuideStr1);
initGuildWarContainer();
ToGame_GuildWindowPopUp_Init();
