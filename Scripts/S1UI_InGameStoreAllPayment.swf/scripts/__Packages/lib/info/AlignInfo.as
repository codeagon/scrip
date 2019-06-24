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
      var _loc4_ = lib.info.AlignInfo.horizontalSpace + ui._x;
      var _loc6_ = lib.info.AlignInfo.verticalSpace + ui._y;
      if(optionCustomX != undefined)
      {
         _loc4_ = optionCustomX;
      }
      if(optionCustomY != undefined)
      {
         _loc6_ = optionCustomY;
      }
      var _loc5_ = _root.GetRegisterUIData(ui._name);
      var _loc7_ = lib.info.AlignInfo.uiScale(ui._name,ui);
      var _loc3_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc7_);
      if(_loc5_.PA == 1)
      {
         lib.Debuger.trace("UIdata.PA == 1");
      }
      if(_loc5_.PA == 2)
      {
         _loc4_ = _loc4_ + ui.hit._width / 2 * _loc3_;
      }
      if(_loc5_.PA == 3)
      {
         _loc4_ = _loc4_ + ui.hit._width * _loc3_;
      }
      if(_loc5_.PA == 4)
      {
         _loc6_ = _loc6_ + ui.hit._height / 2 * _loc3_;
      }
      else if(_loc5_.PA == 5)
      {
         _loc4_ = _loc4_ + ui.hit._width / 2 * _loc3_;
         _loc6_ = _loc6_ + ui.hit._height / 2 * _loc3_;
      }
      else if(_loc5_.PA == 6)
      {
         _loc4_ = _loc4_ + ui.hit._width * _loc3_;
         _loc6_ = _loc6_ + ui.hit._height / 2 * _loc3_;
      }
      else if(_loc5_.PA == 7)
      {
         _loc6_ = _loc6_ + ui.hit._height * _loc3_;
      }
      else if(_loc5_.PA == 8)
      {
         lib.Debuger.trace("UIdata.PA == 8");
         _loc4_ = _loc4_ + ui.hit._width / 2 * _loc3_;
         lib.Debuger.trace("ui.hit._width : " + ui.hit._width);
         _loc6_ = _loc6_ + ui.hit._height * _loc3_;
      }
      else if(_loc5_.PA == 9)
      {
         _loc4_ = _loc4_ + ui.hit._width * _loc3_;
         _loc6_ = _loc6_ + ui.hit._height * _loc3_;
      }
      lib.Debuger.trace("ratioX 1 : " + _loc4_ + ", onePixelPercentW : " + lib.info.AlignInfo.onePixelPercentW);
      _loc4_ = _loc4_ * lib.info.AlignInfo.onePixelPercentW;
      _loc6_ = _loc6_ * lib.info.AlignInfo.onePixelPercentH;
      lib.Debuger.trace("ratioX : " + _loc4_);
      _root.ToGame_SaveUIPosition(lockState,ui._name,_loc4_,_loc6_);
   }
   static function savePosCustom(ui, lockState, xRatio, yRatio)
   {
      _root.ToGame_SaveUIPosition(lockState,ui._name,xRatio,yRatio);
   }
   static function uiScale(_uiname, _ui)
   {
      var _loc2_ = 1;
      _uiname = _uiname.toUpperCase();
      if(_uiname == "CHARACTERWINDOW")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_CHARACTERWINDOW_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_CHARACTERWINDOW_PERCENT";
      }
      else if(_uiname == "MINIMAP")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_MINIMAP_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_MINIMAP_PERCENT";
      }
      else if(_uiname == "OVERLAYMAP2")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_OVERLAYMAP2_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_OVERLAYMAP2_PERCENT";
      }
      else if(_uiname == "CHAT2")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_CHAT2_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_CHAT2_PERCENT";
      }
      else if(_uiname == "SHORTCUT")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_SHORTCUT_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_SHORTCUT_PERCENT";
      }
      else if(_uiname == "MAINMENU")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_MAINMENU_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_MAINMENU_PERCENT";
      }
      else if(_uiname == "PARTYWINDOW")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_PARTYWINDOW_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_PARTYWINDOW_PERCENT";
      }
      else if(_uiname == "CROSSHAIR")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_CROSSHAIR_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_CROSSHAIR_PERCENT";
      }
      else if(_uiname == "GAGEBAR")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_GAGEBAR_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_GAGEBAR_PERCENT";
      }
      else if(_uiname == "HOMUNSHORTCUT")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_HOMUNSHORTCUT_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_HOMUNSHORTCUT_PERCENT";
      }
      else if(_uiname == "ABNORMALITY")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_ABNORMALITY_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_ABNORMALITY_PERCENT";
      }
      else if(_uiname == "QUESTTASKINFO")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_QUESTTASKINFO_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_QUESTTASKINFO_PERCENT";
      }
      else if(_uiname == "BFSCOREBOARD")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_BFSCOREBOARD_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_BFSCOREBOARD_PERCENT";
      }
      else if(_uiname == "EXTSHORTCUT")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_EXTSHORTCUT_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_EXTSHORTCUT_PERCENT";
      }
      else if(_uiname == "PAPERDOLL")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_PAPERDOLL_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_PAPERDOLL_PERCENT";
      }
      else if(_uiname == "SKILLWINDOW")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_SKILLWINDOW_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_SKILLWINDOW_PERCENT";
      }
      else if(_uiname == "QUESTJOURNAL")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_QUESTJOURNAL_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_QUESTJOURNAL_PERCENT";
      }
      else if(_uiname == "INVENTORY")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_INVENTORY_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_INVENTORY_PERCENT";
      }
      else if(_uiname == "WAREHOUSEWINDOW")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_WAREHOUSEWINDOW_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_WAREHOUSEWINDOW_PERCENT";
      }
      else if(_uiname == "WORLDMAP2")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_WORLDMAP2_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_WORLDMAP2_PERCENT";
      }
      else if(_uiname == "PRODUCTIONLIST")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_PRODUCTIONLIST_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_PRODUCTIONLIST_PERCENT";
      }
      else if(_uiname == "GUILDWINDOW")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_GUILDWINDOW_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_GUILDWINDOW_PERCENT";
      }
      else if(_uiname == "COMMUNITYWINDOW")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_COMMUNITYWINDOW_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_COMMUNITYWINDOW_PERCENT";
      }
      else if(_uiname == "PARTYBOARD")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_PARTYBOARD_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_PARTYBOARD_PERCENT";
      }
      else if(_uiname == "TRADEHOUSE")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_TRADEHOUSE_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_TRADEHOUSE_PERCENT";
      }
      else if(_uiname == "STOREWINDOW")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_STOREWINDOW_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_STOREWINDOW_PERCENT";
      }
      else if(_uiname == "PARCELPOST")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_PARCELPOST_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_PARCELPOST_PERCENT";
      }
      else if(_uiname == "HELP")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_HELP_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_HELP_PERCENT";
      }
      else if(_uiname == "PARTYWINDOWRAIDINFO")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_PARTYWINDOWRAIDINFO_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_PARTYWINDOWRAIDINFO_PERCENT";
      }
      else if(_uiname == "GAMECONTROLLERSHORTCUT")
      {
         _loc2_ = lib.info.AlignInfo.SCALE_GAMECONTROLLERSHORTCUT_PERCENT / 100;
         lib.info.AlignInfo.UISCALE_VARS = "SCALE_GAMECONTROLLERSHORTCUT_PERCENT";
      }
      if(_ui != undefined)
      {
         if(_ui._xscale >= 150)
         {
            _loc2_ = 1.87;
            lib.info.AlignInfo["SCALE_" + _uiname + "_PERCENT"] = 187;
         }
         if(_ui._xscale <= 50)
         {
            _loc2_ = 0.63;
            lib.info.AlignInfo["SCALE_" + _uiname + "_PERCENT"] = 63;
         }
         _ui.container_mc.UIDrager.setData(_uiname,_ui,_ui.container_mc.lock_mc);
      }
      if(_uiname == "CHAT2")
      {
         if(_ui.container_mc._y > 1150)
         {
            _ui.container_mc._y = 1150;
         }
      }
      if(_uiname == "TRADEPOPUP")
      {
         _ui.container_mc.UIDrager.setData(_uiname,_ui.container_mc,_ui.container_mc.lock_mc);
      }
      return _loc2_;
   }
   static function uiScaleLimit(num)
   {
      var _loc1_ = num;
      if(num >= 1.5)
      {
         _loc1_ = 1.496;
      }
      if(num <= 0.5)
      {
         _loc1_ = 0.51;
      }
      return _loc1_;
   }
}
