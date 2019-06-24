function setFilterEvent(index)
{
   var _loc5_ = index - 1;
   var _loc4_ = container_mc["filter_" + _loc5_];
   var _loc2_ = container_mc["filter_" + index];
   var _loc6_ = 0 >= index?FILTER_START_POS_X:_loc4_._x + _loc4_._width + 30;
   _loc2_.txt.htmlText = filterStrArray[index];
   _loc2_._x = _loc6_;
   _loc2_._y = FILTER_POS_Y;
   _loc2_.txt._width = _loc2_.txt.textWidth + 5;
   _loc2_.id = filterStrId[index];
   _loc2_.onChanged = function(checked)
   {
      ToGame_Orders_ChangeFilter(this.id,Number(checked));
   };
}
function setBonusComponentEvent(targetMc, index)
{
   targetMc.button.id = index;
   targetMc.txtBtn = new lib.util.TxtBtn(targetMc.button.mc,targetMc.button.tf);
   targetMc.txtBtn.setTextColor("0xADD7FF","0xC1E0FF","0xADD7FF",lib.info.TextColor.BTN_UINIQUE_DISABLE);
   targetMc.button.mc.onRelease2 = function()
   {
      var _loc2_ = this._parent.id;
      ToGame_Orders_ClickReceiveButton(_loc2_);
   };
   var _loc3_ = 0 != index?bonusTimeToolTip_1:bonusTimeToolTip_0;
   lib.manager.ToolTip.add(targetMc.timeTF,_loc3_,1);
}
function clearBonus(targetMc)
{
   targetMc.timeTF.text = "";
   targetMc.countTF.text = "";
   targetMc.mask._width = BONUS_GAUGE_MASK_WIDTH;
   lib.manager.ToolTip.remove(targetMc.countTF);
   lib.manager.ToolTip.remove(targetMc.titleTF);
   targetMc.gaugeDisabled._visible = targetMc.gaugeBarDisabled._visible = targetMc.disableBg._visible = false;
   targetMc.rewardIconMc.clear();
   var _loc1_ = 0;
   while(_loc1_ < MAX_COUNT_BONUS_REWARD)
   {
      var _loc3_ = targetMc["rewardHit_" + _loc1_];
      var _loc4_ = targetMc["rewardTF_" + _loc1_];
      var _loc5_ = targetMc["slotDisabled_" + _loc1_];
      _loc3_._visible = _loc4_._visible = _loc5_._visible = false;
      lib.manager.ToolTip.remove(_loc3_);
      _loc4_.text = "";
      _loc1_ = _loc1_ + 1;
   }
   if(targetMc.completeEventMc)
   {
      gs.TweenLite.killTweensOf(targetMc.completeEventMc,false);
      targetMc.completeEventMc._visible = false;
      targetMc.completeEventMc._alpha = 0;
   }
}
function setBonus(targetMc, type, titleStr, timeStr, min, max, reward, buttonState, mode)
{
   clearBonus(targetMc);
   type = Number(type);
   var _loc14_ = "(" + min + "/" + max + ")";
   _loc14_ = mode != 2?_loc14_:bonusGaugeStr;
   var _loc18_ = mode != 1?"0xFFFFFF":"0x777777";
   targetMc.titleTF.text = titleStr;
   targetMc.timeTF.text = bonusTimeStr + " " + timeStr;
   targetMc.timeTF.textColor = _loc18_;
   targetMc.countTF.text = _loc14_;
   min = Number(min);
   max = Number(max);
   targetMc.mask._width = min / max * BONUS_GAUGE_MASK_WIDTH;
   var _loc21_ = 0 != type?"$690015":"$690014";
   var _loc20_ = lib.util.UIString.getUIString(_loc21_,"count",max);
   lib.manager.ToolTip.add(targetMc.titleTF,_loc20_,1);
   if(2 == mode)
   {
      var _loc19_ = lib.util.UIString.getUIString("$690016");
      lib.manager.ToolTip.add(targetMc.countTF,_loc19_,1);
   }
   buttonState = Boolean(Number(buttonState));
   targetMc.txtBtn.setEnabled(buttonState == 0);
   var _loc16_ = buttonState == 0;
   var _loc8_ = targetMc.completeEventMc;
   if(_loc16_)
   {
      if(undefined == _loc8_)
      {
         _loc8_ = targetMc.attachMovie("bonusButton_Effect","completeEventMc",targetMc.getNextHighestDepth());
         _loc8_.hitTestDisable = true;
         _loc8_._x = 204;
         _loc8_._y = 235;
      }
      _loc8_._visible = true;
      _loc8_._alpha = 0;
      playCompleteEffect(_loc8_);
   }
   if(false == _loc16_ && _loc8_)
   {
      _loc8_.removeMovieClip();
   }
   targetMc.disableBg._visible = max <= min;
   targetMc.gaugeDisabled._visible = targetMc.gaugeBarDisabled._visible = mode != 0;
   var _loc12_ = targetMc.rewardIconMc;
   var _loc10_ = lib.util.ExtString.split(reward,"\n");
   var _loc11_ = _loc10_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc11_)
   {
      var _loc5_ = targetMc["rewardHit_" + _loc2_];
      var _loc6_ = targetMc["rewardTF_" + _loc2_];
      var _loc7_ = targetMc["slotDisabled_" + _loc2_];
      var _loc3_ = lib.util.ExtString.split(_loc10_[_loc2_],"\t");
      var _loc1_ = new Object();
      _loc1_.itemId = _loc3_[0];
      _loc1_.itemType = _loc3_[1];
      _loc1_.itemName = _loc3_[2];
      _loc1_.itemImg = _loc3_[3];
      _loc1_.itemImgBD = flash.display.BitmapData.loadBitmap(_loc1_.itemImg);
      _loc1_.itemGrade = _loc3_[4];
      _loc1_.itemCount = _loc3_[5];
      drawRewardSlot(_loc5_,_loc6_,_loc12_,_loc1_,_loc2_,REWARD_SLOT_TYPE_BONUS);
      _loc7_._visible = mode == 1;
      _loc2_ = _loc2_ + 1;
   }
}
function changeOrdersViewMode(id)
{
   var _loc8_ = ordersData[id];
   var _loc1_ = container_mc.renderersContainer["renderer_" + id];
   var _loc4_ = _loc1_._currentframe;
   if(0 == currentViewMode && 1 == _loc4_ % 2)
   {
      return undefined;
   }
   if(1 == currentViewMode && 0 == _loc4_ % 2)
   {
      return undefined;
   }
   var _loc5_ = 0 != currentViewMode?_loc4_ + 1:_loc4_ - 1;
   _loc1_.gotoAndStop(_loc5_);
   var _loc6_ = LIST_HEIGTH_ARRAY[_loc5_];
   _loc1_.hit._height = _loc6_;
   _loc1_.overMc._height = _loc6_ + 12;
   _loc1_.completeOverMc._height = _loc6_ - 4;
   var _loc7_ = _loc8_.expReward;
   var _loc3_ = 0 != currentViewMode?55:106;
   _loc3_ = 0 >= _loc7_?_loc3_ + 21:_loc3_;
   _loc1_.progressTF._y = 0 != currentViewMode?26:54;
   _loc1_.btn._y = 0 != currentViewMode?62:114;
   _loc1_.goldTF._y = _loc3_;
   _loc1_.expTF._y = 0 != currentViewMode?76:127;
   _loc1_.goldBg._y = _loc3_ + 1;
   _loc1_.expBg._y = 0 != currentViewMode?76:127;
   _loc1_.rewardIconMc._y = 0 != currentViewMode?60:111;
   var _loc2_ = 0;
   while(_loc2_ < MAX_COUNT_REWARD)
   {
      _loc1_["rewardHit_" + _loc2_]._y = 0 != currentViewMode?60:111;
      _loc1_["rewardTF_" + _loc2_]._y = 0 != currentViewMode?81:132;
      _loc2_ = _loc2_ + 1;
   }
   if(_loc1_.icons != undefined)
   {
      _loc1_.icons._y = 0 != currentViewMode?17:45;
   }
   if(_loc1_.buttonCompleteEffect != undefined)
   {
      _loc1_.buttonCompleteEffect._y = 0 != currentViewMode?64:116;
   }
   if(2 < _loc5_)
   {
      _loc1_.plusRewardTitleTF._y = 0 != currentViewMode?121:183;
      _loc1_.timeTF._y = 0 != currentViewMode?122:184;
      _loc1_.plusRewardIconMc._y = 0 != currentViewMode?113:175;
      _loc2_ = 0;
      while(_loc2_ < MAX_COUNT_REWARD)
      {
         _loc1_["plusRewardHit_" + _loc2_]._y = 0 != currentViewMode?113:175;
         _loc1_["plusRewardTF_" + _loc2_]._y = 0 != currentViewMode?133:195;
         _loc2_ = _loc2_ + 1;
      }
   }
   _loc1_.descTF._visible = 0 == currentViewMode;
   _loc1_.textBg._visible = 0 == currentViewMode;
   _loc1_.imgMc._visible = 0 == currentViewMode;
}
function changeViewMode()
{
   var _loc3_ = ordersRenderers.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc2_ = ordersRenderers[_loc1_];
      changeOrdersViewMode(_loc2_);
      _loc1_ = _loc1_ + 1;
   }
   alignOrdersRenderers();
}
function setViewButton()
{
   var _loc1_ = 0;
   while(_loc1_ < 2)
   {
      var _loc2_ = container_mc["viewButton_" + _loc1_];
      var _loc3_ = _loc2_.id != currentViewMode?1:3;
      _loc2_.gotoAndStop(_loc3_);
      _loc1_ = _loc1_ + 1;
   }
}
function setMouseEvent(button)
{
   setRollOver(button);
   setRollOut(button);
   setPress(button);
   setRelease(button);
   setReleaseOutside(button);
}
function setRollOver(button)
{
   button.onRollOver = function()
   {
      if(this.id == currentViewMode)
      {
         return undefined;
      }
      this.gotoAndStop(2);
   };
}
function setRollOut(button)
{
   button.onRollOut = function()
   {
      if(this.id == currentViewMode)
      {
         return undefined;
      }
      var _loc2_ = this.id != currentViewMode?1:3;
      this.gotoAndStop(_loc2_);
   };
}
function setPress(button)
{
   button.onPress = function()
   {
      if(this.id == currentViewMode)
      {
         return undefined;
      }
      this.gotoAndStop(3);
   };
}
function setRelease(button)
{
   button.onRelease = function()
   {
      if(this.id == currentViewMode)
      {
         return undefined;
      }
      lib.manager.UISound.play(UI.btnSound);
      currentViewMode = this.id;
      ToGame_Orders_ChangeViewMode(this.id);
      setViewButton();
      changeViewMode();
   };
}
function getIndexById(id)
{
   var _loc2_ = ordersRenderers.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      if(ordersRenderers[_loc1_] == id)
      {
         return _loc1_;
      }
      _loc1_ = _loc1_ + 1;
   }
   return -1;
}
function setDetailButtonEvent(target)
{
   target.setType = function(type)
   {
      type = Number(type);
      this.type = type;
      this.gotoAndStop(type + 1);
      this.hit._width = this.tf._width = DETAIL_BUTTON_WIDTH[type];
   };
   target.isDisabled = function()
   {
      return this.mc._currentframe == BUTTON_STATE_DISABLE;
   };
   target.setEnabled = function(bEnabled)
   {
      var _loc5_ = this.type;
      bEnabled = Boolean(Number(bEnabled));
      var _loc3_ = !bEnabled?BUTTON_STATE_DISABLE:BUTTON_STATE_NORMAL;
      var _loc4_ = !bEnabled?lib.info.TextColor.BTN_UINIQUE_DISABLE:DETAIL_BUTTON_TEXT_COLOR[_loc5_];
      this.tf.textColor = _loc4_;
      this.mc.gotoAndStop(_loc3_);
   };
   target.hit.onRollOver = function()
   {
      var _loc3_ = this._parent.isDisabled();
      if(_loc3_)
      {
         return undefined;
      }
      var _loc4_ = this._parent.type;
      var _loc2_ = BUTTON_STATE_OVER;
      this._parent.tf.textColor = "0xFFECA8";
      this._parent.mc.gotoAndStop(_loc2_);
   };
   target.hit.onRollOut = target.hit.onReleaseOutside = function()
   {
      var _loc3_ = this._parent.isDisabled();
      if(_loc3_)
      {
         return undefined;
      }
      var _loc4_ = this._parent.type;
      var _loc2_ = BUTTON_STATE_NORMAL;
      this._parent.tf.textColor = DETAIL_BUTTON_TEXT_COLOR[_loc4_];
      this._parent.mc.gotoAndStop(_loc2_);
   };
   target.hit.onPress = function()
   {
      var _loc3_ = this._parent.isDisabled();
      if(_loc3_)
      {
         return undefined;
      }
      var _loc4_ = this._parent.type;
      var _loc2_ = BUTTON_STATE_PRESS;
      this._parent.tf.textColor = DETAIL_BUTTON_TEXT_COLOR[_loc4_];
      this._parent.mc.gotoAndStop(_loc2_);
   };
   target.hit.onRelease = function()
   {
      var _loc3_ = this._parent.isDisabled();
      if(_loc3_)
      {
         return undefined;
      }
      var _loc4_ = this._parent.type;
      var _loc2_ = BUTTON_STATE_NORMAL;
      this._parent.tf.textColor = DETAIL_BUTTON_TEXT_COLOR[_loc4_];
      this._parent.mc.gotoAndStop(_loc2_);
      ToGame_Orders_ClickDetailPageButton(this._parent.id);
   };
}
function initDetailMc()
{
   var _loc4_ = container_mc.detail_mc;
   var _loc3_ = _loc4_.container;
   container_mc.disable._visible = false;
   _loc4_.closeBtn.onLoad = function()
   {
      this.txtBtn = new lib.util.TxtBtn(this);
      this.txtBtn.setRelease(ToGame_Orders_CloseDetailPage);
   };
   _loc4_.descTF.verticalAlign = "center";
   _loc4_.button_0.onLoad = _loc4_.button_1.onLoad = _loc4_.button_2.onLoad = function()
   {
      setDetailButtonEvent(this);
      this.setType(DETAIL_BUTTON_TYPE_RED);
      this.tfY = this.tf._y;
   };
   var _loc2_ = 0;
   while(_loc2_ < 12)
   {
      contanerMc.plusReward["slot_" + _loc2_].onLoad = _loc3_.reward["slot_" + _loc2_].onLoad = _loc3_.equip["slot_" + _loc2_].onLoad = function()
      {
         this.centerTF.verticalAlign = "center";
      };
      _loc2_ = _loc2_ + 1;
   }
   _loc3_.reward.onLoad = function()
   {
      this.titleTF.text = rewardTitleStr;
   };
   _loc3_.plusReward.onLoad = function()
   {
      this.titleTF.textColor = "0xffd427";
   };
   _loc3_.equip.onLoad = function()
   {
      this.titleTF.text = acquireEquipTitleStr;
   };
   _loc3_.dungeonInfo.onLoad = function()
   {
      this.tf_0._x = this.nameTF_0.textWidth + 10;
      this.tf_1._x = this.nameTF_1.textWidth + 10;
   };
   _loc3_.info_0.onLoad = _loc3_.info_1.onLoad = function()
   {
      this.nameTF.verticalAlign = "center";
      this.valueTF.verticalAlign = "center";
   };
   _loc3_.difficultyInfo.onLoad = function()
   {
      this.nameTF.verticalAlign = "center";
   };
   _loc3_.onLoad = function()
   {
      if(bLoad)
      {
         setDetailScroll();
      }
      bLoad = true;
   };
   _loc4_.scroll.onLoad = function()
   {
      if(bLoad)
      {
         setDetailScroll();
      }
      bLoad = true;
   };
   _loc4_._visible = false;
}
function setDetailScroll()
{
   detailScrollBar = container_mc.detail_mc.scroll;
   detailScrollBar.addListener(container_mc.detail_mc.container);
   detailContainerY = container_mc.detail_mc.container._y;
   container_mc.detail_mc.container.onScroll = function()
   {
      container_mc.detail_mc.container._y = detailContainerY - arguments[0];
   };
   detailScrollBar.setWheel(container_mc.detail_mc.container);
   detailScrollBar.wheelDelta = 1;
   detailScrollBar.pageSize = 0;
   detailScrollBar.displaySize = container_mc.detail_mc.mask._height;
   detailScrollBar.defaultBarSizeRatio = 0.3333333333333333;
   detailScrollBar.rowHeightLimit = false;
   detailScrollBar.rowHeight = 100;
   detailScrollBar.scroll = 0;
}
function drawDetailSlot(slot, info, bEquip)
{
   var _loc15_ = info.itemId;
   var _loc10_ = Number(info.itemType);
   var _loc2_ = info.itemName;
   var _loc17_ = info.itemImg;
   var _loc14_ = info.itemImgBD;
   var _loc9_ = info.itemGrade;
   var _loc5_ = info.itemCount;
   lib.manager.ToolTip.remove(slot.hit);
   slot.icon.clear();
   slot.nameTF.text = slot.centerTF.text = slot.countTF.text = "";
   var _loc12_ = ITEM_TYPE_NORMAL != _loc10_?1:6;
   var _loc4_ = String(_loc5_);
   var _loc3_ = "";
   var _loc7_ = slot.nameTF;
   switch(_loc10_)
   {
      case ITEM_TYPE_NORMAL:
         _loc3_ = _loc15_;
         break;
      case ITEM_TYPE_EP_POINT:
         _loc7_ = slot.centerTF;
         _loc3_ = _loc2_;
         _loc4_ = "";
         break;
      case ITEM_TYPE_REPUTATION:
         _loc2_ = "<font color=\'#00B4FF\'>" + _loc2_ + "</font>";
         var _loc16_ = lib.util.CurrencyFormat.makeComma(_loc5_);
         _loc4_ = "<font color=\'#007EFF\'>" + _loc16_ + "</font>";
         _loc3_ = _loc2_ + " : " + _loc5_;
         break;
      case ITEM_TYPE_PRODUCTION_POINT:
         _loc3_ = _loc2_ + " : " + _loc5_;
         break;
      case ITEM_TYPE_MONEY:
         _loc7_ = slot.centerTF;
         var _loc13_ = lib.util.GoldCurrency.SetGoldText(_loc5_,0,0,0,0);
         var _loc8_ = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc13_ + "</font>";
         _loc3_ = _loc2_ + " : " + _loc8_;
         _loc2_ = _loc8_;
         _loc4_ = "";
         break;
      case ITEM_TYPE_EXP:
         _loc7_ = slot.centerTF;
         var _loc11_ = lib.util.CurrencyFormat.makeComma(_loc5_);
         _loc3_ = _loc2_ + " : " + _loc11_;
         _loc2_ = "<font color=\'#60F0F0\'>" + _loc11_ + "</font>";
         _loc4_ = "";
   }
   if(bEquip)
   {
      _loc7_ = slot.centerTF;
      _loc4_ = "";
   }
   lib.display.DrawBitmapData.draw(slot.icon,_loc14_,0,0,0,0,52,52,0.8125);
   slot.countTF.htmlText = _loc4_;
   _loc7_.htmlText = _loc2_;
   if(0 < _loc9_)
   {
      lib.display.DrawBitmapData.draw(slot.icon,UI["gradeBD_" + _loc9_],0,0,0,0,11,11,0.9454545454545454);
   }
   lib.manager.ToolTip.add(slot.hit,_loc3_,_loc12_);
   slot._visible = true;
}
function drawDetailSlotList(container, array, slotType, bEquip)
{
   var _loc5_ = detailSlotCol[slotType];
   var _loc4_ = array.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc3_ = container["slot_" + _loc1_];
      var _loc2_ = array[_loc1_];
      _loc3_._x = detailItemSlotStartX + _loc1_ % _loc5_ * (detailItemSlotWidth + detailItemSlotSpace);
      _loc3_._y = detailItemSlotStartY + int(_loc1_ / _loc5_) * (detailItemSlotHeight + detailItemSlotSpace);
      drawDetailSlot(_loc3_,_loc2_,bEquip);
      _loc1_ = _loc1_ + 1;
   }
   var _loc7_ = !bEquip?MAX_COUNT_DETAIL_SLOT:MAX_COUNT_DETAIL_EQUIP_SLOT;
   _loc1_ = _loc4_;
   while(_loc1_ < _loc7_)
   {
      _loc3_ = container["slot_" + _loc1_];
      _loc3_._visible = false;
      _loc1_ = _loc1_ + 1;
   }
}
function AlignDetailTitle()
{
   var _loc1_ = container_mc.detail_mc;
   var _loc4_ = _loc1_.level._x;
   var _loc2_ = _loc1_.titleTF._x + _loc1_.titleTF._width - _loc4_;
   _loc2_ = !_loc1_.recommendMc._visible?_loc2_:_loc2_ + 26;
   var _loc3_ = (DETAIL_BG_WIDTH - _loc2_) / 2;
   _loc1_.level._x = _loc1_.level._x + _loc3_;
   _loc1_.party._x = _loc1_.party._x + _loc3_;
   _loc1_.titleTF._x = _loc1_.titleTF._x + _loc3_;
   _loc1_.recommendMc._x = _loc1_.recommendMc._x + _loc3_;
}
function setDetailTitle(ordersType, titleStr, minLevel, maxLevel, partyNum, bRecommend)
{
   var _loc1_ = container_mc.detail_mc;
   var _loc2_ = 0;
   var _loc8_ = maxLevel == -1?1:2;
   var _loc6_ = maxLevel == -1?String(minLevel):String(minLevel) + "~" + String(maxLevel);
   _loc1_.level.gotoAndStop(_loc8_);
   _loc1_.level.tf.text = _loc6_;
   _loc1_.level._x = _loc2_;
   _loc2_ = _loc1_.level._x + _loc1_.level._width + 8;
   _loc1_.party._x = _loc1_.titleTF._x = _loc2_;
   var _loc7_ = 1 >= partyNum?1:partyNum;
   var _loc5_ = !(1 < partyNum && partyNum <= 20)?"":partyNum;
   _loc1_.party.gotoAndStop(_loc7_);
   _loc1_.party.tf.text = _loc5_;
   _loc1_.party._visible = 1 < partyNum;
   _loc1_.titleTF._x = 1 >= partyNum?_loc2_:_loc2_ + _loc1_.party._width + 5;
   _loc1_.titleTF.htmlText = ordersTypeTitleStr[ordersType] + " " + titleStr;
   _loc1_.titleTF._width = _loc1_.titleTF.textWidth + 5;
   _loc1_.recommendMc._visible = bRecommend;
   _loc1_.recommendMc._x = _loc1_.titleTF._x + _loc1_.titleTF._width + 3;
   AlignDetailTitle();
}
function clearDetailMc(type)
{
   detailScrollBar.scroll = 0;
   var _loc3_ = container_mc.detail_mc;
   _loc3_.party._visible = ORDER_TYPE_SOLO != type;
   _loc3_.line._visible = ORDER_TYPE_SOLO != type;
   _loc3_.recommendMc._visible = false;
   var _loc1_ = _loc3_.container;
   _loc1_.reward.titleLine._width = ORDER_TYPE_SOLO != type?663:935;
   _loc1_.equip._visible = ORDER_TYPE_DUNGEON == type;
   _loc1_.plusReward._visible = ORDER_TYPE_SOLO != type;
   _loc1_.difficultyInfo._visible = ORDER_TYPE_DUNGEON == type;
   _loc1_.info_0._visible = ORDER_TYPE_SOLO != type;
   _loc1_.info_1._visible = ORDER_TYPE_SOLO != type;
   lib.manager.ToolTip.remove(_loc1_.info_0);
   _loc1_.info_0._y = ORDER_TYPE_DUNGEON != type?DetailInfoPos0:DetailInfoPos1;
   _loc1_.info_1._y = ORDER_TYPE_DUNGEON != type?DetailInfoPos1:DetailInfoPos2;
   _loc1_.soloInfo._visible = ORDER_TYPE_SOLO == type;
   _loc1_.dungeonInfo._visible = ORDER_TYPE_DUNGEON == type;
   _loc1_.bfInfo._visible = ORDER_TYPE_BATTLEFIELD == type;
}
function setDetailPageButton(buttonParams)
{
   var _loc7_ = container_mc.detail_mc;
   var _loc12_ = lib.util.ExtString.split(buttonParams,"\n");
   var _loc6_ = _loc12_.length;
   var _loc5_ = 0;
   var _loc3_ = 0;
   while(_loc3_ < _loc6_)
   {
      var _loc9_ = _loc7_["button_" + _loc3_];
      var _loc1_ = lib.util.ExtString.split(_loc12_[_loc3_],"\t");
      var _loc11_ = _loc1_[0];
      var _loc10_ = _loc1_[1];
      var _loc8_ = _loc1_[2];
      var _loc4_ = _loc1_[3];
      var _loc2_ = _loc1_[4];
      lib.manager.ToolTip.remove(_loc9_.hit);
      _loc9_._x = _loc5_;
      _loc9_.id = _loc11_;
      _loc9_.setType(_loc4_);
      _loc9_.tf.text = _loc10_;
      _loc9_.setEnabled(_loc8_);
      _loc9_._visible = true;
      if(_loc2_ != "" && _loc2_ != undefined && _loc2_ != "undefined")
      {
         lib.manager.ToolTip.add(_loc9_.hit,_loc2_,1);
      }
      _loc5_ = _loc5_ + DETAIL_BUTTON_WIDTH[_loc4_] + 10;
      _loc3_ = _loc3_ + 1;
   }
   var _loc13_ = (DETAIL_BG_WIDTH - _loc5_ + 10) / 2;
   _loc3_ = 0;
   while(_loc3_ < _loc6_)
   {
      _loc9_ = _loc7_["button_" + _loc3_];
      _loc9_._x = _loc9_._x + _loc13_;
      _loc3_ = _loc3_ + 1;
   }
   _loc3_ = _loc6_;
   while(_loc3_ < MAX_COUNT_DETAIL_BUTTON)
   {
      _loc9_ = _loc7_["button_" + _loc3_];
      _loc9_._visible = false;
      _loc3_ = _loc3_ + 1;
   }
}
function removeOrdersRenderer(id)
{
   var _loc2_ = ordersRenderers.length;
   var _loc1_ = 0;
   _loc1_;
   while(_loc1_ < _loc2_)
   {
      if(id == ordersRenderers[_loc1_])
      {
         ordersRenderers.splice(_loc1_,1);
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   alignOrdersRenderers();
}
function alignOrdersRenderers()
{
   var _loc5_ = ordersRenderers.length;
   var _loc6_ = container_mc.renderersContainer;
   var _loc3_ = 0;
   lib.Debuger.trace("len : " + _loc5_);
   var _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc4_ = ordersRenderers[_loc1_];
      var _loc2_ = _loc6_["renderer_" + _loc4_];
      _loc2_._y = _loc3_;
      _loc3_ = _loc3_ + _loc2_.hit._height + 3;
      _loc1_ = _loc1_ + 1;
   }
   _loc6_.hit._height = _loc3_;
   scrollbar.pageSize = _loc3_;
}
function clearOrders(targetMc)
{
   targetMc.imgMc.clear();
   targetMc.titleTF.text = "";
   targetMc.level.tf.text = "";
   targetMc.descTF.text = "";
   targetMc.progressTF.text = "";
   lib.manager.ToolTip.remove(targetMc.progressTF);
   if(targetMc.buttonCompleteEffect)
   {
      gs.TweenLite.killTweensOf(targetMc.buttonCompleteEffect,false);
      targetMc.buttonCompleteEffect._visible = false;
      targetMc.buttonCompleteEffect._alpha = 0;
   }
   clearOrdersReward(targetMc);
   var _loc3_ = targetMc.btn.txtBtn;
   _loc3_.setVisible(true);
   _loc3_.setText("");
   _loc3_.setEnabled(true);
   targetMc.registQuestBtn.gotoAndStop(BUTTON_STATE_NORMAL);
   targetMc.textBg._visible = false;
   var _loc2_ = targetMc.icons;
   if(_loc2_)
   {
      _loc2_.gotoAndStop(1);
      _loc2_._visible = false;
   }
   lib.manager.ToolTip.remove(targetMc.btn);
   targetMc.id = undefined;
   targetMc.bRegistQuest = false;
}
function clearOrdersReward(mc)
{
   mc.gotoAndStop(3);
   mc.rewardIconMc.clear();
   mc.plusRewardIconMc.clear();
   var _loc1_ = 0;
   while(_loc1_ < MAX_COUNT_REWARD)
   {
      var _loc2_ = mc["rewardHit_" + _loc1_];
      _loc2_._visible = false;
      lib.manager.ToolTip.remove(_loc2_);
      mc["rewardTF_" + _loc1_].text = "";
      _loc2_ = mc["plusRewardHit_" + _loc1_];
      _loc2_._visible = false;
      lib.manager.ToolTip.remove(_loc2_);
      mc["plusRewardTF_" + _loc1_].text = "";
      _loc1_ = _loc1_ + 1;
   }
   mc.goldTF.text = "";
   mc.expTF.text = "";
   mc.plusRewardTitleTF.text = "";
   mc.timeTF.text = "";
   mc.goldTF._visible = true;
   mc.expTF._visible = true;
   mc.goldBg._visible = true;
   mc.expBg._visible = true;
}
function playCompleteEffect(target)
{
   var _loc5_ = target._alpha;
   var _loc2_ = 0 >= target._alpha?100:0;
   var _loc3_ = _loc2_ != 0?0.8:0.3;
   gs.TweenLite.to(target,_loc3_,{_alpha:_loc2_,onComplete:playCompleteEffect,onCompleteParams:[target]});
}
function setOrdersComponentEvent(mc)
{
   mc.btn.onLoad = function()
   {
      var _loc3_ = this._parent.id;
      var _loc4_ = ordersData[_loc3_];
      var _loc6_ = _loc4_.bComplete;
      var _loc5_ = !_loc6_?1:2;
      this.gotoAndStop(_loc5_);
      this.setDisabled = function(bFlag)
      {
         lib.Debuger.trace("this._currentframe : " + this._currentframe);
         var _loc2_ = this._currentframe != 2?"0xDCB83C":"0xADD7FF";
         _loc2_ = !bFlag?_loc2_:lib.info.TextColor.BTN_UINIQUE_DISABLE;
         var _loc3_ = !bFlag?1:4;
         this.tf.textColor = _loc2_;
         this.mc.gotoAndStop(_loc3_);
      };
      this.isDisabled = function()
      {
         return this.mc._currentframe == 4;
      };
      this.hit.onRollOver = function()
      {
         var _loc3_ = this._parent._parent;
         _loc3_.overMc._visible = true;
         if(this._parent.isDisabled())
         {
            return undefined;
         }
         var _loc2_ = this._parent._currentframe != 2?"0xFFECA8":"0xDDEEFF";
         this._parent.tf.textColor = _loc2_;
         this._parent.mc.gotoAndStop(2);
      };
      this.hit.onRollOut = this.hit.onReleaseOutside = function()
      {
         var _loc3_ = this._parent._parent;
         _loc3_.overMc._visible = false;
         if(this._parent.isDisabled())
         {
            return undefined;
         }
         var _loc2_ = this._parent._currentframe != 2?"0xDCB83C":"0xADD7FF";
         this._parent.tf.textColor = _loc2_;
         this._parent.mc.gotoAndStop(1);
      };
      this.hit.onPress = function()
      {
         if(this._parent.isDisabled())
         {
            return undefined;
         }
         var _loc2_ = this._parent._currentframe != 2?"0xDCB83C":"0xADD7FF";
         this._parent.tf.textColor = _loc2_;
         this._parent.mc.gotoAndStop(3);
      };
      this.hit.onRelease = function()
      {
         if(this._parent.isDisabled())
         {
            return undefined;
         }
         this._parent.mc.gotoAndStop(1);
         var _loc3_ = this._parent._parent;
         var _loc2_ = _loc3_.id;
         ToGame_Orders_ClickOrdersButton(_loc2_);
      };
      setButtonInfo(this);
   };
   mc.registQuestBtn.onLoad = function()
   {
      setRegistQuestBtnEvent(this._parent);
   };
   mc.overMc.onLoad = function()
   {
      this._visible = false;
      this.hitTestDisable = true;
      var _loc2_ = this._parent._currentframe;
      this._height = LIST_HEIGTH_ARRAY[_loc2_] + 12;
   };
   mc.completeMc.onLoad = function()
   {
      var _loc2_ = this._parent.id;
      var _loc3_ = ordersData[_loc2_];
      var _loc4_ = _loc3_.bComplete;
      this._visible = _loc4_;
      this.hitTestDisable = true;
   };
   mc.completeOverMc.onLoad = function()
   {
      var _loc2_ = this._parent.id;
      var _loc3_ = ordersData[_loc2_];
      var _loc5_ = _loc3_.bComplete;
      this._visible = _loc5_;
      this.hitTestDisable = true;
      var _loc4_ = this._parent._currentframe;
      this._height = LIST_HEIGTH_ARRAY[_loc4_] - 4;
   };
   mc.hit.onRollOver = function()
   {
      this._parent.overMc._visible = true;
   };
   mc.hit.onRollOut = mc.hit.onReleaseOutside = function()
   {
      this._parent.overMc._visible = false;
   };
   mc.hit.onRelease = function()
   {
      var _loc2_ = this._parent.id;
      ToGame_Orders_OpenDetailPage(_loc2_);
   };
}
function setRegistQuestBtnEvent(mc)
{
   mc.registQuestHit.onRollOver = function()
   {
      this._parent.overMc._visible = true;
      this._parent.registQuestBtn.gotoAndStop(BUTTON_STATE_OVER);
   };
   mc.registQuestHit.onRollOut = mc.registQuestHit.onReleaseOutside = function()
   {
      this._parent.overMc._visible = false;
      var _loc3_ = this._parent.bRegistQuest;
      var _loc2_ = !_loc3_?BUTTON_STATE_DISABLE:BUTTON_STATE_NORMAL;
      this._parent.registQuestBtn.gotoAndStop(_loc2_);
   };
   mc.registQuestHit.onRelease = function()
   {
      var _loc3_ = this._parent.id;
      ToGame_Orders_ClickRegistButton(_loc3_);
      var _loc2_ = this._parent.bRegistQuest;
      var _loc4_ = !_loc2_?BUTTON_STATE_NORMAL:BUTTON_STATE_DISABLE;
      this._parent.bRegistQuest = !_loc2_;
      this._parent.registQuestBtn.gotoAndStop(_loc4_);
   };
}
function drawRewardSlot(rewardHit, rewardTF, iconMc, info, index, slotType)
{
   var _loc15_ = info.itemId;
   var _loc5_ = info.itemType;
   var _loc9_ = info.itemName;
   var _loc17_ = info.itemImg;
   var _loc12_ = info.itemImgBD;
   var _loc8_ = info.itemGrade;
   var _loc6_ = info.itemCount;
   var _loc11_ = ITEM_TYPE_NORMAL != _loc5_?1:6;
   var _loc4_ = ITEM_TYPE_EP_POINT != _loc5_?_loc9_ + " : " + _loc6_:_loc9_;
   _loc4_ = ITEM_TYPE_NORMAL != _loc5_?_loc4_:_loc15_;
   rewardHit._visible = rewardTF._visible = true;
   var _loc2_ = REWARD_SLOT_DRAW_SIZE[slotType];
   var _loc10_ = REWARD_SLOT_SPACE[slotType];
   var _loc14_ = SLOT_ICON_SCALE[slotType];
   var _loc13_ = SLOT_GRADE_SCALE[slotType];
   var _loc16_ = slotType != 0?-1 * (_loc2_ + _loc10_):_loc2_ + _loc10_;
   var _loc7_ = index * _loc16_;
   lib.display.DrawBitmapData.draw(iconMc,_loc12_,_loc7_ + SLOT_ICON_START,SLOT_ICON_START,0,0,_loc2_ - 2,_loc2_ - 2,_loc14_);
   rewardTF.text = 0 >= _loc6_?"":_loc6_;
   if(0 < _loc8_)
   {
      lib.display.DrawBitmapData.draw(iconMc,UI["gradeBD_" + _loc8_],_loc7_ + SLOT_ICON_START,SLOT_ICON_START,0,0,11,11,_loc13_);
   }
   lib.manager.ToolTip.add(rewardHit,_loc4_,_loc11_);
}
function drawOrdersReward(mc)
{
   var _loc20_ = mc.id;
   var _loc13_ = ordersData[_loc20_];
   var _loc9_ = _loc13_.reward;
   var _loc11_ = _loc13_.plusReward;
   var _loc12_ = _loc9_.length;
   var _loc10_ = _loc11_.length;
   var _loc14_ = mc.rewardIconMc;
   var _loc15_ = mc.plusRewardIconMc;
   var _loc17_ = _loc13_.goldReward;
   var _loc16_ = _loc13_.expReward;
   var _loc22_ = _loc13_.plusRewardTimeStr;
   var _loc21_ = _loc13_.plusRewardCount;
   var _loc1_ = 0;
   while(_loc1_ < _loc12_)
   {
      var _loc3_ = _loc9_[_loc1_];
      var _loc7_ = mc["rewardHit_" + _loc1_];
      var _loc8_ = mc["rewardTF_" + _loc1_];
      drawRewardSlot(_loc7_,_loc8_,_loc14_,_loc3_,_loc1_,REWARD_SLOT_TYPE_ORDERS);
      _loc1_ = _loc1_ + 1;
   }
   if(0 < _loc10_)
   {
      _loc1_ = 0;
      while(_loc1_ < _loc10_)
      {
         var _loc5_ = _loc11_[_loc1_];
         var _loc4_ = mc["plusRewardHit_" + _loc1_];
         var _loc6_ = mc["plusRewardTF_" + _loc1_];
         drawRewardSlot(_loc4_,_loc6_,_loc15_,_loc5_,_loc1_,REWARD_SLOT_TYPE_ORDERS);
         _loc1_ = _loc1_ + 1;
      }
   }
   if(0 < _loc17_)
   {
      var _loc18_ = lib.util.GoldCurrency.SetGoldText(_loc17_,0,0,0,0);
      var _loc19_ = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc18_ + "</font>";
      mc.goldTF.htmlText = _loc19_;
   }
   else
   {
      mc.goldTF.htmlText = "-";
   }
   if(0 < _loc16_)
   {
      var _loc23_ = lib.util.CurrencyFormat.makeComma(_loc16_);
      mc.expTF.htmlText = _loc23_ + " XP";
   }
   mc.timeTF.text = _loc22_;
   mc.plusRewardTitleTF.text = lib.util.UIString.getUIString("$690029","count",_loc21_);
   mc.expTF._visible = mc.expBg._visible = 0 < _loc16_;
   mc.goldTF._y = mc.goldBg._y = 0 >= _loc16_?127:106;
   mc.expTF._y = mc.expBg._y = 127;
}
function drawOrders(id)
{
   var _loc1_ = container_mc.renderersContainer["renderer_" + id];
   if(undefined == _loc1_)
   {
      _loc1_ = container_mc.renderersContainer.attachMovie("ordersRenderer","renderer_" + id,container_mc.renderersContainer.getNextHighestDepth());
      setOrdersComponentEvent(_loc1_);
      clearOrders(_loc1_);
   }
   else
   {
      clearOrders(_loc1_);
   }
   var _loc2_ = ordersData[id];
   var _loc16_ = _loc2_.type;
   var _loc14_ = _loc2_.titleStr;
   var _loc18_ = _loc2_.minLevel;
   var _loc13_ = _loc2_.maxLevel;
   var _loc24_ = _loc2_.bRecommend;
   var _loc41_ = _loc2_.img;
   var _loc25_ = _loc2_.imgBD;
   var _loc26_ = _loc2_.descStr;
   var _loc31_ = _loc2_.curProgress;
   var _loc22_ = _loc2_.totalProgress;
   var _loc9_ = _loc2_.progressToolTip;
   var _loc20_ = _loc2_.bRegistQuest;
   var _loc39_ = _loc2_.reward;
   var _loc36_ = _loc2_.goldReward;
   var _loc37_ = _loc2_.expReward;
   var _loc35_ = _loc2_.plusReward;
   var _loc44_ = _loc2_.plusRewardTimeStr;
   var _loc40_ = _loc2_.plusRewardCount;
   var _loc42_ = _loc2_.buttonState;
   var _loc43_ = _loc2_.buttonStr;
   var _loc23_ = _loc2_.buttonEffectType;
   var _loc38_ = BUTTON_EFFECT_TYPE_NONE != _loc23_;
   var _loc10_ = _loc2_.buttonToolTip;
   var _loc4_ = _loc2_.bComplete;
   _loc1_.id = id;
   _loc1_.bRegistQuest = _loc20_;
   _loc14_ = ordersTypeTitleStr[_loc16_] + " " + _loc14_;
   _loc1_.completeMc._visible = _loc4_;
   _loc1_.completeOverMc._visible = _loc4_;
   _loc1_.registQuestHit._visible = ORDER_TYPE_STORY != _loc16_ && !_loc4_;
   _loc1_.registQuestBtn._visible = ORDER_TYPE_STORY != _loc16_ && !_loc4_;
   var _loc27_ = !_loc4_?1:2;
   _loc1_.btn.gotoAndStop(_loc27_);
   lib.display.DrawBitmapData.draw(_loc1_.imgMc,_loc25_,331,3,0,0,ORDERS_IMAGE_DRAW_WIDTH,ORDERS_IMAGE_DRAW_HEIGHT,ORDERS_IMAGE_DRAW_WIDTH / 512);
   var _loc32_ = 0 >= _loc35_.length?false:true;
   var _loc19_ = !_loc32_?1:3;
   _loc1_.gotoAndStop(_loc19_);
   var _loc15_ = LIST_HEIGTH_ARRAY[_loc19_];
   _loc1_.hit._height = _loc15_;
   _loc1_.completeOverMc._height = _loc15_ - 4;
   _loc1_.overMc._height = _loc15_ + 12;
   var _loc6_ = false;
   var _loc7_ = "";
   if(_loc4_)
   {
      _loc7_ = iconCompleteStr;
      _loc6_ = true;
   }
   else if(BUTTON_EFFECT_TYPE_MATCHING == _loc23_)
   {
      _loc7_ = iconMatchingStr;
      _loc6_ = true;
   }
   else if(1 < _loc22_)
   {
      _loc7_ = lib.util.UIString.getUIString("$690032","cur",_loc31_,"max",_loc22_);
   }
   _loc1_.progressTF.text = _loc7_;
   var _loc8_ = _loc1_.progressTF.textWidth;
   _loc1_.progressTF._width = _loc8_ + 5;
   _loc8_ = !_loc6_?_loc8_:38 + _loc8_ + 5;
   var _loc11_ = 708 - _loc8_ / 2;
   var _loc5_ = _loc1_.icons;
   if(_loc6_)
   {
      if(undefined == _loc5_)
      {
         _loc5_ = _loc1_.attachMovie("icons","icons",_loc1_.getNextHighestDepth());
         _loc5_._y = 45;
      }
      var _loc28_ = !_loc4_?1:2;
      _loc5_.gotoAndStop(_loc28_);
      _loc5_._x = _loc11_;
      _loc5_._visible = true;
      _loc11_ = _loc11_ + 38 + 5;
   }
   _loc1_.progressTF._x = _loc11_;
   if(_loc5_ && _loc6_ == false)
   {
      _loc5_.removeMovieClip();
   }
   _loc1_.textBg._visible = _loc7_ != "";
   var _loc3_ = _loc1_.buttonCompleteEffect;
   if(_loc4_)
   {
      if(undefined == _loc3_)
      {
         _loc3_ = _loc1_.attachMovie("buttonCompleteEffect","buttonCompleteEffect",_loc1_.getNextHighestDepth());
         _loc3_.hitTestDisable = true;
         _loc3_._x = 630.5;
         _loc3_._y = 116;
      }
      _loc3_._visible = true;
      _loc3_._alpha = 0;
      playCompleteEffect(_loc3_);
   }
   if(false == _loc4_ && _loc3_)
   {
      _loc3_.removeMovieClip();
   }
   _loc1_.descTF._width = MAX_POS_TEXTFIELD - _loc1_.descTF._x;
   _loc1_.descTF.setText(_loc26_);
   var _loc33_ = !_loc4_?"0x646464":"0x222222";
   _loc1_.descTF.textColor = _loc33_;
   if(_loc9_ != undefined && _loc9_ != "" && _loc9_ != "undefined")
   {
      lib.manager.ToolTip.add(_loc1_.progressTF,_loc9_,1);
   }
   var _loc30_ = _loc13_ == -1?String(_loc18_):String(_loc18_) + "~" + String(_loc13_);
   var _loc34_ = _loc13_ == -1?1:2;
   _loc1_.level.gotoAndStop(_loc34_);
   _loc1_.level.tf.text = _loc30_;
   var _loc12_ = _loc1_.level._x + _loc1_.level._width + 5;
   _loc1_.titleTF._x = _loc12_;
   var _loc21_ = !_loc24_?MAX_POS_TEXTFIELD - _loc12_:MAX_POS_TEXTFIELD - _loc12_ - 25;
   _loc1_.titleTF._width = _loc21_;
   _loc1_.titleTF.setText(_loc14_);
   _loc1_.titleTF._width = _loc21_ + 5;
   _loc1_.recommendMc._visible = _loc24_;
   _loc1_.recommendMc._x = _loc12_ + _loc1_.titleTF.textWidth + 5;
   setButtonInfo(_loc1_.btn);
   if(undefined != _loc10_ && "" != _loc10_ && "undefined" != _loc10_)
   {
      lib.manager.ToolTip.add(_loc1_.btn,_loc10_,98);
   }
   var _loc29_ = !_loc20_?4:1;
   _loc1_.registQuestBtn.gotoAndStop(_loc29_);
   drawOrdersReward(_loc1_);
}
function setButtonInfo(targetButton)
{
   var _loc4_ = targetButton._parent.id;
   var _loc1_ = ordersData[_loc4_];
   var _loc6_ = _loc1_.buttonStr;
   var _loc3_ = _loc1_.buttonState;
   var _loc5_ = !_loc1_.bComplete?1:2;
   targetButton.gotoAndStop(_loc5_);
   targetButton.tf.text = _loc6_;
   targetButton._visible = _loc3_ != 0;
   targetButton.setDisabled(_loc3_ == 1);
}
function tweenButtonEffect(mc)
{
   var _loc1_ = mc._alpha;
   _loc1_ = 50 >= _loc1_?100:0;
   gs.TweenLite.to(mc,0.7,{_alpha:_loc1_,ease:gs.easing.Strong.easeOut,onComplete:tweenButtonEffect,onCompleteParams:[mc]});
}
function ToGame_Orders_Init()
{
   fscommand("ToGame_Orders_Init");
}
function ToGame_Orders_CloseUI()
{
   fscommand("ToGame_Orders_CloseUI");
}
function ToGame_Orders_ClickOrdersButton(id)
{
   getURL("FSCommand:ToGame_Orders_ClickOrdersButton",id);
}
function ToGame_Orders_ClickRegistButton(id)
{
   getURL("FSCommand:ToGame_Orders_ClickRegistButton",id);
}
function ToGame_Orders_ChangeFilter(id, bChecked)
{
   getURL("FSCommand:ToGame_Orders_ChangeFilter",id + "\t" + String(bChecked));
}
function ToGame_Orders_ClickPlusReward(id)
{
   getURL("FSCommand:ToGame_Orders_ClickPlusReward",id);
}
function ToGame_Orders_ClickReceiveButton(id)
{
   getURL("FSCommand:ToGame_Orders_ClickReceiveButton",id);
}
function ToGame_Orders_OpenReputationStore()
{
   fscommand("ToGame_Orders_OpenReputationStore");
}
function ToGame_Orders_ClickDetailPageButton(id)
{
   getURL("FSCommand:ToGame_Orders_ClickDetailPageButton",id);
}
function ToGame_Orders_OpenDetailPage(id)
{
   getURL("FSCommand:ToGame_Orders_OpenDetailPage",id);
}
function ToGame_Orders_CloseDetailPage()
{
   container_mc.detail_mc._visible = false;
   container_mc.disable._visible = false;
   scrollbar.addListener(container_mc.renderersContainer);
   scrollbar.setWheel(container_mc.renderersContainer);
   fscommand("ToGame_Orders_CloseDetailPage");
}
function ToGame_Orders_ChangeViewMode(viewMode)
{
   lib.Debuger.trace("ToGame_Orders_ChangeViewMode : " + viewMode);
   getURL("FSCommand:ToGame_Orders_ChangeViewMode",viewMode);
}
function initialize()
{
}
var UI = this;
UI._visible = false;
var UIname = "Orders";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.disable.onRollOver = function()
{
};
container_mc.disable.onRelease = function()
{
   if(container_mc.detail_mc._visible)
   {
      ToGame_Orders_CloseDetailPage();
   }
};
var filterStr_0 = lib.util.UIString.getUIString("$690002");
var filterStr_1 = lib.util.UIString.getUIString("$690003");
var filterStr_2 = lib.util.UIString.getUIString("$690004");
var filterStr_3 = lib.util.UIString.getUIString("$690005");
var filterStr_4 = lib.util.UIString.getUIString("$690006");
var filterStr_5 = lib.util.UIString.getUIString("$690007");
var storeStr = lib.util.UIString.getUIString("$690008");
var bonusTimeToolTip_0 = lib.util.UIString.getUIString("$690010");
var bonusTimeToolTip_1 = lib.util.UIString.getUIString("$690011");
var bonusTimeStr = lib.util.UIString.getUIString("$690012");
var bonusGaugeStr = lib.util.UIString.getUIString("$690013");
var storeTitleStr = lib.util.UIString.getUIString("$690036");
var rewardTitleStr = lib.util.UIString.getUIString("$690018");
var plusRewardTitleStr = lib.util.UIString.getUIString("$690019");
var acquireEquipTitleStr = lib.util.UIString.getUIString("$690020");
var equipLevelStr = lib.util.UIString.getUIString("$690021");
var skilledTitleStr = lib.util.UIString.getUIString("$690022");
var skilledStr = lib.util.UIString.getUIString("$690023");
var notSkilledStr = lib.util.UIString.getUIString("$690024");
var goalStr = lib.util.UIString.getUIString("$690027");
var playerNumStr = lib.util.UIString.getUIString("$690028");
var iconCompleteStr = lib.util.UIString.getUIString("$690030");
var iconMatchingStr = lib.util.UIString.getUIString("$690031");
var viewModeImageStr = lib.util.UIString.getUIString("$690040");
var viewModeListStr = lib.util.UIString.getUIString("$690041");
var filterStrArray = [filterStr_5,filterStr_0,filterStr_1,filterStr_2,filterStr_3,filterStr_4];
var ordersTypeTitleStr = [filterStr_1,filterStr_2,filterStr_3,filterStr_4];
var LIST_WIDTH = 598;
var LIST_HEIGHT = 164;
var LIST_HEIGTH_ARRAY = [0,164,111,225,158];
var MAX_COUNT_FILTER = 6;
var FILTER_START_POS_X = 420;
var FILTER_POS_Y = 77;
var MAX_COUNT_BONUS = 2;
var MAX_COUNT_BONUS_REWARD = 5;
var MAX_POS_TEXTFIELD = 490;
var MAX_COUNT_REWARD = 8;
var ORDERS_IMAGE_DRAW_WIDTH = 490;
var ORDERS_IMAGE_DRAW_HEIGHT = 157;
var BUTTON_STATE_NORMAL = 1;
var BUTTON_STATE_OVER = 2;
var BUTTON_STATE_PRESS = 3;
var BUTTON_STATE_DISABLE = 4;
var BUTTON_STATE_SELECT = 3;
var ITEM_TYPE_NORMAL = 0;
var ITEM_TYPE_REPUTATION = 1;
var ITEM_TYPE_EP_POINT = 2;
var ITEM_TYPE_PRODUCTION_POINT = 3;
var ITEM_TYPE_MONEY = 4;
var ITEM_TYPE_EXP = 5;
var BUTTON_EFFECT_TYPE_NONE = 0;
var BUTTON_EFFECT_TYPE_NORMAL = 1;
var BUTTON_EFFECT_TYPE_MATCHING = 2;
var BUTTON_EFFECT_START_FRAME_TYPE_NORMAL = 1;
var BUTTON_EFFECT_START_FRAME_TYPE_MATCHING = 2;
var frameBD = flash.display.BitmapData.loadBitmap("slotFrame");
var gradeBD_1 = flash.display.BitmapData.loadBitmap("itemGrade_1");
var gradeBD_2 = flash.display.BitmapData.loadBitmap("itemGrade_2");
var gradeBD_3 = flash.display.BitmapData.loadBitmap("itemGrade_3");
var REWARD_SLOT_TYPE_ORDERS = 0;
var REWARD_SLOT_TYPE_BONUS = 1;
var REWARD_SLOT_SPACE = [0,1];
var REWARD_SLOT_DRAW_SIZE = [36,34];
var SLOT_ICON_SCALE_ORDERS = (REWARD_SLOT_DRAW_SIZE[REWARD_SLOT_TYPE_ORDERS] - 2) / 64;
var SLOT_ICON_SCALE_BONUS = (REWARD_SLOT_DRAW_SIZE[REWARD_SLOT_TYPE_BONUS] - 2) / 64;
var SLOT_ICON_SCALE = [SLOT_ICON_SCALE_ORDERS,SLOT_ICON_SCALE_BONUS];
var SLOT_GRADE_SCALE_ORDERS = REWARD_SLOT_DRAW_SIZE[REWARD_SLOT_TYPE_ORDERS] / 55;
var SLOT_GRADE_SCALE_BONUS = REWARD_SLOT_DRAW_SIZE[REWARD_SLOT_TYPE_BONUS] / 55;
var SLOT_GRADE_SCALE = [SLOT_GRADE_SCALE_ORDERS,SLOT_GRADE_SCALE_BONUS];
var SLOT_ICON_START = 1;
var BONUS_GAUGE_MASK_WIDTH = 294;
var ordersData = new Object();
var ordersRenderers = new Array();
var currentOrdersIndex = 0;
var DETAIL_SLOT_TYPE_COL_3 = 0;
var DETAIL_SLOT_TYPE_COL_4 = 1;
var detailSlotCol = [3,4];
var ORDER_TYPE_DUNGEON = 0;
var ORDER_TYPE_BATTLEFIELD = 1;
var ORDER_TYPE_STORY = 2;
var ORDER_TYPE_SOLO = 3;
var ORDER_TYPE_ALL = 4;
var DetailContainerStartX = 24;
var DetailContainerStartY = 20;
var SlotNameTFDefaultH = 34;
var SlotNameTFMaxH = 52;
var MAX_COUNT_DETAIL_SLOT = 12;
var MAX_COUNT_DETAIL_EQUIP_SLOT = 30;
var MAX_COUNT_DETAIL_BUTTON = 3;
var detailScrollBar = null;
var detailContainerY = 0;
var detailItemSlotStartX = 3;
var detailItemSlotStartY = 45;
var detailItemSlotWidth = 211;
var detailItemSlotHeight = 58;
var detailItemSlotSpace = 9;
var DETAIL_BUTTON_TYPE_RED = 0;
var DETAIL_BUTTON_TYPE_BLUE = 1;
var filterStrId = [5,0,1,2,3,4];
var currentViewMode = 0;
var closeBtn = new lib.util.TxtBtn(container_mc.closeBtn);
closeBtn.setRelease(ToGame_Orders_CloseUI);
var storeBtn = new lib.util.TxtBtn(container_mc.storeButton.mc,container_mc.storeButton.tf);
storeBtn.setTextColor("0xDCB83C","0xFFECA8","0xDCB83C",lib.info.TextColor.BTN_UINIQUE_DISABLE);
storeBtn.setText(storeStr);
storeBtn.setRelease(ToGame_Orders_OpenReputationStore);
lib.manager.ToolTip.add(container_mc.storeTitleTF,storeTitleStr,1);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var intervalId = null;
var prevScrollPos = 0;
var scrollbar = container_mc.scrollbar;
scrollbar.addListener(container_mc.renderersContainer);
var renderersContainerY = container_mc.renderersContainer._y;
container_mc.renderersContainer._xscale = container_mc.renderersContainer._yscale = 100;
container_mc.renderersContainer.onScroll = function()
{
   if(container_mc.detail_mc._visible)
   {
      return undefined;
   }
   container_mc.renderersContainer._y = renderersContainerY - arguments[0];
};
scrollbar.setWheel(container_mc.renderersContainer);
scrollbar.wheelDelta = 1;
scrollbar.pageSize = 0;
scrollbar.displaySize = 673;
scrollbar.defaultBarSizeRatio = 0.3333333333333333;
scrollbar.rowHeightLimit = false;
scrollbar.rowHeight = LIST_HEIGHT;
scrollbar.scroll = 0;
var i = 0;
while(i < MAX_COUNT_FILTER)
{
   setFilterEvent(i);
   i++;
}
var i = 0;
while(i < MAX_COUNT_BONUS)
{
   var bonus = container_mc["bonus_" + i];
   setBonusComponentEvent(bonus,i);
   clearBonus(bonus);
   i++;
}
myListener.OnGame_Orders_SetViewMode = function(viewMode)
{
   viewMode = Number(viewMode);
   if(currentViewMode == viewMode)
   {
      return undefined;
   }
   currentViewMode = viewMode;
   curViewMode = Number(viewMode);
   setViewButton();
   changeViewMode();
};
container_mc.viewButton_0.id = 0;
container_mc.viewButton_1.id = 1;
setMouseEvent(container_mc.viewButton_0);
setMouseEvent(container_mc.viewButton_1);
lib.manager.ToolTip.add(container_mc.viewButton_0,viewModeImageStr,1);
lib.manager.ToolTip.add(container_mc.viewButton_1,viewModeListStr,1);
setViewButton();
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         lib.Debuger.trace("Orders UI._x : " + UI._x + ", UI._y : " + UI._y);
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(_bShow)
{
   if(_global.gbUIMode && bWindowOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
myListener.OnGame_Orders_SetFilter = function(filterData)
{
   var _loc4_ = lib.util.ExtString.split(filterData,"\t");
   var _loc5_ = Math.min(_loc4_.length,MAX_COUNT_FILTER);
   var _loc1_ = 0;
   while(_loc1_ < MAX_COUNT_FILTER)
   {
      var _loc2_ = container_mc["filter_" + _loc1_];
      var _loc3_ = _loc2_.id;
      _loc2_.checked = Boolean(Number(_loc4_[_loc3_]));
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_Orders_SetDisabled = function(bDisabled)
{
   bDisabled = Boolean(Number(bDisabled));
   container_mc.disable._visible = bDisabled;
};
myListener.OnGame_Orders_SetReputation = function(curReputation, maxReputation, buttonState)
{
   lib.manager.ToolTip.remove(container_mc.storeButton);
   container_mc.reputationTF.htmlText = "<font color=\'#DCB83C\'>" + curReputation + "</font> / " + maxReputation;
   buttonState = Boolean(Number(buttonState));
   storeBtn.setEnabled(buttonState);
   var _loc2_ = !buttonState?"$690038":"$690039";
   var _loc3_ = lib.util.UIString.getUIString(_loc2_);
   lib.manager.ToolTip.add(container_mc.storeButton,_loc3_,1);
};
var DETAIL_BUTTON_TEXT_COLOR = ["0xDCB83C","0xFFD43F"];
myListener.OnGame_Orders_CloseDetailPage = function()
{
   if(false == container_mc.detail_mc._visible)
   {
      return undefined;
   }
   container_mc.detail_mc._visible = false;
   container_mc.disable._visible = false;
   scrollbar.addListener(container_mc.renderersContainer);
   scrollbar.setWheel(container_mc.renderersContainer);
};
myListener.OnGame_Orders_SetSoloDetailInfo = function(titleStr, descStr, minLevel, maxLevel, infoStr, reward, buttonState, bRecommend, plusReward, plusRewardTimeStr)
{
   lib.Debuger.trace("plusReward : " + plusReward);
   minLevel = Number(minLevel);
   maxLevel = Number(maxLevel);
   bRecommend = Boolean(Number(bRecommend));
   clearDetailMc(ORDER_TYPE_SOLO);
   var _loc15_ = container_mc.detail_mc;
   var _loc6_ = _loc15_.container;
   _loc15_.descTF.text = descStr;
   setDetailTitle(ORDER_TYPE_SOLO,titleStr,minLevel,maxLevel,0,bRecommend);
   var _loc14_ = _loc6_.soloInfo.infoTF;
   _loc6_.soloInfo._visible = infoStr != "";
   _loc14_.htmlText = infoStr;
   var _loc17_ = _loc14_.textHeight;
   _loc14_._height = _loc17_ + 5;
   var _loc8_ = infoStr == ""?DetailContainerStartY:_loc14_._parent._y + _loc14_._y + _loc17_ + 25;
   _loc6_.plusReward.titleTF.text = plusRewardTitleStr + " " + plusRewardTimeStr;
   var _loc11_ = new Array();
   var _loc10_ = lib.util.ExtString.split(plusReward,"\n");
   var _loc9_ = _loc10_.length;
   var _loc5_ = 0;
   while(_loc5_ < _loc9_)
   {
      var _loc4_ = lib.util.ExtString.split(_loc10_[_loc5_],"\t");
      var _loc1_ = new Object();
      _loc1_.itemId = _loc4_[0];
      _loc1_.itemType = _loc4_[1];
      _loc1_.itemName = _loc4_[2];
      _loc1_.itemImg = _loc4_[3];
      _loc1_.itemImgBD = flash.display.BitmapData.loadBitmap(_loc1_.itemImg);
      _loc1_.itemGrade = _loc4_[4];
      _loc1_.itemCount = _loc4_[5];
      _loc11_.push(_loc1_);
      _loc5_ = _loc5_ + 1;
   }
   drawDetailSlotList(_loc6_.plusReward,_loc11_,DETAIL_SLOT_TYPE_COL_4,false);
   _loc6_.plusReward._y = _loc8_;
   _loc6_.plusReward._visible = 0 < _loc9_;
   var _loc16_ = 0 >= _loc9_?0:_loc9_ - 1;
   var _loc19_ = _loc6_.plusReward["slot_" + _loc16_];
   _loc8_ = 0 >= _loc9_?_loc8_:_loc8_ + _loc19_._y + _loc19_._height + 30;
   _loc6_.reward._y = _loc8_;
   var _loc12_ = new Array();
   var _loc13_ = lib.util.ExtString.split(reward,"\n");
   var _loc7_ = _loc13_.length;
   _loc5_ = 0;
   while(_loc5_ < _loc7_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc13_[_loc5_],"\t");
      var _loc2_ = new Object();
      _loc2_.itemId = _loc3_[0];
      _loc2_.itemType = _loc3_[1];
      _loc2_.itemName = _loc3_[2];
      _loc2_.itemImg = _loc3_[3];
      _loc2_.itemImgBD = flash.display.BitmapData.loadBitmap(_loc2_.itemImg);
      _loc2_.itemGrade = _loc3_[4];
      _loc2_.itemCount = _loc3_[5];
      _loc12_.push(_loc2_);
      _loc5_ = _loc5_ + 1;
   }
   drawDetailSlotList(_loc6_.reward,_loc12_,DETAIL_SLOT_TYPE_COL_4,false);
   _loc6_.reward._visible = 0 < _loc7_;
   _loc16_ = 0 >= _loc7_?0:_loc7_ - 1;
   var _loc18_ = _loc6_.container.reward["slot_" + _loc16_];
   _loc8_ = 0 >= _loc7_?_loc8_:_loc8_ + _loc18_._y + _loc18_._height + 30;
   detailScrollBar.pageSize = _loc8_ != DetailContainerStartY?_loc8_:395;
   setDetailPageButton(buttonState);
   _loc15_._visible = true;
   container_mc.disable._visible = true;
   scrollbar.removeListener();
   scrollbar.kill();
};
var BATTLEFIELD_MAP_WIDTH = 192;
var BATTLEFIELD_MAP_HEIGHT = 143;
myListener.OnGame_Orders_SetBattleFieldDetailInfo = function(titleStr, descStr, minLevel, maxLevel, partyNum, reward, plusReward, plusRewardTimeStr, imgUrl, bfType, bfInfo, goal, playerNum, buttonState, bRecommend)
{
   clearDetailMc(ORDER_TYPE_BATTLEFIELD);
   minLevel = Number(minLevel);
   maxLevel = Number(maxLevel);
   partyNum = Number(partyNum);
   bfType = Number(bfType);
   bRecommend = Boolean(Number(bRecommend));
   var _loc14_ = container_mc.detail_mc;
   setDetailTitle(ORDER_TYPE_BATTLEFIELD,titleStr,minLevel,maxLevel,partyNum,bRecommend);
   _loc14_.descTF.text = descStr;
   var _loc6_ = _loc14_.container;
   _loc6_.plusReward.titleTF.text = plusRewardTitleStr + " " + plusRewardTimeStr;
   var _loc11_ = new Array();
   var _loc10_ = lib.util.ExtString.split(plusReward,"\n");
   var _loc8_ = _loc10_.length;
   var _loc5_ = 0;
   while(_loc5_ < _loc8_)
   {
      var _loc4_ = lib.util.ExtString.split(_loc10_[_loc5_],"\t");
      var _loc1_ = new Object();
      _loc1_.itemId = _loc4_[0];
      _loc1_.itemType = _loc4_[1];
      _loc1_.itemName = _loc4_[2];
      _loc1_.itemImg = _loc4_[3];
      _loc1_.itemImgBD = flash.display.BitmapData.loadBitmap(_loc1_.itemImg);
      _loc1_.itemGrade = _loc4_[4];
      _loc1_.itemCount = _loc4_[5];
      _loc11_.push(_loc1_);
      _loc5_ = _loc5_ + 1;
   }
   drawDetailSlotList(_loc6_.plusReward,_loc11_,DETAIL_SLOT_TYPE_COL_3,false);
   _loc6_.plusReward._visible = 0 < _loc8_;
   _loc6_.plusReward._y = DetailContainerStartY;
   var _loc15_ = 0 >= _loc8_?0:_loc8_ - 1;
   var _loc17_ = _loc6_.plusReward["slot_" + _loc15_];
   var _loc9_ = 0 >= _loc8_?DetailContainerStartY:DetailContainerStartY + _loc17_._y + _loc17_._height + 30;
   _loc6_.reward._y = _loc9_;
   var _loc12_ = new Array();
   var _loc13_ = lib.util.ExtString.split(reward,"\n");
   var _loc7_ = _loc13_.length;
   _loc5_ = 0;
   while(_loc5_ < _loc7_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc13_[_loc5_],"\t");
      var _loc2_ = new Object();
      _loc2_.itemId = _loc3_[0];
      _loc2_.itemType = _loc3_[1];
      _loc2_.itemName = _loc3_[2];
      _loc2_.itemImg = _loc3_[3];
      _loc2_.itemImgBD = flash.display.BitmapData.loadBitmap(_loc2_.itemImg);
      _loc2_.itemGrade = _loc3_[4];
      _loc2_.itemCount = _loc3_[5];
      _loc12_.push(_loc2_);
      _loc5_ = _loc5_ + 1;
   }
   drawDetailSlotList(_loc6_.reward,_loc12_,DETAIL_SLOT_TYPE_COL_3,false);
   _loc6_.reward._visible = 0 < _loc7_;
   _loc15_ = 0 >= _loc7_?0:_loc7_ - 1;
   var _loc16_ = _loc6_.reward["slot_" + _loc15_];
   _loc9_ = 0 >= _loc7_?_loc9_:_loc9_ + _loc16_._y + _loc16_._height + 30;
   _loc6_.bfInfo._y = _loc9_;
   var _loc23_ = flash.display.BitmapData.loadBitmap(imgUrl);
   lib.display.DrawBitmapData.draw(_loc6_.bfInfo.img,_loc23_,0,0,0,0,BATTLEFIELD_MAP_WIDTH,BATTLEFIELD_MAP_HEIGHT,1);
   var _loc21_ = bfType + 1;
   _loc6_.bfInfo.gotoAndStop(_loc21_);
   _loc6_.bfInfo.infoTF.text = bfInfo;
   _loc6_.bfInfo.infoTF._height = _loc6_.bfInfo.infoTF.textHeight + 5;
   _loc9_ = _loc9_ + _loc6_.bfInfo._height + 30;
   detailScrollBar.pageSize = _loc9_ != DetailContainerStartY?_loc9_:395;
   _loc6_.info_0.nameTF.text = goalStr;
   _loc6_.info_0.valueTF.text = goal;
   _loc6_.info_1.nameTF.text = playerNumStr;
   _loc6_.info_1.valueTF.text = playerNum;
   setDetailPageButton(buttonState);
   _loc14_._visible = true;
   container_mc.disable._visible = true;
   scrollbar.removeListener();
   scrollbar.kill();
};
var DetailInfoPos0 = 20;
var DetailInfoPos1 = 90;
var DetailInfoPos2 = 160;
myListener.OnGame_Orders_SetDungeonDetailInfo = function(titleStr, descStr, minLevel, maxLevel, partyNum, reward, plusReward, plusRewardTimeStr, equip, difficulty, equipLevel, skilled, clearNum, scrollNum, buttonState, bRecommend, currentEquipLevel)
{
   clearDetailMc(ORDER_TYPE_DUNGEON);
   minLevel = Number(minLevel);
   maxLevel = Number(maxLevel);
   partyNum = Number(partyNum);
   difficulty = Number(difficulty);
   bRecommend = Boolean(Number(bRecommend));
   var _loc8_ = container_mc.detail_mc;
   _loc8_.container.soloInfo._visible = false;
   setDetailTitle(ORDER_TYPE_DUNGEON,titleStr,minLevel,maxLevel,partyNum,bRecommend);
   _loc8_.descTF.text = descStr;
   _loc8_.container.plusReward.titleTF.text = plusRewardTitleStr + " " + plusRewardTimeStr;
   var _loc14_ = new Array();
   var _loc13_ = lib.util.ExtString.split(plusReward,"\n");
   var _loc12_ = _loc13_.length;
   var _loc7_ = 0;
   while(_loc7_ < _loc12_)
   {
      var _loc5_ = lib.util.ExtString.split(_loc13_[_loc7_],"\t");
      var _loc1_ = new Object();
      _loc1_.itemId = _loc5_[0];
      _loc1_.itemType = _loc5_[1];
      _loc1_.itemName = _loc5_[2];
      _loc1_.itemImg = _loc5_[3];
      _loc1_.itemImgBD = flash.display.BitmapData.loadBitmap(_loc1_.itemImg);
      _loc1_.itemGrade = _loc5_[4];
      _loc1_.itemCount = _loc5_[5];
      _loc14_.push(_loc1_);
      _loc7_ = _loc7_ + 1;
   }
   drawDetailSlotList(_loc8_.container.plusReward,_loc14_,DETAIL_SLOT_TYPE_COL_3,false);
   _loc8_.container.plusReward._visible = 0 < _loc12_;
   _loc8_.container.plusReward._y = DetailContainerStartY;
   var _loc19_ = 0 >= _loc12_?0:_loc12_ - 1;
   var _loc21_ = _loc8_.container.plusReward["slot_" + _loc19_];
   var _loc10_ = 0 >= _loc12_?DetailContainerStartY:DetailContainerStartY + _loc21_._y + _loc21_._height + 30;
   _loc8_.container.reward._y = _loc10_;
   var _loc16_ = new Array();
   var _loc18_ = lib.util.ExtString.split(reward,"\n");
   var _loc9_ = _loc18_.length;
   _loc7_ = 0;
   while(_loc7_ < _loc9_)
   {
      var _loc4_ = lib.util.ExtString.split(_loc18_[_loc7_],"\t");
      var _loc3_ = new Object();
      _loc3_.itemId = _loc4_[0];
      _loc3_.itemType = _loc4_[1];
      _loc3_.itemName = _loc4_[2];
      _loc3_.itemImg = _loc4_[3];
      _loc3_.itemImgBD = flash.display.BitmapData.loadBitmap(_loc3_.itemImg);
      _loc3_.itemGrade = _loc4_[4];
      _loc3_.itemCount = _loc4_[5];
      _loc16_.push(_loc3_);
      _loc7_ = _loc7_ + 1;
   }
   drawDetailSlotList(_loc8_.container.reward,_loc16_,DETAIL_SLOT_TYPE_COL_3,false);
   _loc8_.container.reward._visible = 0 < _loc9_;
   _loc19_ = 0 >= _loc9_?0:_loc9_ - 1;
   var _loc20_ = _loc8_.container.reward["slot_" + _loc19_];
   _loc10_ = 0 >= _loc9_?_loc10_:_loc10_ + _loc20_._y + _loc20_._height + 30;
   _loc8_.container.equip._y = _loc10_;
   var _loc17_ = new Array();
   var _loc15_ = lib.util.ExtString.split(equip,"\n");
   var _loc11_ = _loc15_.length;
   _loc7_ = 0;
   while(_loc7_ < _loc11_)
   {
      var _loc6_ = lib.util.ExtString.split(_loc15_[_loc7_],"\t");
      var _loc2_ = new Object();
      _loc2_.itemId = _loc6_[0];
      _loc2_.itemType = _loc6_[1];
      _loc2_.itemName = _loc6_[2];
      _loc2_.itemImg = _loc6_[3];
      _loc2_.itemImgBD = flash.display.BitmapData.loadBitmap(_loc2_.itemImg);
      _loc2_.itemGrade = _loc6_[4];
      _loc2_.itemCount = _loc6_[5];
      _loc17_.push(_loc2_);
      _loc7_ = _loc7_ + 1;
   }
   drawDetailSlotList(_loc8_.container.equip,_loc17_,DETAIL_SLOT_TYPE_COL_3,true);
   _loc8_.container.equip._visible = 0 < _loc11_;
   _loc19_ = 0 >= _loc11_?0:_loc11_ - 1;
   var _loc22_ = _loc8_.container.equip["slot_" + _loc19_];
   _loc10_ = 0 >= _loc11_?_loc10_:_loc10_ + _loc22_._y + _loc22_._height + 30;
   detailScrollBar.pageSize = _loc10_ != DetailContainerStartY?_loc10_:395;
   _loc8_.container.difficultyInfo._visible = true;
   _loc8_.container.difficultyInfo.star.gotoAndStop(difficulty);
   _loc8_.container.info_0._y = DetailInfoPos1;
   _loc8_.container.info_1._y = DetailInfoPos2;
   _loc8_.container.info_0.nameTF.text = equipLevelStr;
   _loc8_.container.info_0.valueTF.text = equipLevel;
   var _loc25_ = lib.util.UIString.getUIString("$690037","level",currentEquipLevel);
   lib.manager.ToolTip.add(_loc8_.container.info_0,_loc25_,1);
   _loc8_.container.info_1.nameTF.text = skilledTitleStr;
   var _loc27_ = skilled != true?skilledStr:notSkilledStr;
   _loc8_.container.info_1.valueTF.text = _loc27_;
   _loc8_.container.dungeonInfo._visible = true;
   _loc8_.container.dungeonInfo.clearTF.text = lib.util.UIString.getUIString("$690025","count",clearNum);
   _loc8_.container.dungeonInfo.scrollTF.text = lib.util.UIString.getUIString("$690026","count",scrollNum);
   setDetailPageButton(buttonState);
   _loc8_._visible = true;
   container_mc.disable._visible = true;
   scrollbar.removeListener();
   scrollbar.kill();
};
var DETAIL_BG_WIDTH = 1086;
var DETAIL_BUTTON_WIDTH = [204,320];
var BONUS_MODE_NORMAL = 0;
var BONUS_MODE_DISABLED = 1;
var BONUS_MODE_GAUGE_DISABLED = 2;
myListener.OnGame_Orders_SetBonus = function(type, titleStr, timeStr, min, max, reward, buttonState, mode)
{
   var _loc1_ = container_mc["bonus_" + type];
   setBonus(_loc1_,type,titleStr,timeStr,min,max,reward,buttonState,mode);
};
myListener.OnGame_Orders_SetOrders = function(id, type, titleStr, minLevel, maxLevel, bRecommend, img, descStr, curProgress, totalProgress, progressToolTip, bRegistQuest, reward, goldReward, expReward, plusReward, plusRewardTimeStr, plusRewardCount, buttonState, buttonStr, buttonEffectType, buttonToolTip, bComplete)
{
   var _loc5_ = ordersData[id];
   var _loc13_ = getIndexById(id);
   if(undefined == _loc5_)
   {
      _loc5_ = new Object();
      var _loc12_ = ordersRenderers.push(id);
      _loc13_ = _loc12_ - 1;
   }
   _loc5_.reward = [];
   _loc5_.plusReward = [];
   _loc5_.id = id;
   _loc5_.type = Number(type);
   _loc5_.titleStr = titleStr;
   _loc5_.minLevel = Number(minLevel);
   _loc5_.maxLevel = Number(maxLevel);
   _loc5_.bRecommend = Boolean(Number(bRecommend));
   _loc5_.imgBD = flash.display.BitmapData.loadBitmap(img);
   _loc5_.descStr = descStr;
   _loc5_.curProgress = Number(curProgress);
   _loc5_.totalProgress = Number(totalProgress);
   _loc5_.progressToolTip = progressToolTip;
   _loc5_.bRegistQuest = Boolean(Number(bRegistQuest));
   _loc5_.reward = new Array();
   _loc5_.goldReward = Number(goldReward);
   _loc5_.expReward = Number(expReward);
   _loc5_.plusReward = new Array();
   _loc5_.plusRewardTimeStr = plusRewardTimeStr;
   _loc5_.plusRewardCount = plusRewardCount;
   _loc5_.buttonState = Number(buttonState);
   _loc5_.buttonStr = buttonStr;
   _loc5_.buttonEffectType = Number(buttonEffectType);
   _loc5_.buttonToolTip = buttonToolTip;
   _loc5_.bComplete = Boolean(Number(bComplete));
   var _loc8_ = lib.util.ExtString.split(reward,"\n");
   var _loc9_ = _loc8_.length;
   var _loc6_ = 0;
   while(_loc6_ < _loc9_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc8_[_loc6_],"\t");
      var _loc2_ = new Object();
      _loc2_.itemId = _loc3_[0];
      _loc2_.itemType = _loc3_[1];
      _loc2_.itemName = _loc3_[2];
      _loc2_.itemImg = _loc3_[3];
      _loc2_.itemImgBD = flash.display.BitmapData.loadBitmap(_loc2_.itemImg);
      _loc2_.itemGrade = _loc3_[4];
      _loc2_.itemCount = _loc3_[5];
      _loc5_.reward.push(_loc2_);
      _loc6_ = _loc6_ + 1;
   }
   var _loc7_ = lib.util.ExtString.split(plusReward,"\n");
   var _loc10_ = _loc7_.length;
   _loc6_ = 0;
   while(_loc6_ < _loc10_)
   {
      var _loc4_ = lib.util.ExtString.split(_loc7_[_loc6_],"\t");
      var _loc1_ = new Object();
      _loc1_.itemId = _loc4_[0];
      _loc1_.itemType = _loc4_[1];
      _loc1_.itemName = _loc4_[2];
      _loc1_.itemImg = _loc4_[3];
      _loc1_.itemImgBD = flash.display.BitmapData.loadBitmap(_loc1_.itemImg);
      _loc1_.itemGrade = _loc4_[4];
      _loc1_.itemCount = _loc4_[5];
      _loc5_.plusReward.push(_loc1_);
      _loc6_ = _loc6_ + 1;
   }
   ordersData[id] = _loc5_;
   drawOrders(id);
   changeOrdersViewMode(id);
   alignOrdersRenderers();
};
myListener.OnGame_Orders_RemoveOrders = function(id)
{
   removeOrdersRenderer(id);
   ordersData[id] = undefined;
   var _loc1_ = container_mc.renderersContainer["renderer_" + id];
   _loc1_.removeMovieClip();
};
myListener.OnGame_Orders_ClearList = function()
{
   var _loc4_ = ordersRenderers.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc3_ = ordersRenderers[_loc1_];
      var _loc2_ = container_mc.renderersContainer["renderer_" + _loc3_];
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   ordersRenderers = [];
   ordersData = [];
   scrollbar.pageSize = 0;
};
initDetailMc();
ToGame_Orders_Init();
