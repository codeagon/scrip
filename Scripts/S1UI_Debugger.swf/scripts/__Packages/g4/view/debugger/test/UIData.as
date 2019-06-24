class g4.view.debugger.test.UIData
{
   var x = 0;
   var y = 0;
   var bAlwaysLoaded = false;
   var group = 0;
   var ifLogoutClose = false;
   var soundData = "";
   var addData = "";
   function UIData(uiName, path, x, y, bAlwaysLoaded, group, ifLogoutClose, soundData, addData)
   {
      this.uiName = uiName;
      this.path = path;
      this.x = x;
      this.y = y;
      this.bAlwaysLoaded = bAlwaysLoaded;
      this.group = group;
      this.ifLogoutClose = ifLogoutClose;
      this.soundData = soundData;
      this.addData = addData;
   }
}
