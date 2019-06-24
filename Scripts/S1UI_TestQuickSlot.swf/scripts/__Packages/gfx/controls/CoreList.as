class gfx.controls.CoreList extends gfx.core.UIComponent
{
   var _itemRenderer = "ListItemRenderer";
   var _selectedIndex = -1;
   var _labelField = "label";
   var externalRenderers = false;
   var deferredScrollIndex = -1;
   function CoreList()
   {
      super();
      this.renderers = [];
      this.__set__dataProvider([]);
      if(this.container == undefined)
      {
         this.container = this.createEmptyMovieClip("container",1);
      }
      this.container.scale9Grid = new flash.geom.Rectangle(0,0,1,1);
      this.tabEnabled = this.focusEnabled = true;
   }
   function __get__itemRenderer()
   {
      return this._itemRenderer;
   }
   function __set__itemRenderer(value)
   {
      if(value == this._itemRenderer || value == "")
      {
         return undefined;
      }
      this._itemRenderer = value;
      this.resetRenderers();
      this.invalidate();
      return this.__get__itemRenderer();
   }
   function __get__dataProvider()
   {
      return this._dataProvider;
   }
   function __set__dataProvider(value)
   {
      if(this._dataProvider == value)
      {
         return undefined;
      }
      if(this._dataProvider != null)
      {
         this._dataProvider.removeEventListener("change",this,"onDataChange");
      }
      this._dataProvider = value;
      if(this._dataProvider == null)
      {
         return undefined;
      }
      if(value instanceof Array && !value.isDataProvider)
      {
         gfx.data.DataProvider.initialize(this._dataProvider);
      }
      else if(this._dataProvider.initialize != null)
      {
         this._dataProvider.initialize(this);
      }
      this._dataProvider.addEventListener("change",this,"onDataChange");
      this.invalidate();
      return this.__get__dataProvider();
   }
   function __get__selectedIndex()
   {
      return this._selectedIndex;
   }
   function __set__selectedIndex(value)
   {
      var _loc3_ = this._selectedIndex;
      this._selectedIndex = value;
      this.dispatchEvent({type:"change",index:this._selectedIndex,lastIndex:_loc3_});
      return this.__get__selectedIndex();
   }
   function scrollToIndex(index)
   {
   }
   function __get__labelField()
   {
      return this._labelField;
   }
   function __set__labelField(value)
   {
      this._labelField = value;
      this.invalidateData();
      return this.__get__labelField();
   }
   function __get__labelFunction()
   {
      return this._labelFunction;
   }
   function __set__labelFunction(value)
   {
      this._labelFunction = value;
      this.invalidateData();
      return this.__get__labelFunction();
   }
   function itemToLabel(item)
   {
      if(item == null)
      {
         return "";
      }
      if(this._labelFunction != null)
      {
         return this._labelFunction(item);
      }
      if(this._labelField != null && item[this._labelField] != null)
      {
         return item[this._labelField];
      }
      return item.toString();
   }
   function invalidateData()
   {
   }
   function __get__availableWidth()
   {
      return this.__width;
   }
   function __get__availableHeight()
   {
      return this.__height;
   }
   function setRendererList(value)
   {
      if(this.externalRenderers)
      {
         var _loc3_ = 0;
         while(_loc3_ < this.renderers.length)
         {
            var _loc2_ = this.renderers[_loc3_];
            _loc2_.owner = null;
            _loc2_.removeEventListener("click",this,"handleItemClick");
            _loc2_.removeEventListener("rollOver",this,"dispatchItemEvent");
            _loc2_.removeEventListener("rollOut",this,"dispatchItemEvent");
            _loc2_.removeEventListener("press",this,"dispatchItemEvent");
            _loc2_.removeEventListener("doubleClick",this,"dispatchItemEvent");
            Mouse.removeListener(_loc2_);
            _loc3_ = _loc3_ + 1;
         }
      }
      else
      {
         this.resetRenderers();
      }
      this.externalRenderers = value != null;
      if(this.externalRenderers)
      {
         this.renderers = value;
      }
      this.invalidate();
   }
   function __get__rendererInstanceName()
   {
      return null;
   }
   function __set__rendererInstanceName(value)
   {
      if(value == null || value == "")
      {
         return undefined;
      }
      var _loc3_ = 0;
      var _loc4_ = [];
      while(true)
      {
         _loc3_ = _loc3_ + 1;
         var _loc2_ = this._parent[value + _loc3_];
         if(_loc2_ == null && _loc3_ > 0)
         {
            break;
         }
         if(_loc2_ != null)
         {
            this.setUpRenderer(_loc2_);
            Mouse.addListener(_loc2_);
            _loc2_.scrollWheel = function(delta)
            {
               this.owner.scrollWheel(delta);
            };
            _loc4_.push(_loc2_);
         }
      }
      if(_loc4_.length == 0)
      {
         _loc4_ = null;
      }
      this.setRendererList(_loc4_);
      return this.__get__rendererInstanceName();
   }
   function toString()
   {
      return "[Scaleform CoreList " + this._name + "]";
   }
   function configUI()
   {
      super.configUI();
      if(this._selectedIndex > -1)
      {
         this.deferredScrollIndex = this._selectedIndex;
      }
      if(this.inspectableRendererInstanceName != "")
      {
         this.__set__rendererInstanceName(this.inspectableRendererInstanceName);
      }
      Mouse.addListener(this);
   }
   function createItemRenderer(index)
   {
      var _loc2_ = this.container.attachMovie(this._itemRenderer,"renderer" + index,index);
      if(_loc2_ == null)
      {
         return null;
      }
      this.setUpRenderer(_loc2_);
      return _loc2_;
   }
   function setUpRenderer(clip)
   {
      clip.owner = this;
      clip.tabEnabled = false;
      clip.doubleClickEnabled = true;
      clip.addEventListener("press",this,"dispatchItemEvent");
      clip.addEventListener("click",this,"handleItemClick");
      clip.addEventListener("doubleClick",this,"dispatchItemEvent");
      clip.addEventListener("rollOver",this,"dispatchItemEvent");
      clip.addEventListener("rollOut",this,"dispatchItemEvent");
   }
   function createItemRenderers(startIndex, endIndex)
   {
      var _loc3_ = [];
      var _loc2_ = startIndex;
      while(_loc2_ <= endIndex)
      {
         _loc3_.push(this.createItemRenderer[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function draw()
   {
      if(this.deferredScrollIndex != -1)
      {
         this.scrollToIndex(this.deferredScrollIndex);
         this.deferredScrollIndex = -1;
      }
   }
   function drawRenderers(totalRenderers)
   {
      while(this.renderers.length > totalRenderers)
      {
         this.renderers.pop().removeMovieClip();
      }
      while(this.renderers.length < totalRenderers)
      {
         this.renderers.push(this.createItemRenderer(this.renderers.length));
      }
   }
   function getRendererAt(index)
   {
      return this.renderers[index];
   }
   function resetRenderers()
   {
      while(this.renderers.length > 0)
      {
         this.renderers.pop().removeMovieClip();
      }
   }
   function drawLayout(rendererWidth, rendererHeight)
   {
   }
   function onDataChange(event)
   {
      this.invalidateData();
   }
   function dispatchItemEvent(event)
   {
      var _loc9_ = undefined;
      switch(event.type)
      {
         case "press":
            _loc9_ = "itemPress";
            break;
         case "click":
            _loc9_ = "itemClick";
            break;
         case "rollOver":
            _loc9_ = "itemRollOver";
            break;
         case "rollOut":
            _loc9_ = "itemRollOut";
            break;
         case "doubleClick":
            _loc9_ = "itemDoubleClick";
            break;
         default:
            return undefined;
      }
      var _loc3_ = {target:this,type:_loc9_,item:event.target.data,renderer:event.target,index:event.target.index,mouseIndex:event.mouseIndex};
      this.dispatchEvent(_loc3_);
   }
   function handleItemClick(event)
   {
      var _loc2_ = event.target.index;
      if(isNaN(_loc2_))
      {
         return undefined;
      }
      this.__set__selectedIndex(_loc2_);
      this.dispatchItemEvent(event);
   }
}
