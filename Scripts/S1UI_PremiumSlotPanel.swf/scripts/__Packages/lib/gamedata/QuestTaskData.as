class lib.gamedata.QuestTaskData implements lib.gamedata.GameData
{
   var id = undefined;
   var paramId = undefined;
   var label = "";
   var timeLimitStr = "";
   var recommendPartyMemberNum = 0;
   var questStep = 0;
   var sameQuestPartyMemberNum = 0;
   var questType = 0;
   var questProgressType = 0;
   var repeatQuestCurNum = 0;
   var repeatQuestTotalNum = 0;
   var bRepeatQuest = 0;
   var bCantProgress = 0;
   var bComplete = 0;
   var bPlayAddEffect = 0;
   var bPlayUpdateEffect = 0;
   var bRemoveAfterAddEffect = 0;
   var taskDataCollection = null;
   var taskDataPartyCollection = null;
   var listIndex = -1;
   var trackingNum = -1;
   var mapName = "";
   var questLevel = 0;
   var areaId = "";
   var itemList = "";
   var bBackUpItem = 0;
   function QuestTaskData(id)
   {
      if(typeof id == "object")
      {
         this.getPropInObject(id);
      }
      else
      {
         this.setId(id);
      }
      this.taskDataCollection = new lib.gamedata.GameDataCollectionImpl();
      this.taskDataPartyCollection = new lib.gamedata.GameDataCollectionImpl();
   }
   function getId()
   {
      return this.id;
   }
   function setId(_id)
   {
      this.id = _id;
   }
   function updateData(dataObject)
   {
      this.getPropInObject(dataObject);
   }
   function getParamId()
   {
      return this.paramId;
   }
   function setParamId(_id)
   {
      this.paramId = _id;
   }
   function getLabel()
   {
      return this.label;
   }
   function setLabel(str)
   {
      this.label = str;
   }
   function getRecommendPartyMemberNum()
   {
      return this.recommendPartyMemberNum;
   }
   function setRecommendPartyMemberNum(num)
   {
      this.recommendPartyMemberNum = num;
   }
   function getStep()
   {
      return this.questStep;
   }
   function setStep(num)
   {
      this.questStep = num;
   }
   function getTimeLimitStr()
   {
      return this.timeLimitStr;
   }
   function setTimeLimitStr(str)
   {
      this.timeLimitStr = str;
   }
   function getSameQuestPartyMemberNum()
   {
      return this.sameQuestPartyMemberNum;
   }
   function setSameQuestPartyMemberNum(num)
   {
      this.sameQuestPartyMemberNum = num;
   }
   function getQuestType()
   {
      return this.questType;
   }
   function setQuestType(type)
   {
      this.questType = type;
   }
   function getQuestProgressType()
   {
      return this.questProgressType;
   }
   function setQuestProgressType(type)
   {
      this.questProgressType = type;
   }
   function getIsRepeatQuest()
   {
      return this.bRepeatQuest;
   }
   function getRepeatCurNum()
   {
      return this.repeatQuestCurNum;
   }
   function setRepeatCurNum(num)
   {
      this.repeatQuestCurNum = num;
   }
   function getRepeatTotalNum()
   {
      return this.repeatQuestTotalNum;
   }
   function setRepeatTotalNum(num)
   {
      this.repeatQuestTotalNum = num;
   }
   function getIsCantProgress()
   {
      return this.bCantProgress;
   }
   function setIsCantProgress(bTrue)
   {
      this.bCantProgress = bTrue;
   }
   function getIsComplete()
   {
      return this.bComplete;
   }
   function setIsComplete(bTrue)
   {
      this.bComplete = bTrue;
   }
   function getIsPlayAddEffect()
   {
      return this.bPlayAddEffect;
   }
   function setIsPlayAddEffect(bTrue)
   {
      this.bPlayAddEffect = bTrue;
   }
   function getIsPlayUpdateEffect()
   {
      return this.bPlayUpdateEffect;
   }
   function setIsPlayUpdateEffect(bTrue)
   {
      this.bPlayUpdateEffect = bTrue;
   }
   function getIsRemoveAfterAddEffect()
   {
      return this.bRemoveAfterAddEffect;
   }
   function setIsRemoveAfterAddEffect(bTrue)
   {
      this.bRemoveAfterAddEffect = bTrue;
   }
   function getListIndex()
   {
      return this.listIndex;
   }
   function setListIndex(_index)
   {
      this.listIndex = _index;
   }
   function getTrackingNum()
   {
      return this.trackingNum;
   }
   function setTrackingNum(num)
   {
      this.trackingNum = num;
   }
   function getMapName()
   {
      return this.mapName;
   }
   function setMapName(_nameStr)
   {
      this.mapName = _nameStr;
   }
   function getQuestLevel()
   {
      return this.questLevel;
   }
   function setQuestLevel(_level)
   {
      this.questLevel = _level;
   }
   function getItemList()
   {
      return this.itemList;
   }
   function setItemList(item)
   {
      this.itemList = item;
   }
   function getIsBackUpItem()
   {
      return this.bBackUpItem;
   }
   function setIsBackUpItem(bBackUp)
   {
      this.bBackUpItem = bBackUp;
   }
   function getTaskDataColl()
   {
      return this.taskDataCollection;
   }
   function getTaskDataPartyColl()
   {
      return this.taskDataPartyCollection;
   }
   function getPropInObject(obj)
   {
      for(var _loc4_ in obj)
      {
         var _loc2_ = obj[_loc4_];
         if(_loc4_ == "id" || _loc4_ == "ID")
         {
            this.setId(_loc2_);
         }
         else if(_loc4_ == "paramId")
         {
            this.setParamId(_loc2_);
         }
         else if(_loc4_ == "label" || _loc4_ == "questName" || _loc4_ == "name")
         {
            this.setLabel(_loc2_);
         }
         else if(_loc4_ == "timeLimit" || _loc4_ == "timer" || _loc4_ == "timeLimitStr")
         {
            this.setTimeLimitStr(_loc2_);
         }
         else if(_loc4_ == "sameQuestPartyMemberNum")
         {
            this.setSameQuestPartyMemberNum(Number(_loc2_));
         }
         else if(_loc4_ == "recommendPartyMemberNum")
         {
            this.setRecommendPartyMemberNum(Number(_loc2_));
         }
         else if(_loc4_ == "questStep" || _loc4_ == "step")
         {
            this.setStep(Number(_loc2_));
         }
         else if(_loc4_ == "questType" || _loc4_ == "type")
         {
            this.setQuestType(Number(_loc2_));
         }
         else if(_loc4_ == "questProgressType" || _loc4_ == "progressType")
         {
            this.setQuestProgressType(Number(_loc2_));
         }
         else if(_loc4_ == "repeatCurNum" || _loc4_ == "repeatQuestCurNum")
         {
            this.setRepeatCurNum(Number(_loc2_));
         }
         else if(_loc4_ == "repeatTotalNum" || _loc4_ == "repeatQuestTotalNum")
         {
            this.setRepeatTotalNum(Number(_loc2_));
         }
         else if(_loc4_ == "bCantProgress" || _loc4_ == "cantProgress")
         {
            this.setIsCantProgress(Number(_loc2_));
         }
         else if(_loc4_ == "bAddEffect" || _loc4_ == "bPlayAddEffect")
         {
            this.setIsPlayAddEffect(Number(_loc2_));
         }
         else if(_loc4_ == "bUpdateEffect" || _loc4_ == "bPlayUpdateEffect")
         {
            this.setIsPlayUpdateEffect(Number(_loc2_));
         }
         else if(_loc4_ == "bRemoveAfterAddEffect")
         {
            this.setIsRemoveAfterAddEffect(Number(_loc2_));
         }
         else if(_loc4_ == "listIndex")
         {
            this.setListIndex(Number(_loc2_));
         }
         else if(_loc4_ == "trackingNum")
         {
            this.setTrackingNum(Number(_loc2_));
         }
         else if(_loc4_ == "mapName")
         {
            this.setMapName(_loc2_);
         }
         else if(_loc4_ == "questLevel")
         {
            this.setQuestLevel(Number(_loc2_));
         }
      }
   }
}
