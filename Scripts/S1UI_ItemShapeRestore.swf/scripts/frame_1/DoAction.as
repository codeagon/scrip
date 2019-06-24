function ToGame_ItemShapeRestore_CloseUI()
{
   fscommand("ToGame_ItemShapeRestore_CloseUI");
}
function ToGame_ItemShapeRestore_ClickRestoreBtn()
{
   fscommand("ToGame_ItemShapeRestore_ClickRestoreBtn");
}
function ToGame_ItemShapeRestore_ClickPreviewBtn()
{
   fscommand("ToGame_ItemShapeRestore_ClickPreviewBtn");
}
function ToGame_ItemShapeRestore_RightClick(slotName)
{
   getURL("FSCommand:ToGame_ItemShapeRestore_RightClick",slotName);
}
var UI = this;
UI._visible = false;
var UIname = "ItemShapeRestore";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.scaleExpander.scaleExpanderEventCheck(UI,UIname);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.guideFd.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
container_mc.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
container_mc.explain_2.textColor = lib.info.TextColor.INPUT_LABEL;
container_mc.explain_2.textAutoSize = "shrink";
container_mc.guideFd.htmlText = lib.util.UIString.getUIString("$421012");
var slotNamePrefix = "ItemShapeRestore__";
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var restore_btn = container_mc.txtBtn0.txtBtn;
var preview_btn = container_mc.txtBtn2.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
restore_btn.setRelease(ToGame_ItemShapeRestore_ClickRestoreBtn);
preview_btn.setRelease(ToGame_ItemShapeRestore_ClickPreviewBtn);
x_btn.setRelease(ToGame_ItemShapeRestore_CloseUI);
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
myListener.OnGame_ItemShapeRestore_CanSetSlots = function(bEnable)
{
   bEnable = Number(bEnable);
   var _loc1_ = 0;
   while(_loc1_ < 4)
   {
      var _loc2_ = container_mc[slotNamePrefix + _loc1_];
      _loc2_.drag = bEnable;
      _loc2_.bRightClick = bEnable;
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_ItemShapeRestore_SetPrice = function(price, hasEnoughMoney)
{
   hasEnoughMoney = Number(hasEnoughMoney);
   var _loc3_ = !hasEnoughMoney?lib.info.TextColor.GENERAL_MONEY_NOT_ENOUGH.toString(16):lib.info.TextColor.GENERAL_MONEY.toString(16);
   var _loc2_ = lib.util.GoldCurrency.SetGoldText(price);
   container_mc.price_txt.htmlText = "<font color=\'#" + _loc3_ + "\'>" + _loc2_ + "</font>";
};
myListener.OnGame_ItemShapeRestore_SetSlot = function(dataList)
{
   var _loc1_ = dataList.split("\t");
   if(_loc1_[_loc1_.length - 1] == "undefined" || _loc1_[_loc1_.length - 1] == undefined || _loc1_[_loc1_.length - 1] == "")
   {
      _loc1_.pop();
   }
   if(_loc1_.length != 1)
   {
      var _loc3_ = _loc1_[0];
      var _loc7_ = _loc1_[1];
      var _loc4_ = Number(_loc1_[2]);
      var _loc8_ = Number(_loc1_[3]);
      var _loc6_ = _loc1_[4];
      var _loc5_ = _loc1_[5];
      var _loc2_ = container_mc[slotNamePrefix + _loc3_];
      if(_loc2_.draw(_loc7_))
      {
         _loc2_.grade = _loc8_;
         _loc2_.sealType = _loc6_;
         _loc2_.masterpiece = _loc5_;
         if(!isNaN(_loc4_))
         {
            _loc2_.impossible = _loc4_;
         }
         lib.manager.ToolTip.remove(_loc2_.SLOT);
         lib.manager.ToolTip.add(_loc2_.SLOT,_loc3_,6,_loc2_.Icon);
      }
      else
      {
         myListener.OnGame_ItemShapeRestore_SetSlot(_loc3_);
      }
      _loc2_.bg2._visible = true;
   }
   else
   {
      _loc3_ = Number(_loc1_[0]);
      if(!isNaN(_loc3_))
      {
         _loc2_ = container_mc[slotNamePrefix + _loc3_];
         _loc2_.effectRemove();
         _loc2_.bg2._visible = false;
         _loc2_.clear();
         _loc2_.disableSlot = false;
         lib.manager.ToolTip.remove(_loc2_.SLOT);
         lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$421011"),1);
      }
   }
};
myListener.OnGame_ItemShapeRestore_StartRestore = function(index, durationTime)
{
   var slot = container_mc[slotNamePrefix + index];
   slot.bg2._visible = true;
   container_mc[slotNamePrefix + (index + 4)].bg2._visible = false;
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
   };
};
myListener.OnGame_ItemShapeRestore_SetEnableRestoreBtn = function(bEnable)
{
   bEnable = Number(bEnable);
   restore_btn.setEnabled(bEnable);
};
myListener.OnGame_ItemShapeRestore_SetEnablePreviewBtn = function(bEnable)
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
      var _loc3_ = _loc1_.substr(18);
      if(container_mc[_loc1_] != undefined)
      {
         if(target._parent.bRightClick != 0)
         {
            ToGame_ItemShapeRestore_RightClick(_loc3_);
         }
      }
   }
};
var i = 0;
while(i < 4)
{
   var slot = container_mc[slotNamePrefix + i];
   lib.manager.ToolTip.add(slot.SLOT,lib.util.UIString.getUIString("$421011"),1);
   slot.bg2._visible = false;
   i++;
}
myListener.OnGame_ItemShapeRestore_SetEnableRestoreBtn(false);
fscommand("ToGame_ItemShapeRestore_Init");
