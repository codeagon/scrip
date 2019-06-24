class g4.view.fishing.FishingBlock extends MovieClip
{
   function FishingBlock()
   {
      super();
   }
   function onRelease()
   {
      this.setBroken();
   }
   function setBroken()
   {
      if(!this.isBroken)
      {
         this.isBroken = true;
         this.gotoAndPlay(101);
      }
   }
   function animComp()
   {
      this._visible = false;
   }
}
