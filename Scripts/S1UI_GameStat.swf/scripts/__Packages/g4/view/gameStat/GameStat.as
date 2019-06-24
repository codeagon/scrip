class g4.view.gameStat.GameStat extends g4.core.View
{
   var UPDATE_COUNT = 24;
   var BG_PADDING_TOP = 4;
   var BG_PADDING_BOTTOM = 6;
   var TEXT_GAP = -2;
   var timeCounter = 0;
   var uiVisible = false;
   var isMouseOver = false;
   function GameStat(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.GAME_STAT;
   }
   function configUI()
   {
      this.mc_hit = this.__get__targetMovieClip().hit;
      this.mc_ui_dragger = this.__get__targetMovieClip().container_mc.UIDrager;
      this.text_time = this.__get__targetMovieClip().container_mc.text_time;
      this.text_fps = this.__get__targetMovieClip().container_mc.text_fps;
      this.mc_bg = this.__get__targetMovieClip().container_mc.mc_bg;
      this.mc_ui_dragger.setData(this.getUIName(),this.__get__targetMovieClip().container_mc);
      this.mc_ui_dragger.onRollOver = gfx.utils.Delegate.create(this,this.mc_ui_dragger_rollOverHandler);
      this.mc_ui_dragger.onRollOut = gfx.utils.Delegate.create(this,this.mc_ui_dragger_rollOutHandler);
      this.mc_ui_dragger.addEventListener("releaseOutside",this,"mc_ui_dragger_releaseOutsideHandler");
      this.text_time.textAutoSize = "shrink";
      this.text_time.verticalAlign = "top";
      this.text_time.wordWrap = false;
      this.text_time.multiline = false;
      this.text_time.multiline = false;
      this.text_time.html = false;
      g4.util.UIUtil.setMouseEnabled(this.text_time,false);
      g4.util.UIUtil.setTextFieldStyle(this.text_time,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.setTimeText(null);
      this.text_fps.textAutoSize = "shrink";
      this.text_fps.verticalAlign = "top";
      this.text_fps.wordWrap = false;
      this.text_fps.multiline = false;
      this.text_fps.html = false;
      g4.util.UIUtil.setMouseEnabled(this.text_fps,false);
      g4.util.UIUtil.setTextFieldStyle(this.text_fps,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.setFpsText(null);
      this.updateTime();
      g4.util.UIUtil.addEnterFrameListener(this,"enterFrameHandler");
      var _loc2_ = lib.gamedata.CustomizedUIDataCollection.getInstance();
      _loc2_.valueOf(lib.gamedata.CustomizedUIDataKey.CLOCKWINDOW_SHOW_BOOLEAN,this,"clockVisibleHandler");
      _loc2_.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
      _loc2_.valueOf(lib.gamedata.CustomizedUIDataKey.FPS_SHOW_BOOLEAN,this,"fpsVisibleHandler");
      _loc2_.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_GameStat_setStat",gfx.utils.Delegate.create(this,this.OnGame_GameStat_setStat));
      g4.model.GameModel.addEventListener(g4.view.ViewID.GAME_STAT,g4.model.GameModelEventType.MAIN_UI_MODE_CHANGED,this,"model_mainUIModeChangeHandler");
   }
   function creationComplete()
   {
      this.ToGame_GameStat_Init();
   }
   function setTimeText(text)
   {
      if(text == null || text.length == 0)
      {
         this.text_time.text = " ";
      }
      else
      {
         this.text_time.text = text;
      }
   }
   function setFpsText(text)
   {
      if(text == null || text.length == 0)
      {
         this.text_fps.text = " ";
      }
      else
      {
         this.text_fps.text = text;
      }
   }
   function updateTime()
   {
      var _loc5_ = new Date();
      var _loc2_ = _loc5_.getHours();
      var _loc4_ = _loc5_.getMinutes();
      var _loc3_ = " ";
      if(_loc2_ > 11)
      {
         if(_loc2_ > 12)
         {
            _loc2_ = _loc2_ - 12;
         }
         if(_loc2_ < 10)
         {
            _loc3_ = "PM 0" + _loc2_ + ":";
         }
         else
         {
            _loc3_ = "PM " + _loc2_ + ":";
         }
      }
      else
      {
         if(_loc2_ == 0)
         {
            _loc2_ = 12;
         }
         if(_loc2_ < 10)
         {
            _loc3_ = "AM 0" + _loc2_ + ":";
         }
         else
         {
            _loc3_ = "AM " + _loc2_ + ":";
         }
      }
      if(_loc4_ < 10)
      {
         _loc3_ = _loc3_ + ("0" + String(_loc4_));
      }
      else
      {
         _loc3_ = _loc3_ + String(_loc4_);
      }
      this.setTimeText(_loc3_);
   }
   function updateSize()
   {
      var _loc5_ = 4;
      var _loc3_ = 0;
      var _loc2_ = this.BG_PADDING_TOP;
      if(this.text_time._visible)
      {
         this.text_time._y = _loc2_;
         _loc2_ = _loc2_ + (this.text_time.textHeight + _loc5_);
         _loc3_ = _loc3_ + 1;
      }
      if(this.text_fps._visible)
      {
         if(_loc3_ == 1)
         {
            _loc2_ = _loc2_ + this.TEXT_GAP;
         }
         this.text_fps._y = _loc2_;
         _loc2_ = _loc2_ + (this.text_fps.textHeight + _loc5_);
         _loc3_ = _loc3_ + 1;
      }
      if(_loc3_ > 0)
      {
         this.uiVisible = true;
         var _loc4_ = _loc2_ + this.BG_PADDING_BOTTOM;
         this.mc_bg._height = _loc4_;
         this.mc_ui_dragger._height = _loc4_;
         this.mc_ui_dragger._visible = true;
         this.mc_hit._height = _loc4_;
      }
      else
      {
         this.uiVisible = false;
         this.mc_ui_dragger._visible = false;
      }
      this.updateBGVisible();
   }
   function clockVisibleHandler(value)
   {
      value = g4.util.Converter.toBoolean(value);
      this.text_time._visible = value;
      this.updateSize();
   }
   function fpsVisibleHandler(value)
   {
      value = g4.util.Converter.toBoolean(value);
      this.text_fps._visible = value;
      this.updateSize();
      this.ToGame_GameStat_SetToggle(value);
   }
   function valueChangeHandler(event)
   {
      if(event.key == lib.gamedata.CustomizedUIDataKey.CLOCKWINDOW_SHOW_BOOLEAN)
      {
         this.clockVisibleHandler(event.value);
      }
      else if(event.key == lib.gamedata.CustomizedUIDataKey.FPS_SHOW_BOOLEAN)
      {
         this.fpsVisibleHandler(event.value);
      }
   }
   function updateBGVisible()
   {
      if(g4.model.GameModel.mainModel.uiMode && this.uiVisible && this.isMouseOver)
      {
         this.mc_bg._visible = true;
      }
      else
      {
         this.mc_bg._visible = false;
      }
   }
   function OnGame_GameStat_setStat(fps)
   {
      fps = Number(fps);
      this.setFpsText("FPS " + fps);
   }
   function ToGame_GameStat_Init()
   {
      g4.model.GameInterface.callGameInterface("ToGame_GameStat_Init");
   }
   function ToGame_GameStat_SetToggle(value)
   {
      g4.model.GameInterface.callGameInterface("ToGame_GameStat_SetToggle",String(g4.util.Converter.booleanToNumber(value)));
   }
   function ToGame_ToolTip_RequestGameStat()
   {
      g4.model.GameInterface.callGameInterface("ToGame_ToolTip_RequestGameStat");
   }
   function ToGame_ToolTip_RemoveGameStat()
   {
      g4.model.GameInterface.callGameInterface("ToGame_ToolTip_RemoveGameStat");
   }
   function enterFrameHandler()
   {
      if((this.timeCounter = this.timeCounter + 1) >= this.UPDATE_COUNT)
      {
         this.timeCounter = 0;
         this.updateTime();
      }
   }
   function mc_ui_dragger_rollOverHandler()
   {
      this.isMouseOver = true;
      this.updateBGVisible();
      lib.manager.ToolTip.add(this.mc_ui_dragger,0,6);
      this.ToGame_ToolTip_RequestGameStat();
   }
   function mc_ui_dragger_rollOutHandler()
   {
      this.isMouseOver = false;
      this.updateBGVisible();
      lib.manager.ToolTip.remove(this.mc_ui_dragger);
      this.ToGame_ToolTip_RemoveGameStat();
   }
   function mc_ui_dragger_releaseOutsideHandler(event)
   {
      this.mc_ui_dragger_rollOutHandler();
   }
   function model_mainUIModeChangeHandler(event)
   {
      this.updateBGVisible();
   }
}
