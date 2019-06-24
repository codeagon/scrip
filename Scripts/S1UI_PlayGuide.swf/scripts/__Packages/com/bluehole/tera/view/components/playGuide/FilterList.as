class com.bluehole.tera.view.components.playGuide.FilterList extends gfx.controls.ScrollingList
{
   function FilterList()
   {
      super();
   }
   function configUI()
   {
      super.configUI();
      this._scrollBar._visible = false;
   }
   function handleItemClick(event)
   {
      var _loc2_ = event.target.index;
      if(isNaN(_loc2_))
      {
         return undefined;
      }
      this.dispatchItemEvent(event);
   }
}
