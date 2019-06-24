class gs.plugins.VisiblePlugin extends gs.plugins.TweenPlugin
{
   static var VERSION = 1;
   static var API = 1;
   function VisiblePlugin()
   {
      super();
      this.propName = "_visible";
      this.overwriteProps = ["_visible"];
      this.onComplete = this.onCompleteTween;
   }
   function onInitTween($target, $value, $tween)
   {
      this._target = $target;
      this._tween = $tween;
      this._visible = Boolean($value);
      return true;
   }
   function onCompleteTween()
   {
      if(this._tween.vars.runBackwards != true && this._tween.ease == this._tween.vars.ease)
      {
         this._target._visible = this._visible;
      }
   }
   function __set__changeFactor($n)
   {
      if(this._target._visible != true)
      {
         this._target._visible = true;
      }
      return this.__get__changeFactor();
   }
}
