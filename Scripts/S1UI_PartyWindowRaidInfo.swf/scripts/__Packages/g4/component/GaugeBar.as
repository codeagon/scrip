class g4.component.GaugeBar extends g4.core.SimpleView
{
   var width = 0;
   var height = 0;
   function GaugeBar(targetMovieClip, bitmapData, width, height)
   {
      super(targetMovieClip);
      this.bitmapData = bitmapData;
      this.width = width;
      this.height = height;
   }
   function setRatio(ratio)
   {
      this.__get__targetMovieClip().clear();
      ratio = Math.max(0,Math.min(1,ratio));
      if(ratio == 0)
      {
         return undefined;
      }
      var _loc3_ = this.height;
      var _loc5_ = - this.height;
      var _loc4_ = Math.floor((this.width - _loc3_) * ratio);
      var _loc6_ = this.height;
      if(_loc4_ == 0)
      {
         return undefined;
      }
      this.__get__targetMovieClip().beginBitmapFill(this.bitmapData,null,false,true);
      this.drawBar(this.__get__targetMovieClip(),0,0,_loc4_,_loc6_,_loc3_,_loc5_);
      this.__get__targetMovieClip().endFill();
   }
   function drawBar(mc, x, y, w, h, leftOffset, rightOffset)
   {
      mc.moveTo(x + leftOffset,y);
      mc.lineTo(x + leftOffset + w,y);
      mc.lineTo(x + leftOffset + w + rightOffset,y + h);
      mc.lineTo(x,y + h);
      mc.lineTo(x + leftOffset,y);
   }
}
