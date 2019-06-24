class lib.util.RGBColor
{
   function RGBColor()
   {
   }
   static function RGBToHexdecimal(R, G, B)
   {
      R = Number(R).toString(16);
      if(R.length < 2)
      {
         R = "0" + R;
      }
      G = Number(G).toString(16);
      if(G.length < 2)
      {
         G = "0" + G;
      }
      B = Number(B).toString(16);
      if(B.length < 2)
      {
         B = "0" + B;
      }
      return "0x" + R + G + B;
   }
   static function HexdecimalToRGB(hex)
   {
      hex = hex.substr(2);
      var _loc3_ = Number("0x" + hex.substr(0,2));
      var _loc4_ = Number("0x" + hex.substr(2,2));
      var _loc2_ = Number("0x" + hex.substr(4,2));
      return _loc3_ + "\t" + _loc4_ + "\t" + _loc2_;
   }
   static function setRGB(targetMc, hexdecimalOrR, G, B)
   {
      var _loc1_ = new Color(targetMc);
      if(G == undefined && B == undefined)
      {
         _loc1_.setRGB(hexdecimalOrR);
      }
      else
      {
         _loc1_.setRGB(lib.util.RGBColor.RGBToHexdecimal(hexdecimalOrR,G,B));
      }
   }
   static function addRGB(targetMc, hexdecimalOrR, G, B)
   {
      if(G == undefined && B == undefined)
      {
         var _loc1_ = lib.util.RGBColor.HexdecimalToRGB(hexdecimalOrR).split("\t");
         lib.info.ColorTrans.setTrans(targetMc,new flash.geom.ColorTransform(1,1,1,1,Number(_loc1_[0]),Number(_loc1_[1]),Number(_loc1_[2]),0));
      }
      else
      {
         lib.info.ColorTrans.setTrans(targetMc,new flash.geom.ColorTransform(1,1,1,1,hexdecimalOrR,G,B,0));
      }
   }
}
