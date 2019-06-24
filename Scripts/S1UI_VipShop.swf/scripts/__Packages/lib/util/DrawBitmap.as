class lib.util.DrawBitmap
{
   var _maintainAspectRatio = true;
   var _autoSize = true;
   var _visiblilityBeforeLoad = true;
   var _loadOK = false;
   var _sizeRetries = 0;
   function DrawBitmap()
   {
   }
   static function draw(target, LinkageID, w, h)
   {
      if(LinkageID == undefined || LinkageID == null || LinkageID == "")
      {
         lib.util.DrawBitmap.clear(target);
      }
      else
      {
         var _loc3_ = flash.display.BitmapData.loadBitmap(LinkageID);
         target.attachBitmap(_loc3_,1,"auto",true);
         if(w != undefined)
         {
            target._width = w;
         }
         if(h != undefined)
         {
            target._height = h;
         }
         target.TEX = LinkageID;
         if(_loc3_ == null)
         {
            return undefined;
         }
      }
      return target;
   }
   static function makeMcAndDraw(target, LinkageID, w, h)
   {
      if(LinkageID == undefined || LinkageID == null || LinkageID == "")
      {
         lib.util.DrawBitmap.clear(target);
      }
      else
      {
         var _loc3_ = flash.display.BitmapData.loadBitmap(LinkageID);
         var _loc1_ = target.createEmptyMovieClip(LinkageID,1);
         _loc1_.attachBitmap(_loc3_,1,"auto",true);
         if(w != undefined)
         {
            _loc1_._width = w;
         }
         if(h != undefined)
         {
            _loc1_._height = h;
         }
         target.TEX = LinkageID;
         if(_loc3_ == null)
         {
            return undefined;
         }
      }
      return _loc1_;
   }
   static function clear(target)
   {
      target.TEX = null;
      var _loc3_ = target._name;
      var _loc4_ = target.getDepth();
      var _loc6_ = target._x;
      var _loc5_ = target._y;
      var _loc2_ = target._parent.createEmptyMovieClip(_loc3_,_loc4_);
      _loc2_._x = _loc6_;
      _loc2_._y = _loc5_;
   }
   function createLoaderAndDraw(target, source, x, y, width, height)
   {
      this.contentHolder = target.createEmptyMovieClip(target + "_bitmapImage",target.getNextHighestDepth());
      this.contentHolder._x = x;
      this.contentHolder._y = y;
      target._width = width;
      target._height = height;
      this.contentHolder._width = width;
      this.contentHolder._height = height;
      this.loader = new MovieClipLoader();
      this.loader.addListener(this);
      lib.Debuger.trace("createLoaderAndDraw : " + source);
      this.loader.loadClip(source,this.contentHolder);
   }
   function updateDisplay()
   {
      if(!this._loadOK)
      {
         return undefined;
      }
      this.contentHolder._xscale = this.contentHolder._yscale = 100;
   }
   function onLoadError()
   {
   }
   function onLoadComplete()
   {
      this._loadOK = true;
      this.updateDisplay();
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
   }
}
