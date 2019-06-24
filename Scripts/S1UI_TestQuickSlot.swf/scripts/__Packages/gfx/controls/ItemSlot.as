class gfx.controls.ItemSlot extends gfx.core.UIComponent
{
   var iconLinkage = "icons";
   var dragOrigin = false;
   var _toggle = false;
   var _selected = false;
   function ItemSlot()
   {
      super();
   }
   function __get__data()
   {
      return this._data;
   }
   function __set__data(value)
   {
      this._data = value;
      this.update();
      return this.__get__data();
   }
   function __get__dragAcceptTypes()
   {
      return this._dragAcceptTypes;
   }
   function __set__dragAcceptTypes(value)
   {
      this._dragAcceptTypes = value;
      if(this.initialized)
      {
         this.dragTarget.__set__dragAcceptTypes(value);
      }
      return this.__get__dragAcceptTypes();
   }
   function __get__toggle()
   {
      return this._toggle;
   }
   function __set__toggle(value)
   {
      this._toggle = value;
      if(this.initialized)
      {
         this.button.toggle = value;
      }
      return this.__get__toggle();
   }
   function __get__selected()
   {
      return this._selected;
   }
   function __set__selected(value)
   {
      this._selected = value;
      if(this.initialized)
      {
         this.button.__set__selected(value);
      }
      return this.__get__selected();
   }
   function __get__disabled()
   {
      return super.__get__disabled();
   }
   function __set__disabled(value)
   {
      super.__set__disabled(value);
      if(this.initialized)
      {
         this.button.__set__disabled(this._disabled);
      }
      return this.__get__disabled();
   }
   function configUI()
   {
      super.configUI();
      gfx.managers.DragManager.__get__instance().addEventListener("dragEnd",this,"dragEnd");
      this.button.addEventListener("press",this,"handlePress");
      this.button.addEventListener("click",this,"handleRelease");
      this.button.addEventListener("rollOver",this,"propagateEvent");
      this.button.addEventListener("rollOut",this,"propagateEvent");
      this.button.addEventListener("dragOver",this,"propagateEvent");
      this.button.addEventListener("dragOut",this,"propagateEvent");
      this.button.addEventListener("select",this,"propagateEvent");
      this.dragTarget.addEventListener("drop",this,"propagateEvent");
      this.dragTarget.acceptDrop = gfx.utils.Delegate.create(this,this.acceptDrop);
      this.originalAllowDropFunction = this.dragTarget.allowDrop;
      this.dragTarget.allowDrop = gfx.utils.Delegate.create(this,this.allowDrop);
      this.button.toggle = this._toggle;
      this.button.__set__selected(this._selected);
      this.button.__set__disabled(this._disabled);
      this.dragTarget.__set__dragAcceptTypes(this._dragAcceptTypes);
   }
   function propagateEvent(event)
   {
      if(!this._data && event.target == this.button)
      {
         return undefined;
      }
      event.target = this;
      this.dispatchEvent(event);
   }
   function handlePress(event)
   {
      if(this.__get__data() == null)
      {
         return undefined;
      }
      this.onMouseMove = this.beginDrag;
      this.propagateEvent(event);
   }
   function handleRelease(event)
   {
      delete this.onMouseMove;
      this.propagateEvent(event);
   }
   function beginDrag()
   {
      delete this.onMouseMove;
      this.dragOrigin = true;
      this.icons._alpha = 20;
      gfx.managers.DragManager.__get__instance().startDrag(this.button,this.iconLinkage,this.__get__data(),this,this.icons).gotoAndStop(this.__get__data().asset);
      this._data = null;
   }
   function update()
   {
      this.icons.gotoAndStop(this._data != null?this._data.asset:1);
      this.qtyFld.text = this._data.quantity != null?this._data.quantity:"";
   }
   function acceptDrop(data)
   {
      if(this._data != null)
      {
         gfx.managers.DragManager.__get__instance().relatedObject.data = this._data;
      }
      this.__set__data(data);
      this.dispatchEvent({type:"drop",data:data});
   }
   function allowDrop(data)
   {
      return this.originalAllowDropFunction.call(this.dragTarget,data) && (this._data == data || !gfx.managers.DragManager.__get__instance().__get__inDrag() || gfx.managers.DragManager.__get__instance().relatedObject.allowDrop(this._data));
   }
   function dragEnd(event)
   {
      if(this.dragOrigin)
      {
         if(event.dropTarget != null && !event.cancelled)
         {
            this.__set__data(this._data);
         }
         else
         {
            this.__set__data(event.data);
         }
         this.icons._alpha = 100;
         this.dragOrigin = false;
      }
   }
}
