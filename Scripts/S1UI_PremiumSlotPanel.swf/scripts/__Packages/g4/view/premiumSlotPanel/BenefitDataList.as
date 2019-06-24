class g4.view.premiumSlotPanel.BenefitDataList
{
   function BenefitDataList()
   {
      super();
   }
   function getDataCount()
   {
      if(this.dataArray == null)
      {
         return 0;
      }
      return this.dataArray.length;
   }
   function getDataAt(index)
   {
      if(index < 0 || index > this.getDataCount() - 1)
      {
         return null;
      }
      return this.dataArray[index];
   }
   function setData(dataList)
   {
      this.highlightIDMap = {};
      this.highlightIDList = null;
      this.dataArray = [];
      var _loc5_ = lib.util.ExtString.split(dataList,"\n");
      if(_loc5_ == null || _loc5_.length == 0)
      {
         return undefined;
      }
      var _loc4_ = undefined;
      var _loc6_ = _loc5_.length;
      _loc4_ = 0;
      while(_loc4_ < _loc6_)
      {
         var _loc3_ = lib.util.ExtString.split(_loc5_[_loc4_],"\t");
         var _loc2_ = new g4.view.premiumSlotPanel.BenefitData();
         _loc2_.id = Number(_loc3_[0]);
         _loc2_.image = _loc3_[1];
         _loc2_.name = _loc3_[2];
         _loc2_.count = Number(_loc3_[3]);
         _loc2_.impossible = g4.util.Converter.toBoolean(_loc3_[4]);
         _loc2_.grade = Number(_loc3_[5]);
         this.dataArray.push(_loc2_);
         _loc4_ = _loc4_ + 1;
      }
   }
   function setHighlightData(idMap)
   {
      this.highlightIDMap = {};
      this.highlightIDList = null;
      var _loc4_ = [];
      if(idMap != null)
      {
         var _loc2_ = undefined;
         var _loc3_ = undefined;
         var _loc5_ = this.dataArray.length;
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc2_ = this.dataArray[_loc3_];
            if(idMap[_loc2_.id])
            {
               this.highlightIDMap[_loc2_.id] = true;
               _loc4_.push(_loc2_.id);
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      this.highlightIDList = _loc4_.join("\t");
   }
   function hasHighlightIDList()
   {
      if(this.highlightIDList == null || this.highlightIDList.length == 0)
      {
         return false;
      }
      return true;
   }
   function getHighlightIDList()
   {
      return this.highlightIDList;
   }
   function isHighlightID(id)
   {
      return this.highlightIDMap[id];
   }
}
