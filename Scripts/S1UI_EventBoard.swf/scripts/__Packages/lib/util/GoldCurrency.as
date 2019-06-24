class lib.util.GoldCurrency
{
   static var test = "test!!!!!!!!!!!!!!!!!!!!";
   function GoldCurrency()
   {
   }
   static function SetGoldText(num1, flag, size, positive, type)
   {
      var _loc2_ = "";
      var _loc9_ = "#ffb033";
      var _loc6_ = "#d7d7d7";
      var _loc3_ = "#c87551";
      if(positive == "-1")
      {
         _loc9_ = "#C00005";
         _loc6_ = "#C00005";
         _loc3_ = "#C00005";
      }
      var _loc15_ = "Gold_largetoken";
      var _loc11_ = "Gold_smalltoken";
      var _loc13_ = "Silver_largetoken";
      var _loc10_ = "Silver_smalltoken";
      var _loc12_ = "Copper_largetoken";
      var _loc8_ = "Copper_smalltoken";
      if(type == 1)
      {
         _loc15_ = "Gold_largetoken_c";
         _loc11_ = "Gold_smalltoken_c";
         _loc13_ = "Silver_largetoken_c";
         _loc10_ = "Silver_smalltoken_c";
         _loc12_ = "Copper_largetoken_c";
         _loc8_ = "Copper_smalltoken_c";
      }
      var _loc17_ = Number(num1);
      var _loc7_ = undefined;
      var _loc18_ = undefined;
      var _loc5_ = undefined;
      var _loc4_ = undefined;
      _loc7_ = Number(Math.floor(_loc17_ / 10000));
      _loc18_ = _loc17_ % 10000;
      _loc5_ = Number(Math.floor(_loc18_ / 100));
      _loc4_ = _loc18_ % 100;
      if(_loc7_ > 0 && _loc5_ <= 0 && _loc4_ <= 0)
      {
         var _loc19_ = _loc7_;
         var _loc21_ = lib.util.CurrencyFormat.makeComma(_loc19_);
         var _loc20_ = _loc5_;
         var _loc16_ = _loc4_;
         _loc20_ = "00";
         _loc16_ = "00";
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc9_ + "\'>" + _loc21_ + "</font>" + "<img src=\'" + _loc15_ + "\' vspace=\'-4\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc13_ + "\' vspace=\'-4\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc12_ + "\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'" + _loc9_ + "\'>" + _loc21_ + "</font>" + "<img src=\'" + _loc11_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc10_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc8_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc9_ + "\'>" + _loc21_ + "</font>" + "<img src=\'" + _loc11_ + "\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc10_ + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc8_ + "\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ > 0 && _loc5_ > 0 && _loc4_ <= 0)
      {
         _loc19_ = _loc7_;
         _loc21_ = lib.util.CurrencyFormat.makeComma(_loc19_);
         if(_loc5_ < 10)
         {
            _loc20_ = "0" + _loc5_;
         }
         else
         {
            _loc20_ = _loc5_;
         }
         _loc16_ = _loc4_;
         _loc16_ = "00";
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc9_ + "\'>" + _loc21_ + "</font>" + "<img src=\'" + _loc15_ + "\' vspace=\'-4\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc13_ + "\' vspace=\'-4\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc12_ + "\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'" + _loc9_ + "\'>" + _loc21_ + "</font>" + "<img src=\'" + _loc11_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc10_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc8_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc9_ + "\'>" + _loc21_ + "</font>" + "<img src=\'" + _loc11_ + "\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc10_ + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc8_ + "\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ > 0 && _loc5_ > 0 && _loc4_ > 0)
      {
         _loc19_ = _loc7_;
         _loc21_ = lib.util.CurrencyFormat.makeComma(_loc19_);
         if(_loc5_ < 10)
         {
            _loc20_ = "0" + _loc5_;
         }
         else
         {
            _loc20_ = _loc5_;
         }
         if(_loc4_ < 10)
         {
            _loc16_ = "0" + _loc4_;
         }
         else
         {
            _loc16_ = _loc4_;
         }
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc9_ + "\'>" + _loc21_ + "</font>" + "<img src=\'" + _loc15_ + "\' vspace=\'-4\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc13_ + "\' vspace=\'-4\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc12_ + "\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'" + _loc9_ + "\'>" + _loc21_ + "</font>" + "<img src=\'" + _loc11_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc10_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc8_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc9_ + "\'>" + _loc21_ + "</font>" + "<img src=\'" + _loc11_ + "\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc10_ + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc8_ + "\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ > 0 && _loc5_ <= 0 && _loc4_ > 0)
      {
         _loc19_ = _loc7_;
         _loc21_ = lib.util.CurrencyFormat.makeComma(_loc19_);
         _loc20_ = _loc5_;
         _loc20_ = "00";
         if(_loc4_ < 10)
         {
            _loc16_ = "0" + _loc4_;
         }
         else
         {
            _loc16_ = _loc4_;
         }
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc9_ + "\'>" + _loc21_ + "</font>" + "<img src=\'" + _loc15_ + "\' vspace=\'-4\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc13_ + "\' vspace=\'-4\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc12_ + "\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'" + _loc9_ + "\'>" + _loc21_ + "</font>" + "<img src=\'" + _loc11_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc10_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc8_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc9_ + "\'>" + _loc21_ + "</font>" + "<img src=\'" + _loc11_ + "\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc10_ + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc8_ + "\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ <= 0 && _loc5_ > 0 && _loc4_ > 0)
      {
         _loc19_ = _loc7_;
         _loc21_ = lib.util.CurrencyFormat.makeComma(_loc19_);
         _loc20_ = _loc5_;
         if(_loc4_ < 10)
         {
            _loc16_ = "0" + _loc4_;
         }
         else
         {
            _loc16_ = _loc4_;
         }
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc13_ + "\' vspace=\'-4\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc12_ + "\' vspace=\'-4\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc10_ + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc8_ + "\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ <= 0 && _loc5_ <= 0 && _loc4_ > 0)
      {
         _loc19_ = _loc7_;
         _loc21_ = lib.util.CurrencyFormat.makeComma(_loc19_);
         _loc20_ = _loc5_;
         _loc16_ = _loc4_;
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font" > NaN + _loc12_ + "\' vspace=\'-4\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc8_ + "\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ <= 0 && _loc5_ > 0 && _loc4_ <= 0)
      {
         lib.Debuger.trace("0\t1\t0");
         _loc19_ = _loc7_;
         _loc21_ = lib.util.CurrencyFormat.makeComma(_loc19_);
         _loc20_ = _loc5_;
         _loc16_ = _loc4_;
         _loc16_ = "00";
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc13_ + "\' vspace=\'-4\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc12_ + "\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc10_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc8_ + "\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc6_ + "\'>" + _loc20_ + "</font>" + "<img src=\'" + _loc10_ + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc8_ + "\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ <= 0 && _loc5_ <= 0 && _loc4_ <= 0)
      {
         _loc19_ = _loc7_;
         _loc21_ = lib.util.CurrencyFormat.makeComma(_loc19_);
         _loc20_ = _loc5_;
         _loc16_ = _loc4_;
         _loc16_ = "0";
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font" > NaN + _loc12_ + "\' vspace=\'-4\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc3_ + "\'>" + _loc16_ + "</font>" + "<img src=\'" + _loc8_ + "\' vspace=\'-1\'>";
         }
      }
      return _loc2_;
   }
   static function SetTCatText(num1e, type)
   {
      var _loc1_ = "";
      var _loc2_ = "#FFC987";
      _loc1_ = "<font color=\'" + _loc2_ + "\'>" + lib.util.CurrencyFormat.makeComma(num1e) + "</font>" + "<img src=\'img://__Icon_Items.Tcat_token" + type + "\' vspace=\'-1\'>";
      return _loc1_;
   }
}
