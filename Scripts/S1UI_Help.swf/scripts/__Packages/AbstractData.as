class AbstractData
{
   static var ListBtnData = new Array();
   function AbstractData()
   {
   }
   static function ListBtnDataInput(data1, data2, data3)
   {
      AbstractData.ListBtnData.push({type1:data1,type2:data2,type3:data3});
   }
   static function ListDataInput(types, id, nextbool, prevbool, texts, addargs)
   {
      AbstractData.ListData = new Object();
      AbstractData.ListData.type1 = types;
      AbstractData.ListData.type2 = id;
      AbstractData.ListData.type3 = nextbool;
      AbstractData.ListData.type4 = prevbool;
      AbstractData.ListData.type5 = texts;
      AbstractData.ListData.type6 = addargs;
   }
}
