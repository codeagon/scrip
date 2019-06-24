class g4.view.gaugeBoss.GaugeBoss extends g4.core.View implements g4.gameInterface.IGaugeBoss
{
   var _front = -1;
   var _focus = -1;
   var testValue = 0;
   function GaugeBoss($targetMovie)
   {
      super($targetMovie);
   }
   function getUIName()
   {
      return g4.view.ViewID.GAGE_BOSS;
   }
   function configUI()
   {
      this.__get__targetMovieClip().container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip());
      this.gaugeBuff = this.__get__targetMovieClip().container_mc.gaugeBuff;
      this.gaugeBuff.addEventListener("remove_buff",this,"buffHandlerRemove");
      this._gauges = [];
      this._gauges[0] = (g4.view.gaugeBoss.BossGauge)this.__get__targetMovieClip().container_mc.mGauge0;
      this._gauges[1] = (g4.view.gaugeBoss.BossGauge)this.__get__targetMovieClip().container_mc.mGauge1;
      this._gauges[0]._visible = false;
      this._gauges[1]._visible = false;
      this.ToGame_GageBoss_Init();
      if(_global.gfxPlayer)
      {
         this.setViewVisible(true);
         this.OnGame_GageBoss_Add(0);
         this.OnGame_GageBoss_SetBossData("첫번째",77,1,0);
         this.OnGame_GageBoss_Focus(0);
         this.OnGame_GageBoss_AddBuff(112,1,2,0,"",3000,3000);
         this.testInterval = setInterval(this,"tick",5000);
      }
   }
   function tick()
   {
      this.OnGame_GageBoss_RemoveBuff(112);
      clearInterval(this.testInterval);
      this.testInterval = setInterval(this,"tick2",1000);
   }
   function tick2()
   {
      clearInterval(this.testInterval);
      this.OnGame_GageBoss_AddBuff(112,1,2,0,"",3000,3000);
   }
   function testTick()
   {
      clearInterval(this.testInterval);
      this.OnGame_GageBoss_UpDataHp(9400,10000);
   }
   function buffHandlerRemove($event)
   {
      this.OnGame_GageBoss_RemoveBuff($event.id);
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_GageBoss_Add",g4.util.Delegate.create(this,this.OnGame_GageBoss_Add));
      this.registerGameInterface("OnGame_GageBoss_Remove",g4.util.Delegate.create(this,this.OnGame_GageBoss_Remove));
      this.registerGameInterface("OnGame_GageBoss_Focus",g4.util.Delegate.create(this,this.OnGame_GageBoss_Focus));
      this.registerGameInterface("OnGame_GageBoss_Swap",g4.util.Delegate.create(this,this.OnGame_GageBoss_Swap));
      this.registerGameInterface("OnGame_GageBoss_SetBossData",g4.util.Delegate.create(this,this.OnGame_GageBoss_SetBossData));
      this.registerGameInterface("OnGame_GageBoss_PercentVisible",g4.util.Delegate.create(this,this.OnGame_GageBoss_PercentVisible));
      this.registerGameInterface("OnGame_GageBoss_SetHp",g4.util.Delegate.create(this,this.OnGame_GageBoss_SetHp));
      this.registerGameInterface("OnGame_GageBoss_UpDataHp",g4.util.Delegate.create(this,this.OnGame_GageBoss_UpDataHp));
      this.registerGameInterface("OnGame_GageBoss_DangerMode",g4.util.Delegate.create(this,this.OnGame_GageBoss_DangerMode));
      this.registerGameInterface("OnGame_GageBoss_AddBuff",g4.util.Delegate.create(this,this.OnGame_GageBoss_AddBuff));
      this.registerGameInterface("OnGame_GageBoss_UpDateBuff",g4.util.Delegate.create(this,this.OnGame_GageBoss_UpDateBuff));
      this.registerGameInterface("OnGame_GageBoss_RemoveBuff",g4.util.Delegate.create(this,this.OnGame_GageBoss_RemoveBuff));
      this.registerGameInterface("OnGame_GageBoss_ClearBuff",g4.util.Delegate.create(this,this.OnGame_GageBoss_ClearBuff));
      this.registerGameInterface("OnGame_GageBoss_HoldBuff",g4.util.Delegate.create(this,this.OnGame_GageBoss_HoldBuff));
      this.registerGameInterface("OnGame_GageBoss_SetStack",g4.util.Delegate.create(this,this.OnGame_GageBoss_SetStack));
      this.registerGameInterface("OnGame_GageBoss_DangerTime",g4.util.Delegate.create(this,this.OnGame_GageBoss_DangerTime));
   }
   function swapItem($index)
   {
      var _loc3_ = this._gauges[$index];
      var _loc2_ = $index != 0?this._gauges[0]:this._gauges[1];
      if(_loc3_.isActive && this._front != $index && _loc2_.isActive)
      {
         _loc3_.transform.colorTransform = lib.info.ColorTrans.enableTrans();
         _loc2_.transform.colorTransform = lib.info.ColorTrans.popupDisableTrans();
         gs.TweenLite.killTweensOf(_loc3_,false);
         gs.TweenLite.killTweensOf(_loc2_,false);
         gs.TweenLite.to(_loc3_,0.5,{_x:0,_y:9},gs.easing.Strong.easeOut);
         gs.TweenLite.to(_loc2_,0.5,{_x:16,_y:0},gs.easing.Strong.easeOut);
         _loc2_.setDanger(false);
         _loc3_.swapDepths(_loc2_);
         this._front = $index;
      }
   }
   function OnGame_GageBoss_Add($index)
   {
      this._gauges[$index].isActive = true;
      this._gauges[$index]._visible = true;
      this._focus = $index;
      this.swapItem($index);
   }
   function OnGame_GageBoss_Remove($index)
   {
      this._gauges[$index].isActive = false;
      this._gauges[$index]._visible = false;
      var _loc2_ = $index != 0?0:1;
      if(this._gauges[_loc2_].isActive)
      {
         this._focus = _loc2_;
         this.swapItem(_loc2_);
      }
   }
   function OnGame_GageBoss_Focus($index)
   {
      this._focus = $index;
   }
   function OnGame_GageBoss_Swap($index)
   {
      this.swapItem($index);
   }
   function OnGame_GageBoss_SetBossData($bossName, $bossLevel, $levelType, $questType, $showHP)
   {
      (g4.view.gaugeBoss.BossGauge)this._gauges[this._focus].setData($bossName,$bossLevel,$levelType,$questType,$showHP);
      this.gaugeBuff._y = 53;
   }
   function OnGame_GageBoss_PercentVisible($visible)
   {
      (g4.view.gaugeBoss.BossGauge)this._gauges[0].mNameGroup._visible = $visible == 1;
      (g4.view.gaugeBoss.BossGauge)this._gauges[1].mNameGroup._visible = $visible == 1;
   }
   function OnGame_GageBoss_SetHp($hp, $maxHp, $maxRank)
   {
      (g4.view.gaugeBoss.BossGauge)this._gauges[this._focus].setHP($hp,$maxHp,$maxRank);
   }
   function OnGame_GageBoss_UpDataHp($currentHp, $critical)
   {
      (g4.view.gaugeBoss.BossGauge)this._gauges[this._focus].updateHP($currentHp,$critical);
   }
   function OnGame_GageBoss_DangerMode($true)
   {
      (g4.view.gaugeBoss.BossGauge)this._gauges[this._focus].setDanger($true == 1);
   }
   function OnGame_GageBoss_DangerTime($time)
   {
      (g4.view.gaugeBoss.BossGauge)this._gauges[this._focus].setDangerTime($time);
   }
   function OnGame_GageBoss_AddBuff($id, $stack, $type, $bRelax, $img, $remain, $total)
   {
      this.gaugeBuff.addBuff($id,$stack,$type,$bRelax,$img,$remain,$total);
   }
   function OnGame_GageBoss_UpDateBuff($id, $stack, $bRelax, $img, $remain, $total)
   {
      this.gaugeBuff.updateBuff($id,$stack,$bRelax,$img,$remain,$total);
   }
   function OnGame_GageBoss_RemoveBuff($id)
   {
      this.gaugeBuff.removeBuff($id);
   }
   function OnGame_GageBoss_ClearBuff($type)
   {
      this.gaugeBuff.clearBuff($type);
   }
   function OnGame_GageBoss_HoldBuff($id)
   {
      this.gaugeBuff.holdBuff($id);
   }
   function OnGame_GageBoss_SetStack($stack)
   {
      $stack = Number($stack);
      (g4.view.gaugeBoss.BossGauge)this._gauges[this._focus].setStack($stack);
      this.gaugeBuff._y = 60;
   }
   function ToGame_GageBoss_Init()
   {
      fscommand("ToGame_GageBoss_Init");
   }
   function OnGameEventShowWindow(windowName, bVisible)
   {
      super.OnGameEventShowWindow(windowName,bVisible);
      if(windowName.toLowerCase() == this.getUIName().toLowerCase() && bVisible == false)
      {
         this.gaugeBuff.clearBuff();
      }
   }
}
