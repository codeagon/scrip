class g4.view.party.BuffDataManager
{
   function BuffDataManager()
   {
      super();
      this.groupIDArray = [];
      this.groupArray = [];
      this.groupMap = {};
      this.removedBuffIDs = [];
      this.createGroup(g4.view.party.PartyConstants.BUFF_GROUP_ID_NONE);
      this.createGroup(g4.view.party.PartyConstants.BUFF_GROUP_ID_OTHER);
      this.createGroup(g4.view.party.PartyConstants.BUFF_GROUP_ID_BATTLE_CONSUMABLE);
      this.createGroup(g4.view.party.PartyConstants.BUFF_GROUP_ID_SKILL_AND_GLYPH);
      this.createGroup(g4.view.party.PartyConstants.BUFF_GROUP_ID_DEBUFF);
   }
   function createGroup(groupID)
   {
      var _loc2_ = new g4.view.party.BuffDataGroup();
      this.groupIDArray.push(groupID);
      this.groupArray.push(_loc2_);
      this.groupMap[groupID] = _loc2_;
   }
   function getBuffDatasShowAllMode()
   {
      var _loc5_ = [];
      var _loc3_ = undefined;
      var _loc4_ = undefined;
      var _loc2_ = undefined;
      var _loc6_ = this.groupIDArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         _loc4_ = this.groupIDArray[_loc2_];
         if(!g4.view.party.PartyUtil.getOptionValueByGroupID(_loc4_))
         {
            _loc3_ = this.getAllBuffDatasByGroupID(_loc4_);
            if(_loc3_ != null && _loc3_.length > 0)
            {
               _loc5_ = _loc5_.concat(_loc3_);
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc5_.length != 0?_loc5_:null;
   }
   function getBuffDatasImportantMode()
   {
      var _loc9_ = this.getBuffDataCount(g4.view.party.PartyConstants.BUFF_GROUP_ID_DEBUFF,g4.view.party.PartyConstants.SHOW_IMPORTANT_MODE_BUFF_COUNT);
      var _loc6_ = _loc9_ != null?_loc9_.length:0;
      if(_loc6_ >= g4.view.party.PartyConstants.SHOW_IMPORTANT_MODE_BUFF_COUNT)
      {
         return _loc9_;
      }
      var _loc7_ = [g4.view.party.PartyConstants.BUFF_GROUP_ID_NONE,g4.view.party.PartyConstants.BUFF_GROUP_ID_OTHER,g4.view.party.PartyConstants.BUFF_GROUP_ID_BATTLE_CONSUMABLE,g4.view.party.PartyConstants.BUFF_GROUP_ID_SKILL_AND_GLYPH];
      var _loc2_ = [];
      var _loc4_ = undefined;
      var _loc5_ = g4.view.party.PartyConstants.SHOW_IMPORTANT_MODE_BUFF_COUNT - _loc6_;
      var _loc3_ = undefined;
      var _loc8_ = _loc7_.length;
      _loc3_ = 0;
      while(_loc3_ < _loc8_)
      {
         _loc4_ = this.getBuffDataCount(_loc7_[_loc3_],_loc5_);
         if(_loc4_ != null && _loc4_.length > 0)
         {
            _loc2_ = _loc2_.concat(_loc4_);
         }
         if(_loc2_.length >= _loc5_)
         {
            break;
         }
         _loc5_ = g4.view.party.PartyConstants.SHOW_IMPORTANT_MODE_BUFF_COUNT - (_loc6_ + _loc2_.length);
         _loc3_ = _loc3_ + 1;
      }
      if(_loc2_.length > 0 && _loc6_ > 0)
      {
         return _loc2_.concat(_loc9_);
      }
      if(_loc6_ > 0)
      {
         return _loc9_;
      }
      if(_loc2_.length > 0)
      {
         return _loc2_;
      }
      return null;
   }
   function getBuffDataCount(groupID, count)
   {
      var _loc2_ = this.getGroup(groupID);
      if(_loc2_ == null)
      {
         return undefined;
      }
      if(!_loc2_.hasData())
      {
         return undefined;
      }
      return _loc2_.getBuffDatasCount(count);
   }
   function getAllBuffDatas()
   {
      var _loc4_ = [];
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc5_ = this.groupIDArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc3_ = this.getAllBuffDatasByGroupID(this.groupIDArray[_loc2_]);
         if(_loc3_ != null && _loc3_.length > 0)
         {
            _loc4_ = _loc4_.concat(_loc3_);
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc4_.length > 0)
      {
         return _loc4_;
      }
      return null;
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
      return this.groupMap[g4.view.party.PartyConstants.BUFF_GROUP_ID_DEBUFF];
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
   function removeBuff(id)
   {
      var _loc2_ = undefined;
      var _loc4_ = this.groupArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         if((g4.view.party.BuffDataGroup)this.groupArray[_loc2_].removeBuff(id))
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
         (g4.view.party.BuffDataGroup)this.groupArray[_loc2_].clearAllBuffs();
         _loc2_ = _loc2_ + 1;
      }
   }
   function setTimePause(id, bPause)
   {
      var _loc2_ = undefined;
      var _loc3_ = this.groupArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         if((g4.view.party.BuffDataGroup)this.groupArray[_loc2_].setTimePause(id,bPause))
         {
            return undefined;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
}
