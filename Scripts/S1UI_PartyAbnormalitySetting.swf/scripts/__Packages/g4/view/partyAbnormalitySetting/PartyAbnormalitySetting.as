class g4.view.partyAbnormalitySetting.PartyAbnormalitySetting extends g4.core.View
{
   function PartyAbnormalitySetting(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.PARTY_ABNORMALITY_SETTING;
   }
   function configUI()
   {
      this.check_other = (lib.controls.S_CheckBox)this.__get__targetMovieClip().container_mc.check_other;
      this.check_battle = (lib.controls.S_CheckBox)this.__get__targetMovieClip().container_mc.check_battle;
      this.check_skill = (lib.controls.S_CheckBox)this.__get__targetMovieClip().container_mc.check_skill;
      this.__get__targetMovieClip().container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip());
      this.currentData = new g4.model.party.PartyAbnormalityData();
      this.__get__targetMovieClip().container_mc.text_title.text = "$026001";
      this.__get__targetMovieClip().container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
      this.radioButtonGroup = new g4.util.RadioButtonGroup();
      this.radioButtonGroup.add(this.__get__targetMovieClip().container_mc.radio_0,g4.model.GameConstants.PARTY_ABNORMALITY_VIEW_TYPE_IMPORTANT);
      this.radioButtonGroup.add(this.__get__targetMovieClip().container_mc.radio_1,g4.model.GameConstants.PARTY_ABNORMALITY_VIEW_TYPE_ALL);
      this.radioButtonGroup.addEventListener(g4.util.RadioButtonGroup.VALUE_CHANGED,this,"radioButtonGroup_valueChangedHandler");
      this.configCheckBox(this.check_other);
      this.configCheckBox(this.check_battle);
      this.configCheckBox(this.check_skill);
      var _loc3_ = new lib.util.TxtBtn(this.__get__targetMovieClip().container_mc.button_close);
      _loc3_.setRelease(gfx.utils.Delegate.create(this,function()
      {
         g4.model.GameModel.partyModel.ToGame_PartyAbnormalitySetting_Close();
      }
      ));
      this.button_ok = (lib.util.TxtBtn)this.__get__targetMovieClip().container_mc.button_ok.txtBtn;
      this.button_ok.setRelease(gfx.utils.Delegate.create(this,this.saveOption));
      this.button_ok.setEnabled(false);
      var _loc2_ = (lib.util.TxtBtn)this.__get__targetMovieClip().container_mc.button_cancel.txtBtn;
      _loc2_.setRelease(gfx.utils.Delegate.create(this,function()
      {
         g4.model.GameModel.partyModel.ToGame_PartyAbnormalitySetting_Close();
      }
      ));
      this.updateScreenFromModelData();
   }
   function configGameInterface()
   {
      g4.model.GameModel.addEventListener(g4.view.ViewID.PARTY_ABNORMALITY_SETTING,g4.model.GameModelEventType.PARTY_ABNORMALITY_DATA_CHANGED,this,"model_partyAbnormalityDataChangedHandler");
   }
   function configCheckBox(checkBox)
   {
      checkBox.onChanged = gfx.utils.Delegate.create(this,this.updateByValueChanged);
   }
   function saveOption()
   {
      g4.model.GameModel.partyModel.ToGame_PartyAbnormalitySetting_SaveOption(this.currentData.type,this.currentData.other,this.currentData.battleConsumable,this.currentData.skillAndGlyph);
   }
   function updateScreenFromModelData()
   {
      var _loc2_ = g4.model.GameModel.partyModel.partyAbnormalityData;
      this.radioButtonGroup.setSelectedValue(_loc2_.type);
      this.check_other.__set__checked(_loc2_.other);
      this.check_battle.__set__checked(_loc2_.battleConsumable);
      this.check_skill.__set__checked(_loc2_.skillAndGlyph);
      this.updateByValueChanged();
   }
   function updateByValueChanged()
   {
      this.currentData.type = this.radioButtonGroup.getSelectedValue();
      this.currentData.other = this.check_other.checked;
      this.currentData.battleConsumable = this.check_battle.checked;
      this.currentData.skillAndGlyph = this.check_skill.checked;
      var _loc2_ = this.currentData.type == g4.model.GameConstants.PARTY_ABNORMALITY_VIEW_TYPE_ALL;
      g4.util.UIUtil.setCheckBoxEnabled(this.check_other,_loc2_);
      g4.util.UIUtil.setCheckBoxEnabled(this.check_battle,_loc2_);
      g4.util.UIUtil.setCheckBoxEnabled(this.check_skill,_loc2_);
      var _loc3_ = this.compare(this.currentData,g4.model.GameModel.partyModel.partyAbnormalityData);
      this.button_ok.setEnabled(!_loc3_);
   }
   function compare(a, b)
   {
      return a.type == b.type && a.other == b.other && a.battleConsumable == b.battleConsumable && a.skillAndGlyph == b.skillAndGlyph;
   }
   function radioButtonGroup_valueChangedHandler(event)
   {
      this.updateByValueChanged();
   }
   function model_partyAbnormalityDataChangedHandler(event)
   {
      this.updateScreenFromModelData();
   }
}
