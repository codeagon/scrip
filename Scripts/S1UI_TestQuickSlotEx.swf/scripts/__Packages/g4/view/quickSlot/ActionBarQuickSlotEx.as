class g4.view.quickSlot.ActionBarQuickSlotEx extends g4.view.quickSlot.ActionBarQuickSlot
{
   function ActionBarQuickSlotEx()
   {
      super();
      this.bitmapName = "ONTIME2";
      this.boxWidth = 30;
   }
   function configUI()
   {
      super.configUI();
      this.icon.addEventListener(com.bluehole.tera.view.core.Icon.EVENT_ICON_SET_ICON,this,"iconHandlerChange");
   }
   function iconHandlerChange(event)
   {
      if(this.icon.__get__TEX() != "")
      {
         this.__set__visible(true);
      }
   }
   function changeUIMode($show)
   {
      if($show)
      {
         this.__set__visible(true);
      }
      else if(this.icon.__get__TEX() == "" || this.icon.__get__TEX() == null)
      {
         this.__set__visible(false);
      }
      else
      {
         this.__set__visible(true);
      }
   }
}
