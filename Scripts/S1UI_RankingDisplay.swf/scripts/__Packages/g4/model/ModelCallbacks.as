class g4.model.ModelCallbacks
{
   function ModelCallbacks()
   {
      super();
   }
   function registerGameInterface(methodName, callback)
   {
      g4.model.GameInterface.registerGameInterface(methodName,gfx.utils.Delegate.create(this,callback));
   }
   function sendEvent(type, data)
   {
      g4.model.GameModelEventDispatcher.sendEvent(type,data);
   }
}
