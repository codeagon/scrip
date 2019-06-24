class g4.view.interactionMenu.CommonMenu extends g4.view.interactionMenu.Menu
{
   function CommonMenu(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function configUI()
   {
      this.mc_depth1 = this.__get__targetMovieClip().createEmptyMovieClip("mc_depth1",this.__get__targetMovieClip().getNextHighestDepth());
      this.mc_depth1_bg = this.mc_depth1.attachMovie("$InteractionMenu.bg","mc_bg",this.mc_depth1.getNextHighestDepth());
      this.mc_depth1_list = this.mc_depth1.createEmptyMovieClip("mc_list",this.mc_depth1.getNextHighestDepth());
      this.mc_depth1_list._x = g4.view.interactionMenu.InteractionMenuConstants.PADDING_LEFT;
      this.mc_depth1_list._y = g4.view.interactionMenu.InteractionMenuConstants.PADDING_TOP;
      this.list_depth1 = new g4.view.interactionMenu.List(this.mc_depth1_list);
      this.list_depth1.addEventListener(g4.view.interactionMenu.List.ITEM_ROLL_OVER,this,"list1_itemRollOverHandler");
      this.list_depth1.addEventListener(g4.view.interactionMenu.List.ITEM_ROLL_OUT,this,"list1_itemRollOutHandler");
      this.list_depth1.addEventListener(g4.view.interactionMenu.List.ITEM_CLICK,this,"list1_itemClickHandler");
      this.__get__targetMovieClip()._visible = false;
      g4.model.GameModel.addEventListener(g4.view.ViewID.INTERACTION_MENU,g4.model.GameModelEventType.INTERACTION_MENU_OPEN_COMMON,this,"model_interactionMenuOpenCommonHandler");
   }
   function afterClose()
   {
      var _loc2_ = this.closeHandler;
      var _loc3_ = this.selectedItemData;
      this.closeHandler = null;
      this.selectedItemData = null;
      if(_loc2_ != null)
      {
         _loc2_(_loc3_);
      }
   }
   function moveMenu()
   {
      var _loc6_ = this.__get__targetMovieClip()._xscale / 100;
      var _loc7_ = Stage.visibleRect.x / _loc6_;
      var _loc16_ = (Stage.visibleRect.x + Stage.visibleRect.width) / _loc6_;
      var _loc14_ = Stage.visibleRect.y / _loc6_;
      var _loc15_ = (Stage.visibleRect.y + Stage.visibleRect.height) / _loc6_;
      var _loc10_ = this.mc_depth1_bg._width;
      var _loc11_ = this.mc_depth1_bg._height;
      var _loc9_ = g4.view.interactionMenu.InteractionMenuConstants.MENU_OFFSET_X;
      var _loc8_ = g4.view.interactionMenu.InteractionMenuConstants.MENU_OFFSET_Y;
      var _loc3_ = {};
      _loc3_.x = _root._xmouse;
      _loc3_.y = _root._ymouse;
      this.__get__targetMovieClip().globalToLocal(_loc3_);
      var _loc13_ = _loc3_.x;
      var _loc12_ = _loc3_.y;
      var _loc4_ = _loc13_ + _loc9_;
      if(_loc4_ + _loc10_ > _loc16_)
      {
         _loc4_ = _loc13_ - _loc9_ - _loc10_;
      }
      if(_loc4_ < _loc7_)
      {
         _loc4_ = _loc7_;
      }
      var _loc5_ = _loc12_ + _loc8_;
      if(_loc5_ + _loc11_ > _loc15_)
      {
         _loc5_ = _loc12_ - _loc8_ - _loc11_;
      }
      if(_loc5_ < _loc14_)
      {
         _loc5_ = _loc14_;
      }
      this.mc_depth1._x = _loc4_;
      this.mc_depth1._y = _loc5_;
   }
   function setDataAndOpenMenu(menuDataArray, closeHandler, openHandler)
   {
      this.closeMenuImmediately();
      if(menuDataArray == null || menuDataArray.length == 0)
      {
         return undefined;
      }
      this.closeHandler = closeHandler;
      this.list_depth1.setData(menuDataArray);
      this.mc_depth1_bg._height = g4.view.interactionMenu.InteractionMenuConstants.PADDING_TOP + g4.view.interactionMenu.InteractionMenuConstants.PADDING_BOTTOM + this.list_depth1.getActualHeight();
      this.moveMenu();
      this.openMenu();
      this.closeMenuLater();
      if(openHandler != null)
      {
         openHandler();
      }
   }
   function list1_itemRollOverHandler(event)
   {
      this.cancelAutoClose();
   }
   function list1_itemRollOutHandler(event)
   {
      this.closeMenuLater();
   }
   function list1_itemClickHandler(event)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      this.selectedItemData = event.data;
      this.closeMenuImmediately();
   }
   function model_interactionMenuOpenCommonHandler(event)
   {
      this.setDataAndOpenMenu(event.data.menuDataArray,event.data.closeHandler,event.data.openHandler);
   }
}
