class lib.gamedata.GameDataCoolTimeable implements lib.gamedata.GameData
{
   var id = undefined;
   var bSimulateCoolTime = true;
   var coolTimeLastUpdatedRemain = 0;
   var coolTimeLastUpdatedTotal = 0;
   function GameDataCoolTimeable(id)
   {
      gfx.events.EventDispatcher.initialize(this.eventDispatcher = new Object());
      this.setId(id);
   }
   function getId()
   {
      return this.id;
   }
   function setId(_id)
   {
      this.id = _id;
   }
   function updateData(dataObject)
   {
      this.getPropInObject(dataObject);
   }
   function getSimulateCoolTime()
   {
      return this.bSimulateCoolTime;
   }
   function setSimulateCoolTime(_bTrue)
   {
      this.bSimulateCoolTime = Boolean(_bTrue);
      if(_bTrue == false)
      {
         this.removeCoolTime();
      }
   }
   function getCoolTimeRemain()
   {
      return !this.hasCoolTime()?0:this.coolTime.getRemainTime();
   }
   function getCoolTimeTotal()
   {
      return !this.hasCoolTime()?0:this.coolTime.getTotalTime();
   }
   function getCoolTimeLastUpdatedRemain()
   {
      return this.coolTimeLastUpdatedRemain;
   }
   function getCoolTimeLastUpdatedTotal()
   {
      return this.coolTimeLastUpdatedTotal;
   }
   function getCoolTimeSecond()
   {
      return !this.hasCoolTime()?0:this.coolTime.getPercent();
   }
   function getCoolTimeDegree()
   {
      return !this.hasCoolTime()?0:this.coolTime.getDgree();
   }
   function getCoolTimePercent()
   {
      return !this.hasCoolTime()?0:this.coolTime.getSecond();
   }
   function getCoolTimeLocalizedRemain()
   {
      return !this.hasCoolTime()?"":this.coolTime.getCountText();
   }
   function setCoolTime(remainTime, totalTime)
   {
      remainTime = Number(remainTime);
      if(isNaN(remainTime))
      {
         remainTime = 0;
      }
      totalTime = Number(totalTime);
      if(isNaN(totalTime))
      {
         totalTime = 0;
      }
      if(!this.hasOverlapping(remainTime,totalTime))
      {
         if(this.hasCoolTime())
         {
            this.coolTime.update(remainTime,totalTime);
         }
         else
         {
            if(this.bSimulateCoolTime)
            {
               this.coolTime = new lib.util.CoolTime(remainTime,totalTime);
            }
            this.createCoolTimeEvent();
         }
         this.coolTimeLastUpdatedRemain = remainTime;
         this.coolTimeLastUpdatedTotal = totalTime;
      }
   }
   function removeCoolTime()
   {
      this.coolTime.remove();
      this.coolTime = null;
   }
   function addEventListener(event, scope, callBack)
   {
      this.eventDispatcher.addEventListener(event,scope,callBack);
   }
   function removeEventListener(event, scope, callBack)
   {
      this.eventDispatcher.removeEventListener(event,scope,callBack);
   }
   function dispatchEvent(event)
   {
      this.eventDispatcher.dispatchEvent(event);
   }
   function hasCoolTime()
   {
      if(this.coolTime != null && this.coolTime != undefined && this.coolTime.getRemainTime() >= 0)
      {
         return true;
      }
      return false;
   }
   function getPropInObject(obj)
   {
      var _loc4_ = null;
      var _loc5_ = null;
      for(var _loc6_ in obj)
      {
         var _loc2_ = obj[_loc6_];
         if(_loc6_ == "id")
         {
            this.setId(Number(_loc2_));
         }
         else if(_loc6_ == "bSimulateCoolTime" || _loc6_ == "simulateCoolTime")
         {
            this.setSimulateCoolTime(Number(_loc2_));
         }
         else if(_loc6_ == "remain" || "coolTimeRemain")
         {
            _loc4_ = Number(_loc2_);
         }
         else if(_loc6_ == "total" || "coolTimeTotal")
         {
            _loc5_ = Number(_loc2_);
         }
      }
      if(!isNaN(_loc4_) && !isNaN(_loc5_))
      {
         this.setCoolTime(_loc4_,_loc5_);
      }
   }
   function createCoolTimeEvent()
   {
      var thisObject = this;
      this.coolTime.onFinished = function()
      {
         thisObject.dispatchEvent({type:gfx.events.EventTypes.COOLTIME_END,target:thisObject});
         thisObject.removeCoolTime();
      };
      this.coolTime.onStart = function()
      {
         thisObject.dispatchEvent({type:gfx.events.EventTypes.COOLTIME_START,target:thisObject});
      };
      this.coolTime.onTick = function()
      {
         thisObject.dispatchEvent({type:gfx.events.EventTypes.COOLTIME_TICK,target:thisObject});
      };
      this.coolTime.onUpdate = function()
      {
         thisObject.dispatchEvent({type:gfx.events.EventTypes.COOLTIME_UPDATE,target:thisObject});
      };
   }
   function hasOverlapping(remainTime, totalTime)
   {
      return !(this.getCoolTimeLastUpdatedRemain() == 0 && this.getCoolTimeLastUpdatedTotal() == 0 && this.getCoolTimeLastUpdatedRemain() == remainTime && this.getCoolTimeLastUpdatedTotal() == totalTime)?false:true;
   }
}
