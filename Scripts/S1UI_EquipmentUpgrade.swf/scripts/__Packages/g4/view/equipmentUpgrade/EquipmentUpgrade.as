class g4.view.equipmentUpgrade.EquipmentUpgrade extends g4.core.View implements g4.gameInterface.IEquipmentUpgrade
{
   function EquipmentUpgrade($targetMovie)
   {
      super($targetMovie);
   }
   function getUIName()
   {
      return g4.view.ViewID.EQUIPMENT_UPGRADE;
   }
   function configUI()
   {
      this.__get__targetMovieClip().container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip(),this.__get__targetMovieClip().lock_mc);
      this.mEnchantGroup = (g4.view.equipmentUpgrade.EnchantGroup)this.__get__targetMovieClip().container_mc.mEnchantGroup;
      this.mEvolutionGroup = (g4.view.equipmentUpgrade.EvolutionGroup)this.__get__targetMovieClip().container_mc.mEvolutionGroup;
      this.mRepairGroup = (g4.view.equipmentUpgrade.RepairGroup)this.__get__targetMovieClip().container_mc.mRepairGroup;
      this.bTab0 = (gfx.controls.Button)this.__get__targetMovieClip().container_mc.bTab0;
      this.bTab1 = (gfx.controls.Button)this.__get__targetMovieClip().container_mc.bTab1;
      this.bTab2 = (gfx.controls.Button)this.__get__targetMovieClip().container_mc.bTab2;
      this.bClose = (gfx.controls.Button)this.__get__targetMovieClip().container_mc.bClose;
      this.tTitle = this.__get__targetMovieClip().container_mc.tTitle;
      this.bClose.addEventListener(gfx.events.EventTypes.CLICK,this,"closeHandlerClick");
      this.mEnchantGroup.addEventListener("ToGame_EquipmentUpgrade_Click",this,"ToGame_EquipmentUpgrade_Click");
      this.mEnchantGroup.addEventListener("ToGame_EquipmentUpgrade_EndStartEffect",this,"ToGame_EquipmentUpgrade_EndStartEffect");
      this.mEnchantGroup.addEventListener("ToGame_EquipmentUpgrade_EndResultEffect",this,"ToGame_EquipmentUpgrade_EndResultEffect");
      this.mEvolutionGroup.addEventListener("ToGame_EquipmentUpgrade_Click",this,"ToGame_EquipmentUpgrade_Click");
      this.mEvolutionGroup.addEventListener("ToGame_EquipmentUpgrade_EndStartEffect",this,"ToGame_EquipmentUpgrade_EndStartEffect");
      this.mEvolutionGroup.addEventListener("ToGame_EquipmentUpgrade_EndResultEffect",this,"ToGame_EquipmentUpgrade_EndResultEffect");
      this.mRepairGroup.addEventListener("ToGame_EquipmentUpgrade_Click",this,"ToGame_EquipmentUpgrade_Click");
      this.mRepairGroup.addEventListener("ToGame_EquipmentUpgrade_EndStartEffect",this,"ToGame_EquipmentUpgrade_EndStartEffect");
      this.mRepairGroup.addEventListener("ToGame_EquipmentUpgrade_EndResultEffect",this,"ToGame_EquipmentUpgrade_EndResultEffect");
      this.tTitle.text = lib.util.UIString.getUIString("$155079");
      this.bTab0.__set__label(lib.util.UIString.getUIString("$155001"));
      this.bTab1.__set__label(lib.util.UIString.getUIString("$710001"));
      this.bTab2.__set__label(lib.util.UIString.getUIString("$156001"));
      this.selectedIndex = 0;
      this.bTab0.__set__disabled(true);
      this.bTab1.__set__disabled(false);
      this.bTab2.__set__disabled(false);
      this.bTab0.addEventListener(gfx.events.EventTypes.CLICK,this,"tabHandlerClick");
      this.bTab1.addEventListener(gfx.events.EventTypes.CLICK,this,"tabHandlerClick");
      this.bTab2.addEventListener(gfx.events.EventTypes.CLICK,this,"tabHandlerClick");
      this.mEvolutionGroup.__set__visible(false);
      this.mRepairGroup.__set__visible(false);
      if(_global.gfxPlayer)
      {
         this.testInterval = setInterval(this,"testTick",500);
      }
      this.ToGame_EquipmentUpgrade_Init();
   }
   function testTick()
   {
      clearInterval(this.testInterval);
      this.setViewVisible(true);
      this.OnGame_EquipmentUpgrade_Enchant_SetTargetItem(148410,"img://item__148410",3,"+0 울부짖는 분노의 권갑",0,0,448,458,"<Font color=\'#CCCCCC\'>공격 성능</Font>\t<Font color=\'#CCCCCC\'>26797</Font><BR>","<Font color=\'#CCCCCC\'>공격 성능</Font>\t<Font color=\'#CCCCCC\'>27198</Font><Font color=\'#7BC15E\'> (+401)</Font><BR>",0,4244);
      this.OnGame_EquipmentUpgrade_Enchant_SetMaterialItemList("98502\timg://item__98502\t2\t20\t0\t0\n98510\timg://item__98510\t2\t7\t0\t0\n98511\timg://item__98511\t2\t3\t0\t0\n368\timg://item__368\t2\t5\t0\t0\n",1380000,true,"&lt;font color=\'#57bb35\'&gt;강화 성공 확률 15.00%&lt;/font&gt;&#xA;&lt;font color=\'#DBB006\'&gt;(강화 성공 확률은 아래 항목들의 합에 의해 계산되며, 소수점 셋째 자리 이하는 버림 처리되어 표시됩니다.)&lt;/font&gt;&#xA;기본 강화 성공 확률 15.00%&#xA;장비 숙련도에 의한 보정치 0.00%&#xA;강화 실패에 의한 보정치 0.00%&#xA;&lt;BR&gt;&#xA;&lt;font color=\'#57bb35\'&gt;장비 숙련도란?&lt;/font&gt;&lt;BR&gt; 발키온 지령서 완료 시 얻을 수 있는 수치로서, 강화/승급 성공 확률을 상승시켜줍니다.(Lv.65 장비에만 해당)&#xA;장비 숙련도가 툴팁에 표시된 값에 도달할 때부터 보정치가 최대가 되며, 최대 60000까지 장비 숙련도를 획득할 수 있습니다.");
      this.OnGame_EquipmentUpgrade_Enchant_SetButtonState("강화하기\t0");
      this.OnGame_EquipmentUpgrade_Evolution_SetTargetItem(148410,"img://item__148410",3,"+0 울부짖는 분노의 권갑",0,448,458,"<Font color=\'#CCCCCC\'>공격 성능</Font>\t<Font color=\'#CCCCCC\'>26797</Font><BR>","<Font color=\'#CCCCCC\'>공격 성능</Font>\t<Font color=\'#CCCCCC\'>27198</Font><Font color=\'#7BC15E\'> (+401)</Font><BR>");
      this.OnGame_EquipmentUpgrade_Evolution_SetResultItem(148410,"img://item__148410",3,"+0 울부짖는 분노의 권갑",0,448,458);
      this.OnGame_EquipmentUpgrade_Evolution_SetMaterialItemList("98502\timg://item__98502\t2\t20\t0\t0\n98510\timg://item__98510\t2\t7\t0\t0\n98511\timg://item__98511\t2\t3\t0\t0\n368\timg://item__368\t2\t5\t0\t0\n",1380000,true,"&lt;font color=\'#57bb35\'&gt;강화 성공 확률 15.00%&lt;/font&gt;&#xA;&lt;font color=\'#DBB006\'&gt;(강화 성공 확률은 아래 항목들의 합에 의해 계산되며, 소수점 셋째 자리 이하는 버림 처리되어 표시됩니다.)&lt;/font&gt;&#xA;기본 강화 성공 확률 15.00%&#xA;장비 숙련도에 의한 보정치 0.00%&#xA;강화 실패에 의한 보정치 0.00%&#xA;&lt;BR&gt;&#xA;&lt;font color=\'#57bb35\'&gt;장비 숙련도란?&lt;/font&gt;&lt;BR&gt; 발키온 지령서 완료 시 얻을 수 있는 수치로서, 강화/승급 성공 확률을 상승시켜줍니다.(Lv.65 장비에만 해당)&#xA;장비 숙련도가 툴팁에 표시된 값에 도달할 때부터 보정치가 최대가 되며, 최대 60000까지 장비 숙련도를 획득할 수 있습니다.");
      this.OnGame_EquipmentUpgrade_Evolution_SetButtonState("승급하기\t0");
      this.OnGame_EquipmentUpgrade_Repair_SetTargetItem(148410,"img://item__148410",3,"+0 울부짖는 분노의 권갑",0,448,458,"<Font color=\'#CCCCCC\'>공격 성능</Font>\t<Font color=\'#CCCCCC\'>26797</Font><BR>");
      this.OnGame_EquipmentUpgrade_Repair_SetMaterialItemList("98502\timg://item__98502\t2\t20\t0\t0\n98510\timg://item__98510\t2\t7\t0\t0\n98511\timg://item__98511\t2\t3\t0\t0\n368\timg://item__368\t2\t5\t0\t0\n",1380000,true,"&lt;font color=\'#57bb35\'&gt;강화 성공 확률 15.00%&lt;/font&gt;&#xA;&lt;font color=\'#DBB006\'&gt;(강화 성공 확률은 아래 항목들의 합에 의해 계산되며, 소수점 셋째 자리 이하는 버림 처리되어 표시됩니다.)&lt;/font&gt;&#xA;기본 강화 성공 확률 15.00%&#xA;장비 숙련도에 의한 보정치 0.00%&#xA;강화 실패에 의한 보정치 0.00%&#xA;&lt;BR&gt;&#xA;&lt;font color=\'#57bb35\'&gt;장비 숙련도란?&lt;/font&gt;&lt;BR&gt; 발키온 지령서 완료 시 얻을 수 있는 수치로서, 강화/승급 성공 확률을 상승시켜줍니다.(Lv.65 장비에만 해당)&#xA;장비 숙련도가 툴팁에 표시된 값에 도달할 때부터 보정치가 최대가 되며, 최대 60000까지 장비 숙련도를 획득할 수 있습니다.");
      this.OnGame_EquipmentUpgrade_Repair_SetButtonState("수리하기\t0");
      this.OnGame_EquipmentUpgrade_Enchant_ClearTargetItem();
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_EquipmentUpgrade_SetTab",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_SetTab));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Enchant_SetTargetItem",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Enchant_SetTargetItem));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Enchant_ClearTargetItem",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Enchant_ClearTargetItem));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Enchant_SetMaterialItemList",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Enchant_SetMaterialItemList));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Enchant_SetButtonState",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Enchant_SetButtonState));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Enchant_StartProgress",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Enchant_StartProgress));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Enchant_SetResult",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Enchant_SetResult));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Evolution_SetTargetItem",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Evolution_SetTargetItem));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Evolution_SetResultItem",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Evolution_SetResultItem));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Evolution_ClearTargetItem",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Evolution_ClearTargetItem));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Evolution_SetMaterialItemList",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Evolution_SetMaterialItemList));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Evolution_SetButtonState",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Evolution_SetButtonState));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Evolution_StartProgress",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Evolution_StartProgress));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Evolution_SetResult",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Evolution_SetResult));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Repair_SetTargetItem",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Repair_SetTargetItem));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Repair_ClearTargetItem",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Repair_ClearTargetItem));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Repair_SetMaterialItemList",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Repair_SetMaterialItemList));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Repair_SetButtonState",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Repair_SetButtonState));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Repair_StartProgress",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Repair_StartProgress));
      this.registerGameInterface("OnGame_EquipmentUpgrade_Repair_SetResult",g4.util.Delegate.create(this,this.OnGame_EquipmentUpgrade_Repair_SetResult));
      this.registerGameInterface("OnGame_MouseDown",g4.util.Delegate.create(this,this.OnGame_MouseDown));
   }
   function tabHandlerClick(event)
   {
      var _loc2_ = Number(event.target._name.substr(4));
      this.ToGame_EquipmentUpgrade_ChangeTab(_loc2_);
   }
   function closeHandlerClick(event)
   {
      this.ToGame_EquipmentUpgrade_CloseUI();
   }
   function setEnableTab($enable)
   {
      this.bTab0.hitTestDisable = !$enable;
      this.bTab1.hitTestDisable = !$enable;
      this.bTab2.hitTestDisable = !$enable;
   }
   function OnGame_EquipmentUpgrade_SetTab($tabIndex)
   {
      if(this.selectedIndex != $tabIndex)
      {
         this.bTab0.__set__disabled($tabIndex == 0);
         this.bTab1.__set__disabled($tabIndex == 1);
         this.bTab2.__set__disabled($tabIndex == 2);
         this.selectedIndex = $tabIndex;
         this.mEnchantGroup.__set__visible($tabIndex == 0);
         this.mEvolutionGroup.__set__visible($tabIndex == 1);
         this.mRepairGroup.__set__visible($tabIndex == 2);
      }
   }
   function OnGame_EquipmentUpgrade_Enchant_SetTargetItem($itemID, $img, $grade, $name, $enchant, $bMax, $currentLevel, $maxLevel, $currentInfo, $nextInfo)
   {
      this.mEnchantGroup.setTargetItem($itemID,$img,$grade,$name,$enchant,$bMax,$currentLevel,$maxLevel,$currentInfo,$nextInfo);
   }
   function OnGame_EquipmentUpgrade_Enchant_ClearTargetItem()
   {
      this.mEnchantGroup.setClearTargetItem();
   }
   function OnGame_EquipmentUpgrade_Enchant_SetMaterialItemList($itemParam, $gold, $bEnough, $rateMessage, $tooltipDetail)
   {
      this.mEnchantGroup.setMaterialList($itemParam,$gold,$bEnough,$rateMessage,$tooltipDetail);
   }
   function OnGame_EquipmentUpgrade_Enchant_SetButtonState($buttonParam)
   {
      this.mEnchantGroup.setButtonState($buttonParam);
   }
   function OnGame_EquipmentUpgrade_Enchant_StartProgress()
   {
      this.mEnchantGroup.startProgress();
      this.setEnableTab(false);
   }
   function OnGame_EquipmentUpgrade_Enchant_SetResult($success)
   {
      this.mEnchantGroup.setResult($success);
      this.setEnableTab(false);
   }
   function OnGame_EquipmentUpgrade_Evolution_SetTargetItem($itemID, $img, $grade, $name, $enchant, $currentLevel, $maxLevel, $currentInfo, $nextInfo)
   {
      this.mEvolutionGroup.setTargetItem($itemID,$img,$grade,$name,$enchant,$currentLevel,$maxLevel,$currentInfo,$nextInfo);
   }
   function OnGame_EquipmentUpgrade_Evolution_SetResultItem($itemID, $img, $grade, $name, $enchant, $currentLevel, $maxLevel)
   {
      this.mEvolutionGroup.setResultItem($itemID,$img,$grade,$name,$enchant,$currentLevel,$maxLevel);
   }
   function OnGame_EquipmentUpgrade_Evolution_ClearTargetItem()
   {
      this.mEvolutionGroup.setClearTargetItem();
   }
   function OnGame_EquipmentUpgrade_Evolution_SetMaterialItemList($itemParam, $gold, $bEnough, $rateMessage, $tooltipDetail)
   {
      this.mEvolutionGroup.setMaterialItemList($itemParam,$gold,$bEnough,$rateMessage,$tooltipDetail);
   }
   function OnGame_EquipmentUpgrade_Evolution_SetButtonState($param)
   {
      this.mEvolutionGroup.setButtonState($param);
   }
   function OnGame_EquipmentUpgrade_Evolution_StartProgress()
   {
      this.mEvolutionGroup.startProgress();
      this.setEnableTab(false);
   }
   function OnGame_EquipmentUpgrade_Evolution_SetResult($success)
   {
      this.mEvolutionGroup.setResult($success);
      this.setEnableTab(false);
   }
   function OnGame_EquipmentUpgrade_Repair_SetTargetItem($itemID, $img, $grade, $name, $enchant, $currentLevel, $maxLevel, $currentInfo)
   {
      this.mRepairGroup.setTargetItem($itemID,$img,$grade,$name,$enchant,$currentLevel,$maxLevel,$currentInfo);
   }
   function OnGame_EquipmentUpgrade_Repair_ClearTargetItem()
   {
      this.mRepairGroup.setClearTargetItem();
   }
   function OnGame_EquipmentUpgrade_Repair_SetMaterialItemList($itemParam, $gold, $bEnough, $rateMessage, $tooltipDetail)
   {
      this.mRepairGroup.setMaterialItemList($itemParam,$gold,$bEnough,$rateMessage,$tooltipDetail);
   }
   function OnGame_EquipmentUpgrade_Repair_SetButtonState($buttonState)
   {
      this.mRepairGroup.setButtonState($buttonState);
   }
   function OnGame_EquipmentUpgrade_Repair_StartProgress()
   {
      this.mRepairGroup.startProgress();
      this.setEnableTab(false);
   }
   function OnGame_EquipmentUpgrade_Repair_SetResult($result)
   {
      this.mRepairGroup.setResult($result);
      this.setEnableTab(false);
   }
   function OnGame_MouseDown($button, $target)
   {
      if(!this.__get__targetMovieClip().bWindowOpen)
      {
         return undefined;
      }
      if($button == 2)
      {
         if($target._parent._name == "EquipmentUpgrade__0" && $target._parent._parent._name == "mEnchantGroup")
         {
            this.ToGame_EquipmentUpgrade_ClickMouseRightButton(0);
         }
         else if($target._parent._name == "EquipmentUpgrade__0" && $target._parent._parent._name == "mEvolutionGroup")
         {
            this.ToGame_EquipmentUpgrade_ClickMouseRightButton(1);
         }
         else if($target._parent._name == "EquipmentUpgrade__0" && $target._parent._parent._name == "mRepairGroup")
         {
            this.ToGame_EquipmentUpgrade_ClickMouseRightButton(2);
         }
      }
   }
   function ToGame_EquipmentUpgrade_Init()
   {
      fscommand("ToGame_EquipmentUpgrade_Init");
   }
   function ToGame_EquipmentUpgrade_CloseUI()
   {
      fscommand("ToGame_EquipmentUpgrade_CloseUI");
   }
   function ToGame_EquipmentUpgrade_ChangeTab($idx)
   {
      getURL("FSCommand:ToGame_EquipmentUpgrade_ChangeTab",$idx);
      if(_global.gfxPlayer)
      {
         this.OnGame_EquipmentUpgrade_SetTab($idx);
      }
   }
   function ToGame_EquipmentUpgrade_Click($event)
   {
      getURL("FSCommand:ToGame_EquipmentUpgrade_Click",$event.index);
      if(_global.gfxPlayer)
      {
         if($event.index == 0)
         {
            this.OnGame_EquipmentUpgrade_Enchant_StartProgress();
         }
         else if($event.index == 1)
         {
            this.OnGame_EquipmentUpgrade_Evolution_StartProgress();
         }
         else if($event.index == 2)
         {
            this.OnGame_EquipmentUpgrade_Repair_StartProgress();
         }
      }
   }
   function ToGame_EquipmentUpgrade_EndStartEffect($event)
   {
      getURL("FSCommand:ToGame_EquipmentUpgrade_EndStartEffect",$event.index);
      this.setEnableTab(true);
      if(_global.gfxPlayer)
      {
         if($event.index == 0)
         {
            this.OnGame_EquipmentUpgrade_Enchant_SetResult(2);
         }
         else if($event.index == 1)
         {
            this.OnGame_EquipmentUpgrade_Evolution_SetResult(3);
         }
         else if($event.index == 2)
         {
            this.OnGame_EquipmentUpgrade_Repair_SetResult(false);
         }
      }
   }
   function ToGame_EquipmentUpgrade_EndResultEffect($event)
   {
      getURL("FSCommand:ToGame_EquipmentUpgrade_EndResultEffect",$event.index);
      this.setEnableTab(true);
   }
   function ToGame_EquipmentUpgrade_ClickMouseRightButton($idx)
   {
      getURL("FSCommand:ToGame_EquipmentUpgrade_ClickMouseRightButton",$idx);
   }
   function ToGame_EquipmentUpgrade_Enchant_SelectedMaterialSlot($index)
   {
   }
}
