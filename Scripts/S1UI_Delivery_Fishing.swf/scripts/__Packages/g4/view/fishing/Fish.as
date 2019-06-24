class g4.view.fishing.Fish extends MovieClip
{
   var _moveForce = 0;
   var _minimumSpeed = 3;
   var pullForce = 0;
   function Fish()
   {
      super();
      this.rect = new flash.geom.Rectangle(0,50,80,40);
   }
   function setGrade($grade)
   {
      this._grade = $grade;
      switch(this._grade)
      {
         case 0:
            this._forceMin = 20;
            this._forceMax = 40;
            break;
         case 1:
            this._forceMin = 30;
            this._forceMax = 50;
            break;
         case 2:
            this._forceMin = 40;
            this._forceMax = 70;
      }
      this.startMove();
   }
   function getTime()
   {
      var _loc2_ = undefined;
      if(this._moveForce > 60)
      {
         _loc2_ = 0.7;
      }
      else if(this._moveForce > 40)
      {
         _loc2_ = 0.5;
      }
      else if(this._moveForce > 20)
      {
         _loc2_ = 0.4;
      }
      else
      {
         _loc2_ = 0.3;
      }
      return _loc2_;
   }
   function onComplete()
   {
      g4.util.TweenX.killTweenOf(this);
      this._x = Math.floor(this._x);
      this.startMove();
   }
   function startMove()
   {
      this._moveForce = Math.random() * (this._forceMax - this._forceMin) + this._forceMin;
      g4.util.TweenX.to(this,this.getTime(),{moveForce:0},gs.easing.Strong.easeOut,this);
   }
   function __get__moveForce()
   {
      return this._moveForce;
   }
   function __set__moveForce(value)
   {
      this._moveForce = value;
      this._x = this._x - (this._moveForce - this.pullForce + this._minimumSpeed);
      if(this._x < 50)
      {
         this._x = 50;
      }
      this.rect.x = this._x;
      return this.__get__moveForce();
   }
   function timeUp()
   {
      g4.util.TweenX.killTweenOf(this);
   }
   function setRemain($remain)
   {
      this.textField.text = $remain + "m";
   }
}
