class lib.manager.PopupManager
{
   static var popup_array = new Array();
   function PopupManager()
   {
      lib.manager.PopupManager.popup_array = new Array();
   }
   static function __get__length()
   {
      return lib.manager.PopupManager.popup_array.length;
   }
   static function getArray(type, wantObject)
   {
      var _loc3_ = new Array();
      var _loc1_ = 0;
      while(_loc1_ < lib.manager.PopupManager.popup_array.length)
      {
         if(type == undefined || type == null || type == "")
         {
            if(wantObject)
            {
               _loc3_.push(lib.manager.PopupManager.popup_array[_loc1_]);
            }
            else
            {
               _loc3_.push(lib.manager.PopupManager.popup_array[_loc1_].mc);
            }
         }
         else if(wantObject)
         {
            if(lib.manager.PopupManager.popup_array[_loc1_].type == type)
            {
               _loc3_.push(lib.manager.PopupManager.popup_array[_loc1_]);
            }
         }
         else if(lib.manager.PopupManager.popup_array[_loc1_].type == type)
         {
            _loc3_.push(lib.manager.PopupManager.popup_array[_loc1_].mc);
         }
         _loc1_ = _loc1_ + 1;
      }
      if(_loc3_.length > 0)
      {
         return _loc3_;
      }
      return null;
   }
   static function getPopup(id)
   {
      var _loc1_ = lib.manager.PopupManager.search(id);
      if(_loc1_ != null)
      {
         return _loc1_.mc;
      }
      return null;
   }
   static function getType(id)
   {
      var _loc1_ = lib.manager.PopupManager.search(id);
      if(_loc1_ != null)
      {
         return _loc1_.type;
      }
      return null;
   }
   static function add(id, type, mc)
   {
      var _loc3_ = new Object();
      _loc3_.id = id;
      _loc3_.type = type;
      _loc3_.mc = mc;
      lib.manager.PopupManager.popup_array.push(_loc3_);
      lib.Debuger.trace("매니저 추가" + _loc3_.type);
      if(Number(type) == 0)
      {
         _global.modal = true;
         _root.freezeGame(true);
         getURL("FSCommand:freezeGame :",true);
         _root.lockUI(true);
         _root.lockNormalPopup(true);
         _root.lockInteractionPopup(true);
         _root.lockBattleUI(true);
         lib.manager.PopupManager.highestPopup = mc;
      }
      else if(Number(type) == 1)
      {
         _root.freezeGame(true);
         _root.lockUI(true);
         _root.lockNormalPopup(true);
         if(lib.manager.PopupManager.getArray(0) == null)
         {
            lib.manager.PopupManager.highestPopup = mc;
         }
      }
      else
      {
         _root.freezeGame(true);
         _root.lockUI(true);
         if(lib.manager.PopupManager.getArray(0) == null && lib.manager.PopupManager.getArray(1) == null)
         {
            lib.manager.PopupManager.highestPopup = mc;
         }
      }
   }
   static function remove(id)
   {
      var _loc3_ = lib.manager.PopupManager.search(id,1)[0];
      var _loc5_ = lib.manager.PopupManager.getArray().length;
      var _loc4_ = lib.manager.PopupManager.getArray(1).length;
      lib.Debuger.trace("매니저 삭제" + _loc3_.type);
      if(_loc3_.type != 1)
      {
         _loc3_.mc._visible = false;
      }
      else
      {
         removeMovieClip(_loc3_.mc);
      }
      if(_loc3_.type == 0)
      {
         _global.modal = false;
         _root.lockBattleUI(false);
         _root.lockInteractionPopup(false);
         if(_loc4_ <= 0)
         {
            _root.lockNormalPopup(false);
         }
      }
      else if(_loc3_.type == 1)
      {
         if(_loc4_ <= 0)
         {
            _root.lockNormalPopup(false);
         }
      }
      if(_loc5_ <= 0)
      {
         _root.freezeGame(false);
         _root.lockUI(false);
         lib.manager.PopupManager.highestPopup = null;
      }
      lib.manager.PopupManager.resetHighestPopup();
   }
   static function search(id, bRemove)
   {
      var _loc1_ = 0;
      while(_loc1_ < lib.manager.PopupManager.popup_array.length)
      {
         if(lib.manager.PopupManager.popup_array[_loc1_].id == id)
         {
            if(bRemove != 1)
            {
               return lib.manager.PopupManager.popup_array[_loc1_];
            }
            return lib.manager.PopupManager.popup_array.splice(_loc1_,1);
         }
         _loc1_ = _loc1_ + 1;
      }
      return null;
   }
   static function resetHighestPopup()
   {
      var _loc3_ = null;
      var _loc4_ = false;
      var _loc2_ = 0;
      while(_loc2_ < lib.manager.PopupManager.popup_array.length)
      {
         var _loc1_ = lib.manager.PopupManager.popup_array[_loc2_];
         if(_loc1_.type == 0)
         {
            _loc3_ = _loc1_.mc;
            return undefined;
         }
         if(_loc1_.type == 1)
         {
            _loc3_ = _loc1_.mc;
            _loc4_ = true;
         }
         else if(!_loc4_)
         {
            _loc3_ = _loc1_.mc;
         }
         _loc2_ = _loc2_ + 1;
      }
      lib.manager.PopupManager.highestPopup = _loc3_;
   }
}
