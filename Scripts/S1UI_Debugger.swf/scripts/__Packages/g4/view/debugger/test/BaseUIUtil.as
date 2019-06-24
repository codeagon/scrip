class g4.view.debugger.test.BaseUIUtil
{
   function BaseUIUtil()
   {
   }
   static function isRegisteredUI(name)
   {
      return _root.GetRegisterUIData(name) != null;
   }
   static function isLoadedUI(uiName)
   {
      return _root.GetLoadedUI(uiName) != null;
   }
   static function isOnLoad(uiName)
   {
      return _root.waitingShowUI[uiName.toLowerCase()].lstate != undefined;
   }
}
