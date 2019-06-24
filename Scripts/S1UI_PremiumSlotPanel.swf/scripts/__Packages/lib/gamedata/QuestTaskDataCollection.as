class lib.gamedata.QuestTaskDataCollection extends lib.gamedata.GameDataCollectionImpl
{
   static var _this = null;
   function QuestTaskDataCollection()
   {
      super();
   }
   static function getInstance()
   {
      if(lib.gamedata.QuestTaskDataCollection._this == null)
      {
         lib.gamedata.QuestTaskDataCollection._this = new lib.gamedata.QuestTaskDataCollection();
         lib.gamedata.QuestTaskDataCollection._this.createOnGameListener(lib.gamedata.QuestTaskDataCollection._this);
      }
      return lib.gamedata.QuestTaskDataCollection._this;
   }
   function updateData(data, targetType)
   {
      this.dispatchEvent({type:gfx.events.EventTypes.UPDATE,id:data.getId(),target:data,data:data,targetType:targetType});
   }
   function processUpdateData(info, addEffect, updateEffect, bRemoveAfterAddEffect)
   {
      var _loc12_ = info[0];
      var _loc24_ = info[1];
      var _loc21_ = info[2];
      var _loc18_ = info[3];
      var _loc20_ = Number(info[4]);
      var _loc16_ = Number(info[5]);
      var _loc10_ = Number(info[6]);
      var _loc8_ = Number(info[7]);
      var _loc13_ = Number(info[8]);
      var _loc22_ = Number(info[9]);
      var _loc19_ = Number(info[10]);
      var _loc17_ = Number(info[11]);
      var _loc14_ = Number(info[12]);
      var _loc11_ = info[13];
      var _loc15_ = Number(info[14]);
      var _loc4_ = this.getData(_loc12_);
      var _loc3_ = {id:_loc12_,questName:_loc24_,step:_loc21_,timeLimitStr:_loc18_,sameQuestPartyMemberNum:_loc20_,questType:_loc16_,repeatCurNum:_loc10_,repeatTotalNum:_loc8_,questProgressType:_loc13_,bCantProgress:_loc22_,recommendPartyMemberNum:_loc19_,listIndex:_loc17_,trackingNum:_loc14_,mapName:_loc11_,questLevel:_loc15_};
      _loc3_.bAddEffect = addEffect != undefined?Number(addEffect):0;
      _loc3_.updateEffect = updateEffect != undefined?Number(updateEffect):0;
      _loc3_.bRemoveAfterAddEffect = bRemoveAfterAddEffect != undefined?Number(bRemoveAfterAddEffect):_loc4_.getIsRemoveAfterAddEffect();
      var _loc5_ = new lib.gamedata.QuestTaskData(_loc3_);
      var _loc6_ = _loc4_ == null?false:true;
      if(_loc6_)
      {
         _loc4_.updateData(_loc3_);
      }
      else
      {
         this.addData(_loc5_);
      }
      this.updateData(_loc5_,"quest");
   }
   function processUpdateTaskData(questId, index, info)
   {
      var _loc2_ = this.getData(questId);
      var _loc7_ = _loc2_.getTaskDataColl();
      var _loc10_ = index;
      var _loc11_ = info[0];
      var _loc15_ = Number(info[1]);
      var _loc14_ = Number(info[2]);
      var _loc12_ = Number(info[3]);
      var _loc9_ = "";
      var _loc13_ = _loc2_.getStep();
      var _loc4_ = _loc7_.getData(_loc10_);
      var _loc5_ = {id:_loc10_,label:_loc11_,curNum:_loc15_,totalNum:_loc14_,bFailed:_loc12_,performerName:_loc9_,step:_loc13_};
      var _loc6_ = new lib.gamedata.QuestTaskSubData(_loc5_);
      _loc6_.setParent(_loc2_);
      var _loc8_ = _loc4_ == null?false:true;
      if(_loc8_)
      {
         _loc4_.updateData(_loc5_);
      }
      else
      {
         _loc7_.addData(_loc6_);
      }
      this.updateData(_loc2_,"task");
   }
   function processUpdateItemData(questId, itemList, bBackUp)
   {
      var _loc2_ = this.getData(questId);
      _loc2_.setItemList(itemList);
      _loc2_.setIsBackUpItem(Number(bBackUp));
      this.updateData(_loc2_,"item");
   }
   function processUpdatePartyTaskData(questId, index, info)
   {
      var _loc3_ = this.getData(questId);
      var _loc5_ = _loc3_.getTaskDataPartyColl();
      var _loc10_ = index;
      var _loc9_ = info[0];
      var _loc12_ = Number(info[1]);
      var _loc11_ = info[2];
      var _loc15_ = Number(info[3]);
      var _loc14_ = Number(info[4]);
      var _loc13_ = Number(info[5]);
      var _loc4_ = _loc5_.getData(_loc10_);
      var _loc6_ = {id:_loc10_,label:_loc11_,curNum:_loc15_,totalNum:_loc14_,bFailed:_loc13_,performerName:_loc9_,step:_loc12_};
      var _loc7_ = new lib.gamedata.QuestTaskSubData(_loc6_);
      _loc7_.setParent(_loc3_);
      var _loc8_ = _loc4_ == null?false:true;
      if(_loc8_)
      {
         _loc4_.updateData(_loc6_);
      }
      else
      {
         _loc5_.addData(_loc7_);
      }
      this.updateData(_loc3_,"partyTask");
   }
   function createOnGameListener(collection)
   {
      this.myListener = new Object();
      _global.EventBroadCaster.addListener(this.myListener);
      this.myListener.OnGame_QuestTaskInfo_AddQuestInfo = function(dataList, taskDataList, addEffect, bCheckedLock, itemList, bBackUp)
      {
         var _loc3_ = undefined;
         var _loc4_ = lib.util.ExtString.split(dataList,"\n");
         var _loc1_ = 0;
         while(_loc1_ < _loc4_.length)
         {
            var _loc2_ = lib.util.ExtString.split(_loc4_[_loc1_],"\t");
            _loc3_ = _loc2_[0];
            collection.processUpdateData(_loc2_,addEffect,undefined,bCheckedLock);
            _loc1_ = _loc1_ + 1;
         }
         var _loc6_ = lib.util.ExtString.split(taskDataList,"\n");
         var _loc5_ = _loc6_.length;
         var _loc10_ = collection.getData(_loc3_);
         var _loc9_ = _loc10_.getTaskDataColl();
         if(_loc9_.getLength() > _loc5_)
         {
            _loc9_.clear();
         }
         _loc1_ = 0;
         while(_loc1_ < _loc5_)
         {
            _loc2_ = lib.util.ExtString.split(_loc6_[_loc1_],"\t");
            collection.processUpdateTaskData(_loc3_,_loc1_,_loc2_);
            _loc1_ = _loc1_ + 1;
         }
         collection.processUpdateItemData(_loc3_,itemList,bBackUp);
      };
      this.myListener.OnGame_QuestTaskInfo_UpdateQuestInfo = function(dataList, taskDataList, updateEffect, itemList, bBackUp)
      {
         var _loc3_ = undefined;
         var _loc4_ = lib.util.ExtString.split(dataList,"\n");
         var _loc1_ = 0;
         while(_loc1_ < _loc4_.length)
         {
            var _loc2_ = lib.util.ExtString.split(_loc4_[_loc1_],"\t");
            _loc3_ = _loc2_[0];
            collection.processUpdateData(_loc2_,undefined,updateEffect);
            _loc1_ = _loc1_ + 1;
         }
         var _loc6_ = lib.util.ExtString.split(taskDataList,"\n");
         var _loc5_ = _loc6_.length;
         var _loc9_ = collection.getData(_loc3_);
         var _loc8_ = _loc9_.getTaskDataColl();
         if(_loc8_.getLength() > _loc5_)
         {
            _loc8_.clear();
         }
         _loc1_ = 0;
         while(_loc1_ < _loc5_)
         {
            _loc2_ = lib.util.ExtString.split(_loc6_[_loc1_],"\t");
            collection.processUpdateTaskData(_loc3_,_loc1_,_loc2_);
            _loc1_ = _loc1_ + 1;
         }
         collection.processUpdateItemData(_loc3_,itemList,bBackUp);
      };
      this.myListener.OnGame_QuestTaskInfo_RemoveQuestInfo = function(questId, questType)
      {
         var _loc1_ = collection.getData(questId);
         collection.removeData(questId);
      };
      this.myListener.OnGame_QuestTaskInfo_Clear = function()
      {
         collection.clear();
      };
      this.myListener.OnGame_QuestTaskInfo_SetQuestComplete = function(questId, bComplete)
      {
         bComplete = Number(bComplete);
         if(isNaN(bComplete))
         {
            bComplete = 1;
         }
         var _loc2_ = collection.getData(questId);
         _loc2_.setIsComplete(bComplete);
         collection.updateData(_loc2_,"quest");
      };
      this.myListener.OnGame_QuestTaskInfo_UpdateTaskProgress = function(questId, nIndex, nCurCount, nTotalCount)
      {
         var _loc1_ = collection.getData(questId);
         var _loc3_ = _loc1_.getTaskDataColl();
         var _loc2_ = _loc3_.getData(Number(nIndex));
         _loc2_.setCurNum(nCurCount);
         _loc2_.setTotalNum(nTotalCount);
         collection.updateData(_loc1_,"task");
      };
      this.myListener.OnGame_QuestTaskInfo_UpdateTimerString = function(questId, newTimerString)
      {
         var _loc1_ = collection.getData(questId);
         _loc1_.setTimeLimitStr(newTimerString);
         collection.updateData(_loc1_,"quest");
      };
      this.myListener.OnGame_QuestTaskInfo_UpdatePartyTask = function(questId, dataList)
      {
         var _loc3_ = lib.util.ExtString.split(dataList,"\n");
         var _loc1_ = 0;
         while(_loc1_ < _loc3_.length)
         {
            var _loc2_ = lib.util.ExtString.split(_loc3_[_loc1_],"\t");
            collection.processUpdatePartyTaskData(questId,_loc1_,_loc2_);
            _loc1_ = _loc1_ + 1;
         }
      };
      this.myListener.OnGame_QuestTaskInfo_UpdatePartyTaskProgress = function(questId, nIndex, nCurCount, nTotalCount)
      {
         var _loc2_ = collection.getData(questId);
         var _loc3_ = _loc2_.getTaskDataPartyColl();
         var _loc1_ = _loc3_.getData(Number(nIndex));
         _loc1_.setCurNum(nCurCount);
         _loc1_.setTotalNum(nTotalCount);
         collection.updateData(_loc2_,"partyTask");
      };
      this.myListener.OnGame_QuestTaskInfo_UpdatePartyMemberTask = function(partyMemberName, questId, questStep, dataList)
      {
         this.OnGame_QuestTaskInfo_RemovePartyMemberTask(partyMemberName,questId,true);
         var _loc9_ = collection.getData(questId);
         if(_loc9_ == null)
         {
            return undefined;
         }
         var _loc4_ = _loc9_.getTaskDataPartyColl();
         var _loc5_ = lib.util.ExtString.split(dataList,"\n");
         var _loc2_ = 0;
         while(_loc2_ < _loc5_.length)
         {
            var _loc3_ = lib.util.ExtString.split(_loc5_[_loc2_],"\t");
            _loc3_.unshift(questStep);
            _loc3_.unshift(partyMemberName);
            collection.processUpdatePartyTaskData(questId,_loc4_.getLength() != 0?_loc4_.getLength():_loc2_,_loc3_);
            _loc2_ = _loc2_ + 1;
         }
      };
      this.myListener.OnGame_QuestTaskInfo_RemovePartyMemberTask = function(partyMemberName, questId, doNotUpdate)
      {
         var _loc8_ = collection.getData(questId);
         if(_loc8_ == null)
         {
            return undefined;
         }
         var _loc4_ = _loc8_.getTaskDataPartyColl();
         var _loc3_ = new Array();
         var _loc6_ = _loc4_.getIterator();
         while(_loc6_.hasNext())
         {
            var _loc2_ = _loc6_.next();
            if(_loc2_.getPerformerName() == partyMemberName)
            {
               _loc3_.push(_loc2_.getId());
            }
         }
         _loc3_.sort();
         var _loc1_ = _loc3_.length - 1;
         while(_loc1_ >= 0)
         {
            _loc4_.removeData(_loc3_[_loc1_]);
            _loc1_ = _loc1_ - 1;
         }
         _loc1_ = 0;
         while(_loc1_ <= _loc4_.getLength())
         {
            var _loc5_ = _loc4_.getDataAt(_loc1_);
            _loc5_.setId(_loc1_);
            _loc1_ = _loc1_ + 1;
         }
         if(doNotUpdate)
         {
            return undefined;
         }
         collection.updateData(_loc8_,"partyTask");
      };
      this.myListener.OnGame_QuestTaskInfo_ClearPartyMemberTask = function(partyMemberName)
      {
         var _loc3_ = collection.getIterator();
         while(_loc3_.hasNext())
         {
            var _loc2_ = _loc3_.next();
            this.OnGame_QuestTaskInfo_RemovePartyMemberTask(partyMemberName,_loc2_.getId());
         }
      };
      this.myListener.OnGame_QuestTaskInfo_ClearPartyTask = function(questId)
      {
         var _loc1_ = collection.getData(questId);
         var _loc2_ = _loc1_.getTaskDataPartyColl();
         _loc2_.clear();
         collection.updateData(_loc1_,"partyTask");
      };
   }
}
