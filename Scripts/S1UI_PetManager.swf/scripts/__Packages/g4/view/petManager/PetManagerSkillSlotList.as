class g4.view.petManager.PetManagerSkillSlotList extends g4.core.SimpleView
{
   function PetManagerSkillSlotList(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function configUI()
   {
      this.skillSlotArray = [];
      var _loc3_ = undefined;
      var _loc4_ = g4.view.petManager.PetManagerConstants.SKILL_SLOT_COUNT;
      _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this.__get__targetMovieClip()["PetManager__" + _loc3_];
         _loc2_.draw("init");
         _loc2_.index = _loc3_;
         _loc2_.coolTimeMask._visible = false;
         _loc2_.FX_DISABLE._visible = false;
         _loc2_.Slot.disableSlot = true;
         _loc2_.SLOT.enabled = false;
         _loc2_.remain = _loc2_.total = 0;
         _loc2_.FX_ACTIVE.gotoAndStop(1);
         this.skillSlotArray.push(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
   }
   function clearCoolTime()
   {
      var _loc3_ = undefined;
      var _loc4_ = g4.view.petManager.PetManagerConstants.SKILL_SLOT_COUNT;
      _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this.getSkillSlotAt(_loc3_);
         _loc2_.Slot.cool.remove();
         _loc2_.Slot.CoolTime.clear();
         delete _loc2_.Slot.cool;
         _loc3_ = _loc3_ + 1;
      }
   }
   function getSkillSlotAt(index)
   {
      if(index < 0 || index > g4.view.petManager.PetManagerConstants.SKILL_SLOT_COUNT - 1)
      {
         return null;
      }
      return this.skillSlotArray[index];
   }
}
