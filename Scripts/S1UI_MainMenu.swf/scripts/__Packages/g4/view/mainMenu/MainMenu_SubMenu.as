class g4.view.mainMenu.MainMenu_SubMenu extends gfx.core.UIComponent
{
   var ITEM_HEIGHT = 24;
   function MainMenu_SubMenu()
   {
      super();
      this.subMenuData = {};
      this.itemsPool = [];
      this.itemsActive = [];
      this.mainMenu = [];
   }
   function configUI()
   {
      var _loc4_ = 0;
      while(_loc4_ < 10)
      {
         var _loc3_ = this.getNextHighestDepth();
         var _loc2_ = (g4.view.mainMenu.MainMenu_SubMenuItem)this.attachMovie("SubMenuItem","SubMenuItem" + _loc3_,_loc3_);
         _loc2_.addEventListener("ToGame_MainMenu_RequestDisableUI",this,"eventRelay");
         _loc2_.addEventListener("ToGame_MainMenu_RequestShowUI",this,"eventRelay");
         _loc2_.addEventListener(gfx.events.EventTypes.ITEM_ROLL_OVER,this,"itemHandlerOver");
         _loc2_.addEventListener(gfx.events.EventTypes.ITEM_ROLL_OUT,this,"eventRelay");
         _loc2_._y = - this.ITEM_HEIGHT;
         _loc2_.__set__visible(false);
         this.itemsPool.push(_loc2_);
         _loc4_ = _loc4_ + 1;
      }
   }
   function eventRelay($event)
   {
      this.dispatchEvent($event);
   }
   function itemHandlerOver($event)
   {
      this.dispatchEvent($event);
   }
   function getItem()
   {
      var _loc2_ = undefined;
      if(this.itemsPool.length > 0)
      {
         _loc2_ = (g4.view.mainMenu.MainMenu_SubMenuItem)this.itemsPool.pop();
         _loc2_.__set__visible(true);
      }
      else
      {
         var _loc3_ = this.getNextHighestDepth();
         _loc2_ = (g4.view.mainMenu.MainMenu_SubMenuItem)this.attachMovie("SubMenuItem","SubMenuItem" + _loc3_,_loc3_);
         _loc2_.addEventListener("ToGame_MainMenu_RequestDisableUI",this,"eventRelay");
         _loc2_.addEventListener("ToGame_MainMenu_RequestShowUI",this,"eventRelay");
         _loc2_.addEventListener(gfx.events.EventTypes.ITEM_ROLL_OVER,this,"itemHandlerOver");
         _loc2_.addEventListener(gfx.events.EventTypes.ITEM_ROLL_OUT,this,"eventRelay");
      }
      this.itemsActive.push(_loc2_);
      return _loc2_;
   }
   function resetList()
   {
      while(this.itemsActive.length > 0)
      {
         var _loc2_ = (g4.view.mainMenu.MainMenu_SubMenuItem)this.itemsActive.pop();
         _loc2_.__set__visible(false);
         _loc2_._y = - this.ITEM_HEIGHT;
         this.itemsPool.push(_loc2_);
      }
   }
   function addSubMenu($id, $subMenu)
   {
      this.subMenuData[$id] = [];
      var _loc5_ = -1;
      var _loc2_ = 0;
      while(_loc2_ < this.mainMenu.length)
      {
         if(this.mainMenu[_loc2_] == $id)
         {
            _loc5_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc5_ == -1)
      {
         this.mainMenu.push($id);
      }
      var _loc6_ = lib.util.ExtString.split($subMenu,"\n");
      var _loc7_ = _loc6_.length;
      _loc2_ = 0;
      while(_loc2_ < _loc7_)
      {
         var _loc3_ = new g4.view.mainMenu.DataSubMenu();
         _loc3_.setData($id,_loc6_[_loc2_]);
         this.subMenuData[$id].push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateSubMenu($id, $subMenu)
   {
      var _loc9_ = this.mainMenu.length;
      var _loc5_ = 0;
      while(_loc5_ < _loc9_)
      {
         var _loc3_ = this.mainMenu[_loc5_];
         var _loc6_ = this.subMenuData[_loc3_].length;
         var _loc2_ = 0;
         while(_loc2_ < _loc6_)
         {
            if((g4.view.mainMenu.DataSubMenu)this.subMenuData[_loc3_][_loc2_].SubID == $id)
            {
               var _loc4_ = lib.util.ExtString.split($subMenu,"\t");
               (g4.view.mainMenu.DataSubMenu)this.subMenuData[_loc3_][_loc2_].MenuName = _loc4_[0];
               (g4.view.mainMenu.DataSubMenu)this.subMenuData[_loc3_][_loc2_].KeyName = _loc4_[1];
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc5_ = _loc5_ + 1;
      }
   }
   function showSubMenu($id, $isTop)
   {
      if($isTop == null)
      {
         $isTop = false;
      }
      if(this.subMenuData[$id] != null)
      {
         this.resetList();
         this.__set__visible(true);
         var _loc6_ = this.subMenuData[$id].length;
         var _loc5_ = 30;
         var _loc2_ = 0;
         while(_loc2_ < _loc6_)
         {
            var _loc3_ = undefined;
            if(!$isTop)
            {
               _loc3_ = (g4.view.mainMenu.DataSubMenu)this.subMenuData[$id][_loc2_];
            }
            else
            {
               _loc3_ = (g4.view.mainMenu.DataSubMenu)this.subMenuData[$id][_loc6_ - 1 - _loc2_];
            }
            if(_loc3_.MenuDisabled != 2)
            {
               var _loc4_ = this.getItem();
               _loc4_._y = _loc5_;
               _loc5_ = _loc5_ + this.ITEM_HEIGHT;
               _loc4_.setData(_loc3_);
            }
            _loc2_ = _loc2_ + 1;
         }
         this.mBackground._height = _loc5_ + 5;
      }
   }
   function setSubMenu($ID, $subID, $contain)
   {
      if(this.subMenuData[$ID] != null)
      {
         var _loc4_ = this.subMenuData[$ID].length;
         var _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            if((g4.view.mainMenu.DataSubMenu)this.subMenuData[$ID][_loc2_].SubID == $subID)
            {
               (g4.view.mainMenu.DataSubMenu)this.subMenuData[$ID][_loc2_].SubMenuContain = $contain;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function setMenuDisabled($ID, $disabled)
   {
      var _loc4_ = false;
      for(var _loc7_ in this.subMenuData)
      {
         var _loc3_ = this.subMenuData[_loc7_].length;
         var _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((g4.view.mainMenu.DataSubMenu)this.subMenuData[_loc7_][_loc2_].SubID == $ID)
            {
               (g4.view.mainMenu.DataSubMenu)this.subMenuData[_loc7_][_loc2_].MenuDisabled = $disabled;
               _loc4_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      return _loc4_;
   }
   function setTag($id, $tag)
   {
      var _loc4_ = false;
      for(var _loc7_ in this.subMenuData)
      {
         var _loc3_ = this.subMenuData[_loc7_].length;
         var _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((g4.view.mainMenu.DataSubMenu)this.subMenuData[_loc7_][_loc2_].SubID == $id)
            {
               (g4.view.mainMenu.DataSubMenu)this.subMenuData[_loc7_][_loc2_].Tag = $tag;
               _loc4_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      return _loc4_;
   }
   function setEffect($id, $type)
   {
      var _loc4_ = false;
      for(var _loc7_ in this.subMenuData)
      {
         var _loc3_ = this.subMenuData[_loc7_].length;
         var _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((g4.view.mainMenu.DataSubMenu)this.subMenuData[_loc7_][_loc2_].SubID == $id)
            {
               (g4.view.mainMenu.DataSubMenu)this.subMenuData[_loc7_][_loc2_].Effect = $type;
               _loc4_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      return _loc4_;
   }
   function getSubMenuData($id, $subId)
   {
      var _loc3_ = this.subMenuData[$id];
      var _loc4_ = _loc3_.length;
      var _loc5_ = undefined;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         if((g4.view.mainMenu.DataSubMenu)_loc3_[_loc2_].SubID == $subId)
         {
            _loc5_ = (g4.view.mainMenu.DataSubMenu)_loc3_[_loc2_];
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc5_;
   }
}
