class g4.view.interactionMenu.List extends g4.core.SimpleView
{
   static var ITEM_ROLL_OVER = "itemRollOver";
   static var ITEM_ROLL_OUT = "itemRollOut";
   static var ITEM_CLICK = "itemClick";
   var itemLinkageName = "$InteractionMenu.menu_item";
   var actualHeight = 0;
   function List(targetMovieClip)
   {
      super(targetMovieClip);
      this.itemArray = [];
   }
   function setData(menuDataArray)
   {
      var _loc4_ = menuDataArray != null?menuDataArray.length:0;
      var _loc7_ = this.itemArray.length;
      if(_loc4_ > _loc7_)
      {
         this.createMenuItems(_loc4_ - _loc7_);
      }
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc6_ = this.itemArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         _loc3_ = (g4.view.interactionMenu.ListItem)this.itemArray[_loc2_];
         if(_loc2_ < _loc4_)
         {
            _loc3_.setData((g4.model.main.InteractionMenuData)menuDataArray[_loc2_]);
            _loc3_.setY((g4.view.interactionMenu.InteractionMenuConstants.ITEM_HEIGHT + g4.view.interactionMenu.InteractionMenuConstants.ITEM_GAP) * _loc2_);
         }
         else
         {
            _loc3_.setData(null);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.actualHeight = g4.view.interactionMenu.InteractionMenuConstants.ITEM_HEIGHT * _loc4_ + g4.view.interactionMenu.InteractionMenuConstants.ITEM_GAP * Math.max(0,_loc4_ - 1);
   }
   function createMenuItems(count)
   {
      while((count = count - 1) >= 0)
      {
         var _loc3_ = this.__get__targetMovieClip().attachMovie(this.itemLinkageName,"mc_list_item_" + this.itemArray.length,this.__get__targetMovieClip().getNextHighestDepth());
         var _loc2_ = new g4.view.interactionMenu.ListItem(_loc3_);
         this.configListItem(_loc2_);
         this.itemArray.push(_loc2_);
      }
   }
   function configListItem(listItem)
   {
      listItem.addEventListener(g4.view.interactionMenu.List.ITEM_ROLL_OVER,this,"itemEventHandler");
      listItem.addEventListener(g4.view.interactionMenu.List.ITEM_ROLL_OUT,this,"itemEventHandler");
      listItem.addEventListener(g4.view.interactionMenu.List.ITEM_CLICK,this,"itemEventHandler");
   }
   function getActualHeight()
   {
      return this.actualHeight;
   }
   function itemEventHandler(event)
   {
      this.dispatchEvent(event);
   }
}
