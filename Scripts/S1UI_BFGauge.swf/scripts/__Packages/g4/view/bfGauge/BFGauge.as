class g4.view.bfGauge.BFGauge extends g4.core.View implements g4.gameInterface.IBFGauge
{
   var nGaugeWidth = 316;
   function BFGauge($targetMovie)
   {
      super($targetMovie);
   }
   function getUIName()
   {
      return "BFGauge";
   }
   function configUI()
   {
      this.textField = this.__get__targetMovieClip().container_mc.textField;
      this.mGauge = this.__get__targetMovieClip().container_mc.mGauge;
      g4.util.UIUtil.setTextFieldStyle(this.textField,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.textField.text = "";
      this.ToGame_BFGauge_Init();
      if(_global.gfxPlayer)
      {
         this.setViewVisible(true);
         this.OnGame_BFGauge_SetType(0);
         this.OnGame_BFGauge_SetProgress(1);
      }
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_BFGauge_SetProgress",g4.util.Delegate.create(this,this.OnGame_BFGauge_SetProgress));
      this.registerGameInterface("OnGame_BFGauge_SetType",g4.util.Delegate.create(this,this.OnGame_BFGauge_SetType));
   }
   function OnGame_BFGauge_SetProgress($rate)
   {
      $rate = Number($rate);
      this.mGauge._width = $rate * this.nGaugeWidth;
   }
   function OnGame_BFGauge_SetType($type)
   {
      if($type == 0)
      {
         this.textField.text = lib.util.UIString.getUIString("$274011");
      }
      else if($type == 1)
      {
         this.textField.text = lib.util.UIString.getUIString("$274012");
      }
   }
   function ToGame_BFGauge_Init()
   {
      fscommand("ToGame_BFGauge_Init");
   }
}
