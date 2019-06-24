class gfx.controls.ListItemRenderer extends gfx.controls.Button
{
   var selectable = true;
   function ListItemRenderer()
   {
      super();
   }
   function setListData(index, label, selected)
   {
      this.index = index;
      if(label == null)
      {
         this.__set__label("Empty");
      }
      else
      {
         this.__set__label(label);
      }
      this.state = "up";
      this.__set__selected(selected);
   }
   function setData(data)
   {
      this.data = data;
   }
   function toString()
   {
      return "[Scaleform ListItemRenderer " + this._name + "]";
   }
   function configUI()
   {
      super.configUI();
      this.focusTarget = this.owner;
   }
}
