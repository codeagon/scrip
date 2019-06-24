class lib.manager.Focus
{
   static var bFocused = false;
   static var currentFocus = null;
   static var CHAT_INPUT = null;
   static var TRADEHOUSE_SEARCH_INPUT = null;
   function Focus()
   {
   }
   static function bone()
   {
      lib.manager.Focus.focusData = new Array();
      lib.manager.Focus.stop();
      lib.manager.Focus.timer = _root.createEmptyMovieClip("focusTimer",_root.getNextHighestDepth());
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
            if(target == null || target == undefined)
            {
               return undefined;
            }
            if(!(target instanceof TextField))
            {
               Selection.setFocus(null);
            }
         }
      };
      Mouse.addListener(lib.manager.Focus.mouseListener);
      lib.manager.Focus.myListener = new Object();
      _global.EventBroadCaster.addListener(lib.manager.Focus.myListener);
      lib.manager.Focus.myListener.OnGame_Chat_AddLink = function(type, tooltipID, str, info1, info2)
      {
         if(lib.manager.Focus.currentFocus == lib.manager.Focus.CHAT_INPUT || lib.manager.Focus.currentFocus.toString() == undefined)
         {
            return undefined;
         }
         var _loc3_ = lib.manager.Focus.currentFocus;
         var _loc2_ = _loc3_.ExtTextField;
         if(_loc2_ != undefined)
         {
            if(_loc2_.type == 0)
            {
               var _loc5_ = _loc2_.text != _loc2_.caption?_loc2_.text:"";
               if(lib.manager.Focus.currentFocus == lib.manager.Focus.TRADEHOUSE_SEARCH_INPUT)
               {
                  if(_loc2_.text == _loc2_.caption)
                  {
                     _loc2_.text = str;
                  }
                  else
                  {
                     _loc2_.text = str;
                  }
               }
               else if(_loc5_.length + str.length <= _loc2_.textField.maxChars)
               {
                  if(_loc2_.text == _loc2_.caption)
                  {
                     _loc2_.text = str;
                  }
                  else
                  {
                     _loc2_.text = _loc2_.text + str;
                  }
               }
               Selection.setFocus(_loc3_);
               Selection.setSelection(_loc3_.length,_loc3_.length);
            }
            else
            {
               lib.manager.Focus.currentFocus = lib.manager.Focus.CHAT_INPUT;
               _root.OnGameEvent("OnGame_Chat_AddLink",type,tooltipID,str,info1,info2);
            }
         }
         else
         {
            _loc3_.text = _loc3_.text + str;
            Selection.setFocus(_loc3_);
            Selection.setSelection(_loc3_.length,_loc3_.length);
         }
      };
      lib.manager.Focus.myListener.OnGameEventChangeUIMode = function(bMode)
      {
         if(bMode)
         {
            if(lib.manager.PopupManager.highestPopup != null)
            {
               Selection.setFocus(lib.manager.PopupManager.highestPopup.firstFocus);
               delete lib.manager.Focus.timer.onEnterFrame;
               lib.manager.Focus.timer.cnt = 0;
               lib.manager.Focus.timer.onEnterFrame = function()
               {
                  this.cnt = this.cnt + 1;
                  if(this.cnt >= 2)
                  {
                     Selection.setFocus(lib.manager.PopupManager.highestPopup.firstFocus);
                     delete this.onEnterFrame;
                  }
               };
            }
         }
         else if(lib.manager.PopupManager.getArray() != null)
         {
            Selection.setFocus(null);
         }
      };
   }
   static function start()
   {
      lib.manager.Focus.bFocused = true;
      Selection.disableFocusKeys = false;
      Selection.disableFocusAutoRelease = false;
      Selection.alwaysEnableArrowKeys = true;
   }
   static function stop()
   {
      lib.manager.Focus.bFocused = false;
      Selection.disableFocusKeys = true;
      Selection.disableFocusAutoRelease = true;
      Selection.alwaysEnableArrowKeys = false;
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
      if(obj != undefined)
      {
         lib.manager.Focus.currentFocus = obj;
      }
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
