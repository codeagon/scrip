class g4.view.abnormality.BuffDataGroup
{
   function BuffDataGroup()
   {
      super();
      this.buffDataArray = [];
      this.buffDataMap = {};
   }
   function hasData()
   {
      return this.buffDataArray.length > 0;
   }
   function getAllBuffDatas()
   {
      return this.buffDataArray.slice(0);
   }
   function getBuffDatasCount(count)
   {
      return this.buffDataArray.slice(0,Math.min(count,this.buffDataArray.length));
   }
   function addBuff(id, stackCnt, type, group, bRelaxMerit, img, remain, total, currentTime)
   {
      if(this.buffDataMap[id] != null)
      {
         this.updateBuff(id,group,stackCnt,bRelaxMerit,img,remain,total,currentTime);
         return undefined;
      }
      var _loc2_ = new g4.view.abnormality.BuffData();
      _loc2_.id = id;
      _loc2_.stackCnt = stackCnt;
      _loc2_.type = type;
      _loc2_.group = group;
      _loc2_.bRelaxMerit = bRelaxMerit;
      _loc2_.img = img;
      _loc2_.remain = remain;
      _loc2_.total = total;
      _loc2_.currentTime = currentTime;
      _loc2_.startTime = currentTime - (total - remain);
      this.buffDataArray.push(_loc2_);
      this.buffDataMap[id] = _loc2_;
   }
   function updateBuff(id, group, stackCnt, bRelaxMerit, img, remain, total, currentTime)
   {
      var _loc2_ = this.buffDataMap[id];
      if(_loc2_ == null)
      {
         return false;
      }
      _loc2_.stackCnt = stackCnt;
      _loc2_.group = group;
      _loc2_.bRelaxMerit = bRelaxMerit;
      _loc2_.img = img;
      var _loc3_ = false;
      if(!isNaN(remain))
      {
         _loc2_.remain = remain;
         _loc3_ = true;
      }
      if(!isNaN(total))
      {
         _loc2_.total = total;
         _loc3_ = true;
      }
      if(_loc3_)
      {
         _loc2_.currentTime = currentTime;
         _loc2_.startTime = currentTime - (_loc2_.total - _loc2_.remain);
      }
      return true;
   }
   function removeBuff(id)
   {
      if(this.buffDataMap[id] == null)
      {
         return false;
      }
      delete this.buffDataMap.id;
      g4.util.ArrayUtil.removeElement(this.buffDataArray,function(data)
      {
         return data.id == id;
      }
      );
      return true;
   }
   function clearAllBuffs()
   {
      this.buffDataArray = [];
      this.buffDataMap = {};
   }
   function setTimePause(id, bPause)
   {
      var _loc2_ = this.buffDataMap[id];
      if(_loc2_ == null)
      {
         return false;
      }
      _loc2_.timePaused = bPause;
      return true;
   }
}
