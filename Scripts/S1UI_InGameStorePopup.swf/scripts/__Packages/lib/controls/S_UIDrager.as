class lib.controls.S_UIDrager extends gfx.core.UIComponent
{
   static var test = "test";
   static var symbolName = "S_UIDrager";
   static var symbolOwner = lib.controls.S_UIDrager;
   var pos_state = "true";
   var adjustLeft = 0;
   var adjustRight = 0;
   var adjustTop = 0;
   var adjustBottom = 0;
   var className = "S_UIDrager";
   var UIName = "";
   var DragBool = true;
   var leftLimit = 0;
   var rightLimit = 0;
   var topLimit = 0;
   var bottomLimit = 0;
   var posx = 0;
   var posy = 0;
   var originalAlpha = 100;
   var isDragging = false;
   var __save = 1;
   var _moved = false;
   function S_UIDrager()
   {
      super();
   }
   function __set__save(value)
   {
      this.__save = value;
      return this.__get__save();
   }
   function __get__save()
   {
      return this.__save;
   }
   function __get__moved()
   {
      return this._moved;
   }
   function __set__moved(value)
   {
      this._moved = value;
      if(this.lock_mc)
      {
         this.lock_mc.setEnabled(value);
      }
      return this.__get__moved();
   }
   function configUI()
   {
      super.configUI();
      this.useHandCursor = false;
      this.boundingBox_mc._visible = false;
      this.boundingBox_mc._width = 0;
      this.boundingBox_mc._height = 0;
      this.onPress = this.handleMousePress;
      this.onRelease = this.handleMouseRelease;
      this.onReleaseOutside = this.handleReleaseOutside;
      this.addEventListener(gfx.events.EventTypes.PRESS,this,"pressHandler");
      this.addEventListener(gfx.events.EventTypes.HIDE,this,"hideHandler");
   }
   function toString()
   {
      return targetPath(this);
   }
   function setData(UIname, dragTarget, lockMc, _DragBool)
   {
      this.UIName = UIname;
      this.dragTargetUI = dragTarget;
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
   function getDragTarget()
   {
      return this.dragTargetUI;
   }
   function onPress2()
   {
   }
   function onRelease2()
   {
   }
   function handleMousePress(mouseIndex, button)
   {
      this.dispatchEvent({type:gfx.events.EventTypes.PRESS,mouseIndex:mouseIndex,button:button});
   }
   function handleMouseRelease(mouseIndex, button)
   {
      this.dispatchEvent({type:gfx.events.EventTypes.CLICK,mouseIndex:mouseIndex,button:button});
   }
   function handleReleaseOutside(mouseIndex, button)
   {
      this.dispatchEvent({type:gfx.events.EventTypes.RELEASE_OUTSIDE,button:button});
   }
   function beginDrag()
   {
      var _loc3_ = com.bluehole.tera.managers.LayoutManager.getDragEdgesByUIDragger(this.dragTargetUI,this);
      this.dragTargetUI.startDrag(false,_loc3_.xMin,_loc3_.yMin,_loc3_.xMax,_loc3_.yMax);
      _root.gbDraggingTile = true;
      this.onPress2();
      this.tweendrag();
   }
   function endDrag()
   {
      this.removeEventListener(gfx.events.EventTypes.CLICK,this,"clickHandler");
      this.removeEventListener(gfx.events.EventTypes.RELEASE_OUTSIDE,this,"releaseOutsideHandler");
      this.dragTargetUI.stopDrag();
      this.__set__moved(true);
      if(this.__get__save())
      {
         var _loc3_ = this.lock_mc == undefined?1:this.lock_mc._currentframe - 1;
         if(this.UIName == undefined)
         {
            this.UIName = this._parent._parent._name;
         }
         var _loc4_ = _root.GetRegisterUIData(this.UIName);
         com.bluehole.tera.managers.LayoutManager.saveUIPositon(this.dragTargetUI,_loc4_.PA,_loc3_);
      }
      if(Math.abs(this.posx - _root._xmouse) < 1 && Math.abs(this.posy - _root._ymouse) < 1)
      {
         this.pos_state = "false";
      }
      else
      {
         this.pos_state = "true";
      }
      _root.gbDraggingTile = false;
      this.onRelease2();
      this.tweendrop();
   }
   function tweendrag()
   {
      this.originalAlpha = this.dragTargetUI._alpha;
      this.dragTargetUI._alpha = this.originalAlpha * 0.7;
   }
   function tweendrop()
   {
      this.isDragging = false;
      this.dragTargetUI._alpha = this.originalAlpha;
   }
   function pressHandler(event)
   {
      this.addEventListener(gfx.events.EventTypes.CLICK,this,"clickHandler");
      this.addEventListener(gfx.events.EventTypes.RELEASE_OUTSIDE,this,"releaseOutsideHandler");
      this.beginDrag();
      this.posx = _root._xmouse;
      this.posy = _root._ymouse;
   }
   function clickHandler(event)
   {
      this.endDrag();
   }
   function releaseOutsideHandler(event)
   {
      this.endDrag();
   }
   function hideHandler(event)
   {
      this.endDrag();
   }
}
