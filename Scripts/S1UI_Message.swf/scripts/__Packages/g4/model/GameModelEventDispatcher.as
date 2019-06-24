class g4.model.GameModelEventDispatcher
{
   function GameModelEventDispatcher()
   {
   }
   static function impl()
   {
      if(g4.model.GameModelEventDispatcher._impl == null)
      {
         g4.model.GameModelEventDispatcher._impl = new g4.model.GameModelEventDispatcherImpl();
      }
      return g4.model.GameModelEventDispatcher._impl;
   }
   static function addEventListener(viewID, type, scope, callback)
   {
      g4.model.GameModelEventDispatcher.impl().addEventListener(viewID,type,scope,callback);
   }
   static function removeAllEventListeners(viewID)
   {
      g4.model.GameModelEventDispatcher.impl().removeAllEventListeners(viewID);
   }
   static function sendEvent(type, data)
   {
      g4.model.GameModelEventDispatcher.impl().sendEvent(type,data);
   }
}
