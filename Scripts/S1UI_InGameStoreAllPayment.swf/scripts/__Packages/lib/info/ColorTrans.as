class lib.info.ColorTrans
{
   function ColorTrans()
   {
   }
   static function setTrans(target, colorTransform)
   {
      var _loc1_ = new flash.geom.Transform(target);
      _loc1_.colorTransform = colorTransform;
   }
   static function removeTrans(target)
   {
      var _loc1_ = new flash.geom.Transform(target);
      _loc1_.colorTransform = lib.info.ColorTrans.enableTrans();
   }
   static function disableTrans()
   {
      var _loc1_ = new flash.geom.ColorTransform(0,0.3,1,1,0,0,0,0);
      return _loc1_;
   }
   static function enableTrans()
   {
      var _loc1_ = new flash.geom.ColorTransform(1,1,1,1,0,0,0,0);
      return _loc1_;
   }
   static function popupDisableTrans()
   {
      var _loc1_ = new flash.geom.ColorTransform(0.4,0.4,0.5,0.9,0,0,0,0);
      return _loc1_;
   }
   static function coolTimeTrans()
   {
      var _loc1_ = new flash.geom.ColorTransform(0.26,0.26,0.26,1,2,2,2,0);
      return _loc1_;
   }
   static function validRangeTrans()
   {
      var _loc1_ = new flash.geom.ColorTransform(1,1,1,1,50,50,50,0);
      return _loc1_;
   }
   static function worldMapOverTrans()
   {
      var _loc1_ = new flash.geom.ColorTransform(1,1,1,1,100,90,60,0);
      return _loc1_;
   }
   static function worldMapBGTrans()
   {
      var _loc1_ = new flash.geom.ColorTransform(0.8,0.8,0.8,1,0,0,0,0);
      return _loc1_;
   }
   static function slotImpossibleTrans()
   {
      var _loc1_ = new flash.geom.ColorTransform(1,0.2,0,1,0,0,0,0);
      return _loc1_;
   }
   static function slotDisableTrans()
   {
      var _loc1_ = new flash.geom.ColorTransform(0,0.3,1,1,0,0,0,0);
      return _loc1_;
   }
   static function slotDragTrans()
   {
      var _loc1_ = new flash.geom.ColorTransform(0,0.3,1,1,0,0,0,0);
      return _loc1_;
   }
   static function slotDurability(index)
   {
      var _loc1_ = null;
      if(index == 1)
      {
         _loc1_ = new flash.geom.ColorTransform(1,0.5,0,1,0,0,0,0);
         lib.Debuger.trace("index slotDurability: " + index);
      }
      else if(index == 2)
      {
         _loc1_ = new flash.geom.ColorTransform(1,0.2,0,1,0,0,0,0);
      }
      return _loc1_;
   }
   static function changeColor(target, changeSpeed, m1, m2, m3, m4, m5, m6, m7, m8)
   {
      var trans = new flash.geom.Transform(target);
      var currentTrans = new flash.geom.ColorTransform();
      var changeTrans = new flash.geom.ColorTransform();
      var multiplier_array = new Array(0,1,2,3,4,5,6,7);
      changeTrans[multiplier_array[0]] = m1;
      changeTrans[multiplier_array[1]] = m2;
      changeTrans[multiplier_array[2]] = m3;
      changeTrans[multiplier_array[3]] = m4;
      changeTrans[multiplier_array[4]] = m5;
      changeTrans[multiplier_array[5]] = m6;
      changeTrans[multiplier_array[6]] = m7;
      changeTrans[multiplier_array[7]] = m8;
      var chk_array = new Array();
      var speed_array = new Array();
      var _loc2_ = 0;
      while(_loc2_ < 8)
      {
         if(currentTrans[multiplier_array[_loc2_]] > changeTrans[multiplier_array[_loc2_]])
         {
            chk_array.push("up");
         }
         else if(currentTrans[multiplier_array[_loc2_]] < changeTrans[multiplier_array[_loc2_]])
         {
            chk_array.push("down");
         }
         else
         {
            chk_array.push("same");
         }
         var _loc4_ = Math.abs(currentTrans[multiplier_array[_loc2_]] - changeTrans[multiplier_array[_loc2_]]);
         var _loc3_ = _loc4_ / changeSpeed;
         speed_array.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      target.onEnterFrame = function()
      {
         var _loc3_ = 0;
         var _loc2_ = 0;
         while(_loc2_ < 8)
         {
            if(chk_array[_loc2_] == "up")
            {
               if(currentTrans[multiplier_array[_loc2_]] > changeTrans[multiplier_array[_loc2_]])
               {
                  currentTrans[multiplier_array[_loc2_]] = currentTrans[multiplier_array[_loc2_]] - speed_array[_loc2_];
               }
               else
               {
                  currentTrans[multiplier_array[_loc2_]] = changeTrans[multiplier_array[_loc2_]];
               }
            }
            else if(chk_array[_loc2_] == "down")
            {
               if(currentTrans[multiplier_array[_loc2_]] < changeTrans[multiplier_array[_loc2_]])
               {
                  currentTrans[multiplier_array[_loc2_]] = currentTrans[multiplier_array[_loc2_]] + speed_array[_loc2_];
               }
               else
               {
                  currentTrans[multiplier_array[_loc2_]] = changeTrans[multiplier_array[_loc2_]];
               }
            }
            else
            {
               currentTrans[multiplier_array[_loc2_]] = changeTrans[multiplier_array[_loc2_]];
            }
            if(currentTrans[multiplier_array[_loc2_]] == changeTrans[multiplier_array[_loc2_]])
            {
               _loc3_ = _loc3_ + 1;
            }
            else
            {
               _loc3_ = 0;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc3_ == 8)
         {
            delete this.onEnterFrame;
         }
         trans.colorTransform = currentTrans;
      };
   }
}
