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
   var adjustRight = 0;
   var adjustTop = 0;
   var adjustBottom = 0;
   var __save = 1;
   var _moved = false;
   var posx = 0;
   var posy = 0;
   var pos_state = "true";
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
      this.leftLimit = - lib.info.AlignInfo.getHorizontalSpace() - this.__get__width() + lib.info.AlignInfo.DRAG_SAVESPACE;
      this.topLimit = - lib.info.AlignInfo.getVerticalSpace();
      this.rightLimit = Stage.width - lib.info.AlignInfo.DRAG_SAVESPACE;
      this.bottomLimit = lib.info.AlignInfo.UI_HEIGHT + lib.info.AlignInfo.getVerticalSpace() - lib.info.AlignInfo.DRAG_SAVESPACE;
   }
   function setData(UIname, dragTarget, lockMc)
   {
      this.UIName = UIname;
      this.dragTarget_mc = dragTarget;
      this.lock_mc = lockMc;
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
      this.posx = _root._xmouse;
      this.posy = _root._ymouse;
   }
   function beginDrag()
   {
      lib.Debuger.trace("beginDrag");
      var _loc3_ = lib.info.AlignInfo.uiScale(this.UIName,this.dragTarget_mc);
      this.leftLimit = - lib.info.AlignInfo.horizontalSpace + this.adjustLeft * (lib.info.AlignInfo.scaleRatio * _loc3_);
      this.topLimit = - lib.info.AlignInfo.verticalSpace + this.adjustTop * (lib.info.AlignInfo.scaleRatio * _loc3_);
      this.rightLimit = Stage.width - lib.info.AlignInfo.horizontalSpace - this._width * (lib.info.AlignInfo.scaleRatio * _loc3_) + this.adjustRight * (lib.info.AlignInfo.scaleRatio * _loc3_);
      this.bottomLimit = lib.info.AlignInfo.UI_HEIGHT + lib.info.AlignInfo.verticalSpace - this._height * (lib.info.AlignInfo.scaleRatio * _loc3_) + this.adjustBottom * (lib.info.AlignInfo.scaleRatio * _loc3_);
      this.dragTarget_mc.startDrag(false,this.leftLimit,this.topLimit,this.rightLimit,this.bottomLimit);
      this.onMouseUp = this.mouseUpHandler;
      _root.gbDraggingTile = true;
      this.tweendrag();
   }
   function mouseUpHandler()
   {
      this.__set__moved(true);
      if(this.__get__save())
      {
         var _loc3_ = this.lock_mc == undefined?1:this.lock_mc._currentframe - 1;
         lib.info.AlignInfo.savePos(this.dragTarget_mc,_loc3_);
      }
      this.dragTarget_mc.stopDrag();
      if(Math.abs(this.posx - _root._xmouse) < 1 && Math.abs(this.posy - _root._ymouse) < 1)
      {
         lib.Debuger.trace("no drag!!");
         this.pos_state = "false";
      }
      else
      {
         this.pos_state = "true";
      }
      lib.Debuger.trace("pos_state : " + this.pos_state);
      this.onRelease2();
      this.tweendrop();
      _root.gbDraggingTile = false;
      delete this.onMouseUp;
   }
   function __get__moved()
   {
      return this._moved;
   }
   function __set__moved(val)
   {
      this._moved = val;
      this.lock_mc.setEnabled(val);
      return this.__get__moved();
   }
   function getDragTarget()
   {
      return this.dragTarget_mc;
   }
   function tweendrag()
   {
      this.onEnterFrame = function()
      {
         if(this.dragTarget_mc._visible == false)
         {
            this.onEnterFrame = null;
            this.dragTarget_mc._alpha = 100;
         }
      };
      var _loc2_ = lib.info.AlignInfo.scaleRatio * 100;
      this.tempTween1 = new mx.transitions.Tween(this.dragTarget_mc,"_alpha",mx.transitions.easing.Regular.easeOut,100,70,2,false);
   }
   function tweendrop()
   {
      var _loc2_ = lib.info.AlignInfo.scaleRatio * 100;
      if(this.dragTarget_mc._alpha < 100)
      {
         this.tempTween2 = new mx.transitions.Tween(this.dragTarget_mc,"_alpha",mx.transitions.easing.Regular.easeOut,70,100,2,false);
      }
      this.onEnterFrame = null;
   }
}
