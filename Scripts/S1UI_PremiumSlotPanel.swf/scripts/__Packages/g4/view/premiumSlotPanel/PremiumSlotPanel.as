class g4.view.premiumSlotPanel.PremiumSlotPanel extends g4.core.View implements g4.gameInterface.IPremiumSlotPanel
{
   function PremiumSlotPanel(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.PREMIUM_SLOT_PANEL;
   }
   function configUI()
   {
      var _loc2_ = this.__get__targetMovieClip().container_mc;
      this._benefiltSlotGroup0 = _loc2_.benefiltSlotGroup0;
      this._benefiltSlotGroup1 = _loc2_.benefiltSlotGroup1;
      this._title = _loc2_.title;
      this._title.tf_title.text = lib.util.UIString.getUIString("$760001");
      this._uiDrager = _loc2_.uiDrager;
      this._uiDrager.setData(this.getUIName(),this.__get__targetMovieClip());
      this.setBenefitData(null,null);
      g4.util.UIUtil.callLater(this,"ToGame_PremiumSlotPanel_Init");
      g4.model.GameModel.addEventListener(g4.view.ViewID.PREMIUM_SLOT_PANEL,g4.model.GameModelEventType.MAIN_UI_MODE_CHANGED,this,"onMainUIModeChanged");
      this.onMainUIModeChanged();
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_PremiumSlotPanel_SetBenefitData",gfx.utils.Delegate.create(this,this.OnGame_PremiumSlotPanel_SetBenefitData));
      this.registerGameInterface("OnGame_PremiumSlotPanel_SetHighlightIDList",gfx.utils.Delegate.create(this,this.OnGame_PremiumSlotPanel_SetHighlightIDList));
      this.registerGameInterface("OnGame_PremiumSlotPanel_CoolTime",gfx.utils.Delegate.create(this,this.OnGame_PremiumSlotPanel_CoolTime));
      this.registerGameInterface("OnGame_PremiumSlotPanel_SetToggle",gfx.utils.Delegate.create(this,this.OnGame_PremiumSlotPanel_SetToggle));
   }
   function onMainUIModeChanged()
   {
      if(g4.model.GameModel.mainModel.uiMode == true)
      {
         this._title._visible = true;
         this._uiDrager._visible = true;
      }
      else
      {
         this._title._visible = false;
         this._uiDrager._visible = false;
      }
   }
   function setBenefitData(dataList0, dataList1)
   {
      this.cleanUpAllHighlights();
      g4.view.premiumSlotPanel.DataMananger.__get__benefitDataListA().setData(dataList0);
      g4.view.premiumSlotPanel.DataMananger.__get__benefitDataListB().setData(dataList1);
      this._benefiltSlotGroup0.setData(g4.view.premiumSlotPanel.DataMananger.__get__benefitDataListA());
      this._benefiltSlotGroup1.setData(g4.view.premiumSlotPanel.DataMananger.__get__benefitDataListB());
      var _loc5_ = g4.view.premiumSlotPanel.DataMananger.__get__benefitDataListA().getDataCount();
      var _loc3_ = g4.view.premiumSlotPanel.DataMananger.__get__benefitDataListB().getDataCount();
      var _loc2_ = Math.ceil(_loc5_ / g4.view.premiumSlotPanel.BenefiltSlotGroup.ROW_MAX_COUNT);
      var _loc4_ = Math.ceil(_loc3_ / g4.view.premiumSlotPanel.BenefiltSlotGroup.ROW_MAX_COUNT);
      this._benefiltSlotGroup1._y = 19 + _loc2_ * g4.view.premiumSlotPanel.BenefiltSlotGroup.SLOT_SIZE;
      this._title.bg._width = 4 + Math.min(g4.view.premiumSlotPanel.BenefiltSlotGroup.ROW_MAX_COUNT,Math.max(_loc5_,_loc3_)) * g4.view.premiumSlotPanel.BenefiltSlotGroup.SLOT_SIZE;
      this._title.bg._height = 21 + (_loc2_ + _loc4_) * g4.view.premiumSlotPanel.BenefiltSlotGroup.SLOT_SIZE;
      this._uiDrager._width = this._title.bg._width;
      this._uiDrager._height = this._title.bg._height;
      this._targetMovieClip.container_mc._y = (_loc2_ + _loc4_ - 1) * g4.view.premiumSlotPanel.BenefiltSlotGroup.SLOT_SIZE * -1;
   }
   function cleanUpAllHighlights()
   {
      this._benefiltSlotGroup0.cleanUpAllHighlights();
      this._benefiltSlotGroup1.cleanUpAllHighlights();
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
      g4.view.premiumSlotPanel.DataMananger.__get__benefitDataListA().setHighlightData(_loc3_);
      g4.view.premiumSlotPanel.DataMananger.__get__benefitDataListB().setHighlightData(_loc3_);
      this._benefiltSlotGroup0.show(g4.view.premiumSlotPanel.DataMananger.__get__benefitDataListA());
      this._benefiltSlotGroup1.show(g4.view.premiumSlotPanel.DataMananger.__get__benefitDataListB());
   }
   function OnGame_PremiumSlotPanel_SetBenefitData(dataList0, dataList1)
   {
      this.setBenefitData(dataList0,dataList1);
   }
   function OnGame_PremiumSlotPanel_SetHighlightIDList(idList)
   {
      this.setHighlightIDList(idList);
   }
   function OnGame_PremiumSlotPanel_CoolTime(id, remainingTime, totalTime)
   {
      id = Number(id);
      remainingTime = Number(remainingTime);
      totalTime = Number(totalTime);
      this._benefiltSlotGroup0.setCoolTime(id,remainingTime,totalTime);
      this._benefiltSlotGroup1.setCoolTime(id,remainingTime,totalTime);
   }
   function OnGame_PremiumSlotPanel_SetToggle(id, registered)
   {
      g4.util.Debug.log("g4.view.premiumSlotPanel.PremiumSlotPanel.OnGame_PremiumSlotPanel_SetToggle > id : " + id + ", registered : " + registered);
      id = Number(id);
      registered = g4.util.Converter.toBoolean(registered);
      this._benefiltSlotGroup0.setToggle(id,registered);
      this._benefiltSlotGroup1.setToggle(id,registered);
   }
   function ToGame_PremiumSlotPanel_Init()
   {
      g4.model.GameInterface.callGameInterface("ToGame_PremiumSlotPanel_Init");
   }
   function ToGame_PremiumSlotPanel_RightClick(id)
   {
   }
}
