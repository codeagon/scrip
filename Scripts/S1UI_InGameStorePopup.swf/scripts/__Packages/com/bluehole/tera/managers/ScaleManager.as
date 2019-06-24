class com.bluehole.tera.managers.ScaleManager extends gfx.events.EventDispatcher
{
   var managingWidgets = {};
   var widgetByScaleKey = {};
   function ScaleManager()
   {
      super();
      var _loc3_ = lib.gamedata.CustomizedUIDataCollection.getInstance();
      lib.info.AlignInfo.scaleRatio = _loc3_.valueOf(lib.gamedata.CustomizedUIDataKey.UISCALE_ALL_PERCENT) * 0.01;
      _loc3_.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"scaleChangedHandler");
   }
   static function scaleUI(ui, pivotType, scaleRatio)
   {
      if(isNaN(scaleRatio))
      {
         lib.Debuger.trace("ScaleManager - scaleUI - 유효한 scaleRatio가 아니다 - ui : " + ui._name);
         return undefined;
      }
      if(scaleRatio == ui._xscale && scaleRatio == ui._yscale)
      {
         return undefined;
      }
      var _loc4_ = com.bluehole.tera.managers.ScaleManager.getPivotPoint(ui,pivotType);
      ui._xscale = scaleRatio;
      ui._yscale = scaleRatio;
      var _loc3_ = com.bluehole.tera.managers.ScaleManager.getPivotPoint(ui,pivotType);
      ui._x = ui._x - (_loc3_.x - _loc4_.x);
      ui._y = ui._y - (_loc3_.y - _loc4_.y);
   }
   static function getPivotPoint(ui, pivotType)
   {
      var _loc2_ = new flash.geom.Point();
      var _loc5_ = ui._x;
      var _loc4_ = ui._y;
      ui._x = 0;
      ui._y = 0;
      var _loc1_ = ui.hit.getBounds(ui._parent);
      if(!_loc1_)
      {
         _loc1_ = {xMin:0,yMin:0,xMax:0,yMax:0};
      }
      switch(pivotType)
      {
         case 1:
            _loc2_.x = _loc1_.xMin;
            _loc2_.y = _loc1_.yMin;
            break;
         case 2:
            _loc2_.x = _loc1_.xMin + _loc1_.xMax >> 1;
            _loc2_.y = _loc1_.yMin;
            break;
         case 3:
            _loc2_.x = _loc1_.xMax;
            _loc2_.y = _loc1_.yMin;
            break;
         case 4:
            _loc2_.x = _loc1_.xMin;
            _loc2_.y = _loc1_.yMin + _loc1_.yMax >> 1;
            break;
         case 5:
            _loc2_.x = _loc1_.xMin + _loc1_.xMax >> 1;
            _loc2_.y = _loc1_.yMin + _loc1_.yMax >> 1;
            break;
         case 6:
            _loc2_.x = _loc1_.xMax;
            _loc2_.y = _loc1_.yMin + _loc1_.yMax >> 1;
            break;
         case 7:
            _loc2_.x = _loc1_.xMin;
            _loc2_.y = _loc1_.yMax;
            break;
         case 8:
            _loc2_.x = _loc1_.xMin + _loc1_.xMax >> 1;
            _loc2_.y = _loc1_.yMax;
            break;
         case 9:
            _loc2_.x = _loc1_.xMax;
            _loc2_.y = _loc1_.yMax;
      }
      ui._x = _loc5_;
      ui._y = _loc4_;
      return _loc2_;
   }
   static function getUIEdges(ui)
   {
      var _loc1_ = ui.hit;
      var _loc3_ = undefined;
      if(_loc1_)
      {
         _loc3_ = _loc1_.getBounds(ui._parent);
      }
      else
      {
         _loc3_ = ui.getBounds(ui._parent);
      }
      return _loc3_;
   }
   static function __get__instance()
   {
      if(com.bluehole.tera.managers.ScaleManager._instance == null)
      {
         com.bluehole.tera.managers.ScaleManager._instance = new com.bluehole.tera.managers.ScaleManager();
      }
      return com.bluehole.tera.managers.ScaleManager._instance;
   }
   function requestScale(wLoader)
   {
      wLoader.setScale(this.getScaleRatio(wLoader));
   }
   function addManagingWidget(widgetLoader)
   {
      this.managingWidgets[widgetLoader.widgetName.toLowerCase()] = widgetLoader;
      var _loc5_ = widgetLoader.alignInfoKeyword;
      var _loc3_ = widgetLoader.customScaleKey;
      if(_loc3_)
      {
         var _loc4_ = lib.gamedata.CustomizedUIDataCollection.getInstance().valueOf(_loc3_);
         if(!isNaN(_loc4_))
         {
            lib.info.AlignInfo[_loc5_] = _loc4_;
         }
         this.widgetByScaleKey[_loc3_] = widgetLoader;
      }
   }
   function scaleWidget(widgetName, exception)
   {
      exception = exception.toLowerCase();
      var _loc4_ = [];
      var _loc5_ = false;
      if(widgetName == "" || widgetName == undefined || widgetName == null)
      {
         for(var _loc8_ in this.managingWidgets)
         {
            if(_loc8_.toLowerCase() != exception)
            {
               _loc4_.push(_loc8_);
               if(!_loc5_ && this.managingWidgets[_loc8_].widgetData.GROUP == 1)
               {
                  _loc5_ = true;
               }
            }
         }
      }
      else if(widgetName.toLowerCase() != exception)
      {
         _loc4_.push(widgetName);
         _loc5_ = this.getWidgetLoaderByWidgetName(widgetName).widgetData.GROUP == 1;
      }
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         var _loc3_ = this.getWidgetLoaderByWidgetName(_loc4_[_loc2_]);
         _loc3_.setScale(this.getScaleRatio(_loc3_));
         _loc2_ = _loc2_ + 1;
      }
      if(_loc5_)
      {
         com.bluehole.tera.managers.LayoutManager.reflowAutoLayoutWidgets(com.bluehole.tera.managers.LayoutManager.LAYOUT_REFLOW_MODE_UNMANAGED_UI);
      }
   }
   function getWidgetLoaderByWidgetName(widgetName)
   {
      return (com.bluehole.tera.control.WidgetLoader)this.managingWidgets[widgetName.toLowerCase()];
   }
   function getScaleRatio(wLoader)
   {
      var _loc2_ = lib.info.AlignInfo.uiScale(wLoader.widgetName,wLoader.widget);
      var _loc1_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc2_);
      return _loc1_ * 100;
   }
   function scaleChangedHandler(e)
   {
      if(e.key == lib.gamedata.CustomizedUIDataKey.UISCALE_ALL_PERCENT)
      {
         lib.info.AlignInfo.scaleRatio = e.value * 0.01;
         this.scaleWidget();
      }
      else
      {
         var _loc5_ = e.key;
         var _loc2_ = (com.bluehole.tera.control.WidgetLoader)this.widgetByScaleKey[_loc5_];
         if(_loc2_)
         {
            lib.info.AlignInfo.uiScale(_loc2_.widgetName,_loc2_.widget);
            if(e.value && !isNaN(e.value))
            {
               var _loc4_ = _loc2_.alignInfoKeyword;
               lib.info.AlignInfo[_loc4_] = e.value;
               _loc2_.setScale(this.getScaleRatio(_loc2_));
            }
         }
      }
   }
}
