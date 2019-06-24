class g4.util.CoolTime
{
   static var ACTUAL_UPDATE_COUNT = 5;
   var lived = false;
   var timePaused = false;
   var added = false;
   var updateCount = 0;
   function CoolTime(updateHandler, completeHandler)
   {
      this.updateHandler = updateHandler;
      this.completeHandler = completeHandler;
      this.cleanUp();
   }
   static function draw(mc, boxWidth, boxHeight, angle, color, alpha, reverse)
   {
      mc.clear();
      var _loc10_ = boxWidth / 2;
      var _loc12_ = boxHeight / 2;
      var _loc1_ = angle;
      if(_loc1_ >= 45 && _loc1_ < 90)
      {
         _loc1_ = 90 - _loc1_;
      }
      else if(_loc1_ >= 90 && _loc1_ < 135)
      {
         _loc1_ = _loc1_ - 90;
      }
      else if(_loc1_ >= 135 && _loc1_ < 180)
      {
         _loc1_ = 180 - _loc1_;
      }
      else if(_loc1_ >= 180 && _loc1_ < 225)
      {
         _loc1_ = _loc1_ - 180;
      }
      else if(_loc1_ >= 225 && _loc1_ < 270)
      {
         _loc1_ = 270 - _loc1_;
      }
      else if(_loc1_ >= 270 && _loc1_ < 315)
      {
         _loc1_ = _loc1_ - 270;
      }
      else if(_loc1_ >= 315 && _loc1_ < 360)
      {
         _loc1_ = 360 - _loc1_;
      }
      var _loc18_ = _loc1_ * 3.141592653589793 / 180;
      var _loc13_ = _loc10_ / Math.cos(_loc18_);
      var _loc8_ = {x:boxWidth / 2,y:0};
      var _loc14_ = {x:_loc10_,y:_loc12_};
      var _loc9_ = null;
      var _loc7_ = {x:boxWidth,y:0};
      var _loc6_ = {x:boxWidth,y:boxHeight};
      var _loc5_ = {x:0,y:boxHeight};
      var _loc4_ = {x:0,y:0};
      mc.beginFill(color,alpha);
      mc.moveTo(_loc8_.x,_loc8_.y);
      mc.lineTo(_loc14_.x,_loc14_.y);
      var _loc16_ = _loc10_ + _loc13_ * Math.sin(angle * lib.info.PreMath.radian);
      var _loc15_ = _loc12_ - _loc13_ * Math.cos(angle * lib.info.PreMath.radian);
      _loc9_ = {x:_loc16_,y:_loc15_};
      mc.lineTo(_loc9_.x,_loc9_.y);
      if(reverse == undefined || reverse == 0)
      {
         if(angle >= 0 && angle < 45)
         {
            mc.lineTo(_loc7_.x,_loc7_.y);
            mc.lineTo(_loc6_.x,_loc6_.y);
            mc.lineTo(_loc5_.x,_loc5_.y);
            mc.lineTo(_loc4_.x,_loc4_.y);
         }
         else if(angle >= 45 && angle < 135)
         {
            mc.lineTo(_loc6_.x,_loc6_.y);
            mc.lineTo(_loc5_.x,_loc5_.y);
            mc.lineTo(_loc4_.x,_loc4_.y);
         }
         else if(angle >= 135 && angle < 225)
         {
            mc.lineTo(_loc5_.x,_loc5_.y);
            mc.lineTo(_loc4_.x,_loc4_.y);
         }
         else if(angle >= 225 && angle < 315)
         {
            mc.lineTo(_loc4_.x,_loc4_.y);
         }
         else if(angle >= 315 && angle < 360)
         {
         }
      }
      else if(!(angle >= 0 && angle < 45))
      {
         if(angle >= 45 && angle < 135)
         {
            mc.lineTo(_loc7_.x,_loc7_.y);
         }
         else if(angle >= 135 && angle < 225)
         {
            mc.lineTo(_loc6_.x,_loc6_.y);
            mc.lineTo(_loc7_.x,_loc7_.y);
         }
         else if(angle >= 225 && angle < 315)
         {
            mc.lineTo(_loc5_.x,_loc5_.y);
            mc.lineTo(_loc6_.x,_loc6_.y);
            mc.lineTo(_loc7_.x,_loc7_.y);
         }
         else if(angle >= 315 && angle < 360)
         {
            mc.lineTo(_loc4_.x,_loc4_.y);
            mc.lineTo(_loc5_.x,_loc5_.y);
            mc.lineTo(_loc6_.x,_loc6_.y);
            mc.lineTo(_loc7_.x,_loc7_.y);
         }
      }
      mc.lineTo(_loc8_.x,_loc8_.y);
   }
   function cleanUp()
   {
      this.updateCount = 0;
      this.remainTime = 0;
      this.totalTime = 0;
      this.elapsedTime = 0;
      this.lived = false;
      this.timePaused = false;
      this.addOrRemoveListener();
   }
   function setCoolTime(remainTime, totalTime)
   {
      this.remainTime = remainTime * 0.001;
      this.totalTime = totalTime * 0.001;
      this.elapsedTime = this.totalTime - this.remainTime;
      if(this.elapsedTime >= this.totalTime)
      {
         this.setLived(false);
         this.completeHandler();
      }
      else
      {
         this.updateHandler();
         this.setLived(true);
      }
   }
   function setLived(lived)
   {
      this.lived = lived;
      this.addOrRemoveListener();
   }
   function setTimePaused(timePaused)
   {
      this.timePaused = timePaused;
      this.addOrRemoveListener();
   }
   function addOrRemoveListener()
   {
      var _loc2_ = this.lived && !this.timePaused;
      if(_loc2_ == this.added)
      {
         return undefined;
      }
      this.added = _loc2_;
      if(this.added)
      {
         g4.util.TimeUtil.addListener(this,"updateTime");
      }
      else
      {
         g4.util.TimeUtil.removeListener(this,"updateTime");
      }
   }
   function getRemainTime()
   {
      return Math.max(0,this.totalTime - this.elapsedTime);
   }
   function getDegree()
   {
      return 360 - 360 * this.getRemainTime() / this.totalTime;
   }
   function getRemainTimeSecond()
   {
      return Math.ceil(this.getRemainTime());
   }
   function getRemainTimeText()
   {
      return g4.util.Translator.convertSecond(this.getRemainTimeSecond());
   }
   function updateTime()
   {
      this.elapsedTime = this.elapsedTime + g4.util.TimeUtil.deltaTime;
      if((this.updateCount = this.updateCount + 1) >= g4.util.CoolTime.ACTUAL_UPDATE_COUNT)
      {
         this.updateCount = 0;
         this.updateHandler();
         if(this.elapsedTime >= this.totalTime)
         {
            this.setLived(false);
            this.completeHandler();
         }
      }
   }
}
