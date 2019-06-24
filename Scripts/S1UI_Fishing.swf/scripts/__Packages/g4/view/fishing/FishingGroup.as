class g4.view.fishing.FishingGroup extends gfx.core.UIComponent
{
   var isPull = false;
   function FishingGroup()
   {
      super();
   }
   function onLoad()
   {
      this.mFish._visible = false;
      this.mFish.gotoAndStop(1);
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
         _loc2_.addEventListener("fish_hit",this,"fishHandlerHit");
         _loc2_.addEventListener("fish_move",this,"fishHandlerMove");
      }
      this._aBox_active.push(_loc2_);
      return _loc2_;
   }
   function fishHandlerHit(event)
   {
      this.mFish.setShake(true);
   }
   function fishHandlerMove(event)
   {
      this.mFish.setShake(false);
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
      this.mFish.setShake(false);
      this.isPull = false;
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
         _loc2_.setWidth(Number(_loc3_[1]));
         _loc2_._x = Number(_loc3_[2]) + 30;
         _loc4_ = _loc4_ + 1;
      }
      this.mBackground.gotoAndPlay(2);
   }
   function startGame($maxTime, $functionKey, $fishType)
   {
      $maxTime = Number($maxTime);
      this.mFish._visible = true;
      this.mFish.gotoAndPlay(2);
      g4.util.TweenX.killTweenOf(this.mTime);
      this.mTime._width = 200;
      g4.util.TweenX.to(this.mTime,$maxTime,{_width:1},gs.easing.Linear.easeNone);
      if($functionKey == null || $functionKey == "" || $functionKey == undefined)
      {
         $functionKey = "F";
      }
      this.mFish.mReel0.mKey.mc.tf_key.text = $functionKey;
      this.mFish.setFishObject($fishType);
   }
   function setTime($time)
   {
      g4.util.TweenX.killTweenOf(this.mTime);
      this.mTime._width = $time / 30 * 200;
      g4.util.TweenX.to(this.mTime,$time,{_width:1},gs.easing.Linear.easeNone);
   }
   function setFishPosition($x)
   {
      this.mFish.setPsition($x);
   }
   function setPull($value)
   {
      if($value)
      {
         if(!this.isPull)
         {
            this.mFish.gotoAndStop(1);
            this.mFish.mReel0.mKey.gotoAndPlay(2);
            this.mFish.mReel0.gotoAndPlay(2);
            this.mFish.playFishObjAnim();
         }
      }
      else if(this.isPull)
      {
         this.mFish.gotoAndPlay(2);
         this.mFish.mReel0.mKey.gotoAndStop(1);
         this.mFish.mReel0.gotoAndStop(1);
         this.mFish.stopFishObjAnim();
      }
      this.isPull = $value;
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
            _loc2_._x = $x + 30;
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
                  _loc2_.setBlockState($state);
               }
            }
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setResult($result, $resultItem)
   {
      if($result == 1)
      {
         this.mFish._visible = false;
         this.mFish.gotoAndStop(1);
         this.mBackground.gotoAndPlay(22);
      }
      else if($result == 0)
      {
         g4.util.TweenX.to(this,0.5,{_alpha:0},gs.easing.Linear.easeNone,this);
      }
   }
   function onComplete()
   {
      this._alpha = 100;
      this.__set__visible(false);
      this.dispatchEvent({type:"ToGame_Fishing_Finish"});
   }
   function openComp()
   {
      this.dispatchEvent({type:"ToGame_Fishing_OpenComplete"});
   }
   function closeComp()
   {
      this.__set__visible(false);
      this.dispatchEvent({type:"ToGame_Fishing_Finish"});
   }
}
