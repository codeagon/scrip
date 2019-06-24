class g4.view.characterWindow.HPGauge extends MovieClip
{
   var isPercent = true;
   function HPGauge()
   {
      super();
   }
   function onLoad()
   {
      this.mText.onRelease = g4.util.Delegate.create(this,this.textHandlerRelease);
      this.mGauge.mGaugeEffect.onComplete = g4.util.Delegate.create(this,this.hpHandlerComp);
   }
   function hpHandlerComp()
   {
      g4.util.TweenX.killTweenOf(this.mGauge.mGaugeEffect.mc);
      g4.util.TweenX.to(this.mGauge.mGaugeEffect.mc,0.3,{_x:this.mGauge.mMask.mc._width,_width:0},gs.easing.Strong.easeOut);
   }
   function textHandlerRelease()
   {
      this.isPercent = !this.isPercent;
      this.showText();
   }
   function showText()
   {
      if(this.isPercent)
      {
         this.mText.textField.text = Math.round(this._rate * 1000) / 10 + "%";
      }
      else
      {
         var _loc2_ = this._hp + " / " + this._hpMax;
         if(this._hpMaxAdd > 0)
         {
            _loc2_ = _loc2_ + (" + " + this._hpMaxAdd);
         }
         this.mText.textField.text = _loc2_;
      }
   }
   function updateHP($hp, $maxHp, $maxHpAdd)
   {
      $hp = Number($hp);
      $maxHp = Number($maxHp);
      $maxHpAdd = Number($maxHpAdd);
      this._rate = $hp / ($maxHp + $maxHpAdd);
      var _loc2_ = this._rate <= 0?0:this._rate;
      g4.util.TweenX.killTweenOf(this.mGauge.mMask.mc);
      g4.util.TweenX.killTweenOf(this.mGauge.mLineEnd);
      g4.util.TweenX.killTweenOf(this.mGauge.mGaugeBack);
      g4.util.TweenX.killTweenOf(this.mGauge.mGaugeEffect.mc);
      g4.util.TweenX.killTweenOf(this.mGauge.mEffect);
      if(this._hp > $hp)
      {
         this.mGauge.mGaugeBack._visible = true;
         this.mGauge.mGaugeEffect._visible = false;
         var _loc7_ = _loc2_ * 252;
         g4.util.TweenX.to(this.mGauge.mGaugeBack,0.5,{_width:_loc7_},gs.easing.Strong.easeIn);
         var _loc5_ = Math.round(_loc2_ * 245);
         this.mGauge.mMask.mc._width = _loc5_;
         this.mGauge.mLineEnd._x = 245 - _loc5_;
         this.mGauge.mEffect._x = 245 - _loc5_ - 4;
      }
      else if(this._hp < $hp)
      {
         this.mGauge.mGaugeBack._visible = false;
         this.mGauge.mGaugeEffect._visible = true;
         this.mGauge.mGaugeBack._width = _loc2_ * 252;
         _loc5_ = Math.round(_loc2_ * 245);
         g4.util.TweenX.to(this.mGauge.mEffect,0.5,{_x:245 - _loc5_ - 4},gs.easing.Strong.easeOut);
         this.mGauge.mGaugeEffect.mc._x = this.mGauge.mMask.mc._width;
         this.mGauge.mGaugeEffect.mc._width = _loc5_ - this.mGauge.mGaugeEffect.mc._x;
         g4.util.TweenX.to(this.mGauge.mMask.mc,0.5,{_width:_loc5_},gs.easing.Strong.easeOut,this.mGauge.mGaugeEffect);
         _loc5_ = 245 - _loc5_;
         g4.util.TweenX.to(this.mGauge.mLineEnd,0.5,{_x:_loc5_},gs.easing.Strong.easeOut);
      }
      else
      {
         this.mGauge.mGaugeBack._visible = false;
         this.mGauge.mGaugeEffect._visible = false;
         this.mGauge.mGaugeEffect.mc._width = 0;
         _loc5_ = Math.round(_loc2_ * 245);
         this.mGauge.mMask.mc._width = _loc5_;
         this.mGauge.mLineEnd._x = 245 - _loc5_;
      }
      if(_loc2_ > 0.1)
      {
         this.mGauge.mEffect.gotoAndPlay(2);
      }
      this._hp = $hp;
      this._hpMax = $maxHp;
      this._hpMaxAdd = $maxHpAdd;
      this.showText();
   }
}
