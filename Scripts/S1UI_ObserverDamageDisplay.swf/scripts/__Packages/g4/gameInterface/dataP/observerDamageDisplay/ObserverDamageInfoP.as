class g4.gameInterface.dataP.observerDamageDisplay.ObserverDamageInfoP extends g4.gameInterface.dataP.BasicDataP
{
   var ClassId = "";
   var CharacterName = "";
   var Damage = "";
   function ObserverDamageInfoP(data)
   {
      super();
      this.variableNameList = ["ClassId","CharacterName","Damage"];
   }
   static function teraParse(data)
   {
      var _loc1_ = new g4.gameInterface.dataP.observerDamageDisplay.ObserverDamageInfoP();
      g4.gameInterface.dataP.BasicDataP.teraParse(_loc1_,data);
      return _loc1_;
   }
}
