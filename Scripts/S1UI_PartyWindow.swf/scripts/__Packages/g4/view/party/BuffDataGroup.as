class g4.view.party.BuffDataGroup
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
      var _loc2_ = this.buffDataMap[id];
      if(_loc2_ == null)
      {
         _loc2_ = new g4.view.party.BuffData();
         this.buffDataArray.push(_loc2_);
         this.buffDataMap[id] = _loc2_;
      }
      _loc2_.id = id;
      _loc2_.stackCnt = stackCnt;
      _loc2_.type = type;
      _loc2_.group = group;
      _loc2_.img = img;
      _loc2_.remain = remain;
      _loc2_.total = total;
      _loc2_.currentTime = currentTime;
      _loc2_.startTime = currentTime - (total - remain);
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
