class com.bluehole.tera.managers.LayoutManager
{
   static var LAYOUT_REFLOW_MODE_ALL = 0;
   static var LAYOUT_REFLOW_MODE_UNLOCKED_UI = 1;
   static var LAYOUT_REFLOW_MODE_UNMANAGED_UI = 2;
   var uiLayers = {};
   var managingWidgets = {};
   var autoLayoutChanged = false;
   var requestedAutoLayoutModes = [];
   function LayoutManager()
   {
      super();
   }
   static function setUIPosition(ui, pivotType, posXRatio, posYRatio)
   {
      var _loc5_ = ui._parent;
      var _loc4_ = com.bluehole.tera.managers.LayoutManager.getOriginCoord(ui);
      var _loc3_ = com.bluehole.tera.managers.LayoutManager.getPivotPoint(ui,pivotType);
      var _loc6_ = posXRatio * 0.01 * Stage.visibleRect.width * _loc5_._xscale * 0.01;
      var _loc7_ = posYRatio * 0.01 * Stage.visibleRect.height * _loc5_._yscale * 0.01;
      var _loc9_ = ui._x;
      var _loc8_ = ui._y;
      ui._x = !(pivotType == 3 || pivotType == 6 || pivotType == 9)?Math.ceil(_loc4_.x + _loc6_ - _loc3_.x):Math.floor(_loc4_.x + _loc6_ - _loc3_.x);
      ui._y = !(pivotType == 7 || pivotType == 8 || pivotType == 9)?Math.ceil(_loc4_.y + _loc7_ - _loc3_.y):Math.floor(_loc4_.y + _loc7_ - _loc3_.y);
      return _loc9_ != ui._x || _loc8_ != ui._y;
   }
   static function saveUIPositon(ui, pivotType, lockState, optionCustomX, optionCustomY)
   {
      var _loc2_ = com.bluehole.tera.managers.LayoutManager.getRatioPosition(ui,pivotType);
      var _loc5_ = optionCustomX == undefined?_loc2_.x:optionCustomX;
      var _loc4_ = optionCustomY == undefined?_loc2_.y:optionCustomY;
      _root.ToGame_SaveUIPosition(lockState,ui._name,_loc5_,_loc4_);
      return com.bluehole.tera.managers.LayoutManager.isOut(ui);
   }
   static function getRatioPosition(ui, pivotType)
   {
      var _loc4_ = ui._parent;
      var _loc3_ = com.bluehole.tera.managers.LayoutManager.getOriginCoord(ui);
      var _loc2_ = com.bluehole.tera.managers.LayoutManager.getPivotPoint(ui,pivotType);
      return new flash.geom.Point((ui._x + _loc2_.x - _loc3_.x) * 10000 / _loc4_._xscale / Stage.visibleRect.width,(ui._y + _loc2_.y - _loc3_.y) * 10000 / _loc4_._yscale / Stage.visibleRect.height);
   }
   static function getDragEdgesByUIDragger(ui, uiDragger)
   {
      var _loc9_ = {xMin:0,xMax:0,yMin:0,yMax:0};
      var _loc7_ = ui._parent;
      var _loc4_ = {x:Stage.visibleRect.left,y:Stage.visibleRect.top};
      _loc7_.globalToLocal(_loc4_);
      var _loc5_ = {x:Stage.visibleRect.right,y:Stage.visibleRect.bottom};
      _loc7_.globalToLocal(_loc5_);
      var _loc3_ = ui._xscale * 0.01;
      var _loc2_ = ui._yscale * 0.01;
      if(uiDragger.adjustLeft != 0 || uiDragger.adjustTop != 0 || uiDragger.adjustRight != 0 || uiDragger.adjustBottom != 0)
      {
         var _loc12_ = Math.ceil(_loc4_.x + uiDragger.adjustLeft * _loc3_);
         var _loc10_ = Math.floor(_loc5_.x - uiDragger._width * _loc3_ + uiDragger.adjustRight * _loc3_);
         var _loc13_ = Math.ceil(_loc4_.y + uiDragger.adjustTop * _loc2_);
         var _loc11_ = Math.floor(_loc5_.y - uiDragger._height * _loc2_ + uiDragger.adjustBottom * _loc2_);
      }
      else
      {
         var _loc6_ = uiDragger.getBounds(ui);
         _loc12_ = Math.ceil(_loc4_.x - _loc6_.xMin * _loc3_ + uiDragger.adjustLeft * _loc3_);
         _loc10_ = Math.floor(_loc5_.x - _loc6_.xMax * _loc3_ + uiDragger.adjustRight * _loc3_);
         _loc13_ = Math.ceil(_loc4_.y - _loc6_.yMin * _loc2_ + uiDragger.adjustTop * _loc2_);
         _loc11_ = Math.floor(_loc5_.y - _loc6_.yMax * _loc2_ + uiDragger.adjustBottom * _loc2_);
      }
      _loc9_ = {xMin:_loc12_,xMax:_loc10_,yMin:_loc13_,yMax:_loc11_};
      return _loc9_;
   }
   static function getDragEdgesByHit(ui)
   {
      var _loc6_ = {xMin:0,xMax:0,yMin:0,yMax:0};
      if(ui.hit)
      {
         var _loc5_ = ui._parent;
         var _loc1_ = {x:Stage.visibleRect.left,y:Stage.visibleRect.top};
         _loc5_.globalToLocal(_loc1_);
         var _loc3_ = {x:Stage.visibleRect.right,y:Stage.visibleRect.bottom};
         _loc5_.globalToLocal(_loc3_);
         var _loc8_ = ui._xscale * 0.01;
         var _loc7_ = ui._yscale * 0.01;
         var _loc4_ = ui.hit;
         var _loc11_ = Math.ceil(_loc1_.x);
         var _loc9_ = Math.floor(_loc3_.x - _loc4_._width * _loc8_);
         var _loc12_ = Math.ceil(_loc1_.y);
         var _loc10_ = Math.floor(_loc3_.y - _loc4_._height * _loc7_);
         _loc6_ = {xMin:_loc11_,xMax:_loc9_,yMin:_loc12_,yMax:_loc10_};
      }
      return _loc6_;
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
   static function isOut(ui)
   {
      var _loc2_ = false;
      var _loc3_ = undefined;
      if(ui.container_mc.UIDrager)
      {
         var _loc4_ = com.bluehole.tera.managers.LayoutManager.getDragEdgesByUIDragger(ui,ui.container_mc.UIDrager);
         _loc2_ = ui._x < _loc4_.xMin || ui._y < _loc4_.yMin || ui._x > _loc4_.xMax || ui._y > _loc4_.yMax;
      }
      else if(ui.container_mc.titleBtn)
      {
         _loc4_ = com.bluehole.tera.managers.LayoutManager.getDragEdgesByUIDragger(ui,ui.container_mc.titleBtn);
         _loc2_ = ui._x < _loc4_.xMin || ui._y < _loc4_.yMin || ui._x > _loc4_.xMax || ui._y > _loc4_.yMax;
      }
      else if(ui.hit)
      {
         _loc3_ = com.bluehole.tera.managers.LayoutManager.getOriginCoord(ui);
         _loc2_ = ui._x + ui.hit._x < _loc3_.x || ui._y + ui.hit._y < _loc3_.y;
      }
      else
      {
         _loc3_ = com.bluehole.tera.managers.LayoutManager.getOriginCoord(ui);
         _loc2_ = ui._x < _loc3_.x || ui._y < _loc3_.y;
      }
      return _loc2_;
   }
   static function isOutBound(ui)
   {
      var _loc6_ = ui.hit;
      var _loc3_ = ui._parent;
      if(_loc3_ == undefined)
      {
         return true;
      }
      var _loc2_ = {x:Stage.visibleRect.left,y:Stage.visibleRect.top};
      _loc3_.globalToLocal(_loc2_);
      var _loc4_ = {x:Stage.visibleRect.right,y:Stage.visibleRect.bottom};
      _loc3_.globalToLocal(_loc4_);
      var _loc1_ = com.bluehole.tera.managers.LayoutManager.getUIEdges(ui);
      return _loc1_.xMin < _loc2_.x || _loc1_.xMax > _loc4_.x || _loc1_.yMin < _loc2_.y || _loc1_.yMax > _loc4_.y;
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
   static function getOriginCoord(ui)
   {
      var _loc2_ = ui._parent;
      var _loc1_ = {x:Stage.visibleRect.left,y:Stage.visibleRect.top};
      _loc2_.globalToLocal(_loc1_);
      return _loc1_;
   }
   static function openingAni2(ui, actor, complete)
   {
      ui._alpha = 0;
      gs.TweenMax.killTweensOf(ui,false);
      gs.TweenMax.to(ui,0.3,{_alpha:100,ease:gs.easing.Linear.easeOut,onComplete:gfx.utils.Delegate.create(actor,complete)});
   }
   static function scaleUI(ui, pivotType, scaleRatio)
   {
      if(isNaN(scaleRatio))
      {
         return undefined;
      }
      if(scaleRatio == ui._xscale && scaleRatio == ui._yscale)
      {
         return undefined;
      }
      var _loc4_ = com.bluehole.tera.managers.LayoutManager.getPivotPoint(ui,pivotType);
      ui._xscale = scaleRatio;
      ui._yscale = scaleRatio;
      var _loc3_ = com.bluehole.tera.managers.LayoutManager.getPivotPoint(ui,pivotType);
      ui._x = ui._x - (_loc3_.x - _loc4_.x);
      ui._y = ui._y - (_loc3_.y - _loc4_.y);
   }
   static function __get__instance()
   {
      if(com.bluehole.tera.managers.LayoutManager._instance == null)
      {
         com.bluehole.tera.managers.LayoutManager._instance = new com.bluehole.tera.managers.LayoutManager();
         com.bluehole.tera.managers.LayoutManager._instance.initLayers();
         com.bluehole.tera.managers.LayoutManager._instance.eventListener = new Object();
         _global.EventBroadCaster.addListener(com.bluehole.tera.managers.LayoutManager._instance.eventListener);
         com.bluehole.tera.managers.LayoutManager._instance.eventListener.OnGameEventShowUI = com.bluehole.tera.managers.LayoutManager._instance.showWidgetHandler;
      }
      return com.bluehole.tera.managers.LayoutManager._instance;
   }
   function getEmptyWidget(widgetName, group)
   {
      var _loc2_ = (MovieClip)this.uiLayers[group];
      return _loc2_.createEmptyMovieClip(widgetName,_loc2_.getNextHighestDepth());
   }
   function addManagingWidget(widget, widgetData)
   {
      var _loc2_ = this.getActorByWidgetName(widgetData.Name);
      if(_loc2_)
      {
         _loc2_.updateWidgetInfo(widget,widgetData);
      }
      else
      {
         _loc2_ = new com.bluehole.tera.control.LayoutActor(widget,widgetData);
         this.managingWidgets[_loc2_.__get__widgetName().toLowerCase()] = _loc2_;
      }
      _loc2_.addEventListener(com.bluehole.tera.control.LayoutActor.EVENT_POSITION_CHANGED,this,"layoutActor_positionChangedHandler");
      _loc2_.addEventListener(com.bluehole.tera.control.LayoutActor.EVENT_REQUEST_WIDGET_POSITION,this,"layoutActor_requestWidgetPositionHandler");
   }
   function removeManagingWidget(widgetName)
   {
      var _loc2_ = this.getActorByWidgetName(widgetName);
      if(_loc2_)
      {
         _loc2_.init();
         _loc2_.removeEventListener(com.bluehole.tera.control.LayoutActor.EVENT_POSITION_CHANGED,this,"layoutActor_positionChangedHandler");
         _loc2_.removeEventListener(com.bluehole.tera.control.LayoutActor.EVENT_REQUEST_WIDGET_POSITION,this,"layoutActor_requestWidgetPositionHandler");
      }
   }
   function setPosition(widgetName, locked, posXRatio, posYRatio, notRatio)
   {
      if(_root.readyToPositions[widgetName.toLowerCase()].cancelPosition)
      {
         return undefined;
      }
      var _loc3_ = this.getActorByWidgetName(widgetName);
      _loc3_.__set__locked(locked);
      _loc3_.setPosition(posXRatio,posYRatio,notRatio == 1);
   }
   function setScaleRatio(widgetName, scaleRatio)
   {
      var _loc2_ = this.getActorByWidgetName(widgetName);
      _loc2_.setScaleRatio(scaleRatio);
   }
   function addAutoPositionActor(actor)
   {
      if(actor.__get__group() != 1)
      {
         return undefined;
      }
      com.bluehole.tera.control.LayoutActor.addAutoPositionActor(actor);
      com.bluehole.tera.control.LayoutActor.reflowAutoPositionActors(com.bluehole.tera.managers.LayoutManager.LAYOUT_REFLOW_MODE_UNMANAGED_UI);
   }
   function removeAutoPositionActor(actor)
   {
      com.bluehole.tera.control.LayoutActor.removeAutoPositionActor(actor);
   }
   function removeAutoLayoutUI(widgetName)
   {
      this.removeAutoPositionActor(this.getActorByWidgetName(widgetName));
   }
   function reflowAutoLayoutUIs(mode)
   {
      com.bluehole.tera.control.LayoutActor.reflowAutoPositionActors(mode);
   }
   function resetUIPosition()
   {
      _root.OnGameEvent("OnGame_ResetUIPosition");
      for(var _loc3_ in this.managingWidgets)
      {
         (com.bluehole.tera.control.LayoutActor)this.managingWidgets[_loc3_].resetPosition();
      }
      com.bluehole.tera.control.LayoutActor.reflowAutoPositionActors(com.bluehole.tera.managers.LayoutManager.LAYOUT_REFLOW_MODE_ALL);
      _root.GetLoadedUI("chat2").container_mc.optionMenu_mc.line3.hit.onRelease();
   }
   function repositionLockedUI()
   {
      for(var _loc2_ in this.managingWidgets)
      {
         (com.bluehole.tera.control.LayoutActor)this.managingWidgets[_loc2_].resetLockedWidget();
      }
   }
   function hideWidget(layoutActor, reflow)
   {
      gs.TweenMax.killTweensOf(layoutActor.widget,false);
      _root.HideUI(layoutActor.__get__widgetName(),!reflow?0:1);
   }
   function getLayer(layerType)
   {
      return this.uiLayers[layerType];
   }
   function initLayers()
   {
      this.uiLayers[com.bluehole.tera.contants.LayerType.NORMAL_1] = _root.container_normal_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.BATTLE_2] = _root.container_battle_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.NOT_AUTO_LAYOUT_POPUP_3] = _root.container_normal_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.BATTLE_UP_10] = _root.container_battleUp_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.LOG_OUT_11] = _root.container_logout_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.OVERLAY_MAP_12] = _root.container_overlayMap_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.NOT_MODAL_POP_UP_13] = _root.container_halfPopup_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.UPPER_THAN_MAIN_MENU_14] = _root.container_mainmenuUpside_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.MAIN_MENU_48] = _root.container_mainmenu_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.NORMAL_HIGHEST_DEPTH_49] = _root.container_highDepth_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.BALLOON_50] = _root.container_balloon_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.SYSTEM_POPUP_51] = _root.container_sysPopup_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.INTERACTION_POPUP_52] = _root.container_interPopup_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.MODAL_POPUP_53] = _root.container_norPopup_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.USER_RESEARCH_54] = _root.container_question_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.TOOL_TIP_55] = _root.container_tooltip_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.CHAT_56] = _root.container_chat_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.ALWAYS_VISIBLE_57] = _root.container_alwaysVisible_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.MOVIE_58] = _root.container_inGameMovie_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.MESSAGE_59] = _root.container_message_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.COTAINER_BATTLE_60] = _root.container_battle_mc;
      this.uiLayers[com.bluehole.tera.contants.LayerType.COTAINER_LOBBY_61] = _root.container_lobby_mc;
   }
   function getActorByWidgetName(widgetName)
   {
      return (com.bluehole.tera.control.LayoutActor)this.managingWidgets[widgetName.toLowerCase()];
   }
   function showWidgetHandler(widgetName, show, expandOption)
   {
      if(show)
      {
         com.bluehole.tera.managers.LayoutManager._instance.getActorByWidgetName(widgetName).setTop(this.getLayer(com.bluehole.tera.contants.LayerType.NORMAL_1),this.getLayer(com.bluehole.tera.contants.LayerType.BATTLE_2));
      }
   }
   function layoutActor_positionChangedHandler(e)
   {
      if(_root.readyToPositions[e.widgetName.toLowerCase()].lstate)
      {
         _root.OnGameEvent("OnGameEventShowWindow",e.widgetName,true,_root.readyToPositions[e.widgetName.toLowerCase()].expandOption);
      }
      com.bluehole.tera.utils.TimeTester.finishTimeTest(e.widgetName,"보여주기");
   }
   function layoutActor_requestWidgetPositionHandler(e)
   {
      _root.ToGame_RequestSetUIPosition(e.widgetName);
   }
}
