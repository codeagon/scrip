class lib.controls.S_SimpleComboBox extends MovieClip
{
   var _isOpen = false;
   var _active = true;
   var rowMax = 4;
   function S_SimpleComboBox()
   {
      super();
      this._listeners = [];
      this._mouseListener = {};
      this._openedmouseListener = {};
      this.display();
      this.selectLabel.textColor = lib.info.TextColor.INPUT_ACTIVE;
      this.init();
   }
   function init()
   {
      this.containerMc._visible = false;
      this._listBgTpointY = this.listBg._y;
      this.scrollBar._visible = false;
      this.scrollBg._visible = false;
      this.listBg._visible = false;
      this._data = null;
      while(this._listeners.length > 0)
      {
         this._listeners.pop();
      }
      var _this = this;
      this._mouseListener.onMouseDown = function()
      {
         if(!_this.hitTest(_root._xmouse,_root._ymouse,true))
         {
            _this.isOpen = false;
         }
         else if(_this.backBg.hitTest(_root._xmouse,_root._ymouse,true))
         {
            getURL("FSCommand:ToGame_PlaySound",1013);
            trace("ToGame_PlaySound   1013");
            _this.isOpen = false;
         }
      };
      this._mouseListener.onMouseWheel = function(delta, scrollTarget)
      {
         _this._parent._parent.debug_txt.text = delta + _this._parent._parent.debug_txt.text;
         var _loc3_ = String(_this).split(".");
         var _loc1_ = _loc3_.length - 1;
         var _loc2_ = String(scrollTarget).split(".")[_loc1_];
         if(_loc2_ == _this._name)
         {
            _this.scrollBar.wheel(delta);
         }
      };
   }
   function broadCastEvent()
   {
      for(var _loc2_ in this._listeners)
      {
         this._listeners[_loc2_].onChanged(this,this.__get__selected(),this.__get__selectedIndex());
      }
   }
   function draw()
   {
      this.clear();
      this._length = this._data.length;
      this._rowWidth = this._w;
      var _this = this;
      var _loc5_ = this.backBg._y + this.backBg._height;
      this.containerMc._visible = true;
      this.containerMc._x = 0;
      this._containerY = this.containerMc._y = _loc5_;
      this.__set__isOpen(false);
      if(this._maskMc == undefined)
      {
         this._maskMc = this.createEmptyMovieClip("maskMc",this.getNextHighestDepth());
         this._maskMc.beginFill(16711680);
         this._maskMc.lineTo(this._w,0);
         this._maskMc.lineTo(this._w,this._rowSize * this.rowMax);
         this._maskMc.lineTo(0,this._rowSize * this.rowMax);
         this._maskMc.lineTo(0,0);
         this._maskMc.endFill();
         this._maskMc._x = 3;
         this._maskMc._y = _loc5_;
         this.openBtn.onRollOut = this.openBtn.onRelease = this.openBtn.onReleaseOutside = function()
         {
            this.gotoAndStop("up");
         };
         this.openBtn.onPress = function()
         {
            if(_this.isOpen)
            {
               getURL("FSCommand:ToGame_PlaySound",1013);
               trace("ToGame_PlaySound   1013");
            }
            _this.isOpen = !_this._isOpen;
            this.gotoAndStop("down");
         };
         this.openBtn.onRollOver = function()
         {
            this.gotoAndStop("over");
         };
         this.containerMc.setMask(this._maskMc);
      }
      if(this._length > this.rowMax)
      {
         this._rowWidth = this._rowWidth - this.scrollBar._width;
      }
      var _loc4_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < this._length)
      {
         var _loc2_ = undefined;
         if(_loc3_ > 0)
         {
            _loc2_ = this.containerMc.line0.duplicateMovieClip("line" + _loc3_,this.containerMc.getNextHighestDepth());
         }
         else
         {
            _loc2_ = this.containerMc.line0;
            _loc2_._visible = true;
         }
         _loc2_.backBg._width = this._rowWidth;
         _loc2_.labelTxFd._width = this._rowWidth;
         _loc2_.labelTxFd.textColor = lib.info.TextColor.COMBOBOX_NORMAL;
         _loc2_._x = 0;
         _loc2_._y = _loc2_._height * _loc3_;
         _loc2_.index = _loc3_;
         if(this._data[_loc3_].label != undefined)
         {
            _loc2_.labelTxFd.text = this._data[_loc3_].label;
         }
         else
         {
            _loc2_.labelTxFd.text = this._data[_loc3_];
         }
         if(this._data[_loc3_].id != undefined)
         {
            _loc2_.id = this._data[_loc3_].id;
         }
         else
         {
            _loc2_.id = _loc2_.index;
         }
         _loc2_.onPress = function()
         {
            this.labelTxFd.textColor = lib.info.TextColor.COMBOBOX_PRESS;
            this.backBg.gotoAndStop("down");
         };
         _loc2_.onRelease = function()
         {
            _this.selectedIndex = this.index;
         };
         _loc2_.onRollOver = function()
         {
            if(_this.selectedIndex != this.index)
            {
               this.labelTxFd.textColor = lib.info.TextColor.COMBOBOX_OVER;
               this.backBg.gotoAndStop("over");
            }
         };
         _loc2_.onReleaseOutside = _loc2_.onRollOut = function()
         {
            if(_this.selectedIndex != this.index)
            {
               this.labelTxFd.textColor = lib.info.TextColor.COMBOBOX_NORMAL;
               this.backBg.gotoAndStop("up");
            }
         };
         if(this.defaultSelect == _loc2_.id)
         {
            _loc4_ = _loc3_;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(this._caption != undefined && this._caption != "")
      {
         this.selectLabel.textColor = lib.info.TextColor.INPUT_DEFAULT;
         this.selectLabel.text = this._caption;
      }
      else
      {
         this.selectLabel.textColor = lib.info.TextColor.INPUT_ACTIVE;
         this.__set__selectedIndex(_loc4_);
      }
      this.scrollBar.resize(this._maskMc._height - 2);
      this.scrollBar._y = this._containerY + 1;
      this.scrollBar._x = this.openBtn._x + this.openBtn._width - this.scrollBar._width - 4;
      this.scrollBar.__set__pageSize(this.containerMc._height);
      this.scrollBar.__set__displaySize(this.rowMax * this._rowSize);
      this.scrollBar.__set__rowHeight(this._rowSize);
      this.scrollBar.addListener(this);
      this.scrollBar._visible = false;
      this.scrollBg._visible = false;
      this.scrollBg._height = this.scrollBar._height + 2;
      this.scrollBg._x = this.scrollBar._x;
      this.scrollBg._y = this.scrollBar._y - 1;
   }
   function display()
   {
      this._xscale = this._yscale = 100;
      this._w = this._width - 6;
      this.backBg._x = 0;
      this.backBg._y = 0;
      this.containerMc._xscale = this.containerMc._yscale = 100;
      this.listBg._xscale = this.listBg._yscale = 100;
      this.listBg._y = this._listBgTpointY;
      this.scrollBg._xscale = this.scrollBg._yscale = 100;
      this._rowSize = this.containerMc.line0._height;
      this._rowWidth = 235;
      this.selectLabel._width = this.backBg._width - 2;
      this.selectLabel.textColor = lib.info.TextColor.COMBOBOX_NORMAL;
   }
   function clear()
   {
      while(this._length > 0)
      {
         this.containerMc["line" + this._length].removeMovieClip();
         this._length = this._length - 1;
      }
   }
   function dropDownMotion()
   {
      var _loc2_ = 100;
      this.containerMc.tgY = this.containerMc._y;
      this.containerMc._y = this.containerMc._y - _loc2_;
      this.listBg._height = 1;
      this._maskMc._yscale = 10;
      var _this = this;
      this.containerMc.onEnterFrame = function()
      {
         this._y = this._y + 0.5 * (this.tgY - this._y);
         _this._maskMc._yscale = _this._maskMc._yscale + 0.4 * (100 - _this._maskMc._yscale);
         _this.listBg._height = _this._maskMc._height + 10;
         if(Math.abs(this._y - this.tgY) < 10)
         {
            this._y = this.tgY;
            _this._maskMc._yscale = 100;
            _this.listBg._height = _this._maskMc._height + 10;
            _this.scrollBar.show = _this._isOpen;
            _this.scrollBg._visible = _this._isOpen && _this.scrollBar._visible;
            delete this.onEnterFrame;
         }
      };
   }
   function setListPosition(pos)
   {
      this.containerMc._y = pos;
   }
   function onScroll()
   {
      this.setListPosition(this._containerY - arguments[0]);
   }
   function addListener(obj)
   {
      for(var _loc3_ in this._listeners)
      {
         if(obj == this._listeners[_loc3_])
         {
            return undefined;
         }
      }
      this._listeners.push(obj);
   }
   function removeListener(obj)
   {
      var _loc2_ = 0;
      while(_loc2_ < this._listeners.length)
      {
         if(obj = this._listeners[_loc2_])
         {
            this._listeners.slice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function indexOf(index)
   {
      return this.containerMc["line" + index].labelTxFd.text;
   }
   function __set__active(flag)
   {
      if(!flag)
      {
         this.__set__isOpen(false);
         Mouse.removeListener(this._mouseListener);
      }
      this._active = flag;
      return this.__get__active();
   }
   function __get__active()
   {
      return this._active;
   }
   function __set__cation(pcation)
   {
      this._caption = pcation;
      this.selectLabel.text = this._caption;
      this.__set__selectedIndex(null);
      return this.__get__cation();
   }
   function __set__selected(id)
   {
      this._selected = id;
      return this.__get__selected();
   }
   function __get__selected()
   {
      return this._selected;
   }
   function __set__selectedIndex(index)
   {
      this.__set__isOpen(false);
      this.selectLabel.textColor = lib.info.TextColor.INPUT_ACTIVE;
      this.selectLabel.text = this.containerMc["line" + index].labelTxFd.text;
      this.__set__selected(this.containerMc["line" + index].id);
      this._selectedIndex = index;
      var _loc2_ = 0;
      while(_loc2_ < this.__get__length())
      {
         if(_loc2_ != this._selectedIndex)
         {
            this.containerMc["line" + _loc2_].backBg.gotoAndStop("up");
            this.containerMc["line" + _loc2_].labelTxFd.textColor = lib.info.TextColor.COMBOBOX_NORMAL;
         }
         else
         {
            this.containerMc["line" + _loc2_].labelTxFd.textColor = lib.info.TextColor.COMBOBOX_ACTIVE;
            this.containerMc["line" + _loc2_].backBg.gotoAndStop("down");
         }
         _loc2_ = _loc2_ + 1;
      }
      this.broadCastEvent();
      return this.__get__selectedIndex();
   }
   function __get__selectedIndex()
   {
      return this._selectedIndex;
   }
   function __set__data(pdata)
   {
      this._data = pdata;
      this.draw();
      return this.__get__data();
   }
   function __get__data()
   {
      return this._data;
   }
   function __get__length()
   {
      return this._length;
   }
   function __get__value()
   {
      return this.indexOf(this.__get__selectedIndex());
   }
   function __set__isOpen(pisOpen)
   {
      if(!this.__get__active() || this.__get__data().length == 0)
      {
         return undefined;
      }
      this._isOpen = pisOpen;
      if(this._isOpen)
      {
         this.openBtn.gotoAndStop("up");
         this.swapDepths(this._parent.getNextHighestDepth());
         Mouse.addListener(this._mouseListener);
         delete this.onPress;
         delete this.onRollOut;
         delete this.onRollOver;
         delete this.onRelease;
         delete this.onRollOut;
         delete this.onReleaseOutside;
      }
      else
      {
         this.onPress = function()
         {
            getURL("FSCommand:ToGame_PlaySound",1012);
            trace("ToGame_PlaySound   1012");
            this.openBtn.gotoAndStop("down");
            this.isOpen = true;
         };
         this.onRollOut = this.onRelease = this.onReleaseOutside = function()
         {
            this.openBtn.gotoAndStop("up");
         };
         this.onRollOver = function()
         {
            this.openBtn.gotoAndStop("over");
         };
         Mouse.removeListener(this._mouseListener);
      }
      this.containerMc._visible = this.isOpen;
      this.listBg._visible = this.isOpen;
      if(this.__get__isOpen())
      {
         this.dropDownMotion();
      }
      else
      {
         this.scrollBar.__set__show(this.isOpen);
         this.scrollBg._visible = this.__get__isOpen() && this.scrollBar._visible;
      }
      return this.__get__isOpen();
   }
   function __get__isOpen()
   {
      return this._isOpen;
   }
}
