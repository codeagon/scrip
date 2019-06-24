class lib.util.InteractionGroup
{
   static var listSave = [];
   static var myListener = new Object();
   function InteractionGroup()
   {
   }
   static function addInteraction(_UIname, _id, _targetMc, interactionStr)
   {
      if(lib.util.InteractionGroup.listSave.length == 0)
      {
         _global.EventBroadCaster.addListener(lib.util.InteractionGroup.myListener);
      }
      var _loc3_ = lib.util.InteractionGroup.arraySearch_UI(_UIname);
      if(_loc3_ == undefined)
      {
         var _loc4_ = new Object();
         _loc4_.name = _UIname;
         _loc4_.mcArray = [];
         _targetMc.UIname = _UIname;
         _targetMc.interId = _id;
         _targetMc.bInteraction = true;
         _loc4_.mcArray.push(_targetMc);
         lib.util.InteractionGroup.listSave.push(_loc4_);
         lib.util.InteractionGroup.myListener.OnGame_MouseDown = function(button, target)
         {
            if(interactionStr == "" || interactionStr == undefined)
            {
               if(target != undefined && button == 2)
               {
                  lib.util.InteractionGroup.listenerEvnet(target);
               }
            }
            else if(target != undefined && button == 2)
            {
               lib.util.InteractionGroup.listenerEvnet(target,interactionStr);
            }
         };
      }
      else
      {
         var _loc5_ = lib.util.InteractionGroup.arraySearch_MC(lib.util.InteractionGroup.listSave[_loc3_].mcArray,_targetMc);
         if(_loc5_)
         {
            lib.util.InteractionGroup.listSave[_loc3_].mcArray[_loc5_].UIname = _UIname;
            lib.util.InteractionGroup.listSave[_loc3_].mcArray[_loc5_].interId = _id;
            lib.util.InteractionGroup.listSave[_loc3_].mcArray[_loc5_].bInteraction = true;
         }
         else
         {
            _targetMc.UIname = _UIname;
            _targetMc.interId = _id;
            _targetMc.bInteraction = true;
            lib.util.InteractionGroup.listSave[_loc3_].mcArray.push(_targetMc);
         }
      }
   }
   static function delInteraction(_UIname)
   {
      var _loc2_ = lib.util.InteractionGroup.arraySearch_UI(_UIname);
      if(_loc2_ == undefined)
      {
         return undefined;
      }
      lib.util.InteractionGroup.listSave.splice(_loc2_,1);
      if(lib.util.InteractionGroup.listSave.length == 0)
      {
         lib.util.InteractionGroup.myListener.OnGame_MouseDown = null;
         _global.EventBroadCaster.removeListener(lib.util.InteractionGroup.myListener);
      }
   }
   static function delAllInteraction()
   {
      lib.util.InteractionGroup.myListener.OnGame_MouseDown = null;
      _global.EventBroadCaster.removeListener(lib.util.InteractionGroup.myListener);
      lib.util.InteractionGroup.listSave = [];
   }
   static function listenerEvnet(_targetMc, interactionStr)
   {
      if(_targetMc._parent.bInteraction)
      {
         _targetMc = _targetMc._parent;
      }
      if(_targetMc.interId == undefined)
      {
         return undefined;
      }
      var _loc9_ = _targetMc.interId.indexOf("src=");
      var _loc5_ = _targetMc.interId.lastIndexOf(">");
      var _loc6_ = _targetMc.interId.length;
      var _loc4_ = _targetMc.interId.substr(_loc5_ + 1,_loc6_);
      var _loc8_ = _targetMc.interId.substr(0,_loc5_ + 1);
      var _loc3_ = _targetMc.UIname;
      if(interactionStr == "" || interactionStr == undefined)
      {
         if(_global.shift)
         {
            getURL("FSCommand:ToGame_Chat_ClickName",_loc4_ + "\t\t\tSHIFT\t" + _loc3_);
         }
         else if(_global.control)
         {
            getURL("FSCommand:ToGame_Chat_ClickName",_loc4_ + "\t\t\tCTRL\t" + _loc3_);
         }
         else
         {
            getURL("FSCommand:ToGame_Chat_ClickName",_loc4_ + "\t\t\t\t" + _loc3_);
         }
      }
      else
      {
         getURL("FSCommand:" add interactionStr,_loc4_ + "\t\t\t\t" + _loc3_);
      }
   }
   static function arraySearch_UI(_UIname)
   {
      var _loc1_ = lib.util.InteractionGroup.listSave.length;
      while(true)
      {
         _loc1_;
         if(_loc1_-- > 0)
         {
            if(_UIname == lib.util.InteractionGroup.listSave[_loc1_].name)
            {
               return _loc1_;
            }
            continue;
         }
         break;
      }
      return undefined;
   }
   static function arraySearch_MC(_list, _Mc)
   {
      var _loc1_ = _list.length;
      while(true)
      {
         _loc1_;
         if(_loc1_-- > 0)
         {
            if(_Mc == _list[_loc1_])
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
