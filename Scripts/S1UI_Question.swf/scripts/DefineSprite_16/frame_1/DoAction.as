var thisUI = this._parent;
var dragBar = this;
hit.onPress = function()
{
   thisUI.swapDepths(thisUI._parent.getNextHighestDepth());
   thisUI._parent.gDepth = thisUI._parent.gDepth + 1;
   var _loc3_ = - lib.info.AlignInfo.getHorizontalSpace() - thisUI._width + lib.info.AlignInfo.DRAG_SAVESPACE;
   var _loc4_ = Stage.width - lib.info.AlignInfo.DRAG_SAVESPACE;
   var _loc1_ = - lib.info.AlignInfo.getVerticalSpace();
   var _loc2_ = lib.info.AlignInfo.UI_HEIGHT + lib.info.AlignInfo.getVerticalSpace() - lib.info.AlignInfo.DRAG_SAVESPACE;
   startDrag(thisUI,0,_loc3_,_loc1_,_loc4_,_loc2_);
};
hit.onRelease = hit.onReleaseOutside = function()
{
   thisUI.stopDrag();
};
