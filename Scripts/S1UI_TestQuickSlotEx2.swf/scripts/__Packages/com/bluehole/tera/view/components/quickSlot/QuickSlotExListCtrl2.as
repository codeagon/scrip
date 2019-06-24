class com.bluehole.tera.view.components.quickSlot.QuickSlotExListCtrl2 extends com.bluehole.tera.view.core.TeraTileList
{
   var modeChanged = false;
   var initRenderers = false;
   var _arrangeMode = com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_HORIZONTAL;
   function QuickSlotExListCtrl2()
   {
      super();
   }
   function __get__arrangeMode()
   {
      return this._arrangeMode;
   }
   function __set__arrangeMode(value)
   {
      if(this._arrangeMode == value)
      {
         return undefined;
      }
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
            this["shortcut__" + (_loc3_ + 62)] = this.renderers[_loc3_];
            _loc3_ = _loc3_ + 1;
         }
         this.registerTooltips();
      }
      if(this.modeChanged)
      {
         this.modeChanged = false;
         this.dispatchEvent({type:"modeChanged"});
      }
   }
   function drawLayout(rendererWidth, rendererHeight)
   {
      if(this._arrangeMode == com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_HORIZONTAL)
      {
         this.totalColumns = 6;
         this.totalRows = 2;
         this._direction = "vertical";
      }
      else if(this._arrangeMode == com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_VERTICAL)
      {
         this.totalColumns = 1;
         this.totalRows = 10;
         this._direction = "horizontal";
      }
      super.drawLayout(rendererWidth,rendererHeight);
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
         _loc3_._name = "shortcut__" + (_loc2_ + 62);
         lib.manager.ToolTip.add(_loc3_,_loc2_ + 62,6);
         _loc2_ = _loc2_ + 1;
      }
   }
   function changeUIMode($bShow)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.renderers.length)
      {
         this.renderers[_loc2_].changeUIMode($bShow);
         _loc2_ = _loc2_ + 1;
      }
   }
}
