class lib.controls.S_SimpleComboBox extends MovieClip
{
   var _isOpen = false;
   var _active = true;
   var rowMax = 6;
   var FULLDOWNMENU_CLOSE = lib.manager.UISound.FULLDOWNMENU_CLOSE;
   var FULLDOWNMENU_OPEN = lib.manager.UISound.FULLDOWNMENU_OPEN;
   var FULLDOWNMENU_CLICK = lib.manager.UISound.FULLDOWNMENU_CLICK;
   var LM = 10;
   var useBaseTextColor = true;
   function S_SimpleComboBox()
   {
      super();
      _global.gfxExtensions = true;
      this._listeners = [];
      this._mouseListener = {};
      this._openedmouseListener = {};
      this.display();
      this.selectLabel.textColor = lib.info.TextColor.COMBOBOX_ACTIVE;
      this.dnEffecMc.hitTestDisable = true;
      this.rowMax = Math.max(6,this.rowMax);
      this.containerPos = 0;
      this.listBg.onRollOver = function()
      {
      };
      this.init();
   }
   function init()
   {
      this.containerMc._visible = false;
      this.scrollBar._visible = false;
      this.listBg._visible = false;
      this.listBg_nonscroll._visible = false;
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
            _this.isOpen = false;
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
      if(this._data.length <= 0)
      {
         return undefined;
      }
      this._length = this._data.length;
      this._rowWidth = this._w;
      var _this = this;
      this.startLineY = this.backBg._y + this.backBg._height;
      this.selectLabel.verticalAlign = "center";
      this.containerMc._visible = true;
      this.containerMc._x = 0;
      this._containerY = this.startLineY;
      this.__set__isOpen(false);
      this._listBgH = Math.min(this.rowMax * this._rowSize,this._length * this._rowSize) + 10;
      this.listBg._height = this._listBgH;
      if(this._maskMc == undefined)
      {
         this._maskMc = this.createEmptyMovieClip("maskMc",this.getNextHighestDepth());
         this._maskMc.beginFill(16711680);
         this._maskMc.lineTo(this._w,0);
         this._maskMc.lineTo(this._w,this._listBgH);
         this._maskMc.lineTo(0,this._listBgH);
         this._maskMc.lineTo(0,0);
         this._maskMc.endFill();
         this._maskMc._x = 0;
         this._maskMc._y = this.startLineY;
         this.containerMc.setMask(this._maskMc);
      }
      this._maskMc._y = 2;
      this._maskMc._height = this._listBgH - 10;
      if(this._length > this.rowMax)
      {
         this._rowWidth = this._rowWidth - (this.scrollBar._width - 2);
      }
      this.selectedBg = this.listBg;
      this.selectedBg._y = this.startLineY;
      var _loc4_ = 0;
      var _loc2_ = 0;
      this._maxTw = 0;
      while(_loc2_ < this._length)
      {
         var lineMc;
         if(_loc2_ > 0)
         {
            lineMc = this.containerMc.line0.duplicateMovieClip("line" + _loc2_,this.containerMc.getNextHighestDepth());
         }
         else
         {
            lineMc = this.containerMc.line0;
            lineMc._visible = true;
         }
         lineMc.labelTxFd.verticalAlign = "center";
         lineMc.labelTxFd.textColor = lib.info.TextColor.COMBOBOX_NORMAL;
         lineMc.labelTxFd.htmlText = _this.getLabelText(_loc2_);
         lineMc._y = lineMc._height * _loc2_ + 2;
         lineMc.index = _loc2_;
         if(this._data[_loc2_].label != undefined)
         {
            lineMc.labelTxFd.htmlText = this._data[_loc2_].label;
         }
         else
         {
            lineMc.labelTxFd.htmlText = this._data[_loc2_];
         }
         this._maxTw = Math.max(this._maxTw,lineMc.labelTxFd.textWidth + 4 + this.LM);
         if(this._data[_loc2_].id != undefined)
         {
            lineMc.id = this._data[_loc2_].id;
         }
         else
         {
            lineMc.id = lineMc.index;
         }
         if(this._data[_loc2_].enable == 0)
         {
            lineMc.onEnterFrame = function()
            {
               if(lineMc.labelTxFd != undefined)
               {
                  this.labelTxFd.textColor = lib.info.TextColor.COMBOBOX_DISABLE;
                  delete this.onEnterFrame;
               }
            };
            lineMc.enabled = false;
         }
         lineMc.onPress = function()
         {
            if(_this.useBaseTextColor)
            {
               this.labelTxFd.textColor = lib.info.TextColor.COMBOBOX_PRESS;
            }
            this.backBg.gotoAndStop("press");
         };
         lineMc.onRelease = function()
         {
            _this.selectedIndex = this.index;
            lib.manager.UISound.play(_this.FULLDOWNMENU_CLICK);
            if(_this.useBaseTextColor)
            {
               this.labelTxFd.textColor = lib.info.TextColor.COMBOBOX_ACTIVE;
            }
         };
         lineMc.onRollOver = function()
         {
            if(_this.selectedIndex != this.index)
            {
               if(_this.useBaseTextColor)
               {
                  this.labelTxFd.textColor = lib.info.TextColor.COMBOBOX_OVER;
               }
               this.backBg.gotoAndStop("over");
            }
         };
         lineMc.onReleaseOutside = lineMc.onRollOut = function()
         {
            if(_this.selectedIndex != this.index)
            {
               if(_this.useBaseTextColor)
               {
                  this.labelTxFd.textColor = lib.info.TextColor.COMBOBOX_NORMAL;
               }
               this.backBg.gotoAndStop("out");
            }
         };
         if(this.defaultSelect == lineMc.id)
         {
            _loc4_ = _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(this._caption != undefined && this._caption != "")
      {
         this.selectLabel.textColor = lib.info.TextColor.COMBOBOX_ACTIVE;
         this.selectLabel.setText(this._caption);
      }
      else
      {
         this.selectLabel.textColor = lib.info.TextColor.COMBOBOX_ACTIVE;
         this.__set__selectedIndex(_loc4_);
      }
      var _loc3_ = 0;
      if(this.rowMax < this._length)
      {
         if(this._maxTw < this._w - this.scrollBar._width)
         {
            this._maxTw = this._w;
         }
         else
         {
            this._maxTw = Math.max(this._w,this._maxTw) + this.scrollBar._width;
         }
         _loc3_ = this.scrollBar._width;
      }
      else
      {
         this._maxTw = Math.max(this._w,this._maxTw);
      }
      this.listBg_nonscroll._width = this.dnEffecMc._width = this._maxTw;
      this.listBg._width = this._maxTw + 8;
      _loc2_ = 0;
      var _this = this;
      while(_loc2_ < this._length)
      {
         var lineMc = this.containerMc["line" + _loc2_];
         lineMc.backBg._width = this._maxTw - _loc3_;
         lineMc.labelTxFd._width = this._maxTw - _loc3_;
         this._maskMc._width = this._maxTw + this.LM;
         _loc2_ = _loc2_ + 1;
      }
      this.scrollBar.resize(this._listBgH - 8);
      this.scrollBar._y = this._containerY + 1;
      this.scrollBar._x = this.containerMc._x + this._maxTw - this.scrollBar._width;
      this.scrollBar.__set__pageSize(this.containerMc._height);
      this.scrollBar.__set__displaySize(this.rowMax * this._rowSize);
      this.scrollBar.__set__rowHeight(this._rowSize);
      this.scrollBar.addListener(this);
      this.scrollBar._visible = false;
      this.scrollBar.setWheel(this);
   }
   function display()
   {
      this._w = this._width;
      this._xscale = this._yscale = 100;
      this.backBg._x = 0;
      this.backBg._y = 0;
      this.containerMc._xscale = this.containerMc._yscale = 100;
      this.listBg._xscale = this.listBg._yscale = 100;
      this.listBg_nonscroll._xscale = this.listBg_nonscroll._yscale = 100;
      this.listBg._x = -2;
      this.listBg._y = this.startLineY - 2;
      this.listBg_nonscroll._y = this.startLineY;
      this._rowSize = this.containerMc.line0._height;
      this._rowWidth = this._w;
      this.backBg._width = this._w;
      this.dnEffecMc._width = this._w;
      this.openBtn._x = this.backBg._width + this.backBg._x - this.openBtn._width - 1;
      this.openBtn._y = this.backBg._y + 1;
      this.selectLabel._x = this.backBg._x + this.LM;
      this.selectLabel._width = this.openBtn._x - this.LM;
      this.selectLabel.textColor = lib.info.TextColor.COMBOBOX_ACTIVE;
      this.listBg_nonscroll._width = this._w;
      this.listBg._width = this._w + 8;
      this.selectLabel.setText(this.getLabelText(this._selectedIndex));
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
      this.containerMc._visible = true;
      this.selectedBg._visible = true;
      this.containerMc.tgY = this.backBg._height;
      this.containerMc._y = this.containerMc._y - _loc2_;
      this.selectedBg._height = this._listBgH;
      this._maskMc._height = 20;
      var _this = this;
      this.dnEffecMc._height = this._listBgH;
      this.dnEffecMc.gotoAndPlay(2);
      this.containerMc._y = 0;
      this.selectedBg._y = 0;
      this._maskMc._y = this.containerMc.tgY + 2;
      this.containerMc._alpha = 0;
      var c = 0;
      this.containerMc.onEnterFrame = function()
      {
         if(c++ < 1)
         {
            return undefined;
         }
         this._y = this._y + 0.5 * (this.tgY - this._y);
         _this.selectedBg._y = _this.selectedBg._y + 0.5 * (this.tgY - _this.selectedBg._y);
         this._alpha = this._alpha + 5 * (100 - this._alpha);
         _this._maskMc._height = _this._maskMc._height + 0.7 * (_this._listBgH - _this._maskMc._height);
         if(Math.abs(this._y - this.tgY) < 10)
         {
            this._y = this.tgY;
            this._alpha = 100;
            _this._maskMc._height = _this._listBgH - 10;
            _this.listBg._y = this.tgY;
            _this.scrollBar.scroll = _this.scrollBar.scroll;
            _this.scrollBar.show = _this._isOpen;
            delete this.onEnterFrame;
         }
      };
   }
   function dropUpMotion()
   {
      var _this = this;
      this.scrollBar.__set__show(this._isOpen);
      this.containerMc.onEnterFrame = function()
      {
         this._y = this._y + 0.7 * (- this._y);
         _this.selectedBg._y = _this.selectedBg._y + 0.6 * (- _this.selectedBg._y);
         this._alpha = this._alpha + 5 * (- this._alpha);
         _this._maskMc._height = _this._maskMc._height + 1.1 * (1 - _this._maskMc._height);
         if(Math.abs(this._y) < 5)
         {
            this._y = 0;
            this._alpha = 0;
            _this._maskMc._height = 10;
            _this.selectedBg._y = 0;
            this._visible = false;
            _this.selectedBg._visible = false;
            delete this.onEnterFrame;
         }
      };
   }
   function setListPosition(pos)
   {
      this.containerPos = pos;
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
         if(obj == this._listeners[_loc2_])
         {
            this._listeners.splice(_loc2_,1);
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
      this.selectLabel.setText(this._caption);
      this.__set__selectedIndex(null);
      this.draw();
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
   function setSelectedIndex(index)
   {
      this.__set__isOpen(false);
      this.selectLabel.setText(this.getLabelText(index));
      this.selectLabel.textColor = lib.info.TextColor.COMBOBOX_ACTIVE;
      this.__set__selected(this.containerMc["line" + index].id);
      this._selectedIndex = index;
      var _loc3_ = 0;
      while(_loc3_ < this.__get__length())
      {
         var _loc2_ = this.containerMc["line" + _loc3_];
         if(_loc3_ != this._selectedIndex)
         {
            _loc2_.backBg.gotoAndStop("out");
            _loc2_.labelTxFd.htmlText = this.getLabelText(_loc2_.index);
            if(_loc2_.enabled)
            {
               _loc2_.labelTxFd.textColor = lib.info.TextColor.COMBOBOX_NORMAL;
               _loc2_.labelTxFd.htmlText = this.getLabelText(_loc2_.index);
            }
            else
            {
               _loc2_.labelTxFd.textColor = lib.info.TextColor.COMBOBOX_DISABLE;
            }
         }
         else
         {
            if(this.useBaseTextColor)
            {
               _loc2_.labelTxFd.textColor = lib.info.TextColor.COMBOBOX_ACTIVE;
            }
            _loc2_.backBg.gotoAndStop("active");
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setSelectedId(id)
   {
      this.setSelectedIndex(this.indexOfId(id));
   }
   function indexOfId(id)
   {
      var _loc2_ = 0;
      while(_loc2_ < this._length)
      {
         if(this.containerMc["line" + _loc2_].id == id)
         {
            return _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return undefined;
   }
   function __set__selectedIndex(index)
   {
      this.setSelectedIndex(index);
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
         this.openBtn.gotoAndStop("up");
         this.onPress = function()
         {
            lib.manager.UISound.play(lib.manager.UISound.TREEMENU_BTN);
            this.openBtn.gotoAndStop("down");
            this.isOpen = true;
         };
         this.onRollOut = this.onReleaseOutside = function()
         {
            this.openBtn.gotoAndStop("up");
         };
         this.onRollOver = function()
         {
            this.openBtn.gotoAndStop("over");
         };
         Mouse.removeListener(this._mouseListener);
      }
      if(this.__get__isOpen())
      {
         this.dropDownMotion();
      }
      else
      {
         this.dropUpMotion();
      }
      return this.__get__isOpen();
   }
   function __get__isOpen()
   {
      return this._isOpen;
   }
   function getLabelText(index)
   {
      if(this._data[index].label != undefined)
      {
         return this._data[index].label;
      }
      return this._data[index];
   }
   function setLabelText(index, str)
   {
      this.containerMc["line" + index].labelTxFd.htmlText = str;
      var _loc5_ = this.containerMc["line" + index].labelTxFd.textWidth + 4 + this.LM;
      if(_loc5_ > this._maxTw)
      {
         var _loc3_ = 0;
         var _loc4_ = !this.scrollBar._visible?0:this.scrollBar._width;
         while(_loc3_ < this._length)
         {
            var _loc2_ = this.containerMc["line" + _loc3_];
            _loc2_.backBg._width = this._maxTw - _loc4_;
            _loc2_.labelTxFd._width = this._maxTw - _loc4_;
            this._maskMc._width = this._maxTw + this.LM;
            _loc3_ = _loc3_ + 1;
         }
         this.scrollBar._x = this.containerMc._x + this._maxTw - this.scrollBar._width;
      }
   }
   function setEnabled(enable)
   {
      this.__set__active(enable);
      this.enabled = enable;
      if(!enable)
      {
         this._alpha = lib.info.TextColor.GENERAL_DISABLE_ALPHA;
      }
      else
      {
         this._alpha = 100;
      }
   }
   function onUnload()
   {
      Mouse.removeListener(this._mouseListener);
   }
}
