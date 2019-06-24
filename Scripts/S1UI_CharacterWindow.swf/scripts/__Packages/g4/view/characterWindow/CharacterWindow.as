class g4.view.characterWindow.CharacterWindow extends g4.core.View implements g4.gameInterface.ICharacterWindow
{
   var _debuffState = false;
   var _prevMP = -1;
   var sLevel = "";
   var sName = "";
   var _st = 0;
   var isDebug = false;
   function CharacterWindow($targetMovie)
   {
      super($targetMovie);
   }
   function getUIName()
   {
      return g4.view.ViewID.CHARACTER_WINDOW;
   }
   function configUI()
   {
      this.__get__targetMovieClip().container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip());
      this.mST = (g4.view.characterWindow.STGauge)this.__get__targetMovieClip().container_mc.mST;
      this.tName = this.__get__targetMovieClip().container_mc.tName;
      this.mHP = (g4.view.characterWindow.HPGauge)this.__get__targetMovieClip().container_mc.mHP;
      this.mMP = (g4.view.characterWindow.MPGauge)this.__get__targetMovieClip().container_mc.mMP;
      this.tGear = this.__get__targetMovieClip().container_mc.tGear;
      this.mGearCover = this.__get__targetMovieClip().container_mc.mGearCover;
      this.mMaster = this.__get__targetMovieClip().container_mc.mMaster;
      g4.util.UIUtil.setTextFieldStyle(this.tName,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setTextFieldStyle(this.tGear,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
      this.customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueHandlerChange");
      if(_global.gfxPlayer)
      {
         this.testInterval = setInterval(this,"tick",500);
         var _loc3_ = {};
         _loc3_.onKeyDown = g4.util.Delegate.create(this,this.keyHandlerDown);
         Key.addListener(_loc3_);
      }
   }
   function gaugeValueHandlerShow($value)
   {
      var _loc2_ = Number($value) != 1;
      this.mST.showValue(_loc2_);
      this.mMP.showValue(_loc2_);
   }
   function valueHandlerChange($event)
   {
      if($event.key == lib.gamedata.CustomizedUIDataKey.MAINGAUGE_SHOW_BOOLEAN)
      {
         this.gaugeValueHandlerShow($event.value);
      }
   }
   function keyHandlerDown()
   {
      if(Key.getCode() == 65)
      {
         this.OnGameEventUpdateST(500,1000,"500","1000");
      }
      else if(Key.getCode() == 68)
      {
         this._st = this._st + 10;
         if(this._st > 100)
         {
            this._st = 10;
         }
         this.OnGameEventUpdateST(0,0,"0","0");
      }
   }
   function tick()
   {
      clearInterval(this.testInterval);
      this.setViewVisible(true);
      this.OnGame_CharacterWindow_SetClass(4,5);
      this.OnGameEventUpdateHP(1000,1000,0);
      this.OnGameEventUpdateMP(1000,1000,0);
      this.OnGame_CharacterWindow_AwakenWizard(1,3,1,0.66);
      this.OnGameEventUpdateST(0,0,"500","1000");
      this.OnGameEventUpdateST(0,0,"500","1000");
      this.OnGameEventUpdateST(500,1000,"500","1000");
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_CharacterWindow_SetClass",g4.util.Delegate.create(this,this.OnGame_CharacterWindow_SetClass));
      this.registerGameInterface("OnGameEventUpdateST",g4.util.Delegate.create(this,this.OnGameEventUpdateST));
      this.registerGameInterface("OnGameEventUpdateUserName",g4.util.Delegate.create(this,this.OnGameEventUpdateUserName));
      this.registerGameInterface("OnGameEventUpdateUserLevel",g4.util.Delegate.create(this,this.OnGameEventUpdateUserLevel));
      this.registerGameInterface("OnGameEventUpdateHP",g4.util.Delegate.create(this,this.OnGameEventUpdateHP));
      this.registerGameInterface("OnGameEventUpdateMP",g4.util.Delegate.create(this,this.OnGameEventUpdateMP));
      this.registerGameInterface("OnGame_CharacterWindow_SetAwaken",g4.util.Delegate.create(this,this.OnGame_CharacterWindow_SetAwaken));
      this.registerGameInterface("OnGame_CharacterWindow_SetEquipmentLevel",g4.util.Delegate.create(this,this.OnGame_CharacterWindow_SetEquipmentLevel));
      this.registerGameInterface("OnGame_LogOut",g4.util.Delegate.create(this,this.OnGame_LogOut));
      this.registerGameInterface("OnGame_CharacterWindow_UpdateStack",g4.util.Delegate.create(this,this.OnGame_CharacterWindow_UpdateStack));
      this.registerGameInterface("OnGameEventAmIPartyMaster",g4.util.Delegate.create(this,this.OnGameEventAmIPartyMaster));
      this.registerGameInterface("OnGame_CharacterWindow_AchievementRating",g4.util.Delegate.create(this,this.OnGame_CharacterWindow_AchievementRating));
      this.registerGameInterface("OnGame_CharacterWindow_DebuffState",g4.util.Delegate.create(this,this.OnGame_CharacterWindow_DebuffState));
      this.registerGameInterface("OnGame_CharacterWindow_SpecialModeOn",g4.util.Delegate.create(this,this.OnGame_CharacterWindow_SpecialModeOn));
      this.registerGameInterface("OnGame_CharacterWindow_SpecialModeOff",g4.util.Delegate.create(this,this.OnGame_CharacterWindow_SpecialModeOff));
      this.registerGameInterface("OnGame_CharacterWindow_AwakenWizard",g4.util.Delegate.create(this,this.OnGame_CharacterWindow_AwakenWizard));
      this.registerGameInterface("OnGame_CharacterWindow_Debug",g4.util.Delegate.create(this,this.OnGame_CharacterWindow_Debug));
   }
   function updateName()
   {
      var _loc2_ = "Lv. " + String(this.sLevel);
      _loc2_ = _loc2_ + (" " + this.sName);
      this.tName.text = _loc2_;
      this.tName._width = Math.round(this.tName.textWidth + 4);
      this.mMaster._x = this.tName._x + this.tName._width;
   }
   function OnGame_CharacterWindow_SetClass($class, $gaugeType)
   {
      $class = Number($class);
      $gaugeType = Number($gaugeType);
      this._class = $class;
      this.mST.setClass($class);
      this.mMP.setClass($class);
      this.customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MAINGAUGE_SHOW_BOOLEAN,this,"gaugeValueHandlerShow");
   }
   function OnGameEventUpdateST($st, $maxSt, $str, $maxStr, $time)
   {
      switch(this._class)
      {
         case 0:
         case 1:
         case 5:
            this.mMP.updateST($st,$maxSt,$str,$maxStr,$time);
            break;
         default:
            this.mST.updateST($st,$maxSt,$str,$maxStr,$time);
      }
   }
   function OnGameEventUpdateUserName($name)
   {
      this.sName = $name;
      this.updateName();
   }
   function OnGameEventUpdateUserLevel($level)
   {
      this.sLevel = String($level);
      this.updateName();
   }
   function OnGameEventUpdateHP($hp, $maxHp, $maxHpAdd)
   {
      this.mHP.updateHP($hp,$maxHp,$maxHpAdd);
   }
   function OnGameEventUpdateMP($mp, $maxMp, $maxMpAdd)
   {
      this.mMP.updateMP($mp,$maxMp,$maxMpAdd);
   }
   function OnGame_CharacterWindow_SetAwaken($bAwaken)
   {
      this.mST.setAwaken($bAwaken);
   }
   function OnGame_CharacterWindow_SetEquipmentLevel($level)
   {
      lib.manager.ToolTip.remove(this.mGearCover);
      if($level == 0)
      {
         this.tGear.text = "";
         this.__get__targetMovieClip().container_mc.mEquip._visible = false;
      }
      else
      {
         this.__get__targetMovieClip().container_mc.mEquip._visible = true;
         this.tGear.text = String($level);
         this.tGear._width = Math.round(this.tGear.textWidth + 4);
         this.tGear._x = 590 - this.tGear._width;
         this.__get__targetMovieClip().container_mc.mEquip._x = this.tGear._x - 19;
         this.mGearCover._x = this.__get__targetMovieClip().container_mc.mEquip._x;
         this.mGearCover._width = this.tGear._width + this.__get__targetMovieClip().container_mc.mEquip._width;
         var _loc2_ = " <font size=\'16\' color=\'#FFFFFF\'>" + lib.util.UIString.getUIString("$021035") + "</font>";
         _loc2_ = _loc2_ + (" <font size=\'16\' color=\'#80E71C\'>" + $level + "</font><br>");
         _loc2_ = _loc2_ + "<img src=\'lineBitmap\'/><br>";
         _loc2_ = _loc2_ + lib.util.UIString.getUIString("$021036");
         lib.manager.ToolTip.add(this.mGearCover,_loc2_,1);
      }
   }
   function OnGame_LogOut()
   {
   }
   function OnGame_CharacterWindow_UpdateStack($stack, $switch, $bDisable)
   {
      this.mST.updateStack($stack);
   }
   function OnGameEventAmIPartyMaster($master)
   {
      this.mMaster._visible = $master != 0;
      this.mMaster.gotoAndStop($master);
      lib.manager.ToolTip.remove(this.mMaster);
      if($master == 1)
      {
         lib.manager.ToolTip.add(this.mMaster,lib.util.UIString.getUIString("$023007"),1);
      }
      else if($master == 2)
      {
         lib.manager.ToolTip.add(this.mMaster,lib.util.UIString.getUIString("$023013"),1);
      }
   }
   function OnGame_CharacterWindow_AchievementRating($grade)
   {
      $grade = Number($grade);
      this.mST.mAchievement.gotoAndStop($grade + 1);
   }
   function OnGame_CharacterWindow_DebuffState($debuff)
   {
      if($debuff == 1)
      {
         if(!this._debuffState)
         {
            this.mHP.mGauge.mHPMark.gotoAndStop(2);
            this.mHP.mGauge.mEffect.mc0.gotoAndStop(2);
            this.mHP.mGauge.mEffect.mc1.gotoAndStop(2);
            var _loc2_ = this.mHP.mText.textField.text;
            this.mHP.mText.gotoAndStop(2);
            this.mHP.mText.textField.text = _loc2_;
            this._debuffState = true;
         }
      }
      else if(this._debuffState)
      {
         this.mHP.mGauge.mHPMark.gotoAndStop(1);
         this.mHP.mGauge.mEffect.mc0.gotoAndStop(1);
         this.mHP.mGauge.mEffect.mc1.gotoAndStop(1);
         _loc2_ = this.mHP.mText.textField.text;
         this.mHP.mText.gotoAndStop(1);
         this.mHP.mText.textField.text = _loc2_;
         this._debuffState = false;
      }
   }
   function OnGame_CharacterWindow_SpecialModeOn($type, $maxTime)
   {
   }
   function OnGame_CharacterWindow_SpecialModeOff($type)
   {
   }
   function OnGame_CharacterWindow_AwakenWizard($element0, $element1, $element2, $stack)
   {
      this.mST.setAwakenWizard($element0,$element1,$element2,$stack);
   }
   function OnGame_CharacterWindow_Debug($value)
   {
      this.isDebug = $value == 1;
   }
}
