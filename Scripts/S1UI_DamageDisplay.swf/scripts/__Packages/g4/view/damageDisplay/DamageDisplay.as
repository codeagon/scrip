class g4.view.damageDisplay.DamageDisplay extends g4.core.View implements g4.gameInterface.IDamageDisplay
{
   function DamageDisplay($targetMovie)
   {
      super($targetMovie);
   }
   function getUIName()
   {
      return "DamageDisplay";
   }
   function configUI()
   {
      this.__get__targetMovieClip().container_mc.UIDragger.setData(this.getUIName(),this.__get__targetMovieClip());
      this.tName = this.__get__targetMovieClip().container_mc.tName;
      this.tTime = this.__get__targetMovieClip().container_mc.tTime;
      this.tDPS = this.__get__targetMovieClip().container_mc.tDPS;
      this.tTime.verticalAlign = "center";
      g4.util.UIUtil.setTextFieldStyle(this.tName,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setTextFieldStyle(this.tTime,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setTextFieldStyle(this.tDPS,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.OnGame_DamageDisplay_ResetData();
      if(_global.gfxPlayer)
      {
         this.setViewVisible(true);
         this.OnGame_DamageDisplay_SetMonsterName("Atpeman");
         this.OnGame_DamageDisplay_SetDamage("3분 15초","23644.08/ sec");
      }
      this.ToGame_DamageDisplay_Init();
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_DamageDisplay_SetMonsterName",g4.util.Delegate.create(this,this.OnGame_DamageDisplay_SetMonsterName));
      this.registerGameInterface("OnGame_DamageDisplay_SetDamage",g4.util.Delegate.create(this,this.OnGame_DamageDisplay_SetDamage));
      this.registerGameInterface("OnGame_DamageDisplay_ResetData",g4.util.Delegate.create(this,this.OnGame_DamageDisplay_ResetData));
   }
   function OnGame_DamageDisplay_SetMonsterName($name)
   {
      this.tName.text = $name;
      if(this.tName.textWidth > this.tName._width)
      {
         var _loc2_ = this.tName.getCharIndexAtPoint(200,10);
         var _loc3_ = $name.substr(0,_loc2_) + "...";
         this.tName.text = _loc3_;
      }
   }
   function OnGame_DamageDisplay_SetDamage($time, $dps)
   {
      this.tTime.text = $time;
      this.tDPS.text = $dps;
   }
   function OnGame_DamageDisplay_ResetData()
   {
      this.tName.text = "";
      this.tTime.text = "-";
      this.tDPS.text = "-";
   }
   function ToGame_DamageDisplay_Init()
   {
      fscommand("ToGame_DamageDisplay_Init");
   }
}
