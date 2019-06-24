class g4.view.premiumWindow.DataMananger
{
   function DataMananger()
   {
   }
   static function impl()
   {
      if(g4.view.premiumWindow.DataMananger._impl == null)
      {
         g4.view.premiumWindow.DataMananger._impl = new g4.view.premiumWindow.DataManangerImpl();
      }
      return g4.view.premiumWindow.DataMananger._impl;
   }
   static function __get__benefitDataListA()
   {
      return g4.view.premiumWindow.DataMananger.impl().__get__benefitDataListA();
   }
   static function __get__benefitDataListB()
   {
      return g4.view.premiumWindow.DataMananger.impl().__get__benefitDataListB();
   }
}
