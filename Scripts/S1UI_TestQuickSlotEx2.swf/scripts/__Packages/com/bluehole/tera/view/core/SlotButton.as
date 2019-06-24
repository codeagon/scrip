class com.bluehole.tera.view.core.SlotButton extends gfx.controls.Button
{
   static var COOL_TIME_TOTAL_FRAME = 362;
   static var COOL_TIME_EFFECT_TOTAL_FRAME = 50;
   var boxWidth = 38;
   var boxHeight = 38;
   var _effect = false;
   var _active = false;
   var _impossible = false;
   var _playCoolTime = 0;
   var _playCoolTimeEffect = 0;
   var _black = false;
   function SlotButton()
   {
      super();
   }
   function __get__effect()
   {
      return this._effect;
   }
   function __set__effect(value)
   {
      if(this._effect == value)
      {
         return undefined;
      }
      this._effect = value;
      this.effectMc._visible = value;
      if(value)
      {
         this.effectMc.play();
      }
      else
      {
         this.effectMc.stop();
      }
      return this.__get__effect();
   }
   function __get__active()
   {
      return this._active;
   }
   function __set__active(value)
   {
      if(this._active == value)
      {
         return undefined;
      }
      this._active = value;
      this.activeMc._visible = value;
      if(value)
      {
         this.activeMc.play();
      }
      else
      {
         this.activeMc.stop();
      }
      return this.__get__active();
   }
   function __get__impossible()
   {
      return this._impossible;
   }
   function __set__impossible(value)
   {
      if(this._impossible == value)
      {
         return undefined;
      }
      this._impossible = value;
      this.impossibleMc._visible = value;
      return this.__get__impossible();
   }
   function setBitmapName($name)
   {
      this.bitmap = flash.display.BitmapData.loadBitmap($name);
   }
   function __get__playCoolTime()
   {
      return this._playCoolTime;
   }
   function __set__playCoolTime(value)
   {
      if(this._playCoolTime == value)
      {
         return undefined;
      }
      this._playCoolTime = value;
      this.coolTimeMc._visible = value > 0;
      var _loc2_ = Math.floor(com.bluehole.tera.view.core.SlotButton.COOL_TIME_TOTAL_FRAME * value / 100);
      this.coolTimeMc.gotoAndStop(_loc2_);
      if(this.coolTimeMc.mAddPoint != null)
      {
         var _loc4_ = _loc2_;
         var _loc3_ = this.coolTimeMc.mAddPoint;
         _loc3_.clear();
         var _loc10_ = this.boxWidth / 2;
         var _loc13_ = this.boxHeight / 2;
         if(_loc2_ >= 45 && _loc2_ < 90)
         {
            _loc2_ = 90 - _loc2_;
         }
         else if(_loc2_ >= 90 && _loc2_ < 135)
         {
            _loc2_ = _loc2_ - 90;
         }
         else if(_loc2_ >= 135 && _loc2_ < 180)
         {
            _loc2_ = 180 - _loc2_;
         }
         else if(_loc2_ >= 180 && _loc2_ < 225)
         {
            _loc2_ = _loc2_ - 180;
         }
         else if(_loc2_ >= 225 && _loc2_ < 270)
         {
            _loc2_ = 270 - _loc2_;
         }
         else if(_loc2_ >= 270 && _loc2_ < 315)
         {
            _loc2_ = _loc2_ - 270;
         }
         else if(_loc2_ > 315 && _loc2_ < 360)
         {
            _loc2_ = 360 - _loc2_;
         }
         var _loc18_ = _loc2_ * 3.141592653589793 / 180;
         var _loc14_ = _loc10_ / Math.cos(_loc18_);
         var _loc8_ = new flash.geom.Point(this.boxWidth / 2,0);
         var _loc15_ = new flash.geom.Point(_loc10_,_loc13_);
         var _loc9_ = null;
         var _loc5_ = new flash.geom.Point(this.boxWidth,0);
         var _loc6_ = new flash.geom.Point(this.boxWidth,this.boxHeight);
         var _loc7_ = new flash.geom.Point(0,this.boxHeight);
         var _loc12_ = new flash.geom.Point(0,0);
         _loc3_.beginBitmapFill(this.bitmap,new flash.geom.Matrix(),false,true);
         _loc3_.moveTo(_loc8_.x,_loc8_.y);
         _loc3_.lineTo(_loc15_.x,_loc15_.y);
         var _loc17_ = _loc10_ + _loc14_ * Math.sin(_loc4_ * lib.info.PreMath.radian);
         var _loc16_ = _loc13_ - _loc14_ * Math.cos(_loc4_ * lib.info.PreMath.radian);
         _loc9_ = new flash.geom.Point(_loc17_,_loc16_);
         _loc3_.lineTo(_loc9_.x,_loc9_.y);
         if(!(_loc4_ >= 0 && _loc4_ < 45))
         {
            if(_loc4_ >= 45 && _loc4_ < 135)
            {
               _loc3_.lineTo(_loc5_.x,_loc5_.y);
            }
            else if(_loc4_ >= 135 && _loc4_ < 225)
            {
               _loc3_.lineTo(_loc6_.x,_loc6_.y);
               _loc3_.lineTo(_loc5_.x,_loc5_.y);
            }
            else if(_loc4_ >= 225 && _loc4_ < 315)
            {
               _loc3_.lineTo(_loc7_.x,_loc7_.y);
               _loc3_.lineTo(_loc6_.x,_loc6_.y);
               _loc3_.lineTo(_loc5_.x,_loc5_.y);
            }
            else if(_loc4_ >= 315 && _loc4_ < 360)
            {
               _loc3_.lineTo(_loc12_.x,_loc12_.y);
               _loc3_.lineTo(_loc7_.x,_loc7_.y);
               _loc3_.lineTo(_loc6_.x,_loc6_.y);
               _loc3_.lineTo(_loc5_.x,_loc5_.y);
            }
         }
         _loc3_.lineTo(_loc8_.x,_loc8_.y);
      }
      return this.__get__playCoolTime();
   }
   function __get__playCoolTimeEffect()
   {
      return this._playCoolTimeEffect;
   }
   function __set__playCoolTimeEffect(value)
   {
      if(this._playCoolTimeEffect == value)
      {
         return undefined;
      }
      this._playCoolTimeEffect = value;
      this.coolTimeEffectMc._visible = value > 0;
      this.coolTimeEffectMc.gotoAndStop(Math.floor(com.bluehole.tera.view.core.SlotButton.COOL_TIME_EFFECT_TOTAL_FRAME * value / 100));
      return this.__get__playCoolTimeEffect();
   }
   function __get__black()
   {
      return this._black;
   }
   function __set__black(value)
   {
      this._black = value;
      this.__set__disabled(value);
      return this.__get__black();
   }
   function toString()
   {
      return "[com.bluehole.tera.view.core.SlotButton " + this._name + "]";
   }
   function configUI()
   {
      super.configUI();
      this.scale9Grid = new flash.geom.Rectangle(0,0,this.__get__width(),this.__get__height());
      this.trackAsMenu = true;
      this.coolTimeMc._visible = false;
      this.coolTimeMc.hitTestDisable = true;
      this.coolTimeEffectMc._visible = false;
      this.coolTimeEffectMc.hitTestDisable = true;
      this.effectMc._visible = false;
      this.effectMc.hitTestDisable = true;
      this.effectMc.stop();
      this.activeMc._visible = false;
      this.activeMc.hitTestDisable = true;
      this.activeMc.stop();
      this.impossibleMc._visible = false;
      this.impossibleMc.hitTestDisable = true;
      var thisObject = this;
      var _loc3_ = new Object();
      _loc3_.onMouseDown = function(button, target, mouseIndex)
      {
         if(button == 2 && target == targetPath(thisObject))
         {
            thisObject.handleMousePress(mouseIndex,button);
         }
      };
      _loc3_.onMouseUp = function(button, target, mouseIndex)
      {
         if(button == 2 && target == targetPath(thisObject))
         {
            thisObject.handleMouseRelease(mouseIndex,button);
         }
      };
      Mouse.addListener(_loc3_);
      this.boxWidth = Math.round(this.coolTimeMc.mAddPoint._width);
      this.boxHeight = Math.round(this.coolTimeMc.mAddPoint._height);
      if(this.boxWidth == 38)
      {
         this.bitmap = flash.display.BitmapData.loadBitmap("ONTIME");
      }
      else if(this.boxWidth == 30)
      {
         this.bitmap = flash.display.BitmapData.loadBitmap("ONTIME2");
      }
   }
   function handleMousePress(mouseIndex, button)
   {
      if(this._disabled && !this._black)
      {
         return undefined;
      }
      if(this._black)
      {
         this.dispatchEvent({type:"press",mouseIndex:mouseIndex,button:button});
      }
      else
      {
         if(!this._disableFocus)
         {
            Selection.setFocus(this);
         }
         this.dispatchEvent({type:"press",mouseIndex:mouseIndex,button:button});
         if(this.autoRepeat)
         {
            this.buttonRepeatInterval = setInterval(this,"beginButtonRepeat",this.buttonRepeatDelay,mouseIndex,button);
         }
      }
   }
   function handleMouseRelease(mouseIndex, button)
   {
      if(this._disabled && !this._black)
      {
         return undefined;
      }
      clearInterval(this.buttonRepeatInterval);
      delete this.buttonRepeatInterval;
      if(this.doubleClickEnabled)
      {
         if(this.doubleClickInterval == null)
         {
            this.doubleClickInterval = setInterval(this,"doubleClickExpired",this.doubleClickDuration);
         }
         else
         {
            this.doubleClickExpired();
            this.dispatchEvent({type:"doubleClick",mouseIndex:mouseIndex,button:button});
            if(!this._disabled)
            {
               this.setState("release");
            }
            return undefined;
         }
      }
      if(!this._disabled)
      {
         this.setState("release");
      }
      this.handleClick(mouseIndex,button);
   }
}
