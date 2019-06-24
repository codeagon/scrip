class g4.util.TweenX
{
   function TweenX()
   {
   }
   static function init()
   {
      gfx.motion.Tween.init();
   }
   static function to($target, $time, $prop, $ease, $callBack)
   {
      if(typeof $target != "movieclip")
      {
         return undefined;
      }
      if($callBack.onComplete != undefined)
      {
         $target.onTweenComplete = $callBack.onComplete;
      }
      $target.tweenTo($time,$prop,$ease);
   }
   static function killTweenOf($target, $jumpToEnd)
   {
      $jumpToEnd = $jumpToEnd != undefined?$jumpToEnd:false;
      $target.tweenEnd($jumpToEnd);
      $target.onTweenComplete = null;
   }
}
