function ToGame_HomunVendor_CloseUI()
{
   fscommand("ToGame_HomunVendor_CloseUI");
}
function ToGame_HomunVendor_Calculate()
{
   fscommand("ToGame_HomunVendor_Calculate");
}
function ToGame_HomunVendor_VendorRightClick(slotIndex)
{
   getURL("FSCommand:ToGame_HomunVendor_VendorRightClick",slotIndex);
}
function ToGame_HomunVendor_CartRightClick(slotIndex)
{
   getURL("FSCommand:ToGame_HomunVendor_CartRightClick",slotIndex);
}
function clearItemSlot()
{
   var _loc2_ = 0;
   while(_loc2_ < 10)
   {
      var _loc1_ = container_mc["HomunVendor__" + _loc2_];
      _loc1_.SLOT.enabled = false;
      _loc1_.clear();
      _loc1_.hideBg();
      lib.manager.ToolTip.remove(_loc1_.SLOT);
      _loc2_ = _loc2_ + 1;
   }
}
function clearShoppingCartSlot()
{
   var _loc2_ = 10;
   while(_loc2_ < 16)
   {
      var _loc1_ = container_mc["HomunVendorShoppingCart__" + _loc2_];
      _loc1_.SLOT.enabled = false;
      _loc1_.clear();
      _loc1_.hideBg();
      lib.manager.ToolTip.remove(_loc1_.SLOT);
      _loc2_ = _loc2_ + 1;
   }
}
var UI = this;
UI._visible = false;
var UIname = "homunvendor";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN;
container_mc.explain_1.textColor = lib.info.TextColor.INPUT_LABEL;
container_mc.explain_2.textColor = lib.info.TextColor.INPUT_LABEL;
container_mc.txt0_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.txt1_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.txt2_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
var sellMode = 0;
container_mc.bg_cn._visible = false;
container_mc.btn_cn._visible = false;
container_mc.x_mc_cn._visible = false;
container_mc.lock_mc_cn._visible = false;
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
var goldType = 0;
myListener.OnGame_HomunVendor_SetGoldType = function(type)
{
   goldType = Number(type);
};
myListener.OnGame_HomunVendor_SetMode = function(isSellMode)
{
   sellMode = Number(isSellMode);
   if(sellMode == 0)
   {
      container_mc.text_name.text = "$163001";
      container_mc.txtLabel2.text = "$163005";
      lib.manager.UISkin.drawEmblem(UI,lib.manager.UISkin.EMBLEM_UNIQUE_HOMUNVENDOR_BUY);
      container_mc.bg_cn._visible = false;
      container_mc.btn_cn._visible = false;
      container_mc.x_mc_cn._visible = false;
      container_mc.lock_mc_cn._visible = false;
      container_mc.explain_0.textColor = "0x69849B";
      container_mc.uiBgMc._visible = true;
      container_mc.txtBtn0._visible = true;
      container_mc.x_mc._visible = true;
      container_mc.lock_mc._visible = true;
   }
   else
   {
      container_mc.text_name.text = "$163002";
      container_mc.txtLabel2.text = "$163006";
      lib.manager.UISkin.drawEmblem(UI,lib.manager.UISkin.EMBLEM_UNIQUE_HOMUNVENDOR_SALE);
      container_mc.bg_cn._visible = true;
      container_mc.btn_cn._visible = true;
      container_mc.x_mc_cn._visible = true;
      container_mc.lock_mc_cn._visible = true;
      container_mc.explain_0.textColor = "0xFFF600";
      container_mc.uiBgMc._visible = false;
      container_mc.txtBtn0._visible = false;
      container_mc.x_mc._visible = false;
      container_mc.lock_mc._visible = false;
   }
};
myListener.OnGame_HomunVendor_SetData = function(dataList)
{
   clearItemSlot();
   var _loc6_ = lib.util.ExtString.split(dataList,"\n");
   var _loc3_ = 0;
   while(_loc3_ < _loc6_.length)
   {
      var _loc2_ = _loc6_[_loc3_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc4_ = Number(_loc2_[0]);
         var _loc1_ = container_mc["HomunVendor__" + _loc4_];
         _loc1_.id = _loc2_[0];
         _loc1_.SLOT.enabled = true;
         _loc1_.Slot.SLOT.enabled = true;
         _loc1_.showMoney(false);
         _loc1_.draw(_loc2_[1]);
         _loc1_.grade = _loc2_[7];
         _loc1_.sealType = _loc2_[8];
         _loc1_.masterpiece = _loc2_[9];
         lib.manager.ToolTip.add(_loc1_.SLOT,_loc1_.id,6,_loc1_.Slot.Icon);
         if(Number(_loc2_[5]) == 1 || _loc2_[5] == undefined)
         {
            if(Number(_loc2_[2]) > 0)
            {
               _loc1_.Slot.num = _loc2_[2];
            }
         }
         _loc1_.setLineNum(2);
         _loc1_.upText = _loc2_[3];
         var _loc5_ = lib.util.GoldCurrency.SetGoldText(_loc2_[4],0,0,0,goldType);
         _loc1_.down_txt.textAutoSize = "shrink";
         _loc1_.down_txt.htmlText = _loc5_;
         _loc1_.down_txt._width = 125;
         _loc1_.down_txt._x = 97;
         _loc1_.impossible = Number(_loc2_[6]);
         _loc1_.drag = !sellMode;
         _loc1_.showBg();
         _loc1_.Slot.hideBg();
      }
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_HomunVendor_SetShoppingCart = function(dataList)
{
   clearShoppingCartSlot();
   var _loc7_ = lib.util.ExtString.split(dataList,"\n");
   var _loc4_ = 0;
   while(_loc4_ < _loc7_.length)
   {
      var _loc3_ = _loc7_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc5_ = Number(_loc3_[0]);
         var _loc2_ = container_mc["HomunVendorShoppingCart__" + _loc5_];
         _loc2_.id = _loc3_[0];
         _loc2_.SLOT.enabled = true;
         _loc2_.showMoney(false);
         if(Number(_loc3_[5]) == 1 || _loc3_[5] == undefined)
         {
            if(Number(_loc3_[2]) > 0)
            {
               _loc2_.num = _loc3_[2];
            }
         }
         _loc2_.impossible = Number(_loc3_[6]);
         _loc2_.draw(_loc3_[1]);
         _loc2_.grade = _loc3_[7];
         _loc2_.sealType = _loc3_[8];
         _loc2_.masterpiece = _loc3_[9];
         _loc2_.onEnterFrame = function()
         {
            if(this.num != undefined)
            {
               this.sealType = this.sealType;
               this.masterpiece = this.masterpiece;
               delete this.onEnterFrame;
            }
         };
         lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.id,6,_loc2_.mc.Slot.Icon);
         _loc2_.setLineNum(2);
         _loc2_.upText = _loc3_[3];
         var _loc6_ = lib.util.GoldCurrency.SetGoldText(_loc3_[4],0,0,0,goldType);
         _loc2_.down_txt.textAutoSize = "shrink";
         _loc2_.down_txt.htmlText = _loc6_;
         _loc2_.down_txt._width = 125;
         _loc2_.down_txt._x = 97;
         _loc2_.drag = true;
         _loc2_.showBg();
         _loc2_.Slot.hideBg();
      }
      _loc4_ = _loc4_ + 1;
   }
   calculate_btn.setEnabled(_loc7_.length > 0);
   calculate_btn_cn.setEnabled(_loc7_.length > 0);
};
myListener.OnGame_HomunVendor_SetAccountData = function(myMoney, totalPrice, calculatedMoney)
{
   var _loc1_ = lib.util.GoldCurrency.SetGoldText(String(myMoney),0,0,0,goldType);
   var _loc3_ = lib.util.GoldCurrency.SetGoldText(String(totalPrice),0,0,0,goldType);
   var _loc2_ = lib.util.GoldCurrency.SetGoldText(String(calculatedMoney),0,0,0,goldType);
   container_mc.txt1_txt.htmlText = _loc1_;
   container_mc.txt2_txt.htmlText = _loc3_;
   container_mc.txt3_txt.htmlText = _loc2_;
   if(calculatedMoney < 0)
   {
      container_mc.txt3_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
   }
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target._name == "SLOT")
   {
      var _loc3_ = target._parent._name;
      var _loc2_ = target._parent._parent._name;
      if(container_mc[_loc3_] != undefined || container_mc[_loc3_] != undefined)
      {
         var _loc1_ = _loc3_.split("__");
         if(_loc1_[0] == "HomunVendor")
         {
            ToGame_HomunVendor_VendorRightClick(_loc1_[1]);
         }
         else if(_loc1_[0] == "HomunVendorShoppingCart")
         {
            ToGame_HomunVendor_CartRightClick(_loc1_[1]);
         }
      }
      else if(container_mc[_loc2_] != undefined || container_mc[_loc2_] != undefined)
      {
         _loc1_ = _loc2_.split("__");
         if(_loc1_[0] == "HomunVendor")
         {
            ToGame_HomunVendor_VendorRightClick(_loc1_[1]);
         }
         else if(_loc1_[0] == "HomunVendorShoppingCart")
         {
            ToGame_HomunVendor_CartRightClick(_loc1_[1]);
         }
      }
   }
};
var calculate_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
calculate_btn.setEnabled(false);
calculate_btn.setRelease(ToGame_HomunVendor_Calculate);
close_btn.setRelease(ToGame_HomunVendor_CloseUI);
x_btn.setRelease(ToGame_HomunVendor_CloseUI);
var calculate_btn_cn = new lib.util.TxtBtn(container_mc.btn_cn.btn,container_mc.btn_cn.txt);
calculate_btn_cn.setTextColor("0xFFF600","0xFFFFFF","0xFFFFFF","0x485460");
calculate_btn_cn.setRelease(ToGame_HomunVendor_Calculate);
var x_btn_cn = new lib.util.TxtBtn(container_mc.x_mc_cn);
x_btn_cn.setRelease(ToGame_HomunVendor_CloseUI);
calculate_btn_cn.setEnabled(false);
clearItemSlot();
clearShoppingCartSlot();
container_mc.HomunVendor__Area.GetName = function()
{
   return this._name;
};
container_mc.HomunVendorShoppingCart__Area.GetName = function()
{
   return this._name;
};
fscommand("ToGame_HomunVendor_Init");
