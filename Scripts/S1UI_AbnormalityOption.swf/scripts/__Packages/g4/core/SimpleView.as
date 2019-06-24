class g4.core.SimpleView extends gfx.events.EventDispatcher
{
   function SimpleView(targetMovieClip)
   {
      super();
      this._targetMovieClip = targetMovieClip;
   }
   function __get__targetMovieClip()
   {
      return this._targetMovieClip;
   }
}
