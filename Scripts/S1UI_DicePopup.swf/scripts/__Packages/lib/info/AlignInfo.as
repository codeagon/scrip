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
   static var SCALE_OVERAYMAP_PERCENT = 100;
   static var SCALE_CHAT_PERCENT = 100;
   static var SCALE_SHORTCUT_PERCENT = 100;
   static var SCALE_MAINMENU_PERCENT = 100;
   static var SCALE_PARTYWINDOW_PERCENT = 100;
   static var SCALE_CROSSHAIR_PERCENT = 100;
   static var SCALE_CHARGEGAGE_PERCENT = 100;
   static var SCALE_HOMUNSHORTCUT_PERCENT = 100;
   static var SCALE_ABNORMALITY_PERCENT = 100;
   static var SCALE_QUESTALIM_PERCENT = 100;
   static var SCALE_GUILDWINDOW_PERCENT = 100;
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
      var _loc5_ = lib.info.AlignInfo.horizontalSpace + ui._x;
      var _loc4_ = lib.info.AlignInfo.verticalSpace + ui._y;
      if(optionCustomX != undefined)
      {
         _loc5_ = optionCustomX;
      }
      if(optionCustomY != undefined)
      {
         _loc4_ = optionCustomY;
      }
      var _loc3_ = _root.GetRegisterUIData(ui._name);
      if(_loc3_.PA == 1)
      {
      }
      if(_loc3_.PA == 2)
      {
         _loc5_ = _loc5_ + ui.hit._width / 2 * lib.info.AlignInfo.scaleRatio;
      }
      if(_loc3_.PA == 3)
      {
         _loc5_ = _loc5_ + ui.hit._width * lib.info.AlignInfo.scaleRatio;
      }
      if(_loc3_.PA == 4)
      {
         _loc4_ = _loc4_ + ui.hit._height / 2 * lib.info.AlignInfo.scaleRatio;
      }
      else if(_loc3_.PA == 5)
      {
         _loc5_ = _loc5_ + ui.hit._width / 2 * lib.info.AlignInfo.scaleRatio;
         _loc4_ = _loc4_ + ui.hit._height / 2 * lib.info.AlignInfo.scaleRatio;
      }
      else if(_loc3_.PA == 6)
      {
         _loc5_ = _loc5_ + ui.hit._width * lib.info.AlignInfo.scaleRatio;
         _loc4_ = _loc4_ + ui.hit._height / 2 * lib.info.AlignInfo.scaleRatio;
      }
      else if(_loc3_.PA == 7)
      {
         _loc4_ = _loc4_ + ui.hit._height * lib.info.AlignInfo.scaleRatio;
      }
      else if(_loc3_.PA == 8)
      {
         _loc5_ = _loc5_ + ui.hit._width / 2 * lib.info.AlignInfo.scaleRatio;
         _loc4_ = _loc4_ + ui.hit._height * lib.info.AlignInfo.scaleRatio;
      }
      else if(_loc3_.PA == 9)
      {
         _loc5_ = _loc5_ + ui.hit._width * lib.info.AlignInfo.scaleRatio;
         _loc4_ = _loc4_ + ui.hit._height * lib.info.AlignInfo.scaleRatio;
      }
      _loc5_ = _loc5_ * lib.info.AlignInfo.onePixelPercentW;
      _loc4_ = _loc4_ * lib.info.AlignInfo.onePixelPercentH;
      _root.ToGame_SaveUIPosition(lockState,ui._name,_loc5_,_loc4_);
   }
   static function savePosCustom(ui, lockState, xRatio, yRatio)
   {
      _root.ToGame_SaveUIPosition(lockState,ui._name,xRatio,yRatio);
   }
   static function uiScale(_uiname)
   {
      lib.Debuger.trace("_uiname : " + _uiname);
      var _loc1_ = 1;
      if(_uiname == "CharacterWindow")
      {
         _loc1_ = lib.info.AlignInfo.SCALE_CHARACTERWINDOW_PERCENT / 100;
      }
      else if(_uiname == "Minimap")
      {
         _loc1_ = lib.info.AlignInfo.SCALE_MINIMAP_PERCENT / 100;
      }
      else if(_uiname == "OverlayMap2")
      {
         _loc1_ = lib.info.AlignInfo.SCALE_OVERAYMAP_PERCENT / 100;
      }
      else if(_uiname == "Chat2")
      {
         _loc1_ = lib.info.AlignInfo.SCALE_CHAT_PERCENT / 100;
      }
      else if(_uiname == "ShortCut")
      {
         _loc1_ = lib.info.AlignInfo.SCALE_SHORTCUT_PERCENT / 100;
      }
      else if(_uiname == "MainMenu")
      {
         _loc1_ = lib.info.AlignInfo.SCALE_MAINMENU_PERCENT / 100;
      }
      else if(_uiname == "PartyWindow")
      {
         _loc1_ = lib.info.AlignInfo.SCALE_PARTYWINDOW_PERCENT / 100;
      }
      else if(_uiname == "Crosshair")
      {
         _loc1_ = lib.info.AlignInfo.SCALE_CROSSHAIR_PERCENT / 100;
      }
      else if(_uiname == "GageBar")
      {
         _loc1_ = lib.info.AlignInfo.SCALE_CHARGEGAGE_PERCENT / 100;
      }
      else if(_uiname == "HomunShortCut")
      {
         _loc1_ = lib.info.AlignInfo.SCALE_HOMUNSHORTCUT_PERCENT / 100;
      }
      else if(_uiname == "Abnormality")
      {
         _loc1_ = lib.info.AlignInfo.SCALE_ABNORMALITY_PERCENT / 100;
      }
      else if(_uiname == "QuestTaskInfo")
      {
         _loc1_ = lib.info.AlignInfo.SCALE_QUESTALIM_PERCENT / 100;
      }
      else if(_uiname == "GuildWindow")
      {
         _loc1_ = lib.info.AlignInfo.SCALE_GUILDWINDOW_PERCENT / 100;
      }
      return _loc1_;
   }
   static function uiScaleLimit(num)
   {
      lib.Debuger.trace("uiScaleLimit : " + num);
      var _loc1_ = num;
      if(num > 1.5)
      {
         _loc1_ = 1.5;
      }
      return _loc1_;
   }
}
