function ToGame_HomunVendorSet_Init()
{
   fscommand("ToGame_HomunVendorSet_Init");
}
function ToGame_HomunVendorSet_RequestMode(_tabIndex)
{
   var _loc1_ = undefined;
   if(venderType == 2)
   {
      _loc1_ = _tabIndex;
   }
   else
   {
      _loc1_ = venderType;
   }
   getURL("FSCommand:ToGame_HomunVendorSet_RequestMode",_loc1_);
}
function ToGame_HomunVendorSet_RequestAccount()
{
   fscommand("ToGame_HomunVendorSet_RequestAccount");
}
function ToGame_HomunVendorSet_RequestSetAdMessage(menssage)
{
   getURL("FSCommand:ToGame_HomunVendorSet_RequestSetAdMessage",menssage);
}
function ToGame_HomunVendorSet_RequestVendorStart()
{
   listItemEnabled(!venderActive);
   fscommand("ToGame_HomunVendorSet_RequestVendorStart");
}
function ToGame_HomunVendorSet_RequestVendorStop()
{
   listItemEnabled(!venderActive);
   fscommand("ToGame_HomunVendorSet_RequestVendorStop");
}
function ToGame_HomunVendorSet_RequestVendorClose()
{
   fscommand("ToGame_HomunVendorSet_RequestVendorClose");
}
function ToGame_HomunVendorSet_CloseUI()
{
   fscommand("ToGame_HomunVendorSet_CloseUI");
}
function ToGame_HomunVendorSet_RightClick(slotIndex)
{
   getURL("FSCommand:ToGame_HomunVendorSet_RightClick",slotIndex);
}
function listBuilder(listData)
{
   var _loc2_ = listData.split("\n");
   if(_loc2_[_loc2_.length - 1] == "undefined" || _loc2_[_loc2_.length - 1] == "")
   {
      _loc2_.pop();
   }
   totalCount = 0;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_.length)
   {
      listAdd(_loc2_[_loc1_]);
      _loc1_ = _loc1_ + 1;
   }
   if(!venderActive)
   {
      ad_txt.textField.selectable = _loc2_.length >= 1 && aDeditable;
      container_mc.impossibleInput._visible = !ad_txt.textField.selectable;
   }
}
function listClear(id)
{
   itemNames = [];
   if(id == undefined)
   {
      var _loc2_ = 0;
      while(_loc2_ < MAXIMUMS)
      {
         var _loc1_ = container_mc[UIname + "__" + _loc2_];
         _loc1_.id = undefined;
         _loc1_.clear();
         lib.manager.ToolTip.remove(_loc1_.SLOT);
         lib.manager.ToolTip.remove(_loc1_.center_txt);
         _loc1_.impossible = false;
         _loc1_.SLOT.enabled = false;
         _loc1_.hideBg();
         _loc2_ = _loc2_ + 1;
      }
      totalCount = 0;
      venderStartBtn.setEnabled(false);
   }
   else
   {
      _loc2_ = 0;
      while(_loc2_ < MAXIMUMS)
      {
         _loc1_ = container_mc[UIname + "__" + _loc2_];
         if(_loc1_.id == id)
         {
            _loc1_.id = undefined;
            _loc1_.clear();
            _loc1_.impossible = false;
            _loc1_.SLOT.enabled = false;
            _loc1_.hideBg();
            lib.manager.ToolTip.remove(_loc1_.SLOT);
            lib.manager.ToolTip.remove(_loc1_.center_txt);
            totalCount--;
            venderStartBtn.setEnabled(totalCount > 0);
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
}
function listAdd(listData)
{
   if(totalCount < MAXIMUMS)
   {
      var _loc1_ = listData.split("\t");
      if(_loc1_.length != 1)
      {
         var _loc2_ = Number(_loc1_[0]);
         var _loc3_ = container_mc[UIname + "__" + _loc2_];
         totalCount++;
         updateSlot(_loc3_,_loc1_);
      }
   }
}
function listUpdate(listData)
{
   var _loc3_ = listData.split("\t");
   if(_loc3_.length != 1)
   {
      var _loc1_ = 0;
      while(_loc1_ < MAXIMUMS)
      {
         var _loc2_ = container_mc[UIname + "__" + _loc1_];
         if(_loc2_.id == _loc3_[0])
         {
            updateSlot(_loc2_,_loc3_);
            return undefined;
         }
         _loc1_ = _loc1_ + 1;
      }
   }
}
function updateSlot(slot, info)
{
   slot.showMoney(false);
   lib.manager.ToolTip.add(slot.SLOT,info[0],6,slot.Slot.Icon);
   var _loc3_ = Number(info[2]) - Number(info[5]);
   if(Number(info[6]) == 1 || info[6] == undefined)
   {
      if(Number(info[2]) > 0)
      {
         slot.num = _loc3_;
      }
   }
   slot.SLOT.enabled = true;
   slot.setLineNum(2);
   slot.up_txt.html = true;
   slot.center_txt.html = true;
   slot.down_txt.html = true;
   slot.upText = info[3];
   itemNames[Number(info[0])] = info[3];
   slot.center_txt._visible = true;
   slot.center_txt._y = slot.down_txt._y;
   if(modeTapIs == 0)
   {
      slot.center_txt._width = 50;
      slot.center_txt.htmlText = "<img src=\'icon_buy\' vspace=\'-3\' width=\'16\' height=\'16\'><font color=\'#" + lib.info.TextColor.SLOT_HOMUN_BUY.toString(16) + "\'>" + lib.util.CurrencyFormat.makeComma(info[5]) + "</font>";
      if(slot.center_txt.maxscroll > 1)
      {
         slot.center_txt.htmlText = "<img src=\'icon_buy\' vspace=\'-3\' width=\'12\' height=\'12\'><font size=\'10\' color=\'#" + lib.info.TextColor.SLOT_HOMUN_BUY.toString(16) + "\'>" + lib.util.CurrencyFormat.makeComma(info[5]) + "</font>";
      }
      lib.manager.ToolTip.add(slot.center_txt,"$164015",1);
   }
   else
   {
      slot.center_txt._width = 50;
      slot.center_txt.htmlText = "<img src=\'icon_sale\' vspace=\'-3\' width=\'16\' height=\'16\'><font color=\'#" + lib.info.TextColor.SLOT_HOMUN_SALE.toString(16) + "\'>" + lib.util.CurrencyFormat.makeComma(info[5]) + "</font>";
      if(slot.center_txt.maxscroll > 1)
      {
         slot.center_txt.htmlText = "<img src=\'icon_sale\' vspace=\'-3\' width=\'12\' height=\'12\'><font size=\'10\' color=\'#" + lib.info.TextColor.SLOT_HOMUN_SALE.toString(16) + "\'>" + lib.util.CurrencyFormat.makeComma(info[5]) + "</font>";
      }
      lib.manager.ToolTip.add(slot.center_txt,"$164016",1);
   }
   var _loc4_ = lib.util.GoldCurrency.SetGoldText(info[4],0,0,0,goldType);
   slot.down_txt.textAutoSize = "shrink";
   slot.down_txt.htmlText = _loc4_;
   slot.down_txt._width = 125;
   slot.down_txt._x = 97;
   slot.id = info[0];
   slot.draw(info[1]);
   slot.grade = info[8];
   slot.sealType = info[9];
   slot.masterpiece = info[10];
   slot.disable = Number(info[7]);
   slot.drag = !venderActive;
   slot.showBg();
   slot.Slot.hideBg();
   if(_loc3_ == 0)
   {
      slot.Slot.num = 0;
   }
   venderStartBtn.setEnabled(totalCount > 0);
}
function listItemEnabled(flag)
{
   var _loc1_ = 0;
   while(_loc1_ < MAXIMUMS)
   {
      var _loc2_ = container_mc[UIname + "__" + _loc1_];
      _loc2_.drag = flag;
      _loc1_ = _loc1_ + 1;
   }
}
function venderStart()
{
   if(!venderActive)
   {
      ToGame_HomunVendorSet_RequestVendorStart();
   }
   else
   {
      ToGame_HomunVendorSet_RequestVendorStop();
   }
}
function changeVenderStartBtn()
{
   if(venderActive)
   {
      venderStartBtn.setEnabled(true);
      venderStartBtn.txt.text = "$164010";
   }
   else
   {
      venderStartBtn.txt.text = "$164009";
   }
   venderCloseBtn.setEnabled(!venderActive);
   listItemEnabled(!venderActive);
}
function release(num)
{
   ToGame_HomunVendorSet_RequestMode(num);
   tapselect(num);
}
var UI = this;
_global.gfxExtensions = true;
var UIname = "HomunVendorSet";
UI._visible = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_CONTENTS;
container_mc.explain_1.textColor = lib.info.TextColor.INPUT_LABEL;
container_mc.explain_2.textColor = lib.info.TextColor.INPUT_LABEL;
container_mc.money_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.impossibleInput._visible = false;
var MAXIMUMS = 10;
var MAXLINES = 5;
var MAXADSTRLENGTH = 150;
var venderType;
var modeTapIs;
var venderActive;
var totalCount = 0;
var aDeditable = true;
var itemNames = [];
var ADDITEMNAMECOUNT = 3;
var ad_txt = new lib.util.ExtTextField(container_mc.ad_txt,0,container_mc.ad_focus);
ad_txt.caption = lib.util.UIString.getUIString("$164006");
ad_txt.textField.selectable = false;
var STRBUY = lib.util.UIString.getUIString("$164013");
var STRSELL = lib.util.UIString.getUIString("$164014");
var NameTextLength_Local = 0;
container_mc.impossibleInput._visible = !ad_txt.textField.selectable;
ad_txt.onSetFocusEvent = function()
{
   if(this.text == this.caption)
   {
      this.textField.text = "";
   }
};
ad_txt.onKillFocusEvent = function()
{
   var _loc2_ = this.text;
   if(_loc2_ == this.caption)
   {
      _loc2_ = "";
   }
   _loc2_ = lib.util.ExtString.trim(_loc2_);
   _loc2_ = lib.util.ExtString.replace(_loc2_,"\r","");
   ToGame_HomunVendorSet_RequestSetAdMessage(_loc2_);
};
ad_txt.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc1_ = NameTextLength_Local;
   }
   else
   {
      _loc1_ = 300;
   }
   lib.util.StrByteLen.getLenth3(container_mc.ad_txt,_loc1_);
};
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
myListener.OnGame_HomunVendorSet_SetVendorType = function(type, _readOnly)
{
   venderType = Number(type);
   if(venderType == 0)
   {
      tab.setTab(0,1);
      tab.setVisible(1,false);
      tab.setText(0,"$164002");
   }
   else if(venderType == 1)
   {
      tab.setTab(0,1);
      tab.setVisible(1,false);
      tab.setText(0,"$164003");
   }
   else if(venderType == 2)
   {
      tab.setVisible(1,true);
      tab.setText(0,"$164002");
      tab.setText(1,"$164003");
   }
   if(_readOnly)
   {
      accountBtn.setVisible(false);
      venderStartBtn.setVisible(false);
      venderCloseBtn.setVisible(false);
      ad_txt.textField.selectable = false;
      listItemEnabled(false);
      delete myListener.OnGame_MouseDown;
      container_mc.impossibleInput._visible = true;
   }
};
var goldType = 0;
myListener.OnGame_HomunVendorSet_SetGoldType = function(type)
{
   goldType = Number(type);
};
myListener.OnGame_HomunVendorSet_SetInfo = function(_mode, money, adMessage, tax, actived)
{
   var _loc1_ = "";
   modeTapIs = Number(_mode);
   myListener.OnGame_HomunVendorSet_SetVendorActive(actived);
   if(Number(venderType) > 1)
   {
      tab.setTab(Number(modeTapIs),1);
   }
   var _loc2_ = lib.util.GoldCurrency.SetGoldText(String(money),0,0,0,goldType);
   container_mc.money_txt.htmlText = _loc2_;
   ad_txt.text = adMessage;
   container_mc.tax_txt.text = tax + "%";
   if(modeTapIs == 0)
   {
      container_mc.moneyLb.text = "$163012";
      _loc1_ = lib.info.ToolTipStr.HOMUNVEND_SELLGOLD;
   }
   else
   {
      container_mc.moneyLb.text = "$163013";
      _loc1_ = lib.info.ToolTipStr.HOMUNVEND_BUYGOLD;
   }
   lib.manager.ToolTip.add(container_mc.money_hit,_loc1_,1);
};
myListener.OnGame_HomunVendorSet_SetVendorActive = function(active)
{
   venderActive = Boolean(Number(active));
   ad_txt.textField.selectable = !venderActive && aDeditable;
   container_mc.impossibleInput._visible = !ad_txt.textField.selectable;
   changeVenderStartBtn();
};
myListener.OnGame_HomunVendorSet_SetTargetItemSlot = function(listData)
{
   listClear();
   listItemEnabled(!venderActive);
   listUpdate(listData);
   var _loc2_ = listData.split("\t");
};
myListener.OnGame_HomunVendorSet_SetVendorList = function(listData)
{
   listClear();
   listItemEnabled(!venderActive);
   listBuilder(listData);
};
myListener.OnGame_HomunVendorSet_SetTapState = function(tapid, _state)
{
   tab.setVisible(tapid,Number(_state));
};
myListener.OnGame_HomunVendorSet_SetEnableStartBtn = function(_state)
{
   venderStartBtn.setEnabled(Number(_state));
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(venderActive)
   {
      return undefined;
   }
   if(button == 2 && target._name == "SLOT")
   {
      var _loc2_ = target._parent._name;
      var _loc1_ = target._parent._parent._name;
      if(container_mc[_loc2_] != undefined)
      {
         var _loc3_ = _loc2_.split("__");
         if(_loc3_[0] == "HomunVendorSet")
         {
            ToGame_HomunVendorSet_RightClick(_loc3_[1]);
         }
      }
      else if(container_mc[_loc1_] != undefined)
      {
         _loc3_ = _loc1_.split("__");
         if(_loc3_[0] == "HomunVendorSet")
         {
            ToGame_HomunVendorSet_RightClick(_loc3_[1]);
         }
      }
   }
};
myListener.OnGame_HomunVendorSet_ADEditable = function(enable)
{
   aDeditable = Number(enable);
   ad_txt.textField.selectable = !venderActive && aDeditable;
   container_mc.impossibleInput._visible = !ad_txt.textField.selectable;
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var accountBtn = container_mc.txtBtn0.txtBtn;
var venderStartBtn = container_mc.txtBtn1.txtBtn;
var venderCloseBtn = container_mc.txtBtn2.txtBtn;
close_btn.setRelease(ToGame_HomunVendorSet_CloseUI);
x_btn.setRelease(ToGame_HomunVendorSet_CloseUI);
accountBtn.setRelease(ToGame_HomunVendorSet_RequestAccount);
venderStartBtn.setRelease(venderStart);
venderCloseBtn.setRelease(ToGame_HomunVendorSet_RequestVendorClose);
var tab = container_mc.tabBtn.tab;
tab.setRelease(release);
var i = 0;
while(i < 10)
{
   var slot = container_mc["HomunVendorSet__" + i];
   i++;
}
tab.setTab(0,1);
myListener.OnGame_HomunVendorSet_LengthLocal = function(lengthnum)
{
   NameTextLength_Local = lengthnum;
};
venderStartBtn.setEnabled(false);
ToGame_HomunVendorSet_Init();
