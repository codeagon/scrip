class g4.component.ScrollBarX extends gfx.controls.ScrollBar
{
   function ScrollBarX()
   {
      super();
   }
   function onLoad()
   {
      super.onLoad();
   }
   function onMouseWheel(delta, target)
   {
      if(this.targetRect != null)
      {
         if(this.__get__visible() && this.targetRect.hitTest(_root._xmouse,_root._ymouse,true))
         {
            this.scrollWheel(delta <= 0?-1:1);
         }
      }
   }
}
