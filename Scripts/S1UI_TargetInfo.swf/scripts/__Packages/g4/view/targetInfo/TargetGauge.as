class g4.view.targetInfo.TargetGauge extends MovieClip
{
   var xMin = 40;
   function TargetGauge()
   {
      super();
   }
   function onLoad()
   {
      this.mStack._visible = false;
   }
   function setData($type, $info, $nameColor, $bFreeName, $aggresive, $questType, $questName, $itemLevel)
   {
      var _loc3_ = lib.util.ExtString.split($info,"\t");
      var _loc7_ = lib.util.ExtString.split($nameColor,"\t");
      var _loc6_ = Number(_loc7_[0]).toString(16);
      var _loc4_ = Number(_loc7_[1]).toString(16);
      var _loc5_ = Number(_loc7_[2]).toString(16);
      if(_loc6_.length == 1)
      {
         _loc6_ = "0" + _loc6_;
      }
      if(_loc4_.length == 1)
      {
         _loc4_ = "0" + _loc4_;
      }
      if(_loc5_.length == 1)
      {
         _loc5_ = "0" + _loc5_;
      }
      this._textColor = Number("0x" + _loc6_ + _loc4_ + _loc5_);
      this.mTextGroup.textField.textColor = this._textColor;
      var _loc9_ = "";
      if(_loc3_[1] != null)
      {
         this._monLevel = Number(_loc3_[1]);
      }
      else
      {
         this._monLevel = -1;
      }
      this._monName = _loc3_[0];
      this.calcName();
      var _loc2_ = this.xMin;
      if($bFreeName == 0)
      {
         this.mFreeNamed._visible = false;
      }
      else
      {
         this.mFreeNamed._visible = true;
         this.mFreeNamed._x = _loc2_;
         _loc2_ = _loc2_ + 20;
      }
      if(isNaN($questType))
      {
         this.mQuest._visible = false;
      }
      else
      {
         this.mQuest._visible = true;
         this.mQuest.gotoAndStop($questType + 1);
         this.mQuest._x = _loc2_;
         _loc2_ = _loc2_ + 20;
      }
      this.mTextGroup._x = _loc2_;
      if($type == 0 || $type == 2)
      {
         this.mGauge2._visible = true;
         this.mBackground.gotoAndStop(3);
         if(this.mMark != null)
         {
            this.mIcon._visible = false;
            this.mMark._visible = true;
            this.mMark.mClass.gotoAndStop(Number(_loc3_[2]) + 1);
         }
      }
      else if($type == 4)
      {
         this.mGauge2._visible = false;
         this.mBackground.gotoAndStop(1);
         if(this.mMark != null)
         {
            this.mIcon._visible = true;
            this.mMark._visible = false;
         }
      }
      else
      {
         if($type != 3 && $type != 5)
         {
            this.mGauge._height = 16;
         }
         this.mGauge2._visible = false;
         this.mBackground.gotoAndStop(1);
         if(this.mMark != null)
         {
            this.mIcon._visible = true;
            this.mMark._visible = false;
         }
      }
      this.calcPosition();
   }
   function calcPosition()
   {
      var _loc2_ = this.xMin;
      if(this.mFreeNamed._visible)
      {
         this.mFreeNamed._x = _loc2_;
         _loc2_ = _loc2_ + 20;
      }
      if(this.mQuest._visible)
      {
         this.mQuest._x = _loc2_;
         _loc2_ = _loc2_ + 20;
      }
      this.mTextGroup._x = _loc2_;
   }
   function calcName()
   {
      var _loc2_ = "";
      if(this._monLevel > 0)
      {
         _loc2_ = "Lv. " + this._monLevel + " ";
      }
      _loc2_ = _loc2_ + this._monName;
      this.mTextGroup.textField.text = _loc2_;
      this.mTextGroup.textField._width = Math.round(this.mTextGroup.textField.textWidth + 4);
   }
   function updateHP($hp)
   {
      var _loc2_ = Math.round($hp);
      this.mGauge.gotoAndStop(_loc2_);
      if($hp < 0.1)
      {
         this.mGauge.mEffect._visible = false;
      }
      else
      {
         this.mGauge.mEffect.gotoAndPlay(2);
         this.mGauge.mEffect._visible = true;
      }
      if(this.tPercent != null)
      {
         this.tPercent.text = $hp + "%";
      }
   }
   function updateMP($mp)
   {
      if(this.mGauge2 != null)
      {
         this.mGauge2._width = 371 * ($mp / 100);
      }
   }
   function updateLevel($level)
   {
      this._monLevel = Number($level);
      this.calcName();
   }
   function setStack($stack)
   {
      this.mStack._visible = true;
      this.mStack.gotoAndStop($stack + 1);
      if(this.mGauge2._visible)
      {
         this.mStack._x = 184;
         this.mStack._y = 44;
      }
      else
      {
         this.mStack._x = 188;
         this.mStack._y = 39;
      }
   }
   function setDangerMode($mode)
   {
      var _loc2_ = this.mTextGroup.textField.text;
      this.mIcon.gotoAndStop($mode + 1);
      if(this.mBackground._currentframe != 3)
      {
         this.mBackground.gotoAndStop($mode + 1);
      }
   }
}
