class lib.gamedata.SkillCollection_MySkills extends lib.gamedata.GameDataCollectionImpl
{
   static var _this = null;
   function SkillCollection_MySkills()
   {
      super();
   }
   static function getInstance()
   {
      if(lib.gamedata.SkillCollection_MySkills._this == null)
      {
         lib.gamedata.SkillCollection_MySkills._this = new lib.gamedata.SkillCollection_MySkills();
         lib.gamedata.SkillCollection_MySkills._this.createOnGameListener(lib.gamedata.SkillCollection_MySkills._this);
      }
      return lib.gamedata.SkillCollection_MySkills._this;
   }
   function updateData(data)
   {
      this.dispatchEvent({type:gfx.events.EventTypes.UPDATE,id:data.getId(),target:data,data:data});
   }
   function coolTimeHandler(event)
   {
      this.dispatchEvent({type:event.type,target:event.target,id:event.getId(),data:event.target});
   }
   function createOnGameListener(collection)
   {
      this.myListener = new Object();
      _global.EventBroadCaster.addListener(this.myListener);
      this.myListener.OnGame_RegisterSkillData = function(dataList)
      {
         var _loc10_ = dataList.split("\n");
         var _loc16_ = _loc10_[_loc10_.length - 1];
         if(_loc16_ == undefined || _loc16_ == "")
         {
            _loc10_.pop();
         }
         var _loc4_ = 0;
         while(_loc4_ < _loc10_.length)
         {
            var _loc1_ = _loc10_[_loc4_].split("\t");
            var _loc5_ = _loc1_[_loc1_.length - 1];
            if(_loc5_ == undefined || _loc5_ == "")
            {
               _loc1_.pop();
            }
            var _loc14_ = Number(_loc1_[1]);
            var _loc13_ = _loc1_[0];
            var _loc15_ = _loc1_[2];
            var _loc11_ = _loc1_[3];
            var _loc8_ = _loc1_[4];
            var _loc6_ = _loc1_[5];
            var _loc12_ = _loc1_[6];
            var _loc3_ = collection.getData(_loc14_);
            var _loc7_ = {id:_loc14_,bActive:_loc13_,img:_loc15_,crestState:_loc12_};
            var _loc2_ = new lib.gamedata.Skill(_loc7_);
            var _loc9_ = _loc3_ == null?false:true;
            if(_loc9_)
            {
               if(!_loc3_.checkEqual(_loc2_))
               {
                  _loc3_.updateData(_loc7_);
                  collection.updateData(_loc2_);
               }
            }
            else
            {
               collection.addData(_loc2_);
               _loc2_.addEventListener(gfx.events.EventTypes.COOLTIME_END,collection,"coolTimeHandler");
               _loc2_.addEventListener(gfx.events.EventTypes.COOLTIME_START,collection,"coolTimeHandler");
               _loc2_.addEventListener(gfx.events.EventTypes.COOLTIME_TICK,collection,"coolTimeHandler");
               _loc2_.addEventListener(gfx.events.EventTypes.COOLTIME_UPDATE,collection,"coolTimeHandler");
               if(Number(_loc8_) > 0 && Number(_loc6_) > 0)
               {
                  _loc2_.setCoolTime(_loc8_,_loc6_);
               }
            }
            _loc4_ = _loc4_ + 1;
         }
      };
      this.myListener.OnGameEvent_ShortCutSkillCoolTime = function(SkillId, RemainTime, TotalTime)
      {
         var _loc1_ = collection.getData(SkillId);
         _loc1_.setCoolTime(RemainTime,TotalTime);
      };
   }
}
