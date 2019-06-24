class g4.view.partyLootingSetting.Content extends g4.core.SimpleView
{
   function Content(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function configUI()
   {
      this.radio_free = this.__get__targetMovieClip().radio_free;
      this.radio_sequential = this.__get__targetMovieClip().radio_sequential;
      this.check_high_grade = this.__get__targetMovieClip().check_high_grade;
      this.text_high_grade = this.__get__targetMovieClip().text_high_grade;
      this.text_high_grade_type = this.__get__targetMovieClip().text_high_grade_type;
      this.combo_high_grade_type = this.__get__targetMovieClip().combo_high_grade_type;
      this.check_equip_item = this.__get__targetMovieClip().check_equip_item;
      this.text_equip_item = this.__get__targetMovieClip().text_equip_item;
      this.check_class_only = this.__get__targetMovieClip().check_class_only;
      this.text_class_only = this.__get__targetMovieClip().text_class_only;
      this.check_dice = this.__get__targetMovieClip().check_dice;
      this.text_dice = this.__get__targetMovieClip().text_dice;
      this.check_no_looting = this.__get__targetMovieClip().check_no_looting;
      this.mc_master_view = this.__get__targetMovieClip().mc_master_view;
      this.mc_member_view = this.__get__targetMovieClip().mc_member_view;
      this.configCheckBox(this.radio_free,this.__get__targetMovieClip().text_free,"$195002",gfx.utils.Delegate.create(this,function(checked)
      {
         this.setDistributionType(g4.model.GameConstants.PARTY_DISTRIBUTION_TYPE_FREE);
         this.setOKButtonEnabled(true);
      }
      ));
      this.configCheckBox(this.radio_sequential,this.__get__targetMovieClip().text_sequential,"$195003",gfx.utils.Delegate.create(this,function(checked)
      {
         this.setDistributionType(g4.model.GameConstants.PARTY_DISTRIBUTION_TYPE_SEQUENTIAL);
         this.setOKButtonEnabled(true);
      }
      ));
      this.configCheckBox(this.check_high_grade,this.text_high_grade,"$195020",gfx.utils.Delegate.create(this,function(checked)
      {
         this.updateScreenByHighGrade();
         this.setOKButtonEnabled(true);
      }
      ));
      this.text_high_grade_type.htmlText = "$195022";
      this.text_high_grade_type.autoSize = "left";
      var _loc5_ = {};
      _loc5_.onChanged = gfx.utils.Delegate.create(this,function(target, selected, selectedIndex)
      {
         this.setOKButtonEnabled(true);
      }
      );
      this.combo_high_grade_type._x = this.text_high_grade_type._x + this.text_high_grade_type._width;
      this.combo_high_grade_type.rowMax = 2;
      this.combo_high_grade_type.__set__data([{label:"$195011",id:g4.model.GameConstants.PARTY_DISTRIBUTION_HIGH_GRADE_TYPE_RANDOM},{label:"$195012",id:g4.model.GameConstants.PARTY_DISTRIBUTION_HIGH_GRADE_TYPE_DICE}]);
      this.combo_high_grade_type.addListener(_loc5_);
      var _loc2_ = gfx.utils.Delegate.create(this,function(checked)
      {
         this.setOKButtonEnabled(true);
      }
      );
      this.configCheckBox(this.check_equip_item,this.text_equip_item,"$195014",_loc2_);
      this.configCheckBox(this.check_class_only,this.text_class_only,"$195015",_loc2_);
      this.configCheckBox(this.check_dice,this.text_dice,"$195016",_loc2_);
      this.configCheckBox(this.check_no_looting,this.__get__targetMovieClip().text_no_looting,"$195019",_loc2_);
      this.button_ok = this.mc_master_view.button_ok.txtBtn;
      this.button_ok.setRelease(gfx.utils.Delegate.create(this,this.save));
      var _loc3_ = undefined;
      _loc3_ = this.mc_master_view.button_cancel.txtBtn;
      _loc3_.setRelease(function()
      {
         g4.model.GameModel.partyModel.ToGame_PartyLootingSetting_Close();
      }
      );
      var _loc4_ = this.mc_member_view.mc_info.mc.text_info;
      _loc4_.verticalAlign = "center";
      _loc4_.textAutoSize = "shrink";
      _loc4_.htmlText = "$195038";
      this.mc_member_view.mc_blocker.onRelease = null;
      _loc3_ = this.mc_member_view.button_ok.txtBtn;
      _loc3_.setRelease(function()
      {
         g4.model.GameModel.partyModel.ToGame_PartyLootingSetting_Close();
      }
      );
   }
   function configCheckBox(checkBox, textField, htmlText, func)
   {
      textField.htmlText = htmlText;
      textField.textAutoSize = "shrink";
      checkBox.setText(textField);
      checkBox.onChanged = func;
   }
   function updateScreen(editable)
   {
      if(editable)
      {
         this.mc_master_view._visible = true;
         this.mc_member_view._visible = false;
      }
      else
      {
         this.mc_master_view._visible = false;
         this.mc_member_view._visible = true;
      }
      var _loc2_ = g4.model.GameModel.partyModel.partyDistributionData;
      switch(_loc2_.highGradeDistributionType)
      {
         case g4.model.GameConstants.PARTY_DISTRIBUTION_HIGH_GRADE_TYPE_RANDOM:
            this.combo_high_grade_type.setSelectedIndex(0);
            break;
         case g4.model.GameConstants.PARTY_DISTRIBUTION_HIGH_GRADE_TYPE_DICE:
            this.combo_high_grade_type.setSelectedIndex(1);
      }
      this.check_high_grade.__set__checked(_loc2_.highGrade);
      this.check_equip_item.__set__checked(_loc2_.equipItem);
      this.check_class_only.__set__checked(_loc2_.possibleClassOnly);
      this.check_dice.__set__checked(_loc2_.dice);
      this.check_no_looting.__set__checked(_loc2_.noLootingOnBattleMode);
      this.setDistributionType(_loc2_.distributionType);
      this.setOKButtonEnabled(false);
   }
   function setDistributionType(type)
   {
      var _loc2_ = type == g4.model.GameConstants.PARTY_DISTRIBUTION_TYPE_SEQUENTIAL;
      this.radio_free.__set__checked(!_loc2_);
      this.radio_sequential.__set__checked(_loc2_);
      this.check_high_grade.setEnabled(_loc2_);
      this.setTextFieldColor(this.text_high_grade,_loc2_);
      this.updateScreenByHighGrade();
   }
   function updateScreenByHighGrade()
   {
      var _loc3_ = this.radio_sequential.__get__checked();
      var _loc2_ = _loc3_ && this.check_high_grade.__get__checked();
      this.combo_high_grade_type.__set__active(_loc2_);
      if(_loc2_)
      {
         this.combo_high_grade_type._alpha = 100;
      }
      else
      {
         this.combo_high_grade_type._alpha = 50;
      }
      this.check_equip_item.setEnabled(_loc2_);
      this.check_class_only.setEnabled(_loc2_);
      this.check_dice.setEnabled(_loc2_);
      this.setTextFieldColor(this.text_high_grade_type,_loc2_);
      this.setTextFieldColor(this.text_equip_item,_loc2_);
      this.setTextFieldColor(this.text_class_only,_loc2_);
      this.setTextFieldColor(this.text_dice,_loc2_);
   }
   function setTextFieldColor(textField, enabled)
   {
      if(enabled)
      {
         textField.textColor = 14145495;
      }
      else
      {
         textField.textColor = lib.info.TextColor.GENERAL_DISABLE;
      }
   }
   function setOKButtonEnabled(bEnabled)
   {
      this.button_ok.setEnabled(bEnabled);
   }
   function save()
   {
      var _loc2_ = !this.radio_sequential.__get__checked()?g4.model.GameConstants.PARTY_DISTRIBUTION_TYPE_FREE:g4.model.GameConstants.PARTY_DISTRIBUTION_TYPE_SEQUENTIAL;
      var _loc6_ = this.check_high_grade.__get__checked();
      var _loc5_ = Number(this.combo_high_grade_type.__get__selected());
      var _loc7_ = this.check_equip_item.__get__checked();
      var _loc4_ = this.check_class_only.__get__checked();
      var _loc8_ = this.check_dice.__get__checked();
      var _loc3_ = this.check_no_looting.__get__checked();
      g4.model.GameModel.partyModel.ToGame_PartyLootingSetting_SaveOption(_loc2_,_loc6_,_loc5_,_loc7_,_loc4_,_loc8_,_loc3_);
   }
}
