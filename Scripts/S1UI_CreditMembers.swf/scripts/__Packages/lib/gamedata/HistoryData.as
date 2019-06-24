class lib.gamedata.HistoryData
{
   static var historySave = [];
   function HistoryData()
   {
   }
   static function addHistoryData(_UIname, _data)
   {
      var _loc1_ = lib.gamedata.HistoryData.arraySearch(_UIname);
      if(_loc1_)
      {
         lib.gamedata.HistoryData.historySave[_loc1_].saveData = _data;
      }
      else
      {
         lib.gamedata.HistoryData.historySave.push({name:_UIname,saveData:_data});
      }
   }
   static function getHistoryData(_UIname)
   {
      var _loc1_ = lib.gamedata.HistoryData.arraySearch(_UIname);
      if(_loc1_ == undefined)
      {
         var _loc2_ = new Object();
         return _loc2_;
      }
      return lib.gamedata.HistoryData.historySave[_loc1_].saveData;
   }
   static function deleteHistoryData(_UIname)
   {
      var _loc1_ = lib.gamedata.HistoryData.arraySearch(_UIname);
      if(_loc1_ == undefined)
      {
         return undefined;
      }
      lib.gamedata.HistoryData.historySave.splice(_loc1_,1);
   }
   static function deleteAllHistoryData()
   {
      lib.gamedata.HistoryData.historySave = [];
   }
   static function arraySearch(_UIname)
   {
      var _loc1_ = lib.gamedata.HistoryData.historySave.length;
      while(true)
      {
         _loc1_;
         if(_loc1_-- > 0)
         {
            if(_UIname == lib.gamedata.HistoryData.historySave[_loc1_].name)
            {
               return _loc1_;
            }
            continue;
         }
         break;
      }
      return undefined;
   }
}
