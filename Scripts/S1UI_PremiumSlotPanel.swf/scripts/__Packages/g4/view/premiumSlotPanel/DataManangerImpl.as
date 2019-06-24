class g4.view.premiumSlotPanel.DataManangerImpl
{
   function DataManangerImpl()
   {
      super();
      this._benefitDataListA = new g4.view.premiumSlotPanel.BenefitDataList();
      this._benefitDataListB = new g4.view.premiumSlotPanel.BenefitDataList();
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
