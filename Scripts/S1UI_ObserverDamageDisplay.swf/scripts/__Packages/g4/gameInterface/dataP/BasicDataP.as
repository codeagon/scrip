class g4.gameInterface.dataP.BasicDataP
{
   function BasicDataP(originData)
   {
      for(var _loc3_ in originData)
      {
         this[_loc3_] = originData[_loc3_];
      }
   }
   function getVariableArr()
   {
      if(this.variableNameList == null || this.variableNameList.length == 0)
      {
         return null;
      }
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this.variableNameList.length)
      {
         _loc3_.push(this[this.variableNameList[_loc2_]]);
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   static function teraParse(source, data)
   {
      var _loc1_ = 0;
      while(_loc1_ < data.length)
      {
         if(typeof source[source.variableNameList[_loc1_]] == "boolean")
         {
            source[source.variableNameList[_loc1_]] = Boolean(data[_loc1_] == "1");
         }
         else if(typeof source[source.variableNameList[_loc1_]] == "number")
         {
            source[source.variableNameList[_loc1_]] = Number(data[_loc1_]);
         }
         else
         {
            source[source.variableNameList[_loc1_]] = data[_loc1_];
         }
         _loc1_ = _loc1_ + 1;
      }
   }
}
