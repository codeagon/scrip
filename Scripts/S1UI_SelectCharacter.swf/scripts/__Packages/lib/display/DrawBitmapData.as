class lib.display.DrawBitmapData
{
   function DrawBitmapData()
   {
   }
   static function draw($target, $bitmap, $x, $y, $offX, $offY, $width, $height, $scaleX, $scaleY, $bRepeat, $rotate)
   {
      if($width == undefined || $height == undefined || $bitmap == undefined)
      {
         return undefined;
      }
      $x = $x != undefined?$x:0;
      $y = $y != undefined?$y:0;
      $offX = $offX != undefined?$offX:0;
      $offY = $offY != undefined?$offY:0;
      $scaleX = $scaleX != undefined?$scaleX:1;
      $scaleY = $scaleY != undefined?$scaleY:$scaleX;
      $bRepeat = $bRepeat != undefined?$bRepeat:false;
      var _loc10_ = new flash.geom.Matrix();
      _loc10_.createBox($scaleX,$scaleY,0,$x + $offX,$y + $offY,$width,$height);
      var _loc13_ = !($bitmap instanceof flash.display.BitmapData)?flash.display.BitmapData.loadBitmap($bitmap):$bitmap;
      $target.beginBitmapFill(_loc13_,_loc10_,$bRepeat,true);
      $target.moveTo($x,$y);
      $target.lineTo($x + $width,$y);
      $target.lineTo($x + $width,$y + $height);
      $target.lineTo($x,$y + $height);
      $target.lineTo($x,$y);
      $target.endFill();
   }
}
