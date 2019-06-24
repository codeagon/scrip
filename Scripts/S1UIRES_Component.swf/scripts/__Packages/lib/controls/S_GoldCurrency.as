class lib.controls.S_GoldCurrency extends MovieClip
{
   static var test = "test!!!!!!!!!!!!!!!!!!!!";
   var gold_num = 0;
   var silver_num = 0;
   var bronze_num = 0;
   var right_position = -17;
   function S_GoldCurrency()
   {
      super();
      this._scope = this;
      this._scope.Gold_Data(0);
   }
   function gold_setdata(_gold_vas)
   {
      this.gold_vas = _gold_vas;
      this._scope.gold_mc._visible = this.gold_vas;
      this._scope.gold_txt._visible = this.gold_vas;
   }
   function silver_setdata(_silver_vars)
   {
      this.silver_vars = _silver_vars;
      this._scope.silver_mc._visible = this.silver_vars;
      this._scope.silver_txt._visible = this.silver_vars;
   }
   function bronze_setdata(_bronze_vars)
   {
      this.bronze_vars = _bronze_vars;
      this._scope.bronze_mc._visible = this.bronze_vars;
      this._scope.bronze_txt._visible = this.bronze_vars;
   }
   function Gold_Data(_data)
   {
      this._money = Number(_data);
      var _loc5_ = this._money;
      var _loc2_ = undefined;
      var _loc6_ = undefined;
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      _loc2_ = int(_loc5_ / 10000);
      _loc6_ = _loc5_ % 10000;
      _loc4_ = int(_loc6_ / 100);
      _loc3_ = _loc6_ % 100;
      if(_loc2_ > 0)
      {
         this.gold_setdata(true);
         this.gold_num = _loc2_;
         var _loc7_ = lib.util.CurrencyFormat.makeComma(this.gold_num);
         this._scope.gold_txt.htmlText = _loc7_;
         this._scope.gold_txt.autoSize = true;
      }
      else
      {
         this.gold_setdata(false);
      }
      if(_loc4_ > 0)
      {
         this.silver_setdata(true);
         this.silver_num = _loc4_;
         this._scope.silver_txt.htmlText = this.silver_num;
         this._scope.silver_txt.autoSize = true;
      }
      else
      {
         this.silver_setdata(false);
      }
      if(_loc3_ > 0)
      {
         this.bronze_setdata(true);
         this.bronze_num = _loc3_;
         this._scope.bronze_txt.htmlText = this.bronze_num;
         this._scope.bronze_txt.autoSize = true;
      }
      else
      {
         this.bronze_setdata(false);
      }
      this.Gold_Interaction();
   }
   function Gold_Interaction()
   {
      if(this.gold_vas == true && this.silver_vars == true && this.bronze_vars == true)
      {
         this._scope.bronze_mc._x = this.right_position;
         this._scope.bronze_txt._x = this._scope.bronze_mc._x - this._scope.bronze_txt._width;
         this._scope.silver_mc._x = this._scope.bronze_txt._x - this._scope.silver_mc._width;
         this._scope.silver_txt._x = this._scope.silver_mc._x - this._scope.silver_txt._width;
         this._scope.gold_mc._x = this._scope.silver_txt._x - this._scope.gold_mc._width;
         this._scope.gold_txt._x = this._scope.gold_mc._x - this._scope.gold_txt._width;
         this._scope.bg._width = - this._scope.gold_txt._x - 10;
      }
      else if(this.gold_vas == true && this.silver_vars == true && this.bronze_vars == false)
      {
         this._scope.silver_mc._x = this.right_position;
         this._scope.silver_txt._x = this._scope.silver_mc._x - this._scope.silver_txt._width;
         this._scope.gold_mc._x = this._scope.silver_txt._x - this._scope.gold_mc._width;
         this._scope.gold_txt._x = this._scope.gold_mc._x - this._scope.gold_txt._width;
         this._scope.bg._width = - this._scope.gold_txt._x - 10;
      }
      else if(this.gold_vas == false && this.silver_vars == true && this.bronze_vars == false)
      {
         this._scope.silver_mc._x = this.right_position;
         this._scope.silver_txt._x = this._scope.silver_mc._x - this._scope.silver_txt._width;
         this._scope.bg._width = - this._scope.silver_txt._x - 10;
      }
      else if(this.gold_vas == true && this.silver_vars == false && this.bronze_vars == false)
      {
         this._scope.gold_mc._x = this.right_position;
         this._scope.gold_txt._x = this._scope.gold_mc._x - this._scope.gold_txt._width;
         this._scope.bg._width = - this._scope.gold_txt._x - 10;
      }
      else if(this.gold_vas == true && this.silver_vars == false && this.bronze_vars == true)
      {
         this._scope.bronze_mc._x = this.right_position;
         this._scope.bronze_txt._x = this._scope.bronze_mc._x - this._scope.bronze_txt._width;
         this._scope.gold_mc._x = this._scope.bronze_txt._x - this._scope.gold_mc._width;
         this._scope.gold_txt._x = this._scope.gold_mc._x - this._scope.gold_txt._width;
         this._scope.bg._width = - this._scope.gold_txt._x - 10;
      }
      else if(this.gold_vas == false && this.silver_vars == true && this.bronze_vars == true)
      {
         this._scope.bronze_mc._x = this.right_position;
         this._scope.bronze_txt._x = this._scope.bronze_mc._x - this._scope.bronze_txt._width;
         this._scope.silver_mc._x = this._scope.bronze_txt._x - this._scope.silver_mc._width;
         this._scope.silver_txt._x = this._scope.silver_mc._x - this._scope.silver_txt._width;
         this._scope.bg._width = - this._scope.silver_txt._x - 10;
      }
      else if(this.gold_vas == false && this.silver_vars == false && this.bronze_vars == true)
      {
         this._scope.bronze_mc._x = this.right_position;
         this._scope.bronze_txt._x = this._scope.bronze_mc._x - this._scope.bronze_txt._width;
         this._scope.bg._width = - this._scope.bronze_txt._x - 10;
      }
      else
      {
         this._scope.bg._width = 0;
      }
   }
   function set_distplay()
   {
      var _loc2_ = new TextFormat();
      var _loc4_ = new TextFormat();
      var _loc3_ = new TextFormat();
      this._scope.gold_txt.setTextFormat(_loc2_);
      this._scope.silver_txt.setTextFormat(_loc4_);
      this._scope.bronze_txt.setTextFormat(_loc3_);
      if(this.gold_num > 100000)
      {
         if(this.gold_vas == true && this.silver_vars == true && this.bronze_vars == true)
         {
            if(_loc2_.size != 12 || _loc4_.size != 12 || _loc3_.size != 12)
            {
               _loc2_.size = 12;
               _loc4_.size = 12;
               _loc3_.size = 12;
               this.Gold_Interaction();
            }
         }
      }
      else if(this.gold_vas == true && this.silver_vars == true && this.bronze_vars == true)
      {
         if(_loc2_.size != 14 || _loc4_.size != 14 || _loc3_.size != 14)
         {
            _loc2_.size = 14;
            _loc4_.size = 14;
            _loc3_.size = 14;
            this.Gold_Interaction();
         }
      }
   }
}
