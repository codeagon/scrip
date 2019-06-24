class g4.view.questTaskInfo.QuestItemSlot extends gfx.core.UIComponent
{
   function QuestItemSlot()
   {
      super();
   }
   function onLoad()
   {
      this.cover.onRollOver = g4.util.Delegate.create(this,this.coverHandlerOver);
      this.cover.onRollOut = g4.util.Delegate.create(this,this.coverHandlerOut);
      this.cover.onPress = g4.util.Delegate.create(this,this.coverHandlerPress);
      this.cover.onRelease = g4.util.Delegate.create(this,this.coverHandlerRelease);
      this.cover.onReleaseOutside = g4.util.Delegate.create(this,this.coverHandlerOut);
   }
   function coverHandlerOver()
   {
   }
   function coverHandlerOut()
   {
   }
   function coverHandlerPress()
   {
   }
   function coverHandlerRelease()
   {
      this.dispatchEvent({type:gfx.events.EventTypes.ITEM_CLICK,itemId:this.itemId});
   }
   function setData($data)
   {
      this.itemId = $data[0];
      this.mPoint.clear();
      lib.display.DrawBitmapData.draw(this.mPoint,$data[1],0,0,0,0,32,32,0.5,0.5);
      lib.manager.ToolTip.add(this.cover,$data[2],1);
   }
}
