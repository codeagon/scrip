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
      var _loc3_ = lib.util.Warning.array.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc3_)
      {
         if(lib.util.Warning.array[_loc1_] == target)
         {
            return target;
         }
         _loc1_ = _loc1_ + 1;
      }
      return null;
   }
   static function add(target)
   {
      if(lib.util.Warning.search(target) == null)
      {
         lib.util.Warning.array.push(target);
         delete target.onEnterFrame;
         if(!lib.util.Warning.working)
         {
            lib.util.Warning.start();
         }
         _root.debug3.text = "((((((( 위험 추가 )))))))) " + lib.util.Warning.array.join(", ") + "\r" + _root.debug3.text;
      }
   }
   static function remove(target, rightNow)
   {
      var _loc5_ = lib.util.Warning.array.length;
      var _loc4_ = null;
      var _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         if(lib.util.Warning.array[_loc3_] == target)
         {
            _loc4_ = _loc3_;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(_loc4_ != null)
      {
         if(rightNow != true)
         {
            lib.util.Warning.array[_loc4_].onEnterFrame = function()
            {
               this._alpha = this._alpha - 100 / lib.util.Warning.halfTurnFrames;
               if(this._alpha <= 0)
               {
                  delete this.onEnterFrame;
               }
            };
         }
         lib.util.Warning.array.splice(_loc4_,1);
         if(lib.util.Warning.array.length <= 0)
         {
            delete lib.util.Warning.mc.onEnterFrame;
            lib.util.Warning.working = false;
         }
         _root.debug3.text = ")))))))) 위험 삭제 ((((((( " + lib.util.Warning.array.join(", ") + "\r" + _root.debug3.text;
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
