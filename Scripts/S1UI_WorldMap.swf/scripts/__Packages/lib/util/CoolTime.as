class lib.util.CoolTime
{
   var interval = 0;
   static var STR_MINUTE = lib.util.UIString.getUIString("$005001");
   function CoolTime(remainTime, totalTime)
   {
      this.remain = remainTime;
      this.total = totalTime;
      this.startPoint = this.total - this.remain;
      this.start = getTimer();
      this.aim = this.start + this.total;
      this.array = [this.interval];
      this.interval = setInterval(this,"timeFlow",30);
   }
   function update(remainTime, totalTime)
   {
      this.remain = remainTime;
      this.total = totalTime;
      this.startPoint = this.total - this.remain;
      this.start = getTimer();
      this.aim = this.start + this.total;
   }
   function timeFlow()
   {
      this.thisTime = getTimer() + this.startPoint;
      if(this.aim <= this.thisTime)
      {
         this.onFinished();
         this.remove();
      }
      else
      {
         this.onTick();
      }
   }
   function onTick()
   {
   }
   function onFinished()
   {
   }
   function remove()
   {
      clearInterval(this.interval);
      this.array.pop();
   }
   function getDgree()
   {
      return 360 - 360 * Math.abs(this.aim - this.thisTime) / this.total;
   }
   function getPercent()
   {
      return 100 - 100 * Math.abs(this.aim - this.thisTime) / this.total;
   }
   function getSecond()
   {
      return Math.ceil((this.aim - this.thisTime) / 1000);
   }
   function getCountText()
   {
      var _loc2_ = this.getSecond();
      if(_loc2_ <= 60)
      {
         return _loc2_;
      }
      if(_loc2_ <= 90 && _loc2_ > 60)
      {
         return 1 + lib.util.CoolTime.STR_MINUTE;
      }
      if(_loc2_ > 90)
      {
         return Math.ceil(_loc2_ / 60) + lib.util.CoolTime.STR_MINUTE;
      }
   }
   static function draw(graph, boxWidth, boxHeight, startAngle, color, alpha, reverse)
   {
      graph.clear();
      var _loc10_ = boxWidth / 2;
      var _loc12_ = boxHeight / 2;
      var _loc1_ = startAngle;
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
      var _loc16_ = _loc10_ + _loc13_ * Math.sin(startAngle * lib.info.PreMath.radian);
      var _loc15_ = _loc12_ - _loc13_ * Math.cos(startAngle * lib.info.PreMath.radian);
      _loc9_ = {x:_loc16_,y:_loc15_};
      graph.lineTo(_loc9_.x,_loc9_.y);
      if(reverse == undefined || reverse == 0)
      {
         if(startAngle >= 0 && startAngle < 45)
         {
            graph.lineTo(_loc7_.x,_loc7_.y);
            graph.lineTo(_loc6_.x,_loc6_.y);
            graph.lineTo(_loc5_.x,_loc5_.y);
            graph.lineTo(_loc4_.x,_loc4_.y);
         }
         else if(startAngle >= 45 && startAngle < 135)
         {
            graph.lineTo(_loc6_.x,_loc6_.y);
            graph.lineTo(_loc5_.x,_loc5_.y);
            graph.lineTo(_loc4_.x,_loc4_.y);
         }
         else if(startAngle >= 135 && startAngle < 225)
         {
            graph.lineTo(_loc5_.x,_loc5_.y);
            graph.lineTo(_loc4_.x,_loc4_.y);
         }
         else if(startAngle >= 225 && startAngle < 315)
         {
            graph.lineTo(_loc4_.x,_loc4_.y);
         }
         else if(startAngle >= 315 && startAngle < 360)
         {
         }
      }
      else if(!(startAngle >= 0 && startAngle < 45))
      {
         if(startAngle >= 45 && startAngle < 135)
         {
            graph.lineTo(_loc7_.x,_loc7_.y);
         }
         else if(startAngle >= 135 && startAngle < 225)
         {
            graph.lineTo(_loc6_.x,_loc6_.y);
            graph.lineTo(_loc7_.x,_loc7_.y);
         }
         else if(startAngle >= 225 && startAngle < 315)
         {
            graph.lineTo(_loc5_.x,_loc5_.y);
            graph.lineTo(_loc6_.x,_loc6_.y);
            graph.lineTo(_loc7_.x,_loc7_.y);
         }
         else if(startAngle >= 315 && startAngle < 360)
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
}
