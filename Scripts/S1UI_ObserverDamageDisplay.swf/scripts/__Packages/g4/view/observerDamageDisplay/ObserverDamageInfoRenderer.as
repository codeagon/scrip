class g4.view.observerDamageDisplay.ObserverDamageInfoRenderer extends gfx.core.UIComponent
{
   function ObserverDamageInfoRenderer()
   {
      super();
   }
   function configUI()
   {
      this._mc_classIcon = this.mc_classIcon;
      this._tf_characterName = this.tf_characterName;
      this._tf_damage = this.tf_damage;
   }
   function setData(observerDamageInfoP)
   {
      this._observerDamageInfoP = observerDamageInfoP;
   }
   function showObserverDamageInfoRenderer()
   {
      this._tf_characterName.text = this._observerDamageInfoP.CharacterName;
      this.updateDamageInfo(this._observerDamageInfoP.Damage);
      this._mc_classIcon.gotoAndStop(this._observerDamageInfoP.ClassId);
   }
   function updateDamageInfo(damage)
   {
      this._tf_damage.text = damage;
   }
}
