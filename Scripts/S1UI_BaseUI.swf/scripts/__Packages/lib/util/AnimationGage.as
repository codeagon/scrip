class lib.util.AnimationGage
{
   static var test = "test";
   var _value = 100;
   var _value2 = 100;
   var speed_up1 = 10;
   var speed_up2 = 10;
   var speed_down1 = 25;
   var bAnimation = true;
   function AnimationGage(_norBody, _upBody, _downBody, _bool, _speed_up1, _speed_up2, _speed_down1)
   {
      this.norBody = _norBody;
      this.upBody = _upBody;
      this.downBody = _downBody;
      if(_speed_up1 != undefined)
      {
         this.speed_up1 = _speed_up1;
      }
      if(_speed_up2 != undefined)
      {
         this.speed_up2 = _speed_up2;
      }
      if(_speed_down1 != undefined)
      {
         this.speed_down1 = _speed_down1;
      }
   }
   function __set__value(v)
   {
      if(v > this._value)
      {
         this.motionUp(v);
      }
      else if(v < this.__get__value())
      {
         this.animateDown(v);
      }
      this._value = v;
      return this.__get__value();
   }
   function __set__value2(v)
   {
      if(v > this._value)
      {
         this.motionUp(v);
      }
      else if(v < this.__get__value())
      {
         this.animateDown2(v);
      }
      this._value2 = v;
      return this.__get__value2();
   }
   function __get__value()
   {
      return this._value;
   }
   function __get__value2()
   {
      return this._value2;
   }
   function motionUp(v)
   {
      var _loc3_ = this;
      this.tween_up1.clear();
      this.tween_up2.clear();
      this.tween_down1.clear();
      this.upBody._visible = true;
      if(this.bAnimation)
      {
         this.tween_up1 = gs.TweenLite.to(this.upBody,this.speed_up1 / 25,{_xscale:v,ease:gs.easing.Strong.easeOut,onComplete:this.tweenUp_Finished,onCompleteParams:[v,_loc3_]});
      }
      else
      {
         this.upBody._xscale = v;
         this.norBody._xscale = v;
      }
      this.onMotionUp();
   }
   function tweenUp_Finished(v, _this)
   {
      _this.tween_up2 = gs.TweenLite.to(_this.norBody,_this.speed_up2 / 25,{_xscale:v,ease:gs.easing.Strong.easeOut,onComplete:_this.onMotionUpFinished});
      if(v >= 100)
      {
         _this.onFull();
      }
   }
   function animateDown(v)
   {
      var _loc3_ = this;
      this.tween_up1.clear();
      this.tween_up2.clear();
      this.tween_down1.clear();
      this.upBody._xscale = this._value;
      this.downBody._xscale = this._value;
      this.norBody._xscale = v;
      this.upBody._xscale = v;
      if(this.bAnimation)
      {
         this.tween_down1 = gs.TweenLite.to(this.downBody,this.speed_down1 / 25,{_xscale:v,ease:gs.easing.Strong.easeOut,onComplete:this.tweenDown_Finished,onCompleteParams:[v,_loc3_]});
      }
      else
      {
         this.downBody._xscale = v;
      }
      this.onMotionDown();
   }
   function animateDown2(v)
   {
      var _loc3_ = this;
      this.tween_up1.clear();
      this.tween_up2.clear();
      this.tween_down1.clear();
      this.upBody._xscale = this._value2;
      this.downBody._xscale = this._value2;
      this.norBody._xscale = v;
      this.upBody._xscale = v;
      if(this.bAnimation)
      {
         this.tween_down1 = gs.TweenLite.to(this.downBody,this.speed_down1 / 25,{_xscale:v,ease:gs.easing.Strong.easeOut,onComplete:this.tweenDown_Finished,onCompleteParams:[v,_loc3_]});
      }
      else
      {
         this.downBody._xscale = v;
      }
      this.onMotionDown();
   }
   function tweenDown_Finished(v, _this)
   {
      _this.onMotionDownFinished();
      if(v <= 0)
      {
         _this.onEmpty();
      }
   }
   function onMotionUp()
   {
   }
   function onMotionDown()
   {
   }
   function onMotionUpFinished()
   {
   }
   function onMotionDownFinished()
   {
   }
   function onFull()
   {
   }
   function onEmpty()
   {
   }
}
