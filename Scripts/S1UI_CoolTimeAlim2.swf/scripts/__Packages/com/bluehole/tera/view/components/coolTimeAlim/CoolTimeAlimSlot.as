class com.bluehole.tera.view.components.coolTimeAlim.CoolTimeAlimSlot extends com.bluehole.tera.view.core.ActionBarSlot
{
   static var EVENT_COOLTIMEALIMSLOT_ICON_SET_ICON = "coolTimeAlim/setIcon";
   static var EVENT_COOLTIMEALIMSLOT_CLEAN_UP_SLOT = "coolTimeAlim/cleanUpSlot";
   function CoolTimeAlimSlot()
   {
      super();
   }
   function toString()
   {
      return "[com.bluehole.tera.view.components.coolTimeAlim.CoolTimeAlimSlot " + this._name + "]";
   }
   function cleanUpSlot()
   {
      super.cleanUpSlot();
      this.dispatchEvent({type:com.bluehole.tera.view.components.coolTimeAlim.CoolTimeAlimSlot.EVENT_COOLTIMEALIMSLOT_CLEAN_UP_SLOT,index:this.index});
   }
   function configUI()
   {
      super.configUI();
      this.icon.addEventListener(com.bluehole.tera.view.core.Icon.EVENT_ICON_SET_ICON,this,"icon_setIconHandler");
      this.__set__visible(false);
   }
   function icon_setIconHandler(e)
   {
      this.dispatchEvent({type:com.bluehole.tera.view.components.coolTimeAlim.CoolTimeAlimSlot.EVENT_COOLTIMEALIMSLOT_ICON_SET_ICON,index:this.index});
   }
   function propagateEvent(event)
   {
   }
   function allowDrop(data)
   {
      return false;
   }
   function beginDrag()
   {
      delete this.onMouseMove;
   }
}
