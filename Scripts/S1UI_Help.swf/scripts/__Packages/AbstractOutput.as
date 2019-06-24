class AbstractOutput
{
   static var TypeCheck = "1";
   static var OutputTextBgMc_Min = 66.5;
   static var OutputTextBgMc_Max = 345;
   static var OutputText_Min = 47.5;
   static var OutputText_Max = 324;
   function AbstractOutput()
   {
   }
   static function AbstractOutputData(_scope, types, addargs, flag)
   {
      _scope.OutputMc.txt._height = AbstractOutput.OutputText_Min;
      _scope.OutputMc.txt._y = 285.5;
      _scope.OutputMc.OutputTextBgMc._height = AbstractOutput.OutputTextBgMc_Min;
      _scope.OutputMc.OutputTextBgMc._y = 342;
      var _loc5_ = 0;
      AbstractOutput.TypeCheck = types;
      _scope.OutputMc.bgmc1._visible = true;
      _scope.OutputMc.txt._visible = false;
      _scope.OutputMc.OutputSwfMc._alpha = 0;
      _scope.OutputMc.OutputImageMc._alpha = 0;
      if(_scope.OutputMc.OutputImageMc.tmp_target2 !== undefined)
      {
         _scope.OutputMc.OutputImageMc.tmp_target2.removeMovieClip();
      }
      if(AbstractOutput.TypeCheck == "4")
      {
         _scope.OutputMc.gotoAndStop(1);
         _scope.OutputMc.OutputTextBgMc._height = AbstractOutput.OutputTextBgMc_Max;
         _scope.OutputMc.txt._height = AbstractOutput.OutputText_Min;
         _scope.OutputMc.txt._visible = true;
         _scope.OutputMc.txt._y = 285.5;
         _scope.TextScrollCheck();
         lib.net.SwfConnect.SwfConnectFile(_scope,addargs);
         AbstractOutput.DelayScroll(_scope,types);
         if(flag == false)
         {
            _scope.OutputMc.OutputSwfMc._alpha = 100;
         }
         else
         {
            gs.TweenLite.to(_scope.OutputMc.OutputSwfMc,0.5,{autoAlpha:100});
         }
      }
      else if(AbstractOutput.TypeCheck == "3")
      {
         _scope.OutputMc.gotoAndStop(2);
         _scope.OutputMc.bgmc1._visible = false;
         _scope.OutputMc.OutputTextBgMc._height = AbstractOutput.OutputTextBgMc_Max;
         _scope.OutputMc.txt._height = AbstractOutput.OutputText_Max;
         _scope.OutputMc.txt._visible = true;
         _scope.OutputMc.txt._y = 9.5;
         _scope.TextScrollCheck();
         AbstractOutput.DelayScroll(_scope,types);
         if(flag == false)
         {
         }
      }
      else if(AbstractOutput.TypeCheck == "2")
      {
         _scope.OutputMc.gotoAndStop(1);
         _scope.OutputMc.OutputTextBgMc._height = AbstractOutput.OutputTextBgMc_Max;
         _scope.OutputMc.txt._height = AbstractOutput.OutputText_Min;
         _scope.OutputMc.txt._visible = true;
         _scope.OutputMc.txt._y = 285.5;
         _scope.TextScrollCheck();
         lib.util.DrawBitmapFill.draw(_scope.OutputMc.OutputImageMc,addargs,512,512);
         AbstractOutput.DelayScroll(_scope,types);
         if(flag == false)
         {
            _scope.OutputMc.OutputImageMc._alpha = 100;
         }
         else
         {
            gs.TweenLite.killTweensOf(_scope.OutputMc.OutputImageMc,false);
            gs.TweenLite.to(_scope.OutputMc.OutputImageMc,0.5,{autoAlpha:100});
         }
      }
      _scope.TextScrollCheck();
      AbstractOutput.DelayScroll(_scope,types);
   }
   static function DelayScroll(_scope, types)
   {
      var delaynum = 0;
      _scope.OutputMc.onEnterFrame = null;
      _scope.OutputMc.onEnterFrame = function()
      {
         delaynum++;
         if(delaynum > 1)
         {
            _scope.OutputMc.onEnterFrame = null;
            if(_scope.OutputMc.txt.maxscroll > 1)
            {
               if(AbstractOutput.TypeCheck == "3")
               {
                  _scope.OutputMc.txt._height = _scope.OutputMc.txt._height + (_scope.OutputMc.txt.maxscroll - 1) * 20 + 0;
                  _scope.OutputMc.OutputTextBgMc._height = _scope.OutputMc.txt._height + 0;
                  _scope.OutputMc.OutputTextBgMc._y = _scope.OutputMc.OutputTextBgMc._y + _scope.OutputMc.txt.maxscroll * 30 + 0;
               }
               else
               {
                  _scope.OutputMc.txt._height = _scope.OutputMc.txt._height + (_scope.OutputMc.txt.maxscroll - 1) * 25 + 0;
                  _scope.OutputMc.OutputTextBgMc._height = _scope.OutputMc.txt._height + AbstractOutput.OutputTextBgMc_Max - 50;
                  _scope.OutputMc.OutputTextBgMc._y = _scope.OutputMc.OutputTextBgMc._y + _scope.OutputMc.txt._height - 50;
               }
            }
            _scope.TextScrollCheck();
         }
      };
   }
}
