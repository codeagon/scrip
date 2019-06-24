function setStateSaveBtn(targetBtn, btnState)
{
   btnState = Number(btnState);
   targetBtn.btnState = btnState;
   var _loc2_ = btnState != 0?1:4;
   if(btnState == 2)
   {
      _loc2_ = 5;
      pressedSaveBtn = targetBtn;
   }
   targetBtn.gotoAndStop(_loc2_);
}
function setMouseEventSaveBtn(targetBtn)
{
   setRollOverSaveBtn(targetBtn);
   setRollOutSaveBtn(targetBtn);
   setPressSaveBtn(targetBtn);
   setReleaseSaveBtn(targetBtn);
   setReleaseOutsideSaveBtn(targetBtn);
}
function setRollOverSaveBtn(targetBtn)
{
   targetBtn.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
}
function setRollOutSaveBtn(targetBtn)
{
   targetBtn.onRollOut = function()
   {
      var _loc2_ = this.btnState != 1?4:1;
      _loc2_ = pressedSaveBtn != this?_loc2_:5;
      this.gotoAndStop(_loc2_);
   };
}
function setPressSaveBtn(targetBtn)
{
   targetBtn.onPress = function()
   {
      this.gotoAndStop(3);
   };
}
function setReleaseSaveBtn(targetBtn)
{
   targetBtn.onRelease = function()
   {
      if(pressedSaveBtn == this)
      {
         return undefined;
      }
      lib.manager.UISound.play(UI.btnSound);
      pressedSaveBtn = this;
      ToGame_SkillWindow_ChangeCrestSaveBtn(this.id);
   };
}
function setReleaseOutsideSaveBtn(targetBtn)
{
   targetBtn.onReleaseOutside = function()
   {
      var _loc2_ = this.btnState != 1?1:5;
      _loc2_ = pressedSaveBtn != this?_loc2_:3;
      this.gotoAndStop(_loc2_);
   };
}
function ToGame_SkillWindow_Path()
{
   fscommand("ToGame_SkillWindow_Path");
}
function ToGame_SkillWindow_Reset()
{
   fscommand("ToGame_SkillWindow_Reset");
}
function ToGame_SkillWindow_Recommend()
{
   fscommand("ToGame_SkillWindow_Recommend");
}
function ToGame_SkillWindow_SelectTab(index, noRequestEvent)
{
   if(noRequestEvent == 0 && curTab != index)
   {
      curTab = index;
      getURL("FSCommand:ToGame_SkillWindow_SelectTab",index);
      lib.Debuger.trace("ToGame_SkillWindow_SelectTab : " + index);
   }
}
function clearTag(index)
{
   if(index != undefined)
   {
      var _loc3_ = container_mc["tabTag_" + index];
      if(_loc3_ != undefined)
      {
         _loc3_.removeMovieClip();
      }
      return undefined;
   }
   var _loc1_ = 0;
   while(_loc1_ < tabLength)
   {
      var _loc2_ = container_mc["tabTag_" + _loc1_];
      if(_loc2_ != undefined)
      {
         _loc2_.removeMovieClip();
      }
      _loc1_ = _loc1_ + 1;
   }
}
function createTag(index, tagNum)
{
   lib.Debuger.trace("index : " + index);
   var _loc3_ = container_mc.tabBtn;
   lib.Debuger.trace("container : " + _loc3_);
   var _loc1_ = container_mc.attachMovie("tagBox","tabTag_" + index,container_mc.getNextHighestDepth());
   _loc1_._xscale = _loc1_._yscale = 80;
   _loc1_.txt.text = tagNum;
   lib.Debuger.trace("tag : " + _loc1_);
   _loc1_._x = container_mc.tabBtn._x + TAB_WIDTH * (index + 1) - _loc1_._width;
   lib.Debuger.trace("tab._x : " + _loc1_._x);
   _loc1_.hitTestDisable = true;
   _loc1_._y = container_mc.tabBtn._y - 7;
}
function setViewBtn()
{
   var _loc2_ = Number(!curViewMode);
   var _loc3_ = container_mc["viewBtn_" + _loc2_];
   var _loc1_ = container_mc["viewBtn_" + curViewMode];
   _loc3_.gotoAndStop(1);
   _loc1_.gotoAndStop(3);
}
function setMouseEvent(btn)
{
   setRollOver(btn);
   setRollOut(btn);
   setPress(btn);
   setRelease(btn);
   setReleaseOutside(btn);
}
function setRollOver(btn)
{
   btn.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
}
function setRollOut(btn)
{
   btn.onRollOut = function()
   {
      var _loc2_ = this.id != curViewMode?1:3;
      this.gotoAndStop(_loc2_);
   };
}
function setPress(btn)
{
   btn.onPress = function()
   {
      this.gotoAndStop(3);
   };
}
function setRelease(btn)
{
   btn.onRelease = function()
   {
      if(curViewMode == this.id)
      {
         return undefined;
      }
      lib.manager.UISound.play(UI.btnSound);
      curViewMode = this.id;
      clearSkillContainer();
      ToGame_SkillWindow_ChangeViewMode(this.id);
      setViewMode();
      setViewBtn();
   };
}
function ToGame_SkillWindow_ChangeCrestSaveBtn(index)
{
   lib.Debuger.trace("ToGame_SkillWindow_ChangeCrestSaveBtn : " + index);
   getURL("FSCommand:ToGame_SkillWindow_ChangeCrestSaveBtn",index);
}
function ToGame_SkillWindow_ChangeViewMode(index)
{
   lib.Debuger.trace("ToGame_SkillWindow_ChangeViewMode : " + index);
   getURL("FSCommand:ToGame_SkillWindow_ChangeViewMode",index);
}
function setReleaseOutside(btn)
{
   btn.onReleaseOutside = function()
   {
      var _loc2_ = this.id != curViewMode?1:3;
      this.gotoAndStop(_loc2_);
   };
}
function setViewMode()
{
   container_mc.noticeFd._visible = !curViewMode;
   container_mc.noticeIcon._visible = !curViewMode;
   container_mc.skillListMast._visible = !curViewMode;
   container_mc.skillListContainer._visible = !curViewMode;
   container_mc.skillListScroll._visible = !curViewMode;
   container_mc.titleFd_0._visible = !curViewMode;
   container_mc.titleFd_1._visible = !curViewMode;
   container_mc.titleFd_2._visible = !curViewMode;
   container_mc.defaultFd._visible = false;
   container_mc.pathSkillMc._visible = false;
   container_mc.skillInfoMc._visible = false;
   container_mc.container_mode1._visible = curViewMode;
}
function setCrest(info)
{
   bChange = false;
   var _loc9_ = curViewMode != 0?container_mc.container_mode1.skillListContainer:container_mc.skillListContainer;
   var _loc8_ = info.shift();
   var _loc5_ = _loc9_[slotPrefix + _loc8_];
   if(_loc5_ == undefined)
   {
      _loc5_ = createSlot(_loc9_,_loc8_);
   }
   else
   {
      clearCrest(_loc5_);
   }
   var _loc7_ = info.shift();
   if(_loc7_ != "" && _loc7_ != undefined && _loc7_ != "undefined" && _loc7_ != null)
   {
      _loc5_.descFd.setText(_loc7_);
   }
   else
   {
      var _loc1_ = 0;
      while(_loc1_ < info.length)
      {
         var _loc4_ = int(_loc1_ / CREST_INFO_COUNT);
         var _loc2_ = [];
         j = 0;
         while(j < CREST_INFO_COUNT)
         {
            _loc2_[j] = info[_loc1_ + j];
            j++;
         }
         setCrestSlot(_loc5_,_loc4_,_loc2_);
         _loc1_ = _loc1_ + CREST_INFO_COUNT;
      }
   }
   var _loc6_ = _loc5_.disableMc;
   if(_loc5_.disable)
   {
      if(_loc6_ == undefined)
      {
         _loc6_ = _loc5_.attachMovie("disableMc_" + curViewMode,"disableMc",_loc5_.getNextHighestDepth());
      }
      _loc6_.hitTestDisable = true;
      _loc6_._x = 4;
      _loc6_._y = 4;
      _loc6_.disableMc._x = 0;
      _loc6_.disableMc._width = curViewMode != 0?258:181;
      _loc6_._visible = true;
      if(_loc5_.skillState > 1)
      {
         _loc6_.disableMc._x = 39;
         _loc6_.disableMc._width = curViewMode != 0?219:142;
      }
   }
   else if(_loc6_ != undefined)
   {
      _loc6_.removeMovieClip();
   }
}
function setEventOnCrestSlot(target)
{
   target.onRollOver = function()
   {
      target._parent.overMc._visible = true;
   };
   target.onRollOut = function()
   {
      target._parent.overMc._visible = false;
   };
   target.onPress = function()
   {
   };
   target.onRelease = function()
   {
      lib.manager.UISound.play(UI.btnSound);
      var _loc2_ = this._parent.crestState;
      if(_loc2_ == CREST_STATE_INACTIVE)
      {
         this._parent.crestNewEffect.gotoAndPlay(2);
      }
      ToGame_SkillWindow_ChangeCrestState(this._parent);
   };
   target.onReleaseOutside = function()
   {
      target._parent.overMc._visible = false;
   };
}
function ToGame_SkillWindow_ChangeCrestState(targetCrest)
{
   var _loc3_ = targetCrest.slotIndex;
   var _loc6_ = targetCrest.crestIndex;
   var _loc4_ = targetCrest.crestId;
   var _loc7_ = targetCrest.crestRealId;
   var _loc5_ = targetCrest.crestState;
   var _loc2_ = _loc3_ + "\t" + _loc6_ + "\t" + _loc4_ + "\t" + _loc7_ + "\t" + _loc5_;
   getURL("FSCommand:ToGame_SkillWindow_ChangeCrestState",_loc2_);
   lib.Debuger.trace("ToGame_SkillWindow_ChangeCrestState : " + _loc2_);
}
function removeEventOnCrestSlot(target)
{
   target.onPress = function()
   {
   };
   target.onRelease = function()
   {
   };
   target.onRollOver = function()
   {
   };
   target.onRollOut = function()
   {
   };
   target.onReleaseOutside = function()
   {
   };
}
function setCrestSlot(parentSlot, crestIndex, crestData)
{
   var _loc1_ = parentSlot["crest__" + crestIndex];
   if(_loc1_ == undefined)
   {
      _loc1_ = createCrestSlot(parentSlot,crestIndex);
   }
   clearCrestSlot(_loc1_);
   var _loc7_ = parentSlot.slotIndex;
   var _loc8_ = crestData[0];
   var _loc6_ = crestData[1];
   var _loc10_ = crestData[2];
   var _loc12_ = crestData[3];
   var _loc4_ = Number(crestData[4]);
   var _loc3_ = Number(crestData[5]);
   var _loc5_ = Number(crestData[6]);
   _loc1_._visible = true;
   _loc1_.slotIndex = _loc7_;
   _loc1_.crestIndex = crestIndex;
   _loc1_.crestId = _loc8_;
   _loc1_.crestRealId = _loc6_;
   _loc1_.crestState = _loc4_;
   _loc1_.point = _loc5_;
   _loc1_.grade = _loc3_;
   _loc1_.TEX = _loc10_;
   _loc1_.disableTEX = _loc12_;
   lib.manager.ToolTip.add(_loc1_.slotHit,_loc6_,8);
   _loc1_.overMc._visible = false;
   var _loc14_ = _loc3_ <= 0?false:true;
   _loc1_.gradeMc._visible = _loc14_;
   _loc1_.gradeMc.gotoAndStop(_loc3_);
   _loc1_.pointFd.text = _loc5_;
   if(_loc4_ == CREST_STATE_INACTIVE)
   {
      var _loc9_ = crestArray.push(_loc1_) - 1;
      _loc1_.arrayIndex = _loc9_;
   }
   else
   {
      setStateOnCrestSlot(_loc1_);
   }
}
function setStateOnCrestSlot(target)
{
   var _loc2_ = target.crestState;
   var _loc10_ = target.grade;
   var _loc3_ = _loc2_ != CREST_STATE_ACTIVE?false:true;
   var _loc6_ = _loc2_ != CREST_STATE_LOCK?false:true;
   var _loc9_ = _loc2_ != CREST_STATE_ACTIVE?false:true;
   var _loc7_ = _loc2_ != CREST_STATE_INACTIVE?false:true;
   var _loc4_ = _loc10_ <= 0?1:2;
   var _loc8_ = !(_loc2_ == CREST_STATE_INACTIVE || _loc2_ == CREST_STATE_ACTIVE)?target.disableTEX:target.TEX;
   var _loc5_ = !(_loc2_ == CREST_STATE_INACTIVE || _loc2_ == CREST_STATE_ACTIVE)?"0x707070":"0xC9C9C9";
   target.lockMc._visible = _loc6_;
   target.lockBg._visible = !_loc3_;
   target.lineMc._visible = _loc9_;
   target.bg._visible = _loc3_;
   target.inactiveMc._visible = _loc7_;
   target.bg.gotoAndStop(_loc4_);
   target.lockBg.gotoAndStop(_loc4_);
   target.pointFd.textColor = _loc5_;
   lib.util.DrawBitmap.draw(target.img,_loc8_,24,24);
   if(_loc2_ == CREST_STATE_INACTIVE || _loc2_ == CREST_STATE_ACTIVE)
   {
      setEventOnCrestSlot(target.slotHit);
   }
   else
   {
      removeEventOnCrestSlot(target.slotHit);
   }
}
function changeCrestState(target)
{
   var _loc2_ = target.point;
   var _loc1_ = totalPoint - currentPoint;
   var _loc4_ = target.crestState;
   target.crestState = _loc2_ > _loc1_?CREST_STATE_DISABLE:CREST_STATE_INACTIVE;
   if(bChange == false)
   {
      bChange = _loc2_ > _loc1_?false:true;
   }
}
function createCrestSlot(parentSlot, crestIndex)
{
   var _loc1_ = parentSlot.attachMovie("crestSlot","crest__" + crestIndex,parentSlot.getNextHighestDepth());
   var _loc2_ = UI["CREST_SLOT_START_MODE_" + curViewMode];
   _loc1_._x = _loc2_ + CREST_SLOT_WIDTH * crestIndex;
   _loc1_._y = 6;
   setEventOnCrestSlot(_loc1_.slotHit);
   return _loc1_;
}
function setSkill(info)
{
   var _loc9_ = curViewMode != 0?container_mc.container_mode1.skillListContainer:container_mc.skillListContainer;
   var _loc3_ = info[SLOT_INDEX];
   var _loc1_ = _loc9_[slotPrefix + _loc3_];
   if(_loc1_ == undefined)
   {
      _loc1_ = createSlot(_loc9_,_loc3_);
   }
   else
   {
      clearSkill(_loc1_);
   }
   var _loc7_ = info[SKILL_ID];
   var _loc8_ = info[SKILL_NAME];
   var _loc6_ = info[SKILL_IMG];
   var _loc14_ = flash.display.BitmapData.loadBitmap(_loc6_);
   var _loc11_ = Number(info[SKILL_DISABLE]);
   var _loc5_ = Number(info[SKILL_STATE]);
   var _loc4_ = Number(info[SKILL_NUM]);
   var _loc15_ = info[SKILL_REMAIN];
   var _loc12_ = info[SKILL_TOTAL];
   var _loc10_ = Boolean(Number(info[SKILL_AWAKEN]));
   myListener.OnGame_SkillWindow_CoolTime(_loc3_,_loc15_,_loc12_);
   var _loc17_ = _loc1_.slotHit._x;
   var _loc16_ = _loc1_.slotHit._y;
   _loc1_.slotIndex = _loc3_;
   _loc1_.skillId = _loc7_;
   var _loc13_ = !_loc10_?_loc8_:"<font color=\'#deb200\'>" + _loc8_ + "</font>";
   _loc1_.nameFd.htmlText = _loc13_;
   _loc1_.disable = _loc11_;
   _loc1_.skillState = _loc5_;
   _loc1_.TEX = _loc6_;
   _loc1_.awaken = _loc10_;
   lib.display.DrawBitmapData.draw(_loc1_.img,_loc14_,0,0,0,0,38,38,0.59);
   lib.manager.ToolTip.add(_loc1_.slotHit,_loc7_,3);
   if(_loc5_ == 2)
   {
      _loc1_.nameFd.htmlText = _loc1_.nameFd.htmlText + SKILLSTATE_0;
   }
   else if(_loc5_ == 3)
   {
      _loc1_.nameFd.htmlText = _loc1_.nameFd.htmlText + SKILLSTATE_1;
   }
   if(_loc4_ != undefined && _loc4_ != "" && _loc4_ != "-1")
   {
      _loc1_.numFd.text = _loc4_;
   }
}
function setSkillState(slotIndex)
{
   var _loc4_ = curViewMode != 0?container_mc.container_mode1.skillListContainer:container_mc.skillListContainer;
   var _loc2_ = _loc4_[slotPrefix + slotIndex];
   var _loc1_ = _loc2_.skillState;
   var _loc7_ = _loc2_.awaken;
   _loc1_ = 1 >= _loc1_?_loc1_:2;
   var _loc8_ = !_loc7_?_loc1_:String(Number(_loc1_ + 50));
   var _loc3_ = _loc4_["stateMc_" + slotIndex];
   if(_loc3_ != undefined)
   {
      _loc3_.removeMovieClip();
   }
   if(_loc1_ > 0)
   {
      _loc3_ = _loc4_.attachMovie("slotStateMc_" + _loc8_,"stateMc_" + slotIndex,_loc4_.getNextHighestDepth());
      _loc3_._x = _loc1_ <= 1?_loc2_._x + 1.5:_loc2_._x + 1;
      _loc3_._y = _loc1_ <= 1?_loc2_._y + 1:_loc2_._y + 1;
      _loc3_.hitTestDisable = true;
   }
   if(_loc1_ == 1 && _loc7_)
   {
      var _loc6_ = _loc4_.attachMovie("awakenEffect","awakenEffect_" + slotIndex,_loc4_.getNextHighestDepth());
      _loc6_._x = _loc2_._x;
      _loc6_._y = _loc2_._y;
   }
}
function clearSkill(target)
{
   var _loc5_ = target.slotIndex;
   target.clear();
   delete target.skillId;
   target.nameFd.htmlText = "";
   target.numFd.text = "";
   var _loc2_ = target.effectMc.coolTimeMc;
   if(_loc2_ != undefined)
   {
      coolTimeManager.removeCoolTimeInstance(_loc2_);
      _loc2_.removeMovieClip();
   }
   var _loc4_ = target.effectMc.activeMc;
   if(_loc4_ != undefined)
   {
      _loc4_.removeMovieClip();
   }
   var _loc3_ = target._parent["stateMc_" + _loc5_];
   if(_loc3_ != undefined)
   {
      _loc3_.removeMovieClip();
   }
}
function clearCrest(target)
{
   target.descFd.htmlText = "";
   var _loc1_ = 0;
   while(_loc1_ < MAX_CREST)
   {
      var _loc2_ = target["crest__" + _loc1_];
      if(_loc2_ != undefined)
      {
         clearCrestSlot(_loc2_);
      }
      _loc1_ = _loc1_ + 1;
   }
}
function changeCrestArrayIndex()
{
   var _loc3_ = crestArray.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc2_ = crestArray[_loc1_];
      _loc2_.arrayIndex = _loc1_;
      _loc1_ = _loc1_ + 1;
   }
}
function clearCrestSlot(slot)
{
   lib.manager.ToolTip.remove(slot.slotHit);
   if(slot.arrayIndex != undefined)
   {
      var _loc2_ = slot.arrayIndex;
      crestArray.splice(_loc2_,1);
      changeCrestArrayIndex();
   }
   slot.pointFd.text = "";
   slot.gradeMc._visible = false;
   slot.lockMc._visible = false;
   slot.lockBg._visible = false;
   slot.inactiveMc._visible = false;
   slot.bg._visible = true;
   slot._visible = false;
   delete slot.slotIndex;
   delete slot.crestIndex;
   delete slot.crestId;
   delete slot.crestRealId;
   delete slot.point;
   delete slot.grade;
   delete slot.TEX;
   delete slot.disableTEX;
   delete slot.arrayIndex;
}
function createSlot(container, slotIndex)
{
   var _loc7_ = "slot_mode" + curViewMode;
   var _loc8_ = curViewMode != 0?slotIndex % 3 * SLOT_WIDTH:0;
   var _loc6_ = curViewMode != 0?int(slotIndex / 3) * SLOT_HEIGTH_MODE_1:slotIndex * SLOT_HEIGHT_MODE_0;
   var _loc3_ = container.attachMovie(_loc7_,slotPrefix + slotIndex,container.getNextHighestDepth());
   _loc3_._x = _loc8_;
   _loc3_._y = _loc6_;
   _loc3_.overMc._visible = false;
   _loc3_.pressMc._visible = false;
   _loc3_.disableMc._visible = false;
   _loc3_.numFd.text = "";
   _loc3_.slotHit.slotName = "SKILLSLOT";
   _loc3_.slotHit.trackAsMenu = true;
   _loc3_.descFd.verticalAutoSize = "center";
   _loc3_.nameFd.verticalAutoSize = "center";
   _loc3_.slotHit.onRollOver = function()
   {
      if(this._parent.disable && this._parent.skillState != 2)
      {
         return undefined;
      }
      this._parent.overMc._visible = true;
   };
   _loc3_.slotHit.onRollOut = function()
   {
      if(this._parent.disable && this._parent.skillState != 2)
      {
         return undefined;
      }
      this._parent.overMc._visible = false;
   };
   _loc3_.slotHit.onReleaseOutside = function()
   {
      this._parent.overMc._visible = false;
      if(releasedSkillSlot == this)
      {
         return undefined;
      }
      this._parent.pressMc._visible = false;
   };
   _loc3_.slotHit.onPress = function()
   {
      if(this._parent.disable && this._parent.skillState != 2)
      {
         return undefined;
      }
      pressedSkillSlot = this;
      this._parent.pressMc._visible = true;
   };
   _loc3_.slotHit.onRelease = function()
   {
      if(this._parent.disable && this._parent.skillState != 2)
      {
         return undefined;
      }
      lib.manager.UISound.play(UI.btnSound);
      releasedSkillSlot._parent.pressMc._visible = false;
      releasedSkillSlot = this;
      if(pressedSkillSlot == this)
      {
         ToGame_SkillWindow_SelectSkill(this._parent.slotIndex);
         pressedSkillSlot = null;
      }
   };
   _loc3_.slotHit.onDragOut = function()
   {
      if(this == pressedSkillSlot)
      {
         var _loc3_ = this._parent.TEX;
         if(_loc3_ != undefined)
         {
            _global.StartIconDrag(this._parent,_loc3_);
         }
      }
      if(this != releasedSkillSlot)
      {
         this._parent.pressMc._visible = false;
      }
      this._parent.overMc._visible = false;
   };
   _loc3_.slotHit.GetName = function()
   {
      return this._parent._name;
   };
   return _loc3_;
}
function ToGame_SkillWindow_SelectSkill(id)
{
   getURL("FSCommand:ToGame_SkillWindow_SelectSkill",id);
}
function clearSkillContainer()
{
   crestArray = [];
   pressedSkillSlot = null;
   releasedSkillSlot = null;
   var _loc1_ = curViewMode != 0?container_mc.container_mode1.skillListContainer:container_mc.skillListContainer;
   for(var _loc2_ in _loc1_)
   {
      if(typeof _loc1_[_loc2_] == "movieclip")
      {
         _loc1_[_loc2_].removeMovieClip();
      }
   }
   if(curViewMode == 0)
   {
      clearPathSkill(true);
      container_mc.skillInfoMc.btn._visible = false;
      container_mc.skillInfoMc.infoScroll._visible = false;
      container_mc.skillInfoMc.textFdContainer.infoFd_0.htmlText = "";
      container_mc.skillInfoMc.textFdContainer.infoFd_1.htmlText = "";
      container_mc.skillInfoMc.textFdContainer.infoFd_2.htmlText = "";
      container_mc.skillInfoMc.textFdContainer.infoFd_3.htmlText = "";
      container_mc.skillInfoMc.nameFd.htmlText = "";
      container_mc.skillInfoMc.activeFd.htmlText = "";
      container_mc.skillInfoMc.skillIcon.clear();
   }
}
function setSkillInfo(str)
{
   var _loc15_ = lib.util.ExtString.findTag(str,"section");
   var _loc5_ = container_mc.skillInfoMc.textFdContainer;
   var _loc6_ = 0;
   var _loc7_ = _loc5_.infoFd_0._y;
   var _loc16_ = str.indexOf("<");
   var _loc14_ = str.indexOf(">") + 1;
   var _loc17_ = str.length;
   var _loc18_ = str.substring(_loc16_,_loc14_);
   var _loc10_ = str.substring(_loc14_,_loc17_);
   _loc5_._parent.infoScroll._visible = false;
   infoScroll.pageSize = 0;
   var _loc8_ = 0;
   var _loc3_ = 0;
   var _loc9_ = _loc15_.length;
   var _loc4_ = 0;
   while(_loc4_ < 4)
   {
      var _loc2_ = _loc5_["infoFd_" + _loc4_];
      _loc2_._width = 315;
      if(_loc4_ >= _loc9_)
      {
         _loc5_["infoFd_" + _loc4_]._visible = false;
      }
      _loc4_ = _loc4_ + 1;
   }
   _loc4_ = 0;
   while(_loc4_ < _loc9_)
   {
      _loc2_ = _loc5_["infoFd_" + _loc4_];
      _loc2_._visible = true;
      _loc2_._y = _loc7_;
      _loc2_.styleSheet = _global.toolTipStyle;
      _loc3_ = _loc10_.indexOf("<section",_loc8_ + 2);
      if(_loc3_ == undefined || _loc3_ == -1)
      {
         _loc3_ = _loc10_.length;
      }
      var _loc11_ = _loc10_.slice(_loc8_,_loc3_);
      _loc2_.htmlText = _loc11_;
      var _loc12_ = _loc2_.textHeight + 5;
      _loc2_._height = _loc12_;
      _loc7_ = _loc2_._y + _loc12_ + 10;
      _loc6_ = _loc6_ + _loc12_ + 10;
      _loc8_ = _loc3_;
      _loc4_ = _loc4_ + 1;
   }
   if(_loc6_ > 175)
   {
      _loc7_ = _loc5_.infoFd_0._y;
      _loc6_ = 0;
      _loc4_ = 0;
      while(_loc4_ < _loc9_)
      {
         _loc2_ = _loc5_["infoFd_" + _loc4_];
         _loc2_._width = 289;
         _loc2_._y = _loc7_;
         _loc2_._height = _loc2_.textHeight + 5;
         _loc12_ = _loc2_.textHeight + 5;
         _loc7_ = _loc2_._y + _loc2_._height + 15;
         _loc6_ = _loc6_ + _loc2_.textHeight + 5 + 10;
         _loc4_ = _loc4_ + 1;
      }
      infoScroll.pageSize = _loc6_ + 20;
      _loc5_._parent.infoScroll._visible = true;
   }
}
function setPathSkill(pathSkillId, pathSkillName, pathSkillImg, pathSkillCheck, pathSkillTime)
{
   var _loc1_ = container_mc.pathSkillMc;
   pathSkillCheck = Number(pathSkillCheck);
   _loc1_.guideFd._visible = false;
   _loc1_.timeMc._visible = true;
   lib.manager.ToolTip.add(_loc1_.SkillWindow__pathSlot.slotHit,pathSkillId,3);
   _loc1_.nameFd.htmlText = pathSkillName;
   _loc1_.checkBox.checked = pathSkillCheck;
   _loc1_.checkBox._visible = true;
   var _loc3_ = flash.display.BitmapData.loadBitmap(pathSkillImg);
   lib.display.DrawBitmapData.draw(_loc1_.SkillWindow__pathSlot.img,_loc3_,0,0,0,0,37,37,0.57);
   _loc1_.SkillWindow__pathSlot.TEX = pathSkillImg;
   _loc1_.timeMc.textFd.text = pathSkillTime + secondStr;
   _loc1_.timeMc.textFd.type = "input";
   _loc1_.timeMc.textFd.selectable = true;
   _loc1_.timeMc.timeText = pathSkillTime;
}
function clearPathSkill(bDeleteSkillIcon)
{
   var _loc1_ = container_mc.pathSkillMc;
   if(bDeleteSkillIcon)
   {
      delete _loc1_.skillIcon.TEX;
      _loc1_.skillIcon.clear();
   }
   _loc1_.SkillWindow__pathSlot.img.clear();
   lib.manager.ToolTip.remove(_loc1_.SkillWindow__pathSlot.slotHit);
   delete _loc1_.SkillWindow__pathSlot.TEX;
   _loc1_.nameFd.htmlText = "";
   _loc1_.checkBox._visible = false;
   _loc1_.checkBox.checked = false;
   _loc1_.timeMc._visible = false;
   _loc1_.timeMc.textFd.text = "";
   _loc1_.guideFd._visible = true;
}
function ToGame_SkillWindow_ChangePathSkillCheck(changed)
{
   changed = Number(changed);
   getURL("FSCommand:ToGame_SkillWindow_ChangePathSkillCheck",changed);
}
function ToGame_SkillWindow_RequestSetPage(page)
{
   getURL("FSCommand:ToGame_SkillWindow_RequestSetPage",page);
}
function ToGame_SkillWindow_ChangePathTime(timeText)
{
   getURL("FSCommand:ToGame_SkillWindow_ChangePathTime",timeText);
}
function ToGame_SkillWindow_UseSlot(slotIndex, index)
{
   var _loc1_ = slotIndex + "\t" + index;
   getURL("FSCommand:ToGame_SkillWindow_UseSlot",_loc1_);
}
function ToGame_SkillWindow_PopUp()
{
   getURL("FSCommand:ToGame_SkillWindow_PopUp",popUpFocus);
}
function ToGame_SkillWindow_CloseUI()
{
   fscommand("ToGame_SkillWindow_CloseUI");
}
function ToGame_SkillWindow_Init()
{
   fscommand("ToGame_SkillWindow_Init");
}
var UI = this;
UI._visible = false;
var UIname = "SkillWindow";
var slotPrefix = "SkillWindow__";
var bWidgetOpen = false;
var toolTipStr_0 = lib.util.UIString.getUIString("$082049");
var toolTipStr_1 = lib.util.UIString.getUIString("$082050");
var SKILLSTATE_0 = lib.util.UIString.getUIString("$082052");
var SKILLSTATE_1 = lib.util.UIString.getUIString("$082053");
var curViewMode = 0;
container_mc.viewBtn_0.id = 0;
lib.manager.ToolTip.add(container_mc.viewBtn_0,toolTipStr_0,1);
lib.manager.ToolTip.add(container_mc.viewBtn_1,toolTipStr_1,1);
container_mc.viewBtn_1.id = 1;
var btnSound = lib.manager.UISound.MAIN_BTN;
container_mc.UIDrager.setData(UIName,UI,container_mc.lockMc);
var i = 1;
while(i < 6)
{
   var saveBtn = container_mc["saveBtn_" + i];
   saveBtn.id = i;
   setMouseEventSaveBtn(saveBtn);
   i++;
}
var pressedSaveBtn = null;
setMouseEvent(container_mc.viewBtn_0);
setMouseEvent(container_mc.viewBtn_1);
setViewMode();
setViewBtn();
var pathBtn = container_mc.pathBtn.txtBtn;
pathBtn.setRelease(ToGame_SkillWindow_Path);
var resetBtn = container_mc.resetCrestBtn.txtBtn;
resetBtn.setRelease(ToGame_SkillWindow_Reset);
var recommendBtn = container_mc.recommendCrestBtn.txtBtn;
recommendBtn.setRelease(ToGame_SkillWindow_Recommend);
var skillListY = container_mc.skillListContainer._y;
container_mc.skillListScroll.pageSize = container_mc.skillListContainer._height;
container_mc.skillListScroll.rowHeight = 88;
container_mc.skillListScroll.displaySize = container_mc.skillListMask._height;
container_mc.skillListContainer.onScroll = function()
{
   this._y = skillListY - arguments[0];
};
container_mc.skillListScroll.setWheel(container_mc.skillListContainer);
container_mc.skillListScroll.addListener(container_mc.skillListContainer);
var infoTextY = container_mc.skillInfoMc.textFdContainer._y;
var infoScroll = container_mc.skillInfoMc.infoScroll;
infoScroll.pageSize = container_mc.skillInfoMc.textFdContainer._height;
infoScroll.rowHeight = 30;
infoScroll.displaySize = container_mc.skillInfoMc.infoMask._height;
container_mc.skillInfoMc.textFdContainer.onScroll = function()
{
   this._y = infoTextY - arguments[0];
};
infoScroll.setWheel(container_mc.skillInfoMc.textFdContainer);
infoScroll.addListener(container_mc.skillInfoMc.textFdContainer);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var SLOT_WIDTH = 262.5;
var SLOT_HEIGHT_MODE_0 = 42.5;
var SLOT_HEIGTH_MODE_1 = 43;
var skillTabIndex = 0;
var NONCOLOR = 10066329;
var REGCOLOR = 16777215;
var ACTCOLOR = 8311036;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var _CustomScaleEvent;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
         container_mc.lock_mc._x = 739;
         container_mc.lock_mc._y = 7;
      }
      else
      {
         _CustomScaleEvent.CustomScaleEventRemoveCheck();
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
      if(rightClicked)
      {
         rightClicked = false;
         rightClickedTarget.drag = true;
         if(targetIndex != undefined)
         {
            ToGameSkillWindowUseSlot(targetIndex,1);
         }
         rightClickedTarget = null;
      }
   }
   container_mc.ToolTip._visible = bShow;
};
myListener.OnGame_SkillWindow_SetCrestSaveBtn = function(btnParam)
{
   var _loc3_ = lib.util.ExtString.split(btnParam,"\t");
   var _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      var _loc2_ = _loc1_ + 1;
      setStateSaveBtn(container_mc["saveBtn_" + _loc2_],_loc3_[_loc1_]);
      _loc1_ = _loc1_ + 1;
   }
};
var tabBtn = container_mc.tabBtn.tab;
var curTab = 0;
var TAB_NAME = 0;
var TAB_TAG_NUM = 1;
var TAB_WIDTH = 92;
var TAB_HEIGHT = 35;
var tabLength = 0;
myListener.OnGame_SkillWindow_SetTab = function(tabData, selectedTab)
{
   var _loc5_ = lib.util.ExtString.split(tabData,"\n");
   var _loc4_ = [];
   clearTag();
   container_mc.tabBtn.clear();
   tabLength = _loc5_.length;
   var _loc2_ = 0;
   while(_loc2_ < tabLength)
   {
      var _loc3_ = lib.util.ExtString.split(_loc5_[_loc2_],"\t");
      _loc4_.push(_loc3_[TAB_NAME]);
      var _loc1_ = Number(_loc3_[TAB_TAG_NUM]);
      if(_loc1_ != undefined && _loc1_ != "" && _loc1_ != "undefined")
      {
         createTag(_loc2_,_loc1_);
      }
      _loc2_ = _loc2_ + 1;
   }
   container_mc.tabBtn.labels = _loc4_;
   tabBtn = container_mc.tabBtn.tab;
   tabBtn.setRelease(ToGame_SkillWindow_SelectTab);
   if(selectedTab != undefined && selectedTab != "undefined" && selectedTab != null && selectedTab != "")
   {
      curTab = Number(selectedTab);
   }
   tabBtn.setTab(curTab,1);
};
myListener.OnGame_SkillWindow_SetGuideText = function(guideText)
{
   if(guideText == "" || guideText == undefined || guideText == null || guideText == "undefined")
   {
      guideText = "";
   }
   container_mc.noticeFd.htmlText = guideText;
};
myListener.OnGame_SkillWindow_SetViewMode = function(viewMode)
{
   clearSkillContainer();
   curViewMode = Number(viewMode);
   setViewMode();
   setViewBtn();
};
var SLOT_INDEX = 0;
var SKILL_ID = 1;
var SKILL_NAME = 2;
var SKILL_IMG = 3;
var SKILL_DISABLE = 4;
var SKILL_STATE = 5;
var SKILL_NUM = 6;
var SKILL_REMAIN = 7;
var SKILL_TOTAL = 8;
var SKILL_AWAKEN = 9;
myListener.OnGame_SkillWindow_SetSkill = function(skillData, selectedSlot)
{
   var _loc12_ = container_mc.skillListContainer._height;
   if(skillData == undefined || skillData == "" || skillData == "undefined" || skillData == null)
   {
      clearSkillContainer();
      container_mc.skillListScroll.pageSize = container_mc.skillListContainer._height;
      return undefined;
   }
   var _loc6_ = lib.util.ExtString.split(skillData,"\n");
   var _loc7_ = _loc6_.length;
   var _loc3_ = [];
   var _loc2_ = 0;
   while(_loc2_ < _loc7_)
   {
      var _loc1_ = lib.util.ExtString.split(_loc6_[_loc2_],"\t");
      var _loc5_ = Number(_loc1_[SKILL_STATE]);
      var _loc4_ = _loc1_[SLOT_INDEX];
      if(_loc5_ > 0)
      {
         _loc3_.push(_loc4_);
      }
      setSkill(_loc1_);
      _loc2_ = _loc2_ + 1;
   }
   _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      setSkillState(_loc3_[_loc2_]);
      _loc2_ = _loc2_ + 1;
   }
   if(curViewMode == 0)
   {
      var _loc11_ = container_mc.skillListContainer._height;
      if(_loc12_ != _loc11_)
      {
         container_mc.skillListScroll.pageSize = _loc11_;
      }
      if(selectedSlot != "undefined" && selectedSlot != undefined && selectedSlot != "" && selectedSlot != null)
      {
         selectedSlot = Number(selectedSlot);
         var _loc10_ = container_mc.skillListContainer[slotPrefix + selectedSlot];
         releasedSkillSlot = _loc10_.slotHit;
         _loc10_.pressMc._visible = true;
      }
   }
};
var currentPoint = 0;
var totalPoint = 0;
myListener.OnGame_SkillWindow_SetCrest = function(crestData, current, total)
{
   var _loc8_ = container_mc.skillListContainer._height;
   currentPoint = Number(current);
   totalPoint = Number(total);
   var _loc4_ = lib.util.ExtString.split(crestData,"\n");
   var _loc5_ = _loc4_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc4_[_loc1_],"\t");
      setCrest(_loc3_);
      _loc1_ = _loc1_ + 1;
   }
   _loc1_ = 0;
   while(_loc1_ < crestArray.length)
   {
      var _loc2_ = crestArray[_loc1_];
      _loc2_.arrayIndex = _loc1_;
      changeCrestState(_loc2_);
      setStateOnCrestSlot(_loc2_);
      _loc1_ = _loc1_ + 1;
   }
   if(curViewMode == 0)
   {
      var _loc7_ = container_mc.skillListContainer._height;
      if(_loc8_ != _loc7_)
      {
         container_mc.skillListScroll.pageSize = container_mc.skillListContainer._height;
      }
   }
   var _loc6_ = !bChange?"#b40000":"#80e71c";
   container_mc.pointFd.htmlText = "<font color=\'" + _loc6_ + "\'>" + current + "</font>/" + total;
};
var CREST_HTML = 1;
var CREST_INFO_START_INDEX = 2;
var CREST_INFO_COUNT = 7;
var bChange = false;
var CREST_SLOT_START_MODE_0 = 193;
var CREST_SLOT_START_MODE_1 = 49;
var CREST_SLOT_WIDTH = 35.5;
var CREST_STATE_INACTIVE = 0;
var CREST_STATE_ACTIVE = 1;
var CREST_STATE_LOCK = 2;
var CREST_STATE_DISABLE = 3;
var crestArray = [];
var coolTimeManager = lib.util.CoolTimeManger.getInstance();
myListener.OnGame_SkillWindow_CoolTime = function(slotIndex, remain, total)
{
   slotIndex = Number(slotIndex);
   remain = Number(remain);
   total = Number(total);
   var _loc8_ = curViewMode != 0?container_mc.container_mode1.skillListContainer:container_mc.skillListContainer;
   var _loc2_ = _loc8_[slotPrefix + slotIndex];
   var _loc7_ = _loc2_.slotHit._x;
   var _loc6_ = _loc2_.slotHit._y;
   var _loc1_ = _loc2_.coolTimeMc;
   if(remain <= 0 || total <= 0)
   {
      if(_loc1_.coolTime != undefined)
      {
         coolTimeManager.removeCoolTimeInstance(_loc1_);
         _loc1_.removeMovieClip();
      }
   }
   else
   {
      if(_loc1_ == undefined)
      {
         _loc1_ = _loc2_.attachMovie("slotCoolTimeMc","coolTimeMc",_loc2_.getNextHighestDepth());
         _loc1_.iconName = iconName;
         _loc1_._xscale = _loc1_._yscale = 80;
         _loc1_._x = _loc7_ - 2;
         _loc1_._y = _loc6_ - 1;
         _loc1_.hitTestDisable = true;
      }
      _loc1_.setCoolTime(remain,total);
      coolTimeManager.addCoolTimeInstance(_loc1_);
   }
};
myListener.OnGame_SkillWindow_SetToggle = function(slotIndex, bTrue)
{
   slotIndex = Number(slotIndex);
   bTrue = Number(bTrue);
   var _loc7_ = curViewMode != 0?container_mc.container_mode1.skillListContainer:container_mc.skillListContainer;
   var _loc2_ = _loc7_[slotPrefix + slotIndex];
   var _loc5_ = _loc2_.slotHit._x;
   var _loc4_ = _loc2_.slotHit._y;
   var _loc1_ = _loc2_.activeMc;
   if(bTrue)
   {
      if(_loc1_ == undefined)
      {
         _loc1_ = _loc2_.attachMovie("slotActiveMc","activeMc",_loc2_.getNextHighestDepth());
         _loc1_._xscale = _loc1_._yscale = 80;
         _loc1_._x = _loc5_ - 6.5;
         _loc1_._y = _loc4_ - 10;
         _loc1_.hitTestDisable = true;
      }
      else
      {
         _loc1_._visible = true;
      }
   }
   else if(_loc1_ != undefined)
   {
      _loc1_.removeMovieClip();
   }
};
var MAX_CREST = 6;
var CREST_WIDTH = 27;
var CREST_HEIGHT = 27;
var pressedSkillSlot = null;
var releasedSkillSlot = null;
var overedSkillSlot = null;
myListener.OnGame_SkillWindow_SetTitleText = function(title_0, title_1, title_2)
{
   container_mc.titleFd_0.text = title_0;
   container_mc.titleFd_1.text = title_1;
   container_mc.titleFd_2.text = title_2;
};
var fmt = new TextFormat();
fmt.tabStops = [140,240];
container_mc.skillInfoMc.textFdContainer.infoFd_0.setNewTextFormat(fmt);
container_mc.skillInfoMc.textFdContainer.infoFd_1.setNewTextFormat(fmt);
container_mc.skillInfoMc.textFdContainer.infoFd_2.setNewTextFormat(fmt);
container_mc.skillInfoMc.textFdContainer.infoFd_3.setNewTextFormat(fmt);
myListener.OnGame_SkillWindow_SetPathSkill = function(pathSkillId, pathSkillName, pathSkillImg, pathSkillCheck, pathSkillTime)
{
   if(pathSkillId == undefined || pathSkillId == "" || pathSkillId == "undefined" || pathSkillId == null)
   {
      clearPathSkill(false);
      return undefined;
   }
   setPathSkill(pathSkillId,pathSkillName,pathSkillImg,pathSkillCheck,pathSkillTime);
};
container_mc.defaultFd.verticalAutoSize = "center";
myListener.OnGame_SkillWindow_SetDefaultText = function(defaultText)
{
   container_mc.defaultFd._visible = true;
   container_mc.defaultFd.htmlText = defaultText;
   clearPathSkill();
   container_mc.pathSkillMc._visible = false;
   container_mc.skillInfoMc._visible = false;
};
var activeStr = lib.util.UIString.getUIString("$081005");
var passiveStr = lib.util.UIString.getUIString("$081006");
myListener.OnGame_SkillWindow_SetSkillInfo = function(skillId, skillName, skillImg, bActive, skillInfo, bPath, bBtn)
{
   container_mc.defaultFd._visible = false;
   var _loc1_ = container_mc.skillInfoMc;
   _loc1_._visible = true;
   _loc1_.btn._visible = false;
   if(skillId == undefined || skillId == "undefined" || skillId == "" || skillId == null)
   {
      popUpFocus = "";
      clearPathSkill();
      container_mc.pathSkillMc._visible = false;
      _loc1_._visible = false;
      return undefined;
   }
   _loc1_._visible = true;
   _loc1_.infoScroll._visible = false;
   _loc1_.infoFd._width = 305;
   infoScroll.pageSize = 0;
   bActive = Number(bActive);
   bPath = Number(bPath);
   clearPathSkill(true);
   container_mc.pathSkillMc._visible = bPath;
   _loc1_.nameFd.htmlText = skillName;
   var _loc6_ = !bActive?passiveStr:activeStr;
   var _loc5_ = !bActive?"0x80B5DE":"0xFF5A00";
   _loc1_.activeFd.htmlText = _loc6_;
   _loc1_.activeFd.textColor = _loc5_;
   setSkillInfo(skillInfo);
   var _loc4_ = flash.display.BitmapData.loadBitmap(skillImg);
   lib.display.DrawBitmapData.draw(_loc1_.skillIcon,_loc4_,0,0,0,0,53,53,0.82);
   lib.display.DrawBitmapData.draw(container_mc.pathSkillMc.skillIcon,_loc4_,0,0,0,0,37,37,0.57);
   if(bBtn)
   {
      popUpFocus = skillId;
      _loc1_.btn._visible = true;
   }
};
container_mc.pathSkillMc.SkillWindow__pathSlot.slotHit.onPress = function()
{
   pressedSkillSlot = this;
};
container_mc.pathSkillMc.SkillWindow__pathSlot.slotHit.onDragOut = function()
{
   if(this == pressedSkillSlot)
   {
      var _loc3_ = this._parent.TEX;
      if(_loc3_ != undefined)
      {
         _global.StartIconDrag(this._parent,_loc3_);
      }
   }
};
container_mc.pathSkillMc.SkillWindow__pathSlot.slotHit.GetName = function()
{
   return this._parent._name;
};
container_mc.pathSkillMc.checkBox.onChanged = function(changed)
{
   ToGame_SkillWindow_ChangePathSkillCheck(changed);
};
myListener.OnGame_SkillWindow_SetPage = function(curPage, maxPage)
{
   curPage = Number(curPage);
   maxPage = Number(maxPage);
   container_mc.container_mode1.numberSteper.setPage(curPage,maxPage);
};
container_mc.container_mode1.numberSteper.onChanged = function(page)
{
   ToGame_SkillWindow_RequestSetPage(page);
};
var secondStr = lib.util.UIString.getUIString("$101068");
var bChangePathTime = false;
var pathSkillTimeFd = new lib.util.ExtTextField(container_mc.pathSkillMc.timeMc.textFd,1,container_mc.pathSkillMc.timeMc.focusMc);
pathSkillTimeFd.exceptComma = true;
pathSkillTimeFd.onEnterKey = function()
{
   bChangePathTime = false;
   Selection.setFocus(null);
   var _loc3_ = Number(this.text);
   var _loc2_ = "";
   if(_loc3_ == NaN)
   {
      _loc2_ = container_mc.pathSkillMc.timeMc.timeText;
      container_mc.pathSkillMc.timeMc.textFd.text = _loc2_ + secondStr;
   }
   else
   {
      _loc2_ = this.text;
      container_mc.pathSkillMc.timeMc.timeText = _loc2_;
      this.text = _loc2_ + secondStr;
      ToGame_SkillWindow_ChangePathTime(_loc2_);
   }
};
pathSkillTimeFd.onKillFocusEvent = function()
{
   bChangePathTime = false;
   var _loc3_ = Number(this.text);
   var _loc2_ = "";
   if(_loc3_ == NaN)
   {
      _loc2_ = container_mc.pathSkillMc.timeMc.timeText;
      container_mc.pathSkillMc.timeMc.textFd.text = _loc2_ + secondStr;
   }
   else
   {
      _loc2_ = this.text;
      container_mc.pathSkillMc.timeMc.timeText = _loc2_;
      this.text = _loc2_ + secondStr;
      ToGame_SkillWindow_ChangePathTime(_loc2_);
   }
};
container_mc.pathSkillMc.timeMc.textFd.onChanged = function()
{
   bChangePathTime = true;
   if(Number(this.text) > 99)
   {
      this.text = 99 + secondStr;
   }
};
var rightClicked = false;
var targetIndex = null;
var rightClickedTarget = null;
myListener.OnGame_MouseDown = function(button, target)
{
   if(target.slotName != "SKILLSLOT" || target._parent.disable)
   {
      return undefined;
   }
   button = Number(button);
   if(button == 2)
   {
      rightClicked = true;
      rightClickedTarget = target._parent;
      targetIndex = rightClickedTarget.slotIndex;
      if(targetIndex != undefined)
      {
         ToGame_SkillWindow_UseSlot(targetIndex,0);
      }
   }
};
myListener.OnGame_MouseUp = function(button, target)
{
   if(rightClicked == false)
   {
      return undefined;
   }
   button = Number(button);
   if(button == 2)
   {
      rightClicked = false;
      if(targetIndex != undefined)
      {
         ToGame_SkillWindow_UseSlot(targetIndex,1);
      }
      rightClickedTarget = null;
   }
};
var closeBtn = new lib.util.TxtBtn(container_mc.closeBtn);
closeBtn.setRelease(ToGame_SkillWindow_CloseUI);
var popUpFocus = "";
var popUpBtn = container_mc.skillInfoMc.btn.txtBtn;
popUpBtn.setRelease(ToGame_SkillWindow_PopUp);
ToGame_SkillWindow_Init();
