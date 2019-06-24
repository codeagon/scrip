class g4.model.GameInterface
{
   function GameInterface()
   {
   }
   static function impl()
   {
      if(g4.model.GameInterface._impl == null)
      {
         g4.model.GameInterface._impl = new g4.model.GameInterfaceImpl();
      }
      return g4.model.GameInterface._impl;
   }
   static function registerGameInterface(methodName, callback)
   {
      g4.model.GameInterface.impl().registerGameInterface(methodName,callback);
   }
   static function callGameInterface(command, parameters)
   {
      g4.model.GameInterface.impl().callGameInterface(command,parameters);
   }
}
