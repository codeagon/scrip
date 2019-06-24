class g4.core.View extends g4.core.SimpleView
{
   var checkUIMode = false;
   function View(targetMovieClip)
   {
      super(targetMovieClip);
      this.$init();
   }
   function getUIName()
   {
      trace("You must override this method!");
      return "View";
   }
   function $init()
   {
      this.myListener = {};
      this.__get__targetMovieClip().myListener = this.myListener;
      this.__get__targetMovieClip().$beforeRemoveMovieClip = mx.utils.Delegate.create(this,this.beforeRemoveMovieClip);
      this.setViewVisible(false);
      this.configUI();
      this.configCommonGameInterface();
      this.configGameInterface();
      if(_global.EventBroadCaster)
      {
         _global.EventBroadCaster.addListener(this.myListener);
      }
      this.cleanUp();
      this.creationComplete();
   }
   function configUI()
   {
   }
   function configCommonGameInterface()
   {
      this.registerGameInterface("OnGameEventShowWindow",mx.utils.Delegate.create(this,this.OnGameEventShowWindow));
   }
   function configGameInterface()
   {
   }
   function registerGameInterface(methodName, callback)
   {
      this.myListener[methodName] = callback;
   }
   function cleanUp()
   {
   }
   function setViewVisible(visible)
   {
      this.__get__targetMovieClip().bWindowOpen = visible;
      var _loc3_ = this.__get__targetMovieClip().bWindowOpen;
      if(this.checkUIMode)
      {
         _loc3_ = _loc3_ && _global.gbUIMode;
      }
      if(_loc3_)
      {
         this.__get__targetMovieClip()._visible = true;
      }
      else
      {
         this.__get__targetMovieClip()._visible = false;
      }
   }
   function creationComplete()
   {
   }
   function beforeRemoveMovieClip()
   {
   }
   function OnGameEventShowWindow(windowName, bVisible)
   {
      if(windowName.toLowerCase() == this.getUIName().toLowerCase())
      {
         this.setViewVisible(bVisible);
      }
   }
}
