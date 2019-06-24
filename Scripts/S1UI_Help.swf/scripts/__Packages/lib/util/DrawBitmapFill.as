class lib.util.DrawBitmapFill
{
   static var scope = new Object();
   function DrawBitmapFill()
   {
   }
   static function draw(target, LinkageID, w, h)
   {
      var myBitmapData = flash.display.BitmapData.loadBitmap(LinkageID);
      var nc2 = target.createEmptyMovieClip("tmp_target2",target.getNextHighestDepth());
      with(nc2)
      {
         beginBitmapFill(myBitmapData)
         moveTo(0,0)
         lineTo(0,272)
         lineTo(360,272)
         lineTo(360,0)
         lineTo(0,0)
         endFill()
         
      };
      nc2._x = 0;
      nc2._y = 0;
      if(myBitmapData == null)
      {
         return undefined;
      }
   }
}
