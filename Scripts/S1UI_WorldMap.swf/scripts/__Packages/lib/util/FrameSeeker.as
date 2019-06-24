class lib.util.FrameSeeker
{
   function FrameSeeker()
   {
   }
   static function seek(target, startP, endP, exeFunc)
   {
      delete target.onEnterFrame;
      var direction = "forward";
      if(startP > endP)
      {
         direction = "backward";
      }
      target.gotoAndStop(startP);
      target.onEnterFrame = function()
      {
         if(direction == "forward")
         {
            if(this._currentframe < endP)
            {
               this.nextFrame();
            }
            else
            {
               delete this.onEnterFrame;
               exeFunc();
            }
         }
         else if(direction == "backward")
         {
            if(this._currentframe > endP)
            {
               this.prevFrame();
            }
            else
            {
               delete this.onEnterFrame;
               exeFunc();
            }
         }
      };
   }
}
