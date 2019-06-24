function ToGame_PVESkillWindow_SelectTab(tabId, noRequestEvent)
{
   if(tabId == curTab)
   {
      return undefined;
   }
   if(noRequestEvent == 0)
   {
      getURL("FSCommand:ToGame_PVESkillWindow_SelectTab",tabId);
      curTab = tabId;
   }
}
function setCartSlot(info)
{
   var _loc4_ = Number(info[0]);
   var _loc2_ = container_mc.cartContainer[cartSlotPrefix + _loc4_];
   if(_loc2_ == undefined)
   {
      _loc2_ = createSlot(1,_loc4_);
   }
   else
   {
      clearSlot(_loc2_);
   }
   _loc2_._visible = true;
   lib.manager.ToolTip.remove(_loc2_.SLOT);
   var _loc8_ = info[1];
   var _loc7_ = info[2];
   var _loc9_ = info[3];
   var _loc11_ = info[4];
   var _loc10_ = Number(info[5]);
   var _loc5_ = Number(info[6]);
   var num = Number(info[7]);
   if(isNaN(num) || num == 0)
   {
      num = "";
   }
   var _loc6_ = num == ""?"#80B5DE":"#57BB35";
   _loc2_.up_txt.htmlText = _loc9_;
   _loc2_.draw(_loc7_);
   _loc2_.down_txt.htmlText = "<font color=\'" + _loc6_ + "\'>" + _loc10_ + "</font> <font color=\'#80B5DE\'>point</font>";
   _loc2_.Slot.typeFrame.gotoAndStop(_loc5_ + 1);
   lib.manager.ToolTip.add(_loc2_.SLOT,_loc8_ + "\t" + _loc5_,6);
   _loc2_.onEnterFrame = function()
   {
      this.Slot.num_txt.text = num;
   };
}
function setSkillDisable(target, bDisable)
{
   target.disable = bDisable;
   target.SLOT.enabled = !bDisable;
   target.Slot.SLOT.enabled = !bDisable;
   var _loc4_ = new flash.geom.Transform(target.Slot.typeFrame);
   var _loc3_ = undefined;
   if(bDisable)
   {
      _loc3_ = lib.info.ColorTrans.slotDisableTrans();
   }
   else
   {
      _loc3_ = lib.info.ColorTrans.enableTrans();
   }
   _loc4_.colorTransform = _loc3_;
}
function setSkillSlot(info)
{
   var _loc3_ = Number(info[0]);
   var _loc1_ = container_mc.skillContainer[skillSlotPrefix + _loc3_];
   if(_loc1_ == undefined)
   {
      _loc1_ = createSlot(0,_loc3_);
   }
   else
   {
      clearSlot(_loc1_);
   }
   _loc1_._visible = true;
   lib.manager.ToolTip.remove(_loc1_.SLOT);
   var _loc8_ = info[1];
   var _loc7_ = info[2];
   var _loc9_ = info[3];
   var _loc10_ = info[4];
   var _loc4_ = Number(info[5]);
   var _loc5_ = Number(info[6]);
   var _loc6_ = Number(info[7]);
   setSkillDisable(_loc1_,_loc6_);
   lib.manager.ToolTip.add(_loc1_.SLOT,_loc8_ + "\t" + _loc5_,6);
   _loc1_.up_txt.text = _loc9_;
   _loc1_.draw(_loc7_);
   _loc1_.down_txt.textColor = "0x80B5DE";
   _loc1_.down_txt.text = _loc4_ + " " + POINT_TXT;
   _loc1_.Slot.typeFrame.gotoAndStop(_loc5_ + 1);
   _loc1_.point = _loc4_;
   _loc1_.drag = !bBattle;
   _loc1_.SLOT.enabled = !bBattle;
   _loc1_.Slot.SLOT.enabled = !bBattle;
}
function createSlot(slotType, slotIndex)
{
   var _loc4_ = slotType != 0?container_mc.cartContainer:container_mc.skillContainer;
   var _loc7_ = slotType != 0?0:slotIndex % 2 * 227;
   var _loc6_ = slotType != 0?slotIndex * 65:int(slotIndex / 2) * 65;
   var _loc8_ = slotType != 0?cartSlotPrefix + slotIndex:skillSlotPrefix + slotIndex;
   var _loc5_ = slotType != 0?"PVECARTSLOT":"PVESKILLSLOT";
   var _loc1_ = _loc4_.attachMovie("slot",_loc8_,_loc4_.getNextHighestDepth());
   _loc1_._x = _loc7_;
   _loc1_._y = _loc6_;
   _loc1_._width = 224;
   _loc1_.resize();
   _loc1_.SLOT.SLOTNAME = _loc5_;
   _loc1_.slotIndex = slotIndex;
   _loc1_.Slot.typeFrame.hitTestDisable = true;
   return _loc1_;
}
function clearSlot(target)
{
   target.clear();
   target.Slot.typeFrame.gotoAndStop(1);
   lib.manager.ToolTip.remove(target.SLOT);
}
function init()
{
   container_mc.bg.hitTestDisable = true;
   container_mc.defaultFd.hitTestDisable = true;
   container_mc.defaultFd._visible = false;
   container_mc.defaultFd.verticalAutoSize = "center";
   container_mc.cartContainer.hit.GetName = function()
   {
      return "PVECart__Area";
   };
   container_mc.cartContainer.hit._height = 501;
   ToGame_PVESkillWindow_Init();
   container_mc.skillContainer.hit._width = 451;
}
function ToGame_PVESkillWindow_Init()
{
   fscommand("ToGame_PVESkillWindow_Init");
}
function ToGame_PVESkillWindow_CloseUI()
{
   fscommand("ToGame_PVESkillWindow_CloseUI");
}
function ToGame_PVESkillWindow_Confirm()
{
   fscommand("ToGame_PVESkillWindow_Confirm");
}
function ToGame_PVESkillWindow_MouseRightBtnClick(slotIndex, index, targetType)
{
   var _loc1_ = slotIndex + "\t" + index;
   if(targetType == 0)
   {
      ToGame_PVESkillWindow_SkillMouseRightBtnClick(_loc1_);
   }
   else
   {
      ToGame_PVESkillWindow_CartMouseRightBtnClick(_loc1_);
   }
}
function ToGame_PVESkillWindow_SkillMouseRightBtnClick(param)
{
   getURL("FSCommand:ToGame_PVESkillWindow_SkillMouseRightBtnClick",param);
}
function ToGame_PVESkillWindow_CartMouseRightBtnClick(param)
{
   getURL("FSCommand:ToGame_PVESkillWindow_CartMouseRightBtnClick",param);
}
var UI = this;
UI._visible = false;
var UIname = "PVESkillWindow";
var skillSlotPrefix = "PVESkill__";
var cartSlotPrefix = "PVECart__";
var POINT_TXT = lib.util.UIString.getUIString("$471106");
var bWidgetOpen = false;
var closeBtn = new lib.util.TxtBtn(container_mc.closeBtn);
closeBtn.setRelease(ToGame_PVESkillWindow_CloseUI);
var confirmBtn = container_mc.confirmBtn.txtBtn;
confirmBtn.setRelease(ToGame_PVESkillWindow_Confirm);
var skillScroll = container_mc.skillScroll;
var skillScrollTarget = container_mc.skillContainer;
skillScroll.addListener(skillScrollTarget);
var skillListY = skillScrollTarget._y;
skillScrollTarget.onScroll = function()
{
   this._y = skillListY - arguments[0];
};
skillScroll.setWheel(skillScrollTarget);
skillScroll.wheelDelta = 1;
skillScroll.pageSize = 0;
skillScroll.displaySize = container_mc.skillMask._height;
skillScroll.defaultBarSizeRatio = 0.3333333333333333;
skillScroll.rowHeight = 30;
skillScroll.scroll = 0;
var cartScroll = container_mc.cartScroll;
var cartScrollTarget = container_mc.cartContainer;
cartScroll.addListener(cartScrollTarget);
var cartListY = cartScrollTarget._y;
cartScrollTarget.onScroll = function()
{
   this._y = cartListY - arguments[0];
};
cartScroll.setWheel(cartScrollTarget);
cartScroll.wheelDelta = 1;
cartScroll.pageSize = 0;
cartScroll.displaySize = container_mc.cartMask._height;
cartScroll.defaultBarSizeRatio = 0.3333333333333333;
cartScroll.rowHeight = 30;
cartScroll.scroll = 0;
var tabBtn = container_mc.tabBtn.tab;
tabBtn.setRelease(ToGame_PVESkillWindow_SelectTab);
tabBtn.setTab(0,1);
var curTab = 0;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      if(rightClicked)
      {
         rightClicked = false;
         rightClickedTarget = null;
         targetType = null;
      }
      UI._visible = false;
   }
};
var maxSkill = 0;
var curSkillLen = 0;
myListener.OnGame_PVESkillWindow_SetSkill = function(param)
{
   skillScroll.pageSize = 0;
   skillScroll.scroll = 0;
   var _loc5_ = lib.util.ExtString.split(param,"\n");
   var _loc2_ = _loc5_.length;
   maxSkill = Math.max(_loc2_,maxSkill);
   curSkillLen = _loc2_;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc5_[_loc1_],"\t");
      setSkillSlot(_loc3_);
      _loc1_ = _loc1_ + 1;
   }
   var _loc7_ = _loc2_ - 1;
   var _loc6_ = int(_loc7_ / 2) * 65;
   skillScroll.pageSize = _loc6_ + 62.5;
   container_mc.skillContainer.hit._height = _loc6_ + 62.5;
   if(_loc2_ < maxSkill)
   {
      _loc1_ = _loc2_;
      while(_loc1_ < maxSkill)
      {
         var _loc4_ = container_mc.skillContainer[skillSlotPrefix + _loc1_];
         _loc4_._visible = false;
         _loc1_ = _loc1_ + 1;
      }
   }
};
var bBattle = false;
myListener.OnGame_PVESkillWindow_SetBattleMode = function(bFlag)
{
   bBattle = Number(bFlag);
   container_mc.defaultFd._visible = bBattle;
   var _loc2_ = 0;
   while(_loc2_ < curSkillLen)
   {
      var _loc1_ = container_mc.skillContainer[skillSlotPrefix + _loc2_];
      _loc1_.drag = !bBattle;
      _loc1_.SLOT.enabled = !bBattle;
      _loc1_.Slot.SLOT.enabled = !bBattle;
      _loc2_ = _loc2_ + 1;
   }
};
myListener.OnGame_PVESkillWindow_SetButtonEnabled = function(bFlag)
{
   bFlag = Number(bFlag);
   confirmBtn.setEnabled(bFlag);
};
var maxCart = 0;
var curCartLen = 0;
var remainPoint = -1;
var temp = 0;
myListener.OnGame_PVESkillWindow_SetCart = function(param, useP, remainP)
{
   cartScroll.pageSize = 0;
   cartScroll.scroll = 0;
   var _loc5_ = lib.util.ExtString.split(param,"\n");
   var _loc2_ = _loc5_.length;
   if(_loc2_ == undefined)
   {
      _loc2_ = 0;
   }
   curCartLen = _loc2_;
   maxCart = Math.max(_loc2_,maxCart);
   var _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc5_[_loc1_],"\t");
      setCartSlot(_loc3_);
      _loc1_ = _loc1_ + 1;
   }
   var _loc7_ = _loc2_ - 1;
   var _loc6_ = _loc7_ * 65;
   cartScroll.pageSize = _loc6_ + 62.5;
   if(_loc2_ < maxCart)
   {
      _loc1_ = _loc2_;
      while(_loc1_ < maxCart)
      {
         var _loc4_ = container_mc.cartContainer[cartSlotPrefix + _loc1_];
         _loc4_._visible = false;
         _loc1_ = _loc1_ + 1;
      }
   }
   remainPoint = Number(remainP);
   container_mc.useFd.text = useP;
   container_mc.remainFd.text = remainPoint;
};
myListener.OnGame_PVESkillWindow_UpdateCart = function(param, useP, remainP)
{
   var _loc3_ = lib.util.ExtString.split(param,"\n");
   var _loc4_ = _loc3_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc3_[_loc1_],"\t");
      setCartSlot(_loc2_);
      _loc1_ = _loc1_ + 1;
   }
   remainPoint = Number(remainP);
   container_mc.useFd.text = useP;
   container_mc.remainFd.text = remainPoint;
};
init();
var rightClicked = false;
var targetIndex = null;
var rightClickedTarget = null;
var targetType = null;
myListener.OnGame_MouseDown = function(button, target)
{
   if(bBattle)
   {
      return undefined;
   }
   if(target.SLOTNAME != "PVESKILLSLOT" && target.SLOTNAME != "PVECARTSLOT")
   {
      return undefined;
   }
   button = Number(button);
   if(button == 2)
   {
      rightClicked = true;
      rightClickedTarget = target._parent;
      targetIndex = rightClickedTarget.slotIndex;
      targetType = target.SLOTNAME != "PVESKILLSLOT"?1:0;
      if(targetIndex != undefined)
      {
         ToGame_PVESkillWindow_MouseRightBtnClick(targetIndex,0,targetType);
      }
   }
};
myListener.OnGame_MouseUp = function(button, target)
{
   if(rightClicked == false)
   {
      return undefined;
   }
   button = Number(button);
   if(button == 2)
   {
      rightClicked = false;
      if(targetIndex != undefined)
      {
         ToGame_PVESkillWindow_MouseRightBtnClick(targetIndex,1,targetType);
      }
      rightClickedTarget = null;
      targetType = null;
   }
};
