function ToGame_Store_StoreSlotLeftBtnClicked(slotName)
{
   lib.Debuger.trace("ToGame_Store_StoreSlotRightBtnClicked:" + slotName);
   getURL("FSCommand:ToGame_Store_StoreSlotLeftBtnClicked",slotName);
}
function ToGame_Store_StoreSlotRightBtnClicked(slotName)
{
   getURL("FSCommand:ToGame_Store_StoreSlotRightBtnClicked",slotName);
}
function ToGame_Store_ShoppingCartSlotRightBtnClicked(slotName)
{
   getURL("FSCommand:ToGame_Store_ShoppingCartSlotRightBtnClicked",slotName);
}
function ToGame_Store_ShoppingCartResult(bCommit)
{
   getURL("FSCommand:ToGame_Store_ShoppingCartResult",bCommit);
}
function ToGame_StoreWindow_CloseUI()
{
   fscommand("ToGame_StoreWindow_CloseUI");
}
function ToGame_Store_NextPage()
{
   fscommand("ToGame_Store_NextPage");
}
function ToGame_Store_PrevPage()
{
   fscommand("ToGame_Store_PrevPage");
}
function ToGame_Store_FirstPage()
{
   fscommand("ToGame_Store_FirstPage");
}
function ToGame_Store_LastPage()
{
   fscommand("ToGame_Store_LastPage");
}
function ToGame_StoreWindow_CloseUI()
{
   fscommand("ToGame_StoreWindow_CloseUI");
}
function ToGame_Store_CategorySelect(index)
{
   getURL("FSCommand:ToGame_Store_CategorySelect",index);
}
function closeUI()
{
   ToGame_Store_ShoppingCartResult(false);
   ToGame_StoreWindow_CloseUI();
}
function release()
{
   ToGame_Store_CategorySelect(tab.activedNum);
}
function setStoreMode(_mode, _mode2)
{
   storeMode = Number(_mode);
   if(storeMode == 1)
   {
      if(_mode2 == 0)
      {
         container_mc.cartFrame.gotoAndStop(2);
         container_mc.cartFrame.guideTxt.htmlText = lib.util.UIString.getUIString("$071013","fontColor",lib.info.TextColor.GENERAL_NOTICE_EMPHASIS.toString(16),"coinName",medalName);
         container_mc.cartFrame.txtLabel1.text = "";
         container_mc.cartFrame.txtLabel2.textAutoSize = "shrink";
         container_mc.cartFrame.txtLabel3.textAutoSize = "shrink";
         container_mc.cartFrame.txtLabel2.htmlText = lib.util.UIString.getUIString("$071014");
         container_mc.cartFrame.txtLabel3.htmlText = lib.util.UIString.getUIString("$071015");
         container_mc.cartFrame.txt2_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
         container_mc.cartFrame.txt3_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
         container_mc.cartFrame.txtLabel2.textColor = lib.info.TextColor.INPUT_LABEL;
         container_mc.cartFrame.txtLabel3.textColor = lib.info.TextColor.INPUT_LABEL;
         container_mc.cartFrame.txt1_txt._visible = false;
         container_mc.cartFrame.moneyIcon1._visible = false;
         container_mc.buy_container._visible = false;
         container_mc.sell_container._visible = false;
         container_mc.buy2_container._visible = true;
         var _loc1_ = flash.display.BitmapData.loadBitmap(medalImg);
         container_mc.cartFrame.moneyIcon2.attachBitmap(_loc1_,1);
         container_mc.cartFrame.moneyIcon3.attachBitmap(_loc1_,1);
         container_mc.cartFrame.moneyIcon2._width = 16;
         container_mc.cartFrame.moneyIcon2._height = 16;
         container_mc.cartFrame.moneyIcon3._width = 16;
         container_mc.cartFrame.moneyIcon3._height = 16;
      }
      else
      {
         container_mc.cartFrame.gotoAndStop(2);
         container_mc.cartFrame.guideTxt.htmlText = lib.util.UIString.getUIString("$071013","fontColor",lib.info.TextColor.GENERAL_NOTICE_EMPHASIS.toString(16),"coinName",medalName);
         container_mc.cartFrame.txtLabel1.text = "";
         container_mc.cartFrame.txtLabel2.textAutoSize = "shrink";
         container_mc.cartFrame.txtLabel3.textAutoSize = "shrink";
         container_mc.cartFrame.txtLabel2.htmlText = lib.util.UIString.getUIString("$071016");
         container_mc.cartFrame.txtLabel3.htmlText = lib.util.UIString.getUIString("$071017");
         container_mc.cartFrame.txt2_txt.textColor = 32511;
         container_mc.cartFrame.txt3_txt.textColor = 32511;
         container_mc.cartFrame.txtLabel2.textColor = lib.info.TextColor.INPUT_LABEL;
         container_mc.cartFrame.txtLabel3.textColor = lib.info.TextColor.INPUT_LABEL;
         container_mc.cartFrame.txt1_txt._visible = false;
         container_mc.cartFrame.moneyIcon1._visible = false;
         container_mc.buy_container._visible = false;
         container_mc.sell_container._visible = false;
         container_mc.buy2_container._visible = true;
         _loc1_ = flash.display.BitmapData.loadBitmap("img://__Icon_Items.ReputationPointCoin");
         container_mc.cartFrame.moneyIcon2.attachBitmap(_loc1_,1);
         container_mc.cartFrame.moneyIcon3.attachBitmap(_loc1_,1);
         container_mc.cartFrame.moneyIcon2._width = 16;
         container_mc.cartFrame.moneyIcon2._height = 16;
         container_mc.cartFrame.moneyIcon3._width = 16;
         container_mc.cartFrame.moneyIcon3._height = 16;
      }
   }
   else
   {
      _loc1_ = flash.display.BitmapData.loadBitmap("icon_money16");
      container_mc.buy2_container._visible = false;
   }
}
function calculatePageBtnWork(currentPage, maxPage)
{
   currentPage = Number(currentPage);
   maxPage = Number(maxPage);
   if(currentPage == 1)
   {
      enableSetter(container_mc.firstPage_btn,false);
      enableSetter(container_mc.prevPage_btn,false);
      if(maxPage > 1)
      {
         enableSetter(container_mc.nextPage_btn,true);
         enableSetter(container_mc.lastPage_btn,true);
      }
      else if(maxPage == 1)
      {
         enableSetter(container_mc.nextPage_btn,false);
         enableSetter(container_mc.lastPage_btn,false);
      }
   }
   else if(currentPage >= 1)
   {
      enableSetter(container_mc.firstPage_btn,true);
      enableSetter(container_mc.prevPage_btn,true);
      if(currentPage < maxPage)
      {
         enableSetter(container_mc.nextPage_btn,true);
         enableSetter(container_mc.lastPage_btn,true);
      }
      else if(currentPage == maxPage)
      {
         enableSetter(container_mc.nextPage_btn,false);
         enableSetter(container_mc.lastPage_btn,false);
      }
   }
}
function enableSetter(target, bEnable)
{
   target.enabled = bEnable;
   if(bEnable)
   {
      target._alpha = 100;
   }
   else
   {
      target.gotoAndStop(1);
      target._alpha = lib.info.TextColor.GENERAL_DISABLE_ALPHA;
   }
}
var UI = this;
UI._visible = false;
var UIname = "StoreWindow";
var goodsSlotPrefix = "store__";
var buySlotPrefix = "ShoppingCart__";
var sellSlotPrefix = "ShoppingCart__";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.scaleExpander.scaleExpanderEventCheck(UI,UIname);
container_mc.buy2_container._visible = false;
var i = 0;
while(i < 4)
{
   var txt = container_mc["txt" + i + "_txt"];
   txt.textColor = lib.info.TextColor.GENERAL_MONEY;
   i++;
}
container_mc.ShoppingCart__area.GetName = function()
{
   return this._name;
};
container_mc.text_name2.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.cartFrame.txt0_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.cartFrame.txt1_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.cartFrame.txt2_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.cartFrame.txt3_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.cartFrame.txtLabel3.textColor = lib.info.TextColor.INPUT_LABEL;
container_mc.cartFrame.txtLabel3.textAutoSize = "shrink";
container_mc.text_name2.textAutoSize = "shrink";
container_mc.text_name2.verticalAlign = "center";
var LEVEL_STR = lib.util.UIString.getUIString("$071009");
var currentpageNum = 0;
var totalpageNum = 0;
var buyContY = container_mc.buy_container._y;
var medalImg = "";
var medalName = "";
var calcState = false;
var SetReputation_Check = false;
bWidgetOpen = false;
var myListener = new Object();
var CustomScaleEvent;
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
   if(UI._visible == true)
   {
      CustomScaleEvent = new CustomScaleEvent();
      CustomScaleEvent.CustomScaleEventCheck(UI,UIname);
      UI.scaleExpander.scaleExpanderEventCheck(UI,UIname);
   }
   else
   {
      CustomScaleEvent.CustomScaleEventRemoveCheck();
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
var i = 0;
while(i < 10)
{
   var targetSlot = container_mc.goods_container[goodsSlotPrefix + i];
   lib.manager.ToolTip.add(targetSlot.SLOT,targetSlot.id + "\t0",6,targetSlot.Slot.Icon);
   i++;
}
var i = 0;
while(i < 16)
{
   if(i <= 7)
   {
      var targetSlot = container_mc.buy_container[buySlotPrefix + i];
      lib.manager.ToolTip.add(targetSlot.SLOT,targetSlot.index + "\t1",6,targetSlot.Icon);
   }
   else
   {
      var targetSlot = container_mc.sell_container[sellSlotPrefix + i];
      lib.manager.ToolTip.add(targetSlot.SLOT,targetSlot.index + "\t1",6,targetSlot.Icon);
   }
   i++;
}
var storeMode;
var goldType = 0;
myListener.OnGame_Store_SetGoldType = function(type)
{
   goldType = Number(type);
};
myListener.OnGame_Store_SetStoreSlot = function(currentPage, maxPage, slotDataList, _tabIndex)
{
   tab.setRelease(null);
   tab.setTab(Number(_tabIndex),1);
   tab.setRelease(release);
   setStoreMode(0);
   var _loc4_ = 0;
   while(_loc4_ < 10)
   {
      var _loc3_ = container_mc.goods_container[goodsSlotPrefix + _loc4_];
      _loc3_.clear();
      _loc3_.impossible = false;
      _loc3_.SLOT.enabled = false;
      _loc3_.hideBg();
      _loc4_ = _loc4_ + 1;
   }
   currentpageNum = Number(currentPage);
   totalpageNum = Number(maxPage);
   container_mc.numberSteper.setPage(Number(currentPage),Number(maxPage));
   var _loc5_ = slotDataList.split("\n");
   if(_loc5_[_loc5_.length - 1] == "0" || _loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
   {
      _loc5_.splice(_loc5_.length - 1,1);
   }
   _loc4_ = 0;
   while(_loc4_ < _loc5_.length)
   {
      var _loc2_ = _loc5_[_loc4_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc6_ = Number(_loc2_[0]);
         var _loc1_ = container_mc.goods_container[goodsSlotPrefix + _loc6_];
         _loc1_.SLOT.enabled = true;
         _loc1_.setLineNum(2);
         _loc1_.showMoney(true);
         _loc1_.money_mc._visible = false;
         _loc1_.id = _loc2_[1];
         _loc1_.draw(_loc2_[2]);
         _loc1_.grade = _loc2_[6];
         _loc1_.sealType = _loc2_[7];
         _loc1_.masterpiece = _loc2_[8];
         _loc1_.drag = true;
         _loc1_.showBg();
         _loc1_.Slot.hideBg();
         lib.manager.ToolTip.add(_loc1_.SLOT,_loc1_.id + "\t0",6,_loc1_.Slot.Icon);
         _loc1_.upText = _loc2_[3];
         _loc1_.down_txt._width = 125;
         _loc1_.down_txt._x = 97;
         _loc1_.down_txt.textAutoSize = "shrink";
         var _loc7_ = lib.util.GoldCurrency.SetGoldText(_loc2_[4],0,0,0,goldType);
         _loc1_.down_txt.htmlText = _loc7_;
         _loc1_.impossible = Number(_loc2_[5]);
      }
      _loc4_ = _loc4_ + 1;
   }
};
myListener.OnGame_Store_SetShoppingCartSlot = function(dataList)
{
   var _loc5_ = 0;
   while(_loc5_ < 16)
   {
      var _loc3_ = container_mc.buy_container[buySlotPrefix + _loc5_];
      if(storeMode == 1)
      {
         _loc3_ = container_mc.buy2_container[buySlotPrefix + _loc5_];
      }
      if(_loc5_ >= 8)
      {
         _loc3_ = container_mc.sell_container[sellSlotPrefix + _loc5_];
      }
      lib.manager.ToolTip.remove(_loc3_.SLOT);
      _loc3_.clear();
      _loc3_.impossible = false;
      catState = false;
      _loc5_ = _loc5_ + 1;
   }
   var _loc6_ = dataList.split("\n");
   if(_loc6_[_loc6_.length - 1] == "0" || _loc6_[_loc6_.length - 1] == "undefined" || _loc6_[_loc6_.length - 1] == "")
   {
      _loc6_.splice(_loc6_.length - 1,1);
   }
   _loc5_ = 0;
   while(_loc5_ < _loc6_.length)
   {
      catState = true;
      var _loc2_ = _loc6_[_loc5_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc4_ = Number(_loc2_[0]);
         var _loc1_ = container_mc.buy_container[buySlotPrefix + _loc4_];
         if(storeMode == 1)
         {
            _loc1_ = container_mc.buy2_container[buySlotPrefix + _loc4_];
         }
         if(_loc4_ >= 8)
         {
            _loc1_ = container_mc.sell_container[sellSlotPrefix + _loc4_];
         }
         _loc1_.setLineNum(2);
         _loc1_.showMoney(true);
         _loc1_.index = _loc2_[0];
         _loc1_.id = _loc2_[1];
         _loc1_.draw(_loc2_[2]);
         _loc1_.grade = _loc2_[7];
         _loc1_.sealType = _loc2_[9];
         _loc1_.masterpiece = _loc2_[10];
         lib.manager.ToolTip.add(_loc1_.SLOT,_loc1_.index + "\t1",6,_loc1_.Icon);
         _loc1_.upText = _loc2_[3];
         _loc1_.downText = lib.util.CurrencyFormat.makeComma(_loc2_[4]);
         if(Number(_loc2_[5]) != 0 && Number(_loc2_[5]) != undefined)
         {
            _loc1_.num_txt.text = _loc2_[5];
         }
         if(Number(_loc2_[6]) != 1)
         {
            _loc1_.num_txt.text = "";
         }
      }
      _loc5_ = _loc5_ + 1;
   }
   calculate_btn.setEnabled(calcState && catState);
};
myListener.OnGame_Store_SetShoppingCartMoneyData = function(dataList)
{
   var _loc1_ = dataList.split("\t");
   test_txt2.text = _loc1_[5];
   container_mc.cartFrame.txt0_txt.text = lib.util.CurrencyFormat.makeComma(_loc1_[0]);
   if(container_mc.cartFrame._currentframe == 1 && SetReputation_Check == false)
   {
      var _loc4_ = lib.util.GoldCurrency.SetGoldText(- _loc1_[1],0,0,0,goldType);
      var _loc5_ = lib.util.GoldCurrency.SetGoldText(_loc1_[3],0,0,0,goldType);
      container_mc.cartFrame.txt1_txt.htmlText = _loc4_;
      container_mc.cartFrame.txt2_txt.htmlText = _loc5_;
   }
   else
   {
      _loc4_ = lib.util.CurrencyFormat.makeComma(- _loc1_[1],0,0,0,goldType);
      _loc5_ = lib.util.CurrencyFormat.makeComma(_loc1_[3],0,0,0,goldType);
      container_mc.cartFrame.txt1_txt.htmlText = _loc4_;
      container_mc.cartFrame.txt2_txt.htmlText = _loc5_;
   }
   var _loc2_ = "";
   if(container_mc.cartFrame._currentframe == 1 && SetReputation_Check == false)
   {
      _loc2_ = lib.util.GoldCurrency.SetGoldText(_loc1_[5],0,0,0,goldType);
   }
   else
   {
      _loc2_ = lib.util.CurrencyFormat.makeComma(_loc1_[5]);
   }
   if(Number(_loc1_[5]) < 0)
   {
      if(container_mc.cartFrame._currentframe == 1 && SetReputation_Check == false)
      {
         var _loc3_ = lib.util.GoldCurrency.SetGoldText(- _loc1_[5],"","","-1",goldType);
         container_mc.cartFrame.txt3_txt.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16) + "\'>" + "-" + _loc3_ + "</font>";
         calcState = false;
      }
      else
      {
         container_mc.cartFrame.txt3_txt.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16) + "\'>" + _loc2_ + "</font>";
         calcState = false;
      }
   }
   else
   {
      container_mc.cartFrame.txt3_txt.htmlText = _loc2_;
      calcState = true;
   }
   if(SetReputation_Check == true)
   {
      container_mc.cartFrame.txt1_txt.textColor = 32511;
      container_mc.cartFrame.txt2_txt.textColor = 32511;
      container_mc.cartFrame.txt3_txt.textColor = 32511;
   }
   calculate_btn.setEnabled(calcState && catState);
};
myListener.OnGame_Store_SetCategory = function()
{
   var _loc2_ = 0;
   while(_loc2_ < 4)
   {
      tab.setVisible(_loc2_,false);
      if(arguments[_loc2_] != undefined && arguments[_loc2_] != "")
      {
         tab.setText(_loc2_,arguments[_loc2_]);
         tab.setVisible(_loc2_,true);
      }
      _loc2_ = _loc2_ + 1;
   }
};
var previewSlot;
myListener.OnGame_MedalStore_PreviewSlot = function(index)
{
   var _loc1_ = container_mc.goods_container[goodsSlotPrefix + index];
   if(_loc1_ == previewSlot)
   {
      return undefined;
   }
   _loc1_.active = true;
   previewSlot.active = false;
   previewSlot = _loc1_;
};
myListener.OnGame_MedalStore_SetGuideText = function(str)
{
   if(str == undefined || str == "")
   {
      return undefined;
   }
   container_mc.cartFrame.guideTxt.htmlText = str;
};
myListener.OnGame_MedalStore_SetStoreText = function(text0, text1)
{
   container_mc.cartFrame.txtLabel2.htmlText = text0;
   container_mc.cartFrame.txtLabel3.htmlText = text1;
};
myListener.OnGame_MedalStore_SetStoreSlot = function(currentPage, maxPage, slotDataList, _tabIndex, _medalImg, _medalName, SetReputation)
{
   medalImg = _medalImg;
   medalName = _medalName;
   tab.setRelease(null);
   tab.setTab(Number(_tabIndex),1);
   tab.setRelease(release);
   setStoreMode(1,SetReputation);
   if(SetReputation == 1)
   {
      SetReputation_Check = true;
   }
   else
   {
      SetReputation_Check = false;
   }
   var _loc5_ = 0;
   while(_loc5_ < 10)
   {
      var _loc4_ = container_mc.goods_container[goodsSlotPrefix + _loc5_];
      _loc4_.clear();
      _loc4_.impossible = false;
      _loc4_.SLOT.enabled = false;
      _loc4_.hideBg();
      _loc4_.reputation_txt.htmlText = "";
      lib.util.DrawBitmap.clear(_loc4_.medalIcon);
      calculate_btn.setEnabled(false);
      _loc5_ = _loc5_ + 1;
   }
   currentpageNum = Number(currentPage);
   totalpageNum = Number(maxPage);
   container_mc.numberSteper.setPage(Number(currentPage),Number(maxPage));
   var _loc8_ = slotDataList.split("\n");
   if(_loc8_[_loc8_.length - 1] == "0" || _loc8_[_loc8_.length - 1] == "undefined" || _loc8_[_loc8_.length - 1] == "")
   {
      _loc8_.splice(_loc8_.length - 1,1);
   }
   _loc5_ = 0;
   while(_loc5_ < _loc8_.length)
   {
      var _loc3_ = _loc8_[_loc5_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc6_ = Number(_loc3_[0]);
         var _loc2_ = container_mc.goods_container[goodsSlotPrefix + _loc6_];
         _loc2_.SLOT.enabled = true;
         if(Number(_loc3_[6]) == 0)
         {
            _loc2_.setLineNum(2);
         }
         else
         {
            _loc2_.setLineNum(3);
         }
         _loc2_.showMoney(true);
         _loc2_.money_mc._visible = false;
         if(_loc2_.medalIcon == undefined)
         {
            var _loc7_ = _loc2_.createEmptyMovieClip("medalIcon",_loc2_.getNextHighestDepth());
            _loc7_._x = _loc2_.money_mc._x;
            _loc7_._y = _loc2_.money_mc._y;
         }
         if(SetReputation == 0)
         {
            lib.util.DrawBitmap.draw(_loc2_.medalIcon,_medalImg,16,16);
         }
         else
         {
            lib.util.DrawBitmap.draw(_loc2_.medalIcon,"img://__Icon_Items.ReputationPointCoin",16,16);
         }
         _loc2_.index = _loc6_;
         _loc2_.id = _loc3_[1];
         _loc2_.draw(_loc3_[2]);
         _loc2_.grade = _loc3_[7];
         _loc2_.sealType = _loc3_[8];
         _loc2_.masterpiece = _loc3_[9];
         _loc2_.upText = _loc3_[3];
         _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc3_[4]);
         _loc2_.down_txt._width = 133.9;
         _loc2_.down_txt.textAutoSize = "shrink";
         _loc2_.impossible = Number(_loc3_[5]);
         _loc2_.drag = true;
         _loc2_.showBg();
         _loc2_.Slot.hideBg();
         _loc2_.onRelease2 = function()
         {
            ToGame_Store_StoreSlotLeftBtnClicked(this._name);
         };
         if(SetReputation == 0)
         {
            _loc2_.down_txt._x = 71.5;
            _loc2_.down_txt.textColor = 15772743;
         }
         else
         {
            var _loc9_ = lib.util.CurrencyFormat.makeComma(_loc3_[4]);
            _loc2_.down_txt._x = 71.5;
            _loc2_.down_txt.htmlText = _loc9_;
            _loc2_.down_txt.textColor = 32511;
         }
         if(Number(_loc3_[6]) != 0)
         {
            _loc2_.center_txt.textColor = lib.info.TextColor.CHAT_SYSTEM_INFO_GUILD;
            _loc2_.centerText = LEVEL_STR + " " + _loc3_[6];
         }
         lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.id + "\t0",6,_loc2_.Slot.Icon);
      }
      _loc5_ = _loc5_ + 1;
   }
};
myListener.OnGame_MedalStore_SetShoppingCartMedalData = function(dataList, SetReputation)
{
   if(SetReputation == 1)
   {
      SetReputation_Check = true;
   }
   else
   {
      SetReputation_check = false;
   }
   if(storeMode == 0)
   {
      return undefined;
   }
   var _loc2_ = dataList.split("\n");
   var _loc1_ = _loc2_[0].split("\t");
   container_mc.cartFrame.txt2_txt.text = lib.util.CurrencyFormat.makeComma(_loc1_[0]);
   if(Number(_loc1_[1]) < 0)
   {
      container_mc.cartFrame.txt3_txt.htmlText = lib.util.CurrencyFormat.makeComma(_loc1_[1]);
      calcState = false;
   }
   else
   {
      container_mc.cartFrame.txt3_txt.htmlText = lib.util.CurrencyFormat.makeComma(_loc1_[1]);
      calcState = true;
   }
   calculate_btn.setEnabled(calcState && catState);
   if(SetReputation == 1)
   {
      container_mc.cartFrame.txt3_txt.textColor = 32511;
   }
};
myListener.OnGame_MedalStore_SetTitle = function(_title)
{
   container_mc.text_name2.text = _title;
};
myListener.OnGame_Store_SetTab = function(stat)
{
   tab.setTab(stat,1);
};
myListener.OnGame_MouseDown = function(button, target)
{
   var _loc1_ = target.GetName();
   if(button == 2 && _loc1_ != undefined && _loc1_ != "ShoppingCart__area" && (target._parent._parent._parent._parent.UIname == UIname || target._parent._parent._parent.UIname == UIname))
   {
      if(_loc1_.substr(0,14) == buySlotPrefix)
      {
         ToGame_Store_ShoppingCartSlotRightBtnClicked(_loc1_);
      }
      else if(_loc1_.substr(0,7) == goodsSlotPrefix)
      {
         ToGame_Store_StoreSlotRightBtnClicked(_loc1_);
      }
   }
   else if(button == 2 && _loc1_ != undefined && _loc1_ != "ShoppingCart__area" && (target._parent._parent._parent._parent._parent.UIname == UIname || target._parent._parent._parent.UIname == UIname))
   {
      if(_loc1_.substr(0,7) == goodsSlotPrefix)
      {
         ToGame_Store_StoreSlotRightBtnClicked(_loc1_);
      }
   }
};
_global.EventBroadCaster.addListener(myListener);
var calculate_btn = container_mc.txtBtn0.txtBtn;
var close_btn = new lib.util.TxtBtn(container_mc.close_mc,container_mc.close_txt);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
calculate_btn.setEnabled(false);
calculate_btn.setRelease(aaaa = function()
{
   ToGame_Store_ShoppingCartResult(true);
});
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
var tab = container_mc.tabBtn.tab;
tab.setRelease(release);
container_mc.numberSteper.onChanged = function(page)
{
   if(1 == page)
   {
      ToGame_Store_FirstPage();
   }
   else if(page == totalpageNum)
   {
      ToGame_Store_LastPage();
   }
   else if(currentpageNum < page)
   {
      ToGame_Store_NextPage();
   }
   else if(currentpageNum > page)
   {
      ToGame_Store_PrevPage();
   }
};
container_mc.firstPage_btn.onRollOver = function()
{
   this.gotoAndStop(2);
};
container_mc.firstPage_btn.onRollOut = container_mc.firstPage_btn.onReleaseOutside = function()
{
   this.gotoAndStop(1);
};
container_mc.firstPage_btn.onPress = function()
{
   this.gotoAndStop(3);
};
container_mc.firstPage_btn.onRelease = function()
{
   this.gotoAndStop(2);
   ToGame_Store_FirstPage();
};
container_mc.prevPage_btn.onRollOver = function()
{
   this.gotoAndStop(2);
};
container_mc.prevPage_btn.onRollOut = container_mc.prevPage_btn.onReleaseOutside = function()
{
   this.gotoAndStop(1);
};
container_mc.prevPage_btn.onPress = function()
{
   this.gotoAndStop(3);
};
container_mc.prevPage_btn.onRelease = function()
{
   this.gotoAndStop(2);
   ToGame_Store_PrevPage();
};
container_mc.nextPage_btn.onRollOver = function()
{
   this.gotoAndStop(2);
};
container_mc.nextPage_btn.onRollOut = container_mc.nextPage_btn.onReleaseOutside = function()
{
   this.gotoAndStop(1);
};
container_mc.nextPage_btn.onPress = function()
{
   this.gotoAndStop(3);
};
container_mc.nextPage_btn.onRelease = function()
{
   this.gotoAndStop(2);
   ToGame_Store_NextPage();
};
container_mc.lastPage_btn.onRollOver = function()
{
   this.gotoAndStop(2);
};
container_mc.lastPage_btn.onRollOut = container_mc.lastPage_btn.onReleaseOutside = function()
{
   this.gotoAndStop(1);
};
container_mc.lastPage_btn.onPress = function()
{
   this.gotoAndStop(3);
};
container_mc.lastPage_btn.onRelease = function()
{
   this.gotoAndStop(2);
   ToGame_Store_LastPage();
};
fscommand("ToGame_Store_Init");
