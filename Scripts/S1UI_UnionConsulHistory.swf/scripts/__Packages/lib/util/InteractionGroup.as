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
      var _loc2_ = lib.util.InteractionGroup.arraySearch_UI(_UIname);
      if(_loc2_ == undefined)
      {
         var _loc3_ = new Object();
         _loc3_.name = _UIname;
         _loc3_.mcArray = [];
         _targetMc.id = _id;
         _loc3_.mcArray.push(_targetMc);
         lib.util.InteractionGroup.listSave.push(_loc3_);
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
         var _loc5_ = lib.util.InteractionGroup.arraySearch_MC(lib.util.InteractionGroup.listSave[_loc2_].mcArray,_targetMc);
         if(_loc5_)
         {
            lib.util.InteractionGroup.listSave[_loc2_].mcArray[_loc5_].id = _id;
         }
         else
         {
            _targetMc.id = _id;
            lib.util.InteractionGroup.listSave[_loc2_].mcArray.push(_targetMc);
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
      if(_targetMc.id == undefined)
      {
         return undefined;
      }
      var _loc8_ = _targetMc.id.indexOf("src=");
      var _loc4_ = _targetMc.id.lastIndexOf(">");
      var _loc5_ = _targetMc.id.length;
      var _loc3_ = _targetMc.id.substr(_loc4_ + 1,_loc5_);
      var _loc7_ = _targetMc.id.substr(0,_loc4_ + 1);
      if(interactionStr == "" || interactionStr == undefined)
      {
         if(_global.shift)
         {
            getURL("FSCommand:ToGame_Chat_ClickName",_loc3_ + "\t\t\tSHIFT");
         }
         else if(_global.control)
         {
            getURL("FSCommand:ToGame_Chat_ClickName",_loc3_ + "\t\t\tCTRL");
         }
         else
         {
            getURL("FSCommand:ToGame_Chat_ClickName",_loc3_ + "\t\t\t");
         }
      }
      else
      {
         getURL("FSCommand:" add interactionStr,_loc3_ + "\t\t\t");
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
