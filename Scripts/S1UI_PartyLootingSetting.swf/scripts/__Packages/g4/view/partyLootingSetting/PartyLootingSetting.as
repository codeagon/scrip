class g4.view.partyLootingSetting.PartyLootingSetting extends g4.core.View
{
   function PartyLootingSetting(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.PARTY_LOOTING_SETTING;
   }
   function configUI()
   {
      this.__get__targetMovieClip().container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip(),this.__get__targetMovieClip().container_mc.lock_mc);
      g4.util.UIUtil.setMouseEnabled(this.__get__targetMovieClip().container_mc.mc_bg,false);
      this.__get__targetMovieClip().container_mc.text_title.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
      var _loc2_ = new lib.util.TxtBtn(this.__get__targetMovieClip().container_mc.button_close);
      _loc2_.setRelease(function()
      {
         g4.model.GameModel.partyModel.ToGame_PartyLootingSetting_Close();
      }
      );
      this.content = new g4.view.partyLootingSetting.Content(this.__get__targetMovieClip().container_mc.mc_content);
      this.updateScreen();
   }
   function configGameInterface()
   {
      g4.model.GameModel.addEventListener(g4.view.ViewID.PARTY_LOOTING_SETTING,g4.model.GameModelEventType.PARTY_STATE_CHANGED,this,"model_partyStateChangedHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.PARTY_LOOTING_SETTING,g4.model.GameModelEventType.PARTY_DISTRIBUTION_DATA_CHANGED,this,"model_partyDistributionDataChangedHandler");
   }
   function updateScreen()
   {
      var _loc2_ = false;
      if(g4.model.GameModel.partyModel.isInParty)
      {
         switch(g4.model.GameModel.partyModel.partyMyState)
         {
            case g4.model.GameConstants.PARTY_MY_STATE_PARTY_MASTER:
            case g4.model.GameConstants.PARTY_MY_STATE_PARTY_RAID_MASTER:
               _loc2_ = true;
         }
      }
      if(_loc2_)
      {
         this.__get__targetMovieClip().container_mc.text_title.text = "$195001";
      }
      else
      {
         this.__get__targetMovieClip().container_mc.text_title.text = "$195041";
      }
      this.content.updateScreen(_loc2_);
   }
   function model_partyStateChangedHandler(event)
   {
      this.updateScreen();
   }
   function model_partyDistributionDataChangedHandler(event)
   {
      this.updateScreen();
   }
}
