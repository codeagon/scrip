class g4.view.fishing.Fish extends MovieClip
{
   var _moveForce = 0;
   var _minimumSpeed = 3;
   var pullForce = 0;
   var shakeIndex = 0;
   function Fish()
   {
      super();
      this.rect = new flash.geom.Rectangle(0,50,80,40);
   }
   function setRemain($remain)
   {
      this.textField.text = $remain + "m";
   }
   function setPsition($pos)
   {
      this._x = $pos + 22;
      this.mLine._width = 404 - $pos;
      this.mReel1._x = this.mLine._width - 7;
      this.mReel0._x = this.mReel1._x + 11;
   }
   function setShake($value)
   {
      if($value)
      {
         g4.util.TweenX.to(this,0.2,{_y:6},gs.easing.Linear.easeNone,this);
      }
      else
      {
         g4.util.TweenX.killTweenOf(this);
         this._y = 8;
      }
   }
   function setFishObject($fishType)
   {
      this.mc.fishObj1._visible = false;
      this.mc.fishObj2._visible = false;
      this._fishObj = $fishType == 0?this.mc.fishObj1:this.mc.fishObj2;
      this._fishObj._visible = true;
   }
   function playFishObjAnim()
   {
      this._fishObj.gotoAndPlay(2);
   }
   function stopFishObjAnim()
   {
      this._fishObj.gotoAndStop(1);
   }
   function onComplete()
   {
      g4.util.TweenX.killTweenOf(this);
      if(this.shakeIndex == 1)
      {
         g4.util.TweenX.to(this,0.2,{_y:6},gs.easing.Linear.easeNone,this);
         this.shakeIndex = 0;
      }
      else
      {
         g4.util.TweenX.to(this,0.2,{_y:10},gs.easing.Linear.easeNone,this);
         this.shakeIndex = 1;
      }
   }
}
