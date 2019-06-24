class g4.view.abnormality.BuffDataManager
{
   function BuffDataManager()
   {
      super();
      this.groupIDArray = [];
      this.groupArray = [];
      this.groupMap = {};
      this.removedBuffIDs = [];
      this.createGroup(g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_NONE);
      this.createGroup(g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_OTHER);
      this.createGroup(g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_BATTLE_CONSUMABLE);
      this.createGroup(g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_SKILL_AND_GLYPH);
      this.createGroup(g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_DEBUFF);
   }
   function createGroup(groupID)
   {
      var _loc2_ = new g4.view.abnormality.BuffDataGroup();
      this.groupIDArray.push(groupID);
      this.groupArray.push(_loc2_);
      this.groupMap[groupID] = _loc2_;
   }
   function getBuffDatas()
   {
      var _loc5_ = [];
      var _loc4_ = undefined;
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc6_ = this.groupIDArray.length;
      _loc3_ = 0;
      while(_loc3_ < _loc6_)
      {
         _loc2_ = this.groupIDArray[_loc3_];
         if(_loc2_ != g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_DEBUFF)
         {
            if(!g4.view.abnormality.AbnormalityUtil.getOptionValueByGroupID(_loc2_))
            {
               _loc4_ = this.getAllBuffDatasByGroupID(_loc2_);
               if(_loc4_ != null && _loc4_.length > 0)
               {
                  _loc5_ = _loc5_.concat(_loc4_);
               }
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc5_.length != 0?_loc5_:null;
   }
   function getDebuffDatas()
   {
      return this.getAllBuffDatasByGroupID(g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_DEBUFF);
   }
   function getAllBuffDatasByGroupID(groupID)
   {
      var _loc2_ = this.getGroup(groupID);
      if(_loc2_ == null)
      {
         return null;
      }
      if(!_loc2_.hasData())
      {
         return null;
      }
      return _loc2_.getAllBuffDatas();
   }
   function getRemovedBuffIDs()
   {
      var _loc2_ = this.removedBuffIDs;
      this.removedBuffIDs = [];
      return _loc2_;
   }
   function getGroup(groupID)
   {
      return this.groupMap[groupID];
   }
   function hasData(groupID)
   {
      var _loc2_ = this.getGroup(groupID);
      if(_loc2_ == null)
      {
         return false;
      }
      return _loc2_.hasData();
   }
   function getActualGroup(type, groupID)
   {
      if(this.isBuff(type))
      {
         return this.groupMap[groupID];
      }
      return this.groupMap[g4.view.abnormality.AbnormalityConstants.BUFF_GROUP_ID_DEBUFF];
   }
   function isBuff(type)
   {
      return type == 0;
   }
   function addBuff(id, stackCnt, type, group, bRelaxMerit, img, remain, total, currentTime)
   {
      var _loc2_ = this.getActualGroup(type,group);
      _loc2_.addBuff(id,stackCnt,type,group,bRelaxMerit,img,remain,total,currentTime);
   }
   function updateBuff(id, group, stackCnt, useRelaxMerit, img, remain, total, currentTime)
   {
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = this.groupArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = (g4.view.abnormality.BuffDataGroup)this.groupArray[_loc2_].updateBuff(id,group,stackCnt,useRelaxMerit,img,remain,total,currentTime);
         if(_loc3_)
         {
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function removeBuff(id)
   {
      var _loc2_ = undefined;
      var _loc4_ = this.groupArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         if((g4.view.abnormality.BuffDataGroup)this.groupArray[_loc2_].removeBuff(id))
         {
            this.removedBuffIDs.push(id);
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function clearAllBuffs()
   {
      var _loc2_ = undefined;
      var _loc3_ = this.groupArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (g4.view.abnormality.BuffDataGroup)this.groupArray[_loc2_].clearAllBuffs();
         _loc2_ = _loc2_ + 1;
      }
   }
   function setTimePause(id, bPause)
   {
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc4_ = this.groupArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         _loc3_ = (g4.view.abnormality.BuffDataGroup)this.groupArray[_loc2_].setTimePause(id,bPause);
         if(_loc3_)
         {
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
}
