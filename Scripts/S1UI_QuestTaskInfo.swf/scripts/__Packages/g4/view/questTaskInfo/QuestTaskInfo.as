class g4.view.questTaskInfo.QuestTaskInfo extends g4.core.View implements g4.gameInterface.IQuestTaskInfo
{
   var isScroll = false;
   var maxList = 3;
   function QuestTaskInfo($targetMovie)
   {
      super($targetMovie);
   }
   function getUIName()
   {
      return g4.view.ViewID.QUEST_TASK_INFO;
   }
   function configUI()
   {
      this.__get__targetMovieClip().container_mc.UIDrager.setData(this.getUIName());
      this.addPoint = (MovieClip)this.__get__targetMovieClip().container_mc.addPoint;
      this.mMainLabel = (MovieClip)this.__get__targetMovieClip().container_mc.mMainLabel;
      this.bFoldQuestWindow = (gfx.controls.Button)this.mMainLabel.bFoldQuestWindow;
      this.bFoldQuestWindow.addEventListener(gfx.events.EventTypes.CLICK,this,"foldHandlerClick");
      this.bFoldAll = (gfx.controls.Button)this.mMainLabel.bFoldAll;
      this.bFoldAll.addEventListener(gfx.events.EventTypes.CLICK,this,"foldAllHandlerClick");
      lib.manager.ToolTip.add(this.bFoldAll,lib.util.UIString.getUIString("$095001"),1);
      this.scr = (g4.component.ScrollBarX)this.__get__targetMovieClip().container_mc.scr;
      this.__get__targetMovieClip().container_mc.msk._x = -50;
      this.__get__targetMovieClip().container_mc.msk._width = this.__get__targetMovieClip().container_mc.msk._width + 50;
      this.scr.targetRect = this.__get__targetMovieClip().container_mc.msk;
      this.scr.addEventListener(gfx.events.EventTypes.SCROLL,this,"scrHandlerScroll");
      this.mBackground = (MovieClip)this.__get__targetMovieClip().container_mc.mBackground;
      this._aItems_pool = [];
      this._aItems_active = [];
      this._temp_pool = [];
      this._temp_active = [];
      g4.util.UIUtil.setTextFieldStyle(this.mMainLabel.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      var _loc6_ = 0;
      while(_loc6_ < 20)
      {
         var _loc3_ = undefined;
         var _loc5_ = this.addPoint.getNextHighestDepth();
         _loc3_ = (g4.view.questTaskInfo.QuestItem)this.addPoint.attachMovie("QuestItem","item" + _loc5_,_loc5_);
         _loc3_.addEventListener("quest_task_item_close",this,"itemHandlerClose");
         _loc3_.addEventListener("quest_request_spark",this,"itemHandlerSpark");
         _loc3_.addEventListener("quest_remove",this,"itemHandlerRemove");
         _loc3_.addEventListener("quest_click",this,"itemHandlerClick");
         _loc3_.addEventListener(gfx.events.EventTypes.CHANGE,this,"itemHandlerChangeSize");
         _loc3_.addEventListener("quest_backup_click",this,"itemBackupHandlerClick");
         _loc3_.addEventListener(gfx.events.EventTypes.ITEM_CLICK,this,"itemHandlerUse");
         _loc3_.addEventListener("ToGame_QuestTaskInfo_Fold",this,"ToGame_QuestTaskInfo_Fold");
         _loc3_.__set__visible(false);
         this._aItems_pool.push(_loc3_);
         _loc6_ = _loc6_ + 1;
      }
      _loc6_ = 0;
      while(_loc6_ < 2)
      {
         var _loc4_ = undefined;
         _loc5_ = this.__get__targetMovieClip().container_mc.getNextHighestDepth();
         _loc4_ = (g4.view.questTaskInfo.QuestTempItem)this.__get__targetMovieClip().container_mc.attachMovie("QuestTempItem","item" + _loc5_,_loc5_);
         _loc4_.addEventListener(gfx.events.EventTypes.COMPLETE,this,"tmpHandlerComplete");
         _loc4_.__set__visible(false);
         this._temp_pool.push(_loc4_);
         _loc6_ = _loc6_ + 1;
      }
      this.customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
      this.customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"customDataChange");
      this.customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.QUESTTASKINFO_MINIMIZE_BOOLEAN,this,"minimizeHandler");
      this.ToGame_QuestTaskInfo_Init();
      if(_global.gfxPlayer)
      {
         _global.gbUIMode = true;
         this.setViewVisible(true);
         this.__get__targetMovieClip().container_mc.bTest0.addEventListener(gfx.events.EventTypes.CLICK,this,"btnHandler0");
         this.__get__targetMovieClip().container_mc.bTest1.addEventListener(gfx.events.EventTypes.CLICK,this,"btnHandler1");
         this.__get__targetMovieClip().container_mc.bTest2.addEventListener(gfx.events.EventTypes.CLICK,this,"btnHandler2");
         this.__get__targetMovieClip().container_mc.bTest3.addEventListener(gfx.events.EventTypes.CLICK,this,"btnHandler3");
      }
   }
   function minimizeHandler(value)
   {
      if(value == null)
      {
         return undefined;
      }
      if(value == 1)
      {
         this.hideQuests();
      }
      else
      {
         this.showQuests();
      }
   }
   function customDataChange(event)
   {
      if(event.key == lib.gamedata.CustomizedUIDataKey.QUESTTASKINFO_MINIMIZE_BOOLEAN)
      {
         this.minimizeHandler(event.value);
      }
   }
   function btnHandler0(event)
   {
      this.OnGame_QuestTaskInfo_Clear();
      this.OnGame_QuestTaskInfo_SetQuestMaxNum(20);
      this.OnGame_QuestTaskInfo_AddQuestInfo("3101`424\t알레만시아의 위기\t12\t0\t0\t1\t0\t0\t0\t0\t1\t1\t1\t얼어붙은 해안\t42\t","<A href=\"markmap:loc=@npcloc:232#1022&type=1&name=그란 바타히르\"><font color=\'#2244CC\'>그란 바타히르</font></A>\t0\t1\n폭군의 고원 용병단 기지의 <A href=\"markmap:loc=@npcloc:232#1022&type=1&name=그란 바타히르\"><font color=\'#2244CC\'>그란 바타히르</font></A>에게 저주 해제의 비약을 사용해 저주를 풀고 그를 토벌 기지까지 호위하시오.\n[*저주 해제의 비약은 <A href=\"markmap:loc=@npcloc:232#1022&type=1&name=그란 바타히르\"><font color=\'#2244CC\'>그란 바타히르</font></A> HP 30% 이하에서 효과 발휘*]\t1\t0",0,1,"5016\timg://__Icon_Items.potion14_Tex\t저주 해제의 비약\n",0);
      this.OnGame_QuestTaskInfo_SetQuestComplete("3101`424",0);
   }
   function btnHandler1(event)
   {
      this.OnGame_QuestTaskInfo_FoldQuest("3101`424\t1");
      return undefined;
   }
   function btnHandler2(event)
   {
      this.OnGame_QuestTaskInfo_UpdateQuestInfo("3101`424\t알레만시아의 위기\t14\t0\t0\t1\t0\t0\t0\t0\t1\t1\t1\t얼어붙은 해안\t42\t","가짜 카이둔의 목\t0\t1\n폭군의 고원 압제의 들판 언덕 위 요새에 있는 폭군 <A href=\"markmap:loc=@npcloc:32#17&type=1&name=카이둔\"><font color=\'#2244CC\'>카이둔</font></A>을 처치하시오.\t1\t0",0,"",0);
      this.OnGame_QuestTaskInfo_SetQuestComplete("3101`424",0);
      this.OnGame_QuestTaskInfo_UpdateList("701\t0\t0\t\n3101\t1\t0\t\n");
   }
   function btnHandler3(event)
   {
      this.OnGame_QuestTaskInfo_RemoveQuestInfo("3101`424",1);
      this.OnGame_QuestTaskInfo_UpdateList("");
   }
   function tmpHandlerComplete(event)
   {
      var _loc3_ = (g4.view.questTaskInfo.QuestTempItem)event.target;
      var _loc4_ = this._temp_active.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         if(this._temp_active[_loc2_] == _loc3_)
         {
            this._temp_active.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      this._temp_pool.push(_loc3_);
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGameEventChangeUIMode",g4.util.Delegate.create(this,this.OnGameEventChangeUIMode));
      this.registerGameInterface("OnGame_QuestTaskInfo_UpdateList",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_UpdateList));
      this.registerGameInterface("OnGame_QuestTaskInfo_SetQuestMaxNum",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_SetQuestMaxNum));
      this.registerGameInterface("OnGame_QuestTaskInfo_Open",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_Open));
      this.registerGameInterface("OnGame_QuestTaskInfo_FieldEventOnOff",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_FieldEventOnOff));
      this.registerGameInterface("OnGame_QuestTaskInfo_AddQuestInfo",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_AddQuestInfo));
      this.registerGameInterface("OnGame_QuestTaskInfo_UpdateQuestInfo",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_UpdateQuestInfo));
      this.registerGameInterface("OnGame_QuestTaskInfo_RemoveQuestInfo",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_RemoveQuestInfo));
      this.registerGameInterface("OnGame_QuestTaskInfo_Clear",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_Clear));
      this.registerGameInterface("OnGame_QuestTaskInfo_SetQuestComplete",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_SetQuestComplete));
      this.registerGameInterface("OnGame_QuestTaskInfo_UpdateTimerString",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_UpdateTimerString));
      this.registerGameInterface("OnGame_QuestTaskInfo_UpdatePartyMemberTask",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_UpdatePartyMemberTask));
      this.registerGameInterface("OnGame_QuestTaskInfo_RemovePartyMemberTask",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_RemovePartyMemberTask));
      this.registerGameInterface("OnGame_QuestTaskInfo_ClearPartyMemberTask",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_ClearPartyMemberTask));
      this.registerGameInterface("OnGame_QuestTaskInfo_FoldQuest",g4.util.Delegate.create(this,this.OnGame_QuestTaskInfo_FoldQuest));
   }
   function showQuests()
   {
      this.addPoint._visible = true;
      this.rePosition();
      var _loc2_ = lib.util.UIString.getUIString("$093007");
      this.mMainLabel.textField.text = _loc2_;
      this.bFoldQuestWindow.__set__selected(false);
      lib.manager.ToolTip.remove(this.bFoldQuestWindow);
      lib.manager.ToolTip.add(this.bFoldQuestWindow,_loc2_,1);
      this.scr.__set__visible(this.isScroll);
      this.mBackground._visible = true;
   }
   function hideQuests()
   {
      this.addPoint._visible = false;
      var _loc2_ = lib.util.UIString.getUIString("$093008");
      this.mMainLabel.textField.text = _loc2_;
      this.bFoldQuestWindow.__set__selected(true);
      lib.manager.ToolTip.remove(this.bFoldQuestWindow);
      lib.manager.ToolTip.add(this.bFoldQuestWindow,_loc2_,1);
      this.scr.__set__visible(false);
      this.mBackground._visible = false;
   }
   function foldHandlerClick(event)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      if(this.bFoldQuestWindow.__get__selected())
      {
         this.showQuests();
      }
      else
      {
         this.hideQuests();
      }
      this.customizeData.saveData(lib.gamedata.CustomizedUIDataKey.QUESTTASKINFO_MINIMIZE_BOOLEAN,Number(this.bFoldQuestWindow.__get__selected()),true);
   }
   function foldAllHandlerClick(event)
   {
      var _loc3_ = this._aItems_active.length;
      this.bFoldAll.__set__selected(!this.bFoldAll.__get__selected());
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (g4.view.questTaskInfo.QuestItem)this._aItems_active[_loc2_].setFold(this.bFoldAll.__get__selected());
         _loc2_ = _loc2_ + 1;
      }
      lib.manager.ToolTip.remove(this.bFoldAll);
      if(this.bFoldAll.__get__selected())
      {
         lib.manager.ToolTip.add(this.bFoldAll,lib.util.UIString.getUIString("$095002"),1);
      }
      else
      {
         lib.manager.ToolTip.add(this.bFoldAll,lib.util.UIString.getUIString("$095001"),1);
      }
      this.rePosition();
      lib.manager.UISound.play("1138");
   }
   function scrHandlerScroll(event)
   {
      this.addPoint._y = 31 - event.position;
   }
   function itemHandlerClose(event)
   {
      this.ToGame_QuestTaskInfo_RemoveQuestInfo(event.questId,event.questType);
   }
   function itemHandlerSpark(event)
   {
      this.ToGame_QuestTaskInfo_RequestSparkleImage(event.questId,event.isProgress);
   }
   function itemHandlerRemove(event)
   {
      this.ToGame_QuestTaskInfo_RemoveQuestInfo(event.questId,event.questType);
   }
   function itemHandlerClick(event)
   {
      this.ToGame_QuestTaskInfo_ClickDialogBtn(event.questId);
   }
   function itemHandlerChangeSize(event)
   {
      this.rePosition();
   }
   function rePosition()
   {
      var _loc5_ = this._aItems_active.length;
      var _loc4_ = 0;
      var _loc6_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         var _loc3_ = (g4.view.questTaskInfo.QuestItem)this._aItems_active[_loc2_];
         _loc3_._y = _loc4_;
         _loc3_.mLine._visible = _loc2_ < _loc5_ - 1;
         _loc4_ = _loc4_ + _loc3_.getHeight();
         _loc2_ = _loc2_ + 1;
      }
      if(_loc4_ > this.scr._height)
      {
         this.isScroll = true;
         if(this.addPoint._visible)
         {
            this.scr.__set__visible(true);
         }
         this.scr.setScrollProperties(this.scr._height,0,_loc4_ - this.scr._height,25);
         _loc6_ = this.scr.targetRect._height;
      }
      else
      {
         this.isScroll = false;
         this.scr.__set__visible(false);
         this.addPoint._y = 31;
         _loc6_ = _loc4_ + 30;
      }
      this.mBackground._height = _loc6_;
   }
   function itemBackupHandlerClick(event)
   {
      this.ToGame_QuestTaskInfo_BackUpItem(event.questId);
   }
   function itemHandlerUse(event)
   {
      this.ToGame_QuestTaskInfo_ClickItem(event.itemId);
   }
   function getItem()
   {
      var _loc2_ = undefined;
      if(this._aItems_pool.length > 0)
      {
         _loc2_ = (g4.view.questTaskInfo.QuestItem)this._aItems_pool.pop();
         _loc2_.__set__visible(true);
      }
      else
      {
         var _loc3_ = this.addPoint.getNextHighestDepth();
         _loc2_ = (g4.view.questTaskInfo.QuestItem)this.addPoint.attachMovie("QuestItem","item" + _loc3_,_loc3_);
         _loc2_.addEventListener("quest_task_item_close",this,"itemHandlerClose");
         _loc2_.addEventListener("quest_request_spark",this,"itemHandlerSpark");
         _loc2_.addEventListener("quest_remove",this,"itemHandlerRemove");
         _loc2_.addEventListener("quest_click",this,"itemHandlerClick");
         _loc2_.addEventListener(gfx.events.EventTypes.CHANGE,this,"itemHandlerChangeSize");
         _loc2_.addEventListener("quest_backup_click",this,"itemBackupHandlerClick");
         _loc2_.addEventListener("ToGame_QuestTaskInfo_Fold",this,"ToGame_QuestTaskInfo_Fold");
      }
      var _loc4_ = this._aItems_active.length < this.maxList;
      this._aItems_active.push(_loc2_);
      _loc2_.setAddEffect(!_loc4_);
      return _loc2_;
   }
   function getTempItem()
   {
      var _loc2_ = undefined;
      if(this._temp_pool.length > 0)
      {
         _loc2_ = (g4.view.questTaskInfo.QuestTempItem)this._temp_pool.pop();
         _loc2_.__set__visible(true);
      }
      else
      {
         var _loc3_ = this.__get__targetMovieClip().container_mc.getNextHighestDepth();
         _loc2_ = (g4.view.questTaskInfo.QuestTempItem)this.__get__targetMovieClip().container_mc.attachMovie("QuestTempItem","item" + _loc3_,_loc3_);
      }
      this._temp_active.push(_loc2_);
      return _loc2_;
   }
   function OnGameEventChangeUIMode($bShow)
   {
      var _loc4_ = this._aItems_active.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         (g4.view.questTaskInfo.QuestItem)this._aItems_active[_loc2_].setUIMode($bShow);
         _loc2_ = _loc2_ + 1;
      }
      this.mMainLabel._visible = $bShow;
      if($bShow)
      {
         this.mBackground._visible = this.addPoint._visible;
         if(this.addPoint._visible)
         {
            this.scr.__set__visible(this.isScroll);
         }
         else
         {
            this.scr.__set__visible(false);
         }
      }
      else
      {
         this.mBackground._visible = false;
         this.scr.__set__visible(false);
      }
   }
   function OnGame_QuestTaskInfo_UpdateList($listData)
   {
      var _loc7_ = lib.util.ExtString.split($listData,"\n");
      var _loc8_ = _loc7_.length;
      var _loc3_ = this._aItems_active;
      this._aItems_active = [];
      var _loc6_ = 0;
      while(_loc6_ < _loc8_)
      {
         var _loc4_ = lib.util.ExtString.split(_loc7_[_loc6_],"\t");
         var _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if((g4.view.questTaskInfo.QuestItem)_loc3_[_loc2_].questId == _loc4_[0] || (g4.view.questTaskInfo.QuestItem)_loc3_[_loc2_].getData().paramId == _loc4_[0])
            {
               var _loc5_ = (g4.view.questTaskInfo.QuestItem)_loc3_.splice(_loc2_,1)[0];
               _loc5_.setTrackNumber(Number(_loc4_[2]));
               this._aItems_active.push(_loc5_);
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc6_ = _loc6_ + 1;
      }
      this.rePosition();
   }
   function OnGame_QuestTaskInfo_SetQuestMaxNum($number)
   {
      this.maxList = $number;
   }
   function OnGame_QuestTaskInfo_Open()
   {
      this.showQuests();
   }
   function OnGame_QuestTaskInfo_FieldEventOnOff($true)
   {
      $true = Number($true);
      var _loc2_ = undefined;
      if($true)
      {
         _loc2_ = 210;
      }
      else
      {
         _loc2_ = 456;
      }
      this.scr.targetRect._height = _loc2_ + 30;
      this.scr._height = _loc2_;
      this.scr.__set__height(_loc2_);
      this.scr.__set__position(0);
      this.rePosition();
   }
   function OnGame_QuestTaskInfo_AddQuestInfo($dataList, $taskDataList, $addEffect, $bCheckedLock, $itemList, $bBackUp)
   {
      var _loc9_ = new g4.view.questTaskInfo.data.QuestTaskData();
      _loc9_.setData($dataList);
      var _loc8_ = _loc9_.questId;
      var _loc7_ = this._aItems_active.length;
      var _loc6_ = -1;
      var _loc5_ = undefined;
      var _loc3_ = 0;
      while(_loc3_ < _loc7_)
      {
         var _loc4_ = (g4.view.questTaskInfo.QuestItem)this._aItems_active[_loc3_];
         if(_loc4_.questId == _loc8_)
         {
            _loc6_ = _loc3_;
            _loc5_ = _loc4_;
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(_loc6_ == -1)
      {
         _loc5_ = this.getItem();
      }
      _loc5_.setData(_loc9_);
      _loc5_.setTask($taskDataList);
      _loc5_.setItem($itemList,$bBackUp);
      _loc5_.setUIMode(_global.gbUIMode);
      _loc5_.checkBackground();
   }
   function OnGame_QuestTaskInfo_UpdateQuestInfo($dataList, $taskDataList, $updateEffect, $itemList, $bBackUp)
   {
      var _loc10_ = new g4.view.questTaskInfo.data.QuestTaskData();
      _loc10_.setData($dataList);
      var _loc8_ = _loc10_.questId;
      var _loc7_ = this._aItems_active.length;
      var _loc5_ = -1;
      var _loc3_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < _loc7_)
      {
         var _loc4_ = (g4.view.questTaskInfo.QuestItem)this._aItems_active[_loc2_];
         if(_loc4_.questId == _loc8_)
         {
            _loc5_ = _loc2_;
            _loc3_ = _loc4_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc5_ != -1)
      {
         var _loc6_ = -1;
         _loc2_ = 0;
         while(_loc2_ < this._temp_active.length)
         {
            if((g4.view.questTaskInfo.QuestTempItem)this._temp_active[_loc2_].questID == _loc3_.questId)
            {
               _loc6_ = _loc2_;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc6_ == -1)
         {
            if(_loc3_.getData().questStep != _loc10_.questStep)
            {
               var _loc9_ = this.getTempItem();
               _loc9_.setData(_loc3_.getData());
               _loc9_.setTask(_loc3_.getTask());
               _loc9_.setItem(_loc3_.getItemList(),_loc3_.getBackUp());
               _loc9_._y = this.addPoint._y + _loc3_._y;
               _loc9_.moveIn();
               _loc3_.setAddEffect(false);
            }
         }
         _loc3_.setData(_loc10_);
         _loc3_.setTask($taskDataList);
         _loc3_.setItem($itemList,$bBackUp);
         _loc3_.checkBackground();
      }
   }
   function OnGame_QuestTaskInfo_RemoveQuestInfo($questID, $questType)
   {
      $questID = $questID.split("`")[0];
      var _loc5_ = this._aItems_active.length;
      var _loc4_ = -1;
      var _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         if((g4.view.questTaskInfo.QuestItem)this._aItems_active[_loc2_].getData().questId == $questID || (g4.view.questTaskInfo.QuestItem)this._aItems_active[_loc2_].getData().paramId == $questID)
         {
            _loc4_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc4_ != -1)
      {
         var _loc6_ = (g4.view.questTaskInfo.QuestItem)this._aItems_active.splice(_loc2_,1)[0];
         _loc6_.resetData();
         this._aItems_pool.push(_loc6_);
         this.rePosition();
      }
   }
   function OnGame_QuestTaskInfo_Clear()
   {
      while(this._aItems_active.length > 0)
      {
         var _loc2_ = (g4.view.questTaskInfo.QuestItem)this._aItems_active.pop();
         _loc2_.__set__visible(false);
         this._aItems_pool.push(_loc2_);
      }
   }
   function OnGame_QuestTaskInfo_SetQuestComplete($questID, $bComplete)
   {
      $questID = $questID.split("`")[0];
      var _loc4_ = this._aItems_active.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = (g4.view.questTaskInfo.QuestItem)this._aItems_active[_loc2_];
         if(_loc3_.questId == $questID)
         {
            _loc3_.setQuestComplete($bComplete == 1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function OnGame_QuestTaskInfo_UpdateTimerString($questID, $newTimeString)
   {
      $questID = $questID.split("`")[0];
      var _loc4_ = this._aItems_active.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = (g4.view.questTaskInfo.QuestItem)this._aItems_active[_loc2_];
         if(_loc3_.questId == $questID)
         {
            _loc3_.setQuestTime($newTimeString);
            this.rePosition();
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function OnGame_QuestTaskInfo_FoldQuest($listData)
   {
      var _loc6_ = lib.util.ExtString.split($listData,"\n");
      var _loc7_ = _loc6_.length;
      var _loc5_ = this._aItems_active.length;
      var _loc4_ = 0;
      while(_loc4_ < _loc7_)
      {
         var _loc3_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
         var _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            if((g4.view.questTaskInfo.QuestItem)this._aItems_active[_loc2_].getData().paramId == _loc3_[0])
            {
               (g4.view.questTaskInfo.QuestItem)this._aItems_active[_loc2_].setFold(_loc3_[1] == 1);
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc4_ = _loc4_ + 1;
      }
      clearInterval(this.repositionInterval);
      this.repositionInterval = setInterval(this,"repositionTick",50);
   }
   function repositionTick()
   {
      clearInterval(this.repositionInterval);
      this.rePosition();
   }
   function ToGame_QuestTaskInfo_ClickDialogBtn($questId)
   {
      getURL("FSCommand:ToGame_QuestTaskInfo_ClickDialogBtn",$questId);
   }
   function ToGame_QuestTaskInfo_RemoveQuestInfo($questId, $bMissionQuest)
   {
      getURL("FSCommand:ToGame_QuestTaskInfo_RemoveQuestInfo",$questId + "\t" + $bMissionQuest);
   }
   function ToGame_QuestTaskInfo_BackUpItem($questId)
   {
      getURL("FSCommand:ToGame_QuestTaskInfo_BackUpItem",$questId);
   }
   function ToGame_QuestTaskInfo_ClickItem($itemId)
   {
      getURL("FSCommand:ToGame_QuestTaskInfo_ClickItem",$itemId);
   }
   function ToGame_QuestTaskInfo_RequestSparkleImage($questId, $bMarker)
   {
      getURL("FSCommand:ToGame_QuestTaskInfo_RequestSparkleImage",$questId + "\t" + $bMarker);
   }
   function ToGame_QuestTaskInfo_Init()
   {
      fscommand("ToGame_QuestTaskInfo_Init");
   }
   function ToGame_QuestTaskInfo_Fold(event)
   {
      getURL("FSCommand:ToGame_QuestTaskInfo_Fold",event.questId + "\t" + event.fold);
   }
   function OnGame_QuestTaskInfo_UpdatePartyMemberTask($partyName, $questId, $questStep, $dataList)
   {
   }
   function OnGame_QuestTaskInfo_RemovePartyMemberTask($partyName, $questId, $notUpdate)
   {
   }
   function OnGame_QuestTaskInfo_ClearPartyMemberTask($partyName)
   {
   }
}
