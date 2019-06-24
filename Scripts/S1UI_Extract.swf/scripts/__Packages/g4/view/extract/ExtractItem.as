class g4.view.extract.ExtractItem extends gfx.core.UIComponent
{
   var itemID = -1;
   function ExtractItem()
   {
      super();
   }
   function onLoad()
   {
      this.textField.verticalAlign = "center";
      this.cover.onRollOver = g4.util.Delegate.create(this,this.coverHandlerOver);
      this.cover.onRollOut = g4.util.Delegate.create(this,this.coverHandlerOut);
      this.cover.onReleaseOutside = g4.util.Delegate.create(this,this.coverHandlerOut);
      this.cover.onreleaseAux = g4.util.Delegate.create(this,this.deleteHandlerClick);
      this.mOver.hitTestDisable = true;
      this.mOver._visible = false;
   }
   function coverHandlerOver()
   {
      this.mOver._visible = true;
   }
   function coverHandlerOut()
   {
      this.mOver._visible = false;
   }
   function deleteHandlerClick(event)
   {
      this.dispatchEvent({type:"delete",itemID:this.itemID});
   }
   function setData($id, $icon, $grade, $name, $quantity)
   {
      this.itemID = $id;
      lib.util.DrawBitmap.draw(this.mIcon,$icon,47,47);
      if($grade > 0)
      {
         this.mGrade._visible = true;
         this.mGrade.gotoAndStop($grade);
      }
      else
      {
         this.mGrade._visible = false;
      }
      var _loc2_ = "<font color=\'#b9cbd3\'>" + $name + "</font>";
      if($quantity > 1)
      {
         _loc2_ = _loc2_ + (" <font color=\'#67808c\'>(" + $quantity + ")</font>");
      }
      this.textField.htmlText = _loc2_;
   }
   function resetData()
   {
      this.itemID = -1;
      this.mOver._visible = false;
      lib.util.DrawBitmap.clear(this.mIcon);
   }
}
