class com.bluehole.tera.view.core.Widget extends gfx.core.UIComponent implements com.bluehole.tera.interfaces.IWidget
{
   var widgetName = "";
   var widgetDataChanged = false;
   var swfChanged = false;
   var _disable = false;
   function Widget()
   {
      super();
   }
   function __get__locked()
   {
      if(this.widgetSWF.container_mc.lock_mc)
      {
         return this.widgetSWF.container_mc.lock_mc.stat == 1;
      }
      return false;
   }
   function __set__locked(value)
   {
      if(this.widgetSWF.container_mc.lock_mc)
      {
         this.widgetSWF.container_mc.lock_mc.stat = !value?0:1;
         this.widgetSWF.container_mc.lock_mc.lock(value);
      }
      return this.__get__locked();
   }
   function __get__moved()
   {
      if(this.widgetSWF)
      {
         return this.widgetSWF.container_mc.UIDrager.moved;
      }
      return false;
   }
   function __set__moved(value)
   {
      if(this.widgetSWF)
      {
         this.widgetSWF.container_mc.UIDrager.moved = value;
      }
      return this.__get__moved();
   }
   function __get__disable()
   {
      return this._disable;
   }
   function __set__disable(value)
   {
      this._disable = value;
      var _loc2_ = new flash.geom.Transform(this.widgetSWF);
      if(value)
      {
         _loc2_.colorTransform = lib.info.ColorTrans.popupDisableTrans();
         this.widgetSWF.onRelease = function()
         {
         };
      }
      else
      {
         _loc2_.colorTransform = lib.info.ColorTrans.enableTrans();
         delete this.widgetSWF.onRelease;
      }
      return this.__get__disable();
   }
   function __get__isShown()
   {
      if(this.widgetSWF)
      {
         return this.widgetSWF._visible;
      }
      return false;
   }
   function show(expandOption)
   {
      if(!this.__get__isShown())
      {
         lib.manager.UISound.showUI(this.widgetName,true);
      }
      if(this.widgetSWF)
      {
         if(this.widgetSWF.OnGameEventShowWindow != null)
         {
            this.widgetSWF.OnGameEventShowWindow(this.widgetName,true,expandOption);
         }
         else
         {
            this.widgetSWF._visible = true;
         }
      }
   }
   function hide()
   {
      if(this.widgetSWF)
      {
         this.widgetSWF._visible = false;
      }
   }
   function getID()
   {
      return this.uid;
   }
   function setID(uid)
   {
      this.uid = uid;
   }
   function getName()
   {
      return this.widgetName;
   }
   function getWidgetData()
   {
      return this.widgetData;
   }
   function setWidgetData(widgetData)
   {
      this.widgetData = widgetData;
      this.widgetDataChanged = true;
      this.invalidate();
   }
   function getHitArea()
   {
      if(this.widgetSWF)
      {
         return this.widgetSWF.hit;
      }
      return this.widgetLoader;
   }
   function setDraggerData(widgetName, target)
   {
      if(this.widgetSWF && this.widgetSWF.container_mc.UIDrager)
      {
         this.widgetSWF.container_mc.UIDrager.setData(widgetName,target,this.widgetSWF.container_mc.lock_mc);
      }
   }
   function getWidgetContainer()
   {
      if(this.widgetSWF)
      {
         return this.widgetSWF.container_mc;
      }
      return null;
   }
   function toString()
   {
      return !("[com.bluehole.tera.view.core.Widget " + (this.widgetName == ""))?this.widgetName + "]":this._name;
   }
   function configUI()
   {
      super.configUI();
      this.widgetLoader.__set__autoSize(false);
   }
   function draw()
   {
      super.draw();
      if(this.widgetDataChanged)
      {
         this.widgetDataChanged = false;
         this.widgetName = this.widgetData.Name;
         this.loadWidgetSWF();
      }
   }
   function loadWidgetSWF()
   {
      this.widgetLoader.__set__source(this.widgetData.Path);
      this.widgetLoader.addEventListener("ioError",this,"widgetLoader_ioErrorHandler");
      this.widgetLoader.addEventListener("complete",this,"widgetLoader_completeHandler");
   }
   function initWidget()
   {
      this.widgetSWF._name = this.widgetName;
      this.widgetSWF.startDrag = this.startDragHandler;
      if(this.widgetSWF.lock_mc)
      {
         this.widgetSWF.lock_mc.setEnabled(this.widgetData.locked);
      }
      this.__set__locked(this.widgetData.locked);
      this.layoutWidget();
      if(this.widgetData.GROUP != 2 && this.widgetData.GROUP < 54)
      {
         lib.manager.UISkin.instance(this);
      }
      if(this.widgetData.Name.toLowerCase() != "crosshair" && this.widgetData.Name.toLowerCase() != "partywindow" && this.widgetData.Name.toLowerCase() != "partywindowraidinfo")
      {
         com.bluehole.tera.managers.ScaleManager.getInstance().addCustomScale(this);
      }
   }
   function layoutWidget()
   {
      var _loc3_ = 0;
      var _loc4_ = 0;
      var _loc2_ = this.getHitArea();
      switch(this.widgetData.PA % 3)
      {
         case 2:
            _loc3_ = - _loc2_._width >> 1;
            break;
         case 0:
            _loc3_ = - _loc2_._width;
      }
      switch(Math.floor((this.widgetData.PA - 1) / 3))
      {
         case 1:
            _loc4_ = - _loc2_._height >> 1;
            break;
         case 2:
            _loc4_ = - _loc2_._height;
      }
      this.widgetLoader._x = _loc3_;
      this.widgetLoader._y = _loc4_;
   }
   function widgetLoader_ioErrorHandler()
   {
      this.widgetLoader.removeEventListener("ioError",this,"widgetLoader_ioErrorHandler");
      this.widgetLoader.removeEventListener("complete",this,"widgetLoader_completeHandler");
      trace("위젯 로드 애러 - " + this.toString() + " - widgetName : " + this.widgetName);
      this.dispatchEvent({type:"loadError"});
   }
   function widgetLoader_completeHandler()
   {
      this.widgetLoader.removeEventListener("ioError",this,"widgetLoader_ioErrorHandler");
      this.widgetLoader.removeEventListener("complete",this,"widgetLoader_completeHandler");
      this.widgetSWF = this.widgetLoader.content;
      this.initWidget();
      this.dispatchEvent({type:"loadComplete"});
   }
   function startDragHandler()
   {
   }
   function stopDragHandler()
   {
      this.stopDrag();
   }
}
