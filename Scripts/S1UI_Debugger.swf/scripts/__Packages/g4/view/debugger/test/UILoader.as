class g4.view.debugger.test.UILoader
{
   var enterFrameStarted = false;
   function UILoader()
   {
      this.init();
   }
   static function getInstance()
   {
      if(g4.view.debugger.test.UILoader._instance == null)
      {
         g4.view.debugger.test.UILoader._instance = new g4.view.debugger.test.UILoader();
      }
      return g4.view.debugger.test.UILoader._instance;
   }
   static function loadUI(data, loadCompleteFunc)
   {
      g4.view.debugger.test.UILoader.getInstance()._loadUI(data,loadCompleteFunc);
   }
   function init()
   {
      this.loadingDataArray = [];
      this.dummyMovieClip = _root.createEmptyMovieClip("dummyMovieClip",_root.getNextHighestDepth());
   }
   function canToLoadUI(uiName)
   {
      if(g4.view.debugger.test.BaseUIUtil.isLoadedUI(uiName))
      {
         return false;
      }
      if(g4.view.debugger.test.BaseUIUtil.isOnLoad(uiName))
      {
         return false;
      }
      return true;
   }
   function _loadUI(data, loadCompleteFunc)
   {
      if(data == null)
      {
         return undefined;
      }
      if(g4.view.debugger.test.BaseUIUtil.isRegisteredUI(data.uiName) && data.bAlwaysLoaded)
      {
         g4.view.debugger.test.GameInterfaceProxy.OnGameEventShowUI(data.uiName,true);
         return undefined;
      }
      if(!this.canToLoadUI(data.uiName))
      {
         return undefined;
      }
      var _loc3_ = {};
      _loc3_.data = data;
      _loc3_.loadCompleteFunc = loadCompleteFunc;
      this.loadingDataArray.push(_loc3_);
      g4.view.debugger.test.GameInterfaceProxy.OnGameEventRegisterUI(data);
      if(!data.bAlwaysLoaded)
      {
         g4.view.debugger.test.GameInterfaceProxy.OnGameEventShowUI(data.uiName,true);
      }
      if(!this.enterFrameStarted)
      {
         this.enterFrameStarted = true;
         this.dummyMovieClip.onEnterFrame = mx.utils.Delegate.create(this,this.dummyMovieClip_onEnterFrameHandler);
      }
   }
   function hasLoadingData()
   {
      return this.loadingDataArray.length > 0;
   }
   function dummyMovieClip_onEnterFrameHandler()
   {
      var _loc4_ = this.loadingDataArray.length;
      while((_loc4_ = _loc4_ - 1) >= 0)
      {
         var _loc3_ = this.loadingDataArray[_loc4_];
         var _loc2_ = (g4.view.debugger.test.UIData)_loc3_.data.uiName;
         if(g4.view.debugger.test.BaseUIUtil.isLoadedUI(_loc2_))
         {
            this.loadingDataArray.splice(_loc4_,1);
            g4.view.debugger.test.GameInterfaceProxy.OnGameEventShowUI(_loc2_,true);
            g4.view.debugger.test.GameInterfaceProxy.OnGame_SetUIPosition(true,_loc2_);
            _loc3_.loadCompleteFunc();
         }
      }
      if(!this.hasLoadingData())
      {
         delete this.dummyMovieClip.onEnterFrame;
         this.enterFrameStarted = false;
      }
   }
}
