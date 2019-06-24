class lib.util.ClipBoard
{
   function ClipBoard()
   {
   }
   static function ClipBoardMouseEvent(ob, choice)
   {
      ob.onMouseDown = function()
      {
         ob.onMouseMove = function()
         {
         };
      };
      ob.onMouseUp = function()
      {
         ob.onMouseMove = null;
         var _loc5_ = Selection.getBeginIndex();
         var _loc4_ = Selection.getEndIndex();
         var _loc3_ = new Array();
         if(Selection.getFocus() != null)
         {
            _loc3_ = Selection.getFocus().split(".");
            lib.util.ClipBoard.TargeMc = _root;
            _loc3_.shift();
            var _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               lib.util.ClipBoard.TargeMc = lib.util.ClipBoard.TargeMc[_loc3_[_loc2_]];
               _loc2_ = _loc2_ + 1;
            }
         }
         if(_loc4_ - _loc5_ > 0)
         {
            lib.util.ClipBoard.Index = _loc5_;
            lib.util.ClipBoard.End = _loc4_;
            if(choice == "Copy")
            {
               lib.util.ClipBoard.CopyToClipboard(lib.util.ClipBoard.TargeMc,true,lib.util.ClipBoard.Index,lib.util.ClipBoard.End);
            }
            else if(choice == "Cut")
            {
               lib.util.ClipBoard.CutToClipboard(lib.util.ClipBoard.TargeMc,true,lib.util.ClipBoard.Index,lib.util.ClipBoard.End);
            }
         }
      };
   }
   static function ClipBoardKeyEvent(ob)
   {
      ob.onKeyDown = function()
      {
         if(_global.control)
         {
            if(Key.isDown(67))
            {
               lib.util.ClipBoard.CopyToClipboard(lib.util.ClipBoard.TargeMc,true,lib.util.ClipBoard.Index,lib.util.ClipBoard.End);
            }
            else if(Key.isDown(86))
            {
               lib.util.ClipBoard.PasteFromClipboard(lib.util.ClipBoard.TargeMc,true);
            }
            else if(Key.isDown(88))
            {
               lib.util.ClipBoard.CutToClipboard(lib.util.ClipBoard.TargeMc,true,lib.util.ClipBoard.Index,lib.util.ClipBoard.End);
            }
         }
      };
   }
   static function CopyToClipboard(_scope, richClipboard, startIndex, endIndex)
   {
      _scope.copyToClipboard(false,startIndex,endIndex);
   }
   static function PasteFromClipboard(_scope, richClipboard, startIndex, endIndex)
   {
      var _loc3_ = Selection.getBeginIndex();
      var _loc1_ = Selection.getEndIndex();
      _scope.pasteFromClipboard(false,_loc3_,_loc1_);
      _scope.ExtTextField.onChangedPaste(_scope);
      _scope.onChanged();
      _loc1_ = lib.util.ClipBoard.End - lib.util.ClipBoard.Index + Selection.getEndIndex();
      Selection.setSelection(_loc1_,_loc1_);
   }
   static function CutToClipboard(_scope, richClipboard, startIndex, endIndex)
   {
      _scope.cutToClipboard(false,startIndex,endIndex);
      Selection.setSelection(startIndex,startIndex);
   }
}
