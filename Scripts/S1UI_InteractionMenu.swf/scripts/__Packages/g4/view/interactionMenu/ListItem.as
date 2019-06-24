class g4.view.interactionMenu.ListItem extends g4.core.SimpleView
{
   function ListItem(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function configUI()
   {
      this.textField = this.__get__targetMovieClip().textField;
      this.mc_icon_arrow = this.__get__targetMovieClip().mc_icon_arrow;
      var _loc2_ = new TextFormat();
      _loc2_.leftMargin = g4.view.interactionMenu.InteractionMenuConstants.TEXT_MARGIN;
      _loc2_.rightMargin = g4.view.interactionMenu.InteractionMenuConstants.TEXT_MARGIN;
      this.textField.verticalAlign = "center";
      this.textField.textAutoSize = "shrink";
      this.textField.multiline = false;
      this.textField.setNewTextFormat(_loc2_);
      g4.util.UIUtil.setMouseEnabled(this.textField,false);
      g4.util.UIUtil.setTextFieldStyle(this.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setMouseEnabled(this.mc_icon_arrow,false);
      this.__get__targetMovieClip().hit.clickArea = true;
      this.__get__targetMovieClip().hit.onRollOver = gfx.utils.Delegate.create(this,function()
      {
         if(this.menuData.enabled)
         {
            this.targetMovieClip.gotoAndStop(2);
            this.setTextFieldColor(g4.view.interactionMenu.InteractionMenuConstants.TEXT_COLOR_OVER,g4.view.interactionMenu.InteractionMenuConstants.TEXT_FILTER_COLOR_OVER);
            this.mc_icon_arrow.gotoAndStop(2);
         }
         this.dispatchItemEvent(g4.view.interactionMenu.List.ITEM_ROLL_OVER);
      }
      );
      this.__get__targetMovieClip().hit.onRollOut = this.__get__targetMovieClip().hit.onReleaseOutside = gfx.utils.Delegate.create(this,function()
      {
         if(this.menuData.enabled)
         {
            this.targetMovieClip.gotoAndStop(1);
            this.setTextFieldColor(g4.view.interactionMenu.InteractionMenuConstants.TEXT_COLOR_UP,g4.view.interactionMenu.InteractionMenuConstants.TEXT_FILTER_COLOR_UP);
            this.mc_icon_arrow.gotoAndStop(1);
         }
         this.dispatchItemEvent(g4.view.interactionMenu.List.ITEM_ROLL_OUT);
      }
      );
      this.__get__targetMovieClip().hit.onPress = gfx.utils.Delegate.create(this,function()
      {
         if(this.menuData.enabled)
         {
            this.targetMovieClip.gotoAndStop(3);
            this.setTextFieldColor(g4.view.interactionMenu.InteractionMenuConstants.TEXT_COLOR_DOWN,g4.view.interactionMenu.InteractionMenuConstants.TEXT_FILTER_COLOR_DOWN);
         }
      }
      );
      this.__get__targetMovieClip().hit.onRelease = gfx.utils.Delegate.create(this,function()
      {
         if(this.menuData.enabled)
         {
            this.targetMovieClip.gotoAndStop(2);
            this.setTextFieldColor(g4.view.interactionMenu.InteractionMenuConstants.TEXT_COLOR_OVER,g4.view.interactionMenu.InteractionMenuConstants.TEXT_FILTER_COLOR_OVER);
            this.dispatchItemEvent(g4.view.interactionMenu.List.ITEM_CLICK);
         }
      }
      );
      this.cleanUp();
   }
   function setData(menuData)
   {
      if(menuData == null)
      {
         this.cleanUp();
         return undefined;
      }
      this.menuData = menuData;
      this.textField.text = menuData.label;
      if(menuData.enabled)
      {
         this.setTextFieldColor(g4.view.interactionMenu.InteractionMenuConstants.TEXT_COLOR_UP,g4.view.interactionMenu.InteractionMenuConstants.TEXT_FILTER_COLOR_UP);
      }
      else
      {
         this.setTextFieldColor(g4.view.interactionMenu.InteractionMenuConstants.TEXT_COLOR_DISABLED,g4.view.interactionMenu.InteractionMenuConstants.TEXT_FILTER_COLOR_DISABLED);
      }
      this.mc_icon_arrow._visible = menuData.children != null && menuData.children.length > 0;
      this.__get__targetMovieClip()._visible = true;
   }
   function cleanUp()
   {
      this.menuData = null;
      this.__get__targetMovieClip()._visible = false;
      this.mc_icon_arrow._visible = false;
      this.mc_icon_arrow.gotoAndStop(1);
      this.textField.text = "";
   }
   function setY(value)
   {
      this.__get__targetMovieClip()._y = value;
   }
   function dispatchItemEvent(type)
   {
      var _loc2_ = {};
      _loc2_.type = type;
      _loc2_.data = this.menuData.data;
      _loc2_.target = this.targetMovieClip;
      this.dispatchEvent(_loc2_);
   }
   function setTextFieldColor(textColor, filterColor)
   {
      this.textField.textColor = textColor;
      if(filterColor == -1)
      {
         if(g4.view.interactionMenu.ListItem.textFieldNoFilters == null)
         {
            var _loc2_ = new flash.filters.DropShadowFilter();
            _loc2_.distance = 0;
            _loc2_.angle = 0;
            _loc2_.color = 0;
            _loc2_.alpha = 0;
            _loc2_.blurX = 0;
            _loc2_.blurY = 0;
            _loc2_.strength = 0;
            g4.view.interactionMenu.ListItem.textFieldNoFilters = [_loc2_];
         }
         this.textField.filters = g4.view.interactionMenu.ListItem.textFieldNoFilters;
      }
      else
      {
         if(g4.view.interactionMenu.ListItem.textFieldFilters == null)
         {
            g4.view.interactionMenu.ListItem.textFieldFilter = g4.util.UIUtil.getTextFieldFilter(g4.util.UIUtil.TEXT_FIELD_STYLE_1);
            g4.view.interactionMenu.ListItem.textFieldFilters = [g4.view.interactionMenu.ListItem.textFieldFilter];
         }
         g4.view.interactionMenu.ListItem.textFieldFilter.color = filterColor;
         this.textField.filters = g4.view.interactionMenu.ListItem.textFieldFilters;
      }
   }
}
