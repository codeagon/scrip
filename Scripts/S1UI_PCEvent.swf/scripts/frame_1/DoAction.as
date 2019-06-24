function setButton()
{
   var _loc1_ = 0;
   _loc1_ = 0;
   while(_loc1_ < btnLen)
   {
      var _loc2_ = new lib.util.TxtBtn(container_mc["btn" + _loc1_],container_mc["txt" + _loc1_]);
      _loc2_.setTextColor("0xFFFFFF","0xFFFFFF","0xFFFFFF",lib.info.TextColor.BTN_UINIQUE_DISABLE);
      setEvent(_loc2_,_loc1_);
      container_mc["txt" + _loc1_].textColor = "0xFFFFFF";
      btnArr.push(_loc2_);
      _loc1_ = _loc1_ + 1;
   }
}
function setEvent(mc, idx)
{
   mc.setRelease(function()
   {
      ToGame_AccountBenefitPromotion_ClickButton(idx);
   }
   );
}
function ToGame_AccountBenefitPromotion_ClickButton(idx)
{
   getURL("FSCommand:ToGame_AccountBenefitPromotion_ClickButton",idx);
}
function ToGame_AccountBenefitPromotion_Close()
{
   fscommand("ToGame_AccountBenefitPromotion_Close");
}
function ToGame_AccountBenefitPromotion_Init()
{
   fscommand("ToGame_AccountBenefitPromotion_Init");
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "PcEvent";
container_mc.UIDrager.setData(UIName,UI);
container_mc.titleFd.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var TIME_STR0 = lib.util.UIString.getUIString("$012060");
var TIME_STR1 = lib.util.UIString.getUIString("$012061");
var TIME_STR2 = lib.util.UIString.getUIString("$012062");
container_mc.topMc.hitTestDisable = true;
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
var btnLen = 12;
var btnArr = [];
var xBtn = new lib.util.TxtBtn(container_mc.xmc);
xBtn.setRelease(ToGame_AccountBenefitPromotion_Close);
myListener.OnGame_AccountBenefitPromotion_SetTitle = function(txt)
{
   container_mc.titleTxt.text = txt;
};
myListener.OnGame_AccountBenefitPromotion_SetTodayTime = function(nextTime, accTime, percent)
{
   container_mc.timeTxt0.htmlText = TIME_STR0 + accTime;
   container_mc.timeTxt2.htmlText = TIME_STR1 + nextTime;
   container_mc.timeTxt2._x = container_mc.timeTxt0.textWidth + 30;
};
myListener.OnGame_AccountBenefitPromotion_SetTotalTime = function(nextTime, accTime, percent)
{
   container_mc.timeTxt1.htmlText = TIME_STR2 + accTime;
   container_mc.timeTxt3.htmlText = TIME_STR1 + nextTime;
   container_mc.timeTxt3._x = container_mc.timeTxt1.textWidth + 30;
};
myListener.OnGame_AccountBenefitPromotion_SetTodayComplete = function(str, count)
{
   var _loc1_ = container_mc.gage0;
   _loc1_.gotoAndStop(Number(count));
   var _loc2_ = lib.util.ExtString.split(str,"\t");
   _loc1_.txt0.text = _loc2_[0];
   _loc1_.txt1.text = _loc2_[1];
   _loc1_.txt2.text = _loc2_[2];
   _loc1_.txt3.text = _loc2_[3];
   _loc1_.txt4.text = _loc2_[4];
   _loc1_.txt5.text = _loc2_[5];
};
myListener.OnGame_AccountBenefitPromotion_SetTotalComplete = function(str, count)
{
   var _loc1_ = container_mc.gage1;
   _loc1_.gotoAndStop(Number(count));
   var _loc2_ = lib.util.ExtString.split(str,"\t");
   _loc1_.txt0.text = _loc2_[0];
   _loc1_.txt1.text = _loc2_[1];
   _loc1_.txt2.text = _loc2_[2];
   _loc1_.txt3.text = _loc2_[3];
   _loc1_.txt4.text = _loc2_[4];
   _loc1_.txt5.text = _loc2_[5];
};
myListener.OnGame_AccountBenefitPromotion_SetButton = function(index, type, txt)
{
   var _loc1_ = btnArr[index];
   if(type == "1")
   {
      _loc1_.setEnabled(true);
      if(txt)
      {
         _loc1_.setText(txt);
      }
      else
      {
         _loc1_.setText("$012063");
      }
   }
   else if(type == "0")
   {
      _loc1_.setEnabled(false);
      if(txt)
      {
         _loc1_.setText(txt);
      }
      else
      {
         _loc1_.setText("$012064");
      }
   }
   else
   {
      _loc1_.setEnabled(false);
      if(txt)
      {
         _loc1_.setText(txt);
      }
      else
      {
         _loc1_.setText("$012065");
      }
   }
};
myListener.OnGame_AccountBenefitPromotion_SetItem = function(index, itemData)
{
   var _loc4_ = container_mc["icon" + index];
   var _loc2_ = lib.util.ExtString.split(itemData,"\t");
   _loc4_.slot.removeMovieClip();
   var _loc1_ = _loc4_.attachMovie("Slot_link","slot",_loc4_.getNextHighestDepth());
   _loc1_.index = _loc2_[0];
   _loc1_.draw(_loc2_[1]);
   _loc1_.SLOT.enabled = false;
   _loc1_.display = true;
   _loc1_.disable = !Boolean(Number(_loc2_[3]));
   _loc1_.grade = _loc2_[4];
   _loc1_.sealType = _loc2_[5];
   _loc1_.masterpiece = _loc2_[6];
   if(Number(_loc2_[2]) > 1)
   {
      _loc1_.num = _loc2_[2];
   }
   _loc1_.enchantFd.text = "";
   var _loc3_ = Number(_loc2_[7]);
   if(isNaN(_loc3_) == false && _loc3_ != -1 && _loc3_ != 0)
   {
      var _loc5_ = impossible <= 0?21433:3615811;
      if(_loc3_ > 11 && _loc3_ < 15)
      {
         _loc5_ = impossible <= 0?8915599:2299429;
      }
      else if(_loc3_ > 14)
      {
         _loc5_ = impossible <= 0?10624002:4074792;
      }
      container_mc.enchantFd.shadowColor = _loc5_;
      container_mc.enchantFd.textColor = impossible <= 0?14145495:7368816;
      container_mc.enchantFd.text = "+" + _loc3_;
   }
   lib.manager.ToolTip.add(_loc1_.SLOT,_loc2_[0],6);
};
setButton();
ToGame_AccountBenefitPromotion_Init();
