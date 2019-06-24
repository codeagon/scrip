function createSlot(parentMc, slotName)
{
   for(var _loc2_ in parentMc)
   {
      if(typeof parentMc[_loc2_] == "movieclip")
      {
         lib.manager.ToolTip.remove(parentMc[_loc2_].SLOT);
         parentMc[_loc2_].removeMovieClip();
      }
   }
   var _loc3_ = parentMc.attachMovie("slot",slotName,parentMc.getNextHighestDepth());
   return _loc3_;
}
function setFocusEvent(mc)
{
   focusID = mc.iData[0];
   focusPoint = mc.iData[3];
   var _loc3_ = shopMc["item_" + prevPocus].focusMc;
   _loc3_.gotoAndStop(1);
   prevPocus = focusID;
   var _loc4_ = shopMc["item_" + prevPocus].focusMc;
   _loc4_.gotoAndStop(4);
   var _loc2_ = BTM_STR_0 + mc.iData[1];
   if(mc.iData[6] != undefined)
   {
      var _loc5_ = gradeType[mc.iData[6]];
      _loc2_ = _loc2_ + (" " + lib.util.UIString.getUIString("$128018","rank",_loc5_));
   }
   _loc2_ = _loc2_ + ("   <font color=\'#FFC22E\'>" + lib.util.CurrencyFormat.makeComma(focusPoint) + "P</font>");
   btmMc.pocusTxt.htmlText = _loc2_;
   visibleButton(true);
   ToGame_CustomCastle_ItemClick(focusID);
}
function ToGame_CustomCastle_Init()
{
   fscommand("ToGame_CustomCastle_Init");
}
function ToGame_CustomCastle_Close()
{
   fscommand("ToGame_CustomCastle_Close");
}
function ToGame_CustomCastle_EditModeClose()
{
   fscommand("ToGame_CustomCastle_EditModeClose");
}
function ToGame_CustomCastle_EditApply()
{
   fscommand("ToGame_CustomCastle_EditApply");
}
function ToGame_CustomCastle_ItemClick(slotId)
{
   getURL("FSCommand:ToGame_CustomCastle_ItemClick",slotId);
}
function ToGame_CustomCastle_ItemBuy()
{
   fscommand("ToGame_CustomCastle_ItemBuy");
}
function ToGame_CustomCastle_ItemWear()
{
   fscommand("ToGame_CustomCastle_ItemWear");
}
function ToGame_CustomCastle_ItemClear()
{
   fscommand("ToGame_CustomCastle_ItemClear");
}
function ToGame_CustomCastle_PreviewButton()
{
   fscommand("ToGame_CustomCastle_PreviewButton");
}
function ToGame_CustomCastle_SlotClick(slotId)
{
   getURL("FSCommand:ToGame_CustomCastle_SlotClick",slotId);
}
function ToGame_CustomCastle_Tab(index)
{
   getURL("FSCommand:ToGame_CustomCastle_Tab",index);
}
function ToGame_CustomCastle_ComboBox(index)
{
   getURL("FSCommand:ToGame_CustomCastle_ComboBox",index);
}
function ToGame_CustomCastle_Page(index)
{
   getURL("FSCommand:ToGame_CustomCastle_Page",index);
}
function ToGame_CustomCastle_PopupClick()
{
   getURL("FSCommand:ToGame_CustomCastle_PopupClick",focusID + "\t" + popupMc.InputMc.text);
}
function ToGame_CustomCastle_PopupClose()
{
   myListener.OnGame_CustomCastle_Popup(false);
}
function tab_release(num, noRequestEvent)
{
   if(prevTab == num)
   {
      return undefined;
   }
   prevTab = num;
   prevPocus = null;
   if(noRequestEvent == "0")
   {
      ToGame_CustomCastle_Tab(num);
   }
}
function setItem(mc, itemData)
{
   var _loc1_ = lib.util.ExtString.split(itemData,"\t");
   var _loc5_ = lib.util.ExtString.split(_loc1_[0],"_");
   var _loc11_ = _loc1_[1];
   var _loc10_ = _loc1_[2];
   var _loc7_ = "";
   var _loc3_ = "";
   lib.display.DrawBitmapData.draw(mc.img,_loc10_,0,0,0,0,ITEM_WSIZE,ITEM_HSIZE,1);
   if(_loc1_[4] > 0)
   {
      if(_loc1_[5] > 0)
      {
         _loc3_ = STATE_STR_0 + ":<font color=\'#00e5f9\'>" + _loc1_[5] + "</font>/" + _loc1_[4];
      }
      else
      {
         _loc3_ = STATE_STR_0 + ":" + _loc1_[5] + "/" + _loc1_[4];
      }
   }
   else
   {
      _loc3_ = STATE_STR_1 + ":<font color=\'#ba1010\'>0</font>";
   }
   var _loc8_ = _loc1_[3];
   if(userPoint < _loc8_)
   {
      _loc7_ = "<font color=\'#ba1010\'>" + lib.util.CurrencyFormat.makeComma(_loc8_) + "P</font>";
   }
   else
   {
      _loc7_ = lib.util.CurrencyFormat.makeComma(_loc8_) + "P";
   }
   var _loc4_ = _loc1_[6];
   var _loc6_ = 0;
   if(_loc5_[0] == "3")
   {
      _loc6_ = 6;
   }
   else
   {
      _loc6_ = Number(_loc5_[2]);
   }
   if(_loc4_ != undefined)
   {
      mc.gradeTxt.text = gradeType[_loc4_];
      mc.gradeMc.gotoAndStop(Number(_loc4_) + 1);
   }
   if(_loc1_[4] == 0)
   {
      var _loc9_ = new flash.geom.Transform(mc.img);
      _loc9_.colorTransform = lib.info.ColorTrans.popupDisableTrans();
      mc.img._alpha = 60;
   }
   mc.styleMc.gotoAndStop(_loc6_);
   mc.itemN.setText(_loc11_);
   mc.count.setText(_loc3_);
   mc.point.setText(_loc7_);
   lib.manager.ToolTip.remove(mc.hit);
   lib.manager.ToolTip.add(mc.hit,_loc5_[3],6);
}
function setButton(mc, btnMode, tipText)
{
   if(btnMode == -1)
   {
      mc._visible = false;
   }
   else
   {
      mc._visible = true;
      var _loc4_ = !Boolean(Number(btnMode));
      _root.setDisableUI(mc,_loc4_);
   }
   lib.manager.ToolTip.remove(mc);
   if(tipText != undefined && tipText != "")
   {
      lib.manager.ToolTip.add(mc,tipText,1);
   }
}
function visibleButton(btnMode)
{
   btmMc.buyBtn._visible = btnMode;
   btmMc.wearBtn._visible = btnMode;
   btmMc.clearBtn._visible = btnMode;
   btmMc.previewBtn._visible = btnMode;
}
function setPosition(mc, index)
{
   if(index > itemMax)
   {
      return undefined;
   }
   var _loc2_ = ITEMBOX_X + int(index % 5) * ITEMBOX_WID;
   var _loc1_ = ITEMBOX_Y + int(index / 5) * ITEMBOX_HIG;
   mc._x = _loc2_;
   mc._y = _loc1_;
}
function inputEvent()
{
   var _loc2_ = popupMc.InputMc.text;
   popupMc.inputTxt.text = _loc2_;
   var _loc4_ = focusPoint * _loc2_;
   var _loc1_ = userPoint - _loc4_;
   var _loc5_ = "-" + lib.util.CurrencyFormat.makeComma(_loc4_) + "P";
   var _loc3_ = "";
   var _loc6_ = popupMc.itemN.text + "x" + _loc2_;
   if(_loc1_ >= 0)
   {
      _loc3_ = "<font color=\'#ffc22e\'>" + lib.util.CurrencyFormat.makeComma(_loc1_) + "P</font>";
      popUp_BuyBtn.setEnabled(true);
   }
   else
   {
      _loc3_ = "<font color=\'#ba1010\'>" + lib.util.CurrencyFormat.makeComma(_loc1_) + "P</font>";
      popUp_BuyBtn.setEnabled(false);
   }
   popupMc.pointTxt1.setText(_loc5_);
   popupMc.pointTxt2.setText(_loc3_);
   popupMc.buyName.setText(_loc6_);
}
function customRateTimeFlow()
{
   var _loc3_ = SetRateTime + 60;
   var _loc4_ = btmMc.timeTxt;
   var _loc2_ = int(Number(_loc3_) / 3600);
   var _loc1_ = int(Number(_loc3_) % 3600 / 60);
   if(_loc2_ < 10)
   {
      _loc2_ = "0" + _loc2_;
   }
   if(_loc1_ < 10)
   {
      _loc1_ = "0" + _loc1_;
   }
   var _loc5_ = lib.util.UIString.getUIString("$128021","hour",_loc2_) + lib.util.UIString.getUIString("$128022","minute",_loc1_);
   SetRateTime = SetRateTime - 1;
   if(SetRateTime < 1)
   {
      clearInterval(intervalId);
      intervalId = null;
   }
   _loc4_.htmlText = _loc5_;
}
function hideEvent(bHide)
{
   _root.container_logout_mc._visible = !bHide;
   _root.container_mainmenu_mc._visible = !bHide;
   _root.container_question_mc._visible = !bHide;
   _root.container_villager_mc._visible = !bHide;
   _root.container_battleUp_mc._visible = !bHide;
   _root.container_normal_mc._visible = !bHide;
   _root.container_battle_mc._visible = !bHide;
   _root.container_overlayMap_mc._visible = !bHide;
   _root.container_chat_mc._visible = !bHide;
   _root.container_inGameMovie_mc._visible = !bHide;
   _root.container_mainmenuUpside_mc._visible = !bHide;
   _root.container_highDepth_mc._visible = !bHide;
}
function DisableUI(bTrue)
{
   _root.setDisableUI(customMc,bTrue);
   _root.setDisableUI(shopMc,bTrue);
   _root.setDisableUI(btmMc,bTrue);
}
var UI = this;
UI._visible = false;
var UIname = "CustomCastle";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var ICON_SIZE = 48;
var RESCALE = ICON_SIZE / 64;
var comboListner = {};
var itemMax = 10;
var itemStyle = ["","$128009","$128010","$128011","$128012"];
var gradeType = ["","C","B","A"];
var STATE_STR_0 = lib.util.UIString.getUIString("$128019");
var STATE_STR_1 = lib.util.UIString.getUIString("$128020");
var BTM_STR_0 = lib.util.UIString.getUIString("$128033");
var ITEM_WSIZE = 128;
var ITEM_HSIZE = 128;
var ITEMBOX_WID = 154;
var ITEMBOX_HIG = 203;
var ITEMBOX_X = 16;
var ITEMBOX_Y = -507;
var userPoint = 0;
var SetRateTime = 0;
var intervalId;
var focusID = null;
var focusPoint = 0;
var prevPocus = null;
var prevTab = -1;
var userRank = 0;
popupMc._visible = false;
comboListner.onChanged = function(mc, id, index)
{
   if(id == undefined)
   {
      return undefined;
   }
   ToGame_CustomCastle_ComboBox(index);
};
shopMc.pageMc.setPage(0,0);
shopMc.pageMc.onChanged = function(page)
{
   ToGame_CustomCastle_Page(page);
};
myListener.OnGame_CustomCastle_Tab("",0);
popupMc.InputMc.onChanged = function()
{
   inputEvent();
};
popupMc.btnMc.txt.setText("$128013");
var popUp_BuyBtn = new lib.util.TxtBtn(popupMc.btnMc.btn,popupMc.btnMc.txt);
popUp_BuyBtn.setRelease(ToGame_CustomCastle_PopupClick);
var popUp_CloseBtn = new lib.util.TxtBtn(popupMc.xBtn);
popUp_CloseBtn.setRelease(ToGame_CustomCastle_PopupClose);
btmMc.closeBtn.txt.setText("$128015");
var close_Btn = new lib.util.TxtBtn(btmMc.closeBtn.btn,btmMc.closeBtn.txt);
close_Btn.setRelease(ToGame_CustomCastle_EditModeClose);
btmMc.applyBtn.txt.setText("$128016");
var apply_Btn = new lib.util.TxtBtn(btmMc.applyBtn.btn,btmMc.applyBtn.txt);
apply_Btn.setRelease(ToGame_CustomCastle_EditApply);
btmMc.buyBtn.txt.setText("$128013");
var buy_Btn = new lib.util.TxtBtn(btmMc.buyBtn.btn,btmMc.buyBtn.txt);
buy_Btn.setRelease(ToGame_CustomCastle_ItemBuy);
btmMc.wearBtn.txt.setText("$128014");
var wear_Btn = new lib.util.TxtBtn(btmMc.wearBtn.btn,btmMc.wearBtn.txt);
wear_Btn.setRelease(ToGame_CustomCastle_ItemWear);
btmMc.clearBtn.txt.setText("$128028");
var clear_Btn = new lib.util.TxtBtn(btmMc.clearBtn.btn,btmMc.clearBtn.txt);
clear_Btn.setRelease(ToGame_CustomCastle_ItemClear);
btmMc.previewBtn.txt.setText("$128029");
var preview_Btn = new lib.util.TxtBtn(btmMc.previewBtn.btn,btmMc.previewBtn.txt);
preview_Btn.setRelease(ToGame_CustomCastle_PreviewButton);
visibleButton(false);
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
         hideEvent(true);
      }
      else
      {
         UI._visible = false;
         clearInterval(intervalId);
         hideEvent(false);
      }
   }
};
myListener.OnGame_ChangeStageSize = function(width, height)
{
   var _loc2_ = lib.info.AlignInfo.yRatioToPixel(1);
   var _loc1_ = lib.info.AlignInfo.yRatioToPixel(100);
   titleMc._y = _loc2_;
   customMc._y = _loc2_ + 90;
   shopMc._y = _loc1_;
   popupMc._y = _loc1_;
   btmMc._y = _loc1_;
};
myListener.OnGame_CustomCastle_Title = function(guildName, rank)
{
   var _loc2_ = lib.util.UIString.getUIString("$128017","guildName",guildName) + lib.util.UIString.getUIString("$128018","rank",rank);
   titleMc.txt.htmlText = _loc2_;
   var _loc1_ = titleMc.txt.textWidth;
   titleMc.txt._width = _loc1_ + 20;
   titleMc.bg._width = _loc1_ + 200;
   userRank = 4 - rank;
};
myListener.OnGame_CustomCastle_SetTime = function(num)
{
   if(num != undefined && num != null)
   {
      SetRateTime = num;
   }
   else
   {
      SetRateTime = 0;
   }
   customRateTimeFlow();
   clearInterval(intervalId);
   intervalId = setInterval(customRateTimeFlow,1000);
};
myListener.OnGame_CustomCastle_Slot = function(slotId, slotMode, img)
{
   var _loc5_ = lib.util.ExtString.split(slotId,"_");
   var _loc4_ = String(_loc5_[0]);
   var _loc3_ = String(_loc5_[1]);
   var _loc7_ = String(_loc5_[2]);
   var _loc8_ = _loc5_[3];
   var _loc9_ = "CustomCastle__" + _loc4_ + "_" + _loc3_ + "_" + _loc7_ + "_" + _loc8_;
   var _loc1_ = customMc["slotMc" + _loc4_ + "_" + _loc3_];
   if(!_loc1_)
   {
      if(_loc4_ == 2)
      {
         _loc1_ = customMc.attachMovie("slotMc2","slotMc2_" + _loc3_,customMc.getNextHighestDepth());
         _loc1_._x = 128 + 77 * (_loc3_ - 1);
         _loc1_._y = 88;
      }
      else if(_loc4_ == 3)
      {
         _loc1_ = customMc.attachMovie("slotMc3","slotMc3_" + _loc3_,customMc.getNextHighestDepth());
         _loc1_._x = 128 + 60 * (_loc3_ - 1);
         _loc1_._y = 293;
      }
      else if(_loc4_ == 1)
      {
         _loc1_ = customMc.attachMovie("slotMc1","slotMc1_" + _loc3_,customMc.getNextHighestDepth());
         _loc1_._x = 128;
         _loc1_._y = 5;
      }
   }
   var _loc2_ = createSlot(_loc1_["sid" + _loc7_],_loc9_);
   _loc2_.Type = _loc4_;
   if(img != "" && img != undefined)
   {
      lib.display.DrawBitmapData.draw(_loc2_.Icon,img,0,0,0,0,ICON_SIZE,ICON_SIZE,RESCALE);
      _loc2_.Icon.TEX = img;
      _loc2_.Id = slotId;
      lib.manager.ToolTip.add(_loc2_.SLOT,_loc8_,6,_loc2_.Icon);
   }
   _loc2_.previewMc.gotoAndStop(Number(slotMode) + 1);
};
myListener.OnGame_CustomCastle_Tab = function(dataList, initFocus)
{
   shopMc.tabBtn.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      if(dataList != "" && dataList != undefined)
      {
         this.tab.clear();
         var _loc2_ = lib.util.ExtString.split(dataList,"\t");
         this.labels = _loc2_;
         this.tab.setRelease(tab_release);
      }
      this.tab.setTab(initFocus,1);
   };
};
myListener.OnGame_CustomCastle_ComboBox = function(listData, initFocus)
{
   shopMc.comboBox.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      var _loc2_ = lib.util.ExtString.split(listData,"\t");
      this.removeListener(comboListner);
      this.data = _loc2_;
      this.selectedIndex = initFocus;
      this.addListener(comboListner);
   };
};
myListener.OnGame_CustomCastle_Page = function(current, total)
{
   shopMc.pageMc.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      this.setPage(Number(current),Number(total));
   };
};
myListener.OnGame_CustomCastle_Point = function(num, tipTxt)
{
   userPoint = num;
   var _loc1_ = lib.util.CurrencyFormat.makeComma(num) + "P";
   btmMc.pointTxt.setText(_loc1_);
   lib.manager.ToolTip.remove(btmMc.pointTxt);
   lib.manager.ToolTip.add(btmMc.pointTxt,tipTxt,1);
};
var itemCount = [];
myListener.OnGame_CustomCastle_ShopItem = function(itemData, slotMode)
{
   var _loc4_ = lib.util.ExtString.split(itemData,"\t");
   var _loc3_ = _loc4_[0];
   var _loc2_ = shopMc["item_" + _loc3_];
   if(!_loc2_)
   {
      if(itemCount.length >= itemMax)
      {
         return undefined;
      }
      _loc2_ = shopMc.attachMovie("item","item_" + _loc3_,shopMc.getNextHighestDepth());
      itemCount.push(_loc2_);
      var _loc5_ = itemCount.length - 1;
      setPosition(_loc2_,_loc5_);
   }
   if(prevPocus != null)
   {
      shopMc["item_" + prevPocus].focusMc.gotoAndStop(4);
   }
   _loc2_.iData = _loc4_;
   setItem(_loc2_,itemData);
   _loc2_.onRollOver = function()
   {
      if(prevPocus == this.iData[0])
      {
         return undefined;
      }
      this.focusMc.gotoAndStop(2);
   };
   _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
   {
      if(prevPocus == this.iData[0])
      {
         return undefined;
      }
      this.focusMc.gotoAndStop(1);
   };
   _loc2_.onPress = function()
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      this.focusMc.gotoAndStop(3);
   };
   _loc2_.onRelease = function()
   {
      setFocusEvent(this);
   };
   _loc2_.gotoAndStop(Number(slotMode) + 1);
};
myListener.OnGame_CustomCastle_ShopItemAllClear = function()
{
   var _loc3_ = itemCount.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc2_ = itemCount[_loc1_];
      if(_loc2_)
      {
         _loc2_.removeMovieClip();
      }
      _loc1_ = _loc1_ + 1;
   }
   itemCount = [];
};
myListener.OnGame_CustomCastle_Popup = function(view, itemData, steperData)
{
   var _loc1_ = Boolean(Number(view));
   popupMc._visible = _loc1_;
   DisableUI(_loc1_);
   if(!_loc1_)
   {
      return undefined;
   }
   setItem(popupMc,itemData);
   var _loc2_ = lib.util.ExtString.split(steperData,"\t");
   popupMc.InputMc.min = Number(_loc2_[0]);
   popupMc.InputMc.max = Number(_loc2_[1]);
   popupMc.InputMc.text = popupMc.inputTxt.text = _loc2_[0];
   popupMc.InputMc.left_mc._x = -27;
   popupMc.InputMc.right_mc._x = 100;
   var _loc3_ = lib.util.CurrencyFormat.makeComma(userPoint) + "P";
   popupMc.pointTxt0.setText(_loc3_);
   inputEvent();
};
myListener.OnGame_CustomCastle_BuyButton = function(btnMode, tipTxt)
{
   setButton(btmMc.buyBtn,btnMode,tipTxt);
};
myListener.OnGame_CustomCastle_WearButton = function(btnMode, tipTxt)
{
   if(tipTxt == undefined || tipTxt == "")
   {
      if(btnMode == 0)
      {
         tipTxt = "$128034";
      }
      else
      {
         tipTxt = "";
      }
   }
   setButton(btmMc.wearBtn,btnMode,tipTxt);
};
myListener.OnGame_CustomCastle_ClearButton = function(btnMode, tipTxt)
{
   if(tipTxt == undefined || tipTxt == "")
   {
      if(btnMode == 0)
      {
         tipTxt = "$128035";
      }
      else
      {
         tipTxt = "";
      }
   }
   setButton(btmMc.clearBtn,btnMode,tipTxt);
};
myListener.OnGame_CustomCastle_PreviewButton = function(btnMode, tipTxt)
{
   if(tipTxt == undefined || tipTxt == "")
   {
      if(btnMode == 0)
      {
         tipTxt = "$128036";
      }
      else
      {
         tipTxt = "";
      }
   }
   setButton(btmMc.previewBtn,btnMode,tipTxt);
};
myListener.OnGame_CustomCastle_ApplyButton = function(btnMode, tipTxt)
{
   setButton(btmMc.applyBtn,btnMode,tipTxt);
};
myListener.OnGame_CustomCastle_EditModeCloseButton = function(btnMode, tipTxt)
{
   setButton(btmMc.closeBtn,btnMode,tipTxt);
};
var dragTargetMc = undefined;
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target._name == "SLOT")
   {
      var _loc1_ = target._parent;
      if(_loc1_.Id != undefined)
      {
         ToGame_CustomCastle_SlotClick(_loc1_.Id);
      }
   }
   else if(button == 1 && target._name == "SLOT")
   {
      dragTargetMc = target._parent;
   }
};
myListener.OnGame_MouseMove = function(button, target)
{
   if(_global.gbUIMode && dragTargetMc != undefined)
   {
      target = Mouse.getTopMostEntity(false);
      var _loc2_ = target._parent;
      if(target._name.substr(0,4) == "SLOT" && _loc2_.effect != false)
      {
         lib.Debuger.trace(dragTargetMc.Type + "!=" + _loc2_.Type);
         if(dragTargetMc == undefined)
         {
            _loc2_.FX_OVER.gotoAndStop(1);
         }
         else if(_loc2_._parent._name == dragTargetMc._parent._name && dragTargetMc.Type == _loc2_.Type)
         {
            _loc2_.FX_OVER.gotoAndStop(1);
         }
         else
         {
            _loc2_.FX_OVER.gotoAndStop(2);
         }
      }
   }
};
myListener.OnGame_MouseUp = function()
{
   if(_global.gbUIMode && dragTargetMc != undefined)
   {
      dragTargetMc = undefined;
   }
};
myListener.OnGame_ChangeStageSize();
ToGame_CustomCastle_Init();
