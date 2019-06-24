class com.bluehole.tera.view.components.playGuide.CheckBoxRenderer extends gfx.controls.CheckBox implements gfx.interfaces.IListItemRenderer
{
   function CheckBoxRenderer()
   {
      super();
   }
   function __set__selected(value)
   {
      super.__set__selected(value);
      if(this.data && this.data.selected != value)
      {
         this.data.selected = value;
      }
      return this.__get__selected();
   }
   function setListData(index, label, selected)
   {
      this.index = index;
      this.__set__label(label);
   }
   function setData(data)
   {
      this.data = data;
      this.id = data.id;
      this.__set__selected(data.selected);
   }
}
