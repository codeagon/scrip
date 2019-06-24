class g4.view.fishing.FishingBlock extends gfx.core.UIComponent
{
   var blockState = 1;
   var isHit = false;
   function FishingBlock()
   {
      super();
   }
   function onLoad()
   {
      super.onLoad();
      this.mBackground = this.mBlock.mBackground;
      this.mGauge = this.mBlock.mGauge;
      this.mMask = this.mBlock.mMask;
      this.mBlock2.mBackground.gotoAndStop(2);
      this.mBlock2.mGauge.gotoAndStop(2);
      if(this.tmpWidth != null)
      {
         this.setWidth(this.tmpWidth);
         this.tmpWidth = null;
      }
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
   function setWidth($width)
   {
      if(!this.initialized)
      {
         this.tmpWidth = $width;
         return undefined;
      }
      this.blockState = 1;
      $width = $width + 2;
      this.isHit = false;
      this.mGauge.mc.gotoAndStop(1);
      this.mBackground.gotoAndStop(1);
      this.mBackground._width = $width;
      this.mGauge.mc._width = $width + 90;
      this.mMask._width = $width - 8;
      this.mBlock2.mBackground._width = $width;
      this.mBlock2.mGauge.width + $width + 90;
      this.mBlock2.mMask._width = $width - 8;
   }
   function setBlockState($state)
   {
      if($state < this.blockState)
      {
         if(!this.isHit)
         {
            this.isHit = true;
            this.gotoAndPlay(2);
            this.mGauge.mc.gotoAndStop(2);
            this.mBackground.gotoAndStop(2);
            this.dispatchEvent({type:"fish_hit"});
         }
      }
      else if($state > this.blockState)
      {
         if(this.isHit)
         {
            this.isHit = false;
            this.mGauge.mc.gotoAndStop(1);
            this.mBackground.gotoAndStop(1);
            this.dispatchEvent({type:"fish_move"});
         }
      }
      this.blockState = $state;
   }
}
