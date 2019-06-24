function motionAddPoint(point)
{
   var _loc5_ = container_mc.countMc.getNextHighestDepth();
   var _loc2_ = new MovieClip();
   var _loc6_ = point.split("\t");
   var _loc4_ = "";
   addPointCount++;
   if(savePointMc._name != undefined)
   {
      overlapMc(savePointMc);
   }
   switch(Number(_loc6_[1]))
   {
      case 0:
         _loc2_ = container_mc.addPointMc.attachMovie("effect_Plus","addPointMc" + depthCount,_loc5_ + depthCount);
         _loc4_ = "+";
         _loc2_.bonusA.txt.textColor = 8447772;
         _loc2_.bonusB.txt.textColor = 8447772;
         break;
      case 1:
         _loc2_ = container_mc.addPointMc.attachMovie("effect_Plus","addPointMc" + depthCount,_loc5_ + depthCount);
         _loc4_ = "+";
         _loc2_.bonusA.txt.textColor = 1161471;
         _loc2_.bonusB.txt.textColor = 1161471;
         break;
      case 2:
         _loc2_ = container_mc.addPointMc.attachMovie("effect_Minus","addPointMc" + depthCount,_loc5_ + depthCount);
         _loc4_ = "-";
         _loc2_.bonusA.txt.textColor = 16711680;
         _loc2_.bonusB.txt.textColor = 16711680;
   }
   depthCount++;
   if(depthCount > 1000)
   {
      depthCount = 0;
   }
   savePointMc = _loc2_;
   _loc2_.bonusA.txt.text = _loc4_ + _loc6_[0];
   _loc2_.bonusB.txt.text = _loc4_ + _loc6_[0];
   var _loc3_ = preCounts.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      EnterEffect(container_mc.countMc["countFd" + _loc1_ + "_" + preCounts[_loc1_]].num,_loc1_);
      _loc1_ = _loc1_ + 1;
   }
}
function zoomCount(count)
{
   container_mc.countEffect.gotoAndPlay(2);
   container_mc.countEffect.mc0.txt.text = count;
   container_mc.countEffect.mc2.blendMode = "add";
   container_mc.countEffect.mc2.txt.text = count;
   var _loc9_ = String(count).split("");
   _loc9_.reverse();
   var _loc10_ = _loc9_.length;
   var _loc11_ = preCounts.length;
   var _loc8_ = 0;
   if(_loc11_ > _loc10_)
   {
      _loc8_ = _loc11_;
   }
   else
   {
      _loc8_ = _loc10_;
   }
   var _loc1_ = 0;
   while(_loc1_ < _loc8_)
   {
      var _loc3_ = _loc9_[_loc1_];
      var _loc7_ = "countFd" + _loc1_ + "_" + _loc3_;
      if(_loc1_ == _loc8_ - 1 && _loc3_ == preCounts[_loc1_])
      {
         break;
      }
      var _loc4_ = container_mc.countMc["countFd" + _loc1_ + "_" + preCounts[_loc1_]];
      _loc4_._name = _loc4_._name + delCount;
      delCount++;
      countAnimation(_loc4_,_loc1_,"out");
      if(_loc10_ > _loc1_)
      {
         var _loc5_ = container_mc.countMc.getNextHighestDepth();
         var _loc2_ = container_mc.countMc.attachMovie("countFd",_loc7_,_loc5_);
         _loc2_.gotoAndStop(colorMode);
         _loc2_.num.txt.text = _loc3_;
         _loc2_._alpha = 0;
         var _loc6_ = - _loc2_.num.txt.textWidth + 2 + _loc1_ * 30;
         _loc2_._x = _loc6_;
         _loc2_._y = 0;
         countAnimation(_loc2_,_loc1_,"in");
      }
      _loc1_ = _loc1_ + 1;
   }
   preCounts = [];
   preCounts = preCounts.concat(_loc9_);
}
function countAnimation(_mc, _delay, _type)
{
   var _count = 0;
   _mc.onEnterFrame = function()
   {
      _count++;
      if(_count == (_delay + 1) * delayNum)
      {
         if(_type == "in")
         {
            this._alpha = 100;
            gs.TweenLite.from(this,0.15,{_x:this._x,_y:20,_alpha:50});
         }
         else if(_type == "out")
         {
            gs.TweenLite.to(this,0.15,{_x:this._x,_y:-20,_alpha:0,onComplete:completeRemove,onCompleteParams:[this]});
         }
         delete this.onEnterFrame;
      }
   };
}
function completeRemove(mc)
{
   mc.removeMovieClip();
   if(delCount > 1000)
   {
      delCount = 0;
   }
}
function overlapMc(_mc)
{
   _mc.gotoAndPlay(35);
   _mc._count = 14;
   var _yTarget = - 40 + 20 * overCount;
   overCount++;
   _mc.onEnterFrame = function()
   {
      this._count = this._count - 1;
      this._y = this._y + (_yTarget - this._y) * 0.3;
      this._x = this._x + (40 - this._x) * 0.3;
      if(this._count == 6)
      {
         overCount--;
      }
      if(this._count < 1)
      {
         delete this.onEnterFrame;
      }
   };
}
function EnterEffect(_mc, _num)
{
   _mc.count = 0;
   _mc.onEnterFrame = function()
   {
      _mc.count = _mc.count + 1;
      _mc.gotoAndStop(_mc.count);
      _mc.txt.text = preCounts[_num];
      if(_mc.count > 6)
      {
         _mc.gotoAndStop(1);
         _mc.txt.text = preCounts[_num];
         delete _mc.onEnterFrame;
      }
   };
}
function RemoveEvent(_mc)
{
   _mc.removeMovieClip();
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
      if(testCount % 12 == 0)
      {
         myListener.OnGame_KillPoint_SetPoint(testCount * 10);
      }
   };
}
var UI = this;
var UIname = "KillPoint";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var bWindowOpen = true;
container_mc.attain_mc._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var colorMode = 1;
var currentPoint = 0;
var preCounts = [];
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
myListener.OnGame_KillPoint_SetNewRecord = function()
{
   delete container_mc.newRecordMc.onEnterFrame;
   colorMode = 2;
   container_mc.countMc._visible = false;
   container_mc.newRecordMc.gotoAndPlay(2);
   var _loc2_ = preCounts.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      container_mc.countMc["countFd" + _loc1_ + "_" + preCounts[_loc1_]].gotoAndStop(colorMode);
      container_mc.countMc["countFd" + _loc1_ + "_" + preCounts[_loc1_]].num.txt.text = preCounts[_loc1_];
      _loc1_ = _loc1_ + 1;
   }
   container_mc.newRecordMc.onEnterFrame = function()
   {
      if(container_mc.newRecordMc.effectA)
      {
         container_mc.newRecordMc.effectA.txt.text = currentPoint;
      }
      if(container_mc.newRecordMc.effectB)
      {
         container_mc.newRecordMc.effectB.txt.text = currentPoint;
      }
      if(container_mc.newRecordMc._currentframe == 15)
      {
         container_mc.countMc._visible = true;
      }
      if(container_mc.newRecordMc._currentframe == 20)
      {
         container_mc.newRecordMc.gotoAndStop(1);
         delete container_mc.newRecordMc.onEnterFrame;
      }
   };
};
myListener.OnGame_KillPoint_SetAddPoint = function(addPoint)
{
   motionAddPoint(addPoint);
};
var depthCount = 0;
var savePointMc = null;
myListener.OnGame_KillPoint_SetPoint = function(point)
{
   currentPoint = Number(point);
   zoomCount(currentPoint);
};
var delCount = 0;
var delayNum = 1;
var overCount = 0;
fscommand("ToGame_KillPoint_Init");
var testCount = 0;
var testMode = false;
