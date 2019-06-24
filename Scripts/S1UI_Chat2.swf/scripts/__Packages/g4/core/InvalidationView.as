class g4.core.InvalidationView extends g4.core.SimpleView
{
   var initialized = false;
   var invalidateFlag = false;
   function InvalidationView(targetMovieClip)
   {
      super(targetMovieClip);
      g4.util.UIUtil.callLater(this,"onLoadImpl");
   }
   function onLoadImpl()
   {
      if(this.initialized)
      {
         return undefined;
      }
      this.initialized = true;
      this.configUI();
      this.validateNow();
   }
   function invalidate()
   {
      if(this.invalidateFlag)
      {
         return undefined;
      }
      this.invalidateFlag = true;
      g4.util.UIUtil.callLater(this,"validateNow");
   }
   function validateNow()
   {
      this.invalidateFlag = false;
      if(!this.initialized)
      {
         this.onLoadImpl();
         return undefined;
      }
      this.draw();
   }
   function configUI()
   {
   }
   function draw()
   {
   }
}
