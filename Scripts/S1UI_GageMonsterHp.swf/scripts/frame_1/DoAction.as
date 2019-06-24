function OnGame_Gage_SetMonsterHp(hp, _show, target, debuff, smallType, colorType)
{
   if(Number(_show))
   {
      if(Number(target) == 1 && Number(debuff))
      {
         if(smallType == "1")
         {
            smallTypeMc.hpMc.barMc.gotoAndStop(4);
         }
         else
         {
            Hp_Bar.gotoAndStop("t3");
         }
      }
      else if(smallType == "1")
      {
         smallTypeMc.hpMc.barMc.gotoAndStop(Number(target) + 1);
      }
      else
      {
         Hp_Bar.gotoAndStop("t" + Number(target));
      }
      if(hp < 2 && hp > 0)
      {
         hp = 2;
      }
      if(repairMode)
      {
         gageMotion(hp);
         Hp_Bar._visible = false;
         smallTypeMc._visible = false;
         repairTypeMc._visible = true;
      }
      else
      {
         Hp_Bar._visible = smallType != "1";
         smallTypeMc._visible = smallType == "1";
         repairTypeMc._visible = false;
         if(smallType == "1")
         {
            smallTypeMc.hpMc.barMc._xscale = hp;
         }
         else
         {
            Hp_Bar.Hp_Bar3._xscale = hp;
         }
      }
   }
   else if(!repairMode)
   {
      Hp_Bar._visible = false;
   }
   isSmallType = smallType == "1";
}
function OnGame_Gage_SetClass(_class)
{
   class_name = _class;
   if(class_name == "1" || class_name == "3")
   {
      St_Bar._visible = true;
   }
   else
   {
      St_Bar._visible = false;
   }
}
function OnGame_Gage_SetST(st, maxSt, maxStAdd)
{
   var _loc4_ = Number(st);
   var _loc1_ = Number(maxSt);
   var _loc2_ = Number(maxStAdd);
   var _loc3_ = _loc1_ + _loc2_;
   St_Bar.St_bg._width = _loc4_ / _loc3_ * 172;
   if(St_Bar.St_bg._width > 172)
   {
      St_Bar.St_bg._width = 172;
   }
}
function OnGame_Gage_SetStack(flag, StackNum, switchs, StackMax)
{
   if(flag == "1")
   {
      Stack_Bar._visible = isSmallType != "1";
   }
   else
   {
      Stack_Bar._visible = false;
   }
   if(switchs == "1")
   {
      Stack_Bar.Stack_Bar.gotoAndStop(1);
   }
   else
   {
      Stack_Bar.Stack_Bar.gotoAndPlay(2);
   }
   if(StackMax == 7)
   {
      Stack_Bar.Stack_Bar.bg.gotoAndStop(2);
      Stack_Bar.Stack_Bar.gage_stack_bg.gotoAndStop(2);
      Stack_Bar.Stack_Bar.gage_stac_mc.gotoAndStop(2);
   }
   else
   {
      Stack_Bar.Stack_Bar.bg.gotoAndStop(1);
      Stack_Bar.Stack_Bar.gage_stack_bg.gotoAndStop(1);
      Stack_Bar.Stack_Bar.gage_stac_mc.gotoAndStop(1);
   }
   Stack_Bar.Stack_Bar.gage_stack_mask._width = StackNum / StackMax * STMASKW;
   if(StackNum > 0)
   {
      var _loc1_ = 0;
      while(_loc1_ < StackMax)
      {
         Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_1._visible = false;
         if(StackNum == StackMax)
         {
            Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_2._visible = false;
            Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_3._visible = true;
         }
         else
         {
            Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_2._visible = true;
            Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_3._visible = false;
         }
         _loc1_ = _loc1_ + 1;
      }
   }
   else
   {
      _loc1_ = 0;
      while(_loc1_ < StackMax)
      {
         Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_1._visible = true;
         Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_2._visible = false;
         Stack_Bar.Stack_Bar.gage_stac_mc["bar" + _loc1_].stack_bg_3._visible = false;
         _loc1_ = _loc1_ + 1;
      }
   }
   Stack_Bar.Stack_Bar.txt.text = StackNum;
   if(0 < StackMax && StackNum == StackMax)
   {
      Stack_Bar.Stack_Bar.gage_stack_bg._alpha = 100;
      Hp_Bar.redBgMc._alpha = 100;
   }
   else
   {
      Stack_Bar.Stack_Bar.gage_stack_bg._alpha = 0;
      Hp_Bar.redBgMc._alpha = 0;
   }
}
function OnGame_Gage_RepairCount(min, max)
{
   if(max == "0")
   {
      repairTypeMc.countIcon._visible = false;
   }
   else
   {
      repairTypeMc.countIcon._visible = true;
      repairTypeMc.countIcon.gotoAndStop(Number(min) + 1);
   }
}
function OnGame_Gage_SetRepairMode(bool)
{
   repairMode = Boolean(Number(bool));
   delete rapairMc.onEnterFrame;
   if(repairMode)
   {
      Hp_Bar._visible = false;
      smallTypeMc._visible = false;
      repairTypeMc._visible = true;
      rapairMc._xscale = 0.01;
   }
   else
   {
      Hp_Bar._visible = smallType != "1";
      smallTypeMc._visible = smallType == "1";
      repairTypeMc._visible = false;
   }
}
function gageMotion(sc)
{
   sc = Number(sc);
   delete rapairMc.onEnterFrame;
   if(prevData == sc)
   {
      rapairMc._xscale = sc;
      return undefined;
   }
   prevData = sc;
   rapairMc.onEnterFrame = function()
   {
      this._xscale = this._xscale + barSpeed * (sc - this._xscale);
      if(Math.abs(this._xscale - sc) <= 0.1)
      {
         this._xscale = sc;
         delete this.onEnterFrame;
      }
   };
}
_global.gfxExtensions = true;
var class_name = "---";
Stack_Bar._xscale = 100;
Stack_Bar._yscale = 82;
Stack_Bar._visible = false;
Stack_Bar.gotoAndStop(1);
Stack_Bar.Stack_Bar.gotoAndStop(1);
var isSmallType = false;
var STMASKW = Stack_Bar.Stack_Bar.gage_stack_mask._width;
var SMSTBW = smallTypeMc.stackMc.barMc._width;
var rspeed = 0.7;
Hp_Bar.redBgMc._alpha = 0;
Stack_Bar.Stack_Bar.gage_stack_bg._alpha = 0;
var barTX = -1;
var barSpeed = 0.7;
var repairMode = false;
repairTypeMc._visible = false;
var rapairMc = repairTypeMc.barMc;
var prevData = 0;
