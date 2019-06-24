class g4.view.targetInfo.TargetInfo extends g4.core.View implements g4.gameInterface.ITargetInfo
{
   function TargetInfo($targetMovie)
   {
      super($targetMovie);
   }
   function getUIName()
   {
      return g4.view.ViewID.TARGET_INFO;
   }
   function configUI()
   {
      this.__get__targetMovieClip().container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip());
      this.targetGauge1 = this.__get__targetMovieClip().container_mc.targetGauge1;
      this.targetGauge2 = this.__get__targetMovieClip().container_mc.targetGauge2;
      this.targetGauge2.xMin = 44;
      this.gaugeBuff = this.__get__targetMovieClip().container_mc.gaugeBuff;
      this.gaugeBuff.addEventListener("remove_buff",this,"buffHandlerRemove");
      this.ToGame_TargetInfo_Init();
      if(_global.gfxPlayer)
      {
         this.testInterval = setInterval(this,"tick",100);
      }
   }
   function buffHandlerRemove(event)
   {
      this.OnGame_TargetInfo_RemoveBuff(event.id);
   }
   function tick()
   {
      clearInterval(this.testInterval);
      this.setViewVisible(true);
      this.OnGame_TargetInfo_AddBuff(999009732,1,0,0,"img://abonormality__999009732",4031,15000);
      this.OnGame_TargetInfo_SetData(4,"폭풍의 카나쉬\t68","229\t145\t100",1,0,0,"",0,0);
   }
   function tick2()
   {
      this.OnGame_TargetInfo_SetData(3,"화끈한 바실리스크\t22","255\t33\t00",0,0,1,"d",33);
      this.OnGame_TargetInfo_AddBuff(111,1,2,0,"",10000,10000);
      clearInterval(this.testInterval);
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_TargetInfo_SetData",g4.util.Delegate.create(this,this.OnGame_TargetInfo_SetData));
      this.registerGameInterface("OnGame_TargetInfo_UpdateLevel",g4.util.Delegate.create(this,this.OnGame_TargetInfo_UpdateLevel));
      this.registerGameInterface("OnGame_TargetInfo_UpdateHP",g4.util.Delegate.create(this,this.OnGame_TargetInfo_UpdateHP));
      this.registerGameInterface("OnGame_TargetInfo_UpdateMP",g4.util.Delegate.create(this,this.OnGame_TargetInfo_UpdateMP));
      this.registerGameInterface("OnGame_TargetInfo_AddBuff",g4.util.Delegate.create(this,this.OnGame_TargetInfo_AddBuff));
      this.registerGameInterface("OnGame_TargetInfo_UpdateBuff",g4.util.Delegate.create(this,this.OnGame_TargetInfo_UpdateBuff));
      this.registerGameInterface("OnGame_TargetInfo_RemoveBuff",g4.util.Delegate.create(this,this.OnGame_TargetInfo_RemoveBuff));
      this.registerGameInterface("OnGame_TargetInfo_ClearBuff",g4.util.Delegate.create(this,this.OnGame_TargetInfo_ClearBuff));
      this.registerGameInterface("OnGame_TargetInfo_HoldBuff",g4.util.Delegate.create(this,this.OnGame_TargetInfo_HoldBuff));
      this.registerGameInterface("OnGame_TargetInfo_SetStack",g4.util.Delegate.create(this,this.OnGame_TargetInfo_SetStack));
      this.registerGameInterface("OnGame_TargetInfo_DangerMode",g4.util.Delegate.create(this,this.OnGame_TargetInfo_DangerMode));
   }
   function OnGame_TargetInfo_SetData($targetType, $targetInfo, $nameColor, $bFreeNamed, $aggresive, $questType, $questName, $itemLevel)
   {
      $targetType = Number($targetType);
      $bFreeNamed = Number($bFreeNamed);
      $aggresive = Number($aggresive);
      $questType = Number($questType);
      $itemLevel = Number($itemLevel);
      switch($targetType)
      {
         case 0:
         case 1:
         case 2:
         case 4:
         case 6:
            this.targetGauge1._visible = false;
            this.targetGauge2._visible = true;
            this.focusGauge = this.targetGauge2;
            this.gaugeBuff._x = 33;
            break;
         case 3:
         case 5:
            this.targetGauge1._visible = true;
            this.targetGauge2._visible = false;
            this.focusGauge = this.targetGauge1;
            this.gaugeBuff._x = 94;
      }
      this.gaugeBuff._y = 43;
      this.focusGauge.setData($targetType,$targetInfo,$nameColor,$bFreeNamed,$aggresive,$questType,$questName,$itemLevel);
      getURL("FSCommand:ToGame_TargetInfo_ChangeLock",0);
   }
   function OnGame_TargetInfo_UpdateLevel($level)
   {
      this.focusGauge.updateLevel($level);
   }
   function OnGame_TargetInfo_UpdateHP($hp)
   {
      this.focusGauge.updateHP($hp);
   }
   function OnGame_TargetInfo_UpdateMP($mp)
   {
      this.focusGauge.updateMP($mp);
   }
   function OnGame_TargetInfo_AddBuff($id, $stack, $type, $bRelaxMerit, $img, $remain, $total)
   {
      this.gaugeBuff.addBuff($id,$stack,$type,$bRelaxMerit,$img,$remain,$total);
   }
   function OnGame_TargetInfo_UpdateBuff($id, $stack, $relaxMerit, $img, $remain, $total)
   {
      this.gaugeBuff.updateBuff($id,$stack,$relaxMerit,$img,$remain,$total);
   }
   function OnGame_TargetInfo_RemoveBuff($id)
   {
      this.gaugeBuff.removeBuff($id);
   }
   function OnGame_TargetInfo_ClearBuff($type)
   {
      this.gaugeBuff.clearBuff($type);
   }
   function OnGame_TargetInfo_HoldBuff($id)
   {
      this.gaugeBuff.holdBuff($id);
   }
   function OnGame_TargetInfo_SetStack($stack)
   {
      this.gaugeBuff._y = 50;
      this.focusGauge.setStack($stack);
   }
   function OnGame_TargetInfo_DangerMode($mode)
   {
      $mode = Number($mode);
      if(this.focusGauge != null)
      {
         this.focusGauge.setDangerMode($mode);
      }
   }
   function ToGame_TargetInfo_Init()
   {
      fscommand("ToGame_TargetInfo_Init");
   }
   function ToGame_TargetInfo_ChangeLock($lock)
   {
   }
   function ToGame_TargetInfo_CloseUI()
   {
   }
   function ToGame_TargetInfo_RequestQuest()
   {
   }
}
