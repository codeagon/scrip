class gfx.managers.DragManager extends gfx.events.EventDispatcher
{
   var removeTarget = false;
   var dragOffsetX = 0;
   var dragOffsetY = 0;
   var cancelKeyCode = 27;
   var dropTarget = null;
   var _inDrag = false;
   function DragManager()
   {
      super();
      gfx.managers.InputDelegate.__get__instance().addEventListener("input",this,"handleInput");
      this.eventProvider = _root;
   }
   static function __get__instance()
   {
      if(gfx.managers.DragManager._instance == null)
      {
         gfx.managers.DragManager._instance = new gfx.managers.DragManager();
      }
      return gfx.managers.DragManager._instance;
   }
   function __get__inDrag()
   {
      return this._inDrag;
   }
   function __get__data()
   {
      return this._data;
   }
   function __get__target()
   {
      return this._target;
   }
   function startGhostDrag(data, relatedObject)
   {
      this.pressOrigin = relatedObject;
      this.pressOriginTrackAsMenu = relatedObject.trackAsMenu;
      relatedObject.trackAsMenu = true;
      this.removeTarget = false;
      this._target = null;
      data.type = relatedObject.dragType == undefined?"notAllowed":relatedObject.dragType;
      this.initiateDrag(data,relatedObject);
      this.eventProvider.onMouseMove = gfx.utils.Delegate.create(this,this.doDrag);
      this.eventProvider.onMouseUp = gfx.utils.Delegate.create(this,this.stopDrag);
   }
   function doGhostDrag()
   {
      if(this._target != null)
      {
         var _loc2_ = this._target._parent._xmouse + this.dragOffsetX;
         var _loc3_ = this._target._parent._ymouse + this.dragOffsetY;
         if(this.leftBound != undefined)
         {
            if(_loc2_ < this.leftBound)
            {
               _loc2_ = this.leftBound;
            }
            else if(_loc2_ > this.rightBound - this._target._width)
            {
               _loc2_ = this.rightBound - this._target._width;
            }
            if(_loc3_ < this.topBound)
            {
               _loc3_ = this.topBound;
            }
            else if(_loc3_ > this.bottomBound - this._target._height)
            {
               _loc3_ = this.bottomBound - this._target._height;
            }
         }
         this._target._x = _loc2_;
         this._target._y = _loc3_;
      }
   }
   function startDrag(pressOrigin, avatar, data, relatedObject, alignmentTarget, lockCenter, bounds)
   {
      if(pressOrigin == null)
      {
         return undefined;
      }
      this.removeTarget = false;
      var _loc2_ = undefined;
      if(avatar instanceof MovieClip)
      {
         _loc2_ = (MovieClip)avatar;
      }
      else if(avatar == null)
      {
         _loc2_ = null;
      }
      else
      {
         _loc2_ = gfx.managers.PopUpManager.createPopUp(pressOrigin,String(avatar),{_x:pressOrigin._xmouse,_y:pressOrigin._ymouse},pressOrigin);
         if(_loc2_ != null)
         {
            this.removeTarget = true;
         }
      }
      this._target = _loc2_;
      if(alignmentTarget != null && alignmentTarget != _loc2_ && _loc2_ != null)
      {
         var _loc7_ = {x:0,y:0};
         alignmentTarget.localToGlobal(_loc7_);
         _loc2_._parent.globalToLocal(_loc7_);
         _loc2_._x = _loc7_.x;
         _loc2_._y = _loc7_.y;
      }
      if(bounds != undefined)
      {
         this.leftBound = bounds.left == undefined?-1.7976931348623157e308:bounds.left;
         this.topBound = bounds.top == undefined?-1.7976931348623157e308:bounds.top;
         this.rightBound = bounds.right == undefined?1.7976931348623157e308:bounds.right;
         this.bottomBound = bounds.bottom == undefined?1.7976931348623157e308:bounds.bottom;
         var _loc5_ = {x:0,y:0};
         this._target._parent.localToGlobal(_loc5_);
         var _loc6_ = {};
         _loc6_.left = this.leftBound + _loc5_.x;
         _loc6_.right = this.rightBound + _loc5_.x;
         _loc6_.bottom = this.bottomBound + _loc5_.y;
         _loc6_.top = this.topBound + _loc5_.y;
         data.bounds = _loc6_;
      }
      this.initiateDrag(data,relatedObject);
      if(pressOrigin != null)
      {
         this.pressOrigin = pressOrigin;
         this.pressOriginTrackAsMenu = pressOrigin.trackAsMenu;
         pressOrigin.trackAsMenu = true;
      }
      if(_loc2_ != null)
      {
         this.dragOffsetX = !lockCenter?- _loc2_._xmouse:0;
         this.dragOffsetY = !lockCenter?- _loc2_._ymouse:0;
      }
      var _loc14_ = this;
      this.eventProvider.onMouseMove = gfx.utils.Delegate.create(this,this.doDrag);
      this.eventProvider.onMouseUp = gfx.utils.Delegate.create(this,this.stopDrag);
      return this._target;
   }
   function stopDrag()
   {
      this.finishDrag(false);
   }
   function initiateDrag(data, relatedObject)
   {
      this._inDrag = true;
      this._data = data;
      this.relatedObject = relatedObject;
      this.dropTarget = null;
      this.dispatchEvent({type:"dragBegin",data:data});
   }
   function cancelDrag()
   {
      this.finishDrag(true);
   }
   function update()
   {
      if(this.__get__inDrag())
      {
         this.doDrag();
      }
   }
   function doDrag()
   {
      if(this._target != null)
      {
         var _loc2_ = this._target._parent._xmouse + this.dragOffsetX;
         var _loc3_ = this._target._parent._ymouse + this.dragOffsetY;
         if(this.leftBound != undefined)
         {
            if(_loc2_ < this.leftBound)
            {
               _loc2_ = this.leftBound;
            }
            else if(_loc2_ > this.rightBound - this._target._width)
            {
               _loc2_ = this.rightBound - this._target._width;
            }
            if(_loc3_ < this.topBound)
            {
               _loc3_ = this.topBound;
            }
            else if(_loc3_ > this.bottomBound - this._target._height)
            {
               _loc3_ = this.bottomBound - this._target._height;
            }
         }
         this._target._x = _loc2_;
         this._target._y = _loc3_;
      }
   }
   function finishDrag(cancelled)
   {
      if(!this._inDrag)
      {
         return undefined;
      }
      if(this.pressOrigin != null)
      {
         this.pressOrigin.trackAsMenu = this.pressOriginTrackAsMenu;
      }
      this.dispatchEvent({type:"dragEnd",cancelled:cancelled,data:this._data,dropTarget:this.dropTarget});
      this.cleanUp();
   }
   function cleanUp()
   {
      this.dropTarget = null;
      if(this.removeTarget && this._target != null)
      {
         this._target.removeMovieClip();
      }
      this._target = null;
      this._data = null;
      delete this.eventProvider.onMouseMove;
      delete this.eventProvider.onMouseUp;
      this.dragOffsetX = this.dragOffsetY = 0;
      this._inDrag = false;
   }
   function handleInput(event)
   {
      if(event.details.code == this.cancelKeyCode)
      {
         this.cancelDrag();
      }
   }
}
