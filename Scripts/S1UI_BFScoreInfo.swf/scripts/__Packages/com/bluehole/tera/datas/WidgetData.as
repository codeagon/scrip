class com.bluehole.tera.datas.WidgetData
{
   var Name = "";
   var Path = "";
   var xRatio = 0;
   var yRatio = 0;
   var bAlwaysLoaded = false;
   var GROUP = -1;
   var ifLogOutClose = true;
   var isWindow = false;
   var locked = false;
   function WidgetData(name, path, x, y, alwaysLoaded, group, logoutClose, soundData, addData)
   {
      this.Name = name;
      this.Path = path;
      this.xRatio = Number(x);
      this.yRatio = Number(y);
      this.bAlwaysLoaded = Boolean(alwaysLoaded);
      this.GROUP = Number(group);
      this.ifLogOutClose = Boolean(logoutClose);
      this.soundData = soundData;
      this.addDataList = addData;
      var addDataList = addData.toString().split(",");
      var _loc3_ = 0;
      while(_loc3_ < addDataList.length)
      {
         var _loc2_ = addDataList[_loc3_].toString().split(":");
         if(_loc2_[0] == "PA")
         {
            this.PA = Number(_loc2_[1]);
         }
         else if(_loc2_[0] == "SA")
         {
            this.SA = Number(_loc2_[1]);
         }
         else if(_loc2_[0] == "battleModeClose")
         {
            this.battleModeClose = Number(_loc2_[1]);
         }
         else if(_loc2_[0] == "scaleCustom")
         {
            this.ScaleCustom = Number(_loc2_[1]);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
}
