function init()
{
   var _loc1_ = getScale();
   toolTipMc._xscale = toolTipMc._yscale = _loc1_;
   tooltip_fmt.tabStops = [90,140];
   toolTipMc.tipText.textColor = lib.info.TextColor.TOOLTIP_NORMAL;
   toolTipMc.tipText.setNewTextFormat(tooltip_fmt);
   toolTipMc._visible = false;
   toolTipMc.bSiege = false;
}
function getScale()
{
   var _loc2_ = lib.info.AlignInfo.uiScale(UIname,UI);
   var _loc1_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc2_);
   return _loc1_ * 100;
}
function ToGame_BattlePetToolTip_Close(tooltipId)
{
   getURL("FSCommand:ToGame_BattlePetToolTip_Close",tooltipId);
}
function ToGame_ToolTip_Close(tooltipId)
{
   getURL("FSCommand:ToGame_ToolTip_Close",tooltipId);
}
function createSectionFd(targetMc, fdName, pX, nextY, textFdW)
{
   var _loc1_ = targetMc.createTextField(fdName,targetMc.getNextHighestDepth(),pX,nextY,textFdW,1);
   _loc1_.multiline = true;
   _loc1_.wordWrap = true;
   _loc1_.html = true;
   _loc1_.selectable = false;
   _loc1_.verticalAutoSize = "top";
   var _loc2_ = targetMc.tipText.getTextFormat();
   _loc2_.tabStops = [75];
   _loc1_.setNewTextFormat(_loc2_);
   _loc1_.styleSheet = toolTipStyle;
   return _loc1_;
}
function SetGuideSkillDraw(targetMc, pX, nextY, skillStr, skillData)
{
   var _loc21_ = skillData.length;
   var _loc13_ = 0;
   var _loc3_ = 0;
   var _loc2_ = null;
   var _loc24_ = targetMc.attachMovie("parentSlotMc","parentSlotMc",targetMc.getNextHighestDepth());
   _loc24_.gotoAndStop(_loc21_);
   _loc24_._x = pX;
   _loc24_._y = nextY - 2;
   lib.display.DrawBitmapData.draw(_loc24_,parentSlotImg,3,3,0,0,37,37,0.578125);
   var _loc6_ = 0;
   while(_loc6_ < _loc21_)
   {
      _loc2_ = targetMc.attachMovie("skillSlotMc","PetSkillSlotMc_" + _loc6_,targetMc.getNextHighestDepth());
      _loc2_._x = pX + 80;
      _loc2_._y = nextY;
      var _loc1_ = _loc2_.textFd;
      _loc1_.multiline = true;
      _loc1_.wordWrap = true;
      _loc1_.html = true;
      _loc1_.selectable = false;
      _loc1_.verticalAutoSize = "top";
      var _loc12_ = targetMc.tipText.getTextFormat();
      _loc12_.tabStops = [100];
      _loc1_.setNewTextFormat(_loc12_);
      _loc1_.styleSheet = toolTipStyle;
      var _loc17_ = skillData[_loc6_].img;
      lib.display.DrawBitmapData.draw(_loc2_,_loc17_,0,0,0,0,37,37,0.578125);
      _loc3_ = skillStr.indexOf("<SkillSlot",_loc13_ + 2);
      if(_loc3_ == undefined || _loc3_ == -1)
      {
         _loc3_ = skillStr.length;
      }
      var _loc5_ = skillStr.slice(_loc13_,_loc3_);
      var _loc7_ = "style=\'";
      var _loc4_ = _loc5_.indexOf(_loc7_);
      var _loc11_ = "";
      if(-1 != _loc4_ && undefined != _loc4_)
      {
         var _loc18_ = _loc5_.indexOf("\'",_loc4_ + _loc7_.length);
         var _loc9_ = _loc5_.substring(_loc4_ + _loc7_.length,_loc18_);
         var _loc8_ = _loc9_.indexOf(":");
         if(-1 != _loc8_ && undefined != _loc8_)
         {
            _loc11_ = _loc9_.substring(_loc8_ + 1,_loc9_.length);
         }
      }
      var _loc16_ = "red" == _loc11_;
      if(_loc16_)
      {
         lib.display.DrawBitmapData.draw(_loc2_,UI.petSkillDisable,0,0,0,0,37,37);
      }
      _loc1_.htmlText = _loc5_;
      var _loc10_ = _loc1_.textHeight + 5;
      var _loc15_ = Math.max(_loc10_,37);
      _loc1_._height = _loc10_;
      nextY = _loc2_._y + _loc15_ + 10;
      _loc13_ = _loc3_;
      _loc6_ = _loc6_ + 1;
   }
   return _loc2_;
}
function SetPetSkillDraw(targetMc, pX, nextY, skillStr, skillData)
{
   var _loc16_ = skillData.length;
   var _loc7_ = 0;
   var _loc4_ = 0;
   var _loc2_ = null;
   var _loc3_ = 0;
   while(_loc3_ < _loc16_)
   {
      _loc2_ = targetMc.attachMovie("skillSlotMc","PetSkillSlotMc_" + _loc3_,targetMc.getNextHighestDepth());
      _loc2_._x = pX;
      _loc2_._y = nextY;
      var _loc1_ = _loc2_.textFd;
      _loc1_.multiline = true;
      _loc1_.wordWrap = true;
      _loc1_.html = true;
      _loc1_.selectable = false;
      _loc1_.verticalAutoSize = "top";
      var _loc6_ = targetMc.tipText.getTextFormat();
      _loc6_.tabStops = [100];
      _loc1_.setNewTextFormat(_loc6_);
      _loc1_.styleSheet = toolTipStyle;
      var _loc12_ = skillData[_loc3_].img;
      lib.display.DrawBitmapData.draw(_loc2_,_loc12_,0,0,0,0,37,37,0.578125);
      var _loc10_ = skillData[_loc3_].bdisable;
      if(_loc10_ == "1")
      {
         lib.display.DrawBitmapData.draw(_loc2_,UI.petSkillDisable,0,0,0,0,37,37);
      }
      _loc4_ = skillStr.indexOf("<SkillSlot",_loc7_ + 2);
      if(_loc4_ == undefined || _loc4_ == -1)
      {
         _loc4_ = skillStr.length;
      }
      var _loc9_ = skillStr.slice(_loc7_,_loc4_);
      _loc1_.htmlText = _loc9_;
      var _loc5_ = _loc1_.textHeight + 5;
      var _loc8_ = Math.max(_loc5_,37);
      _loc1_._height = _loc5_;
      nextY = _loc2_._y + _loc8_ + 10;
      _loc7_ = _loc4_;
      _loc3_ = _loc3_ + 1;
   }
   return _loc2_;
}
function SetPetToolTip(targetMc, str)
{
   var _loc22_ = lib.util.ExtString.findTag(str,"section");
   var _loc23_ = _loc22_.length;
   tipTextHeight = undefined;
   var _loc13_ = 0;
   var _loc4_ = 0;
   var _loc21_ = targetMc.tipText._x;
   var _loc24_ = targetMc.tipText._width;
   var _loc1_ = targetMc.tipText;
   var _loc3_ = _loc1_;
   var _loc5_ = targetMc.petSlotMc;
   var _loc6_ = 0;
   while(_loc6_ < _loc23_)
   {
      var _loc20_ = _loc22_[_loc6_];
      var _loc7_ = _loc20_.name;
      _loc4_ = str.indexOf("<section",_loc13_ + 2);
      if(_loc4_ == undefined || _loc4_ == -1)
      {
         _loc4_ = str.length;
      }
      var _loc2_ = str.slice(_loc13_,_loc4_);
      if(_loc6_ > 0)
      {
         var _loc16_ = _loc3_._y + _loc3_._height + 5;
         _loc1_ = createSectionFd(targetMc,"Fd_" + _loc7_,_loc21_,_loc16_,_loc24_,1);
      }
      _loc1_.htmlText = _loc2_;
      _loc1_._height = _loc1_.textHeight + 5;
      if(_loc7_ == "name")
      {
         var _loc8_ = _loc2_.indexOf("<img");
         if(_loc8_ != undefined && _loc8_ != -1)
         {
            var _loc17_ = _loc2_.slice(0,_loc8_ - 1);
            _loc1_.htmlText = _loc17_;
            var _loc19_ = _loc1_.textHeight + 5;
            _loc1_.htmlText = _loc2_;
            _loc1_._height = _loc19_;
         }
      }
      if(_loc7_ == "desc")
      {
         _loc5_ = targetMc.petSlotMc;
         _loc5_._y = _loc3_._y + _loc3_._height + 10;
         var _loc15_ = !_loc5_.expTitleFd._visible?210:250;
         _loc1_._x = 167.5;
         _loc1_._y = _loc5_._y + 25;
         _loc1_._width = _loc1_._width - 167.5;
         _loc1_._height = Math.max(_loc5_._y + _loc15_,_loc1_._y + _loc1_.textHeight + 5) - _loc1_._y;
      }
      else if(_loc7_ == "skill")
      {
         var _loc10_ = _loc2_.indexOf("<SkillSlot",0);
         var _loc18_ = _loc2_.slice(0,_loc10_);
         var _loc11_ = _loc2_.slice(_loc10_,_loc2_.length);
         _loc1_.htmlText = _loc18_;
         _loc1_._height = _loc1_.textHeight + 5;
         _loc16_ = _loc1_._y + _loc1_._height + 10;
         var _loc9_ = lib.util.ExtString.findTag(_loc11_,"SkillSlot");
         if(_loc9_ != undefined)
         {
            _loc3_ = SetPetSkillDraw(targetMc,_loc21_,_loc16_,_loc11_,_loc9_);
         }
         _loc1_._height = _loc3_._y + _loc3_._height - _loc1_._y;
      }
      _loc3_ = _loc1_;
      _loc13_ = _loc4_;
      _loc6_ = _loc6_ + 1;
   }
   tipTextHeight = _loc3_._y + _loc3_._height - 5;
}
function SetPetSlotDraw(targetMc, petData)
{
   var _loc16_ = petData[0].petname;
   var _loc17_ = petData[0].img;
   var _loc10_ = Number(petData[0].level);
   var _loc21_ = Number(petData[0].grade);
   var _loc14_ = Number(petData[0].pettype);
   var _loc6_ = Number(petData[0].copper);
   var _loc8_ = Number(petData[0].silver);
   var _loc15_ = Number(petData[0].gold);
   var _loc11_ = Number(petData[0].curexp);
   var _loc12_ = Number(petData[0].totalexp);
   var _loc18_ = Number(petData[0].curhp);
   var _loc13_ = Number(petData[0].totalhp);
   var _loc20_ = Number(petData[0].curenergy);
   var _loc19_ = Number(petData[0].totalenergy);
   var _loc3_ = targetMc.attachMovie("petSlotMc","petSlotMc",targetMc.getNextHighestDepth());
   _loc3_.nameFd.verticalAutoSize = "center";
   _loc3_.levelFd.verticalAutoSize = "center";
   _loc3_._x = 1.5;
   _loc3_._y = 35.5;
   _loc3_.nameFd.text = _loc16_;
   lib.util.DrawBitmap.draw(_loc3_.iconMc,_loc17_,BATTLE_PET_ICON_SIZE,BATTLE_PET_ICON_SIZE);
   lib.display.DrawBitmapData.draw(_loc3_.imgMc,UI["petFrame" + _loc14_ + _loc21_],0,0,0,0,256,256);
   if(_loc10_ != -1)
   {
      _loc3_.levelFd.text = _loc10_;
   }
   if(_loc6_ != -1)
   {
      var _loc9_ = _loc6_ + _loc8_ + _loc15_;
      var _loc1_ = 0;
      while(_loc1_ < _loc9_)
      {
         var _loc5_ = 130;
         var _loc4_ = 140 + _loc1_ * 14 * -1;
         var _loc2_ = UI.goldStar;
         if(_loc1_ < _loc6_)
         {
            _loc2_ = UI.copperStar;
            _loc5_ = 129;
            _loc4_ = _loc4_ - 1;
         }
         else if(_loc1_ >= _loc6_ && _loc1_ < _loc6_ + _loc8_)
         {
            _loc2_ = UI.silverStar;
         }
         lib.display.DrawBitmapData.draw(_loc3_.imgMc,_loc2_,_loc5_,_loc4_,0,0,16,16);
         _loc1_ = _loc1_ + 1;
      }
   }
   if(_loc11_ != -1)
   {
      initGauge(_loc3_);
      setPetSlotGauge(_loc3_,"exp",_loc11_,_loc12_);
      setPetSlotGauge(_loc3_,"hp",_loc18_,_loc13_);
      setPetSlotGauge(_loc3_,"energy",_loc20_,_loc19_);
   }
   else
   {
      _loc3_.expTitleFd._visible = false;
      _loc3_.expTextFd._visible = false;
      _loc3_.hpTitleFd._visible = false;
      _loc3_.hpTextFd._visible = false;
      _loc3_.energyTitleFd._visible = false;
      _loc3_.energyTextFd._visible = false;
   }
}
function initGauge(targetSlot)
{
   targetSlot.expTitleFd.verticalAutoSize = "center";
   targetSlot.expTextFd.verticalAutoSize = "center";
   targetSlot.hpTitleFd.verticalAutoSize = "center";
   targetSlot.hpTextFd.verticalAutoSize = "center";
   targetSlot.energyTitleFd.verticalAutoSize = "center";
   targetSlot.energyTextFd.verticalAutoSize = "center";
   targetSlot.expTitleFd.text = lib.util.UIString.getUIString("$620006");
   targetSlot.hpTitleFd.text = lib.util.UIString.getUIString("$620007");
   targetSlot.energyTitleFd.text = lib.util.UIString.getUIString("$620008");
   var _loc4_ = targetSlot.expTitleFd.textWidth + 5;
   var _loc2_ = Math.max(GAUGE_TITLE_DEFAULT_WIDTH,_loc4_);
   _loc4_ = targetSlot.hpTitleFd.textWidth + 5;
   _loc2_ = Math.max(_loc2_,_loc4_);
   _loc4_ = targetSlot.energyTitleFd.textWidth + 5;
   _loc2_ = Math.max(_loc2_,_loc4_);
   if(_loc2_ != GAUGE_TITLE_DEFAULT_WIDTH)
   {
      var _loc3_ = _loc2_ - GAUGE_TITLE_DEFAULT_WIDTH;
      gaugeSize = gaugeSize - _loc3_;
      targetSlot.expTitleFd._width = _loc2_;
      targetSlot.hpTitleFd._width = _loc2_;
      targetSlot.energyTitleFd._width = _loc2_;
      targetSlot.expTextFd._x = targetSlot.expTextFd._x + _loc3_;
      targetSlot.hpTextFd._x = targetSlot.hpTextFd._x + _loc3_;
      targetSlot.energyTextFd._x = targetSlot.energyTextFd._x + _loc3_;
      targetSlot.expTextFd._width = targetSlot.expTextFd._width - _loc3_;
      targetSlot.hpTextFd._width = targetSlot.hpTextFd._width - _loc3_;
      targetSlot.energyTextFd._width = targetSlot.energyTextFd._width - _loc3_;
   }
}
function setPetSlotGauge(slot, type, current, total)
{
   var _loc5_ = slot[type + "TextFd"];
   var _loc3_ = _loc5_._x;
   var _loc2_ = _loc5_._y;
   var _loc4_ = int(current / total * 10000 + 0.5);
   _loc4_ = String(_loc4_ / 100);
   var _loc6_ = _loc4_.indexOf(".");
   var _loc10_ = _loc4_.length - 1;
   if(_loc6_ == undefined || _loc6_ == -1)
   {
      _loc4_ = _loc4_ + ".00";
   }
   else if(_loc10_ - _loc6_ == 1)
   {
      _loc4_ = _loc4_ + "0";
   }
   var _loc7_ = gaugeSize * (current / total);
   if(_loc7_ > gaugeSize)
   {
      _loc7_ = gaugeSize;
   }
   slot.beginFill(2569283);
   slot.moveTo(_loc3_,_loc2_ + 2);
   slot.lineTo(_loc3_ + gaugeSize + 4,_loc2_ + 2);
   slot.lineTo(_loc3_ + gaugeSize + 4,_loc2_ + 14);
   slot.lineTo(_loc3_,_loc2_ + 14);
   slot.lineTo(_loc3_,_loc2_ + 2);
   slot.endFill();
   slot.beginFill(204868);
   slot.moveTo(_loc3_,_loc2_ + 2);
   slot.lineTo(_loc3_ + gaugeSize + 4,_loc2_ + 2);
   slot.lineTo(_loc3_ + gaugeSize + 4,_loc2_ + 3);
   slot.lineTo(_loc3_,_loc2_ + 3);
   slot.lineTo(_loc3_,_loc2_ + 2);
   slot.endFill();
   slot.beginFill(204868);
   slot.moveTo(_loc3_,_loc2_ + 13);
   slot.lineTo(_loc3_ + gaugeSize + 4,_loc2_ + 13);
   slot.lineTo(_loc3_ + gaugeSize + 4,_loc2_ + 14);
   slot.lineTo(_loc3_,_loc2_ + 14);
   slot.lineTo(_loc3_,_loc2_ + 13);
   slot.endFill();
   slot.beginFill(204868);
   slot.moveTo(_loc3_,_loc2_ + 2);
   slot.lineTo(_loc3_ + 1,_loc2_ + 2);
   slot.lineTo(_loc3_ + 1,_loc2_ + 14);
   slot.lineTo(_loc3_,_loc2_ + 14);
   slot.lineTo(_loc3_,_loc2_ + 2);
   slot.endFill();
   slot.beginFill(204868);
   slot.moveTo(_loc3_ + gaugeSize + 3,_loc2_ + 2);
   slot.lineTo(_loc3_ + gaugeSize + 4,_loc2_ + 2);
   slot.lineTo(_loc3_ + gaugeSize + 4,_loc2_ + 14);
   slot.lineTo(_loc3_ + gaugeSize + 3,_loc2_ + 14);
   slot.lineTo(_loc3_ + gaugeSize + 3,_loc2_ + 2);
   slot.endFill();
   if(current != 0 && total != 0)
   {
      _loc5_.text = _loc4_ + "%";
      lib.display.DrawBitmapData.draw(slot.imgMc,UI[type + "GaugeBar"],_loc3_ + 2,_loc2_ + 4,0,0,_loc7_,8,1,1);
   }
   else
   {
      _loc5_.text = "0.00%";
   }
}
function mouseUpEvent(btn, tg)
{
   guideVisibleCount = 0;
   if(tg)
   {
      if(guideContainer._visible)
      {
         guideContainer._alpha = 100;
         setGuidePosition();
      }
   }
}
function mouseMoveEvent(target)
{
   if(_global.gbUIMode)
   {
      applyToolTip(target);
   }
   if(guideVisibleCount == 1)
   {
      guideVisibleCount = 2;
      if(target)
      {
         if(guideContainer._visible)
         {
            guideContainer._alpha = 0;
         }
      }
   }
}
function mouseDownEvent(btn, tg)
{
   if(btn == 1 && seletTarget.type == 6 && _global.shift && !_global.chating)
   {
      setItemInfoBox();
   }
   if(tg)
   {
      guideVisibleCount = 1;
   }
}
function applyToolTip(target)
{
   clearTimeout(delayTimer);
   if(target == undefined || target == _root)
   {
      hideToolTip();
      seletTarget = undefined;
      return undefined;
   }
   var _loc2_ = searchTip(target);
   if(_loc2_ == undefined)
   {
      hideToolTip();
      seletTarget = undefined;
      return undefined;
   }
   if(seletTarget != undefined && seletTarget.tg != _loc2_.tg)
   {
      hideToolTip();
   }
   else if(seletTarget.tg == _loc2_.tg)
   {
      if(seletTarget.type == 1 || seletTarget.type == 9 || seletTarget.type == 10 || seletTarget.type == 98)
      {
         if(seletTarget == _loc2_ && seletTarget.type == 10)
         {
            return undefined;
         }
         if(Mouse.getButtonsState(0) == 1)
         {
            hideToolTip();
         }
         else
         {
            showToolTip(_loc2_);
         }
      }
      return undefined;
   }
   delayTimer = setTimeout(showToolTip,DELAYTIME,_loc2_);
}
function setOptionButton(target, curNum, maxNum, buttonType)
{
   var _loc5_ = 0;
   while(_loc5_ < maxNum)
   {
      var _loc2_ = target["button_" + _loc5_];
      if(undefined == _loc2_)
      {
         _loc2_ = target.attachMovie("optionButton","button_" + _loc5_,target.getNextHighestDepth());
         _loc2_.id = _loc5_;
         _loc2_._x = target.tipText._x + 23 * _loc5_;
         _loc2_.tf.text = String(_loc5_ + 1);
         _loc2_.hit.onRollOver = function()
         {
            if(4 == this._parent.mc._currentframe)
            {
               return undefined;
            }
            this._parent.tf.textColor = "0xC4F5FF";
            this.mc.gotoAndStop(2);
         };
         _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
         {
            if(4 == this._parent.mc._currentframe)
            {
               return undefined;
            }
            var _loc2_ = this._parent.preFrame != 4?"0x80B5DE":"0xFFFFFF";
            this._parent.tf.textColor = _loc2_;
            this.mc.gotoAndStop(this._parent.preFrame);
         };
         _loc2_.hit.onPress = function()
         {
            if(4 == this._parent.mc._currentframe)
            {
               return undefined;
            }
            this._parent.tf.textColor = "0xC4F5FF";
            this.mc.gotoAndStop(3);
         };
         _loc2_.hit.onRelease = function()
         {
            if(4 == this._parent.mc._currentframe)
            {
               return undefined;
            }
            var _loc5_ = this._parent._parent.maxNum;
            var _loc6_ = this._parent.id;
            this._parent._parent.curNum = _loc6_ + 1;
            var _loc3_ = 0;
            while(_loc3_ < _loc5_)
            {
               var _loc2_ = this._parent._parent["button_" + _loc3_];
               _loc2_.preFrame = _loc2_.hit != this?1:4;
               _loc2_.gotoAndStop(_loc2_.preFrame);
               var _loc4_ = _loc2_.preFrame != 4?"0x80B5DE":"0xFFFFFF";
               _loc2_.tf.textColor = _loc4_;
               _loc3_ = _loc3_ + 1;
            }
            ToGame_ToolTip_ClickButton(this._parent.id,this._parent._parent.id);
            selectToolTip(this._parent._parent,false,true);
         };
      }
      _loc2_.hit._visible = buttonType == BUTTON_TYPE_FIXED;
      _loc2_.mc_0._visible = buttonType == BUTTON_TYPE_FIXED;
      _loc2_.mc_1._visible = buttonType == BUTTON_TYPE_OVER;
      _loc2_.preFrame = curNum != _loc5_ + 1?1:4;
      _loc2_.mc = buttonType != BUTTON_TYPE_FIXED?_loc2_.mc_1:_loc2_.mc_0;
      _loc2_.tf.textColor = _loc2_.preFrame != 4?"0x80B5DE":"0xFFFFFF";
      _loc2_.mc.gotoAndStop(_loc2_.preFrame);
      _loc5_ = _loc5_ + 1;
   }
}
function setItemInfoBox(str, id, curNum, maxNum)
{
   if(!_global.gbUIMode)
   {
      return undefined;
   }
   stopDrag();
   statusTweens = [];
   var _loc5_ = String(seletTarget.tg).split(".");
   var _loc4_ = String(_loc5_.shift());
   while(_loc4_ != undefined)
   {
      if(_loc4_.toLowerCase() == "shortcut")
      {
         return undefined;
      }
      _loc4_ = _loc5_.shift();
   }
   if(str == undefined)
   {
      if(!toolTipMc._visible)
      {
         return undefined;
      }
      infoMc = toolTipMc;
      infoMc._name = "infoMc" + this.getNextHighestDepth();
      var _loc12_ = infoMc.maxNum;
      var _loc15_ = infoMc.curNum;
      if(0 < _loc12_)
      {
         infoMc.overMc._visible = true;
         setOptionButton(infoMc,_loc15_,_loc12_,BUTTON_TYPE_FIXED);
      }
      toolTipMc = undefined;
   }
   else
   {
      toolTipMc.id = undefined;
      infoMc = this.attachMovie("toolTipId","infoMc" + this.getNextHighestDepth(),this.getNextHighestDepth(),{_visible:false});
      infoMc.id = !(undefined == id || "0" == id || 0 == id)?id:undefined;
      infoMc.maxNum = !(undefined == maxNum || 0 == maxNum || isNaN(maxNum))?maxNum:0;
      infoMc.curNum = infoMc.maxNum != 0?curNum:0;
      infoMc.overMc.onLoad = function()
      {
         if(selectedToolTip == this._parent)
         {
            this._visible = true;
         }
      };
      setOptionButton(infoMc,curNum,maxNum,BUTTON_TYPE_FIXED);
      infoMc.tipText._width = toolTipMc.tipText._width;
      infoMc.tipText._x = LMAG;
      infoMc.tipText._y = infoMc.tipText._y + 5;
      infoMc.tipText.setNewTextFormat(tooltip_fmt);
      var _loc13_ = lib.util.ExtString.findTag(str,"ItemSlot");
      if(_loc13_ != undefined)
      {
         SetSlotDraw(infoMc,_loc13_);
      }
      infoMc.tipText.styleSheet = toolTipStyle;
      insertSection(infoMc.tipText,str,"section",false);
      SetBgDraw(infoMc,toolTipMc.bg._width,toolTipMc.bg._height);
   }
   if(infoTooltips.length == 5)
   {
      var _loc6_ = infoTooltips.shift();
      if(_loc6_.battlePetId != undefined)
      {
         ToGame_BattlePetToolTip_Close(_loc6_.battlePetId);
      }
      if(_loc6_.id != undefined)
      {
         ToGame_ToolTip_Close(_loc6_.id);
      }
      if(selectedToolTip == _loc6_)
      {
         selectedToolTip = null;
      }
      _loc6_.removeMovieClip();
   }
   infoTooltips.push(infoMc);
   var _loc22_ = getScale();
   infoMc._xscale = infoMc._yscale = _loc22_;
   var _loc14_ = 0;
   var _loc16_ = 0;
   _loc22_ = getScale();
   if(Stage.height < infoMc._height + 100)
   {
      _loc14_ = infoMc._width;
      infoMc._xscale = infoMc._yscale = _loc22_ * Stage.height / (infoMc._height + 100);
      _loc14_ = _loc14_ - (infoMc._width - 6);
      _loc16_ = -40;
   }
   var _loc25_ = infoMc.bg._width * (_loc22_ / 100);
   var _loc23_ = infoMc._height;
   var _loc18_ = (Stage.width - lib.info.AlignInfo.UI_WIDTH) / 2;
   var _loc19_ = (Stage.height - lib.info.AlignInfo.UI_HEIGHT) / 2;
   if(customPosition.x == undefined || isNaN(customPosition.x))
   {
      customPosition.x = Stage.width / 2;
      customPosition.y = lib.info.AlignInfo.UI_HEIGHT;
   }
   if(infoTooltips[infoTooltips.length - 2] != undefined)
   {
      ta.htmlText = ta.htmlText + (infoTooltips[infoTooltips.length - 2] + "\n");
      infoMc._x = infoTooltips[infoTooltips.length - 2]._x + 5;
      infoMc._y = infoTooltips[infoTooltips.length - 2]._y - 5;
   }
   else
   {
      infoMc._x = customPosition.x - infoMc._width / 2 + 5;
      infoMc._y = customPosition.y - infoMc._height - 45;
   }
   var _loc24_ = infoMc._x;
   var _loc7_ = infoMc._y;
   if(Stage.height - _loc19_ < _loc7_ + tooTipHeight)
   {
      _loc7_ = _loc7_ + (Stage.height - _loc19_ - (_loc7_ + _loc23_));
   }
   infoMc._y = _loc7_;
   infoMc._visible = true;
   infoMc.closeBtn._visible = true;
   if(infoMc._y < 0)
   {
      infoMc._y = 10;
   }
   infoMc.closeBtn.onPress = function()
   {
      for(var _loc3_ in statusTweens)
      {
         gs.TweenLite.killTweensOf(statusTweens[_loc3_],false);
         gs.TweenMax.killTweensOf(statusTweens[_loc3_],false);
      }
      statusTweens = [];
      for(var _loc4_ in infoTooltips)
      {
         if(infoTooltips[_loc4_] == this._parent)
         {
            var _loc2_ = infoTooltips.splice(_loc4_,1);
            if(_loc2_[0].battlePetId != undefined)
            {
               ToGame_BattlePetToolTip_Close(_loc2_[0].battlePetId);
            }
            if(_loc2_[0].id != undefined)
            {
               ToGame_ToolTip_Close(_loc2_[0].id);
            }
            if(selectedToolTip == _loc2_[0])
            {
               selectedToolTip = null;
            }
            _loc2_[0].removeMovieClip();
         }
      }
   };
   infoMc.bg.onPress = function()
   {
      var _loc6_ = getScale();
      var _loc4_ = this._width * (_loc6_ / 100);
      var _loc5_ = this._height * (_loc6_ / 100);
      var _loc2_ = (Stage.width - lib.info.AlignInfo.UI_WIDTH) / 2;
      var _loc3_ = (Stage.height - lib.info.AlignInfo.UI_HEIGHT) / 2;
      this._parent.swapDepths(UI.getNextHighestDepth());
      this._parent.startDrag(false,0,-30,Stage.width - _loc2_ - _loc4_,Stage.height - _loc3_ - _loc5_);
   };
   infoMc.bg.onRelease = function()
   {
      this._parent.stopDrag();
      var _loc3_ = this._parent._x;
      var _loc2_ = this._parent._y;
      customPosition.x = infoMc._x + infoMc._width / 2;
      customPosition.y = infoMc._y + infoMc._height + 50;
      if(0 < this._parent.maxNum)
      {
         selectToolTip(this._parent,true,true);
      }
   };
   infoMc.bg.onReleaseOutside = infoMc.bg.onRollOut = function()
   {
      this._parent.stopDrag();
      var _loc3_ = this._parent._x;
      var _loc2_ = this._parent._y;
      customPosition.x = infoMc._x + infoMc._width / 2;
      customPosition.y = infoMc._y + infoMc._height + 50;
   };
   if(0 < infoMc.maxNum)
   {
      selectToolTip(infoMc,false,true);
   }
   hideToolTip();
}
function setCrestInfo(parentMc, crestData, crestStr, pX, pY)
{
   var _loc6_ = 0;
   var _loc4_ = 0;
   var _loc17_ = crestData.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc17_)
   {
      _loc4_ = crestStr.indexOf("<Crest",_loc6_ + 2);
      if(_loc4_ == undefined || _loc4_ == -1)
      {
         _loc4_ = crestStr.length;
      }
      var _loc10_ = crestStr.slice(_loc6_,_loc4_);
      var _loc3_ = parentMc.attachMovie("skillSlotMc","crestSlot_" + _loc2_,parentMc.getNextHighestDepth());
      _loc3_._x = pX;
      _loc3_._y = pY;
      var _loc1_ = _loc3_.textFd;
      _loc1_.multiline = true;
      _loc1_.html = true;
      _loc1_.selectable = false;
      _loc1_.verticalAutoSize = "top";
      var _loc13_ = targetMc.tipText.getTextFormat();
      _loc1_.setNewTextFormat(_loc13_);
      _loc1_.styleSheet = toolTipStyle;
      _loc1_._x = 38;
      _loc1_.htmlText = _loc10_;
      var _loc8_ = _loc1_.textHeight + 5;
      var _loc5_ = 35;
      if(_loc8_ <= 35)
      {
         _loc1_.verticalAutoSize = "center";
         _loc1_._height = 35;
      }
      else
      {
         _loc5_ = _loc1_.textHeight + 5;
      }
      pY = _loc3_._y + _loc5_ + 7;
      _loc6_ = _loc4_;
      var _loc12_ = crestData[_loc2_].img;
      var _loc14_ = crestData[_loc2_].grade;
      var _loc9_ = crestData[_loc2_].creststate;
      setCrestSlotDraw(_loc3_,_loc12_,_loc14_,_loc9_);
      _loc2_ = _loc2_ + 1;
   }
}
function setCrestSlotDraw(targetMc, img, grade, crestState)
{
   var _loc2_ = grade <= 0?0:1;
   lib.display.DrawBitmapData.draw(targetMc,UI["crestBg" + _loc2_],0,1,0,0,CREST_BG_SIZE,CREST_BG_SIZE,1,1);
   lib.display.DrawBitmapData.draw(targetMc,img,4.5,5.5,0,0,CREST_IMG_SIZE,CREST_IMG_SIZE,CREST_IMG_SCALE,CREST_IMG_SCALE);
   if(grade > 0)
   {
      lib.display.DrawBitmapData.draw(targetMc,gradeArr[grade],3,4,0,0,CREST_GRADE_SIZE,CREST_GRADE_SIZE,CREST_GRADE_SCALE);
   }
   if(crestState == "1")
   {
      lib.display.DrawBitmapData.draw(targetMc,UI.crestLine,3,4,0,0,CREST_LINE_SIZE,CREST_LINE_SIZE);
   }
   if(crestState == "0")
   {
      lib.display.DrawBitmapData.draw(targetMc,UI.crestDisable,2.5,3.5,0,0,CREST_DISABLE_SIZE,CREST_DISABLE_SIZE,CREST_DISABLE_SCALE);
   }
}
function SetSlotDraw(_targetMc, _data, _reSize)
{
   var _loc8_ = _data[0].grade;
   var _loc7_ = _data[0].master;
   var _loc4_ = Number(_data[0].xp);
   var _loc12_ = _loc4_ * (GaugeSize / 100);
   var _loc5_ = _data[0].lv;
   var _loc2_ = _data[0].max;
   _loc2_ = _loc2_ != undefined?_loc2_:0;
   var _loc1_ = _targetMc.itemSlotMc;
   if(undefined == _loc1_)
   {
      _loc1_ = _targetMc.attachMovie("itemSlotMc","itemSlotMc",_targetMc.getNextHighestDepth());
   }
   _loc1_.clear();
   if(_loc4_ == -1)
   {
      _loc1_.txt0._visible = 0 != _loc2_;
      _loc1_.txt1._visible = 0 != _loc2_;
      _loc1_.txt2._visible = 0 != _loc2_;
      var _loc11_ = 0 == _loc2_?"":"Lv.<font size=\'13\' color=\'#0096ff\'>" + _loc5_ + "</font>";
      var _loc9_ = 0 == _loc2_?"":"/" + _loc2_;
      _loc1_.txt1.htmlText = _loc11_;
      _loc1_.txt2.text = _loc9_;
   }
   else
   {
      _loc12_ = 40 * (Number(_loc4_) / 100);
      lib.display.DrawBitmapData.draw(_loc1_,expbarBg,-9,-9,0,0,62,103);
      lib.display.DrawBitmapData.draw(_loc1_,expbar,3,SlotSize + 28,0,0,_loc12_,10);
      _loc1_.txt0.text = _loc4_ + "%";
      _loc1_.txt1.htmlText = "Lv.<font size=\'13\' color=\'#0096ff\'>" + _loc5_ + "</font>";
      _loc1_.txt2.text = "/" + _loc2_;
   }
   if(_reSize)
   {
      lib.display.DrawBitmapData.draw(_loc1_,_data[0].img,0,0,0,0,_reSize,_reSize,_reSize / 64);
   }
   else
   {
      lib.display.DrawBitmapData.draw(_loc1_,_data[0].img,0,0,0,0,SlotSize,SlotSize,SlotScale);
   }
   if(_loc8_ > 0)
   {
      lib.display.DrawBitmapData.draw(_loc1_,gradeArr[_loc8_],0,0,0,0,16 * SlotScale,16 * SlotScale,SlotScale);
   }
   if(_loc7_ == "1")
   {
      lib.display.DrawBitmapData.draw(_loc1_,"masterImg",28.5,24.5,0,0,21 * SlotScale,26 * SlotScale,SlotScale);
   }
   else if(_loc7_ == "2")
   {
      lib.display.DrawBitmapData.draw(_loc1_,"wakeupImg",28.5,24.5,0,0,21 * SlotScale,26 * SlotScale,SlotScale);
   }
   parentSlotImg = _data[0].img;
}
function SetBgDraw(_tgMc, _w, _h, headerType)
{
   var _loc2_ = 2 != headerType?1:2;
   _loc2_ = !bAwaken?_loc2_:3;
   _tgMc.bg.gotoAndStop(_loc2_);
   _tgMc.bg._width = _w;
   _tgMc.bg._height = _h;
   _tgMc.overMc._width = _w;
   _tgMc.overMc._height = _h;
   if(headerType == 2)
   {
      _tgMc.headerTF.verticalAlign = "center";
      _tgMc.headerTF.text = headerStr[compareIcon];
      _tgMc.headerTF._width = _w;
      _tgMc.headerBg._width = _w;
   }
   if(bAwaken)
   {
      lib.display.DrawBitmapData.draw(_tgMc.bgMc,UI.lightBg,3,3,0,0,357,217);
      lib.display.DrawBitmapData.draw(_tgMc.bgMc,UI.lightLine,1,1,0,0,375,247);
      var _loc6_ = _tgMc.attachMovie("awakenIcon","awakenIcon",_tgMc.getNextHighestDepth());
      _loc6_._x = 187.5;
   }
   var _loc3_ = headerType == 2 && compareIcon != 0;
   _tgMc.headerBg._visible = _loc3_;
   _tgMc.headerTF._visible = _loc3_;
}
function inputMaker(fd, str, tag)
{
   var _loc3_ = lib.util.ExtString.findTag(str,tag);
   var _loc5_ = fd._parent;
   var _loc4_ = _loc3_[0];
   var _loc7_ = _loc4_.tagindex;
   if(_loc3_.length == undefined)
   {
      return undefined;
   }
   var _loc6_ = fd.getExactCharBoundaries(_loc7_ + 1);
   var _loc8_ = _loc4_.value;
   var _loc2_ = _loc5_.attachMovie("makerMc","makerMc",_loc5_.getNextHighestDepth());
   _loc2_._x = fd._x + fd._width;
   _loc2_._y = _loc6_.y + fd._y;
   _loc2_.txt.text = _loc8_;
}
function insertSection(fd, str, tag, flag)
{
   var _loc38_ = lib.util.ExtString.findTag(str,tag);
   var _loc5_ = fd._parent;
   tipTextHeight = undefined;
   if(_loc38_.length == undefined)
   {
      return fd;
   }
   var _loc23_ = 0;
   var _loc6_ = 0;
   var _loc13_ = fd._x;
   var _loc9_ = 0;
   var _loc33_ = fd._width;
   var _loc10_ = undefined;
   var _loc4_ = fd;
   var _loc1_ = fd;
   var _loc39_ = SECTIONTYPES.length;
   var _loc34_ = 0;
   var _loc41_ = 0;
   infoBG_S = 0;
   infoBG_H = 0;
   var _loc7_ = _loc5_.itemSlotMc;
   while(_loc6_ < _loc39_)
   {
      var _loc29_ = _loc38_[_loc34_];
      var _loc3_ = _loc29_.name;
      var _loc19_ = SECTIONTYPES[_loc6_];
      _loc6_;
      if(SECTIONTYPES[_loc6_++] == _loc3_)
      {
         if(_loc3_ != "name")
         {
            _loc9_ = _loc4_._y + _loc4_._height + SECTIONSPACE;
            _loc1_ = _loc5_.createTextField("Fd" + _loc19_,_loc5_.getNextHighestDepth(),_loc13_,_loc9_,_loc33_,1);
            _loc1_.multiline = true;
            _loc1_.wordWrap = true;
            _loc1_.html = true;
            _loc1_.selectable = false;
            _loc1_.verticalAutoSize = "top";
            var _loc30_ = fd.getTextFormat();
            _loc1_.setNewTextFormat(_loc30_);
            _loc1_.styleSheet = toolTipStyle;
         }
         _loc10_ = str.indexOf("<" + tag,_loc23_ + 2);
         if(_loc10_ == undefined || _loc10_ == -1)
         {
            _loc10_ = str.length;
         }
         var _loc2_ = str.slice(_loc23_,_loc10_);
         if(bAwaken && _loc3_ == "name")
         {
            var _loc12_ = _loc2_.indexOf("<span");
            var _loc26_ = _loc2_.indexOf(">",_loc12_);
            var _loc20_ = _loc2_.slice(_loc26_ + 1,_loc2_.length);
            _loc12_ = _loc20_.indexOf("<");
            var _loc32_ = _loc20_.slice(0,_loc12_);
            _loc2_ = "<font color=\'#EBA801\' size=\'15\'>" + _loc32_ + "</font>";
         }
         if(_loc3_ != "skill")
         {
            _loc1_.htmlText = _loc2_;
            _loc4_ = _loc1_;
            _loc1_._height = _loc1_.textHeight + 5;
         }
         if((_loc3_ == "enchant" || _loc3_ == "combine") && _loc5_.maxNum != 0)
         {
            var _loc8_ = null;
            _loc6_ = 0;
            while(_loc6_ < _loc5_.maxNum)
            {
               _loc8_ = _loc5_["button_" + _loc6_];
               _loc8_._y = _loc4_._y + _loc4_._height + 5;
               _loc6_ = _loc6_ + 1;
            }
            _loc4_ = _loc8_;
         }
         if(_loc3_ == "name")
         {
            var _loc35_ = _loc1_.textHeight;
            var _loc27_ = _loc1_._y + _loc1_._height + SECTIONSPACE + 10;
            if(_loc7_)
            {
               _loc7_._y = _loc27_;
               _loc7_._x = _loc1_._x;
               var _loc28_ = !_loc7_.txt0._visible?45:90;
               _loc1_._height = _loc7_._y + _loc28_;
            }
         }
         if(_loc3_ == "desc")
         {
            fd._height = fd.textHeight + 5;
            _loc1_._y = fd._y + fd._height + SECTIONSPACE + 10;
            if(_loc7_)
            {
               _loc1_._x = _loc13_ + 55;
               _loc1_._width = _loc33_ - 55;
               _loc1_._y = _loc7_._y - 3;
               _loc28_ = !_loc7_.txt0._visible?45:90;
               _loc1_._height = Math.max(_loc28_,_loc1_._height);
            }
         }
         else if(_loc3_ == "crest")
         {
            var _loc18_ = _loc2_.indexOf("<Crest",0);
            var _loc25_ = _loc2_.length;
            var _loc16_ = _loc2_.slice(_loc18_,_loc25_);
            var _loc36_ = _loc2_.slice(0,_loc18_);
            _loc1_.htmlText = _loc36_;
            _loc9_ = _loc1_._y + _loc1_.textHeight + 10;
            var _loc14_ = lib.util.ExtString.findTag(_loc16_,"CrestSlot");
            var _loc15_ = _loc14_.length;
            var _loc37_ = _loc1_.textHeight;
            if(_loc15_ != undefined)
            {
               setCrestInfo(_loc5_,_loc14_,_loc16_,_loc13_,_loc9_);
               var _loc31_ = Number(_loc15_ - 1);
               _loc4_ = _loc5_["crestSlot_" + _loc31_];
            }
         }
         else if(_loc19_ == "skill")
         {
            var _loc21_ = _loc2_.indexOf("<Skill",0);
            _loc36_ = _loc2_.slice(0,_loc21_);
            var _loc22_ = _loc2_.slice(_loc21_,_loc2_.length);
            _loc9_ = _loc1_._y + _loc1_._height + 10;
            var _loc17_ = lib.util.ExtString.findTag(_loc22_,"SkillSlot");
            if(_loc17_ != undefined)
            {
               _loc4_ = SetGuideSkillDraw(_loc5_,_loc13_,_loc9_,_loc22_,_loc17_);
            }
         }
         _loc23_ = _loc10_;
         _loc34_ = _loc34_ + 1;
      }
   }
   tipTextHeight = _loc4_._y + _loc4_._height - 5;
}
function inputName(targetMc, strData)
{
   if(strData == undefined || strData == "")
   {
      return undefined;
   }
   var _loc1_ = strData.split("\t");
   var _loc2_ = "";
   if(_loc1_[0] != undefined && _loc1_[0] != "" && Number(_loc1_[0]) != 0)
   {
      _loc2_ = _loc2_ + ("<font size=\'21\' color=\'#B6B6B6\'>(+" + _loc1_[0] + ")</font> ");
   }
   if(_loc1_[1] != undefined && _loc1_[1] != "")
   {
      var _loc3_ = TITLECOLOR;
      if(_loc1_[2] != undefined && _loc1_[2] != "")
      {
         _loc3_ = "#" + lib.info.TextColor["RAREGRADE" + _loc1_[2]].toString(16);
      }
      _loc2_ = _loc2_ + ("<font color=\'" + _loc3_ + "\'>" + _loc1_[1] + "</font>");
   }
   var _loc4_ = "";
   if(_loc1_[3] != undefined && _loc1_[3] != "")
   {
      _loc4_ = "<font color=\'" + _loc3_ + "\'>" + _loc1_[3] + "</font>";
   }
   if(_loc2_ != "" && _loc2_ != undefined)
   {
      targetMc.tipText.htmlText = targetMc.tipText.htmlText + ("<p>" + _loc2_ + "</p>");
      targetMc.tipText.htmlText = targetMc.tipText.htmlText + _loc4_;
   }
}
function inputTip(tipData, type, tgMc)
{
   tipData = String(tipData);
   if(tipData == undefined || tipData == "")
   {
      return undefined;
   }
   if(tgMc == undefined)
   {
      tgMc = toolTipMc;
   }
   var _loc1_ = "";
   switch(type)
   {
      case 0:
         if(tipData != undefined && tipData != "")
         {
            _loc1_ = tipData;
         }
         break;
      case 1:
         var _loc7_ = String(tipData).split("\t");
         if(_loc7_[0] != undefined && _loc7_[0] != "")
         {
            _loc1_ = String(_loc7_[0]);
         }
         break;
      case 2:
         _loc7_ = String(tipData).split("\t");
         if(_loc7_[0] != undefined && _loc7_[0] != "")
         {
            _loc1_ = "<font color=\'" + SECTIONCOLOR + "\'>" + _loc7_[0] + "</font><br>";
         }
         if(_loc7_[1] != undefined && _loc7_[1] != "")
         {
            _loc1_ = _loc1_ + (_loc7_[1] + "<br>");
         }
         break;
      case 3:
         _loc7_ = String(tipData).split("\n");
         var _loc17_ = _loc7_[0].split("\t");
         if(_loc17_[0] == undefined || _loc17_[0] == "")
         {
            return undefined;
         }
         if(_loc17_[1] != undefined && _loc17_[1] != "")
         {
            _loc1_ = "<font color=\'" + SECTIONCOLOR + "\'>" + _loc17_[1] + "</font><br><br>";
         }
         var _loc6_ = _loc7_.shift();
         var _loc9_ = "";
         var _loc4_ = [];
         var _loc10_ = "";
         var _loc3_ = [];
         var _loc8_ = "";
         var _loc12_ = "";
         var _loc15_ = "";
         var _loc11_ = "";
         while(_loc6_ != undefined && _loc6_ != "")
         {
            inf = _loc6_.split("\t");
            switch(inf[0])
            {
               case "mp":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     if(inf.length > 2)
                     {
                        _loc4_.push("<font color=\'" + HEADCOLOR + "\'>" + tipStr.somomp + "</font><br><font color=\'" + HEADCOLOR + "\'>     " + lib.util.UIString.getUIString("$101048","SkillCharge",1) + "</font>\t" + inf[1]);
                     }
                     else
                     {
                        _loc4_.push("<font color=\'" + HEADCOLOR + "\'>" + tipStr.somomp + "</font>\t" + inf[1]);
                     }
                     var _loc2_ = 2;
                     while(inf[_loc2_] != undefined)
                     {
                        _loc4_.push("<font color=\'" + HEADCOLOR + "\'>     " + lib.util.UIString.getUIString("$101048","SkillCharge",_loc2_) + "</font>\t" + inf[_loc2_]);
                        _loc2_ = _loc2_ + 1;
                     }
                  }
                  break;
               case "d_mp":
                  var _loc5_ = 0;
                  _loc2_ = 1;
                  while(inf[_loc2_] != undefined && inf[_loc2_] != "")
                  {
                     _loc4_[_loc5_] = _loc4_[_loc5_] + ("<font size=\'18\' color=\'" + REGICOLOR + "\'> (" + inf[_loc2_] + ")</font>");
                     _loc5_ = _loc5_ + 1;
                     _loc2_ = _loc2_ + 1;
                  }
                  break;
               case "hp":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     _loc9_ = "<font color=\'" + HEADCOLOR + "\'>" + tipStr.somohp + "</font>\t" + inf[1];
                  }
                  break;
               case "d_hp":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     _loc9_ = _loc9_ + ("<font size=\'18\' color=\'" + REGICOLOR + "\'> (" + inf[1] + ")</font>");
                  }
                  break;
               case "ti":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     _loc10_ = inf[1];
                  }
                  break;
               case "d_ti":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     _loc10_ = _loc10_ + ("<font size=\'18\' color=\'" + REGICOLOR + "\'> (" + inf[1] + ")</font>");
                  }
                  break;
               case "de":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     _loc8_ = inf[1];
                  }
                  break;
               case "d_de":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     _loc8_ = _loc8_ + ("<font size=\'18\' color=\'" + REGICOLOR + "\'> (" + inf[1] + ")</font>");
                  }
                  break;
               case "pow":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     if(inf.length > 2)
                     {
                        _loc3_.push("<font color=\'" + HEADCOLOR + "\'>" + tipStr.power + "</font><br><font color=\'" + HEADCOLOR + "\'>      " + lib.util.UIString.getUIString("$101047","PowerCount",1) + "</font>\t" + inf[1]);
                     }
                     else
                     {
                        _loc3_.push("<font color=\'" + HEADCOLOR + "\'>" + tipStr.power + "</font>\t" + inf[1]);
                     }
                     _loc2_ = 2;
                     while(inf[_loc2_] != undefined)
                     {
                        _loc3_.push("<font color=\'" + HEADCOLOR + "\'>      " + lib.util.UIString.getUIString("$101047","PowerCount",_loc2_) + "</font>\t" + inf[_loc2_]);
                        _loc2_ = _loc2_ + 1;
                     }
                  }
                  break;
               case "d_pow":
               case "d_mp":
                  _loc5_ = 0;
                  _loc2_ = 1;
                  while(inf[_loc2_] != undefined && inf[_loc2_] != "")
                  {
                     _loc3_[_loc5_] = _loc3_[_loc5_] + ("<font size=\'18\' color=\'" + REGICOLOR + "\'> (" + inf[_loc2_] + ")</font>");
                     _loc5_ = _loc5_ + 1;
                     _loc2_ = _loc2_ + 1;
                  }
                  break;
               case "ds":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     if(_loc17_[0] == 1)
                     {
                        _loc12_ = "<img src=\'lineBitmap\'>" + inf[1] + "<br>";
                     }
                     else
                     {
                        _loc12_ = inf[1] + "<br>";
                     }
                  }
                  break;
               case "crname":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     if(inf[1] == 0)
                     {
                        _loc11_ = "<img src=\'lineBitmap\'><br><font color=\'" + HEADCOLOR + "\'>" + tipStr.crregist + "</font><br>";
                     }
                     else
                     {
                        _loc11_ = "<img src=\'lineBitmap\'><br><font color=\'" + HEADCOLOR + "\'>[" + inf[1] + "] " + tipStr.crEffect + "</font><br>";
                     }
                  }
                  break;
               case "crds":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     _loc15_ = inf[1] + "<br>";
                  }
            }
            _loc6_ = _loc7_.shift();
         }
         if(_loc4_.length > 0)
         {
            _loc1_ = _loc1_ + (_loc4_.join("<br>") + "<br>");
         }
         if(_loc9_ != "")
         {
            _loc1_ = _loc1_ + (_loc9_ + "<br>");
         }
         if(_loc10_ != "")
         {
            _loc1_ = _loc1_ + ("<font color=\'" + HEADCOLOR + "\'>" + tipStr.casttime + "</font>\t" + lib.util.UIString.getUIString("$101050","TimeSec",_loc10_) + "<br>");
         }
         if(_loc3_.length > 0)
         {
            _loc1_ = _loc1_ + (_loc3_.join("<br>") + "<br>");
         }
         if(_loc8_ != "")
         {
            _loc1_ = _loc1_ + ("<font color=\'" + HEADCOLOR + "\'>" + tipStr.reusetime + "</font>\t" + lib.util.UIString.getUIString("$101050","TimeSec",_loc8_) + "<br>");
         }
         _loc1_ = _loc1_ + (_loc12_ + _loc11_ + _loc15_);
         break;
      case 4:
         _loc7_ = String(tipData).split("\n");
         _loc17_ = _loc7_[0].split("\t");
         if(_loc17_[0] == undefined || _loc17_[0] == "")
         {
            return undefined;
         }
         _loc6_ = _loc7_.shift();
         while(_loc6_ != undefined && _loc6_ != "")
         {
            var inf = _loc6_.split("\t");
            switch(inf[0])
            {
               case "name":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     _loc1_ = "<font color=\'" + SECTIONCOLOR + "\'>" + inf[1] + "</font><br>";
                  }
                  break;
               case "kind":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     _loc1_ = _loc1_ + ("<font color=\'" + HEADCOLOR + "\'>" + tipStr.abnormal + "</font>\t" + inf[1] + "<br>");
                  }
                  break;
               case "desc":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     _loc1_ = _loc1_ + inf[1];
                  }
            }
            _loc6_ = _loc7_.shift();
         }
         break;
      case 5:
         _loc7_ = String(tipData).split("\n");
         _loc17_ = _loc7_[0].split("\t");
         if(_loc17_[0] == undefined || _loc17_[0] == "")
         {
            return undefined;
         }
         var _loc14_ = "";
         if(Number(_loc7_[3]) == 0)
         {
            _loc14_ = "<br><font color=\'" + APPLYCOLOR + "\'>" + tipStr.regist + "</font>";
         }
         else if(Number(_loc7_[3]) == 1)
         {
            _loc14_ = "<br><font color=\'" + REGICOLOR + "\'>" + tipStr.apply + "</font>";
         }
         _loc6_ = _loc7_.shift();
         while(_loc6_ != undefined && _loc6_ != "")
         {
            var inf = _loc6_.split("\t");
            switch(inf[0])
            {
               case "name":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     _loc1_ = "<font color=\'" + SECTIONCOLOR + "\'>" + inf[1] + "</font>" + _loc14_ + "<br>";
                  }
                  break;
               case "kind":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     _loc1_ = _loc1_ + ("<font color=\'" + HEADCOLOR + "\'>" + tipStr.kind + "</font>\t" + inf[1] + "<br>");
                  }
                  break;
               case "desc":
                  if(inf[1] != undefined && inf[1] != "")
                  {
                     _loc1_ = _loc1_ + inf[1];
                  }
            }
            _loc6_ = _loc7_.shift();
         }
         break;
      case 7:
         _loc7_ = String(tipData).split("\t");
         var _loc16_ = Number(_loc7_[0]) != 1?CRITCOLOR:REGICOLOR;
         _loc1_ = "<font color=\'" + _loc16_ + "\'>" + _loc7_[1] + "</font><br>";
         _loc1_ = _loc1_ + ("<font color=\'" + SECTIONCOLOR + "\'>" + tipStr.agitsize + "  </font>");
         _loc1_ = _loc1_ + (_loc7_[2] + "<br>");
         if(Number(_loc7_[0]) == 1)
         {
            _loc1_ = _loc1_ + ("<font color=\'" + SECTIONCOLOR + "\'>" + tipStr.sellguild + "  </font>");
         }
         else
         {
            _loc1_ = _loc1_ + ("<font color=\'" + SECTIONCOLOR + "\'>" + tipStr.ownerguild + "  </font>");
         }
         if(_loc7_[3] != "" && _loc7_[3] != undefined && _loc7_[4] != "" && _loc7_[4] != undefined)
         {
            _loc1_ = _loc1_ + (_loc7_[3] + "[" + _loc7_[4] + "]<br>");
         }
         else
         {
            _loc1_ = _loc1_ + (tipStr.noexist + "<br>");
         }
         if(Number(_loc7_[0]) == 1)
         {
            _loc1_ = _loc1_ + ("<font color=\'" + SECTIONCOLOR + "\'>" + tipStr.totalbuygold + "  </font>");
            _loc1_ = _loc1_ + ("<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + lib.util.CurrencyFormat.makeComma(_loc7_[5]) + "</font> <img src=\'moneyBitmap\'>");
         }
         break;
      case 8:
         _loc7_ = String(tipData).split("\t");
         if(_loc7_[0] != undefined && _loc7_[0] != "")
         {
            _loc1_ = "<font color=\'" + SECTIONCOLOR + "\'>" + _loc7_[0] + "</font><br><br>";
         }
         if(_loc7_[1] != undefined && _loc7_[1] != "")
         {
            _loc16_ = CRITCOLOR;
            if(_loc7_[1] == 1)
            {
               _loc16_ = NORMALCOLOR;
            }
            else if(_loc7_[1] == 2)
            {
               _loc16_ = REGICOLOR;
            }
            _loc1_ = _loc1_ + ("<font color=\'" + _loc16_ + "\'>" + tipStr["chstate" + _loc7_[1]] + "</font><br>");
         }
         if(_loc7_[2] != undefined && _loc7_[2] != "")
         {
            _loc1_ = _loc1_ + ("<font color=\'" + HEADCOLOR + "\'>" + tipStr.chusepoint + "</font>\t" + _loc7_[2] + "<br>");
         }
         if(_loc7_[3] != undefined && _loc7_[3] != "")
         {
            _loc1_ = _loc1_ + ("<font color=\'" + HEADCOLOR + "\'>" + tipStr.chskill + "</font>\t" + _loc7_[3] + "<br>");
         }
         if(_loc7_[4] != undefined && _loc7_[4] != "")
         {
            _loc1_ = _loc1_ + ("<img src=\'lineBitmap\'>" + _loc7_[4] + "<br>");
         }
   }
   tgMc.tipText.htmlText = _loc1_;
}
function inputSiegeWarTip(tooltipStr)
{
   var _loc1_ = tooltipStr.split(":");
   var _loc6_ = _loc1_[0] + ":" + _loc1_[1];
   var _loc5_ = _loc1_[2];
   var _loc3_ = _loc1_[3];
   var _loc7_ = _loc1_[4];
   var _loc2_ = _loc1_[5];
   var _loc4_ = _loc1_[6];
   toolTipMc.tipText._visible = false;
   toolTipMc.closeBtn._visible = false;
   toolTipMc.bSiege = true;
   toolTipMc.bg._visible = false;
   toolTipMc.headerBg._visible = false;
   toolTipMc.headerTF._visible = false;
   lib.display.DrawBitmapData.draw(toolTipMc.bgMc,siegeToolTipBg,0,0,-5,-5,240,147,1);
   lib.display.DrawBitmapData.draw(toolTipMc.bgMc,_loc6_,5,9,0,0,52,52,0.8125);
   toolTipMc.attachMovie("siegeFdMc","siegeFdMc",toolTipMc.getNextHighestDepth());
   toolTipMc.siegeFdMc.guildNameFd.textAutoSize = "shrink";
   toolTipMc.siegeFdMc.guildNameFd.verticalAlign = "center";
   toolTipMc.siegeFdMc.guildLeaderFd.verticalAlign = "center";
   toolTipMc.siegeFdMc.killFd.verticalAlign = "center";
   toolTipMc.siegeFdMc.deathFd.verticalAlign = "center";
   toolTipMc.siegeFdMc.towerHPFd.verticalAlign = "center";
   toolTipMc.siegeFdMc.guildNameFd.text = _loc5_;
   toolTipMc.siegeFdMc.guildLeaderFd.text = _loc3_;
   toolTipMc.siegeFdMc.killFd.text = _loc7_;
   toolTipMc.siegeFdMc.deathFd.text = _loc2_;
   toolTipMc.siegeFdMc.towerHPFd.text = _loc4_ + "%";
}
function creatGradeMode(tg)
{
   RankIconArr = [];
   if(tg.Fdstate.htmlText)
   {
      var _loc2_ = lib.util.ExtString.findTag(tg.Fdstate.htmlText,"optionGrade");
      creatGradeMaker(tg.Fdstate,_loc2_,headT);
   }
   if(tg.Fdenchant.htmlText)
   {
      var _loc3_ = lib.util.ExtString.findTag(tg.Fdenchant.htmlText,"optionGrade");
      creatGradeMaker(tg.Fdenchant,_loc3_,headT);
   }
}
function creatGradeMaker(fd, str)
{
   var _loc8_ = str.length;
   var _loc6_ = fd._parent;
   var _loc1_ = 0;
   while(_loc1_ < _loc8_)
   {
      var _loc4_ = str[_loc1_];
      var _loc5_ = _loc4_.tagindex;
      var _loc3_ = fd.getExactCharBoundaries(_loc5_);
      var _loc2_ = _loc6_.attachMovie("bestRankMc","bestRankMc" + _loc1_,_loc6_.getNextHighestDepth());
      _loc2_._x = 5;
      _loc2_._y = _loc3_.y + fd._y;
      RankIconArr.push(_loc2_);
      _loc1_ = _loc1_ + 1;
   }
}
function showToolTip(tooltiptarget)
{
   seletTarget = tooltiptarget;
   showTime = getTimer();
   if(seletTarget.type == 100)
   {
      hideToolTip();
      var _loc4_ = lib.util.ExtString.split(seletTarget.val,"\t");
      var _loc5_ = _loc4_[0];
      getURL("FSCommand:" add _loc5_,_loc4_[1]);
   }
   else if(seletTarget.type == 99)
   {
      hideToolTip();
      inputSiegeWarTip(seletTarget.val);
      freedisplayToolTip(toolTipMc,false);
   }
   else if(seletTarget.type == 98)
   {
      hideToolTip();
      if(seletTarget.val != "")
      {
         inputTip(seletTarget.val,1);
         freedisplayToolTip(toolTipMc,true,true);
      }
   }
   else if(seletTarget.type == 12)
   {
      hideToolTip();
      ToGame_ToolTip_RequestItemTemplate(seletTarget.val);
   }
   else if(seletTarget.type == 11)
   {
      hideToolTip();
      ToGame_ToolTip_SenatorListInfo(seletTarget.val);
   }
   else if(seletTarget.type == 10)
   {
      hideToolTip();
      ToGame_ToolTip_PartyRaidMemberInfo(seletTarget.val);
   }
   else if(seletTarget.type == 9)
   {
      hideToolTip();
      ToGame_ToolTip_PartyMemberInfo(seletTarget.val);
   }
   else if(seletTarget.type == 8)
   {
      hideToolTip();
      ToGame_ToolTip_RequestCrest(seletTarget.val);
   }
   else if(seletTarget.type == 6)
   {
      hideToolTip();
      ToGame_ToolTip_Request(seletTarget.val,seletTarget.tg);
   }
   else if(seletTarget.type == 5)
   {
      hideToolTip();
      ToGame_ToolTip_RequestMerit(seletTarget.val);
   }
   else if(seletTarget.type == 4)
   {
      hideToolTip();
      ToGame_ToolTip_RequestAbnormality(seletTarget.val);
   }
   else if(seletTarget.type == 3)
   {
      hideToolTip();
      ToGame_ToolTip_RequestSkill(seletTarget.val);
   }
   else if(seletTarget.type == 2)
   {
      var _loc3_ = String(seletTarget.tg).split(".");
      var _loc1_ = 0;
      while(_loc1_ < _loc3_.length)
      {
         var _loc2_ = _loc3_[_loc1_].toLowerCase();
         if(_loc2_ == "production")
         {
            getURL("FSCommand:ToGame_ToolTip_RequestProductionSkill",seletTarget.val);
            return undefined;
         }
         _loc1_ = _loc1_ + 1;
      }
      hideToolTip();
      inputTip(seletTarget.val,seletTarget.type);
      freedisplayToolTip(toolTipMc);
   }
   else if(seletTarget.type == lib.manager.ToolTip.TOOL_TIP_TYPE_PREMIUM_WINDOW)
   {
      hideToolTip();
      getURL("FSCommand:ToGame_ToolTip_RequestPremiumWindow",seletTarget.val);
   }
   else if(seletTarget.type == lib.manager.ToolTip.TOOL_TIP_TYPE_DELIVERY)
   {
      hideToolTip();
      getURL("FSCommand:ToGame_ToolTip_RequestDelivery",seletTarget.val);
   }
   else
   {
      hideToolTip();
      if(seletTarget.val != "")
      {
         inputTip(seletTarget.val,seletTarget.type);
         freedisplayToolTip(toolTipMc);
      }
   }
}
function hideToolTip()
{
   clearCoolTime();
   if(toolTipMc.tipText.htmlText == "" && toolTipMc.bSiege == false)
   {
      toolTipMc._visible = false;
      return undefined;
   }
   prevTarget = null;
   tipTextWidth = undefined;
   tipTextHeight = undefined;
   if(toolTipMc.battlePetId != undefined)
   {
      ToGame_BattlePetToolTip_Close(toolTipMc.battlePetId);
   }
   if(toolTipMc.id != undefined)
   {
      ToGame_ToolTip_Close(toolTipMc.id);
   }
   if(null != selectedToolTip && toolTipMc == selectedToolTip)
   {
      selectedToolTip = null;
   }
   toolTipMc.removeMovieClip();
   toolTipMc = this.attachMovie("toolTipId","toolTipMc",this.getNextHighestDepth());
   var _loc4_ = getScale();
   toolTipMc._xscale = toolTipMc._yscale = _loc4_;
   toolTipMc.closeBtn._visible = false;
   toolTipMc.tipText.textColor = 7698039;
   toolTipMc.tipText.setNewTextFormat(tooltip_fmt);
   toolTipMc.tipText.htmlText = "";
   toolTipMc.bSiege = false;
   toolTipMc.tipText._width = MAXWIDTH;
   toolTipMc.tipText.verticalAutoSize = "top";
   toolTipMc._visible = false;
   var _loc3_ = 0;
   while(_loc3_ < compareCount)
   {
      var _loc2_ = this["toolTipCompareMc" + _loc3_];
      if(_loc2_.id != undefined)
      {
         ToGame_ToolTip_Close(_loc2_.id);
      }
      if(selectedToolTip == _loc2_)
      {
         selectedToolTip = null;
      }
      _loc2_.removeMovieClip();
      _loc3_ = _loc3_ + 1;
   }
   infoBG_S = 0;
   infoBG_H = 0;
   headerObjS = null;
   compareCount = 0;
   compareStorage = [];
   bAwaken = false;
}
function searchTip(tgmc)
{
   if(tgmc._parent instanceof lib.util.Slot && tgmc._parent._parent instanceof lib.util.Slot2)
   {
      tgmc = tgmc._parent._parent.SLOT;
   }
   var _loc1_ = tgmc;
   while(_loc1_ != undefined)
   {
      if(tooltiplist[String(_loc1_)] != undefined)
      {
         if(tooltiplist[String(_loc1_)].iconhas && tooltiplist[String(_loc1_)].ic.TEX == undefined)
         {
            lib.manager.ToolTip.remove(_loc1_);
            return undefined;
         }
         return tooltiplist[String(_loc1_)];
      }
      _loc1_ = _loc1_._parent;
   }
   return undefined;
}
function checkCoolTime(targetMc, tooltipStr)
{
   var _loc9_ = SECTIONTYPES.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc9_)
   {
      var _loc7_ = SECTIONTYPES[_loc3_];
      var _loc1_ = _loc3_ <= 0?targetMc.tipText:targetMc["Fd" + _loc7_];
      if(_loc1_ != undefined)
      {
         var _loc5_ = _loc1_.htmlText;
         var _loc4_ = lib.util.ExtString.findTag(_loc5_,"coolTime");
         var _loc2_ = _loc4_[0].tagindex;
         var _loc6_ = Number(_loc4_[0].value);
         remainCoolTime = _loc6_;
         coolTimeString = "";
         if(_loc2_ != undefined)
         {
            coolTimeString = lib.util.ExtString.getTimeString(remainCoolTime);
            lib.util.ExtString.replaceHtmlText(_loc1_,_loc2_ - 1,_loc2_ - 1,"<font color=\'" + GOLDCOLOR + "\'>" + coolTimeString + "</font>");
            coolTimeIntervals.push(setInterval(playCoolTime,1000,_loc1_,_loc2_));
         }
      }
      _loc3_ = _loc3_ + 1;
   }
}
function playCoolTime(targetMc, stringIndex)
{
   remainCoolTime = remainCoolTime - 1;
   if(remainCoolTime >= 0)
   {
      var _loc4_ = int(remainCoolTime / 60);
      var _loc2_ = int(remainCoolTime % 60);
      var _loc1_ = coolTimeString.length + stringIndex;
      coolTimeString = "";
      coolTimeString = lib.util.ExtString.getTimeString(remainCoolTime);
      lib.util.ExtString.replaceHtmlText(targetMc,stringIndex - 1,_loc1_ - 1,"<font color=\'" + GOLDCOLOR + "\'>" + coolTimeString + "</font>");
   }
   else
   {
      clearCoolTime();
   }
}
function clearCoolTime()
{
   var _loc1_ = coolTimeIntervals.shift();
   while(_loc1_ != undefined)
   {
      clearInterval(_loc1_);
      _loc1_ = coolTimeIntervals.shift();
   }
   remainCoolTime = 0;
   coolTimeString = "";
}
function DirectShow(obj, type, val)
{
   myListener.OnGame_ToolTip_SetCheck(false);
   hideToolTip();
   inputTip(val,type);
   seletTarget = {tg:obj};
   displayToolTip(toolTipMc);
}
function DirectHide()
{
   myListener.OnGame_ToolTip_SetCheck(true);
}
function displayToolTip(targetMc, headType)
{
   if(!_global.gbUIMode)
   {
      return undefined;
   }
   var _loc36_ = {x:seletTarget.tg._x * lib.info.AlignInfo.onePixelPercentW,y:seletTarget.tg._y * lib.info.AlignInfo.onePixelPercentH};
   var _loc14_ = {x:seletTarget.tg._x,y:seletTarget.tg._y};
   var _loc25_ = seletTarget.tg._width;
   var _loc24_ = seletTarget.tg._height;
   var _loc11_ = seletTarget.tg.getBounds(_root);
   seletTarget.tg._parent.localToGlobal(_loc14_);
   if(typeof seletTarget.tg == "movieclip")
   {
      _loc11_ = seletTarget.tg.getBounds(_root);
   }
   else
   {
      _loc11_ = {yMax:_loc14_.y + _loc24_,yMin:_loc14_.y,xMax:_loc14_.x + _loc25_,xMin:_loc14_.x};
   }
   if(tipTextWidth == undefined || tipTextWidth < targetMc.tipText.textWidth)
   {
      tipTextWidth = targetMc.tipText.textWidth;
   }
   if(tipTextHeight == undefined || tipTextHeight < targetMc.tipText.textHeight)
   {
      tipTextHeight = targetMc.tipText.textHeight;
   }
   var _loc26_ = !bAwaken?MAXWIDTH + (LMAG + RMAG):MAXWIDTH + (LMAG + RMAG) + 2;
   var _loc27_ = tipTextHeight + BTMAG * 2;
   if(MINWIDTH > tipTextWidth + LMAG + RMAG && seletTarget.type != 6)
   {
      targetMc.tipText._width = targetMc.bgMc._width - RMAG * 2;
   }
   else
   {
      targetMc.bgMc._width = MAXWIDTH + LMAG + RMAG + BRICON_WIDTH;
      targetMc.tipText._width = MAXWIDTH;
   }
   var _loc23_ = 0;
   var _loc18_ = 0;
   var _loc28_ = getScale();
   if(Stage.height < targetMc._height + 100)
   {
      _loc23_ = targetMc._width;
      targetMc._xscale = targetMc._yscale = _loc28_ * Stage.height / (targetMc._height + 100);
      _loc23_ = _loc23_ - (targetMc._width - 6);
      _loc18_ = -40;
   }
   SetBgDraw(targetMc,_loc26_,_loc27_,headType);
   var _loc29_ = targetMc.bg._width * (targetMc._xscale / 100);
   var _loc19_ = targetMc._height;
   var _loc16_ = (Stage.width - lib.info.AlignInfo.UI_WIDTH) / 2;
   var _loc9_ = (Stage.height - lib.info.AlignInfo.UI_HEIGHT) / 2;
   var _loc13_ = _loc11_.xMin - _loc29_ - COMPAREBGSPACE;
   var _loc12_ = _loc11_.yMin;
   if(_loc13_ < _loc16_)
   {
      _loc13_ = _loc11_.xMax + COMPAREBGSPACE;
   }
   if(_loc12_ + _loc19_ > Stage.height - _loc9_)
   {
      _loc12_ = _loc12_ + (Stage.height - _loc9_ - (_loc12_ + _loc19_));
   }
   targetMc._x = _loc13_;
   targetMc._y = _loc12_ + _loc18_;
   if(targetMc != toolTipMc && toolTipMc._visible)
   {
      var _loc15_ = compareStorage[compareStorage.length - 1];
      var _loc20_ = undefined;
      if(_loc15_ == undefined)
      {
         _loc20_ = targetMc._width;
         if(_loc13_ - _loc20_ < _loc16_ || toolTipMc._x > _loc11_.xMax)
         {
            toolTipMc._x = _loc11_.xMax + COMPAREBGSPACE;
            targetMc._x = _loc11_.xMax + toolTipMc._width + COMPAREBGSPACE + 1;
         }
         else
         {
            targetMc._x = toolTipMc._x - _loc20_ - COMPAREBGSPACE;
         }
         if(targetMc._y > toolTipMc._y)
         {
            targetMc._y = toolTipMc._y;
         }
         else
         {
            toolTipMc._y = targetMc._y;
         }
         compareStorage.push(targetMc);
      }
      else
      {
         var _loc22_ = getCompareHeight() + targetMc._height;
         var _loc10_ = compareStorage[0];
         if(_loc22_ < Stage.height - _loc9_)
         {
            targetMc._y = _loc15_._y + _loc15_._height + COMPAREBGSPACE;
            targetMc._y = !targetMc.headerBg._visible?targetMc._y - 26:targetMc._y;
            targetMc._x = _loc15_._x;
            var _loc21_ = Stage.height - _loc9_ - (_loc22_ + _loc10_._y);
            if(_loc21_ < 0)
            {
               var _loc6_ = _loc10_._y + _loc21_;
               for(var _loc17_ in compareStorage)
               {
                  compareStorage[_loc17_]._y = _loc6_;
                  _loc6_ = _loc6_ + compareStorage[_loc17_]._height;
               }
               targetMc._y = _loc6_ + COMPAREBGSPACE;
            }
            compareStorage.push(targetMc);
         }
         else
         {
            targetMc._y = _loc10_._y + COMPAREBGSPACE;
            if(_loc10_._x < toolTipMc._x)
            {
               targetMc._x = _loc10_._x - targetMc._width - COMPAREBGSPACE;
            }
            else if(_loc10_._x + _loc10_._width + targetMc._width < Stage.width - _loc16_)
            {
               targetMc._x = _loc10_._x + _loc10_._width + COMPAREBGSPACE;
            }
            else
            {
               targetMc._x = _loc11_.xMin - targetMc._width - COMPAREBGSPACE;
               targetMc._y = toolTipMc._y;
            }
            compareStorage = [targetMc];
            if(targetMc._x < 0 || targetMc._x + targetMc._width > Stage.width - _loc16_)
            {
               toolTipMc._y = 0;
               toolTipMc._x = 0;
               _loc6_ = 0;
               var _loc8_ = toolTipMc._width;
               compareStorage = [];
               var _loc7_ = 0;
               while(this["toolTipCompareMc" + _loc7_] != undefined)
               {
                  var _loc4_ = this["toolTipCompareMc" + _loc7_];
                  compareStorage.push(_loc4_);
                  if(_loc6_ + _loc4_._height < Stage.height - _loc9_)
                  {
                     _loc4_._y = _loc6_;
                     _loc4_._x = _loc8_;
                     _loc6_ = _loc6_ + _loc4_._height;
                  }
                  else
                  {
                     _loc6_ = 0;
                     _loc8_ = _loc8_ + _loc4_._width;
                     _loc4_._y = _loc6_;
                     _loc4_._x = _loc8_;
                  }
                  _loc7_ = _loc7_ + 1;
               }
            }
         }
      }
   }
   UI._visible = true;
   subToolTip = targetMc;
   if(_loc13_ != undefined && _loc12_ != undefined)
   {
      targetMc._visible = true;
   }
}
function freedisplayToolTip(targetMc, bDrawBg, bMaxWidth)
{
   if(!_global.gbUIMode)
   {
      return undefined;
   }
   if(undefined == bDrawBg)
   {
      bDrawBg = true;
   }
   if(undefined == bMaxWidth)
   {
      bMaxWidth = false;
   }
   var _loc4_ = LMAG + RMAG;
   var _loc10_ = BTMAG * 2;
   if(headerObjS == null)
   {
      targetMc.tipText._x = 7;
      targetMc.tipText._y = 8;
      _loc4_ = (LMAG + RMAG) * 0.8;
      _loc10_ = BTMAG * 1.6;
   }
   var _loc7_ = 0;
   var _loc15_ = targetMc.tipText.textHeight + _loc10_;
   if(bMaxWidth)
   {
      var _loc9_ = targetMc.tipText.textWidth;
      _loc7_ = _loc9_ >= 150?_loc9_ + _loc4_:150 + _loc4_;
   }
   else if(MAXWIDTH > targetMc.tipText.textWidth + _loc4_)
   {
      _loc7_ = targetMc.tipText.textWidth + _loc4_;
      targetMc.tipText._width = _loc7_ - _loc4_ + 5;
   }
   else
   {
      _loc7_ = MAXWIDTH + _loc4_;
      targetMc.tipText._width = MAXWIDTH;
   }
   if(bDrawBg)
   {
      SetBgDraw(targetMc,_loc7_,_loc15_);
   }
   var _loc16_ = getScale();
   var _loc18_ = targetMc._width;
   var _loc11_ = targetMc._height;
   var _loc19_ = (Stage.width - lib.info.AlignInfo.UI_WIDTH) / 2;
   var _loc6_ = (Stage.height - lib.info.AlignInfo.UI_HEIGHT) / 2;
   var _loc8_ = _root._xmouse - (targetMc.bg._width + 5) * (_loc16_ / 100);
   var _loc5_ = _root._ymouse + 10;
   if(_root._xmouse - _loc18_ < 0)
   {
      _loc8_ = _root._xmouse + POSITIONSPACE + 10;
      _loc5_ = _root._ymouse;
   }
   if(_loc5_ + _loc11_ > Stage.height - _loc6_)
   {
      var _loc13_ = Math.max(Stage.height,Stage.height - _loc6_) - _loc11_;
      var _loc14_ = Math.min(Stage.height,Stage.height + _loc6_) - _root._ymouse - POSITIONSPACE / 2;
      _loc5_ = _loc13_ - _loc14_;
      _loc8_ = _loc8_ + -10;
      if(_loc5_ < - _loc6_)
      {
         _loc5_ = _loc5_ - (_loc6_ + _loc5_);
      }
   }
   targetMc._x = _loc8_;
   targetMc._y = _loc5_;
   if(_loc8_ == undefined)
   {
      hideToolTip();
      return undefined;
   }
   UI._visible = true;
   targetMc._visible = true;
}
function getCompareHeight()
{
   var _loc5_ = compareStorage.length;
   var _loc4_ = 0;
   var _loc3_ = 0;
   while(_loc3_ < _loc5_)
   {
      var _loc2_ = compareStorage[_loc3_];
      if(undefined != _loc2_)
      {
         var _loc1_ = _loc2_._height;
         _loc1_ = !_loc2_.headerBg._visible?_loc1_ - 26:_loc1_;
         _loc4_ = _loc4_ + _loc1_;
      }
      _loc3_ = _loc3_ + 1;
   }
   return _loc4_;
}
function motionStatusUp(targetMc, statusUps)
{
   var _loc22_ = statusUps.length;
   var _loc4_ = 0;
   while(_loc4_ < _loc22_)
   {
      targetMc["motionStatusCon" + _loc4_].removeMovieClip();
      var _loc1_ = targetMc.attachMovie("charId","motionStatusCon" + _loc4_,targetMc.getNextHighestDepth());
      statusTweens.push(_loc1_);
      var _loc9_ = statusUps[_loc4_];
      var _loc11_ = _loc9_.tagindex;
      var _loc10_ = _loc9_.value;
      _loc1_.fd.autoSize = true;
      _loc1_.fd.htmlText = _loc10_;
      var _loc8_ = targetMc.Fdstate.getExactCharBoundaries(_loc11_);
      _loc1_._x = _loc8_.x + targetMc.Fdstate._x - 3;
      _loc1_._y = _loc8_.y + targetMc.Fdstate._y - 2;
      var _loc3_ = 0;
      var _loc7_ = _loc1_._x - _loc1_.fd.textWidth / 2;
      var _loc6_ = _loc1_._y - _loc1_.fd.textHeight / 2;
      while(_loc3_ < 2)
      {
         var _loc2_ = _loc1_.duplicateMovieClip("containMcCopy" + _loc4_ + "_" + _loc3_,targetMc.getNextHighestDepth());
         statusTweens.push(_loc2_);
         _loc2_._x = _loc1_._x;
         _loc2_._y = _loc1_._y;
         _loc2_.fd.autoSize = true;
         _loc2_.fd.htmlText = _loc1_.fd.htmlText;
         gs.TweenLite.to(_loc2_,0.5,{delay:0.1 * _loc3_,_x:_loc7_,_y:_loc6_,_alpha:0,_xscale:200,_yscale:200,ease:gs.easing.Strong.easeOut});
         _loc3_ = _loc3_ + 1;
      }
      gs.TweenLite.to(_loc1_,0.5,{delay:0.1 * _loc3_,_x:_loc7_,_y:_loc6_,_alpha:0,_xscale:200,_yscale:200,ease:gs.easing.Strong.easeOut,onComplete:finishStatusUp,onCompleteParams:[_loc1_,_loc1_._x,_loc1_._y],onCompleteScope:_loc1_});
      _loc4_ = _loc4_ + 1;
   }
}
function finishStatusUp()
{
   var _loc3_ = arguments[0];
   if(arguments[0] != undefined)
   {
      _loc3_._alpha = 60;
      _loc3_._xscale = 100;
      _loc3_._yscale = 100;
      _loc3_._x = arguments[1];
      _loc3_._y = arguments[2];
   }
   gs.TweenMax.from(this,1,{tint:6736896,ease:gs.easing.Strong.easeOut,onComplete:finishStatusUp2,onCompleteScope:this});
}
function finishStatusUp2()
{
   gs.TweenMax.to(this,0.4,{_alpha:80,ease:gs.easing.Strong.easeOut,onComplete:finishStatusUp,onCompleteScope:this});
}
function motionStatusDown(targetMc, statusDowns)
{
   var _loc13_ = statusDowns.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc13_)
   {
      targetMc["motionStatusCon" + _loc2_].removeMovieClip();
      var _loc1_ = targetMc.attachMovie("charId","motionStatusCon" + _loc2_,targetMc.getNextHighestDepth());
      statusTweens.push(_loc1_);
      var _loc5_ = statusDowns[_loc2_];
      var _loc7_ = _loc5_.tagindex;
      var _loc6_ = _loc5_.value;
      _loc1_.fd.autoSize = true;
      _loc1_.fd.htmlText = _loc6_;
      var _loc4_ = targetMc.Fdenchant.getExactCharBoundaries(_loc7_);
      _loc1_._x = _loc4_.x + targetMc.tipText._x - 2;
      _loc1_._y = _loc4_.y + targetMc.tipText._y - 2;
      gs.TweenMax.from(_loc1_,0.9,{tint:6736896,ease:gs.easing.Strong.easeOut,onComplete:finishStatusUp,onCompleteParams:[_loc1_,_loc1_._x,_loc1_._y],onCompleteScope:_loc1_});
      _loc2_ = _loc2_ + 1;
   }
}
function motionBuildLevelUp(targetMc, buildlevelUps, fd)
{
   if(buildlevelUps.length == undefined)
   {
      return undefined;
   }
   var _loc6_ = buildlevelUps.length;
   var _loc1_ = targetMc["charMcContainer" + _loc6_];
   if(_loc1_ != undefined)
   {
      _loc6_ = _loc6_ + 10;
   }
   _loc1_ = targetMc.createEmptyMovieClip("charMcContainer" + _loc6_,targetMc.getNextHighestDepth());
   var _loc4_ = buildlevelUps[0];
   var _loc5_ = _loc4_.tagindex;
   var _loc10_ = _loc4_.tagendindex;
   var _loc15_ = _loc4_.value;
   var _loc13_ = fd.getExactCharBoundaries(_loc5_);
   var _loc11_ = fd._y + _loc13_.y - 2;
   _loc1_._x = fd._x;
   _loc1_._y = _loc11_ + 5;
   statusTweens.push(_loc1_);
   var _loc14_ = fd.text;
   var _loc19_ = _loc10_ - _loc5_;
   var _loc8_ = _loc1_.getNextHighestDepth();
   var _loc2_ = _loc1_.attachMovie("charId","charMc" + _loc8_,_loc8_);
   var _loc12_ = _loc14_.substring(_loc5_,_loc10_ + 1);
   _loc2_.fd.text = _loc12_;
   _loc2_.fd.textColor = 6736896;
   _loc2_._x = 0;
   _loc2_._y = 0;
   _loc1_._alpha = 0;
   statusTweens.push(_loc1_);
   buildlevelUps.shift();
   gs.TweenLite.to(_loc1_,0.3,{delay:0.1,_alpha:100,_y:_loc11_,ease:gs.easing.Strong.easeOut,onComplete:finishBuildLevelUp,onCompleteScope:_loc1_,onCompleteParams:[targetMc,buildlevelUps,fd]});
}
function finishBuildLevelUp()
{
   gs.TweenMax.from(this,0.4,{tint:65280,onComplete:endfinishBuildLevelUp,onCompleteScope:this,onCompleteParams:arguments});
}
function endfinishBuildLevelUp()
{
   if(arguments[1].length > 0)
   {
      motionBuildLevelUp(arguments[0],arguments[1],arguments[2]);
   }
   gs.TweenLite.to(this,0.4,{_alpha:70,onComplete:endfinishBuildLevelUp2,onCompleteScope:this});
}
function endfinishBuildLevelUp2()
{
   gs.TweenLite.to(this,0.4,{_alpha:100,onComplete:endfinishBuildLevelUp,onCompleteScope:this});
}
function toolTipMove(x, y)
{
   toolTipMc._x = x;
   toolTipMc._y = y;
}
function ToGame_ToolTip_Request(itemId, tg)
{
   var _loc7_ = String(tg).split(".");
   var _loc1_ = String(_loc7_.shift());
   while(_loc1_ != undefined && _loc1_ != "")
   {
      var _loc3_ = _loc1_.toLowerCase();
      if(_loc3_.split(" ").length > 1)
      {
         _loc3_ = String(_loc3_.split(" ").shift());
      }
      switch(_loc3_)
      {
         case "inventory":
            _loc1_ = undefined;
            var _loc6_ = tg._parent;
            _loc6_.removeNewState();
            getURL("FSCommand:ToGame_ToolTip_RequestInventory",itemId);
            break;
         case "tradewindow":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestTrade",itemId);
            break;
         case "errand":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestErrand",itemId);
            break;
         case "errandlog":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestErrandLog",itemId);
            break;
         case "storewindow":
            _loc1_ = undefined;
            var _loc4_ = itemId.split("\t");
            itemId = _loc4_[0];
            typeId = Number(_loc4_[1]);
            if(typeId == 1)
            {
               getURL("FSCommand:ToGame_ToolTip_RequestSellCartItem",itemId);
            }
            else
            {
               getURL("FSCommand:ToGame_ToolTip_RequestStoreWindow",itemId);
            }
            break;
         case "tcatstore":
            _loc1_ = undefined;
            _loc4_ = itemId.split("\t");
            itemId = _loc4_[0];
            typeId = Number(_loc4_[1]);
            if(typeId == 1)
            {
               getURL("FSCommand:ToGame_ToolTip_RequestTcatStoreCart",itemId);
            }
            else
            {
               getURL("FSCommand:ToGame_ToolTip_RequestTcatStore",itemId);
            }
            break;
         case "shoppingcartwindow":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestShoppingCartWindow",itemId);
            break;
         case "homunvendor":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestHomunVendor",itemId);
            break;
         case "homunvendorset":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestHomunVendorSet",itemId);
            break;
         case "warehousewindow":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestWarehouseWindow",itemId);
            break;
         case "homunmanager":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestHomunManager",itemId);
            break;
         case "homunincubator":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestHomunIncubator",itemId);
            break;
         case "homunshortcut":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestHomunShortCut",itemId);
            break;
         case "parcelpost":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestParcelPost",itemId);
            break;
         case "productionextraction":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestProductionExtraction",itemId);
            break;
         case "paperdoll":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestPaperdoll",itemId);
            break;
         case "paperdoll2":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestPaperdoll2",itemId);
            break;
         case "bfmatchingprocess":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestBFMatchingProcess",itemId);
            break;
         case "normalpopup":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestPopUP",itemId);
            break;
         case "shortcut":
         case "actionbarslot":
         case "actionbarquickslot":
            _loc1_ = undefined;
            getURL("FSCommand:ToGameRequestShortCutToolTip",itemId);
            break;
         case "extshortcut":
         case "actionbarquickslotex":
            _loc1_ = undefined;
            getURL("FSCommand:ToGameRequestShortCutToolTip",itemId);
            break;
         case "loan":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestLoan",itemId);
            break;
         case "loanlog":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestLoanLog",itemId);
            break;
         case "pandorabox":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestPandoraBox",itemId);
            break;
         case "production":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestProduction",itemId);
            break;
         case "productionlist":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestProductionList",itemId);
            break;
         case "productionextraction":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestProductionExtraction",itemId);
            break;
         case "productionminigame":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestProductionMiniGame",itemId);
            break;
         case "productionskill":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestProductionSkill",itemId);
            break;
         case "questjournal":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestQuestJournal",itemId);
            break;
         case "villagerdialog":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestVillagerDialog",itemId);
            break;
         case "skilllearning":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestSkillLearning",itemId);
            break;
         case "groupduel":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestGroupDuel",itemId);
            break;
         case "groupduelbetting":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestGroupDuelBetting",itemId);
            break;
         case "tradehouse":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestTradeHouse",itemId);
            break;
         case "bargain":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestBargain",itemId);
            break;
         case "worldmap2":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestWorldMap",itemId);
            break;
         case "senatormap":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestSenatorMap",itemId);
            break;
         case "couponbox":
            _loc1_ = undefined;
            _loc4_ = itemId.split("\t");
            itemId = _loc4_[0];
            typeId = _loc4_[1];
            if(typeId == "0")
            {
               getURL("FSCommand:ToGame_ToolTip_RequestCouponBoxList",itemId);
            }
            else
            {
               getURL("FSCommand:ToGame_ToolTip_RequestCouponBox",itemId);
            }
            break;
         case "itemshapechange":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestItemShapeChange",itemId);
            break;
         case "itemdyeing":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestItemDyeing",itemId);
            break;
         case "itemshaperestore":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestItemShapeRestore",itemId);
            break;
         case "skillpath":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestSkillPath",itemId);
            break;
         case "bfranking":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestBFRanking",itemId);
            break;
         case "bfscoreinfo":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestBFReward",itemId);
            break;
         case "distributionwindow":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestDistributionWindow",itemId);
            break;
         case "achievement":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestAchievement",itemId);
            break;
         case "dungeonpartymatching":
            if(tg._name == "partyMc")
            {
               getURL("FSCommand:ToGame_DungeonPartyMatching_RequestPatyMemberState",itemId);
            }
            else
            {
               getURL("FSCommand:ToGame_ToolTip_RequestDungeonPartyMatching",itemId);
            }
            _loc1_ = undefined;
            break;
         case "dungeonsimpleresult":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestDungeonSimpleResult",itemId);
            break;
         case "dungeonrankresult":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestDungeonRankResult",itemId);
            break;
         case "itemseal":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestItemSeal",itemId);
            break;
         case "bfmatching":
            if(tg._name == "partyMc")
            {
               getURL("FSCommand:ToGame_BFMatching_RequestPartyMemberState",itemId);
            }
            else
            {
               getURL("FSCommand:ToGame_ToolTip_RequestBFMatching",itemId);
            }
            _loc1_ = undefined;
            break;
         case "kachaitem":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestKachaItem",itemId);
            _loc1_ = undefined;
            break;
         case "union":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestUnion",itemId);
            _loc1_ = undefined;
            break;
         case "unionconsulpower":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestUnionConsulPower",itemId);
            _loc1_ = undefined;
            break;
         case "pcinventory":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestPCInventory",itemId);
            _loc1_ = undefined;
            break;
         case "benefit":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestBenefit",itemId);
            _loc1_ = undefined;
            break;
         case "gamestat":
            _loc1_ = undefined;
            fscommand("ToGame_ToolTip_RequestGameStat");
            _loc1_ = undefined;
            break;
         case "tradepopup":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestTradePopup",itemId);
            break;
         case "ingamestore":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestInGameStore",itemId);
            break;
         case "ingamestorepopup":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestInGameStorePopUp",itemId);
            break;
         case "ingamestoreallpayment":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestInGameStoreAllPayment",itemId);
            break;
         case "petmanager":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestPetManager",itemId);
            break;
         case "social":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestSocial",itemId);
            break;
         case "popupresult":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_PopupResult",itemId);
            break;
         case "characterwindow":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestCharacterWindow",itemId);
            break;
         case "battlepet":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestBattlePet",itemId);
            break;
         case "battlepetwindow":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestBattlePetWindow",itemId);
            break;
         case "playguide":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_PlayGuide",itemId);
            lib.Debuger.trace("ToGame_ToolTip_PlayGuide : " + itemId);
            break;
         case "itemsynthesizer":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestItemSynthesizer",itemId);
            _loc1_ = undefined;
            break;
         case "boosterenchant":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestBoosterEnchant",itemId);
            break;
         case "arenaboard":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestArenaboard",itemId);
            break;
         case "arenabatting":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestArenabatting",itemId);
            break;
         case "premiumfusion":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_PremiumFusion",itemId);
            break;
         case "pveskillwindow":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestPVESkillWindow",itemId);
            break;
         case "bfscoreboard":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestBFScoreBoard",itemId);
            break;
         case "crystalenchant":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestCrystalEnchant",itemId);
            break;
         case "communitywindowcn":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestCommunityWindowCN",itemId);
            break;
         case "communitywindow":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestCommunityWindow",itemId);
            break;
         case "customcastle":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_CustomCastle",itemId);
            break;
         case "itemcombination":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_ItemCombination",itemId);
            break;
         case "enchantshift":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_EnchantShift",itemId);
            break;
         case "enchantpopup":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_EnchantPopUp",itemId);
            break;
         case "styleshop":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_StyleShop",itemId);
            break;
         case "darkriftboard":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestDarkRiftBoard",itemId);
            break;
         case "epwindow":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_EpWindow",itemId);
            break;
         case "vipshop":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_VipShop",itemId);
            break;
         case "pcevent":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_PCEvent",itemId);
            break;
         case "eventboard":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_EventBoard",itemId);
            break;
         case "eventpopup":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_EventPopUp",itemId);
            break;
         case "orders":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_Orders",itemId);
            break;
         case "attendevent":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_AttendEvent",itemId);
            break;
         case "evolution":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_Evloution",itemId);
            break;
         case "enchant":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestEnchant",itemId);
            break;
         case "equipmentupgrade":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestEquipmentUpgrade",itemId);
            break;
         case "equipmentcombine":
            _loc1_ = undefined;
            getURL("FSCommand:ToGame_ToolTip_RequestEquipmentCombine",itemId);
            break;
         case "undefined":
            return undefined;
            break;
         default:
            _loc1_ = String(_loc7_.shift());
      }
   }
}
function ToGame_ToolTip_RequestSkill(skillVal)
{
   getURL("FSCommand:ToGame_ToolTip_RequestSkill",skillVal);
}
function ToGame_ToolTip_RequestCrest(crestId)
{
   getURL("FSCommand:ToGame_ToolTip_RequestCrest",crestId);
}
function ToGame_ToolTip_RequestAbnormality(abnormalVal)
{
   getURL("FSCommand:ToGame_ToolTip_RequestAbnormality",abnormalVal);
}
function ToGame_ToolTip_RequestMerit(Val)
{
   getURL("FSCommand:ToGame_ToolTip_RequestMerit",Val);
}
function ToGame_ToolTip_RequestItemLink(val)
{
   getURL("FSCommand:ToGame_ToolTip_RequestItemLink",val);
}
function ToGame_ToolTip_PartyMemberInfo(val)
{
   getURL("FSCommand:ToGame_ToolTip_PartyMemberInfo",val);
}
function ToGame_ToolTip_PartyRaidMemberInfo(val)
{
   getURL("FSCommand:ToGame_ToolTip_PartyRaidMemberInfo",val);
}
function ToGame_ToolTip_SenatorListInfo(val)
{
   getURL("FSCommand:ToGame_ToolTip_SenatorListInfo",val);
}
function ToGame_ToolTip_RequestItemTemplate(val)
{
   getURL("FSCommand:ToGame_ToolTip_RequestItemTemplate",val);
}
function ToGame_ToolTip_Init()
{
   fscommand("ToGame_ToolTip_Init");
}
function ToGame_ToolTip_ClickButton(buttonId, tooltipId)
{
   getURL("FSCommand:ToGame_ToolTip_ClickButton",tooltipId + "\t" + buttonId);
}
function ToGame_ToolTip_SelectToolTip(tooltipId)
{
   getURL("FSCommand:ToGame_ToolTip_SelectToolTip",tooltipId);
}
function setFieldEventRewardTooltip(param, param1)
{
   var _loc5_ = lib.util.ExtString.split(param,"\n");
   var _loc10_ = _loc5_[0];
   toolTipMc.closeBtn._visible = false;
   toolTipMc.headerBg._visible = false;
   toolTipMc.headerTF._visible = false;
   var _loc1_ = 0;
   toolTipMc.tipText._x = 10;
   toolTipMc.tipText._y = 12;
   toolTipMc.tipText.htmlText = "<font size=\'14\' color=\'#67b3dd\'>" + _loc10_ + "</font>";
   toolTipMc.tipText._height = toolTipMc.tipText.textHeight + 5;
   _loc1_ = 41;
   var _loc4_ = _loc5_.length;
   var _loc2_ = 1;
   while(_loc2_ < _loc4_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc5_[_loc2_],"\t");
      setFieldEventReward(_loc2_,_loc3_,_loc1_);
      _loc1_ = _loc1_ + 30;
      _loc2_ = _loc2_ + 1;
   }
   if(param1 != "" && param1 != undefined)
   {
      var _loc8_ = createSectionFd(toolTipMc,"tf",10,_loc1_ + 10,toolTipMc.tipText._width);
      var _loc6_ = lib.util.ExtString.split(param1,"\n");
      var _loc11_ = _loc6_[0];
      _loc8_.htmlText = "<font size=\'14\' color=\'#67b3dd\'>" + _loc11_ + "</font>";
      _loc8_._height = toolTipMc.tipText.textHeight + 5;
      _loc1_ = _loc1_ + 41;
      var _loc7_ = _loc6_.length;
      _loc2_ = 1;
      while(_loc2_ < _loc7_)
      {
         _loc3_ = lib.util.ExtString.split(_loc6_[_loc2_],"\t");
         setFieldEventReward(_loc4_ + _loc2_,_loc3_,_loc1_);
         _loc1_ = _loc1_ + 30;
         _loc2_ = _loc2_ + 1;
      }
   }
   toolTipMc.bg._width = 375;
   toolTipMc.bg._height = _loc1_ + 5;
}
function setFieldEventReward(index, info, posY)
{
   var _loc5_ = info[0];
   var _loc11_ = info[1];
   var _loc8_ = flash.display.BitmapData.loadBitmap(_loc11_);
   var _loc7_ = Number(info[2]);
   var _loc2_ = Number(info[3]);
   var _loc12_ = Number(info[4]);
   var _loc4_ = createSectionFd(toolTipMc,"tf_" + index,41,posY,320);
   _loc4_._height = 27;
   _loc4_.verticalAlign = "center";
   var _loc1_ = "";
   var _loc10_ = _loc2_ >= 1?"x " + String(_loc2_):"";
   switch(_loc12_)
   {
      case ITEM_TYPE_NORMAL:
         _loc1_ = "<font size=\'14\' color=\'#adaeb2\'>" + _loc5_ + " " + _loc10_ + "</font>";
         break;
      case ITEM_TYPE_REPUTATION:
         _loc1_ = "<font size=\'14\' color=\'#00B4FF\'>" + _loc5_ + "</font>";
         var _loc13_ = lib.util.CurrencyFormat.makeComma(_loc2_);
         _loc1_ = "<font size=\'14\'>" + _loc1_ + " <font color=\'#007EFF\'>" + _loc13_ + "</font></font>";
         break;
      case ITEM_TYPE_MONEY:
         var _loc9_ = lib.util.GoldCurrency.SetGoldText(_loc2_,0,0,0,0);
         _loc1_ = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\' size=\'14\'>" + _loc9_ + "</font>";
         break;
      case ITEM_TYPE_EXP:
         var _loc14_ = lib.util.CurrencyFormat.makeComma(_loc2_);
         _loc1_ = "<font color=\'#60F0F0\' size=\'14\'>" + _loc5_ + " " + _loc14_ + "</font>";
   }
   lib.display.DrawBitmapData.draw(toolTipMc.bgMc,fieldEventRewardIconBg,10,posY,0,0,27,27);
   lib.display.DrawBitmapData.draw(toolTipMc.bgMc,_loc8_,11,posY + 1,0,0,25,25,0.390625);
   if(0 < _loc7_)
   {
      lib.display.DrawBitmapData.draw(toolTipMc.bgMc,gradeArr[_loc7_],11,posY + 1,0,0,CREST_GRADE_SIZE,CREST_GRADE_SIZE,CREST_GRADE_SCALE);
   }
   _loc4_.htmlText = _loc1_;
}
function setFieldEventMarkerTooltip(param, param1)
{
   var _loc7_ = lib.util.ExtString.split(param,"\t");
   var _loc19_ = _loc7_[0];
   var _loc17_ = _loc7_[1];
   var _loc18_ = _loc7_[2];
   var _loc20_ = Number(_loc7_[3]);
   var _loc22_ = _loc7_[4];
   toolTipMc.closeBtn._visible = false;
   toolTipMc.headerBg._visible = false;
   toolTipMc.headerTF._visible = false;
   var _loc1_ = 0;
   toolTipMc.tipText.htmlText = "text";
   toolTipMc.tipText._visible = false;
   var _loc8_ = createSectionFd(toolTipMc,"tf_0",10,10,350);
   var _loc15_ = markerArray[_loc20_];
   _loc8_.htmlText = _loc15_ + "<font size=\'16\'>" + _loc19_ + "</font>";
   _loc8_._height = _loc8_.textHeight + 5;
   _loc1_ = _loc8_._y + _loc8_._height + 5;
   var _loc9_ = toolTipMc.bgMc.attachMovie("textBg","textBg_0",toolTipMc.bgMc.getNextHighestDepth());
   var _loc23_ = _loc9_._width;
   _loc9_._x = 10;
   _loc9_._y = _loc1_;
   var _loc12_ = createSectionFd(toolTipMc,"tf_1",25,_loc1_ + 3,350);
   _loc12_.htmlText = "<font size=\'14\'>" + _loc22_ + "</font>";
   var _loc13_ = _loc12_.textWidth;
   var _loc14_ = Math.max(_loc13_ + 10,_loc23_);
   _loc9_._width = _loc14_;
   _loc12_._x = (10 + _loc14_) / 2 - _loc13_ / 2 + 2;
   _loc1_ = _loc1_ + (_loc9_._height + 20);
   var _loc10_ = createSectionFd(toolTipMc,"tf_2",15,_loc1_,350);
   _loc10_.htmlText = "<font size=\'14\' color=\'#adaeb2\'>" + _loc17_ + "</font>";
   _loc10_._height = _loc10_.textHeight + 5;
   _loc1_ = _loc1_ + 15 + _loc10_._height;
   var _loc11_ = createSectionFd(toolTipMc,"tf_3",15,_loc1_,350);
   var _loc25_ = lib.util.UIString.getUIString("$720009");
   _loc11_.htmlText = _loc25_;
   _loc11_.height = tf3.textHeight + 5;
   _loc1_ = _loc1_ + 5 + _loc11_.height;
   var _loc5_ = createSectionFd(toolTipMc,"tf_4",15,_loc1_,350);
   _loc5_.htmlText = "<font size=\'14\' color=\'#f6cb3d\'>" + _loc18_ + "</font>";
   _loc5_._width = _loc5_.textWidth + 5;
   _loc5_._x = 360 - _loc5_._width;
   _loc5_._y = 17;
   lib.display.DrawBitmapData.draw(toolTipMc.bgMc,fieldEventTime,_loc5_._x - 18,14,0,0,19,22);
   if(param1 != null && param1.length > 0)
   {
      var _loc3_ = lib.util.ExtString.split(param1,"\n");
      var _loc21_ = _loc3_[0];
      var _loc24_ = _loc3_[1];
      _loc1_ = _loc1_ + 20;
      var _loc4_ = undefined;
      _loc4_ = createSectionFd(toolTipMc,"tf_5",15,_loc1_,350);
      _loc4_.htmlText = _loc21_;
      _loc4_.height = _loc4_.textHeight + 5;
      _loc1_ = _loc1_ + (_loc4_.height + 10);
      var _loc2_ = undefined;
      var _loc6_ = _loc3_.length - 2;
      _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         setFieldEventMarkerReward("tf_reward_" + _loc2_,_loc3_[_loc2_ + 2],_loc1_);
         _loc1_ = _loc1_ + 30;
         _loc2_ = _loc2_ + 1;
      }
      _loc1_ = _loc1_ + 8;
      _loc4_ = createSectionFd(toolTipMc,"tf_6",15,_loc1_,350);
      _loc4_.htmlText = _loc24_;
      _loc4_.height = _loc4_.textHeight + 5;
      _loc1_ = _loc1_ + (5 + _loc4_.height);
   }
   toolTipMc.bg._width = 375;
   toolTipMc.bg._height = _loc1_ + 10;
}
function setFieldEventMarkerReward(name, data, posY)
{
   var _loc2_ = lib.util.ExtString.split(data,"\t");
   var _loc3_ = _loc2_[0];
   var _loc8_ = _loc2_[1];
   var _loc7_ = flash.display.BitmapData.loadBitmap(_loc8_);
   var _loc6_ = Number(_loc2_[2]);
   var _loc9_ = Number(_loc2_[3]);
   var _loc4_ = createSectionFd(toolTipMc,name,61,posY,320);
   _loc4_._height = 27;
   _loc4_.verticalAlign = "center";
   var _loc1_ = "";
   switch(_loc9_)
   {
      case ITEM_TYPE_NORMAL:
         _loc1_ = "<font size=\'14\' color=\'#adaeb2\'>" + _loc3_ + "</font>";
         break;
      case ITEM_TYPE_REPUTATION:
         _loc1_ = "<font size=\'14\' color=\'#00B4FF\'>" + _loc3_ + "</font>";
         break;
      case ITEM_TYPE_MONEY:
         _loc1_ = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\' size=\'14\'>" + _loc3_ + "</font>";
         break;
      case ITEM_TYPE_EXP:
         _loc1_ = "<font color=\'#60F0F0\' size=\'14\'>" + _loc3_ + "</font>";
   }
   lib.display.DrawBitmapData.draw(toolTipMc.bgMc,fieldEventRewardIconBg,30,posY,0,0,27,27);
   lib.display.DrawBitmapData.draw(toolTipMc.bgMc,_loc7_,31,posY + 1,0,0,25,25,0.390625);
   if(0 < _loc6_)
   {
      lib.display.DrawBitmapData.draw(toolTipMc.bgMc,gradeArr[_loc6_],31,posY + 1,0,0,CREST_GRADE_SIZE,CREST_GRADE_SIZE,CREST_GRADE_SCALE);
   }
   _loc4_.htmlText = _loc1_;
}
function setGuidePosition()
{
   var _loc3_ = 0;
   for(var _loc4_ in guideContainer)
   {
      if(typeof guideContainer[_loc4_] == "movieclip")
      {
         _loc3_ = _loc3_ + 1;
         var _loc1_ = guideContainer[_loc4_];
         if(!_loc1_.parentMc._visible)
         {
            _loc1_.removeMovieClip();
         }
         else
         {
            var _loc2_ = _loc1_.parentMc._xscale;
            _loc1_._x = _loc1_.parentMc._x + Number(_loc1_.posX) * (_loc2_ / 100);
            _loc1_._y = _loc1_.parentMc._y + Number(_loc1_.posY) * (_loc2_ / 100);
            _loc1_._xscale = _loc1_.parentMc._xscale;
            _loc1_._yscale = _loc1_.parentMc._yscale;
            _loc1_.arrowMc.gotoAndStop(_loc1_.gType);
         }
      }
   }
   if(_loc3_ > 0)
   {
      guideContainer._visible = true;
   }
   else
   {
      guideContainer._visible = false;
   }
}
function selectToolTip(target, bToGame, bOverVisible)
{
   if(target == selectedToolTip)
   {
      return undefined;
   }
   if(null != selectedToolTip)
   {
      selectedToolTip.overMc._visible = false;
   }
   selectedToolTip = target;
   selectedToolTip.overMc._visible = bOverVisible;
   if(bToGame)
   {
      ToGame_ToolTip_SelectToolTip(target.id);
   }
}
mc._width = mc._height = 140;
_global.gfxExtensions = true;
var UI = this;
var UIname = "ToolTip";
var bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var tipTextWidth;
var tipTextHeight;
var headerObjS;
var seletTarget;
var infoMc;
var SECTIONSPACE = 5;
var SECTIONBGPOS = 18;
var MAXWIDTH = 350;
var DELAYTIME = 90;
var TITLEH = 40;
var MAXDEPTH = 10;
var POSITIONSPACE = 20;
var TOPMAG = 5;
var BTMAG = 10;
var LMAG = 10;
var RMAG = 15;
var COMPAREBGSPACE = 2;
var customPosition = {};
var compareCount = 0;
var compareStorage = [];
compareStorage[0] = [];
var interval;
var leaveTime;
var bgImg0 = flash.display.BitmapData.loadBitmap("bgImg0");
var bgImg1 = flash.display.BitmapData.loadBitmap("bgImg1");
var lineImg = bgImg1;
var compareIcon1 = flash.display.BitmapData.loadBitmap("compareIcon1");
var compareIcon2 = flash.display.BitmapData.loadBitmap("compareIcon2");
var productionIcon = flash.display.BitmapData.loadBitmap("productionIcon");
var expbarBg = flash.display.BitmapData.loadBitmap("expbarBg");
var expbar = flash.display.BitmapData.loadBitmap("expbar");
var awaken_icon_w = 61;
var awaken_icon_h = 39;
var gradeImg1 = flash.display.BitmapData.loadBitmap("gradeIcon_1");
var gradeImg2 = flash.display.BitmapData.loadBitmap("gradeIcon_2");
var gradeImg3 = flash.display.BitmapData.loadBitmap("gradeIcon_3");
var masterImg = flash.display.BitmapData.loadBitmap("masterIcon");
var wakeupImg = flash.display.BitmapData.loadBitmap("wakeup");
var crestBg0 = flash.display.BitmapData.loadBitmap("crestBg_0");
var crestBg1 = flash.display.BitmapData.loadBitmap("crestBg_1");
var crestLine = flash.display.BitmapData.loadBitmap("crestLine");
var crestDisable = flash.display.BitmapData.loadBitmap("crestDisable");
var tiredBar = flash.display.BitmapData.loadBitmap("tiredBar");
var petFrame00 = flash.display.BitmapData.loadBitmap("petFrame_0_0");
var petFrame01 = flash.display.BitmapData.loadBitmap("petFrame_0_1");
var petFrame02 = flash.display.BitmapData.loadBitmap("petFrame_0_2");
var petFrame03 = flash.display.BitmapData.loadBitmap("petFrame_0_3");
var petFrame10 = flash.display.BitmapData.loadBitmap("petFrame_1_0");
var petFrame11 = flash.display.BitmapData.loadBitmap("petFrame_1_1");
var petFrame12 = flash.display.BitmapData.loadBitmap("petFrame_1_2");
var petFrame13 = flash.display.BitmapData.loadBitmap("petFrame_1_3");
var copperStar = flash.display.BitmapData.loadBitmap("copperStar");
var silverStar = flash.display.BitmapData.loadBitmap("silverStar");
var goldStar = flash.display.BitmapData.loadBitmap("goldStar");
var petGaugeBg = flash.display.BitmapData.loadBitmap("petGaugeBg");
var petGaugeBgLine = flash.display.BitmapData.loadBitmap("petGaugeBgLine");
var hpGaugeBar = flash.display.BitmapData.loadBitmap("hpGaugeBar");
var expGaugeBar = flash.display.BitmapData.loadBitmap("expGaugeBar");
var energyGaugeBar = flash.display.BitmapData.loadBitmap("energyGaugeBar");
var lightBg = flash.display.BitmapData.loadBitmap("lightBg");
var lightLine = flash.display.BitmapData.loadBitmap("lightLine");
var petSkillDisable = flash.display.BitmapData.loadBitmap("petSkillDisable");
var siegeToolTipBg = flash.display.BitmapData.loadBitmap("siegeBg");
var gradeArr = ["",gradeImg1,gradeImg2,gradeImg3];
var fieldEventMarker_small = flash.display.BitmapData.loadBitmap("fieldMarkerSmall");
var fieldEventMarker_medium = flash.display.BitmapData.loadBitmap("fieldMarkerMedium");
var fieldEventMarker_large = flash.display.BitmapData.loadBitmap("fieldMarkerLarge");
var fieldEventTime = flash.display.BitmapData.loadBitmap("time");
var fieldEventRewardIconBg = flash.display.BitmapData.loadBitmap("rewardToolTipIconBg");
var GOLDCOLOR = "#" + lib.info.TextColor.GENERAL_MONEY.toString(16);
var HEADCOLOR = "#B6B6B6";
var SECTIONCOLOR = "#" + lib.info.TextColor.TOOLTIP_SECTION.toString(16);
var CRITCOLOR = "#" + lib.info.TextColor.TOOLTIP_CRITICAL.toString(16);
var REGICOLOR = "#" + lib.info.TextColor.TOOLTIP_REGIST.toString(16);
var APPLYCOLOR = "#" + lib.info.TextColor.TOOLTIP_APPLY.toString(16);
var TITLECOLOR = "#" + lib.info.TextColor.TOOLTIP_TITILE.toString(16);
var NORMALCOLOR = "#" + lib.info.TextColor.TOOLTIP_NORMAL.toString(16);
var tooltiplist = lib.manager.ToolTip.tooltiplist;
var toolTipMc = this.attachMovie("toolTipId","toolTipMc",MAXDEPTH);
var tooltip_fmt = new TextFormat();
init();
lib.manager.ToolTip.init();
lib.manager.ToolTip.tooltipmodule = this;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      UI._visible = bWindowOpen;
   }
};
myListener.OnGameEventChangeUIMode = function(bMode)
{
   if(_global.gbUIMode)
   {
      hideToolTip();
   }
   if(!bMode)
   {
      while(infoTooltips[0] != undefined)
      {
         var _loc2_ = infoTooltips.pop();
         if(_loc2_.battlePetId != undefined)
         {
            ToGame_BattlePetToolTip_Close(_loc2_.battlePetId);
         }
         if(_loc2_.id != undefined)
         {
            ToGame_ToolTip_Close(_loc2_.id);
         }
         _loc2_.removeMovieClip();
      }
      selectedToolTip = null;
   }
   myListener.OnGame_ToolTip_SetCheck(bMode);
};
myListener.OnGame_ScaleUI = function()
{
   var _loc1_ = getScale();
   toolTipMc._xscale = toolTipMc._yscale = _loc1_;
   collectionContainerMc._xscale = collectionContainerMc._yscale = lib.info.AlignInfo.scaleRatio * 100;
   myListener.OnGame_ChangeStageSize();
   setGuidePosition();
};
myListener.OnGame_ChangeStageSize = function(w, h)
{
   collectionContainerMc._x = lib.info.AlignInfo.xRatioToPixel(50);
   collectionContainerMc._y = lib.info.AlignInfo.yRatioToPixel(77);
   setGuidePosition();
};
var subToolTip;
myListener.OnGame_ToolTip_ChangePosition = function(x, y)
{
   toolTipMc._x = x;
   toolTipMc._y = y;
   if(subToolTip)
   {
      var _loc1_ = toolTipMc._x - (toolTipMc._width + 1);
      if(_loc1_ < 0)
      {
         _loc1_ = toolTipMc._x + (toolTipMc._width + 1);
      }
      subToolTip._x = _loc1_;
      subToolTip._y = toolTipMc._y;
   }
};
myListener.OnGame_BattlePetToolTip_Open = function(tooltipStr)
{
   if(!_global.gbUIMode)
   {
      return undefined;
   }
   hideToolTip();
   var _loc5_ = toolTipMc;
   var _loc21_ = tooltipStr.indexOf("<");
   var _loc14_ = tooltipStr.indexOf(">") + 1;
   var _loc22_ = tooltipStr.length;
   var _loc16_ = tooltipStr.substring(_loc21_,_loc14_);
   tooltipStr = tooltipStr.substring(_loc14_,_loc22_);
   headerObjS = lib.util.ExtString.findTag(_loc16_,"TooltipHeader");
   var _loc12_ = Number(headerObjS[0].type);
   var _loc11_ = headerObjS[0].id;
   var _loc15_ = lib.util.ExtString.findTag(tooltipStr,"PetSlot");
   if(_loc15_ != undefined)
   {
      SetPetSlotDraw(_loc5_,_loc15_);
   }
   _loc5_.tipText._x = LMAG;
   _loc5_.tipText.styleSheet = toolTipStyle;
   _loc5_.tipText.htmlText = tooltipStr;
   if(_loc11_ != undefined)
   {
      _loc5_.battlePetId = _loc11_;
   }
   SetPetToolTip(_loc5_,tooltipStr);
   displayToolTip(_loc5_,_loc12_);
   if(_loc12_ == 1)
   {
      stopDrag();
      statusTweens = [];
      var _loc7_ = String(seletTarget.tg).split(".");
      var _loc4_ = String(_loc7_.shift());
      while(_loc4_ != undefined)
      {
         if(_loc4_.toLowerCase() == "shortcut")
         {
            return undefined;
         }
         _loc4_ = _loc7_.shift();
      }
      infoMc = toolTipMc;
      infoMc._name = "infoMc" + this.getNextHighestDepth();
      toolTipMc = undefined;
      if(infoTooltips.length == 5)
      {
         var _loc8_ = infoTooltips.shift();
         if(_loc8_.battlePetId != undefined)
         {
            ToGame_BattlePetToolTip_Close(_loc8_.battlePetId);
         }
         if(_loc8_.id != undefined)
         {
            ToGame_ToolTip_Close(_loc8_.id);
         }
         if(_loc8_ == selectedToolTip)
         {
            selectedToolTip = null;
         }
         _loc8_.removeMovieClip();
      }
      infoTooltips.push(infoMc);
      var _loc13_ = getScale();
      infoMc._xscale = infoMc._yscale = _loc13_;
      if(customPosition.x == undefined || isNaN(customPosition.x))
      {
         customPosition.x = Stage.width / 2;
         customPosition.y = lib.info.AlignInfo.UI_HEIGHT;
      }
      if(infoTooltips[infoTooltips.length - 2] != undefined)
      {
         ta.htmlText = ta.htmlText + (infoTooltips[infoTooltips.length - 2] + "\n");
         infoMc._x = infoTooltips[infoTooltips.length - 2]._x + 5;
         infoMc._y = infoTooltips[infoTooltips.length - 2]._y - 5;
      }
      else
      {
         infoMc._x = customPosition.x - infoMc._width / 2 + 5;
         infoMc._y = customPosition.y - infoMc._height - 45;
      }
      infoMc._visible = true;
      infoMc.closeBtn._visible = true;
      infoMc.closeBtn.onPress = function()
      {
         for(var _loc3_ in statusTweens)
         {
            gs.TweenLite.killTweensOf(statusTweens[_loc3_],false);
            gs.TweenMax.killTweensOf(statusTweens[_loc3_],false);
         }
         statusTweens = [];
         for(var _loc4_ in infoTooltips)
         {
            if(infoTooltips[_loc4_] == this._parent)
            {
               var _loc2_ = infoTooltips.splice(_loc4_,1);
               if(_loc2_[0].battlePetId != undefined)
               {
                  ToGame_BattlePetToolTip_Close(_loc2_[0].battlePetId);
               }
               if(_loc2_[0].id != undefined)
               {
                  ToGame_ToolTip_Close(_loc2_[0].id);
               }
               if(_loc2_[0] == selectedToolTip)
               {
                  selectedToolTip = null;
               }
               _loc2_[0].removeMovieClip();
            }
         }
      };
      infoMc.bg.onPress = function()
      {
         var _loc2_ = getScale();
         var _loc5_ = this._width * (_loc2_ / 100);
         var _loc6_ = this._height * (_loc2_ / 100);
         var _loc3_ = (Stage.width - lib.info.AlignInfo.UI_WIDTH) / 2;
         var _loc4_ = (Stage.height - lib.info.AlignInfo.UI_HEIGHT) / 2;
         this._parent.swapDepths(UI.getNextHighestDepth());
         this._parent.startDrag(false,0,-30,Stage.width - _loc3_ - _loc5_,Stage.height - _loc4_ - _loc6_);
      };
      infoMc.bg.onRelease = infoMc.bg.onReleaseOutside = infoMc.bg.onRollOut = function()
      {
         this._parent.stopDrag();
         var _loc3_ = this._parent._x;
         var _loc2_ = this._parent._y;
         customPosition.x = infoMc._x + infoMc._width / 2;
         customPosition.y = infoMc._y + infoMc._height + 50;
      };
      hideToolTip();
   }
};
var parentSlotImg = "";
var BATTLE_PET_ICON_SIZE = 128;
var gaugeSize = 114;
var GAUGE_TITLE_DEFAULT_WIDTH = 28;
var compareIcon = undefined;
var bAwaken = false;
myListener.OnGame_ToolTip_Open = function(tooltipStr, id, curNum, maxNum)
{
   if(!_global.gbUIMode)
   {
      return undefined;
   }
   var _loc6_ = lib.util.ExtString.findTag(tooltipStr,"section");
   var _loc13_ = 0;
   while(_loc13_ < _loc6_.length)
   {
      if(_loc6_[_loc13_].name == "compare")
      {
         tooltipStr = tooltipStr.split("<section name=\'compare\'><img src=\'lineBitmap2\'/><br><performancebg/></section>").join("");
         break;
      }
      _loc13_ = _loc13_ + 1;
   }
   curNum = Number(curNum);
   maxNum = Number(maxNum);
   var _loc26_ = tooltipStr.indexOf("<");
   var _loc18_ = tooltipStr.indexOf(">") + 1;
   var _loc27_ = tooltipStr.length;
   var _loc19_ = tooltipStr.substring(_loc26_,_loc18_);
   tooltipStr = tooltipStr.substring(_loc18_,_loc27_);
   var _loc5_ = toolTipMc;
   headerObjS = lib.util.ExtString.findTag(_loc19_,"TooltipHeader");
   var _loc9_ = Number(headerObjS[0].type);
   compareIcon = Number(headerObjS[0].icon);
   bAwaken = Boolean(Number(headerObjS[0].awaken));
   if(isNaN(compareIcon))
   {
      compareIcon = 0;
   }
   if(_loc9_ == 2)
   {
      _loc5_ = UI.attachMovie("toolTipId","toolTipCompareMc" + compareCount++,UI.getNextHighestDepth(),{_visible:false});
      var _loc25_ = getScale();
      _loc5_._xscale = _loc5_._yscale = _loc25_;
      _loc5_.closeBtn._visible = false;
      _loc5_.tipText.textColor = 7698039;
      _loc5_.tipText.setNewTextFormat(tooltip_fmt);
   }
   else
   {
      hideToolTip();
   }
   _loc5_.id = !("0" == id || 0 == id || undefined == id)?id:undefined;
   _loc5_.maxNum = !(0 == maxNum || undefined == maxNum || isNaN(maxNum))?maxNum:0;
   _loc5_.curNum = _loc5_.maxNum != 0?curNum:0;
   var _loc17_ = lib.util.ExtString.findTag(tooltipStr,"ItemSlot");
   if(_loc17_ != undefined)
   {
      SetSlotDraw(_loc5_,_loc17_);
   }
   _loc5_.tipText._x = LMAG;
   _loc5_.tipText.styleSheet = toolTipStyle;
   tooltipStr = tooltipStr.split("src=\'Icon_random_n\'").join("src=\'Icon_random_n\' vspace=\'-2\' width=\'12\' height=\'12\'");
   _loc5_.tipText.htmlText = tooltipStr;
   setOptionButton(_loc5_,curNum,maxNum,BUTTON_TYPE_OVER);
   insertSection(_loc5_.tipText,tooltipStr,"section",_loc9_ == 2);
   inputMaker(_loc5_.Fddesc,tooltipStr,"maker");
   clearCoolTime(_loc5_,tooltipStr);
   checkCoolTime(_loc5_,tooltipStr);
   displayToolTip(_loc5_,_loc9_);
   if(_loc9_ == 3)
   {
      for(var _loc12_ in statusTweens)
      {
         gs.TweenLite.killTweensOf(statusTweens[_loc12_],false);
         gs.TweenMax.killTweensOf(statusTweens[_loc12_],false);
      }
      statusTweens = [];
      for(var _loc13_ in infoTooltips)
      {
         if(infoTooltips[_loc13_].typeId == 1)
         {
            var _loc3_ = infoTooltips.splice(_loc13_,1);
            if(_loc3_[0].battlePetId != undefined)
            {
               ToGame_BattlePetToolTip_Close(_loc3_[0].battlePetId);
            }
            if(_loc3_[0].id != undefined)
            {
               ToGame_ToolTip_Close(_loc3_[0].id);
            }
            if(_loc3_[0] == selectedToolTip)
            {
               selectedToolTip = null;
            }
            _loc3_[0].removeMovieClip();
         }
      }
      setItemInfoBox(tooltipStr,id,curNum,maxNum);
      infoMc.typeId = 1;
      var _loc10_ = _root.GetLoadedUI("enchant");
      if(_loc10_._visible == true)
      {
         var _loc24_ = (_loc10_.hit._width + 3) * lib.info.AlignInfo.scaleRatio;
         var _loc16_ = _loc10_._x + _loc24_;
         var _loc15_ = _loc10_._y;
         var _loc20_ = (Stage.width - lib.info.AlignInfo.UI_WIDTH) / 2;
         if(_loc16_ + infoMc._width > Stage.width - _loc20_)
         {
            _loc25_ = getScale();
            infoMc._x = _loc10_._x - infoMc._width * _loc25_;
            infoMc._y = _loc15_ + 217 * lib.info.AlignInfo.scaleRatio;
         }
         else
         {
            infoMc._x = _loc16_;
            infoMc._y = _loc15_ + 217 * lib.info.AlignInfo.scaleRatio;
         }
      }
      var _loc7_ = infoMc.attachMovie("lightEffMc","lightEffMc",infoMc.getNextHighestDepth());
      _loc7_._width = infoMc.bgMc._width;
      _loc7_._height = infoMc.bgMc._height;
      _loc7_._x = _loc7_._width / 2;
      _loc7_._y = _loc7_._height / 2;
      var _loc28_ = _loc7_._width + 20;
      var _loc29_ = _loc7_._height + 20;
      _loc7_._alpha = 70;
      gs.TweenLite.to(_loc7_,1,{_alpha:0,_width:_loc28_,_height:_loc29_,ease:gs.easing.Strong.easeOut});
      var _loc22_ = lib.util.ExtString.findTag(infoMc.Fdstate.htmlText,"statusUp");
      var _loc31_ = lib.util.ExtString.findTag(infoMc.Fdstate.htmlText,"statusDown");
      var _loc23_ = lib.util.ExtString.findTag(infoMc.Fdstate.htmlText,"buildlevelUp");
      var _loc21_ = lib.util.ExtString.findTag(infoMc.Fdenchant.htmlText,"buildlevelUp");
      var _loc34_ = lib.util.ExtString.findTag(infoMc.Fdenchant.htmlText,"buildlevelDown");
      motionStatusUp(infoMc,_loc22_);
      motionBuildLevelUp(infoMc,_loc23_,infoMc.Fdstate);
      motionBuildLevelUp(infoMc,_loc21_,infoMc.Fdenchant);
      inputMaker(infoMc.Fddesc,tooltipStr,"maker");
   }
   else if(_loc9_ == 1)
   {
      setItemInfoBox(tooltipStr,id,curNum,maxNum);
      inputMaker(infoMc.Fddesc,tooltipStr,"maker");
   }
   else if(_loc9_ != 2 && 0 < maxNum)
   {
      selectToolTip(_loc5_,false,false);
   }
};
myListener.OnGame_ToolTip_Update = function(tooltipId, str, curNum, maxNum)
{
   if(null == selectedToolTip)
   {
      return undefined;
   }
   curNum = Number(curNum);
   maxNum = Number(maxNum);
   var _loc2_ = selectedToolTip;
   if(tooltipId != _loc2_.id)
   {
      _loc2_ = null;
      var _loc15_ = 0;
      while(_loc15_ < compareCount)
      {
         var _loc9_ = this["toolTipCompareMc" + _loc15_];
         if(tooltipId == _loc9_.id)
         {
            _loc2_ = _loc9_;
            break;
         }
         _loc15_ = _loc15_ + 1;
      }
      if(null == _loc2_)
      {
         return undefined;
      }
   }
   _loc2_.curNum = curNum;
   var _loc24_ = toolTipMc != _loc2_?BUTTON_TYPE_FIXED:BUTTON_TYPE_OVER;
   setOptionButton(_loc2_,curNum,maxNum,_loc24_);
   var _loc22_ = lib.util.ExtString.findTag(str,"ItemSlot");
   if(_loc22_ != undefined)
   {
      SetSlotDraw(_loc2_,_loc22_);
   }
   var _loc16_ = lib.util.ExtString.findTag(str,"section");
   if(_loc16_ == undefined)
   {
      return undefined;
   }
   var _loc18_ = _loc16_.length;
   if(_loc18_ <= 0)
   {
      return undefined;
   }
   var _loc10_ = 0;
   var _loc7_ = 0;
   _loc15_ = 0;
   while(_loc15_ < _loc18_)
   {
      var _loc14_ = _loc16_[_loc15_];
      var _loc8_ = _loc14_.name;
      var _loc6_ = "name" != _loc8_?_loc2_["Fd" + _loc8_]:_loc2_.tipText;
      _loc7_ = str.indexOf("<section",_loc10_ + 2);
      if(undefined == _loc7_ || -1 == _loc7_)
      {
         _loc7_ = str.length;
      }
      var _loc12_ = str.slice(_loc10_,_loc7_);
      _loc10_ = _loc7_;
      if(undefined != _loc6_)
      {
         _loc6_.htmlText = _loc12_;
         _loc6_._height = _loc6_.textHeight + 5;
      }
      _loc15_ = _loc15_ + 1;
   }
   var _loc21_ = _loc2_.itemSlotMc;
   var _loc17_ = 0;
   _loc15_ = 1;
   var _loc19_ = SECTIONTYPES.length;
   var _loc4_ = _loc2_.tipText._y + _loc2_.tipText._height + SECTIONSPACE + 10;
   if(_loc21_)
   {
      _loc21_._y = _loc4_;
      _loc17_ = !imgSlotMc.txt0._visible?45:90;
      _loc4_ = _loc4_ - 3;
   }
   while(_loc15_ < _loc19_)
   {
      _loc15_;
      _loc8_ = SECTIONTYPES[_loc15_++];
      _loc6_ = _loc2_["Fd" + _loc8_];
      if(undefined != _loc6_)
      {
         if(_loc8_ == "desc")
         {
            _loc6_._y = _loc4_;
            var _loc13_ = Math.max(_loc17_,_loc6_._height);
            _loc4_ = _loc4_ + _loc13_ + SECTIONSPACE;
         }
         else
         {
            _loc6_._y = _loc4_;
            _loc4_ = _loc4_ + _loc6_._height + SECTIONSPACE;
            if((_loc8_ == "enchant" || _loc8_ == "combine") && 0 < _loc2_.maxNum)
            {
               var _loc5_ = null;
               var _loc3_ = 0;
               while(_loc3_ < _loc2_.maxNum)
               {
                  _loc5_ = _loc2_["button_" + _loc3_];
                  _loc5_._y = _loc4_;
                  _loc3_ = _loc3_ + 1;
               }
               _loc4_ = _loc5_._y + _loc5_._height + SECTIONSPACE;
            }
         }
      }
   }
   _loc2_.bg._height = _loc4_ + 10;
   _loc2_.overMc._height = _loc4_ + 10;
};
_global.toolTipStyle = new TextField.StyleSheet();
myListener.OnGame_ToolTip_SetStyleSheet = function(stleList)
{
   var _loc7_ = lib.util.ExtString.split(stleList,"\n");
   var _loc8_ = _loc7_.length;
   var _loc5_ = 0;
   while(_loc5_ < _loc8_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc7_[_loc5_],"\t");
      var _loc6_ = _loc3_[0];
      var _loc1_ = 1;
      var _loc4_ = {};
      while(_loc3_[_loc1_] != undefined)
      {
         var _loc2_ = _loc3_[_loc1_].split("=");
         _loc4_[_loc2_[0]] = _loc2_[1];
         _loc1_ = _loc1_ + 1;
      }
      toolTipStyle.setStyle("." + _loc6_,_loc4_);
      _loc5_ = _loc5_ + 1;
   }
};
var collectionLevels = ["$101091","$101092","$101093","$153057"];
var collectionLevelColors = [5095424,16760112,12582917,12582917];
myListener.OnGame_GatherToolTip_Open = function(__name, img, grade, difficulty, needtired, tired, totaltired, possibleLv)
{
   myListener.OnGame_GatherToolTip_Close();
   var _loc9_ = UI.getNextHighestDepth();
   difficulty = Number(difficulty);
   var _loc8_ = lib.util.UIString.getUIString("101076","Grade",grade);
   var _loc10_ = "";
   var _loc1_ = UI.collectionContainerMc.attachMovie("collectionToolTip","collectionToolTip",_loc9_);
   var _loc13_ = getScale();
   collectionContainerMc._xscale = collectionContainerMc._yscale = _loc13_;
   if(difficulty != 3)
   {
      _loc1_.txt.htmlText = __name + "<br>" + _loc8_;
   }
   else
   {
      _loc1_.txt.htmlText = __name + "<br>" + _loc8_ + lib.util.UIString.getUIString("$153069","level",possibleLv);
   }
   var _loc3_ = Math.max(150,_loc1_.txt.textWidth + 4);
   var _loc6_ = 59;
   _loc1_.txt._width = _loc3_;
   _loc1_.levelFd._width = _loc3_;
   _loc1_._x = (- _loc1_._width) / 2;
   _loc1_._alpha = 0;
   UI._visible = true;
   gs.TweenLite.to(_loc1_,0.7,{_alpha:100,ease:gs.easing.Strong.easeInOut});
   if(needtired)
   {
      _loc1_.diffFd.text = _loc10_;
      _loc1_.diffFd.textColor = collectionLevelColors[difficulty];
      _loc1_.tiredTxt0.htmlText = lib.util.UIString.getUIString("$153044");
      _loc1_.tiredTxt1.text = tired + "/" + totaltired;
      _loc1_.tiredTxt2.text = lib.util.UIString.getUIString("$153060") + " " + lib.util.UIString.getUIString("$153044") + " : " + needtired;
      var _loc4_ = _loc1_.tiredTxt0.textWidth + 5;
      var _loc2_ = 202 - _loc4_ - 5;
      var _loc5_ = _loc4_ + 7;
      var _loc16_ = (_loc2_ - 4) * (tired / totaltired);
      _loc1_.tiredTxt0._width = _loc4_;
      _loc1_.gageBg._x = _loc5_;
      _loc1_.gageBar._x = _loc5_ + 2;
      _loc1_.tiredTxt1._width = _loc2_ - 4;
      _loc1_.tiredTxt1._x = _loc5_ + 2;
      _loc1_.gageBg._width = _loc2_;
      _loc1_.gageBar._width = (_loc2_ - 4) * (tired / totaltired);
      _loc6_ = 105;
      SetBgDraw(_loc1_,_loc3_ + 67,_loc6_,3);
   }
   else
   {
      _loc1_.diffFd._visible = false;
      _loc1_.tiredTxt0._visible = false;
      _loc1_.tiredTxt1._visible = false;
      _loc1_.tiredTxt2._visible = false;
      _loc1_.gageBg._visible = false;
      _loc1_.gageBar._visible = false;
      SetBgDraw(_loc1_,_loc3_ + 67,_loc6_,3);
   }
   lib.display.DrawBitmapData.draw(_loc1_.bgMc,img,7,7,0,0,45,45,0.7,0.7);
};
myListener.OnGame_GatherToolTip_Close = function()
{
   gs.TweenLite.killTweensOf(collectionContainerMc.collectionToolTip,false);
   collectionContainerMc.collectionToolTip.removeMovieClip();
};
guideContainer._visible = false;
myListener.OnGame_MouseUp = mouseUpEvent;
myListener.OnGame_MouseMove = mouseMoveEvent;
var guideVisibleCount = 0;
myListener.OnGame_MouseDown = mouseDownEvent;
myListener.OnGame_ToolTip_SetTarget = function(obj)
{
   seletTarget = obj;
};
myListener.OnGame_ToolTip_SetCheck = function(flag)
{
   if(!flag)
   {
      delete myListener.OnGame_MouseMove;
      delete myListener.OnGame_MouseDown;
   }
   else
   {
      myListener.OnGame_MouseMove = mouseMoveEvent;
      myListener.OnGame_MouseDown = mouseDownEvent;
   }
   hideToolTip();
};
var showTime = 0;
var delayTimer;
var BUTTON_TYPE_FIXED = 0;
var BUTTON_TYPE_OVER = 1;
var infoTooltips = [];
var CREST_SPACE = 10;
var CREST_BG_SIZE = 33;
var CREST_LINE_SIZE = 28;
var CREST_IMG_SIZE = 24;
var CREST_GRADE_SIZE = 6;
var CREST_DISABLE_SIZE = 27;
var CREST_IMG_SCALE = CREST_IMG_SIZE / 64;
var CREST_GRADE_SCALE = CREST_GRADE_SIZE / 16;
var CREST_DISABLE_SCALE = CREST_DISABLE_SIZE / 18;
var SlotSize = 45;
var SlotScale = SlotSize / 64;
var GaugeSize = 43;
var headerStr = [lib.util.UIString.getUIString("$101109"),lib.util.UIString.getUIString("$101110"),lib.util.UIString.getUIString("$101111")];
var HEADER_BG_HEIGHT = 21;
var HEADER_BG_MIN_SIZE = 138;
var SECTIONTYPES = ["name","desc","crest","state","enchant","combine","buttonguide","socket","compare","skill"];
var infoBG_S = 0;
var infoBG_H = 0;
var RankIconArr = [];
var coolTimeIntervals = [];
var remainCoolTime = 0;
var coolTimeString = "";
var statusTweens = [];
myListener.OnGame_FieldEventToolTip_Open = function(type, param, param1)
{
   type = Number(type);
   headerObjS = "0";
   if(0 == type)
   {
      setFieldEventRewardTooltip(param,param1);
      freedisplayToolTip(toolTipMc,false);
   }
   else if(1 == type)
   {
      setFieldEventMarkerTooltip(param,param1);
      freedisplayToolTip(toolTipMc,false);
   }
};
var ITEM_TYPE_NORMAL = 0;
var ITEM_TYPE_REPUTATION = 1;
var ITEM_TYPE_MONEY = 2;
var ITEM_TYPE_EXP = 3;
var markerArray = ["<img src=\'fieldSmallIcon\' width=\'36\' height=\'25\' vspace=\'-6\'>","<img src=\'fieldMediumIcon\' width=\'36\' height=\'25\' vspace=\'-6\'>","<img src=\'fieldLargeIcon\' width=\'36\' height=\'25\' vspace=\'-6\'>","<img src=\'fnb_icon_small\' width=\'36\' height=\'25\' vspace=\'-6\'>","<img src=\'fnb_icon_medium\' width=\'36\' height=\'25\' vspace=\'-6\'>","<img src=\'fnb_icon_large\' width=\'36\' height=\'25\' vspace=\'-6\'>"];
var colorArray = ["#009900","#00BFFF","#FFCC00"];
var markerBDArray = [fieldEventMarker_small,fieldEventMarker_medium,fieldEventMarker_large];
myListener.OnGame_GuideToolTip_Open = function(uiName, id, tooltipStr, posX, posY, type, guideLine)
{
   var _loc7_ = _root.GetLoadedUI(uiName);
   if(_loc7_ == null || _loc7_._visible == false)
   {
      setGuidePosition();
      return undefined;
   }
   var _loc2_ = guideContainer[uiName + "_" + id];
   if(tooltipStr == undefined || tooltipStr == "" || type == "-1")
   {
      _loc2_.removeMovieClip();
      return undefined;
   }
   if(!_loc2_)
   {
      _loc2_ = guideContainer.attachMovie("GuideToolTip",uiName + "_" + id,guideContainer.getNextHighestDepth());
   }
   _loc2_.clear();
   _loc2_.parentMc = _loc7_;
   _loc2_.posX = posX;
   _loc2_.posY = posY;
   _loc2_.gType = type;
   _loc2_.tipMc.tipText.autoSize = true;
   _loc2_.tipMc.tipText.htmlText = tooltipStr;
   _loc2_.tipMc.bg._width = _loc2_.tipMc.tipText.textWidth + 40;
   _loc2_.tipMc.bg._height = _loc2_.tipMc.tipText.textHeight + 40;
   if(type < 3)
   {
      _loc2_.tipMc._x = -30 - (Number(type) - 1) * (_loc2_.tipMc.bg._width - 50);
      _loc2_.tipMc._y = - _loc2_.tipMc._height + 25;
   }
   else if(type < 5)
   {
      _loc2_.tipMc._x = -25 - _loc2_.tipMc.bg._width;
      _loc2_.tipMc._y = -25 - (type - 3) * (_loc2_.tipMc.bg._height - 45);
   }
   else if(type < 7)
   {
      _loc2_.tipMc._x = -30 - (type - 5) * (_loc2_.tipMc.bg._width - 50);
      _loc2_.tipMc._y = 15;
   }
   else
   {
      _loc2_.tipMc._x = 20;
      _loc2_.tipMc._y = -30 - (type - 7) * (_loc2_.tipMc.bg._height - 50);
   }
   _loc2_.arrowMc.gotoAndStop(type);
   if(guideLine)
   {
      var _loc4_ = lib.util.ExtString.split(guideLine,"\t");
      var _loc6_ = _loc4_[0];
      var _loc5_ = _loc4_[1];
      var _loc9_ = _loc4_[2] - _loc6_;
      var _loc8_ = _loc4_[3] - _loc5_;
      _loc2_.lineStyle(2,16763904,100);
      _loc2_.moveTo(_loc6_,_loc5_);
      _loc2_.lineTo(_loc9_,_loc5_);
      _loc2_.lineTo(_loc9_,_loc8_);
      _loc2_.lineTo(_loc6_,_loc8_);
      _loc2_.lineTo(_loc6_,_loc5_);
   }
   setGuidePosition();
};
var selectedToolTip = null;
myListener.OnGame_EpToolTip_Close = function()
{
   gs.TweenLite.killTweensOf(guideContainer.epToolTip,false);
   collectionContainerMc.collectionToolTip.removeMovieClip();
};
myListener.OnGame_EpToolTip_Open = function(infoData, txt, skillData)
{
   if(!_global.gbUIMode)
   {
      return undefined;
   }
   var _loc4_ = lib.util.ExtString.split(infoData,"\t");
   var _loc9_ = _loc4_[2];
   var _loc2_ = "<TooltipHeader type=\'0\' icon=\'0\' /><section name=\'name\'><ItemSlot img=\'" + _loc9_ + "\' grade=\'0\' xp=\'-1\'><br></section><section name=\'desc\'><section name=\'crest\'></section>";
   var _loc14_ = lib.util.ExtString.findTag(_loc2_,"section");
   var _loc11_ = _loc2_.indexOf("<");
   var _loc6_ = _loc2_.indexOf(">") + 1;
   var _loc12_ = _loc2_.length;
   var _loc7_ = _loc2_.substring(_loc11_,_loc6_);
   _loc2_ = _loc2_.substring(_loc6_,_loc12_);
   var _loc3_ = toolTipMc;
   headerObjS = lib.util.ExtString.findTag(_loc7_,"TooltipHeader");
   var _loc5_ = Number(headerObjS[0].type);
   compareIcon = Number(headerObjS[0].icon);
   if(isNaN(compareIcon))
   {
      compareIcon = 0;
   }
   hideToolTip();
   var _loc10_ = lib.util.ExtString.findTag(_loc2_,"ItemSlot");
   SetSlotDraw(_loc3_,_loc10_,64);
   _loc3_.tipText.htmlText = _loc2_;
   insertSection(_loc3_.tipText,_loc2_,"section",_loc5_ == 2);
   inputMaker(_loc3_.Fddesc,_loc2_,"maker");
   clearCoolTime(_loc3_,_loc2_);
   checkCoolTime(_loc3_,_loc2_);
   displayToolTip(_loc3_,_loc5_);
   _loc3_.bg._height = 160;
   var _loc13_ = 10;
   var _loc8_ = (g4.view.tooltip.ToolTip_EPGroup)_loc3_.attachMovie("g4.view.tooltip.ToolTip_EPGroup","epGroup",1);
   _loc8_.setData(txt,_loc4_,skillData);
};
ToGame_ToolTip_Init();
