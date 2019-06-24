class lib.gamedata.DefaultData
{
   static var defaultUIData = [];
   function DefaultData()
   {
   }
   static function AddDefaultUIData(_defaultName, _param0, _param1)
   {
      lib.gamedata.DefaultData.defaultUIData.push({name:_defaultName,param0:_param0,param1:_param1});
   }
   static function getDefaultUIData(_defaultName)
   {
      var _loc1_ = lib.gamedata.DefaultData.defaultUIData.length;
      while(true)
      {
         _loc1_;
         if(_loc1_-- > 0)
         {
            if(_defaultName == lib.gamedata.DefaultData.defaultUIData[_loc1_].name)
            {
               return lib.gamedata.DefaultData.defaultUIData[_loc1_];
            }
            continue;
         }
         break;
      }
      return undefined;
   }
}
