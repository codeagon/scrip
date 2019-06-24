class lib.controls.S_NumberSteper extends MovieClip
{
   var INTERVERLSPPED = 200;
   var currentIntervalSP = 0;
   var NUMBERSTEPER_BTN = lib.manager.UISound.NUMBERSTEPER_BTN;
   function S_NumberSteper()
   {
      super();
      this.display();
      this.intervalIds = [];
      this.currentIntervalSP = 0;
      this.ext_textField = new lib.util.ExtTextField(this.inputFd,1);
      this.inputFd.textColor = lib.info.TextColor.PAGE_NORMAL;
      _global.gfxExtensions = true;
      this.inputFd.textAutoSize = "shrink";
      var _this = this;
      this.ext_textField.onChanged = function(changed)
      {
         _this.onChanged(changed);
         if(this.max == this.text)
         {
            _this.right_mc.gotoAndStop(4);
            _this.max_mc.gotoAndStop(4);
         }
         else if(_this.right_mc._currentframe == 4)
         {
            _this.right_mc.gotoAndStop(1);
            _this.max_mc.gotoAndStop(1);
         }
         if(this.min == this.text)
         {
            _this.left_mc.gotoAndStop(4);
            _this.min_mc.gotoAndStop(4);
         }
         else if(_this.left_mc._currentframe == 4)
         {
            _this.left_mc.gotoAndStop(1);
            _this.min_mc.gotoAndStop(1);
         }
         _this.right_mc.enabled = this.max != this.text;
         _this.max_mc.enabled = this.max != this.text;
         _this.left_mc.enabled = this.min != this.text;
         _this.min_mc.enabled = this.min != this.text;
      };
      this.ext_textField.onSetFocusEvent = function()
      {
         trace("onSetFocusEvent  ");
         _this.overEffectMc._alpha = 100;
      };
      this.ext_textField.onKillFocusEvent = function()
      {
         _this.overEffectMc._alpha = 0;
      };
      this.right_mc.enabled = false;
      this.max_mc.enabled = false;
      this.left_mc.enabled = false;
      this.min_mc.enabled = false;
      this.right_mc.gotoAndStop(4);
      this.max_mc.gotoAndStop(4);
      this.left_mc.gotoAndStop(4);
      this.min_mc.gotoAndStop(4);
      this.right_mc.onPress = function()
      {
         if(_this.ext_textField.max == _this.ext_textField.text)
         {
            return undefined;
         }
         lib.manager.UISound.play(_this.NUMBERSTEPER_BTN);
         _this.clearIntervals();
         _this.currentIntervalSP = 0;
         _this.intervalIds.push(setInterval(_this,"addCount",_this.INTERVERLSPPED,1));
         this.gotoAndStop(3);
      };
      this.right_mc.onRelease = function()
      {
         if(_this.ext_textField.max == _this.ext_textField.text)
         {
            return undefined;
         }
         this.gotoAndStop(1);
         _this.clearIntervals();
         _this.addCount(1);
      };
      this.right_mc.onRollOver = function()
      {
         if(_this.ext_textField.max == _this.ext_textField.text)
         {
            return undefined;
         }
         this.gotoAndStop(2);
      };
      this.right_mc.onRollOut = this.right_mc.onReleaseOutside = function()
      {
         if(_this.ext_textField.max == _this.ext_textField.text)
         {
            return undefined;
         }
         _this.clearIntervals();
         this.gotoAndStop(1);
      };
      this.left_mc.onPress = function()
      {
         if(_this.ext_textField.min == _this.ext_textField.text)
         {
            return undefined;
         }
         lib.manager.UISound.play(_this.NUMBERSTEPER_BTN);
         _this.clearIntervals();
         _this.currentIntervalSP = 0;
         _this.intervalIds.push(setInterval(_this,"addCount",_this.INTERVERLSPPED,-1));
         this.gotoAndStop(3);
      };
      this.left_mc.onRelease = function()
      {
         if(_this.ext_textField.min == _this.ext_textField.text)
         {
            return undefined;
         }
         this.gotoAndStop(1);
         _this.clearIntervals();
         _this.addCount(-1);
      };
      this.left_mc.onRollOver = function()
      {
         if(_this.ext_textField.min == _this.ext_textField.text)
         {
            return undefined;
         }
         this.gotoAndStop(2);
      };
      this.left_mc.onRollOut = this.left_mc.onReleaseOutside = function()
      {
         if(_this.ext_textField.min == _this.ext_textField.text)
         {
            return undefined;
         }
         _this.clearIntervals();
         this.gotoAndStop(1);
      };
      this.max_mc.onPress = function()
      {
         if(_this.ext_textField.max == _this.ext_textField.text)
         {
            return undefined;
         }
         lib.manager.UISound.play(_this.NUMBERSTEPER_BTN);
         this.gotoAndStop(3);
         var _loc2_ = _this.ext_textField.max;
         _this.ext_textField.text = _loc2_;
         _this.ext_textField.setChanged(true);
      };
      this.max_mc.onRollOver = function()
      {
         if(_this.ext_textField.max == _this.ext_textField.text)
         {
            return undefined;
         }
         this.gotoAndStop(2);
      };
      this.max_mc.onRollOut = this.max_mc.onRelease = this.max_mc.onReleaseOutside = function()
      {
         if(_this.ext_textField.max == _this.ext_textField.text)
         {
            return undefined;
         }
         this.gotoAndStop(1);
      };
      this.min_mc.onPress = function()
      {
         if(_this.ext_textField.min == _this.ext_textField.text)
         {
            return undefined;
         }
         lib.manager.UISound.play(_this.NUMBERSTEPER_BTN);
         this.gotoAndStop(3);
         var _loc2_ = _this.ext_textField.min;
         _this.ext_textField.text = _loc2_;
         _this.ext_textField.setChanged(true);
      };
      this.min_mc.onRollOver = function()
      {
         if(_this.ext_textField.min == _this.ext_textField.text)
         {
            return undefined;
         }
         this.gotoAndStop(2);
      };
      this.min_mc.onRollOut = this.min_mc.onRelease = this.min_mc.onReleaseOutside = function()
      {
         if(_this.ext_textField.min == _this.ext_textField.text)
         {
            return undefined;
         }
         this.gotoAndStop(1);
      };
      _global.EventBroadCaster.addListener(this);
   }
   function display()
   {
      if(this._xscale == 100)
      {
         return undefined;
      }
   }
   function onChanged(changed)
   {
   }
   function clearIntervals()
   {
      var _loc2_ = this.intervalIds.shift();
      while(_loc2_ != undefined)
      {
         clearInterval(_loc2_);
         _loc2_ = this.intervalIds.shift();
      }
   }
   function addCount(size)
   {
      var _loc2_ = Number(this.ext_textField.__get__text());
      if(isNaN(_loc2_))
      {
         _loc2_ = 0;
      }
      _loc2_ = Math.min(_loc2_ + size,this.ext_textField.__get__max());
      _loc2_ = Math.max(_loc2_,this.ext_textField.__get__min());
      this.ext_textField.__set__text(_loc2_);
      if(_loc2_ == this.ext_textField.__get__min() || this.ext_textField.__get__max() == _loc2_)
      {
         this.clearIntervals();
         return undefined;
      }
      this.currentIntervalSP = this.currentIntervalSP + 1;
      if(this.currentIntervalSP == 5)
      {
         this.clearIntervals();
         this.intervalIds.push(setInterval(this,"addCount",this.INTERVERLSPPED / 3,size));
      }
      if(this.currentIntervalSP == 7)
      {
         this.clearIntervals();
         this.intervalIds.push(setInterval(this,"addCount",this.INTERVERLSPPED / 10,size));
      }
      if(this.currentIntervalSP == 10)
      {
         this.clearIntervals();
         this.intervalIds.push(setInterval(this,"addCount",this.INTERVERLSPPED / 20,size));
      }
      this.ext_textField.setChanged(true);
   }
   function __set__min(pmin)
   {
      this.ext_textField.__set__min(Number(pmin));
      return this.__get__min();
   }
   function __set__max(pmax)
   {
      this.ext_textField.__set__max(Number(pmax));
      return this.__get__max();
   }
   function __set__text(pvalue)
   {
      this.ext_textField.__set__text(pvalue);
      return this.__get__text();
   }
   function __get__text()
   {
      return this.ext_textField.__get__text();
   }
   function __set__caption(pcaption)
   {
      this.ext_textField.__set__caption(pcaption);
      return this.__get__caption();
   }
   function setNumber(_min, _max, _current)
   {
      if(_current == undefined)
      {
         _current = "";
      }
      this.__set__min(_min);
      this.__set__max(_max);
      this.__set__text(_current);
   }
   function setPage(currentPage, totalPage, flag)
   {
      this.ext_textField.__get__textField().selectable = false;
      this.ext_textField.__get__textField().text = currentPage + " / " + totalPage;
      this.right_mc.enabled = totalPage != currentPage;
      this.max_mc.enabled = totalPage != currentPage;
      this.left_mc.enabled = 1 != currentPage;
      this.min_mc.enabled = 1 != currentPage;
      if(totalPage == currentPage)
      {
         this.right_mc.gotoAndStop(4);
         this.max_mc.gotoAndStop(4);
      }
      else
      {
         this.right_mc.gotoAndStop(1);
         this.max_mc.gotoAndStop(1);
      }
      if(totalPage - currentPage < 10)
      {
         this.right2_mc.enabled = false;
         this.right2_mc.gotoAndStop(4);
      }
      else
      {
         this.right2_mc.enabled = true;
         this.right2_mc.gotoAndStop(1);
      }
      if(1 == currentPage)
      {
         this.left_mc.gotoAndStop(4);
         this.min_mc.gotoAndStop(4);
      }
      else
      {
         this.left_mc.gotoAndStop(1);
         this.min_mc.gotoAndStop(1);
      }
      if(currentPage < 11)
      {
         this.left2_mc.enabled = false;
         this.left2_mc.gotoAndStop(4);
      }
      else
      {
         this.left2_mc.enabled = true;
         this.left2_mc.gotoAndStop(1);
      }
      var _this = this;
      delete this.ext_textField.onChanged;
      this.right_mc.onPress = function()
      {
         lib.manager.UISound.play(_this.NUMBERSTEPER_BTN);
         this.gotoAndStop(3);
      };
      this.right_mc.onRelease = function()
      {
         this.gotoAndStop(1);
         _this.onChanged(currentPage + 1);
      };
      this.right_mc.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      this.right_mc.onRollOut = this.right_mc.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      this.left_mc.onPress = function()
      {
         lib.manager.UISound.play(_this.NUMBERSTEPER_BTN);
         this.gotoAndStop(3);
      };
      this.left_mc.onRelease = function()
      {
         this.gotoAndStop(1);
         _this.onChanged(currentPage - 1);
      };
      this.left_mc.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      this.left_mc.onRollOut = this.left_mc.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      this.max_mc.onPress = function()
      {
         lib.manager.UISound.play(_this.NUMBERSTEPER_BTN);
         _this.onChanged(totalPage);
      };
      this.max_mc.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      this.max_mc.onRollOut = this.max_mc.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      this.min_mc.onPress = function()
      {
         lib.manager.UISound.play(_this.NUMBERSTEPER_BTN);
         _this.onChanged(1);
      };
      this.min_mc.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      this.min_mc.onRollOut = this.min_mc.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      if(flag == true)
      {
         this.left2_mc._visible = true;
         this.right2_mc._visible = true;
         this.min_mc._x = this.left2_mc._x - 49;
         this.max_mc._x = this.right2_mc._x + 49;
         this.left2_mc.onPress = function()
         {
            lib.manager.UISound.play(_this.NUMBERSTEPER_BTN);
            var _loc1_ = Math.max(1,currentPage - 10);
            _this.onChanged(_loc1_);
         };
         this.left2_mc.onRollOver = function()
         {
            this.gotoAndStop(2);
         };
         this.left2_mc.onRollOut = this.min_mc.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
         };
         this.right2_mc.onPress = function()
         {
            lib.manager.UISound.play(_this.NUMBERSTEPER_BTN);
            var _loc1_ = Math.min(totalPage,currentPage + 10);
            _this.onChanged(_loc1_);
         };
         this.right2_mc.onRollOver = function()
         {
            this.gotoAndStop(2);
         };
         this.right2_mc.onRollOut = this.min_mc.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
         };
      }
      _global.EventBroadCaster.removeListener(this);
   }
   function OnGame_MouseWheel(d)
   {
      d = d <= 0?-1:1;
      if(Selection.getFocus() == this.ext_textField.__get__textField())
      {
         var _loc2_ = Number(this.ext_textField.__get__text());
         if(isNaN(_loc2_))
         {
            _loc2_ = 0;
         }
         _loc2_ = Math.min(_loc2_ - d,this.ext_textField.__get__max());
         _loc2_ = Math.max(_loc2_,this.ext_textField.__get__min());
         this.ext_textField.__set__text(_loc2_);
         this.ext_textField.setChanged(true);
         Selection.setSelection(0,this.ext_textField.__get__text().length);
      }
   }
   function onUnload()
   {
      this.clearIntervals();
   }
}
