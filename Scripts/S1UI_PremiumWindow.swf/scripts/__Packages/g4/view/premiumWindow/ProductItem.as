class g4.view.premiumWindow.ProductItem extends gfx.core.UIComponent
{
   var remainingTimeSec = 0;
   function ProductItem()
   {
      super();
   }
   function configUI()
   {
      this.mc_icon.mc_temp.swapDepths(this.mc_icon.getNextHighestDepth());
      this.mc_icon.mc_temp.removeMovieClip();
      g4.util.UIUtil.setMouseEnabled(this.mc_icon,false);
      this.text_time.multiline = false;
      this.text_time.wordWrap = false;
      this.text_time.selectable = false;
      this.text_time.textAutoSize = "shrink";
      this.text_time.verticalAlign = "top";
      g4.util.UIUtil.setMouseEnabled(this.text_time,false);
      this.cleanUp();
   }
   function cleanUp()
   {
      this._visible = false;
      lib.manager.ToolTip.remove(this);
      this.mc_icon.clear();
      this.setRemainingTime(0);
   }
   function setData(id, image, remainingTime)
   {
      this.cleanUp();
      lib.display.DrawBitmapData.draw(this.mc_icon,image,0,0,0,0,g4.view.premiumWindow.PremiumWindowConstants.PRODUCT_ITEM_ICON_WIDTH,g4.view.premiumWindow.PremiumWindowConstants.PRODUCT_ITEM_ICON_HEIGHT,g4.view.premiumWindow.PremiumWindowConstants.PRODUCT_ITEM_ICON_SCALE);
      lib.manager.ToolTip.add(this,"0\t" + id,lib.manager.ToolTip.TOOL_TIP_TYPE_PREMIUM_WINDOW);
      this.setRemainingTime(remainingTime);
      this._visible = true;
   }
   function setRemainingTime(remainingTime)
   {
      this.remainingTimeSec = remainingTime * 0.001;
      if(this.remainingTimeSec > 0)
      {
         g4.util.TimeUtil.addListener(this,"updateTime");
      }
      else
      {
         g4.util.TimeUtil.removeListener(this,"updateTime");
      }
      this.updateRemainingTime();
   }
   function updateRemainingTime()
   {
      if(this.remainingTimeSec > 0)
      {
         this.text_time.text = g4.util.Translator.convertSecond(this.remainingTimeSec);
      }
      else
      {
         this.text_time.text = "";
      }
   }
   function updateTime(event)
   {
      this.remainingTimeSec = this.remainingTimeSec - g4.util.TimeUtil.deltaTime;
      if(this.remainingTimeSec <= 0)
      {
         g4.util.TimeUtil.removeListener(this,"updateTime");
      }
      this.updateRemainingTime();
   }
}
