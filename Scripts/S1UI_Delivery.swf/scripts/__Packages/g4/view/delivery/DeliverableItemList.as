class g4.view.delivery.DeliverableItemList extends gfx.core.UIComponent
{
   static var ROW_WIDTH = 213;
   static var ROW_HEIGHT = 65;
   function DeliverableItemList()
   {
      super();
   }
   function configUI()
   {
      super.configUI();
      this.itemArray = [];
      this.mc_content = this.mc_content;
      this.mc_dup_item = this.mc_content.mc_dup_item;
      this.mc_mask = this.mc_mask;
      this.scrollBar = this.scrollBar;
      this.mc_dup_item._visible = false;
      this.setScrollBar();
   }
   function setScrollBar()
   {
      this.scrollBar.__set__displaySize(this.mc_mask._height);
      this.scrollBar.__set__rowHeight(g4.view.delivery.DeliverableItemList.ROW_HEIGHT);
      this.scrollBar.__set__rowHeightLimit(false);
      this.scrollBar.__set__pageSize(0);
      var _loc2_ = {};
      _loc2_.onScroll = gfx.utils.Delegate.create(this,this.onScrollChanged);
      this.scrollBar.addListener(_loc2_);
   }
   function onScrollChanged($scroll)
   {
      this.mc_content._y = - $scroll;
   }
   function cleanUp()
   {
      var _loc2_ = undefined;
      var _loc3_ = this.itemArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this.cleanUpItem(this.itemArray[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.scrollBar.__set__pageSize(0);
   }
   function cleanUpItem(item)
   {
      item._visible = false;
      item.clear();
      item.impossible = false;
      item.SLOT.enabled = false;
      item.hideBg();
      item.reputation_txt.htmlText = "";
      if(item.medalIcon != null)
      {
         item.medalIcon.clear();
      }
   }
   function createItems(count)
   {
      var _loc4_ = count - this.itemArray.length;
      if(_loc4_ <= 0)
      {
         return undefined;
      }
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      while((_loc4_ = _loc4_ - 1) >= 0)
      {
         _loc3_ = this.itemArray.length;
         _loc2_ = this.mc_dup_item.duplicateMovieClip("mc_item_" + _loc3_,this.mc_content.getNextHighestDepth());
         _loc2_._x = g4.view.delivery.DeliverableItemList.ROW_WIDTH * (_loc3_ % 2);
         _loc2_._y = g4.view.delivery.DeliverableItemList.ROW_HEIGHT * Math.floor(_loc3_ / 2);
         _loc2_.drag = false;
         this.cleanUpItem(_loc2_);
         this.itemArray.push(_loc2_);
      }
   }
   function setDataGold(dataList)
   {
      this.cleanUp();
      var _loc6_ = lib.util.ExtString.split(dataList,"\n");
      if(_loc6_ == null || _loc6_.length == 0)
      {
         return undefined;
      }
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      var _loc7_ = _loc6_.length;
      this.createItems(_loc7_);
      _loc4_ = 0;
      while(_loc4_ < _loc7_)
      {
         var _loc3_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
         if(!(_loc3_ == null || _loc3_.length < 2))
         {
            _loc2_ = this.itemArray[_loc4_];
            _loc2_._visible = true;
            _loc2_.SLOT.enabled = true;
            _loc2_.setLineNum(2);
            _loc2_.showMoney(true);
            _loc2_.money_mc._visible = false;
            _loc2_.draw(_loc3_[2]);
            _loc2_.grade = _loc3_[6];
            _loc2_.sealType = _loc3_[7];
            _loc2_.masterpiece = _loc3_[8];
            _loc2_.showBg();
            _loc2_.Slot.hideBg();
            _loc2_.upText = _loc3_[3];
            _loc2_.down_txt._width = 125;
            _loc2_.down_txt._x = 80;
            _loc2_.down_txt.html = true;
            _loc2_.down_txt.htmlText = lib.util.GoldCurrency.SetGoldText(_loc3_[4]);
            _loc2_.impossible = Number(_loc3_[5]);
            var _loc5_ = Number(_loc3_[1]);
            lib.manager.ToolTip.add(_loc2_.SLOT,"0\t" + _loc5_,lib.manager.ToolTip.TOOL_TIP_TYPE_DELIVERY,_loc2_.Slot.Icon);
         }
         _loc4_ = _loc4_ + 1;
      }
      this.scrollBar.__set__pageSize(g4.view.delivery.DeliverableItemList.ROW_HEIGHT * Math.ceil(_loc7_ / 2));
   }
   function setDataMedal(dataList)
   {
      this.cleanUp();
      var _loc8_ = lib.util.UIString.getUIString("$071009");
      var _loc6_ = lib.util.ExtString.split(dataList,"\n");
      if(_loc6_ == null || _loc6_.length == 0)
      {
         return undefined;
      }
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      var _loc7_ = _loc6_.length;
      this.createItems(_loc7_);
      _loc4_ = 0;
      while(_loc4_ < _loc7_)
      {
         var _loc3_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
         if(!(_loc3_ == null || _loc3_.length < 2))
         {
            _loc2_ = this.itemArray[_loc4_];
            _loc2_._visible = true;
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
            if(_loc2_.medalIcon == null)
            {
               _loc2_.medalIcon = _loc2_.createEmptyMovieClip("medalIcon",_loc2_.getNextHighestDepth());
               _loc2_.medalIcon._x = _loc2_.money_mc._x;
               _loc2_.medalIcon._y = _loc2_.money_mc._y;
            }
            g4.view.delivery.DeliveryUtil.drawBitmap(g4.view.delivery.DeliveryGlobals.medalImage,_loc2_.medalIcon,-3,0,16,16);
            _loc2_.draw(_loc3_[2]);
            _loc2_.grade = _loc3_[7];
            _loc2_.sealType = _loc3_[8];
            _loc2_.masterpiece = _loc3_[9];
            _loc2_.upText = _loc3_[3];
            _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc3_[4]);
            _loc2_.down_txt._width = 133.9;
            _loc2_.impossible = Number(_loc3_[5]);
            _loc2_.showBg();
            _loc2_.Slot.hideBg();
            _loc2_.down_txt._x = 54;
            _loc2_.down_txt.textColor = 15772743;
            if(Number(_loc3_[6]) != 0)
            {
               _loc2_.center_txt.textColor = lib.info.TextColor.CHAT_SYSTEM_INFO_GUILD;
               _loc2_.centerText = _loc8_ + " " + _loc3_[6];
            }
            var _loc5_ = Number(_loc3_[1]);
            lib.manager.ToolTip.add(_loc2_.SLOT,"0\t" + _loc5_,lib.manager.ToolTip.TOOL_TIP_TYPE_DELIVERY,_loc2_.Slot.Icon);
         }
         _loc4_ = _loc4_ + 1;
      }
      this.scrollBar.__set__pageSize(g4.view.delivery.DeliverableItemList.ROW_HEIGHT * Math.ceil(_loc7_ / 2));
   }
   function mouseWheel(delta)
   {
      if(g4.util.UIUtil.isMouseOver(this))
      {
         this.scrollBar.wheel(delta);
      }
   }
}
