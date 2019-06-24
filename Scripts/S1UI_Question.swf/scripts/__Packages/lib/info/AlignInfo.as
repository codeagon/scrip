class lib.info.AlignInfo
{
   static var UI_WIDTH = 1920;
   static var UI_HEIGHT = 1200;
   static var DRAG_SAVESPACE = 150;
   static var ALIGN_YPOS = 150;
   function AlignInfo()
   {
   }
   static function getHorizontalSpace()
   {
      return (Stage.width - lib.info.AlignInfo.UI_WIDTH) / 2;
   }
   static function getVerticalSpace()
   {
      return (Stage.height - lib.info.AlignInfo.UI_HEIGHT) / 2;
   }
   static function xPixelToRatio(pixel)
   {
      return (lib.info.AlignInfo.getHorizontalSpace() + pixel) * 100 / Stage.width;
   }
   static function yPixelToRatio(pixel)
   {
      return (lib.info.AlignInfo.getVerticalSpace() + pixel) * 100 / Stage.height;
   }
   static function xRatioToPixel(ratio)
   {
      return (ratio * Stage.width - lib.info.AlignInfo.getHorizontalSpace() * 100) / 100;
   }
   static function yRatioToPixel(ratio)
   {
      return (ratio * Stage.height - lib.info.AlignInfo.getVerticalSpace() * 100) / 100;
   }
   static function xPixelToRatioFromCenter(pixel)
   {
      var _loc1_ = Stage.width / 2;
      return (pixel - _loc1_) * 100 / _loc1_;
   }
   static function yPixelToRatioFromCenter(pixel)
   {
      var _loc1_ = Stage.height / 2;
      return (pixel - _loc1_) * 100 / _loc1_;
   }
   static function xRatioToPixelFromCenter(ratio)
   {
      var _loc1_ = Stage.width / 2;
      return _loc1_ + ratio * _loc1_ / 100;
   }
   static function yRatioToPixelFromCenter(ratio)
   {
      var _loc1_ = Stage.height / 2;
      return _loc1_ + ratio * _loc1_ / 100;
   }
}
