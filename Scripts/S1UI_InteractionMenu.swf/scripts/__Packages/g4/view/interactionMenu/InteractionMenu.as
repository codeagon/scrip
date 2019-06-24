class g4.view.interactionMenu.InteractionMenu extends g4.core.View
{
   function InteractionMenu(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.INTERACTION_MENU;
   }
   function configUI()
   {
      this.defaultMenu = new g4.view.interactionMenu.DefaultMenu(this.__get__targetMovieClip().mc_default);
      this.defaultMenu.addEventListener(g4.view.interactionMenu.Menu.OPENED,this,"menu_openedHandler");
      this.defaultMenu.addEventListener(g4.view.interactionMenu.Menu.CLOSED,this,"menu_closedHandler");
      var _loc3_ = this.__get__targetMovieClip().createEmptyMovieClip("mc_party",this.__get__targetMovieClip().getNextHighestDepth());
      this.partyMenu = new g4.view.interactionMenu.PartyMenu(_loc3_);
      this.partyMenu.addEventListener(g4.view.interactionMenu.Menu.OPENED,this,"menu_openedHandler");
      this.partyMenu.addEventListener(g4.view.interactionMenu.Menu.CLOSED,this,"menu_closedHandler");
      var _loc2_ = this.__get__targetMovieClip().createEmptyMovieClip("mc_common",this.__get__targetMovieClip().getNextHighestDepth());
      this.commonMenu = new g4.view.interactionMenu.CommonMenu(_loc2_);
      this.commonMenu.addEventListener(g4.view.interactionMenu.Menu.OPENED,this,"menu_openedHandler");
      this.commonMenu.addEventListener(g4.view.interactionMenu.Menu.CLOSED,this,"menu_closedHandler");
   }
   function configGameInterface()
   {
      g4.model.GameModel.addEventListener(g4.view.ViewID.INTERACTION_MENU,g4.model.GameModelEventType.INTERACTION_MENU_CLOSE,this,"model_interactionMenuCloseHandler");
   }
   function creationComplete()
   {
      super.setViewVisible(true);
   }
   function setViewVisible(visible)
   {
   }
   function menu_openedHandler(event)
   {
      var _loc2_ = (g4.view.interactionMenu.Menu)event.target;
      if(_loc2_ == this.currentMenu)
      {
         return undefined;
      }
      if(this.currentMenu != null)
      {
         this.currentMenu.closeMenu();
         this.currentMenu = null;
      }
      this.currentMenu = _loc2_;
   }
   function menu_closedHandler(event)
   {
      var _loc2_ = (g4.view.interactionMenu.Menu)event.target;
      if(_loc2_ == this.currentMenu)
      {
         this.currentMenu = null;
      }
   }
   function model_interactionMenuCloseHandler(event)
   {
      if(this.currentMenu == null)
      {
         return undefined;
      }
      this.currentMenu.closeMenu();
   }
}
