class g4.core.EventDispatcher
{
   function EventDispatcher()
   {
   }
   function addEventListener(eventType, scope, callBack)
   {
      if(this._listeners == null)
      {
         this._listeners = new Object();
      }
      if(this._listeners[eventType] == null)
      {
         this._listeners[eventType] = [];
      }
      if(this.indexOfListener(this._listeners[eventType],scope,callBack) == -1)
      {
         this._listeners[eventType].push({eventType:eventType,scope:scope,callBack:callBack});
      }
   }
   function removeEventListener(eventType, scope, callBack)
   {
      var _loc2_ = this._listeners[eventType];
      if(_loc2_ == null)
      {
         return undefined;
      }
      var _loc3_ = this.indexOfListener(_loc2_,scope,callBack);
      if(_loc3_ != -1)
      {
         _loc2_.splice(_loc3_,1);
      }
   }
   function dispatchEvent(eventType, params)
   {
      var _loc6_ = this._listeners[eventType];
      var _loc2_ = 0;
      while(_loc2_ < _loc6_.length)
      {
         var _loc3_ = _loc6_[_loc2_];
         var _loc5_ = _loc3_.scope;
         var _loc4_ = _loc3_.callBack;
         _loc4_.apply(_loc5_,params);
         _loc2_ = _loc2_ + 1;
      }
   }
   function removeAllEventListener(scope)
   {
      for(var _loc7_ in this._listeners)
      {
         var _loc3_ = this._listeners[_loc7_];
         var _loc5_ = _loc3_.length;
         var _loc2_ = -1;
         while((_loc2_ = _loc2_ + 1) < _loc5_)
         {
            var _loc4_ = _loc3_[_loc2_];
            if(_loc4_.scope == scope)
            {
               _loc3_.splice(_loc2_,1);
            }
         }
      }
   }
   function indexOfListener(listeners, scope, callBack)
   {
      var _loc3_ = listeners.length;
      var _loc2_ = -1;
      while((_loc2_ = _loc2_ + 1) < _loc3_)
      {
         var _loc1_ = listeners[_loc2_];
         if(_loc1_.scope == scope && _loc1_.callBack == callBack)
         {
            return _loc2_;
         }
      }
      return -1;
   }
}
