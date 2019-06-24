class g4.gameInterface.dataP.ItemSlotP extends g4.gameInterface.dataP.BasicDataP
{
   var Index = -1;
   var Id = "";
   var IconPath = "";
   var Amount = -1;
   var StateType = -1;
   var Grade = -1;
   var New = false;
   var SealType = -1;
   var Master = -1;
   var Enchant = -1;
   var Durability = -1;
   function ItemSlotP(data)
   {
      super();
      this.variableNameList = ["Index","Id","IconPath","Amount","StateType","Grade","New","SealType","Master","Enchant","Durability"];
   }
   static function teraParse(data)
   {
      var _loc1_ = new g4.gameInterface.dataP.ItemSlotP();
      g4.gameInterface.dataP.BasicDataP.teraParse(_loc1_,data);
      return data != null?_loc1_:null;
   }
}
