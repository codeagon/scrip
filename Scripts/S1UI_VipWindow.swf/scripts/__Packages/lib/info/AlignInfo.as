class lib.info.AlignInfo
{
   static var UI_WIDTH = 1920;
   static var UI_HEIGHT = 1080;
   static var scaleRatio = 1;
   static var DRAG_SAVESPACE = 70;
   static var ALIGN_YPOS = 120;
   static var zeroPointX = 0;
   static var zeroPointY = 0;
   static var onePercentPixelW = 0;
   static var onePercentPixelH = 0;
   static var onePixelPercentW = 0;
   static var onePixelPercentH = 0;
   static var horizontalSpace = 0;
   static var verticalSpace = 0;
   static var SCALE_CHARACTERWINDOW_PERCENT = 100;
   static var SCALE_MINIMAP_PERCENT = 100;
   static var SCALE_OVERLAYMAP2_PERCENT = 100;
   static var SCALE_CHAT2_PERCENT = 100;
   static var SCALE_SHORTCUT_PERCENT = 100;
   static var SCALE_MAINMENU_PERCENT = 100;
   static var SCALE_PARTYWINDOW_PERCENT = 100;
   static var SCALE_CROSSHAIR_PERCENT = 100;
   static var SCALE_GAGEBAR_PERCENT = 100;
   static var SCALE_HOMUNSHORTCUT_PERCENT = 100;
   static var SCALE_ABNORMALITY_PERCENT = 100;
   static var SCALE_QUESTTASKINFO_PERCENT = 100;
   static var SCALE_BFSCOREBOARD_PERCENT = 100;
   static var SCALE_EXTSHORTCUT_PERCENT = 100;
   static var SCALE_GAMECONTROLLERSHORTCUT_PERCENT = 100;
   static var SCALE_PAPERDOLL_PERCENT = 100;
   static var SCALE_SKILLWINDOW_PERCENT = 100;
   static var SCALE_QUESTJOURNAL_PERCENT = 100;
   static var SCALE_INVENTORY_PERCENT = 100;
   static var SCALE_WAREHOUSEWINDOW_PERCENT = 100;
   static var SCALE_WORLDMAP2_PERCENT = 100;
   static var SCALE_PRODUCTIONLIST_PERCENT = 100;
   static var SCALE_GUILDWINDOW_PERCENT = 100;
   static var SCALE_COMMUNITYWINDOW_PERCENT = 100;
   static var SCALE_PARTYBOARD_PERCENT = 100;
   static var SCALE_TRADEHOUSE_PERCENT = 100;
   static var SCALE_STOREWINDOW_PERCENT = 100;
   static var SCALE_PARCELPOST_PERCENT = 100;
   static var SCALE_HELP_PERCENT = 100;
   static var SCALE_PARTYWINDOWRAIDINFO_PERCENT = 100;
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
   static function savePos(ui, lockState, optionCustomX, optionCustomY)
   {
      var _loc2_ = _root.GetRegisterUIData(ui._name);
      com.bluehole.tera.managers.LayoutManager.saveUIPositon(ui,_loc2_.PA,lockState,optionCustomX,optionCustomY);
   }
   static function savePosCustom(ui, lockState, xRatio, yRatio)
   {
      _root.ToGame_SaveUIPosition(lockState,ui._name,xRatio,yRatio);
   }
   static function uiScale(uiName, ui)
   {
      var _loc1_ = 1;
      var _loc2_ = "SCALE_" + uiName.toUpperCase() + "_PERCENT";
      if(lib.info.AlignInfo[_loc2_] != undefined)
      {
         _loc1_ = Number(lib.info.AlignInfo[_loc2_]) * 0.01;
         lib.info.AlignInfo.UISCALE_VARS = _loc2_;
      }
      var _loc4_ = com.bluehole.tera.managers.WidgetManager.getInstance().getWidgetData(uiName);
      if(_loc4_.ScaleCustom)
      {
         _loc1_ = _loc1_ * Number(_loc4_.ScaleCustom) / Number(lib.gamedata.DefaultData.getDefaultUIData("uiscale").param0);
      }
      if(ui)
      {
         if(ui._xscale >= 150)
         {
            _loc1_ = 1.87;
            lib.info.AlignInfo[_loc2_] = 187;
         }
         else if(ui._xscale <= 50)
         {
            _loc1_ = 0.63;
            lib.info.AlignInfo[_loc2_] = 63;
         }
         ui.container_mc.UIDrager.setData(uiName,ui,ui.container_mc.lock_mc);
      }
      if(_loc4_.Name.toLowerCase() == "crosshair")
      {
         _loc1_ = _loc1_ + 0.2;
      }
      return _loc1_;
   }
   static function uiScaleLimit(num)
   {
      num = Math.min(num,1.496);
      num = Math.max(num,0.5);
      return num;
   }
}
