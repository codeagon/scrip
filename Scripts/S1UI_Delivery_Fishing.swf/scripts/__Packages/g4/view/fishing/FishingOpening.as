class g4.view.fishing.FishingOpening extends gfx.core.UIComponent
{
   function FishingOpening()
   {
      super();
   }
   function onLoad()
   {
      this.mText.textField.verticalAlign = "center";
   }
   function setGrade($grade)
   {
      this.mText.textField.text = "낚시 시작\n난이도 : " + $grade;
      this.gotoAndPlay(2);
   }
   function animComp()
   {
      this.dispatchEvent({type:gfx.events.EventTypes.COMPLETE});
   }
}
