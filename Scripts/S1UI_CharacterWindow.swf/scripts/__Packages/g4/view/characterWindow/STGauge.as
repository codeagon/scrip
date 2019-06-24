class g4.view.characterWindow.STGauge extends MovieClip
{
   var _class = -1;
   var _prevST = -1;
   var _st = 0;
   var _prevStack = 0;
   var textType = 0;
   function STGauge()
   {
      super();
   }
   function onLoad()
   {
      this.mGaugeLight = this.mGauge.mGaugeLight;
      this.mGaugeType = this.mGauge.mGaugeType;
      this.mGaugeType0 = this.mGauge.mGaugeType0;
      this.mGaugeType4 = this.mGauge.mGaugeType4;
      this.mFullBackground = this.mFullAnim.mBackground;
      this.mGauge0 = this.mFullAnim.mGauge0;
      this.mGauge1 = this.mFullAnim.mGauge1;
      this.mGauge2 = this.mFullAnim.mGauge2;
      this.mFullClass = this.mFullAnim.mClass;
      this.mFullAnim.stop();
      this.mFullAnim._visible = false;
      this.mAwaken._visible = false;
      this.mGaugeType4.mElement0._visible = false;
      this.mGaugeType4.mElement1._visible = false;
      this.mGaugeType4.mElement2._visible = false;
      this.mGaugeType4.mFullStack._visible = false;
      g4.util.UIUtil.setTextFieldStyle(this.tST0,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setTextFieldStyle(this.tST1,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setTextFieldStyle(this.tStack,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.tST0._visible = false;
      this.tST1._visible = false;
      this.tStack._visible = false;
   }
   function setClass($class)
   {
      this._class = $class;
      this.tST0._visible = false;
      this.tST1._visible = false;
      this.tStack._visible = false;
      this.mClass.gotoAndStop($class + 1);
      this.mGaugeLight.mLight.mc.gotoAndStop($class + 1);
      this.mGaugeType.gotoAndStop($class + 1);
      this.mFullBackground.gotoAndStop($class + 1);
      this.mGauge0.gotoAndStop($class + 1);
      this.mGauge1.gotoAndStop($class + 1);
      this.mGauge2.gotoAndStop($class + 1);
      this.mFullClass.gotoAndStop($class + 1);
      this.mStackCover._visible = $class == 0;
      var _loc2_ = new flash.geom.ColorTransform();
      _loc2_.redMultiplier = 0;
      _loc2_.greenMultiplier = 0;
      _loc2_.blueMultiplier = 0;
      this.tST1.textColor = 15329772;
      var _loc4_ = undefined;
      switch($class)
      {
         case 0:
            _loc4_ = "$1020" + (15 + $class);
            _loc2_.redOffset = 255;
            _loc2_.greenOffset = 50;
            _loc2_.blueOffset = 33;
            this.textType = 1;
            this.tStack.text = "0";
            break;
         case 1:
         case 2:
         case 3:
            _loc4_ = "$1020" + (15 + $class);
            break;
         case 4:
            _loc4_ = "$1020" + (15 + $class);
            _loc2_.redOffset = 159;
            _loc2_.greenOffset = 95;
            _loc2_.blueOffset = 255;
            break;
         case 5:
         case 6:
         case 7:
         case 8:
            _loc4_ = "$1020" + (15 + $class);
            break;
         case 9:
            this.textType = 2;
            _loc2_.redOffset = 39;
            _loc2_.greenOffset = 120;
            _loc2_.blueOffset = 254;
            _loc4_ = "$013159";
            this.tST0.textColor = 10350847;
            break;
         case 10:
            this.textType = 2;
            _loc4_ = "$013179";
            _loc2_.redOffset = 239;
            _loc2_.greenOffset = 160;
            _loc2_.blueOffset = 34;
            this.tST0.textColor = 16766580;
            break;
         case 11:
            this.textType = 2;
            _loc2_.redOffset = 143;
            _loc2_.greenOffset = 96;
            _loc2_.blueOffset = 255;
            _loc4_ = "$013191";
            this.tST0.textColor = 14338047;
            break;
         case 12:
            this.textType = 2;
            _loc2_.redOffset = 254;
            _loc2_.greenOffset = 192;
            _loc2_.blueOffset = 50;
            _loc4_ = "$013200";
            this.tST0.textColor = 16646029;
            break;
         case 20:
         case 21:
         case 22:
            _loc4_ = "$1022" + (47 + $class);
      }
      this.mEffect.transform.colorTransform = _loc2_;
      if($class == 4)
      {
         this.mBackground.gotoAndStop(2);
      }
      else
      {
         this.mBackground.gotoAndStop(1);
      }
      this.mGaugeType._visible = $class != 0;
      this.mGaugeType0._visible = $class == 0;
      this.mGaugeType4._visible = $class == 4;
      lib.manager.ToolTip.add(this.mClass,_loc4_,1);
   }
   function updateST($st, $maxSt, $str, $maxStr, $time)
   {
      if(this._class == -1)
      {
         return undefined;
      }
      if(this._class == 0)
      {
         return undefined;
      }
      $st = Number($st);
      $maxSt = Number($maxSt);
      this.tST0.text = String($st);
      this.tST1.text = String($maxSt);
      var _loc2_ = $st / $maxSt;
      _loc2_ = _loc2_ * 100;
      _loc2_ = Math.round(_loc2_);
      if(isNaN(_loc2_))
      {
         _loc2_ = 0;
      }
      if(isNaN(this._st))
      {
         this._st = _loc2_;
      }
      g4.util.TweenX.killTweenOf(this);
      g4.util.TweenX.to(this,0.5,{st:_loc2_},gs.easing.Strong.easeOut);
      if($maxSt == 0)
      {
         this.mFullAnim.gotoAndStop(1);
         this.mFullAnim._visible = false;
         this.tST0.text = "-";
         this.tST1.text = "";
      }
      else
      {
         if($st == $maxSt)
         {
            if(!this.mFullAnim._visible)
            {
               this.mFullAnim.gotoAndPlay(2);
               this.mFullAnim._visible = true;
               this.mEffect.gotoAndPlay(2);
               this.mEffect._visible = true;
            }
            switch(this._class)
            {
               case 9:
                  this.tST0.textColor = 16777215;
                  this.tST1.textColor = 16777215;
                  this.tST0.filters = [new flash.filters.DropShadowFilter(0,90,55551,1,6,6,2.3,0,false,false,false)];
                  this.tST1.filters = [new flash.filters.DropShadowFilter(0,90,55551,1,6,6,2.3,0,false,false,false)];
                  break;
               case 10:
                  this.tST0.textColor = 16777215;
                  this.tST1.textColor = 16777215;
                  this.tST0.filters = [new flash.filters.DropShadowFilter(0,90,16731648,1,6,6,2.3,0,false,false,false)];
                  this.tST1.filters = [new flash.filters.DropShadowFilter(0,90,16731648,1,6,6,2.3,0,false,false,false)];
                  break;
               case 11:
                  this.tST0.textColor = 16777215;
                  this.tST1.textColor = 16777215;
                  this.tST0.filters = [new flash.filters.DropShadowFilter(0,90,5322239,1,6,6,2.3,0,false,false,false)];
                  this.tST1.filters = [new flash.filters.DropShadowFilter(0,90,5322239,1,6,6,2.3,0,false,false,false)];
                  break;
               case 12:
                  this.tST0.textColor = 16777215;
                  this.tST1.textColor = 16777215;
                  this.tST0.filters = [new flash.filters.DropShadowFilter(0,90,16762887,1,6,6,2.3,0,false,false,false)];
                  this.tST1.filters = [new flash.filters.DropShadowFilter(0,90,16762887,1,6,6,2.3,0,false,false,false)];
            }
         }
         else
         {
            if(this.mFullAnim._visible)
            {
               this.mFullAnim.gotoAndStop(1);
               this.mFullAnim._visible = false;
            }
            switch(this._class)
            {
               case 9:
                  this.tST0.textColor = 10350847;
                  this.tST1.textColor = 15329772;
                  this.tST0.filters = [new flash.filters.DropShadowFilter(0,90,1447449,1,3,3,2.5,0,false,false,false)];
                  this.tST1.filters = [new flash.filters.DropShadowFilter(0,90,1447449,1,3,3,2.5,0,false,false,false)];
                  break;
               case 10:
                  this.tST0.textColor = 16766580;
                  this.tST1.textColor = 15329772;
                  this.tST0.filters = [new flash.filters.DropShadowFilter(0,90,1447449,1,3,3,2.5,0,false,false,false)];
                  this.tST1.filters = [new flash.filters.DropShadowFilter(0,90,1447449,1,3,3,2.5,0,false,false,false)];
                  break;
               case 11:
                  this.tST0.textColor = 14338047;
                  this.tST1.textColor = 15329772;
                  this.tST0.filters = [new flash.filters.DropShadowFilter(0,90,1447449,1,3,3,2.5,0,false,false,false)];
                  this.tST1.filters = [new flash.filters.DropShadowFilter(0,90,1447449,1,3,3,2.5,0,false,false,false)];
                  break;
               case 12:
                  this.tST0.textColor = 16646029;
                  this.tST1.textColor = 15329772;
                  this.tST0.filters = [new flash.filters.DropShadowFilter(0,90,1447449,1,3,3,2.5,0,false,false,false)];
                  this.tST1.filters = [new flash.filters.DropShadowFilter(0,90,1447449,1,3,3,2.5,0,false,false,false)];
            }
         }
         if(this._prevST < $st)
         {
            this.mGaugeLight.mLight.gotoAndPlay(2);
         }
         this._prevST = $st;
      }
   }
   function updateStack($stack)
   {
      if(this._prevStack < $stack)
      {
         var _loc2_ = this._prevStack;
         while(_loc2_ < $stack)
         {
            this.mGaugeType0["mGauge" + (_loc2_ + 1)].gotoAndPlay(2);
            _loc2_ = _loc2_ + 1;
         }
      }
      else if(this._prevStack > $stack)
      {
         _loc2_ = $stack;
         while(_loc2_ < this._prevStack)
         {
            this.mGaugeType0["mGauge" + (_loc2_ + 1)].gotoAndStop(1);
            _loc2_ = _loc2_ + 1;
         }
      }
      if($stack == 10)
      {
         if(!this.mFullAnim._visible)
         {
            this.mFullAnim.gotoAndPlay(2);
            this.mFullAnim._visible = true;
            this.mEffect.gotoAndPlay(2);
            this.mEffect._visible = true;
         }
      }
      else
      {
         this.mFullAnim.gotoAndStop(1);
         this.mFullAnim._visible = false;
      }
      if($stack == 10)
      {
         this.tStack.textColor = 16761049;
         this.tStack.filters = [new flash.filters.DropShadowFilter(0,90,16711680,1,6,6,2,0)];
      }
      else if($stack > 2)
      {
         this.tStack.textColor = 16761049;
         this.tStack.filters = [new flash.filters.DropShadowFilter(0,90,16711800,1,6,6,2,0)];
      }
      else
      {
         this.tStack.textColor = 16761049;
         this.tStack.filters = [new flash.filters.DropShadowFilter(0,90,1447449,1,3,3,2.5,0)];
      }
      _loc2_ = 1;
      while(_loc2_ <= 10)
      {
         this.mGaugeType0["mGauge" + _loc2_].mc.gotoAndStop($stack <= 2?1:2);
         _loc2_ = _loc2_ + 1;
      }
      this.tStack.text = String($stack);
      this._prevStack = $stack;
   }
   function setAwaken($awaken)
   {
   }
   function setAwakenWizard($element0, $element1, $element2, $stack)
   {
      $element0 = Number($element0);
      $element1 = Number($element1);
      $element2 = Number($element2);
      $stack = Number($stack);
      var _loc6_ = $element0 == 1 && $element1 == 1 && $element2 == 1;
      if($element0 == 0)
      {
         this.mGaugeType4.mElement0.gotoAndStop(1);
         this.mGaugeType4.mElement0._visible = false;
      }
      else
      {
         this.mGaugeType4.mElement0._visible = true;
         if($element0 == 1)
         {
            this.mGaugeType4.mElement0.gotoAndStop(1);
         }
         else if($element0 == 2)
         {
            this.mGaugeType4.mElement0.gotoAndPlay(2);
         }
         else if($element0 == 3)
         {
            this.mGaugeType4.mElement0.gotoAndStop(2);
         }
      }
      if($element1 == 0)
      {
         this.mGaugeType4.mElement1.gotoAndStop(1);
         this.mGaugeType4.mElement1._visible = false;
      }
      else
      {
         this.mGaugeType4.mElement1._visible = true;
         if($element1 == 1)
         {
            this.mGaugeType4.mElement1.gotoAndStop(1);
         }
         else if($element1 == 2)
         {
            this.mGaugeType4.mElement1.gotoAndPlay(2);
         }
         else if($element1 == 3)
         {
            this.mGaugeType4.mElement1.gotoAndStop(2);
         }
      }
      if($element2 == 0)
      {
         this.mGaugeType4.mElement2.gotoAndStop(1);
         this.mGaugeType4.mElement2._visible = false;
      }
      else
      {
         this.mGaugeType4.mElement2._visible = true;
         if($element2 == 1)
         {
            this.mGaugeType4.mElement2.gotoAndStop(1);
         }
         else if($element2 == 2)
         {
            this.mGaugeType4.mElement2.gotoAndPlay(2);
         }
         else if($element2 == 3)
         {
            this.mGaugeType4.mElement2.gotoAndStop(2);
         }
      }
      if(_loc6_)
      {
         this.mGaugeType4.mFullStack._visible = true;
         this.mGaugeType4.mFullStack._alpha = $stack * 100;
         if(this._prevStack != 1 && $stack == 1)
         {
            this.mEffect._visible = true;
            this.mEffect.gotoAndPlay(2);
         }
         this._prevStack = $stack;
      }
      else
      {
         this.mGaugeType4.mFullStack._visible = false;
         this._prevStack = -1;
      }
   }
   function comp()
   {
      this.mEffect._visible = false;
   }
   function __get__st()
   {
      return this._st;
   }
   function __set__st(value)
   {
      this._st = value;
      var _loc2_ = Math.round(this._st);
      this.mGauge.mMask.gotoAndStop(_loc2_);
      this.mGauge.mGaugeLight.gotoAndStop(_loc2_);
      return this.__get__st();
   }
   function showValue($value)
   {
      switch(this._class)
      {
         case 0:
         case 9:
         case 10:
         case 11:
         case 12:
            if($value)
            {
               this.mClass._visible = false;
               this.mFullAnim.mClassBack._visible = false;
               this.mFullClass._visible = false;
               if(this.textType == 1)
               {
                  this.tStack._visible = true;
                  this.tST0._visible = false;
                  this.tST1._visible = false;
               }
               else if(this.textType == 2)
               {
                  this.tStack._visible = false;
                  this.tST0._visible = true;
                  this.tST1._visible = true;
               }
            }
            else
            {
               this.mFullClass._visible = true;
               this.mFullAnim.mClassBack._visible = true;
               this.mClass._visible = true;
               this.tStack._visible = false;
               this.tST0._visible = false;
               this.tST1._visible = false;
            }
         default:
            this.mFullClass._visible = true;
            this.mClass._visible = true;
            this.mFullAnim.mClassBack._visible = true;
            this.tStack._visible = false;
            this.tST0._visible = false;
            this.tST1._visible = false;
            return undefined;
      }
   }
}
