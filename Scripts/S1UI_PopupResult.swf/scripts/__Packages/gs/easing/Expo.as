class gs.easing.Expo
{
   function Expo()
   {
   }
   static function easeIn(t, b, c, d)
   {
      return t != 0?c * Math.pow(2,10 * (t / d - 1)) + b - c * 0.001:b;
   }
   static function easeOut(t, b, c, d)
   {
      return t != d?c * (- Math.pow(2,-10 * t / d) + 1) + b:b + c;
   }
   static function easeInOut(t, b, c, d)
   {
      if(t == 0)
      {
         return b;
      }
      if(t == d)
      {
         return b + c;
      }
      if((t = t / (d / 2)) < 1)
      {
         return c / 2 * Math.pow(2,10 * (t - 1)) + b;
      }
      return c / 2 * (- Math.pow(2,-10 * (t = t - 1)) + 2) + b;
   }
}
