class lib.controls.FieldEventGage extends MovieClip
{
   var REWARD_TYPE_BUTTON = "0";
   var REWARD_TYPE_GAGE = "1";
   var MASK_WIDTH = 274;
   var buttonToolTipStr = "";
   var gageToolTipStr = "";
   var rewardCount = 0;
   var gageStartPosX = 0;
   function FieldEventGage()
   {
      super();
      this.init();
   }
   function setRewardButtonRelease(func, param)
   {
      this.button.mc.onRelease2 = function()
      {
         func(param);
      };
      this.button.mc.onRollOut2 = function()
      {
         this.overOutEvent();
      };
      this.button.mc.onReleaseOutside2 = function()
      {
         this.overOutEvent();
      };
   }
   function setGageStartPosX(posX)
   {
      this.gageStartPosX = posX;
   }
   function setVisible(bVisible)
   {
      this._visible = bVisible;
   }
   function setButton(count)
   {
      this.rewardCount = count;
      var _loc2_ = 0 < this.rewardCount;
      var _loc3_ = lib.util.UIString.getUIString("$720008","count",this.rewardCount);
      this.txtBtn.setText(_loc3_);
      this.txtBtn.setEnabled(_loc2_);
      this.setButtonToolTip(_loc2_);
   }
   function setGage(currentValue, maxValue)
   {
      var _loc3_ = String(currentValue) + "/" + String(maxValue);
      this.tf.htmlText = _loc3_;
      var _loc2_ = currentValue / maxValue * 100;
      this.mask._xscale = _loc2_;
      this.gage._x = this.bg._x = this.mask._x + this.mask._width;
      this.bg._visible = _loc2_ < 100;
   }
   function setButtonToolTip(bRequestToolTip)
   {
      lib.manager.ToolTip.remove(this.button);
      var _loc2_ = "ToGame_FieldEvent_RequestRewardInfo\t" + this.REWARD_TYPE_BUTTON;
      lib.manager.ToolTip.add(this.button,_loc2_,100);
   }
   function init()
   {
      this.initButton();
      this.buttonToolTipStr = lib.util.UIString.getUIString("$720013");
   }
   function initButton()
   {
      this.txtBtn = new lib.util.TxtBtn(this.button.mc,this.button.tf);
      var _loc2_ = "ToGame_FieldEvent_RequestRewardInfo\t" + this.REWARD_TYPE_BUTTON;
      lib.manager.ToolTip.add(this.button,_loc2_,100);
      this.button.tf.verticalAlign = "center";
   }
   function initGage()
   {
      this.tf.verticalAlign = "center";
   }
   function overOutEvent()
   {
      fscommand("ToGame_FieldEvent_TooltipClose");
   }
}
