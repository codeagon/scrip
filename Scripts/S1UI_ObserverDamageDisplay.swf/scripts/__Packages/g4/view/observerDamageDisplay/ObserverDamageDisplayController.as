class g4.view.observerDamageDisplay.ObserverDamageDisplayController implements g4.gameInterface.IObserverDamageDisplayController
{
   function ObserverDamageDisplayController()
   {
   }
   static function getInstance()
   {
      return g4.view.observerDamageDisplay.ObserverDamageDisplayController._instance = g4.view.observerDamageDisplay.ObserverDamageDisplayController._instance != null?g4.view.observerDamageDisplay.ObserverDamageDisplayController._instance:new g4.view.observerDamageDisplay.ObserverDamageDisplayController();
   }
   function registerObserverDamageDisplay(observerDamageDisplay)
   {
      this._observerDamageDisplay = observerDamageDisplay;
   }
   function registerGameInterfaces()
   {
      g4.model.GameInterface.registerGameInterface("OnGameEventShowWindow",g4.util.Delegate.create(this,this.OnGameEventShowWindow));
      g4.model.GameInterface.registerGameInterface("OnGame_ObserverDamageDisplay_UpdateTimeInfo",g4.util.Delegate.create(this,this.OnGame_ObserverDamageDisplay_UpdateTimeInfo));
      g4.model.GameInterface.registerGameInterface("OnGame_ObserverDamegeDisplay_UpdateTotalDamage",g4.util.Delegate.create(this,this.OnGame_ObserverDamegeDisplay_UpdateTotalDamage));
      g4.model.GameInterface.registerGameInterface("OnGame_ObserverDamageDisplay_UpdateDamageInfos",g4.util.Delegate.create(this,this.OnGame_ObserverDamageDisplay_UpdateDamageInfos));
      g4.model.GameInterface.registerGameInterface("OnGame_ObserverDamageDisplay_UpdateDamageInfo",g4.util.Delegate.create(this,this.OnGame_ObserverDamageDisplay_UpdateDamageInfo));
   }
   function OnGameEventShowWindow($widgetName, $isShow)
   {
      if($widgetName.toLowerCase() == this._observerDamageDisplay.getUIName().toLowerCase())
      {
         this._observerDamageDisplay.__get__targetMovieClip()._visible = $isShow;
      }
   }
   function OnGame_ObserverDamageDisplay_UpdateTimeInfo($time)
   {
      this._observerDamageDisplay.updateTime($time);
   }
   function OnGame_ObserverDamegeDisplay_UpdateTotalDamage($damage)
   {
      this._observerDamageDisplay.updateTotalDamage($damage);
   }
   function OnGame_ObserverDamageDisplay_UpdateDamageInfos($observerDamageInfoPs)
   {
      var _loc3_ = g4.util.TeraParser.parse($observerDamageInfoPs);
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         _loc3_[_loc2_] = g4.gameInterface.dataP.observerDamageDisplay.ObserverDamageInfoP.teraParse(_loc3_[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      g4.util.Debug.jsonLog("[g4.view.observerDamageDisplay.ObserverDamageDisplayController.OnGame_ObserverDamageDisplay_UpdateDamageInfos][###] ",_loc3_);
      this._observerDamageDisplay.updateDamageInfos(_loc3_);
   }
   function OnGame_ObserverDamageDisplay_UpdateDamageInfo($index, $damage)
   {
      this._observerDamageDisplay.updateDamageInfo($index,$damage);
   }
   function ToGame_ObserverDamageDisplay_Init()
   {
      g4.model.GameInterface.callGameInterface("ToGame_ObserverDamageDisplay_Init");
   }
}
