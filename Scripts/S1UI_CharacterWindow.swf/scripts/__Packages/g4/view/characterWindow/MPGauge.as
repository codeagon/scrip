class g4.view.characterWindow.MPGauge extends MovieClip
{
   var isPercent = true;
   function MPGauge()
   {
      super();
   }
   function onLoad()
   {
      this.mText.onRelease = g4.util.Delegate.create(this,this.textHandlerRelease);
      this.mGauge.mGaugeEffect.onComplete = g4.util.Delegate.create(this,this.mpHandlerComp);
      g4.util.UIUtil.setTextFieldStyle(this.tStamina,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.tStamina._visible = false;
   }
   function mpHandlerComp()
   {
      g4.util.TweenX.killTweenOf(this.mGauge.mGaugeEffect.mc);
      g4.util.TweenX.to(this.mGauge.mGaugeEffect.mc,0.3,{_x:this.mGauge.mMask.mc._width,_width:0},gs.easing.Strong.easeOut);
   }
   function textHandlerRelease()
   {
      this.isPercent = !this.isPercent;
      this.showText();
   }
   function showValue($value)
   {
      this.tStamina._visible = $value;
   }
   function showText()
   {
      if(this.isPercent)
      {
         this.mText.textField.text = Math.round(this._rate * 1000) / 10 + "%";
      }
      else
      {
         var _loc2_ = this._mp + " / " + this._mpMax;
         if(this._mpMaxAdd > 0)
         {
            _loc2_ = _loc2_ + (" + " + this._mpMaxAdd);
         }
         this.mText.textField.text = _loc2_;
      }
   }
   function setClass($class)
   {
      this.tStamina.text = "";
      this.tStamina._visible = false;
      switch($class)
      {
         case 0:
         case 1:
         case 5:
            this.mBackground.gotoAndStop(2);
            this.mStamina._visible = true;
            break;
         default:
            this.mBackground.gotoAndStop(1);
            this.mStamina._visible = false;
      }
   }
   function updateST($st, $maxST, $str, $maxStr, $time)
   {
      $st = Number($st);
      $maxST = Number($maxST);
      var _loc5_ = $st / $maxST;
      var _loc2_ = Math.round(246 * _loc5_);
      g4.util.TweenX.to(this.mStamina.mGauge,0.5,{_width:_loc2_},gs.easing.Strong.easeOut);
      if(_loc2_ < 50)
      {
         this.mStamina.mStaEffect._visible = false;
         g4.util.TweenX.killTweenOf(this.mStamina.mStaEffect);
         this.mStamina.mStaEffect._x = _loc2_ - 25;
      }
      else
      {
         _loc2_ = _loc2_ - 45;
         this.mStamina.mStaEffect._visible = true;
         g4.util.TweenX.to(this.mStamina.mStaEffect,0.5,{_x:_loc2_},gs.easing.Strong.easeOut);
      }
      if($maxST != 0)
      {
         this.tStamina.text = $st + "/" + $maxST;
      }
      else
      {
         this.tStamina.text = "";
      }
   }
   function updateMP($mp, $maxMp, $maxMpAdd)
   {
      $mp = Number($mp);
      $maxMp = Number($maxMp);
      $maxMpAdd = Number($maxMpAdd);
      this._rate = $mp / ($maxMp + $maxMpAdd);
      if(isNaN(this._rate))
      {
         this._rate = 0;
      }
      g4.util.TweenX.killTweenOf(this.mGauge.mMask.mc);
      g4.util.TweenX.killTweenOf(this.mGauge.mLineEnd);
      g4.util.TweenX.killTweenOf(this.mGauge.mGaugeBack);
      g4.util.TweenX.killTweenOf(this.mGauge.mGaugeEffect.mc);
      g4.util.TweenX.killTweenOf(this.mGauge.mEffect);
      if(this._mp > $mp)
      {
         this.mGauge.mGaugeBack._visible = true;
         this.mGauge.mGaugeEffect._visible = false;
         var _loc6_ = this._rate * 252;
         g4.util.TweenX.to(this.mGauge.mGaugeBack,0.5,{_width:_loc6_},gs.easing.Strong.easeIn);
         var _loc4_ = Math.round(this._rate * 245);
         this.mGauge.mMask.mc._width = _loc4_;
         this.mGauge.mLineEnd._x = _loc4_ - 20;
         this.mGauge.mEffect._x = _loc4_ - 19;
      }
      else if(this._mp < $mp)
      {
         this.mGauge.mGaugeBack._visible = false;
         this.mGauge.mGaugeEffect._visible = true;
         this.mGauge.mGaugeBack._width = this._rate * 252;
         _loc4_ = Math.round(this._rate * 245);
         g4.util.TweenX.to(this.mGauge.mEffect,0.5,{_x:_loc4_ - 19},gs.easing.Strong.easeOut);
         this.mGauge.mGaugeEffect.mc._x = this.mGauge.mMask.mc._width;
         this.mGauge.mGaugeEffect.mc._width = _loc4_ - this.mGauge.mMask.mc._width;
         g4.util.TweenX.to(this.mGauge.mMask.mc,0.5,{_width:_loc4_},gs.easing.Strong.easeOut,this.mGauge.mGaugeEffect);
         _loc4_ = _loc4_ - 20;
         g4.util.TweenX.to(this.mGauge.mLineEnd,0.5,{_x:_loc4_},gs.easing.Strong.easeOut);
      }
      else
      {
         this.mGauge.mGaugeBack._visible = false;
         this.mGauge.mGaugeEffect._visible = false;
         this.mGauge.mGaugeEffect.mc._width = 0;
         _loc4_ = Math.round(this._rate * 245);
         this.mGauge.mMask.mc._width = _loc4_;
         this.mGauge.mLineEnd._x = _loc4_ - 20;
      }
      if(this._rate > 0.1)
      {
         this.mGauge.mEffect.gotoAndPlay(2);
      }
      this._mp = $mp;
      this._mpMax = $maxMp;
      this._mpMaxAdd = $maxMpAdd;
      this.showText();
   }
}
