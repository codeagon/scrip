class g4.component.slots.BasicSlot extends g4.core.UIComponent
{
   function BasicSlot()
   {
      super();
      this.__set__mouseEnabled(true);
   }
   function __get__data()
   {
      return this._data;
   }
   function __get__mouseEnabled()
   {
      return this.enabled;
   }
   function __set__mouseEnabled(value)
   {
      this.enabled = value;
      this.useHandCursor = value;
      return this.__get__mouseEnabled();
   }
   function configUI()
   {
   }
   function setData(data)
   {
      this._data = data;
   }
   function updateSlot()
   {
      if(this._data == null)
      {
         this._visible = false;
         return undefined;
      }
   }
   function onRollOver()
   {
      this.dispatchEvent(gfx.events.EventTypes.ROLL_OVER,[this]);
   }
   function onRollOut()
   {
      this.dispatchEvent(gfx.events.EventTypes.ROLL_OUT,[this]);
   }
   function onRelease()
   {
      this.dispatchEvent(gfx.events.EventTypes.CLICK,[this]);
   }
   function onDragOut()
   {
      this.dispatchEvent(gfx.events.EventTypes.DRAG_OUT,[this]);
   }
   function onReleaseOutside()
   {
      this.dispatchEvent(gfx.events.EventTypes.RELEASE_OUTSIDE,[this]);
   }
}
