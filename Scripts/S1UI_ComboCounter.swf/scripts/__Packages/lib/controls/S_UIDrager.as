class lib.controls.S_UIDrager extends mx.core.UIComponent
{
   static var test = "test";
   static var symbolName = "S_UIDrager";
   static var symbolOwner = lib.controls.S_UIDrager;
   var pos_state = "true";
   var className = "S_UIDrager";
   var UIName = "";
   var DragBool = true;
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
   function setData(UIname, dragTarget, lockMc, _DragBool)
   {
      this.UIName = UIname;
      this.dragTarget_mc = dragTarget;
      this.lock_mc = lockMc;
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
      var _loc7_ = this.dragTarget_mc._parent;
      var _loc3_ = {x:Stage.visibleRect.left,y:Stage.visibleRect.top};
      _loc7_.globalToLocal(_loc3_);
      var _loc6_ = {x:Stage.visibleRect.right,y:Stage.visibleRect.bottom};
      _loc7_.globalToLocal(_loc6_);
      var _loc5_ = this.dragTarget_mc._xscale * 0.01;
      var _loc4_ = this.dragTarget_mc._yscale * 0.01;
      this.leftLimit = Math.ceil(_loc3_.x + this.adjustLeft * _loc5_);
      this.topLimit = Math.ceil(_loc3_.y + this.adjustTop * _loc4_);
      this.rightLimit = Math.floor(_loc6_.x - this._width * _loc5_ + this.adjustRight * _loc5_);
      this.bottomLimit = Math.floor(_loc6_.y - this._height * _loc4_ + this.adjustBottom * _loc4_);
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
         this.pos_state = "false";
      }
      else
      {
         this.pos_state = "true";
      }
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
      this.originalAlpha = this.dragTarget_mc._alpha;
      this.dragTarget_mc._alpha = this.originalAlpha * 0.7;
      this.onEnterFrame = function()
      {
         if(this.dragTarget_mc._visible == false)
         {
            this.tweendrop();
         }
      };
   }
   function tweendrop()
   {
      this.onEnterFrame = null;
      this.dragTarget_mc._alpha = this.originalAlpha;
   }
}
