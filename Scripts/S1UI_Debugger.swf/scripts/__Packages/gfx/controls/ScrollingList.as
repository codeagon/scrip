class gfx.controls.ScrollingList extends gfx.controls.CoreList
{
   var wrapping = "normal";
   var autoRowCount = false;
   var _scrollPosition = 0;
   var totalRenderers = 0;
   var autoScrollBar = false;
   var margin = 1;
   var paddingTop = 0;
   var paddingBottom = 0;
   var paddingLeft = 0;
   var paddingRight = 0;
   var thumbOffsetTop = 0;
   var thumbOffsetBottom = 0;
   var thumbSizeFactor = 1;
   function ScrollingList()
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
            this._scrollBar = this.container.attachMovie(value.toString(),"_scrollBar",1000,{offsetTop:this.thumbOffsetTop,offsetBottom:this.thumbOffsetBottom});
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
      }
      this._rowHeight = value;
      this.invalidate();
      return this.__get__rowHeight();
   }
   function __get__scrollPosition()
   {
      return this._scrollPosition;
   }
   function __set__scrollPosition(value)
   {
      value = Math.max(0,Math.min(this._dataProvider.length - this.totalRenderers,Math.round(value)));
      if(this._scrollPosition == value)
      {
         return undefined;
      }
      this._scrollPosition = value;
      this.invalidateData();
      this.updateScrollBar();
      return this.__get__scrollPosition();
   }
   function __get__selectedIndex()
   {
      return this._selectedIndex;
   }
   function __set__selectedIndex(value)
   {
      if(value == this._selectedIndex)
      {
         return undefined;
      }
      var _loc3_ = this.getRendererAt(this._selectedIndex);
      if(_loc3_ != null)
      {
         _loc3_.selected = false;
      }
      super.__set__selectedIndex(value);
      if(this.totalRenderers == 0)
      {
         return undefined;
      }
      _loc3_ = this.getRendererAt(this._selectedIndex);
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
   function scrollToIndex(index)
   {
      if(this.totalRenderers == 0)
      {
         return undefined;
      }
      if(index >= this._scrollPosition && index < this._scrollPosition + this.totalRenderers)
      {
         return undefined;
      }
      if(index < this._scrollPosition)
      {
         this.__set__scrollPosition(index);
      }
      else
      {
         this.__set__scrollPosition(index - (this.totalRenderers - 1));
      }
   }
   function __get__rowCount()
   {
      return this.totalRenderers;
   }
   function __set__rowCount(value)
   {
      var _loc3_ = this._rowHeight;
      if(_loc3_ == null)
      {
         var _loc2_ = this.renderers[0];
         if(_loc2_ == null)
         {
            _loc2_ = this.createItemRenderer(0);
            if(_loc2_ == null)
            {
               return undefined;
            }
            _loc3_ = _loc2_._height;
            _loc2_.removeMovieClip();
         }
         else
         {
            _loc3_ = _loc2_.height;
         }
         if(_loc3_ == null || _loc3_ == 0)
         {
            return undefined;
         }
      }
      this.__set__height(_loc3_ * value + this.margin * 2 + this.paddingTop + this.paddingBottom);
      return this.__get__rowCount();
   }
   function invalidateData()
   {
      this._scrollPosition = Math.min(Math.max(0,this._dataProvider.length - this.totalRenderers),this._scrollPosition);
      this.__set__selectedIndex(Math.min(this._dataProvider.length - 1,this._selectedIndex));
      this._dataProvider.requestItemRange(this._scrollPosition,Math.min(this._dataProvider.length - 1,this._scrollPosition + this.totalRenderers - 1),this,"populateData");
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
         var _loc6_ = _loc3_.handleInput(details,pathToFocus.slice(1));
         if(_loc6_)
         {
            return true;
         }
      }
      var _loc2_ = details.value == "keyDown";
      switch(details.navEquivalent)
      {
         case gfx.ui.NavigationCode.UP:
            if(this._selectedIndex > 0)
            {
               if(_loc2_)
               {
                  this.__set__selectedIndex(this.__get__selectedIndex() - 1);
               }
               return true;
            }
            if(this.wrapping == "stick")
            {
               return true;
            }
            if(this.wrapping == "wrap")
            {
               if(_loc2_)
               {
                  this.__set__selectedIndex(this._dataProvider.length - 1);
               }
               return true;
            }
            return false;
         case gfx.ui.NavigationCode.DOWN:
            if(this._selectedIndex < this._dataProvider.length - 1)
            {
               if(_loc2_)
               {
                  this.__set__selectedIndex(this.__get__selectedIndex() + 1);
               }
               return true;
            }
            if(this.wrapping == "stick")
            {
               return true;
            }
            if(this.wrapping == "wrap")
            {
               if(_loc2_)
               {
                  this.__set__selectedIndex(0);
               }
               return true;
            }
            return false;
         case gfx.ui.NavigationCode.END:
            if(!_loc2_)
            {
               this.__set__selectedIndex(this._dataProvider.length - 1);
            }
            return true;
         case gfx.ui.NavigationCode.HOME:
            if(!_loc2_)
            {
               this.__set__selectedIndex(0);
            }
            return true;
         case gfx.ui.NavigationCode.PAGE_UP:
            if(_loc2_)
            {
               this.__set__selectedIndex(Math.max(0,this._selectedIndex - this.totalRenderers));
            }
            return true;
         case gfx.ui.NavigationCode.PAGE_DOWN:
            if(_loc2_)
            {
               this.__set__selectedIndex(Math.min(this._dataProvider.length - 1,this._selectedIndex + this.totalRenderers));
            }
            return true;
         default:
            return false;
      }
   }
   function __get__availableWidth()
   {
      return !this.autoScrollBar?this.__width:this.__width - this._scrollBar._width;
   }
   function toString()
   {
      return "[Scaleform ScrollingList " + this._name + "]";
   }
   function configUI()
   {
      if(this.bindingEnabled)
      {
         flash.external.ExternalInterface.call("__registerControl",this._name,this,"ScrollingList");
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
         this.totalRenderers = this.renderers.length;
      }
      else
      {
         this.container._xscale = 10000 / this._xscale;
         this.container._yscale = 10000 / this._yscale;
         var _loc3_ = this._rowHeight;
         if(_loc3_ == null)
         {
            var _loc4_ = this.createItemRenderer(99);
            _loc3_ = _loc4_._height;
            _loc4_.removeMovieClip();
         }
         var _loc5_ = this.margin * 2 + this.paddingTop + this.paddingBottom;
         this.totalRenderers = Math.max(0,(this.__height - _loc5_ + 0.05) / _loc3_ >> 0);
         this.drawRenderers(this.totalRenderers);
         this.drawLayout(this.__get__availableWidth(),_loc3_);
      }
      this.updateScrollBar();
      this.invalidateData();
      this.setState();
      super.draw();
   }
   function drawLayout(rendererWidth, rendererHeight)
   {
      var _loc5_ = this.paddingLeft + this.paddingRight + this.margin * 2;
      rendererWidth = rendererWidth - _loc5_;
      var _loc2_ = 0;
      while(_loc2_ < this.renderers.length)
      {
         this.renderers[_loc2_]._x = this.margin + this.paddingLeft;
         this.renderers[_loc2_]._y = _loc2_ * rendererHeight + this.margin + this.paddingTop;
         this.renderers[_loc2_].setSize(rendererWidth,rendererHeight);
         _loc2_ = _loc2_ + 1;
      }
      this.drawScrollBar();
   }
   function drawScrollBar()
   {
      if(!this.autoScrollBar)
      {
         return undefined;
      }
      this._scrollBar._x = this.__width - this._scrollBar._width - this.margin;
      this._scrollBar._y = this.margin;
      this._scrollBar.height = this.__height - this.margin * 2;
   }
   function changeFocus()
   {
      super.changeFocus();
      this.setState();
   }
   function populateData(data)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.renderers.length)
      {
         var _loc4_ = this.renderers[_loc2_];
         var _loc3_ = this._scrollPosition + _loc2_;
         this.renderers[_loc2_].setListData(_loc3_,this.itemToLabel(data[_loc2_]),this._selectedIndex == _loc3_);
         _loc4_.setData(data[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.updateScrollBar();
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
   function updateScrollBar()
   {
      var _loc2_ = Math.max(0,this.__get__dataProvider().length - this.totalRenderers);
      if(this._scrollBar.setScrollProperties != null)
      {
         this._scrollBar.setScrollProperties(this.totalRenderers * this.thumbSizeFactor,0,_loc2_);
      }
      else
      {
         this._scrollBar.minimum = 0;
         this._scrollBar.maximum = _loc2_;
      }
      this._scrollBar.position = this._scrollPosition;
      this._scrollBar.trackScrollPageSize = Math.max(1,this.totalRenderers);
   }
   function getRendererAt(index)
   {
      return this.renderers[index - this._scrollPosition];
   }
   function scrollWheel(delta)
   {
      if(this._disabled)
      {
         return undefined;
      }
      var _loc2_ = this._scrollBar == undefined?1:this._scrollBar.pageScrollSize;
      this.__set__scrollPosition(this._scrollPosition - delta * _loc2_);
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
