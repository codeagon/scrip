class lib.gamedata.CustomizedUIDataCollection extends lib.gamedata.GameDataCollectionImpl
{
   static var _this = null;
   var defaults = null;
   function CustomizedUIDataCollection()
   {
      super();
   }
   static function getInstance()
   {
      if(lib.gamedata.CustomizedUIDataCollection._this == null)
      {
         lib.gamedata.CustomizedUIDataCollection._this = new lib.gamedata.CustomizedUIDataCollection();
         lib.gamedata.CustomizedUIDataCollection._this.createOnGameListener(lib.gamedata.CustomizedUIDataCollection._this);
         lib.gamedata.CustomizedUIDataCollection._this.createDefaultDatas();
         lib.gamedata.CustomizedUIDataCollection._this.resetDefaults();
      }
      return lib.gamedata.CustomizedUIDataCollection._this;
   }
   function valueOf(keyStr, scope, callBack)
   {
      var _loc4_ = null;
      var _loc3_ = null;
      var _loc2_ = 0;
      _loc2_ = 0;
      while(_loc2_ < this.data_array.length)
      {
         _loc3_ = this.data_array[_loc2_];
         if(_loc3_.getId() == keyStr)
         {
            _loc4_ = _loc3_.getValue();
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(callBack)
      {
         scope[callBack].call(scope,_loc4_,scope);
      }
      return _loc4_;
   }
   function saveData(key, value, saveAtServer)
   {
      if(this.contains(key))
      {
         this.updateData({id:key,value:value});
      }
      else
      {
         this.addData(new lib.gamedata.CustomizedUIData(key,Number(value)));
      }
      if(saveAtServer == true)
      {
         getURL("FSCommand:ToGame_SaveCustomizedUIData",key + "\t" + value);
      }
   }
   function saveDataAll(saveAtServer)
   {
      var _loc3_ = this.getIterator();
      while(_loc3_.hasNext())
      {
         var _loc2_ = _loc3_.next();
         this.saveData(_loc2_.getId(),_loc2_.getValue(),saveAtServer);
      }
   }
   function updateData(data)
   {
      var _loc5_ = data.id == undefined?data.getId():data.id;
      if(this.getData(_loc5_) == null)
      {
         this.addData((lib.gamedata.GameData)data);
      }
      var _loc12_ = false;
      var _loc6_ = this.getIterator();
      while(_loc6_.hasNext())
      {
         var _loc2_ = _loc6_.next();
         var _loc4_ = _loc2_.getId();
         var _loc10_ = _loc2_.getValue();
         if(_loc4_ == _loc5_)
         {
            _loc2_.updateData(data);
            this.dispatchEvent({type:gfx.events.EventTypes.VALUE_CHANGE,target:data,key:_loc5_,value:data.value});
            return true;
         }
      }
      return _loc12_;
   }
   function resetDefaults(saveAtServer)
   {
      this.clear();
      var _loc4_ = this.defaults.getIterator();
      while(_loc4_.hasNext())
      {
         var _loc3_ = _loc4_.next();
         var _loc2_ = new lib.gamedata.CustomizedUIData();
         _loc2_.updateData({id:_loc3_.getId(),value:_loc3_.getValue()});
         this.addData(_loc2_);
      }
      this.saveDataAll(saveAtServer);
   }
   function createOnGameListener(thisObject)
   {
      this.myListener = new Object();
      _global.EventBroadCaster.addListener(this.myListener);
      this.myListener.OnGame_RegisterCustomizedUIData = function(dataList)
      {
         var _loc4_ = dataList.split("\n");
         var _loc5_ = _loc4_[_loc4_.length - 1];
         if(_loc5_ == undefined || _loc5_ == "")
         {
            _loc4_.pop();
         }
         var _loc2_ = 0;
         while(_loc2_ < _loc4_.length)
         {
            var _loc1_ = _loc4_[_loc2_].split("\t");
            var _loc3_ = _loc1_[_loc1_.length - 1];
            if(_loc3_ == undefined || _loc3_ == "")
            {
               _loc1_.pop();
            }
            thisObject.updateData(new lib.gamedata.CustomizedUIData(_loc1_[0],_loc1_[1]));
            _loc2_ = _loc2_ + 1;
         }
      };
      this.myListener.OnGameEventChangeUIMode = function(bShow)
      {
         fscommand("CustomizedUIDataCollection  of  ChangeUIMode");
      };
   }
   function createDefaultDatas()
   {
      if(this.defaults == null | this.defaults == undefined)
      {
         this.defaults = new lib.gamedata.GameDataCollectionImpl();
      }
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.CHAT_WHISPER_VISIBLE,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.OVERLAYMAP_STATIC_BOOLEAN,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.OVERLAYMAP_ALPHA_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.ABNORMALITY_ALIGN_TYPE,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.ABNORMALITY_DEBUFFSHOW_BOOLEAN,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.MAINMENU_SHOW_BOOLEAN,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.CHARACTERWINDOW_PERCENT_BOOLEAN,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.INTERACTIONPOPUPALIM_CENTER_BOOLEAN,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.COOLTIMEALIM_SHOW_BOOLEAN,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.CLOCKWINDOW_SHOW_BOOLEAN,1));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.FPS_SHOW_BOOLEAN,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.GLADI_STACK_BOOLEAN,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.MAINGAUGE_SHOW_BOOLEAN,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE4_VISIBLE,1));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE6_VISIBLE,1));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE9_VISIBLE,1));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPEB_VISIBLE,1));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPEI_VISIBLE,1));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.MINIMAP_MINIMIZE_BOOLEAN,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.QUESTTASKINFO_MINIMIZE_BOOLEAN,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_ALL_PERCENT,80));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_CHARACTERWINDOW_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_MINIMAP_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_OVERLAYMAP2_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_QUESTTASKINFO_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_SHORTCUT_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_GAGEBOSS_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_TARGETINFO_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_MAINMENU_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_ABNORMALITY_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_HOMUNSHORTCUT_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_GAGEBAR_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_PARTYWINDOW_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_CROSSHAIR_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_BFSCOREBOARD_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_EXTSHORTCUT_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_EXTSHORTCUT2_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_GAMECONTROLLERSHORTCUT_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_PARTYWINDOWRAIDINFO_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_SKILLWINDOW_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_QUESTJOURNAL_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_INVENTORY_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_WAREHOUSEWINDOW_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_WORLDMAP2_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_PRODUCTIONLIST_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_GUILDWINDOW_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_COMMUNITYWINDOW_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_PARTYBOARD_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_TRADEHOUSE_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_STOREWINDOW_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_PARCELPOST_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.UISCALE_HELP_PERCENT,100));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_UI_BOOLEAN,0));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_PARTYWINDOW_BOOLEAN,1));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_QUESTTASKINFO_BOOLEAN,1));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_MINIMAP_BOOLEAN,1));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_PARTYWINDOWRAIDINFO_BOOLEAN,1));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_MAINMENU_BOOLEAN,1));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_CHAT_BOOLEAN,1));
      this.defaults.addData(new lib.gamedata.CustomizedUIData(lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_OVERLAY_BOOLEAN,1));
   }
   function updateDefaultDatas(key, v)
   {
      var _loc2_ = this.defaults.getData(key);
      if(_loc2_ != null && v != undefined)
      {
         _loc2_.updateData(new lib.gamedata.CustomizedUIData(key,v));
      }
   }
}
