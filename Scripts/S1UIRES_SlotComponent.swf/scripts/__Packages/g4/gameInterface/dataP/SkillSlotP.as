class g4.gameInterface.dataP.SkillSlotP extends g4.gameInterface.dataP.BasicDataP
{
   var Index = -1;
   var Id = "";
   var Name = "";
   var Img = "";
   var Disable = false;
   var State = -1;
   var Num = -1;
   var Remain = -1;
   var Total = -1;
   var Awaken = false;
   var Level = -1;
   var SkillType = -1;
   function SkillSlotP(data)
   {
      super();
      this.variableNameList = ["Index","Id","Name","Img","Disable","State","Num","Remain","Total","Awaken","Level"];
   }
   static function teraParse(data)
   {
      var _loc1_ = new g4.gameInterface.dataP.SkillSlotP();
      g4.gameInterface.dataP.BasicDataP.teraParse(_loc1_,data);
      return _loc1_;
   }
}
