class gfx.controls.UILoader extends gfx.core.UIComponent
{
   var _maintainAspectRatio = true;
   var _autoSize = true;
   var _visiblilityBeforeLoad = true;
   var _loadOK = false;
   var _sizeRetries = 0;
   function UILoader()
   {
      super();
   }
   function __get__autoSize()
   {
      return this._autoSize;
   }
   function __set__autoSize(value)
   {
      this._autoSize = value;
      this.invalidate();
      return this.__get__autoSize();
   }
   function __get__source()
   {
      return this._source;
   }
   function __set__source(value)
   {
      if(value == "")
      {
         return undefined;
      }
      this.load(value);
      return this.__get__source();
   }
   function __get__maintainAspectRatio()
   {
      return this._maintainAspectRatio;
   }
   function __set__maintainAspectRatio(value)
   {
      this._maintainAspectRatio = value;
      this.invalidate();
      return this.__get__maintainAspectRatio();
   }
   function __get__content()
   {
      return this.contentHolder;
   }
   function __get__percentLoaded()
   {
      if(this.bytesTotal == 0 || this._source == null)
      {
         return 0;
      }
      return this.bytesLoaded / this.bytesTotal * 100;
   }
   function unload()
   {
      this.onEnterFrame = null;
      if(this.contentHolder != null)
      {
         this.__set__visible(this._visiblilityBeforeLoad);
         this.loader.unloadClip(this.contentHolder);
         this.contentHolder.removeMovieClip();
         this.contentHolder = null;
      }
      this._loadOK = false;
      this._sizeRetries = 0;
   }
   function toString()
   {
      return "[Scaleform UILoader " + this._name + "]";
   }
   function configUI()
   {
      super.configUI();
      this.initSize();
      this.bg.swapDepths(100);
      this.bg.removeMovieClip();
      if(!this.contentHolder && this._source)
      {
         this.load(this._source);
      }
   }
   function load(url)
   {
      if(url == "")
      {
         return undefined;
      }
      this.unload();
      this._source = url;
      if(!this.initialized)
      {
         return undefined;
      }
      this._visiblilityBeforeLoad = this.visible;
      this.__set__visible(false);
      this.contentHolder = this.createEmptyMovieClip("contentHolder",1);
      this.loader = new MovieClipLoader();
      this.loader.addListener(this);
      this.loader.loadClip(this._source,this.contentHolder);
      this.onEnterFrame = this.checkProgress;
   }
   function draw()
   {
      if(!this._loadOK)
      {
         return undefined;
      }
      this.contentHolder._xscale = this.contentHolder._yscale = 100;
      if(!this._autoSize)
      {
         return undefined;
      }
      if(this.contentHolder._width <= 0)
      {
         if(this._sizeRetries < 10)
         {
            this._sizeRetries = this._sizeRetries + 1;
            this.invalidate();
         }
         else
         {
            trace("Error: " + targetPath(this) + " cannot be autoSized because content _width is <= 0!");
         }
         return undefined;
      }
      if(this._maintainAspectRatio)
      {
         this.contentHolder._xscale = this.contentHolder._yscale = Math.min(this.__get__height() / this.contentHolder._height,this.__get__width() / this.contentHolder._width) * 100;
         this.contentHolder._x = this.__width - this.contentHolder._width >> 1;
         this.contentHolder._y = this.__height - this.contentHolder._height >> 1;
      }
      else
      {
         this.contentHolder._width = this.__width;
         this.contentHolder._height = this.__height;
      }
   }
   function onLoadError()
   {
      this.__set__visible(this._visiblilityBeforeLoad);
      this.dispatchEvent({type:"ioError"});
   }
   function onLoadComplete()
   {
      this.onEnterFrame = null;
      this._loadOK = true;
      this.draw();
      this.__set__visible(this._visiblilityBeforeLoad);
      this.dispatchEvent({type:"complete"});
   }
   function onLoadInit()
   {
      this.dispatchEvent({type:"init"});
   }
   function checkProgress()
   {
      var _loc2_ = this.loader.getProgress(this.contentHolder);
      this.bytesLoaded = _loc2_.bytesLoaded;
      this.bytesTotal = _loc2_.bytesTotal;
      if(this.bytesTotal < 5)
      {
         return undefined;
      }
      this.dispatchEvent({type:"progress",loaded:this.__get__percentLoaded()});
   }
}
