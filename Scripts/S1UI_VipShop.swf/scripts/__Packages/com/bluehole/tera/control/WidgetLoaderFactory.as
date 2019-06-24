class com.bluehole.tera.control.WidgetLoaderFactory
{
   function WidgetLoaderFactory()
   {
   }
   static function getLoader(widgetData)
   {
      var _loc1_ = undefined;
      if(widgetData.staticWidget)
      {
         _loc1_ = new com.bluehole.tera.control.StaticWidgetLoader(widgetData);
      }
      else
      {
         _loc1_ = new com.bluehole.tera.control.WidgetLoader(widgetData);
      }
      return _loc1_;
   }
}
