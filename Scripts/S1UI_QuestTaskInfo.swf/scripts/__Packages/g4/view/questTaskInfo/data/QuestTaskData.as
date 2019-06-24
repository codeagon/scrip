class g4.view.questTaskInfo.data.QuestTaskData
{
   function QuestTaskData()
   {
   }
   function setData($questData)
   {
      var _loc2_ = lib.util.ExtString.split($questData,"\t");
      this.paramId = _loc2_[0];
      if(this.paramId.indexOf("`") != -1)
      {
         this.questId = this.paramId.split("`")[0];
      }
      else if(this.paramId.indexOf("\'") != -1)
      {
         this.questId = this.paramId.split("\'")[0];
      }
      else
      {
         this.questId = this.paramId;
      }
      this.questName = _loc2_[1];
      this.questStep = Number(_loc2_[2]);
      this.questTime = _loc2_[3];
      this.partyNumber = Number(_loc2_[4]);
      this.questType = Number(_loc2_[5]);
      this.repeatCurrent = Number(_loc2_[6]);
      this.repeatMax = Number(_loc2_[7]);
      this.questProgressType = Number(_loc2_[8]);
      this.isFail = Number(_loc2_[9]);
      this.recParty = Number(_loc2_[10]);
      this.listIndex = Number(_loc2_[11]);
      this.trackIndex = Number(_loc2_[12]);
      this.mapName = _loc2_[13];
      this.questLevel = Number(_loc2_[14]);
      if(isNaN(this.questLevel))
      {
         this.questLevel = -1;
      }
   }
}
