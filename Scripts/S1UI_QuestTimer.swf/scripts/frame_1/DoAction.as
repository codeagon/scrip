function motionAddTime(_time)
{
   delete container_mc.addtimerMc.onEnterFrame;
   var _loc1_ = container_mc.timerMc.getNextHighestDepth();
   var _pointMc = container_mc.addtimerMc.attachMovie("effectMc","addtimerMc",_loc1_ + 1);
   _pointMc.bonusA.txt.text = "+" + _time;
   _pointMc.bonusB.txt.text = "+" + _time;
   container_mc.timerMc.gotoAndStop(11);
   container_mc.timerMc.txt.text = preTimes;
   container_mc.addtimerMc.onEnterFrame = function()
   {
      if(_pointMc._currentframe < 8)
      {
         container_mc.timerMc.nextFrame();
         container_mc.timerMc.txt.text = preTimes;
      }
      if(_pointMc._currentframe == 30)
      {
         container_mc.timerMc.gotoAndStop(scoreMode);
         container_mc.timerMc.txt.text = preTimes;
         delete container_mc.addtimerMc.onEnterFrame;
         container_mc.addtimerMc.removeMovieClip();
      }
   };
}
var UI = this;
UI._visible = false;
var UIname = "QuestTimer";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var bWindowOpen = true;
container_mc.attain_mc._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var preTimes;
var scoreMode = 1;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = Number(bShow);
      UI._visible = bShow;
      if(_global.gbUIMode)
      {
         container_mc.bg_mc._visible = true;
      }
      else
      {
         container_mc.bg_mc._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function()
{
   if(_global.gbUIMode)
   {
      container_mc.bg_mc._visible = true;
   }
   else
   {
      container_mc.bg_mc._visible = false;
   }
};
myListener.OnGame_QuestTimer_SetQuestName = function(name)
{
   container_mc.name_txt.setText(name);
};
var timerStr = lib.util.UIString.getUIString("$004001");
container_mc.name_txt.htmlText = "<img src=\'icon_time\' vspace=\'-4\'>" + timerStr;
myListener.OnGame_QuestTimer_SetTimerText = function(str)
{
   str = String(str);
   var _loc3_ = str.substr(0,2);
   var _loc1_ = str.substr(2,2);
   var _loc2_ = str.substr(4,6);
   if(_loc3_ == "" || _loc3_ == undefined)
   {
      _loc3_ = "0";
   }
   if(_loc1_ == "" || _loc1_ == undefined)
   {
      _loc1_ = "00";
   }
   if(_loc2_ == "" || _loc2_ == undefined)
   {
      _loc2_ = "00";
   }
   preTimes = _loc3_ + ":" + _loc1_ + ":" + _loc2_;
   container_mc.timerMc.txt.text = preTimes;
   if(container_mc.dangerMc)
   {
      container_mc.dangerMc.effectMc0.txt.text = preTimes;
      container_mc.dangerMc.effectMc1.txt.text = preTimes;
   }
};
myListener.OnGame_QuestTimer_SetAddTime = function(time)
{
   time = String(time);
   var _loc5_ = time.substr(0,2);
   var _loc3_ = time.substr(2,2);
   var _loc4_ = time.substr(4,6);
   var _loc1_ = "";
   if(_loc5_ != "00")
   {
      _loc1_ = _loc1_ + (_loc5_ + ":" + _loc3_ + ":" + _loc4_);
   }
   else if(_loc3_ != "00")
   {
      _loc1_ = _loc1_ + (_loc3_ + ":" + _loc4_);
   }
   else
   {
      _loc1_ = _loc1_ + _loc4_;
   }
   motionAddTime(_loc1_);
};
myListener.OnGame_QuestTimer_SetNewRecord = function()
{
   delete container_mc.newRecordMc.onEnterFrame;
   scoreMode = 7;
   container_mc.newRecordMc.gotoAndPlay(2);
   container_mc.timerMc.gotoAndStop(1);
   container_mc.timerMc.txt.text = preTimes;
   container_mc.newRecordMc.onEnterFrame = function()
   {
      if(container_mc.newRecordMc._currentframe < 8)
      {
         container_mc.timerMc.nextFrame();
         container_mc.timerMc.txt.text = preTimes;
      }
      if(container_mc.newRecordMc._currentframe == 20)
      {
         container_mc.newRecordMc.gotoAndStop(1);
         delete container_mc.newRecordMc.onEnterFrame;
      }
   };
};
var prevWarningType = -1;
myListener.OnGame_QuestTimer_SetWarning = function(_type)
{
   if(prevWarningType == _type)
   {
      return undefined;
   }
   prevWarningType = _type;
   var _count = 9;
   if(Number(_type) == 1)
   {
      var _loc2_ = container_mc.timerMc.getNextHighestDepth();
      var _danger = container_mc.attachMovie("danger","dangerMc",_loc2_);
      container_mc.dangerMc.effectMc0.txt.text = preTimes;
      container_mc.dangerMc.effectMc1.txt.text = preTimes;
      _danger._alpha = 10;
      container_mc.timerMc._visible = true;
      container_mc.onEnterFrame = function()
      {
         _count--;
         container_mc.timerMc._alpha = container_mc.timerMc._alpha - 10;
         _danger._alpha = _danger._alpha + 10;
         if(_count < 1)
         {
            _danger._alpha = 100;
            delete container_mc.onEnterFrame;
            container_mc.timerMc._visible = false;
         }
      };
   }
   else
   {
      container_mc.timerMc._alpha = 10;
      container_mc.timerMc._visible = true;
      container_mc.onEnterFrame = function()
      {
         _count--;
         container_mc.dangerMc._alpha = container_mc.dangerMc._alpha - 10;
         container_mc.timerMc._alpha = container_mc.timerMc._alpha + 10;
         if(_count < 1)
         {
            container_mc.dangerMc._alpha = 100;
            delete container_mc.onEnterFrame;
            container_mc.dangerMc.removeMovieClip();
         }
      };
   }
};
fscommand("ToGame_QuestTimer_Init");
