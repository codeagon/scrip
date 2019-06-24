class com.bluehole.tera.control.WidgetLoader extends gfx.events.EventDispatcher
{
   static var EVENT_SHOW = "show";
   static var EVENT_HIDE = "hide";
   static var EVENT_LOAD_INIT = "loadInit";
   static var EVENT_UNLOAD = "unload";
   var showProcess = false;
   var loadOK = false;
   var positionOK = false;
   var scaleOK = false;
   var positionChanged = false;
   var scaleChanged = false;
   var notRatio = false;
   var visiblilityBefore = true;
   var _disabled = false;
   function WidgetLoader(widgetData)
   {
      super();
      this.widgetData = widgetData;
      this.widgetName = widgetData.Name;
      if(widgetData.bAlwaysLoaded)
      {
         this.loadWidget();
      }
      if(widgetData.GROUP == 1)
      {
         this.posFunc = this.posAutoLayout;
      }
      else if(1 <= widgetData.GROUP && widgetData.GROUP < 50)
      {
         this.posFunc = this.posRatio;
      }
      else
      {
         this.posFunc = this.posOrigin;
      }
      var _loc4_ = this.widgetName.toLowerCase();
      if(widgetData.GROUP == 58 || widgetData.GROUP == 61 || _loc4_ == "expbar" || _loc4_ == "awesomeframe" || _loc4_ == "playguide")
      {
         this.scaleFunc = this.scaleNon;
      }
      else if(widgetData.GROUP < 50)
      {
         this.scaleFunc = this.scaleParent;
      }
      else
      {
         this.scaleFunc = this.scaleChildren;
      }
      this.alignInfoKeyword = "SCALE_" + this.widgetName.toUpperCase() + "_PERCENT";
      if(_loc4_ != "crosshair" && _loc4_ != "partywindow" && _loc4_ != "partywindowraidinfo")
      {
         this.keyword = "UISCALE_" + widgetData.Name.toUpperCase() + "_PERCENT";
         this.customScaleKey = lib.gamedata.CustomizedUIDataKey[this.keyword];
      }
      com.bluehole.tera.managers.LayoutManager.__get__instance().addManagingWidget(this);
      com.bluehole.tera.managers.ScaleManager.__get__instance().addManagingWidget(this);
   }
   static function make(widgetData)
   {
      return new com.bluehole.tera.control.WidgetLoader(widgetData);
   }
   function __get__locked()
   {
      return this._locked;
   }
   function __set__locked(value)
   {
      this._locked = value;
      this.widgetData.locked = !value?0:1;
      this.widget.container_mc.lock_mc.stat = value;
      this.widget.container_mc.lock_mc.lock(!value?0:1);
      return this.__get__locked();
   }
   function __get__moved()
   {
      return this._moved;
   }
   function __set__moved(value)
   {
      this._moved = value;
      this.widgetData.moved = !value?0:1;
      this.widget.container_mc.UIDrager.moved = value;
      return this.__get__moved();
   }
   function __get__disabled()
   {
      return this._disabled;
   }
   function __set__disabled(value)
   {
      this._disabled = value;
      return this.__get__disabled();
   }
   function invalidate()
   {
      if(this.invalidationIntervalID)
      {
         return undefined;
      }
      this.invalidationIntervalID = setInterval(this,"validateNow",1);
   }
   function validateNow()
   {
      clearInterval(this.invalidationIntervalID);
      delete this.invalidationIntervalID;
      this.draw();
   }
   function show(expandOption)
   {
      this.expandOption = expandOption;
      if(this.widget && this.widget._visible || this.showProcess)
      {
         return undefined;
      }
      this.redrawWidget();
   }
   function hide(expandOption)
   {
      this.showProcess = false;
      this.scaleOK = this.positionOK = false;
      if(!this.widget)
      {
         return undefined;
      }
      gs.TweenMax.killTweensOf(this.widget,false);
      _root.OnGameEvent("OnGameEventShowWindow",this.widgetName,false,expandOption);
      if(!this.widgetData.bAlwaysLoaded)
      {
         this.unloadWidget();
      }
      if(this.widgetData.GROUP == 1 && !this.__get__locked())
      {
         com.bluehole.tera.managers.LayoutManager.removeAutoPositionWidget(this);
         com.bluehole.tera.managers.LayoutManager.reflowAutoLayoutWidgets(com.bluehole.tera.managers.LayoutManager.LAYOUT_REFLOW_MODE_UNMANAGED_UI);
      }
      this.dispatchEvent({type:com.bluehole.tera.control.WidgetLoader.EVENT_HIDE,widget:this.widget,widgetName:this.widgetName});
   }
   function moveTo(x, y, notRatio)
   {
      this.positionOK = true;
      this.positionChanged = x != this.xPos || y != this.yPos;
      this.xPos = x;
      this.yPos = y;
      this.notRatio = notRatio;
      if(this.widget)
      {
         this.invalidate();
      }
   }
   function setScale(sRatio)
   {
      this.scaleOK = true;
      this.scaleChanged = true;
      this.scaleRatio = sRatio;
      if(this.widget)
      {
         this.invalidate();
      }
   }
   function setTop(normalLayer, battleLayer)
   {
      var _loc2_ = this.widget._parent;
      this.widget.swapDepths(_loc2_.getNextHighestDepth());
      if(_loc2_ == normalLayer || _loc2_ == battleLayer)
      {
         var _loc4_ = normalLayer.getDepth();
         var _loc3_ = battleLayer.getDepth();
         _loc2_.swapDepths(Math.max(_loc4_,_loc3_));
      }
   }
   function setPos(x, y, pivotType)
   {
      com.bluehole.tera.managers.LayoutManager.setUIPosition(this.widget,pivotType != undefined?pivotType:this.widgetData.PA,x,y);
      return com.bluehole.tera.managers.LayoutManager.isOut(this.widget);
   }
   function resetPosition()
   {
      this.__set__locked(false);
      this.__set__moved(false);
      this.xPos = this.widgetData.xRatio;
      this.yPos = this.widgetData.yRatio;
      com.bluehole.tera.managers.LayoutManager.saveUIPositon(this.widget,this.widgetData.PA,this.__get__locked(),this.xPos,this.yPos);
      if(this.widgetData.GROUP != 1)
      {
         this.moveTo(this.widgetData.xRatio,this.widgetData.yRatio);
      }
   }
   function resetLockedWidget()
   {
      if(this.widgetData.GROUP != 1 || this.__get__locked())
      {
         com.bluehole.tera.managers.LayoutManager.__get__instance().requestPosition(this);
      }
   }
   function draw()
   {
      if(!this.loadOK)
      {
         return undefined;
      }
      if(this.showProcess)
      {
         if(this.positionOK && this.scaleOK)
         {
            this.positionChanged = false;
            this.scaleChanged = false;
            this.widget.play();
            this.drawScale();
            this.drawPosition();
            this.showAni();
            this.widget._visible = this.visiblilityBefore;
            this.showProcess = false;
            _root.OnGameEvent("OnGameEventShowWindow",this.widgetName,true,this.expandOption);
            this.dispatchEvent({type:com.bluehole.tera.control.WidgetLoader.EVENT_SHOW,widget:this.widget,widgetName:this.widgetName});
         }
      }
      if(this.scaleChanged && !this.showProcess)
      {
         this.scaleChanged = false;
         this.drawScale();
      }
      if(this.positionChanged && !this.showProcess)
      {
         this.positionChanged = false;
         this.drawPosition();
      }
   }
   function drawPosition()
   {
      if(isNaN(this.xPos) || isNaN(this.yPos))
      {
         this.xPos = this.widgetData.xRatio;
         this.yPos = this.widgetData.yRatio;
         com.bluehole.tera.managers.LayoutManager.saveUIPositon(this.widget,this.widgetData.PA,this.__get__locked(),this.xPos,this.yPos);
      }
      if(this.notRatio)
      {
         this.widget._x = this.xPos;
         this.widget._y = this.yPos;
      }
      else
      {
         this.posFunc(this.xPos,this.yPos);
      }
   }
   function drawScale()
   {
      this.scaleFunc();
   }
   function redrawWidget()
   {
      this.showProcess = true;
      if(!this.loadOK)
      {
         this.loadWidget();
      }
      this.takePosition();
      this.takeScale();
      this.invalidate();
   }
   function loadWidget()
   {
      this.widget = com.bluehole.tera.managers.LayoutManager.__get__instance().getEmptyWidget(this.widgetName,this.widgetData.GROUP);
      if(!this.loader)
      {
         this.loader = new MovieClipLoader();
         this.loader.addListener(this);
      }
      this.loader.loadClip(this.widgetData.Path,this.widget);
   }
   function takePosition()
   {
      this.positionOK = false;
      com.bluehole.tera.managers.LayoutManager.__get__instance().requestPosition(this);
   }
   function takeScale()
   {
      this.scaleOK = false;
      com.bluehole.tera.managers.ScaleManager.__get__instance().requestScale(this);
   }
   function setUpWidget()
   {
      var _loc3_ = this.widgetName.toLowerCase();
      this.widget.info = this.widgetData;
      this.widget.group = this.widgetData.GROUP;
      _root.gUIList.push(this.widget);
      if(this.widgetData.bAlwaysLoaded)
      {
         if(this.widgetData.GROUP != 2 && this.widgetData.GROUP < 54)
         {
            lib.manager.UISkin.instance(this.widget);
         }
      }
      else
      {
         lib.manager.UISkin.instance(this.widget);
      }
      if(_loc3_ == "selectserver")
      {
         _root.OnGameEvent("OnGameEventShowWindow",this.widgetName,true);
      }
      if(_loc3_ == "progressbar" || _loc3_ == "gagebar")
      {
         this.widget.hitTestDisable = true;
      }
   }
   function unloadWidget()
   {
      this.loadOK = false;
      _global.EventBroadCaster.removeListener(this.widget.myListener);
      var _loc5_ = _root.gUIList;
      var _loc6_ = _loc5_.length;
      var _loc4_ = 0;
      while(_loc4_ < _loc6_)
      {
         if(_loc5_[_loc4_]._name == this.widgetName)
         {
            _loc5_.splice(_loc4_,1);
            break;
         }
         _loc4_ = _loc4_ + 1;
      }
      if(this.widget)
      {
         this.loader.unloadClip(this.widget);
         this.widget.removeMovieClip();
         this.widget = null;
         this.dispatchEvent({type:com.bluehole.tera.control.WidgetLoader.EVENT_UNLOAD,widget:this.widget,widgetName:this.widgetName});
      }
   }
   function showAni()
   {
      this.widget._alpha = 0;
      if(this.loadOK && this.scaleOK && this.positionOK)
      {
         this.widget.configWidget();
      }
      gs.TweenMax.to(this.widget,0.3,{_alpha:100,ease:mx.transitions.easing.Regular.easeOut});
   }
   function posAutoLayout(xRatio, yRatio)
   {
      if(this.__get__locked())
      {
         this.posRatio(xRatio,yRatio);
      }
      else
      {
         com.bluehole.tera.managers.LayoutManager.addAutoPositionWidget(this);
         com.bluehole.tera.managers.LayoutManager.reflowAutoLayoutWidgets(com.bluehole.tera.managers.LayoutManager.LAYOUT_REFLOW_MODE_UNMANAGED_UI);
      }
   }
   function posRatio(xRatio, yRatio)
   {
      if(this.setPos(xRatio,yRatio))
      {
         this.setPos(this.widgetData.xRatio,this.widgetData.yRatio);
      }
   }
   function posOrigin(xRatio, yRatio)
   {
      this.setPos(0,0,0);
   }
   function scaleNon()
   {
   }
   function scaleParent()
   {
      if(this.doNotScaleOption())
      {
         this.scaleWidget(this.scaleRatio);
      }
      else
      {
         com.bluehole.tera.managers.ScaleManager.scaleUI(this.widget,this.widgetData.SA,this.scaleRatio);
      }
   }
   function scaleChildren()
   {
      for(var _loc6_ in this.widget)
      {
         var _loc3_ = this.widget[_loc6_];
         var _loc5_ = _loc3_._parent._parent;
         var _loc4_ = _loc3_._parent._parent._parent;
         if(typeof _loc3_ == "movieclip" && _loc3_ != this.widget && _loc3_ != _root.container_chat_mc.Chat2 && this.widget != _loc5_ && this.widget != _loc4_)
         {
            if(this.doNotScaleOption())
            {
               this.scaleWidget(this.scaleRatio);
            }
            else
            {
               com.bluehole.tera.managers.ScaleManager.scaleUI(_loc3_,this.widgetData.SA,this.scaleRatio);
            }
         }
      }
   }
   function scaleWidget(scaleR)
   {
      if(this.widget._xscale != scaleR || this.widget._yscale != scaleR)
      {
         this.widget._xscale = scaleR;
         this.widget._yscale = scaleR;
      }
   }
   function doNotScaleOption()
   {
      return this.showProcess;
   }
   function onLoadError(target, errorCode, httpStatus)
   {
   }
   function onLoadComplete(target)
   {
   }
   function onLoadInit(target)
   {
      this.visiblilityBefore = this.widget._visible;
      this.widget.stop();
      this.widget._visible = false;
      this.setUpWidget(this.widget);
      this.loadOK = true;
      this.dispatchEvent({type:com.bluehole.tera.control.WidgetLoader.EVENT_LOAD_INIT,widget:this.widget,widgetName:this.widgetName});
      this.invalidate();
   }
}
