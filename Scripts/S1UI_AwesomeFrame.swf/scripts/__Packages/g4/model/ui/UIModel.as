class g4.model.ui.UIModel extends g4.model.Model
{
   function UIModel()
   {
      super();
   }
   function openPartyInteractionMenu()
   {
      this.sendEvent(g4.model.GameModelEventType.UI_OPEN_PARTY_INTERACTION_MENU);
   }
   function openPartyRaidInteractionMenu()
   {
      this.sendEvent(g4.model.GameModelEventType.UI_OPEN_PARTY_RAID_INTERACTION_MENU);
   }
}
