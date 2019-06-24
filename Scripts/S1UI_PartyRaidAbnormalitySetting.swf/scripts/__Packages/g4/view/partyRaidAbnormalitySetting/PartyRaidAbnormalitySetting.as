class g4.view.partyRaidAbnormalitySetting.PartyRaidAbnormalitySetting extends g4.core.View
{
   function PartyRaidAbnormalitySetting(targetMovieClip)
   {
      super(targetMovieClip);
   }
   function getUIName()
   {
      return g4.view.ViewID.PARTY_RAID_ABNORMALITY_SETTING;
   }
   function configUI()
   {
      this.check_skill_and_glyph = (lib.controls.S_CheckBox)this.__get__targetMovieClip().container_mc.check_skill_and_glyph;
      this.check_battle_consumable = (lib.controls.S_CheckBox)this.__get__targetMovieClip().container_mc.check_battle_consumable;
      this.check_all_harmful = (lib.controls.S_CheckBox)this.__get__targetMovieClip().container_mc.check_all_harmful;
      this.check_removable_harmful = (lib.controls.S_CheckBox)this.__get__targetMovieClip().container_mc.check_removable_harmful;
      this.check_my_party_simply = (lib.controls.S_CheckBox)this.__get__targetMovieClip().container_mc.check_my_party_simply;
      this.__get__targetMovieClip().container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip());
      this.currentData = new g4.model.party.PartyRaidAbnormalityData();
      this.__get__targetMovieClip().container_mc.text_title.text = "$023143";
      this.__get__targetMovieClip().container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
      this.radioButtonGroup = new g4.util.RadioButtonGroup();
      this.radioButtonGroup.add(this.__get__targetMovieClip().container_mc.radio_0,g4.model.GameConstants.PARTY_RAID_ABNORMALITY_VIEW_TYPE_SIMPLE);
      this.radioButtonGroup.add(this.__get__targetMovieClip().container_mc.radio_1,g4.model.GameConstants.PARTY_RAID_ABNORMALITY_VIEW_TYPE_DETAIL);
      this.radioButtonGroup.addEventListener(g4.util.RadioButtonGroup.VALUE_CHANGED,this,"radioButtonGroup_valueChangedHandler");
      this.configCheckBox(this.check_skill_and_glyph);
      this.configCheckBox(this.check_battle_consumable);
      this.configCheckBox(this.check_all_harmful);
      this.configCheckBox(this.check_removable_harmful);
      this.configCheckBox(this.check_my_party_simply);
      var _loc3_ = new lib.util.TxtBtn(this.__get__targetMovieClip().container_mc.button_close);
      _loc3_.setRelease(gfx.utils.Delegate.create(this,function()
      {
         g4.model.GameModel.partyModel.ToGame_PartyRaidAbnormalitySetting_Close();
      }
      ));
      this.button_ok = (lib.util.TxtBtn)this.__get__targetMovieClip().container_mc.button_ok.txtBtn;
      this.button_ok.setRelease(gfx.utils.Delegate.create(this,this.saveOption));
      this.button_ok.setEnabled(false);
      var _loc2_ = (lib.util.TxtBtn)this.__get__targetMovieClip().container_mc.button_cancel.txtBtn;
      _loc2_.setRelease(gfx.utils.Delegate.create(this,function()
      {
         g4.model.GameModel.partyModel.ToGame_PartyRaidAbnormalitySetting_Close();
      }
      ));
      this.updateScreenFromModelData();
   }
   function configGameInterface()
   {
      g4.model.GameModel.addEventListener(g4.view.ViewID.PARTY_RAID_ABNORMALITY_SETTING,g4.model.GameModelEventType.PARTY_RAID_ABNORMALITY_DATA_CHANGED,this,"model_partyRaidAbnormalityDataChangedHandler");
   }
   function configCheckBox(checkBox)
   {
      checkBox.onChanged = gfx.utils.Delegate.create(this,this.updateByValueChanged);
   }
   function saveOption()
   {
      g4.model.GameModel.partyModel.ToGame_PartyRaidAbnormalitySetting_SaveOption(this.currentData);
   }
   function updateScreenFromModelData()
   {
      var _loc2_ = g4.model.GameModel.partyModel.partyRaidAbnormalityData;
      this.radioButtonGroup.setSelectedValue(_loc2_.type);
      this.check_skill_and_glyph.__set__checked(_loc2_.skillAndGlyph);
      this.check_battle_consumable.__set__checked(_loc2_.battleConsumable);
      this.check_all_harmful.__set__checked(_loc2_.allHarmful);
      this.check_removable_harmful.__set__checked(_loc2_.removableHarmful);
      this.check_my_party_simply.__set__checked(_loc2_.myPartySimply);
      this.updateByValueChanged();
   }
   function updateByValueChanged()
   {
      this.currentData.type = this.radioButtonGroup.getSelectedValue();
      this.currentData.skillAndGlyph = this.check_skill_and_glyph.checked;
      this.currentData.battleConsumable = this.check_battle_consumable.checked;
      this.currentData.allHarmful = this.check_all_harmful.checked;
      this.currentData.removableHarmful = this.check_removable_harmful.checked;
      this.currentData.myPartySimply = this.check_my_party_simply.checked;
      var _loc2_ = this.currentData.type == g4.model.GameConstants.PARTY_RAID_ABNORMALITY_VIEW_TYPE_DETAIL;
      g4.util.UIUtil.setCheckBoxEnabled(this.check_skill_and_glyph,_loc2_);
      g4.util.UIUtil.setCheckBoxEnabled(this.check_battle_consumable,_loc2_);
      g4.util.UIUtil.setCheckBoxEnabled(this.check_all_harmful,_loc2_);
      g4.util.UIUtil.setCheckBoxEnabled(this.check_removable_harmful,_loc2_);
      var _loc3_ = this.compare(this.currentData,g4.model.GameModel.partyModel.partyRaidAbnormalityData);
      this.button_ok.setEnabled(!_loc3_);
   }
   function compare(a, b)
   {
      return a.type == b.type && a.skillAndGlyph == b.skillAndGlyph && a.battleConsumable == b.battleConsumable && a.allHarmful == b.allHarmful && a.removableHarmful == b.removableHarmful && a.myPartySimply == b.myPartySimply;
   }
   function radioButtonGroup_valueChangedHandler(event)
   {
      this.updateByValueChanged();
   }
   function model_partyRaidAbnormalityDataChangedHandler(event)
   {
      this.updateScreenFromModelData();
   }
}
