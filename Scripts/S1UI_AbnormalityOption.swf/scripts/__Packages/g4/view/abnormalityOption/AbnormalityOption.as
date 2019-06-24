class g4.view.abnormalityOption.AbnormalityOption extends g4.core.View
{
   function AbnormalityOption(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.ABNORMALITY_OPTION;
   }
   function configUI()
   {
      var _loc2_ = this.__get__targetMovieClip().container_mc;
      this.check_other = (lib.controls.S_CheckBox)_loc2_.check_other;
      this.check_battle = (lib.controls.S_CheckBox)_loc2_.check_battle;
      this.check_skill = (lib.controls.S_CheckBox)_loc2_.check_skill;
      _loc2_.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip());
      this.currentData = new g4.model.main.AbnormalityData();
      this.configCheckBox(this.check_other);
      this.configCheckBox(this.check_battle);
      this.configCheckBox(this.check_skill);
      _loc2_.text_title.text = "$680001";
      _loc2_.text_title.verticalAlign = "center";
      g4.util.UIUtil.setMouseEnabled(_loc2_.text_title,false);
      var _loc4_ = new lib.util.TxtBtn(_loc2_.button_close);
      _loc4_.setRelease(gfx.utils.Delegate.create(this,this.close));
      this.button_ok = _loc2_.button_ok.txtBtn;
      this.button_ok.setRelease(gfx.utils.Delegate.create(this,this.saveOption));
      var _loc3_ = _loc2_.button_cancel.txtBtn;
      _loc3_.setRelease(gfx.utils.Delegate.create(this,this.close));
      this.updateScreenFromModelData();
   }
   function configGameInterface()
   {
      g4.model.GameModel.addEventListener(g4.view.ViewID.ABNORMALITY_OPTION,g4.model.GameModelEventType.ABNORMALITY_DATA_CHANGED,this,"model_abnormalityDataChangedHandler");
   }
   function configCheckBox(checkBox)
   {
      checkBox.onChanged = gfx.utils.Delegate.create(this,this.updateByValueChanged);
   }
   function saveOption()
   {
      g4.model.GameModel.mainModel.ToGame_AbnormalityOption_SaveOption(this.currentData);
   }
   function close()
   {
      g4.model.GameModel.mainModel.ToGame_AbnormalityOption_Close();
   }
   function updateScreenFromModelData()
   {
      var _loc2_ = g4.model.GameModel.mainModel.abnormalityData;
      this.check_other.__set__checked(_loc2_.other);
      this.check_battle.__set__checked(_loc2_.battleConsumable);
      this.check_skill.__set__checked(_loc2_.skillAndGlyph);
      this.updateByValueChanged();
   }
   function updateByValueChanged()
   {
      this.currentData.other = this.check_other.checked;
      this.currentData.battleConsumable = this.check_battle.checked;
      this.currentData.skillAndGlyph = this.check_skill.checked;
      var _loc2_ = this.compare(this.currentData,g4.model.GameModel.mainModel.abnormalityData);
      this.button_ok.setEnabled(!_loc2_);
   }
   function compare(a, b)
   {
      return a.other == b.other && a.battleConsumable == b.battleConsumable && a.skillAndGlyph == b.skillAndGlyph;
   }
   function model_abnormalityDataChangedHandler(event)
   {
      this.updateScreenFromModelData();
   }
}
