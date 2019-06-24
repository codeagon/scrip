class g4.view.questTaskInfo.QuestTempItem extends gfx.core.UIComponent
{
   var isRemove = false;
   var effectIndex = 0;
   var isQuestComplete = false;
   var itemWidth = 35;
   var itemInRow = 7;
   function QuestTempItem()
   {
      super();
      this.hitTestDisable = true;
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
      this.bBackup = (gfx.controls.Button)this.mSubContent.bBackup;
      this.mSubContent.bBackup.label = lib.util.UIString.getUIString("$091045");
      this.tTime._visible = false;
      g4.util.UIUtil.setTextFieldStyle(this.tName,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setTextFieldStyle(this.tTime,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setTextFieldStyle(this.tInfo,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
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
      }
      this._aItem_active.push(_loc2_);
      return _loc2_;
   }
   function setFold($value)
   {
      if($value)
      {
         this.mSubContent._visible = false;
         this.mSubContent.hitTestDisable = true;
      }
      else
      {
         this.mSubContent._visible = true;
         this.mSubContent.hitTestDisable = false;
      }
      this.checkBackground();
   }
   function resizeFrame()
   {
      var _loc2_ = Math.round(this.tInfo._height + 4);
      this.mTaskPoint._y = _loc2_;
   }
   function setData(value)
   {
      this._data = value;
      this.questID = this._data.questId;
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
         else
         {
            this.setTrackNumber(0);
            if(this._data.questProgressType == 1 || this._data.questProgressType == 2)
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
      this.resetTask();
      var _loc7_ = lib.util.ExtString.split($task,"\n");
      var _loc6_ = _loc7_.length;
      if(_loc6_ == 0)
      {
         this.mTaskPoint._visible = false;
      }
      else
      {
         this.mTaskPoint._visible = true;
         var _loc5_ = 0;
         var _loc3_ = 0;
         while(_loc3_ < _loc6_)
         {
            var _loc2_ = this.getTaskItem();
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
      }
      this.bBackup.__set__visible(false);
   }
   function setItem($itemList, $bBackup)
   {
      this._itemList = $itemList;
      this._bBackUp = $bBackup;
      this.resetItems();
      var _loc6_ = lib.util.ExtString.split($itemList,"\n");
      var _loc5_ = _loc6_.length;
      if(_loc5_ == 0)
      {
         this.mItemPoint._visible = false;
         this.bBackup.__set__visible(false);
      }
      else
      {
         this.mItemPoint._visible = true;
         var _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            var _loc4_ = lib.util.ExtString.split(_loc6_[_loc2_],"\t");
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
   function resetData()
   {
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
   function moveIn()
   {
      this._moveStep = 0;
      this._x = 45;
      g4.util.TweenX.killTweenOf(this);
      g4.util.TweenX.to(this,0.5,{_x:-175},gs.easing.Strong.easeOut,this);
   }
   function onComplete()
   {
      if(this._moveStep == 0)
      {
         g4.util.TweenX.to(this,1,{_alpha:0},gs.easing.Strong.easeOut,this);
         this._moveStep = 1;
      }
      else if(this._moveStep == 1)
      {
         this.resetData();
         this.__set__visible(false);
         this._alpha = 100;
         this._x = 45;
         this.dispatchEvent({type:gfx.events.EventTypes.COMPLETE});
      }
   }
}
