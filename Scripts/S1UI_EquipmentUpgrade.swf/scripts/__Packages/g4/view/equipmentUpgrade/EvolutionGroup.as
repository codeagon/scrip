class g4.view.equipmentUpgrade.EvolutionGroup extends gfx.core.UIComponent
{
   function EvolutionGroup()
   {
      super();
   }
   function onLoad()
   {
      this.tCurrent = this.mState.tCurrent;
      this.tNext = this.mState.tNext;
      this.tGuide = this.mState.tGuide;
      this.tCurrent.verticalAlign = "center";
      this.tNext.verticalAlign = "center";
      this.tGuide.verticalAlign = "center";
      this.materials = [];
      var _loc3_ = 0;
      while(_loc3_ < 8)
      {
         var _loc2_ = (MovieClip)this["materialSlot_" + _loc3_];
         _loc2_.tooltipIndex = _loc3_ + 1;
         _loc2_.drag = false;
         _loc2_.effect = false;
         _loc2_.onRelease2 = g4.util.Delegate.create(this,this.materialHandlerClick,_loc3_);
         _loc2_.tQuantity.textAutoSize = "shrink";
         this.materials.push(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
      this.tGuide.htmlText = lib.util.UIString.getUIString("$710005");
      this.tGuide._visible = false;
      this.mResultSuccess.mText.textField.text = lib.util.UIString.getUIString("$710010");
      this.mResultDestroy.mText.textField.text = lib.util.UIString.getUIString("$710014");
      this.bConfirm.addEventListener(gfx.events.EventTypes.CLICK,this,"confirmHandlerClick");
      this.clearAll();
      this.mResultSuccess.hitTestDisable = true;
      this.mResultDown.hitTestDisable = true;
      this.mResultDestroy.hitTestDisable = true;
      this.mInfo.mTip._visible = false;
   }
   function confirmHandlerClick(event)
   {
      this.dispatchEvent({type:"ToGame_EquipmentUpgrade_Click",index:1});
   }
   function materialHandlerClick($index)
   {
   }
   function clearAll()
   {
      this.clearTargetItem();
      this.clearResultItem();
      this.clearMaterialItemList();
      this.clearComponent();
   }
   function clearSlot($slot)
   {
      $slot.id = undefined;
      $slot.clear();
      lib.manager.ToolTip.remove($slot.SLOT);
   }
   function clearTargetItem()
   {
      this.tCurrent.text = "";
      this.tLevelCurrent.text = "";
      this.tGuide._visible = true;
      this.mEffect.gotoAndStop(1);
      this.mEffect._visible = false;
      this.clearSlot(this.EquipmentUpgrade__0);
   }
   function clearResultItem()
   {
      this.tNext.text = "";
      this.tLevelNext.text = "";
      this.mResultSlot.__set__drag(false);
      this.mResultSlot.__set__effect(false);
      this.clearSlot(this.mResultSlot);
   }
   function clearMaterialItemList()
   {
      this.mInfo.mBackground.gotoAndStop(2);
      this.mInfo.textField.htmlText = "";
      this.mInfo.mTip._visible = false;
      var _loc3_ = 0;
      while(_loc3_ < 8)
      {
         var _loc2_ = (lib.util.Slot)this.materials[_loc3_];
         this.clearSlot(_loc2_);
         _loc2_.mDisabled._visible = false;
         _loc2_.tQuantity.text = "";
         _loc2_.mBackground.gotoAndStop(3);
         _loc2_.mLine._visible = false;
         _loc3_ = _loc3_ + 1;
      }
   }
   function clearComponent()
   {
      this.bConfirm.__set__disabled(true);
      this.bConfirm.buttonState = 1;
      this.tGold._visible = false;
   }
   function setTargetItem($itemID, $img, $grade, $name, $enchant, $currentLevel, $maxLevel, $currentInfo, $nextInfo)
   {
      this.clearTargetItem();
      $grade = Number($grade);
      $enchant = Number($enchant);
      var _loc3_ = lib.util.UIString.getUIString("$710008","currentLevel",$currentLevel,"maxLevel",$maxLevel);
      this.tLevelCurrent.htmlText = _loc3_;
      this.tCurrent.htmlText = $name;
      this.EquipmentUpgrade__0.id = $itemID;
      this.EquipmentUpgrade__0.draw($img,64,64);
      this.EquipmentUpgrade__0.__set__grade($grade);
      lib.manager.ToolTip.add(this.EquipmentUpgrade__0.SLOT,$itemID + "\t1\t0",6);
      this.tGuide._visible = false;
   }
   function setResultItem($itemID, $img, $grade, $name, $enchant, $currentLevel, $maxLevel)
   {
      this.clearResultItem();
      $grade = Number($grade);
      $enchant = Number($enchant);
      var _loc3_ = lib.util.UIString.getUIString("$710008","currentLevel",$currentLevel,"maxLevel",$maxLevel);
      this.tLevelNext.htmlText = _loc3_;
      this.tNext.htmlText = $name;
      this.mResultSlot.id = $itemID;
      this.mResultSlot.draw($img,64,64);
      this.mResultSlot.__set__grade($grade);
      lib.manager.ToolTip.add(this.mResultSlot.SLOT,$itemID + "\t1\t1",6);
      this.tGuide._visible = false;
   }
   function setClearTargetItem()
   {
      this.clearAll();
   }
   function setMaterialItemList($itemParam, $gold, $bEnough, $rateMessage, $tooltipDetail)
   {
      this.clearMaterialItemList();
      this.tGold.text = "";
      this.tGold.htmlText = lib.util.GoldCurrency.SetGoldText($gold,0,0,!$bEnough?-1:0,0);
      this.tGold._visible = true;
      var _loc13_ = lib.util.ExtString.split($itemParam,"\n");
      var _loc14_ = _loc13_.length;
      var _loc4_ = 0;
      while(_loc4_ < 8)
      {
         var _loc2_ = (lib.util.Slot)this.materials[_loc4_];
         if(_loc4_ < _loc14_)
         {
            var _loc3_ = lib.util.ExtString.split(_loc13_[_loc4_],"\t");
            var _loc8_ = Number(_loc3_[0]);
            var _loc9_ = _loc3_[1];
            var _loc12_ = Number(_loc3_[2]);
            var _loc5_ = Number(_loc3_[3]);
            var _loc6_ = Number(_loc3_[4]);
            var _loc11_ = Boolean(_loc3_[5]);
            _loc2_._visible = true;
            _loc2_.draw(_loc9_,54,54);
            _loc2_.__set__grade(_loc12_);
            _loc2_.__set__num(_loc5_);
            _loc2_.__set__active(_loc11_);
            _loc2_.mDisabled._visible = _loc6_ < _loc5_;
            _loc2_.mBackground.gotoAndStop(1);
            _loc2_.mLine._visible = true;
            var _loc10_ = _loc6_ >= _loc5_?"#FFFFFF":"#c00005";
            _loc2_.tQuantity.htmlText = "<font color=\'" + _loc10_ + "\'>" + _loc6_ + "</font><font color=\'#C8C8C8\'>/" + _loc5_ + "</font>";
            var _loc7_ = _loc2_.tooltipIndex;
            lib.manager.ToolTip.add(_loc2_.SLOT,_loc8_ + "\t1\t" + _loc7_,6);
         }
         else
         {
            _loc2_.mBackground.gotoAndStop(2);
            _loc2_.mLine._visible = false;
            _loc2_.tQuantity.htmlText = "";
         }
         _loc4_ = _loc4_ + 1;
      }
      this.mInfo.mBackground.gotoAndStop(1);
      this.mInfo.textField.htmlText = $rateMessage;
      this.mInfo.mTip._visible = true;
      lib.manager.ToolTip.remove(this.mInfo.mTip);
      lib.manager.ToolTip.add(this.mInfo.mTip,$tooltipDetail,1);
   }
   function setButtonState($param)
   {
      var _loc3_ = lib.util.ExtString.split($param,"\n");
      var _loc2_ = lib.util.ExtString.split(_loc3_[0],"\t");
      this.bConfirm.__set__label(_loc2_[0]);
      this.bConfirm.__set__disabled(Boolean(Number(_loc2_[1])));
      this.bConfirm.buttonState = Number(_loc2_[1]);
   }
   function startProgress()
   {
      this.mBackground.gotoAndPlay(2);
      this.mEffect._visible = true;
      this.mEffect.gotoAndPlay(2);
      this.mResultSuccess.gotoAndStop(1);
      this.mResultDown.gotoAndStop(1);
      this.mResultDestroy.gotoAndStop(1);
      this.mResultSuccess._visible = false;
      this.mResultDown._visible = false;
      this.mResultDestroy._visible = false;
      this.bConfirm.__set__disabled(true);
      this.EquipmentUpgrade__0.__set__drag(false);
   }
   function progressComp()
   {
      this.dispatchEvent({type:"ToGame_EquipmentUpgrade_EndStartEffect",index:1});
   }
   function setResult($success)
   {
      if($success == 1)
      {
         this.mResultSuccess._visible = true;
         this.mResultSuccess.gotoAndPlay(2);
         this.mResultDown.gotoAndStop(1);
         this.mResultDestroy.gotoAndStop(1);
         this.mResultDown._visible = false;
         this.mResultDestroy._visible = false;
      }
      else if($success == 2)
      {
         this.mResultDown.mText.textField.text = lib.util.UIString.getUIString("$710011");
         this.mResultDown._visible = true;
         this.mResultDown.gotoAndPlay(2);
         this.mResultSuccess.gotoAndStop(1);
         this.mResultDestroy.gotoAndStop(1);
         this.mResultSuccess._visible = false;
         this.mResultDestroy._visible = false;
      }
      else if($success == 3)
      {
         this.mResultDestroy._visible = true;
         this.mResultDestroy.gotoAndPlay(2);
         this.mResultSuccess.gotoAndStop(1);
         this.mResultDown.gotoAndStop(1);
         this.mResultSuccess._visible = false;
         this.mResultDown._visible = false;
      }
      else if($success == 4)
      {
         this.mResultDown.mText.textField.text = lib.util.UIString.getUIString("$710015");
         this.mResultDown._visible = true;
         this.mResultDown.gotoAndPlay(2);
         this.mResultSuccess.gotoAndStop(1);
         this.mResultDestroy.gotoAndStop(1);
         this.mResultSuccess._visible = false;
         this.mResultDestroy._visible = false;
      }
      this.mEffect._visible = false;
   }
   function resultTitleHandlerFinish()
   {
      this.bConfirm.__set__disabled(Boolean(this.bConfirm.buttonState));
      this.EquipmentUpgrade__0.__set__drag(true);
      this.dispatchEvent({type:"ToGame_EquipmentUpgrade_EndResultEffect",index:1});
   }
   function resultTitleCheckPoint()
   {
   }
}
