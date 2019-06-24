class g4.view.delivery.DeliveryItemList extends gfx.core.UIComponent
{
   var goldType = 0;
   function DeliveryItemList()
   {
      super();
   }
   function configUI()
   {
      super.configUI();
      this.itemArray = [];
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc5_ = g4.view.delivery.DeliveryConstants.DELIVERY_ITEM_LIST_COUNT;
      _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc4_ = this["mc_item_" + _loc3_];
         this.configItem(_loc4_,_loc3_);
         this.itemArray.push(_loc4_);
         _loc3_ = _loc3_ + 1;
      }
   }
   function configItem(item, index)
   {
      item.drag = true;
      g4.util.UIUtil.setDragSlotValue(item,"Delivery",index);
      item.SLOT.onPressAux = gfx.utils.Delegate.create(this,function(mouseIndex, keyboardOrMouse, button)
      {
         if(button == 2)
         {
            if(item.id == -1)
            {
               return undefined;
            }
            g4.model.GameInterface.callGameInterface("ToGame_Delivery_DeliverySlotRightClick",String(index));
         }
      }
      );
      this.clearItem(item);
   }
   function clearItem(item)
   {
      item.clear();
      item.impossible = false;
      lib.manager.ToolTip.remove(item.SLOT);
   }
   function cleanUp()
   {
      var _loc2_ = undefined;
      var _loc3_ = g4.view.delivery.DeliveryConstants.DELIVERY_ITEM_LIST_COUNT;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this.clearItem(this.itemArray[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setData(dataList)
   {
      this.cleanUp();
      var _loc6_ = lib.util.ExtString.split(dataList,"\n");
      if(_loc6_ == null || _loc6_.length == 0)
      {
         return 0;
      }
      var _loc7_ = 0;
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc8_ = _loc6_.length;
      _loc4_ = 0;
      while(_loc4_ < _loc8_)
      {
         var _loc2_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
         if(!(_loc2_ == null || _loc2_.length < 2))
         {
            var _loc5_ = Number(_loc2_[0]);
            _loc3_ = this.itemArray[_loc5_];
            _loc3_.setLineNum(2);
            _loc3_.showMoney(true);
            _loc3_.draw(_loc2_[2]);
            _loc3_.grade = _loc2_[7];
            _loc3_.sealType = _loc2_[9];
            _loc3_.masterpiece = _loc2_[10];
            _loc3_.upText = _loc2_[3];
            _loc3_.downText = lib.util.CurrencyFormat.makeComma(_loc2_[4]);
            if(Number(_loc2_[5]) != 0 && Number(_loc2_[5]) != undefined)
            {
               _loc3_.num_txt.text = _loc2_[5];
            }
            if(Number(_loc2_[6]) != 1)
            {
               _loc3_.num_txt.text = "";
            }
            if(_loc2_[8] != undefined)
            {
               _loc3_.impossible = Number(_loc2_[8]);
            }
            lib.manager.ToolTip.add(_loc3_.SLOT,"1\t" + _loc5_,lib.manager.ToolTip.TOOL_TIP_TYPE_DELIVERY,_loc3_.Icon);
            _loc7_ = _loc7_ + 1;
         }
         _loc4_ = _loc4_ + 1;
      }
      return _loc7_;
   }
}
