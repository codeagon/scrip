class com.bluehole.tera.view.core.TDragTarget extends gfx.controls.DragTarget
{
   var _dragEnabled = true;
   function TDragTarget()
   {
      super();
   }
   function __get__dragEnabled()
   {
      return this._dragEnabled;
   }
   function __set__dragEnabled(value)
   {
      this._dragEnabled = value;
      return this.__get__dragEnabled();
   }
   function configUI()
   {
      if(_global.dragManager)
      {
         this.dragManager = _global.dragManager;
      }
      else
      {
         this.dragManager = gfx.managers.DragManager.instance;
      }
      this.dragManager.addEventListener("dragBegin",this,"dragBegin");
      this.dragManager.addEventListener("dragEnd",this,"dragEnd");
      this.onRollOver = this.onDragOver = this.handleRollOver;
      this.onRollOut = this.onDragOut = this.handleRollOut;
   }
   function handleRollOver(mouseIndex)
   {
      this.gotoAndPlay("over");
      if(this.trackAsMenu)
      {
         this.gotoAndPlay("dragOver");
      }
      this.dragManager.dropTarget = this;
   }
   function handleRollOut(mouseIndex)
   {
      this.gotoAndPlay("up");
      this.gotoAndPlay("out");
      if(this.trackAsMenu)
      {
         this.gotoAndStop("dragUp");
         this.gotoAndPlay("dragOut");
         this.dragManager.dropTarget = null;
      }
   }
   function dragBegin(event)
   {
      if(!this.isAllow(event.data))
      {
         return undefined;
      }
      this.trackAsMenu = this._visible = true;
      this.gotoAndStop("up");
      this.gotoAndStop("dragUp");
   }
   function isAllow(data)
   {
      if(!this._dragEnabled)
      {
         return false;
      }
      if(data.bounds != undefined && this.dragAcceptTypeHash[data.type] && !this.boundsCheck(data))
      {
         return false;
      }
      return data == null || this.dragAcceptTypeHash == null || this.dragAcceptTypeHash[data.type] || this.dragAcceptTypeHash["*"];
   }
}
