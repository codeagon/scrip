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
}
