class g4.util.Debug extends gfx.events.EventDispatcher
{
   static var LOG = "log";
   function Debug()
   {
      super();
   }
   static function getInstance()
   {
      return g4.util.Debug._instance = g4.util.Debug._instance != null?g4.util.Debug._instance:new g4.util.Debug();
   }
   static function log(str)
   {
      g4.util.Debug._instance.dispatchEvent({type:g4.util.Debug.LOG,str:str});
   }
   static function jsonLog(str, value)
   {
      trace("[Debug.jsonLog] " + str + " : " + g4.util.JSON.stringify(value));
   }
}
