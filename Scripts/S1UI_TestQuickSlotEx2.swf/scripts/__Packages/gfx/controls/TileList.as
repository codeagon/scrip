class gfx.controls.TileList extends gfx.controls.CoreList
{
   var wrapping = "normal";
   var autoRowCount = false;
   var _direction = "horizontal";
   var _scrollPosition = 0;
   var totalRows = 0;
   var totalColumns = 0;
   var autoScrollBar = false;
   var externalColumnCount = 0;
   var margin = 1;
   function TileList()
   {
      super();
   }
   function __get__scrollBar()
   {
      return this._scrollBar;
   }
   function __set__scrollBar(value)
   {
      if(!this.initialized)
      {
         this.inspectableScrollBar = value;
         return undefined;
      }
      if(this._scrollBar != null)
      {
         this._scrollBar.removeEventListener("scroll",this,"handleScroll");
         this._scrollBar.removeEventListener("change",this,"handleScroll");
         this._scrollBar.focusTarget = null;
         if(this.autoScrollBar)
         {
            this._scrollBar.removeMovieClip();
         }
      }
      this.autoScrollBar = false;
      if(typeof value == "string")
      {
         this._scrollBar = (MovieClip)this._parent[value.toString()];
         if(this._scrollBar == null)
         {
            this._scrollBar = this.container.attachMovie(value.toString(),"_scrollBar",1000);
            if(this._scrollBar != null)
            {
               this.autoScrollBar = true;
            }
         }
      }
      else
      {
         this._scrollBar = (MovieClip)value;
      }
      this.invalidate();
      if(this._scrollBar == null)
      {
         return undefined;
      }
      if(this._scrollBar.setScrollProperties != null)
      {
         this._scrollBar.addEventListener("scroll",this,"handleScroll");
      }
      else
      {
         this._scrollBar.addEventListener("change",this,"handleScroll");
      }
      this._scrollBar.focusTarget = this;
      this._scrollBar.tabEnabled = false;
      this.drawScrollBar();
      this.updateScrollBar();
      return this.__get__scrollBar();
   }
   function __get__rowHeight()
   {
      return this._rowHeight;
   }
   function __set__rowHeight(value)
   {
      if(value == 0)
      {
         value = null;
         return undefined;
      }
      this._rowHeight = value;
      this.invalidate();
      return this.__get__rowHeight();
   }
   function __get__columnWidth()
   {
      return this._columnWidth;
   }
   function __set__columnWidth(value)
   {
      if(value == 0)
      {
         value = null;
         return undefined;
      }
      this._columnWidth = value;
      this.invalidate();
      return this.__get__columnWidth();
   }
   function __get__rowCount()
   {
      return this.totalRows;
   }
   function __set__rowCount(value)
   {
      this._rowCount = !this.autoRowCount?value:Math.ceil(value / this.totalColumns);
      var _loc2_ = this._rowHeight;
      if(_loc2_ == null)
      {
         var _loc3_ = this.renderers[0];
         _loc2_ = _loc3_.height;
      }
      this.setSize(this.__width,_loc2_ * this._rowCount + this.margin * 2);
      return this.__get__rowCount();
   }
   function __get__columnCount()
   {
      return this.totalColumns;
   }
   function __set__columnCount(value)
   {
      this._columnCount = value;
      var _loc2_ = this._columnWidth;
      if(_loc2_ == null)
      {
         var _loc3_ = this.renderers[0];
         _loc2_ = _loc3_.width;
      }
      this.setSize(_loc2_ * this.__get__columnCount(),this.__height);
      return this.__get__columnCount();
   }
   function __get__direction()
   {
      return this._direction;
   }
   function __set__direction(value)
   {
      if(value == this._direction)
      {
         return undefined;
      }
      this._direction = value;
      this.invalidate();
      return this.__get__direction();
   }
   function __get__disabled()
   {
      return this._disabled;
   }
   function __set__disabled(value)
   {
      super.__set__disabled(value);
      if(this.initialized)
      {
         this.setState();
      }
      return this.__get__disabled();
   }
   function __get__selectedIndex()
   {
      return this._selectedIndex;
   }
   function __set__selectedIndex(value)
   {
      var _loc3_ = this.getRendererAt(this._selectedIndex);
      if(_loc3_ != null)
      {
         _loc3_.selected = false;
      }
      super.__set__selectedIndex(value);
      _loc3_ = this.getRendererAt(this._selectedIndex);
      if(this.totalRows * this.totalColumns == 0)
      {
         return undefined;
      }
      if(_loc3_ != null)
      {
         _loc3_.selected = true;
      }
      else
      {
         this.scrollToIndex(this._selectedIndex);
      }
      return this.__get__selectedIndex();
   }
   function scrollToIndex(index)
   {
      var _loc2_ = this._direction != "horizontal"?this.totalColumns:this.totalRows;
      var _loc3_ = this._scrollPosition * _loc2_;
      if(_loc2_ == 0)
      {
         return undefined;
      }
      if(index >= _loc3_ && index < _loc3_ + this.totalRows * this.totalColumns)
      {
         return undefined;
      }
      if(index < _loc3_)
      {
         this.__set__scrollPosition(index / _loc2_ >> 0);
      }
      else
      {
         this.__set__scrollPosition(Math.floor(index / _loc2_) - (this._direction != "horizontal"?this.totalRows:this.totalColumns) + 1);
      }
   }
   function __get__scrollPosition()
   {
      return this._scrollPosition;
   }
   function __set__scrollPosition(value)
   {
      var _loc3_ = Math.ceil((this._dataProvider.length - this.totalRows * this.totalColumns) / (this._direction != "horizontal"?this.totalColumns:this.totalRows));
      value = Math.max(0,Math.min(_loc3_,Math.round(value)));
      if(this._scrollPosition == value)
      {
         return undefined;
      }
      this._scrollPosition = value;
      this.invalidateData();
      this.updateScrollBar();
      return this.__get__scrollPosition();
   }
   function invalidateData()
   {
      var _loc3_ = this._direction != "horizontal"?this.totalColumns:this.totalRows;
      var _loc4_ = Math.ceil(this._dataProvider.length / _loc3_);
      var _loc5_ = _loc4_ - (this._direction != "horizontal"?this.totalRows:this.totalColumns);
      this._scrollPosition = Math.max(0,Math.min(_loc5_,this._scrollPosition));
      var _loc2_ = this._scrollPosition * _loc3_;
      var _loc6_ = _loc2_ + this.totalColumns * this.totalRows - 1;
      this._dataProvider.requestItemRange(_loc2_,_loc6_,this,"populateData");
   }
   function __get__availableWidth()
   {
      return (!(this.autoScrollBar && this._direction == "vertical")?this.__width:this.__width - this._scrollBar._width) - this.margin * 2;
   }
   function __get__availableHeight()
   {
      return (!(this.autoScrollBar && this._direction == "horizontal")?this.__height:this.__height - this._scrollBar._height) - this.margin * 2;
   }
   function setRendererList(value, newColumnCount)
   {
      if(newColumnCount != null)
      {
         this.externalColumnCount = newColumnCount;
      }
      super.setRendererList(value);
   }
   function handleInput(details, pathToFocus)
   {
      if(pathToFocus == null)
      {
         pathToFocus = [];
      }
      var _loc3_ = this.getRendererAt(this._selectedIndex);
      if(_loc3_ != null && _loc3_.handleInput != null)
      {
         var _loc7_ = _loc3_.handleInput(details,pathToFocus.slice(1));
         if(_loc7_)
         {
            return true;
         }
      }
      var _loc8_ = details.value == "keyDown";
      var _loc4_ = details.navEquivalent;
      var _loc2_ = undefined;
      if(this._direction == "horizontal")
      {
         switch(_loc4_)
         {
            case gfx.ui.NavigationCode.RIGHT:
               _loc2_ = this._selectedIndex + this.totalRows;
               break;
            case gfx.ui.NavigationCode.LEFT:
               _loc2_ = this._selectedIndex - this.totalRows;
               break;
            case gfx.ui.NavigationCode.UP:
               _loc2_ = this._selectedIndex - 1;
               break;
            case gfx.ui.NavigationCode.DOWN:
               _loc2_ = this._selectedIndex + 1;
         }
      }
      else
      {
         switch(_loc4_)
         {
            case gfx.ui.NavigationCode.DOWN:
               _loc2_ = this._selectedIndex + this.totalColumns;
               break;
            case gfx.ui.NavigationCode.UP:
               _loc2_ = this._selectedIndex - this.totalColumns;
               break;
            case gfx.ui.NavigationCode.LEFT:
               _loc2_ = this._selectedIndex - 1;
               break;
            case gfx.ui.NavigationCode.RIGHT:
               _loc2_ = this._selectedIndex + 1;
         }
      }
      switch(_loc4_)
      {
         case gfx.ui.NavigationCode.HOME:
            _loc2_ = 0;
            break;
         case gfx.ui.NavigationCode.END:
            _loc2_ = this._dataProvider.length - 1;
            break;
         case gfx.ui.NavigationCode.PAGE_DOWN:
            _loc2_ = Math.min(this._dataProvider.length - 1,this._selectedIndex + this.totalColumns * this.totalRows);
            break;
         case gfx.ui.NavigationCode.PAGE_UP:
            _loc2_ = Math.max(0,this._selectedIndex - this.totalColumns * this.totalRows);
      }
      if(_loc2_ != null)
      {
         if(!_loc8_)
         {
            return true;
         }
         if(_loc2_ >= 0 && _loc2_ < this.__get__dataProvider().length)
         {
            this.__set__selectedIndex(Math.max(0,Math.min(this._dataProvider.length - 1,_loc2_)));
            return true;
         }
         if(this.wrapping == "stick")
         {
            _loc2_ = Math.max(0,Math.min(this._dataProvider.length - 1,_loc2_));
            if(this.__get__selectedIndex() != _loc2_)
            {
               this.__set__selectedIndex(_loc2_);
            }
            return true;
         }
         if(this.wrapping == "wrap")
         {
            this.__set__selectedIndex(_loc2_ >= 0?this.__get__selectedIndex() >= this._dataProvider.length - 1?0:this._dataProvider.length - 1:this._dataProvider.length - 1);
            return true;
         }
      }
      return false;
   }
   function toString()
   {
      return "[Scaleform TileList " + this._name + "]";
   }
   function configUI()
   {
      if(this.bindingEnabled)
      {
         flash.external.ExternalInterface.call("__registerControl",this._name,this,"TileList");
         this.addEventListener("change",this,"dispatchEventToGame");
         this.bindingEnabled = false;
      }
      super.configUI();
      if(this.inspectableScrollBar != "" && this.inspectableScrollBar != null)
      {
         this.__set__scrollBar(this.inspectableScrollBar);
         this.inspectableScrollBar = null;
      }
   }
   function draw()
   {
      if(this.sizeIsInvalid)
      {
         this._width = this.__width;
         this._height = this.__height;
      }
      if(this.externalRenderers)
      {
         this.totalColumns = this.externalColumnCount != 0?this.externalColumnCount:1;
         this.totalRows = Math.ceil(this.renderers.length / this.totalColumns);
      }
      else
      {
         this.container._xscale = 10000 / this._xscale;
         this.container._yscale = 10000 / this._yscale;
         var _loc4_ = this._columnWidth;
         var _loc3_ = this._rowHeight;
         if(_loc3_ == null || _loc4_ == null)
         {
            var _loc5_ = this.createItemRenderer(99);
            if(_loc4_ == null)
            {
               _loc4_ = _loc5_._width;
            }
            if(_loc3_ == null)
            {
               _loc3_ = _loc5_._height;
            }
            _loc5_.removeMovieClip();
         }
         this.totalRows = this.__get__availableHeight() / _loc3_ >> 0;
         this.totalColumns = this.__get__availableWidth() / _loc4_ >> 0;
         var _loc6_ = this.totalRows * this.totalColumns;
         this.drawRenderers(_loc6_);
         this.drawLayout(_loc4_,_loc3_);
         this.updateScrollBar();
         this.drawScrollBar();
      }
      this.updateScrollBar();
      this.invalidateData();
      this.setState();
      super.draw();
   }
   function drawLayout(rendererWidth, rendererHeight)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.renderers.length)
      {
         var _loc3_ = this.renderers[_loc2_];
         if(this.__get__direction() == "horizontal")
         {
            _loc3_._y = _loc2_ % this.totalRows * rendererHeight + this.margin;
            _loc3_._x = (_loc2_ / this.totalRows >> 0) * rendererWidth + this.margin;
         }
         else
         {
            _loc3_._x = _loc2_ % this.totalColumns * rendererWidth + this.margin;
            _loc3_._y = (_loc2_ / this.totalColumns >> 0) * rendererHeight + this.margin;
         }
         this.renderers[_loc2_].setSize(rendererWidth,rendererHeight);
         _loc2_ = _loc2_ + 1;
      }
      this.drawScrollBar();
   }
   function changeFocus()
   {
      super.changeFocus();
      this.setState();
   }
   function populateData(data)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.totalColumns * this.totalRows)
      {
         var _loc4_ = this.renderers[_loc2_];
         var _loc3_ = this._scrollPosition * (this._direction != "horizontal"?this.totalColumns:this.totalRows) + _loc2_;
         this.renderers[_loc2_].setListData(_loc3_,this.itemToLabel(data[_loc2_]),this._selectedIndex == _loc3_);
         _loc4_.setData(data[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function getRendererAt(index)
   {
      var _loc2_ = index - this._scrollPosition * (this._direction != "horizontal"?this.totalColumns:this.totalRows);
      if(_loc2_ > this._dataProvider.length - 1)
      {
         return null;
      }
      return this.renderers[_loc2_];
   }
   function handleScroll(event)
   {
      var _loc2_ = event.target.position;
      if(isNaN(_loc2_))
      {
         return undefined;
      }
      this.__set__scrollPosition(_loc2_);
   }
   function drawScrollBar()
   {
      if(!this.autoScrollBar)
      {
         return undefined;
      }
      this._scrollBar.direction = this._direction;
      if(this._direction == "vertical")
      {
         this._scrollBar._rotation = 0;
         this._scrollBar._x = this.__width - this._scrollBar._width + this.margin;
         this._scrollBar._y = this.margin;
         this._scrollBar.height = this.__height - this.margin * 2;
      }
      else
      {
         this._scrollBar._rotation = -90;
         this._scrollBar._x = this.margin;
         this._scrollBar._y = this.__height - this.margin;
         this._scrollBar.width = this.__width - this.margin * 2;
      }
   }
   function updateScrollBar()
   {
      var _loc2_ = undefined;
      if(this.__get__direction() == "horizontal")
      {
         _loc2_ = Math.ceil(this._dataProvider.length / this.totalRows) - this.totalColumns;
      }
      else
      {
         _loc2_ = Math.ceil(this._dataProvider.length / this.totalColumns) - this.totalRows;
      }
      if(this._scrollBar.setScrollProperties != null)
      {
         this._scrollBar.setScrollProperties(this._direction != "horizontal"?this.totalRows:this.totalColumns,0,_loc2_);
      }
      else
      {
         this._scrollBar.minimum = 0;
         this._scrollBar.maximum = _loc2_;
      }
      this._scrollBar.position = this._scrollPosition;
      this._scrollBar.trackScrollPageSize = Math.max(1,this._direction != "horizontal"?this.totalRows:this.totalColumns);
   }
   function scrollWheel(delta)
   {
      if(this._disabled)
      {
         return undefined;
      }
      this.__set__scrollPosition(this._scrollPosition - delta);
   }
   function setState()
   {
      this.tabEnabled = this.focusEnabled = !this._disabled;
      this.gotoAndPlay(!this._disabled?!this._focused?"default":"focused":"disabled");
      if(this._scrollBar)
      {
         this._scrollBar.disabled = this._disabled;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.renderers.length)
      {
         this.renderers[_loc2_].disabled = this._disabled;
         _loc2_ = _loc2_ + 1;
      }
   }
}
