class g4.view.observerDamageDisplay.ObserverDamageDisplay extends g4.core.View
{
   var TOTAL_AMOUNT = 5;
   function ObserverDamageDisplay($targetMovie)
   {
      super($targetMovie);
      g4.view.observerDamageDisplay.ObserverDamageDisplayController.getInstance().registerObserverDamageDisplay(this);
   }
   function getUIName()
   {
      return g4.view.ViewID.OBSERVER_DAMAGE_DISPLAY;
   }
   function configGameInterface()
   {
      g4.view.observerDamageDisplay.ObserverDamageDisplayController.getInstance().registerGameInterfaces();
      g4.view.observerDamageDisplay.ObserverDamageDisplayController.getInstance().ToGame_ObserverDamageDisplay_Init();
   }
   function configUI()
   {
      this._uiDrager = this._targetMovieClip.uiDrager;
      this._uiDrager.setData(this.getUIName(),this._targetMovieClip);
      this._mc_damageIcon = this._targetMovieClip.mc_damageIcon;
      this._tf_time = this._targetMovieClip.tf_time;
      this._tf_totalDamage = this._targetMovieClip.tf_totalDamage;
      this._observerDamageInfoRenderers = [];
      var _loc2_ = 0;
      while(_loc2_ < this.TOTAL_AMOUNT)
      {
         var _loc3_ = this._targetMovieClip["damageInfoRenderer" + _loc2_];
         this._observerDamageInfoRenderers[_loc2_] = _loc3_;
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateTime(time)
   {
      this._tf_time.text = time;
   }
   function updateTotalDamage(damage)
   {
      this._tf_totalDamage.text = damage;
      this._mc_damageIcon._x = this._tf_totalDamage._x - this._tf_totalDamage.textWidth + 85;
   }
   function updateDamageInfos(observerDamageInfoPs)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.TOTAL_AMOUNT)
      {
         var _loc3_ = this._observerDamageInfoRenderers[_loc2_];
         var _loc4_ = observerDamageInfoPs[_loc2_];
         if(_loc4_ != null)
         {
            _loc3_.setData(_loc4_);
            _loc3_.showObserverDamageInfoRenderer();
            _loc3_._visible = true;
         }
         else
         {
            _loc3_._visible = false;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateDamageInfo(index, damage)
   {
      var _loc2_ = this._observerDamageInfoRenderers[index];
      _loc2_.updateDamageInfo(damage);
   }
}
