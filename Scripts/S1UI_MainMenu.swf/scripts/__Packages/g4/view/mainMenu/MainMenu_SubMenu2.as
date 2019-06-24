class g4.view.mainMenu.MainMenu_SubMenu2 extends g4.view.mainMenu.MainMenu_SubMenu
{
   function MainMenu_SubMenu2()
   {
      super();
   }
   function showSubMenu($id)
   {
      if(this.subMenuData[$id] != null)
      {
         this.resetList();
         this.__set__visible(true);
         var _loc5_ = this.subMenuData[$id].length;
         var _loc4_ = 5;
         this.mBackground._height = _loc5_ * this.ITEM_HEIGHT + 10;
         var _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            var _loc3_ = this.getItem();
            _loc3_._y = _loc4_;
            _loc4_ = _loc4_ + this.ITEM_HEIGHT;
            _loc3_.setData(this.subMenuData[$id][_loc2_]);
            _loc2_ = _loc2_ + 1;
         }
      }
   }
}
