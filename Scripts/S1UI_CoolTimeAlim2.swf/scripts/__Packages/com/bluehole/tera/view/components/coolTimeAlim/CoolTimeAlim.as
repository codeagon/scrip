class com.bluehole.tera.view.components.coolTimeAlim.CoolTimeAlim extends com.bluehole.tera.view.core.WidgetContainer
{
   var SLOT_WIDTH = 40;
   function CoolTimeAlim()
   {
      super();
      this.UI.UIname = "CoolTimeAlim2";
   }
   function toString()
   {
      return "[com.bluehole.tera.view.components.coolTimeAlim.CoolTimeAlim " + this._name + "]";
   }
   function configUI()
   {
      super.configUI();
      this.titleBtn._width = this.SLOT_WIDTH;
      this.titleBtn._height = this.SLOT_WIDTH;
      this.listCtrl.addEventListener(com.bluehole.tera.view.components.coolTimeAlim.CoolTimeList.EVENT_COOLTIMEALIMLIST_SLOT_SIZE_CHANGED,this,"listCtrl_slotSizeChangedHandler");
   }
   function configEvents()
   {
      var thisObject = this;
      this.globalEventListener.OnGameEventShowWindow = function(widgetName, bShow, expandOption)
      {
         if(widgetName.toLowerCase() == thisObject.UI.UIname.toLowerCase())
         {
            thisObject.UI.bWidgetOpen = Number(bShow);
            thisObject.UI._visible = Boolean(bShow);
         }
      };
      this.globalEventListener.OnGameEventChangeUIMode = function(bShow)
      {
      };
   }
   function UIModeVisibility()
   {
      return true;
   }
   function listCtrl_slotSizeChangedHandler(e)
   {
      var _loc3_ = undefined;
      var _loc2_ = 0;
      do
      {
         _loc2_ = _loc2_ + 1;
      }
      while(this.listCtrl.showingSlots[_loc2_]);
      
      this.titleBtn._width = this.SLOT_WIDTH * (_loc2_ % 12);
      this.titleBtn._height = this.SLOT_WIDTH * Math.ceil((_loc2_ + 1) / 12);
   }
}
