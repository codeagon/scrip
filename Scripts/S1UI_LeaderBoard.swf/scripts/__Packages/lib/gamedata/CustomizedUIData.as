class lib.gamedata.CustomizedUIData implements lib.gamedata.GameData
{
   var key = undefined;
   var value = null;
   function CustomizedUIData(key, value)
   {
      this.setId(key);
      this.setValue(value);
   }
   function getId()
   {
      return this.key;
   }
   function setId(_key)
   {
      this.key = _key;
   }
   function getValue()
   {
      return this.value;
   }
   function setValue(_value)
   {
      this.value = _value;
   }
   function updateData(dataObject)
   {
      this.getInfoInObject(dataObject);
   }
   function getInfoInObject(obj)
   {
      for(var _loc4_ in obj)
      {
         var _loc2_ = obj[_loc4_];
         if(_loc4_ == "id" || _loc4_ == "key")
         {
            this.setId(_loc2_);
         }
         else if(_loc4_ == "value")
         {
            this.setValue(_loc2_);
         }
      }
   }
}
