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
   ToGame_GuildWarDecared_SetRate(rateNum);
   slider_mc.valueMc.txt;
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
   ToGame_GuildWarDecared_SetRate(rateNum);
}
function ToGame_GuildWarDecared_Init()
{
   fscommand("ToGame_GuildWarDecared_Init");
}
function ToGame_GuildWarDecared_CloseUI()
{
   fscommand("ToGame_GuildWarDecared_CloseUI");
}
function ToGame_GuildWarDecared_SetRate(num)
{
   lib.Debuger.trace("ToGame_GuildWarDecared_SetRate " + num);
   getURL("FSCommand:ToGame_GuildWarDecared_SetRate",num);
}
function ToGame_GuildWarDecared_PayEnter()
{
   lib.Debuger.trace("ToGame_GuildWarDecared_PayEnter ");
   fscommand("ToGame_GuildWarDecared_PayEnter");
}
function ToGame_GuildWarDecared_PayCancel()
{
   lib.Debuger.trace("ToGame_GuildWarDecared_PayCancel ");
   fscommand("ToGame_GuildWarDecared_PayCancel");
}
var UI = this;
UI._visible = false;
var UIname = "GuildWarDecared";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.tit_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var x_btn = new lib.util.TxtBtn(container_mc.xBtn);
x_btn.setRelease(ToGame_GuildWarDecared_CloseUI);
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
   ToGame_GuildWarDecared_rate(rateNum);
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
click_btn.setRelease(ToGame_GuildWarDecared_PayEnter);
var cancel_btn = container_mc.rateMc.cancelBtn.txtBtn;
cancel_btn.setRelease(ToGame_GuildWarDecared_PayCancel);
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
myListener.OnGame_GuildWarDecared_SetMode = function(modeType, titleStr)
{
   UiMode = modeType;
   container_mc.titleTxt.text = titleStr;
   container_mc.decaredMc._visible = "0" == modeType;
   container_mc.rateMc._visible = "1" == modeType;
   container_mc.gotoAndStop(Number(modeType) + 1);
   Selection.setFocus(slider_mc.valueMc.txt.textField);
};
myListener.OnGame_GuildWarDecared_SetRate = function(count0, count1)
{
   container_mc.rateMc.goldTxt0.text = count0;
   container_mc.rateMc.coinMc0._x = 271 + container_mc.rateMc.goldTxt0.textWidth / 2;
   container_mc.rateMc.goldTxt1.text = count1;
   container_mc.rateMc.coinMc1._x = 271 + container_mc.rateMc.goldTxt1.textWidth / 2;
};
myListener.OnGame_GuildWarDecared_SetGuildMoney = function(count)
{
   container_mc.rateMc.goldTxt2.text = count;
   container_mc.rateMc.coinMc2._x = 271 + container_mc.rateMc.goldTxt2.textWidth / 2;
};
ToGame_GuildWarDecared_Init();
