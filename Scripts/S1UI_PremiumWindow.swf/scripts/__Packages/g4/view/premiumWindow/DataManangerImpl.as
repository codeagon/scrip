class g4.view.premiumWindow.DataManangerImpl
{
   function DataManangerImpl()
   {
      super();
      this._benefitDataListA = new g4.view.premiumWindow.BenefitDataList();
      this._benefitDataListB = new g4.view.premiumWindow.BenefitDataList();
   }
   function __get__benefitDataListA()
   {
      return this._benefitDataListA;
   }
   function __get__benefitDataListB()
   {
      return this._benefitDataListB;
   }
}
