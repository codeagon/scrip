class com.bluehole.tera.view.components.coolTimeAlim.CoolTimeList extends com.bluehole.tera.view.core.TeraTileList
{
   static var EVENT_COOLTIMEALIMLIST_SLOT_SIZE_CHANGED = "coolTimeList/slotSizeChanged";
   var showingSlots = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
   function CoolTimeList()
   {
      super();
      this.hitTestDisable = true;
   }
   function toString()
   {
      return "[com.bluehole.tera.view.components.coolTimeAlim.CoolTimeList " + this._name + "]";
   }
   function setUpRenderer(clip)
   {
      super.setUpRenderer(clip);
      clip.addEventListener(com.bluehole.tera.view.components.coolTimeAlim.CoolTimeAlimSlot.EVENT_COOLTIMEALIMSLOT_ICON_SET_ICON,this,"slot_setSlotListener");
      clip.addEventListener(com.bluehole.tera.view.components.coolTimeAlim.CoolTimeAlimSlot.EVENT_COOLTIMEALIMSLOT_CLEAN_UP_SLOT,this,"slot_cleanUpListener");
   }
   function getItemAt(index)
   {
      var _loc2_ = (MovieClip)this.renderers[index];
      return _loc2_;
   }
   function slot_setSlotListener(e)
   {
      this.showingSlots[e.index] = true;
      this.dispatchEvent({type:com.bluehole.tera.view.components.coolTimeAlim.CoolTimeList.EVENT_COOLTIMEALIMLIST_SLOT_SIZE_CHANGED});
   }
   function slot_cleanUpListener(e)
   {
      this.showingSlots[e.index] = false;
      this.dispatchEvent({type:com.bluehole.tera.view.components.coolTimeAlim.CoolTimeList.EVENT_COOLTIMEALIMLIST_SLOT_SIZE_CHANGED});
   }
}
