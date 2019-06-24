function broadCast(chatType, msg)
{
   var _loc1_ = 0;
   while(_loc1_ < chatObjects.length)
   {
      if(chatObjects[_loc1_].channelArr[chatType] == true)
      {
         chatObjects[_loc1_].textArr.push(msg);
         if(_loc1_ == 0)
         {
            if(mainOutput.curChatObj.isMaxScroll)
            {
               scrollBar.setIndex(mainOutput.curChatObj.textArr.length,mainOutput.curChatObj.textArr.length);
            }
            else
            {
               scrollBar.setIndex(mainOutput.curChatObj.scroll,mainOutput.curChatObj.textArr.length);
            }
         }
         if(chatObjects[_loc1_].maxLine < chatObjects[_loc1_].textArr.length)
         {
            chatObjects[_loc1_].textArr.shift();
         }
      }
      _loc1_ = _loc1_ + 1;
   }
   refreshTexts();
}
function refreshTexts()
{
   var _loc2_ = 0;
   container_mc.message_txt.htmlText = "";
   var _loc1_ = 0;
   while(_loc1_ < mainOutput.curChatObj.textArr.length)
   {
      container_mc.message_txt.appendHtml(mainOutput.curChatObj.textArr[_loc1_]);
      _loc1_ = _loc1_ + 1;
   }
   container_mc.message_txt.scroll = container_mc.message_txt.maxscroll;
}
function ToGame_Bargain_Init()
{
   fscommand("ToGame_Bargain_Init");
}
function ToGame_Bargain_CloseUI()
{
   fscommand("ToGame_Bargain_CloseUI");
}
function ToGame_Bargain_RequestShowMoneyInput()
{
   fscommand("ToGame_Bargain_RequestShowMoneyInput");
}
function ToGame_Bargain_ClickSellerConfirm()
{
   fscommand("ToGame_Bargain_ClickSellerConfirm");
}
function ToGame_Bargain_ClickBuyerConfirm()
{
   fscommand("ToGame_Bargain_ClickBuyerConfirm");
}
function ToGame_Bargain_Cancel()
{
   fscommand("ToGame_Bargain_Cancel");
}
_global.gfxExtensions = true;
var UI = this;
UI._visible = false;
var UIname = "Bargain";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var tipStr = lib.util.UIString.getUIString("$321047");
var tip_bargain_1 = lib.util.UIString.getUIString("$322012");
var countStr = lib.util.UIString.getUIString("$272013");
lib.util.ExtString.textCut(container_mc.tip_txt,tipStr + " - " + tip_bargain_1);
var processStrs0 = ["$322013","$322017","$322015","$322017"];
var processStrs1 = ["$322014","$322018","$322016","$322018"];
container_mc.realPrice.htmlText = lib.util.UIString.getUIString("$322005");
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
   _global.gbUIMode = bShow;
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
var viewSide = null;
var viewSideIndex;
myListener.OnGame_Bargain_SetMode = function(viewSide)
{
   viewSideIndex = viewSide = Number(viewSide);
   if(viewSide == 0)
   {
      UI.viewSide = "seller";
      buyer_btn.setEnabled(false);
      myListener.OnGame_Bargain_SetEnableMoneyInputBtn(false);
      buyer_btn.setVisible(false);
      input_btn.setVisible(false);
      seller_btn.setEnabled(true);
      seller_btn.setVisible(true);
      container_mc.realPrice_bg._width = 457;
      container_mc.realPrice_txt._width = 453;
   }
   else
   {
      UI.viewSide = "buyer";
      buyer_btn.setEnabled(true);
      myListener.OnGame_Bargain_SetEnableMoneyInputBtn(true);
      buyer_btn.setVisible(true);
      input_btn.setVisible(true);
      seller_btn.setEnabled(false);
      seller_btn.setVisible(false);
      container_mc.realPrice_bg._width = 324;
      container_mc.realPrice_txt._width = 320;
   }
};
var realPriceY = container_mc.realPrice._y;
var realPrice_txtY = container_mc.realPrice_txt._y;
var realPrice_txtX = container_mc.realPrice_txt._x;
var nrealPrice_txtX = 131;
var realPriceGoldX = container_mc.realPriceGold._x;
var nrealPriceGoldX = 437;
var realPriceGoldY = container_mc.realPriceGold._y;
var inputBtnY = container_mc.inputBtn._y;
myListener.OnGame_Bargain_SetSellerData = function(sellerName, itemData, wishPrice, wishMinPrice, bConfirmed)
{
   wishMinPrice = Number(wishMinPrice);
   container_mc.sellerName_txt.text = sellerName;
   var _loc8_ = lib.util.GoldCurrency.SetGoldText(wishPrice);
   container_mc.wishPrice_txt.htmlText = lib.util.UIString.getUIString("$191004") + "  " + "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc8_ + "</font>";
   if(wishMinPrice < 0 || wishMinPrice == "")
   {
      container_mc.wishMinPrice_txt._visible = false;
      container_mc.wishMinPrice._visible = false;
      container_mc.wishMinPriceGold._visible = false;
   }
   else
   {
      container_mc.wishMinPrice_txt._visible = true;
      container_mc.wishMinPrice._visible = true;
      container_mc.wishMinPriceGold._visible = true;
      container_mc.wishMinPrice_txt.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + lib.util.CurrencyFormat.makeComma(wishMinPrice) + "</font>";
   }
   bConfirmed = Number(bConfirmed);
   container_mc.sellerDim_mc.gotoAndStop(bConfirmed + 1);
   if(viewSide == "seller")
   {
      seller_btn.setVisible(!Boolean(Number(bConfirmed)));
      container_mc.processStr0.text = processStrs0[Number(bConfirmed)];
   }
   else
   {
      container_mc.processStr0.text = processStrs0[Number(bConfirmed) + 2];
   }
   container_mc.item_txt.verticalAlign = "center";
   var _loc1_ = itemData.split("\t");
   if(_loc1_[_loc1_.length - 1] == "undefined" || _loc1_[_loc1_.length - 1] == "")
   {
      _loc1_.pop();
   }
   var _loc12_ = Number(_loc1_[6]);
   var _loc11_ = Number(_loc1_[7]);
   var _loc2_ = container_mc.Slot;
   _loc2_.drag = false;
   _loc2_.TEX = _loc1_[0];
   _loc2_.draw(_loc1_[0]);
   _loc2_.grade = _loc1_[5];
   _loc2_.sealType = _loc1_[6];
   _loc2_.masterpiece = _loc1_[7];
   lib.manager.ToolTip.add(_loc2_.SLOT,0,6,_loc2_.Icon);
   var _loc9_ = Number(_loc1_[1]);
   var _loc6_ = Number(_loc1_[2]);
   var _loc7_ = Number(_loc1_[4]);
   var _loc3_ = "";
   if(_loc6_ > 0)
   {
      _loc3_ = "+" + _loc6_ + " " + _loc1_[3];
   }
   else
   {
      _loc3_ = _loc1_[3];
   }
   if(_loc9_ && _loc7_ > 0)
   {
      _loc3_ = _loc3_ + (" (" + _loc7_ + ")" + countStr);
   }
   var _loc10_ = lib.info.TextColor["RAREGRADE" + _loc2_.grade];
   container_mc.item_txt.textColor = _loc10_;
   container_mc.item_txt.text = _loc3_;
};
myListener.OnGame_Bargain_ResetChat = function()
{
   container_mc.output_mc.txt.htmlText = "";
   mainOutput.textArr = [];
   refreshTexts();
};
myListener.OnGame_Bargain_SetBuyerData = function(buyerName, realPrice, bConfirmed)
{
   container_mc.buyerName_txt.text = buyerName;
   var _loc2_ = lib.util.GoldCurrency.SetGoldText(realPrice);
   container_mc.realPrice_txt.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc2_ + "</font>";
   bConfirmed = Number(bConfirmed);
   container_mc.buyerDim_mc.gotoAndStop(bConfirmed + 1);
   if(viewSide == "seller")
   {
      container_mc.processStr1.text = processStrs1[Number(bConfirmed)];
   }
   else
   {
      buyer_btn.setVisible(!Boolean(Number(bConfirmed)));
      container_mc.processStr1.text = processStrs1[Number(bConfirmed) + 2];
   }
};
var chatColor_array = new Array();
var channel_7 = lib.util.UIString.getUIString("$031008");
var channel_8 = lib.util.UIString.getUIString("$031009");
chatColor_array[7] = {name:channel_7,color:49139};
chatColor_array[8] = {name:channel_8,color:49139};
chatColor_array[10] = {name:channel_8,color:16738047};
myListener.OnGame_Bargain_AddChat = function(chatType, msg, id)
{
   chatType = Number(chatType);
   var _loc3_ = "#" + chatColor_array[chatType].color.toString(16);
   var _loc2_ = "";
   var _loc4_ = false;
   var _loc5_ = undefined;
   if(chatType < 19)
   {
      _loc5_ = chatColor_array[chatType].name;
      _loc2_ = _loc2_ + ("<font color=\'" + _loc3_ + "\'>[" + _loc5_ + "]</font>");
   }
   if(chatType == 7 || chatType == 8 || chatType == 10)
   {
      _loc2_ = "<font color=\'" + _loc3_ + "\'>[" + id + "]" + lib.util.UIString.getUIString("$322011") + _loc2_ + " : </font>";
   }
   if(!_loc4_)
   {
      _loc2_ = _loc2_ + msg;
   }
   if(chatType > 19)
   {
      _loc2_ = _loc2_ + "\n";
   }
   broadCast(chatType,_loc2_);
};
myListener.OnGame_Bargain_SetEnableSellerConfirmBtn = function(bEnable)
{
   bEnable = Number(bEnable);
   seller_btn.setEnabled(bEnable);
};
myListener.OnGame_Bargain_SetEnableBuyerConfirmBtn = function(bEnable)
{
   bEnable = Number(bEnable);
   buyer_btn.setEnabled(bEnable);
};
myListener.OnGame_Bargain_SetEnableMoneyInputBtn = function(bEnable)
{
   bEnable = Number(bEnable);
   input_btn.setEnabled(bEnable);
};
var chargeStr = lib.util.UIString.getUIString("$530005");
myListener.OnGame_Bargain_SetCharge = function(cahrge)
{
   if(cahrge == "" || cahrge == "undefined")
   {
      return undefined;
   }
   var _loc1_ = lib.util.GoldCurrency.SetGoldText(cahrge);
   container_mc.charge_txt.htmlText = "<font color=\'#CC3300\'>" + chargeStr + ":</font> " + _loc1_;
};
var sc = container_mc.scrollBar;
sc.setTextField(container_mc.message_txt);
var scO = new Object();
sc.addListener(scO);
scO.onScroll = function(delta)
{
   if(delta > 0)
   {
      container_mc.message_txt.scroll = container_mc.message_txt.scroll + 1;
   }
   else
   {
      container_mc.message_txt.scroll = container_mc.message_txt.scroll - 1;
   }
};
sc.setWheel(container_mc.message_txt);
var mainOutput = new Object();
mainOutput.isMaxScroll = true;
mainOutput.scroll = 8;
mainOutput.mc = container_mc;
mainOutput.mc.xRatio = lib.info.AlignInfo.xPixelToRatio(mainOutput.mc._x);
mainOutput.mc.yRatio = lib.info.AlignInfo.xPixelToRatio(mainOutput.mc._y);
mainOutput.minW = 393;
mainOutput.minH = 181;
mainOutput.maxW = 800;
mainOutput.maxH = 600;
mainOutput.mcArr = new Array();
mainOutput.textArr = new Array();
mainOutput.channelArr = new Array(0,0,0,0,0,0,0,1,1,0,1);
mainOutput.channelArr[11] = mainOutput.channelArr[12] = mainOutput.channelArr[13] = mainOutput.channelArr[14] = mainOutput.channelArr[15] = mainOutput.channelArr[16] = mainOutput.channelArr[17] = mainOutput.channelArr[18] = 0;
mainOutput.channelArr[101] = mainOutput.channelArr[102] = mainOutput.channelArr[103] = mainOutput.channelArr[104] = mainOutput.channelArr[105] = 0;
mainOutput.channelArr[201] = mainOutput.channelArr[202] = mainOutput.channelArr[203] = mainOutput.channelArr[204] = mainOutput.channelArr[205] = mainOutput.channelArr[206] = mainOutput.channelArr[207] = mainOutput.channelArr[208] = mainOutput.channelArr[209] = mainOutput.channelArr[210] = mainOutput.channelArr[211] = mainOutput.channelArr[212] = 0;
mainOutput.maxLine = 150;
mainOutput.totalLine = 0;
mainOutput.currentLine = 1;
var chatObjects = new Array(mainOutput);
mainOutput.curChatObj = chatObjects[0];
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var cancel_btn = container_mc.txtBtn0.txtBtn;
var input_btn = container_mc.inputBtn.txtBtn;
var seller_btn = container_mc.sellerConfirmBtn.txtBtn;
var buyer_btn = container_mc.buyerConfirmBtn.txtBtn;
x_btn.setRelease(ToGame_Bargain_CloseUI);
cancel_btn.setRelease(ToGame_Bargain_Cancel);
input_btn.setRelease(ToGame_Bargain_RequestShowMoneyInput);
seller_btn.setRelease(ToGame_Bargain_ClickSellerConfirm);
buyer_btn.setRelease(ToGame_Bargain_ClickBuyerConfirm);
container_mc.realPrice.verticalAlign = "bottom";
ToGame_Bargain_Init();
