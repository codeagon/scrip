class lib.util.GoldCurrency
{
   static var test = "test!!!!!!!!!!!!!!!!!!!!";
   function GoldCurrency()
   {
   }
   static function SetGoldText(num1, flag)
   {
      var _loc1_ = "";
      var _loc7_ = Number(num1);
      var _loc2_ = undefined;
      var _loc8_ = undefined;
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      _loc2_ = int(_loc7_ / 10000);
      _loc8_ = _loc7_ % 10000;
      _loc4_ = int(_loc8_ / 100);
      _loc3_ = _loc8_ % 100;
      if(_loc2_ > 0 && _loc4_ <= 0 && _loc3_ <= 0)
      {
         lib.Debuger.trace("1\t0\t0");
         var _loc9_ = _loc2_;
         var _loc11_ = lib.util.CurrencyFormat.makeComma(_loc9_);
         var _loc6_ = _loc4_;
         var _loc10_ = _loc3_;
         if(flag == "1")
         {
            _loc1_ = _loc11_ + " <img src=\'Gold_largetoken\' vspace=\'-4\'>";
         }
         else
         {
            _loc1_ = _loc11_ + " <img src=\'Gold_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc2_ > 0 && _loc4_ > 0 && _loc3_ <= 0)
      {
         lib.Debuger.trace("1\t1\t0");
         _loc9_ = _loc2_;
         _loc11_ = lib.util.CurrencyFormat.makeComma(_loc9_);
         _loc6_ = _loc4_;
         _loc10_ = _loc3_;
         if(flag == 1)
         {
            _loc1_ = _loc11_ + " <img src=\'Gold_largetoken\' vspace=\'-4\'>" + _loc6_ + "<img src=\'Silver_largetoken\' vspace=\'-4\'>";
         }
         else
         {
            _loc1_ = _loc11_ + " <img src=\'Gold_smalltoken\' vspace=\'-1\'>" + _loc6_ + "<img src=\'Silver_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc2_ > 0 && _loc4_ > 0 && _loc3_ > 0)
      {
         lib.Debuger.trace("1\t1\t1");
         _loc9_ = _loc2_;
         _loc11_ = lib.util.CurrencyFormat.makeComma(_loc9_);
         _loc6_ = _loc4_;
         _loc10_ = _loc3_;
         if(flag == 1)
         {
            _loc1_ = _loc11_ + " <img src=\'Gold_largetoken\' vspace=\'-4\'>" + _loc6_ + " <img src=\'Silver_largetoken\' vspace=\'-4\'>" + _loc10_ + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else
         {
            _loc1_ = _loc11_ + " <img src=\'Gold_smalltoken\' vspace=\'-1\'>" + _loc6_ + " <img src=\'Silver_smalltoken\' vspace=\'-1\'>" + _loc10_ + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc2_ > 0 && _loc4_ <= 0 && _loc3_ > 0)
      {
         lib.Debuger.trace("1\t0\t1");
         _loc9_ = _loc2_;
         _loc11_ = lib.util.CurrencyFormat.makeComma(_loc9_);
         _loc6_ = _loc4_;
         _loc10_ = _loc3_;
         if(flag == 1)
         {
            _loc1_ = _loc11_ + " <img src=\'Gold_largetoken\' vspace=\'-4\'>" + _loc10_ + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else
         {
            _loc1_ = _loc11_ + " <img src=\'Gold_smalltoken\' vspace=\'-1\'>" + _loc10_ + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc2_ <= 0 && _loc4_ > 0 && _loc3_ > 0)
      {
         lib.Debuger.trace("0\t1\t1");
         _loc9_ = _loc2_;
         _loc11_ = lib.util.CurrencyFormat.makeComma(_loc9_);
         _loc6_ = _loc4_;
         _loc10_ = _loc3_;
         if(flag == 1)
         {
            _loc1_ = _loc6_ + " <img src=\'Silver_largetoken\' vspace=\'-4\'>" + _loc10_ + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else
         {
            _loc1_ = _loc6_ + " <img src=\'Silver_smalltoken\' vspace=\'-1\'>" + _loc10_ + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc2_ <= 0 && _loc4_ <= 0 && _loc3_ > 0)
      {
         lib.Debuger.trace("0\t0\t1");
         _loc9_ = _loc2_;
         _loc11_ = lib.util.CurrencyFormat.makeComma(_loc9_);
         _loc6_ = _loc4_;
         _loc10_ = _loc3_;
         if(flag == 1)
         {
            _loc1_ = _loc10_ + " <img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else
         {
            _loc1_ = _loc10_ + " <img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc2_ <= 0 && _loc4_ > 0 && _loc3_ <= 0)
      {
         lib.Debuger.trace("0\t1\t0");
         _loc9_ = _loc2_;
         _loc11_ = lib.util.CurrencyFormat.makeComma(_loc9_);
         _loc6_ = _loc4_;
         _loc10_ = _loc3_;
         if(flag == 1)
         {
            _loc1_ = _loc6_ + " <img src=\'Silver_largetoken\' vspace=\'-1\'>";
         }
         else
         {
            _loc1_ = _loc6_ + " <img src=\'Silver_smalltoken\' vspace=\'-1\'>";
         }
      }
      return _loc1_;
   }
}
