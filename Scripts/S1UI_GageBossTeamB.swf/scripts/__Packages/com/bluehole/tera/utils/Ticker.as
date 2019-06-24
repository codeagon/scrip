class com.bluehole.tera.utils.Ticker
{
   static var TICK = 200;
   static var TICK_START_TIME_PROPERTY_NAME = "__tick_start_time";
   function Ticker()
   {
      this.observers = new com.bluehole.tera.utils.List();
      this.intervalID = -1;
   }
   static function __get__instance()
   {
      if(com.bluehole.tera.utils.Ticker._instance == null)
      {
         com.bluehole.tera.utils.Ticker._instance = new com.bluehole.tera.utils.Ticker();
      }
      return com.bluehole.tera.utils.Ticker._instance;
   }
   function addObserver(observer)
   {
      this.observers.add(observer);
      observer[com.bluehole.tera.utils.Ticker.TICK_START_TIME_PROPERTY_NAME] = getTimer();
      observer.onUnload = function()
      {
         this.removeObserver(observer);
      };
      if(this.intervalID == -1)
      {
         this.intervalID = setInterval(this,"tickHandler",com.bluehole.tera.utils.Ticker.TICK);
      }
   }
   function removeObserver(observer)
   {
      this.observers.remove(observer);
      if(this.observers.list.length == 0)
      {
         clearInterval(this.intervalID);
         this.intervalID = -1;
      }
   }
   function tickHandler()
   {
      var _loc2_ = this.observers.__get__iterator();
      var _loc3_ = getTimer();
      while(_loc2_.hasNext())
      {
         _loc2_.next().updateTick(_loc3_);
      }
   }
}
