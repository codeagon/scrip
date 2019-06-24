class gs.OverwriteManager
{
   static var version = 3.12;
   static var NONE = 0;
   static var ALL = 1;
   static var AUTO = 2;
   static var CONCURRENT = 3;
   function OverwriteManager()
   {
   }
   static function init($mode)
   {
      if(gs.TweenLite.version < 10.09)
      {
         trace("TweenLite warning: Your TweenLite class needs to be updated to work with OverwriteManager (or you may need to clear your ASO files). Please download and install the latest version from http://www.tweenlite.com.");
      }
      gs.TweenLite.overwriteManager = gs.OverwriteManager;
      gs.OverwriteManager.mode = $mode != undefined?$mode:2;
      gs.OverwriteManager.enabled = true;
      return gs.OverwriteManager.mode;
   }
   static function manageOverwrites($tween, $targetTweens)
   {
      var _loc13_ = $tween.vars;
      var _loc14_ = _loc13_.overwrite != undefined?Number(_loc13_.overwrite):gs.OverwriteManager.mode;
      if(_loc14_ < 2 || $targetTweens == undefined)
      {
         return undefined;
      }
      var _loc10_ = $tween.startTime;
      var _loc3_ = [];
      var _loc1_ = undefined;
      var _loc15_ = undefined;
      var _loc5_ = undefined;
      var _loc9_ = -1;
      _loc1_ = $targetTweens.length - 1;
      while(_loc1_ > -1)
      {
         _loc5_ = $targetTweens[_loc1_];
         if(_loc5_ == $tween)
         {
            _loc9_ = _loc1_;
         }
         else if(_loc1_ < _loc9_ && _loc5_.startTime <= _loc10_ && _loc5_.startTime + _loc5_.duration * 1000 / _loc5_.combinedTimeScale > _loc10_)
         {
            _loc3_[_loc3_.length] = _loc5_;
         }
         _loc1_ = _loc1_ - 1;
      }
      if(_loc3_.length == 0 || $tween.tweens.length == 0)
      {
         return undefined;
      }
      if(_loc14_ == gs.OverwriteManager.AUTO)
      {
         var _loc8_ = $tween.tweens;
         var _loc6_ = {};
         var _loc2_ = undefined;
         var _loc4_ = undefined;
         var _loc7_ = undefined;
         _loc1_ = _loc8_.length - 1;
         while(_loc1_ > -1)
         {
            _loc4_ = _loc8_[_loc1_];
            if(_loc4_.isPlugin)
            {
               if(_loc4_.name == "_MULTIPLE_")
               {
                  _loc7_ = _loc4_.target.overwriteProps;
                  _loc2_ = _loc7_.length - 1;
                  while(_loc2_ > -1)
                  {
                     _loc6_[_loc7_[_loc2_]] = true;
                     _loc2_ = _loc2_ - 1;
                  }
               }
               else
               {
                  _loc6_[_loc4_.name] = true;
               }
               _loc6_[_loc4_.target.propName] = true;
            }
            else
            {
               _loc6_[_loc4_.name] = true;
            }
            _loc1_ = _loc1_ - 1;
         }
         _loc1_ = _loc3_.length - 1;
         while(_loc1_ > -1)
         {
            gs.OverwriteManager.killVars(_loc6_,_loc3_[_loc1_].vars,_loc3_[_loc1_].tweens);
            _loc1_ = _loc1_ - 1;
         }
      }
      else
      {
         _loc1_ = _loc3_.length - 1;
         while(_loc1_ > -1)
         {
            _loc3_[_loc1_].enabled = false;
            _loc1_ = _loc1_ - 1;
         }
      }
   }
   static function killVars($killVars, $vars, $tweens, $subTweens, $filters)
   {
      var _loc2_ = undefined;
      var _loc5_ = undefined;
      var _loc1_ = undefined;
      _loc2_ = $tweens.length - 1;
      while(_loc2_ > -1)
      {
         _loc1_ = $tweens[_loc2_];
         if($killVars[_loc1_.name] != undefined)
         {
            $tweens.splice(_loc2_,1);
         }
         else if(_loc1_.isPlugin && _loc1_.name == "_MULTIPLE_")
         {
            _loc1_.target.killProps($killVars);
            if(_loc1_.target.overwriteProps.length == 0)
            {
               $tweens.splice(_loc2_,1);
            }
         }
         _loc2_ = _loc2_ - 1;
      }
      for(var _loc5_ in $killVars)
      {
         delete $vars.register5;
      }
   }
}
