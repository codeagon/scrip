class lib.util.CoolTimeInstance extends MovieClip
{
   static var STR_MINUTE = lib.util.UIString.getUIString("$005001");
   static var STR_HOUR = lib.util.UIString.getUIString("$101082");
   static var STR_DAY = lib.util.UIString.getUIString("$101090");
   var totalCoolFrames = 362;
   function CoolTimeInstance()
   {
      super();
      this._visible = false;
   }
   function setCoolTime(remainTime, totalTime)
   {
      this.remainCoolTime = remainTime;
      this.totalCoolTime = totalTime;
      var _loc2_ = getTimer();
      this._startTimer = _loc2_ - (this.totalCoolTime - this.remainCoolTime);
      this.update(_loc2_);
      this._visible = true;
   }
   function update(timer)
   {
      var _loc2_ = timer - this._startTimer;
      var _loc4_ = int(_loc2_ / this.totalCoolTime * this.totalCoolFrames);
      this.gotoAndStop(_loc4_);
      var _loc3_ = Math.ceil((this.totalCoolTime - _loc2_) / 1000);
      if(_loc3_ == this.coolTime)
      {
         return undefined;
      }
      this.onTick();
      this.coolTime = _loc3_;
      this.CoolTimeTxt.text = this.getCountText();
      this.CoolTimeTxt.textAutoSize = "shrink";
      if(this.coolTime >= -1)
      {
         if(this.coolTime <= 0)
         {
            this.CoolTimeTxt.text = "1";
            this.onFinished();
            this.manager.removeCoolTimeInstance(this);
         }
      }
   }
   function getCountText()
   {
      var _loc2_ = this.coolTime;
      if(_loc2_ <= 60)
      {
         return _loc2_;
      }
      if(_loc2_ > 60 && _loc2_ <= 3600)
      {
         return Math.ceil(_loc2_ / 60) + lib.util.CoolTimeInstance.STR_MINUTE;
      }
      if(_loc2_ > 3600 && _loc2_ <= 86400)
      {
         return Math.ceil(_loc2_ / 3600) + lib.util.CoolTimeInstance.STR_HOUR;
      }
      if(_loc2_ > 86400)
      {
         return Math.ceil(_loc2_ / 86400) + lib.util.CoolTimeInstance.STR_DAY;
      }
   }
   function clearCoolTime()
   {
      delete this.manager;
      delete this.remainCoolTime;
      delete this.totalCoolTime;
      delete this.coolTime;
      delete this._startTimer;
      this._visible = false;
   }
   function onFinished()
   {
   }
   function onTick()
   {
   }
}
