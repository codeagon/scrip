class g4.component.Button extends gfx.controls.Button
{
   var soundID = 0;
   var verticalAlign = "top";
   var textColorUp = NaN;
   var textColorOver = NaN;
   var textColorDown = NaN;
   var textColorDisabled = NaN;
   var textColorSelectedUp = NaN;
   var textColorSelectedOver = NaN;
   var textColorSelectedDown = NaN;
   var textColorSelectedDisabled = NaN;
   function Button()
   {
      super();
      this.__set__disableFocus(true);
      this.soundID = lib.manager.UISound.MAIN_BTN;
      this.useHandCursor = false;
      this.addEventListener("click",this,"this_clickHandler");
   }
   function updateAfterStateChange()
   {
      super.updateAfterStateChange();
      if(!this.initialized)
      {
         return undefined;
      }
      if(this.textField != null)
      {
         this.textField.verticalAlign = this.verticalAlign;
         var _loc3_ = NaN;
         if(this.__get__disabled())
         {
            if(this.__get__selected())
            {
               _loc3_ = this.textColorSelectedDisabled;
            }
            if(isNaN(_loc3_))
            {
               _loc3_ = this.textColorDisabled;
            }
         }
         else
         {
            var _loc4_ = this.stateMap[this.state];
            if(_loc4_ != null && _loc4_.length > 0)
            {
               var _loc5_ = _loc4_[_loc4_.length - 1];
               if(this.__get__selected())
               {
                  switch(_loc5_)
                  {
                     case "up":
                        _loc3_ = this.textColorSelectedUp;
                        break;
                     case "over":
                        _loc3_ = this.textColorSelectedOver;
                        break;
                     case "down":
                        _loc3_ = this.textColorSelectedDown;
                  }
               }
               else
               {
                  switch(_loc5_)
                  {
                     case "up":
                        _loc3_ = this.textColorUp;
                        break;
                     case "over":
                        _loc3_ = this.textColorOver;
                        break;
                     case "down":
                        _loc3_ = this.textColorDown;
                  }
               }
            }
         }
         if(isNaN(_loc3_))
         {
            if(this.__get__selected())
            {
               _loc3_ = this.textColorSelectedUp;
            }
            else
            {
               _loc3_ = this.textColorUp;
            }
         }
         if(isNaN(_loc3_))
         {
            return undefined;
         }
         this.textField.textColor = _loc3_;
      }
   }
   function this_clickHandler(event)
   {
      if(this.soundID == 0)
      {
         return undefined;
      }
      lib.manager.UISound.play(this.soundID);
   }
}
