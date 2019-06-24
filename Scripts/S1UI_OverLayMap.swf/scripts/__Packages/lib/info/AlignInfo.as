class lib.info.AlignInfo
{
   static var UI_WIDTH = 1920;
   static var UI_HEIGHT = 1080;
   static var scaleRatio = 1;
   static var DRAG_SAVESPACE = 150;
   static var ALIGN_YPOS = 160;
   static var zeroPointX = 0;
   static var zeroPointY = 0;
   static var onePercentPixelW = 0;
   static var onePercentPixelH = 0;
   static var onePixelPercentW = 0;
   static var onePixelPercentH = 0;
   static var horizontalSpace = 0;
   static var verticalSpace = 0;
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
      var _loc1_ = lib.info.AlignInfo.UI_WIDTH / 2;
      var _loc2_ = (pixel - _loc1_) * 100 / _loc1_;
      return _loc2_;
   }
   static function yPixelToRatioFromCenter(pixel)
   {
      var _loc1_ = Stage.height / 2;
      var _loc2_ = (pixel - _loc1_) * 100 / _loc1_;
      return _loc2_;
   }
   static function xRatioToPixelFromCenter(ratio)
   {
      var _loc1_ = lib.info.AlignInfo.UI_WIDTH / 2;
      var _loc2_ = _loc1_ + ratio * _loc1_ / 100 + lib.info.AlignInfo.getHorizontalSpace() * ratio / 100;
      return _loc2_;
   }
   static function yRatioToPixelFromCenter(ratio)
   {
      var _loc1_ = lib.info.AlignInfo.UI_HEIGHT / 2;
      var _loc2_ = _loc1_ + ratio * _loc1_ / 100 + lib.info.AlignInfo.getVerticalSpace() * ratio / 100;
      return _loc2_;
   }
}
