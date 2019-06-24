class lib.display.TextBuilder
{
   function TextBuilder()
   {
   }
   static function draw($container, $name, $x, $y, $w, $h, $textFormat, $hitable)
   {
      var _loc1_ = $container[$name];
      if(_loc1_ == undefined)
      {
         $hitable = $hitable != undefined?$hitable:true;
         _loc1_ = $container.createTextField($name,$container.getNextHighestDepth(),$x,$y,$w,$h);
         _loc1_.hitTestDisable = $hitable;
         _loc1_.border = false;
         _loc1_.background = false;
         _loc1_.selectable = false;
         _loc1_.wordWrap = false;
         _loc1_.type = "dynamic";
         _loc1_.multiline = false;
         _loc1_.html = true;
         _loc1_.antiAliasType = "normal";
         _loc1_.setNewTextFormat($textFormat);
         _loc1_._visible = false;
         _loc1_.shadowColor = 0;
         _loc1_.shadowBlurX = 1.7;
         _loc1_.shadowBlurY = 1.7;
         _loc1_.shadowStrength = 5;
         _loc1_.shadowDistance = 0;
         _loc1_.shadowAngle = 90;
      }
      return _loc1_;
   }
}
