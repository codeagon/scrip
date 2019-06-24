class lib.controls.S_UIDrager extends mx.core.UIComponent
{
   static var test = "test";
   static var symbolName = "S_UIDrager";
   static var symbolOwner = lib.controls.S_UIDrager;
   var className = "S_UIDrager";
   var UIName = "";
   var mcWidth = 0;
   var leftLimit = 0;
   var rightLimit = 0;
   var topLimit = 0;
   var bottomLimit = 0;
   var adjustLeft = 0;
   var adjustTop = 0;
   var adjustRight = 0;
   var adjustBottom = 0;
   var __save = 1;
   function S_UIDrager()
   {
      super();
   }
   function init()
   {
      super.init();
      this.useHandCursor = false;
      this.boundingBox_mc._visible = false;
      this.boundingBox_mc._width = 0;
      this.boundingBox_mc._height = 0;
      this._width = this.width;
      this._height = this.height;
      this.dragTarget_mc = this._parent._parent;
      this.UIName = this.dragTarget_mc._name;
      this.leftLimit = - lib.info.AlignInfo.horizontalSpace - this.__get__width() * lib.info.AlignInfo.scaleRatio + lib.info.AlignInfo.DRAG_SAVESPACE;
      this.rightLimit = Stage.width - lib.info.AlignInfo.horizontalSpace - lib.info.AlignInfo.DRAG_SAVESPACE;
      this.topLimit = - lib.info.AlignInfo.verticalSpace;
      this.bottomLimit = lib.info.AlignInfo.UI_HEIGHT + lib.info.AlignInfo.verticalSpace - lib.info.AlignInfo.DRAG_SAVESPACE;
   }
   function setData(UIname, dragTarget, lockMc)
   {
      this.UIName = UIname;
      this.dragTarget_mc = dragTarget;
      this.lock_mc = lockMc;
   }
   function adjustDragLimit(left, top, right, bottom)
   {
      this.adjustLeft = left;
      this.adjustTop = top;
      this.adjustRight = right;
      this.adjustBottom = bottom;
   }
   function __set__save(val)
   {
      this.__save = val;
      return this.__get__save();
   }
   function __get__save()
   {
      return this.__save;
   }
   function onPress2()
   {
   }
   function onRelease2()
   {
   }
   function onPress()
   {
      this.beginDrag();
      this.onPress2();
   }
   function beginDrag()
   {
      this.leftLimit = - lib.info.AlignInfo.horizontalSpace;
      this.rightLimit = Stage.width - lib.info.AlignInfo.horizontalSpace - lib.info.AlignInfo.DRAG_SAVESPACE * lib.info.AlignInfo.scaleRatio + this.adjustRight;
      this.topLimit = - lib.info.AlignInfo.verticalSpace + this.adjustTop;
      this.bottomLimit = lib.info.AlignInfo.UI_HEIGHT + lib.info.AlignInfo.verticalSpace - lib.info.AlignInfo.DRAG_SAVESPACE * lib.info.AlignInfo.scaleRatio + this.adjustBottom;
      this.dragTarget_mc.startDrag(false,this.leftLimit,this.topLimit,this.rightLimit,this.bottomLimit);
      this.onMouseUp = this.mouseUpHandler;
   }
   function mouseUpHandler()
   {
      this.onRelease2();
      if(this.__get__save())
      {
         var _loc5_ = lib.info.AlignInfo.horizontalSpace + this.dragTarget_mc._x;
         var _loc4_ = lib.info.AlignInfo.verticalSpace + this.dragTarget_mc._y;
         var _loc3_ = _root.GetRegisterUIData(this.dragTarget_mc._name);
         if(_loc3_.PA == 1)
         {
         }
         if(_loc3_.PA == 2)
         {
            _loc5_ = _loc5_ + this.dragTarget_mc.hit._width / 2 * lib.info.AlignInfo.scaleRatio;
         }
         if(_loc3_.PA == 3)
         {
            _loc5_ = _loc5_ + this.dragTarget_mc.hit._width * lib.info.AlignInfo.scaleRatio;
         }
         if(_loc3_.PA == 4)
         {
            _loc4_ = _loc4_ + this.dragTarget_mc.hit._height / 2 * lib.info.AlignInfo.scaleRatio;
         }
         else if(_loc3_.PA == 5)
         {
            _loc5_ = _loc5_ + this.dragTarget_mc.hit._width / 2 * lib.info.AlignInfo.scaleRatio;
            _loc4_ = _loc4_ + this.dragTarget_mc.hit._height / 2 * lib.info.AlignInfo.scaleRatio;
         }
         else if(_loc3_.PA == 6)
         {
            _loc5_ = _loc5_ + this.dragTarget_mc.hit._width * lib.info.AlignInfo.scaleRatio;
            _loc4_ = _loc4_ + this.dragTarget_mc.hit._height / 2 * lib.info.AlignInfo.scaleRatio;
         }
         else if(_loc3_.PA == 7)
         {
            _loc4_ = _loc4_ + this.dragTarget_mc.hit._height * lib.info.AlignInfo.scaleRatio;
         }
         else if(_loc3_.PA == 8)
         {
            _loc5_ = _loc5_ + this.dragTarget_mc.hit._width / 2 * lib.info.AlignInfo.scaleRatio;
            _loc4_ = _loc4_ + this.dragTarget_mc.hit._height * lib.info.AlignInfo.scaleRatio;
         }
         else if(_loc3_.PA == 9)
         {
            _loc5_ = _loc5_ + this.dragTarget_mc.hit._width * lib.info.AlignInfo.scaleRatio;
            _loc4_ = _loc4_ + this.dragTarget_mc.hit._height * lib.info.AlignInfo.scaleRatio;
         }
         _loc5_ = _loc5_ * lib.info.AlignInfo.onePixelPercentW;
         _loc4_ = _loc4_ * lib.info.AlignInfo.onePixelPercentH;
         _root.ToGame_SaveUIPosition(this.dragTarget_mc.lock_mc._currentframe - 1,this.dragTarget_mc._name,_loc5_,_loc4_);
      }
      this.dragTarget_mc.stopDrag();
      delete this.onMouseUp;
   }
}
