class lib.controls.S_GoldCurrencyInputByAVG extends MovieClip
{
   static var test = "test!!!!!!!!!!!!!!!!!!!!";
   var gold_nums = 0;
   var silver_nums = 0;
   var bronze_nums = 0;
   var total_nums = 0;
   var gold_setnum = 10000;
   var silver_setnum = 100;
   var _min = 1;
   var _max = 99900000000;
   var _avg = 0;
   var _registeredMin = 0;
   function S_GoldCurrencyInputByAVG()
   {
      super();
      this._scope = this;
      var targetmc = this._scope;
      this._txt0_txt = new lib.util.ExtTextField(this._scope._txt0,1,this._scope._txt0_focus);
      this._txt1_txt = new lib.util.ExtTextField(this._scope._txt1,1,this._scope._txt1_focus);
      this._txt2_txt = new lib.util.ExtTextField(this._scope._txt2,1,this._scope._txt2_focus);
      this._txt0_txt.textField.text = this.gold_nums;
      this._txt1_txt.textField.text = this.silver_nums;
      this._txt2_txt.textField.text = this.bronze_nums;
      this._txt0_txt.useAciveColor = false;
      this._txt1_txt.useAciveColor = false;
      this._txt2_txt.useAciveColor = false;
      this._txt0_txt.textField.textColor = 16756787;
      this._txt1_txt.textField.textColor = 14145495;
      this._txt2_txt.textField.textColor = 13137233;
      this._txt0_txt.onChanged = function(changed)
      {
         targetmc.gold_nums = this.noexceptComma_Num;
         targetmc.GoldCurrencyInputTotal();
         if(targetmc.gold_setnum * this.noexceptComma_Num > targetmc._max)
         {
            targetmc.gold_nums = this.noexceptComma_Num;
            targetmc.GoldCurrencyInputTotal();
         }
      };
      this._txt0_txt.onEnterKey = function()
      {
         Selection.setFocus(targetmc._txt1);
      };
      this._txt0_txt.onKillFocusEvent = function()
      {
      };
      this._txt1_txt.onChanged = function(changed)
      {
         targetmc.silver_nums = this.noexceptComma_Num;
         targetmc.GoldCurrencyInputTotal();
      };
      this._txt1_txt.onEnterKey = function()
      {
         Selection.setFocus(targetmc._txt2);
      };
      this._txt1_txt.onKillFocusEvent = function()
      {
      };
      this._txt2_txt.onChanged = function(changed)
      {
         targetmc.bronze_nums = this.noexceptComma_Num;
         targetmc.GoldCurrencyInputTotal();
      };
      this._txt2_txt.onEnterKey = function()
      {
         Selection.setFocus(targetmc._txt3);
      };
      this._txt2_txt.onKillFocusEvent = function()
      {
      };
      this.GoldCurrencyBtn();
      _global.EventBroadCaster.addListener(targetmc);
   }
   function setGoldType(type)
   {
      lib.Debuger.trace("setGoldType S_GoldCurrencyInput");
      type = type + 1;
      this._scope.goldIcon.gotoAndStop(type);
      this._scope.silverIcon.gotoAndStop(type);
      this._scope.copperIcon.gotoAndStop(type);
   }
   function GoldCurrencyInputSingle(num1)
   {
      var _loc5_ = Number(num1);
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
         this.gold_nums = _loc2_;
         this._txt0_txt.textField.text = lib.util.CurrencyFormat.makeComma(this.gold_nums);
      }
      else
      {
         this.gold_nums = 0;
         this._txt0_txt.textField.text = this.gold_nums;
      }
      if(_loc4_ > 0)
      {
         this.silver_nums = _loc4_;
         this._txt1_txt.textField.text = this.silver_nums;
         if(this.silver_nums < 10)
         {
            this._txt1_txt.textField.text = "0" + this.silver_nums;
         }
      }
      else
      {
         this.silver_nums = 0;
         this._txt1_txt.textField.text = "0" + this.silver_nums;
      }
      if(_loc3_ > 0)
      {
         this.bronze_nums = _loc3_;
         this._txt2_txt.textField.text = this.bronze_nums;
         if(this.bronze_nums < 10)
         {
            this._txt2_txt.textField.text = "0" + this.bronze_nums;
         }
      }
      else
      {
         this.bronze_nums = 0;
         this._txt2_txt.textField.text = "0" + this.bronze_nums;
      }
      this.GoldCurrencyInputTotal();
   }
   function GoldCurrencyInputTotal()
   {
      if(this.gold_nums != NaN && this.gold_nums != "" && this.gold_nums != undefined && this.silver_nums != NaN && this.silver_nums != "" && this.silver_nums != undefined && this.bronze_nums != NaN && this.bronze_nums != "" && this.bronze_nums != undefined)
      {
         this.total_nums = Number(this.gold_nums * this.gold_setnum) + Number(this.silver_nums * this.silver_setnum) + Number(this.bronze_nums);
      }
      else if(this.gold_nums == undefined && this.silver_nums != NaN && this.silver_nums != "" && this.silver_nums != undefined && this.bronze_nums != NaN && this.bronze_nums != "" && this.bronze_nums != undefined)
      {
         this.total_nums = Number(this.silver_nums * this.silver_setnum) + Number(this.bronze_nums);
      }
      else if(this.gold_nums != NaN && this.gold_nums != "" && this.gold_nums != undefined && this.silver_nums == undefined && this.bronze_nums != NaN && this.bronze_nums != "" && this.bronze_nums != undefined)
      {
         this.total_nums = Number(this.gold_nums * this.gold_setnum) + Number(this.bronze_nums);
      }
      else if(this.gold_nums != NaN && this.gold_nums != "" && this.gold_nums != undefined && this.silver_nums != NaN && this.silver_nums != "" && this.silver_nums != undefined && this.bronze_nums == undefined)
      {
         this.total_nums = Number(this.gold_nums * this.gold_setnum) + Number(this.silver_nums * this.silver_setnum);
      }
      else if(this.gold_nums == undefined && this.silver_nums == undefined && this.bronze_nums != NaN && this.bronze_nums != "" && this.bronze_nums != undefined)
      {
         this.total_nums = Number(this.bronze_nums);
      }
      else if(this.gold_nums != NaN && this.gold_nums != "" && this.gold_nums != undefined && this.silver_nums == undefined && this.bronze_nums == undefined)
      {
         this.total_nums = Number(this.gold_nums * this.gold_setnum);
      }
      else if(this.gold_nums == undefined && this.silver_nums != NaN && this.silver_nums != "" && this.silver_nums != undefined && this.bronze_nums == undefined)
      {
         this.total_nums = Number(this.silver_nums * this.silver_setnum);
      }
      this.GoldCurrencyBtn();
      if(this.total_nums > this._max && this._max >= 0)
      {
         this.GoldCurrencyInputSingle(this._max);
      }
      this._func();
   }
   function GoldCurrencyBtn()
   {
      var _loc3_ = this._avg != this.total_nums?1:4;
      _loc3_ = this._avg != 0?_loc3_:4;
      var _loc2_ = this._registeredMin != this.total_nums?1:4;
      _loc2_ = this._registeredMin != 0?_loc2_:4;
      this._scope.max_mc.gotoAndStop(_loc3_);
      this._scope.min_mc.gotoAndStop(_loc2_);
      this._scope.min_mc.onRollOver = function()
      {
         if(this._currentframe != 4)
         {
            this.gotoAndStop(2);
         }
      };
      this._scope.min_mc.onRollOut = function()
      {
         if(this._currentframe != 4)
         {
            this.gotoAndStop(1);
         }
      };
      this._scope.min_mc.onPress = function()
      {
         if(this._currentframe != 4)
         {
            this.gotoAndStop(3);
         }
      };
      this._scope.min_mc.onRelease = function()
      {
         if(this._currentframe != 4)
         {
            this.gotoAndStop(1);
            this._parent.GoldCurrencyInputSingle(this._parent._registeredMin);
         }
      };
      this._scope.max_mc.onRollOver = function()
      {
         if(this._currentframe != 4)
         {
            this.gotoAndStop(2);
         }
      };
      this._scope.max_mc.onRollOut = function()
      {
         if(this._currentframe != 4)
         {
            this.gotoAndStop(1);
         }
      };
      this._scope.max_mc.onPress = function()
      {
         if(this._currentframe != 4)
         {
            this.gotoAndStop(3);
         }
      };
      this._scope.max_mc.onRelease = function()
      {
         if(this._currentframe != 4)
         {
            this.gotoAndStop(1);
            this._parent.GoldCurrencyInputSingle(this._parent._avg);
         }
      };
   }
   function __set__min(pmin)
   {
      var _loc3_ = String(pmin).split(",");
      var _loc4_ = "";
      var _loc2_ = Number = 0;
      while((Number = 0) < _loc3_.length)
      {
         _loc4_ = _loc4_ + _loc3_[Number = 0];
         var _loc2_ = Number = 0 + 1;
      }
      this._min = Number(_loc4_);
      this.GoldCurrencyBtn();
      return this.__get__min();
   }
   function __set__max(pmax)
   {
      var _loc3_ = pmax.split(",");
      var _loc4_ = "";
      var _loc2_ = Number = 0;
      while((Number = 0) < _loc3_.length)
      {
         _loc4_ = _loc4_ + _loc3_[Number = 0];
         var _loc2_ = Number = 0 + 1;
      }
      this._max = Number(_loc4_);
      this.GoldCurrencyBtn();
      return this.__get__max();
   }
   function __set__avg(pavg)
   {
      var _loc3_ = pavg.split(",");
      var _loc4_ = "";
      var _loc2_ = Number = 0;
      while((Number = 0) < _loc3_.length)
      {
         _loc4_ = _loc4_ + _loc3_[Number = 0];
         var _loc2_ = Number = 0 + 1;
      }
      this._avg = Number(_loc4_);
      return this.__get__avg();
   }
   function __set__registeredMin(pregisteredMin)
   {
      var _loc3_ = pregisteredMin.split(",");
      var _loc4_ = "";
      var _loc2_ = Number = 0;
      while((Number = 0) < _loc3_.length)
      {
         _loc4_ = _loc4_ + _loc3_[Number = 0];
         var _loc2_ = Number = 0 + 1;
      }
      this._registeredMin = Number(_loc4_);
      return this.__get__registeredMin();
   }
   function __set__total(ptotal)
   {
      var _loc3_ = ptotal.split(",");
      var _loc4_ = "";
      var _loc2_ = Number = 0;
      while((Number = 0) < _loc3_.length)
      {
         _loc4_ = _loc4_ + _loc3_[Number = 0];
         var _loc2_ = Number = 0 + 1;
      }
      this.GoldCurrencyInputSingle(_loc4_);
      return this.__get__total();
   }
   function To_Func(func)
   {
      this._func = func;
   }
   function OnGame_MouseWheel(d)
   {
      if(Selection.getFocus() == this._txt0_txt.textField)
      {
         var _loc3_ = 0;
         _loc3_ = Number(this.gold_nums);
         var _loc4_ = Number(this._txt0_txt.text);
         if(d > 0 && _loc4_ >= 0)
         {
            _loc3_ = _loc3_ + d / 3;
         }
         else if(d < 0 && _loc4_ >= 1)
         {
            _loc3_ = _loc3_ + d / 3;
         }
         this._txt0_txt.text = _loc3_;
         this._txt0_txt.onChanged(true);
         Selection.setSelection(0,0);
      }
      else if(Selection.getFocus() == this._txt1_txt.textField)
      {
         _loc3_ = 0;
         _loc3_ = Number(this.silver_nums);
         _loc4_ = Number(this._txt1_txt.text);
         if(d > 0 && _loc4_ >= 0)
         {
            if(_loc3_ < 99)
            {
               _loc3_ = _loc3_ + d / 3;
            }
         }
         else if(d < 0 && _loc4_ >= 1)
         {
            _loc3_ = _loc3_ + d / 3;
         }
         this._txt1_txt.text = _loc3_;
         this._txt1_txt.onChanged(true);
         Selection.setSelection(0,0);
      }
      else if(Selection.getFocus() == this._txt2_txt.textField)
      {
         _loc3_ = 0;
         _loc3_ = Number(this.bronze_nums);
         _loc4_ = Number(this._txt2_txt.text);
         if(d > 0 && _loc4_ >= 0)
         {
            if(_loc3_ < 99)
            {
               _loc3_ = _loc3_ + d / 3;
            }
         }
         else if(d < 0 && _loc4_ >= 1)
         {
            _loc3_ = _loc3_ + d / 3;
         }
         this._txt2_txt.text = _loc3_;
         this._txt2_txt.onChanged(true);
         Selection.setSelection(0,0);
      }
   }
}
