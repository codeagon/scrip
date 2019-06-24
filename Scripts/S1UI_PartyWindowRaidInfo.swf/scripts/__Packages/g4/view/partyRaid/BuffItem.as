class g4.view.partyRaid.BuffItem extends gfx.core.UIComponent
{
   var type = -1;
   var timePaused = false;
   function BuffItem()
   {
      super();
   }
   function configUI()
   {
      this.mc_icon.mc_temp.swapDepths(this.mc_icon.getNextHighestDepth());
      this.mc_icon.mc_temp.removeMovieClip();
   }
   function cleanUp()
   {
      this.type = -1;
      this.timePaused = false;
      this.setBorderVisible(false,false,false);
   }
   function setBorderVisible(visiblePaused, visibleBuff, visibleDebuff)
   {
      this.mc_type_paused._visible = visiblePaused;
      this.mc_type_buff._visible = visibleBuff;
      this.mc_type_debuff._visible = visibleDebuff;
   }
   function setData(type, img)
   {
      this.type = type;
      this.updateBorder();
      lib.util.DrawBitmap.draw(this.mc_icon,img,g4.view.partyRaid.PartyRaidConstants.BUFF_SLOT_ICON_SIZE,g4.view.partyRaid.PartyRaidConstants.BUFF_SLOT_ICON_SIZE);
      var _loc2_ = img.substring(20,img.length);
      lib.manager.ToolTip.add(this,_loc2_,4,this.mc_icon);
   }
   function setTimePause(bPause)
   {
      this.timePaused = bPause;
      this.updateBorder();
   }
   function updateBorder()
   {
      if(this.timePaused)
      {
         this.setBorderVisible(true,false,false);
      }
      else if(this.isBuff(this.type))
      {
         this.setBorderVisible(false,true,false);
      }
      else
      {
         this.setBorderVisible(false,false,true);
      }
   }
   function isBuff(type)
   {
      return type == 0;
   }
}
