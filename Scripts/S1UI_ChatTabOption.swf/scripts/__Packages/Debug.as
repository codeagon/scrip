class Debug extends gfx.events.EventDispatcher
{
   var _isDebug = false;
   function Debug()
   {
      super();
   }
   static function getInstance()
   {
      return Debug._instance = Debug._instance != null?Debug._instance:new Debug();
   }
   function init()
   {
      g4.model.GameInterface.registerGameInterface("OnGame_UiDebug",g4.util.Delegate.create(this,this.OnGame_UiDebug));
   }
   static function log(str)
   {
      trace(str);
      if(Debug._instance._isDebug == true)
      {
         g4.model.GameInterface.callGameInterface("ToGame_WriteUiLog",str);
      }
   }
   static function jsonLog(str, value)
   {
      if(Debug._instance._isDebug == true || _global.gfxPlayer == true)
      {
         var _loc2_ = "[Debug.jsonLog] " + str + " : " + g4.util.JSON.stringify(value);
         Debug.log(_loc2_);
      }
   }
   function OnGame_UiDebug()
   {
      this._isDebug = true;
   }
}
