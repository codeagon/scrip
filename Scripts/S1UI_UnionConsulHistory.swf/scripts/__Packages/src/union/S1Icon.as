class src.union.S1Icon
{
   function S1Icon(target, img, iconContainerName, posX, posY, w, h)
   {
      if(target != undefined)
      {
         this.create(target,img,iconContainerName,posX,posY,w,h);
      }
   }
   function create(target, img, iconContainerName, posX, posY, w, h, select)
   {
      var _loc1_ = (MovieClip)target[iconContainerName];
      if(_loc1_ == undefined)
      {
         _loc1_ = target.createEmptyMovieClip(iconContainerName,target.getNextHighestDepth());
      }
      if(posX == undefined)
      {
         posX = 0;
      }
      if(posY == undefined)
      {
         posY = 0;
      }
      if(w == undefined)
      {
         w = 30;
      }
      if(h == undefined)
      {
         h = 30;
      }
      var _loc2_ = flash.display.BitmapData.loadBitmap(img);
      _loc1_.attachBitmap(_loc2_,1);
      _loc1_._x = posX;
      _loc1_._y = posY;
      _loc1_._width = w;
      _loc1_._height = h;
      return _loc1_;
   }
}
