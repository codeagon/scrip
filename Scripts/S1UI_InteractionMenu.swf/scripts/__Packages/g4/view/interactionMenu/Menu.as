class g4.view.interactionMenu.Menu extends g4.core.SimpleView
{
   static var OPENED = "opened";
   static var CLOSED = "closed";
   var autoCloseTimeoutID = 0;
   var delaySecToAutoClose = 1;
   function Menu(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function sendMenuEvent(type)
   {
      this.dispatchEvent({type:type});
   }
   function afterOpen()
   {
   }
   function afterClose()
   {
   }
   function openMenu()
   {
      this.setMenuVisible(true);
   }
   function closeMenu()
   {
      this.closeMenuImmediately();
   }
   function closeMenuImmediately()
   {
      this.closeMenuWithDelay(0);
   }
   function closeMenuLater()
   {
      this.closeMenuWithDelay(this.delaySecToAutoClose * 1000);
   }
   function closeMenuWithDelay(delay)
   {
      this.cancelAutoClose();
      if(!this.__get__targetMovieClip()._visible)
      {
         return undefined;
      }
      if(delay > 0)
      {
         this.autoCloseTimeoutID = setTimeout(gfx.utils.Delegate.create(this,this.closeMenuActually),delay);
      }
      else
      {
         this.closeMenuActually();
      }
   }
   function closeMenuActually()
   {
      this.setMenuVisible(false);
   }
   function setMenuVisible(visible)
   {
      if(visible)
      {
         this.__get__targetMovieClip()._visible = true;
         this.sendMenuEvent(g4.view.interactionMenu.Menu.OPENED);
         this.afterOpen();
      }
      else
      {
         this.__get__targetMovieClip()._visible = false;
         this.sendMenuEvent(g4.view.interactionMenu.Menu.CLOSED);
         this.afterClose();
      }
   }
   function cancelAutoClose()
   {
      if(this.autoCloseTimeoutID != 0)
      {
         clearTimeout(this.autoCloseTimeoutID);
         this.autoCloseTimeoutID = 0;
      }
   }
}
