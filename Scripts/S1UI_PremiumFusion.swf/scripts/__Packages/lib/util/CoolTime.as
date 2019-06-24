class lib.util.CoolTime
{
   var interval = 0;
   var bStarted = false;
   static var STR_MINUTE = lib.util.UIString.getUIString("$005001");
   static var STR_HOUR = lib.util.UIString.getUIString("$101082");
   static var STR_DAY = lib.util.UIString.getUIString("$101090");
   function CoolTime(remainTime, totalTime)
   {
      this.remain = remainTime;
      this.total = totalTime;
      this.startPoint = this.total - this.remain;
      this.startedTime = getTimer();
      this.finishTime = this.startedTime + this.total;
      this.array = [];
      this.array.push(setInterval(this,"timeFlow",30));
   }
   function update(remainTime, totalTime)
   {
      this.remain = remainTime;
      this.total = totalTime;
      this.startPoint = this.total - this.remain;
      this.startedTime = getTimer();
      this.finishTime = this.startedTime + this.total;
      this.onUpdate();
   }
   function remove()
   {
      var _loc2_ = this.array.pop();
      while(_loc2_ != undefined)
      {
         clearInterval(_loc2_);
         _loc2_ = this.array.pop();
      }
   }
   function getLastUpdatedRemainTime()
   {
      if(this.remain >= 0)
      {
         return this.remain;
      }
      return 0;
   }
   function getTotalTime()
   {
      if(this.total >= 0)
      {
         return this.total;
      }
      return 0;
   }
   function getRemainTime()
   {
      return this.finishTime - this.thisTime;
   }
   function getDgree()
   {
      return 360 - 360 * Math.abs(this.finishTime - this.thisTime) / this.total;
   }
   function getPercent()
   {
      return 100 - 100 * Math.abs(this.finishTime - this.thisTime) / this.total;
   }
   function getSecond()
   {
      return Math.ceil((this.finishTime - this.thisTime) / 1000);
   }
   function getCountText()
   {
      var _loc2_ = this.getSecond();
      if(_loc2_ <= 60)
      {
         return _loc2_;
      }
      if(_loc2_ > 60 && _loc2_ <= 3600)
      {
         return Math.ceil(_loc2_ / 60) + lib.util.CoolTime.STR_MINUTE;
      }
      if(_loc2_ > 3600 && _loc2_ <= 86400)
      {
         return Math.ceil(_loc2_ / 3600) + lib.util.CoolTime.STR_HOUR;
      }
      if(_loc2_ > 86400)
      {
         return Math.ceil(_loc2_ / 86400) + lib.util.CoolTime.STR_DAY;
      }
   }
   function onTick()
   {
   }
   function onFinished()
   {
   }
   function onStart()
   {
   }
   function onUpdate()
   {
   }
   static function draw(graph, boxWidth, boxHeight, angle, color, alpha, reverse)
   {
      graph.clear();
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
      graph.beginFill(color,alpha);
      graph.moveTo(_loc8_.x,_loc8_.y);
      graph.lineTo(_loc14_.x,_loc14_.y);
      var _loc16_ = _loc10_ + _loc13_ * Math.sin(angle * lib.info.PreMath.radian);
      var _loc15_ = _loc12_ - _loc13_ * Math.cos(angle * lib.info.PreMath.radian);
      _loc9_ = {x:_loc16_,y:_loc15_};
      graph.lineTo(_loc9_.x,_loc9_.y);
      if(reverse == undefined || reverse == 0)
      {
         if(angle >= 0 && angle < 45)
         {
            graph.lineTo(_loc7_.x,_loc7_.y);
            graph.lineTo(_loc6_.x,_loc6_.y);
            graph.lineTo(_loc5_.x,_loc5_.y);
            graph.lineTo(_loc4_.x,_loc4_.y);
         }
         else if(angle >= 45 && angle < 135)
         {
            graph.lineTo(_loc6_.x,_loc6_.y);
            graph.lineTo(_loc5_.x,_loc5_.y);
            graph.lineTo(_loc4_.x,_loc4_.y);
         }
         else if(angle >= 135 && angle < 225)
         {
            graph.lineTo(_loc5_.x,_loc5_.y);
            graph.lineTo(_loc4_.x,_loc4_.y);
         }
         else if(angle >= 225 && angle < 315)
         {
            graph.lineTo(_loc4_.x,_loc4_.y);
         }
         else if(angle >= 315 && angle < 360)
         {
         }
      }
      else if(!(angle >= 0 && angle < 45))
      {
         if(angle >= 45 && angle < 135)
         {
            graph.lineTo(_loc7_.x,_loc7_.y);
         }
         else if(angle >= 135 && angle < 225)
         {
            graph.lineTo(_loc6_.x,_loc6_.y);
            graph.lineTo(_loc7_.x,_loc7_.y);
         }
         else if(angle >= 225 && angle < 315)
         {
            graph.lineTo(_loc5_.x,_loc5_.y);
            graph.lineTo(_loc6_.x,_loc6_.y);
            graph.lineTo(_loc7_.x,_loc7_.y);
         }
         else if(angle >= 315 && angle < 360)
         {
            graph.lineTo(_loc4_.x,_loc4_.y);
            graph.lineTo(_loc5_.x,_loc5_.y);
            graph.lineTo(_loc6_.x,_loc6_.y);
            graph.lineTo(_loc7_.x,_loc7_.y);
         }
      }
      graph.lineTo(_loc8_.x,_loc8_.y);
      return graph;
   }
   function timeFlow()
   {
      this.thisTime = getTimer() + this.startPoint;
      if(!this.bStarted)
      {
         this.bStarted = true;
         this.onStart();
      }
      if(this.finishTime <= this.thisTime)
      {
         this.onFinished();
         this.remove();
      }
      else
      {
         this.onTick();
      }
   }
}
