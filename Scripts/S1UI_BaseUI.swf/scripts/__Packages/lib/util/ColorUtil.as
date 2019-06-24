class lib.util.ColorUtil
{
   function ColorUtil()
   {
   }
   static function RGBToHex(r, g, b)
   {
      var _loc2_ = Number(r).toString(16);
      if(_loc2_.length < 2)
      {
         _loc2_ = "0" + _loc2_;
      }
      var _loc3_ = Number(g).toString(16);
      if(_loc3_.length < 2)
      {
         _loc3_ = "0" + _loc3_;
      }
      var _loc1_ = Number(b).toString(16);
      if(_loc1_.length < 2)
      {
         _loc1_ = "0" + _loc1_;
      }
      return "0x" + _loc2_ + _loc3_ + _loc1_;
   }
}
