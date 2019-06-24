class g4.view.debugger.TreeViewItemRenderer extends gfx.controls.ListItemRenderer
{
   function TreeViewItemRenderer()
   {
      super();
   }
   function setData(data)
   {
      super.setData(data);
      this.textField.text = data.label;
      this.updateAfterStateChange();
   }
   function configUI()
   {
      this.hit.onRollOver = gfx.utils.Delegate.create(this,this.handleMouseRollOver);
      this.hit.onRollOut = gfx.utils.Delegate.create(this,this.handleMouseRollOut);
      this.hit.onPress = gfx.utils.Delegate.create(this,this.handleMousePress);
      this.hit.onRelease = gfx.utils.Delegate.create(this,this.handleMouseRelease);
      this.hit.onDragOver = gfx.utils.Delegate.create(this,this.handleDragOver);
      this.hit.onDragOut = gfx.utils.Delegate.create(this,this.handleDragOut);
      this.hit.onReleaseOutside = gfx.utils.Delegate.create(this,this.handleReleaseOutside);
      if(this.focusIndicator != null && !this._focused && this.focusIndicator._totalFrames == 1)
      {
         this.focusIndicator._visible = false;
      }
      this.focusTarget = this.owner;
      this.updateAfterStateChange();
   }
   function draw()
   {
      if(this.sizeIsInvalid)
      {
         this._width = this.__width;
         this._height = this.__height;
      }
   }
   function updateAfterStateChange()
   {
      if(!this.initialized)
      {
         return undefined;
      }
      this.validateNow();
      if(this.data)
      {
         this.drawLayout();
      }
      else
      {
         this.clearLayout();
      }
      if(this.textField != null && this._label != null)
      {
         this.textField.text = this._label;
      }
      this.dispatchEvent({type:"stateChange",state:this.state});
   }
   function drawLayout()
   {
      this._visible = true;
      var _loc3_ = 100 / this._xscale;
      var _loc2_ = 3;
      this.textField.verticalAlign = "center";
      this.textField._xscale = _loc3_ * 100;
      this.textField._width = this.__width - _loc2_ * 2;
      this.textField._x = _loc2_;
      this.textField._y = 0;
      this.textField._height = this.__height;
      this.invalidate();
   }
   function clearLayout()
   {
      this._visible = false;
   }
}
