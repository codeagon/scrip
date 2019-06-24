class g4.util.ScreenUtil
{
   function ScreenUtil()
   {
   }
   static function getScreenWidth()
   {
      var _loc1_ = undefined;
      if(Stage.visibleRect.width < 0)
      {
         _loc1_ = 1920;
      }
      else
      {
         _loc1_ = Stage.width;
      }
      return _loc1_;
   }
   static function getScreenHeight()
   {
      var _loc1_ = undefined;
      if(Stage.visibleRect.height < 0)
      {
         _loc1_ = 1080;
      }
      else
      {
         _loc1_ = Stage.height;
      }
      return _loc1_;
   }
   static function getScreenMinX()
   {
      return Stage.visibleRect.x;
   }
   static function getScreenMinY()
   {
      return Stage.visibleRect.y;
   }
   static function getScreenMaxX()
   {
      return g4.util.ScreenUtil.getScreenMinX() + g4.util.ScreenUtil.getScreenWidth();
   }
   static function getScreenMaxY()
   {
      return g4.util.ScreenUtil.getScreenMinY() + g4.util.ScreenUtil.getScreenHeight();
   }
   static function convertScreenPixelToRatioX(x)
   {
      return (x - g4.util.ScreenUtil.getScreenMinX()) / g4.util.ScreenUtil.getScreenWidth();
   }
   static function convertScreenPixelToRatioY(y)
   {
      return (y - g4.util.ScreenUtil.getScreenMinY()) / g4.util.ScreenUtil.getScreenHeight();
   }
   static function convertScreenRatioToPixelX(ratioX)
   {
      return g4.util.ScreenUtil.getScreenMinX() + g4.util.ScreenUtil.getScreenWidth() * ratioX;
   }
   static function convertScreenRatioToPixelY(ratioY)
   {
      return g4.util.ScreenUtil.getScreenMinY() + g4.util.ScreenUtil.getScreenHeight() * ratioY;
   }
}
