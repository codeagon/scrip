this._alpha = 0;
this.useHandCursor = false;
var thisUI = this._parent;
var dragBar = this;
hit.onRollOver = function()
{
   thisUI.questAlpha(2);
};
hit.onRollOut = function()
{
   thisUI.questAlpha(1);
};
hit.onPress = function()
{
   var _loc4_ = - lib.info.AlignInfo.getHorizontalSpace() - thisUI.hit._width + lib.info.AlignInfo.DRAG_SAVESPACE;
   var _loc5_ = Stage.width - lib.info.AlignInfo.DRAG_SAVESPACE;
   var _loc2_ = - lib.info.AlignInfo.getVerticalSpace();
   var _loc3_ = lib.info.AlignInfo.UI_HEIGHT + lib.info.AlignInfo.getVerticalSpace() - lib.info.AlignInfo.DRAG_SAVESPACE;
   _root.ToGame_SaveUIPosition(thisUI.lock_mc._currentframe - 1,thisUI._name,lib.info.AlignInfo.xPixelToRatio(thisUI._x),lib.info.AlignInfo.yPixelToRatio(thisUI._y));
   startDrag(thisUI,0,_loc4_,_loc2_,_loc5_,_loc3_);
};
hit.onRelease = hit.onReleaseOutside = function()
{
   _root.ToGame_SaveUIPosition(thisUI.lock_mc._currentframe - 1,thisUI._name,lib.info.AlignInfo.xPixelToRatio(thisUI._x),lib.info.AlignInfo.yPixelToRatio(thisUI._y));
   thisUI.stopDrag();
};
