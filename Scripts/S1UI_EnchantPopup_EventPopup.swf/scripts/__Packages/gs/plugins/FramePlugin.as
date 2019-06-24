class gs.plugins.FramePlugin extends gs.plugins.TweenPlugin
{
   static var VERSION = 1.01;
   static var API = 1;
   function FramePlugin()
   {
      super();
      this.propName = "frame";
      this.overwriteProps = ["frame"];
      this.round = true;
   }
   function onInitTween($target, $value, $tween)
   {
      if(typeof $target != "movieclip" || isNaN($value))
      {
         return false;
      }
      this._target = (MovieClip)$target;
      this.frame = this._target._currentframe;
      this.addTween(this,"frame",this.frame,$value,"frame");
      return true;
   }
   function __set__changeFactor($n)
   {
      this.updateTweens($n);
      this._target.gotoAndStop(this.frame);
      return this.__get__changeFactor();
   }
}
