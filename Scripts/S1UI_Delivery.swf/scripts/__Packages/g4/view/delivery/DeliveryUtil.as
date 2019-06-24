class g4.view.delivery.DeliveryUtil
{
   function DeliveryUtil()
   {
   }
   static function drawBitmap(bitmapID, target, x, y, width, height)
   {
      if(target == null)
      {
         return undefined;
      }
      target.clear();
      if(bitmapID == null)
      {
         return undefined;
      }
      var _loc2_ = flash.display.BitmapData.loadBitmap(bitmapID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      var _loc9_ = width / _loc2_.width;
      var _loc8_ = height / _loc2_.height;
      var _loc5_ = new flash.geom.Matrix();
      _loc5_.createBox(_loc9_,_loc8_,0,x,y,width,height);
      target.beginBitmapFill(_loc2_,_loc5_,false,true);
      target.moveTo(x,y);
      target.lineTo(x + width,y);
      target.lineTo(x + width,y + height);
      target.lineTo(x,y + height);
      target.lineTo(x,y);
      target.endFill();
   }
}
