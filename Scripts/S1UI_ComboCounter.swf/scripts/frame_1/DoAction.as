function allClear()
{
   var _loc3_ = preCounts.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc2_ = container_mc.countMc["countFd" + _loc1_ + "_" + preCounts[_loc1_]];
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   preCounts = [];
   container_mc.countMc._visible = false;
}
function zoomCount(count)
{
   var _loc12_ = String(count).split("");
   _loc12_.reverse();
   if(count > 9999)
   {
      if(container_mc.countMc.hitMc.mc._currentframe < 5)
      {
         var _loc18_ = container_mc.countMc.countFd0_9;
         var _loc17_ = container_mc.countMc.countFd1_9;
         var _loc16_ = container_mc.countMc.countFd2_9;
         var _loc14_ = container_mc.countMc.countFd3_9;
         gs.TweenLite.to(_loc18_,0.15,{_x:_loc18_._x,_y:-20,_alpha:0,onComplete:completeRemove,onCompleteParams:[_loc18_]});
         gs.TweenLite.to(_loc17_,0.15,{_x:_loc17_._x,_y:-20,_alpha:0,onComplete:completeRemove,onCompleteParams:[_loc17_]});
         gs.TweenLite.to(_loc16_,0.15,{_x:_loc16_._x,_y:-20,_alpha:0,onComplete:completeRemove,onCompleteParams:[_loc16_]});
         gs.TweenLite.to(_loc14_,0.15,{_x:_loc14_._x,_y:-20,_alpha:0,onComplete:completeRemove,onCompleteParams:[_loc14_]});
         container_mc.countMc.hitMc.mc.gotoAndStop(5);
      }
      return undefined;
   }
   if(count > 29)
   {
      countRank = 30;
      countWid = 49;
      countY = -8;
      container_mc.countMc.hitMc.mc.gotoAndStop(4);
   }
   else if(count > 19)
   {
      countRank = 20;
      countWid = 43;
      countY = -12;
      container_mc.countMc.hitMc.mc.gotoAndStop(3);
   }
   else if(count > 9)
   {
      countRank = 10;
      countWid = 35;
      countY = -16;
      container_mc.countMc.hitMc.mc.gotoAndStop(2);
   }
   else
   {
      countRank = 0;
      countWid = 10;
      countY = -20;
      container_mc.countMc.hitMc.mc.gotoAndStop(1);
   }
   var _loc13_ = _loc12_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc13_)
   {
      var _loc2_ = _loc12_[_loc1_];
      var _loc7_ = "countFd" + _loc1_ + "_" + _loc2_;
      if(preCounts[_loc1_] != _loc2_)
      {
         var _loc6_ = container_mc.countMc["countFd" + _loc1_ + "_" + preCounts[_loc1_]];
         if(_loc6_.remove != 1)
         {
            gs.TweenLite.to(_loc6_,0.15,{_x:_loc6_._x,_y:-20,_alpha:0,onComplete:completeRemove,onCompleteParams:[_loc6_]});
         }
         else
         {
            _loc6_.removeMovieClip();
         }
         _loc6_.remove = 1;
         var _loc5_ = container_mc.countMc.getNextHighestDepth();
         var _loc3_ = container_mc.countMc.attachMovie("countFd",_loc7_,_loc5_);
         if(_loc2_ == 0)
         {
            _loc2_ = 10;
         }
         _loc3_.mc.gotoAndStop(Number(_loc2_) + countRank);
         var _loc4_ = - _loc1_ * countWid;
         _loc3_._x = _loc4_;
         _loc3_._y = countY;
         gs.TweenLite.from(_loc3_,0.2,{_x:_loc4_ - 20,_y:countY,_xscale:150,_yscale:150,_alpha:50});
      }
      else
      {
         _loc6_ = container_mc.countMc["countFd" + _loc1_ + "_" + preCounts[_loc1_]];
         _loc6_.gotoAndPlay(1);
      }
      _loc1_ = _loc1_ + 1;
   }
   container_mc.countMc._x = 138;
   container_mc.countMc._y = 34;
   container_mc.countMc.hitMc.gotoAndPlay(1);
   gs.TweenLite.to(container_mc.countMc,0.1,{_x:143,_y:30,onComplete:boundEnd});
   preCounts = [];
   preCounts = preCounts.concat(_loc12_);
}
function completeRemove(mc)
{
   mc.removeMovieClip();
}
function boundEnd()
{
   container_mc.countMc._x = 138;
   container_mc.countMc._y = 34;
   gs.TweenLite.to(container_mc.countMc,0.1,{_x:143,_y:36,ease:Regular.easeOut});
}
function testAnimation(_type)
{
   if(_type == 0)
   {
      delete this.onEnterFrame;
      return undefined;
   }
   this.onEnterFrame = function()
   {
      testCount = testCount + 1;
      if(testCount % 10 == 0)
      {
         myListener.OnGame_ComboCounter_SetCounter(testCount / 10);
      }
   };
}
var UI = this;
var UIname = "ComboCounter";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var bWindowOpen = true;
container_mc.attain_mc._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.bg_mc._visible = false;
container_mc.bg_mc._alpha = 0;
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = Number(bShow);
      UI._visible = bShow;
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
container_mc.countMc._visible = false;
myListener.OnGame_ComboCounter_SetCounter = function(counter)
{
   if(counter > 0)
   {
      container_mc.bg_mc._alpha = 100;
      container_mc.countMc._visible = true;
      zoomCount(counter);
   }
   else
   {
      container_mc.bg_mc._alpha = 0;
      allClear();
   }
};
var preCountFd;
var preCounts = [];
var countRank = 0;
var countWid = 35;
var countY = -20;
fscommand("ToGame_ComboCounter_Init");
var testCount = 0;
var testMode = false;
