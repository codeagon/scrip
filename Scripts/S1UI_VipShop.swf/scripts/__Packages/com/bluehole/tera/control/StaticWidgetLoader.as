class com.bluehole.tera.control.StaticWidgetLoader extends com.bluehole.tera.control.WidgetLoader
{
   function StaticWidgetLoader(widgetData)
   {
      super(widgetData);
   }
   function draw()
   {
      if(!this.loadOK)
      {
         return undefined;
      }
      if(this.positionChanged && !this.showProcess)
      {
         this.positionChanged = false;
         this.drawPosition();
      }
      if(this.scaleChanged && !this.showProcess)
      {
         this.scaleChanged = false;
         this.drawScale();
      }
   }
   function onLoadInit(target)
   {
      this.loadOK = true;
      if(this.scaleChanged)
      {
         this.drawScale();
      }
      this.dispatchEvent({type:com.bluehole.tera.control.WidgetLoader.EVENT_LOAD_INIT,widget:this.widget,widgetName:this.widgetName});
      this.dispatchEvent({type:com.bluehole.tera.control.WidgetLoader.EVENT_SHOW,widget:this.widget,widgetName:this.widgetName});
   }
   function doNotScaleOption()
   {
      return false;
   }
}
