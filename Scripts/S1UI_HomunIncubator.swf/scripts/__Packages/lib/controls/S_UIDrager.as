class lib.controls.S_UIDrager extends MovieClip
{
   static var test = "test";
   var UIName = "";
   var DragBool = true;
   var posSave = 1;
   var dragMove = false;
   var posx = 0;
   var posy = 0;
   var posState = "true";
   var leftLimit = 0;
   var rightLimit = 0;
   var topLimit = 0;
   var bottomLimit = 0;
   var adjustLeft = 0;
   var adjustRight = 0;
   var adjustTop = 0;
   var adjustBottom = 0;
   function S_UIDrager()
   {
      super();
      this.dragTargetMc = this._parent._parent;
      this.UIName = this.dragTargetMc._name;
      this.useHandCursor = false;
      this.leftLimit = - lib.info.AlignInfo.getHorizontalSpace() - this._width + lib.info.AlignInfo.DRAG_SAVESPACE;
      this.topLimit = - lib.info.AlignInfo.getVerticalSpace();
      this.rightLimit = Stage.width - lib.info.AlignInfo.DRAG_SAVESPACE;
      this.bottomLimit = lib.info.AlignInfo.UI_HEIGHT + lib.info.AlignInfo.getVerticalSpace() - lib.info.AlignInfo.DRAG_SAVESPACE;
   }
   function setData(UIname, dragTarget, _lockMc, _DragBool)
   {
      this.UIName = UIname;
      this.dragTargetMc = dragTarget;
      this.lockMc = _lockMc;
      this.DragBool = _DragBool;
   }
   function adjustDragLimit(left, right, top, bottom)
   {
      this.adjustLeft = left;
      this.adjustRight = right;
      this.adjustTop = top;
      this.adjustBottom = bottom;
   }
   function __set__save(val)
   {
      this.posSave = val;
      return this.__get__save();
   }
   function __get__save()
   {
      return this.posSave;
   }
   function __get__moved()
   {
      return this.dragMove;
   }
   function __set__moved(val)
   {
      this.dragMove = val;
      this.lockMc.setEnabled(val);
      return this.__get__moved();
   }
   function getDragTarget()
   {
      return this.dragTargetMc;
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
      this.posx = _root._xmouse;
      this.posy = _root._ymouse;
   }
   function beginDrag()
   {
      var _loc3_ = lib.info.AlignInfo.uiScale(this.UIName,this.dragTargetMc);
      this.leftLimit = - lib.info.AlignInfo.horizontalSpace + this.adjustLeft * (lib.info.AlignInfo.scaleRatio * _loc3_);
      this.topLimit = - lib.info.AlignInfo.verticalSpace + this.adjustTop * (lib.info.AlignInfo.scaleRatio * _loc3_);
      this.rightLimit = Stage.width - lib.info.AlignInfo.horizontalSpace - this._width * (lib.info.AlignInfo.scaleRatio * _loc3_) + this.adjustRight * (lib.info.AlignInfo.scaleRatio * _loc3_);
      this.bottomLimit = lib.info.AlignInfo.UI_HEIGHT + lib.info.AlignInfo.verticalSpace - this._height * (lib.info.AlignInfo.scaleRatio * _loc3_) + this.adjustBottom * (lib.info.AlignInfo.scaleRatio * _loc3_);
      this.dragTargetMc.startDrag(false,this.leftLimit,this.topLimit,this.rightLimit,this.bottomLimit);
      this.onMouseUp = this.mouseUpHandler;
      _root.gbDraggingTile = true;
      this.tweendrag();
   }
   function mouseUpHandler()
   {
      this.dragMove = true;
      if(this.__get__save())
      {
         var _loc3_ = this.lockMc == undefined?1:this.lockMc._currentframe - 1;
         lib.info.AlignInfo.savePos(this.dragTargetMc,_loc3_);
      }
      this.dragTargetMc.stopDrag();
      if(Math.abs(this.posx - _root._xmouse) < 1 && Math.abs(this.posy - _root._ymouse) < 1)
      {
         this.posState = "false";
      }
      else
      {
         this.posState = "true";
      }
      this.onRelease2();
      this.tweendrop();
      _root.gbDraggingTile = false;
      delete this.onMouseUp;
   }
   function tweendrag()
   {
      this.onEnterFrame = function()
      {
         if(this.dragTargetMc._visible == false)
         {
            this.onEnterFrame = null;
            this.dragTargetMc._alpha = 100;
         }
      };
      var _loc2_ = lib.info.AlignInfo.scaleRatio * 100;
      if(this.DragBool != false)
      {
         this.dragTargetMc._alpha = 70;
      }
   }
   function tweendrop()
   {
      var _loc2_ = lib.info.AlignInfo.scaleRatio * 100;
      if(this.DragBool != false)
      {
         if(this.dragTargetMc._alpha < 100)
         {
            this.dragTargetMc._alpha = 100;
         }
      }
      this.onEnterFrame = null;
   }
}
