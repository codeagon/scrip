class lib.controls.S_Slider extends MovieClip
{
   var active = true;
   var valueTip = true;
   var returnLevel = false;
   var isRealTime = false;
   var showSpaceBar = true;
   var MINALPHA = 30;
   var MAXALPHA = 100;
   var showTipMarkValue = false;
   var isProtageValue = false;
   var showSplit = false;
   var lineclick = true;
   var SLIDEBAR_DRAG = lib.manager.UISound.SLIDEBAR_DRAG;
   var SLIDEBAR_DROP = lib.manager.UISound.SLIDEBAR_DROP;
   function S_Slider()
   {
      super();
      this.titleColor = lib.info.TextColor.GENERAL_CONTENTS;
      this._barGageMcTy = this.barGageMc._x;
      this.keyListner = {};
      this.keyListner.onKeyUp = function()
      {
         if(Key.getCode() == 13)
         {
            Selection.setFocus(null);
         }
      };
      this.init();
      this.valueMc.focus_mc._visible = false;
      this.valueMc.txt.textColor = lib.info.TextColor.SLIDER_INPUT_NORMAL;
      this.ext_textField = new lib.util.ExtTextField(this.valueMc.txt,1,this.valueMc.focus_mc);
      this.ext_textField.exceptComma = true;
      this.ext_textField.useAciveColor = false;
      this.resize();
   }
   function init()
   {
      this.onInit();
      this.draw();
   }
   function draw()
   {
      this.min_txt.autoSize = "left";
      this.max_txt.autoSize = "right";
      this.drager_mc.valueMc._visible = false;
      this.barGageMc._alpha = 30;
   }
   function resize()
   {
      var _loc2_ = this._width;
      this._xscale = 100;
      this.valueMc._x = _loc2_ - this.valueMc._width - 18.5;
      this.bg_mc._width = _loc2_ - (this.valueMc._width + 27.2) - 18.5;
      this.titleTx._width = _loc2_ - this.titleTx._x;
   }
   function clear()
   {
      for(var _loc2_ in this.split_mc)
      {
         if(typeof this.split_mc[_loc2_] == "movieclip")
         {
            this.split_mc[_loc2_].removeMovieClip();
         }
      }
      this.__set__title("");
   }
   function setData(minV, minStr, maxV, maxStr, currentV, numSplit)
   {
      this.clear();
      this.__set__title(this._title);
      this.drager_mc.valueMc._visible = this.valueTip;
      var _loc10_ = this.split_mc._name;
      var _loc9_ = this.split_mc.getDepth();
      this.createEmptyMovieClip(_loc10_,_loc9_);
      this.dragSplit = undefined;
      this.Int = true;
      if(String(maxV + minV).indexOf(".") != -1)
      {
         this.Int = false;
      }
      this.minV = Number(minV);
      this.maxV = Number(maxV);
      this.currentV = Number(currentV);
      this.min_txt.text = minStr;
      this.max_txt.text = maxStr;
      this.w = this.bg_mc._width;
      this.dragY = this.drager_mc._y;
      var _this = this;
      this.setInputMode();
      if(numSplit != undefined && Number(numSplit) != 0)
      {
         this.dragSplit = Number(numSplit) - 1;
         var _loc2_ = 0;
         while(_loc2_ <= this.dragSplit)
         {
            var _loc3_ = this.split_mc.attachMovie("dragSplit","dragSplit" + _loc2_,_loc2_);
            _loc3_.index = _loc2_;
            _loc3_._visible = this.showSpaceBar && _loc2_ != 0 && _loc2_ != this.dragSplit || this.showSplit;
            if(this.Int)
            {
               _loc3_.value = Math.round(_loc2_ / this.dragSplit * (this.maxV - this.minV) + this.minV);
            }
            else
            {
               _loc3_.value = _loc2_ / this.dragSplit * (this.maxV - this.minV) + this.minV;
            }
            _loc3_.txt.text = _loc3_.value;
            _loc3_._x = _loc2_ / this.dragSplit * this.w;
            _loc3_._y = 11.2;
            _loc2_ = _loc2_ + 1;
         }
      }
      this.drager_mc.onPress = function()
      {
         if(!_this.active)
         {
            return undefined;
         }
         this.startDrag(false,0,_this.dragY,_this.w,_this.dragY);
         this.valueMc._visible = _this.valueTip;
         this.dragerMc.gotoAndStop(3);
         this.onEnterFrame = function()
         {
            _this.barGageMc._width = _this.drager_mc._x - _this._barGageMcTy;
            var _loc3_ = this._x / _this.w * (_this.maxV - _this.minV) + _this.minV;
            if(_this.Int)
            {
               _loc3_ = Math.round(_loc3_);
            }
            if(_this.dragSplit != undefined)
            {
               var _loc2_ = null;
               for(var _loc5_ in _this.split_mc)
               {
                  if(typeof _this.split_mc[_loc5_] == "movieclip")
                  {
                     if(_loc2_ == null)
                     {
                        _loc2_ = _this.split_mc[_loc5_];
                     }
                     else if(Math.abs(_this.split_mc[_loc5_].value - _loc3_) < Math.abs(_loc2_.value - _loc3_))
                     {
                        _loc2_ = _this.split_mc[_loc5_];
                     }
                  }
               }
               var _loc4_ = _loc2_.index;
               if(!_this.showTipMarkValue)
               {
                  _this.setValueStr(_loc2_.value);
                  _this.drager_mc.valueMc.txt.text = _loc2_.value;
               }
               else
               {
                  _this.setValueStr(1 + _loc4_);
                  _this.drager_mc.valueMc.txt.text = 1 + _loc4_;
               }
               if(_this.currentLevel != _loc4_)
               {
                  lib.manager.UISound.play(_this.SLIDEBAR_DRAG);
               }
               if(_this.isRealTime)
               {
                  if(_this.returnLevel && _this.currentLevel != _loc4_)
                  {
                     _this.currentV = _loc3_;
                     _this.currentLevel = _loc4_;
                     _this.onChanged(_this.currentLevel,_this);
                  }
                  else if(!_this.returnLevel && _this.currentV != _loc3_)
                  {
                     _this.currentV = _loc3_;
                     _this.currentLevel = _loc4_;
                     _this.onChanged(_loc2_.value,_this);
                  }
               }
               else
               {
                  _this.currentV = _loc2_.value;
                  _this.currentLevel = _loc4_;
               }
            }
            else
            {
               _this.currentV = _loc3_;
               if(!_this.showTipMarkValue)
               {
                  _this.setValueStr(_this.currentV);
                  _this.drager_mc.valueMc.txt.text = _this.currentV;
                  if(_this.isRealTime)
                  {
                     _this.onChanged(_this.currentV,_this);
                  }
               }
            }
         };
      };
      this.drager_mc.onRelease = function()
      {
         if(!_this.active)
         {
            return undefined;
         }
         lib.manager.UISound.play(_this.SLIDEBAR_DROP);
         delete this.onEnterFrame;
         _this.releaseSlide();
         if(!_this.isRealTime)
         {
            if(_this.returnLevel)
            {
               _this.onChanged(_this.currentLevel,_this);
            }
            else
            {
               _this.onChanged(_this.currentV,_this);
            }
         }
      };
      this.drager_mc.onReleaseOutside = function()
      {
         _this.barGageMc._alpha = 30;
         if(!_this.active)
         {
            return undefined;
         }
         lib.manager.UISound.play(_this.SLIDEBAR_DROP);
         _this.releaseSlide();
         if(_this.returnLevel)
         {
            _this.onChanged(_this.currentLevel,_this);
         }
         else
         {
            _this.onChanged(_this.currentV,_this);
         }
         this.dragerMc.gotoAndStop(1);
      };
      this.drager_mc.onRollOver = function()
      {
         _this.barGageMc._alpha = 100;
         this.dragerMc.gotoAndStop(2);
      };
      this.drager_mc.onRollOut = function()
      {
         _this.barGageMc._alpha = 30;
         this.dragerMc.gotoAndStop(1);
      };
      this.bg_mc.onRollOver = function()
      {
         _this.barGageMc._alpha = 100;
         this._parent.drager_mc.dragerMc.gotoAndStop(2);
      };
      this.bg_mc.onRollOut = this.bg_mc.onReleaseOutside = function()
      {
         _this.barGageMc._alpha = 30;
         this._parent.drager_mc.dragerMc.gotoAndStop(1);
      };
      if(this.lineclick == true)
      {
         this.bg_mc.onPress = function()
         {
            if(!_this.active)
            {
               return undefined;
            }
            delete this.onEnterFrame;
            _this.drager_mc._x = _this._xmouse;
            this.releaseEffect();
            _this.drager_mc.onPress();
         };
      }
      if(this.lineclick == true)
      {
         this.bg_mc.onRelease = this.bg_mc.onReleaseOutside = function()
         {
            _this.drager_mc.onRelease();
         };
      }
      this.active = true;
      this.setSlider();
   }
   function setSlider()
   {
      if(this.returnLevel)
      {
         this.drager_mc._x = this.split_mc["dragSplit" + this.currentV]._x;
         this.currentLevel = this.currentV;
      }
      else
      {
         var _loc2_ = this.w * (this.currentV - this.minV) / (this.maxV - this.minV);
         this.drager_mc._x = _loc2_;
         this.releaseSlide();
      }
      this.barGageMc._width = Math.max(0,this.drager_mc._x - this._barGageMcTy);
      if(!this.showTipMarkValue)
      {
         this.setValueStr(this.currentV);
         this.drager_mc.valueMc.txt.text = this.currentV;
      }
      else
      {
         this.setValueStr(1 + this.currentLevel);
         this.drager_mc.valueMc.txt.text = 1 + this.currentLevel;
      }
   }
   function setValueStr(v)
   {
      if(!this.isProtageValue)
      {
         this.valueMc.txt.text = v;
      }
      else
      {
         var _loc2_ = (v - this.minV) / (this.maxV - this.minV) * 100;
         _loc2_ = Math.round(_loc2_);
         this.valueMc.txt.text = _loc2_ + "%";
      }
   }
   function setInputMode()
   {
      var _this = this;
      this.valueMc.txt.onSetFocus = function()
      {
         Key.addListener(_this.keyListner);
         this.text = "";
         _global.inputing = true;
         var _loc3_ = _this.valueMc.focus_mc;
         _loc3_._visible = true;
         _loc3_.gotoAndPlay(2);
         lib.manager.Focus.setFocusGroup(this);
      };
      this.valueMc.txt.onKillFocus = function()
      {
         Key.removeListener(_this.keyListner);
         _global.inputing = false;
         if(!isNaN(this.text))
         {
            if(_this.isProtageValue)
            {
               var _loc3_ = int(this.text) / 100 * (_this.maxV - _this.minV) + _this.minV;
               _loc3_ = Math.min(_this.maxV,_loc3_);
               _loc3_ = Math.max(_this.minV,_loc3_);
               _this.currentV = _loc3_;
            }
            else
            {
               _loc3_ = !_this.Int?Number(this.text):int(this.text);
               _loc3_ = Math.min(_this.maxV,_loc3_);
               _loc3_ = Math.max(_this.minV,_loc3_);
               _this.currentV = _loc3_;
            }
         }
         _this.setValueStr(_this.currentV);
         _this.setSlider();
         _this.drager_mc.onRelease();
         var _loc4_ = _this.valueMc.focus_mc;
         _loc4_._visible = false;
         _loc4_.gotoAndStop(1);
         lib.manager.Focus.stop();
      };
   }
   function releaseSlide()
   {
      this.stopDrag();
      delete this.drager_mc;
      var _loc3_ = this.drager_mc._x / this.w * (this.maxV - this.minV) + this.minV;
      if(this.Int)
      {
         _loc3_ = Math.round(_loc3_);
      }
      if(this.dragSplit != undefined)
      {
         var _loc2_ = null;
         for(var _loc4_ in this.split_mc)
         {
            if(typeof this.split_mc[_loc4_] == "movieclip")
            {
               if(_loc2_ == null)
               {
                  _loc2_ = this.split_mc[_loc4_];
               }
               else if(Math.abs(this.split_mc[_loc4_].value - _loc3_) < Math.abs(_loc2_.value - _loc3_))
               {
                  _loc2_ = this.split_mc[_loc4_];
               }
            }
         }
         this.drager_mc._x = _loc2_._x;
         this.barGageMc._width = this.drager_mc._x - this._barGageMcTy;
         this.releaseEffect();
         this.currentLevel = _loc2_.index;
         this.currentV = _loc2_.value;
         if(!this.showTipMarkValue)
         {
            this.drager_mc.valueMc.txt.text = this.currentV;
         }
         else
         {
            this.drager_mc.valueMc.txt.text = 1 + this.currentLevel;
         }
      }
      this.bg_mc.gotoAndStop(1);
   }
   function __set__title(_t)
   {
      if(_t == "" || _t == undefined)
      {
         return undefined;
      }
      this.titleTx.autoSize = "left";
      this.titleTx.text = _t;
      return this.__get__title();
   }
   function setMarker(count, flag)
   {
      var _loc4_ = count;
      var _loc5_ = this.bg_mc._width;
      var _loc2_ = 0;
      while(_loc2_ <= _loc4_)
      {
         var _loc3_ = this.split_mc.attachMovie("dragSplit","dragSplit" + _loc2_,_loc2_);
         _loc3_._x = _loc2_ / _loc4_ * _loc5_;
         if(_loc2_ == 0)
         {
            _loc3_._x = _loc3_._x + _loc3_._width / 4;
         }
         else if(_loc2_ == _loc4_)
         {
            _loc3_._x = _loc3_._x - _loc3_._width / 4;
         }
         _loc3_._y = 11.2;
         if(flag)
         {
            if(_loc2_ != _loc4_ / 2 && _loc2_ != 0 && _loc2_ != _loc4_)
            {
               _loc3_.gotoAndStop(2);
            }
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function releaseEffect()
   {
   }
   function onInit()
   {
   }
   function onChanged(_value, _this)
   {
   }
   function setEnable(enable)
   {
      if(enable)
      {
         this.titleTx.textColor = this.titleColor;
         this.drager_mc.dragerMc.gotoAndStop(4);
         this.bg_mc._alpha = 100;
         this.barGageMc._alpha = 100;
         this.valueMc._alpha = 100;
         this.split_mc._alpha = 100;
      }
      else
      {
         this.titleTx.textColor = lib.info.TextColor.CHECKBTN_DISABLE;
         this.drager_mc.dragerMc.gotoAndStop(1);
         this.bg_mc._alpha = lib.info.TextColor.GENERAL_DISABLE_ALPHA;
         this.barGageMc._alpha = lib.info.TextColor.GENERAL_DISABLE_ALPHA;
         this.valueMc._alpha = lib.info.TextColor.GENERAL_DISABLE_ALPHA;
         this.split_mc._alpha = lib.info.TextColor.GENERAL_DISABLE_ALPHA;
      }
      this.drager_mc.hitTestDisable = !enable;
      this.bg_mc.hitTestDisable = !enable;
      this.valueMc.txt.selectable = enable;
   }
   function onUnload()
   {
      Key.removeListener(this.keyListner);
   }
}
