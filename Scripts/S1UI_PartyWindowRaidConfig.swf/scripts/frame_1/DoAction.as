function SetCheckButton()
{
   container_mc.checkMc.checkBtn.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
   container_mc.checkMc.checkBtn.onRollOut = function()
   {
      this.gotoAndStop(1);
   };
   container_mc.checkMc.checkBtn.onPress = function()
   {
      this.gotoAndStop(3);
   };
   container_mc.checkMc.checkBtn.onRelease = function()
   {
      if(this._parent._currentframe == 1)
      {
         this._parent.gotoAndStop(2);
         ToGame_PartyWindowRaidConfig_AllCheck(0);
      }
      else
      {
         this._parent.gotoAndStop(1);
         ToGame_PartyWindowRaidConfig_AllCheck(1);
      }
      this.gotoAndStop(1);
   };
   container_mc.checkMc.checkBtn.onReleaseOutside = function()
   {
      this.gotoAndStop(1);
   };
}
function PartyWindowRaidConfig_SlotClear()
{
}
function PartyWindowRaidConfig_SoltListClear()
{
   var _loc2_ = 0;
   while(_loc2_ < PartyRaidSlotList_MaxNumber)
   {
      var _loc1_ = container_mc["Slot" + _loc2_];
      setSlotState(_loc1_,1);
      _loc1_.hit.isBFTeamSlot = true;
      _loc1_._visible = true;
      _loc1_.level_txt.htmlText = "";
      _loc1_.id_txt.htmlText = "";
      _loc1_.classMc._visible = false;
      _loc1_.readyMc.gotoAndStop("init");
      _loc1_.index = _loc2_;
      _loc2_ = _loc2_ + 1;
   }
   dragTargetSlot = undefined;
   dropTargetSlot = undefined;
   isDrag = false;
   isMoving = false;
   dragSlotMc.removeMovieClip();
   copyMc0.removeMovieClip();
   copyMc1.removeMovieClip();
   overClip = undefined;
}
function setSlotState(slotMc, _state)
{
   if(_state == 0)
   {
      slotMc.slotBg._visible = true;
      slotMc.slotBg.gotoAndStop(4);
   }
   else if(_state == 1)
   {
      slotMc.slotBg._visible = false;
      slotMc.slotBg.gotoAndStop(2);
   }
   else if(_state == 2)
   {
      slotMc.slotBg._visible = true;
      slotMc.slotBg.gotoAndStop(2);
   }
   else if(_state == 3)
   {
      slotMc.slotBg._visible = true;
      slotMc.slotBg.gotoAndStop(3);
   }
}
function cloneSlot(targetMc, cloneMc)
{
   cloneMc.readyMc0._visible = targetMc.readyMc0._visible;
   cloneMc.readyMc1._visible = targetMc.readyMc1._visible;
   cloneMc.readyMc2._visible = targetMc.readyMc2._visible;
   cloneMc.readyMc0.gotoAndStop(targetMc.readyMc0._currentframe);
   cloneMc.readyMc1.gotoAndStop(targetMc.readyMc1._currentframe);
   cloneMc.level_txt.htmlText = targetMc.level_txt.htmlText;
   cloneMc.id_txt.setText(targetMc.id_txt.htmlText);
   cloneMc.classMc._visible = targetMc.classMc._visible;
   cloneMc.classMc.gotoAndStop(targetMc.classMc._currentframe);
   cloneMc.chatMc.gotoAndStop(targetMc.chatMc._currentframe);
}
function changePosition(index0, index1)
{
   gs.TweenLite.killTweensOf(copyMc0,false);
   gs.TweenLite.killTweensOf(copyMc1,false);
   var _loc2_ = container_mc["Slot" + index0];
   var _loc1_ = container_mc["Slot" + index1];
   copyMc0 = _loc2_.duplicateMovieClip("copyMc0",container_mc.getNextHighestDepth());
   copyMc1 = _loc1_.duplicateMovieClip("copyMc1",container_mc.getNextHighestDepth());
   _loc2_._visible = false;
   _loc1_._visible = false;
   cloneSlot(_loc2_,copyMc0);
   cloneSlot(_loc1_,copyMc1);
   var _loc6_ = copyMc0._x;
   var _loc4_ = copyMc1._y > copyMc0._y?copyMc0._y - copyMc0._height / 2:copyMc0._y + copyMc0._height / 2;
   var _loc5_ = copyMc1._x;
   var _loc3_ = copyMc0._y >= copyMc1._y?copyMc1._y - copyMc1._height / 2:copyMc1._y + copyMc1._height / 2;
   var _loc10_ = copyMc1._x;
   var _loc8_ = copyMc1._y;
   var _loc9_ = copyMc0._x;
   var _loc7_ = copyMc0._y;
   gs.TweenLite.to(copyMc0,PFSPEED,{_x:_loc6_,_y:_loc4_,ease:gs.easing.Back.easeOut,onComplete:onChTween,onCompleteParams:[copyMc0,_loc10_,_loc8_]});
   gs.TweenLite.to(copyMc1,PFSPEED,{_x:_loc5_,_y:_loc3_,ease:gs.easing.Back.easeOut,onComplete:onChTween,onCompleteParams:[copyMc1,_loc9_,_loc7_]});
}
function moveAni(selectMc, targetMc, flag)
{
   var _loc3_ = targetMc._x;
   var _loc2_ = targetMc._y;
   isMoving = true;
   gs.TweenLite.to(selectMc,SPEED,{_x:_loc3_,_y:_loc2_,ease:gs.easing.Strong.easeOut,onComplete:onFinishTween,onCompleteParams:[selectMc,targetMc,flag]});
}
function onFinishTween(selectMc, targetMc, flag)
{
   selectMc.removeMovieClip();
   listBuild();
}
function onChTween(selectMc, x, y)
{
   gs.TweenLite.to(selectMc,SPEED,{_x:x,_y:y,ease:gs.easing.Strong.easeOut,onComplete:onEndChTween,onCompleteParams:[selectMc]});
}
function onEndChTween(selectMc)
{
   selectMc.removeMovieClip();
   listBuild();
}
function listBuild()
{
   PartyWindowRaidConfig_SlotClear();
   PartyWindowRaidConfig_SoltListClear();
   var _loc10_ = 0;
   var _loc4_ = 0;
   while(_loc4_ < PartyRaidSlotList_MaxNumber)
   {
      var _loc2_ = container_mc["Slot" + _loc4_];
      _loc2_.slotBg._visible = false;
      _loc2_.readyMc0._visible = false;
      _loc2_.readyMc1._visible = false;
      _loc2_.readyMc2._visible = false;
      _loc4_ = _loc4_ + 1;
   }
   var _loc11_ = PartyRaidSlotList_MaxNumber;
   var _loc8_ = 0;
   var _loc7_ = 0;
   _loc4_ = 0;
   while(_loc4_ < _loc11_)
   {
      _loc2_ = container_mc["Slot" + _loc4_];
      var _loc3_ = teamListData[_loc4_];
      PartyRaidObjects[_loc2_._name] = _loc2_;
      if(_loc3_[0] == undefined || _loc3_[0] == "" || _loc3_[0] == null)
      {
         _loc2_.index = null;
         _loc2_.hit.isBFTeamSlot = false;
      }
      else
      {
         _loc2_.tmp_index = _loc3_[9];
         _loc8_ = _loc8_ + 1;
      }
      if((_loc4_ + 1) % 5 == 0)
      {
         _loc7_ = int(_loc4_ / 5);
         if(_loc8_ > 0)
         {
            container_mc["PartyRaidMc" + _loc7_].PartyRaidMc.checkMc._visible = true;
         }
         else
         {
            container_mc["PartyRaidMc" + _loc7_].PartyRaidMc.checkMc._visible = false;
         }
         _loc8_ = 0;
      }
      _loc2_.index = _loc3_[9];
      var _loc6_ = false;
      if(_loc3_[0] == undefined || _loc3_[0] == "" || _loc3_[0] == null)
      {
         _loc2_.readyMc0.gotoAndStop(3);
         _loc2_.readyMc0._visible = false;
         lib.manager.ToolTip.remove(_loc2_.readyMc0);
      }
      else if(_loc3_[0] == 0)
      {
         _loc6_ = true;
         _loc2_.readyMc0._visible = true;
         _loc2_.readyMc0.gotoAndStop(1);
         lib.manager.ToolTip.add(_loc2_.readyMc0,lib.util.UIString.getUIString("$023118"),1);
      }
      else if(_loc3_[0] == 1)
      {
         _loc2_.readyMc0._visible = true;
         _loc2_.readyMc0.gotoAndStop(2);
         lib.manager.ToolTip.add(_loc2_.readyMc0,lib.util.UIString.getUIString("$023119"),1);
      }
      if(_loc3_[2] == undefined || _loc3_[2] == "" || _loc3_[2] == null)
      {
         _loc2_.readyMc2._visible = false;
      }
      else if(_loc3_[2] == 1)
      {
         _loc2_.readyMc2._visible = false;
      }
      if(!_loc6_)
      {
         if(_loc3_[1] == undefined || _loc3_[1] == "" || _loc3_[1] == null)
         {
            _loc2_.readyMc1.gotoAndStop(3);
            _loc2_.readyMc1._visible = false;
            lib.manager.ToolTip.remove(_loc2_.readyMc1);
         }
         else if(_loc3_[1] == 0)
         {
            _loc2_.readyMc1._visible = true;
            _loc2_.readyMc1.gotoAndStop(3);
            lib.manager.ToolTip.remove(_loc2_.readyMc1);
         }
         else if(_loc3_[1] == 1)
         {
            _loc2_.readyMc1._visible = true;
            _loc2_.readyMc1.gotoAndStop(1);
            lib.manager.ToolTip.add(_loc2_.readyMc1,lib.util.UIString.getUIString("$023120"),1);
         }
         else if(_loc3_[1] == 2)
         {
            _loc2_.readyMc1._visible = true;
            _loc2_.readyMc1.gotoAndStop(2);
            lib.manager.ToolTip.add(_loc2_.readyMc1,lib.util.UIString.getUIString("$023121"),1);
         }
      }
      if(_loc3_[3] == undefined || _loc3_[3] == "" || _loc3_[3] == null)
      {
         _loc2_.level_txt.htmlText = "";
      }
      else
      {
         _loc2_.level_txt.htmlText = _loc3_[3];
         _loc10_ = _loc10_ + 1;
      }
      if(_loc3_[4] == undefined || _loc3_[4] == "" || _loc3_[4] == null)
      {
         _loc2_.id_txt.htmlText = "";
      }
      else
      {
         _loc2_.id_txt.setText(_loc3_[4]);
      }
      if(_loc3_[5] == undefined || _loc3_[5] == "" || _loc3_[5] == null)
      {
         _loc2_.classMc._visible = false;
      }
      else
      {
         _loc2_.classMc._visible = true;
         _loc2_.classMc.gotoAndStop(Number(_loc3_[5]) + 1);
         var _loc9_ = lib.info.ToolTipStr["CLASS_" + _loc3_[5]];
         lib.manager.ToolTip.add(_loc2_.classMc,_loc9_,1);
      }
      _loc2_.hit.onRollOver = function()
      {
         if(this._parent.classMc._visible != false)
         {
            if(dropTargetSlot != this._parent && dragTargetSlot != this._parent && PartyRaidMaster)
            {
               setSlotState(this._parent,2);
            }
         }
      };
      _loc2_.hit.onRollOut = function()
      {
         if(this._parent.classMc._visible != false)
         {
            if(dropTargetSlot != this._parent && dragTargetSlot != this._parent && PartyRaidMaster)
            {
               setSlotState(this._parent,1);
            }
         }
      };
      _loc2_.hit.onReleaseOutside = function()
      {
         if(this._parent.classMc._visible != false)
         {
            if(dropTargetSlot != this._parent && dragTargetSlot != this._parent && PartyRaidMaster)
            {
               setSlotState(this._parent,1);
            }
         }
      };
      if(_loc3_[6] == 0)
      {
         _loc2_.level_txt.textColor = PartyRaidMember_Off_Color;
         _loc2_.id_txt.textColor = PartyRaidMember_Off_Color;
      }
      else if(_loc3_[6] == 1)
      {
         _loc2_.level_txt.textColor = PartyRaidMember_Die_Color;
         _loc2_.id_txt.textColor = PartyRaidMember_Die_Color;
      }
      else if(_loc3_[6] == 2)
      {
         if(_loc3_[0] == 0)
         {
            _loc2_.level_txt.textColor = PartyRaidMember_Master_Color;
            _loc2_.id_txt.textColor = PartyRaidMember_Master_Color;
         }
         else
         {
            _loc2_.level_txt.textColor = PartyRaidMember_Normal_Color;
            _loc2_.id_txt.textColor = PartyRaidMember_Normal_Color;
         }
      }
      else if(_loc3_[6] == 3)
      {
         if(_loc3_[0] == 0)
         {
            _loc2_.level_txt.textColor = PartyRaidMember_Master_Color;
            _loc2_.id_txt.textColor = PartyRaidMember_Master_Color;
         }
         else
         {
            _loc2_.level_txt.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
            _loc2_.id_txt.textColor = lib.info.TextColor.GENERAL_EMPHASIS;
         }
      }
      else
      {
         _loc2_.level_txt.textColor = PartyRaidMember_Normal_Color;
         _loc2_.id_txt.textColor = PartyRaidMember_Normal_Color;
      }
      var _loc5_ = _loc3_[8];
      if(_loc5_ == 0)
      {
         _loc2_.chatMc._visible = true;
         _loc2_.chatMc.gotoAndStop(2);
         lib.manager.ToolTip.add(_loc2_.chatMc,lib.util.UIString.getUIString("$023124"),1);
      }
      else if(_loc5_ == 1)
      {
         _loc2_.chatMc._visible = true;
         _loc2_.chatMc.gotoAndStop(3);
         lib.manager.ToolTip.add(_loc2_.chatMc,lib.util.UIString.getUIString("$023125"),1);
      }
      else if(_loc5_ == 2)
      {
         _loc2_.chatMc._visible = true;
         _loc2_.chatMc.gotoAndStop(4);
         lib.manager.ToolTip.add(_loc2_.chatMc,lib.util.UIString.getUIString("$023126"),1);
      }
      else
      {
         _loc2_.chatMc.gotoAndStop(1);
         _loc2_.chatMc._visible = false;
      }
      _loc4_ = _loc4_ + 1;
   }
}
function PartyWindowRaidConfig_SoltListVisible(bool)
{
   var _loc1_ = 0;
   while(_loc1_ < PartyRaidSlotList_MaxNumber)
   {
      var _loc2_ = container_mc["Slot" + _loc1_];
      _loc2_._visible = Boolean(bool);
      _loc1_ = _loc1_ + 1;
   }
   container_mc.PartyRaidMc0.gotoAndStop(Number(bool) + 1);
   container_mc.PartyRaidMc1.gotoAndStop(Number(bool) + 1);
   container_mc.PartyRaidMc2.gotoAndStop(Number(bool) + 1);
   container_mc.PartyRaidMc3.gotoAndStop(Number(bool) + 1);
   container_mc.PartyRaidMc4.gotoAndStop(Number(bool) + 1);
   container_mc.PartyRaidMc5.gotoAndStop(Number(bool) + 1);
   PartyWindowRaidConfig_PartyRaidTabName();
}
function PartyWindowRaidConfig_PartyRaidBtn(_index)
{
   if(_index == 0)
   {
      PartyRaidConfig_Btn0.setVisible(true);
      PartyRaidConfig_Btn1.setVisible(false);
      PartyRaidConfig_Btn2.setVisible(false);
      PartyRaidConfig_Btn3.setVisible(false);
   }
   else if(_index == 1)
   {
      PartyRaidConfig_Btn0.setVisible(false);
      PartyRaidConfig_Btn1.setVisible(true);
      PartyRaidConfig_Btn2.setVisible(true);
      PartyRaidConfig_Btn3.setVisible(true);
   }
}
function PartyWindowRaidConfig_PartyRaidTabName()
{
   container_mc.PartyRaidMc0.PartyRaidMc.txt0.htmlText = lib.util.UIString.getUIString("$023105");
   container_mc.PartyRaidMc1.PartyRaidMc.txt0.htmlText = lib.util.UIString.getUIString("$023106");
   container_mc.PartyRaidMc2.PartyRaidMc.txt0.htmlText = lib.util.UIString.getUIString("$023107");
   container_mc.PartyRaidMc3.PartyRaidMc.txt0.htmlText = lib.util.UIString.getUIString("$023108");
   container_mc.PartyRaidMc4.PartyRaidMc.txt0.htmlText = lib.util.UIString.getUIString("$023127");
   container_mc.PartyRaidMc5.PartyRaidMc.txt0.htmlText = lib.util.UIString.getUIString("$023128");
}
function tabButtonSet(mc, idx)
{
   mc.checkBtn.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
   mc.checkBtn.onRollOut = function()
   {
      this.gotoAndStop(1);
   };
   mc.checkBtn.onPress = function()
   {
      this.gotoAndStop(3);
   };
   mc.checkBtn.onRelease = function()
   {
      if(this._parent._currentframe == 1)
      {
         this._parent.gotoAndStop(2);
         tabButtonSet(this._parent,idx);
         ToGame_PartyWindowRaidConfig_PartyMemberTabCheck(idx,1);
      }
      else
      {
         this._parent.gotoAndStop(1);
         tabButtonSet(this._parent,idx);
         ToGame_PartyWindowRaidConfig_PartyMemberTabCheck(idx,0);
      }
      this.gotoAndStop(1);
   };
   mc.checkBtn.onReleaseOutside = function()
   {
      this.gotoAndStop(1);
   };
}
function PartyWindowRaidConfig_PartyRaidTabCheck(tabList)
{
   var _loc1_ = lib.util.ExtString.split(tabList,"\t");
   container_mc.PartyRaidMc0.PartyRaidMc.checkMc.gotoAndStop(Number(_loc1_[0]) + 1);
   container_mc.PartyRaidMc1.PartyRaidMc.checkMc.gotoAndStop(Number(_loc1_[1]) + 1);
   container_mc.PartyRaidMc2.PartyRaidMc.checkMc.gotoAndStop(Number(_loc1_[2]) + 1);
   container_mc.PartyRaidMc3.PartyRaidMc.checkMc.gotoAndStop(Number(_loc1_[3]) + 1);
   container_mc.PartyRaidMc4.PartyRaidMc.checkMc.gotoAndStop(Number(_loc1_[4]) + 1);
   container_mc.PartyRaidMc5.PartyRaidMc.checkMc.gotoAndStop(Number(_loc1_[5]) + 1);
   tabButtonSet(container_mc.PartyRaidMc0.PartyRaidMc.checkMc,0);
   tabButtonSet(container_mc.PartyRaidMc1.PartyRaidMc.checkMc,1);
   tabButtonSet(container_mc.PartyRaidMc2.PartyRaidMc.checkMc,2);
   tabButtonSet(container_mc.PartyRaidMc3.PartyRaidMc.checkMc,3);
   tabButtonSet(container_mc.PartyRaidMc4.PartyRaidMc.checkMc,4);
   tabButtonSet(container_mc.PartyRaidMc5.PartyRaidMc.checkMc,5);
}
function popUP(mc)
{
   clearPop();
   mc.hit_mc.onRollOver();
   popMc = container_mc.attachMovie("pop","popMc",container_mc.getNextHighestDepth());
   popMc._x = container_mc._xmouse;
   popMc._y = container_mc._ymouse;
   popMc.obj = mc;
   var _loc3_ = new TextFormat();
   var _loc5_ = new TextFormat();
   var _loc4_ = new TextFormat();
   if(popMc.txt0_txt.maxscroll > 1)
   {
      _loc3_.size = 14;
      popMc.txt0_txt.setTextFormat(_loc3_);
   }
   if(popMc.txt1_txt.maxscroll > 1)
   {
      _loc5_.size = 14;
      popMc.txt1_txt.setTextFormat(_loc5_);
   }
   if(popMc.txt2_txt.maxscroll > 1)
   {
      _loc4_.size = 14;
      popMc.txt2_txt.setTextFormat(_loc4_);
   }
   popMc.txt0_txt.verticalAlign = "center";
   popMc.txt1_txt.verticalAlign = "center";
   popMc.txt2_txt.verticalAlign = "center";
   popMc.txt3_txt.verticalAlign = "center";
   popMc.txt0_txt.textAutoSize = "shrink”";
   popMc.txt1_txt.textAutoSize = "shrink”";
   popMc.txt2_txt.textAutoSize = "shrink”";
   popMc.txt3_txt.textAutoSize = "shrink”";
   var _loc2_ = 0;
   while(_loc2_ < 4)
   {
      popMc["line" + _loc2_].type = _loc2_;
      popMc["line" + _loc2_].hit.onRollOver = function()
      {
         delete popMc.onEnterFrame;
         this._parent.effect_mc.gotoAndStop("over");
         this._parent._parent["txt" + this._parent._name.substr(4,2) + "_txt"].textColor = lib.info.TextColor.SUBMENU_OVER;
         this._parent._parent["txt" + this._parent._name.substr(4,2) + "_txt"].shadowColor = 16777215;
      };
      popMc["line" + _loc2_].hit.onRollOut = popMc["line" + _loc2_].hit.onReleaseOutside = function()
      {
         callFadeOut();
         this._parent.effect_mc.gotoAndStop("out");
         this._parent._parent["txt" + this._parent._name.substr(4,2) + "_txt"].textColor = lib.info.TextColor.SUBMENU_NORMAL;
         this._parent._parent["txt" + this._parent._name.substr(4,2) + "_txt"].shadowColor = "";
      };
      popMc["line" + _loc2_].hit.onPress = function()
      {
         delete popMc.onEnterFrame;
         this._parent.effect_mc.gotoAndStop("press");
         this._parent._parent["txt" + this._parent._name.substr(4,2) + "_txt"].textColor = lib.info.TextColor.SUBMENU_PRESS;
         this._parent._parent["txt" + this._parent._name.substr(4,2) + "_txt"].shadowColor = "";
      };
      popMc["line" + _loc2_].hit.onRelease = function()
      {
         if(this._parent.type == 0)
         {
            ToGame_PartyWindowRaidConfig_PopupList(mc.index,0);
         }
         else if(this._parent.type == 1)
         {
            ToGame_PartyWindowRaidConfig_PopupList(mc.index,1);
         }
         else if(this._parent.type == 2)
         {
            ToGame_PartyWindowRaidConfig_PopupList(mc.index,2);
         }
         else if(this._parent.type == 3)
         {
            ToGame_PartyWindowRaidConfig_PopupList(mc.index,3);
         }
         else if(this._parent.type == 4)
         {
            ToGame_PartyWindowRaidConfig_PopupList(mc.index,4);
         }
         else if(this._parent.type == 5)
         {
            ToGame_PartyWindowRaidConfig_PopupList(mc.index,5);
         }
         clearPop();
      };
      _loc2_ = _loc2_ + 1;
   }
   popMc.cnt = 0;
   popMc.onEnterFrame = function()
   {
      popMc.cnt = popMc.cnt + 1;
      if(popMc.cnt >= 150)
      {
         popMc.cnt = 0;
         popMc._visible = false;
         delete popMc.onEnterFrame;
      }
   };
}
function callFadeOut()
{
   popMc.count = 0;
   delete this.onEnterFrame;
   popMc.onEnterFrame = function()
   {
      this.count = this.count + 1;
      if(this.count > POPTIMER)
      {
         clearPop();
         delete popMc.onEnterFrame;
      }
   };
}
function clearPop()
{
   delete popMc.onEnterFrame;
   var _loc1_ = popMc.obj;
   popMc.removeMovieClip();
   popMc = undefined;
   _loc1_.hit_mc.onRollOut();
}
function ToGame_PartyWindowRaidConfig_Init()
{
   fscommand("ToGame_PartyWindowRaidConfig_Init");
}
function ToGame_PartyWindowRaidConfig_CloseUI()
{
   Mouse.removeListener(mouseListner2);
   fscommand("ToGame_PartyWindowRaidConfig_CloseUI");
}
function ToGame_PartyWindowRaidConfig_SwapElement(indexA, indexB)
{
   lib.Debuger.trace("ToGame_PartyWindowRaidConfig_SwapElement");
   lib.Debuger.trace("indexA : " + indexA);
   lib.Debuger.trace("indexB : " + indexB);
   getURL("FSCommand:ToGame_PartyWindowRaidConfig_SwapElement",indexA + "\t" + indexB);
}
function ToGame_PartyWindowRaidConfig_PartyMemberCheck(index, flag)
{
   getURL("FSCommand:ToGame_PartyWindowRaidConfig_PartyMemberCheck",index + "\t" + flag);
}
function ToGame_PartyWindowRaidConfig_PartyMemberChat(index, flag)
{
   getURL("FSCommand:ToGame_PartyWindowRaidConfig_PartyMemberChat",index + "\t" + flag);
}
function ToGame_PartyWindowRaidConfig_AllCheck(flag)
{
   getURL("FSCommand:ToGame_PartyWindowRaidConfig_AllCheck",flag);
}
function ToGame_PartyWindowRaidConfig_PartyMemberTabCheck(index, flag)
{
   getURL("FSCommand:ToGame_PartyWindowRaidConfig_PartyMemberTabCheck",index + "\t" + flag);
}
function ToGame_PartyWindowRaidConfig_StartUI()
{
   fscommand("ToGame_PartyWindowRaidConfig_StartUI");
}
function ToGame_PartyWindowRaidConfig_InviteUI()
{
   fscommand("ToGame_PartyWindowRaidConfig_InviteUI");
}
function ToGame_PartyWindowRaidConfig_CancelUI()
{
   fscommand("ToGame_PartyWindowRaidConfig_CancelUI");
}
function ToGame_PartyWindowRaidConfig_OkUI()
{
   fscommand("ToGame_PartyWindowRaidConfig_OkUI");
}
function ToGame_PartyWindowRaidConfig_PopupList(index, _value)
{
   getURL("FSCommand:ToGame_PartyWindowRaidConfig_PopupList",index + "\t" + _value);
}
function ToGame_PartyWindowRaidConfig_ResetPosition()
{
   lib.Debuger.trace("ToGame_PartyWindowRaidConfig_ResetPosition");
   fscommand("ToGame_PartyWindowRaidConfig_ResetPosition");
}
var UI = this;
var UIname = "PartyWindowRaidConfig";
var bWidgetOpen = false;
UI._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var PartyRaidConfig_Btn0 = container_mc.Btn0.txtBtn;
var PartyRaidConfig_Btn1 = container_mc.Btn1.txtBtn;
var PartyRaidConfig_Btn2 = container_mc.Btn2.txtBtn;
var PartyRaidConfig_Btn3 = container_mc.Btn3.txtBtn;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var PartyRaidMember_Die_Color = 12582917;
var PartyRaidMember_Off_Color = 7368816;
var PartyRaidMember_Master_Color = 16750848;
var PartyRaidMember_Normal_Color = 14145495;
container_mc.text_name.verticalAlign = "center";
var i = 0;
while(i < 30)
{
   container_mc["Slot" + i].level_txt.verticalAlign = "center";
   i++;
}
var PartyRaidSlotList_MaxNumber = 30;
var PartyRaidMember_ClassName = ["$013020","$013021","$013022","$013023","$013024","$013025","$013026","$013027"];
var POPTIMER = 24;
var SPEED = 0.01;
var PFSPEED = 0.01;
var dragSlotMc;
var dragTargetSlot;
var dropTargetSlot;
var mouseListner2 = {};
var isDrag = false;
var isMoving = false;
var overClip;
var copyMc0;
var copyMc1;
var teamListData;
var PartyRaidObjects = [];
var PartyRaidMaster = false;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
         lib.util.InteractionGroup.delInteraction(UIname);
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
myListener.OnGame_PartyWindowRaidConfig_PartyMemberTabCheck = function(tabList)
{
   PartyWindowRaidConfig_PartyRaidTabCheck(tabList);
};
myListener.OnGame_PartyWindowRaidConfig_SetData = function(teamList, _master)
{
   PartyRaidObjects = [];
   myListener.OnGame_PartyWindowRaidConfig_Setinit(1);
   PartyRaidMaster = Boolean(_master);
   teamList = lib.util.ExtString.split(teamList,"\n");
   var _loc6_ = teamList.length;
   teamListData = [];
   var _loc3_ = [];
   var _loc2_ = 0;
   while(_loc2_ < _loc6_)
   {
      teamListData[_loc2_] = [];
      _loc3_[_loc2_] = [];
      var _loc4_ = lib.util.ExtString.split(teamList[_loc2_],"\t");
      var _loc5_ = _loc4_.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc5_)
      {
         _loc3_[_loc2_].push(_loc4_[_loc1_]);
         _loc1_ = _loc1_ + 1;
      }
      _loc2_ = _loc2_ + 1;
   }
   _loc2_ = 0;
   while(_loc2_ < _loc6_)
   {
      teamListData[_loc3_[_loc2_][9]] = _loc3_[_loc2_];
      _loc2_ = _loc2_ + 1;
   }
   listBuild();
   if(PartyRaidMaster)
   {
      PartyRaidConfig_Btn0.setEnabled(true);
      PartyRaidConfig_Btn1.setEnabled(true);
      PartyRaidConfig_Btn2.setEnabled(true);
      PartyRaidConfig_Btn3.setEnabled(true);
   }
   else
   {
      PartyRaidConfig_Btn0.setEnabled(false);
      PartyRaidConfig_Btn1.setEnabled(false);
      PartyRaidConfig_Btn2.setEnabled(false);
      PartyRaidConfig_Btn3.setEnabled(false);
   }
};
container_mc.TextMc.scrollbar._yscale = 85.83333333333333;
var listContainerY = 0;
container_mc.TextMc.scrollbar.pageSize = 0;
container_mc.TextMc.scrollbar.displaySize = container_mc.TextMc.maskMc._height;
container_mc.TextMc.scrollbar.rowHeight = 100;
container_mc.TextMc.box.onScroll = function()
{
   this._y = listContainerY - arguments[0];
};
container_mc.TextMc.scrollbar.setWheel(container_mc.TextMc.box);
container_mc.TextMc.scrollbar.addListener(container_mc.TextMc.box);
myListener.OnGame_PartyWindowRaidConfig_SetTextData = function(_data)
{
   if(_data == undefined || _data == "")
   {
      container_mc.TextMc.box.txt0.htmlText = "";
   }
   else
   {
      container_mc.TextMc.box.txt0.htmlText = "<img src=\'icon_notice\' vspace=\'-0\'>" + _data;
   }
   var _loc1_ = container_mc.TextMc.box.txt0.textHeight + 24;
   container_mc.TextMc.box.bg._height = _loc1_;
   container_mc.TextMc.box.txt0._height = _loc1_;
   container_mc.TextMc.scrollbar.pageSize = _loc1_;
   container_mc.TextMc.scrollbar.scroll = 0;
};
myListener.OnGame_PartyWindowRaidConfig_Setinit = function(_index)
{
   PartyWindowRaidConfig_SoltListVisible(_index);
};
myListener.OnGame_PartyWindowRaidConfig_PartyRaidBtn = function(_index)
{
   PartyWindowRaidConfig_PartyRaidBtn(_index);
};
myListener.OnGame_PartyWindowRaidConfig_PartyRaidDissolutionBtn = function(_index)
{
   if(_index == 0)
   {
      PartyRaidConfig_Btn1.setEnabled(false);
   }
   else if(_index == 1)
   {
      PartyRaidConfig_Btn1.setEnabled(true);
   }
};
myListener.OnGame_PartyWindowRaidConfig_PartyRaidMakeDissolutionBtn = function(_index)
{
   if(_index == 0)
   {
      PartyRaidConfig_Btn0.setEnabled(false);
      lib.manager.ToolTip.add(container_mc.Btn0,lib.util.UIString.getUIString("$023142"),1);
   }
   else if(_index == 1)
   {
      PartyRaidConfig_Btn0.setEnabled(true);
      lib.manager.ToolTip.remove(container_mc.Btn0);
   }
};
myListener.OnGame_PartyWindowRaidConfig_PartyRaidInviteDissolutionBtn = function(_index)
{
   if(_index == 0)
   {
      PartyRaidConfig_Btn3.setEnabled(false);
   }
   else if(_index == 1)
   {
      PartyRaidConfig_Btn3.setEnabled(true);
   }
};
var optionBtn = new lib.util.TxtBtn(container_mc.optionBtn);
optionBtn.setRelease(function()
{
   g4.model.GameModel.uiModel.openPartyRaidInteractionMenu();
}
);
var checkButtonInit = false;
container_mc.checkMc._visible = false;
myListener.OnGame_PartyWindowRaidConfig_SetAllCheck = function(_type)
{
   return undefined;
};
mouseListner2.onMouseDown = function()
{
   var _loc1_ = Mouse.getTopMostEntity(_level0._xmouse,_level0._ymouse);
   if((_loc1_.isBFTeamSlot == true || _loc1_._parent.hit.isBFTeamSlot == true || _loc1_._parent.index != undefined) && PartyRaidMaster && _loc1_._parent._parent._parent._name == UIname)
   {
      isDrag = true;
      var _loc2_ = _loc1_._parent;
      if(_loc2_.classMc._visible == false)
      {
         isDrag = false;
      }
      else
      {
         setSlotState(_loc2_,3);
         dragTargetSlot = _loc2_;
         dragSlotMc.removeMovieClip();
         dragSlotMc = _loc2_.duplicateMovieClip("dragSlotMc",container_mc.getNextHighestDepth());
         cloneSlot(dragTargetSlot,dragSlotMc);
         dragSlotMc._alpha = 60;
         dragSlotMc.startDrag();
         dragSlotMc.effect_mc._visible = false;
      }
   }
};
mouseListner2.onMouseUp = function()
{
   if(isDrag)
   {
      dragSlotMc.stopDrag();
      dragSlotMc.effect_mc._visible = true;
      var target = eval(dragSlotMc._droptarget);
      isDrag = false;
      var testa = target._parent.index;
      lib.Debuger.trace(testa);
      if((target.isBFTeamSlot == true || target._parent.hit.isBFTeamSlot == true || target._parent.index != undefined) && dragTargetSlot != target._parent && PartyRaidMaster && target._parent._parent._parent._name == UIname)
      {
         setSlotState(target._parent,3);
         dropTargetSlot = target._parent;
         dragSlotMc.removeMovieClip();
         ToGame_PartyWindowRaidConfig_SwapElement(dragTargetSlot.index,dropTargetSlot.index);
      }
      else
      {
         moveAni(dragSlotMc,dragTargetSlot,2);
      }
   }
};
mouseListner2.onMouseMove = function()
{
   if(isDrag)
   {
      var _loc1_ = Mouse.getTopMostEntity(_level0._xmouse,_level0._ymouse);
      if((_loc1_.isBFTeamSlot == true || _loc1_._parent.hit.isBFTeamSlot == true) && dragTargetSlot != _loc1_._parent && PartyRaidMaster)
      {
         setSlotState(overClip,1);
         setSlotState(_loc1_._parent,2);
         overClip = _loc1_._parent;
      }
      else
      {
         setSlotState(overClip,1);
         overClip = undefined;
      }
   }
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && !isDrag)
   {
      if((target.isBFTeamSlot == true || target._parent.hit.isBFTeamSlot == true) && PartyRaidMaster)
      {
         if(PartyRaidObjects[target._parent._name] == target._parent && target._parent != undefined)
         {
            getURL("FSCommand:ToGame_PartyWindowRaidConfig_InteractionMenu",target._parent.index);
         }
      }
   }
};
PartyWindowRaidConfig_PartyRaidTabCheck("1\t1\t1\t1\t1\t1");
PartyWindowRaidConfig_SoltListClear();
myListener.OnGame_PartyWindowRaidConfig_SetTextData();
myListener.OnGame_PartyWindowRaidConfig_Setinit(0);
myListener.OnGame_PartyWindowRaidConfig_PartyRaidBtn(0);
x_btn.setRelease(ToGame_PartyWindowRaidConfig_CloseUI);
PartyRaidConfig_Btn0.setRelease(ToGame_PartyWindowRaidConfig_StartUI);
PartyRaidConfig_Btn1.setRelease(ToGame_PartyWindowRaidConfig_CancelUI);
PartyRaidConfig_Btn2.setRelease(ToGame_PartyWindowRaidConfig_OkUI);
PartyRaidConfig_Btn3.setRelease(ToGame_PartyWindowRaidConfig_InviteUI);
PartyRaidConfig_Btn0.setEnabled(false);
PartyRaidConfig_Btn1.setEnabled(false);
PartyRaidConfig_Btn2.setEnabled(false);
PartyRaidConfig_Btn3.setEnabled(false);
Mouse.addListener(mouseListner2);
ToGame_PartyWindowRaidConfig_Init();
