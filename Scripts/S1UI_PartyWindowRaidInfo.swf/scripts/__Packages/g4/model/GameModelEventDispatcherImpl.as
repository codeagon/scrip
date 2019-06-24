class g4.model.GameModelEventDispatcherImpl
{
   function GameModelEventDispatcherImpl()
   {
      super();
      this.eventDispatcherMap = {};
   }
   function addEventListener(viewID, type, scope, callback)
   {
      var _loc2_ = this.eventDispatcherMap[viewID];
      if(_loc2_ == null)
      {
         _loc2_ = new gfx.events.EventDispatcher();
         this.eventDispatcherMap[viewID] = _loc2_;
      }
      _loc2_.addEventListener(type,scope,callback);
   }
   function removeAllEventListeners(viewID)
   {
      var _loc2_ = this.eventDispatcherMap[viewID];
      if(_loc2_ == null)
      {
         return undefined;
      }
      _loc2_.removeAllEventListeners();
   }
   function sendEvent(type, data)
   {
      var _loc2_ = new g4.model.ModelEvent(type,data);
      for(var _loc3_ in this.eventDispatcherMap)
      {
         (gfx.events.EventDispatcher)this.eventDispatcherMap[_loc3_].dispatchEvent(_loc2_);
      }
   }
}
