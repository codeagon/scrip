function endCoolTime(slotMc)
{
   lib.Debuger.trace("endCoolTime   " + slotMc);
   slotMc.cool.remove();
   slotMc.CoolTime.clear();
   delete slotMc.cool;
   slotMc.Count.txt.text = "";
   slotMc.remain = slotMc.total = 0;
}
function clearCoolTime()
{
   var _loc2_ = 0;
   while(_loc2_ < LIMITCOUNT)
   {
      var _loc1_ = container_mc["listbox_" + _loc2_].slot;
      _loc1_.cool.remove();
      _loc1_.CoolTime.clear();
      delete register1.cool;
      _loc2_ = _loc2_ + 1;
   }
}
function setSkillButton(_mc, _str)
{
   var _loc2_ = _mc.btn;
   _loc2_.txt.text = _str;
   if(!_mc.dis)
   {
      _loc2_.gotoAndStop(4);
      _loc2_.txt.textColor = 7368816;
   }
   _loc2_.onPress = function()
   {
      if(!_mc.dis)
      {
         return undefined;
      }
      this.gotoAndStop(3);
      this.txt.textColor = 16777173;
   };
   _loc2_.onRelease = function()
   {
      if(!_mc.dis)
      {
         return undefined;
      }
      myListener.ToGame_UnionConsulPower_ClickSKill(_mc.sID);
      this.gotoAndStop(1);
      this.txt.textColor = 16777173;
   };
   _loc2_.onRollOver = function()
   {
      if(!_mc.dis)
      {
         return undefined;
      }
      this.gotoAndStop(2);
      this.txt.textColor = 16777215;
   };
   _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
   {
      if(!_mc.dis)
      {
         return undefined;
      }
      this.gotoAndStop(1);
      this.txt.textColor = 16777173;
   };
}
function searchIndexlList(_idx)
{
   var _loc3_ = undefined;
   var _loc1_ = listTotal;
   while(true)
   {
      _loc1_;
      if(_loc1_-- > 0)
      {
         if(_idx == skillArray[_loc1_].idx)
         {
            return _loc1_;
         }
         continue;
      }
      break;
   }
   return undefined;
}
function searchSkillList(_id)
{
   var _loc3_ = undefined;
   var _loc1_ = listTotal;
   while(true)
   {
      _loc1_;
      if(_loc1_-- > 0)
      {
         if(_id == skillArray[_loc1_].sID)
         {
            return _loc1_;
         }
         continue;
      }
      break;
   }
   return undefined;
}
var UI = this;
UI._visible = false;
var UIname = "UnionConsulPower";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var LIMITCOUNT = 4;
var listTotal = 0;
var skillArray = [];
var STR_0 = lib.util.UIString.getUIString("$471079");
var STR_1 = lib.util.UIString.getUIString("$471080");
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(function()
{
   myListener.ToGame_UnionConsulPower_CloseUI();
}
);
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(bWindowOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
         clearCoolTime();
      }
   }
};
myListener.OnGame_UnionConsulPower_SetSKillList = function(_data, _currentpage, _totalpage)
{
   skillArray = [];
   clearCoolTime();
   var _loc6_ = lib.util.ExtString.split(_data,"\n");
   listTotal = _loc6_.length;
   var _loc4_ = 0;
   while(_loc4_ < LIMITCOUNT)
   {
      var _loc1_ = container_mc["listbox_" + _loc4_];
      if(listTotal <= _loc4_)
      {
         _loc1_._visible = false;
         break;
      }
      _loc1_._visible = true;
      var _loc2_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
      _loc1_.idx = _loc2_[0];
      _loc1_.sID = _loc2_[1];
      _loc1_.name_txt.htmlText = _loc2_[3];
      _loc1_.guide_txt.htmlText = _loc2_[4];
      _loc1_.txt.verticalAlign = "center";
      var _loc3_ = _loc1_.slot;
      _loc3_.Count.txt.textAutoSize = "shrink";
      _loc3_.stat = _loc4_;
      _loc3_.img = _loc2_[2];
      _loc3_.id = _loc2_[1];
      _loc3_.draw(_loc2_[2]);
      _loc3_.drag = false;
      lib.manager.ToolTip.add(_loc3_.SLOT,_loc4_,6,_loc3_.Icon);
      var _loc5_ = STR_0 + "(" + lib.util.CurrencyFormat.makeComma(_loc2_[6]) + STR_1 + ")";
      _loc1_.dis = Boolean(Number(_loc2_[5]));
      setSkillButton(_loc1_,_loc5_);
      skillArray.push(_loc1_);
      _loc4_ = _loc4_ + 1;
   }
   container_mc.numberSteper.setPage(Number(_currentpage),Number(_totalpage));
};
myListener.OnGame_UnionConsulPower_SetSKillState = function(_idx, _type)
{
   var _loc2_ = searchIndexlList(_idx);
   var _loc1_ = container_mc["listbox_" + _loc2_];
   _loc1_.dis = Boolean(Number(_type));
   if(!_loc1_.dis)
   {
      _loc1_.btn.gotoAndStop(4);
   }
   else
   {
      _loc1_.btn.gotoAndStop(1);
   }
};
myListener.OnGame_UnionConsulPower_SetPoint = function(_point)
{
   container_mc.pointText_1.text = lib.util.CurrencyFormat.makeComma(_point);
};
container_mc.SKillText_1.autoSize = "left";
lib.manager.ToolTip.add(container_mc.SKillText_1,"$471119",1);
myListener.OnGame_UnionConsulPower_SetBonusPercent = function(current, total)
{
   current = Number(current);
   total = Number(total);
   container_mc.SKillText_1.htmlText = lib.util.UIString.getUIString("$471077");
   var _loc2_ = 1;
   while(_loc2_ <= total)
   {
      var _loc1_ = container_mc.attachMovie("stepIcon","stepIcon" + _loc2_,container_mc.getNextHighestDepth());
      _loc1_._x = container_mc.SKillText_1._x + container_mc.SKillText_1.textWidth + 4 + 26 * (_loc2_ - 1);
      _loc1_._y = container_mc.SKillText_1._y - 3;
      if(_loc2_ <= current)
      {
         _loc1_.onMc._visible = true;
         _loc1_.offMc._visible = false;
         _loc1_.txt.textColor = 16777215;
      }
      else
      {
         _loc1_.onMc._visible = false;
         _loc1_.offMc._visible = true;
         _loc1_.txt.textColor = 10066329;
      }
      _loc1_.txt.text = _loc2_;
      _loc2_ = _loc2_ + 1;
   }
};
var clickedSkillId = null;
var clickCommanderSkill = false;
myListener.OnGame_Union_SetSkillCoolTime = function(id, _remainTime, _totalTime)
{
   _remainTime = Number(_remainTime);
   _totalTime = Number(_totalTime);
   var _loc5_ = searchSkillList(id);
   var _loc2_ = container_mc["listbox_" + _loc5_].slot;
   if(_loc2_.remain == -1 || _loc2_.remain != _remainTime)
   {
      _loc2_.cool.remove();
      delete register2.cool;
      _loc2_.cool = new lib.util.CoolTime(_remainTime,_totalTime);
      _loc2_.cool.mc = _loc2_;
      if(_remainTime <= 0 || _totalTime <= 0)
      {
         endCoolTime(_loc2_);
      }
      else
      {
         _loc2_.cool.onTick = function()
         {
            this.mc.remain = this.getRemainTime();
            this.mc.total = this.getTotalTime();
            this.mc.Count.txt.text = this.getCountText();
            lib.util.CoolTime.draw(this.mc.CoolTime,50,50,360 - this.getDgree(),0,60,true);
         };
         _loc2_.cool.onFinished = function()
         {
            endCoolTime(this.mc);
         };
      }
   }
};
myListener.ToGame_UnionConsulPower_ClickSKill = function(_id)
{
   getURL("FSCommand:ToGame_UnionConsulPower_ClickSkill",_id);
};
myListener.ToGame_UnionConsulPower_GoToPage = function(_page)
{
   getURL("FSCommand:ToGame_UnionConsulPower_GoToPage",_page);
};
myListener.ToGame_UnionConsulPower_CloseUI = function()
{
   fscommand("ToGame_UnionConsulPower_CloseUI");
};
container_mc.numberSteper.onChanged = function(changed)
{
   myListener.OnGame_UnionConsulPower_GoToPage(changed);
};
fscommand("ToGame_UnionConsulPower_Init");
