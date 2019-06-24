class lib.util.CoolTimeManger
{
   var _timerInsts = [];
   static var _flag = false;
   var _totalCount = 0;
   var _indexCount = 0;
   var _state = false;
   var SPEED = 30;
   function CoolTimeManger()
   {
   }
   static function getInstance()
   {
      if(lib.util.CoolTimeManger._flag)
      {
         return lib.util.CoolTimeManger._coolTimeMangerInst;
      }
      lib.util.CoolTimeManger._flag = true;
      lib.util.CoolTimeManger._coolTimeMangerInst = new lib.util.CoolTimeManger();
      return lib.util.CoolTimeManger._coolTimeMangerInst;
   }
   function addCoolTimeInstance(timerinst)
   {
      if(timerinst == undefined)
      {
         return undefined;
      }
      if(timerinst.manager == lib.util.CoolTimeManger._coolTimeMangerInst)
      {
         return undefined;
      }
      timerinst.manager = lib.util.CoolTimeManger._coolTimeMangerInst;
      timerinst.index = this._indexCount;
      this._timerInsts.push(timerinst);
      this._totalCount = this._timerInsts.length;
      if(!this._state)
      {
         this.startInterval();
      }
   }
   function removeCoolTimeInstance(timerinst)
   {
      if(timerinst == undefined)
      {
         return undefined;
      }
      if(timerinst.manager != lib.util.CoolTimeManger._coolTimeMangerInst)
      {
         return undefined;
      }
      timerinst.clearCoolTime();
      var _loc2_ = 0;
      var _loc4_ = this._timerInsts.length;
      while(_loc2_ < _loc4_)
      {
         if(this._timerInsts[_loc2_] == timerinst)
         {
            this._timerInsts.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      this._totalCount = this._timerInsts.length;
      if(this._totalCount == 0)
      {
         this.init();
      }
   }
   function clearCoolTimer()
   {
      this.stopInterval();
      var _loc2_ = this._timerInsts.length;
      while(_loc2_ > 0)
      {
         var _loc3_ = this._timerInsts[_loc2_ - 1];
         this.removeCoolTimeInstance(_loc3_);
         _loc2_ = _loc2_ - 1;
      }
      this.init();
   }
   function init()
   {
      this.stopInterval();
      this._timerInsts = [];
      this._totalCount = 0;
      this._indexCount = 0;
   }
   function startInterval()
   {
      if(this._state)
      {
         return undefined;
      }
      var _loc2_ = this;
      this._intervalId = setInterval(this,"onTick",this.SPEED);
      this._state = true;
   }
   function stopInterval()
   {
      if(!this._state)
      {
         return undefined;
      }
      clearInterval(this._intervalId);
      this._state = false;
   }
   function onTick()
   {
      var _loc3_ = 0;
      var _loc4_ = getTimer();
      while(_loc3_ < this._totalCount)
      {
         var _loc2_ = this._timerInsts[_loc3_];
         if(_loc2_ != undefined)
         {
            _loc2_.update(_loc4_);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
}
