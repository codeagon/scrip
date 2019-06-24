class g4.util.TimeUtil
{
   static var previousTime = 0;
   static var enterFrameEventAdded = false;
   static var _deltaTime = 0;
   function TimeUtil()
   {
   }
   static function __get__deltaTime()
   {
      return g4.util.TimeUtil._deltaTime;
   }
   static function addListener(scope, callback)
   {
      if(g4.util.TimeUtil.eventDispatcher == null)
      {
         g4.util.TimeUtil.eventDispatcher = new gfx.events.EventDispatcher();
         g4.util.TimeUtil.tempEventObject = {type:"updateTime"};
      }
      g4.util.TimeUtil.eventDispatcher.addEventListener("updateTime",scope,callback);
      if(!g4.util.TimeUtil.enterFrameEventAdded)
      {
         g4.util.TimeUtil.enterFrameEventAdded = true;
         g4.util.TimeUtil.previousTime = getTimer();
         g4.util.UIUtil.addEnterFrameListener(g4.util.TimeUtil,"enterFrameHandler");
      }
   }
   static function removeListener(scope, callback)
   {
      if(g4.util.TimeUtil.eventDispatcher == null)
      {
         return undefined;
      }
      g4.util.TimeUtil.eventDispatcher.removeEventListener("updateTime",scope,callback);
      if(!g4.util.TimeUtil.eventDispatcher.hasEventListener("updateTime"))
      {
         if(g4.util.TimeUtil.enterFrameEventAdded)
         {
            g4.util.UIUtil.removeEnterFrameListener(g4.util.TimeUtil,"enterFrameHandler");
            g4.util.TimeUtil.enterFrameEventAdded = false;
         }
      }
   }
   static function enterFrameHandler()
   {
      var _loc1_ = getTimer();
      g4.util.TimeUtil._deltaTime = (_loc1_ - g4.util.TimeUtil.previousTime) * 0.001;
      g4.util.TimeUtil.previousTime = _loc1_;
      g4.util.TimeUtil.eventDispatcher.dispatchEvent(g4.util.TimeUtil.tempEventObject);
   }
}
