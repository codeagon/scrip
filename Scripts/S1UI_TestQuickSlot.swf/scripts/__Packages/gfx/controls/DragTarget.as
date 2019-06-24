class gfx.controls.DragTarget extends gfx.core.UIComponent
{
   function DragTarget()
   {
      super();
      this._visible = false;
      if(this._dragAcceptTypes != null)
      {
         this.__set__dragAcceptTypes(this._dragAcceptTypes);
         delete this._dragAcceptTypes;
      }
   }
   function __get__dragAcceptTypes()
   {
      var _loc2_ = [];
      for(var _loc3_ in this.dragAcceptTypeHash)
      {
         _loc2_.push(_loc3_);
      }
      return _loc2_;
   }
   function __set__dragAcceptTypes(types)
   {
      if(types == null || types.length < 1)
      {
         this.dragAcceptTypeHash = null;
         return undefined;
      }
      this.dragAcceptTypeHash = {};
      var _loc2_ = 0;
      while(_loc2_ < types.length)
      {
         lib.Debuger.trace(String(types[_loc2_]));
         this.dragAcceptTypeHash[String(types[_loc2_])] = true;
         _loc2_ = _loc2_ + 1;
      }
      return this.__get__dragAcceptTypes();
   }
   function allowDrop(data)
   {
      if(data.bounds != undefined && this.dragAcceptTypeHash[data.type] && !this.boundsCheck(data))
      {
         return false;
      }
      return data == null || this.dragAcceptTypeHash == null || this.dragAcceptTypeHash[data.type] || this.dragAcceptTypeHash["*"];
   }
   function acceptDrop(data)
   {
      this.dispatchEvent({type:"drop",data:data});
   }
   function configUI()
   {
      super.configUI();
      this.onRollOver = this.onDragOver = this.handleRollOver;
      this.onRollOut = this.onDragOut = this.handleRollOut;
   }
   function dragBegin(event)
   {
      if(!this.allowDrop(event.data))
      {
         return undefined;
      }
      this.trackAsMenu = this._visible = true;
      this.gotoAndStop("up");
      this.gotoAndStop("dragUp");
   }
   function dragEnd(event)
   {
      this.trackAsMenu = this._visible = false;
      this.gotoAndStop("dragUp");
      this.gotoAndStop("up");
      if(event.dropTarget == this && !event.cancelled)
      {
         this.acceptDrop(event.data);
      }
   }
   function boundsCheck(data)
   {
      var _loc2_ = {x:0,y:0};
      this.localToGlobal(_loc2_);
      var _loc3_ = data.bounds;
      if(_loc3_.left > _loc2_.x + this._width || _loc3_.top > _loc2_.y + this._height || _loc3_.right < _loc2_.x || _loc3_.bottom < _loc2_.y)
      {
         return false;
      }
      return true;
   }
   function handleRollOver(mouseIndex)
   {
      this.gotoAndPlay("over");
      if(this.trackAsMenu)
      {
         this.gotoAndPlay("dragOver");
      }
      gfx.managers.DragManager.__get__instance().dropTarget = this;
   }
   function handleRollOut(mouseIndex)
   {
      this.gotoAndPlay("up");
      this.gotoAndPlay("out");
      if(this.trackAsMenu)
      {
         this.gotoAndStop("dragUp");
         this.gotoAndPlay("dragOut");
         gfx.managers.DragManager.__get__instance().dropTarget = null;
      }
   }
}
