class g4.view.premiumSlotPanel.BenefiltSlotGroup extends gfx.core.UIComponent
{
   static var ROW_MAX_COUNT = 12;
   static var SLOT_SIZE = 32;
   var highlightShowCompleted = false;
   var highlightSendCompleted = false;
   function BenefiltSlotGroup()
   {
      super();
   }
   function configUI()
   {
      this._benefitSlots = [];
   }
   function configItem(mc_item)
   {
      mc_item.mc_slot.drag = true;
      g4.manager.MouseEventManager.getInstance().addEventListener(mc_item.mc_slot.SLOT,g4.manager.MouseEventManager.RIGHT_BUTTON_DOWN,mc_item,function()
      {
         g4.model.GameInterface.callGameInterface("ToGame_BenefitSlotRightClick",String(this.id));
      }
      );
      g4.util.UIUtil.setMouseEnabled(mc_item.mc_highlight,false);
   }
   function cleanUpItem(mc_item)
   {
      mc_item._visible = false;
      mc_item.id = -1;
      mc_item.mc_slot.clear();
      this.setItemHighlight(mc_item,false);
   }
   function setItemHighlight(mc_item, bHighlight)
   {
      return undefined;
   }
   function cleanUpAllHighlights()
   {
      this.highlightShowCompleted = false;
      this.highlightSendCompleted = false;
      this.hideAllHighlights();
   }
   function hideAllHighlights()
   {
      var _loc2_ = 0;
      while(_loc2_ < this._benefitSlots.length)
      {
         var _loc3_ = this._benefitSlots[_loc2_];
         this.setItemHighlight(_loc3_,false);
         _loc2_ = _loc2_ + 1;
      }
   }
   function cleanUpAllItems()
   {
      var _loc2_ = 0;
      while(_loc2_ < this._benefitSlots.length)
      {
         this.cleanUpItem(this._benefitSlots[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setData(benefitListData)
   {
      this._benefitListData = benefitListData;
      this.cleanUpAllItems();
      var _loc3_ = 0;
      while(_loc3_ < benefitListData.getDataCount())
      {
         var _loc4_ = benefitListData.getDataAt(_loc3_);
         var _loc2_ = this.getBenefitSlot(_loc3_);
         _loc2_.id = _loc4_.id;
         _loc2_._width = g4.view.premiumSlotPanel.BenefiltSlotGroup.SLOT_SIZE;
         _loc2_._height = g4.view.premiumSlotPanel.BenefiltSlotGroup.SLOT_SIZE;
         var _loc5_ = _loc2_.mc_slot;
         g4.util.UIUtil.setDragSlotValue(_loc5_,g4.view.ViewID.PREMIUM_SLOT_PANEL,_loc4_.id);
         lib.manager.ToolTip.add(_loc5_.SLOT,"1\t" + _loc4_.id,lib.manager.ToolTip.TOOL_TIP_TYPE_PREMIUM_WINDOW,_loc5_.Icon);
         _loc2_._visible = true;
         _loc3_ = _loc3_ + 1;
      }
      g4.util.UIUtil.callLater(this,"setSlots",[benefitListData]);
   }
   function setSlots(benefitListData)
   {
      g4.util.Debug.log("g4.view.premiumSlotPanel.BenefiltSlotGroup.setSlots > benefitListData : " + benefitListData);
      var _loc4_ = 0;
      while(_loc4_ < benefitListData.getDataCount())
      {
         var _loc2_ = benefitListData.getDataAt(_loc4_);
         var _loc5_ = this.getBenefitSlot(_loc4_);
         var _loc3_ = _loc5_.mc_slot;
         _loc3_.__set__upText(_loc2_.name);
         _loc3_.draw(_loc2_.image);
         _loc3_.Slot.num_txt.text = !(_loc2_.count == undefined || _loc2_.count == 0)?String(_loc2_.count):"";
         _loc3_.__set__impossible(_loc2_.impossible);
         _loc3_.$impossible = _loc2_.impossible;
         _loc3_.__set__grade(_loc2_.grade);
         _loc4_ = _loc4_ + 1;
      }
   }
   function getBenefitSlot(index)
   {
      var _loc2_ = this._benefitSlots[index];
      if(_loc2_ == null)
      {
         _loc2_ = this.attachMovie("BenefitSlot","benefitSlot" + index,this.getNextHighestDepth());
         _loc2_._x = index % g4.view.premiumSlotPanel.BenefiltSlotGroup.ROW_MAX_COUNT * g4.view.premiumSlotPanel.BenefiltSlotGroup.SLOT_SIZE;
         _loc2_._y = Math.floor(index / g4.view.premiumSlotPanel.BenefiltSlotGroup.ROW_MAX_COUNT) * g4.view.premiumSlotPanel.BenefiltSlotGroup.SLOT_SIZE;
         this.configItem(_loc2_);
         this.cleanUpItem(_loc2_);
         this._benefitSlots[index] = _loc2_;
      }
      return _loc2_;
   }
   function findItemByID(id)
   {
      var _loc2_ = 0;
      while(_loc2_ < this._benefitSlots.length)
      {
         var _loc3_ = this._benefitSlots[_loc2_];
         if(_loc3_.id == id)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function setToggle(id, registered)
   {
      g4.util.Debug.log("g4.view.premiumSlotPanel.BenefiltSlotGroup.setToggle > id : " + id + ", registered : " + registered);
      var _loc2_ = this.findItemByID(id);
      if(_loc2_ == null)
      {
         return undefined;
      }
      g4.util.UIUtil.callLater(this,"setSlotActive",[_loc2_.mc_slot.Slot,registered]);
   }
   function setSlotActive(slot, isActive)
   {
      g4.util.Debug.log("g4.view.premiumSlotPanel.BenefiltSlotGroup.setSlotActive > slot : " + slot + ", isActive : " + isActive);
      slot.__set__active(isActive);
   }
   function setCoolTime(id, remainingTime, totalTime)
   {
      var mc_item = this.findItemByID(id);
      if(mc_item == null)
      {
         return undefined;
      }
      var mc_slot = mc_item.mc_slot;
      var slotMc = mc_slot.Slot;
      this.endCoolTime(mc_item);
      if(remainingTime <= 0 || totalTime <= 0)
      {
         return undefined;
      }
      slotMc.cool = new lib.util.CoolTime(remainingTime,totalTime);
      slotMc.cool.onTick = gfx.utils.Delegate.create(this,function()
      {
         if(mc_slot.impossible)
         {
            mc_slot.impossible = false;
         }
         slotMc.Count.txt.text = slotMc.cool.getCountText();
         var _loc1_ = 360 - slotMc.cool.getDgree();
         if(_loc1_ >= 360)
         {
            _loc1_ = 359;
         }
         lib.util.CoolTime.draw(slotMc.CoolTime,50,50,_loc1_,0,60,true);
      }
      );
      slotMc.cool.onFinished = gfx.utils.Delegate.create(this,function()
      {
         this.endCoolTime(mc_item);
      }
      );
      slotMc.cool.updateTick(getTimer());
   }
   function endCoolTime(mc_item)
   {
      var _loc2_ = mc_item.mc_slot;
      var _loc1_ = _loc2_.Slot;
      if(_loc1_.cool != null)
      {
         _loc1_.cool.remove();
         _loc1_.cool.onTick = null;
         _loc1_.cool.onFinished = null;
         delete register1.cool;
      }
      _loc1_.CoolTime.clear();
      _loc1_.Count.txt.text = "";
      _loc2_.impossible = _loc2_.$impossible;
   }
   function show(benefitListData)
   {
      this._visible = true;
      this.showHighlightEffects(benefitListData);
      this.sendHighlightCompleteIDList(benefitListData);
   }
   function hide()
   {
      this._visible = false;
      this.hideAllHighlights();
   }
   function showHighlightEffects(benefitListData)
   {
      if(this.highlightShowCompleted)
      {
         return undefined;
      }
      this.highlightShowCompleted = true;
      if(!benefitListData.hasHighlightIDList())
      {
         return undefined;
      }
      var _loc3_ = 0;
      while(_loc3_ < benefitListData.getDataCount())
      {
         var _loc2_ = this._benefitSlots[_loc3_];
         var _loc4_ = _loc2_.id;
         if(benefitListData.isHighlightID(_loc4_))
         {
            this.setItemHighlight(_loc2_,true);
         }
         else
         {
            this.setItemHighlight(_loc2_,false);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function sendHighlightCompleteIDList(benefitListData)
   {
      if(this.highlightSendCompleted)
      {
         return undefined;
      }
      this.highlightSendCompleted = true;
      if(!benefitListData.hasHighlightIDList())
      {
         return undefined;
      }
      this.ToGame_PremiumSlotPanel_SetHighlightCompleteIDList(benefitListData.getHighlightIDList());
   }
   function ToGame_PremiumSlotPanel_SetHighlightCompleteIDList(idList)
   {
      g4.model.GameInterface.callGameInterface("ToGame_PremiumSlotPanel_SetHighlightCompleteIDList",idList);
   }
}
