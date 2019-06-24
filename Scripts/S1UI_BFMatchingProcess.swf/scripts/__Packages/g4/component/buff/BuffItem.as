class g4.component.buff.BuffItem extends gfx.core.UIComponent
{
   function BuffItem()
   {
      super();
   }
   function setType($type)
   {
      this.type = $type;
      switch($type)
      {
         case 0:
            this.mRect.gotoAndStop(1);
            break;
         case 1:
            this.mRect.gotoAndStop(2);
            break;
         case 2:
            this.mRect.gotoAndStop(2);
            break;
         case 3:
            this.mRect.gotoAndStop(2);
            break;
         case 4:
            this.mRect.gotoAndStop(2);
      }
      this.warn = false;
   }
   function setStack($stack)
   {
      if($stack > 1 || $stack < 0)
      {
         if($stack < 0)
         {
            this.tStack.textColor = 13369345;
         }
         else
         {
            this.tStack.textColor = 16777215;
         }
         this.tStack.text = String($stack);
      }
      else
      {
         this.tStack.text = "";
      }
   }
   function onTick()
   {
      this.mCount.textField.text = this.cool.getCountText();
      if(this.cool.getSecond() <= 3 && this.warn == false)
      {
         lib.util.Warning.add(this);
         this.warn = true;
      }
      lib.util.CoolTime.draw(this.mCoolTime,26,26,this.cool.getDgree(),0,50,true);
   }
   function onFinished()
   {
      delete this.cool;
      this.dispatchEvent({type:"remove_buff",id:this.id});
   }
   function delegateFunction()
   {
      this.cool.onTick = g4.util.Delegate.create(this,this.onTick);
      this.cool.onFinished = g4.util.Delegate.create(this,this.onFinished);
   }
   function drawIcon($img, $width, $height)
   {
      if(this.img != $img)
      {
         this.img = $img;
         if($width == undefined)
         {
            $width = 24;
         }
         if($height == undefined)
         {
            $height = 24;
         }
         lib.util.DrawBitmap.draw(this.mIcon,$img,$width,$height);
      }
   }
   function deleteCool()
   {
      if(this.cool != null)
      {
         this.cool.remove();
         delete this.cool;
      }
   }
}
