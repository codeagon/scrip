class lib.util.McMaker
{
   function McMaker()
   {
   }
   static function attach(target, linkage, size)
   {
      var _loc1_ = target.attachMovie(linkage,linkage,1);
      if(size != undefined && size != "")
      {
         _loc1_._width = _loc1_._height = size;
      }
      return _loc1_;
   }
   static function clear(container)
   {
      var _loc4_ = container._visible;
      var _loc3_ = container._name;
      var _loc5_ = container.getDepth();
      var _loc7_ = container._x;
      var _loc6_ = container._y;
      var _loc1_ = container._parent.createEmptyMovieClip(_loc3_,_loc5_);
      _loc1_._visible = _loc4_;
      _loc1_._x = _loc7_;
      _loc1_._y = _loc6_;
      return _loc1_;
   }
   function createMovie(linkage, target, name, fX, fY, wNumber, hNumber, wG, hG, startNumber, maxMovieNum, hitarea, width)
   {
      this.mc_array = new Array();
      this.clearMovie();
      this.container = target;
      this.prefix = name;
      var _loc8_ = 0;
      var _loc4_ = startNumber;
      this.firstX = fX;
      this.firstY = fY;
      this.wGap = wG;
      this.hGap = hG;
      this.wNum = wNumber;
      this.hNum = hNumber;
      this.wCount = this.firstX;
      this.hCount = this.firstY;
      var _loc2_ = undefined;
      var _loc5_ = undefined;
      var _loc7_ = undefined;
      var _loc10_ = 0;
      while(_loc10_ < hNumber)
      {
         var _loc3_ = 0;
         while(_loc3_ < wNumber)
         {
            _loc2_ = target.attachMovie(linkage,name + _loc4_,_loc4_);
            if(hitarea != undefined)
            {
               _loc5_ = _loc2_[hitarea]._width;
               _loc7_ = _loc2_[hitarea]._height;
            }
            else
            {
               _loc5_ = _loc2_._width;
               _loc7_ = _loc2_._height;
            }
            if(width != undefined)
            {
               _loc2_._width = width;
            }
            _loc2_._x = this.wCount;
            _loc2_._y = this.hCount;
            this.wCount = this.wCount + (_loc5_ + this.wGap);
            this.mc_array.push(_loc2_);
            _loc4_ = _loc4_ + 1;
            _loc8_ = _loc8_ + 1;
            if(_loc8_ == maxMovieNum)
            {
               return undefined;
            }
            _loc3_ = _loc3_ + 1;
         }
         this.wCount = this.firstX;
         this.hCount = this.hCount + (_loc7_ + this.hGap);
         _loc10_ = _loc10_ + 1;
      }
   }
   function clearMovie()
   {
      var _loc4_ = this.container.getDepth();
      var _loc3_ = this.container._name;
      var _loc6_ = this.container._x;
      var _loc5_ = this.container._y;
      var _loc2_ = this.container._parent.createEmptyMovieClip(_loc3_,_loc4_);
      _loc2_._x = _loc6_;
      _loc2_._y = _loc5_;
   }
   function getContainer()
   {
      return this.container;
   }
   function searchById(id)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.mc_array.length)
      {
         var _loc3_ = this.mc_array[_loc2_];
         if(_loc3_.id == id)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function arrange()
   {
   }
   function help()
   {
   }
}
