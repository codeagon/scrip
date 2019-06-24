function setMouseEvent()
{
   setMouseDown();
   setMouseUp();
}
function deleteMouseEvent()
{
   delete myListener.OnGame_MouseDown;
}
function showTabContainer(num)
{
   var _loc1_ = 0;
   while(_loc1_ < 4)
   {
      container_mc["tab" + _loc1_ + "_container"]._visible = false;
      _loc1_ = _loc1_ + 1;
   }
   if(num != undefined)
   {
      container_mc["tab" + num + "_container"]._visible = true;
   }
}
function tabEnableNum(num)
{
   var _loc1_ = 0;
   while(_loc1_ < 4)
   {
      tab.setVisible(_loc1_,false);
      _loc1_ = _loc1_ + 1;
   }
   if(num != undefined)
   {
      _loc1_ = 0;
      while(_loc1_ < num)
      {
         tab.setVisible(_loc1_,true);
         _loc1_ = _loc1_ + 1;
      }
   }
}
function setData(datas)
{
   var _loc3_ = lib.util.ExtString.split(datas,"\t");
   var _loc2_ = false;
   var _loc8_ = Number(_loc3_[0]);
   var _loc13_ = _loc3_[1];
   var _loc5_ = _loc3_[2];
   var _loc19_ = _loc3_[3];
   var _loc17_ = Number(_loc3_[4]);
   var _loc6_ = Number(_loc3_[5]);
   var _loc15_ = Number(_loc3_[6]);
   var _loc12_ = Number(_loc3_[7]);
   var _loc10_ = Number(_loc3_[8]);
   var _loc16_ = Number(_loc3_[9]);
   var _loc4_ = Number(_loc3_[10]);
   var _loc14_ = Number(_loc3_[11]);
   var _loc1_ = itemDatas[_loc8_];
   var _loc18_ = container_mc.slotContainer["ware__" + _loc8_];
   _loc18_.TEX = _loc5_;
   if(_loc1_ == undefined)
   {
      _loc1_ = new Object();
      _loc1_.itemId = _loc13_;
      _loc1_.img = _loc5_;
      _loc1_.iconBm = flash.display.BitmapData.loadBitmap(_loc5_);
      _loc1_.impossible = _loc6_;
      _loc1_.grade = _loc15_;
      _loc1_.sealType = _loc12_;
      _loc1_.master = _loc10_;
      _loc1_.durability = _loc14_;
      _loc1_.filterType = _loc16_;
      _loc1_.enchant = _loc4_;
      _loc2_ = true;
   }
   else
   {
      _loc2_ = _loc2_ || _loc1_.itemId != _loc13_;
      _loc2_ = _loc2_ || _loc1_.img != _loc5_;
      _loc2_ = _loc2_ || _loc1_.impossible != _loc6_;
      _loc2_ = _loc2_ || _loc1_.grade != _loc15_;
      _loc2_ = _loc2_ || _loc1_.sealType != _loc12_;
      _loc2_ = _loc2_ || _loc1_.master != _loc10_;
      _loc2_ = _loc2_ || _loc1_.durability != _loc14_;
      _loc2_ = _loc2_ || _loc1_.filterType != _loc16_;
      _loc2_ = _loc2_ || _loc1_.enchant != _loc4_;
      if(_loc1_.img != _loc5_)
      {
         _loc1_.iconBm = flash.display.BitmapData.loadBitmap(_loc5_);
      }
      _loc1_.itemId = _loc13_;
      _loc1_.img = _loc5_;
      _loc1_.impossible = _loc6_;
      _loc1_.grade = _loc15_;
      _loc1_.sealType = _loc12_;
      _loc1_.master = _loc10_;
      _loc1_.durability = _loc14_;
      _loc1_.filterType = _loc16_;
      _loc1_.enchant = _loc4_;
   }
   itemDatas[_loc8_] = _loc1_;
   var _loc9_ = container_mc.slotContainer["amountFd_" + _loc8_];
   _loc9_.text = "";
   _loc9_.textAutoSize = "shrink";
   var _loc7_ = container_mc.slotContainer["enchantFd_" + _loc8_];
   _loc7_.text = "";
   if(isNaN(_loc4_) == false && _loc4_ != -1 && _loc4_ != 0)
   {
      var _loc11_ = _loc6_ <= 0?21433:3615811;
      if(_loc4_ > 11 && _loc4_ < 15)
      {
         _loc11_ = _loc6_ <= 0?8915599:2299429;
      }
      else if(_loc4_ > 14)
      {
         _loc11_ = _loc6_ <= 0?10624002:4074792;
      }
      _loc7_.shadowColor = _loc11_;
      _loc7_.text = "+" + _loc4_;
   }
   if(_loc17_)
   {
      _loc9_.text = _loc19_;
   }
   if(_loc6_ > 0)
   {
      _loc9_.textColor = 7368816;
      _loc7_.textColor = 7368816;
   }
   else
   {
      _loc9_.textColor = 14145495;
      _loc7_.textColor = 14145495;
   }
   return _loc2_;
}
function clearSlot(index)
{
   itemDatas[index] = undefined;
   container_mc.slotContainer["amountFd_" + index].text = "";
   container_mc.slotContainer["enchantFd_" + index].text = "";
   var _loc1_ = container_mc.slotContainer["ware__" + index];
   delete register1.grade;
   delete register1.sealType;
   delete register1.TEX;
   lib.manager.ToolTip.remove(_loc1_);
   drawSlots();
}
function clearAllSlot(bFlag)
{
   if(bFlag)
   {
      itemDatas = [];
      var _loc1_ = 0;
      while(_loc1_ < SLOTMAX)
      {
         container_mc.slotContainer["amountFd_" + _loc1_].text = "";
         container_mc.slotContainer["enchantFd_" + _loc1_].text = "";
         var _loc2_ = container_mc.slotContainer["ware__" + _loc1_];
         delete register2.grade;
         delete register2.sealType;
         delete register2.TEX;
         lib.manager.ToolTip.remove(_loc2_);
         _loc1_ = _loc1_ + 1;
      }
   }
   container_mc.slotContainer.clear();
}
function buildSlot()
{
   container_mc.bgContainer.clear();
   lib.display.DrawBitmapData.draw(container_mc.bgContainer,bgTop,0,0,0,0,378,491);
   lib.display.DrawBitmapData.draw(container_mc.bgContainer,bgBtm0,0,491,0,0,378,94);
   var _loc1_ = 0;
   while(_loc1_ < SLOTMAX)
   {
      var _loc3_ = SLOTSTARTX + _loc1_ % SLOTCOL * SLOTSPACE;
      var _loc2_ = SLOTSTARTY + int(_loc1_ / SLOTCOL) * SLOTSPACE;
      createSlotBtn(_loc1_,_loc3_,_loc2_);
      createAmountTextFd(_loc1_,_loc3_,_loc2_);
      if(_loc1_ > 0)
      {
         createEnchantTextFd(_loc1_,_loc3_ - 1,_loc2_ + 1.5);
      }
      else
      {
         container_mc.slotContainer.enchantFd_0._x = _loc3_ - 1;
         container_mc.slotContainer.enchantFd_0._y = _loc2_ + 1.5;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function createSlotBtn(index, posX, posY)
{
   var _loc3_ = container_mc;
   var _loc2_ = _loc3_.slotContainer[slotPrefix + index];
   if(_loc2_ == undefined)
   {
      _loc2_ = _loc3_.slotContainer.attachMovie("slotBtn",slotPrefix + index,_loc3_.slotContainer.getNextHighestDepth());
      _loc2_.trackAsMenu = true;
      _loc2_.btnName = "WARESLOTBTN";
      _loc2_.index = index;
      _loc2_._x = posX - 1;
      _loc2_._y = posY - 1;
      setSlotEvent(_loc2_);
      _loc2_.GetName = function()
      {
         return this._name;
      };
   }
}
function setSlotEvent(slotBtn)
{
   setRollOver(slotBtn);
   setRollOut(slotBtn);
   setPress(slotBtn);
   setDragOut(slotBtn);
   setReleaseOutSide(slotBtn);
   setRelease(slotBtn);
}
function setRollOut(slotBtn)
{
   slotBtn.onRollOut = function()
   {
      if(dragFlag)
      {
         drawSlots();
      }
   };
}
function setPress(slotBtn)
{
   slotBtn.onPress = function()
   {
      pressedBtn = this;
   };
}
function setDragOut(slotBtn)
{
   slotBtn.onDragOut = function()
   {
      if(pressedBtn == this && useAble == true)
      {
         dragFlag = true;
         if(this.TEX != undefined)
         {
            var _loc4_ = this._x + 2;
            var _loc3_ = this._y + 2;
            drawSlots();
            this.grade = itemDatas[this.index].grade;
            this.sealType = itemDatas[this.index].sealType;
            _global.StartIconDrag(this,this.TEX);
         }
      }
   };
}
function setReleaseOutSide(btn)
{
   btn.onReleaseOutside = function()
   {
      dragFlag = false;
      pressedBtn = null;
      drawSlots();
   };
}
function setRelease(btn)
{
   btn.onRelease = function()
   {
      pressedBtn = null;
      dragFlag = false;
      onRollOver(this.index);
   };
}
function createAmountTextFd(index, posX, posY)
{
   var _loc1_ = container_mc.slotContainer["amountFd_" + index];
   if(_loc1_ == undefined)
   {
      _loc1_ = container_mc.slotContainer.createTextField("amountFd_" + index,container_mc.slotContainer.getNextHighestDepth(),posX + 1,posY + 21,36,17);
      _loc1_.hitTestDisable = true;
      _loc1_.border = false;
      _loc1_.background = false;
      _loc1_.selectable = false;
      _loc1_.wordWrap = false;
      _loc1_.type = "dynamic";
      _loc1_.multiline = false;
      _loc1_.html = true;
      _loc1_.antiAliasType = "normal";
      _loc1_.setNewTextFormat(amountTextFormat);
      _loc1_.shadowColor = 0;
      _loc1_.shadowBlurX = 1.7;
      _loc1_.shadowBlurY = 1.7;
      _loc1_.shadowStrength = 5;
      _loc1_.shadowDistance = 0;
      _loc1_.shadowAngle = 90;
   }
}
function createEnchantTextFd(index, posX, posY)
{
   var _loc1_ = container_mc.slotContainer["enchantFd_" + index];
   var _loc2_ = container_mc.slotContainer.enchantFd_0.getTextFormat();
   if(_loc1_ == undefined)
   {
      _loc1_ = container_mc.slotContainer.createTextField("enchantFd_" + index,container_mc.slotContainer.getNextHighestDepth(),posX,posY,36,17);
      _loc1_.hitTestDisable = true;
      _loc1_.border = false;
      _loc1_.background = false;
      _loc1_.selectable = false;
      _loc1_.wordWrap = false;
      _loc1_.type = "dynamic";
      _loc1_.multiline = false;
      _loc1_.antiAliasType = "normal";
      _loc1_.setNewTextFormat(_loc2_);
      _loc1_.shadowColor = 21433;
      _loc1_.shadowBlurX = 2;
      _loc1_.shadowBlurY = 2;
      _loc1_.shadowStrength = 500;
      _loc1_.shadowDistance = 0;
      _loc1_.shadowQuality = 2;
   }
}
function setMouseMove()
{
}
function drawSlots()
{
   clearAllSlot();
   filterSlotCount = 0;
   var _loc16_ = 0;
   var _loc17_ = 72;
   var _loc13_ = container_mc.slotContainer;
   var _loc4_ = 0;
   while(_loc4_ < _loc17_)
   {
      var _loc5_ = _loc13_["ware__" + _loc4_];
      var _loc3_ = _loc5_._x;
      var _loc2_ = _loc5_._y;
      if(_loc5_.disableSlot == 1)
      {
         lib.display.DrawBitmapData.draw(_loc13_,disableSlotBm,_loc3_ + 2,_loc2_ + 2,0,0,36,36);
      }
      else
      {
         var _loc1_ = itemDatas[_loc4_];
         if(_loc1_ != undefined)
         {
            var _loc11_ = _loc1_.iconBm;
            var _loc10_ = _loc1_.grade;
            var _loc7_ = _loc1_.sealType;
            var _loc6_ = _loc1_.master;
            var _loc9_ = _loc1_.impossible;
            var _loc15_ = _loc1_.disableSlot;
            var _loc8_ = _loc1_.durability;
            var _loc12_ = _loc1_.filterType;
            var _loc14_ = _loc1_.enchant;
            _loc5_ = container_mc.slotContainer["ware__" + _loc4_];
            _loc3_ = _loc5_._x + 1;
            _loc2_ = _loc5_._y + 1;
            _loc16_ = _loc16_ + 1;
            lib.display.DrawBitmapData.draw(container_mc.slotContainer,frameBm,_loc3_,_loc2_,0,0,38,38,1);
            lib.display.DrawBitmapData.draw(container_mc.slotContainer,_loc11_,_loc3_ + 2,_loc2_ + 2,0,0,34,34,0.54);
            if(_loc9_ > 0)
            {
               lib.display.DrawBitmapData.draw(container_mc.slotContainer,UI["disableBm" + _loc9_],_loc3_ + 1,_loc2_ + 1,0,0,38,38,1);
            }
            if(_loc10_ > 0)
            {
               lib.display.DrawBitmapData.draw(container_mc.slotContainer,UI["gradeBm" + _loc10_],_loc3_ + 2,_loc2_ + 2,0,0,11,11,BITMAP_RESIZE);
            }
            if(_loc6_ == 1)
            {
               lib.display.DrawBitmapData.draw(container_mc.slotContainer,masterBm,_loc3_ + 22,_loc2_ + 18,0,0,20,30,BITMAP_RESIZE);
            }
            else if(_loc6_ == 2)
            {
               lib.display.DrawBitmapData.draw(container_mc.slotContainer,wakeupBm,_loc3_ + 16,_loc2_ + 20,0,0,20,20,BITMAP_RESIZE);
            }
            if(_loc7_ > 0)
            {
               lib.display.DrawBitmapData.draw(container_mc.slotContainer,UI["sealBm" + _loc7_],_loc3_ + 2,_loc2_ + 2,0,0,38,38,BITMAP_RESIZE);
            }
            if(_loc8_ > 0)
            {
               lib.display.DrawBitmapData.draw(container_mc.slotContainer,UI["durabilityBm" + _loc8_],_loc3_,_loc2_,0,0,38,38,1);
            }
            if(_loc12_ > 0)
            {
               filterSlotCount++;
            }
            lib.manager.ToolTip.add(_loc5_,_loc4_ + "\t" + tab.activedNum,6);
         }
      }
      _loc4_ = _loc4_ + 1;
   }
   container_mc.countTxt.text = _loc16_ + " / 72";
   filterBg();
}
function drawSlotFrame()
{
   var _loc2_ = container_mc.slotContainer;
   var _loc1_ = 0;
   while(_loc1_ < SLOTMAX)
   {
      var _loc4_ = _loc2_.slotContainer["ware__" + _loc1_]._x;
      var _loc3_ = _loc2_.slotContainer["ware__" + _loc1_]._y;
      lib.display.DrawBitmapData.draw(_loc2_.slotContainer,frameBm,_loc4_,_loc3_,0,0,38,38,1);
      _loc1_ = _loc1_ + 1;
   }
}
function setMouseDown()
{
   myListener.OnGame_MouseDown = function(button, target)
   {
      if(button == 2 && target.GetName() != undefined)
      {
         var _loc1_ = target.GetName();
         if(_loc1_.substr(0,6) == slotPrefix)
         {
            ToGame_WareHouse_RightBtnClicked(_loc1_);
         }
      }
   };
}
function setMouseUp()
{
   myListener.OnGame_MouseUp = function(button, target)
   {
      pressedBtn = null;
      drawSlots();
   };
}
function ToGame_WareHouse_RequestExchange()
{
   fscommand("ToGame_WareHouse_RequestExchange");
}
function initFiter()
{
   container_mc.filterContainer2["filter_" + prevFocus].State = "Nor";
   prevFocus = 0;
   container_mc.filter_0.State = "Focus";
   filterDraw();
}
function ToGame_WareHouse_RightBtnClicked(SlotName)
{
   getURL("FSCommand:ToGame_WareHouse_RightBtnClicked",SlotName);
}
function ToGame_WareHouse_SelectTab(tabNum)
{
   getURL("FSCommand:ToGame_WareHouse_SelectTab",tabNum);
}
function ToGame_WareHouse_SelectMoneyTransferBtn(bDeposit)
{
   getURL("FSCommand:ToGame_WareHouse_SelectMoneyTransferBtn",bDeposit);
}
function ToGame_WarehouseWindow_CloseUI()
{
   fscommand("ToGame_WarehouseWindow_CloseUI");
}
function ToGame_WareHouse_RequestSort()
{
   fscommand("ToGame_WareHouse_RequestSort");
}
function ToGame_WareHouse_RequestTempWareHouse()
{
   fscommand("ToGame_WareHouse_RequestTempWareHouse");
}
function ToGame_WareHouse_RequestTempPage(page)
{
   getURL("FSCommand:ToGame_WareHouse_RequestTempPage",page);
}
function tempTogle(flag)
{
   if(flag)
   {
      container_mc.tilteTxt.text = "$123027";
   }
   else
   {
      container_mc.tilteTxt.text = titleName;
   }
   temp_btn.setVisible(tempState && !flag);
   container_mc.hilightMc._visible = tempState && !flag;
   container_mc.numberSteper._visible = flag;
   container_mc.txtLabel1._visible = !flag;
   container_mc.money_txt._visible = !flag;
   container_mc.moneyIconMc._visible = !flag;
   container_mc.refreshBtn._visible = !flag;
   payment_btn.setEnabled(!flag);
   receipt_btn.setEnabled(!flag);
   bTempWareHouse = Boolean(Number(flag));
   if(prevFocus == 0)
   {
      sort_btn.setEnabled(!flag);
   }
   else
   {
      sort_btn.setEnabled(false);
   }
}
function tempTogle2(flag)
{
   if(flag)
   {
      receipt_btn.setVisible(false);
      payment_btn.setVisible(false);
      sort_btn.setVisible(false);
      container_mc.goldBg._visible = false;
      container_mc.txtLabel1._visible = false;
      container_mc.money_txt._visible = false;
      container_mc.numberSteper._visible = false;
      container_mc.txtBtn3._visible = false;
      container_mc.tipTxt._visible = true;
      container_mc.tipTxt.verticalAlign = "center";
      container_mc.tipTxt.htmlText = "<img src=\'tipIcon\'>" + lib.util.UIString.getUIString("$061008") + " <font color=\'#C00005\'>" + lib.util.UIString.getUIString("$061009") + "</font>";
   }
   else
   {
      receipt_btn.setVisible(true);
      payment_btn.setVisible(true);
      container_mc.goldBg._visible = true;
      container_mc.txtLabel1._visible = true;
      container_mc.money_txt._visible = true;
      container_mc.tipTxt._visible = false;
      if(prevFocus == 0)
      {
         sort_btn.setVisible(true);
      }
      else
      {
         sort_btn.setVisible(false);
      }
   }
}
function filterBg()
{
   container_mc.slotBg.clear();
   if(filterSlotCount == 0)
   {
      return undefined;
   }
   var _loc7_ = int(filterSlotCount / 8) + 1;
   var _loc8_ = filterSlotCount % 8;
   var _loc6_ = 15;
   var _loc4_ = 104;
   var _loc5_ = 18 + _loc8_ * 43;
   var _loc2_ = 106 + (_loc7_ - 1) * 43;
   var _loc3_ = 362;
   var _loc1_ = 106 + _loc7_ * 43;
   if(_loc7_ == 1)
   {
      _loc3_ = _loc5_;
   }
   if(_loc8_ == 0)
   {
      _loc1_ = _loc2_;
   }
   container_mc.slotBg.beginFill(1663338);
   container_mc.slotBg.moveTo(_loc6_,_loc4_);
   container_mc.slotBg.lineTo(_loc3_,_loc4_);
   container_mc.slotBg.lineTo(_loc3_,_loc2_);
   container_mc.slotBg.lineTo(_loc5_,_loc2_);
   container_mc.slotBg.lineTo(_loc5_,_loc1_);
   container_mc.slotBg.lineTo(_loc6_,_loc1_);
   container_mc.slotBg.lineTo(_loc6_,_loc4_);
   container_mc.slotBg.endFill();
}
function filterDraw()
{
   container_mc.filterContainer.clear();
   var _loc2_ = 0;
   for(; _loc2_ < filterTotal; _loc2_ = _loc2_ + 1)
   {
      var _loc6_ = 0;
      var _loc1_ = container_mc.filterContainer2["filter_" + _loc2_];
      if(_loc1_.State == "Focus")
      {
         _loc1_._alpha = 0;
         if(_loc1_.idx == 0 || _loc1_.idx == 6)
         {
            continue;
         }
         lib.display.DrawBitmapData.draw(container_mc.filterContainer,focus_Bg1,_loc1_._x,_loc1_._y,0,0,64,32,1);
      }
      else
      {
         _loc1_._alpha = 100;
      }
      var _loc3_ = UI["filter" + _loc1_.idx + "_" + _loc1_.State + "Bm"];
      var _loc5_ = _loc1_._x + 14;
      var _loc4_ = _loc1_._y + 2;
      lib.display.DrawBitmapData.draw(container_mc.filterContainer,_loc3_,_loc5_,_loc4_,0,0,32,32,1);
   }
}
function ToGame_Warehouse_ClickFilter(idx)
{
   getURL("FSCommand:ToGame_Warehouse_ClickFilter",idx);
}
function closeUI()
{
   ToGame_WarehouseWindow_CloseUI();
}
function release(num, notSendToGame)
{
   if(notSendToGame != 1)
   {
      ToGame_WareHouse_SelectTab(num);
   }
}
var UI = this;
UI._visible = false;
var UIname = "WarehouseWindow";
var slotPrefix = "ware__";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var SLOTROW = 9;
var SLOTCOL = 8;
var SLOTMAX = 72;
var SLOTSTARTX = 19;
var SLOTSTARTY = 107;
var SLOTSPACE = 43;
var currentTab = 0;
var useAble = true;
var slotMaXCount = 72;
var tempState = false;
container_mc.tilteTxt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.money_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.txtLabel1.textColor = lib.info.TextColor.INPUT_LABEL;
var bgTop = flash.display.BitmapData.loadBitmap("BG_Top");
var bgAdd = flash.display.BitmapData.loadBitmap("BG_Add");
var bgBtm0 = flash.display.BitmapData.loadBitmap("BG_Btm0");
var bgBtm1 = flash.display.BitmapData.loadBitmap("BG_Btm1");
var frameBm = flash.display.BitmapData.loadBitmap("Slot_Frame");
var overBm = flash.display.BitmapData.loadBitmap("Slot_Over");
var gradeBm1 = flash.display.BitmapData.loadBitmap("iconGrade1");
var gradeBm2 = flash.display.BitmapData.loadBitmap("iconGrade2");
var gradeBm3 = flash.display.BitmapData.loadBitmap("iconGrade3");
var masterBm = flash.display.BitmapData.loadBitmap("master");
var wakeupBm = flash.display.BitmapData.loadBitmap("wakeup");
var sealBm1 = flash.display.BitmapData.loadBitmap("iconSeal1");
var sealBm2 = flash.display.BitmapData.loadBitmap("iconSeal2");
var disableBm1 = flash.display.BitmapData.loadBitmap("Slot_Impossible");
var disableBm2 = flash.display.BitmapData.loadBitmap("Slot_Impossible");
var disableSlotBm = flash.display.BitmapData.loadBitmap("disablelock");
var durabilityBm1 = flash.display.BitmapData.loadBitmap("durability1");
var durabilityBm2 = flash.display.BitmapData.loadBitmap("durability2");
container_mc.hilightMc.hitTestDisable = true;
bWidgetOpen = false;
var titleName = "$061001";
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
         setMouseEvent();
         initFiter();
      }
      else
      {
         UI._visible = false;
         deleteMouseEvent();
      }
      if(UI._visible == true)
      {
         CustomScaleEvent = new CustomScaleEvent();
         CustomScaleEvent.CustomScaleEventCheck(UI,UIname);
         UI.scaleExpander.scaleExpanderEventCheck(UI,UIname);
         container_mc.lock_mc._x = 318;
         container_mc.lock_mc._y = 9;
      }
      else
      {
         CustomScaleEvent.CustomScaleEventRemoveCheck();
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
var itemDatas = new Array();
myListener.OnGame_WareHouse_SetItemSlot = function(datas)
{
   clearAllSlot(true);
   var _loc5_ = lib.util.ExtString.split(datas,"\n");
   var _loc4_ = _loc5_.length;
   var _loc3_ = itemDatas.length != _loc4_;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = setData(_loc5_[_loc1_]);
      _loc3_ = _loc3_ || _loc2_;
      _loc1_ = _loc1_ + 1;
   }
   if(_loc3_)
   {
      drawSlots();
   }
};
myListener.OnGame_WareHouse_AddItem = function(datas)
{
   var _loc5_ = lib.util.ExtString.split(datas,"\n");
   var _loc4_ = _loc5_.length;
   var _loc3_ = itemDatas.length != _loc4_;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = setData(_loc5_[_loc1_]);
      _loc3_ = _loc3_ || _loc2_;
      _loc1_ = _loc1_ + 1;
   }
   if(_loc3_)
   {
      drawSlots();
   }
};
myListener.OnGame_WareHouse_UpdateItem = function(datas)
{
   var _loc5_ = lib.util.ExtString.split(datas,"\n");
   var _loc4_ = _loc5_.length;
   var _loc3_ = itemDatas.length != _loc4_;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = setData(_loc5_[_loc1_]);
      _loc3_ = _loc3_ || _loc2_;
      _loc1_ = _loc1_ + 1;
   }
   if(_loc3_)
   {
      drawSlots();
   }
};
myListener.OnGame_WareHouse_RemoveItem = function(datas)
{
   var _loc3_ = lib.util.ExtString.split(datas,"\n");
   var _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      var _loc2_ = lib.util.ExtString.split(_loc3_[_loc1_],"\t");
      clearSlot(_loc2_[0]);
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_WareHouse_ClearItem = function()
{
   clearAllSlot(true);
};
var dragFlag = false;
var pressedBtn = null;
var amountTextFormat = new TextFormat("$NormalFont",17,14145495,false,false,false,null,null,"right",0,0,0,0);
var tempDragOveredBtn;
buildSlot();
myListener.OnGame_WareHouse_SetTab = function(tabNum)
{
   tabNum = Number(tabNum);
   tab.setTab(tabNum,1);
};
var tabW = container_mc.tabBtn._btnWidth * container_mc.tabBtn._labels.length + (container_mc.tabBtn._labels.length - 1) * container_mc.tabBtn._space;
myListener.OnGame_WareHouse_SetTabInfo = function(dataList)
{
   var _loc9_ = undefined != tab.activedNum?tab.activedNum:0;
   var _loc6_ = lib.util.ExtString.split(dataList,"\n");
   var _loc3_ = _loc6_.length;
   var _loc7_ = [];
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc4_ = _loc6_[_loc1_].split("\t");
      _loc7_.push(_loc4_[2]);
      tab.btn_array[_loc1_]._parent.enabled = Number(_loc4_[1]);
      _loc1_ = _loc1_ + 1;
   }
   var _loc8_ = 360;
   container_mc.tabBtn._btnWidth = _loc8_ / _loc3_;
   container_mc.tabBtn.labels = _loc7_;
   tab = container_mc.tabBtn.tab;
   tab.setRelease(release);
   tab.setTab(_loc9_,1);
   _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      _loc4_ = _loc6_[_loc1_].split("\t");
      tab.btn_array[_loc1_]._parent.lockIcon.removeMovieClip();
      if(Number(_loc4_[1]))
      {
         tab.btn_array[_loc1_]._alpha = 100;
         tab.btn_array[_loc1_].enabled = true;
      }
      else
      {
         tab.btn_array[_loc1_]._alpha = 80;
         tab.btn_array[_loc1_].enabled = false;
         tab.txt_array[_loc1_].text = "";
         var _loc5_ = flash.display.BitmapData.loadBitmap("lockIcon");
         var _loc2_ = tab.btn_array[_loc1_]._parent.createEmptyMovieClip("lockIcon",10);
         _loc2_.attachBitmap(_loc5_,1);
         _loc2_._x = tab.btn_array[_loc1_]._width / 2 - (64 / _loc3_ + 12);
         _loc2_._y = 3;
         _loc2_._xscale = _loc2_._yscale = SLOT_RESIZE;
      }
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_WareHouse_SetMoney = function(Money)
{
   container_mc.money_txt.htmlText = Money;
};
myListener.OnGame_WareHouse_ChangeGuildWareHouse = function(bRight)
{
   container_mc.tilteTxt.text = lib.util.UIString.getUIString("$061007");
   titleName = container_mc.tilteTxt.text;
   useAble = Boolean(Number(bRight));
   var _loc1_ = 0;
   while(_loc1_ < slotMaXCount)
   {
      var _loc2_ = container_mc.tab0_container[slotPrefix + _loc1_];
      _loc2_.drag = useAble;
      _loc1_ = _loc1_ + 1;
   }
   payment_btn.setEnabled(useAble);
   receipt_btn.setEnabled(useAble);
};
var ChangeLock = false;
myListener.OnGame_WareHouse_SetDisable = function(disable, str)
{
   if(Number(disable))
   {
      ChangeLock = true;
      receipt_btn.setVisible(false);
      payment_btn.setVisible(false);
      sort_btn.setVisible(false);
      container_mc.goldBg._visible = false;
      container_mc.txtLabel1._visible = false;
      container_mc.money_txt._visible = false;
      container_mc.numberSteper._visible = tempState && bTempWareHouse;
      container_mc.txtBtn3._visible = Boolean(tempState && !bTempWareHouse);
      container_mc.tipTxt._visible = true;
      container_mc.tipTxt.verticalAlign = "center";
      if(str)
      {
         container_mc.tipTxt.htmlText = "<img src=\'tipIcon\'>" + str;
         container_mc.refreshBtn._visible = !bTempWareHouse;
         container_mc.countTxt._x = 162;
      }
      else
      {
         container_mc.tipTxt.htmlText = "<img src=\'tipIcon\'>" + lib.util.UIString.getUIString("$061008") + " <font color=\'#C00005\'>" + lib.util.UIString.getUIString("$061009") + "</font>";
         container_mc.refreshBtn._visible = false;
         container_mc.countTxt._x = 218;
      }
   }
   else
   {
      ChangeLock = false;
      receipt_btn.setVisible(true);
      payment_btn.setVisible(true);
      if(prevFocus == 0)
      {
         sort_btn.setVisible(true);
      }
      else
      {
         sort_btn.setVisible(false);
      }
      container_mc.goldBg._visible = true;
      container_mc.txtLabel1._visible = true;
      container_mc.money_txt._visible = true;
      container_mc.tipTxt._visible = false;
      container_mc.refreshBtn._visible = false;
      container_mc.countTxt._x = 218;
   }
};
myListener.OnGame_WareHouse_SetCharacterName = function(__name)
{
   lib.manager.UISkin.setInGameCharacterName(container_mc,__name);
};
myListener.OnGame_WareHouse_EnableWithdrawBtn = function(enable)
{
   payment_btn.setEnabled(Number(enable));
};
myListener.OnGame_WareHouse_EnableTempWareHouse = function(enable, totalpage, currentPage)
{
   if(WareHouseType == 1 || WareHouseType == 3)
   {
      return undefined;
   }
   tempState = Number(enable);
   temp_btn.setVisible(Number(enable));
   container_mc.hilightMc._visible = Number(enable);
   if(Number(enable))
   {
      container_mc.hilightMc.gotoAndPlay(2);
   }
   else
   {
      container_mc.hilightMc.gotoAndStop(1);
   }
   container_mc.numberSteper.setPage(Number(currentPage),Number(totalpage));
};
myListener.OnGame_WareHouse_ChangeTempWareHouse = function(_state)
{
   tempTogle(Number(_state));
};
myListener.OnGame_WareHouse_SetItemSlotLock = function(_index)
{
   var _loc1_ = 0;
   while(_loc1_ < 72)
   {
      var _loc2_ = container_mc.slotContainer[slotPrefix + _loc1_];
      _loc2_._visible = true;
      _loc2_.disableSlot = 0;
      _loc1_ = _loc1_ + 1;
   }
   _loc1_ = 0;
   while(_loc1_ < 8 * _index)
   {
      var _loc3_ = 71 - _loc1_;
      _loc2_ = container_mc.slotContainer[slotPrefix + _loc3_];
      _loc2_._visible = false;
      _loc2_.disableSlot = 1;
      _loc1_ = _loc1_ + 1;
   }
   clearAllSlot();
   drawSlots();
};
myListener.OnGame_WareHouse_SetTabVisible = function(_index, _enable)
{
   tab.setVisible(_index,_enable);
};
myListener.OnGame_WareHouse_SetTitleName = function(__Name)
{
   titleName = __Name;
   container_mc.tilteTxt.text = __Name;
};
myListener.OnGame_WareHouse_SetSortEnable = function(_Enable)
{
   var _loc1_ = true;
   var _loc3_ = 132;
   var _loc2_ = 249;
   if(_Enable == 0)
   {
      _loc1_ = false;
      _loc3_ = 71;
      _loc2_ = 193;
   }
   container_mc.txtBtn0._visible = _loc1_;
   container_mc.txtBtn1._x = _loc3_;
   container_mc.txtBtn2._x = _loc2_;
};
container_mc.exchangeBtn_dis._visible = false;
container_mc.exchangeBtn._visible = false;
lib.manager.ToolTip.add(container_mc.exchangeBtn,lib.util.UIString.getUIString("$051009"),1);
myListener.OnGame_WareHouse_SetExchangeBtn = function(_bVisible, _Enable)
{
   _bVisible = Number(_bVisible);
   _Enable = Number(_Enable);
   var _loc3_ = !_bVisible?250:210;
   container_mc.money_txt._width = _loc3_;
   container_mc.exchangeBtn_dis._visible = _bVisible;
   container_mc.exchangeBtn._visible = _bVisible;
   if(_bVisible)
   {
      container_mc.exchangeBtn_dis._visible = !_Enable;
      container_mc.exchangeBtn._visible = _Enable;
   }
};
container_mc.money_txt._width = 250;
container_mc.exchangeBtn.onRelease = function()
{
   ToGame_WareHouse_RequestExchange();
};
container_mc.refreshBtn._visible = false;
container_mc.refreshBtn.onRelease = function()
{
   ToGame_WareHouse_RequestSort();
};
var filterMode = false;
myListener.OnGame_WareHouse_Filter = function(enable)
{
   filterMode = Boolean(Number(enable));
   container_mc.filterContainer._visible = filterMode;
   container_mc.filterContainer2._visible = filterMode;
};
var WareHouseType = 0;
myListener.OnGame_WareHouse_ChangeWareHouse = function(type, enable)
{
   WareHouseType = type;
   tempTogle(false);
   tempTogle2(false);
   if(type == 1)
   {
      container_mc.tilteTxt.text = lib.util.UIString.getUIString("$061007");
      titleName = container_mc.tilteTxt.text;
      useAble = Boolean(Number(enable));
      var _loc1_ = 0;
      while(_loc1_ < slotMaXCount)
      {
         var _loc2_ = container_mc.tab0_container[slotPrefix + _loc1_];
         _loc2_.drag = useAble;
         _loc1_ = _loc1_ + 1;
      }
      payment_btn.setEnabled(useAble);
      receipt_btn.setEnabled(useAble);
   }
   else if(type == 2)
   {
      tempTogle(true);
   }
   else if(type == 3)
   {
      tempTogle2(true);
   }
};
_global.EventBroadCaster.addListener(myListener);
var bTempWareHouse = false;
var BITMAP_RESIZE = 0.6909090909090909;
var SLOT_RESIZE = 69.0909090909091;
var filter1_NorBm = flash.display.BitmapData.loadBitmap("filter1_Nor");
var filter1_OverBm = flash.display.BitmapData.loadBitmap("filter1_Over");
var filter1_FocusBm = flash.display.BitmapData.loadBitmap("filter1_Focus");
var filter2_NorBm = flash.display.BitmapData.loadBitmap("filter2_Nor");
var filter2_OverBm = flash.display.BitmapData.loadBitmap("filter2_Over");
var filter2_FocusBm = flash.display.BitmapData.loadBitmap("filter2_Focus");
var filter3_NorBm = flash.display.BitmapData.loadBitmap("filter3_Nor");
var filter3_OverBm = flash.display.BitmapData.loadBitmap("filter3_Over");
var filter3_FocusBm = flash.display.BitmapData.loadBitmap("filter3_Focus");
var filter4_NorBm = flash.display.BitmapData.loadBitmap("filter4_Nor");
var filter4_OverBm = flash.display.BitmapData.loadBitmap("filter4_Over");
var filter4_FocusBm = flash.display.BitmapData.loadBitmap("filter4_Focus");
var filter5_NorBm = flash.display.BitmapData.loadBitmap("filter5_Nor");
var filter5_OverBm = flash.display.BitmapData.loadBitmap("filter5_Over");
var filter5_FocusBm = flash.display.BitmapData.loadBitmap("filter5_Focus");
var focus_Bg0 = flash.display.BitmapData.loadBitmap("focusBg0");
var focus_Bg1 = flash.display.BitmapData.loadBitmap("focusBg1");
var FILTER_WIDTH = 366;
var FILTER_MAIN_PLUS = 1;
var filterTotal = 0;
var filterAllCheck = false;
var filterSlotCount = 0;
var prevFocus = 0;
var initFilterData = "1\t0\t0\t0\t0\t0\t0";
var filterToolTip = ["$221160","$221161","$221162","$221163","$221164","$221165","$221166"];
myListener.OnGame_Warehouse_SetFilter = function(_data)
{
   var _loc9_ = lib.util.ExtString.split(_data,"\t");
   filterTotal = _loc9_.length;
   var _loc5_ = 7;
   var _loc7_ = 38;
   var _loc10_ = FILTER_WIDTH - FILTER_MAIN_PLUS;
   var _loc8_ = _loc10_ / filterTotal;
   var _loc3_ = 0;
   while(_loc3_ < filterTotal)
   {
      var _loc6_ = "";
      var _loc4_ = undefined;
      if(_loc3_ == 0)
      {
         _loc4_ = container_mc.filterContainer2.attachMovie("filterBtnAF","filter_AF",container_mc.filterContainer2.getNextHighestDepth());
         _loc4_._x = _loc5_;
         _loc4_._y = _loc7_;
         _loc6_ = "A";
      }
      else if(_loc3_ == 6)
      {
         _loc4_ = container_mc.filterContainer2.attachMovie("filterBtnEF","filter_EF",container_mc.filterContainer2.getNextHighestDepth());
         _loc4_._x = _loc5_;
         _loc4_._y = _loc7_;
         _loc6_ = "E";
      }
      var _loc2_ = container_mc.filterContainer2.attachMovie("filterBtn" + _loc6_,"filter_" + _loc3_,container_mc.filterContainer2.getNextHighestDepth());
      _loc2_._x = _loc5_;
      _loc2_._y = _loc7_;
      _loc2_.idx = _loc3_;
      if(_loc9_[_loc3_] == 1)
      {
         _loc2_.State = "Focus";
      }
      else
      {
         _loc2_.State = "Nor";
      }
      if(_loc3_ == 0)
      {
         _loc5_ = _loc5_ + (_loc8_ + FILTER_MAIN_PLUS);
      }
      else
      {
         _loc5_ = _loc5_ + _loc8_;
      }
      lib.manager.ToolTip.add(_loc2_,lib.util.UIString.getUIString(filterToolTip[_loc3_]),1);
      _loc2_.onRelease = function()
      {
         if(this.State != "Focus")
         {
            container_mc.filterContainer2["filter_" + prevFocus].State = "Nor";
            prevFocus = this.idx;
            this.State = "Focus";
            ToGame_Warehouse_ClickFilter(this.idx);
            filterDraw();
         }
      };
      _loc2_.onRollOver = function()
      {
         if(this.State == "Focus")
         {
            return undefined;
         }
         this.State = "Over";
         filterDraw();
      };
      _loc2_.onRollOut = function()
      {
         if(this.State == "Focus")
         {
            return undefined;
         }
         this.State = "Nor";
         filterDraw();
      };
      _loc2_.onReleaseOutside = function()
      {
         if(this.State == "Focus")
         {
            return undefined;
         }
         this.State = "Nor";
         filterDraw();
      };
      _loc3_ = _loc3_ + 1;
   }
   filterDraw();
};
var sort_btn = container_mc.txtBtn0.txtBtn;
var receipt_btn = container_mc.txtBtn1.txtBtn;
var payment_btn = container_mc.txtBtn2.txtBtn;
var temp_btn = container_mc.txtBtn3.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.xBtn);
createTeam_btn.setVisible(false);
receipt_btn.setRelease(aaaa = function()
{
   ToGame_WareHouse_SelectMoneyTransferBtn(true);
});
payment_btn.setRelease(bbbb = function()
{
   ToGame_WareHouse_SelectMoneyTransferBtn(false);
});
sort_btn.setRelease(ToGame_WareHouse_RequestSort);
temp_btn.setRelease(ToGame_WareHouse_RequestTempWareHouse);
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
var tab = container_mc.tabBtn.tab;
tab.setRelease(release);
container_mc.numberSteper.onChanged = function(page)
{
   ToGame_WareHouse_RequestTempPage(page);
};
temp_btn.setVisible(false);
container_mc.hilightMc._visible = false;
container_mc.tipTxt._visible = false;
tab.setTab(0,1);
myListener.OnGame_WareHouse_ChangeWareHouse(0);
myListener.OnGame_Warehouse_SetFilter(initFilterData);
fscommand("ToGame_WareHouse_Init");
