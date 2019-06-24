class lib.Debuger
{
   function Debuger()
   {
   }
   static function init(textFd0, textFd1)
   {
      if(lib.Debuger.debugtextFd0 == undefined)
      {
         lib.Debuger.debugtextFd0 = textFd0;
         lib.Debuger.debugtextFd0.text = "----debuger init----";
      }
      if(lib.Debuger.debugtextFd1 == undefined)
      {
         lib.Debuger.debugtextFd1 = textFd1;
         lib.Debuger.debugtextFd1.text = "----debuger init----";
      }
   }
   static function trace(str)
   {
      trace(str);
      lib.Debuger.debugtextFd1.text = lib.Debuger.debugtextFd1.text + ("|" + lib.Debuger.debugtextFd1.numLines + "| " + str + "\n");
   }
   static function clear(index)
   {
      if(index == 0)
      {
         lib.Debuger.debugtextFd0.text = "";
      }
      if(index == 1)
      {
         lib.Debuger.debugtextFd1.text = "";
      }
   }
}
