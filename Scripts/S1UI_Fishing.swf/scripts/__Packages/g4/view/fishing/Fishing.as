class g4.view.fishing.Fishing extends g4.core.View implements g4.gameInterface.IFishing
{
   function Fishing($targetMovie)
   {
      super($targetMovie);
   }
   function getUIName()
   {
      return g4.view.ViewID.FISHING;
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_Fishing_SetMessage",g4.util.Delegate.create(this,this.OnGame_Fishing_SetMessage));
      this.registerGameInterface("OnGame_Fishing_CreateBox",g4.util.Delegate.create(this,this.OnGame_Fishing_CreateBox));
      this.registerGameInterface("OnGame_Fishing_Start",g4.util.Delegate.create(this,this.OnGame_Fishing_Start));
      this.registerGameInterface("OnGame_Fishing_SetTime",g4.util.Delegate.create(this,this.OnGame_Fishing_SetTime));
      this.registerGameInterface("OnGame_Fishing_FishPosition",g4.util.Delegate.create(this,this.OnGame_Fishing_FishPosition));
      this.registerGameInterface("OnGame_Fishing_Pulling",g4.util.Delegate.create(this,this.OnGame_Fishing_Pulling));
      this.registerGameInterface("OnGame_Fishing_SetBoxState",g4.util.Delegate.create(this,this.OnGame_Fishing_SetBoxState));
      this.registerGameInterface("OnGame_Fishing_SetResult",g4.util.Delegate.create(this,this.OnGame_Fishing_SetResult));
   }
   function configUI()
   {
      this.fishingGroup = (g4.view.fishing.FishingGroup)this.__get__targetMovieClip().container_mc.fishingGroup;
      this.textField0 = (TextField)this.__get__targetMovieClip().container_mc.textField0;
      this.textField1 = (TextField)this.__get__targetMovieClip().container_mc.textField1;
      g4.util.UIUtil.setTextFieldStyle(this.textField0,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      g4.util.UIUtil.setTextFieldStyle(this.textField1,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.fishingGroup.addEventListener("ToGame_Fishing_OpenComplete",this,"ToGame_Fishing_OpenComplete");
      this.fishingGroup.addEventListener("ToGame_Fishing_Finish",this,"ToGame_Fishing_Finish");
      this.ToGame_Fishing_Init();
   }
   function OnGame_Fishing_SetMessage($message)
   {
      if($message == "")
      {
         this.textField0.htmlText = "";
         this.textField1.htmlText = "";
      }
      else
      {
         var _loc2_ = lib.util.ExtString.split($message,"\t");
         if(_loc2_[1] != null)
         {
            this.textField0.htmlText = _loc2_[1];
            this.textField1.htmlText = _loc2_[0];
         }
         else
         {
            this.textField0.htmlText = "";
            this.textField1.htmlText = _loc2_[0];
         }
      }
   }
   function OnGame_Fishing_CreateBox($boxData, $grade)
   {
      $grade = Number($grade);
      this.fishingGroup.createBox($boxData,$grade);
   }
   function OnGame_Fishing_Start($maxTime, $functionKey, $fishType)
   {
      this.fishingGroup.startGame($maxTime,$functionKey,Number($fishType));
   }
   function OnGame_Fishing_SetTime($time)
   {
      $time = Number($time);
      this.fishingGroup.setTime($time);
   }
   function OnGame_Fishing_FishPosition($x)
   {
      $x = Number($x) + 30;
      this.fishingGroup.setFishPosition($x);
   }
   function OnGame_Fishing_Pulling($value)
   {
      this.fishingGroup.setPull($value);
   }
   function OnGame_Fishing_SetBoxState($index, $state, $x, $remain)
   {
      $index = Number($index);
      $state = Number($state);
      $x = Number($x);
      $remain = Number($remain);
      this.fishingGroup.setBoxState($index,$state,$x,$remain);
   }
   function OnGame_Fishing_SetResult($result, $resultItem)
   {
      $result = Number($result);
      this.fishingGroup.setResult($result,$resultItem);
   }
   function ToGame_Fishing_Init()
   {
      fscommand("ToGame_Fishing_Init");
   }
   function ToGame_Fishing_OpenComplete()
   {
      fscommand("ToGame_Fishing_OpenComplete");
   }
   function ToGame_Fishing_Finish()
   {
      fscommand("ToGame_Fishing_Finish");
   }
}
