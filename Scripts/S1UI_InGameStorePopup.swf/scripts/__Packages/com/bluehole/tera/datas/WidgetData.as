class com.bluehole.tera.datas.WidgetData
{
   var Name = "";
   var Path = "";
   var xRatio = 0;
   var yRatio = 0;
   var bAlwaysLoaded = 0;
   var GROUP = 2;
   var ifLogOutClose = 0;
   var locked = 1;
   var moved = 0;
   var staticWidget = false;
   function WidgetData(name, path, x, y, alwaysLoaded, group, logoutClose, soundData, addData)
   {
      this.Name = name;
      this.Path = path;
      this.xRatio = Number(x);
      this.yRatio = Number(y);
      this.bAlwaysLoaded = Number(alwaysLoaded);
      this.GROUP = Number(group);
      this.ifLogOutClose = Number(logoutClose);
      this.soundData = soundData;
      this.locked = this.GROUP != 1?null:1;
      this.addDataList = addData;
      this.staticWidget = this.staticWidget == true;
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
         else if(_loc2_[0] == "static")
         {
            this.staticWidget = Boolean(_loc2_[1]);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   static function make(name, path, x, y, alwaysLoaded, group, logoutClose, soundData, addData)
   {
      return new com.bluehole.tera.datas.WidgetData(name,path,x,y,alwaysLoaded,group,logoutClose,soundData,addData);
   }
}
