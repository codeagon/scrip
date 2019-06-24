class g4.view.premiumWindow.ContentGroup
{
   var _index = -1;
   function ContentGroup(index, tab, benefitList)
   {
      super();
      this._index = index;
      this.tab = tab;
      this.benefitList = benefitList;
      this.mc_tab_highlight = (MovieClip)tab.mc_highlight;
      this.hide();
   }
   function __get__index()
   {
      return this._index;
   }
   function getBenefitDataList()
   {
      if(this.__get__index() == 0)
      {
         return g4.view.premiumWindow.DataMananger.__get__benefitDataListA();
      }
      if(this.__get__index() == 1)
      {
         return g4.view.premiumWindow.DataMananger.__get__benefitDataListB();
      }
      return null;
   }
   function cleanUpAllHighlights()
   {
      this.setTabHighlight(false);
      this.benefitList.cleanUpAllHighlights();
   }
   function setTabHighlight(bHighlight)
   {
      if(bHighlight)
      {
         this.mc_tab_highlight._visible = true;
         this.mc_tab_highlight.gotoAndPlay(1);
      }
      else
      {
         this.mc_tab_highlight._visible = false;
         this.mc_tab_highlight.gotoAndStop(1);
      }
   }
   function updateTabHighlight()
   {
      this.setTabHighlight(this.getBenefitDataList().hasHighlightIDList());
   }
   function updateData()
   {
      this.benefitList.setData(this.getBenefitDataList());
   }
   function show()
   {
      this.setTabHighlight(false);
      this.tab.__set__selected(true);
      this.benefitList.show(this.getBenefitDataList());
   }
   function hide()
   {
      this.tab.__set__selected(false);
      this.benefitList.hide();
   }
}
