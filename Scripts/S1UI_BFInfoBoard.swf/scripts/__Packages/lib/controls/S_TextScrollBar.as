class lib.controls.S_TextScrollBar extends MovieClip
{
   var PRESSINTERVAL = 0.4;
   var _scroll = 0;
   var _direction = "h";
   var showAllaways = true;
   var defaultBarSizeRatio = 1;
   var SCROLL_BTN = lib.manager.UISound.SCROLL_BTN;
   var SCROLL_MOVE = lib.manager.UISound.SCROLL_MOVE;
   function S_TextScrollBar()
   {
      super();
      this._mouseListener = {};
      this._dragmouseListener = {};
      this.init();
   }
   function init()
   {
      this.resize();
      var _this = this;
      _this.barBtn.glow._visible = false;
      this._dragmouseListener.onMouseMove = function()
      {
         _this.draging(_this.barBtn._y);
         _this.barBtnEf._y = _this.barBtn._y;
      };
      this.donwBtn.onPress = function()
      {
         lib.manager.UISound.play(_this.SCROLL_BTN);
         this.gotoAndStop("down");
         _this.barBtn.gotoAndStop("down");
         this.sp = -1;
         _this.scroll = _this.scroll + 1;
         delete this.onEnterFrame;
         this.onEnterFrame = function()
         {
            this.sp = this.sp + _this.PRESSINTERVAL;
            if(this.sp >= 1)
            {
               var _loc2_ = _this.barBtn._y + _this._scrollSize;
               _loc2_ = Math.min(_loc2_,_this._maxScrollPosition);
               _this.draging(_loc2_);
               this.sp = 0;
            }
         };
      };
      this.donwBtn.onRelease = function()
      {
         delete this.onEnterFrame;
         this.gotoAndStop("over");
         _this.barBtn.gotoAndStop("over");
         _this.barBtnEf.gotoAndStop("over");
      };
      this.donwBtn.onReleaseOutside = function()
      {
         delete this.onEnterFrame;
         this.gotoAndStop("up");
         _this.barBtn.gotoAndStop("up");
         _this.barBtnEf.gotoAndStop("up");
      };
      this.donwBtn.onRollOver = function()
      {
         this.gotoAndStop("over");
         _this.barBtn.gotoAndStop("over");
         _this.barBtnEf.gotoAndStop("over");
      };
      this.donwBtn.onRollOut = function()
      {
         this.gotoAndStop("up");
         _this.barBtn.gotoAndStop("up");
         _this.barBtnEf.gotoAndStop("up");
      };
      this.upBtn.onPress = function()
      {
         lib.manager.UISound.play(_this.SCROLL_BTN);
         this.gotoAndStop("down");
         _this.barBtn.gotoAndStop("down");
         _this.barBtnEf.gotoAndStop("down");
         this.sp = -1;
         _this.scroll = _this.scroll - 1;
         delete this.onEnterFrame;
         this.onEnterFrame = function()
         {
            this.sp = this.sp + _this.PRESSINTERVAL;
            if(this.sp >= 1)
            {
               var _loc2_ = _this.barBtn._y - _this._scrollSize;
               _loc2_ = Math.max(_loc2_,_this._minScrollPosition);
               _this.barBtnEf._y = _this.barBtn._y = _loc2_;
               _this.draging(_loc2_);
               this.sp = 0;
            }
         };
      };
      this.upBtn.onRollOver = function()
      {
         this.gotoAndStop("over");
         _this.barBtn.gotoAndStop("over");
         _this.barBtnEf.gotoAndStop("over");
      };
      this.upBtn.onRollOut = function()
      {
         this.gotoAndStop("up");
         _this.barBtn.gotoAndStop("up");
         _this.barBtnEf.gotoAndStop("up");
      };
      this.upBtn.onRelease = function()
      {
         delete this.onEnterFrame;
         this.gotoAndStop("over");
         _this.barBtn.gotoAndStop("over");
         _this.barBtnEf.gotoAndStop("over");
      };
      this.upBtn.onReleaseOutside = function()
      {
         delete this.onEnterFrame;
         this.gotoAndStop("up");
         _this.barBtn.gotoAndStop("up");
         _this.barBtnEf.gotoAndStop("up");
      };
      this.barBtn.onPress = function()
      {
         lib.manager.UISound.play(_this.SCROLL_BTN);
         this.gotoAndStop("down");
         _this.barBtnEf.gotoAndStop("down");
         Mouse.addListener(_this._dragmouseListener);
         this.startDrag(false,this._x,_this._minScrollPosition,this._x,_this._maxScrollPosition);
      };
      this.barBtn.onRelease = function()
      {
         Mouse.removeListener(_this._dragmouseListener);
         this.stopDrag();
         this.gotoAndStop("over");
         _this.barBtnEf.gotoAndStop("over");
      };
      this.barBtn.onReleaseOutside = function()
      {
         Mouse.removeListener(_this._dragmouseListener);
         this.stopDrag();
         this.gotoAndStop("up");
         _this.barBtnEf.gotoAndStop("up");
      };
      this.barBtn.onRollOver = function()
      {
         this.gotoAndStop("over");
         _this.barBtnEf.gotoAndStop("over");
      };
      this.barBtn.onRollOut = function()
      {
         this.gotoAndStop("up");
         _this.barBtnEf.gotoAndStop("up");
      };
      this.barMc.onPress = function()
      {
         lib.manager.UISound.play(_this.SCROLL_BTN);
         _this.positionToScroll(_this._ymouse);
         _this.barBtn.gotoAndStop("down");
         _this.barBtnEf.gotoAndStop("down");
      };
      this.barMc.onRollOver = function()
      {
         _this.barBtn.gotoAndStop("over");
         _this.barBtnEf.gotoAndStop("over");
      };
      this.barMc.onRollOut = this.barMc.onRelease = this.barMc.onReleaseOutside = function()
      {
         _this.barBtn.gotoAndStop("up");
         _this.barBtnEf.gotoAndStop("up");
      };
   }
   function display()
   {
      this._xscale = this._yscale = 100;
      this.upBtn._x = 0;
      this.upBtn._y = 0;
      this._barBtnW = this.barBtn._width;
      this._barBtnH = this.barBtn.hit._height;
      this.barBtn.hitArea = this.barBtn.hitAreaMc;
      this.barMc._height = this._h - this.upBtn.hitAreaMc._height * 2;
      this.barMc._x = this.upBtn._x + this.upBtn.hitAreaMc._width / 2 - this.barMc._width / 2;
      this.barMc._y = this.upBtn._y + this.upBtn.hitAreaMc._height;
      this.donwBtn._x = this.upBtn._x;
      this.donwBtn._y = this.barMc._y + this.barMc._height;
      this.barBtn._x = this.barMc._x + this.barMc._width / 2 - this._barBtnW / 2;
      this.barBtnEf._x = this.barBtn._x + 3.5;
      this.barBtn._y = this.barMc._y;
      this.barBtnEf._y = this.barBtn._y;
   }
   function draging(tgy)
   {
      var _loc3_ = tgy - this._minScrollPosition;
      var _loc2_ = _loc3_ / this._scrollSize;
      _loc2_ = Math.round(_loc2_);
      if(_loc2_ != this._scroll)
      {
         lib.manager.UISound.play(this.SCROLL_MOVE);
      }
      this._scroll = _loc2_;
      var _loc4_ = this._rowHeight;
      if(this._scroll <= 0)
      {
         this.upBtn.onRelease();
         this.upBtn.gotoAndStop("disable");
         this.barBtn.gotoAndStop("up");
         this.upBtn.enabled = false;
      }
      else if(!this.upBtn.enabled)
      {
         this.upBtn.gotoAndStop("up");
         this.upBtn.enabled = true;
      }
      if(this._scroll >= this._scrollMax)
      {
         this.donwBtn.onRelease();
         this.donwBtn.gotoAndStop("disable");
         this.barBtn.gotoAndStop("up");
         this.donwBtn.enabled = false;
      }
      else if(!this.donwBtn.enabled)
      {
         this.donwBtn.gotoAndStop("up");
         this.donwBtn.enabled = true;
      }
      this._textFd.scroll = this._scroll + 1;
   }
   function setTextField(textFd)
   {
      this._textFd = textFd;
      this._displayRows = textFd.textHeight;
      var _loc4_ = this;
      this._textFd.addListener(this);
      this.__set__scrollMax(this._textFd.maxscroll - 1);
      var _loc2_ = this._scrollMax;
      if(this.__get__scroll() == _loc2_ && this.__get__scroll() != 0)
      {
         this.__set__scroll(this._scrollMax);
      }
      else if(this.__get__scroll() < this._scrollMax)
      {
         this.__set__scroll(this.scroll);
      }
      else if(this._scrollMax < - this.__get__scroll())
      {
         this.__set__scroll(- this._scrollMax);
      }
      else
      {
         this.__set__scroll(0);
      }
   }
   function onChanged(txtFd)
   {
      this.__set__scrollMax(txtFd.maxscroll - 1);
      this.__set__scroll(txtFd.scroll - 1);
   }
   function onScroller(txtFd)
   {
      this.__set__scrollMax(txtFd.maxscroll - 1);
      this.__set__scroll(txtFd.scroll - 1);
   }
   function setWheel(target)
   {
      var scTg = target;
      var _this = this;
      this._mouseListener.onMouseWheel = function(delta, scrollTarget)
      {
         var _loc3_ = String(scTg).split(".");
         var _loc1_ = _loc3_.length - 1;
         var _loc2_ = String(scrollTarget).split(".").slice(0,_loc1_ + 1).join(".");
         if(_loc2_ == String(scTg))
         {
            _this.wheel(delta);
         }
      };
      Mouse.addListener(this._mouseListener);
   }
   function wheel(delta)
   {
      this._listener.onScroll(delta);
   }
   function __set__scrollMax(pscrollMax)
   {
      this._scrollMax = pscrollMax;
      this.__set__active(this._scrollMax >= 1);
      this.setScrollSize((this.barMc._height - this.barBtn.hit._height) / this._scrollMax);
      return this.__get__scrollMax();
   }
   function __get__scrollMax()
   {
      return this._scrollMax;
   }
   function setScrollSize(pscrollSize)
   {
      this._scrollSize = pscrollSize;
      this._minScrollPosition = this.barMc._y;
      this._maxScrollPosition = this._minScrollPosition + this._scrollSize * this._scrollMax;
   }
   function positionToScroll(pos)
   {
      var _loc2_ = pos - this._minScrollPosition;
      if(_loc2_ > this.barBtn._y)
      {
         _loc2_ = pos - this._minScrollPosition - this._barBtnH;
      }
      var _loc3_ = Math.round(_loc2_ / this._scrollSize);
      this.__set__scroll(_loc3_);
   }
   function setPosition()
   {
      this.barBtnEf._y = this.barBtn._y = this.barMc._y + this._scrollSize * this._scroll;
   }
   function __set__scroll(pscroll)
   {
      var _loc4_ = this;
      if(pscroll > 0)
      {
         pscroll = Math.max(0,pscroll);
         this._scroll = Math.min(this._scrollMax,pscroll);
      }
      else
      {
         pscroll = Math.max(0,- pscroll);
         this._scroll = - Math.min(this._scrollMax,pscroll);
      }
      var _loc3_ = Math.min(this._rowHeight * (this.__get__scroll() - 1),this._pageSize - this._displaySize);
      if(this.__get__scroll() == 0)
      {
         _loc3_ = this._rowHeight * this.__get__scroll();
      }
      this._textFd.scroll = this._scroll + 1;
      if(this._scroll <= 0)
      {
         this.upBtn.gotoAndStop("disable");
         this.barBtn.gotoAndStop("up");
      }
      else if(!this.upBtn.enabled)
      {
         this.upBtn.gotoAndStop("up");
      }
      if(this._scroll >= this._scrollMax)
      {
         this.barBtn.gotoAndStop("up");
         this.donwBtn.gotoAndStop("disable");
         _loc4_.onMaxScroll();
      }
      else if(!this.donwBtn.enabled)
      {
         this.donwBtn.gotoAndStop("up");
      }
      this.barBtn.enabled = this._scrollMax > 0;
      this.upBtn.enabled = this._scroll > 0;
      this.donwBtn.enabled = this._scroll < this._scrollMax;
      this.setPosition();
      return this.__get__scroll();
   }
   function __get__scroll()
   {
      return this._scroll;
   }
   function addListener(plistener)
   {
      this._listener = plistener;
      this._listener.onScroll("addListener");
   }
   function removeListener()
   {
      this._listener = null;
   }
   function resize(size)
   {
      if(size != undefined)
      {
         this._h = size;
      }
      else
      {
         this._h = this._direction != "h"?this._width:this._height;
      }
      this.display();
      this.__set__scrollMax(this._scrollMax);
      this.setPosition();
   }
   function __set__active(pactive)
   {
      this._active = pactive && this.showAllaways;
      this.barBtn._visible = pactive;
      this.barMc._visible = pactive;
      return this.__get__active();
   }
   function __get__active()
   {
      return this._active;
   }
   function setVisible(pshow)
   {
      this.showAllaways = pshow;
      this._visible = this._scrollMax > 0 && pshow;
   }
   function onUnload()
   {
      this.kill();
   }
   function kill()
   {
      Mouse.removeListener(this._mouseListener);
      Mouse.removeListener(this._dragmouseListener);
   }
   function onMaxScroll()
   {
   }
   function __set__glow(bActive)
   {
      if(bActive)
      {
         this.barBtn.glow._visible = true;
         lib.util.Warning.add(this.barBtn.glow);
      }
      else
      {
         this.barBtn.glow._visible = false;
         lib.util.Warning.remove(this.barBtn.glow);
      }
      return this.__get__glow();
   }
}
