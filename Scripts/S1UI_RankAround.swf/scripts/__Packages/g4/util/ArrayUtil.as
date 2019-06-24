class g4.util.ArrayUtil
{
   function ArrayUtil()
   {
   }
   static function indexOf(array, searchElementOrCompareFunction, fromIndex)
   {
      if(array == null || array.length == 0)
      {
         return -1;
      }
      if(isNaN(fromIndex))
      {
         fromIndex = 0;
      }
      var _loc1_ = undefined;
      var _loc4_ = array.length;
      if(typeof searchElementOrCompareFunction == "function")
      {
         _loc1_ = fromIndex;
         while(_loc1_ < _loc4_)
         {
            if(searchElementOrCompareFunction(array[_loc1_]))
            {
               return _loc1_;
            }
            _loc1_ = _loc1_ + 1;
         }
      }
      else
      {
         _loc1_ = fromIndex;
         while(_loc1_ < _loc4_)
         {
            if(array[_loc1_] === searchElementOrCompareFunction)
            {
               return _loc1_;
            }
            _loc1_ = _loc1_ + 1;
         }
      }
      return -1;
   }
   static function lastIndexOf(array, searchElementOrCompareFunction, fromIndex)
   {
      if(array == null || array.length == 0)
      {
         return -1;
      }
      if(isNaN(fromIndex))
      {
         fromIndex = 2147483647;
      }
      var _loc1_ = Math.min(fromIndex,array.length);
      if(typeof searchElementOrCompareFunction == "function")
      {
         while((_loc1_ = _loc1_ - 1) >= 0)
         {
            if(searchElementOrCompareFunction(array[_loc1_]))
            {
               return _loc1_;
            }
         }
      }
      else
      {
         while((_loc1_ = _loc1_ - 1) >= 0)
         {
            if(array[_loc1_] === searchElementOrCompareFunction)
            {
               return _loc1_;
            }
         }
      }
      return -1;
   }
   static function isExist(array, searchElementOrCompareFunction)
   {
      return g4.util.ArrayUtil.indexOf(array,searchElementOrCompareFunction) != -1;
   }
   static function removeElement(array, searchElementOrCompareFunction)
   {
      var _loc1_ = g4.util.ArrayUtil.indexOf(array,searchElementOrCompareFunction);
      if(_loc1_ == -1)
      {
         return undefined;
      }
      return array.splice(_loc1_,1)[0];
   }
   static function shuffle(array)
   {
      var _loc3_ = undefined;
      var _loc5_ = array.length;
      var _loc4_ = new Array();
      var _loc1_ = 0;
      while(_loc1_ < _loc5_)
      {
         _loc3_ = Math.floor(Math.random() * array.length);
         _loc4_[_loc1_] = array[_loc3_];
         array.splice(_loc3_,1);
         _loc1_ = _loc1_ + 1;
      }
      return _loc4_;
   }
   static function sortMapByKey(mapData, options)
   {
      var _loc3_ = [];
      for(var _loc4_ in mapData)
      {
         _loc3_.push({key:_loc4_,value:mapData[_loc4_]});
      }
      _loc3_.sortOn("key",options);
      return _loc3_;
   }
   static function randomElement(array)
   {
      return array[Math.floor(Math.random() * array.length)];
   }
}
