class lib.manager.Focus
{
   static var bFocused = false;
   function Focus()
   {
   }
   static function bone()
   {
      lib.manager.Focus.focusData = new Array();
      lib.manager.Focus.stop();
      lib.manager.Focus.keyListener = new Object();
      Key.addListener(lib.manager.Focus.keyListener);
      lib.manager.Focus.keyListener.onKeyDown = function()
      {
         var code = Key.getCode();
         if(code == 13)
         {
            var focus = eval(Selection.getFocus());
            if(focus instanceof TextField)
            {
               focus.onEnterKey();
               if(focus.ExtTextField != undefined)
               {
                  focus.ExtTextField.onEnterKey();
               }
            }
            else if(focus instanceof MovieClip)
            {
               focus.onEnterKey();
               if(focus.o instanceof lib.util.TxtBtn)
               {
                  focus.o.onEnterKey();
               }
            }
         }
      };
      lib.manager.Focus.mouseListener = new Object();
      lib.manager.Focus.mouseListener.onMouseMove = function()
      {
         if(_global.gbUIMode)
         {
            var target = eval(Selection.getFocus());
            if(!(target instanceof TextField))
            {
               Selection.setFocus(null);
            }
         }
      };
      Mouse.addListener(lib.manager.Focus.mouseListener);
   }
   static function start()
   {
      lib.manager.Focus.bFocused = true;
      Selection.disableFocusKeys = false;
      Selection.disableFocusAutoRelease = false;
   }
   static function stop()
   {
      lib.manager.Focus.bFocused = false;
      Selection.disableFocusKeys = true;
      Selection.disableFocusAutoRelease = true;
   }
   static function addFocusGroup(modalUI, focusGroupNumber, focusGroup)
   {
      var _loc4_ = lib.manager.Focus.searchContainer(modalUI);
      if(_loc4_ != null)
      {
         _loc4_.groupArray[focusGroupNumber] = focusGroup;
         lib.manager.Focus.saveGroupNumber(focusGroupNumber,focusGroup);
      }
      else
      {
         var _loc1_ = new Object();
         _loc1_.name = modalUI;
         _loc1_.groupArray = new Array();
         _loc1_.groupArray[focusGroupNumber] = focusGroup;
         lib.manager.Focus.focusData.push(_loc1_);
         lib.manager.Focus.saveGroupNumber(focusGroupNumber,focusGroup);
      }
   }
   static function setFocusGroup(obj)
   {
      if(obj != undefined && obj.focusGroup != undefined)
      {
         lib.manager.Focus.start();
         var _loc7_ = obj._target;
         var _loc6_ = _loc7_.split("/");
         var _loc5_ = _root[_loc6_[1]][_loc6_[2]];
         lib.manager.Focus.setModal(_loc5_);
         var _loc2_ = 0;
         while(_loc2_ < lib.manager.Focus.currentFocusArray.length)
         {
            lib.manager.Focus.currentFocusArray[_loc2_].tabIndex = null;
            _loc2_ = _loc2_ + 1;
         }
         var _loc8_ = lib.manager.Focus.searchContainer(_loc5_._name);
         var _loc3_ = _loc8_.groupArray[obj.focusGroup];
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            _loc3_[_loc2_].tabIndex = _loc2_ + 1;
            lib.manager.Focus.currentFocusArray = _loc3_;
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   static function setModal(target)
   {
      Selection.modalClip = target;
      lib.manager.Focus.modalUI = target;
   }
   static function searchContainer(searchTarget)
   {
      var _loc2_ = lib.manager.Focus.focusData.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc2_)
      {
         if(lib.manager.Focus.focusData[_loc1_].name.toLowerCase() == searchTarget.toLowerCase())
         {
            return lib.manager.Focus.focusData[_loc1_];
         }
         _loc1_ = _loc1_ + 1;
      }
      return null;
   }
   static function saveGroupNumber(focusGroupNumber, focusGroup)
   {
      var _loc1_ = 0;
      while(_loc1_ < focusGroup.length)
      {
         if(focusGroup[_loc1_] instanceof lib.util.ExtTextField)
         {
            focusGroup[_loc1_] = focusGroup[_loc1_].textField;
         }
         focusGroup[_loc1_].focusGroup = focusGroupNumber;
         _loc1_ = _loc1_ + 1;
      }
   }
}
