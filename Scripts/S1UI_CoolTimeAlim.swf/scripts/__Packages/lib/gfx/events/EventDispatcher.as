class lib.gfx.events.EventDispatcher
{
   function EventDispatcher()
   {
   }
   static function initialize(target)
   {
      if(lib.gfx.events.EventDispatcher._instance == undefined)
      {
         lib.gfx.events.EventDispatcher._instance = new lib.gfx.events.EventDispatcher();
      }
      target.dispatchEvent = lib.gfx.events.EventDispatcher._instance.dispatchEvent;
      target.dispatchQueue = lib.gfx.events.EventDispatcher._instance.dispatchQueue;
      target.hasEventListener = lib.gfx.events.EventDispatcher._instance.hasEventListener;
      target.addEventListener = lib.gfx.events.EventDispatcher._instance.addEventListener;
      target.removeEventListener = lib.gfx.events.EventDispatcher._instance.removeEventListener;
      target.removeAllEventListeners = lib.gfx.events.EventDispatcher._instance.removeAllEventListeners;
      target.cleanUpEvents = lib.gfx.events.EventDispatcher._instance.cleanUpEvents;
      _global.ASSetPropFlags(target,"dispatchQueue",1);
   }
   static function indexOfListener(listeners, scope, callBack)
   {
      var _loc3_ = listeners.length;
      var _loc2_ = -1;
      while((_loc2_ = _loc2_ + 1) < _loc3_)
      {
         var _loc1_ = listeners[_loc2_];
         if(_loc1_.listenerObject == scope && _loc1_.listenerFunction == callBack)
         {
            return _loc2_;
         }
      }
      return -1;
   }
   function addEventListener(event, scope, callBack)
   {
      if(this._listeners == undefined)
      {
         this._listeners = {};
         _global.ASSetPropFlags(this,"_listeners",1);
      }
      var _loc3_ = this._listeners[event];
      if(_loc3_ == undefined)
      {
         this._listeners[event] = _loc3_ = [];
      }
      if(lib.gfx.events.EventDispatcher.indexOfListener(_loc3_,scope,callBack) == -1)
      {
         _loc3_.push({listenerObject:scope,listenerFunction:callBack});
      }
   }
   function removeEventListener(event, scope, callBack)
   {
      var _loc2_ = this._listeners[event];
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      var _loc3_ = lib.gfx.events.EventDispatcher.indexOfListener(_loc2_,scope,callBack);
      if(_loc3_ != -1)
      {
         _loc2_.splice(_loc3_,1);
      }
   }
   function dispatchEvent(event)
   {
      if(event.type == "all")
      {
         return undefined;
      }
      if(event.target == undefined)
      {
         event.target = this;
      }
      this.dispatchQueue(this,event);
   }
   function hasEventListener(event)
   {
      return this._listeners[event] != null && this._listeners[event].length > 0;
   }
   function removeAllEventListeners(event)
   {
      if(event == undefined)
      {
         delete this._listeners;
      }
      else
      {
         delete this._listeners.event;
      }
   }
   function dispatchQueue(dispatch, event)
   {
      var _loc1_ = dispatch._listeners[event.type];
      if(_loc1_ != undefined)
      {
         lib.gfx.events.EventDispatcher.$dispatchEvent(dispatch,_loc1_,event);
      }
      _loc1_ = dispatch._listeners.all;
      if(_loc1_ != undefined)
      {
         lib.gfx.events.EventDispatcher.$dispatchEvent(dispatch,_loc1_,event);
      }
   }
   static function $dispatchEvent(dispatch, listeners, event)
   {
      var _loc7_ = listeners.length;
      var _loc3_ = 0;
      while(_loc3_ < _loc7_)
      {
         var _loc1_ = listeners[_loc3_].listenerObject;
         var _loc5_ = typeof _loc1_;
         var _loc2_ = listeners[_loc3_].listenerFunction;
         if(_loc2_ == undefined)
         {
            _loc2_ = event.type;
         }
         if(_loc5_ != "function")
         {
            if(_loc1_.handleEvent != undefined && _loc2_ == undefined)
            {
               _loc1_.handleEvent(event);
            }
            else
            {
               _loc1_.register2(event);
            }
         }
         else if(_loc1_[_loc2_] != null)
         {
            _loc1_.register2(event);
         }
         else
         {
            _loc1_.apply(dispatch,[event]);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function cleanUp()
   {
      this.cleanUpEvents();
   }
   function cleanUpEvents()
   {
      this.removeAllEventListeners();
   }
}
