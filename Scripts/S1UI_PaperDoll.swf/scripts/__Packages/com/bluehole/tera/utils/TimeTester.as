class com.bluehole.tera.utils.TimeTester
{
   function TimeTester()
   {
   }
   static function startTimeTest(name, comment)
   {
      name = name.toLowerCase();
      if(!com.bluehole.tera.utils.TimeTester.startTimeDict)
      {
         com.bluehole.tera.utils.TimeTester.startTimeDict = {};
         com.bluehole.tera.utils.TimeTester.totalTime = 0;
      }
      var _loc2_ = getTimer();
      com.bluehole.tera.utils.TimeTester.startTimeDict[name] = _loc2_;
   }
   static function finishTimeTest(name, comment)
   {
      name = name.toLowerCase();
      var _loc3_ = getTimer();
      if(com.bluehole.tera.utils.TimeTester.startTimeDict[name])
      {
         var _loc2_ = _loc3_ - com.bluehole.tera.utils.TimeTester.startTimeDict[name];
         lib.Debuger.trace(name + "의 " + comment + " 총 걸린시간 : " + _loc2_);
         com.bluehole.tera.utils.TimeTester.totalTime = com.bluehole.tera.utils.TimeTester.totalTime + _loc2_;
         lib.Debuger.trace("총 측정시간 : " + com.bluehole.tera.utils.TimeTester.totalTime);
      }
   }
}
