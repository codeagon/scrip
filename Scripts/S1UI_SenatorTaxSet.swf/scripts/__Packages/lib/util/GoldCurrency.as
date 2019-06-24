class lib.util.GoldCurrency
{
   static var test = "test!!!!!!!!!!!!!!!!!!!!";
   function GoldCurrency()
   {
   }
   static function SetGoldText(num1, flag, size)
   {
      var _loc2_ = "";
      var _loc9_ = Number(num1);
      var _loc5_ = undefined;
      var _loc10_ = undefined;
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      _loc5_ = int(_loc9_ / 10000);
      _loc10_ = _loc9_ % 10000;
      _loc4_ = int(_loc10_ / 100);
      _loc3_ = _loc10_ % 100;
      if(_loc5_ > 0 && _loc4_ <= 0 && _loc3_ <= 0)
      {
         lib.Debuger.trace("1\t0\t0");
         var _loc11_ = _loc5_;
         var _loc12_ = lib.util.CurrencyFormat.makeComma(_loc11_);
         var _loc8_ = _loc4_;
         var _loc7_ = _loc3_;
         _loc8_ = "00";
         _loc7_ = "00";
         if(flag == 1)
         {
            _loc2_ = "<font color=\'#ffb033\'>" + _loc12_ + "</font>" + "<img src=\'Gold_largetoken\' vspace=\'-4\'>" + "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_largetoken\' vspace=\'-4\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'#ffb033\'>" + _loc12_ + "</font>" + "<img src=\'Gold_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'#ffb033\'>" + _loc12_ + "</font>" + "<img src=\'Gold_smalltoken\' vspace=\'-1\'>" + "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_smalltoken\' vspace=\'-1\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc5_ > 0 && _loc4_ > 0 && _loc3_ <= 0)
      {
         lib.Debuger.trace("1\t1\t0");
         _loc11_ = _loc5_;
         _loc12_ = lib.util.CurrencyFormat.makeComma(_loc11_);
         if(_loc4_ < 10)
         {
            _loc8_ = "0" + _loc4_;
         }
         else
         {
            _loc8_ = _loc4_;
         }
         _loc7_ = _loc3_;
         _loc7_ = "00";
         if(flag == 1)
         {
            _loc2_ = "<font color=\'#ffb033\'>" + _loc12_ + "</font>" + "<img src=\'Gold_largetoken\' vspace=\'-4\'>" + "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_largetoken\' vspace=\'-4\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'#ffb033\'>" + _loc12_ + "</font>" + "<img src=\'Gold_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'#ffb033\'>" + _loc12_ + "</font>" + "<img src=\'Gold_smalltoken\' vspace=\'-1\'>" + "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_smalltoken\' vspace=\'-1\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc5_ > 0 && _loc4_ > 0 && _loc3_ > 0)
      {
         lib.Debuger.trace("1\t1\t1");
         _loc11_ = _loc5_;
         _loc12_ = lib.util.CurrencyFormat.makeComma(_loc11_);
         if(_loc4_ < 10)
         {
            _loc8_ = "0" + _loc4_;
         }
         else
         {
            _loc8_ = _loc4_;
         }
         if(_loc3_ < 10)
         {
            _loc7_ = "0" + _loc3_;
         }
         else
         {
            _loc7_ = _loc3_;
         }
         if(flag == 1)
         {
            _loc2_ = "<font color=\'#ffb033\'>" + _loc12_ + "</font>" + "<img src=\'Gold_largetoken\' vspace=\'-4\'>" + "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_largetoken\' vspace=\'-4\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'#ffb033\'>" + _loc12_ + "</font>" + "<img src=\'Gold_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'#ffb033\'>" + _loc12_ + "</font>" + "<img src=\'Gold_smalltoken\' vspace=\'-1\'>" + "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_smalltoken\' vspace=\'-1\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc5_ > 0 && _loc4_ <= 0 && _loc3_ > 0)
      {
         lib.Debuger.trace("1\t0\t1");
         _loc11_ = _loc5_;
         _loc12_ = lib.util.CurrencyFormat.makeComma(_loc11_);
         _loc8_ = _loc4_;
         _loc8_ = "00";
         if(_loc3_ < 10)
         {
            _loc7_ = "0" + _loc3_;
         }
         else
         {
            _loc7_ = _loc3_;
         }
         if(flag == 1)
         {
            _loc2_ = "<font color=\'#ffb033\'>" + _loc12_ + "</font>" + "<img src=\'Gold_largetoken\' vspace=\'-4\'>" + "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_largetoken\' vspace=\'-4\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'#ffb033\'>" + _loc12_ + "</font>" + "<img src=\'Gold_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'#ffb033\'>" + _loc12_ + "</font>" + "<img src=\'Gold_smalltoken\' vspace=\'-1\'>" + "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_smalltoken\' vspace=\'-1\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc5_ <= 0 && _loc4_ > 0 && _loc3_ > 0)
      {
         lib.Debuger.trace("0\t1\t1");
         _loc11_ = _loc5_;
         _loc12_ = lib.util.CurrencyFormat.makeComma(_loc11_);
         _loc8_ = _loc4_;
         if(_loc3_ < 10)
         {
            _loc7_ = "0" + _loc3_;
         }
         else
         {
            _loc7_ = _loc3_;
         }
         if(flag == 1)
         {
            _loc2_ = "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_largetoken\' vspace=\'-4\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else
         {
            _loc2_ = "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_smalltoken\' vspace=\'-1\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc5_ <= 0 && _loc4_ <= 0 && _loc3_ > 0)
      {
         lib.Debuger.trace("0\t0\t1");
         _loc11_ = _loc5_;
         _loc12_ = lib.util.CurrencyFormat.makeComma(_loc11_);
         _loc8_ = _loc4_;
         _loc7_ = _loc3_;
         if(flag == 1)
         {
            _loc2_ = "<font color=\'#c87551\'>" + _loc7_ + "</font" > NaN;
         }
         else
         {
            _loc2_ = "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      else if(_loc5_ <= 0 && _loc4_ > 0 && _loc3_ <= 0)
      {
         lib.Debuger.trace("0\t1\t0");
         _loc11_ = _loc5_;
         _loc12_ = lib.util.CurrencyFormat.makeComma(_loc11_);
         _loc8_ = _loc4_;
         _loc7_ = _loc3_;
         _loc7_ = "00";
         if(flag == 1)
         {
            _loc2_ = "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_largetoken\' vspace=\'-4\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_largetoken\' vspace=\'-4\'>";
         }
         else if(size > 1)
         {
            _loc2_ = "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_smalltoken\' width=\'" + size + "\' height=\'" + size + "\' vspace=\'-1\'>";
         }
         else
         {
            _loc2_ = "<font color=\'#d7d7d7\'>" + _loc8_ + "</font>" + "<img src=\'Silver_smalltoken\' vspace=\'-1\'>" + "<font color=\'#c87551\'>" + _loc7_ + "</font>" + "<img src=\'Copper_smalltoken\' vspace=\'-1\'>";
         }
      }
      return _loc2_;
   }
}
