class g4.view.delivery.Delivery extends g4.core.View
{
   function Delivery(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.DELIVERY;
   }
   function configUI()
   {
      this.container_mc = this.__get__targetMovieClip().container_mc;
      this.text_title = this.container_mc.text_title;
      this.mc_deliverable_item_list = this.container_mc.mc_deliverable_item_list;
      this.mc_delivery_item_list = this.container_mc.mc_delivery_item_list;
      this.mc_result = this.container_mc.mc_result;
      this.executeButton = this.container_mc.button_execute.txtBtn;
      this.container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip(),this.container_mc.lock_mc);
      this.__get__targetMovieClip().scaleExpander.scaleExpanderEventCheck(this.__get__targetMovieClip(),this.getUIName());
      this.text_title.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
      this.text_title.textAutoSize = "shrink";
      this.text_title.verticalAlign = "center";
      this.text_title.html = true;
      this.text_title.htmlText = "";
      this.container_mc.text_title_1.htmlText = "$770006";
      var _loc2_ = new lib.util.TxtBtn(this.container_mc.x_mc);
      _loc2_.setRelease(gfx.utils.Delegate.create(this,function()
      {
         this.ToGame_Delivery_CloseUI();
      }
      ));
      this.mc_result.text_title.htmlText = "$770007";
      this.mc_result.text_guide.textAutoSize = "shrink";
      this.mc_result.text_guide.verticalAlign = "center";
      this.mc_result.text_guide.html = true;
      this.mc_result.text_guide.htmlText = "";
      this.mc_result.text_title_0.textAutoSize = "shrink";
      this.mc_result.text_title_0.htmlText = "$770008";
      this.mc_result.text_title_1.textAutoSize = "shrink";
      this.mc_result.text_title_1.htmlText = "";
      this.executeButton.setRelease(gfx.utils.Delegate.create(this,function()
      {
         this.ToGame_Delivery_Execute();
      }
      ));
      this.executeButton.setEnabled(false);
      g4.util.UIUtil.callLater(this,"ToGame_Delivery_Init");
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_Delivery_SetType",gfx.utils.Delegate.create(this,this.OnGame_Delivery_SetType));
      this.registerGameInterface("OnGame_Delivery_SetDeliverableListGold",gfx.utils.Delegate.create(this,this.OnGame_Delivery_SetDeliverableListGold));
      this.registerGameInterface("OnGame_Delivery_SetDeliverableListMedal",gfx.utils.Delegate.create(this,this.OnGame_Delivery_SetDeliverableListMedal));
      this.registerGameInterface("OnGame_Delivery_SetDeliveryList",gfx.utils.Delegate.create(this,this.OnGame_Delivery_SetDeliveryList));
      this.registerGameInterface("OnGame_Delivery_SetResultMoney",gfx.utils.Delegate.create(this,this.OnGame_Delivery_SetResultMoney));
      this.registerGameInterface("OnGame_Delivery_SetResultMedal",gfx.utils.Delegate.create(this,this.OnGame_Delivery_SetResultMedal));
      this.registerGameInterface("OnGame_Delivery_SetRemainingDeliveryCount",gfx.utils.Delegate.create(this,this.OnGame_Delivery_SetRemainingDeliveryCount));
      this.registerGameInterface("OnGame_Delivery_SetTitle",gfx.utils.Delegate.create(this,this.OnGame_Delivery_SetTitle));
      this.registerGameInterface("OnGame_Delivery_SetDescription",gfx.utils.Delegate.create(this,this.OnGame_Delivery_SetDescription));
      this.registerGameInterface("OnGame_MouseWheel",gfx.utils.Delegate.create(this,this.OnGame_MouseWheel));
   }
   function OnGame_Delivery_SetType(type, medalImage)
   {
      type = Number(type);
      g4.view.delivery.DeliveryGlobals.medalImage = medalImage;
      switch(type)
      {
         case g4.view.delivery.DeliveryConstants.DELIVERY_TYPE_GOLD:
         default:
            this.mc_result.text_title_1.htmlText = "$770003";
            this.mc_result.mc_icon_0.clear();
            this.mc_result.mc_icon_1.clear();
            break;
         case g4.view.delivery.DeliveryConstants.DELIVERY_TYPE_MEDAL:
            this.mc_result.text_title_1.htmlText = "$770004";
            g4.view.delivery.DeliveryUtil.drawBitmap(medalImage,this.mc_result.mc_icon_1,0,0,16,16);
            break;
         case g4.view.delivery.DeliveryConstants.DELIVERY_TYPE_REPUTATION_COIN:
            g4.view.delivery.DeliveryGlobals.medalImage = g4.view.delivery.DeliveryConstants.REPUTATION_COIN_IMAGE_PATH;
            this.mc_result.text_title_1.htmlText = "$770004";
            g4.view.delivery.DeliveryUtil.drawBitmap(medalImage,this.mc_result.mc_icon_1,0,0,16,16);
      }
   }
   function OnGame_Delivery_SetDeliverableListGold(dataList)
   {
      this.mc_deliverable_item_list.setDataGold(dataList);
   }
   function OnGame_Delivery_SetDeliverableListMedal(dataList)
   {
      this.mc_deliverable_item_list.setDataMedal(dataList);
   }
   function OnGame_Delivery_SetDeliveryList(dataList)
   {
      if(this.mc_delivery_item_list.setData(dataList) > 0)
      {
         this.executeButton.setEnabled(true);
      }
      else
      {
         this.executeButton.setEnabled(false);
      }
   }
   function OnGame_Delivery_SetResultMoney(total)
   {
      this.mc_result.text_total.htmlText = lib.util.GoldCurrency.SetGoldText(total);
      this.mc_result.text_total._x = 452 - this.mc_result.text_total._width;
   }
   function OnGame_Delivery_SetResultMedal(total)
   {
      this.mc_result.text_total.htmlText = lib.util.CurrencyFormat.makeComma(total);
      this.mc_result.text_total._x = 210;
   }
   function OnGame_Delivery_SetRemainingDeliveryCount(currentValue, maxValue)
   {
      var _loc2_ = currentValue <= 0?"<font color=\'#" + lib.info.TextColor.GENERAL_IMPOSSIBLE + "\'>":"<font color=\'#ffffff\'>";
      _loc2_ = _loc2_ + (lib.util.CurrencyFormat.makeComma(currentValue) + "</font><font color=\'#999999\'>/" + lib.util.CurrencyFormat.makeComma(maxValue) + "</font>");
      this.mc_result.text_remaining.verticalAlign = "center";
      this.mc_result.text_remaining.htmlText = _loc2_;
   }
   function OnGame_Delivery_SetTitle(title)
   {
      this.text_title.htmlText = title;
   }
   function OnGame_Delivery_SetDescription(description)
   {
      this.mc_result.text_guide.htmlText = description;
   }
   function OnGame_MouseWheel(delta, target)
   {
      this.mc_deliverable_item_list.mouseWheel(delta);
   }
   function ToGame_Delivery_Init()
   {
      g4.model.GameInterface.callGameInterface("ToGame_Delivery_Init");
   }
   function ToGame_Delivery_CloseUI()
   {
      g4.model.GameInterface.callGameInterface("ToGame_Delivery_CloseUI");
   }
   function ToGame_Delivery_Execute(page)
   {
      g4.model.GameInterface.callGameInterface("ToGame_Delivery_Execute");
   }
}
