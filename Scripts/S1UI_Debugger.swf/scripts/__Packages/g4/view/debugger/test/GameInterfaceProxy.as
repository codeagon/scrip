class g4.view.debugger.test.GameInterfaceProxy
{
   function GameInterfaceProxy()
   {
   }
   static function OnGameEvent()
   {
      trace(arguments);
      _root.OnGameEvent.apply(null,arguments);
   }
   static function OnGameEventRegisterUI(data)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventRegisterUI",data.uiName,data.path,data.x,data.y,data.bAlwaysLoaded,data.group,data.ifLogoutClose,data.soundData,data.addData);
   }
   static function openUI(name, loadCompleteFunc)
   {
      var _loc1_ = g4.view.debugger.test.LoadUIXML.getUIData(name);
      if(_loc1_ == null)
      {
         trace("GameInterfaceProxy::openUI()\nNot found data!\nname : " + name + "\n");
         return undefined;
      }
      g4.view.debugger.test.UILoader.loadUI(_loc1_,loadCompleteFunc);
   }
   static function closeUI(name)
   {
      var _loc2_ = g4.view.debugger.test.LoadUIXML.getUIData(name);
      if(_loc2_ == null)
      {
         trace("GameInterfaceProxy::closeUI()\nNot found data!\nname : " + name + "\n");
         return undefined;
      }
      g4.view.debugger.test.GameInterfaceProxy.OnGameEventShowUI(name,false);
   }
   static function OnGameEventShowUI(Name, bShow, expandOption)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventShowUI",Name,bShow,expandOption);
   }
   static function OnGame_SetUIPosition(bLocked, UIName, posXRatio, posYRatio, notRatio)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_SetUIPosition",bLocked,UIName,posXRatio,posYRatio,notRatio);
   }
}
