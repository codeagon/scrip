class lib.controls.FieldEventGageMaxEffect extends MovieClip
{
   var _showCount = 3;
   var currentShowCount = 0;
   var _bPlay = false;
   var _finishFunc = null;
   function FieldEventGageMaxEffect()
   {
      super();
      this.clear();
   }
   function __set__showCount(count)
   {
      this._showCount = count;
      return this.__get__showCount();
   }
   function __get__playing()
   {
      return this._bPlay;
   }
   function __set__finishFunc(func)
   {
      this._finishFunc = func;
      return this.__get__finishFunc();
   }
   function start()
   {
      this._visible = true;
      this._bPlay = true;
      this.playEffect();
   }
   function playEffect()
   {
      this.gotoAndStop(1);
      delete this.onEnterFrame();
      this.onEnterFrame = null;
      if(this.currentShowCount < this._showCount)
      {
         this.currentShowCount = this.currentShowCount + 1;
         this.onEnterFrame = function()
         {
            if(this._currentframe < this._totalframes)
            {
               this.nextFrame();
            }
            else
            {
               this.playEffect();
            }
         };
      }
      else
      {
         this.clear();
         if(null != this._finishFunc)
         {
            this._finishFunc();
         }
      }
   }
   function clear()
   {
      this._bPlay = false;
      this._visible = false;
      this.currentShowCount = 0;
   }
}
