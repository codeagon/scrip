class lib.src.ClipBoardSrc extends MovieClip
{
   function ClipBoardSrc()
   {
      super();
      _global.gfxExtensions = true;
      lib.src.ClipBoardSrc._scope = this;
      this.Init();
   }
   function Init()
   {
      this.MouseListener = new Object();
      Mouse.addListener(this.MouseListener);
      this.KeyListener = new Object();
      Key.addListener(this.KeyListener);
      lib.util.ClipBoard.ClipBoardMouseEvent(this.MouseListener,"");
      lib.util.ClipBoard.ClipBoardKeyEvent(this.KeyListener);
   }
}
