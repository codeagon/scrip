class com.bluehole.tera.view.core.TeraTileList extends gfx.controls.TileList
{
   var _rendererLayoutWidth = 0;
   var _rendererLayoutHeight = 0;
   function TeraTileList()
   {
      super();
   }
   function __get__rendererLayoutWidth()
   {
      return this._rendererLayoutWidth;
   }
   function __set__rendererLayoutWidth(value)
   {
      this._rendererLayoutWidth = value;
      return this.__get__rendererLayoutWidth();
   }
   function __get__rendererLayoutHeight()
   {
      return this._rendererLayoutHeight;
   }
   function __set__rendererLayoutHeight(value)
   {
      this._rendererLayoutHeight = value;
      return this.__get__rendererLayoutHeight();
   }
   function toString()
   {
      return "[com.bluehole.tera.view.core.TeraTileList " + this._name + "]";
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
         var _loc3_ = this._columnWidth;
         var _loc2_ = this._rowHeight;
         if(_loc2_ == null || _loc3_ == null)
         {
            var _loc4_ = this.createItemRenderer(99);
            if(_loc3_ == null)
            {
               _loc3_ = _loc4_._width;
            }
            if(_loc2_ == null)
            {
               _loc2_ = _loc4_._height;
            }
            _loc4_.removeMovieClip();
         }
         if(this._rendererLayoutWidth > 0 && this._rendererLayoutHeight > 0)
         {
            this.totalRows = this.__get__availableHeight() / this._rendererLayoutHeight >> 0;
            this.totalColumns = this.__get__availableWidth() / this._rendererLayoutWidth >> 0;
         }
         else
         {
            this.totalRows = this.__get__availableHeight() / _loc2_ >> 0;
            this.totalColumns = this.__get__availableWidth() / _loc3_ >> 0;
         }
         var _loc5_ = this.totalRows * this.totalColumns;
         this.drawRenderers(_loc5_);
         this.drawLayout(_loc3_,_loc2_);
         this.updateScrollBar();
         this.drawScrollBar();
      }
      this.updateScrollBar();
      this.invalidateData();
      this.setState();
      if(this.deferredScrollIndex != -1)
      {
         this.scrollToIndex(this.deferredScrollIndex);
         this.deferredScrollIndex = -1;
      }
   }
   function drawLayout(rendererWidth, rendererHeight)
   {
      var _loc5_ = 0;
      var _loc4_ = 0;
      if(this._rendererLayoutWidth > 0 && this._rendererLayoutHeight > 0)
      {
         _loc5_ = this._rendererLayoutWidth;
         _loc4_ = this._rendererLayoutHeight;
      }
      else
      {
         _loc5_ = rendererWidth;
         _loc4_ = rendererHeight;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.renderers.length)
      {
         var _loc3_ = this.renderers[_loc2_];
         if(this.__get__direction() == "horizontal")
         {
            _loc3_._x = (this.totalColumns - (_loc2_ / this.totalRows >> 0) - 1) * _loc5_ + this.margin;
            _loc3_._y = _loc2_ % this.totalRows * _loc4_ + this.margin;
         }
         else
         {
            _loc3_._x = _loc2_ % this.totalColumns * _loc5_ + this.margin;
            _loc3_._y = (_loc2_ / this.totalColumns >> 0) * _loc4_ + this.margin;
         }
         this.renderers[_loc2_].setSize(rendererWidth,rendererHeight);
         _loc2_ = _loc2_ + 1;
      }
      this.drawScrollBar();
   }
}
