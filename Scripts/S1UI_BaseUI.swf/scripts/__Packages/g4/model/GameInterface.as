class g4.model.GameInterface extends g4.core.EventDispatcher
{
   function GameInterface()
   {
      super();
      this._gameInterfaceListener = {};
      _global.EventBroadCaster.addListener(this._gameInterfaceListener);
   }
   static function getInstance()
   {
      return g4.model.GameInterface._instance = g4.model.GameInterface._instance != null?g4.model.GameInterface._instance:new g4.model.GameInterface();
   }
   static function registerGameInterface(methodName, callback)
   {
      g4.model.GameInterface.getInstance()._gameInterfaceListener[methodName] = callback;
   }
   static function callGameInterface(command, parameters)
   {
      if(parameters == null)
      {
         getURL("FSCommand:" add command,"");
      }
      else
      {
         getURL("FSCommand:" add command,parameters);
      }
      g4.model.GameInterface.getInstance().dispatchEvent(command,[parameters]);
   }
}
