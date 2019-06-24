class g4.model.Model
{
   function Model()
   {
      super();
   }
   function sendEvent(type, data)
   {
      g4.model.GameModelEventDispatcher.sendEvent(type,data);
   }
}
