function checkData()
{
   var _loc1_ = 0;
   if(_loc1_ < pageData.length)
   {
      if(pageData[_loc1_] == "dropBG")
      {
         return true;
      }
      return false;
   }
}
function setComboBox()
{
   var _loc7_ = [];
   var _loc2_ = 0;
   while(_loc2_ < filterLabel.length)
   {
      var _loc4_ = _loc2_;
      var _loc3_ = filterLabel[_loc2_];
      _loc7_.push({label:_loc3_,id:_loc4_});
      _loc2_ = _loc2_ + 1;
   }
   comboMc.data = _loc7_;
   comboMc.setSelectedId(3);
   comboMc.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      this.setSelectedId(0);
   };
   comboMc.addListener(comboMc);
}
function ToGame_Achievement_SelectFilter(_id)
{
   comboIndex = Number(_id);
   getURL("FSCommand:ToGame_Achievement_SelectFilter",_id);
}
function SetComboBoxAlign(num)
{
   var _loc1_ = 150 + num;
   var _loc2_ = 750 - num;
   container_mc.listMask._y = _loc1_;
   container_mc.listContainer._y = _loc1_;
   listContainerY = _loc1_;
   container_mc.listMask._height = _loc2_;
   lScroll.displaySize = _loc2_;
}
function setCompensationInfo(_mc, _info)
{
   _mc.over._visible = false;
   _mc.over._width = 668;
   _mc.over._height = 138;
   _mc.bg_normal._visible = true;
   _mc.bg_complete._visible = false;
   _mc.compareMc._visible = false;
   _mc.completeMc._visible = false;
   _mc.bg_over._visible = false;
   _mc.titleFd._visible = false;
   _mc.openBtn._visible = false;
   _mc.grideMc.dateFd.textAutoSize = "shrink";
   var _loc19_ = _info[ACHIEVEMENT_NAME];
   var _loc3_ = _info[ACHIEVEMENT_ICON];
   var _loc20_ = Number(_info[ACHIEVEMENT_GRADE]);
   var _loc9_ = Number(_info[ACHIEVEMENT_REWARD]);
   var _loc18_ = Number(_info[ACHIEVEMENT_IS_DETAIL]);
   var _title = _info[ACHIEVEMENT_TITLE];
   var _loc4_ = _info[ACHIEVEMENT_DATE];
   var _loc5_ = _info[ACHIEVEMENT_COMPARE_NAME];
   var _loc6_ = _info[ACHIEVEMENT_COMPARE_DATE];
   var _loc21_ = _info[ACHIEVEMENT_DESC];
   var _loc10_ = Number(_info[ACHIEVEMENT_SCORE]);
   _mc.achTitleFd.htmlText = _loc19_;
   _mc.achTitleFd.verticalAlign = "center";
   _mc.achTitleFd.textAutoSize = "shrink";
   _mc.descFd.htmlText = _loc21_;
   var _loc11_ = _mc.descFd.textHeight;
   if(_loc11_ > ACHIEVEMENT_DESC_HEIGHT)
   {
      _mc.descFd._height = _loc11_ + 2;
   }
   var _loc22_ = getScoreColorIndex(_loc10_);
   _mc.scoreFd.textColor = scoreColor[_loc22_];
   _mc.scoreFd.text = _loc10_;
   _mc.scoreFd.verticalAlign = "center";
   _mc.scoreFd.textAutoSize = "shrink";
   _mc.gradeMc.gotoAndStop(_loc20_ + 1);
   var _loc16_ = _loc3_.substring(0,3);
   var _loc8_ = 92;
   if(_loc16_ != "img")
   {
      if(_loc3_ != undefined && _loc3_ != "")
      {
         if(_loc4_ != "-1")
         {
            _loc3_ = "img://__" + _loc3_ + "_U";
         }
         else
         {
            _loc3_ = "img://__" + _loc3_ + "_R";
         }
      }
   }
   if(_loc4_ != "-1")
   {
      _mc.completeMc._visible = true;
      _mc.completeMc.dateFd.text = _loc4_;
      _mc.bg_normal._visible = false;
      _mc.bg_complete._visible = true;
   }
   else
   {
      _mc.bg_disable.gotoAndStop(2);
      _mc.bg_disable.hitTestDisable = true;
   }
   _loc8_ = 64;
   var _loc14_ = flash.display.BitmapData.loadBitmap(_loc3_);
   _mc.icon.attachBitmap(_loc14_,_mc.icon.getNextHighestDepth());
   _mc.icon._width = _mc.icon._height = _loc8_;
   if(_loc9_ == 0)
   {
      _mc.compareMc._x = _mc.compareMc._x + 37;
      _mc.rewardMc._visible = false;
   }
   else
   {
      _mc.rewardMc._visible = true;
      _mc.rewardMc.gotoAndStop(_loc9_);
   }
   _mc.openBtn._visible = _loc18_;
   _mc._isDetail = _mc.openBtn._visible;
   if(_title != "-1")
   {
      _mc.titleFd._visible = true;
      _mc.titleFd.htmlText = _title;
      _mc.titleFd.verticalAlign = "center";
      _mc.achTitleFd._height = 25;
   }
   if(_loc5_ != "-1")
   {
      var _loc13_ = lib.util.UIString.getUIString("$007012");
      var _loc12_ = lib.util.UIString.getUIString("$007011");
      _mc.completeMc._visible = false;
      _mc.compareMc._visible = true;
      if(_loc6_ != "-1")
      {
         _mc.compareMc.textFd_0.text = _loc5_ + " : " + _loc6_;
      }
      else
      {
         _mc.compareMc.textFd_0.text = _loc5_ + " : " + _loc13_;
         _mc.compareMc.textFd_0.textColor = 7368816;
      }
      if(_loc4_ != "-1")
      {
         _mc.compareMc.textFd_1.text = _loc12_ + " : " + _loc4_;
      }
      else
      {
         _mc.compareMc.textFd_1.text = _loc12_ + " : " + _loc13_;
         _mc.compareMc.textFd_1.textColor = 7368816;
      }
      var _loc23_ = _mc.compareMc.textFd_0.textWidth;
   }
   _mc.onRollOver = function()
   {
      this.bg_over._visible = true;
   };
   _mc.onRollOut = function()
   {
      this.bg_over._visible = false;
   };
   _mc.onRelease = function()
   {
      focusOver = true;
      if(this._isDetail)
      {
         if(this._isOpen)
         {
            this._isOpen = false;
            var _loc3_ = this.detailMc._height + 20;
            this.bg_normal._height = this._pHeight;
            this.overMc._height = this._pHeight;
            this.bg_disable._height = this._pHeight;
            var _loc4_ = this.detailMc.getDepth();
            this._pDetailMc = null;
            this._bFirst = true;
            this._title = false;
            var _loc2_ = this.createEmptyMovieClip("detailMc",_loc4_);
            _loc2_._x = 95;
            _loc2_._y = 136;
            this.bg_complete._height = this._pHeight;
            this.openBtn.gotoAndStop(1);
            displayList(this._aIndex,- _loc3_);
            this.descCheck._visible = true;
            this.descGauge._visible = true;
            this.overMc._visible = false;
            ToGame_Achievement_SelectedAchievement(this._idx,0);
         }
         else
         {
            this._isOpen = true;
            this.descCheck._visible = false;
            this.descGauge._visible = false;
            ToGame_Achievement_SelectedAchievement(this._idx,1);
         }
      }
      else
      {
         if(selectedAchievement == this)
         {
            return undefined;
         }
         ToGame_Achievement_SelectedCompensation(this._idx,2);
      }
      if(selectedAchievement != this)
      {
         selectedAchievement.overMc._visible = false;
      }
      selectedAchievement = this;
   };
}
function setAbilityInfo(_targetFd, _ability, _value, _changeColor)
{
   _targetFd.textFd_0.htmlText = _ability;
   _targetFd.textFd_1.htmlText = _value;
   if(_changeColor)
   {
      _targetFd.textFd_0.textColor = 7368816;
      _targetFd.textFd_1.textColor = 7368816;
   }
}
function displayList(_index, _value)
{
   var _loc1_ = _index + 1;
   while(_loc1_ < pageData.length)
   {
      var _loc3_ = pageData[_loc1_];
      var _loc2_ = container_mc.listContainer[_loc3_];
      _loc2_._y = _loc2_._y + _value;
      _loc1_ = _loc1_ + 1;
   }
   var _loc9_ = lScroll.scroll;
   var _loc7_ = undefined;
   var _loc4_ = container_mc.listContainer[pageData[pageData.length - 1]];
   if(_loc4_._isOpen)
   {
      lScroll.pageSize = _loc4_._y + _loc4_._height;
   }
   else
   {
      lScroll.pageSize = _loc4_._y + _loc4_._height - 10;
   }
   if(selectIndex != -1)
   {
      var _loc8_ = container_mc.listContainer["list_" + selectIndex];
      _loc7_ = _loc8_._y;
   }
   if(_loc7_ == undefined)
   {
      lScroll.scroll = _loc9_;
   }
   else
   {
      lScroll.setScrollPosition(_loc7_);
   }
   selectIndex = -1;
}
function setSlotInfo(_targetSlot, _info)
{
   _targetSlot.setLineNum(2);
   _targetSlot.showMoney(false);
   _targetSlot.down_txt.textColor = OxD7D7D7;
   _targetSlot.id = _info[0];
   _targetSlot.draw(_info[2]);
   _targetSlot.grade = _info[5];
   _targetSlot.sealType = _info[6];
   _targetSlot.masterpiece = _info[7];
   _targetSlot.drag = false;
   _targetSlot.effect = false;
   lib.manager.ToolTip.add(_targetSlot.SLOT,_info[0] + "\t" + _info[8],6,_targetSlot.Slot.Icon);
   _targetSlot.upText._visible = false;
   _targetSlot.new_txt.htmlText = _info[1];
   if(Number(_info[4]) == 1)
   {
      _targetSlot.downText = lib.util.UIString.getUIString("$091013","ItemCount",_info[3]);
   }
   else if(Number(_info[3]) > 1)
   {
      _targetSlot.downText = _info[3];
      _targetSlot.down_txt.textColor = 16777215;
   }
   if(Number(_info[8]) == 1)
   {
      _targetSlot.showMoney(false);
      _targetSlot.down_txt.textColor = lib.info.TextColor.SLOT_MONEY;
      _targetSlot.down_txt.htmlText = _info[3];
      _targetSlot.down_txt._y = _targetSlot.center_txt._y;
      _targetSlot.money_mc._y = _targetSlot.center_txt._y + 2;
   }
}
function getPrevMcType()
{
   var _loc3_ = container_mc.listContainer;
   var _loc2_ = pageData[pageData.length - 1];
   var _loc1_ = _loc3_[_loc2_]._type;
   return _loc1_;
}
function setAchievementInfo(_mc, _info)
{
   _mc.over._visible = false;
   _mc.over._width = 668;
   _mc.over._height = 138;
   _mc.bg_normal._visible = true;
   _mc.bg_complete._visible = false;
   _mc.compareMc._visible = false;
   _mc.completeMc._visible = false;
   _mc.titleFd._visible = false;
   _mc.openBtn._visible = false;
   _mc.grideMc.dateFd.textAutoSize = "shrink";
   var _loc16_ = _info[ACHIEVEMENT_NAME];
   var _loc3_ = _info[ACHIEVEMENT_ICON];
   var _loc17_ = Number(_info[ACHIEVEMENT_GRADE]);
   var _loc7_ = Number(_info[ACHIEVEMENT_REWARD]);
   var _loc15_ = Number(_info[ACHIEVEMENT_IS_DETAIL]);
   var _title = _info[ACHIEVEMENT_TITLE];
   var _loc4_ = _info[ACHIEVEMENT_DATE];
   var _loc5_ = _info[ACHIEVEMENT_COMPARE_NAME];
   var _loc6_ = _info[ACHIEVEMENT_COMPARE_DATE];
   var _loc18_ = _info[ACHIEVEMENT_DESC];
   var _loc8_ = Number(_info[ACHIEVEMENT_SCORE]);
   _mc.achTitleFd.htmlText = _loc16_;
   _mc.achTitleFd.verticalAlign = "center";
   _mc.descFd.htmlText = _loc18_;
   var _loc9_ = _mc.descFd.textHeight;
   if(_loc9_ > ACHIEVEMENT_DESC_HEIGHT)
   {
      _mc.descFd._height = _loc9_ + 2;
   }
   _mc.descFd._y = !(_mc.descFd.textHeight > 20 && _title == -1)?57:40;
   var _loc19_ = getScoreColorIndex(_loc8_);
   _mc.scoreFd.textColor = scoreColor[_loc19_];
   _mc.scoreFd.text = _loc8_;
   _mc.scoreFd.verticalAlign = "center";
   _mc.scoreFd.textAutoSize = "shrink";
   _mc.gradeMc.gotoAndStop(Number(_loc17_) + 1);
   if(_loc4_ != "-1")
   {
      _mc.completeMc._visible = true;
      _mc.completeMc.dateFd.text = _loc4_;
      _mc.bg_normal._visible = false;
      _mc.bg_complete._visible = true;
      _loc3_ = "img://__" + _loc3_ + "_U";
   }
   else
   {
      _loc3_ = "img://__" + _loc3_ + "_R";
      _mc.bg_disable.gotoAndStop(2);
      _mc.bg_disable.hitTestDisable = true;
   }
   if(_loc7_ == 0)
   {
      _mc.compareMc._x = _mc.compareMc._x + 37;
      _mc.rewardMc._visible = false;
   }
   else
   {
      _mc.rewardMc._visible = true;
      _mc.rewardMc.gotoAndStop(_loc7_);
   }
   _mc.openBtn._visible = _loc15_;
   _mc._isDetail = _mc.openBtn._visible;
   if(_title != "-1")
   {
      _mc.titleFd._visible = true;
      _mc.titleFd.htmlText = _title;
      _mc.titleFd.verticalAlign = "center";
      _mc.achTitleFd._height = 25;
   }
   if(_loc5_ != "-1")
   {
      var _loc11_ = lib.util.UIString.getUIString("$007012");
      var _loc10_ = lib.util.UIString.getUIString("$007011");
      _mc.completeMc._visible = false;
      _mc.compareMc._visible = true;
      if(_loc6_ != "-1")
      {
         _mc.compareMc.textFd_0.text = _loc5_ + " : " + _loc6_;
      }
      else
      {
         _mc.bg_disable.gotoAndStop(2);
         _mc.bg_disable.hitTestDisable = true;
         _mc.compareMc.textFd_0.text = _loc5_ + " : " + _loc11_;
         _mc.compareMc.textFd_0.textColor = 7368816;
      }
      if(_loc4_ != "-1")
      {
         _mc.compareMc.textFd_1.text = _loc10_ + " : " + _loc4_;
      }
      else
      {
         _mc.compareMc.textFd_1.text = _loc10_ + " : " + _loc11_;
         _mc.compareMc.textFd_1.textColor = 7368816;
      }
      var _loc20_ = _mc.compareMc.textFd_0.textWidth;
   }
   var _loc12_ = flash.display.BitmapData.loadBitmap(_loc3_);
   _mc.icon.attachBitmap(_loc12_,_mc.icon.getNextHighestDepth());
   _mc.onRelease = function()
   {
      focusOver = false;
      if(this._isDetail)
      {
         if(this._isOpen)
         {
            this._isOpen = false;
            _mc.openBtn.gotoAndStop(2);
            var _loc2_ = this.detailMc._height + 20;
            this.bg_normal._height = this._pHeight;
            this.bg_disable._height = this._pHeight;
            this.overMc._height = this._pHeight;
            var _loc3_ = this.detailMc.getDepth();
            this._pDetailMc = null;
            this._bFirst = true;
            this._title = false;
            var _mc = this.createEmptyMovieClip("detailMc",_loc3_);
            _mc._x = 95;
            _mc._y = 136;
            this.bg_complete._height = this._pHeight;
            this.openBtn.gotoAndStop(1);
            displayList(this._aIndex,- _loc2_);
            this.descCheck._visible = true;
            this.descGauge._visible = true;
            this.overMc._visible = false;
            ToGame_Achievement_SelectedAchievement(this._idx,0);
         }
         else
         {
            this._isOpen = true;
            this.descCheck._visible = false;
            this.descGauge._visible = false;
            ToGame_Achievement_SelectedAchievement(this._idx,1);
         }
      }
      else
      {
         if(selectedAchievement == this)
         {
            return undefined;
         }
         ToGame_Achievement_SelectedAchievement(this._idx,2);
      }
      if(selectedAchievement != this)
      {
         selectedAchievement.overMc._visible = false;
      }
      selectedAchievement = this;
   };
}
function getScoreColorIndex(_score)
{
   if(_score <= 19)
   {
      return 0;
   }
   if(_score > 19 && _score <= 39)
   {
      return 1;
   }
   if(_score > 39 && _score <= 59)
   {
      return 2;
   }
   if(_score > 59 && _score <= 79)
   {
      return 3;
   }
   if(_score > 79)
   {
      return 4;
   }
}
function ToGame_Achievement_Init()
{
   fscommand("ToGame_Achievement_Init");
}
function ToGame_Achievement_CloseUI()
{
   fscommand("ToGame_Achievement_CloseUI");
}
function ToGame_Achievement_SelectedCategory(_id)
{
   clearPage();
   getURL("FSCommand:ToGame_Achievement_SelectedCategory",_id);
}
function ToGame_Achievement_SelectedAchievement(_id, _num)
{
   getURL("FSCommand:ToGame_Achievement_SelectedAchievement",_id + "\t" + _num);
}
function ToGame_Achievement_SelectedCompensation(_id, _num)
{
   getURL("FSCommand:ToGame_Achievement_SelectedCompensation",_id + "\t" + _num);
}
function ToGame_Achievement_MoreCompensation()
{
   clearPage();
   fscommand("ToGame_Achievement_MoreCompensation");
}
function createCategory()
{
   var _loc5_ = container_mc.categoryContainer;
   var _loc3_ = 0;
   while(_loc3_ < categoryArray.length)
   {
      var _loc2_ = categoryArray[_loc3_];
      if(_loc2_ != undefined)
      {
         var _loc1_ = _loc5_.attachMovie("categoryBtn","category_" + String(_loc2_[INDEX]),_loc5_.getNextHighestDepth());
         _loc1_.id = _loc2_[INDEX];
         if(_loc2_[NORMALIMG] != "" && _loc2_[NORMALIMG] != null && _loc2_[NORMALIMG] != undefined && _loc2_[NORMALIMG] != "undefined")
         {
            createSkin(_loc1_,_loc2_);
            if(_loc2_[NORMALIMG] == "gradeBtn_up")
            {
               _loc1_.textFd.textColor = 13893328;
            }
            else if(_loc2_[NORMALIMG] == "compensationBtn_up")
            {
               _loc1_.textFd.textColor = 7853426;
            }
            else
            {
               _loc1_.textFd.textColor = 6918838;
            }
            _loc1_.textFd.text = count.toString();
         }
         else
         {
            _loc1_.attachMovie("skinContainer","skinContainer",_loc1_.getNextHighestDepth());
            var _loc4_ = new TextFormat();
            _loc4_.size = 16;
            _loc1_.gauge._visible = false;
            _loc1_.gauge._y = 0;
            _loc1_.textFd._width = 191;
            _loc1_.textFd._height = 21;
            _loc1_.textFd.setNewTextFormat(_loc4_);
            _loc1_.textFd._y = 5;
            _loc1_.textFd.textColor = 16777215;
            _loc1_.openIcon._visible = false;
            _loc1_._visible = false;
         }
         _loc1_.skinContainer._visible = false;
         setCategoryBtnEvent(_loc1_);
         invalidateCategory();
      }
      _loc3_ = _loc3_ + 1;
   }
}
function invalidateCategory()
{
   if(invalidationIntervalID)
   {
      return undefined;
   }
   invalidationIntervalID = setInterval(this,"validateCategory",1);
}
function validateCategory()
{
   clearInterval(invalidationIntervalID);
   delete invalidationIntervalID;
   drawCategory();
}
function drawCategory()
{
   var _loc10_ = categoryArray.length;
   var _loc4_ = 0;
   while(_loc4_ < _loc10_)
   {
      var _loc3_ = categoryArray[_loc4_];
      if(_loc3_ != undefined)
      {
         var _loc7_ = Number(_loc3_[CURRENT]);
         var _loc6_ = Number(_loc3_[TOTAL]);
         var _loc2_ = container_mc.categoryContainer["category_" + String(_loc3_[INDEX])];
         var _loc8_ = _loc2_.skinContainer._height;
         var _loc9_ = _loc2_.skinContainer._width;
         var _loc5_ = _loc2_.gauge;
         setGaugeInfo(_loc5_,_loc7_,_loc6_);
         _loc2_.hit_mc._height = _loc8_;
         _loc2_.hit_mc._width = _loc9_;
         _loc2_.skinContainer.swapDepths(_loc2_.tempContainer);
         _loc2_.textFd.text = _loc3_[TEXT];
         if(_loc3_[HASSUB] == false)
         {
            _loc2_.openIcon._visible = false;
         }
         _loc2_.skinContainer.overMc._visible = false;
         _loc2_.skinContainer.pressMc._visible = false;
         _loc2_.skinContainer._visible = true;
         _loc2_.tempContainer.removeMovieClip();
      }
      if(selectedCategory != -1)
      {
         this["category_" + selectedCategory].skinContainer.normalMc._visible = false;
         this["category_" + selectedCategory].skinContainer.pressMc._visible = true;
         this["category_" + selectedCategory].skinContainer.overMc._visible = false;
      }
      _loc4_ = _loc4_ + 1;
   }
   selectDisplayCategory();
}
function displayCategory(_data)
{
   var _loc6_ = container_mc.categoryContainer;
   var _loc3_ = -1;
   var _loc7_ = cScroll.scroll;
   cScroll.pageSize = 0;
   var _loc5_ = _data.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc5_)
   {
      var _loc1_ = _loc6_["category_" + String(_data[_loc2_])];
      _loc1_._y = _loc3_;
      _loc1_._visible = true;
      _loc3_ = _loc1_._y + _loc1_._height;
      if(_data[_loc2_] == selectedCategory)
      {
         _loc1_.skinContainer.normalMc._visible = false;
         _loc1_.skinContainer.pressMc._visible = true;
         _loc1_.skinContainer.overMc._visible = false;
      }
      _loc2_ = _loc2_ + 1;
   }
   cScroll.pageSize = _loc3_ + 2;
   cScroll.scroll = _loc7_;
}
function setSubCategoryVisible(_info, _bTrue)
{
   var _loc5_ = container_mc.categoryContainer;
   var _loc1_ = 0;
   while(_loc1_ < _info.length)
   {
      var _loc2_ = _info[_loc1_];
      var _loc3_ = _loc5_["category_" + String(_loc2_)];
      _loc3_._visible = _bTrue;
      _loc1_ = _loc1_ + 1;
   }
}
function selectDisplayCategory()
{
   var _loc5_ = new Array();
   var _loc3_ = 0;
   while(_loc3_ < mainCategoryArray.length)
   {
      var _loc4_ = mainCategoryArray[_loc3_];
      var _loc2_ = categoryArray[_loc4_];
      _loc5_.push(_loc4_);
      if(_loc2_[ISOPEN])
      {
         var _loc1_ = 0;
         while(_loc1_ < _loc2_[SUBID].length)
         {
            _loc5_.push(_loc2_[SUBID][_loc1_]);
            _loc1_ = _loc1_ + 1;
         }
      }
      _loc3_ = _loc3_ + 1;
   }
   displayCategory(_loc5_);
}
function createSkin(_parentMc, _info)
{
   var _loc4_ = _parentMc.attachMovie("emptySkinContainer","skinContainer",_parentMc.getNextHighestDepth());
   var _loc2_ = null;
   var _loc3_ = null;
   var _loc1_ = 0;
   while(_loc1_ < img.length)
   {
      _loc2_ = _loc4_[img[_loc1_] + "Mc"];
      _loc3_ = flash.display.BitmapData.loadBitmap(_info[NORMALIMG + _loc1_]);
      _loc2_.attachBitmap(_loc3_,_loc2_.getNextHighestDepth());
      _loc1_ = _loc1_ + 1;
   }
}
function setCategoryBtnEvent(_targetMc)
{
   _targetMc.onRelease = setCategoryRelease;
   _targetMc.onRollOver = setCategoryRollOver;
   _targetMc.onRollOut = setCategoryRollOut;
   _targetMc.onReleaseOutside = setCategoryReleaseOutside;
}
function setCategoryRelease()
{
   var _loc2_ = categoryArray[selectedCategory];
   var _loc3_ = _loc2_[MAININDEX];
   if(this.id == selectedCategory)
   {
      if(_loc3_ != -1)
      {
         return undefined;
      }
      _loc2_[ISOPEN] = !_loc2_[ISOPEN];
      setSubCategoryVisible(_loc2_[SUBID],false);
      selectDisplayCategory();
      return undefined;
   }
   var _loc4_ = getSelectedCategory();
   _loc4_.skinContainer.overMc._visible = false;
   _loc4_.skinContainer.normalMc._visible = true;
   _loc4_.skinContainer.pressMc._visible = false;
   setSubCategoryVisible(_loc2_[SUBID],false);
   selectedCategory = this.id;
   _loc3_ = categoryArray[selectedCategory][MAININDEX];
   if(_loc3_ == -1)
   {
      categoryArray[selectedCategory][ISOPEN] = true;
   }
   else
   {
      categoryArray[_loc3_][ISOPEN] = true;
   }
   this.skinContainer.overMc._visible = false;
   this.skinContainer.normalMc._visible = false;
   this.skinContainer.pressMc._visible = true;
   selectDisplayCategory();
   ToGame_Achievement_SelectedCategory(this.id);
}
function setCategoryRollOver()
{
   var _loc2_ = getSelectedCategory();
   if(_loc2_ == this)
   {
      return undefined;
   }
   this.skinContainer.normalMc._visible = false;
   this.skinContainer.overMc._visible = true;
   this.skinContainer.pressMc._visible = false;
}
function setCategoryRollOut()
{
   var _loc2_ = getSelectedCategory();
   if(_loc2_ == this)
   {
      return undefined;
   }
   this.skinContainer.overMc._visible = false;
   this.skinContainer.pressMc._visible = false;
   this.skinContainer.normalMc._visible = true;
}
function setCategoryReleaseOutside()
{
   var _loc2_ = getSelectedCategory();
   if(_loc2_ == this)
   {
      return undefined;
   }
   this.skinContainer.normalMc._visible = true;
   this.skinContainer.overMc._visible = false;
}
function getSelectedCategory()
{
   return container_mc.categoryContainer["category_" + String(selectedCategory)];
}
function clearCategory()
{
   vcategoryArray = [];
   mainCategoryArray = [];
   selectedCategory = -1;
   cScroll.pageSize = 0;
   cScroll.scroll = 0;
   clearContainer(container_mc.categoryContainer);
}
function clearPage()
{
   selectedAchievement = null;
   pType = -1;
   pageData.splice(0);
   startY = 0;
   if(container_mc.comboBox._visible)
   {
      SetComboBoxAlign(60);
   }
   else
   {
      SetComboBoxAlign(0);
   }
   if(container_mc.listTitleMc)
   {
      container_mc.listTitleMc.removeMovieClip();
   }
   clearContainer(container_mc.listContainer);
}
function getPosY(_type)
{
   var _loc3_ = pageData.length;
   var _loc7_ = getPrevMcType();
   if(_loc3_ <= 0)
   {
      if(_type == TYPE_GAUGE)
      {
         return 10;
      }
      return 0;
   }
   var _loc2_ = container_mc.listContainer;
   var _loc1_ = pageData[_loc3_ - 1];
   var _loc5_ = _loc2_[_loc1_]._y + _loc2_[_loc1_]._height;
   var _loc4_ = getMargin(_type);
   return _loc5_ + _loc4_;
}
function getMargin(_type)
{
   var _loc1_ = getPrevMcType();
   if(_type == TYPE_TITLE)
   {
      return 20;
   }
   if(_type == TYPE_GAUGE)
   {
      if(_loc1_ == TYPE_GAUGE)
      {
         return 10;
      }
      return 20;
   }
   if(_type == TYPE_ACHIEVEMENT)
   {
      if(_loc1_ == TYPE_TITLE)
      {
         return 2;
      }
      return 20;
   }
   if(_type == TYPE_ABILITY)
   {
      if(_loc1_ == TYPE_TITLE)
      {
         return 15;
      }
      return 20;
   }
}
function getPrevMcType()
{
   var _loc3_ = container_mc.listContainer;
   var _loc2_ = pageData[pageData.length - 1];
   var _loc1_ = _loc3_[_loc2_]._type;
   return _loc1_;
}
function setGaugeInfo(_mc, _current, _total, _titleText)
{
   _current = Number(_current);
   _total = Number(_total);
   if(_current == -1)
   {
      _mc.maskMc._xscale = _total;
      _mc.countFd.text = _total + "%";
      if(_total >= 100)
      {
         _mc.countFd.textColor = _mc.titleFd.textColor = 8447772;
      }
   }
   else
   {
      var _loc5_ = _current != 0?_current / _total * 100:0;
      _mc.maskMc._xscale = _loc5_;
      _mc.countFd.text = _current + "/" + _total;
      if(_loc5_ >= 100)
      {
         _mc.countFd.textColor = _mc.titleFd.textColor = 8447772;
      }
   }
   if(_titleText == "" || _titleText == "undefined" || _titleText == undefined)
   {
      _titleText = "";
   }
   _mc.titleFd.htmlText = _titleText;
}
function clearContainer(_container)
{
   for(var _loc2_ in _container)
   {
      if(typeof _container[_loc2_] == "movieclip")
      {
         _container[_loc2_].removeMovieClip();
      }
   }
}
function test()
{
   this._visible = true;
   var _loc2_ = "-1\t100\t업적 등급\tgradeBtn_up\tgradeBtn_over\tgradeBtn_click\n";
   _loc2_ = _loc2_ + "-1\t101\t보상\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t102\t총계\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t103\t일반\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t104\t사냥과 탐험\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t105\t퀘스트\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t106\t던전\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t107\t생활\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t108\t특수\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click";
   _loc2_ = _loc2_ + "-1\t105\t퀘스트\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t106\t던전\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t107\t생활\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t108\t특수\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click";
   _loc2_ = _loc2_ + "-1\t109\t퀘스트\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t110\t던전\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t111\t생활\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t112\t특수\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click";
   _loc2_ = _loc2_ + "-1\t113\t퀘스트\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t114\t던전\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t115\t생활\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t116\t특수\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click";
   _loc2_ = _loc2_ + "-1\t117\t퀘스트\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t118\t던전\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t119\t생활\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t120\t특수\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click";
   _loc2_ = _loc2_ + "-1\t121\t퀘스트\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t122\t던전\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t123\t생활\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click\n";
   _loc2_ = _loc2_ + "-1\t124\t특수\tnormalBtn_up\tnormalBtn_over\tnormalBtn_click";
   myListener.OnGame_Achievement_SetCategory(_loc2_);
   myListener.OnGame_Achievement_SetInfo("315",25,"21444",2);
   var _loc8_ = "1\t일반\t200\t200\t0\n";
   _loc8_ = _loc8_ + "2\t사냥과 탐험\t400\t400\t1\n";
   _loc8_ = _loc8_ + "3\t퀘스트\t600\t600\t2\n";
   _loc8_ = _loc8_ + "4\t던전\t800\t800\t3\n";
   _loc8_ = _loc8_ + "5\t생활\t1000\t1000\t4\n";
   _loc8_ = _loc8_ + "6\t특수\t1200\t1200\t5";
   var _loc5_ = "7\t";
   _loc5_ = _loc5_ + "내가 넘어진건 공격력을 얻기 위함 이었다.\t";
   _loc5_ = _loc5_ + "img://achievement__395\t";
   _loc5_ = _loc5_ + "1\t";
   _loc5_ = _loc5_ + "3\t";
   _loc5_ = _loc5_ + "1\t";
   _loc5_ = _loc5_ + "바보\t";
   _loc5_ = _loc5_ + "컴페어\t";
   _loc5_ = _loc5_ + "2014\t";
   _loc5_ = _loc5_ + "60레벨을 달성한다\t";
   _loc5_ = _loc5_ + "2000\n";
   var _loc4_ = "0\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "1\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "2\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "3\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "4\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "5\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "6\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "7\t777777!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "8\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "9\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "10\t10\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "11\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "12\t12!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "13\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "14\t14!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "15\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "16\t16!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "17\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "18\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc4_ = _loc4_ + "19\t끝!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   var _loc6_ = "0\t30레벨 달성1\timg://achievement__395\n";
   _loc6_ = _loc6_ + "1\t30레벨 달성2\timg://achievement__395\n";
   _loc6_ = _loc6_ + "1\t30레벨 달성2\timg://achievement__395\n";
   _loc6_ = _loc6_ + "1\t30레벨 달성2\timg://achievement__395\n";
   _loc6_ = _loc6_ + "1\t30레벨 달성2\timg://achievement__395\n";
   _loc6_ = _loc6_ + "1\t30레벨 달성2\timg://achievement__395\n";
   _loc6_ = _loc6_ + "1\t30레벨 달성2\timg://achievement__395\n";
   _loc6_ = _loc6_ + "1\t30레벨 달성2\timg://achievement__395\n";
   var _loc3_ = "0\t30레벨 달성!\timg://achievement__395\t1\t1\t1\t-1\t2002.01.01\t겨터럭에로엘\t2014.06.25\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "1\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "2\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "3\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "4\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "5\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "6\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "7\t77777달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "8\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "9\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "10\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "11\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "12\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "13\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "14\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "15\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "16\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "17\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "18\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "19\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   _loc3_ = _loc3_ + "20\t30레벨 달성!\timg://achievement__395\t0\t1\t1\t-1\t2002.01.01\t-1\t-1\t30레벨을 달성한다\t1000\n";
   myListener.OnGame_Achievement_SetCompensation(_loc3_);
   myListener.OnGame_Achievement_MoreCompensationList();
   var _loc7_ = "0\t0\t0\t1\t브론즈 등급\t체력 게이지 장식\n";
   _loc7_ = _loc7_ + "1\t0\t1\t1\t브론즈 등급\t체력 게이지 장식\n";
   _loc7_ = _loc7_ + "2\t0\t2\t2\t브론즈 등급\t체력 게이지 장식\n";
   _loc7_ = _loc7_ + "3\t1\t3\t3\t브론즈 등급\t체력 게이지 장식\n";
   _loc7_ = _loc7_ + "4\t0\t4\t4\t브론즈 등급\t체력 게이지 장식\n";
   _loc7_ = _loc7_ + "5\t2\t5\t0\t브론즈 등급\t체력 게이지 장식\n";
   _loc7_ = _loc7_ + "6\t0\t6\t1\t브론즈 등급\t체력 게이지 장식\n";
   var _loc9_ = "0\t1\t시즌1\t2011.08.03 ~ 2012.09.02\n";
   _loc9_ = _loc9_ + "0\t3\t시즌2\t2011.08.03 ~ 2012.09.02\n";
   _loc9_ = _loc9_ + "1\t2\t시즌3\t2011.08.03 ~ 2012.09.02\n";
   myListener.OnGame_Achievement_SelectAchievement(19);
}
var UI = this;
UI._visible = false;
var UIname = "Achievement";
var bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI);
var defaultText__0 = lib.util.UIString.getUIString("$007025");
var defaultText__1 = lib.util.UIString.getUIString("$007026");
container_mc.defaultFd.htmlText = defaultText__0;
container_mc.defaultFd._visible = false;
container_mc.defaultFd.verticalAlign = "center";
var invalidationIntervalID;
var categoryContainerY = container_mc.categoryContainer._y;
var cScroll = container_mc.categoryScroll;
cScroll.addListener(container_mc.categoryContainer);
container_mc.categoryContainer.onScroll = function()
{
   container_mc.categoryContainer._y = categoryContainerY - arguments[0];
};
cScroll.setWheel(container_mc.categoryContainer);
cScroll.wheelDelta = 1;
cScroll.pageSize = 0;
cScroll.displaySize = container_mc.categoryMask._height;
cScroll.defaultBarSizeRatio = 0.3333333333333333;
cScroll.rowHeight = 106;
cScroll.scroll = 0;
var listContainerY = container_mc.listContainer._y;
var lScroll = container_mc.listScroll;
lScroll.addListener(container_mc.listContainer);
container_mc.listContainer.onScroll = function()
{
   container_mc.listContainer._y = listContainerY - arguments[0];
};
lScroll.setWheel(container_mc.listContainer);
lScroll.wheelDelta = 1;
lScroll.pageSize = 0;
lScroll.displaySize = container_mc.listMask._height;
lScroll.defaultBarSizeRatio = 0.3333333333333333;
lScroll.rowHeight = 50;
lScroll.scroll = 0;
var closeBtn = new lib.util.TxtBtn(container_mc.close_btn);
closeBtn.setRelease(ToGame_Achievement_CloseUI);
var filterLabel = ["$007014","$007015","$007016","$007017","$007018","$007019","$007020","$007021"];
var comboIndex = 0;
var comboMc = container_mc.comboBox;
comboMc.onChanged = function(This, selected, selectedIndex)
{
   clearPage();
   ToGame_Achievement_SelectFilter(selected);
};
comboMc.rowMax = 10;
setComboBox();
myListener.OnGame_Achievement_SelectFilter = function(_id)
{
   comboIndex = Number(_id);
   comboMc.setSelectedId(_id);
};
comboMc.setSelectedId(index);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
         var startTime = getTimer();
         var currentTime = startTime;
         onEnterFrame = function()
         {
            currentTime = getTimer();
            startTime = getTimer();
            currentTime = startTime;
            container_mc.aa.text = "initTime-->:" + currentTime / 1000 + "sec";
            delete onEnterFrame;
         };
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
var pageData = new Array();
var movData = new Array();
var TYPE_TITLE = 0;
var TYPE_GAUGE = 1;
var TYPE_ACHIEVEMENT = 2;
var TYPE_ABILITY = 3;
var col = [1,2];
var w = [584,310];
var h = [80,45];
var GAUGE_INDEX = 0;
var GAUGE_TEXT = 1;
var GAUGE_CURRENT = 2;
var GAUGE_TOTAL = 3;
container_mc.comboBox._visible = false;
var INFO_STR0 = lib.util.UIString.getUIString("$007046");
var INFO_STR1 = lib.util.UIString.getUIString("$272012");
var INFO_STR2 = lib.util.UIString.getUIString("$272015");
myListener.OnGame_Achievement_SetInfo = function(nRemainScore, nRemainPercent, nTotalScore, nGrade, compareName, compareScore, tooltipScore)
{
   var _loc5_ = INFO_STR0;
   var _loc3_ = INFO_STR1;
   var _loc6_ = INFO_STR2;
   var _loc8_ = lib.util.UIString.getUIString("$272016","Score",tooltipScore,"Grade",gradeStrArr[nGrade]);
   var _loc1_ = Number(nGrade) + 1;
   var _loc4_ = gradeStrArr[_loc1_];
   container_mc.totalTF.text = "";
   container_mc.compareTF.text = "";
   if(_loc1_ > 5)
   {
      container_mc.remainTF.text = "";
   }
   else
   {
      container_mc.remainTF.text = "<" + _loc4_ + ">" + _loc5_ + " " + nRemainScore.toString() + _loc3_;
   }
   lib.manager.ToolTip.add(container_mc.remainGaugeMc,_loc6_,1);
   lib.manager.ToolTip.add(container_mc.gradeMc,_loc8_,1);
   container_mc.remainGaugeMc.maskMc._xscale = nRemainPercent;
   container_mc.totalTF.text = nTotalScore.toString() + _loc3_;
   container_mc.gradeMc.gotoAndStop(Number(nGrade) + 1);
   if(compareName != "" && compareName != undefined && compareName != null)
   {
      var _loc7_ = lib.util.UIString.getUIString("$272017","Name",compareName,"CompareScore",compareScore.toString(),"TotalScore",nTotalScore.toString());
      container_mc.totalTF.text = "";
      container_mc.compareTF.htmlText = _loc7_;
   }
};
myListener.OnGame_Achievement_ShowComboBox = function(nShow)
{
   if(selectedAchievement != null)
   {
      clearPage();
   }
   if(nShow == 1)
   {
      container_mc.comboBox._visible = true;
      lScroll.pageSize = 0;
      lScroll.scroll = 0;
      var _loc2_ = container_mc.listContainer;
      var _loc1_ = null;
      var _loc3_ = "dropBG";
      var _loc4_ = getPosY(TYPE_GAUGE);
      _loc1_ = _loc2_.attachMovie("DropBG",_loc3_,_loc2_.getNextHighestDepth());
      _loc1_._x = 0;
      _loc1_._y = _loc4_;
      SetComboBoxAlign(60);
   }
   else
   {
      container_mc.comboBox._visible = false;
      SetComboBoxAlign(0);
      if(container_mc.listTitleMc)
      {
         container_mc.listTitleMc.removeMovieClip();
      }
   }
};
myListener.OnGame_Achievement_SetTitleGauge = function(titleName, cur, total)
{
   if(selectedAchievement != null)
   {
      clearPage();
   }
   container_mc.comboBox._visible = true;
   lScroll.pageSize = 0;
   lScroll.scroll = 0;
   var _loc1_ = null;
   var _loc2_ = getPosY(TYPE_GAUGE);
   container_mc.listTitleMc.removeMovieClip();
   _loc1_ = container_mc.attachMovie("ListTitleMc","listTitleMc",container_mc.getNextHighestDepth());
   _loc1_._x = 256;
   _loc1_._y = 151;
   SetComboBoxAlign(60);
   _loc1_.nameTF.text = titleName;
   _loc1_.curTF.text = cur + "/" + total;
};
myListener.OnGame_Achievement_SetTotalCategoryInfo = function(_gaugeData)
{
   if(selectedAchievement != null)
   {
      clearPage();
   }
   lScroll.pageSize = 0;
   lScroll.scroll = 0;
   var _loc5_ = container_mc.listContainer;
   var _loc7_ = lib.util.ExtString.split(_gaugeData,"\n");
   var _loc8_ = _loc7_.length;
   var _loc9_ = getPosY(TYPE_GAUGE);
   var _loc1_ = 0;
   while(_loc1_ < _loc8_)
   {
      var _loc6_ = pageData.length;
      var _loc3_ = lib.util.ExtString.split(_loc7_[_loc1_],"\t");
      var _loc4_ = "totalElement" + _loc1_;
      var _loc2_ = _loc5_.attachMovie("TotalElement",_loc4_,_loc5_.getNextHighestDepth());
      _loc2_._x = _loc1_ % 3 * 268;
      _loc2_._y = 33 + Math.floor(_loc1_ / 3) * 173;
      _loc2_.titleTF.text = _loc3_[1];
      _loc2_.countTF.text = _loc3_[2] + "/" + _loc3_[3];
      _loc2_.gradeMc.gotoAndStop(Number(_loc3_[4]) + 1);
      _loc1_ = _loc1_ + 1;
   }
   lScroll.pageSize = _mc._y + _mc._height + 2;
   pageData.push(_loc4_);
};
myListener.OnGame_Achievement_SetGradeInfomation = function(_achievementData)
{
   if(selectedAchievement != null)
   {
      clearPage();
   }
   container_mc.defaultFd._visible = false;
   if(_achievementData == "" || _achievementData == "undefined" || _achievementData == undefined)
   {
      if(comboIndex == 1)
      {
         container_mc.defaultFd.htmlText = defaultText__0;
         container_mc.defaultFd._visible = true;
      }
      else if(comboIndex == 2)
      {
         container_mc.defaultFd.htmlText = defaultText__1;
         container_mc.defaultFd._visible = true;
      }
   }
   var _loc17_ = getPosY(TYPE_ACHIEVEMENT);
   lScroll.pageSize = 0;
   lScroll.scroll = 0;
   var _loc13_ = undefined;
   var _loc9_ = lib.util.ExtString.split(_achievementData,"\n");
   var _loc10_ = _loc9_.length;
   var _loc7_ = container_mc.listContainer;
   var _loc14_ = "achievment_Title";
   var _loc11_ = container_mc.listContainer.attachMovie("AchievTitle",_loc14_,_loc7_.getNextHighestDepth());
   _loc11_._x = 7;
   _loc11_._y = 15;
   var _loc16_ = lib.util.UIString.getUIString("$007031");
   _loc11_.textField.htmlText = _loc16_;
   pageData.push(_idx);
   var _loc3_ = 0;
   while(_loc3_ < _loc10_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc9_[_loc3_],"\t");
      var _loc8_ = pageData.length;
      var _loc6_ = _loc2_[0];
      var _loc4_ = Number(_loc2_[3]) + 2;
      var _loc5_ = "achievment_grade_" + _loc6_;
      var _loc1_ = _loc7_.attachMovie("Achievment_grade",_loc5_,_loc7_.getNextHighestDepth());
      _loc1_.disableMc.gotoAndStop(Number(_loc2_[1]) + 1);
      _loc1_.gradeMc0.gotoAndStop(Number(_loc2_[2]) + 1);
      _loc1_.gradeMc1.achievementMc.gotoAndStop(Number(_loc2_[2]) + 1);
      _loc1_.gradeMc1.classMc.gotoAndStop(_loc4_);
      _loc1_.gradeMc2.achievementMc.gotoAndStop(Number(_loc2_[2]) + 1);
      _loc1_.gradeMc2.classMc.gotoAndStop(_loc4_);
      _loc1_.gradeTF.text = _loc2_[4];
      _loc1_.contentTF.text = _loc2_[5];
      _loc1_._y = 60 + _loc3_ * 128;
      pageData.push(_loc5_);
      _loc3_ = _loc3_ + 1;
   }
   var _loc15_ = _loc1_._y + _loc1_._height - 15;
   lScroll.pageSize = _loc15_;
   if(_loc13_ == undefined)
   {
      lScroll.scroll = 0;
   }
   else
   {
      lScroll.setScrollPosition(_loc13_);
   }
};
var descripionStr0 = lib.util.UIString.getUIString("$007032");
var descripionStr1 = lib.util.UIString.getUIString("$007033");
var descripionStr2 = lib.util.UIString.getUIString("$007034");
var gradeStrArr = [lib.util.UIString.getUIString("$007035"),lib.util.UIString.getUIString("$007036"),lib.util.UIString.getUIString("$007037"),lib.util.UIString.getUIString("$007038"),lib.util.UIString.getUIString("$007039"),lib.util.UIString.getUIString("$007040"),""];
myListener.OnGame_Achievement_SetMySeasonInfomation = function(grade, _achievementData)
{
   if(selectedAchievement != null)
   {
      clearPage();
   }
   container_mc.defaultFd._visible = false;
   if(_achievementData == "" || _achievementData == "undefined" || _achievementData == undefined)
   {
      if(comboIndex == 1)
      {
         container_mc.defaultFd.htmlText = defaultText__0;
         container_mc.defaultFd._visible = true;
      }
      else if(comboIndex == 2)
      {
         container_mc.defaultFd.htmlText = defaultText__1;
         container_mc.defaultFd._visible = true;
      }
   }
   var _loc15_ = getPosY(TYPE_ACHIEVEMENT);
   lScroll.pageSize = 0;
   lScroll.scroll = 0;
   var _loc11_ = undefined;
   var _loc8_ = lib.util.ExtString.split(_achievementData,"\n");
   var _loc9_ = _loc8_.length;
   var _loc13_ = container_mc.listContainer;
   var _loc12_ = "mySeasonPage";
   var _loc2_ = container_mc.listContainer.attachMovie("MySeasonPage",idx,_loc13_.getNextHighestDepth());
   _loc2_._x = 0;
   _loc2_._y = 0;
   _loc2_["effectMc" + grade].gotoAndStop(2);
   pageData.push(_loc12_);
   var _loc4_ = 0;
   while(_loc4_ < 4)
   {
      _loc2_["mySeasonMc" + _loc4_]._visible = false;
      _loc2_["mySeasonMc" + _loc4_].arrowMc._visible = false;
      _loc4_ = _loc4_ + 1;
   }
   var _loc1_ = 0;
   while(_loc1_ < _loc9_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc8_[_loc1_],"\t");
      var _loc7_ = pageData.length;
      var _loc5_ = _loc3_[0];
      var _loc6_ = "achievment_grade_" + _loc5_;
      _loc2_["mySeasonMc" + _loc1_]._visible = true;
      _loc2_["mySeasonMc" + _loc1_].currentMc.gotoAndStop(Number(_loc3_[0]) + 1);
      _loc2_["mySeasonMc" + _loc1_].gradeMc.gotoAndStop(Number(_loc3_[1]) + 1);
      _loc2_["mySeasonMc" + _loc1_].titleTF.text = _loc3_[2];
      _loc2_["mySeasonMc" + _loc1_].dayTF.text = _loc3_[3];
      if(_loc1_ == 1)
      {
         _loc2_.mySeasonMc0.arrowMc._visible = true;
      }
      if(_loc1_ == 2)
      {
         _loc2_.mySeasonMc1.arrowMc._visible = true;
      }
      if(_loc1_ == 3)
      {
         _loc2_.mySeasonMc2.arrowMc._visible = true;
      }
      pageData.push(_loc6_);
      _loc1_ = _loc1_ + 1;
   }
   _loc2_.descriptionTF0.text = descripionStr0;
   _loc2_.descriptionTF1.text = descripionStr1;
   _loc2_.descriptionTF2.text = descripionStr2;
   _loc2_.noticeTF.text = gradeStrArr[0];
   _loc2_.bronzeTF.text = gradeStrArr[1];
   _loc2_.sliverTF.text = gradeStrArr[2];
   _loc2_.goldTF.text = gradeStrArr[3];
   _loc2_.diamondTF.text = gradeStrArr[4];
   _loc2_.championTF.text = gradeStrArr[5];
   var _loc14_ = _mc._y + _mc._height - 15;
   lScroll.pageSize = _loc14_;
   if(_loc11_ == undefined)
   {
      lScroll.scroll = 0;
   }
   else
   {
      lScroll.setScrollPosition(_loc11_);
   }
};
myListener.OnGame_Achievement_SetLatestAchievement = function(_achievementData)
{
   if(selectedAchievement != null)
   {
      clearPage();
   }
   container_mc.defaultFd._visible = false;
   if(_achievementData == "" || _achievementData == "undefined" || _achievementData == undefined)
   {
      if(comboIndex == 1)
      {
         container_mc.defaultFd.htmlText = defaultText__0;
         container_mc.defaultFd._visible = true;
      }
      else if(comboIndex == 2)
      {
         container_mc.defaultFd.htmlText = defaultText__1;
         container_mc.defaultFd._visible = true;
      }
   }
   var _loc14_ = getPosY(TYPE_ACHIEVEMENT);
   lScroll.pageSize = 0;
   lScroll.scroll = 0;
   var _loc13_ = undefined;
   var _loc10_ = lib.util.ExtString.split(_achievementData,"\n");
   var _loc11_ = _loc10_.length;
   var _loc8_ = container_mc.listContainer.title_2;
   var _loc3_ = 0;
   while(_loc3_ < _loc11_)
   {
      var _loc4_ = lib.util.ExtString.split(_loc10_[_loc3_],"\t");
      var _loc9_ = pageData.length;
      var _loc7_ = _loc4_[0];
      var _loc5_ = "latestList_" + _loc7_;
      var _loc1_ = _loc8_.attachMovie("SmallListMc",_loc5_,_loc8_.getNextHighestDepth());
      _loc1_._x = 5 + _loc3_ % 3 * (_loc1_._width + 10);
      _loc1_._y = 35 + Math.floor(_loc3_ / 3) * (_loc1_._height + 10);
      _loc1_.achTitleFd.text = _loc4_[1];
      var _loc2_ = _loc4_[2];
      if(_date != "-1")
      {
         _loc2_ = "img://__" + _loc2_ + "_U";
      }
      else
      {
         _loc2_ = "img://__" + _loc2_ + "_R";
      }
      var _loc6_ = flash.display.BitmapData.loadBitmap(_loc2_);
      _loc1_.icon.attachBitmap(_loc6_,_loc1_.icon.getNextHighestDepth());
      _loc1_.icon._width = _loc1_.icon._height = 92;
      pageData.push(_loc5_);
      _loc3_ = _loc3_ + 1;
   }
   lScroll.pageSize = container_mc.listContainer._height;
   if(_loc13_ == undefined)
   {
      lScroll.scroll = 0;
   }
   else
   {
      lScroll.setScrollPosition(_loc13_);
   }
};
myListener.OnGame_Achievement_SetCompensation = function(_achievementData, _selectIndex)
{
   if(selectedAchievement != null)
   {
      clearPage();
   }
   container_mc.defaultFd._visible = false;
   if(_achievementData == "" || _achievementData == "undefined" || _achievementData == undefined)
   {
      if(comboIndex == 1)
      {
         container_mc.defaultFd.htmlText = defaultText__0;
         container_mc.defaultFd._visible = true;
      }
      else if(comboIndex == 2)
      {
         container_mc.defaultFd.htmlText = defaultText__1;
         container_mc.defaultFd._visible = true;
      }
   }
   var _loc14_ = getPosY(TYPE_ACHIEVEMENT);
   _selectIndex = Number(_selectIndex);
   if(_selectIndex != "undefined")
   {
      selectIndex = _selectIndex;
   }
   lScroll.pageSize = 0;
   lScroll.scroll = 0;
   var _loc9_ = undefined;
   var _loc10_ = lib.util.ExtString.split(_achievementData,"\n");
   var _loc11_ = _loc10_.length;
   var _loc7_ = container_mc.listContainer;
   var _loc2_ = 0;
   while(_loc2_ < _loc11_)
   {
      var _loc4_ = lib.util.ExtString.split(_loc10_[_loc2_],"\t");
      var _loc6_ = pageData.length;
      var _loc3_ = _loc4_[0];
      var _loc5_ = "compensation_" + _loc3_;
      var _loc1_ = _loc7_.attachMovie("MiddleListMc",_loc5_,_loc7_.getNextHighestDepth());
      _loc1_._aIndex = _loc6_;
      _loc1_._isOpen = false;
      _loc1_._idx = _loc3_;
      _loc1_._pDetailMc = null;
      _loc1_._bFirst = true;
      _loc1_._pHeight = LIST_MIDDLE_HEIGHT;
      _loc1_.overMc._visible = false;
      _loc1_._x = 5 + _loc2_ % 2 * (_loc1_._width + 10);
      _loc1_._y = 10 + Math.floor(_loc2_ / 2) * (_loc1_._height + 10);
      if(_loc3_ == _selectIndex)
      {
         _loc9_ = _loc1_._y;
      }
      _loc1_._type = TYPE_AHIEVEMENT;
      setCompensationInfo(_loc1_,_loc4_);
      pageData.push(_loc5_);
      _loc2_ = _loc2_ + 1;
   }
   var _loc13_ = _loc1_._y + _loc1_._height;
   lScroll.pageSize = _loc13_;
   if(_loc9_ == undefined)
   {
      lScroll.scroll = 0;
   }
   else
   {
      lScroll.setScrollPosition(_loc9_);
   }
};
myListener.OnGame_Achievement_MoreCompensationList = function(flag)
{
   if(selectedAchievement != null)
   {
      clearPage();
   }
   var _loc2_ = container_mc.listContainer;
   _loc2_.MoreListBtn.removeMovieClip();
   if(flag == -1)
   {
      return undefined;
   }
   var _loc4_ = pageData.length;
   var _loc1_ = _loc2_.attachMovie("MoreListBtn","MoreListBtn",_loc2_.getNextHighestDepth());
   _loc1_._x = 0;
   _loc1_._y = 20 + _loc2_._height;
   var _loc3_ = new lib.util.TxtBtn(_loc1_.moreMc);
   _loc3_.setRelease(ToGame_Achievement_MoreCompensation);
   lScroll.pageSize = _loc2_._height + 10;
   _loc1_.moreMc.txt.text = "$272018";
   _loc1_.moreMc.mc._x = 386 - _loc1_.moreMc.txt.textWidth / 2;
};
myListener.OnGame_Achievement_SetTitle = function(_index, _text)
{
   if(selectedAchievement != null)
   {
      clearPage();
   }
   lScroll.pageSize = 0;
   lScroll.scroll = 0;
   var _loc5_ = pageData.length;
   var _loc4_ = getPosY(TYPE_TITLE);
   var _loc3_ = container_mc.listContainer;
   var _loc2_ = "title_" + _index;
   var _loc1_ = _loc3_.attachMovie("titleMc",_loc2_,_loc3_.getNextHighestDepth());
   _loc1_.textFd.verticalAlign = "center";
   _loc1_.textFd.htmlText = _text;
   _loc1_._y = _loc4_;
   _loc1_._aIndex = _loc5_;
   _loc1_._type = TYPE_TITLE;
   pageData.push(_loc2_);
   lScroll.pageSize = _loc1_._y + _loc1_._height + 2;
};
myListener.OnGame_Achievement_SetGauge = function(_type, _gaugeData)
{
   if(selectedAchievement != null)
   {
      clearPage();
   }
   _type = Number(_type);
   var _loc11_ = getPosY(TYPE_GAUGE);
   lScroll.pageSize = 0;
   lScroll.scroll = 0;
   var _loc10_ = lib.util.ExtString.split(_gaugeData,"\n");
   var _loc12_ = _loc10_.length;
   var _loc9_ = col[_type];
   var _loc8_ = container_mc.listContainer;
   var _loc2_ = null;
   var _loc1_ = 0;
   while(_loc1_ < _loc12_)
   {
      var _loc7_ = pageData.length;
      var _loc3_ = lib.util.ExtString.split(_loc10_[_loc1_],"\t");
      var _loc6_ = _loc3_[GAUGE_INDEX];
      var _loc4_ = "gauge_" + _loc6_;
      _loc2_ = _loc8_.attachMovie("gaugeMc_" + _type,_loc4_,_loc8_.getNextHighestDepth());
      _loc2_._x = 40 + _loc1_ % _loc9_ * w[_type];
      _loc2_._y = _loc11_ + int(_loc1_ / _loc9_) * h[_type];
      _loc2_._aIndex = _loc7_;
      _loc2_._type = TYPE_GAUGE;
      setGaugeInfo(_loc2_,_loc3_[GAUGE_CURRENT],_loc3_[GAUGE_TOTAL],_loc3_[GAUGE_TEXT]);
      pageData.push(_loc4_);
      _loc1_ = _loc1_ + 1;
   }
   lScroll.pageSize = _loc2_._y + _loc2_._height + 2;
};
myListener.OnGame_Achievement_SetAbility = function(_abilityData)
{
   if(selectedAchievement != null)
   {
      clearPage();
   }
   var _loc11_ = getPosY(TYPE_ABILITY);
   lScroll.pageSize = 0;
   lScroll.scroll = 0;
   var _loc12_ = lib.util.ExtString.split(_abilityData,"\n");
   var _loc13_ = _loc12_.length;
   var _loc10_ = container_mc.listContainer;
   var _loc14_ = _loc10_.attachMovie("lineMc","lineMc",_loc10_.getNextHighestDepth());
   _loc14_._y = _loc11_;
   _loc14_._x = 332.5;
   var _loc2_ = 0;
   while(_loc2_ < _loc13_)
   {
      var _loc9_ = pageData.length;
      var _loc3_ = lib.util.ExtString.split(_loc12_[_loc2_],"\t");
      var _loc6_ = _loc3_[0];
      var _loc7_ = "ability_" + _loc6_;
      var _loc1_ = _loc10_.attachMovie("abilityMc",_loc7_,_loc10_.getNextHighestDepth());
      _loc1_._x = 19 + _loc2_ % 2 * 335;
      _loc1_._y = _loc11_ + int(_loc2_ / 2) * 45;
      _loc1_.textFd_2.text = lib.util.UIString.getUIString("$007029");
      _loc1_.textFd_2._visible = false;
      _loc1_._aIndex = _loc9_;
      _loc1_._type = TYPE_ABILITY;
      lib.manager.ToolTip.add(_loc1_,_loc6_ + "\t1",6);
      var _loc5_ = false;
      var _loc4_ = Number(_loc3_[2]);
      var _loc8_ = Number(_loc3_[3]);
      if(_loc8_)
      {
         _loc1_.textFd_2._visible = true;
      }
      if(_loc4_ == -1)
      {
         _loc5_ = true;
         _loc1_.textFd_1._width = 55;
         _loc4_ = lib.util.UIString.getUIString("$007022");
      }
      setAbilityInfo(_loc1_,_loc3_[1],_loc4_,_loc5_);
      pageData.push(_loc7_);
      _loc2_ = _loc2_ + 1;
   }
   _loc14_._height = _loc1_._y + _loc1_._height - _loc11_;
   lScroll.pageSize = _loc1_._y + _loc1_._height + 2;
};
var LIST_HEIGHT = 106;
var LIST_MIDDLE_HEIGHT = 78;
var LIST_GAP = 1;
var selectIndex = -1;
myListener.OnGame_Achievement_SelectAchievement = function(_index)
{
   var _loc3_ = "list_" + _index;
   var _loc1_ = 2;
   var _loc4_ = container_mc.listContainer;
   var _loc5_ = _loc4_[_loc3_]._y;
   if(_index < 6)
   {
      lScroll.scroll = 0;
   }
   else
   {
      lScroll.scroll = Number(_index) * Number(_loc1_);
   }
};
myListener.OnGame_Achievement_SetAchievement = function(_achievementData, _selectIndex)
{
   if(selectedAchievement != null)
   {
      clearPage();
   }
   container_mc.defaultFd._visible = false;
   if(_achievementData == "" || _achievementData == "undefined" || _achievementData == undefined)
   {
      if(comboIndex == 1)
      {
         container_mc.defaultFd.htmlText = defaultText__0;
         container_mc.defaultFd._visible = true;
      }
      else if(comboIndex == 2)
      {
         container_mc.defaultFd.htmlText = defaultText__1;
         container_mc.defaultFd._visible = true;
      }
   }
   var _loc10_ = getPosY(TYPE_ACHIEVEMENT);
   lScroll.pageSize = 0;
   lScroll.scroll = 0;
   var _loc8_ = undefined;
   var _loc9_ = lib.util.ExtString.split(_achievementData,"\n");
   var _loc11_ = _loc9_.length;
   var _loc7_ = container_mc.listContainer;
   var _loc2_ = 0;
   while(_loc2_ < _loc11_)
   {
      var _loc4_ = lib.util.ExtString.split(_loc9_[_loc2_],"\t");
      var _loc6_ = pageData.length;
      var _loc3_ = _loc4_[0];
      var _loc5_ = "list_" + _loc3_;
      var _loc1_ = _loc7_.attachMovie("listMc",_loc5_,_loc7_.getNextHighestDepth());
      _loc1_._aIndex = _loc6_;
      _loc1_._isOpen = false;
      _loc1_._idx = _loc3_;
      _loc1_._pDetailMc = null;
      _loc1_._bFirst = true;
      _loc1_._pHeight = LIST_HEIGHT;
      _loc1_.overMc._visible = false;
      _loc1_._y = _loc10_ + _loc2_ * (LIST_HEIGHT + LIST_GAP);
      if(_loc3_ == _selectIndex)
      {
         _loc8_ = _loc1_._y;
      }
      _loc1_._type = TYPE_AHIEVEMENT;
      setAchievementInfo(_loc1_,_loc4_);
      pageData.push(_loc5_);
      _loc2_ = _loc2_ + 1;
   }
   var _loc14_ = _loc1_._y + _loc1_._height;
   lScroll.pageSize = _loc14_;
   if(_loc8_ == undefined)
   {
      lScroll.scroll = 0;
   }
   else
   {
      lScroll.setScrollPosition(_loc8_);
   }
};
myListener.OnGame_Achievement_SetAchievementDesc = function(_index, _type, _descData)
{
   _type = Number(_type);
   var _loc1_ = container_mc.listContainer["list_" + _index];
   var _loc11_ = _loc1_.descFd._height;
   var _loc3_ = 0;
   if(_loc11_ > ACHIEVEMENT_DESC_HEIGHT)
   {
      _loc3_ = _loc11_ - ACHIEVEMENT_DESC_HEIGHT;
   }
   if(_type == 0)
   {
      var _loc4_ = _loc1_.attachMovie("checkMc","descCheck",_loc1_.getNextHighestDepth());
      var _loc8_ = lib.util.ExtString.split(_descData,"\t");
      var _loc12_ = Number(_loc8_[1]);
      _loc4_.textFd.htmlText = _loc8_[0];
      if(_loc12_)
      {
         _loc4_.textFd.textColor = 8447772;
      }
      _loc4_.textFd._width = _loc4_.textFd.textWidth + 5;
      _loc4_._x = 105;
      _loc4_._y = 80 + _loc3_;
   }
   else if(_type == 1)
   {
      var _loc2_ = _loc1_.attachMovie("gaugeMc_2","descGauge",_loc1_.getNextHighestDepth());
      _loc2_._x = 105;
      _loc2_._y = 63 + _loc3_;
      var _loc9_ = lib.util.ExtString.split(_descData,"\t");
      var _loc6_ = _loc9_[0];
      var _loc5_ = _loc9_[1];
      if(_loc6_ == -1)
      {
         _loc2_.maskMc._xscale = _loc5_;
         _loc2_.countFd.text = _loc5_ + "%";
         if(_loc5_ >= 100)
         {
            _loc2_.countFd.textColor = 8447772;
         }
      }
      else
      {
         var _loc10_ = _loc6_ != 0?_loc6_ / _loc5_ * 100:0;
         _loc2_.maskMc._xscale = _loc10_;
         _loc2_.countFd.text = _loc6_ + "/" + _loc5_;
         if(_loc10_ >= 100)
         {
            _loc2_.countFd.textColor = 8447772;
         }
      }
      _loc2_.titleFd._visible = false;
   }
   _loc1_.bg_normal._height = _loc1_.bg_normal._height + _loc3_;
   _loc1_.bg_complete._height = _loc1_.bg_complete._height + _loc3_;
   _loc1_.bg_disable._height = _loc1_.bg_disable._height + _loc3_;
   _loc1_.overMc._height = _loc1_.overMc._height + _loc3_;
   _loc1_._pHeight = LIST_HEIGHT + _loc3_;
   displayList(_loc1_._aIndex,_loc3_);
};
var focusOver = false;
var DETAIL_CHECK_LIST = 0;
var DETAIL_GAUGE = 1;
var DETAIL_REWARD = 2;
myListener.OnGame_Achievement_SetDetail = function(_index, _type, _detailData)
{
   _type = Number(_type);
   selectIndex = Number(_index);
   var _loc3_ = container_mc.listContainer["list_" + _index];
   var _loc8_ = [];
   var _loc10_ = [];
   _loc3_._isOpen = true;
   _loc3_.descCheck._visible = false;
   _loc3_.descGauge._visible = false;
   var _loc7_ = 0;
   var _loc19_ = 0;
   if(_loc3_._pDetailMc != null)
   {
      _loc7_ = _loc3_._pDetailMc._y + _loc3_._pDetailMc._height + 20;
      _loc19_ = _loc3_.detailMc._height;
   }
   var _loc15_ = lib.util.ExtString.split(_detailData,"\n");
   var _loc17_ = _loc15_.length;
   var _loc21_ = new Array();
   _loc3_.detailMc._y = 102;
   if(_type == DETAIL_REWARD)
   {
      var _loc14_ = 2;
      var _loc18_ = _loc3_.detailMc.attachMovie("rewardTitle","rewardTitle",_loc3_.detailMc.getNextHighestDepth());
      _loc18_._y = _loc7_;
      _loc7_ = _loc18_._y + _loc18_._height + 10;
   }
   var _loc4_ = null;
   var _loc1_ = null;
   _index = -1;
   var _loc2_ = null;
   var _loc5_ = 0;
   while(_loc5_ < _loc17_)
   {
      _loc2_ = lib.util.ExtString.split(_loc15_[_loc5_],"\t");
      if(_type == DETAIL_CHECK_LIST)
      {
         _index = _loc2_[0];
         var _loc13_ = Number(_loc2_[2]);
         _loc1_ = _loc3_.detailMc.attachMovie("checkMc","check_" + _index,_loc3_.detailMc.getNextHighestDepth());
         _loc1_.textFd.htmlText = _loc2_[1];
         if(_loc13_)
         {
            _loc1_.textFd.textColor = 8447772;
         }
         if(_loc4_ == null)
         {
            _loc1_._x = 8;
            _loc1_._y = _loc7_;
         }
         else if(_loc4_.textFd.textHeight > 242)
         {
            _loc1_._x = 0;
            _loc1_._y = _loc4_._y + _loc4_.textFd.textHeight + 17;
         }
         else if(_loc4_._x > 0)
         {
            _loc1_._x = 0;
            _loc1_._y = _loc4_._y + _loc4_.textFd.textHeight + 17;
         }
         else if(_loc1_.textFd.textHeight > 242)
         {
            _loc1_._x = 0;
            _loc1_._y = _loc4_._y + _loc4_.textFd.textHeight + 17;
         }
         else
         {
            _loc1_._x = 285;
            _loc1_._y = _loc4_._y;
         }
         _loc4_ = _loc1_;
      }
      else if(_type == DETAIL_GAUGE)
      {
         _loc1_ = _loc3_.detailMc.attachMovie("gaugeMc_2","detailGauge_" + _loc5_,_loc3_.detailMc.getNextHighestDepth());
         _loc1_._x = 9;
         _loc1_._y = _loc7_ + _loc5_ * 60;
         setGaugeInfo(_loc1_,_loc2_[1],_loc2_[2],_loc2_[0]);
      }
      else if(_type == DETAIL_REWARD)
      {
         var _loc11_ = Number(_loc2_[8]);
         if(_loc11_ == 2)
         {
            _loc8_.push(_loc2_);
         }
         else
         {
            _loc10_.push(_loc2_);
         }
      }
      _loc5_ = _loc5_ + 1;
   }
   if(_loc8_.length != 0)
   {
      var _loc20_ = _loc3_.detailMc.attachMovie("abilityTitleMc","abilityTitleMc",_loc3_.detailMc.getNextHighestDepth());
      _loc20_._y = _loc7_;
   }
   _loc5_ = 0;
   while(_loc5_ < _loc8_.length)
   {
      _loc2_ = _loc8_[_loc5_];
      _index = _loc2_[0];
      _loc1_ = _loc3_.detailMc.attachMovie("abilityMc","abilityMc_" + _index,_loc3_.detailMc.getNextHighestDepth());
      _loc1_.textFd_0._width = 330;
      _loc1_.textFd_1._width = 55;
      _loc1_.textFd_1._x = 330;
      _loc1_.textFd_2._visible = false;
      _loc1_.textFd_0._height = _loc1_.textFd_1._height = 22;
      var _loc12_ = Number(_loc2_[4]) != -1?false:true;
      setAbilityInfo(_loc1_,_loc2_[1],_loc2_[3],_loc12_);
      _loc1_._x = 105;
      _loc1_._y = _loc7_;
      _loc7_ = _loc1_._y + 23;
      _loc5_ = _loc5_ + 1;
   }
   if(_loc8_.length != 0)
   {
      _loc7_ = _loc7_ + 20;
   }
   _loc5_ = 0;
   while(_loc5_ < _loc10_.length)
   {
      _loc2_ = _loc10_[_loc5_];
      _index = _loc2_[0];
      _loc1_ = _loc3_.detailMc.attachMovie("Slot2_linkEx","rewardSlot_" + _index,_loc3_.detailMc.getNextHighestDepth());
      _loc1_._x = 275 * (_loc5_ % _loc14_);
      _loc1_._y = _loc7_ + int(_loc5_ / _loc14_) * 70;
      setSlotInfo(_loc1_,_loc2_);
      _loc5_ = _loc5_ + 1;
   }
   _loc3_._pDetailMc = _loc1_;
   var _loc16_ = _loc3_.detailMc._height - _loc19_;
   if(_loc3_._bFirst)
   {
      _loc16_ = _loc16_ + 20;
      _loc3_._bFirst = false;
   }
   _loc3_.bg_normal._height = _loc3_.bg_normal._height + _loc16_;
   _loc3_.bg_complete._height = _loc3_.bg_complete._height + _loc16_;
   _loc3_.bg_disable._height = _loc3_.bg_disable._height + _loc16_;
   _loc3_.overMc._height = _loc3_.overMc._height + _loc16_;
   _loc3_.overMc._visible = focusOver;
   _loc3_.openBtn.gotoAndStop(2);
   displayList(_loc3_._aIndex,_loc16_);
};
var selectedAchievement = null;
var ACHIEVEMENT_INDEX = 0;
var ACHIEVEMENT_NAME = 1;
var ACHIEVEMENT_ICON = 2;
var ACHIEVEMENT_GRADE = 3;
var ACHIEVEMENT_REWARD = 4;
var ACHIEVEMENT_IS_DETAIL = 5;
var ACHIEVEMENT_TITLE = 6;
var ACHIEVEMENT_DATE = 7;
var ACHIEVEMENT_COMPARE_NAME = 8;
var ACHIEVEMENT_COMPARE_DATE = 9;
var ACHIEVEMENT_DESC = 10;
var ACHIEVEMENT_SCORE = 11;
var ACHIEVEMENT_DESC_HEIGHT = 39;
var scoreColor = [16777215,5164336,44783,16763904,12810881];
var categoryArray = new Array();
var mainCategoryArray = new Array();
var MAININDEX = 0;
var INDEX = 1;
var TEXT = 2;
var NORMALIMG = 3;
var OVERIMG = 4;
var PRESSIMG = 5;
var CURRENT = 6;
var TOTAL = 7;
var HASSUB = 8;
var SUBID = 9;
var ISOPEN = 10;
var selectedCategory = -1;
myListener.OnGame_Achievement_SetCategory = function(_categoryData)
{
   clearCategory();
   var _loc4_ = lib.util.ExtString.split(_categoryData,"\n");
   var _loc5_ = _loc4_.length;
   if(_loc4_[_loc5_ - 1] == "undefined" || _loc4_[_loc5_ - 1] == "" || _loc4_[_loc5_ - 1] == "0")
   {
      _loc4_.splice(_loc5_ - 1,1);
      _loc5_ = _loc4_.length;
   }
   var _loc3_ = 0;
   while(_loc3_ < _loc5_)
   {
      var _loc1_ = lib.util.ExtString.split(_loc4_[_loc3_],"\t");
      var _loc2_ = Number(_loc1_[MAININDEX]);
      _loc1_[HASSUB] = false;
      _loc1_[SUBID] = [];
      _loc1_[ISOPEN] = false;
      categoryArray[_loc1_[INDEX]] = _loc1_;
      if(_loc2_ != -1)
      {
         categoryArray[_loc2_][HASSUB] = true;
         categoryArray[_loc2_][SUBID].push(_loc1_[INDEX]);
      }
      else
      {
         mainCategoryArray.push(_loc1_[INDEX]);
      }
      _loc3_ = _loc3_ + 1;
   }
   createCategory();
};
myListener.OnGame_Achievement_SelectCategory = function(_categoryIndex)
{
   clearPage();
   var _loc5_ = container_mc.categoryContainer;
   var _loc2_ = categoryArray[_categoryIndex];
   var _loc3_ = Number(_loc2_[MAININDEX]);
   if(_loc3_ == -1)
   {
      _loc2_[ISOPEN] = true;
   }
   else
   {
      categoryArray[_loc3_][ISOPEN] = true;
   }
   var _loc1_ = getSelectedCategory();
   _loc1_.skinContainer.overMc._visible = false;
   _loc1_.skinContainer.normalMc._visible = true;
   _loc1_.skinContainer.pressMc._visible = false;
   selectedCategory = Number(_categoryIndex);
   selectDisplayCategory();
};
var img = ["normal","over","press"];
ToGame_Achievement_Init();
