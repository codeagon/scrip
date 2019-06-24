function zoomCount(count)
{
   var _loc13_ = String(count).split("");
   _loc13_.reverse();
   var _loc14_ = _loc13_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc14_)
   {
      var _loc4_ = _loc13_[_loc1_];
      var _loc7_ = "countFd" + _loc1_ + "_" + _loc4_;
      if(preCounts[_loc1_] != _loc4_)
      {
         var _loc2_ = container_mc.countMc["countFd" + _loc1_ + "_" + preCounts[_loc1_]];
         if(_loc2_.remove != 1)
         {
            gs.TweenLite.to(_loc2_,0.15,{_x:_loc2_._x,_y:-20,_alpha:0,onComplete:completeRemove,onCompleteParams:[_loc2_]});
         }
         else
         {
            _loc2_.removeMovieClip();
         }
         _loc2_.remove = 1;
         var _loc6_ = container_mc.countMc.getNextHighestDepth();
         var _loc3_ = container_mc.countMc.attachMovie("countFd",_loc7_,_loc6_);
         _loc3_.txt.text = _loc4_;
         var _loc5_ = - _loc3_.txt.textWidth + 2 + _loc1_ * 30;
         _loc3_._x = _loc5_;
         _loc3_._y = 0;
         gs.TweenLite.from(_loc3_,0.15,{_x:_loc5_,_y:20,_alpha:50});
      }
      _loc1_ = _loc1_ + 1;
   }
   preCounts = [];
   preCounts = preCounts.concat(_loc13_);
}
function completeRemove(mc)
{
   mc.removeMovieClip();
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
         myListener.OnGame_KillCounter_SetCounter(testCount / 10);
      }
   };
}
var UI = this;
var UIname = "KillCounter";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var bWindowOpen = true;
container_mc.attain_mc._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
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
myListener.OnGame_KillCounter_SetCounter = function(counter)
{
   zoomCount(counter);
};
var preCountFd;
var preCounts = [];
fscommand("ToGame_KillCounter_Init");
var testCount = 0;
var testMode = false;
