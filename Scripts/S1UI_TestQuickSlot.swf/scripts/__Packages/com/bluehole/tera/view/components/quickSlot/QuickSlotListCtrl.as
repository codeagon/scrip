class com.bluehole.tera.view.components.quickSlot.QuickSlotListCtrl extends com.bluehole.tera.view.core.TeraTileList
{
   var modeChanged = false;
   var initRenderers = false;
   var _type = "default";
   var _mode = "small";
   var _arrangeMode = com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_HORIZONTAL;
   function QuickSlotListCtrl()
   {
      super();
      this.transListItems = [];
   }
   function __get__type()
   {
      return this._type;
   }
   function __set__type(value)
   {
      this._type = value;
      this.invalidate();
      return this.__get__type();
   }
   function __get__mode()
   {
      return this._mode;
   }
   function __set__mode(value)
   {
      this._mode = value;
      this.modeChanged = true;
      this.dispatchEvent({type:"modeChanged"});
      this.invalidate();
      return this.__get__mode();
   }
   function __get__arrangeMode()
   {
      return this._arrangeMode;
   }
   function __set__arrangeMode(value)
   {
      this._arrangeMode = value;
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
      this.drawLayout(_loc3_,_loc2_);
      return this.__get__arrangeMode();
   }
   function draw()
   {
      super.draw();
      if(!this.initRenderers && this.renderers.length > 0)
      {
         this.initRenderers = true;
         var _loc3_ = 0;
         while(_loc3_ < this.renderers.length)
         {
            this["shortcut__" + _loc3_] = this.renderers[_loc3_];
            _loc3_ = _loc3_ + 1;
         }
         this.registerTooltips();
      }
      if(this.modeChanged)
      {
         this.modeChanged = false;
         this.showExtension(this._mode != "small");
         this.dispatchEvent({type:"modeChanged"});
      }
   }
   function drawLayout(rendererWidth, rendererHeight)
   {
      if(this._arrangeMode == com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_HORIZONTAL)
      {
         this.totalColumns = 12;
         this.totalRows = 2;
         this._direction = "vertical";
      }
      else if(this._arrangeMode == com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_VERTICAL)
      {
         this.totalColumns = 2;
         this.totalRows = 12;
         this._direction = "horizontal";
      }
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
            if(_loc2_ % this.totalColumns > 5)
            {
               _loc3_._x = _loc3_._x + 88;
            }
         }
         this.renderers[_loc2_].setSize(rendererWidth,rendererHeight);
         _loc2_ = _loc2_ + 1;
      }
      this.drawScrollBar();
   }
   function getItemAt(index)
   {
      var _loc2_ = (MovieClip)this.renderers[index];
      return _loc2_;
   }
   function registerTooltips()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.renderers.length)
      {
         var _loc3_ = this.renderers[_loc2_];
         _loc3_._name = "shortcut__" + _loc2_;
         lib.manager.ToolTip.add(_loc3_,_loc2_,6);
         _loc2_ = _loc2_ + 1;
      }
   }
   function showExtension(show)
   {
      var _loc3_ = 0;
      while(_loc3_ < this.renderers.length)
      {
         var _loc2_ = (MovieClip)this.renderers[_loc3_];
         if(_loc2_.index % 12 > 5)
         {
            if(show)
            {
               _loc2_._visible = true;
            }
            else
            {
               _loc2_._visible = false;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
   }
}
