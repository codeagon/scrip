class lib.util.GoldCurrency
{
   static var test = "test!!!!!!!!!!!!!!!!!!!!";
   function GoldCurrency()
   {
   }
   static function SetGoldText(num1, flag, size, positive)
   {
      var _loc2_ = "";
      var _loc8_ = "#ffb033";
      var _loc6_ = "#d7d7d7";
      var _loc3_ = "#c87551";
      if(positive == "-1")
      {
         _loc8_ = "#C00005";
         _loc6_ = "#C00005";
         _loc3_ = "#C00005";
      }
      var _loc11_ = Number(num1);
      var _loc7_ = undefined;
      var _loc12_ = undefined;
      var _loc5_ = undefined;
      var _loc4_ = undefined;
      _loc7_ = Number(Math.floor(_loc11_ / 10000));
      _loc12_ = _loc11_ % 10000;
      _loc5_ = Number(Math.floor(_loc12_ / 100));
      _loc4_ = _loc12_ % 100;
      if(_loc7_ > 0 && _loc5_ <= 0 && _loc4_ <= 0)
      {
         var _loc13_ = _loc7_;
         var _loc15_ = lib.util.CurrencyFormat.makeComma(_loc13_);
         var _loc14_ = _loc5_;
         var _loc10_ = _loc4_;
         _loc14_ = "00";
         _loc10_ = "00";
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc8_ + "\'>" + _loc15_ + "</font>" + "<img src=\'Gold_largetoken\' vspace=\'-4\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_largetoken\' vspace=\'-4\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'" + _loc8_ + "\'>" + _loc15_ + "</font>" + "<img src=\'Gold_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc8_ + "\'>" + _loc15_ + "</font>" + "<img src=\'Gold_smalltoken\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_smalltoken\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ > 0 && _loc5_ > 0 && _loc4_ <= 0)
      {
         _loc13_ = _loc7_;
         _loc15_ = lib.util.CurrencyFormat.makeComma(_loc13_);
         if(_loc5_ < 10)
         {
            _loc14_ = "0" + _loc5_;
         }
         else
         {
            _loc14_ = _loc5_;
         }
         _loc10_ = _loc4_;
         _loc10_ = "00";
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc8_ + "\'>" + _loc15_ + "</font>" + "<img src=\'Gold_largetoken\' vspace=\'-4\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_largetoken\' vspace=\'-4\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'" + _loc8_ + "\'>" + _loc15_ + "</font>" + "<img src=\'Gold_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc8_ + "\'>" + _loc15_ + "</font>" + "<img src=\'Gold_smalltoken\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_smalltoken\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ > 0 && _loc5_ > 0 && _loc4_ > 0)
      {
         _loc13_ = _loc7_;
         _loc15_ = lib.util.CurrencyFormat.makeComma(_loc13_);
         if(_loc5_ < 10)
         {
            _loc14_ = "0" + _loc5_;
         }
         else
         {
            _loc14_ = _loc5_;
         }
         if(_loc4_ < 10)
         {
            _loc10_ = "0" + _loc4_;
         }
         else
         {
            _loc10_ = _loc4_;
         }
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc8_ + "\'>" + _loc15_ + "</font>" + "<img src=\'Gold_largetoken\' vspace=\'-4\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_largetoken\' vspace=\'-4\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'" + _loc8_ + "\'>" + _loc15_ + "</font>" + "<img src=\'Gold_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc8_ + "\'>" + _loc15_ + "</font>" + "<img src=\'Gold_smalltoken\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_smalltoken\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ > 0 && _loc5_ <= 0 && _loc4_ > 0)
      {
         _loc13_ = _loc7_;
         _loc15_ = lib.util.CurrencyFormat.makeComma(_loc13_);
         _loc14_ = _loc5_;
         _loc14_ = "00";
         if(_loc4_ < 10)
         {
            _loc10_ = "0" + _loc4_;
         }
         else
         {
            _loc10_ = _loc4_;
         }
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc8_ + "\'>" + _loc15_ + "</font>" + "<img src=\'Gold_largetoken\' vspace=\'-4\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_largetoken\' vspace=\'-4\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'" + _loc8_ + "\'>" + _loc15_ + "</font>" + "<img src=\'Gold_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc8_ + "\'>" + _loc15_ + "</font>" + "<img src=\'Gold_smalltoken\' vspace=\'-1\'>" + "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_smalltoken\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ <= 0 && _loc5_ > 0 && _loc4_ > 0)
      {
         _loc13_ = _loc7_;
         _loc15_ = lib.util.CurrencyFormat.makeComma(_loc13_);
         _loc14_ = _loc5_;
         if(_loc4_ < 10)
         {
            _loc10_ = "0" + _loc4_;
         }
         else
         {
            _loc10_ = _loc4_;
         }
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_largetoken\' vspace=\'-4\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_smalltoken\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ <= 0 && _loc5_ <= 0 && _loc4_ > 0)
      {
         _loc13_ = _loc7_;
         _loc15_ = lib.util.CurrencyFormat.makeComma(_loc13_);
         _loc14_ = _loc5_;
         _loc10_ = _loc4_;
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font" > NaN;
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ <= 0 && _loc5_ > 0 && _loc4_ <= 0)
      {
         lib.Debuger.trace("0\t1\t0");
         _loc13_ = _loc7_;
         _loc15_ = lib.util.CurrencyFormat.makeComma(_loc13_);
         _loc14_ = _loc5_;
         _loc10_ = _loc4_;
         _loc10_ = "00";
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_largetoken\' vspace=\'-4\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc6_ + "\'>" + _loc14_ + "</font>" + "<img src=\'Silver_smalltoken\' vspace=\'-1\'>" + "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc7_ <= 0 && _loc5_ <= 0 && _loc4_ <= 0)
      {
         _loc13_ = _loc7_;
         _loc15_ = lib.util.CurrencyFormat.makeComma(_loc13_);
         _loc14_ = _loc5_;
         _loc10_ = _loc4_;
         _loc10_ = "0";
         if(flag == 1)
         {
            _loc2_ = "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font" > NaN;
         }
         else
         {
            _loc2_ = "<font color=\'" + _loc3_ + "\'>" + _loc10_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
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
