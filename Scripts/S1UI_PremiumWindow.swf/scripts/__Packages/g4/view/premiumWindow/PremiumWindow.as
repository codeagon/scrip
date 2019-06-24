class g4.view.premiumWindow.PremiumWindow extends g4.core.View
{
   var selectedTabIndex = -2;
   function PremiumWindow(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.PREMIUM_WINDOW;
   }
   function configUI()
   {
      this.container_mc = this.__get__targetMovieClip().container_mc;
      this.mc_benefit_list_0 = this.container_mc.mc_benefit_list_0;
      this.mc_benefit_list_1 = this.container_mc.mc_benefit_list_1;
      this.mc_tab_0 = this.container_mc.mc_tab_0;
      this.mc_tab_1 = this.container_mc.mc_tab_1;
      this.container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip());
      this.productItemArray = [];
      var _loc2_ = undefined;
      var _loc3_ = g4.view.premiumWindow.PremiumWindowConstants.PRODUCT_ITEM_MAX_COUNT;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         this.productItemArray.push(this.container_mc.mc_product_list["item_" + _loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.contentGroupArray = [];
      this.configContentGroup(0,this.mc_tab_0,this.mc_benefit_list_0,"$760004");
      this.configContentGroup(1,this.mc_tab_1,this.mc_benefit_list_1,"$760005");
      this.setBenefitData(null,null);
      this.container_mc.text_title.text = "$760001";
      this.container_mc.text_title.verticalAlign = "center";
      g4.util.UIUtil.setMouseEnabled(this.container_mc.text_title,false);
      this.container_mc.text_info_1.text = "$760002";
      this.container_mc.text_info_1.verticalAlign = "center";
      g4.util.UIUtil.setMouseEnabled(this.container_mc.text_info_1,false);
      this.container_mc.text_info_2.text = "$760003";
      this.container_mc.text_info_2.verticalAlign = "center";
      g4.util.UIUtil.setMouseEnabled(this.container_mc.text_info_2,false);
      var _loc4_ = new lib.util.TxtBtn(this.container_mc.x_mc);
      _loc4_.setRelease(this.ToGame_PremiumWindow_CloseUI);
      var _loc5_ = this.container_mc.txtBtn1.txtBtn;
      _loc5_.setRelease(this.ToGame_PremiumWindow_CloseUI);
      g4.util.UIUtil.callLater(this,"ToGame_PremiumWindow_Init");
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_PremiumWindow_SetProductData",gfx.utils.Delegate.create(this,this.OnGame_PremiumWindow_SetProductData));
      this.registerGameInterface("OnGame_PremiumWindow_SetBenefitData",gfx.utils.Delegate.create(this,this.OnGame_PremiumWindow_SetBenefitData));
      this.registerGameInterface("OnGame_PremiumWindow_SetHighlightIDList",gfx.utils.Delegate.create(this,this.OnGame_PremiumWindow_SetHighlightIDList));
      this.registerGameInterface("OnGame_PremiumWindow_CoolTime",gfx.utils.Delegate.create(this,this.OnGame_PremiumWindow_CoolTime));
      this.registerGameInterface("OnGame_PremiumWindow_SetToggle",gfx.utils.Delegate.create(this,this.OnGame_PremiumWindow_SetToggle));
   }
   function beforeRemoveMovieClip()
   {
      this.setProductData(null);
   }
   function configContentGroup(index, tab, benefitList, label)
   {
      var _loc2_ = new g4.view.premiumWindow.ContentGroup(index,tab,benefitList);
      this.configTabButton(index,tab,label);
      this.contentGroupArray.push(_loc2_);
   }
   function configTabButton(index, button, label)
   {
      button.data = index;
      button.__set__label(label);
      button.soundID = lib.manager.UISound.TABMENU_BTN;
      button.verticalAlign = "center";
      button.textColorUp = 8564956;
      button.textColorOver = 8241151;
      button.textColorDown = 3105155;
      button.textColorDisabled = 5268600;
      button.textColorSelectedUp = 11524351;
      button.addEventListener("press",this,"tabButton_pressHandler");
   }
   function setSelectedTabIndex(index)
   {
      if(index == this.selectedTabIndex)
      {
         return undefined;
      }
      this.selectedTabIndex = index;
      this.updateBySelectedTabIndex();
   }
   function updateBySelectedTabIndex()
   {
      var _loc2_ = undefined;
      var _loc3_ = undefined;
      var _loc4_ = this.contentGroupArray.length;
      _loc3_ = 0;
      while(_loc3_ < _loc4_)
      {
         _loc2_ = this.contentGroupArray[_loc3_];
         if(_loc2_.__get__index() == this.selectedTabIndex)
         {
            _loc2_.show();
         }
         else
         {
            _loc2_.hide();
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function getProductItemAt(index)
   {
      if(index < 0 || index > g4.view.premiumWindow.PremiumWindowConstants.PRODUCT_ITEM_MAX_COUNT - 1)
      {
         return undefined;
      }
      return this.productItemArray[index];
   }
   function setProductData(dataList)
   {
      var _loc5_ = lib.util.ExtString.split(dataList,"\n");
      var _loc6_ = _loc5_ == null?0:_loc5_.length;
      var _loc4_ = undefined;
      var _loc2_ = undefined;
      var _loc7_ = g4.view.premiumWindow.PremiumWindowConstants.PRODUCT_ITEM_MAX_COUNT;
      _loc2_ = 0;
      while(_loc2_ < _loc7_)
      {
         _loc4_ = this.getProductItemAt(_loc2_);
         if(_loc2_ < _loc6_)
         {
            var _loc3_ = lib.util.ExtString.split(_loc5_[_loc2_],"\t");
            _loc4_.setData(Number(_loc3_[0]),_loc3_[1],Number(_loc3_[2]));
         }
         else
         {
            _loc4_.cleanUp();
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function cleanUpAllHighlights()
   {
      var _loc2_ = undefined;
      var _loc3_ = this.contentGroupArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (g4.view.premiumWindow.ContentGroup)this.contentGroupArray[_loc2_].cleanUpAllHighlights();
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateTabHighlight()
   {
      var _loc2_ = undefined;
      var _loc3_ = this.contentGroupArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (g4.view.premiumWindow.ContentGroup)this.contentGroupArray[_loc2_].updateTabHighlight();
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateData()
   {
      var _loc2_ = undefined;
      var _loc3_ = this.contentGroupArray.length;
      _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         (g4.view.premiumWindow.ContentGroup)this.contentGroupArray[_loc2_].updateData();
         _loc2_ = _loc2_ + 1;
      }
   }
   function setBenefitData(dataList0, dataList1)
   {
      this.cleanUpAllHighlights();
      g4.view.premiumWindow.DataMananger.__get__benefitDataListA().setData(dataList0);
      g4.view.premiumWindow.DataMananger.__get__benefitDataListB().setData(dataList1);
      this.updateData();
      var _loc3_ = g4.view.premiumWindow.DataMananger.__get__benefitDataListA().getDataCount() > 0;
      var _loc4_ = g4.view.premiumWindow.DataMananger.__get__benefitDataListB().getDataCount() > 0;
      var _loc2_ = this.selectedTabIndex;
      if(_loc3_ || _loc4_)
      {
         if(_loc2_ == -1)
         {
            if(_loc3_)
            {
               _loc2_ = 0;
            }
            else if(_loc4_)
            {
               _loc2_ = 1;
            }
         }
         else if(_loc2_ == 0 && !_loc3_ && _loc4_)
         {
            _loc2_ = 1;
         }
         else if(_loc2_ == 1 && !_loc4_ && _loc3_)
         {
            _loc2_ = 0;
         }
      }
      else
      {
         _loc2_ = -1;
      }
      this.mc_tab_0.__set__disabled(false);
      this.mc_tab_1.__set__disabled(false);
      this.setSelectedTabIndex(_loc2_);
      this.mc_tab_0.__set__disabled(!_loc3_);
      this.mc_tab_1.__set__disabled(!_loc4_);
   }
   function setHighlightIDList(idList)
   {
      this.cleanUpAllHighlights();
      var _loc3_ = undefined;
      var _loc4_ = lib.util.ExtString.split(idList,"\t");
      if(_loc4_ != null && _loc4_.length > 0)
      {
         var _loc2_ = undefined;
         var _loc5_ = _loc4_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            if(_loc3_ == null)
            {
               _loc3_ = {};
            }
            _loc3_[_loc4_[_loc2_]] = true;
            _loc2_ = _loc2_ + 1;
         }
      }
      g4.view.premiumWindow.DataMananger.__get__benefitDataListA().setHighlightData(_loc3_);
      g4.view.premiumWindow.DataMananger.__get__benefitDataListB().setHighlightData(_loc3_);
      this.updateTabHighlight();
      this.updateBySelectedTabIndex();
   }
   function OnGame_PremiumWindow_SetProductData(dataList)
   {
      this.setProductData(dataList);
   }
   function OnGame_PremiumWindow_SetBenefitData(dataList0, dataList1)
   {
      this.setBenefitData(dataList0,dataList1);
   }
   function OnGame_PremiumWindow_SetHighlightIDList(idList)
   {
      this.setHighlightIDList(idList);
   }
   function OnGame_PremiumWindow_CoolTime(id, remainingTime, totalTime)
   {
      id = Number(id);
      remainingTime = Number(remainingTime);
      totalTime = Number(totalTime);
      this.mc_benefit_list_0.setCoolTime(id,remainingTime,totalTime);
      this.mc_benefit_list_1.setCoolTime(id,remainingTime,totalTime);
   }
   function OnGame_PremiumWindow_SetToggle(id, registered)
   {
      id = Number(id);
      registered = g4.util.Converter.toBoolean(registered);
      this.mc_benefit_list_0.setToggle(id,registered);
      this.mc_benefit_list_1.setToggle(id,registered);
   }
   function ToGame_PremiumWindow_Init()
   {
      g4.model.GameInterface.callGameInterface("ToGame_PremiumWindow_Init");
   }
   function ToGame_PremiumWindow_CloseUI()
   {
      g4.model.GameInterface.callGameInterface("ToGame_PremiumWindow_CloseUI");
   }
   function tabButton_pressHandler(event)
   {
      var _loc2_ = Number((g4.component.Button)event.target.data);
      this.setSelectedTabIndex(_loc2_);
   }
}
