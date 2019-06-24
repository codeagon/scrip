class lib.src.QuestTaskMc extends MovieClip
{
   var partyTask_mc_depth = 10;
   var name_txt_defaultW_1 = 195;
   var name_txt_defaultW_2 = 255;
   var minimizeHeight = 35;
   var task_txt_defaultW = 255;
   var savedFullName = "";
   var maxSlotCnt = 0;
   var curSlotCnt = 0;
   var maxSlotCol = 5;
   var defaultBlinkTime = 10000;
   var bBlinking = false;
   var hideStandByTime = 3000;
   var updateEffectDuration = 5000;
   var bMinimizeMode = 0;
   var bUIMode = 0;
   var bEnableInteraction = true;
   var questType = 0;
   var progressType = 0;
   var bQuestComplete = 0;
   var bQuestFailed = 0;
   var trackingNumber = 0;
   var bBackUpItem = false;
   static var SOUND_CLICK = lib.manager.UISound.MAIN_BTN;
   static var COLOR_CANT_PROGRESS = lib.info.TextColor.GENERAL_IMPOSSIBLE;
   static var COLOR_QUEST_COMPLETE = lib.info.TextColor.UI_QUESTINFO_COMPLETE;
   static var COLOR_LOW_EXP = lib.info.TextColor.UI_QUESTINFO_NAME_LOWEXP;
   static var COLOR_TASK_COMPLETE = lib.info.TextColor.UI_QUESTINFO_FULL;
   static var COLOR_TASK_NOCOMPLETE = lib.info.TextColor.UI_QUESTINFO_SHORT;
   static var COLOR_QUESTTYPE_MISSION = lib.info.TextColor.UI_QUESTINFO_NAME_MISSION;
   static var COLOR_QUESTTYPE_GUILD = lib.info.TextColor.UI_QUESTINFO_NAME_GUILD;
   static var COLOR_QUESTTYPE_NORMAL = lib.info.TextColor.UI_QUESTINFO_NAME;
   static var COLOR_QUESTTYPE_DAILYQUEST = lib.info.TextColor.UI_QUESTINFO_NAME_DAILYQUEST;
   static var COLOR_QUESTTYPE_UNIONQUEST = lib.info.TextColor.UI_QUESTINFO_NAME_UNIONQUEST;
   static var COLOR_COMPLETE = lib.info.TextColor.FILL_FULL;
   static var COLOR_FAIL = lib.info.TextColor.GENERAL_IMPOSSIBLE;
   static var STR_OPEN_QUESTJOURNAL = lib.util.UIString.getUIString("$093001");
   static var STR_CLOSE = lib.util.UIString.getUIString("$102001");
   static var STR_REDUCE = lib.util.UIString.getUIString("$102004");
   static var STR_EXPAND = lib.util.UIString.getUIString("$102005");
   static var STR_INFINITY = lib.util.UIString.getUIString("$091021");
   static var STR_LOCK = lib.util.UIString.getUIString("$091021");
   static var STR_SHOW_PARTYTASK = lib.util.UIString.getUIString("$093005");
   static var STR_QUESTTYPE_NORMAL_1 = lib.util.UIString.getUIString("$022030");
   static var STR_QUESTTYPE_NORMAL_2 = lib.util.UIString.getUIString("$022029");
   static var STR_QUESTTYPE_MISSION_1 = lib.util.UIString.getUIString("$022025");
   static var STR_QUESTTYPE_MISSION_2 = lib.util.UIString.getUIString("$022024");
   static var STR_QUESTTYPE_GUILD_1 = lib.util.UIString.getUIString("$022055");
   static var STR_QUESTTYPE_GUILD_2 = lib.util.UIString.getUIString("$022054");
   static var STR_QUESTTYPE_DAILYQUEST_1 = lib.util.UIString.getUIString("$093009");
   static var STR_QUESTTYPE_DAILYQUEST_2 = lib.util.UIString.getUIString("$093010");
   static var STR_QUESTTYPE_UNIONQUEST_1 = lib.util.UIString.getUIString("$093009");
   static var STR_QUESTTYPE_UNIONQUEST_2 = lib.util.UIString.getUIString("$093010");
   function QuestTaskMc()
   {
      super();
      this.num_txt.hitTestDisable = true;
      this.focus_mc.hitTestDisable = true;
      this.updateEffect_mc.hitTestDisable = true;
      this.init();
      this.createButtonEvent();
   }
   function init()
   {
      this.clear();
      this.name_txt.text = "";
      this.timer_txt.text = "";
      this.updateEffect_mc._visible = false;
      this.blet_mc._visible = false;
      this.focus_mc._visible = false;
      this.updateEffect_mc._visible = false;
      this.updateEffect_mc._width = this.bg_mc._width;
      this.name_txt_defaultX = this.name_txt._x;
      this.name_txt_defaultY = this.name_txt._y;
      this.taskContainer_mc._y = this.name_txt._y + this.name_txt._height + 1;
      this.task_array = [];
      lib.manager.ToolTip.add(this.close_mc,lib.src.QuestTaskMc.STR_CLOSE,1);
      lib.manager.ToolTip.add(this.minimizeToggle_mc,lib.src.QuestTaskMc.STR_REDUCE,1);
      lib.manager.ToolTip.add(this.partyTaskToggle_mc,lib.src.QuestTaskMc.STR_SHOW_PARTYTASK,1);
      lib.manager.ToolTip.add(this.link_mc,lib.src.QuestTaskMc.STR_OPEN_QUESTJOURNAL,1);
   }
   function createButtonEvent()
   {
      var _this = this;
      this.minimizeToggle_mc.onRollOver = function()
      {
         this.mc.gotoAndStop(2);
      };
      this.minimizeToggle_mc.onRollOut = function()
      {
         this.mc.gotoAndStop(1);
      };
      this.minimizeToggle_mc.onPress = function()
      {
         this.mc.gotoAndStop(3);
      };
      this.minimizeToggle_mc.onReleaseOutside = function()
      {
         this.mc.gotoAndStop(1);
      };
      this.minimizeToggle_mc.onRelease = function()
      {
         lib.manager.UISound.play(lib.src.QuestTaskMc.SOUND_CLICK);
         this.mc.gotoAndStop(2);
         this.onRollOver();
         _this.onReleaseMinimizeToggleBtn();
         _this.createButtonEvent();
      };
      this.partyTaskToggle_mc.onRollOver = function()
      {
         this.mc.gotoAndStop(2);
      };
      this.partyTaskToggle_mc.onRollOut = function()
      {
         this.mc.gotoAndStop(1);
      };
      this.partyTaskToggle_mc.onPress = function()
      {
         this.mc.gotoAndStop(3);
      };
      this.partyTaskToggle_mc.onReleaseOutside = function()
      {
         this.mc.gotoAndStop(1);
      };
      this.partyTaskToggle_mc.onRelease = function()
      {
         lib.manager.UISound.play(lib.src.QuestTaskMc.SOUND_CLICK);
         _this.onReleasePartyTaskToggleBtn();
         _this.createButtonEvent();
         this.mc.gotoAndStop(2);
         this.onRollOver();
      };
      this.close_mc.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      this.close_mc.onRollOut = function()
      {
         this.gotoAndStop(1);
      };
      this.close_mc.onPress = function()
      {
         this.gotoAndStop(3);
      };
      this.close_mc.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      this.close_mc.onRelease = function()
      {
         lib.manager.UISound.play(lib.src.QuestTaskMc.SOUND_CLICK);
         this.mc.gotoAndStop(2);
         this.onRollOver();
         _this.onReleaseCloseBtn();
      };
   }
   function onReleaseMinimizeToggleBtn()
   {
   }
   function onReleasePartyTaskToggleBtn()
   {
   }
   function onReleaseCloseBtn()
   {
   }
   function setEnableInteraction(bTrue)
   {
      this.bEnableInteraction = bTrue;
      this.partyTaskToggle_mc._visible = bTrue;
      this.minimizeToggle_mc._visible = bTrue;
      this.close_mc._visible = bTrue;
      this.bg_mc.enabled = bTrue;
   }
   function setMaxSlotCol(maxCol)
   {
      this.maxSlotCol = maxCol;
   }
   function setItemList(itemList, bBackUp)
   {
      var _loc13_ = lib.util.ExtString.split(itemList,"\n");
      var _loc10_ = _loc13_.length;
      this.maxSlotCnt = Math.max(this.curSlotCnt,_loc10_);
      this.curSlotCnt = _loc10_;
      var _loc14_ = new Array();
      var _loc11_ = 7;
      var _loc12_ = 35;
      var _loc16_ = 0;
      var _loc15_ = 0;
      var _loc5_ = 0;
      while(_loc5_ < _loc10_)
      {
         var _loc2_ = lib.util.ExtString.split(_loc13_[_loc5_],"\t");
         var _loc6_ = _loc2_[0];
         var _loc8_ = _loc2_[1];
         var _loc9_ = _loc2_[2];
         var _loc4_ = _loc12_ * (_loc5_ % _loc11_);
         var _loc3_ = _loc12_ * int(_loc5_ / _loc11_);
         _loc16_ = _loc4_;
         _loc15_ = _loc3_;
         var _loc7_ = this.itemContainer_mc["itemSlot__" + _loc5_];
         if(_loc7_ == undefined)
         {
            _loc7_ = this.itemContainer_mc.attachMovie("slotHit","itemSlot__" + _loc5_,this.itemContainer_mc.getNextHighestDepth());
            _loc7_._x = _loc4_;
            _loc7_._y = _loc3_;
            _loc7_._alpha = 0;
            _loc14_.push(_loc7_);
         }
         else
         {
            lib.manager.ToolTip.remove(_loc7_);
         }
         _loc7_._visible = true;
         _loc7_.id = _loc6_;
         lib.display.DrawBitmapData.draw(this.itemContainer_mc,_loc8_,_loc4_,_loc3_,0,0,30,30,0.46);
         lib.manager.ToolTip.add(_loc7_,_loc9_,1);
         _loc5_ = _loc5_ + 1;
      }
      this.bBackUpItem = Boolean(bBackUp);
      this.backUpItem_mc._visible = this.bBackUpItem;
      _loc5_ = _loc10_;
      while(_loc5_ < this.maxSlotCnt)
      {
         _loc7_ = this.itemContainer_mc["itemSlot__" + _loc5_];
         _loc7_._visible = false;
         _loc5_ = _loc5_ + 1;
      }
      this.resizeFrame();
      return _loc14_;
   }
   function setQuestInfo(str)
   {
      this.info_txt.text = str;
      this.info_txt._visible = str != "" && this.getMinimizeMode() == false;
   }
   function setEnablePartyTaskToggleBtn(bTrue)
   {
      if(bTrue)
      {
         this.partyTaskToggle_mc._visible = true;
         this.partyTaskToggle_mc.enabled = true;
      }
      else
      {
         this.partyTaskToggle_mc._visible = false;
         this.partyTaskToggle_mc.enabled = false;
      }
   }
   function getEnablePartyTaskToggleBtn()
   {
      return this.partyTaskToggle_mc.enabled;
   }
   function setTogglePartyTaskToggleBtn(bTrue)
   {
      if(bTrue)
      {
         this.partyTaskToggle_mc.gotoAndStop(2);
      }
      else
      {
         this.partyTaskToggle_mc.gotoAndStop(1);
      }
   }
   function getTogglePartyTaskToggleBtn(bTrue)
   {
      return this.partyTaskToggle_mc._currentframe != 2?false:true;
   }
   function setLabel(str)
   {
      this.savedFullName = str;
      var _loc2_ = 0;
      if(!this.partyTaskToggle_mc._visible)
      {
         _loc2_ = 20;
      }
      if(this.bUIMode)
      {
         if(this.icon2_txt.text != "")
         {
            this.name_txt._width = this.name_txt_defaultW_1 - 25 + _loc2_;
         }
         else
         {
            this.name_txt._width = this.name_txt_defaultW_1 + _loc2_;
         }
      }
      else if(this.icon2_txt.text != "")
      {
         this.name_txt._width = this.name_txt_defaultW_2 - 25;
      }
      else
      {
         this.name_txt._width = this.name_txt_defaultW_2;
      }
      this.name_txt.htmlText = str;
      if(this.name_txt.textWidth + 5 > this.name_txt._width)
      {
         this.name_txt.setText(str);
      }
      if(this.bQuestComplete)
      {
         this.name_txt.textColor = lib.src.QuestTaskMc.COLOR_COMPLETE;
      }
      else if(this.bQuestFailed)
      {
         this.setQuestNotComplete();
      }
      else
      {
         this.setQuestType(this.questType);
      }
      this.partyTask_mc.setLabel(str);
   }
   function getLabel()
   {
      return this.savedFullName;
   }
   function setLabelColor(color)
   {
      this.name_txt.textColor = color;
   }
   function setFailed()
   {
      this.bQuestFailed = 1;
      this.setLabelColor(lib.src.QuestTaskMc.COLOR_FAIL);
   }
   function showRecommendPartyNumIcon(partyMemberNum)
   {
      if(partyMemberNum > 5)
      {
         partyMemberNum = 5;
      }
      var _loc3_ = "icon_partyNum_" + partyMemberNum;
      this.icon2_txt.htmlText = "<img src=\'" + _loc3_ + "\' width=\'25\' height=\'26\' vspace=\'0\'>";
      this.name_txt._x = this.name_txt_defaultX + 25;
   }
   function setMinimizeMode(bTrue)
   {
      bTrue = Number(bTrue);
      if(bTrue)
      {
         this.bMinimizeMode = 1;
         this.minimizeToggle_mc.gotoAndStop(2);
         lib.manager.ToolTip.add(this.minimizeToggle_mc,lib.src.QuestTaskMc.STR_EXPAND,1);
         this.info_txt._visible = false;
         this.timer_txt._visible = false;
         this.taskContainer_mc._visible = false;
         this.itemContainer_mc._visible = false;
         this.backUpItem_mc._visible = false;
      }
      else
      {
         this.bMinimizeMode = 0;
         this.minimizeToggle_mc.gotoAndStop(1);
         lib.manager.ToolTip.add(this.minimizeToggle_mc,lib.src.QuestTaskMc.STR_REDUCE,1);
         if(this.info_txt.text != "")
         {
            this.info_txt._visible = true;
         }
         if(this.timer_txt.text != "")
         {
            this.timer_txt._visible = true;
         }
         this.taskContainer_mc._visible = true;
         this.itemContainer_mc._visible = true;
         this.backUpItem_mc._visible = this.bBackUpItem;
      }
      this.resizeFrame();
   }
   function getMinimizeMode()
   {
      return this.bMinimizeMode;
   }
   function resizeFrame()
   {
      var _loc5_ = !this.info_txt._visible?39:60;
      this.taskContainer_mc._y = _loc5_;
      if(this.taskContainer_mc._visible)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.task_array.length)
         {
            var _loc4_ = this.task_array[_loc2_ - 1];
            var _loc3_ = this.task_array[_loc2_];
            _loc3_._height = _loc3_.textHeight + 10;
            _loc3_._y = _loc4_ != undefined?_loc4_._y + _loc4_._height - 3:0;
            _loc2_ = _loc2_ + 1;
         }
         _loc5_ = this.taskContainer_mc._y + this.taskContainer_mc._height + 5;
      }
      if(this.curSlotCnt > 0)
      {
         this.itemContainer_mc._y = _loc5_;
         var _loc9_ = this.curSlotCnt - 1;
         var _loc6_ = this.itemContainer_mc["itemSlot__" + _loc9_];
         var _loc7_ = this.maxSlotCol <= this.curSlotCnt % 7;
         var _loc8_ = this.backUpItem_mc._visible;
         this.backUpItem_mc._x = !_loc7_?this.itemContainer_mc._x + _loc6_._x + _loc6_._width + 5:this.itemContainer_mc._x;
         this.backUpItem_mc._y = !_loc7_?this.itemContainer_mc._y + _loc6_._y + 1:this.itemContainer_mc._y + this.itemContainer_mc._height + 5;
         _loc5_ = !(_loc7_ && _loc8_)?this.itemContainer_mc._y + _loc6_._y + _loc6_._height + 5:this.backUpItem_mc._y + this.backUpItem_mc._height + 5;
      }
      if(this.timer_txt.text != "")
      {
         this.timer_txt._y = _loc5_;
         _loc5_ = this.timer_txt._y + this.timer_txt._height + 5;
      }
      this.expandHeight = _loc5_;
      if(this.getMinimizeMode())
      {
         this.bg_mc._height = this.minimizeHeight;
         this.updateEffect_mc._height = this.minimizeHeight;
         this.hit_mc._height = this.minimizeHeight;
         this.focus_mc._height = this.minimizeHeight + 8;
         this.updateEffect_mc._height = this.minimizeHeight + 4;
      }
      else
      {
         this.bg_mc._height = this.expandHeight;
         this.updateEffect_mc._height = this.expandHeight;
         this.hit_mc._height = this.expandHeight;
         this.focus_mc._height = this.expandHeight + 8;
         this.updateEffect_mc._height = this.expandHeight + 4;
      }
   }
   function setQuestType(type)
   {
      this.questType = Number(type);
      if(this.questType == 0)
      {
         this.setLabelColor(lib.src.QuestTaskMc.COLOR_QUESTTYPE_NORMAL);
      }
      else if(this.questType == 1)
      {
         this.setLabelColor(lib.src.QuestTaskMc.COLOR_QUESTTYPE_MISSION);
      }
      else if(this.questType == 2)
      {
         this.setLabelColor(lib.src.QuestTaskMc.COLOR_QUESTTYPE_GUILD);
      }
      else if(this.questType == 3)
      {
         this.setLabelColor(lib.src.QuestTaskMc.COLOR_QUESTTYPE_DAILYQUEST);
      }
      else if(this.questType == 4)
      {
         this.setLabelColor(lib.src.QuestTaskMc.COLOR_QUESTTYPE_UNIONQUEST);
      }
      this.setQuestProgress(this.progressType);
      if(this.trackingNumber > 0)
      {
         this.setQuestTrackingNumber(this.trackingNumber);
      }
   }
   function getQuestType()
   {
      return this.questType;
   }
   function setQuestStep(num)
   {
      this.questStep = num;
   }
   function getQuestStep()
   {
      return this.questStep;
   }
   function setQuestComplete()
   {
      this.bQuestComplete = 1;
      this.setLabelColor(lib.src.QuestTaskMc.COLOR_COMPLETE);
      var _loc3_ = 0;
      while(_loc3_ < this.task_array.length)
      {
         var _loc2_ = this.task_array[_loc3_];
         _loc2_.preColor = _loc2_.textColor;
         _loc2_.textColor = lib.src.QuestTaskMc.COLOR_COMPLETE;
         _loc3_ = _loc3_ + 1;
      }
   }
   function setQuestNotComplete()
   {
      this.bQuestComplete = 0;
      if(this.questType == 0)
      {
         this.setLabelColor(lib.src.QuestTaskMc.COLOR_QUESTTYPE_NORMAL);
      }
      else if(this.questType == 1)
      {
         this.setLabelColor(lib.src.QuestTaskMc.COLOR_QUESTTYPE_MISSION);
      }
      else if(this.questType == 2)
      {
         this.setLabelColor(lib.src.QuestTaskMc.COLOR_QUESTTYPE_GUILD);
      }
      else if(this.questType == 3)
      {
         this.setLabelColor(lib.src.QuestTaskMc.COLOR_QUESTTYPE_DAILYQUEST);
      }
      else if(this.questType == 4)
      {
         this.setLabelColor(lib.src.QuestTaskMc.COLOR_QUESTTYPE_UNIONQUEST);
      }
      var _loc3_ = 0;
      while(_loc3_ < this.task_array.length)
      {
         var _loc2_ = this.task_array[_loc3_];
         if(_loc2_.preColor != undefined)
         {
            _loc2_.textColor = _loc2_.preColor;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setQuestProgress(_progressType)
   {
      var _loc2_ = "";
      this.progressType = Number(_progressType);
      if(this.progressType == 1)
      {
         if(this.questType == 0)
         {
            _loc2_ = lib.src.QuestTaskMc.STR_QUESTTYPE_NORMAL_1;
         }
         else if(this.questType == 1)
         {
            _loc2_ = lib.src.QuestTaskMc.STR_QUESTTYPE_MISSION_1;
         }
         else if(this.questType == 2)
         {
            _loc2_ = lib.src.QuestTaskMc.STR_QUESTTYPE_GUILD_1;
         }
         else if(this.questType == 3)
         {
            _loc2_ = lib.src.QuestTaskMc.STR_QUESTTYPE_DAILYQUEST_1;
         }
         else if(this.questType == 4)
         {
            _loc2_ = lib.src.QuestTaskMc.STR_QUESTTYPE_UNIONQUEST_1;
         }
         if(this.questType == 0)
         {
            this.icon1_txt.htmlText = "<img src=\'qicon_0\' width=\'32\' height=\'32\' vspace=\'0\'>";
         }
         else if(this.questType == 1)
         {
            this.icon1_txt.htmlText = "<img src=\'qicon_2\' width=\'32\' height=\'32\' vspace=\'0\'>";
         }
         else if(this.questType == 2)
         {
            this.icon1_txt.htmlText = "<img src=\'qicon_4\' width=\'32\' height=\'32\' vspace=\'0\'>";
         }
         else if(this.questType == 3)
         {
            this.icon1_txt.htmlText = "<img src=\'qicon_6\' width=\'32\' height=\'32\' vspace=\'0\'>";
         }
         else if(this.questType == 4)
         {
            this.icon1_txt.htmlText = "<img src=\'qicon_8\' width=\'32\' height=\'32\' vspace=\'0\'>";
         }
      }
      else if(this.progressType == 2)
      {
         if(this.questType == 0)
         {
            _loc2_ = lib.src.QuestTaskMc.STR_QUESTTYPE_NORMAL_2;
         }
         else if(this.questType == 1)
         {
            _loc2_ = lib.src.QuestTaskMc.STR_QUESTTYPE_MISSION_2;
         }
         else if(this.questType == 2)
         {
            _loc2_ = lib.src.QuestTaskMc.STR_QUESTTYPE_GUILD_2;
         }
         else if(this.questType == 3)
         {
            _loc2_ = lib.src.QuestTaskMc.STR_QUESTTYPE_DAILYQUEST_2;
         }
         else if(this.questType == 4)
         {
            _loc2_ = lib.src.QuestTaskMc.STR_QUESTTYPE_UNIONQUEST_2;
         }
         if(this.questType == 0)
         {
            this.icon1_txt.htmlText = "<img src=\'qicon_1\' width=\'32\' height=\'32\' vspace=\'0\'>";
         }
         else if(this.questType == 1)
         {
            this.icon1_txt.htmlText = "<img src=\'qicon_3\' width=\'32\' height=\'32\' vspace=\'0\'>";
         }
         else if(this.questType == 2)
         {
            this.icon1_txt.htmlText = "<img src=\'qicon_5\' width=\'32\' height=\'32\' vspace=\'0\'>";
         }
         else if(this.questType == 3)
         {
            this.icon1_txt.htmlText = "<img src=\'qicon_7\' width=\'32\' height=\'32\' vspace=\'0\'>";
         }
         else if(this.questType == 4)
         {
            this.icon1_txt.htmlText = "<img src=\'qicon_9\' width=\'32\' height=\'32\' vspace=\'0\'>";
         }
      }
      if(this.progressType == 1 || this.progressType == 2)
      {
         this.num_txt.text = "";
         this.markerHit._visible = true;
         this.markerHit.bMarker = 1;
      }
      else
      {
         this.icon1_txt.htmlText = "";
         this.markerHit._visible = false;
         delete this.markerHit.bMarker;
      }
   }
   function getQuestProgress()
   {
      return this.progressType;
   }
   function setTimerStr(timeLimitStr)
   {
      if(timeLimitStr == "000000" || timeLimitStr == "0" || timeLimitStr == undefined)
      {
         this.timer_txt.text = "";
      }
      else
      {
         var _loc5_ = timeLimitStr.substr(0,2);
         var _loc3_ = timeLimitStr.substr(2,2);
         var _loc4_ = timeLimitStr.substr(4,6);
         this.timer_txt.text = _loc5_ + ":" + _loc3_ + ":" + _loc4_;
      }
   }
   function setQuestTrackingNumber(trackingNum)
   {
      this.trackingNumber = trackingNum;
      this.num_txt.text = String(trackingNum);
      this.icon1_txt.htmlText = "<img src=\'tracking_bg\' width=\'32\' height=\'32\'>";
      this.markerHit._visible = true;
      this.markerHit.bMarker = 0;
   }
   function playBlink(blinkTime)
   {
      var _this = this;
      this.bBlinking = true;
      if(blinkTime == undefined)
      {
         blinkTime = this.defaultBlinkTime;
      }
      if(this.blinkCoolTime != undefined && this.blinkCoolTime != null)
      {
         this.blinkCoolTime.update(blinkTime,blinkTime);
      }
      else
      {
         this.blinkCoolTime = new lib.util.CoolTime(blinkTime,blinkTime);
         this.blinkCoolTime.onFinished = function()
         {
            _this.stopBlink();
            _this.onBlinkFinished();
         };
      }
      lib.util.Warning.add(this);
   }
   function stopBlink(rightNow)
   {
      this.bBlinking = false;
      lib.util.Warning.remove(this,rightNow);
      this._alpha = 100;
      this.blinkCoolTime.remove();
      delete this.blinkCoolTime;
   }
   function getBlinking()
   {
      return this.bBlinking;
   }
   function onBlinkFinished()
   {
   }
   function showFocusEffect()
   {
      this.focus_mc._visible = true;
      this.focus_mc.gotoAndPlay(2);
   }
   function hideFocusEffect()
   {
      this.focus_mc._visible = false;
      this.focus_mc.gotoAndStop(1);
   }
   function showUpdateEffect()
   {
      var _this = this;
      if(this.updateEffectCoolTime != undefined && this.updateEffectCoolTime != null)
      {
         this.updateEffectCoolTime.update(this.updateEffectDuration,this.updateEffectDuration);
      }
      else
      {
         this.updateEffectCoolTime = new lib.util.CoolTime(this.updateEffectDuration,this.updateEffectDuration);
         this.updateEffectCoolTime.onFinished = function()
         {
            _this.hideUpdateEffect()();
         };
      }
      this.updateEffect_mc._visible = true;
      lib.util.Warning.add(this.updateEffect_mc);
   }
   function hideUpdateEffect(rightNow)
   {
      this.updateEffect_mc._visible = false;
      lib.util.Warning.remove(this.updateEffect_mc,rightNow);
      this.updateEffectCoolTime.remove();
      delete this.updateEffectCoolTime;
   }
   function copyQuestTask(targetMc)
   {
      targetMc.num_txt.text = this.num_txt.text;
      targetMc.icon1_txt.htmlText = this.icon1_txt.htmlText;
      targetMc.icon2_txt.htmlText = this.icon2_txt.htmlText;
      targetMc.icon1_txt._x = this.icon1_txt._x;
      targetMc.icon2_txt._x = this.icon2_txt._x;
      targetMc.name_txt.htmlText = this.name_txt.htmlText;
      targetMc.name_txt.textColor = this.name_txt.textColor;
      targetMc.timer_txt.text = this.timer_txt.text;
      targetMc.bg_mc._height = this.bg_mc._height;
      targetMc.hit_mc._height = this.hit_mc._height;
      var _loc5_ = 0;
      while(_loc5_ < this.task_array.length)
      {
         var _loc3_ = this.task_array[_loc5_];
         var _loc2_ = targetMc.taskContainer_mc["taskTF_" + _loc5_];
         if(_loc2_ == undefined)
         {
            _loc2_ = targetMc.taskContainer_mc.createTextField("taskTF_" + _loc5_,targetMc.taskContainer_mc.getNextHighestDepth(),0,0,0,0);
            lib.util.TextFieldFormatter.setStyle(_loc2_,"default");
            lib.util.TextFieldFormatter.setStyle(_loc2_,"chat");
            targetMc.textFdCount = _loc5_ + 1;
         }
         _loc2_.htmlText = _loc3_.htmlText;
         _loc2_.textColor = _loc3_.textColor;
         _loc2_._x = _loc3_._x;
         _loc2_._y = _loc3_._y;
         _loc2_._width = _loc3_._width;
         _loc2_._height = _loc3_._height;
         _loc2_._visible = true;
         _loc5_ = _loc5_ + 1;
      }
      _loc5_ = this.task_array.length;
      while(_loc5_ < targetMc.textFdCount)
      {
         var _loc6_ = targetMc.taskContainer_mc["taskTF_" + _loc5_];
         _loc6_._visible = false;
         _loc5_ = _loc5_ + 1;
      }
   }
   function setUIMode(bTrue)
   {
      this.bUIMode = Number(bTrue);
      this.partyTask_mc.setUIMode(bTrue);
      this.previousTask_mc.setUIMode(bTrue);
      if(this.bUIMode)
      {
         if(this.bEnableInteraction)
         {
            if(this.getEnablePartyTaskToggleBtn())
            {
               this.partyTaskToggle_mc._visible = true;
            }
            this.close_mc._visible = true;
            this.minimizeToggle_mc._visible = true;
            this.link_mc._visible = true;
            this.backUpItem_mc._visible = this.bBackUpItem;
         }
         this.bg_mc._visible = true;
         this.setLabel(this.getLabel());
      }
      else
      {
         this.partyTaskToggle_mc._visible = false;
         this.close_mc._visible = false;
         this.minimizeToggle_mc._visible = false;
         this.link_mc._visible = false;
         this.bg_mc._visible = false;
         this.backUpItem_mc._visible = false;
         this.setLabel(this.getLabel());
      }
   }
   function setSlowlyHide()
   {
      var standByFrame = this.hideStandByTime / 1000 * 25;
      var frameCnt = 0;
      this.onEnterFrame = function()
      {
         frameCnt++;
         if(frameCnt >= standByFrame)
         {
            this._alpha = this._alpha - 3;
            if(this._alpha <= 0)
            {
               delete this.onEnterFrame;
               this.removeMovieClip();
            }
         }
      };
   }
   function setData(data)
   {
      this.clear();
      this.questData = data;
   }
   function getData()
   {
      return this.questData;
   }
   function clear()
   {
      this.hideUpdateEffect(true);
      this.stopBlink(true);
      lib.util.Warning.remove(this.updateEffect_mc,true);
      delete this.onEnterFrame;
      delete this.previousTask_mc.onEnterFrame;
      this.previousTask_mc.removeMovieClip();
      this.markerHit._visible = false;
      this.backUpItem_mc._visible = false;
      this.bBackUpItem = false;
      delete this.markerHit.bMarker;
      this.clearTask();
      this.clearItem();
   }
   function clearItem()
   {
      this.itemContainer_mc.clear();
      this.curSlotCnt = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.maxSlotCnt)
      {
         var _loc3_ = this.itemContainer_mc["itemSlot__" + _loc2_];
         _loc3_._visible = false;
         lib.manager.ToolTip.remove(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function onUnload()
   {
      this.clear();
   }
   function addTask(index)
   {
      var _loc2_ = this.taskContainer_mc.createTextField("task" + index,index,0,0,0,0);
      _loc2_.index = index;
      lib.util.TextFieldFormatter.setStyle(_loc2_,"default");
      lib.util.TextFieldFormatter.setStyle(_loc2_,"chat");
      this.task_array[index] = _loc2_;
      return _loc2_;
   }
   function updateTask(index, str, curCount, totalCount, bFailedTask)
   {
      var _loc3_ = this.task_array[index];
      var _loc5_ = null;
      if(_loc3_ == undefined)
      {
         _loc3_ = this.addTask(index);
      }
      else
      {
         _loc5_ = _loc3_.text;
      }
      var _loc2_ = lib.src.QuestTaskMc.COLOR_TASK_NOCOMPLETE;
      if(curCount == 0 && totalCount == 0)
      {
         _loc2_ = lib.src.QuestTaskMc.COLOR_TASK_NOCOMPLETE;
      }
      else if(curCount == 1 && (totalCount == 0 || totalCount == 1))
      {
         _loc2_ = lib.src.QuestTaskMc.COLOR_TASK_COMPLETE;
      }
      else if(totalCount > 1)
      {
         str = str + (" &lt;" + curCount + "/" + totalCount + "&gt;");
         if(curCount == totalCount)
         {
            _loc2_ = lib.src.QuestTaskMc.COLOR_TASK_COMPLETE;
         }
         else
         {
            _loc2_ = lib.src.QuestTaskMc.COLOR_TASK_NOCOMPLETE;
         }
      }
      if(this.bQuestComplete)
      {
         _loc2_ = lib.src.QuestTaskMc.COLOR_COMPLETE;
      }
      else if(bFailedTask)
      {
         _loc2_ = lib.src.QuestTaskMc.COLOR_FAIL;
      }
      _loc3_.htmlText = str;
      _loc3_.textColor = _loc2_;
      if(_loc5_ != null && _loc5_ != _loc3_.text)
      {
         this.showUpdateEffect();
      }
      this.resizeFrame();
   }
   function removeTask(index, bFlag)
   {
      var _loc5_ = bFlag != true?index + 1:this.task_array.length;
      var _loc2_ = index;
      while(_loc2_ < _loc5_)
      {
         var _loc3_ = this.task_array[_loc2_];
         _loc3_.removeTextField();
         _loc2_ = _loc2_ + 1;
      }
      var _loc6_ = _loc5_ - index;
      if(_loc6_ > 0)
      {
         this.task_array.splice(index,_loc6_);
         this.resizeFrame();
      }
   }
   function clearTask()
   {
      while(this.task_array.length > 0)
      {
         this.task_array[0].removeTextField();
         this.task_array.shift();
      }
      this.resizeFrame();
   }
   function showPartyTask()
   {
   }
   function hidePartyTask()
   {
   }
   function attachPartyTask(mc)
   {
      if(typeof mc == "movieclip")
      {
         this.partyTask_mc = mc;
      }
      else if(typeof mc == "string")
      {
         this.partyTask_mc = this.attachMovie("partyTask_link","partyTask_mc",this.partyTask_mc_depth);
      }
      return this.partyTask_mc;
   }
   function detachPartyTask()
   {
      this.partyTask_mc = undefined;
   }
}
