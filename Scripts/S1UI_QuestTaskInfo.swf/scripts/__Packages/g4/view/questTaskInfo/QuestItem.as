class g4.view.questTaskInfo.QuestItem extends gfx.core.UIComponent
{
   var isParty = false;
   var isRemove = false;
   var effectIndex = 0;
   var isQuestComplete = false;
   var itemWidth = 35;
   var itemInRow = 7;
   function QuestItem()
   {
      super();
      this.isFold = false;
      this.STR_CLOSE = lib.util.UIString.getUIString("$102001");
      this.STR_REDUCE = lib.util.UIString.getUIString("$102004");
      this.STR_SHOW_PARTYTASK = lib.util.UIString.getUIString("$093005");
      this.STR_EXPAND = lib.util.UIString.getUIString("$102005");
      lib.manager.ToolTip.add(this.bClose,this.STR_CLOSE,1);
      lib.manager.ToolTip.add(this.bFold,this.STR_REDUCE,1);
      this._aTask_active = [];
      this._aTask_pool = [];
      this._aItem_active = [];
      this._aItem_pool = [];
   }
   function onLoad()
   {
      this.tInfo = (TextField)this.mSubContent.tInfo;
      this.tTime = (TextField)this.mSubContent.tTime;
      this.mTaskPoint = (MovieClip)this.mSubContent.mTaskPoint;
      this.mItemPoint = (MovieClip)this.mSubContent.mItemPoint;
      this.bFold.addEventListener(gfx.events.EventTypes.CLICK,this,"foldHandlerClick");
      this.bClose.addEventListener(gfx.events.EventTypes.CLICK,this,"closeHandlerClick");
      this.mQuestType.onRelease = g4.util.Delegate.create(this,this.questTypeHandlerClick);
      this.mBackground.onRelease = g4.util.Delegate.create(this,this.bgHandlerClick);
      this.bBackup = (gfx.controls.Button)this.mSubContent.bBackup;
      this.mSubContent.bBackup.label = lib.util.UIString.getUIString("$091045");
      this.bBackup.addEventListener(gfx.events.EventTypes.CLICK,this,"backupHandlerClick");
      this.tTime._visible = false;
      g4.util.UIUtil.setTextFieldStyle(this.tName,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setTextFieldStyle(this.tTime,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setTextFieldStyle(this.tInfo,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
   }
   function foldHandlerClick(event)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      this.setFold(!this.bFold.__get__selected());
      this.dispatchEvent({type:gfx.events.EventTypes.CHANGE});
   }
   function closeHandlerClick(event)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      this.dispatchEvent({type:"quest_task_item_close",questId:this._data.paramId,questType:this.questType});
   }
   function questTypeHandlerClick()
   {
      this.dispatchEvent({type:"quest_request_spark",questId:this.questId,isProgress:this.isProgress});
   }
   function bgHandlerClick()
   {
      this.dispatchEvent({type:"quest_click",questId:this._data.paramId});
   }
   function backupHandlerClick()
   {
      this.dispatchEvent({type:"quest_backup_click",questId:this.questId});
   }
   function getTaskItem()
   {
      var _loc2_ = undefined;
      if(this._aTask_pool.length > 0)
      {
         _loc2_ = (g4.view.questTaskInfo.TaskItem)this._aTask_pool.pop();
         _loc2_._visible = true;
      }
      else
      {
         var _loc3_ = this.mTaskPoint.getNextHighestDepth();
         _loc2_ = (g4.view.questTaskInfo.TaskItem)this.mTaskPoint.attachMovie("TaskItem","item" + _loc3_,_loc3_);
      }
      this._aTask_active.push(_loc2_);
      return _loc2_;
   }
   function getItemSlot()
   {
      var _loc2_ = undefined;
      if(this._aItem_pool.length > 0)
      {
         _loc2_ = (g4.view.questTaskInfo.QuestItemSlot)this._aItem_pool.pop();
         _loc2_.__set__visible(true);
      }
      else
      {
         var _loc3_ = this.mItemPoint.getNextHighestDepth();
         _loc2_ = (g4.view.questTaskInfo.QuestItemSlot)this.mItemPoint.attachMovie("QuestItemSlot","itemSlot" + _loc3_,_loc3_);
         _loc2_.addEventListener(gfx.events.EventTypes.ITEM_CLICK,this,"eventRelay");
      }
      this._aItem_active.push(_loc2_);
      return _loc2_;
   }
   function eventRelay(event)
   {
      this.dispatchEvent(event);
   }
   function setFold($value)
   {
      if($value)
      {
         this.bFold.__set__selected(true);
         lib.manager.ToolTip.remove(this.bFold);
         lib.manager.ToolTip.add(this.bFold,this.STR_EXPAND,1);
         this.mSubContent._visible = false;
         this.mSubContent.hitTestDisable = true;
      }
      else
      {
         this.bFold.__set__selected(false);
         lib.manager.ToolTip.remove(this.bFold);
         lib.manager.ToolTip.add(this.bFold,this.STR_REDUCE,1);
         this.mSubContent._visible = true;
         this.mSubContent.hitTestDisable = false;
      }
      this.dispatchEvent({type:"ToGame_QuestTaskInfo_Fold",questId:this._data.paramId,fold:(!this.bFold.__get__selected()?0:1)});
      this.checkBackground();
   }
   function resizeFrame()
   {
      var _loc2_ = !this.bFold.__get__selected()?Math.round(this.tInfo._height + 4):39;
      this.mTaskPoint._y = _loc2_;
   }
   function effectHandlerNewFinish()
   {
      this.dispatchEvent({type:"quest_remove",questId:this.questId,questType:this.questType});
   }
   function setData(value)
   {
      this._data = value;
      this.questId = this._data.questId;
      this.bBackup._visible = false;
      this.effectType = 1;
      this.tTime._visible = false;
      if(this._data != null)
      {
         if(this._data.questType == 0)
         {
            this.tName.textColor = lib.info.TextColor.UI_QUESTINFO_NAME;
         }
         else if(this._data.questType == 1)
         {
            this.tName.textColor = lib.info.TextColor.UI_QUESTINFO_NAME_MISSION;
         }
         else if(this._data.questType == 2)
         {
            this.tName.textColor = lib.info.TextColor.UI_QUESTINFO_NAME_GUILD;
         }
         else if(this._data.questType == 3)
         {
            this.tName.textColor = lib.info.TextColor.UI_QUESTINFO_NAME_DAILYQUEST;
         }
         else if(this._data.questType == 4)
         {
            this.tName.textColor = lib.info.TextColor.UI_QUESTINFO_NAME_UNIONQUEST;
         }
         if(this._data.trackIndex > 0)
         {
            this.setTrackNumber(this._data.trackIndex);
         }
         else if(this._data.questProgressType == 1 || this._data.questProgressType == 2)
         {
            this.mQuestType._visible = true;
            var _loc3_ = this._data.questType * 2 + this._data.questProgressType;
            this.mQuestType.gotoAndStop(_loc3_);
            this.isProgress = 1;
         }
         else
         {
            this.mQuestType._visible = false;
            this.isProgress = null;
         }
         if(this._data.recParty > 1)
         {
            this.mRecParty._visible = true;
            this.mRecParty.gotoAndStop(this._data.recParty - 1);
            this.tName._x = 43;
            this.tName._width = 137;
         }
         else
         {
            this.mRecParty._visible = false;
            this.tName._x = 21;
            this.tName._width = 159;
         }
         this.tName.text = this._data.questName;
         var _loc2_ = "";
         if(this._data.questLevel > 0)
         {
            _loc2_ = lib.util.UIString.getUIString("221004") + String(this._data.questLevel);
         }
         if(this._data.mapName != null)
         {
            _loc2_ = _loc2_ + (" " + this._data.mapName);
         }
         this.tInfo.text = _loc2_;
         this.tInfo._height = Math.round(this.tInfo.textHeight + 4);
         this.mTaskPoint._y = this.tInfo.textHeight + 2;
      }
   }
   function getData()
   {
      return this._data;
   }
   function resetTask()
   {
      this.mTaskPoint._visible = false;
      while(this._aTask_active.length > 0)
      {
         var _loc2_ = (g4.view.questTaskInfo.TaskItem)this._aTask_active.pop();
         _loc2_.removeMovieClip();
      }
   }
   function setTask($task)
   {
      this._task = $task;
      var _loc7_ = lib.util.ExtString.split($task,"\n");
      var _loc6_ = _loc7_.length;
      if(_loc6_ == 0)
      {
         this.mTaskPoint._visible = false;
      }
      else
      {
         var _loc8_ = this._aTask_active.length;
         if(_loc6_ != _loc8_)
         {
            this.resetTask();
         }
         this.mTaskPoint._visible = true;
         var _loc5_ = 0;
         var _loc3_ = 0;
         while(_loc3_ < _loc6_)
         {
            var _loc2_ = undefined;
            if(this._aTask_active[_loc3_] != null)
            {
               _loc2_ = this._aTask_active[_loc3_];
            }
            else
            {
               _loc2_ = this.getTaskItem();
            }
            var _loc4_ = lib.util.ExtString.split(_loc7_[_loc3_],"\t");
            if(Number(_loc4_[3]) == 1)
            {
               this.tName.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
            }
            _loc2_.isQuestComplete = this.isQuestComplete;
            _loc2_.setData(_loc4_);
            _loc2_._y = _loc5_;
            _loc5_ = _loc5_ + Math.round(_loc2_._height - 2);
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function getTask()
   {
      return this._task;
   }
   function resetItems()
   {
      this.mItemPoint._visible = false;
      this.mItemPoint._y = 0;
      while(this._aItem_active.length > 0)
      {
         var _loc2_ = (g4.view.questTaskInfo.QuestItemSlot)this._aItem_active.pop();
         _loc2_._x = 0;
         _loc2_._y = 0;
         _loc2_._visible = false;
         _loc2_.hitTestDisable = true;
         this._aItem_pool.push(_loc2_);
      }
      this.bBackup.__set__visible(false);
      this.bBackup._y = 0;
   }
   function setItem($itemList, $bBackup)
   {
      this._itemList = $itemList;
      this._bBackUp = $bBackup;
      this.resetItems();
      var _loc5_ = "";
      var _loc2_ = 0;
      while(_loc2_ < this._aItem_pool.length)
      {
         if(this._aItem_pool[_loc2_]._visible)
         {
            _loc5_ = _loc5_ + "1";
         }
         else
         {
            _loc5_ = _loc5_ + "0";
         }
         _loc2_ = _loc2_ + 1;
      }
      var _loc7_ = lib.util.ExtString.split($itemList,"\n");
      var _loc6_ = _loc7_.length;
      if(_loc6_ == 0)
      {
         this.mItemPoint._visible = false;
         this.bBackup.__set__visible(false);
         this.bBackup._y = 0;
      }
      else
      {
         this.mItemPoint._visible = true;
         _loc2_ = 0;
         while(_loc2_ < _loc6_)
         {
            var _loc4_ = lib.util.ExtString.split(_loc7_[_loc2_],"\t");
            var _loc3_ = this.getItemSlot();
            _loc3_.setData(_loc4_);
            _loc3_._x = _loc2_ % this.itemInRow * this.itemWidth;
            _loc3_._y = Math.floor(_loc2_ / this.itemInRow) * this.itemWidth;
            _loc2_ = _loc2_ + 1;
         }
         this.mItemPoint._y = this.mTaskPoint._y + this.mTaskPoint._height + 10;
         if($bBackup == 1)
         {
            this.bBackup.__set__visible(true);
            this.bBackup._y = this.mItemPoint._y + this.mItemPoint._height;
         }
         else
         {
            this.bBackup._y = 0;
            this.bBackup.__set__visible(false);
         }
      }
   }
   function getItemList()
   {
      return this._itemList;
   }
   function getBackUp()
   {
      return this._bBackUp;
   }
   function checkBackground()
   {
      if(this.mSubContent._visible)
      {
         this.mBackground._height = this.mSubContent._y + this.mSubContent._height + 18;
      }
      else
      {
         this.mBackground._height = 40;
      }
      this.mLine._y = this.mBackground._height - 10;
   }
   function setTrackNumber($track)
   {
      if($track > 0)
      {
         this.mQuestType._visible = true;
         this.mQuestType.gotoAndStop(11);
         this.tTrack.text = String($track);
         this.isProgress = 0;
      }
      else
      {
         this.tTrack.text = "";
         if(this._data.questProgressType == 1 || this._data.questProgressType == 2)
         {
            this.mQuestType._visible = true;
            var _loc2_ = this._data.questType * 2 + this._data.questProgressType;
            this.mQuestType.gotoAndStop(_loc2_);
            this.isProgress = 1;
         }
         else
         {
            this.mQuestType._visible = false;
            this.isProgress = null;
         }
      }
   }
   function setQuestComplete($value)
   {
      this.isQuestComplete = $value;
      var _loc4_ = this._aTask_active.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = (g4.view.questTaskInfo.TaskItem)this._aTask_active[_loc2_];
         _loc3_.isQuestComplete = this.isQuestComplete;
         _loc3_.checkTextColor();
         _loc2_ = _loc2_ + 1;
      }
      if(!$value)
      {
      }
   }
   function setAddEffect($isRemove)
   {
      if(this.isQuestComplete)
      {
         return undefined;
      }
      this.isRemove = $isRemove;
      this.mBackground.gotoAndStop(2);
      this.effectIndex = 0;
      this._alpha = 100;
      this.onComplete = g4.util.Delegate.create(this,this.onEffectComp);
      g4.util.TweenX.to(this,0.3,{_alpha:0},gs.easing.Linear.easeNone,this);
   }
   function onEffectComp()
   {
      if(this.effectIndex == 0)
      {
         g4.util.TweenX.killTweenOf(this);
         g4.util.TweenX.to(this,0.3,{_alpha:100},gs.easing.Linear.easeNone,this);
      }
      else if(this.effectIndex == 1)
      {
         g4.util.TweenX.killTweenOf(this);
         g4.util.TweenX.to(this,0.3,{_alpha:0},gs.easing.Linear.easeNone,this);
      }
      else if(this.effectIndex == 2)
      {
         g4.util.TweenX.killTweenOf(this);
         g4.util.TweenX.to(this,0.3,{_alpha:100},gs.easing.Linear.easeNone,this);
      }
      else if(this.effectIndex == 3)
      {
         g4.util.TweenX.killTweenOf(this);
         g4.util.TweenX.to(this,0.3,{_alpha:0},gs.easing.Linear.easeNone,this);
      }
      if(this.effectIndex == 4)
      {
         g4.util.TweenX.killTweenOf(this);
         g4.util.TweenX.to(this,0.3,{_alpha:100},gs.easing.Linear.easeNone,this);
      }
      else if(this.effectIndex == 5)
      {
         g4.util.TweenX.killTweenOf(this);
         g4.util.TweenX.to(this,0.3,{_alpha:0},gs.easing.Linear.easeNone,this);
      }
      if(this.effectIndex == 6)
      {
         g4.util.TweenX.killTweenOf(this);
         g4.util.TweenX.to(this,0.3,{_alpha:100},gs.easing.Linear.easeNone,this);
      }
      else if(this.effectIndex == 7)
      {
         this.mBackground.gotoAndStop(1);
         if(this.isRemove)
         {
            this.effectHandlerNewFinish();
         }
      }
      this.effectIndex = this.effectIndex + 1;
   }
   function getHeight()
   {
      if(this.bFold.__get__selected())
      {
         return 39;
      }
      return this._height;
   }
   function setUIMode($mode)
   {
      this.mBackground._visible = $mode;
      var _loc2_ = 170;
      this.bFold.__set__visible($mode);
      this.bClose.__set__visible($mode);
      if($mode)
      {
         _loc2_ = 137;
      }
      else
      {
         _loc2_ = 190;
      }
      if(!this.mRecParty._visible)
      {
         _loc2_ = _loc2_ + 22;
      }
      this.tName._width = _loc2_;
      this.tName.text = this._data.questName;
      if(this.tName.textWidth > this.tName._width)
      {
         var _loc4_ = this.tName.getCharIndexAtPoint(this.tName._width - 5,10);
         this.tName.text = this._data.questName.substr(0,_loc4_) + "...";
      }
   }
   function resetData()
   {
      this.isFold = false;
      this.bFold.__set__selected(false);
      lib.manager.ToolTip.remove(this.bFold);
      lib.manager.ToolTip.add(this.bFold,this.STR_REDUCE,1);
      this.mSubContent._visible = true;
      this.mSubContent.hitTestDisable = false;
      this.tInfo.text = "";
      this.mTaskPoint._visible = false;
      this.mItemPoint._visible = false;
      this.resetTask();
      this.resetItems();
      this.tTime._visible = false;
      this.tTime._y = 0;
      this.__set__visible(false);
      this._y = 0;
   }
   function setQuestTime($time)
   {
      if($time == "000000" || $time == "0" || $time == null)
      {
         this.tTime.text = "";
         this.tTime._visible = false;
         this.tTime._y = 0;
      }
      else
      {
         var _loc5_ = $time.substr(0,2);
         var _loc4_ = $time.substr(2,2);
         var _loc3_ = $time.substr(4,2);
         this.tTime.text = _loc5_ + ":" + _loc4_ + ":" + _loc3_;
         if(!this.tTime._visible)
         {
            this.tTime._visible = true;
            if(this.bBackup.__get__visible())
            {
               this.tTime._y = Math.round(this.bBackup._y + this.bBackup._height + 5);
            }
            else if(this.mItemPoint._visible)
            {
               this.tTime._y = Math.round(this.mItemPoint._y + this.mItemPoint._height + 5);
            }
            else if(this.mTaskPoint._visible)
            {
               this.tTime._y = Math.round(this.mTaskPoint._y + this.mTaskPoint._height + 5);
            }
            else
            {
               this.tTime._y = Math.round(this.tInfo._y + this.tInfo._height + 5);
            }
            this.mBackground._height = this.mSubContent._y + this.mSubContent._height;
         }
      }
      this.checkBackground();
   }
}
