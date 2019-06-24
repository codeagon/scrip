class com.bluehole.tera.managers.WidgetManager
{
   static var ARRANGE_MODE_ALL_WIDGETS = 0;
   static var ARRANGE_MODE_UNLOCKED_WIDGETS = 1;
   static var ARRANGE_MODE_UNLOCKED_AND_NOT_MOVED_WIDGETS = 2;
   static var WIDGET_GAP = 5;
   static var _uid_index = 0;
   var initialized = false;
   var registeredWidgetDatas = {};
   var loadedWidgets = {};
   var toArrangeWidgets = [];
   var waitingShowUI = {};
   var disableUIName_array = [];
   var readyToPositions = {};
   function WidgetManager()
   {
      super();
   }
   static function getInstance()
   {
      if(com.bluehole.tera.managers.WidgetManager._instance == null)
      {
         com.bluehole.tera.managers.WidgetManager._instance = new com.bluehole.tera.managers.WidgetManager();
      }
      return com.bluehole.tera.managers.WidgetManager._instance;
   }
   function init(uiRoot)
   {
      this.uiRoot = uiRoot;
      this.stage_resizeHandler(null);
      this.stageResizeObject = new Object();
      this.stageResizeObject.onResize = gfx.utils.Delegate.create(this,this.stage_resizeHandler);
      Stage.addListener(this.stageResizeObject);
      this.axis = new lib.util.AxisResetter();
      this.enableTrans = lib.info.ColorTrans.enableTrans();
      this.disableTrans = lib.info.ColorTrans.slotDragTrans();
      this.initialized = true;
   }
   function registerWidgetData(name, path, x, y, alwaysLoaded, group, logoutClose, soundData, addData)
   {
      var _loc3_ = new com.bluehole.tera.datas.WidgetData(name,path,x,y,alwaysLoaded,group,logoutClose,soundData,addData);
      this.registeredWidgetDatas[name.toUpperCase()] = _loc3_;
      lib.manager.UISound.addOnSound(name,soundData);
      if(alwaysLoaded)
      {
         this.showWidget(name);
      }
   }
   function getWidgetData(wName)
   {
      var _loc2_ = wName.toUpperCase();
      return this.registeredWidgetDatas[_loc2_];
   }
   function getRegisteredLayer(wName)
   {
      return this.getLayerByGroup(this.getWidgetData(wName).GROUP);
   }
   function showWidget(wName, expandOption)
   {
      var _loc2_ = (com.bluehole.tera.view.core.Widget)this.getLoadedWidget(wName);
      var _loc3_ = this.getWidgetData(wName);
      if(_loc2_ == null || _loc2_ == undefined)
      {
         if(_loc3_ == null || _loc3_ == undefined)
         {
            return undefined;
         }
         if(this.waitingShowUI[wName].lstate != undefined)
         {
            return undefined;
         }
         this.loadWidget(_loc3_.Name,expandOption);
      }
      if(_loc2_ && !_loc2_.__get__isShown())
      {
         this.ToGame_RequestSetUIPosition(wName);
         _loc2_.__set__moved(false);
         _loc2_.swapDepths(_loc2_._parent.getNextHighestDepth());
         if(_loc3_.GROUP == 1 || _loc3_.GROUP == 3 || _loc3_.GROUP == 10)
         {
            var _loc7_ = this.getLayerByGroup(1).getDepth();
            var _loc6_ = this.getLayerByGroup(10).getDepth();
            var _loc5_ = Math.max(_loc7_,_loc6_);
            _loc2_._parent.swapDepths(_loc5_);
         }
         _loc2_.show(expandOption);
         if(wName.toLowerCase() == "senatorregistration")
         {
            this.OnGameEvent("OnGame_DisableUI","SenatorMap",true);
         }
      }
   }
   function hideWidget(Name, doNotAlign, expandOption)
   {
   }
   function loadWidget(wName, expandOption)
   {
      var _loc3_ = this.getWidgetData(wName);
      if(_loc3_)
      {
         this.waitingShowUI[wName] = {lstate:true,expandOption:undefined};
         var _loc4_ = this.getRegisteredLayer(wName);
         var _loc5_ = this.getUID();
         var _loc2_ = (com.bluehole.tera.view.core.Widget)_loc4_.attachMovie("Widget",_loc5_,_loc4_.getNextHighestDepth());
         _loc2_.addEventListener("loadError",this,"widget_loadErrorHandler");
         _loc2_.addEventListener("loadComplete",this,"widget_loadCompleteHandler");
         _loc2_.setWidgetData(_loc3_);
      }
   }
   function widget_loadErrorHandler(event)
   {
      trace("위젯의 로드에 실패했습니다 - " + widget.getWidgetData().Name);
      var widget = (com.bluehole.tera.view.core.Widget)event.target;
      widget.removeEventListener("loadError",this,"widget_loadErrorHandler");
      widget.removeEventListener("loadComplete",this,"widget_loadCompleteHandler");
      lib.Debuger.trace("위젯의 로드에 실패했습니다 - " + widget.getWidgetData().Name);
   }
   function widget_loadCompleteHandler(event)
   {
      var _loc3_ = (com.bluehole.tera.view.core.Widget)event.target;
      _loc3_.removeEventListener("loadError",this,"widget_loadErrorHandler");
      _loc3_.removeEventListener("loadComplete",this,"widget_loadCompleteHandler");
      var _loc4_ = _loc3_.getWidgetData();
      var _loc2_ = _loc4_.Name;
      if(this.waitingShowUI[_loc2_].lstate == false)
      {
         this.waitingShowUI[_loc2_].lstate = undefined;
         this.OnGameEvent("OnGameEventShowUI",_loc2_,false,this.waitingShowUI[_loc2_].expandOption);
         return undefined;
      }
      this.loadedWidgets[_loc3_.getName()] = _loc3_;
      this.rescaleUI(_loc3_);
      if(this.checkDisableUI(_loc2_) != -1)
      {
         this.setDisableUI(_loc3_,true);
      }
      if(!_loc4_.bAlwaysLoaded)
      {
         this.readyToPositions[_loc2_].lstate = true;
         this.readyToPositions[_loc2_].expandOption = this.waitingShowUI[_loc2_].expandOption;
         this.readyToPositions[_loc2_].cancelPosition = false;
         this.ToGame_RequestSetUIPosition(_loc2_);
         if(_loc2_.toLowerCase() == "selectserver")
         {
            this.OnGameEvent("OnGameEventShowWindow",_loc2_,true);
         }
      }
      if(_loc2_.toLowerCase() == "progressbar" || _loc2_.toLowerCase() == "gagebar")
      {
         _loc3_.hitTestDisable = true;
      }
   }
   function unLoadWidget()
   {
   }
   function setDisableUI(ui, bTrue)
   {
      ui.disable = bTrue;
   }
   function OnGameEvent(EventName, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, Param9, Param10, Param11, Param12, Param13, Param14, Param15, Param16, Param17, Param18, Param19, Param20, Param21, Param22, Param23, Param24, Param25, Param26, Param27, Param28, Param29, Param30, Param31, Param32)
   {
      if(_global.EventBroadCaster)
      {
         _global.EventBroadCaster.broadcastMessage(EventName,Param1,Param2,Param3,Param4,Param5,Param6,Param7,Param8,Param9,Param10,Param11,Param12,Param13,Param14,Param15,Param16,Param17,Param18,Param19,Param20,Param21,Param22,Param23,Param24,Param25,Param26,Param27,Param28,Param29,Param30,Param31,Param32);
      }
   }
   function getUID()
   {
      var _loc1_ = "UID-";
      var _loc3_ = com.bluehole.tera.managers.WidgetManager._uid_index.toString();
      com.bluehole.tera.managers.WidgetManager._uid_index = com.bluehole.tera.managers.WidgetManager._uid_index + 1;
      var _loc2_ = getTimer().toString();
      return _loc1_ + _loc3_ + _loc2_;
   }
   function getLoadedWidget(wName)
   {
      return this.loadedWidgets[wName];
   }
   function getLayerByGroup(group)
   {
      var _loc2_ = undefined;
      switch(group)
      {
         case 1:
            _loc2_ = this.uiRoot.container_normal_mc;
            break;
         case 2:
            _loc2_ = this.uiRoot.container_battle_mc;
            break;
         case 3:
            _loc2_ = this.uiRoot.container_normal_mc;
            break;
         case 10:
            _loc2_ = this.uiRoot.container_battleUp_mc;
            break;
         case 11:
            _loc2_ = this.uiRoot.container_logout_mc;
            break;
         case 12:
            _loc2_ = this.uiRoot.container_overlayMap_mc;
            break;
         case 13:
            _loc2_ = this.uiRoot.container_halfPopup_mc;
            break;
         case 14:
            _loc2_ = this.uiRoot.container_mainmenuUpside_mc;
            break;
         case 49:
            _loc2_ = this.uiRoot.container_highDepth_mc;
            break;
         case 50:
            _loc2_ = this.uiRoot.container_balloon_mc;
            break;
         case 51:
            _loc2_ = this.uiRoot.container_sysPopup_mc;
            break;
         case 52:
            _loc2_ = this.uiRoot.container_interPopup_mc;
            break;
         case 53:
            _loc2_ = this.uiRoot.container_norPopup_mc;
            break;
         case 54:
            _loc2_ = this.uiRoot.container_question_mc;
            break;
         case 55:
            _loc2_ = this.uiRoot.container_tooltip_mc;
            break;
         case 56:
            _loc2_ = this.uiRoot.container_chat_mc;
            break;
         case 57:
            _loc2_ = this.uiRoot.container_alwaysVisible_mc;
            break;
         case 58:
            _loc2_ = this.uiRoot.container_inGameMovie_mc;
            break;
         case 59:
            _loc2_ = this.uiRoot.container_message_mc;
            break;
         case 60:
            _loc2_ = this.uiRoot.container_battle_mc;
            break;
         case 61:
            _loc2_ = this.uiRoot.container_lobby_mc;
            break;
         case 48:
            _loc2_ = this.uiRoot.container_mainmenu_mc;
            break;
         default:
            _loc2_ = this.uiRoot.container_battle_mc;
      }
      if(!_loc2_)
      {
         _loc2_ = this.uiRoot.createEmptyMovieClip("TestContainer",this.uiRoot.getNextHighestDepth());
      }
      return _loc2_;
   }
   function rescaleUI(widget, exception)
   {
      if(widget == undefined || widget == null || widget == "")
      {
         if(exception)
         {
            exception = exception.toLowerCase();
         }
         for(var _loc3_ in this.loadedWidgets)
         {
            if(!(exception && (com.bluehole.tera.view.core.Widget)_loc3_.getName().toLowerCase() == exception))
            {
               this.rescaleWidgetImpl(_loc3_);
            }
         }
         this.arrangeWidgets(com.bluehole.tera.managers.WidgetManager.ARRANGE_MODE_UNLOCKED_AND_NOT_MOVED_WIDGETS);
      }
      else
      {
         this.rescaleWidgetImpl(widget);
      }
   }
   function rescaleWidgetImpl(widget)
   {
      var _loc8_ = widget.getWidgetData();
      var _loc10_ = widget.getWidgetData().GROUP;
      if(_loc10_ == 61 && _loc10_ == 55 && _loc8_.Name.toLowerCase() == "expbar" && _loc8_.Name.toLowerCase() == "awesomeframe" && _loc8_.Name.toLowerCase() == "playguide")
      {
         return undefined;
      }
      var _loc11_ = lib.info.AlignInfo.uiScale(_loc8_.Name,widget);
      var _loc7_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc11_);
      if(_loc10_ < 50)
      {
         var _loc6_ = _loc8_.SA;
         if(_loc6_ == 1)
         {
            this.axis._xreg = 0;
            this.axis._yreg = 0;
         }
         else if(_loc6_ == 2)
         {
            this.axis._xreg = widget.getHitArea()._width >> 1;
            this.axis._yreg = 0;
         }
         else if(_loc6_ == 3)
         {
            this.axis._xreg = widget.getHitArea()._width;
            this.axis._yreg = 0;
         }
         else if(_loc6_ == 4)
         {
            this.axis._xreg = 0;
            this.axis._yreg = widget.getHitArea()._height >> 1;
         }
         else if(_loc6_ == 5)
         {
            this.axis._xreg = widget.getHitArea()._width >> 1;
            this.axis._yreg = widget.getHitArea()._height >> 1;
         }
         else if(_loc6_ == 6)
         {
            this.axis._xreg = widget.getHitArea()._width;
            this.axis._yreg = widget.getHitArea()._height >> 1;
         }
         else if(_loc6_ == 7)
         {
            this.axis._xreg = 0;
            this.axis._yreg = widget.getHitArea()._height;
         }
         else if(_loc6_ == 8)
         {
            this.axis._xreg = widget.getHitArea()._width >> 1;
            this.axis._yreg = widget.getHitArea()._height;
         }
         else if(_loc6_ == 9)
         {
            this.axis._xreg = widget.getHitArea()._width;
            this.axis._yreg = widget.getHitArea()._height;
         }
         this.axis.setXscale(widget,_loc7_ * 100);
         this.axis.setYscale(widget,_loc7_ * 100);
      }
      else
      {
         for(var _loc9_ in widget)
         {
            var _loc2_ = widget[_loc9_];
            var _loc5_ = _loc2_._parent._parent;
            var _loc4_ = _loc2_._parent._parent._parent;
            if(typeof _loc2_ == "movieclip" && _loc2_ != widget && _loc2_ != this.uiRoot.container_chat_mc.Chat2 && widget != _loc5_ && widget != _loc4_)
            {
               _loc2_._xscale = _loc2_._yscale = _loc7_ * 100;
            }
         }
      }
   }
   function arrangeWidgets(arrangeMode)
   {
      if(arrangeMode == com.bluehole.tera.managers.WidgetManager.ARRANGE_MODE_ALL_WIDGETS)
      {
         return undefined;
      }
      var _loc4_ = [];
      var _loc5_ = [];
      var _loc2_ = undefined;
      var _loc8_ = undefined;
      var _loc6_ = this.toArrangeWidgets.length;
      var _loc3_ = 0;
      while(_loc3_ < _loc6_)
      {
         _loc2_ = this.toArrangeWidgets[_loc3_];
         switch(arrangeMode)
         {
            case com.bluehole.tera.managers.WidgetManager.ARRANGE_MODE_UNLOCKED_WIDGETS:
               if(!_loc2_.locked)
               {
                  _loc4_.push(_loc2_);
               }
               break;
            case com.bluehole.tera.managers.WidgetManager.ARRANGE_MODE_UNLOCKED_AND_NOT_MOVED_WIDGETS:
               if(!_loc2_.locked && _loc2_.container_mc.UIDrager.moved == false)
               {
                  _loc4_.push(_loc2_);
               }
               else if(!_loc2_.locked && _loc2_.container_mc.UIDrager.moved != false)
               {
                  _loc5_.push(_loc2_);
               }
         }
         _loc3_ = _loc3_ + 1;
      }
      this.toArrangeWidgets = this.arrangeWidgetsImpl(_loc4_).concat(_loc5_);
   }
   function arrangeWidgetsImpl(widgets)
   {
      var _loc4_ = false;
      var _loc2_ = undefined;
      var _loc3_ = com.bluehole.tera.managers.WidgetManager.WIDGET_GAP;
      var _loc5_ = 0;
      var _loc8_ = undefined;
      var _loc7_ = undefined;
      var _loc9_ = [];
      while(widgets.length > 0)
      {
         if(!_loc4_)
         {
            _loc2_ = (com.bluehole.tera.view.core.Widget)widgets.shift();
            _loc8_ = lib.info.AlignInfo.uiScale(_loc2_._name,_loc2_);
            _loc7_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc8_);
            _loc5_ = _loc3_ + _loc2_.getHitArea()._width * _loc7_ + com.bluehole.tera.managers.WidgetManager.WIDGET_GAP;
            _loc4_ = _loc5_ > Stage.width;
         }
         if(_loc4_)
         {
            if(_loc2_ == null)
            {
               _loc2_ = (com.bluehole.tera.view.core.Widget)widgets.pop();
            }
            if(_loc2_)
            {
               this.hideWidget(_loc2_.getWidgetData().Name,1);
            }
         }
         else
         {
            _loc2_._x = _loc3_;
            _loc3_ = _loc5_;
            _loc9_.push(_loc2_);
         }
         _loc2_ = null;
      }
      return _loc9_;
   }
   function checkDisableUI(wName)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.disableUIName_array.length)
      {
         if(this.disableUIName_array[_loc2_].toLowerCase() == wName.toLowerCase())
         {
            return _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return -1;
   }
   function layoutWidget(widget, wData)
   {
      var _loc2_ = 0;
      var _loc3_ = 0;
      switch(wData.PA % 3)
      {
         case 2:
            _loc2_ = - widget.getHitArea()._width >> 1;
            break;
         case 0:
            _loc2_ = - widget.getHitArea()._width;
      }
      switch(Math.floor((wData.PA - 1) / 3))
      {
         case 1:
            _loc3_ = - widget.getHitArea()._height >> 1;
            break;
         case 2:
            _loc3_ = - widget.getHitArea()._height;
      }
      widget.moveTo(_loc2_,_loc3_);
   }
   function ToGame_RequestSetUIPosition(UIName, locked, x, y)
   {
      if(locked == undefined || locked == "" || locked == null)
      {
         getURL("FSCommand:ToGame_RequestSetUIPosition",UIName);
      }
      if(locked != undefined || x != undefined || y != undefined)
      {
         this.OnGameEvent("OnGame_SetUIPosition",locked,UIName,x,y,1);
      }
   }
   function setWidgetPosition(isLocked, wName, posXRatio, posYRatio, notRatio)
   {
      if(this.readyToPositions[wName].cancelPosition)
      {
         return undefined;
      }
      var _loc7_ = this.getWidgetData(wName);
      var _loc4_ = _loc7_.GROUP;
      var _loc2_ = (com.bluehole.tera.view.core.Widget)this.getLoadedWidget(wName);
      if(_loc2_ == null || _loc2_ == undefined)
      {
         return undefined;
      }
      if(isNaN(posXRatio) || isNaN(posYRatio))
      {
         posXRatio = _loc7_.xRatio;
         posYRatio = _loc7_.yRatio;
         this.ToGame_SaveUIPosition(isLocked,wName,posXRatio,posYRatio);
      }
      _loc2_.__set__locked(isLocked);
      if(wName.toLowerCase() == "tradepopup")
      {
         if(this.readyToPositions[wName].lstate == true)
         {
            this.openingAni2(_loc2_);
            this.OnGameEvent("OnGameEventShowWindow",wName,true,this.readyToPositions[wName].expandOption);
         }
         return undefined;
      }
      if(isLocked)
      {
         if(notRatio)
         {
            _loc2_._x = posXRatio;
            _loc2_._y = posYRatio;
         }
         else if(1 <= _loc4_ && _loc4_ < 50)
         {
            _loc2_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * posXRatio;
            _loc2_._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * posYRatio;
            this.adjustOffWidget(_loc2_);
         }
      }
      else if(_loc4_ == 1)
      {
         if(notRatio)
         {
            _loc2_._x = posXRatio;
            _loc2_._y = posYRatio;
            this.arrangeWidgets(com.bluehole.tera.managers.WidgetManager.ARRANGE_MODE_UNLOCKED_AND_NOT_MOVED_WIDGETS);
         }
         else if(this.toArrangeWidgets[wName] == null || this.toArrangeWidgets[wName] == undefined)
         {
            _loc2_._y = lib.info.AlignInfo.ALIGN_YPOS;
            if(wName.toLowerCase() == "inventory")
            {
               _loc2_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * 100;
               _loc2_.__set__locked(false);
            }
            else
            {
               this.addToArrangeWidgets(_loc2_);
               this.arrangeWidgets(com.bluehole.tera.managers.WidgetManager.ARRANGE_MODE_UNLOCKED_AND_NOT_MOVED_WIDGETS);
            }
         }
      }
      else if(1 < _loc4_ && _loc4_ < 50)
      {
         _loc2_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * posXRatio;
         _loc2_._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * posYRatio;
         this.adjustOffWidget(_loc2_);
      }
      if(this.readyToPositions[wName].lstate == true)
      {
         _loc2_.show(this.readyToPositions[wName].expandOption);
      }
      this.openingAni2(_loc2_);
   }
   function adjustOffWidget(widget)
   {
      var _loc3_ = widget.getHitArea();
      var _loc1_ = {x:0,y:0};
      if(_loc3_)
      {
         _loc3_.localToGlobal(_loc1_);
      }
      else
      {
         widget.localToGlobal(_loc1_);
      }
      if(_loc1_.x < lib.info.AlignInfo.zeroPointX || _loc1_.y < lib.info.AlignInfo.zeroPointY - 50)
      {
         widget._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * widget.getWidgetData().xRatio;
         widget._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * widget.getWidgetData().yRatio;
      }
   }
   function openingAni2(ui)
   {
   }
   function addToArrangeWidgets(widget)
   {
      if(this.toArrangeWidgets[widget] == null || this.toArrangeWidgets[widget] == undefined)
      {
         this.toArrangeWidgets.push(widget);
      }
   }
   function ToGame_SaveUIPosition(bLocked, UIName, posXRatio, posYRatio)
   {
      if(bLocked == undefined || bLocked == "undefined" || bLocked == null || bLocked == "null")
      {
         bLocked = 1;
      }
      if(bLocked == 0)
      {
         var _loc3_ = this.getLoadedWidget(UIName);
         if(_loc3_.container_mc.UIDrager.moved == true)
         {
            _loc3_.container_mc.lock_mc.setEnabled(true);
         }
         else
         {
            _loc3_.container_mc.lock_mc.setEnabled(false);
         }
      }
      var _loc4_ = UIName.toLowerCase();
      getURL("FSCommand:ToGame_SaveUIPosition",bLocked + "\t" + _loc4_ + "\t" + posXRatio + "\t" + posYRatio);
   }
   function stage_resizeHandler(event)
   {
      var _loc3_ = Stage.visibleRect.width;
      var _loc2_ = Stage.visibleRect.height;
      lib.info.AlignInfo.horizontalSpace = _loc3_ - lib.info.AlignInfo.UI_WIDTH >> 1;
      lib.info.AlignInfo.verticalSpace = _loc2_ - lib.info.AlignInfo.UI_HEIGHT >> 1;
      lib.info.AlignInfo.zeroPointX = Stage.visibleRect.x;
      lib.info.AlignInfo.zeroPointY = Stage.visibleRect.y;
      lib.info.AlignInfo.onePercentPixelW = _loc3_ * 0.01;
      lib.info.AlignInfo.onePercentPixelH = _loc2_ * 0.01;
      lib.info.AlignInfo.onePixelPercentW = 100 / _loc3_;
      lib.info.AlignInfo.onePixelPercentH = 100 / _loc2_;
      this.OnGameEvent("OnGame_ChangeStageSize",_loc3_,_loc2_);
   }
}
