class g4.view.fishing.FishingGroup extends gfx.core.UIComponent
{
   function FishingGroup()
   {
      super();
   }
   function onLoad()
   {
      this.mFish._visible = false;
      this.mFish.gotoAndStop(1);
      this.mOpening.addEventListener(gfx.events.EventTypes.COMPLETE,this,"openComplete");
      this.mOpening._visible = false;
      this.mResult.addEventListener(gfx.events.EventTypes.COMPLETE,this,"resultComplete");
      this.mResult.__set__visible(false);
      this._aBox_pool = [];
      this._aBox_active = [];
      this.__set__visible(false);
   }
   function getBox()
   {
      var _loc2_ = undefined;
      if(this._aBox_pool.length > 0)
      {
         _loc2_ = (g4.view.fishing.FishingBlock)this._aBox_pool.pop();
         _loc2_._visible = true;
      }
      else
      {
         var _loc3_ = this.mAddPoint.getNextHighestDepth();
         var _loc4_ = this.mAddPoint.attachMovie("FishingBlock","box" + _loc3_,_loc3_);
         _loc2_ = (g4.view.fishing.FishingBlock)_loc4_;
      }
      this._aBox_active.push(_loc2_);
      return _loc2_;
   }
   function openComplete()
   {
      this.mOpening.__set__visible(false);
      this.dispatchEvent({type:"ToGame_Fishing_OpenComplete"});
   }
   function resultComplete()
   {
      this.__set__visible(false);
      this.dispatchEvent({type:"ToGame_Fishing_Finish"});
   }
   function resetBox()
   {
      while(this._aBox_active.length > 0)
      {
         var _loc2_ = (g4.view.fishing.FishingBlock)this._aBox_active.pop();
         _loc2_._x = 0;
         _loc2_._visible = false;
         this._aBox_pool.push(_loc2_);
      }
   }
   function createBox($boxData, $grade)
   {
      this.__set__visible(true);
      this._grade = $grade;
      if(this._aBox_active.length > 0)
      {
         this.resetBox();
      }
      var _loc5_ = lib.util.ExtString.split($boxData,"\n");
      var _loc6_ = _loc5_.length;
      var _loc4_ = 0;
      while(_loc4_ < _loc6_)
      {
         var _loc3_ = lib.util.ExtString.split(_loc5_[_loc4_],"\t");
         var _loc2_ = this.getBox();
         _loc2_.boxID = Number(_loc3_[0]);
         _loc2_._width = Number(_loc3_[1]);
         _loc2_._x = Number(_loc3_[2]);
         _loc4_ = _loc4_ + 1;
      }
      this.mOpening.setGrade($grade);
      this.mOpening.__set__visible(true);
   }
   function startGame($maxTime)
   {
      this.mOpening.__set__visible(false);
      this.mFish._visible = true;
      this.mFish.gotoAndPlay(2);
      this.mTime._width = 800;
      g4.util.TweenX.to(this.mTime,$maxTime,{_width:1},gs.easing.Linear.easeNone);
   }
   function setTime($time)
   {
      g4.util.TweenX.killTweenOf(this.mTime);
      this.mTime._width = $time / 30 * 800;
      g4.util.TweenX.to(this.mTime,$time,{_width:1},gs.easing.Linear.easeNone);
   }
   function setFishPosition($x)
   {
      this.mFish._x = $x;
      this.mFish.mAddPoint.clear();
      this.mFish.mAddPoint.lineStyle(3,16711680,100);
      var _loc2_ = 800 - (this.mFish._x + 75);
      this.mFish.mAddPoint.lineTo(_loc2_,0);
   }
   function setPull($value)
   {
      if($value)
      {
         this.mFish.mc.gotoAndStop(2);
      }
      else
      {
         this.mFish.mc.gotoAndStop(1);
      }
   }
   function setBoxState($index, $state, $x, $remain)
   {
      this.mFish.setRemain($remain);
      var _loc5_ = this._aBox_active.length;
      var _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         if((g4.view.fishing.FishingBlock)this._aBox_active[_loc3_].boxID == $index)
         {
            var _loc2_ = (g4.view.fishing.FishingBlock)this._aBox_active[_loc3_];
            _loc2_._x = $x;
            if($state == -1)
            {
               _loc2_._visible = false;
            }
            else
            {
               _loc2_._visible = true;
               if($state == 0)
               {
                  _loc2_.setBroken();
               }
               else
               {
                  if($state > 1)
                  {
                     $state = 1;
                  }
                  _loc2_.gotoAndStop(Math.round($state * 100));
               }
            }
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setResult($result, $resultItem)
   {
      this.mResult.__set__visible(true);
      this.mResult.setResult($result,$resultItem);
      this.mFish._visible = false;
      this.mFish.gotoAndStop(1);
   }
}
