class g4.model.GameInterfaceImpl
{
   function GameInterfaceImpl()
   {
      super();
      this.gameInterfaceListener = {};
      _global.EventBroadCaster.addListener(this.gameInterfaceListener);
   }
   function registerGameInterface(methodName, callback)
   {
      this.gameInterfaceListener[methodName] = callback;
   }
   function callGameInterface(command, parameters)
   {
      if(parameters == null)
      {
         getURL("FSCommand:" add command,"");
      }
      else
      {
         getURL("FSCommand:" add command,parameters);
      }
   }
}
