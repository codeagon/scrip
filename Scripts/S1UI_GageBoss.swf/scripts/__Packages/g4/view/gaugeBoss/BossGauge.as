class g4.view.gaugeBoss.BossGauge extends MovieClip
{
   var isActive = false;
   var gaugeWidth = 490;
   var isCritical = false;
   function BossGauge()
   {
      super();
   }
   function onLoad()
   {
      this.tName = this.mNameGroup.textField;
      this.mGauge0 = this.mGaugeGroup.mGauge0;
      this.mGauge1 = this.mGaugeGroup.mGauge1;
      this.mGauge_Effect = this.mGaugeGroup.mGauge_Effect;
      this.mMask = this.mGaugeGroup.mMask;
      this.mLineEffect = this.mGaugeGroup.mLineEffect;
      this.mDanger.stop();
      this.mDanger._visible = false;
      this.mTime.textField.textAutoSize = "shrink";
   }
   function setData($name, $level, $levelType, $questType, $showHP)
   {
      this._levelType = $levelType;
      if(this._levelType == 1)
      {
         this.tName.textColor = 10885144;
      }
      else
      {
         this.tName.textColor = 15329772;
      }
      this.tName.text = "Lv. " + $level + " " + $name;
      this.tName._width = Math.round(this.tName.textWidth + 4);
      if($questType == null || $questType == -1)
      {
         this.mQuest._visible = false;
         this.mNameGroup._x = 51;
      }
      else
      {
         this.mQuest._visible = true;
         this.mQuest.gotoAndStop($questType + 1);
         this.mNameGroup._x = 66;
      }
      this.mStack._visible = false;
      if($showHP == null)
      {
         $showHP = true;
      }
      if(!$showHP)
      {
         this.mBackground.gotoAndStop(3);
      }
      else
      {
         this.mBackground.gotoAndStop(1);
      }
      this._hpVisible = $showHP;
      this.mGauge0._visible = this.mGauge1._visible = $showHP;
      this.mGauge_Effect._visible = this.mLineEffect._visible = $showHP;
      this.tHP._visible = this.tMultiple._visible = $showHP;
   }
   function setHP($current, $max, $rank)
   {
      $current = Number($current);
      $max = Number($max);
      $rank = Number($rank);
      this.max = $max;
      this.cuttingGauge = $max / $rank;
      this.resize = this.gaugeWidth / this.cuttingGauge;
      gs.TweenLite.killTweensOf(this.mMask.gMask,false);
      gs.TweenLite.killTweensOf(this.mGauge_Effect.gMask,false);
      var _loc7_ = $current % this.cuttingGauge;
      var _loc5_ = 1;
      if(_loc7_ == 0)
      {
         _loc5_ = 0;
      }
      this.prevRank = int($current / this.cuttingGauge) + _loc5_;
      this.percent = int($current / $max * 100);
      this.setGaugeColor();
      var _loc4_ = Math.round($current % this.cuttingGauge / this.cuttingGauge * this.gaugeWidth);
      this.mMask.gMask._width = _loc4_;
      if(_loc4_ == 0)
      {
         this.mMask.gMask._width = this.gaugeWidth;
      }
      if(this.mMask.gMask._width == this.gaugeWidth)
      {
         this.prevRank = this.prevRank - 1;
      }
      this.setText();
      this.mGauge_Effect.gMask._width = _loc4_;
   }
   function updateHP($current, $critical)
   {
      $current = Number($current);
      $critical = Number($critical);
      var _loc3_ = 0;
      this.percent = int($current / this.max * 100);
      this.setText();
      if(this.max < $current)
      {
         _loc3_ = this.max;
      }
      else if(0 >= $current)
      {
         _loc3_ = 1;
      }
      else
      {
         _loc3_ = $current;
      }
      this.isCritical = $critical == 1;
      gs.TweenLite.killTweensOf(this.mMask.gMask,false);
      gs.TweenLite.killTweensOf(this.mGauge_Effect.gMask,false);
      var _loc4_ = this.mMask.gMask._width / this.resize + (this.prevRank - 1) * this.cuttingGauge;
      if(_loc4_ < $current)
      {
         this.gaugeUpMotion(_loc3_ - _loc4_);
      }
      else if(_loc4_ > $current)
      {
         this.gaugeDownMotion(_loc4_ - _loc3_);
      }
   }
   function gaugeDownMotion($value)
   {
      var _loc3_ = this.mMask.gMask._width;
      var _loc2_ = $value - _loc3_ / this.resize;
      var _loc4_ = 0.5;
      if(this.isCritical)
      {
         gs.TweenLite.killTweensOf(this,false);
         this._x = 0;
         this._y = 9;
         gs.TweenLite.to(this,0.05,{_x:-5,_y:5,onComplete:g4.util.Delegate.create(this,this.boundEnd)});
      }
      if(this._hpVisible)
      {
         this.mGauge_Effect._visible = true;
      }
      this.mLineEffect.gotoAndPlay(2);
      if(_loc2_ >= 0)
      {
         this.mGauge_Effect.gMask._width = _loc3_;
         this.mMask.gMask._width = 1;
         this.mLineEffect._x = -20;
         _loc4_ = this.mGauge_Effect.gMask._width * 0.001;
         gs.TweenLite.to(this.mGauge_Effect.gMask,_loc4_,{_width:1,ease:gs.easing.Linear.easeOut,onComplete:g4.util.Delegate.create(this,this.gaugeDownMotionEnd),onCompleteParams:[_loc2_]});
      }
      else
      {
         _loc2_ = this.gaugeWidth * (_loc3_ / this.resize - $value) / this.cuttingGauge;
         this.mGauge_Effect.gMask._width = _loc3_;
         this.mMask.gMask._width = _loc2_;
         this.mLineEffect._x = _loc2_ - 21;
         gs.TweenLite.to(this.mGauge_Effect.gMask,0.3,{delay:0.1,_width:_loc2_,ease:gs.easing.Linear.easeOut,onComplete:g4.util.Delegate.create(this,this.effectDownEnd)});
      }
   }
   function effectDownEnd()
   {
      this.mGauge_Effect._visible = false;
   }
   function boundEnd()
   {
      gs.TweenLite.killTweensOf(this,false);
      gs.TweenLite.to(this,0.1,{_x:0,_y:9,ease:gs.easing.Linear.easeOut});
   }
   function gaugeDownMotionEnd($value)
   {
      this.prevRank = this.prevRank - 1;
      this.setText();
      this.setGaugeColor();
      this.gaugeDownMotion($value);
   }
   function gaugeUpMotion($value)
   {
      var _loc3_ = this.mMask.gMask._width;
      var _loc2_ = $value - (this.gaugeWidth + 1 - _loc3_) / this.resize;
      var _loc4_ = 0.5;
      this.mGauge_Effect.gMask._width = 1;
      if(_loc2_ >= 0)
      {
         _loc4_ = (this.gaugeWidth - _loc3_) * 0.001;
         gs.TweenLite.to(this.mMask.gMask,_loc4_,{_width:this.gaugeWidth,onComplete:g4.util.Delegate.create(this,this.gaugeUpMotionEnd),onCompleteParams:[_loc2_]});
      }
      else
      {
         _loc2_ = this.gaugeWidth * (_loc3_ / this.resize + $value) / this.cuttingGauge;
         gs.TweenLite.to(this.mMask.gMask,0.3,{_width:_loc2_});
      }
   }
   function gaugeUpMotionEnd($pointNumber)
   {
      this.prevRank = this.prevRank + 1;
      this.setText();
      this.setGaugeColor();
      this.mMask.gMask._width = 1;
      this.gaugeUpMotion($pointNumber);
   }
   function setText()
   {
      this.tHP.text = this.percent + "%";
      this.tMultiple.text = "X" + this.prevRank;
   }
   function setGaugeColor()
   {
      var _loc3_ = (this.prevRank - 1) % 4;
      var _loc4_ = (this.prevRank - 2) % 4;
      if(this.prevRank == 2)
      {
         this.mGauge1.gotoAndStop(5);
      }
      else if(this.prevRank == 1)
      {
         this.mGauge0.gotoAndStop(5);
         this.mGauge_Effect.gotoAndStop(5);
         this.mGauge1.gotoAndStop(6);
      }
      else
      {
         this.mGauge0.gotoAndStop((this.prevRank - 1) % 4 + 1);
         this.mGauge_Effect.gotoAndStop((this.prevRank - 1) % 4 + 1);
         this.mGauge1.gotoAndStop((this.prevRank - 2) % 4 + 1);
      }
      this.mLineEffect.mc0.gotoAndStop(this.mGauge0._currentframe);
      this.mLineEffect.mc1.gotoAndStop(this.mGauge0._currentframe);
      this.mMask.gMask._width = this.gaugeWidth;
      this.mGauge_Effect.gMask._width = this.gaugeWidth;
      var _loc2_ = new flash.geom.ColorTransform();
      _loc2_.redMultiplier = 0;
      _loc2_.greenMultiplier = 0;
      _loc2_.blueMultiplier = 0;
      switch(this.mGauge0._currentframe)
      {
         case 1:
            _loc2_.redOffset = 102;
            _loc2_.greenOffset = 5;
            _loc2_.blueOffset = 142;
            break;
         case 2:
            _loc2_.redOffset = 5;
            _loc2_.greenOffset = 50;
            _loc2_.blueOffset = 142;
            break;
         case 3:
            _loc2_.redOffset = 4;
            _loc2_.greenOffset = 122;
            _loc2_.blueOffset = 40;
            break;
         case 4:
            _loc2_.redOffset = 142;
            _loc2_.greenOffset = 76;
            _loc2_.blueOffset = 5;
            break;
         case 5:
            _loc2_.redOffset = 155;
            _loc2_.greenOffset = 33;
            _loc2_.blueOffset = 6;
            break;
         default:
            _loc2_.redOffset = 155;
            _loc2_.greenOffset = 33;
            _loc2_.blueOffset = 6;
      }
      this.mGauge_Effect.transform.colorTransform = _loc2_;
   }
   function setDanger($value)
   {
      this.mMark._visible = !$value;
      if($value)
      {
         if(this.mTime._currentframe == 1 || this.mTime._currentframe >= 80)
         {
            this.mTime.gotoAndPlay(2);
         }
      }
      else
      {
         this.mTime.gotoAndPlay(80);
      }
      if(this._hpVisible)
      {
         this.mBackground.gotoAndStop(!$value?1:2);
      }
      var _loc3_ = this.mNameGroup.textField.text;
      this.mNameGroup.gotoAndStop(!$value?1:2);
      this.mNameGroup.textField.text = _loc3_;
      this.mDanger._visible = $value;
      this.mTime.mText.textField.text = "";
      if($value)
      {
         this.mDanger.gotoAndPlay(2);
         if(this._levelType == 1)
         {
            this.tName.textColor = 16777215;
         }
         else
         {
            this.tName.textColor = 15329772;
         }
      }
      else
      {
         this.mDanger.gotoAndStop(1);
         if(this._levelType == 1)
         {
            this.tName.textColor = 10885144;
         }
         else
         {
            this.tName.textColor = 15329772;
         }
      }
   }
   function setStack($stack)
   {
      this.mStack._visible = true;
      this.mStack.gotoAndStop($stack + 1);
   }
   function setDangerTime($time)
   {
      if($time == -100)
      {
         this.mTime.mText.textField.text = "?";
      }
      else
      {
         this.mTime.mText.textField.text = String($time);
      }
   }
}
