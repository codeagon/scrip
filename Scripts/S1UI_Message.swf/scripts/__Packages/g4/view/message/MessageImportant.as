class g4.view.message.MessageImportant extends MovieClip
{
   function MessageImportant()
   {
      super();
   }
   function onLoad()
   {
      this.setDataDelay(this._str,this._type,this._img,this._time);
   }
   function setData($str, $type, $img, $time)
   {
      $type = Number($type);
      $img = Number($img);
      $time = Number($time);
      if(isNaN($time))
      {
         $time = 3;
      }
      this._str = $str;
      this._type = $type;
      this._img = $img;
      this._time = $time;
   }
   function setDataDelay($str, $type, $img, $time)
   {
      if($type == null)
      {
         $type == 2;
      }
      this.mText.gotoAndStop($type + 1);
      this.mBackground.mLeft.gotoAndStop($type + 1);
      this.mBackground.mCenter.gotoAndStop($type + 1);
      this.mBackground.mRight.gotoAndStop($type + 1);
      if($type == 0)
      {
         this.mIcon.mc.gotoAndStop($img + 6);
      }
      else
      {
         this.mIcon.mc.gotoAndStop($img + 1);
      }
      this.mText.textField.textAutoSize = "none";
      this.mText.textField.htmlText = $str;
      if(this.mText.textField.textWidth > this.mText.textField._width)
      {
         this.mText.textField.textAutoSize = "shrink";
      }
      this.mIcon._x = (- this.mText.textField.textWidth) / 2 - 40;
      this.mBackground.mCenter._width = Math.round(this.mText.textField.textWidth + 4);
      var _loc3_ = (- 148 + this.mBackground.mCenter._width) / 2;
      this.mBackground.mLeft._x = _loc3_;
      _loc3_ = _loc3_ + this.mBackground.mLeft._width;
      this.mBackground.mCenter._x = _loc3_;
      _loc3_ = _loc3_ + this.mBackground.mCenter._width;
      this.mBackground.mRight._x = _loc3_;
      this.gotoAndPlay(2);
      this.mIcon.gotoAndPlay(2);
      clearInterval(this.delayInterval);
      this.delayInterval = setInterval(this,"delayComp",$time * 1000);
   }
   function delayComp()
   {
      clearInterval(this.delayInterval);
      g4.util.TweenX.killTweenOf(this);
      this.gotoAndPlay(74);
   }
   function onComplete()
   {
      g4.util.TweenX.killTweenOf(this);
      this.removeMovieClip();
   }
   function fadeOut()
   {
      clearInterval(this.delayInterval);
      this.gotoAndPlay(74);
   }
   function moveUp()
   {
      g4.util.TweenX.killTweenOf(this);
      g4.util.TweenX.to(this,0.5,{_y:0},gs.easing.Strong.easeOut);
   }
}
