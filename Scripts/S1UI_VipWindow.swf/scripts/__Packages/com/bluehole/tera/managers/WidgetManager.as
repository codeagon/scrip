class com.bluehole.tera.managers.WidgetManager extends gfx.events.EventDispatcher
{
   function WidgetManager()
   {
      super();
      this.registeredWidgetDatas = {};
      this.managingWidgetDict = {};
      this.showingWidgets = new com.bluehole.tera.utils.List();
      this.loadedWidgets = new com.bluehole.tera.utils.List();
      this.nonBattleWidgetLoaders = new com.bluehole.tera.utils.List();
   }
   static function getInstance()
   {
      if(com.bluehole.tera.managers.WidgetManager._instance == null)
      {
         com.bluehole.tera.managers.WidgetManager._instance = new com.bluehole.tera.managers.WidgetManager();
      }
      return com.bluehole.tera.managers.WidgetManager._instance;
   }
   function __get__widgetList()
   {
      return this.showingWidgets;
   }
   function registerWidgetData(name, path, x, y, alwaysLoaded, group, logoutClose, soundData, addData)
   {
      if(name == undefined || path == undefined)
      {
         return undefined;
      }
      var _loc3_ = this.getWidgetData(name);
      if(_loc3_ == undefined)
      {
         _loc3_ = com.bluehole.tera.datas.WidgetData.make(name,path,x,y,alwaysLoaded,group,logoutClose,soundData,addData);
         _root.gRegisterUIDataList.push(_loc3_);
         this.registeredWidgetDatas[_loc3_.Name.toLowerCase()] = _loc3_;
         var _loc4_ = com.bluehole.tera.control.WidgetLoaderFactory.getLoader(_loc3_);
         _loc4_.addEventListener(com.bluehole.tera.control.WidgetLoader.EVENT_SHOW,this,"widget_showHandler");
         _loc4_.addEventListener(com.bluehole.tera.control.WidgetLoader.EVENT_HIDE,this,"widget_hideHandler");
         _loc4_.addEventListener(com.bluehole.tera.control.WidgetLoader.EVENT_LOAD_INIT,this,"widget_loadInitHandler");
         _loc4_.addEventListener(com.bluehole.tera.control.WidgetLoader.EVENT_UNLOAD,this,"widget_unloadHandler");
         this.managingWidgetDict[_loc3_.Name.toLowerCase()] = _loc4_;
         lib.manager.UISound.addOnSound(_loc3_.Name,_loc3_.soundData);
      }
   }
   function getWidgetData(wName)
   {
      return this.registeredWidgetDatas[wName.toLowerCase()];
   }
   function showWidget(wName, expandOption)
   {
      var _loc2_ = (com.bluehole.tera.control.WidgetLoader)this.managingWidgetDict[wName.toLowerCase()];
      _loc2_.show(expandOption);
      if(_loc2_.widgetData.battleModeClose == 1)
      {
         this.nonBattleWidgetLoaders.add(_loc2_);
      }
   }
   function hideWidget(wName, expandOption)
   {
      this.managingWidgetDict[wName.toLowerCase()].hide(expandOption);
   }
   function getManagingWidgetByName(wName)
   {
      var _loc2_ = this.managingWidgetDict[wName.toLowerCase()];
      if(_loc2_ && _loc2_.widget)
      {
         return _loc2_.widget;
      }
      return null;
   }
   function closeNonBattleWidgets()
   {
      var _loc2_ = this.nonBattleWidgetLoaders.__get__iterator();
      while(_loc2_.hasNext())
      {
         _loc2_.next().hide();
      }
      this.nonBattleWidgetLoaders.list = [];
   }
   function widget_loadInitHandler(e)
   {
      this.loadedWidgets.add(e.widget);
   }
   function widget_unloadHandler(e)
   {
      this.loadedWidgets.remove(e.widget);
   }
   function widget_showHandler(e)
   {
      this.showingWidgets.add(e.widget);
      lib.manager.UISound.showUI(e.widgetName,true);
   }
   function widget_hideHandler(e)
   {
      var _loc4_ = e.widget;
      var _loc3_ = e.widgetName;
      this.showingWidgets.remove(_loc4_);
      if(lib.manager.Focus.modalUI == _loc4_)
      {
         Selection.setFocus(null);
         lib.manager.Focus.stop();
      }
      if(_loc3_.toLowerCase() == "senatorregistration")
      {
         _root.BaseUIListener.OnGame_DisableUI("SenatorMap",0);
      }
      lib.manager.UISound.showUI(_loc3_,false);
      _root.ToGame_DestroyUI(_loc3_);
   }
}
