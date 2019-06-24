class lib.util.Warning
{
   static var working = false;
   static var turnFrames = 20;
   static var halfTurnFrames = lib.util.Warning.turnFrames / 2;
   static var currentframe = 1;
   function Warning()
   {
   }
   static function init()
   {
      lib.util.Warning.array = new Array();
      lib.util.Warning.mc = _root.createEmptyMovieClip("warning",_root.getNextHighestDepth());
   }
   static function start()
   {
      lib.util.Warning.working = true;
      lib.util.Warning.mc.onEnterFrame = function()
      {
         lib.util.Warning.currentframe = lib.util.Warning.currentframe + 1;
         if(lib.util.Warning.currentframe >= lib.util.Warning.turnFrames)
         {
            lib.util.Warning.currentframe = 1;
         }
         var _loc2_ = lib.util.Warning.array.length;
         var _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            if(lib.util.Warning.currentframe <= lib.util.Warning.halfTurnFrames)
            {
               lib.util.Warning.array[_loc1_]._alpha = lib.util.Warning.currentframe / lib.util.Warning.halfTurnFrames * 100;
            }
            else
            {
               lib.util.Warning.array[_loc1_]._alpha = (lib.util.Warning.turnFrames - lib.util.Warning.currentframe) / lib.util.Warning.halfTurnFrames * 100;
            }
            _loc1_ = _loc1_ + 1;
         }
      };
   }
   static function search(target)
   {
      var _loc1_ = 0;
      while(_loc1_ < lib.util.Warning.array.length)
      {
         if(lib.util.Warning.array[_loc1_] == target)
         {
            return _loc1_;
         }
         _loc1_ = _loc1_ + 1;
      }
      return null;
   }
   static function add(target)
   {
      var _loc1_ = lib.util.Warning.search(target);
      if(_loc1_ == null)
      {
         lib.util.Warning.array.push(target);
         if(!lib.util.Warning.working)
         {
            lib.util.Warning.start();
         }
      }
   }
   static function remove(target, rightNow)
   {
      var _loc4_ = lib.util.Warning.array.length;
      var _loc3_ = null;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         if(lib.util.Warning.array[_loc2_] == target)
         {
            _loc3_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc3_ != null)
      {
         var _loc6_ = lib.util.Warning.array[_loc3_];
         lib.util.Warning.array.splice(_loc3_,1);
         if(rightNow != true)
         {
            _loc6_.onEnterFrame = function()
            {
               this._alpha = this._alpha - 100 / lib.util.Warning.halfTurnFrames;
               if(this._alpha <= 0)
               {
                  delete this.onEnterFrame;
               }
            };
         }
         else
         {
            _loc6_._alpha = 100;
         }
         if(lib.util.Warning.array.length <= 0)
         {
            delete lib.util.Warning.mc.onEnterFrame;
            lib.util.Warning.working = false;
         }
      }
   }
   static function destroy()
   {
      delete lib.util.Warning.mc.onEnterFrame;
      lib.util.Warning.mc.removeMovieClip();
      lib.util.Warning.currentframe = 1;
      lib.util.Warning.array = [];
      lib.util.Warning.working = false;
   }
}
