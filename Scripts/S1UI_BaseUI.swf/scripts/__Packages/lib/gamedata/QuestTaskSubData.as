class lib.gamedata.QuestTaskSubData implements lib.gamedata.GameData
{
   var id = undefined;
   var label = "";
   var curNum = 0;
   var totalNum = 0;
   var bFailed = 0;
   var performerName = "";
   var questStep = 0;
   function QuestTaskSubData(id)
   {
      if(typeof id == "object")
      {
         this.getPropInObject(id);
      }
      else
      {
         this.setId(id);
      }
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
   function getParent()
   {
      return this.parentData;
   }
   function setParent(_parentData)
   {
      this.parentData = _parentData;
   }
   function getLabel()
   {
      return this.label;
   }
   function setLabel(str)
   {
      this.label = str;
   }
   function getCurNum()
   {
      return this.curNum;
   }
   function setCurNum(num)
   {
      this.curNum = num;
   }
   function getTotalNum()
   {
      return this.totalNum;
   }
   function setTotalNum(num)
   {
      this.totalNum = num;
   }
   function getFailed()
   {
      return this.bFailed;
   }
   function setFailed(bTrue)
   {
      this.bFailed = bTrue;
   }
   function getPerformerName()
   {
      return this.performerName;
   }
   function setPerformerName(str)
   {
      this.performerName = str;
   }
   function getStep()
   {
      return this.questStep;
   }
   function setStep(num)
   {
      this.questStep = num;
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
         else if(_loc4_ == "label" || _loc4_ == "taskName" || _loc4_ == "name")
         {
            this.setLabel(_loc2_);
         }
         else if(_loc4_ == "curNum")
         {
            this.setCurNum(Number(_loc2_));
         }
         else if(_loc4_ == "totalNum")
         {
            this.setTotalNum(Number(_loc2_));
         }
         else if(_loc4_ == "bFailed" || _loc4_ == "failed")
         {
            this.setFailed(Number(_loc2_));
         }
         else if(_loc4_ == "performerName" || _loc4_ == "partyMemberName")
         {
            this.setPerformerName(_loc2_);
         }
         else if(_loc4_ == "step" || _loc4_ == "questStep")
         {
            this.setStep(Number(_loc2_));
         }
      }
   }
}
