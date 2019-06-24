class gfx.controls.CheckBox extends gfx.controls.Button
{
   function CheckBox()
   {
      super();
   }
   function toString()
   {
      return "[Scaleform CheckBox " + this._name + "]";
   }
   function configUI()
   {
      if(this.bindingEnabled)
      {
         flash.external.ExternalInterface.call("__registerControl",this._name,this,"CheckBox");
         this.addEventListener("select",this,"dispatchEventToGame");
         this.bindingEnabled = false;
      }
      super.configUI();
      this.toggle = true;
   }
}
