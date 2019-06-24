function playGemstoneEffect(target, endAlpha)
{
   var _loc1_ = endAlpha != 100?100:0;
   gs.TweenLite.to(target,0.5,{_alpha:endAlpha,onComplete:playGemstoneEffect,onCompleteParams:[target,_loc1_]});
}
function ToGame_InventoryWindow_ClickExtBtn(index)
{
   getURL("FSCommand:ToGame_InventoryWindow_ClickExtBtn",index);
}
function ToGame_InventoryWindow_EndRemoveEffect()
{
   getURL("FSCommand:ToGame_InventoryWindow_EndRemoveEffect",removeEffectIndex);
   removeEffectIndex = -1;
   drawSlot();
}
function ToGame_InventoryWindow_LeftClickSlot(slotName)
{
   getURL("FSCommand:ToGame_InventoryWindow_LeftClickSlot",slotName);
}
function ToGame_InventoryWindow_RightClickSlot(slotName)
{
   getURL("FSCommand:ToGame_InventoryWindow_RightClickSlot",slotName);
}
function ToGameInvenItemRightBtnClicked(slotName)
{
   getURL("FSCommand:ToGameInvenItemRightBtnClicked",slotName);
}
function ToGame_Inventory_CloseUI()
{
   fscommand("ToGame_Inventory_CloseUI");
}
function ToGame_Inventory_RequestSort()
{
   fscommand("ToGame_Inventory_RequestSort");
}
function ToGame_Inventory_TCatBuy()
{
   fscommand("ToGame_Inventory_TCatBuy");
}
function ToGame_Inventory_RequestExchange()
{
   fscommand("ToGame_Inventory_RequestExchange");
}
function setData(packet, bFlag)
{
   var _loc21_ = lib.util.ExtString.split(packet,"\n");
   var _loc20_ = _loc21_.length;
   var _loc2_ = itemDatas.length != _loc20_;
   var _loc18_ = [];
   if(bFlag)
   {
      _loc18_ = itemDatas;
   }
   var _loc6_ = 0;
   while(_loc6_ < _loc20_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc21_[_loc6_],"\t");
      var _loc5_ = Number(_loc3_[0]);
      var _loc4_ = _loc3_[1];
      var _loc17_ = Number(_loc3_[3]);
      var _loc14_ = !(_loc17_ == 0 || Number(_loc3_[2]) == -1)?String(_loc3_[2]):"";
      var _loc8_ = Number(_loc3_[4]);
      var _loc15_ = Number(_loc3_[5]);
      var _loc9_ = Number(_loc3_[6]);
      var _loc11_ = Number(_loc3_[7]);
      var _loc10_ = Number(_loc3_[8]);
      var _loc16_ = Number(_loc3_[9]);
      var _loc7_ = Number(_loc3_[10]);
      var _loc12_ = Number(_loc3_[11]);
      var _loc13_ = Number(_loc3_[12]);
      var _loc1_ = itemDatas[_loc5_];
      if(_loc1_ == undefined)
      {
         _loc1_ = {iconBm:flash.display.BitmapData.loadBitmap(_loc4_),iconName:_loc4_,bStack:_loc17_,amount:_loc14_,stateType:_loc8_,grade:_loc15_,bNew:_loc9_,sealType:_loc11_,bMaster:_loc10_,filterType:_loc16_,enchant:_loc7_,durability:_loc12_,bPCPremium:_loc13_};
         _loc18_[_loc5_] = _loc1_;
         slotBtn.TEX = _loc4_;
         _loc2_ = true;
      }
      else
      {
         _loc2_ = _loc2_ || _loc1_.iconName != _loc4_;
         _loc2_ = _loc2_ || _loc1_.amount != _loc14_;
         _loc2_ = _loc2_ || _loc1_.stateType != _loc8_;
         _loc2_ = _loc2_ || _loc1_.grade != _loc15_;
         _loc2_ = _loc2_ || _loc1_.bNew != _loc9_;
         _loc2_ = _loc2_ || _loc1_.sealType != _loc11_;
         _loc2_ = _loc2_ || _loc1_.bMaster != _loc10_;
         _loc2_ = _loc2_ || _loc1_.durability != _loc12_;
         _loc2_ = _loc2_ || _loc1_.filterType != _loc16_;
         _loc2_ = _loc2_ || _loc1_.enchant != _loc7_;
         _loc2_ = _loc2_ || _loc1_.bPCPremium != _loc13_;
         if(_loc1_.iconName != _loc4_)
         {
            _loc1_.iconBm = flash.display.BitmapData.loadBitmap(_loc4_);
         }
         slotBtn.TEX = _loc4_;
         _loc1_.iconName = _loc4_;
         _loc1_.amount = _loc14_;
         _loc1_.bStack = _loc17_;
         _loc1_.stateType = _loc8_;
         _loc1_.grade = _loc15_;
         _loc1_.bNew = _loc9_;
         _loc1_.sealType = _loc11_;
         _loc1_.bMaster = _loc10_;
         _loc1_.filterType = _loc16_;
         _loc1_.enchant = _loc7_;
         _loc1_.durability = _loc12_;
         _loc1_.bPCPremium = _loc13_;
         _loc18_[_loc5_] = _loc1_;
      }
      _loc6_ = _loc6_ + 1;
   }
   if(_loc2_)
   {
      itemDatas = _loc18_;
   }
   return _loc2_;
}
function clearBg()
{
   container_mc.clear();
   var _loc3_ = SLOTCOLUM * slotLineCount;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc2_ = container_mc.slotContainer["inven__" + _loc1_];
      _loc2_._visible = false;
      _loc1_ = _loc1_ + 1;
   }
}
function drawBg()
{
   var _loc21_ = 0;
   var _loc11_ = 0;
   var _loc13_ = BODYBGHEIGHT * slotLineCount;
   lib.display.DrawBitmapData.draw(container_mc,bgTopBm,_loc21_,_loc11_,0,0,BGWIDTH,TOPBGHEIGHT,1);
   var _loc9_ = 0;
   while(_loc9_ < slotLineCount)
   {
      var _loc12_ = _loc11_ + TOPBGHEIGHT + BODYBGHEIGHT * _loc9_;
      lib.display.DrawBitmapData.draw(container_mc,bgBodyBm,_loc21_,_loc12_,0,0,BGWIDTH,BODYBGHEIGHT,1,1,true);
      _loc9_ = _loc9_ + 1;
   }
   if(slotLineCount < LARGESIZELINE)
   {
      lib.display.DrawBitmapData.draw(container_mc,bgBodyLockBm,_loc21_,_loc11_ + TOPBGHEIGHT + _loc13_,0,0,BGWIDTH,BODYBGHEIGHT,1);
      _loc13_ = _loc13_ + BODYBGHEIGHT;
   }
   var _loc10_ = null;
   if(bVisibleEnchantBtn)
   {
      var _loc15_ = container_mc.enchantBtn;
      var enchantBtnIcon = container_mc.enchantBtnIcon;
      if(_loc15_ == undefined)
      {
         _loc15_ = container_mc.attachMovie("extBtnArea","enchantBtn",container_mc.getNextHighestDepth());
         _loc15_._width = extBtnWidth;
         enchantBtnIcon = container_mc.attachMovie("extBtn2","enchantBtnIcon",container_mc.getNextHighestDepth());
         enchantBtnIcon.hitTestDisable = true;
         _loc15_.onRelease = function()
         {
            ToGame_InventoryWindow_ClickExtBtn(INDEX_ENCHANT);
         };
         _loc15_.onRollOver = function()
         {
            enchantBtnIcon.gotoAndStop(2);
         };
         _loc15_.onRollOut = _loc15_.onReleaseOutside = function()
         {
            enchantBtnIcon.gotoAndStop(1);
         };
      }
      _loc15_._x = SLOTSTARTX;
      _loc15_._y = _loc11_ + TOPBGHEIGHT + _loc13_ + 20;
      enchantBtnIcon._x = _loc15_._x + extBtnWidth / 2 - enchantBtnIcon._width / 2;
      enchantBtnIcon._y = _loc15_._y + 2;
      _loc10_ = _loc15_;
      var _loc27_ = lib.util.UIString.getUIString("$051012");
      lib.manager.ToolTip.add(_loc15_,_loc27_,1);
   }
   if(bVisibleEvolutionBtn)
   {
      var _loc19_ = container_mc.evolutionBtn;
      var evolutionBtnIcon = container_mc.evolutionBtnIcon;
      if(_loc19_ == undefined)
      {
         _loc19_ = container_mc.attachMovie("extBtnArea","evolutionBtn",container_mc.getNextHighestDepth());
         _loc19_._width = extBtnWidth;
         evolutionBtnIcon = container_mc.attachMovie("extBtn3","evolutionBtnIcon",container_mc.getNextHighestDepth());
         evolutionBtnIcon.hitTestDisable = true;
         _loc19_.onRelease = function()
         {
            ToGame_InventoryWindow_ClickExtBtn(INDEX_EVOLUTION);
         };
         _loc19_.onRollOver = function()
         {
            evolutionBtnIcon.gotoAndStop(2);
         };
         _loc19_.onRollOut = _loc19_.onReleaseOutside = function()
         {
            evolutionBtnIcon.gotoAndStop(1);
         };
      }
      _loc19_._x = _loc10_ == null?SLOTSTARTX:_loc10_._x + extBtnWidth;
      _loc19_._y = _loc11_ + TOPBGHEIGHT + _loc13_ + 20;
      evolutionBtnIcon._x = _loc19_._x + extBtnWidth / 2 - evolutionBtnIcon._width / 2;
      evolutionBtnIcon._y = _loc19_._y + 2;
      _loc10_ = _loc19_;
      var _loc29_ = lib.util.UIString.getUIString("$051015");
      lib.manager.ToolTip.add(_loc19_,_loc29_,1);
   }
   if(bVisibleEnchantShiftBtn)
   {
      var _loc18_ = container_mc.enchantShiftBtn;
      var enchantShiftBtnIcon = container_mc.enchantShiftBtnIcon;
      if(_loc18_ == undefined)
      {
         _loc18_ = container_mc.attachMovie("extBtnArea","enchantShiftBtn",container_mc.getNextHighestDepth());
         _loc18_._width = extBtnWidth;
         enchantShiftBtnIcon = container_mc.attachMovie("extBtn4","enchantShiftBtnIcon",container_mc.getNextHighestDepth());
         enchantShiftBtnIcon.hitTestDisable = true;
         _loc18_.onRelease = function()
         {
            ToGame_InventoryWindow_ClickExtBtn(INDEX_ENCHANTSHIFT);
         };
         _loc18_.onRollOver = function()
         {
            enchantShiftBtnIcon.gotoAndStop(2);
         };
         _loc18_.onRollOut = _loc18_.onReleaseOutside = function()
         {
            enchantShiftBtnIcon.gotoAndStop(1);
         };
      }
      _loc18_._x = _loc10_ == null?SLOTSTARTX:_loc10_._x + extBtnWidth;
      _loc18_._y = _loc11_ + TOPBGHEIGHT + _loc13_ + 20;
      enchantShiftBtnIcon._x = _loc18_._x + extBtnWidth / 2 - enchantShiftBtnIcon._width / 2;
      enchantShiftBtnIcon._y = _loc18_._y + 2;
      _loc10_ = _loc18_;
      _loc27_ = lib.util.UIString.getUIString("$051015");
      lib.manager.ToolTip.add(_loc18_,_loc27_,1);
   }
   if(bVisibleExtractBtn)
   {
      var _loc20_ = container_mc.extractBtn;
      var extractBtnIcon = container_mc.extractBtnIcon;
      if(_loc20_ == undefined)
      {
         _loc20_ = container_mc.attachMovie("extBtnArea","extractBtn",container_mc.getNextHighestDepth());
         _loc20_._width = extBtnWidth;
         extractBtnIcon = container_mc.attachMovie("extBtn0","extractBtnIcon",container_mc.getNextHighestDepth());
         extractBtnIcon.hitTestDisable = true;
         _loc20_.onRelease = function()
         {
            ToGame_InventoryWindow_ClickExtBtn(INDEX_EXTRACT);
         };
         _loc20_.onRollOver = function()
         {
            extractBtnIcon.gotoAndStop(2);
         };
         _loc20_.onRollOut = _loc20_.onReleaseOutside = function()
         {
            extractBtnIcon.gotoAndStop(1);
         };
      }
      _loc20_._x = _loc10_ == null?SLOTSTARTX:_loc10_._x + extBtnWidth;
      _loc20_._y = _loc11_ + TOPBGHEIGHT + _loc13_ + 20;
      extractBtnIcon._x = _loc20_._x + extBtnWidth / 2 - extractBtnIcon._width / 2;
      extractBtnIcon._y = _loc20_._y + 2;
      _loc10_ = _loc20_;
      var _loc28_ = lib.util.UIString.getUIString("$051010");
      lib.manager.ToolTip.add(_loc20_,_loc28_,1);
   }
   if(bVisibleResetOptionBtn)
   {
      var _loc14_ = container_mc.resetBtn;
      var resetBtnIcon = container_mc.resetBtnIcon;
      if(_loc14_ == undefined)
      {
         _loc14_ = container_mc.attachMovie("extBtnArea","resetBtn",container_mc.getNextHighestDepth());
         _loc14_._width = extBtnWidth;
         var resetBtnIcon = container_mc.attachMovie("extBtn3","resetBtnIcon",container_mc.getNextHighestDepth());
         resetBtnIcon.hitTestDisable = true;
         _loc14_.onRelease = function()
         {
            ToGame_InventoryWindow_ClickExtBtn(INDEX_RESETOPTION);
         };
         _loc14_.onRollOver = function()
         {
            resetBtnIcon.gotoAndStop(2);
         };
         _loc14_.onRollOut = _loc14_.onReleaseOutside = function()
         {
            resetBtnIcon.gotoAndStop(1);
         };
      }
      _loc14_.txt.text = "reset";
      _loc14_._x = _loc10_ == null?SLOTSTARTX:_loc10_._x + extBtnWidth;
      _loc14_._y = _loc11_ + TOPBGHEIGHT + _loc13_ + 20;
      resetBtnIcon._x = _loc14_._x + extBtnWidth / 2 - resetBtnIcon._width / 2;
      resetBtnIcon._y = _loc14_._y + 2;
      _loc10_ = _loc14_;
      var _loc25_ = lib.util.UIString.getUIString("$051013");
      lib.manager.ToolTip.add(_loc14_,_loc25_,1);
   }
   if(bVisibleCrystalBtn)
   {
      var _loc16_ = container_mc.crystalBtn;
      var crystalBtnIcon = container_mc.crystalBtnIcon;
      if(_loc16_ == undefined)
      {
         _loc16_ = container_mc.attachMovie("extBtnArea","crystalBtn",container_mc.getNextHighestDepth());
         _loc16_._width = extBtnWidth;
         var crystalBtnIcon = container_mc.attachMovie("extBtn1","crystalBtnIcon",container_mc.getNextHighestDepth());
         crystalBtnIcon.hitTestDisable = true;
         _loc16_.onRelease = function()
         {
            ToGame_InventoryWindow_ClickExtBtn(INDEX_CRYSTAL);
         };
         _loc16_.onRollOver = function()
         {
            crystalBtnIcon.gotoAndStop(2);
         };
         _loc16_.onRollOut = _loc16_.onReleaseOutside = function()
         {
            crystalBtnIcon.gotoAndStop(1);
         };
      }
      _loc16_._x = _loc10_ == null?SLOTSTARTX:_loc10_._x + extBtnWidth;
      _loc16_._y = _loc11_ + TOPBGHEIGHT + _loc13_ + 20;
      crystalBtnIcon._x = _loc16_._x + extBtnWidth / 2 - crystalBtnIcon._width / 2;
      crystalBtnIcon._y = _loc16_._y + 2;
      var _loc26_ = lib.util.UIString.getUIString("$051011");
      lib.manager.ToolTip.add(_loc16_,_loc26_,1);
      _loc10_ = _loc16_;
   }
   container_mc.tcatLabel._visible = tcatVisible;
   container_mc.tcatTxt._visible = tcatVisible;
   container_mc.tcatBtn._visible = tcatVisible;
   container_mc.cGoldLabel._visible = cMoneyVisible;
   container_mc.cGoldTxt._visible = cMoneyVisible;
   container_mc.exchangeBtn._visible = cMoneyVisible;
   container_mc.goldLabel.text = cMoneyVisible != false?goldLabelStr_c:goldLabelStr;
   var _loc17_ = _loc10_ == null?_loc11_ + TOPBGHEIGHT + _loc13_ + 31:_loc11_ + TOPBGHEIGHT + _loc13_ + 63;
   container_mc.countTxt._y = _loc10_ == null?_loc17_ - 29:_loc11_ + TOPBGHEIGHT + _loc13_ + 2;
   container_mc.goldLabel._y = _loc17_ + 2;
   container_mc.goldTxt._y = _loc17_;
   container_mc.sortBtn._y = _loc17_;
   container_mc.tcatLabel._y = _loc17_ + 24;
   container_mc.tcatTxt._y = _loc17_ + 22;
   container_mc.tcatBtn._y = _loc17_ + 22;
   container_mc.cGoldLabel._y = _loc17_ + 24;
   container_mc.cGoldTxt._y = _loc17_ + 22;
   container_mc.exchangeBtn._y = _loc17_ + 22;
   var _loc24_ = bgBottomBm_0_1;
   var _loc22_ = BOTTOMBGHEIGHT_0_1;
   if(tcatVisible || cMoneyVisible)
   {
      _loc24_ = _loc10_ == null?bgBottomBm_0_2:bgBottomBm_1_2;
      _loc22_ = _loc10_ == null?BOTTOMBGHEIGHT_0_2:BOTTOMBGHEIGHT_1_2;
      lib.display.DrawBitmapData.draw(container_mc,_loc24_,_loc21_,_loc11_ + TOPBGHEIGHT + _loc13_,0,0,BGWIDTH,_loc22_,1);
      lib.display.DrawBitmapData.draw(container_mc,bgMoneyBm,19,_loc17_,0,0,285,22,1,1,true);
      lib.display.DrawBitmapData.draw(container_mc,bgMoneyBm,19,_loc17_ + 22,0,0,285,22,1,1,true);
   }
   else
   {
      _loc24_ = _loc10_ == null?bgBottomBm_0_1:bgBottomBm_1_1;
      _loc22_ = _loc10_ == null?BOTTOMBGHEIGHT_0_1:BOTTOMBGHEIGHT_1_1;
      lib.display.DrawBitmapData.draw(container_mc,_loc24_,_loc21_,_loc11_ + TOPBGHEIGHT + _loc13_,0,0,BGWIDTH,_loc22_,1);
      lib.display.DrawBitmapData.draw(container_mc,bgMoneyBm,19,_loc17_ - 1,0,0,285,22,1,1,true);
   }
   hit._height = _loc11_ + TOPBGHEIGHT + _loc13_ + _loc22_;
   container_mc.hit._height = _loc11_ + TOPBGHEIGHT + _loc13_ + _loc22_;
   var _loc23_ = SLOTCOLUM * slotLineCount;
   var _loc6_ = 0;
   while(_loc6_ < _loc23_)
   {
      var _loc5_ = container_mc.slotContainer["inven__" + _loc6_];
      if(_loc5_ == undefined)
      {
         _loc5_ = container_mc.slotContainer.attachMovie("slotBtn","inven__" + _loc6_,container_mc.slotContainer.getNextHighestDepth());
         _loc5_.trackAsMenu = true;
         var _loc8_ = _loc6_ % SLOTCOLUM;
         var _loc7_ = int(_loc6_ / SLOTCOLUM);
         _loc5_._x = SLOTSTARTX + SLOTSPACE * _loc8_ - 1;
         _loc5_._y = SLOTSTARTY + SLOTSPACE * _loc7_ - 1;
         _loc5_.index = _loc6_;
         _loc5_.btnName = "INVENSLOTBTN";
         _loc5_.onPress = function()
         {
            if(invenDisable)
            {
               return undefined;
            }
            pressedBtn = this;
         };
         _loc5_.onRollOver = function()
         {
            super();
            container_mc.slotContainer["newAni" + this.index].removeMovieClip();
         };
         _loc5_.onRelease = function()
         {
            if(invenDisable)
            {
               return undefined;
            }
            if(_global.control)
            {
               if(pressedBtn == this)
               {
                  if(this.TEX != undefined && this.TEX != null && this.TEX != "")
                  {
                     _root.ToGame_CTRLMouseDown(this._parent._parent._parent.UIname,this.index);
                  }
               }
            }
            pressedBtn = null;
         };
         _loc5_.onDragOut = function()
         {
            if(invenDisable)
            {
               return undefined;
            }
            if(pressedBtn == this)
            {
               this.TEX = itemDatas[this.index].iconName;
               if(this.TEX != undefined)
               {
                  this.grade = itemDatas[this.index].grade;
                  this.sealType = itemDatas[this.index].sealType;
                  _global.StartIconDrag(this,this.TEX);
               }
               pressedBtn = null;
            }
         };
         _loc5_.GetName = function()
         {
            return this._name;
         };
      }
      _loc5_._visible = true;
      lib.display.TextBuilder.draw(container_mc.slotContainer,"amountTxt" + _loc6_,SLOTSTARTX + SLOTSPACE * _loc8_ + 1,SLOTSTARTY + SLOTSPACE * _loc7_ + 21,36,17,amountTextFormat);
      if(_loc6_ > 0)
      {
         createEnchantTextFd(container_mc.slotContainer,"enchantTxt" + _loc6_,SLOTSTARTX + SLOTSPACE * _loc8_ + 1,SLOTSTARTY + SLOTSPACE * _loc7_ + 1.5,36,16,enchantFormat);
      }
      else
      {
         container_mc.slotContainer.enchantTxt0._x = SLOTSTARTX + SLOTSPACE * _loc8_ + 1;
         container_mc.slotContainer.enchantTxt0._y = SLOTSTARTY + SLOTSPACE * _loc7_ + 1.5;
      }
      _loc6_ = _loc6_ + 1;
   }
}
function createEnchantTextFd(container, fdName, posX, posY, w, h, tf)
{
   var _loc1_ = container[fdName];
   if(_loc1_ == undefined)
   {
      _loc1_ = container.createTextField(fdName,container_mc.slotContainer.getNextHighestDepth(),posX,posY,w,h);
      _loc1_.hitTestDisable = true;
      _loc1_.border = false;
      _loc1_.background = false;
      _loc1_.selectable = false;
      _loc1_.wordWrap = false;
      _loc1_.type = "dynamic";
      _loc1_.multiline = false;
      _loc1_.antiAliasType = "normal";
      _loc1_.setNewTextFormat(tf);
      _loc1_.shadowColor = 21433;
      _loc1_.shadowBlurX = 2;
      _loc1_.shadowBlurY = 2;
      _loc1_.shadowStrength = 500;
      _loc1_.shadowDistance = 0;
      _loc1_.shadowQuality = 2;
   }
}
function clearSlot()
{
   var _loc8_ = SLOTCOLUM * slotLineCount;
   var _loc1_ = 0;
   while(_loc1_ < _loc8_)
   {
      var _loc5_ = container_mc.slotContainer["activeMc" + _loc1_];
      var _loc2_ = container_mc.slotContainer["coolAniMc" + _loc1_];
      var _loc4_ = container_mc.slotContainer["newAni" + _loc1_];
      var _loc6_ = container_mc.slotContainer["amountTxt" + _loc1_];
      _loc6_._visible = false;
      var _loc7_ = container_mc.slotContainer["enchantTxt" + _loc1_];
      _loc7_._visible = false;
      delete container_mc.slotContainer["inven__" + _loc1_].TEX;
      var _loc3_ = container_mc.slotContainer["gemstoneMc" + _loc1_];
      if(_loc3_ != undefined)
      {
         gs.TweenLite.killTweensOf(_loc3_,false);
         _loc3_.removeMovieClip();
      }
      if(_loc4_ != undefined)
      {
         _loc4_.removeMovieClip();
      }
      if(_loc2_ != undefined)
      {
         coolTimeManager.removeCoolTimeInstance(_loc2_);
         _loc2_.removeMovieClip();
      }
      if(_loc5_ != undefined)
      {
         _loc5_.removeMovieClip();
      }
      lib.manager.ToolTip.remove(container_mc.slotContainer["inven__" + _loc1_]);
      _loc1_ = _loc1_ + 1;
   }
}
function drawSlot()
{
   filterSlotCount = 0;
   var _loc30_ = 0;
   container_mc.slotContainer.clear();
   var _loc27_ = container_mc.slotContainer.enchantTxt0.getTextFormat();
   var _loc31_ = itemDatas.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc31_)
   {
      var _loc1_ = itemDatas[_loc2_];
      if(!(_loc1_ == undefined || _loc2_ == removeEffectIndex))
      {
         var _loc20_ = container_mc.slotContainer["inven__" + _loc2_];
         var _loc19_ = _loc1_.iconName;
         _loc20_.TEX = _loc19_;
         var _loc22_ = _loc1_.iconBm;
         var _loc17_ = _loc1_.grade;
         var _loc21_ = _loc1_.bNew;
         var _loc14_ = _loc1_.sealType;
         var _loc13_ = _loc1_.bMaster;
         var _loc29_ = _loc1_.bDurability;
         var _loc6_ = _loc1_.stateType;
         var _loc28_ = _loc1_.bActive;
         var _loc18_ = _loc1_.amount;
         var _loc15_ = _loc1_.durability;
         var _loc25_ = _loc1_.filterType;
         var _loc5_ = _loc1_.enchant;
         var _loc23_ = _loc1_.bPCPremium;
         var _loc26_ = _loc2_ % SLOTCOLUM;
         var _loc24_ = int(_loc2_ / SLOTCOLUM);
         var _loc4_ = _loc26_ * SLOTSPACE + SLOTSTARTX;
         var _loc3_ = _loc24_ * SLOTSPACE + SLOTSTARTY;
         _loc30_ = _loc30_ + 1;
         lib.display.DrawBitmapData.draw(container_mc.slotContainer,frameBm,_loc4_,_loc3_,0,0,38,38,1);
         lib.display.DrawBitmapData.draw(container_mc.slotContainer,_loc22_,_loc4_ + 2,_loc3_ + 2,0,0,34,34,0.54);
         var _loc9_ = container_mc.slotContainer["amountTxt" + _loc2_];
         _loc9_.text = _loc18_;
         _loc9_.textAutoSize = "shrink";
         _loc9_.textColor = 0 >= _loc6_?14145495:7368816;
         _loc9_._visible = _loc18_ != "";
         var _loc7_ = container_mc.slotContainer["enchantTxt" + _loc2_];
         var _loc10_ = 0 >= _loc6_?21433:3615811;
         var _loc12_ = 0 >= _loc6_?14145495:7368816;
         var _loc11_ = false;
         var _loc16_ = 14;
         if(_loc23_)
         {
            _loc12_ = 12975929;
            _loc10_ = 0;
            _loc16_ = 12;
            _loc7_.text = "PC방";
            _loc11_ = true;
         }
         else
         {
            if(11 < _loc5_ && _loc5_ < 15)
            {
               _loc10_ = 0 >= _loc6_?8915599:2299429;
            }
            else if(14 < _loc5_)
            {
               _loc10_ = 0 >= _loc6_?10624002:4074792;
            }
            if(_loc5_ != undefined && _loc5_ != "" && _loc5_ != 0 && _loc5_ != -1)
            {
               _loc7_.text = "+" + _loc5_;
               _loc11_ = true;
            }
         }
         _loc27_.size = _loc16_;
         _loc7_.setTextFormat(_loc27_);
         _loc7_.shadowColor = _loc10_;
         _loc7_.textColor = _loc12_;
         _loc7_._visible = _loc11_;
         if(_loc6_ > 0)
         {
            lib.display.DrawBitmapData.draw(container_mc.slotContainer,UI["disableBm" + _loc6_],_loc4_ + 1,_loc3_ + 1,0,0,38,38,1);
         }
         if(_loc17_ > 0)
         {
            lib.display.DrawBitmapData.draw(container_mc.slotContainer,UI["gradeBm" + _loc17_],_loc4_ + 2,_loc3_ + 2,0,0,11,11,BITMAP_RESIZE);
         }
         if(_loc13_ == 1)
         {
            lib.display.DrawBitmapData.draw(container_mc.slotContainer,masterBm,_loc4_ + 22,_loc3_ + 18,0,0,20,30,BITMAP_RESIZE);
         }
         else if(_loc13_ == 2)
         {
            lib.display.DrawBitmapData.draw(container_mc.slotContainer,wakeupBm,_loc4_ + 16,_loc3_ + 21,0,0,20,30,BITMAP_RESIZE);
         }
         if(_loc14_ > 0)
         {
            lib.display.DrawBitmapData.draw(container_mc.slotContainer,UI["sealBm" + _loc14_],_loc4_ + 2,_loc3_ + 2,0,0,38,38,BITMAP_RESIZE);
         }
         if(_loc21_)
         {
            var _loc8_ = container_mc.slotContainer["newAni" + _loc2_];
            if(!_loc8_)
            {
               _loc8_ = container_mc.slotContainer.attachMovie("newAni","newAni" + _loc2_,container_mc.slotContainer.getNextHighestDepth());
               _loc8_.hitTestDisable = true;
               _loc8_._x = _loc4_;
               _loc8_._y = _loc3_;
            }
         }
         if(_loc15_ > 0)
         {
            lib.display.DrawBitmapData.draw(container_mc.slotContainer,UI["durabilityBm" + _loc15_],_loc4_,_loc3_,0,0,38,38,1);
         }
         if(_loc25_ > 0)
         {
            filterSlotCount++;
         }
         lib.manager.ToolTip.add(container_mc.slotContainer["inven__" + _loc2_],_loc2_,6);
      }
      _loc2_ = _loc2_ + 1;
   }
   container_mc.countTxt.text = _loc30_ + " / " + slotLineCount * 8;
   filterBg();
}
function setAimVisible(bFlag)
{
   container_mc.aimBox.aimTitleFd._visible = bFlag;
   container_mc.aimBox.aimTitleHit._visible = bFlag;
   container_mc.aimBox.aimExpandBtn._visible = bFlag;
   container_mc.aimBox.aimNextHtmlFd._visible = bFlag;
   container_mc.aimBox.aimCurrentHtmlFd._visible = bFlag;
   container_mc.aimBox.aimNextTitleFd._visible = bFlag;
   container_mc.aimBox.aimNextNoticeFd._visible = bFlag;
   container_mc.aimBox.aimNextInfoFd._visible = bFlag;
   container_mc.aimBox.aimCurrentTitleFd._visible = bFlag;
   container_mc.aimBox.aimCurrentNoticeFd._visible = bFlag;
   container_mc.aimBox.aimContainer._visible = bFlag;
   container_mc.aimBox.aimNextSlot._visible = bFlag;
   container_mc.aimBox.aimGaugeSlot._visible = bFlag;
   container_mc.aimBox.aimGaugeBar._visible = bFlag;
   container_mc.aimBox.aimGaugeBarUnder._visible = bFlag;
   container_mc.aimBox.aimGaugeBg._visible = bFlag;
   container_mc.aimBox.aimGaugeFd._visible = bFlag;
   container_mc.aimBox.aimGaugeCurrentFd._visible = bFlag;
   container_mc.aimBox.aimGaugeTotalFd._visible = bFlag;
   container_mc.aimBox.aimCurrentSlot._visible = bFlag;
   container_mc.aimBox.aimNextBtn._visible = bFlag;
   container_mc.aimBox.aimCurrentBtn._visible = bFlag;
   container_mc.aimBox.aimNextBtnEffect._visible = bFlag;
   container_mc.aimBox.aimNextSlotEffect._visible = bFlag;
   container_mc.aimBox.aimCurrentBtnEffect._visible = bFlag;
   container_mc.aimBox.aimCurrentSlotEffect._visible = bFlag;
   clearGaugeEffect();
   if(bFlag)
   {
      setAimNextHtmlMode();
      setAimNextGaugeMode();
      setAimCurrentHtmlMode();
      drawAim();
   }
}
function setAimNextHtmlMode()
{
   var _loc1_ = !bNextHtml?false:true;
   container_mc.aimBox.aimNextHtmlFd._visible = _loc1_;
   container_mc.aimBox.aimNextNoticeFd._visible = !_loc1_;
   container_mc.aimBox.aimNextInfoFd._visible = !_loc1_;
   container_mc.aimBox.aimNextSlot._visible = !_loc1_;
   container_mc.aimBox.aimGaugeSlot._visible = !_loc1_;
   container_mc.aimBox.aimGaugeBar._visible = !_loc1_;
   container_mc.aimBox.aimGaugeBarUnder._visible = !_loc1_;
   container_mc.aimBox.aimGaugeBg._visible = !_loc1_;
   container_mc.aimBox.aimGaugeFd._visible = !_loc1_;
   container_mc.aimBox.aimGaugeCurrentFd._visible = !_loc1_;
   container_mc.aimBox.aimGaugeTotalFd._visible = !_loc1_;
   container_mc.aimBox.aimNextBtn._visible = !_loc1_;
   container_mc.aimBox.aimNextBtnEffect._visible = !_loc1_;
   container_mc.aimBox.aimNextSlotEffect._visible = !_loc1_;
   if(_loc1_)
   {
      aimSlotData[0] = undefined;
      aimSlotData[2] = undefined;
      var _loc2_ = container_mc.aimBox.aimTextEffect;
      if(_loc2_ != undefined)
      {
         gs.TweenLite.killTweensOf(_loc2_,false);
         _loc2_.removeMovieClip();
      }
      var _loc3_ = container_mc.aimBox.aimNextEffect;
      if(_loc3_ != undefined)
      {
         aimNextEfffect.removeMovieClip();
      }
   }
}
function setAimCurrentHtmlMode()
{
   var _loc1_ = !bCurrentHtml?false:true;
   container_mc.aimBox.aimCurrentHtmlFd._visible = _loc1_;
   container_mc.aimBox.aimCurrentNoticeFd._visible = !_loc1_;
   container_mc.aimBox.aimCurrentSlot._visible = !_loc1_;
   container_mc.aimBox.aimCurrentBtn._visible = !_loc1_;
   container_mc.aimBox.aimCurrentBtnEffect._visible = !_loc1_;
   container_mc.aimBox.aimCurrentSlotEffect._visible = !_loc1_;
   if(_loc1_)
   {
      aimSlotData[1] = undefined;
   }
}
function drawAim()
{
   drawAimBg();
   drawAimExpandIcon();
   drawAimSlot();
}
function drawAimBg()
{
   if(aimType != 1)
   {
      return undefined;
   }
   lib.display.DrawBitmapData.draw(container_mc.aimBox.aimContainer,aimBgBm,AIM_BG_X,AIM_BG_Y,0,0,AIM_BG_W,AIM_BG_H,1);
   if(bNextHtml)
   {
      lib.display.DrawBitmapData.draw(container_mc.aimBox.aimContainer,aimHtmlBgBm1,3.5,60,0,0,224,228,1);
   }
   if(bCurrentHtml)
   {
      lib.display.DrawBitmapData.draw(container_mc.aimBox.aimContainer,aimHtmlBgBm2,3.5,320,0,0,224,228,1);
   }
   if(bNextHtml == false && bGauge)
   {
      lib.display.DrawBitmapData.draw(container_mc.aimBox.aimContainer,aimGagueBgBm,58,209,0,0,148,24,1);
   }
}
function drawAimExpandIcon()
{
   var _loc1_ = UI["expandIcon" + expandBtnState + "Bm" + aimType];
   var _loc3_ = container_mc.aimBox.aimExpandBtn._width;
   var _loc6_ = container_mc.aimBox.aimExpandBtn._height;
   var _loc5_ = container_mc.aimBox.aimExpandBtn._x;
   var _loc7_ = container_mc.aimBox.aimExpandBtn._y;
   var _loc4_ = (_loc3_ - EXPAND_ICON_W) / 2 + _loc5_;
   var _loc2_ = (_loc6_ - EXPAND_ICON_H) / 2 + _loc7_;
   if(aimType > 0)
   {
      lib.display.DrawBitmapData.draw(container_mc.aimBox.aimContainer,_loc1_,_loc4_,_loc2_,0,0,EXPAND_ICON_W,EXPAND_ICON_H,1);
   }
}
function setAimNextGaugeMode()
{
   if(bNextHtml)
   {
      return undefined;
   }
   var _loc1_ = !bGauge?false:true;
   container_mc.aimBox.aimGaugeSlot._visible = _loc1_;
   container_mc.aimBox.aimGaugeBar._visible = _loc1_;
   container_mc.aimBox.aimGaugeBarUnder._visible = _loc1_;
   container_mc.aimBox.aimGaugeBg._visible = _loc1_;
   container_mc.aimBox.aimGaugeFd._visible = _loc1_;
   container_mc.aimBox.aimGaugeCurrentFd._visible = _loc1_;
   container_mc.aimBox.aimGaugeTotalFd._visible = _loc1_;
   container_mc.aimBox.aimNextBtn._visible = !_loc1_;
   var _loc3_ = container_mc.container_mc.aimBox.aimNextBtnEffect;
   if(_loc3_ != undefined)
   {
      gs.TweenLite.killTweensOf(_loc3_,false);
      _loc3_.removeMovieClip();
   }
   var _loc2_ = container_mc.aimBox.aimTextEffect;
   if(_loc2_ != undefined)
   {
      gs.TweenLite.killTweensOf(_loc2_,false);
      _loc2_.removeMovieClip();
   }
   var _loc4_ = container_mc.aimBox.aimNextEffect;
   if(_loc4_ != undefined)
   {
      aimNextEfffect.removeMovieClip();
   }
   if(_loc1_ == false)
   {
      aimSlotData[2] = undefined;
   }
}
function ToGame_InventoryWindow_ClickBtn(id)
{
   getURL("FSCommand:ToGame_InventoryWindow_ClickBtn",id);
}
function drawAimSlot()
{
   if(aimType != 1)
   {
      return undefined;
   }
   var _loc3_ = 0;
   while(_loc3_ < aimSlotData.length)
   {
      var _loc1_ = aimSlot[_loc3_];
      lib.manager.ToolTip.remove(_loc1_);
      var _loc2_ = aimSlotScale[_loc3_];
      var _loc4_ = aimSlotData[_loc3_];
      if(_loc3_ == 1)
      {
         container_mc.aimBox.aimCurrentEnchantFd.text = "";
      }
      if(_loc4_ != undefined)
      {
         var _loc9_ = _loc4_.iconBm;
         var _loc6_ = _loc4_.grade;
         var _loc10_ = _loc4_.master;
         var _loc8_ = _loc4_.id;
         var _loc7_ = _loc4_.disableSlot;
         var _loc5_ = Number(_loc4_.enchant);
         if(_loc7_)
         {
            lib.display.DrawBitmapData.draw(container_mc.aimBox.aimContainer,disableSlotBm,_loc1_._x,_loc1_._y,0,0,64 * _loc2_,64 * _loc2_,_loc2_);
         }
         else
         {
            lib.display.DrawBitmapData.draw(container_mc.aimBox.aimContainer,_loc9_,_loc1_._x,_loc1_._y,0,0,64 * _loc2_,64 * _loc2_,_loc2_);
            if(_loc3_ < 2)
            {
               lib.display.DrawBitmapData.draw(container_mc.aimBox.aimContainer,aimFrameBm,_loc1_._x - 10,_loc1_._y - 9,0,0,116,114,1);
            }
            if(_loc6_ > 0)
            {
               lib.display.DrawBitmapData.draw(container_mc.aimBox.aimContainer,UI["gradeBm" + _loc6_],_loc1_._x,_loc1_._y,0,0,14 * _loc2_,14 * _loc2_,_loc2_);
            }
            if(bMaster == 1)
            {
               lib.display.DrawBitmapData.draw(container_mc.slotContainer,masterBm,btn._x + 50,btn._y + 42,0,0,25.2,36,1.2);
            }
            else if(bMaster == 2)
            {
               lib.display.DrawBitmapData.draw(container_mc.slotContainer,wakeupBm,btn._x + 50,btn._y + 42,0,0,25.2,36,1.2);
            }
            if(sealType > 0)
            {
               lib.display.DrawBitmapData.draw(container_mc.slotContainer,UI["sealBm" + sealType],pX,pY,0,0,50,50,1);
            }
            if(isNaN(_loc5_) == false && _loc5_ != -1 && _loc5_ != 0)
            {
               container_mc.aimBox.aimCurrentEnchantFd.text = "+" + _loc5_;
            }
            lib.manager.ToolTip.add(_loc1_,_loc8_,6);
         }
      }
      _loc3_ = _loc3_ + 1;
   }
}
function setAimData(aimIndex, slotData)
{
   var _loc2_ = aimSlot[aimIndex];
   var _loc1_ = lib.util.ExtString.split(slotData,"\t");
   var _loc8_ = _loc1_[ID];
   var _loc11_ = _loc1_[IMG];
   var _loc13_ = Number(_loc1_[AMOUNT]);
   var _loc5_ = Number(_loc1_[STACKABLE]);
   var _loc7_ = Number(_loc1_[DISABLE]);
   var _loc14_ = Number(_loc1_[GRADE]);
   var _loc9_ = Number(_loc1_[SEALTYPE]);
   var _loc3_ = Number(_loc1_[MASTER]);
   var _loc4_ = Number(_loc1_[ENCHANT]);
   _loc2_.id = _loc8_;
   var _loc10_ = flash.display.BitmapData.loadBitmap(_loc11_);
   aimSlotData[aimIndex] = {id:_loc8_,img:_loc11_,iconBm:_loc10_,grade:_loc14_,sealType:_loc9_,master:_loc3_,disableSlot:false,enchant:_loc4_};
}
function decreaseAlpha(target, speed)
{
   gs.TweenLite.to(target,speed,{_alpha:30,onComplete:increaseAlpha,onCompleteParams:[target,speed]});
}
function increaseAlpha(target, speed)
{
   gs.TweenLite.to(target,speed,{_alpha:100,ease:gs.easing.Strong.easeOut,onComplete:decreaseAlpha,onCompleteParams:[target,speed]});
}
function setAimGaugeEffect()
{
   if(bGauge == false)
   {
      return undefined;
   }
   var _loc2_ = gaugeCurrent + gaugeIncrease;
   var _loc4_ = 142 * _loc2_ / gaugeTotal;
   container_mc.aimBox.aimGaugeBar._width = _loc4_;
   startTween(container_mc.aimBox.aimGaugeBar,0.15,30,100);
   setTimeout(isTweenComplete,600,container_mc.aimBox.aimGaugeBar);
   var _loc1_ = container_mc.aimBox.aimTextEffect;
   if(_loc1_ == undefined)
   {
      _loc1_ = container_mc.aimBox.attachMovie("aimTextEffect","aimTextEffect",container_mc.aimBox.getNextHighestDepth());
      _loc1_._y = container_mc.aimBox.aimGaugeCurrentFd._y + 12;
      _loc1_.hitTestDisable = true;
      _loc1_.textFd.verticalAlign = "center";
   }
   var _loc3_ = 111.5;
   if(_loc2_ < 10)
   {
      _loc3_ = 116;
   }
   _loc1_.textFd.text = _loc2_;
   _loc1_._x = _loc3_;
   _loc1_.sum = _loc2_;
   _loc1_._xscale = 200;
   _loc1_._yscale = 200;
   _loc1_._alpha = 70;
   container_mc.aimBox.aimGaugeCurrentFd.text = _loc2_;
   container_mc.aimBox.aimGaugeCurrentFd._visible = false;
   gs.TweenMax.to(_loc1_,0.3,{_xscale:100,_yscale:100,_alpha:100,delay:0.1,ease:gs.easing.Bounce.easeOut,onComplete:endTextEffect});
}
function gaugeTextEffect2()
{
   var _loc1_ = container_mc.aimBox.aimTextEffect;
   gs.TweenMax.to(_loc1_,0.2,{_xscale:100,_yscale:100,onComplete:endTextEffect});
}
function endTextEffect()
{
   var _loc1_ = container_mc.aimBox.aimTextEffect;
   _loc1_.removeMovieClip();
   container_mc.aimBox.aimGaugeCurrentFd._visible = true;
   gaugeCurrent = 0;
   gaugeTotal = 0;
   gaugeIncrease = 0;
}
function ToGame_InventoryWindow_ClickBtn(id)
{
   getURL("FSCommand:ToGame_InventoryWindow_ClickBtn",id);
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
   var _loc4_ = 77;
   var _loc5_ = 18 + _loc8_ * 43;
   var _loc2_ = 79 + (_loc7_ - 1) * 43;
   var _loc3_ = 362;
   var _loc1_ = 79 + _loc7_ * 43;
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
      var _loc1_ = container_mc["filter_" + _loc2_];
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
function ToGame_InventoryWindow_ClickFilter(idx)
{
   getURL("FSCommand:ToGame_InventoryWindow_ClickFilter",idx);
}
function initFiter()
{
   container_mc["filter_" + prevFocus].State = "Nor";
   prevFocus = 0;
   container_mc.filter_0.State = "Focus";
   filterDraw();
}
function startTween(target, speed, endAlpha, startAlpha, delayTime)
{
   if(delayTime == undefined)
   {
      delayTime = 0;
   }
   gs.TweenLite.to(target,speed,{_alpha:endAlpha,ease:gs.easing.Strong.easeOut,delay:delayTime,onComplete:finishTween,onCompleteParams:[target,speed,startAlpha,endAlpha]});
}
function finishTween(target, speed, endAlpha, startAlpha)
{
   gs.TweenLite.to(target,speed,{_alpha:endAlpha,ease:gs.easing.Strong.easeOut,onComplete:startTween,onCompleteParams:[target,speed,startAlpha,endAlpha]});
}
function killTween(mc, bNested, bRemoveMc)
{
   if(bNested == undefined)
   {
      bNested = false;
   }
   if(bRemoveMc == undefined)
   {
      bRemoveMc = true;
   }
   gs.TweenLite.killTweensOf(mc,bNested);
   if(bRemoveMc)
   {
      mc.removeMovieClip();
   }
}
function isTweenComplete(mc)
{
   if(mc._alpha == 100)
   {
      killTween(mc,false,false);
   }
   else
   {
      gs.TweenLite.killTweensOf(mc);
      gs.TweenLite.to(mc,0.2,{_alpha:100,ease:gs.easing.Strong.easeOut,onComplete:killTween,onCompleteParams:[mc,false,false]});
   }
}
function clearGaugeEffect()
{
   gs.TweenLite.killTweensOf(container_mc.aimBox.aimNextEffect,false);
   gs.TweenLite.killTweensOf(container_mc.aimBox.aimTextEffect,false);
   gs.TweenLite.killTweensOf(container_mc.aimBox.aimGaugeEffect,false);
   container_mc.aimBox.aimNextEffect.removeMovieClip();
   container_mc.aimBox.aimTextEffect.removeMovieClip();
   container_mc.aimBox.aimGaugeEffect.removeMovieClip();
}
var UI = this;
UI._visible = false;
var UIname = "Inventory";
container_mc.UIDrager.setData(UIname,UI,container_mc.lock_mc);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      container_mc.lock_mc._x = 318;
      container_mc.lock_mc._y = 9;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
         showNewEffect();
         initFiter();
      }
      else
      {
         myListener.OnGameEventSetInvenItemList();
         UI._visible = false;
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
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
      showNewEffect();
   }
   else
   {
      UI._visible = false;
   }
};
var goldLabelStr = lib.util.UIString.getUIString("$051002");
var goldLabelStr_c = lib.util.UIString.getUIString("$051005");
var TCATTYPE = lib.gamedata.DefaultData.getDefaultUIData("TcatEnable").param1;
var tcatVisible = false;
var cMoneyVisible = false;
myListener.OnGameEventSetInvenMoney = function(invenMoney, invenTCat, invenCMoney)
{
   var _loc2_ = invenTCat != undefined && invenTCat != "" && invenTCat != "undefined";
   var _loc3_ = invenCMoney != undefined && invenCMoney != "" && invenCMoney != "undefined";
   container_mc.goldTxt.htmlText = invenMoney;
   container_mc.tcatTxt.htmlText = lib.util.GoldCurrency.SetTCatText(invenTCat,TCATTYPE);
   container_mc.cGoldTxt.htmlText = invenCMoney;
   if(_loc2_ != tcatVisible || _loc3_ != cMoneyVisible)
   {
      tcatVisible = _loc2_;
      cMoneyVisible = _loc3_;
      clearBg();
      drawBg();
      UI.scaleExpander.scaleExpanderEventCheck(UI,UIname);
   }
};
myListener.OnGame_InventoryWindow_SetSlotLine = function(wantLineNum)
{
   if(wantLineNum == undefined || wantLineNum == "")
   {
      return undefined;
   }
   clearBg();
   slotLineCount = Number(wantLineNum);
   drawBg();
   myListener.OnGame_InventoryWindow_SetDisable(!invenDisable);
   UI.scaleExpander.scaleExpanderEventCheck(UI,UIname);
};
var itemDatas = [];
myListener.OnGameEventSetInvenItemList = function(itemDataList)
{
   var _loc1_ = setData(itemDataList,false);
   if(_loc1_)
   {
      clearSlot();
      drawSlot();
   }
};
myListener.OnGame_InventoryWindow_AddItem = function(itemDataList)
{
   var _loc1_ = setData(itemDataList,true);
   if(_loc1_)
   {
      drawSlot();
   }
};
var coolTimeManager = lib.util.CoolTimeManger.getInstance();
myListener.OnGame_InventoryWindow_SetItemCoolTime = function(itemIndexs, remain, total)
{
   var _loc10_ = lib.util.ExtString.split(itemIndexs,"\t");
   var _loc11_ = _loc10_.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc11_)
   {
      var _loc2_ = _loc10_[_loc3_];
      var _loc1_ = container_mc.slotContainer["coolAniMc" + _loc2_];
      if(remain <= 0 || total <= 0)
      {
         if(_loc1_.coolTime != undefined)
         {
            coolTimeManager.removeCoolTimeInstance(_loc1_);
            _loc1_.removeMovieClip();
         }
      }
      else
      {
         if(_loc1_ == undefined)
         {
            _loc1_ = container_mc.slotContainer.attachMovie("coolTime_ani","coolAniMc" + _loc2_,container_mc.slotContainer.getNextHighestDepth());
            var _loc7_ = _loc2_ % SLOTCOLUM;
            var _loc6_ = int(_loc2_ / SLOTCOLUM);
            var _loc5_ = _loc7_ * SLOTSPACE + SLOTSTARTX;
            var _loc4_ = _loc6_ * SLOTSPACE + SLOTSTARTY + 1;
            _loc1_._x = _loc5_;
            _loc1_._y = _loc4_ - 1;
            _loc1_._xscale = _loc1_._yscale = 76;
            _loc1_.hitTestDisable = true;
         }
         _loc1_.setCoolTime(remain,total);
         coolTimeManager.addCoolTimeInstance(_loc1_);
      }
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_InventoryWindow_UnsealItem = function(index, unsealType)
{
   unsealType = Number(unsealType);
   var effectMc;
   var slotBtn = container_mc.slotContainer["inven__" + index];
   if(unsealType == 1)
   {
      effectMc = container_mc.slotContainer.attachMovie("effect_unseal","sealEffect" + index,container_mc.slotContainer.getNextHighestDepth());
      effectMc._x = slotBtn._x + 12;
      effectMc._y = slotBtn._y;
   }
   else if(unsealType == 2)
   {
      effectMc = container_mc.slotContainer.attachMovie("effect_unseal_ancient","sealEffect" + index,container_mc.slotContainer.getNextHighestDepth());
      effectMc._x = slotBtn._x + 12;
      effectMc._y = slotBtn._y;
   }
   else if(unsealType == 3)
   {
      effectMc = container_mc.slotContainer.attachMovie("effect_enchant","sealEffect" + index,container_mc.slotContainer.getNextHighestDepth());
      effectMc._x = slotBtn._x + 3;
      effectMc._y = slotBtn._y + 3;
      slotBtn.hitTestDisable = true;
      lib.util.FrameSeeker.seek(effectMc,1,effectMc._totalframes,function()
      {
         effectMc.removeMovieClip();
         slotBtn.hitTestDisable = false;
      }
      );
   }
   effectMc._xscale = effectMc._yscale = SLOT_RESIZE;
};
myListener.OnGame_InventoryWindow_SealItem = function(index, sealType)
{
   sealType = Number(sealType);
   var _loc1_ = undefined;
   var _loc2_ = container_mc.slotContainer["inven__" + index];
   if(sealType == 1)
   {
      _loc1_ = container_mc.slotContainer.attachMovie("effect_seal","sealEffect" + index,container_mc.slotContainer.getNextHighestDepth());
   }
   else if(sealType == 2)
   {
      _loc1_ = container_mc.slotContainer.attachMovie("effect_seal_ancient","sealEffect" + index,container_mc.slotContainer.getNextHighestDepth());
   }
   _loc1_._x = _loc2_._x + 28;
   _loc1_._y = _loc2_._y + 22;
   _loc1_._xscale = _loc1_._yscale = SLOT_RESIZE;
};
myListener.OnGame_InventoryWindow_ChangedSlot = function(changedList)
{
   return undefined;
};
var invenDisable = false;
myListener.OnGame_InventoryWindow_SetDisable = function(bEnable)
{
   bEnable = Number(bEnable);
   bEnable = bEnable != 1?false:true;
   invenDisable = !bEnable;
   container_mc.tcatBtn._visible = bEnable && tcatVisible;
   if(prevFocus == 0)
   {
      container_mc.sortBtn._visible = bEnable;
   }
   else
   {
      container_mc.sortBtn._visible = false;
   }
   container_mc.exchangeBtn._visible = bEnable && cMoneyVisible;
   var _loc4_ = SLOTCOLUM * slotLineCount;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = container_mc.slotContainer["inven__" + _loc1_];
      _loc2_._visible = true;
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_InventoryWindow_SetCharacterName = function(__name)
{
   lib.manager.UISkin.setInGameCharacterName(container_mc,__name);
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(invenDisable)
   {
      return undefined;
   }
   var _loc4_ = target.btnName == "INVENSLOTBTN";
   var _loc5_ = target != undefined && target != "";
   if(_loc4_)
   {
      if(button == 2)
      {
         ToGameInvenItemRightBtnClicked(target._name);
         ToGame_InventoryWindow_RightClickSlot(target._name);
      }
      else if(button == 1)
      {
         if(_root.bSelectSlotMode)
         {
            ToGame_InventoryWindow_LeftClickSlot(target._name);
         }
      }
   }
   else if(_root.bSelectSlotMode)
   {
      if(button == 1)
      {
         if(_loc5_)
         {
            ToGame_InventoryWindow_LeftClickSlot("InvalidUI");
         }
         else
         {
            ToGame_InventoryWindow_LeftClickSlot("GameScreen");
         }
      }
   }
};
myListener.OnGame_InventoryWindow_SetToggle = function(idList, bTrue)
{
   bTrue = Number(bTrue);
   var _loc8_ = lib.util.ExtString.split(idList,"\t");
   var _loc9_ = _loc8_.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc9_)
   {
      var _loc2_ = _loc8_[_loc3_];
      if(bTrue)
      {
         var _loc1_ = container_mc.slotContainer["activeMc" + _loc2_];
         if(_loc1_ != undefined)
         {
            return undefined;
         }
         _loc1_ = container_mc.slotContainer.attachMovie("FX_ACTIVE","activeMc" + _loc2_,container_mc.slotContainer.getNextHighestDepth());
         var _loc7_ = _loc2_ % SLOTCOLUM;
         var _loc6_ = int(_loc2_ / SLOTCOLUM);
         var _loc5_ = _loc7_ * SLOTSPACE + SLOTSTARTX;
         var _loc4_ = _loc6_ * SLOTSPACE + SLOTSTARTY;
         _loc1_.hitTestDisable = true;
         _loc1_._xscale = _loc1_._yscale = 108 * BITMAP_RESIZE;
         _loc1_._x = _loc5_ - 5;
         _loc1_._y = _loc4_ - 7;
      }
      else
      {
         container_mc.slotContainer["activeMc" + _loc2_].removeMovieClip();
      }
      _loc3_ = _loc3_ + 1;
   }
};
var bVisibleExtractBtn = false;
var bVisibleCrystalBtn = false;
var bVisibleEnchantBtn = false;
var bVisibleEnchantShiftBtn = false;
var bVisibleResetOptionBtn = false;
var bVisibleEvolutionBtn = false;
var extBtnWidth = 0;
var INDEX_EXTRACT = 0;
var INDEX_CRYSTAL = 1;
var INDEX_ENCHANT = 2;
var INDEX_RESETOPTION = 3;
var INDEX_ENCHANTSHIFT = 4;
var INDEX_EVOLUTION = 5;
myListener.OnGame_InventoryWindow_ShowExtBtn = function(bExtractBtn, bCrystalBtn, bEnchantBtn, bResetOptionBtn, bEnchantShiftBtn, bEvolutionBtn)
{
   if(bEvolutionBtn == undefined)
   {
      bEvolutionBtn = 0;
   }
   bVisibleExtractBtn = Number(bExtractBtn);
   bVisibleCrystalBtn = Number(bCrystalBtn);
   bVisibleEnchantBtn = Number(bEnchantBtn);
   bVisibleResetOptionBtn = Number(bResetOptionBtn);
   bVisibleEnchantShiftBtn = Number(bEnchantShiftBtn);
   bVisibleEvolutionBtn = Number(bEvolutionBtn);
   var _loc2_ = Number(bExtractBtn) + Number(bCrystalBtn) + Number(bEnchantBtn) + Number(bResetOptionBtn) + Number(bEnchantShiftBtn) + Number(bEvolutionBtn);
   extBtnWidth = 340 / _loc2_;
};
myListener.OnGame_InventoryWindow_SetGemstoneEffect = function(param)
{
   var _loc13_ = lib.util.ExtString.split(param,"\n");
   var _loc14_ = _loc13_.length;
   var _loc4_ = 0;
   while(_loc4_ < _loc14_)
   {
      var _loc5_ = lib.util.ExtString.split(_loc13_[_loc4_],"\t");
      var _loc2_ = Number(_loc5_[0]);
      var _loc3_ = Number(_loc5_[1]);
      lib.Debuger.trace("slotIndex : " + _loc2_ + ", bFlag : " + _loc3_);
      var _loc9_ = _loc2_ % SLOTCOLUM;
      var _loc8_ = int(_loc2_ / SLOTCOLUM);
      var _loc7_ = _loc9_ * SLOTSPACE + SLOTSTARTX;
      var _loc6_ = _loc8_ * SLOTSPACE + SLOTSTARTY;
      var _loc1_ = container_mc.slotContainer["gemstoneMc" + _loc2_];
      if(_loc3_ && _loc1_ == undefined)
      {
         _loc1_ = container_mc.slotContainer.attachMovie("gemstoneAni","gemstoneMc" + _loc2_,container_mc.slotContainer.getNextHighestDepth());
         _loc1_._x = _loc7_;
         _loc1_._y = _loc6_;
         _loc1_.hitTestDisable = true;
         gs.TweenLite.to(_loc1_,0.5,{_alpha:0,onComplete:playGemstoneEffect,onCompleteParams:[_loc1_,100]});
      }
      else if(_loc3_ == 0 && _loc1_)
      {
         gs.TweenLite.killTweensOf(_loc1_,false);
         _loc1_.removeMovieClip();
      }
      _loc4_ = _loc4_ + 1;
   }
};
myListener.OnGame_InventoryWindow_AddNew = function(mcName, $visible)
{
   $visible = Number($visible);
   var _loc1_ = container_mc[mcName + "NewIcon"];
   if($visible)
   {
      if(_loc1_ == undefined)
      {
         _loc1_ = container_mc.attachMovie("newIcon",mcName + "NewIcon",container_mc.getNextHighestDepth());
         _loc1_._xscale = _loc1_._yscale = 80;
         _loc1_._x = container_mc[mcName]._x + container_mc[mcName]._width - 8;
         _loc1_._y = container_mc[mcName]._y;
         _loc1_.hitTestDisable = true;
      }
   }
   else
   {
      _loc1_.removeMovieClip();
   }
};
var bgTopBm = flash.display.BitmapData.loadBitmap("BG_Top");
var bgBodyBm = flash.display.BitmapData.loadBitmap("BG_Body");
var bgBodyLockBm = flash.display.BitmapData.loadBitmap("BG_Body_Lock");
var bgBottomBm_0_1 = flash.display.BitmapData.loadBitmap("BG_Bottom_0_1");
var bgBottomBm_0_2 = flash.display.BitmapData.loadBitmap("BG_Bottom_0_2");
var bgBottomBm_1_1 = flash.display.BitmapData.loadBitmap("BG_Bottom_1_1");
var bgBottomBm_1_2 = flash.display.BitmapData.loadBitmap("BG_Bottom_1_2");
var bgMoneyBm = flash.display.BitmapData.loadBitmap("BG_Money");
var bgBtnBm = flash.display.BitmapData.loadBitmap("BG_Btn");
var coolTimeManager = lib.util.CoolTimeManger.getInstance();
var slotLineCount;
var BGWIDTH = 378;
var TOPBGHEIGHT = 78;
var BODYBGHEIGHT = 43;
var BOTTOMBGHEIGHT_0_1 = 58;
var BOTTOMBGHEIGHT_0_2 = 81;
var BOTTOMBGHEIGHT_1_1 = 94;
var BOTTOMBGHEIGHT_1_2 = 111;
var BOTTOM1BGHEIGHT = 81;
var BOTTOM2BGHEIGHT = 81;
var SLOTCOLUM = 8;
var SLOTSTARTX = 19;
var SLOTSTARTY = TOPBGHEIGHT + 2.5;
var SLOTSPACE = 43;
var LARGESIZELINE = 15;
var amountTextFormat = new TextFormat("$NormalFont",17,14145495,false,false,false,null,null,"right",0,0,0,0);
var enchantTextFormat = new TextFormat("$NormalFont",14,16777215,false,false,false,null,null,"right",0,0,0,0);
var pressedBtn = null;
var enchantFormat = container_mc.slotContainer.enchantTxt0.getTextFormat();
container_mc.slotContainer.enchantTxt0.text = "";
var removeEffectIndex = -1;
myListener.OnGame_InventoryWindow_SetRemoveEffect = function(slotIndex)
{
   removeEffectIndex = Number(slotIndex);
   var _loc4_ = container_mc.slotContainer["activeMc" + removeEffectIndex];
   var _loc2_ = container_mc.slotContainer["coolAniMc" + removeEffectIndex];
   var _loc3_ = container_mc.slotContainer["newAni" + removeEffectIndex];
   var _loc5_ = container_mc.slotContainer["amountTxt" + removeEffectIndex];
   _loc5_._visible = false;
   delete container_mc.slotContainer["inven__" + removeEffectIndex].TEX;
   if(_loc3_ != undefined)
   {
      _loc3_.removeMovieClip();
   }
   if(_loc2_ != undefined)
   {
      coolTimeManager.removeCoolTimeInstance(_loc2_);
      _loc2_.removeMovieClip();
   }
   if(_loc4_ != undefined)
   {
      _loc4_.removeMovieClip();
   }
   lib.manager.ToolTip.remove(container_mc.slotContainer["inven__" + removeEffectIndex]);
   var _loc9_ = itemDatas[removeEffectIndex];
   var _loc8_ = _loc9_.iconBm;
   var _loc11_ = removeEffectIndex % SLOTCOLUM;
   var _loc10_ = int(removeEffectIndex / SLOTCOLUM);
   var _loc7_ = _loc11_ * SLOTSPACE + SLOTSTARTX;
   var _loc6_ = _loc10_ * SLOTSPACE + SLOTSTARTY;
   drawSlot();
   var _loc1_ = container_mc.attachMovie("removeEffect","removeEffectMc" + removeEffectIndex,container_mc.getNextHighestDepth());
   _loc1_._x = _loc7_;
   _loc1_._y = _loc6_;
   _loc1_._xscale = _loc1_._yscale = SLOT_RESIZE;
   lib.display.DrawBitmapData.draw(_loc1_.removeSlot,_loc8_,2,2,0,0,50,50,0.77);
};
var frameBm = flash.display.BitmapData.loadBitmap("Slot_Frame");
var gradeBm1 = flash.display.BitmapData.loadBitmap("iconGrade1");
var gradeBm2 = flash.display.BitmapData.loadBitmap("iconGrade2");
var gradeBm3 = flash.display.BitmapData.loadBitmap("iconGrade3");
var masterBm = flash.display.BitmapData.loadBitmap("master");
var wakeupBm = flash.display.BitmapData.loadBitmap("wakeup");
var sealBm1 = flash.display.BitmapData.loadBitmap("iconSeal1");
var sealBm2 = flash.display.BitmapData.loadBitmap("iconSeal2");
var disableBm2 = flash.display.BitmapData.loadBitmap("Slot_Disable");
var disableBm1 = flash.display.BitmapData.loadBitmap("Slot_Impossible");
var durabilityBm1 = flash.display.BitmapData.loadBitmap("durability1");
var durabilityBm2 = flash.display.BitmapData.loadBitmap("durability2");
var disableSlotBm = flash.display.BitmapData.loadBitmap("disableSlot");
container_mc.xBtn.onRelease = function()
{
   ToGame_Inventory_CloseUI();
};
container_mc.sortBtn.onRelease = function()
{
   ToGame_Inventory_RequestSort();
};
container_mc.tcatBtn.onRelease = function()
{
   ToGame_Inventory_TCatBuy();
};
container_mc.exchangeBtn.onRelease = function()
{
   ToGame_Inventory_RequestExchange();
};
fscommand("ToGame_Inventory_Init");
var leftLimit = [0,253,16];
var aimType = 0;
var bNextHtml = false;
var bCurrentHtml = false;
var bGauge = false;
myListener.OnGame_InventoryWindow_SetAimType = function(type)
{
   aimType = Number(type);
   lib.manager.ToolTip.remove(container_mc.aimBox.aimExpandBtn);
   container_mc.aimBox.aimContainer.clear();
   var _loc3_ = !(aimType == 0 || aimType == 1)?false:aimType;
   setAimVisible(_loc3_);
   if(aimType == 2)
   {
      container_mc.aimBox.aimExpandBtn._visible = true;
      container_mc.aimBox.aimContainer._visible = true;
      drawAimExpandIcon();
   }
   var _loc1_ = leftLimit[aimType];
   var _loc4_ = lib.info.AlignInfo.uiScale(UIName,UI);
   var _loc2_ = _loc1_ * (lib.info.AlignInfo.scaleRatio * _loc4_);
   container_mc.UIDrager.adjustDragLimit(_loc1_,0,0,0);
   if(UI._x < _loc2_)
   {
      UI._x = _loc2_;
   }
   if(aimType == 1)
   {
      lib.manager.ToolTip.add(container_mc.aimBox.aimExpandBtn,aimExpand_1,1);
   }
   else if(aimType == 2)
   {
      lib.manager.ToolTip.add(container_mc.aimBox.aimExpandBtn,aimExpand_0,1);
   }
};
container_mc.aimBox.aimNextSlot._alpha = 0;
container_mc.aimBox.aimCurrentSlot._alpha = 0;
container_mc.aimBox.aimGaugeSlot._alpha = 0;
var AIM_BG_X = -4;
var AIM_BG_Y = -10;
var AIM_BG_W = 237;
var AIM_BG_H = 567;
var aimBgBm = flash.display.BitmapData.loadBitmap("aimBg");
var aimGagueBgBm = flash.display.BitmapData.loadBitmap("gaugeBg");
var aimHtmlBgBm1 = flash.display.BitmapData.loadBitmap("aimNextBg");
var aimHtmlBgBm2 = flash.display.BitmapData.loadBitmap("aimCurrentBg");
var EXPAND_ICON_W = 11;
var EXPAND_ICON_H = 17;
var expandIconNorBm1 = flash.display.BitmapData.loadBitmap("expandIconNor1");
var expandIconNorBm2 = flash.display.BitmapData.loadBitmap("expandIconNor2");
var expandIconOverBm1 = flash.display.BitmapData.loadBitmap("expandIconOver1");
var expandIconOverBm2 = flash.display.BitmapData.loadBitmap("expandIconOver2");
container_mc.aimBox.aimMc.noticeFd_2.verticalAlign = "center";
container_mc.aimBox.aimTitleFd.verticalAlign = "center";
container_mc.aimBox.aimNextHtmlFd.verticalAlign = "center";
container_mc.aimBox.aimCurrentHtmlFd.verticalAlign = "center";
container_mc.aimBox.aimNextTitleFd.verticalAlign = "center";
container_mc.aimBox.aimNextNoticeFd.verticalAlign = "center";
container_mc.aimBox.aimNextInfoFd.verticalAlign = "center";
container_mc.aimBox.aimCurrentTitleFd.verticalAlign = "center";
container_mc.aimBox.aimCurrentNoticeFd.verticalAlign = "center";
container_mc.aimBox.aimGaugeFd.verticalAlign = "center";
container_mc.aimBox.aimGaugeCurrentFd.verticalAlign = "center";
container_mc.aimBox.aimGaugeTotalFd.verticalAlign = "center";
container_mc.aimBox.aimNextBtn.id = "aimNextBtn";
container_mc.aimBox.aimCurrentBtn.id = "aimCurrentBtn";
container_mc.aimBox.aimExpandBtn.id = "aimExpandBtn";
container_mc.aimBox.aimGaugeFd.hitTestDisable = true;
container_mc.aimBox.aimGaugeCurrentFd.hitTestDisable = true;
container_mc.aimBox.aimGaugeTotalFd.hitTestDisable = true;
container_mc.aimBox.aimGaugeBar.hitTestDisable = true;
var aimNextBtn = container_mc.aimBox.aimNextBtn.txtBtn;
var aimCurrentBtn = container_mc.aimBox.aimCurrentBtn.txtBtn;
lib.manager.ToolTip.add(container_mc.aimBox.aimTitleHit,"aimTitle",6);
lib.manager.ToolTip.add(container_mc.aimBox.aimGaugeBg,"aimTitle",6);
container_mc.aimBox.aimNextBtn.btn.onRelease2 = function()
{
   ToGame_InventoryWindow_ClickBtn(this._parent.id);
};
container_mc.aimBox.aimCurrentBtn.btn.onRelease2 = function()
{
   ToGame_InventoryWindow_ClickBtn(this._parent.id);
};
var bNextHtml = false;
var bCurrentHtml = false;
var aimSlotData = [];
aimSlotData[0] = {disableSlot:true};
aimSlotData[1] = undefined;
aimSlotData[2] = undefined;
myListener.OnGame_InventoryWindow_SetAimSlots = function(nextSlotData, currentSlotData, nextHtmlText, currentHtmlText)
{
   if(nextSlotData == undefined || nextSlotData == "" || nextSlotData == "undefined")
   {
      aimSlotData[0] = [];
      aimSlotData[0] = {disableSlot:true};
   }
   else
   {
      setAimData(0,nextSlotData);
   }
   if(currentSlotData != undefined && currentSlotData != "" && currentSlotData && "undefined")
   {
      setAimData(1,currentSlotData);
   }
   else
   {
      aimSlotData[1] = undefined;
   }
   if(nextHtmlText != undefined && nextHtmlText != "" && nextHtmlText != "undefined")
   {
      bNextHtml = true;
      container_mc.aimBox.aimNextHtmlFd.htmlText = nextHtmlText;
      aimSlotData[0] = undefined;
      aimSlotData[2] = undefined;
   }
   else
   {
      bNextHtml = false;
   }
   if(currentHtmlText != undefined && currentHtmlText != "" && currentHtmlText != "undefined")
   {
      bCurrentHtml = true;
      container_mc.aimBox.aimCurrentHtmlFd.htmlText = currentHtmlText;
      aimSlotData[1] = undefined;
   }
   else
   {
      bCurrentHtml = false;
   }
   container_mc.aimBox.aimContainer.clear();
   drawAim();
   setAimNextHtmlMode();
   setAimNextGaugeMode();
   setAimCurrentHtmlMode();
};
var ID = 0;
var IMG = 1;
var AMOUNT = 2;
var STACKABLE = 3;
var DISABLE = 4;
var GRADE = 5;
var SEALTYPE = 6;
var MASTER = 7;
var ENCHANT = 8;
var aimSlot = [container_mc.aimBox.aimNextSlot,container_mc.aimBox.aimCurrentSlot,container_mc.aimBox.aimGaugeSlot];
var aimSlotScale = [1.5,1.5,0.5];
var aimFrameBm = flash.display.BitmapData.loadBitmap("aimSlotFrame");
myListener.OnGame_InventoryWindow_SetAimSlotEffect = function(bNext, bCurrent)
{
   bNext = Number(bNext);
   bCurrent = Number(bCurrent);
   var _loc1_ = container_mc.aimBox.aimNextSlotEffect;
   var _loc2_ = container_mc.aimBox.aimCurrentSlotEffect;
   if(bNext)
   {
      if(_loc1_ == undefined)
      {
         _loc1_ = container_mc.aimBox.attachMovie("aimSlotEffect","aimNextSlotEffect",container_mc.aimBox.getNextHighestDepth());
         _loc1_._x = container_mc.aimBox.aimNextSlot._x - 3;
         _loc1_._y = container_mc.aimBox.aimNextSlot._y - 3;
         _loc1_.hitTestDisable = true;
      }
   }
   else
   {
      gs.TweenLite.killTweensOf(_loc1_,false);
      _loc1_.removeMovieClip();
   }
   if(bCurrent)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = container_mc.aimBox.attachMovie("aimSlotEffect","aimCurrentSlotEffect",container_mc.aimBox.getNextHighestDepth());
         _loc2_._x = container_mc.aimBox.aimCurrentSlot._x - 3;
         _loc2_._y = container_mc.aimBox.aimCurrentSlot._y - 3;
         _loc2_.hitTestDisable = true;
      }
   }
   else
   {
      gs.TweenLite.killTweensOf(_loc2_,false);
      _loc2_.removeMovieClip();
   }
};
myListener.OnGame_InventoryWindow_SetAimBtnEffect = function(bNext, bCurrent)
{
   bNext = Number(bNext);
   bCurrent = Number(bCurrent);
   var _loc1_ = container_mc.aimBox.aimNextBtnEffect;
   var _loc2_ = container_mc.aimBox.aimCurrentBtnEffect;
   if(bNext)
   {
      bGauge = false;
      setAimNextGaugeMode();
      if(_loc1_ == undefined)
      {
         _loc1_ = container_mc.aimBox.attachMovie("aimBtnEffect","aimNextBtnEffect",container_mc.aimBox.getNextHighestDepth());
         _loc1_._x = container_mc.aimBox.aimNextBtn._x;
         _loc1_._y = container_mc.aimBox.aimNextBtn._y;
         _loc1_.hitTestDisable = true;
         decreaseAlpha(_loc1_,0.7);
      }
   }
   else
   {
      gs.TweenLite.killTweensOf(_loc1_,false);
      _loc1_.removeMovieClip();
   }
   if(bCurrent)
   {
      if(_loc2_ == undefined)
      {
         _loc2_ = container_mc.aimBox.attachMovie("aimBtnEffect","aimCurrentBtnEffect",container_mc.aimBox.getNextHighestDepth());
         _loc2_._x = container_mc.aimBox.aimCurrentBtn._x;
         _loc2_._y = container_mc.aimBox.aimCurrentBtn._y;
         _loc2_.hitTestDisable = true;
         decreaseAlpha(_loc2_,0.7);
      }
   }
   else
   {
      gs.TweenLite.killTweensOf(_loc2_,false);
      _loc2_.removeMovieClip();
   }
};
myListener.OnGame_InventoryWindow_SetTitleText = function(titleText, nextTitle, currentTitle)
{
   container_mc.aimBox.aimTitleFd.htmlText = titleText;
   container_mc.aimBox.aimNextTitleFd.htmlText = nextTitle;
   container_mc.aimBox.aimCurrentTitleFd.htmlText = currentTitle;
};
myListener.OnGame_InventoryWindow_SetNoticeText = function(nextNotice, nextInfo, currentNotice)
{
   container_mc.aimBox.aimNextNoticeFd.htmlText = nextNotice;
   container_mc.aimBox.aimNextInfoFd.htmlText = nextInfo;
   container_mc.aimBox.aimCurrentNoticeFd.htmlText = currentNotice;
};
myListener.OnGame_InventoryWindow_SetAimBtnName = function(nextName, currentName)
{
   if(nextName != undefined && nextName != "" && nextName != "undefined")
   {
      bGauge = false;
      aimNextBtn.setText(nextName);
      setAimNextGaugeMode();
   }
   if(currentName != undefined && currentName != "" && currentName != "undefined")
   {
      aimCurrentBtn.setText(currentName);
   }
};
myListener.OnGame_InventoryWindow_SetAimBtnDisable = function(bNext, bCurrent)
{
   if(bNext != undefined && bNext != "" && bNext != "undefined")
   {
      bNext = Number(bNext);
      bGauge = false;
      setAimNextGaugeMode();
      aimNextBtn.setEnabled(bNext);
   }
   if(bCurrent != undefined && bCurrent != "" && bCurrent != "undefined")
   {
      bCurrent = Number(bCurrent);
      aimCurrentBtn.setEnabled(bCurrent);
   }
};
var timer = null;
var gaugeCurrent = 0;
var gaugeTotal = 0;
var gaugeIncrease = 0;
myListener.OnGame_InventoryWindow_SetAimGauge = function(current, total, increase, slotData)
{
   bGauge = true;
   setAimNextGaugeMode();
   gaugeCurrent = Number(current);
   gaugeTotal = Number(total);
   container_mc.aimBox.aimGaugeTotalFd.text = total;
   if(increase == "" || increase == "0" || increase == undefined || increase == "undefined" || increase == 0)
   {
      container_mc.aimBox.aimGaugeBar._width = 142 * current / total;
      container_mc.aimBox.aimGaugeBarUnder._width = 142 * current / total;
      container_mc.aimBox.aimGaugeCurrentFd.text = current;
   }
   else
   {
      gaugeIncrease = Number(increase);
      var _loc1_ = container_mc.aimBox.aimNextEffect;
      if(_loc1_ == undefined)
      {
         _loc1_ = container_mc.aimBox.attachMovie("aimNextEffect","aimNextEffect",container_mc.aimBox.getNextHighestDepth());
         _loc1_.hitTestDisable = true;
      }
      _loc1_._x = AIM_BG_X + 5;
      _loc1_._y = AIM_BG_Y + 5;
   }
   if(slotData != undefined && slotData != "" && slotData != "undefined")
   {
      setAimData(2,slotData);
      container_mc.aimBox.aimContainer.clear();
      drawAim();
   }
};
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
var filterToolTip = ["$221160","$221161","$221162","$221163","$221164","$221165","$221166"];
var initFilterData = "0";
var MAX_FILTER = 7;
myListener.OnGame_InventoryWindow_SetFilter = function(_data)
{
   var _loc11_ = lib.util.ExtString.split(_data,"\t");
   var _loc12_ = _loc11_.length;
   filterTotal = MAX_FILTER;
   var _loc4_ = 7;
   var _loc8_ = 42;
   var _loc13_ = FILTER_WIDTH - FILTER_MAIN_PLUS;
   var _loc10_ = _loc13_ / filterTotal;
   var _loc6_ = 0;
   while(_loc6_ < filterTotal)
   {
      var _loc5_ = "";
      var _loc3_ = undefined;
      if(_loc6_ == 0)
      {
         _loc3_ = container_mc.attachMovie("filterBtnAF","filter_AF",container_mc.filterContainer.getDepth() - 20);
         _loc3_._x = _loc4_;
         _loc3_._y = _loc8_;
         _loc5_ = "A";
      }
      else if(_loc6_ == 6)
      {
         _loc3_ = container_mc.attachMovie("filterBtnEF","filter_EF",container_mc.filterContainer.getDepth() - 21);
         _loc3_._x = _loc4_;
         _loc3_._y = _loc8_;
         _loc5_ = "E";
      }
      var _loc2_ = container_mc.attachMovie("filterBtn" + _loc5_,"filter_" + _loc6_,container_mc.filterContainer.getDepth() - Number(_loc6_ + 10));
      _loc2_._x = _loc4_;
      _loc2_._y = _loc8_;
      lib.manager.ToolTip.add(_loc2_,lib.util.UIString.getUIString(filterToolTip[_loc6_]),1);
      _loc2_.idx = _loc6_;
      _loc2_.State = "Nor";
      if(_loc6_ == 0)
      {
         _loc4_ = _loc4_ + (_loc10_ + FILTER_MAIN_PLUS);
      }
      else
      {
         _loc4_ = _loc4_ + _loc10_;
      }
      _loc2_.onRelease = function()
      {
         if(this.State != "Focus")
         {
            container_mc["filter_" + prevFocus].State = "Nor";
            prevFocus = this.idx;
            this.State = "Focus";
            ToGame_InventoryWindow_ClickFilter(this.idx);
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
      _loc6_ = _loc6_ + 1;
   }
   _loc6_ = 0;
   while(_loc6_ < _loc12_)
   {
      var _loc7_ = Number(_loc11_[_loc6_]);
      var _loc9_ = container_mc["filter_" + _loc7_];
      _loc9_.State = "Focus";
      prevFocus = _loc7_;
      _loc6_ = _loc6_ + 1;
   }
   filterDraw();
};
myListener.OnGame_InventoryWindow_SetFilter(initFilterData);
var aimExpand_0 = lib.util.UIString.getUIString("$051007");
var aimExpand_1 = lib.util.UIString.getUIString("$051008");
var expandBtnState = "Nor";
container_mc.aimBox.aimExpandBtn.onRelease = function()
{
   ToGame_InventoryWindow_ClickBtn(this.id);
};
container_mc.aimBox.aimExpandBtn.onRollOver = function()
{
   expandBtnState = "Over";
   container_mc.aimBox.aimContainer.clear();
   drawAim();
};
container_mc.aimBox.aimExpandBtn.onRollOut = function()
{
   expandBtnState = "Nor";
   container_mc.aimBox.aimContainer.clear();
   drawAim();
};
container_mc.aimBox.aimExpandBtn.onReleaseOutside = function()
{
   expandBtnState = "Nor";
   container_mc.aimBox.aimContainer.clear();
   drawAim();
};
setAimVisible(0);
lib.Debuger.trace(this);
stop();
