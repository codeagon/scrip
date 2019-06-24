class lib.util.DrawBitmap
{
   function DrawBitmap()
   {
   }
   static function draw(target, LinkageID, w, h)
   {
      if(target == undefined)
      {
         return undefined;
      }
      if(LinkageID == undefined || LinkageID == null || LinkageID == "")
      {
         lib.util.DrawBitmap.clear(target);
      }
      else
      {
         var _loc3_ = flash.display.BitmapData.loadBitmap(LinkageID);
         target.attachBitmap(_loc3_,1);
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
         _loc1_.attachBitmap(_loc3_,1);
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
}
