class lib.externals.ExternalManager5
{
   function ExternalManager5()
   {
   }
   static function Fscommand()
   {
      var _loc4_ = "";
      var _loc3_ = "";
      if(arguments.length == 1)
      {
         _loc4_ = String(arguments.shift());
         getURL("FSCommand:" add _loc4_,"");
      }
      else if(arguments.length > 1)
      {
         _loc4_ = String(arguments.shift());
         var _loc2_ = 0;
         while(_loc2_ < arguments.length)
         {
            _loc3_ = _loc3_ + String(arguments[_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
         getURL("FSCommand:" add _loc4_,_loc3_);
      }
   }
   static function call()
   {
   }
}
