class lib.display.BitMapObject
{
   var bitmapIndex = 0;
   var bitmapTotal = 0;
   var offX = 0;
   var offY = 0;
   var x = 0;
   var y = 0;
   var scale = 1;
   var visible = true;
   var flag = false;
   function BitMapObject($bitmap, $container, $x, $y, $offX, $offY, $width, $height, $scale)
   {
      this["bitmap" + this.bitmapTotal] = !($bitmap instanceof flash.display.BitmapData)?flash.display.BitmapData.loadBitmap($bitmap):$bitmap;
      var _loc2_ = this["bitmap" + this.bitmapTotal];
      this.bitmapTotal = this.bitmapTotal + 1;
      this.container = $container;
      this.width = $width != undefined?$width:_loc2_.width;
      this.height = $height != undefined?$height:_loc2_.height;
      if($x != undefined)
      {
         this.x = $x;
      }
      if($y != undefined)
      {
         this.y = $y;
      }
      if($offX != undefined)
      {
         this.offX = $offX;
      }
      if($offY != undefined)
      {
         this.offY = $offY;
      }
      if($scale != undefined)
      {
         this.scale = $scale;
      }
   }
   function addBitmap($bitmap, $index)
   {
      this.bitmapTotal = this.bitmapTotal + 1;
      var _loc3_ = $index == undefined?this.bitmapTotal:$index;
      this["bitmap" + _loc3_] = !($bitmap instanceof flash.display.BitmapData)?flash.display.BitmapData.loadBitmap($bitmap):$bitmap;
   }
   function draw($x, $y, $offX, $offY, $width, $height, $container, $scale, $bitmap, $bRepeat)
   {
      if(!this.visible)
      {
         return undefined;
      }
      $container = $container != undefined?$container:this.container;
      $x = $x != undefined?$x:this.x;
      $y = $y != undefined?$y:this.y;
      $offX = $offX != undefined?$offX:this.offX;
      $offY = $offY != undefined?$offY:this.offY;
      $width = $width != undefined?$width:this.width;
      $height = $height != undefined?$height:this.height;
      $scale = $scale != undefined?$scale:this.scale;
      $bRepeat = $bRepeat != undefined?$bRepeat:false;
      var _loc11_ = new flash.geom.Matrix();
      _loc11_.createBox($scale,$scale,0,$x + $offX,$y + $offY,$width,$height);
      var _loc12_ = this["bitmap" + this.bitmapIndex];
      if($bitmap != undefined)
      {
         _loc12_ = !($bitmap instanceof flash.display.BitmapData)?flash.display.BitmapData.loadBitmap($bitmap):$bitmap;
      }
      $container.beginBitmapFill(_loc12_,_loc11_,$bRepeat);
      $container.moveTo($x,$y);
      $container.lineTo($x + $width,$y);
      $container.lineTo($x + $width,$y + $height);
      $container.lineTo($x,$y + $height);
      $container.lineTo($x,$y);
      $container.endFill();
   }
}
