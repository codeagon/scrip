function ToGame_ItemShapeChange_CloseUI()
{
   fscommand("ToGame_ItemShapeChange_CloseUI");
}
function ToGame_ItemShapeChange_ClickChangeBtn()
{
   fscommand("ToGame_ItemShapeChange_ClickChangeBtn");
}
function ToGame_ItemShapeChange_ClickPreviewBtn()
{
   fscommand("ToGame_ItemShapeChange_ClickPreviewBtn");
}
function ToGame_ItemShapeChange_RightClick(slotName)
{
   getURL("FSCommand:ToGame_ItemShapeChange_RightClick",slotName);
}
var UI = this;
UI._visible = false;
var UIname = "ItemShapeChange";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.scaleExpander.scaleExpanderEventCheck(UI,UIname);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.guideFd.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
container_mc.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
container_mc.explain_2.textColor = lib.info.TextColor.INPUT_LABEL;
container_mc.explain_2.textAutoSize = "shrink";
container_mc.guideFd.htmlText = lib.util.UIString.getUIString("$411015");
var slotNamePrefix = "ItemShapeChange__";
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var change_btn = container_mc.txtBtn0.txtBtn;
var preview_btn = container_mc.txtBtn2.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
preview_btn.setToggleMode(true);
change_btn.setRelease(ToGame_ItemShapeChange_ClickChangeBtn);
preview_btn.setRelease(ToGame_ItemShapeChange_ClickPreviewBtn);
x_btn.setRelease(ToGame_ItemShapeChange_CloseUI);
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
      UI._visible = false;
   }
};
myListener.OnGame_ItemShapeChange_CanSetSlots = function(bEnable)
{
   bEnable = Number(bEnable);
   var _loc1_ = 0;
   while(_loc1_ < 8)
   {
      var _loc2_ = container_mc[slotNamePrefix + _loc1_];
      _loc2_.drag = bEnable;
      _loc2_.bRightClick = bEnable;
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_ItemShapeChange_SetLockSlot = function(slotIndex, bLock)
{
   var _loc1_ = container_mc[slotNamePrefix + slotIndex];
   _loc1_.disableSlot = Number(bLock);
   if(Number(bLock))
   {
      lib.manager.ToolTip.remove(_loc1_.SLOT);
   }
};
myListener.OnGame_ItemShapeChange_SetPrice = function(price, hasEnoughMoney)
{
   hasEnoughMoney = Number(hasEnoughMoney);
   var _loc3_ = !hasEnoughMoney?lib.info.TextColor.GENERAL_MONEY_NOT_ENOUGH.toString(16):lib.info.TextColor.GENERAL_MONEY.toString(16);
   var _loc2_ = lib.util.GoldCurrency.SetGoldText(price);
   container_mc.price_txt.htmlText = "<font color=\'#" + _loc3_ + "\'>" + _loc2_ + "</font>";
};
myListener.OnGame_ItemShapeChange_SetSlot = function(dataList)
{
   var _loc1_ = dataList.split("\t");
   if(_loc1_[_loc1_.length - 1] == "undefined" || _loc1_[_loc1_.length - 1] == undefined || _loc1_[_loc1_.length - 1] == "")
   {
      _loc1_.pop();
   }
   if(_loc1_.length != 1)
   {
      var _loc2_ = Number(_loc1_[0]);
      var _loc7_ = _loc1_[1];
      var _loc4_ = Number(_loc1_[2]);
      var _loc8_ = Number(_loc1_[3]);
      var _loc6_ = _loc1_[4];
      var _loc5_ = _loc1_[5];
      var _loc3_ = container_mc[slotNamePrefix + _loc2_];
      _loc3_.bg2._visible = false;
      if(_loc3_.draw(_loc7_))
      {
         _loc3_.grade = _loc8_;
         _loc3_.sealType = _loc6_;
         _loc3_.masterpiece = _loc5_;
         if(!isNaN(_loc4_))
         {
            _loc3_.impossible = _loc4_;
         }
         lib.manager.ToolTip.remove(_loc3_.SLOT);
         lib.manager.ToolTip.add(_loc3_.SLOT,_loc2_,6,_loc3_.Icon);
      }
      else
      {
         myListener.OnGame_ItemShapeChange_SetSlot(_loc2_);
      }
      if(_loc2_ >= 4)
      {
         container_mc["arrow_" + _loc2_]._visible = true;
         _loc3_.bg2._visible = true;
         container_mc["arrow_" + _loc2_].gotoAndPlay(2);
      }
   }
   else
   {
      _loc2_ = Number(_loc1_[0]);
      if(!isNaN(_loc2_))
      {
         _loc3_ = container_mc[slotNamePrefix + _loc2_];
         _loc3_.effectRemove();
         _loc3_.clear();
         _loc3_.bg2._visible = false;
         _loc3_.disableSlot = false;
         if(_loc2_ <= 3)
         {
            lib.manager.ToolTip.add(_loc3_.SLOT,lib.util.UIString.getUIString("$411013"),1);
            container_mc["arrow_" + (_loc2_ + 4)]._visible = false;
            container_mc["arrow_" + (_loc2_ + 4)].gotoAndStop(1);
         }
         else
         {
            lib.manager.ToolTip.add(_loc3_.SLOT,lib.util.UIString.getUIString("$411014"),1);
            container_mc["arrow_" + _loc2_]._visible = false;
            container_mc["arrow_" + _loc2_].gotoAndStop(1);
         }
      }
   }
};
myListener.OnGame_ItemShapeChange_StartChange = function(index, durationTime)
{
   var slot = container_mc[slotNamePrefix + index];
   slot.bg2._visible = true;
   container_mc[slotNamePrefix + (index + 4)].bg2._visible = false;
   container_mc["arrow_" + (index + 4)].gotoAndPlay(2);
   var effect = slot.EFFECT.attachMovie("effect_active","effect_active",1);
   slot.effectRemove = function()
   {
      this.cool.remove();
      delete this.cool;
      effect.removeMovieClip();
   };
   effect._xscale = effect._yscale = 106;
   effect._x = -8.8;
   effect._y = -11.3;
   slot.cool.remove();
   delete slot.cool;
   slot.cool = new lib.util.CoolTime(durationTime,durationTime);
   slot.cool.onFinished = function()
   {
      slot.effectRemove();
      slot.bg2._visible = false;
      container_mc["arrow_" + (index + 4)]._visible = false;
      container_mc["arrow_" + (index + 4)].gotoAndStop(1);
   };
};
myListener.OnGame_ItemShapeChange_SetEnableChangeBtn = function(bEnable)
{
   bEnable = Number(bEnable);
   change_btn.setEnabled(bEnable);
};
myListener.OnGame_ItemShapeChange_SetEnablePreviewBtn = function(bEnable)
{
   bEnable = Number(bEnable);
   container_mc.txtBtn2.txtBtn.setEnabled(bEnable);
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target._name == "SLOT")
   {
      var _loc1_ = target._parent._name;
      if(container_mc[_loc1_] != target._parent)
      {
         return undefined;
      }
      var _loc3_ = _loc1_.substr(17);
      if(container_mc[_loc1_] != undefined)
      {
         if(target._parent.bRightClick != 0)
         {
            ToGame_ItemShapeChange_RightClick(_loc3_);
         }
      }
   }
};
myListener.OnGame_ItemShapeChange_SetPreViewState = function(_state)
{
   _state = Number(_state);
   if(_state)
   {
      preview_btn.setText("$440030");
   }
   else
   {
      preview_btn.setText("$411010");
   }
   preview_btn.setToggle(_state);
};
var i = 0;
while(i < 8)
{
   var slot = container_mc[slotNamePrefix + i];
   if(i <= 3)
   {
      lib.manager.ToolTip.add(slot.SLOT,lib.util.UIString.getUIString("$411013"),1);
   }
   else
   {
      lib.manager.ToolTip.add(slot.SLOT,lib.util.UIString.getUIString("$411014"),1);
   }
   myListener.OnGame_ItemShapeChange_SetLockSlot(i,1);
   container_mc["arrow_" + i]._visible = false;
   slot.bg2._visible = false;
   i++;
}
myListener.OnGame_ItemShapeChange_SetEnableChangeBtn(false);
fscommand("ToGame_ItemShapeChange_Init");
