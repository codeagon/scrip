class g4.util.TeraParser
{
   function TeraParser()
   {
   }
   static function stringify(arg)
   {
      var _loc5_ = undefined;
      var _loc1_ = undefined;
      var _loc6_ = undefined;
      var _loc4_ = "";
      var _loc3_ = undefined;
      switch(typeof arg)
      {
         case "object":
            if(arg)
            {
               if(arg instanceof Array)
               {
                  _loc1_ = 0;
                  while(_loc1_ < arg.length)
                  {
                     _loc3_ = g4.util.TeraParser.stringify(arg[_loc1_]);
                     if(arg[_loc1_] instanceof Array)
                     {
                        _loc4_ = _loc4_ + (_loc3_ + "\n");
                     }
                     else
                     {
                        _loc4_ = _loc4_ + (_loc3_ + "\t");
                     }
                     _loc1_ = _loc1_ + 1;
                  }
                  return _loc4_;
               }
            }
            return "";
         case "number":
            return !isFinite(arg)?"":String(arg);
         case "string":
            return String(arg);
         case "boolean":
            return arg != true?0:"1";
         default:
            return "";
      }
   }
   static function parse(text)
   {
      var _loc2_ = undefined;
      if(text == "")
      {
         return null;
      }
      if(text.indexOf("\n",0) != -1)
      {
         _loc2_ = text.split("\n");
         if(_loc2_[_loc2_.length - 1] == "")
         {
            _loc2_.pop();
         }
         if(_loc2_.length == 2 && _loc2_[0] == null && _loc2_[1] == null)
         {
            return null;
         }
         var _loc1_ = 0;
         while(_loc1_ < _loc2_.length)
         {
            if(String(_loc2_[_loc1_]).indexOf("\t",0) != -1)
            {
               _loc2_[_loc1_] = String(_loc2_[_loc1_]).split("\t");
               if(_loc2_[_loc1_][_loc2_[_loc1_].length - 1] == "")
               {
                  _loc2_[_loc1_].pop();
               }
            }
            _loc1_ = _loc1_ + 1;
         }
      }
      else if(text.indexOf("\t",0) != -1)
      {
         _loc2_ = text.split("\t");
         if(_loc2_[_loc2_.length - 1] == "")
         {
            _loc2_.pop();
         }
      }
      if(_loc2_ == null)
      {
         _loc2_ = [text];
      }
      return _loc2_;
   }
}
