class g4.view.baseUI.BaseUI
{
   var gRegisterUIDataList = new Array();
   var gUIList = new Array();
   var disableUIName_array = new Array();
   var eachUIGap = 5;
   var gbDraggedIcon = undefined;
   var gDepth = 1;
   var resolutionX = null;
   var resolutionY = null;
   var removeListenerIndex = null;
   var removeUIListIndex = null;
   var removeTarget = null;
   var dragingMc = null;
   var dragingIcon = null;
   var bUsedBattleMode = false;
   var readyToPosition = null;
   var ExpandOption = null;
   function BaseUI(targetMovieClip)
   {
      this._targetMovieClip = targetMovieClip;
      _global.EventBroadCaster = new Object();
      AsBroadcaster.initialize(_global.EventBroadCaster);
      new g4.model.GameModel();
      _global.gfxExtensions = true;
      Stage.scaleMode = "showAll";
      TextField.prototype.setText = function(str, flag)
      {
         var _loc2_ = false;
         if(flag != undefined)
         {
            _loc2_ = lib.util.ExtString.textCut(this,str);
         }
         else
         {
            _loc2_ = lib.util.ExtString.textCut(this,str,1);
         }
         return _loc2_;
      };
      this.BaseUIListener = new Object();
      _global.EventBroadCaster.addListener(this.BaseUIListener);
      _global.freezeGame = false;
      _global.inputing = false;
      _global.chating = false;
      _global.gbUIMode = false;
      _global.control = false;
      _global.shift = false;
      _global.modal = false;
      _global.gbBattleMode = false;
      _root.UImadeHeight = lib.info.AlignInfo.UI_HEIGHT;
      _root.verticalSpace = lib.info.AlignInfo.getVerticalSpace();
      _root.horizontalSpace = lib.info.AlignInfo.getHorizontalSpace();
      _root.bSelectSlotMode = false;
      _root.UImadeWidth = lib.info.AlignInfo.UI_WIDTH;
      _root.MyLevel = 0;
      _root.die = false;
      _root.gbDraggingTile = false;
      _root.showLoadingSymbols = false;
      _root.BaseUIListener = this.BaseUIListener;
      _root.BaseUI = this._targetMovieClip;
      _root.debug = this._targetMovieClip.debug;
      _root.debug2 = this._targetMovieClip.debug2;
      _root.debug3 = this._targetMovieClip.debug3;
      _root.OnGameEvent = g4.util.Delegate.create(this,this.OnGameEvent);
      _root.GetLoadedUI = g4.util.Delegate.create(this,this.GetLoadedUI);
      _root.HideUI = g4.util.Delegate.create(this,this.HideUI);
      _root.ToGame_SaveUIPosition = g4.util.Delegate.create(this,this.ToGame_SaveUIPosition);
      _root.gUIList = this.gUIList;
      _root.readyToPositions = this.readyToPositions;
      _root.ToGame_RequestSetUIPosition = g4.util.Delegate.create(this,this.ToGame_RequestSetUIPosition);
      _root.GetRegisterUIData = g4.util.Delegate.create(this,this.GetRegisterUIData);
      _root.waitingShowUI = g4.util.Delegate.create(this,this.waitingShowUI);
      _root.lockUI = g4.util.Delegate.create(this,this.lockUI);
      _root.lockNormalPopup = g4.util.Delegate.create(this,this.lockNormalPopup);
      _root.lockInteractionPopup = g4.util.Delegate.create(this,this.lockInteractionPopup);
      _root.lockBattleUI = g4.util.Delegate.create(this,this.lockBattleUI);
      _root.removeUIInAlignGroup = g4.util.Delegate.create(this,this.removeUIInAlignGroup);
      _root.resetUIALign = g4.util.Delegate.create(this,this.resetUIALign);
      _root.lockRegisterUI = g4.util.Delegate.create(this,this.lockRegisterUI);
      _root.checkStartDrag = g4.util.Delegate.create(this,this.checkStartDrag);
      _root.ToGame_CTRLMouseDown = g4.util.Delegate.create(this,this.ToGame_CTRLMouseDown);
      _root.setDisableUI = g4.util.Delegate.create(this,this.setDisableUI);
      _root.ToGame_PlaySound = g4.util.Delegate.create(this,this.ToGame_PlaySound);
      _root.resetUIPosition = g4.util.Delegate.create(this,this.resetUIPosition);
      this.enableTrans = lib.info.ColorTrans.enableTrans();
      this.disableTrans = lib.info.ColorTrans.slotDragTrans();
      this.axis = new lib.util.AxisResetter();
      this.layoutManager = com.bluehole.tera.managers.LayoutManager.instance;
      this.bTelePorting = false;
      this.inLobby = true;
      this.readyToPosition = null;
      this.ExpandOption = null;
      this.waitingShowUI = {};
      this.readyToPositions = {};
      this.container_normal_mc = this._targetMovieClip.container_normal_mc;
      this.container_battle_mc = this._targetMovieClip.container_battle_mc;
      this.container_overlayMap_mc = this._targetMovieClip.container_overlayMap_mc;
      this.container_chat_mc = this._targetMovieClip.container_chat_mc;
      this.container_battleUp_mc = this._targetMovieClip.container_battleUp_mc;
      this.container_halfPopup_mc = this._targetMovieClip.container_halfPopup_mc;
      this.container_norPopup_mc = this._targetMovieClip.container_norPopup_mc;
      this.container_interPopup_mc = this._targetMovieClip.container_interPopup_mc;
      this.container_sysPopup_mc = this._targetMovieClip.container_sysPopup_mc;
      this.container_lobby_mc = this._targetMovieClip.container_lobby_mc;
      this.container_mainmenuUpside_mc = this._targetMovieClip.container_mainmenuUpside_mc;
      this.container_tooltip_mc = this._targetMovieClip.container_tooltip_mc;
      this.container_inGameMovie_mc = this._targetMovieClip.container_inGameMovie_mc;
      this.container_balloon_mc = this._targetMovieClip.container_balloon_mc;
      this.container_villager_mc = this._targetMovieClip.container_villager_mc;
      this.container_question_mc = this._targetMovieClip.container_question_mc;
      this.container_mainmenu_mc = this._targetMovieClip.container_mainmenu_mc;
      this.container_logout_mc = this._targetMovieClip.container_logout_mc;
      this.container_message_mc = this._targetMovieClip.container_message_mc;
      this.container_highDepth_mc = this._targetMovieClip.container_highDepth_mc;
      this.container_alwaysVisible_mc = this._targetMovieClip.container_alwaysVisible_mc;
      this.dragSlot_mc = targetMovieClip.dragSlot_mc;
      this.mouseHere_mc = targetMovieClip.mouseHere_mc;
      this.s1 = targetMovieClip.s1;
      this.s2 = targetMovieClip.s2;
      this.dragSlot_mc._visible = false;
      this.mouseHere_mc._visible = false;
      this.mouseHere_mc.hitTestDisable = true;
      this.dragSlot_mc.hitTestDisable = true;
      this.dragManager = gfx.managers.DragManager.instance;
      this.dragManager.addEventListener("dragEnd",this,"dragManager_dragEndHandler");
      this.whenTeleportRecoverUI = new Array();
      this.whenTeleportRecoverUI2 = new Array();
      this.whenTeleportRecoverUI3 = new Array();
      this.announce();
      var _loc10_ = new lib.util.CoolTimeInstance();
      this.aCoolTimeManger = lib.util.CoolTimeManger.getInstance();
      unloadMovie(this.s1);
      unloadMovie(this.s2);
      this.stageResizeObject = new Object();
      this.stageResizeObject.onResize = function()
      {
         var _loc3_ = Stage.width;
         var _loc2_ = Stage.height;
         lib.info.AlignInfo.horizontalSpace = (_loc3_ - lib.info.AlignInfo.UI_WIDTH) / 2;
         lib.info.AlignInfo.verticalSpace = (_loc2_ - lib.info.AlignInfo.UI_HEIGHT) / 2;
         lib.info.AlignInfo.zeroPointX = - lib.info.AlignInfo.horizontalSpace;
         lib.info.AlignInfo.zeroPointY = - lib.info.AlignInfo.verticalSpace;
         lib.info.AlignInfo.onePercentPixelW = _loc3_ / 100;
         lib.info.AlignInfo.onePercentPixelH = _loc2_ / 100;
         lib.info.AlignInfo.onePixelPercentW = 100 / _loc3_;
         lib.info.AlignInfo.onePixelPercentH = 100 / _loc2_;
         _root.OnGameEvent("OnGame_ChangeStageSize",_loc3_,_loc2_);
      };
      Stage.addListener(this.stageResizeObject);
      var scope = this;
      _global.StartIconDrag = function(slot, IconName, x, y, xo, yo)
      {
         if(_global.freezeGame)
         {
            return undefined;
         }
         _root.gbDraggingTile = false;
         if(IconName != "")
         {
            _root.gbDraggingTile = true;
            scope.gbDraggedIcon = scope.CreateDraggedIcon(slot);
            Mouse.hide();
            scope.gbDraggedIcon._x = _root._xmouse;
            scope.gbDraggedIcon._y = _root._ymouse;
            scope.gbDraggedIcon.startDrag(false);
            scope.ToGameStartDrag(g4.util.UIUtil.getDragSlotValue(slot));
            var _loc3_ = {};
            _loc3_.TEX = IconName;
            _loc3_.iconWidth = 50;
            _loc3_.iconHeight = 50;
            scope.dragManager.startGhostDrag(_loc3_,slot);
         }
      };
      this.KeyListener = new Object();
      this.KeyListener.onKeyDown = function()
      {
         var _loc3_ = Key.getCode();
         if(_global.chating == false && _global.inputing == false && _global.modal == false)
         {
            scope.KeyDown();
            _root.OnGameEvent("OnGame_KeyDown",_loc3_);
         }
      };
      this.KeyListener.onKeyUp = function()
      {
         var _loc3_ = Key.getCode();
         if(_global.chating == false && _global.inputing == false && _global.modal == false)
         {
            scope.KeyUp();
            _root.OnGameEvent("OnGame_KeyUp",_loc3_);
         }
      };
      this.bKeyListening = false;
      this.AddKeyListener();
      this.BaseUIListener.OnGame_SelectSlotMode = function(bTrue)
      {
         bTrue = Number(bTrue);
         _root.bSelectSlotMode = bTrue;
      };
      this.BaseUIListener.OnGameEventUpdateUserLevel = function(Level)
      {
         _root.MyLevel = Number(Level);
      };
      this.BaseUIListener.OnGame_MouseMove = function()
      {
      };
      this.BaseUIListener.OnGame_MouseDown = function()
      {
      };
      this.BaseUIListener.OnGame_MouseUp = function()
      {
      };
      this.BaseUIListener.OnGame_MouseWheel = function()
      {
      };
      this.BaseUIListener.OnGame_KeyUp = function()
      {
      };
      this.BaseUIListener.OnGame_KeyUp = function()
      {
      };
      this.BaseUIListener.OnGame_KeyDown = function(code)
      {
      };
      this.BaseUIListener.OnGame_Popup_Create = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.UI_OPEN);
      };
      this.BaseUIListener.OnGame_Popup_Remove = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.UI_CLOSE);
      };
      this.BaseUIListener.OnGame_ScaleUI = function(value, exception)
      {
         lib.info.AlignInfo.scaleRatio = value / 100;
         scope.rescaleUI("",exception);
      };
      this.BaseUIListener.OnGameEventRegisterUI = function(Name, Path, x, y, bAlwaysLoaded, group, ifLogoutClose, soundData, addData)
      {
         scope.RegisterUI(Name,Path,x,y,bAlwaysLoaded,group,ifLogoutClose,soundData,addData);
      };
      this.BaseUIListener.OnGame_RegisterLoadUIData = function(Name, Path, x, y, bAlwaysLoaded, group, ifLogoutClose, soundData, addData)
      {
         scope.RegisterUI(Name,Path,x,y,bAlwaysLoaded,group,ifLogoutClose,soundData,addData);
      };
      this.BaseUIListener.OnGameEventUpdateBattleState = function(bMode)
      {
         if(false == scope.bUsedBattleMode)
         {
            return undefined;
         }
         bMode = Boolean(Number(bMode));
         scope.changedBattleState(bMode);
      };
      this.BaseUIListener.OnGameEventChangeUIMode = g4.util.Delegate.create(this,this.OnGameEventChangeUIMode);
      this.BaseUIListener.OnGameEventShowUI = g4.util.Delegate.create(this,this.OnGameEventShowUI);
      this.BaseUIListener.OnGame_OnlyShowUI = g4.util.Delegate.create(this,this.OnGame_OnlyShowUI);
      this.BaseUIListener.OnGame_LogOut = g4.util.Delegate.create(this,this.OnGame_LogOut);
      this.BaseUIListener.OnGame_ChangeStageSize = g4.util.Delegate.create(this,this.OnGame_ChangeStageSize);
      this.BaseUIListener.OnGame_ChangeResolution = g4.util.Delegate.create(this,this.OnGame_ChangeResolution);
      this.BaseUIListener.OnGame_SetUIPosition = g4.util.Delegate.create(this,this.OnGame_SetUIPosition);
      this.BaseUIListener.OnGame_HideAllUI = g4.util.Delegate.create(this,this.OnGame_HideAllUI);
      this.BaseUIListener.OnGame_HideAllUIForCaption = g4.util.Delegate.create(this,this.OnGame_HideAllUIForCaption);
      this.BaseUIListener.OnGame_StartTelePort = g4.util.Delegate.create(this,this.OnGame_StartTelePort);
      this.BaseUIListener.OnGame_EndTelePort = g4.util.Delegate.create(this,this.OnGame_EndTelePort);
      this.BaseUIListener.OnGame_DisableUI = g4.util.Delegate.create(this,this.OnGame_DisableUI);
      this.BaseUIListener.OnGame_PlaySound = g4.util.Delegate.create(this,this.OnGame_PlaySound);
      this.BaseUIListener.OnGame_SetDefaultData = g4.util.Delegate.create(this,this.OnGame_SetDefaultData);
      this.customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
      this.customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"changedUICustomizeHandler");
      this.battleModeObj = new Object();
      this.battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_PARTYWINDOW_BOOLEAN] = "PartyWindow";
      this.battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_PARTYWINDOWRAIDINFO_BOOLEAN] = "PartyWindowRaidInfo";
      this.battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_MINIMAP_BOOLEAN] = "MiniMap";
      this.battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_QUESTTASKINFO_BOOLEAN] = "QuestTaskInfo";
      this.battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_MAINMENU_BOOLEAN] = "MainMenu";
      this.battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_OVERLAY_BOOLEAN] = "OverlayMap2";
      this.battleModeObj[lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_CHAT_BOOLEAN] = "Chat2";
      this.selectedBattleModeUIName = new Array();
      this.changedVisibleForBattleMode = [];
      this.changedVisibleUINameObj = new Object();
      this.initUIBattleMode();
      this.startCount = 0;
      this._targetMovieClip.onEnterFrame = g4.util.Delegate.create(this,this.OnEnterFrame);
      this.doInitialize();
      this._targetMovieClip.stop();
      g4.manager.MouseEventManager.getInstance().init(targetMovieClip,this);
   }
   function OnGameEvent(EventName, Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, Param9, Param10, Param11, Param12, Param13, Param14, Param15, Param16, Param17, Param18, Param19, Param20, Param21, Param22, Param23, Param24, Param25, Param26, Param27, Param28, Param29, Param30, Param31, Param32)
   {
      if(EventName != "OnGame_MouseMove")
      {
      }
      _global.EventBroadCaster.broadcastMessage(EventName,Param1,Param2,Param3,Param4,Param5,Param6,Param7,Param8,Param9,Param10,Param11,Param12,Param13,Param14,Param15,Param16,Param17,Param18,Param19,Param20,Param21,Param22,Param23,Param24,Param25,Param26,Param27,Param28,Param29,Param30,Param31,Param32);
   }
   function doInitialize()
   {
      g4.util.Translator.init(lib.util.UIString.getUIString("$005033"),lib.util.UIString.getUIString("$005034"),lib.util.UIString.getUIString("$005035"),lib.util.UIString.getUIString("$005036"));
   }
   function OnEnterFrame()
   {
      this.startCount = this.startCount + 1;
      if(this.startCount >= 30)
      {
         this.stageResizeObject.onResize();
         this.BaseUIListener.OnGame_ChangeStageSize();
         _root.OnGameEvent("OnGame_ChangeStageSize",Stage.width,Stage.height);
         delete this._targetMovieClip.onEnterFrame;
      }
   }
   function OnGame_SetDefaultData(_defaultName, _param0, _param1)
   {
      lib.gamedata.DefaultData.AddDefaultUIData(_defaultName,_param0,_param1);
      if(_defaultName == "uiscale")
      {
         this.customizeData.updateDefaultDatas(lib.gamedata.CustomizedUIDataKey.UISCALE_ALL_PERCENT,Number(_param0));
         this.customizeData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_ALL_PERCENT,Number(_param0));
      }
      if(_defaultName == "minimapmode")
      {
         this.customizeData.updateDefaultDatas(lib.gamedata.CustomizedUIDataKey.MINIMAP_MINIMIZE_BOOLEAN,Number(_param0));
         this.customizeData.saveData(lib.gamedata.CustomizedUIDataKey.MINIMAP_MINIMIZE_BOOLEAN,Number(_param0));
      }
   }
   function OnGame_PlaySound(num)
   {
      getURL("FSCommand:ToGame_PlaySound",num);
   }
   function OnGame_DisableUI(Name, bTrue)
   {
      bTrue = Number(bTrue);
      if(Name == "CONTAINER_NORMAL")
      {
         this.setDisableUI(this.container_normal_mc,bTrue);
      }
      else if(Name == "CONTAINER_BATTLE")
      {
         this.setDisableUI(this.container_battle_mc,bTrue);
         this.setDisableUI(this.container_overlayMap_mc,bTrue);
         this.setDisableUI(this.container_chat_mc,bTrue);
      }
      else if(Name == "CONTAINER_BATTLEUP")
      {
         this.setDisableUI(this.container_battleUp_mc,bTrue);
      }
      else if(Name == "CONTAINER_HALFPOPUP")
      {
         this.setDisableUI(this.container_halfPopup_mc,bTrue);
      }
      else if(Name == "CONTAINER_ALL")
      {
         this.setDisableUI(this._targetMovieClip,bTrue);
      }
      else if(Name == "CONTAINER_POPUP_NORMAL")
      {
         this.setDisableUI(this.container_norPopup_mc,bTrue);
      }
      else if(Name == "CONTAINER_POPUP_INTERACTION")
      {
         this.setDisableUI(this.container_interPopup_mc,bTrue);
      }
      else if(Name == "CONTAINER_POPUP_SYSTEM")
      {
         this.setDisableUI(this.container_sysPopup_mc,bTrue);
      }
      else if(Name == "CONTAINER_LOBBY")
      {
         this.setDisableUI(this.container_lobby_mc,bTrue);
      }
      else if(Name == "CONTAINER_MAINMENUUPSIDE")
      {
         this.setDisableUI(this.container_mainmenuUpside_mc,bTrue);
      }
      else if(Name == "CONTAINER_TOOLTIP")
      {
         this.setDisableUI(this.container_tooltip_mc,bTrue);
      }
      else
      {
         var _loc5_ = this.GetLoadedUI(Name);
         var _loc4_ = this.checkDisableUI(Name);
         if(bTrue)
         {
            if(_loc4_ == null)
            {
               this.disableUIName_array.push(Name);
            }
            this.setDisableUI(_loc5_,1);
         }
         else
         {
            if(_loc4_ != null)
            {
               this.disableUIName_array.splice(_loc4_,1);
            }
            this.setDisableUI(_loc5_,0);
         }
      }
   }
   function OnGame_EndTelePort()
   {
      this.bTelePorting = false;
      this.container_sysPopup_mc._visible = true;
      this.container_logout_mc._visible = true;
      this.container_interPopup_mc._visible = true;
      this.container_norPopup_mc._visible = true;
      this.container_tooltip_mc._visible = true;
      this.container_mainmenu_mc._visible = true;
      this.container_question_mc._visible = true;
      this.container_villager_mc._visible = true;
      this.container_battleUp_mc._visible = true;
      var _loc3_ = 0;
      while(_loc3_ < this.whenTeleportRecoverUI.length)
      {
         _root.OnGameEvent("OnGameEventShowUI",this.whenTeleportRecoverUI[_loc3_],1);
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < this.whenTeleportRecoverUI2.length)
      {
         this.whenTeleportRecoverUI2[_loc3_]._visible = true;
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < this.whenTeleportRecoverUI3.length)
      {
         this.whenTeleportRecoverUI3[_loc3_]._visible = true;
         _loc3_ = _loc3_ + 1;
      }
      this.whenTeleportRecoverUI = [];
      this.whenTeleportRecoverUI2 = [];
      this.whenTeleportRecoverUI3 = [];
      this.container_battle_mc._visible = true;
      this.container_overlayMap_mc._visible = true;
      this.container_chat_mc._visible = true;
      this.container_balloon_mc._visible = true;
      this.container_halfPopup_mc._visible = true;
      this.container_inGameMovie_mc._visible = true;
      this.container_lobby_mc._visible = true;
      this.container_mainmenuUpside_mc._visible = true;
   }
   function OnGame_StartTelePort()
   {
      this.bTelePorting = true;
      _root.OnGameEvent("OnGame_CantHideMsg_ShowLogo",false);
      this.container_sysPopup_mc._visible = false;
      this.container_logout_mc._visible = false;
      this.container_interPopup_mc._visible = false;
      this.container_norPopup_mc._visible = false;
      this.container_tooltip_mc._visible = false;
      this.container_mainmenu_mc._visible = false;
      this.container_question_mc._visible = false;
      this.container_villager_mc._visible = false;
      for(var _loc4_ in this.container_normal_mc)
      {
         var _loc3_ = this.container_normal_mc[_loc4_];
         if(typeof _loc3_ == "movieclip")
         {
            if(_loc3_._name.toLowerCase() != "learnkeyusage")
            {
               if(_loc3_._visible)
               {
                  this.whenTeleportRecoverUI.push(_loc3_._name);
               }
               _root.OnGameEvent("OnGameEventShowUI",_loc3_._name,0);
            }
         }
      }
      for(var _loc4_ in this.container_battle_mc)
      {
         _loc3_ = this.container_battle_mc[_loc4_];
         if(typeof _loc3_ == "movieclip")
         {
            if(_loc3_._name.toLowerCase() != "loadingprogress")
            {
               if(_loc3_._visible)
               {
                  this.whenTeleportRecoverUI2.push(_loc3_);
               }
               _loc3_._visible = false;
            }
         }
      }
      this.container_overlayMap_mc._visible = false;
      this.container_chat_mc._visible = false;
      this.container_balloon_mc._visible = false;
      this.container_halfPopup_mc._visible = false;
      this.container_inGameMovie_mc._visible = false;
      this.container_lobby_mc._visible = false;
      this.container_mainmenuUpside_mc._visible = false;
      for(var _loc4_ in this.container_battleUp_mc)
      {
         _loc3_ = this.container_battleUp_mc[_loc4_];
         if(typeof _loc3_ == "movieclip")
         {
            if(_loc3_._name.toLowerCase() != "updatenotification")
            {
               if(_loc3_._visible)
               {
                  this.whenTeleportRecoverUI3.push(_loc3_);
               }
               _loc3_._visible = false;
            }
         }
      }
   }
   function OnGame_HideAllUIForCaption(bHide)
   {
      bHide = Number(bHide);
      this.container_sysPopup_mc._visible = !bHide;
      this.container_logout_mc._visible = !bHide;
      this.container_interPopup_mc._visible = !bHide;
      this.container_norPopup_mc._visible = !bHide;
      this.container_tooltip_mc._visible = !bHide;
      this.container_mainmenu_mc._visible = !bHide;
      this.container_question_mc._visible = !bHide;
      this.container_villager_mc._visible = !bHide;
      this.container_battleUp_mc._visible = !bHide;
      this.container_normal_mc._visible = !bHide;
      this.container_battle_mc._visible = !bHide;
      this.container_overlayMap_mc._visible = !bHide;
      this.container_chat_mc._visible = !bHide;
      this.container_halfPopup_mc._visible = !bHide;
      this.container_message_mc._visible = true;
      this.container_inGameMovie_mc._visible = !bHide;
      this.container_lobby_mc._visible = !bHide;
      this.container_mainmenuUpside_mc._visible = !bHide;
      this.container_highDepth_mc._visible = !bHide;
   }
   function OnGame_HideAllUI(bHide)
   {
      bHide = Number(bHide);
      _root.OnGameEvent("OnGame_CantHideMsg_ShowLogo",bHide);
      this.container_sysPopup_mc._visible = !bHide;
      this.container_logout_mc._visible = !bHide;
      this.container_interPopup_mc._visible = !bHide;
      this.container_norPopup_mc._visible = !bHide;
      this.container_mainmenu_mc._visible = !bHide;
      this.container_question_mc._visible = !bHide;
      this.container_villager_mc._visible = !bHide;
      this.container_battleUp_mc._visible = !bHide;
      this.container_normal_mc._visible = !bHide;
      this.container_battle_mc._visible = !bHide;
      this.container_overlayMap_mc._visible = !bHide;
      this.container_chat_mc._visible = !bHide;
      this.container_halfPopup_mc._visible = !bHide;
      this.container_message_mc._visible = !bHide;
      this.container_inGameMovie_mc._visible = !bHide;
      this.container_lobby_mc._visible = !bHide;
      this.container_mainmenuUpside_mc._visible = !bHide;
      this.container_highDepth_mc._visible = !bHide;
   }
   function correctUIPosition(ui)
   {
      if(ui == null)
      {
         return undefined;
      }
      if(ui._x < lib.info.AlignInfo.zeroPointX)
      {
         ui._x = lib.info.AlignInfo.zeroPointX;
      }
      if(ui._y < lib.info.AlignInfo.zeroPointY)
      {
         ui._y = lib.info.AlignInfo.zeroPointY;
      }
   }
   function OnGame_SetUIPosition(bLocked, UIName, posXRatio, posYRatio, notRatio)
   {
      var _loc12_ = UIName.toLowerCase();
      if(this.readyToPositions[_loc12_].cancelPosition)
      {
         return undefined;
      }
      var _loc5_ = this.GetRegisterUIData(UIName);
      var _loc7_ = _loc5_.GROUP;
      var _loc3_ = this.GetLoadedUI(UIName);
      _loc5_.locked = Number(bLocked);
      if(_loc3_ == undefined || _loc3_ == "")
      {
         return undefined;
      }
      if(posXRatio == "" || posXRatio == undefined || posYRatio == "" || posYRatio == undefined)
      {
         posXRatio = _loc5_.xRatio;
         posYRatio = _loc5_.yRatio;
         this.ToGame_SaveUIPosition(bLocked,UIName,posXRatio,posYRatio);
      }
      if(UIName.toLowerCase() == "tradepopup")
      {
         if(this.readyToPositions[_loc12_].lstate == true)
         {
            if(_loc7_ < 50)
            {
               this.openingAni2(_loc3_);
            }
            else
            {
               this.openingAni2(_loc3_);
            }
            _root.OnGameEvent("OnGameEventShowWindow",UIName,true,this.readyToPositions[_loc12_].expandOption);
         }
         return undefined;
      }
      var _loc13_ = lib.info.AlignInfo.uiScale(UIName,_loc3_);
      var _loc4_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc13_);
      if(_loc5_.locked)
      {
         _loc3_.container_mc.lock_mc.stat = 1;
         _loc3_.container_mc.lock_mc.lock(true);
         if(notRatio == 1)
         {
            _loc3_._x = posXRatio;
            _loc3_._y = posYRatio;
         }
         else if(_loc7_ >= 1 && _loc7_ < 50)
         {
            _loc3_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * posXRatio;
            _loc3_._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * posYRatio;
            if(_loc3_._x < lib.info.AlignInfo.zeroPointX || _loc3_._y < lib.info.AlignInfo.zeroPointY - 50)
            {
               _loc3_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc5_.xRatio;
               _loc3_._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc5_.yRatio;
            }
            if(_loc5_.PA == 1)
            {
            }
            if(_loc5_.PA == 2)
            {
               _loc3_._x = _loc3_._x - _loc3_.hit._width / 2 * _loc4_;
            }
            if(_loc5_.PA == 3)
            {
               _loc3_._x = _loc3_._x - _loc3_.hit._width * _loc4_;
            }
            if(_loc5_.PA == 4)
            {
               _loc3_._y = _loc3_._y - _loc3_.hit._height / 2 * _loc4_;
            }
            else if(_loc5_.PA == 5)
            {
               _loc3_._x = _loc3_._x - _loc3_.hit._width / 2 * _loc4_;
               _loc3_._y = _loc3_._y - _loc3_.hit._height / 2 * _loc4_;
            }
            else if(_loc5_.PA == 6)
            {
               _loc3_._x = _loc3_._x - _loc3_.hit._width * _loc4_;
               _loc3_._y = _loc3_._y - _loc3_.hit._height / 2 * _loc4_;
            }
            else if(_loc5_.PA == 7)
            {
               _loc3_._y = _loc3_._y - _loc3_.hit._height * _loc4_;
            }
            else if(_loc5_.PA == 8)
            {
               _loc3_._x = _loc3_._x - _loc3_.hit._width / 2 * _loc4_;
               _loc3_._y = _loc3_._y - _loc3_.hit._height * _loc4_;
            }
            else if(_loc5_.PA == 9)
            {
               _loc3_._x = _loc3_._x - _loc3_.hit._width * _loc4_;
               _loc3_._y = _loc3_._y - _loc3_.hit._height * _loc4_;
            }
            this.correctUIPosition(_loc3_);
         }
         else
         {
            _loc3_._x = 0;
            _loc3_._y = 0;
         }
      }
      else
      {
         _loc3_.container_mc.lock_mc.stat = 0;
         _loc3_.container_mc.lock_mc.lock(false);
         if(_loc7_ == 1)
         {
            if(notRatio)
            {
               _loc3_._x = posXRatio;
               _loc3_._y = posYRatio;
               this.resetUIALign(2);
            }
            else if(this.GetAlignUI(UIName) == null)
            {
               _loc3_._y = lib.info.AlignInfo.ALIGN_YPOS;
               if(_loc12_ == "inventory")
               {
                  posXRatio = 100;
                  posYRatio = 12.5;
                  _loc3_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * posXRatio;
                  _loc3_._x = _loc3_._x - _loc3_.hit._width * _loc4_;
                  _loc3_.container_mc.lock_mc.setEnabled(false);
               }
               else
               {
                  this.alignGroup_array.push(_loc3_);
                  this.resetUIALign(2);
               }
            }
         }
         else if(_loc7_ > 1 && _loc7_ < 50)
         {
            _loc3_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * posXRatio;
            _loc3_._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * posYRatio;
            if(_loc3_._x < lib.info.AlignInfo.zeroPointX || _loc3_._y < lib.info.AlignInfo.zeroPointY - 50)
            {
               _loc3_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * _loc5_.xRatio;
               _loc3_._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * _loc5_.yRatio;
            }
            if(_loc5_.PA == 1)
            {
            }
            if(_loc5_.PA == 2)
            {
               _loc3_._x = _loc3_._x - _loc3_.hit._width / 2 * _loc4_;
            }
            if(_loc5_.PA == 3)
            {
               _loc3_._x = _loc3_._x - _loc3_.hit._width * _loc4_;
            }
            if(_loc5_.PA == 4)
            {
               _loc3_._y = _loc3_._y - _loc3_.hit._height / 2 * _loc4_;
            }
            else if(_loc5_.PA == 5)
            {
               _loc3_._x = _loc3_._x - _loc3_.hit._width / 2 * _loc4_;
               _loc3_._y = _loc3_._y - _loc3_.hit._height / 2 * _loc4_;
            }
            else if(_loc5_.PA == 6)
            {
               _loc3_._x = _loc3_._x - _loc3_.hit._width * _loc4_;
               _loc3_._y = _loc3_._y - _loc3_.hit._height / 2 * _loc4_;
            }
            else if(_loc5_.PA == 7)
            {
               _loc3_._y = _loc3_._y - _loc3_.hit._height * _loc4_;
            }
            else if(_loc5_.PA == 8)
            {
               _loc3_._x = _loc3_._x - _loc3_.hit._width / 2 * _loc4_;
               _loc3_._y = _loc3_._y - _loc3_.hit._height * _loc4_;
            }
            else if(_loc5_.PA == 9)
            {
               _loc3_._x = _loc3_._x - _loc3_.hit._width * _loc4_;
               _loc3_._y = _loc3_._y - _loc3_.hit._height * _loc4_;
            }
            this.correctUIPosition(_loc3_);
         }
         else
         {
            _loc3_._x = 0;
            _loc3_._y = 0;
         }
      }
      var _loc11_ = lib.info.AlignInfo.horizontalSpace + _loc3_._x;
      var _loc10_ = lib.info.AlignInfo.verticalSpace + _loc3_._y;
      if(_loc5_.PA == 1)
      {
      }
      if(_loc5_.PA == 2)
      {
         _loc11_ = _loc11_ + _loc3_.hit._width / 2 * _loc4_;
      }
      if(_loc5_.PA == 3)
      {
         _loc11_ = _loc11_ + _loc3_.hit._width * _loc4_;
      }
      if(_loc5_.PA == 4)
      {
         _loc10_ = _loc10_ + _loc3_.hit._height / 2 * _loc4_;
      }
      else if(_loc5_.PA == 5)
      {
         _loc11_ = _loc11_ + _loc3_.hit._width / 2 * _loc4_;
         _loc10_ = _loc10_ + _loc3_.hit._height / 2 * _loc4_;
      }
      else if(_loc5_.PA == 6)
      {
         _loc11_ = _loc11_ + _loc3_.hit._width * _loc4_;
         _loc10_ = _loc10_ + _loc3_.hit._height / 2 * _loc4_;
      }
      else if(_loc5_.PA == 7)
      {
         _loc10_ = _loc10_ + _loc3_.hit._height * _loc4_;
      }
      else if(_loc5_.PA == 8)
      {
         _loc11_ = _loc11_ + _loc3_.hit._width / 2 * _loc4_;
         _loc10_ = _loc10_ + _loc3_.hit._height * _loc4_;
      }
      else if(_loc5_.PA == 9)
      {
         _loc11_ = _loc11_ + _loc3_.hit._width * _loc4_;
         _loc10_ = _loc10_ + _loc3_.hit._height * _loc4_;
      }
      _loc11_ = _loc11_ * lib.info.AlignInfo.onePixelPercentW;
      _loc10_ = _loc10_ * lib.info.AlignInfo.onePixelPercentH;
      if(this.readyToPositions[_loc12_].lstate == true)
      {
         if(_loc7_ < 50)
         {
            this.openingAni2(_loc3_);
         }
         else
         {
            this.openingAni2(_loc3_);
         }
         _root.OnGameEvent("OnGameEventShowWindow",UIName,true,this.readyToPositions[_loc12_].expandOption);
      }
   }
   function OnGame_ChangeStageSize(w, h)
   {
      this.resetUIALign(1);
      this.repositionLockedUI();
   }
   function OnGame_ChangeResolution(w, h)
   {
      this.resolutionX = w;
      this.resolutionY = h;
   }
   function OnGame_LogOut()
   {
      this.inLobby = true;
      var _loc9_ = this.disableUIName_array.length;
      var _loc10_ = this.disableUIName_array.concat();
      var _loc3_ = 0;
      while(_loc3_ < _loc9_)
      {
         _root.OnGameEvent("OnGame_DisableUI",_loc10_[_loc3_],0);
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < this.gRegisterUIDataList.length)
      {
         var _loc5_ = this.gRegisterUIDataList[_loc3_];
         var _loc7_ = _loc5_.ifLogOutClose;
         var _loc6_ = _loc5_.Name;
         if(_loc7_)
         {
            _root.OnGameEvent("OnGameEventShowUI",_loc6_,0);
         }
         _loc3_ = _loc3_ + 1;
      }
      var _loc4_ = lib.manager.PopupManager.getArray("",1);
      if(_loc4_.length >= 1)
      {
         var _loc8_ = _loc4_.length;
         _loc3_ = 0;
         while(_loc3_ < _loc8_)
         {
            if(_loc4_[_loc3_].type == 0)
            {
               _loc4_.push(_loc4_.splice(_loc3_,1));
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc8_)
         {
            _root.OnGameEvent("OnGame_Popup_Remove",_loc4_[_loc3_].id);
            getURL("FSCommand:ToGame_Popup_RemoveUISide",_loc4_[_loc3_].id);
            _loc3_ = _loc3_ + 1;
         }
      }
      this.aCoolTimeManger.clearCoolTimer();
      lib.gamedata.HistoryData.deleteAllHistoryData();
      this.disableUIName_array = [];
   }
   function OnGame_OnlyShowUI(bTrue, Name)
   {
      bTrue = Number(bTrue);
      var _loc6_ = this.GetLoadedUI(Name);
      if(bTrue)
      {
         if(_loc6_ == null)
         {
            this.BaseUIListener.OnGameEventShowUI(Name,1);
         }
         var _loc3_ = 0;
         while(_loc3_ < this.gUIList.length)
         {
            var _loc2_ = this.gUIList[_loc3_];
            if(_loc2_._visible)
            {
               if(_loc2_._name.toLowerCase() == Name.toLowerCase())
               {
                  _loc2_._visible = true;
                  _loc2_.OnlyShowUIMode = "yes";
               }
               else if(_loc2_._name.toLowerCase() != "canthidemsg")
               {
                  _loc2_._visible = false;
                  _loc2_.OnlyShowUIMode = "no";
               }
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      else
      {
         _loc3_ = 0;
         while(_loc3_ < this.gUIList.length)
         {
            _loc2_ = this.gUIList[_loc3_];
            if(_loc2_.OnlyShowUIMode != undefined)
            {
               _loc2_._visible = true;
               _loc2_.OnlyShowUIMode = undefined;
            }
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function OnGameEventShowUI(Name, bShow, expandOption)
   {
      stopDrag();
      if(_root.gbDraggingTile)
      {
         this.dragSlot_mc._visible = false;
         this.EndIconDrag("InvalidUI");
         this.checkStartDrag(false);
      }
      bShow = Number(bShow);
      var _loc3_ = Name.toLowerCase();
      this.readyToPositions[_loc3_].cancelPosition = !bShow;
      if(bShow)
      {
         if(_loc3_ == "productionprogress")
         {
            this.ProductionProgressDisable(1);
         }
         else if(_loc3_ == "selectcharacter")
         {
            this.inLobby = true;
            this.mouseHere_mc._visible = false;
         }
         this.ShowUI(Name,expandOption);
         fscommand("ToGame_EventShowUIComplete");
      }
      else
      {
         if(this.waitingShowUI[_loc3_].lstate != undefined)
         {
            this.waitingShowUI[_loc3_].lstate = false;
            this.waitingShowUI[_loc3_].expandOption = expandOption;
            this.readyToPositions[_loc3_].lstate = false;
            return undefined;
         }
         if(_loc3_ == "productionprogress")
         {
            this.ProductionProgressDisable(0);
         }
         else if(_loc3_ == "selectcharacter")
         {
            this.inLobby = false;
         }
         else if(_loc3_ == "systemoption")
         {
            this.ToGame_DestroyUI("AutoQualitySet");
         }
         this.HideUI(Name,undefined,expandOption);
      }
   }
   function OnGameEventChangeUIMode(bMode)
   {
      bMode = Number(bMode);
      _global.gbUIMode = bMode;
      if(bMode == 0)
      {
         this.mouseHere_mc.gotoAndStop(1);
         this.mouseHere_mc._visible = false;
         if(!lib.manager.Focus.bFocused)
         {
            Selection.setFocus(null);
         }
         _global.inputing = false;
         _global.chating = false;
         if(_root.gbDraggingTile)
         {
            this.dragSlot_mc._visible = false;
         }
         this.EndIconDrag("InvalidUI");
         this.checkStartDrag(false);
         this.dragManager.stopDrag();
         var _loc7_ = new Array();
         var _loc9_ = this.gUIList.length;
         var _loc5_ = 0;
         while(_loc5_ < _loc9_)
         {
            var _loc4_ = this.gUIList[_loc5_];
            if(_loc4_.info.battleModeClose == 1)
            {
               if(_loc4_._visible)
               {
                  _loc7_.push(_loc4_);
               }
            }
            _loc5_ = _loc5_ + 1;
         }
         var _loc10_ = _loc7_.length;
         _loc5_ = 0;
         while(_loc5_ < _loc10_)
         {
            this.HideUI(_loc7_[_loc5_]._name,1);
            _loc5_ = _loc5_ + 1;
         }
         this.layoutManager.reflowAutoLayoutUIs(com.bluehole.tera.managers.LayoutManager.LAYOUT_REFLOW_MODE_UNLOCKED_UI);
         if(_global.gbBattleMode)
         {
            this.BaseUIListener.OnGameEventUpdateBattleState(1);
         }
      }
      else
      {
         if(_global.gbBattleMode)
         {
            var _loc8_ = this.changedVisibleForBattleMode.length;
            _loc5_ = 0;
            while(_loc5_ < _loc8_)
            {
               var _loc6_ = this.changedVisibleForBattleMode[_loc5_];
               if(_loc6_)
               {
                  _loc6_._visible = true;
               }
               _loc5_ = _loc5_ + 1;
            }
         }
         if(_root.gbDraggingTile)
         {
            this.dragSlot_mc._visible = true;
         }
         this.mouseHere_mc._x = _root._xmouse;
         this.mouseHere_mc._y = _root._ymouse;
         if(!this.inLobby)
         {
            this.mouseHere_mc.gotoAndPlay(2);
            this.mouseHere_mc._visible = true;
         }
      }
   }
   function initUIBattleMode()
   {
      var _loc4_ = ["CharacterWindow","SkillHotKey","ShortCut","ExtShortCut","ExtShortCut2","Abnormality","TargetInfo","GageBar","GageBoss","GageBossTeamA","GageBossTeamB","Crosshair","Message","DungeonEventGage","CoolTimeAlim2","GageStackBar","Balloon","Debuger"];
      var _loc5_ = _loc4_.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         var _loc3_ = _loc4_[_loc2_].toUpperCase();
         this.changedVisibleUINameObj[_loc3_] = true;
         _loc2_ = _loc2_ + 1;
      }
   }
   function changedBattleModeUIHandler(key, bVisible)
   {
      var _loc3_ = this.battleModeObj[key];
      var _loc2_ = _loc3_.toUpperCase();
      if(bVisible)
      {
         this.changedVisibleUINameObj[_loc2_] = true;
      }
      else
      {
         this.changedVisibleUINameObj[_loc2_] = undefined;
      }
   }
   function changedBattleState(bMode)
   {
      _global.gbBattleMode = bMode;
      if(bMode && _global.gbUIMode)
      {
         this.BaseUIListener.OnGameEventChangeUIMode("0");
      }
      if(bMode)
      {
         var _loc9_ = this.gUIList.length;
         var _loc5_ = 0;
         while(_loc5_ < _loc9_)
         {
            var _loc3_ = this.gUIList[_loc5_];
            var _loc6_ = this.GetRegisterUIData(_loc3_._name);
            var _loc7_ = _loc6_.Name.toUpperCase();
            if(this.changedVisibleUINameObj[_loc7_] == undefined)
            {
               if(_loc3_ && _loc6_)
               {
                  if(undefined == _loc3_.bWidgetOpen && undefined == _loc3_.bWindowOpen)
                  {
                     this.changedVisibleForBattleMode.push(_loc3_);
                  }
                  else if(_loc3_.bWidgetOpen || _loc3_.bWindowOpen)
                  {
                     this.changedVisibleForBattleMode.push(_loc3_);
                  }
                  _loc3_._visible = false;
               }
            }
            _loc5_ = _loc5_ + 1;
         }
      }
      else
      {
         var _loc8_ = this.changedVisibleForBattleMode.length;
         _loc5_ = 0;
         while(_loc5_ < _loc8_)
         {
            _loc3_ = this.changedVisibleForBattleMode[_loc5_];
            if(_loc3_)
            {
               var _loc4_ = false;
               if(undefined == _loc3_.bWidgetOpen && undefined == _loc3_.bWindowOpen)
               {
                  _loc4_ = true;
               }
               else if(_loc3_.bWidgetOpen || _loc3_.bWindowOpen)
               {
                  _loc4_ = true;
               }
               _loc3_._visible = _loc4_;
            }
            _loc5_ = _loc5_ + 1;
         }
         this.changedVisibleForBattleMode = [];
      }
   }
   function changedUICustomizeHandler(event)
   {
      switch(event.key)
      {
         case lib.gamedata.CustomizedUIDataKey.UISCALE_ALL_PERCENT:
            _root.OnGameEvent("OnGame_ScaleUI",event.value);
            break;
         case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_UI_BOOLEAN:
            this.bUsedBattleMode = Boolean(Number(event.value));
            if(false == this.bUsedBattleMode && _global.gbBattleMode)
            {
               this.changedBattleState(false);
            }
            break;
         case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_PARTYWINDOW_BOOLEAN:
         case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_PARTYWINDOWRAIDINFO_BOOLEAN:
         case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_MINIMAP_BOOLEAN:
         case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_QUESTTASKINFO_BOOLEAN:
         case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_MAINMENU_BOOLEAN:
         case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_OVERLAY_BOOLEAN:
         case lib.gamedata.CustomizedUIDataKey.BATTLEMODE_VISIBLE_CHAT_BOOLEAN:
            this.changedBattleModeUIHandler(event.key,!Boolean(Number(event.value)));
      }
   }
   function KeyDown()
   {
   }
   function KeyUp()
   {
   }
   function announce()
   {
      var _loc37_ = lib.manager.UISound.UI_OPEN;
      var _loc34_ = lib.manager.Focus.bone();
      var _loc41_ = lib.info.TextColor.SLOT_NUMBER;
      var _loc38_ = lib.info.AlignInfo.xRatioToPixel(100);
      var _loc35_ = lib.info.ToolTipStr.CLOSE;
      var _loc47_ = lib.info.LoadURL.SERVER_SELECT_BG;
      var _loc44_ = lib.info.KeyMap.getKey(48);
      var _loc32_ = new lib.util.AxisResetter();
      var _loc30_ = new lib.util.TxtBtn();
      var _loc28_ = new lib.util.TxtAniBtn();
      var _loc24_ = new lib.util.TabBtn();
      var _loc19_ = new lib.util.McMaker();
      var _loc13_ = new lib.util.ExtTextField();
      var _loc25_ = lib.util.CurrencyFormat.makeComma("123");
      var _loc20_ = lib.util.ExtString.trimChar("abc123");
      var _loc14_ = lib.util.DrawBitmap.draw(this.s1.Icon,"img://__Icon_Skills.Jump_TEX",50,50);
      _loc14_ = lib.util.DrawBitmap.draw(this.s1.Icon,"img://__Icon_Items.blackdagger_TEX",50,50);
      var _loc8_ = lib.util.FrameSeeker.seek(this.s1,1,1);
      var _loc5_ = new lib.util.LbTxtBtn();
      var _loc45_ = lib.util.UIString.getUIString();
      var _loc42_ = new lib.util.List();
      var _loc43_ = new lib.util.CoolTime(1,1);
      var _loc39_ = new lib.util.Warning.init();
      var _loc36_ = lib.util.ColorUtil.RGBToHex(255,255,255);
      var _loc33_ = lib.util.ObjAlign.align();
      var _loc31_ = lib.util.GeneralTabBtn.test;
      var _loc29_ = lib.util.LockBtn.test;
      var _loc26_ = new lib.util.Slot3();
      var _loc21_ = lib.util.StrByteLen.getLenth2("aaa");
      var _loc15_ = lib.util.RGBColor.RGBToHexdecimal(255,0,0);
      var _loc27_ = new lib.util.Slot2.test();
      var _loc22_ = lib.util.AnimationGage.test;
      var _loc16_ = lib.util.Aligner.preLoadVar;
      var _loc9_ = lib.util.SlotInnerAttacher.preLoadVar;
      _loc9_ = new lib.controls.S_SortBtn();
      lib.util.Snapper;
      lib.util.SnapperGroup;
      lib.util.InteractionGroup;
      lib.gamedata.GameData;
      lib.gamedata.GameDataCollection;
      lib.gamedata.GameDataCollectionImpl;
      lib.gamedata.GameDataCoolTimeable;
      lib.gamedata.CustomizedUIData;
      lib.gamedata.CustomizedUIDataKey;
      lib.gamedata.Item;
      lib.gamedata.Skill;
      lib.gamedata.MapMarker;
      lib.gamedata.QuestTaskData;
      lib.gamedata.QuestTaskSubData;
      lib.gamedata.QuestTaskDataCollection;
      lib.gamedata.DefaultData;
      lib.gamedata.HistoryData;
      lib.src.QuestTaskMc;
      lib.src.QuestTaskPartyMc;
      lib.util.TextFieldFormatter;
      lib.controls.S_NumberSteper2;
      g4.view.ViewID;
      g4.util.TeraParser;
      lib.gamedata.CustomizedUIDataCollection.getInstance();
      lib.gamedata.ItemCollection_MyInventory.getInstance();
      lib.gamedata.SkillCollection_MySkills.getInstance();
      var _loc55_ = new lib.controls.S_SimpleScrollBar();
      var _loc49_ = new lib.controls.S_SimpleComboBox();
      var _loc48_ = new lib.controls.S_CheckBox();
      var _loc23_ = new lib.controls.S_NumberSteper();
      var _loc17_ = new lib.controls.S_TextScrollBar();
      _loc17_ = new lib.controls.S_Slider();
      var _loc10_ = lib.controls.S_UIDrager.test;
      var _loc6_ = lib.controls.AutoBuilder.test;
      var _loc2_ = lib.controls.S_2DepthList2.preLoadVar;
      var _loc56_ = lib.controls.S_2DepthList.preLoadVar;
      var _loc53_ = lib.controls.S_2DepthList_ForQuest.preLoadVar;
      var _loc50_ = new lib.controls.S_SimpleScrollBar_width();
      var _loc11_ = new lib.controls.CustomScaleEvent();
      var _loc46_ = lib.controls.S_DragScale.test;
      var _loc18_ = lib.controls.S_2DepthList_Help.preLoadVar;
      var _loc12_ = lib.controls.S_GoldCurrency.test;
      var _loc7_ = lib.util.GoldCurrency.test;
      var _loc3_ = lib.controls.S_GoldCurrencyInput.test;
      var _loc40_ = lib.controls.S_GoldCurrencyInputByAVG.test;
      var _loc57_ = lib.net.NetConnect.test;
      var _loc54_ = new lib.src.ClipBoardSrc(this._targetMovieClip);
      var _loc51_ = new lib.controls.S_TxtBtn2();
      var _loc52_ = lib.manager.PopupManager.getPopup(12345);
      var _loc4_ = lib.manager.ToolTip.clear();
   }
   function rescaleUI(UIname, exception)
   {
      trace("g4.view.baseUI.BaseUI.rescaleUI > UIname : " + UIname + ", exception : " + exception);
      var _loc3_ = undefined;
      if(UIname == "" || UIname == undefined || UIname == null)
      {
         var _loc2_ = undefined;
         var _loc4_ = this.gUIList.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc3_ = this.gUIList[_loc2_];
            if(_loc3_._name.toLowerCase() != exception.toLowerCase())
            {
               this.updateUIScale(_loc3_);
            }
            _loc2_ = _loc2_ + 1;
         }
         this.resetUIALign(2);
      }
      else
      {
         _loc3_ = this.GetLoadedUI(UIname);
         this.updateUIScale(_loc3_);
      }
   }
   function updateUIScale(win)
   {
      if(win == null)
      {
         return undefined;
      }
      var _loc4_ = win._name.toLowerCase();
      var _loc10_ = this.GetRegisterUIData(_loc4_);
      if(_loc10_.SA == 1)
      {
         this.axis._xreg = 0;
         this.axis._yreg = 0;
      }
      else if(_loc10_.SA == 2)
      {
         this.axis._xreg = win.hit._width / 2;
         this.axis._yreg = 0;
      }
      else if(_loc10_.SA == 3)
      {
         this.axis._xreg = win.hit._width;
         this.axis._yreg = 0;
      }
      else if(_loc10_.SA == 4)
      {
         this.axis._xreg = 0;
         this.axis._yreg = win.hit._height / 2;
      }
      else if(_loc10_.SA == 5)
      {
         this.axis._xreg = win.hit._width / 2;
         this.axis._yreg = win.hit._height / 2;
      }
      else if(_loc10_.SA == 6)
      {
         this.axis._xreg = win.hit._width;
         this.axis._yreg = win.hit._height / 2;
      }
      else if(_loc10_.SA == 7)
      {
         this.axis._xreg = 0;
         this.axis._yreg = win.hit._height;
      }
      else if(_loc10_.SA == 8)
      {
         this.axis._xreg = win.hit._width / 2;
         this.axis._yreg = win.hit._height;
      }
      else if(_loc10_.SA == 9)
      {
         this.axis._xreg = win.hit._width;
         this.axis._yreg = win.hit._height;
      }
      var _loc12_ = _loc10_.GROUP;
      if(_loc12_ != 61)
      {
         if(_loc12_ < 50 && _loc4_ != "expbar" && _loc4_ != "awesomeframe" && _loc4_ != "playguide" && _loc4_ != "attendevent")
         {
            if(_loc4_ == "shortcut")
            {
            }
            var _loc9_ = lib.info.AlignInfo.uiScale(_loc4_,win);
            var _loc6_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc9_);
            this.axis.setXscale(win,_loc6_ * 100);
            this.axis.setYscale(win,_loc6_ * 100);
         }
         else if(_loc12_ != 58 && _loc4_ != "expbar" && _loc4_ != "awesomeframe" && _loc4_ != "playguide" && _loc4_ != "attendevent")
         {
            for(var _loc11_ in win)
            {
               var _loc2_ = win[_loc11_];
               var _loc8_ = _loc2_._parent._parent;
               var _loc7_ = _loc2_._parent._parent._parent;
               if(typeof _loc2_ == "movieclip" && _loc2_ != win && _loc2_ != this.container_chat_mc.Chat2 && win != _loc8_ && win != _loc7_)
               {
                  _loc9_ = lib.info.AlignInfo.uiScale(_loc4_,win);
                  var _loc5_ = lib.info.AlignInfo.scaleRatio;
                  if(_loc4_ == "crosshair")
                  {
                     _loc5_ = _loc5_ + 0.2;
                  }
                  _loc6_ = lib.info.AlignInfo.uiScaleLimit(_loc5_ * _loc9_);
                  _loc2_._xscale = _loc2_._yscale = _loc6_ * 100;
               }
            }
         }
      }
   }
   function resetUIPosition()
   {
      _root.OnGameEvent("OnGame_ResetUIPosition");
      var _loc6_ = this.gUIList.length;
      var _loc4_ = 0;
      while(_loc4_ < _loc6_)
      {
         var _loc5_ = this.gUIList[_loc4_];
         var _loc3_ = this.GetRegisterUIData(_loc5_._name);
         if(_loc3_.GROUP == 1)
         {
            _loc3_.locked = false;
         }
         _loc5_.container_mc.lock_mc.lock(false);
         _loc3_.moved = 0;
         if(_loc3_.GROUP != 1)
         {
            _root.OnGameEvent("OnGame_SetUIPosition",_loc3_.locked,_loc3_.Name,_loc3_.xRatio,_loc3_.yRatio);
         }
         else
         {
            this.HideUI(_loc3_.Name);
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc6_ = this.gRegisterUIDataList.length;
      _loc4_ = 0;
      while(_loc4_ < _loc6_)
      {
         _loc3_ = this.gRegisterUIDataList[_loc4_];
         if(_loc3_.GROUP == 1)
         {
            _loc3_.locked = false;
            _loc3_.moved = 0;
         }
         this.ToGame_SaveUIPosition(_loc3_.locked,_loc3_.Name,_loc3_.xRatio,_loc3_.yRatio);
         _loc4_ = _loc4_ + 1;
      }
      g4.model.GameModel.chatModel.ToGame_Chat_RequestInitPos();
      this.resetUIALign(2);
   }
   function RegisterUI(Name, Path, x, y, bAlwaysLoaded, Group, ifLogOutClose, soundData, addDataList)
   {
      trace("g4.view.baseUI.BaseUI.RegisterUI > Name : " + Name + ", Path : " + Path + ", x : " + x + ", y : " + y + ", bAlwaysLoaded : " + bAlwaysLoaded + ", Group : " + Group + ", ifLogOutClose : " + ifLogOutClose + ", soundData : " + soundData + ", addDataList : " + addDataList);
      Group = Number(Group);
      var _loc3_ = new Object();
      _loc3_.Name = Name;
      _loc3_.Path = Path;
      _loc3_.bAlwaysLoaded = Number(bAlwaysLoaded);
      _loc3_.GROUP = Group;
      _loc3_.ifLogOutClose = Number(ifLogOutClose);
      _loc3_.xRatio = x;
      _loc3_.yRatio = y;
      var _loc5_ = addDataList.split(",");
      var _loc4_ = 0;
      while(_loc4_ < _loc5_.length)
      {
         var _loc2_ = _loc5_[_loc4_].split(":");
         if(_loc2_[0] == "PA")
         {
            _loc3_.PA = Number(_loc2_[1]);
         }
         else if(_loc2_[0] == "SA")
         {
            _loc3_.SA = Number(_loc2_[1]);
         }
         else if(_loc2_[0] == "battleModeClose")
         {
            _loc3_.battleModeClose = Number(_loc2_[1]);
         }
         else if(_loc2_[0] == "scaleCustom")
         {
            _loc3_.ScaleCustom = Number(_loc2_[1]);
         }
         _loc4_ = _loc4_ + 1;
      }
      _loc3_.soundData = soundData;
      _loc3_.addDataList = addDataList;
      if(Group != 1)
      {
         _loc3_.locked = 1;
      }
      else
      {
         _loc3_.locked = null;
      }
      _loc3_.moved = 0;
      if(this.GetRegisterUIData(Name).Name == Name)
      {
         return undefined;
      }
      lib.manager.UISound.addOnSound(Name,soundData);
      this.gRegisterUIDataList.push(_loc3_);
      var _loc8_ = Name.toLowerCase();
      this.readyToPositions[_loc8_] = {name:_loc8_,lstate:undefined,cancelPosition:false};
      if(_loc3_.bAlwaysLoaded)
      {
         this.LoadUI(Name,Path,true,_loc3_.GROUP,_loc3_.ifLogOutClose);
      }
   }
   function lockRegisterUI(Name, locked)
   {
      var _loc2_ = this.GetRegisterUIData(Name);
      _loc2_.locked = locked;
   }
   function LoadUI(Name, Path, bAlwaysLoaded, group, ifLogOutClose, expandOption)
   {
      var _loc2_ = undefined;
      var _loc4_ = undefined;
      var _loc9_ = this.GetRegisterUIData(Name);
      var _loc3_ = Name.toLowerCase();
      switch(group)
      {
         case 1:
            _loc2_ = this.container_normal_mc;
            break;
         case 2:
            _loc2_ = this.container_battle_mc;
            break;
         case 3:
            _loc2_ = this.container_normal_mc;
            break;
         case 10:
            _loc2_ = this.container_battleUp_mc;
            break;
         case 11:
            _loc2_ = this.container_logout_mc;
            break;
         case 12:
            _loc2_ = this.container_overlayMap_mc;
            break;
         case 13:
            _loc2_ = this.container_halfPopup_mc;
            break;
         case 14:
            _loc2_ = this.container_mainmenuUpside_mc;
            break;
         case 40:
            _loc2_ = this.container_alwaysVisible_mc;
            break;
         case 49:
            _loc2_ = this.container_highDepth_mc;
            break;
         case 50:
            _loc2_ = this.container_balloon_mc;
            break;
         case 51:
            _loc2_ = this.container_sysPopup_mc;
            break;
         case 52:
            _loc2_ = this.container_interPopup_mc;
            break;
         case 53:
            _loc2_ = this.container_norPopup_mc;
            break;
         case 54:
            _loc2_ = this.container_question_mc;
            break;
         case 55:
            _loc2_ = this.container_tooltip_mc;
            break;
         case 56:
            _loc2_ = this.container_chat_mc;
            break;
         case 58:
            _loc2_ = this.container_inGameMovie_mc;
            break;
         case 59:
            _loc2_ = this.container_message_mc;
            break;
         case 60:
            _loc2_ = this.container_battle_mc;
            break;
         case 61:
            _loc2_ = this.container_lobby_mc;
            break;
         case 48:
            _loc2_ = this.container_mainmenu_mc;
            break;
         default:
            _loc2_ = this.container_battle_mc;
      }
      _loc2_.gDepth = _loc2_.getNextHighestDepth();
      _loc4_ = _loc2_.createEmptyMovieClip(Name,_loc2_.gDepth);
      var _loc6_ = new MovieClipLoader();
      this.waitingShowUI[_loc3_] = {lstate:true,expandOption:undefined};
      var _loc5_ = new Object();
      _loc5_.onLoadInit = g4.util.Delegate.create(this,this.OnLoadInit,_loc9_,_loc3_,group,bAlwaysLoaded,expandOption,_loc4_);
      _loc6_.addListener(_loc5_);
      _loc6_.loadClip(Path,_loc4_);
   }
   function OnLoadInit(UIdata, Name, group, bAlwaysLoaded, expandOption, makeUI, target)
   {
      trace("g4.view.baseUI.BaseUI.OnLoadInit > UIdata : " + UIdata + ", Name : " + Name + ", group : " + group + ", bAlwaysLoaded : " + bAlwaysLoaded + ", expandOption : " + expandOption + ", makeUI : " + makeUI + ", target : " + target);
      var _loc3_ = Name.toLowerCase();
      target.info = UIdata;
      if(this.waitingShowUI[_loc3_].lstate == false)
      {
         var _loc9_ = this.waitingShowUI[_loc3_].expandOption;
         this.waitingShowUI[_loc3_].lstate = undefined;
         _root.OnGameEvent("OnGameEventShowUI",Name,false,_loc9_);
         return undefined;
      }
      this.waitingShowUI[_loc3_].lstate = undefined;
      target.swapDepths(target._parent.getNextHighestDepth());
      if(target._parent == this.container_normal_mc || target._parent == this.container_battleUp_mc)
      {
         var _loc8_ = this.container_normal_mc.getDepth();
         var _loc7_ = this.container_battleUp_mc.getDepth();
         var _loc6_ = Math.max(_loc8_,_loc7_);
         target._parent.swapDepths(_loc6_);
      }
      target.group = group;
      this.gUIList.push(target);
      this.rescaleUI(Name);
      if(this.checkDisableUI(Name) != null)
      {
         this.setDisableUI(target,1);
      }
      var _loc10_ = this.GetRegisterUIData(target._name);
      if(_loc10_.locked == 0)
      {
         target.lock_mc.setEnabled(false);
      }
      else
      {
         target.lock_mc.setEnabled(true);
      }
      if(!bAlwaysLoaded)
      {
         this.readyToPositions[_loc3_].lstate = true;
         this.readyToPositions[_loc3_].expandOption = expandOption;
         this.readyToPositions[_loc3_].cancelPosition = false;
         this.ToGame_RequestSetUIPosition(_loc3_);
         if(_loc3_ == "selectserver")
         {
            _root.OnGameEvent("OnGameEventShowWindow",Name,true);
         }
         lib.manager.UISound.showUI(_loc3_,true);
         lib.manager.UISkin.instance(target);
      }
      if(_loc3_ == "progressbar" || _loc3_ == "gagebar")
      {
         makeUI.hitTestDisable = true;
      }
      if(_loc3_ != "crosshair" && _loc3_ != "partywindow" && _loc3_ != "attendevent")
      {
         var _loc11_ = lib.manager.CustomScaleManger.getInstance();
         _loc11_.addCustomScale(target,_loc3_);
      }
   }
   function UnLoadUI(Name)
   {
      this.removeListenerIndex = null;
      this.removeUIListIndex = null;
      this.removeTarget = null;
      var _loc6_ = false;
      var _loc5_ = 0;
      while(_loc5_ < this.gUIList.length)
      {
         var _loc4_ = this.gUIList[_loc5_];
         if(_loc4_._name.toLowerCase() == Name.toLowerCase())
         {
            var _loc3_ = 0;
            while(_loc3_ < _global.EventBroadCaster._listeners.length)
            {
               if(_loc4_.myListener == _global.EventBroadCaster._listeners[_loc3_])
               {
                  this.removeListenerIndex = _loc3_;
                  this.removeUIListIndex = _loc5_;
                  this.removeTarget = _loc4_;
                  _loc6_ = true;
                  break;
               }
               _loc3_ = _loc3_ + 1;
            }
            if(_loc6_)
            {
               break;
            }
         }
         _loc5_ = _loc5_ + 1;
      }
      var _loc8_ = lib.manager.CustomScaleManger.getInstance();
      _loc8_.removeCustomScale(_loc4_,Name);
      this.RemoveEventListener();
      g4.model.GameModel.removeAllEventListeners(Name);
   }
   function RemoveEventListener()
   {
      if(this.removeListenerIndex != null)
      {
         this.gUIList.splice(this.removeUIListIndex,1);
      }
      if(this.removeUIListIndex != null)
      {
         _global.EventBroadCaster.removeListener(_global.EventBroadCaster._listeners[this.removeListenerIndex]);
      }
      if(this.removeTarget != null)
      {
         if(this.removeTarget.$beforeRemoveMovieClip != null)
         {
            this.removeTarget.$beforeRemoveMovieClip();
         }
         this.removeTarget.removeMovieClip();
      }
      this.removeListenerIndex = null;
      this.removeUIListIndex = null;
      this.removeTarget = null;
   }
   function GetLoadedUI(Name)
   {
      var _loc4_ = this.gUIList.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this.gUIList[_loc2_];
         if(_loc3_._name.toUpperCase() == Name.toUpperCase())
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function GetRegisterUIData(Name)
   {
      var _loc4_ = this.gRegisterUIDataList.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this.gRegisterUIDataList[_loc2_];
         if(_loc3_.Name.toUpperCase() == Name.toUpperCase())
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function GetAlignUI(UIName)
   {
      var _loc4_ = this.alignGroup_array.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this.alignGroup_array[_loc2_];
         if(_loc3_._name.toLowerCase() == UIName.toLowerCase())
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function removeUIInAlignGroup(UIName)
   {
      var _loc3_ = null;
      var _loc2_ = 0;
      while(_loc2_ < this.alignGroup_array.length)
      {
         if(this.alignGroup_array[_loc2_]._name.toLowerCase() == UIName.toLowerCase())
         {
            _loc3_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc3_ != null)
      {
         this.alignGroup_array.splice(_loc3_,1);
      }
   }
   function ShowUI(Name, expandOption)
   {
      var _loc3_ = this.GetLoadedUI(Name);
      if(_loc3_._visible != true)
      {
         this.UIData = this.GetRegisterUIData(Name);
         if(_loc3_ == null || _loc3_ == undefined)
         {
            if(this.UIData == null || this.UIData == undefined)
            {
               return undefined;
            }
            if(this.waitingShowUI[name].lstate != undefined)
            {
               return undefined;
            }
            this.LoadUI(this.UIData.Name,this.UIData.Path,this.UIData.bAlwaysLoaded,this.UIData.GROUP,this.UIData.ifLogOutClose,expandOption);
         }
         else
         {
            var name = Name.toLowerCase();
            lib.manager.UISound.showUI(name,true);
            if(this.UIData.GROUP != 2 && this.UIData.GROUP < 54)
            {
               lib.manager.UISkin.instance(_loc3_);
            }
            _loc3_.container_mc.UIDrager.moved = false;
            _loc3_.swapDepths(_loc3_._parent.getNextHighestDepth());
            if(_loc3_._parent == this.container_normal_mc || _loc3_._parent == this.container_battleUp_mc)
            {
               var _loc7_ = this.container_normal_mc.getDepth();
               var _loc6_ = this.container_battleUp_mc.getDepth();
               var _loc5_ = Math.max(_loc7_,_loc6_);
               _loc3_._parent.swapDepths(_loc5_);
            }
            this.ToGame_RequestSetUIPosition(Name);
         }
         if(this.UIData.GROUP < 50)
         {
            this.openingAni2(_loc3_);
         }
         else
         {
            this.openingAni2(_loc3_);
         }
         _root.OnGameEvent("OnGameEventShowWindow",Name,true,expandOption);
         if(Name.toLowerCase() == "SenatorRegistration".toLowerCase())
         {
            this.BaseUIListener.OnGame_DisableUI("SenatorMap",true);
         }
      }
   }
   function HideUI(Name, doNotAlign, expandOption)
   {
      this.UIData = this.GetRegisterUIData(Name);
      var _loc5_ = this.GetLoadedUI(Name);
      var _loc6_ = _loc5_.container_mc.lock_mc.locked;
      if(this.UIData == null)
      {
         return undefined;
      }
      var _loc4_ = Name.toLowerCase();
      lib.manager.UISound.showUI(_loc4_,false);
      lib.controls.ScaleCustomEvent.delScaleCustom(Name);
      if(lib.manager.Focus.modalUI == _loc5_)
      {
         Selection.setFocus(null);
         lib.manager.Focus.stop();
      }
      if(_loc4_ == "SenatorRegistration".toLowerCase())
      {
         this.BaseUIListener.OnGame_DisableUI("SenatorMap",0);
      }
      _root.OnGameEvent("OnGameEventShowWindow",Name,false,expandOption);
      if(!this.UIData.bAlwaysLoaded)
      {
         this.UnLoadUI(Name);
      }
      this.removeUIInAlignGroup(Name);
      if(doNotAlign != 1)
      {
         this.resetUIALign(2);
      }
      this.ToGame_DestroyUI(Name);
   }
   function openingAni(target)
   {
      var _loc2_ = target._xscale - 2.2;
      var _loc3_ = target._xscale;
      target._alpha = 0;
      target._xscale = _loc2_;
      target._yscale = _loc2_;
      gs.TweenLite.killTweensOf(target,false);
      gs.TweenLite.to(target,0.3,{_xscale:_loc3_,_yscale:_loc3_,_alpha:100,ease:gs.easing.Cubic.easeOut});
   }
   function openingAni2(target)
   {
      target._alpha = 0;
      gs.TweenLite.killTweensOf(target,false);
      gs.TweenLite.to(target,0.3,{_alpha:100,ease:gs.easing.Cubic.easeOut});
   }
   function checkDisableUI(Name)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.disableUIName_array.length)
      {
         if(this.disableUIName_array[_loc2_].toLowerCase() == Name.toLowerCase())
         {
            return _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function setDisableUI(ui, bTrue)
   {
      if(bTrue)
      {
         var _loc3_ = new flash.geom.Transform(ui);
         _loc3_.colorTransform = lib.info.ColorTrans.popupDisableTrans();
         ui.onRelease = function()
         {
         };
      }
      else
      {
         _loc3_ = new flash.geom.Transform(ui);
         _loc3_.colorTransform = this.enableTrans;
         delete ui.onRelease;
      }
   }
   function lockUI(bTrue)
   {
      _root.OnGameEvent("OnGame_DisableUI","CONTAINER_NORMAL",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","CONTAINER_HALFPOPUP",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","MainMenu",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","WorldMap",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","CONTAINER_BATTLEUP",bTrue);
      _root.OnGameEvent("OnGame_DisableUIMode",bTrue);
   }
   function lockNormalPopup(bTrue)
   {
      _root.OnGameEvent("OnGame_DisableUI","CONTAINER_POPUP_NORMAL",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","DicePopup",bTrue);
   }
   function lockInteractionPopup(bTrue)
   {
      _root.OnGameEvent("OnGame_DisableUI","CONTAINER_POPUP_INTERACTION",bTrue);
   }
   function lockBattleUI(bTrue)
   {
      _root.OnGameEvent("OnGame_DisableUI","CONTAINER_BATTLE",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","CONTAINER_BATTLEUP",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","CONTAINER_LOBBY",bTrue);
   }
   function resetUIALign(sortMode)
   {
      if(sortMode != 0)
      {
         if(sortMode == 1)
         {
            var _loc2_ = new Array();
            var _loc14_ = null;
            var _loc12_ = this.alignGroup_array.length;
            var _loc3_ = 0;
            while(_loc3_ < _loc12_)
            {
               var _loc5_ = this.GetRegisterUIData(this.alignGroup_array[_loc3_]._name);
               var _loc4_ = this.GetLoadedUI(this.alignGroup_array[_loc3_]._name);
               if(_loc5_.GROUP == 1 && _loc5_.locked == 0)
               {
                  _loc4_.container_mc.lock_mc.setEnabled(false);
                  _loc2_.push(_loc4_);
               }
               _loc3_ = _loc3_ + 1;
            }
            var _loc9_ = 0;
            var _loc8_ = 0;
            _loc3_ = _loc2_.length;
            while(_loc3_ >= 0)
            {
               var _loc7_ = lib.info.AlignInfo.uiScale(_loc2_[_loc3_ - 1]._name,_loc2_[_loc3_ - 1]);
               var _loc6_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc7_);
               _loc9_ = _loc9_ + (_loc2_[_loc3_ - 1].hit._width * _loc6_ + this.eachUIGap);
               if(_loc9_ > Stage.width)
               {
                  _loc8_ = _loc3_;
                  break;
               }
               _loc3_ = _loc3_ - 1;
            }
            if(_loc8_ > 0)
            {
               var _loc11_ = new Array();
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  if(_loc3_ >= _loc8_)
                  {
                     _loc11_.push(_loc2_[_loc3_]);
                  }
                  else
                  {
                     this.HideUI(_loc2_[_loc3_]._name);
                  }
                  _loc3_ = _loc3_ + 1;
               }
               _loc2_ = _loc11_;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc7_ = lib.info.AlignInfo.uiScale(_loc2_[_loc3_ - 1]._name,_loc2_[_loc3_ - 1]);
               _loc6_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc7_);
               if(_loc3_ == 0)
               {
                  _loc2_[_loc3_]._x = lib.info.AlignInfo.xRatioToPixel(0) + this.eachUIGap;
               }
               else
               {
                  _loc2_[_loc3_]._x = _loc2_[_loc3_ - 1]._x + _loc2_[_loc3_ - 1].hit._width * _loc6_ + this.eachUIGap;
               }
               _loc2_[_loc3_]._y = lib.info.AlignInfo.ALIGN_YPOS;
               _loc3_ = _loc3_ + 1;
            }
            this.alignGroup_array = _loc2_;
         }
         else if(sortMode == 2)
         {
            _loc2_ = new Array();
            var _loc10_ = new Array();
            _loc14_ = null;
            _loc12_ = this.alignGroup_array.length;
            _loc3_ = 0;
            while(_loc3_ < _loc12_)
            {
               _loc5_ = this.GetRegisterUIData(this.alignGroup_array[_loc3_]._name);
               _loc4_ = this.GetLoadedUI(this.alignGroup_array[_loc3_]._name);
               if(_loc5_.GROUP == 1 && _loc5_.locked == 0 && _loc4_.container_mc.UIDrager.moved == false)
               {
                  _loc4_.container_mc.lock_mc.setEnabled(false);
                  _loc2_.push(_loc4_);
               }
               else if(_loc5_.GROUP == 1 && _loc5_.locked == 0 && _loc4_.container_mc.UIDrager.moved == true)
               {
                  _loc4_.container_mc.lock_mc.setEnabled(true);
                  _loc10_.push(_loc4_);
               }
               _loc3_ = _loc3_ + 1;
            }
            _loc9_ = 0;
            _loc8_ = 0;
            _loc3_ = _loc2_.length;
            while(_loc3_ >= 0)
            {
               _loc7_ = lib.info.AlignInfo.uiScale(_loc2_[_loc3_ - 1]._name,_loc2_[_loc3_ - 1]);
               _loc6_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc7_);
               _loc9_ = _loc9_ + (_loc2_[_loc3_ - 1].hit._width * _loc6_ + this.eachUIGap);
               if(_loc9_ > Stage.width)
               {
                  _loc8_ = _loc3_;
                  break;
               }
               _loc3_ = _loc3_ - 1;
            }
            if(_loc8_ > 0)
            {
               _loc11_ = new Array();
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  if(_loc3_ >= _loc8_)
                  {
                     _loc11_.push(_loc2_[_loc3_]);
                  }
                  else
                  {
                     this.HideUI(_loc2_[_loc3_]._name);
                  }
                  _loc3_ = _loc3_ + 1;
               }
               _loc2_ = _loc11_;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc7_ = lib.info.AlignInfo.uiScale(_loc2_[_loc3_ - 1]._name,_loc2_[_loc3_ - 1]);
               _loc6_ = lib.info.AlignInfo.uiScaleLimit(lib.info.AlignInfo.scaleRatio * _loc7_);
               if(_loc3_ == 0)
               {
                  _loc2_[_loc3_]._x = lib.info.AlignInfo.xRatioToPixel(0) + this.eachUIGap;
               }
               else
               {
                  _loc2_[_loc3_]._x = _loc2_[_loc3_ - 1]._x + _loc2_[_loc3_ - 1].hit._width * _loc6_ + this.eachUIGap;
               }
               _loc2_[_loc3_]._y = lib.info.AlignInfo.ALIGN_YPOS;
               _loc3_ = _loc3_ + 1;
            }
            this.alignGroup_array = _loc2_.concat(_loc10_);
         }
      }
   }
   function repositionLockedUI()
   {
      for(var _loc3_ in this.container_normal_mc)
      {
         if(typeof this.container_normal_mc[_loc3_] == "movieclip")
         {
            var _loc2_ = this.container_normal_mc[_loc3_];
            if(this.GetRegisterUIData(_loc2_._name).locked || this.GetRegisterUIData(_loc2_._name).GROUP != 1)
            {
               this.ToGame_RequestSetUIPosition(_loc2_._name);
            }
         }
      }
      for(var _loc3_ in this.container_battle_mc)
      {
         if(typeof this.container_battle_mc[_loc3_] == "movieclip")
         {
            _loc2_ = this.container_battle_mc[_loc3_];
            if(this.GetRegisterUIData(_loc2_._name).locked || this.GetRegisterUIData(_loc2_._name).GROUP != 1)
            {
               this.ToGame_RequestSetUIPosition(_loc2_._name);
            }
         }
      }
      for(var _loc3_ in this.container_battleUp_mc)
      {
         if(typeof this.container_battleUp_mc[_loc3_] == "movieclip")
         {
            _loc2_ = this.container_battleUp_mc[_loc3_];
            if(this.GetRegisterUIData(_loc2_._name).locked || this.GetRegisterUIData(_loc2_._name).GROUP != 1)
            {
               this.ToGame_RequestSetUIPosition(_loc2_._name);
            }
         }
      }
      for(var _loc3_ in this.container_overlayMap_mc)
      {
         if(typeof this.container_overlayMap_mc[_loc3_] == "movieclip")
         {
            _loc2_ = this.container_overlayMap_mc[_loc3_];
            if(this.GetRegisterUIData(_loc2_._name).locked || this.GetRegisterUIData(_loc2_._name).GROUP != 1)
            {
               this.ToGame_RequestSetUIPosition(_loc2_._name);
            }
         }
      }
      for(var _loc3_ in this.container_chat_mc)
      {
         if(typeof this.container_chat_mc[_loc3_] == "movieclip")
         {
            _loc2_ = this.container_chat_mc[_loc3_];
            if(this.GetRegisterUIData(_loc2_._name).locked || this.GetRegisterUIData(_loc2_._name).GROUP != 1)
            {
               this.ToGame_RequestSetUIPosition(_loc2_._name);
            }
         }
      }
      for(var _loc3_ in this.container_halfPopup_mc)
      {
         if(typeof this.container_halfPopup_mc[_loc3_] == "movieclip")
         {
            _loc2_ = this.container_halfPopup_mc[_loc3_];
            if(this.GetRegisterUIData(_loc2_._name).locked || this.GetRegisterUIData(_loc2_._name).GROUP != 1)
            {
               this.ToGame_RequestSetUIPosition(_loc2_._name);
            }
         }
      }
      for(var _loc3_ in this.container_mainmenu_mc)
      {
         if(typeof this.container_mainmenu_mc[_loc3_] == "movieclip")
         {
            _loc2_ = this.container_mainmenu_mc[_loc3_];
            if(this.GetRegisterUIData(_loc2_._name).locked || this.GetRegisterUIData(_loc2_._name).GROUP != 1)
            {
               this.ToGame_RequestSetUIPosition(_loc2_._name);
            }
         }
      }
      for(var _loc3_ in this.container_mainmenuUpside_mc)
      {
         if(typeof this.container_mainmenuUpside_mc[_loc3_] == "movieclip")
         {
            _loc2_ = this.container_mainmenuUpside_mc[_loc3_];
            if(this.GetRegisterUIData(_loc2_._name).locked || this.GetRegisterUIData(_loc2_._name).GROUP != 1)
            {
               this.ToGame_RequestSetUIPosition(_loc2_._name);
            }
         }
      }
   }
   function ToGame_DestroyUI(UIName)
   {
      getURL("FSCommand:ToGame_DestroyUI",UIName);
   }
   function ToGame_RequestSetUIPosition(UIName, locked, xRatio, yRatio)
   {
      if(locked == undefined || locked == "" || locked == null)
      {
         getURL("FSCommand:ToGame_RequestSetUIPosition",UIName);
      }
      if(locked != undefined || xRatio != undefined || yRatio != undefined)
      {
         this.layoutManager.setPosition(UIName,locked,xRatio,yRatio,1);
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
         var _loc3_ = this.GetLoadedUI(UIName);
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
   function ToGame_PlaySound(id)
   {
      getURL("FSCommand:ToGame_PlaySound",id);
   }
   function ToGame_CTRLMouseDown(type, info)
   {
      if(this.GetLoadedUI(type)._visible)
      {
         getURL("FSCommand:ToGame_CTRLMouseDown",type + "\t" + info);
      }
   }
   function ProductionProgressDisable(bTrue)
   {
      _root.OnGameEvent("OnGame_DisableUI","Production",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","Shortcut",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","StoreWindow",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","ParcelPost",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","Errand",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","Loan",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","Inventory",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","WarehouseWindow",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","PandoraBox",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","TradeWindow",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","HomunManager",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","HomunIncubator",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","QuestJournal",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","PaperDoll",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","SkillWindow",bTrue);
   }
   function groupDuelDisable(bTrue)
   {
      _root.OnGameEvent("OnGame_DisableUI","Production",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","Shortcut",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","StoreWindow",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","ParcelPost",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","Errand",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","Loan",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","Inventory",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","WarehouseWindow",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","PandoraBox",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","TradeWindow",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","HomunManager",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","HomunIncubator",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","QuestJournal",bTrue);
      _root.OnGameEvent("OnGame_DisableUI","PaperDoll",bTrue);
   }
   function IsGameScreen(dropTargetMc)
   {
      var _loc3_ = {x:_xmouse,y:_ymouse};
      this._targetMovieClip.localToGlobal(_loc3_);
      for(var _loc5_ in this.gUIList)
      {
         var _loc2_ = this.gUIList[_loc5_];
         if(_loc2_._visible && _loc2_.hitTest(_loc3_.x,_loc3_.y,true))
         {
            if(dropTargetMc._visible && dropTargetMc._parent._alpha != 0)
            {
               return false;
            }
         }
      }
      return true;
   }
   function checkStartDrag(started, target, Icon)
   {
      if(started && !_root.die)
      {
         this.dragingMc = target;
         this.dragingIcon = Icon;
         var fX = _root._xmouse;
         var fY = _root._ymouse;
         target.onEnterFrame = function()
         {
            if(Math.abs(fX - _root._xmouse) > 15 || Math.abs(fY - _root._ymouse) > 15)
            {
               _global.StartIconDrag(target,Icon.TEX);
               target.dragging = true;
               var _loc4_ = new flash.geom.Transform(Icon);
               _loc4_.colorTransform = this.disableTrans;
               delete target.onEnterFrame;
            }
         };
      }
      else
      {
         this.dragingMc.dragging = false;
         var _loc4_ = new flash.geom.Transform(this.dragingIcon);
         if(Icon != null)
         {
            if(Icon._parent.impossible)
            {
               _loc4_.colorTransform = lib.info.ColorTrans.slotImpossibleTrans();
            }
            else if(Icon._parent.disable)
            {
               _loc4_.colorTransform = lib.info.ColorTrans.slotDisableTrans();
            }
            else
            {
               _loc4_.colorTransform = this.enableTrans;
            }
         }
         else if(this.dragingIcon._parent.impossible)
         {
            _loc4_.colorTransform = lib.info.ColorTrans.slotImpossibleTrans();
         }
         else if(this.dragingIcon._parent.disable)
         {
            _loc4_.colorTransform = lib.info.ColorTrans.slotDisableTrans();
         }
         else
         {
            _loc4_.colorTransform = this.enableTrans;
         }
         var _loc5_ = Icon._parent.durability;
         if(_loc5_)
         {
            Icon._parent.durability = _loc5_;
         }
         delete this.dragingMc.onEnterFrame;
         this.dragingMc.FX_PRESS._visible = false;
         this.dragingMc = null;
         this.dragingIcon = null;
      }
   }
   function CreateDraggedIcon(slot)
   {
      this.dragSlot_mc._visible = true;
      this.dragSlot_mc.swapDepths(_root.getNextHighestDepth());
      this.dragSlot_mc.draw(slot.TEX,40,40);
      this.dragSlot_mc.grade = slot.grade;
      this.dragSlot_mc.sealType.gotoAndStop(slot.sealType + 1);
      return this.dragSlot_mc;
   }
   function dragManager_dragEndHandler(e)
   {
      this.checkStartDrag(false);
      this.EndIconDrag();
   }
   function EndIconDrag(target)
   {
      Mouse.show();
      this.gbDraggedIcon._visible = false;
      if(_root.gbDraggingTile == false)
      {
         return false;
      }
      var dt = null;
      if(target == undefined)
      {
         dt = this.gbDraggedIcon._droptarget;
         var dtmc = eval(dt);
         var UIName = dt.split("/")[3];
         if(dt != undefined)
         {
            var dropSlotValue = g4.util.UIUtil.getDropSlotValue(dtmc);
            if(dropSlotValue != undefined)
            {
               _root.debug2.text = dropSlotValue;
               this.ToGameEndDrag(dropSlotValue + "\t" + UIName);
               _root.debug.text = dropSlotValue;
            }
            else if(this.IsGameScreen(dtmc))
            {
               this.ToGameEndDrag("GameScreen\t" + UIName);
            }
            else if(UIName.toLowerCase() != "overlaymap2" && UIName.toLowerCase() != "questtaskinfo")
            {
               this.ToGameEndDrag("InvalidUI\t" + UIName);
            }
            else
            {
               this.ToGameEndDrag("GameScreen\t" + UIName);
            }
         }
         else
         {
            this.ToGameEndDrag("GameScreen\t" + undefined);
         }
      }
      else
      {
         this.ToGameEndDrag(target);
      }
      stopDrag();
      _root.gbDraggingTile = false;
      return true;
   }
   function ToGameStartDrag(slotName)
   {
      getURL("FSCommand:ToGameStartDrag",slotName);
   }
   function ToGameEndDrag(slotName)
   {
      getURL("FSCommand:toGameEndDrag",slotName);
   }
   function AddKeyListener()
   {
      if(!this.bKeyListening)
      {
         Key.addListener(this.KeyListener);
      }
      this.bKeyListening = true;
   }
   function RemoveKeyListener()
   {
      if(this.bKeyListening)
      {
         Key.removeListener(this.KeyListener);
      }
      this.bKeyListening = false;
   }
}
