function SetDefaultSkillToolTip()
{
   var _loc4_ = a_SkillToolTipId.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc3_ = a_SkillToolTipId[_loc1_];
      var _loc2_ = lib.util.UIString.getUIString(_loc3_);
      a_SkillToolTipData.push(_loc2_);
      _loc1_ = _loc1_ + 1;
   }
}
function SetClassSkill(m_ParentMc, n_Index, bAwaken)
{
   var _loc10_ = !bAwaken?MaxSkillSlotCount_Normal:MaxSkillSlotCount_Awaken;
   var _loc3_ = 0;
   while(_loc3_ < _loc10_)
   {
      var _loc2_ = m_ParentMc["Slot" + _loc3_];
      var _loc4_ = _loc3_ * 2;
      var _loc5_ = a_SkillData[n_Index][_loc4_];
      var _loc7_ = a_SkillData[n_Index][_loc4_ + 1];
      _loc2_.draw(_loc7_);
      _loc2_.SLOT.enabled = false;
      _loc2_.drag = false;
      _loc2_.BG_FRAME.gotoAndStop(1);
      var _loc6_ = !requestClassSkillToolTip?1:100;
      var _loc8_ = !requestClassSkillToolTip?_loc5_:"ToGame_CreateCharacter_RequestClassSkillTooltip\t" + _loc5_;
      lib.manager.ToolTip.add(_loc2_.SLOT,_loc8_,_loc6_);
      _loc3_ = _loc3_ + 1;
   }
   var n_Delay = 0;
   lib.net.NetConnect.StopVideo();
   m_ParentMc.videoMc._visible = false;
   m_ParentMc.onEnterFrame = function()
   {
      n_Delay++;
      if(n_Delay == 5)
      {
         var _loc3_ = a_GageData[n_Index];
         if(_loc3_)
         {
            var _loc2_ = _loc3_.split("\t");
            this.gageTxt0.text = _loc2_[0];
            this.gageBar0._xscale = _loc2_[1];
            this.gageTxt1.text = _loc2_[2];
            this.gageBar1._xscale = _loc2_[3];
            this.gageTxt2.text = _loc2_[4];
            this.gageBar2._xscale = _loc2_[5];
            if(_loc2_[6])
            {
               this.gageBar3._visible = true;
               this.gageBg3._visible = true;
               this.gageTxt3.text = _loc2_[6];
               this.gageBar3._xscale = _loc2_[7];
            }
            else
            {
               this.gageTxt3.text = "";
               this.gageBar3._visible = false;
               this.gageBg3._visible = false;
            }
         }
      }
      if(n_Delay == 20)
      {
         ClassMovie(this.videoMc,n_Index);
      }
      if(n_Delay > 25)
      {
         delete this.onEnterFrame;
         this.videoMc._visible = true;
         n_Delay = 0;
      }
   };
}
function SetRaceSKill(m_ParentMc, n_Index)
{
   var _loc5_ = a_TribeData[n_Index];
   var _loc2_ = 0;
   while(_loc2_ < 4)
   {
      var _loc1_ = m_ParentMc["Slot" + _loc2_];
      var _loc3_ = _loc5_[_loc2_ + 4];
      var _loc4_ = lib.util.UIString.getUIString(_loc5_[_loc2_]);
      _loc1_.draw(_loc3_);
      _loc1_.SLOT.enabled = false;
      _loc1_.drag = false;
      _loc1_.BG_FRAME.gotoAndStop(1);
      lib.manager.ToolTip.add(_loc1_.SLOT,_loc4_,1);
      _loc2_ = _loc2_ + 1;
   }
}
function FrameStart()
{
   if(b_initCheck)
   {
      return undefined;
   }
   b_initCheck = true;
   SetInit();
   SetButton();
   btmMc._alpha = 0;
   ToGame_CreateCharacter_Init();
}
function FrameAnimation()
{
   if(b_initAni)
   {
      return undefined;
   }
   b_initAni = true;
   if(s_CreateMode == "Select")
   {
      SelectMode();
   }
   else
   {
      CustomMode();
   }
   btmMc._alpha = 0;
   gs.TweenLite.to(btmMc,1,{delay:2,_alpha:100,ease:gs.easing.Strong.easeOut});
}
function SetInit()
{
   btmMc.btn0._visible = false;
   btmMc.btn1._visible = false;
   SetVisible("Select",false);
   SetVisible("Custom",false);
}
function SetVisible(s_Mode, b_Visible)
{
   if(s_Mode == "Select")
   {
      rMc._visible = b_Visible;
      cMc._visible = b_Visible;
   }
   else if(s_Mode == "Custom")
   {
      customListMc._visible = b_Visible;
      nameTitleMc._visible = b_Visible;
      displayMc._visible = b_Visible;
      customInfoMc._visible = b_Visible;
      groupBox._visible = b_Visible;
      sliderBox._visible = b_Visible;
      dragBlockBtn._visible = b_Visible;
      btmMc.resetContainer._visible = b_Visible;
   }
}
function LoadComplete(s_Mode)
{
   btmMc.btn0._visible = true;
   btmMc.btn1._visible = true;
   if(s_Mode == "Select")
   {
      btmMc.btn1.gotoAndStop(1);
      btmMc.btn1.txt.textColor = "0xFFFFFF";
      btmMc.btn1.txt.text = a_BtnTextArr[1];
   }
   else if(s_Mode == "Custom")
   {
      if(Additional_Index > -1)
      {
         btmMc.btn1.gotoAndStop(1);
         btmMc.btn1.txt.textColor = "0xFFFFFF";
      }
      else
      {
         btmMc.btn1.gotoAndStop(15);
         btmMc.btn1.txt.textColor = "0x666666";
      }
      btmMc.btn1.txt.text = a_BtnTextArr[2];
   }
}
function SelectMode()
{
   SetVisible("Select",true);
   DisableUI_Select(false);
   btmMc.nameInputMc._alpha = 0;
   rMc._alpha = 0;
   cMc._alpha = 0;
   rMc.bg0._x = -340;
   cMc.bg0._x = 350;
   rMc.bg0._alpha = 100;
   cMc.bg0._alpha = 100;
   rMc.bg1._x = -340;
   cMc.bg1._x = 350;
   rMc.bg1._alpha = 30;
   cMc.bg1._alpha = 30;
   rMc.bg1.listMc._alpha = 0;
   cMc.bg1.listMc._alpha = 0;
   rMc.bgChange = 0;
   cMc.bgChange = 0;
   rMc.bg0.listMc.gotoAndStop(Number(m_RNum) + 1);
   cMc.bg0.listMc.gotoAndStop(Number(m_CNum) + 1);
   SetSexBtn(m_RNum);
   gs.TweenLite.to(UI.rMc,1,{delay:1,_alpha:100,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(UI.cMc,1,{delay:1,_alpha:100,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(UI.rMc.bg0,1,{delay:1,_x:0,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(UI.cMc.bg0,1,{delay:1,_x:0,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(UI.rMc.bg0.listMc,0.5,{delay:1.5,_alpha:100,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(UI.cMc.bg0.listMc,0.5,{delay:1.5,_alpha:100,ease:gs.easing.Strong.easeOut,onComplete:LoadComplete,onCompleteParams:["Select"]});
}
function CustomMode()
{
   nameTitleMc.nameFd.htmlText = "";
   btmMc.nameInputMc.txt1.text = "";
   SetVisible("Custom",true);
   DisableUI_Custom(false);
   CustomClick(0);
   m_NameField.__set__caption(s_DefaultName);
   customListMc._alpha = 0;
   nameTitleMc._alpha = 0;
   displayMc._alpha = 0;
   customInfoMc._alpha = 0;
   dragBlockBtn._alpha = 0;
   customListMc._x = -340;
   customInfoMc._x = -340;
   gs.TweenLite.to(customListMc,0.8,{delay:1.5,_x:0,_alpha:100,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(customInfoMc,0.8,{delay:2,_x:0,_alpha:100,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(btmMc.nameInputMc,0.8,{delay:2,_alpha:100,ease:gs.easing.Strong.easeOut,onComplete:LoadComplete,onCompleteParams:["Custom"]});
   customListMc.btn0.txt.text = a_BtnTextArr2[0];
   if(m_RNum == "4")
   {
      customListMc.btn1.txt.text = a_BtnTextArr2[1];
   }
   else
   {
      customListMc.btn1.txt.text = a_BtnTextArr2[7];
   }
   if(Additional_Index < 3)
   {
      m_CustomFocus.gotoAndStop(1);
      m_CustomFocus = customListMc.btn0;
      m_CustomFocus.gotoAndStop(3);
      if(m_RNum == "6")
      {
         customListMc.btn1.gotoAndStop(4);
         customListMc.btn1.txt.textColor = "0x666666";
      }
      else
      {
         customListMc.btn1.gotoAndStop(1);
         customListMc.btn1.txt.textColor = "0xFFFFFF";
      }
   }
   customListMc.btn2.txt.text = a_BtnTextArr2[2];
   customListMc.btn3.txt.text = a_BtnTextArr2[3];
   customListMc.btn4.txt.text = a_BtnTextArr2[4];
   customListMc.btn5.txt.text = a_BtnTextArr2[5];
   customListMc.btn6.txt.text = a_BtnTextArr2[6];
   customGrideInit();
}
function SetClassListState(parentMc, bAwaken)
{
   var _loc2_ = parentMc.listMc;
   _loc2_.awakenTxt._visible = bAwaken;
   _loc2_.Slot3._visible = bAwaken;
   _loc2_.Slot4._visible = bAwaken;
   _loc2_.Slot5._visible = bAwaken;
   var _loc6_ = !bAwaken?TxtStart_Normal:TxtStart_Awaken;
   var _loc7_ = !bAwaken?BarStart_Normal:BarStart_Awaken;
   var _loc5_ = !bAwaken?BgStart_Normal:BgStart_Awaken;
   var _loc1_ = 0;
   while(_loc1_ < 4)
   {
      _loc2_["gageTxt" + _loc1_]._y = _loc6_ + _loc1_ * 23;
      _loc2_["gageBar" + _loc1_]._y = _loc7_ + _loc1_ * 22;
      _loc2_["gageBg" + _loc1_]._y = _loc5_ + _loc1_ * 22;
      _loc1_ = _loc1_ + 1;
   }
   _loc2_.normalTxt._y = !bAwaken?448:415;
   var _loc3_ = 0;
   while(_loc3_ < 3)
   {
      _loc2_["Slot" + _loc3_]._y = !bAwaken?438:405;
      _loc3_ = _loc3_ + 1;
   }
   _loc2_.bg._y = !bAwaken?330:304;
   _loc2_.bg._height = !bAwaken?192:208;
   _loc2_.deco._visible = false == bAwaken;
   _loc2_.awakenIconMc._visible = bAwaken;
   _loc2_.awakenIconMc.gotoAndStop(1);
   if(bAwaken)
   {
      gs.TweenLite.to(_loc2_.awakenIconMc,1,{onComplete:awakenIconEvent,onCompleteParams:[_loc2_.awakenIconMc]});
   }
}
function EndMode(s_Mode)
{
   btmMc.btn0._visible = false;
   btmMc.btn1._visible = false;
   btmMc.resetContainer._visible = false;
   if(s_Mode == "Select")
   {
      DisableUI_Select(true);
      var _loc1_ = rMc["bg" + rMc.bgChange];
      gs.TweenLite.to(_loc1_,0.8,{_x:-340,_alpha:0,ease:gs.easing.Strong.easeIn});
      var _loc2_ = cMc["bg" + cMc.bgChange];
      gs.TweenLite.to(_loc2_,0.8,{_x:350,_alpha:0,ease:gs.easing.Strong.easeIn});
      gs.TweenLite.to(UI.rMc,0.8,{_alpha:0,ease:gs.easing.Strong.easeIn});
      gs.TweenLite.to(UI.cMc,0.8,{_alpha:0,ease:gs.easing.Strong.easeIn,onComplete:SetVisible,onCompleteParams:["Select",false]});
   }
   else if(s_Mode == "Custom")
   {
      DisableUI_Custom(true);
      gs.TweenLite.to(customListMc,0.8,{_x:-340,_alpha:0,ease:gs.easing.Strong.easeIn});
      gs.TweenLite.to(customInfoMc,0.8,{_x:-340,_alpha:0,ease:gs.easing.Strong.easeIn});
      gs.TweenLite.to(btmMc.nameInputMc,0.8,{_alpha:0,ease:gs.easing.Strong.easeIn,onComplete:SetVisible,onCompleteParams:["Custom",false]});
   }
}
function ClickLocKDelay()
{
   gs.TweenLite.to(btmMc,0.5,{onComplete:ClickLocKOff});
}
function ClickLocKOff()
{
   _root.setDisableUI(btmMc,false);
   s_ClickLock = false;
}
function ClassMovie(m_Target, n_Idx)
{
   var _loc1_ = "/Class" + n_Idx;
   lib.net.NetConnect.NetConnectVideo(m_Target);
   lib.net.NetConnect.PlayVideo(_loc1_);
}
function awakenIconEvent(mc)
{
   mc.gotoAndPlay(2);
}
function SelectAnimation(m_Target, n_Pos, n_Idx)
{
   _root.setDisableUI(btmMc,true);
   var _loc4_ = m_Target["bg" + m_Target.bgChange];
   gs.TweenLite.to(_loc4_,0.8,{delay:0.1,_x:n_Pos,_alpha:30,ease:gs.easing.Strong.easeIn,onComplete:ClickLocKDelay});
   gs.TweenLite.to(_loc4_.listMc,0.8,{delay:0.1,_alpha:0,ease:gs.easing.Strong.easeIn});
   m_Target.bgChange = (m_Target.bgChange + 1) % 2;
   var _loc3_ = m_Target["bg" + m_Target.bgChange];
   _loc3_.listMc.gotoAndStop(Number(n_Idx) + 1);
   gs.TweenLite.to(_loc3_,1,{delay:0.4,_x:0,_alpha:100,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(_loc3_.listMc,1.5,{delay:0.8,_alpha:100,ease:gs.easing.Strong.easeOut});
}
function SetButton()
{
   var _loc6_ = 0;
   var _loc5_ = 0;
   var _loc8_ = 0;
   var _loc9_ = 0;
   _loc6_ = 0;
   while(_loc6_ < RLEN)
   {
      var _loc3_ = rMc["btn" + _loc6_];
      _loc3_.idx = a_RaceNum[_loc6_];
      _loc3_.mark.gotoAndStop(_loc6_ + 1);
      _loc3_.effect.gotoAndStop(_loc6_ + 1);
      lib.manager.ToolTip.add(_loc3_,a_RaceArr[_loc6_],1);
      _loc3_.onRollOver = function()
      {
         if(m_RFocus == this || this._alpha < 90)
         {
            return undefined;
         }
         Sound_Play();
         lib.util.FrameSeeker.seek(this,1,12);
      };
      _loc3_.onRollOut = _loc3_.onReleaseOutside = function()
      {
         if(m_RFocus == this || this._alpha < 90)
         {
            return undefined;
         }
         lib.util.FrameSeeker.seek(this,12,1);
      };
      _loc3_.onRelease = function()
      {
         if(m_RFocus == this || s_ClickLock || this._alpha < 90)
         {
            return undefined;
         }
         Sound_Play2();
         s_ClickLock = true;
         lib.util.FrameSeeker.seek(m_RFocus,12,1);
         if(this._alpha == 100)
         {
            m_RFocus = this;
            SelectAnimation(rMc,-340,this.idx);
            gs.TweenLite.to(this,0.2,{onComplete:ToGame_CreateCharacter_SelectRace,onCompleteParams:[this.idx,1]});
         }
         else
         {
            gs.TweenLite.to(this,0.2,{onComplete:ToGame_CreateCharacter_SelectRace,onCompleteParams:[this.idx,0]});
            ClickLocKOff();
         }
      };
      _loc6_ = _loc6_ + 1;
   }
   _loc5_ = 0;
   while(_loc5_ < CLEN)
   {
      var _loc2_ = cMc["btn" + _loc5_];
      _loc2_.idx = a_ClassNum[_loc5_];
      _loc2_.mark.gotoAndStop(_loc5_ + 1);
      _loc2_.effect.gotoAndStop(_loc5_ + 1);
      _loc2_.bAwaken = false;
      _loc2_.awakenIcon._visible = false;
      _loc2_.awakenIcon.gotoAndStop(1);
      lib.manager.ToolTip.add(_loc2_,a_ClassArr[_loc5_],1);
      _loc2_.onRollOver = function()
      {
         if(m_CFocus == this || this._alpha < 90)
         {
            return undefined;
         }
         Sound_Play();
         this.gotoAndStop(1);
         this.effect.gotoAndStop(this.idx + 1);
         lib.util.FrameSeeker.seek(this,1,12);
      };
      _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
      {
         if(m_CFocus == this || this._alpha < 90)
         {
            return undefined;
         }
         this.gotoAndStop(12);
         this.effect.gotoAndStop(this.idx + 1);
         lib.util.FrameSeeker.seek(this,12,1);
      };
      _loc2_.onRelease = function()
      {
         if(m_CFocus == this || s_ClickLock || this._alpha < 90)
         {
            return undefined;
         }
         Sound_Play2();
         s_ClickLock = true;
         if(this._alpha == 100)
         {
            m_CFocus.gotoAndStop(12);
            m_CFocus.effect.gotoAndStop(m_CFocus.idx + 1);
            lib.util.FrameSeeker.seek(m_CFocus,12,1);
            m_CFocus = this;
            SelectAnimation(cMc,350,this.idx);
            setClassListState(cMc["bg" + cMc.bgChange],this.bAwaken);
            gs.TweenLite.to(this,0.2,{onComplete:ToGame_CreateCharacter_SelectClass,onCompleteParams:[this.idx,1]});
         }
         else
         {
            gs.TweenLite.to(this,0.2,{onComplete:ToGame_CreateCharacter_SelectClass,onCompleteParams:[this.idx,0]});
            ClickLocKOff();
         }
      };
      _loc5_ = _loc5_ + 1;
   }
   _loc8_ = 0;
   while(_loc8_ < 2)
   {
      var _loc7_ = btmMc["btn" + _loc8_];
      _loc7_.txt.text = a_BtnTextArr[_loc8_];
      _loc7_.idx = _loc8_;
      _loc7_.onRollOver = function()
      {
         if(this._currentframe == 15)
         {
            return undefined;
         }
         Sound_Play();
         lib.util.FrameSeeker.seek(this,1,12);
      };
      _loc7_.onRollOut = _loc2_.onReleaseOutside = function()
      {
         if(this._currentframe == 15)
         {
            return undefined;
         }
         lib.util.FrameSeeker.seek(this,12,1);
      };
      _loc7_.onRelease = function()
      {
         if(this._currentframe == 15)
         {
            return undefined;
         }
         ButtonEvent(this);
      };
      _loc8_ = _loc8_ + 1;
   }
   _loc9_ = 0;
   while(_loc9_ < 7)
   {
      var _loc4_ = customListMc["btn" + _loc9_];
      _loc4_.idx = _loc9_;
      _loc4_.bEnabled = true;
      _loc4_.onRollOver = function()
      {
         if(this._currentframe == 4 || m_CustomFocus == this)
         {
            return undefined;
         }
         this.gotoAndStop(2);
         Sound_Play();
         lib.util.FrameSeeker.seek(this.overAni,1,6);
      };
      _loc4_.onRollOut = _loc4_.onReleaseOutside = function()
      {
         if(this._currentframe == 4 || m_CustomFocus == this)
         {
            return undefined;
         }
         this.gotoAndStop(1);
         lib.util.FrameSeeker.seek(this.overAni,6,1);
      };
      _loc4_.onPress = function()
      {
         if(this._currentframe == 4 || m_CustomFocus == this)
         {
            return undefined;
         }
         this.gotoAndStop(3);
      };
      _loc4_.onRelease = function()
      {
         if(this._currentframe == 4 || m_CustomFocus == this)
         {
            return undefined;
         }
         m_CustomFocus.gotoAndStop(1);
         lib.util.FrameSeeker.seek(m_CustomFocus.overAni,6,1);
         m_CustomFocus = this;
         CustomClick(this.idx);
      };
      _loc9_ = _loc9_ + 1;
   }
   SetSexBtn(0,"init");
}
function PopUpButton(m_Mc, sType, n_Idx)
{
   m_Mc.setRelease(function()
   {
      ToGame_CreateCharacter_PopupClick(sType,n_Idx);
   }
   );
}
function ToGame_CreateCharacter_PopupClick(s_Type, s_Index)
{
   var _loc5_ = lib.util.ExtString.split(a_PopUpSelectRace[s_Type],"\t");
   var _loc3_ = _loc5_[s_Index];
   var _loc2_ = a_PopUpSelectClass[s_Type];
   var _loc1_ = cMc["btn" + _loc2_];
   if(_loc1_._alpha > 80)
   {
      s_ClickLock = true;
      SelectAnimation(rMc,-340,_loc3_);
      SelectAnimation(cMc,350,_loc2_);
      setClassListState(cMc["bg" + cMc.bgChange],_loc1_.bAwaken);
   }
   getURL("FSCommand:ToGame_CreateCharacter_PopupClick",s_Type + "\t" + s_Index);
}
function ToGame_CreateCharacter_PopupClose()
{
   fscommand("ToGame_CreateCharacter_PopupClose");
}
function ToGame_CreateCharacter_SelectRace(s_Num)
{
   getURL("FSCommand:ToGame_CreateCharacter_SelectRace",s_Num);
}
function ToGame_CreateCharacter_SelectClass(s_Num, n_Mode)
{
   getURL("FSCommand:ToGame_CreateCharacter_SelectClass",s_Num + " \t " + n_Mode);
}
function ToGame_CreateCharacter_SelectSex(s_Num)
{
   _root.setDisableUI(btmMc,true);
   gs.TweenLite.to(btmMc,0.9,{onComplete:ClickLocKOff});
   getURL("FSCommand:ToGame_CreateCharacter_SelectSex",s_Num);
}
function ToGame_CreateCharacter_CreateConfirm()
{
   fscommand("ToGame_CreateCharacter_CreateConfirm");
}
function ToGame_CreateCharacter_Close()
{
   fscommand("ToGame_CreateCharacter_Close");
   fscommand("ToGame_CreateCharacter_CancelRace");
}
function ToGame_CreateCharacter_GotoCustomizing()
{
   fscommand("ToGame_CreateCharacter_GotoCustomizing");
}
function ToGame_CreateCharacter_CancelCustomize()
{
   fscommand("ToGame_CreateCharacter_CancelCustomize_Popup");
}
function ToGame_CreateCharacter_Init()
{
   fscommand("ToGame_CreateCharacter_Init");
}
function ToGame_CreateCharacter_CheckName(s_InputName)
{
   getURL("FSCommand:ToGame_CreateCharacter_CheckName",s_InputName);
}
function ToGame_CreateCharacter_PreviewOutfit()
{
   fscommand("ToGame_CreateCharacter_PreviewOutfit");
}
function ClassLockGuide(s_Idx, n_Mode)
{
   var _loc3_ = a_ClassLockGuide[s_Idx].split("\t");
   var _loc4_ = _loc3_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc4_)
   {
      var _loc1_ = rMc["btn" + _loc3_[_loc2_]];
      if(n_Mode == "1")
      {
         if(_loc1_._currentframe == 1)
         {
            _loc1_.gotoAndPlay(20);
         }
      }
      else if(_loc1_._currentframe > 19)
      {
         _loc1_.gotoAndStop(1);
      }
      _loc2_ = _loc2_ + 1;
   }
}
function SetButton3(mc0, mc1, num)
{
   mc0.onRollOver = function()
   {
      if(this._currentframe > 12)
      {
         return undefined;
      }
      lib.util.FrameSeeker.seek(this,1,12);
   };
   mc0.onRollOut = mc0.onReleaseOutside = function()
   {
      if(this._currentframe > 12)
      {
         return undefined;
      }
      lib.util.FrameSeeker.seek(this,12,1);
   };
   mc0.onRelease = function()
   {
      if(this._currentframe > 12 || s_ClickLock)
      {
         return undefined;
      }
      this.gotoAndStop(13);
      s_ClickLock = true;
      gs.TweenLite.to(this,0.9,{onComplete:ClickLocKOff});
      lib.util.FrameSeeker.seek(mc1,12,1);
      ToGame_CreateCharacter_SelectSex(num);
   };
}
function SetSexBtn(num, s_Mode)
{
   if(s_Mode == "init")
   {
      SetButton3(rMc.bg0.listMc.btn0,rMc.bg0.listMc.btn1,0);
      SetButton3(rMc.bg0.listMc.btn1,rMc.bg0.listMc.btn0,1);
      SetButton3(rMc.bg1.listMc.btn0,rMc.bg1.listMc.btn1,0);
      SetButton3(rMc.bg1.listMc.btn1,rMc.bg1.listMc.btn0,1);
   }
   else
   {
      var _loc1_ = rMc["bg" + rMc.bgChange];
      if(num < 4)
      {
         _loc1_.listMc.btn0._visible = true;
         _loc1_.listMc.btn1._visible = true;
      }
      else
      {
         _loc1_.listMc.btn0._visible = false;
         _loc1_.listMc.btn1._visible = false;
      }
   }
}
function Sound_Play()
{
   lib.manager.UISound.play(3101);
}
function Sound_Play2()
{
   lib.manager.UISound.play(3102);
}
function CustomClick(num)
{
   if(num == 0)
   {
      custom_silder_check2 = true;
      selectCustom(4);
   }
   else if(num == 1)
   {
      selectCustom(3);
   }
   else if(num == 2)
   {
      custom_silder_check2 = true;
      selectCustom(0);
   }
   else if(num == 3)
   {
      selectCustom(2);
   }
   else if(num == 4)
   {
      custom_silder_check2 = false;
      selectBoneGroup(0);
      selectCustom(1);
   }
   else if(num == 5)
   {
      selectCustom(5);
   }
   else if(num == 6)
   {
      selectCustom(6);
   }
}
function ButtonEvent(m_btn)
{
   var _loc1_ = m_btn.idx;
   if(_loc1_ == "0")
   {
      if(s_CreateMode == "Select")
      {
         m_btn._visible = false;
         EndMode("Select");
         ToGame_CreateCharacter_Close();
      }
      else if(s_CreateMode == "Custom")
      {
         ToGame_CreateCharacter_CancelCustomize();
      }
   }
   else if(_loc1_ == "1")
   {
      if(s_CreateMode == "Select")
      {
         EndMode("Select");
         s_CreateMode = "Custom";
         CustomMode();
         ToGame_CreateCharacter_GotoCustomizing();
      }
      else if(s_CreateMode == "Custom")
      {
         if(Additional_Index == -1 || Additional_Index == 4)
         {
            EndMode("Custom");
            EndCreate = true;
         }
         if(nameTitleMc._visible)
         {
            ToGame_CreateCharacter_CreateConfirm();
         }
      }
   }
}
function grideBuild(tg, listData, selectedItemID, bVoice)
{
   var _loc28_ = 0;
   var _loc29_ = tg._name;
   var grideMc = tg;
   var _loc11_ = 64;
   var _loc10_ = 64;
   var ROWS = CSROWSSIZE;
   var _loc33_ = 0;
   if(bVoice)
   {
      var _loc21_ = 1;
      var _loc20_ = 1;
   }
   grideMc.CSROWSSIZE = CSROWSSIZE;
   grideMc.multi = false;
   if(_loc29_ == "slotGrideMc1" || _loc29_ == "slotGrideMc6")
   {
      _loc11_ = 28;
      _loc10_ = 28;
      ROWS = CSROWSSIZE2;
      _loc33_ = 0;
      grideMc.CSROWSSIZE = CSROWSSIZE2;
      grideMc.multi = true;
   }
   var _loc37_ = 30;
   var _loc35_ = 6;
   grideClear(grideMc);
   grideMc.totalCount = listData.length;
   if(listData.length == 0)
   {
      if(_loc29_ == "slotGrideMc9" || _loc29_ == "slotGrideMc1" || _loc29_ == "slotGrideMc6" || _loc29_ == "slotGrideMc4")
      {
         grideMc.preBtn._visible = false;
         grideMc.nextBtn._visible = false;
      }
      else
      {
         grideMc.preBtn._alpha = 0;
         grideMc.nextBtn._alpha = 0;
         gs.TweenLite.to(grideMc.preBtn,0.1,{delay:0.5,_alpha:100,ease:gs.easing.Strong.easeOut});
         gs.TweenLite.to(grideMc.nextBtn,0.1,{delay:0.5,_alpha:100,ease:gs.easing.Strong.easeOut});
      }
      return undefined;
   }
   grideMc.scrollMax = Math.max(grideMc.totalCount,0);
   grideMc.scrollWidth = grideMc.slotWidth + _loc33_;
   grideMc.scrolls = 0;
   grideMc.distance = 0;
   var _loc4_ = 0;
   while(_loc4_ < grideMc.totalCount)
   {
      var _loc8_ = undefined;
      if(_loc4_ == 0)
      {
         _loc8_ = grideMc.containerMc.slot0;
         grideMc.containerMc.slot0._visible = true;
         delete register8.bPreview;
      }
      else
      {
         _loc8_ = grideMc.containerMc.slot0.duplicateMovieClip("slot" + _loc4_,grideMc.containerMc.getNextHighestDepth());
      }
      _loc8_._visible = true;
      gs.TweenLite.killTweensOf(_loc8_,false);
      var _loc14_ = !grideMc.multi?0:int(_loc4_ / grideMc.CSROWSSIZE);
      var _loc13_ = !grideMc.multi?_loc4_:_loc4_ % MULTISIZE;
      var _loc12_ = !grideMc.multi?0:int(_loc4_ / MULTISIZE) % 2;
      _loc8_._x = grideMc.slotStartX + grideMc.scrollWidth * (_loc13_ + MULTISIZE * _loc14_);
      _loc8_._y = grideMc.slotStartY + _loc12_ * CSSLOTWIDTH2;
      _loc8_.id = listData[_loc4_].id;
      _loc8_.index = _loc4_;
      if(bVoice)
      {
         _loc8_.voiceIndex = listData[_loc4_].voiceIndex;
         _loc8_.bPreview = listData[_loc4_].bPreview;
         var _loc16_ = listData[_loc4_].bExtra;
         if(_loc16_)
         {
            _loc8_.txt.text = "Extra" + _loc20_;
            _loc20_ = _loc20_ + 1;
         }
         else
         {
            _loc8_.txt.text = _loc21_;
            _loc21_ = _loc21_ + 1;
         }
      }
      else
      {
         _loc8_.index = _loc4_;
         _loc8_.txt.text = _loc4_ + 1;
      }
      _loc8_.iconMc.clear();
      lib.util.DrawBitmap.clear(_loc8_.iconMc);
      var _loc6_ = listData[_loc4_].img;
      if(_loc6_ == null || _loc6_.length == 0 || _loc6_ == 0 || _loc6_ == "0")
      {
         var _loc15_ = convertColorValue(listData[_loc4_].color);
         _loc8_.iconMc.beginFill(_loc15_,100);
         _loc8_.iconMc.moveTo(0,0);
         _loc8_.iconMc.lineTo(_loc11_,0);
         _loc8_.iconMc.lineTo(_loc11_,_loc10_);
         _loc8_.iconMc.lineTo(0,_loc10_);
         _loc8_.iconMc.lineTo(0,0);
         _loc8_.iconMc.endFill();
      }
      else
      {
         lib.util.DrawBitmap.draw(_loc8_.iconMc,_loc6_,_loc11_,_loc10_);
      }
      _loc8_.onPress = function()
      {
         delete this.bgMc.overBg.onEnterFrame;
         calcVelo(this._parent._parent,true);
         if(bVoice && this.bPreview)
         {
            return undefined;
         }
         this.bgMc.gotoAndStop(3);
      };
      _loc8_.onRelease = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         delete this.bgMc.overBg.onEnterFrame;
         if(bVoice)
         {
            ToGame_CreateCharacter_SelectVoice(this.voiceIndex,this.bPreview);
         }
         else
         {
            ToGame_CreateCharacter_SelectCustomizing(grideMc.id,this.id);
         }
         if(bVoice && this.bPreview)
         {
            return undefined;
         }
         var _loc2_ = grideMc.selectSlot;
         grideMc.selectSlot = this;
         _loc2_.bgMc.gotoAndStop(1);
         grideMc.selectId = this.id;
         this.bgMc.gotoAndStop(4);
      };
      _loc8_.onRollOver = function()
      {
         delete this.bgMc.overBg.onEnterFrame;
         if(grideMc.selectSlot != this)
         {
            this.bgMc.gotoAndStop(2);
         }
         grideSlotOver(grideMc,this);
      };
      _loc8_.onReleaseOutside = function()
      {
         delete this.bgMc.overBg.onEnterFrame;
         calcVelo(this._parent._parent,false);
         if(grideMc.selectSlot != this)
         {
            this.bgMc.gotoAndStop(1);
         }
         grideSlotOut(grideMc,this);
      };
      _loc8_.onRollOut = function()
      {
         delete this.bgMc.overBg.onEnterFrame;
         if(grideMc.selectSlot != this)
         {
            this.bgMc.gotoAndStop(1);
         }
         grideSlotOut(grideMc,this);
      };
      if(selectedItemID == _loc8_.id)
      {
         var _loc17_ = grideMc.selectSlot;
         grideMc.selectSlot = _loc8_;
         _loc17_.onRollOut();
         grideMc.selectId = _loc8_.id;
         _loc8_.bgMc.gotoAndStop(4);
         _loc28_ = _loc4_;
      }
      _loc4_ = _loc4_ + 1;
   }
   grideMc.preBtn.onPress = function()
   {
      this.gotoAndStop(3);
   };
   grideMc.preBtn.onRelease = function()
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      this.gotoAndStop(4);
      delete this.onEnterFrame;
      grideMc.setScroll(grideMc.scrolls - ROWS);
      grideMc.setEndPosition();
   };
   grideMc.preBtn.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
   grideMc.preBtn.onRollOut = grideMc.preBtn.onReleaseOutside = function()
   {
      this.gotoAndStop(1);
      delete this.onEnterFrame;
   };
   grideMc.nextBtn.onPress = function()
   {
      this.gotoAndStop(3);
   };
   grideMc.nextBtn.onRelease = function()
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      delete this.onEnterFrame;
      this.gotoAndStop(4);
      grideMc.setScroll(grideMc.scrolls + ROWS);
      grideMc.setEndPosition();
   };
   grideMc.nextBtn.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
   grideMc.nextBtn.onRollOut = function()
   {
      this.gotoAndStop(1);
      delete this.onEnterFrame;
   };
   grideMc.setScroll = function(sc)
   {
      var _loc1_ = Math.max(sc,0);
      _loc1_ = Math.min(grideMc.scrollMax,_loc1_);
      grideMc.scrolls = _loc1_;
      grideMc.preBtn.gotoAndStop(1);
      grideMc.nextBtn.gotoAndStop(1);
      grideMc.preBtn.enabled = grideMc.scrolls > 0;
      grideMc.nextBtn.enabled = grideMc.scrolls + grideMc.CSROWSSIZE < grideMc.scrollMax;
      if(!grideMc.preBtn.enabled)
      {
         grideMc.preBtn.gotoAndStop(5);
      }
      if(!grideMc.nextBtn.enabled)
      {
         grideMc.nextBtn.gotoAndStop(5);
      }
   };
   grideMc.setEndPosition = function()
   {
      var _loc2_ = 0;
      while(_loc2_ < grideMc.totalCount)
      {
         var _loc5_ = grideMc.containerMc["slot" + _loc2_];
         var _loc9_ = _loc2_ - grideMc.scrolls;
         var _loc3_ = _loc9_ * grideMc.scrollWidth + grideMc.slotStartX;
         var _loc4_ = undefined;
         _loc5_._visible = true;
         if(grideMc.multi)
         {
            var _loc8_ = int(_loc2_ / grideMc.CSROWSSIZE);
            var _loc7_ = _loc2_ % MULTISIZE;
            _loc3_ = grideMc.slotStartX + grideMc.scrollWidth * (_loc7_ + MULTISIZE * _loc8_ - grideMc.scrolls / 2);
            _loc4_ = _loc2_ >= grideMc.scrolls && _loc2_ < grideMc.scrolls + grideMc.CSROWSSIZE;
            if(_loc2_ < grideMc.scrolls)
            {
               _loc3_ = grideMc.slotStartX - grideMc.scrollWidth - 150;
               _loc4_ = false;
            }
            else if(_loc2_ > grideMc.scrolls + grideMc.CSROWSSIZE)
            {
               _loc3_ = grideMc.slotStartX + grideMc.scrollWidth * (grideMc.CSROWSSIZE / 2 + 1) + 150;
               _loc4_ = false;
            }
            if(arguments[0] == 1)
            {
               _loc5_._x = _loc3_;
            }
            else
            {
               gs.TweenLite.to(_loc5_,0.3,{_x:_loc3_,ease:gs.easing.Strong.easeOut,overwrite:2,onComplete:finishEndPosition,onCompleteParams:[_loc5_,_loc4_]});
            }
         }
         else
         {
            _loc4_ = true;
            var _loc6_ = 100;
            if(_loc2_ < grideMc.scrolls)
            {
               _loc3_ = grideMc.slotStartX - grideMc.scrollWidth - 50;
               _loc4_ = false;
               _loc6_ = 0;
            }
            else if(_loc2_ > grideMc.scrolls + CSROWSSIZE)
            {
               _loc3_ = grideMc.slotStartX + grideMc.scrollWidth * (CSROWSSIZE + 1) + 50;
               _loc4_ = false;
               _loc6_ = 0;
            }
            if(arguments[0] == 1)
            {
               _loc5_._x = _loc3_;
            }
            else
            {
               gs.TweenLite.to(_loc5_,0.4,{_x:_loc3_,_alpha:_loc6_,ease:gs.easing.Strong.easeOut,overwrite:2,onComplete:finishEndPosition,onCompleteParams:[_loc5_,_loc4_]});
            }
         }
         _loc2_ = _loc2_ + 1;
      }
   };
   grideMc.setPosition = function(dist)
   {
      var _loc7_ = grideMc.distance - dist;
      var _loc6_ = 0;
      if(_loc7_ <= 0)
      {
         grideMc.distance = 0;
         _loc6_ = -10;
         grideMc.preBtn.onRelease();
      }
      else if(_loc7_ >= grideMc.scrollMax * grideMc.scrollWidth)
      {
         grideMc.distance = grideMc.scrollMax * grideMc.scrollWidth;
         _loc6_ = 10;
         grideMc.nextBtn.onRelease();
      }
      else
      {
         grideMc.distance = _loc7_;
      }
      grideMc.setScroll(Math.round(grideMc.distance / grideMc.scrollWidth));
      var _loc2_ = 0;
      while(_loc2_ < grideMc.totalCount)
      {
         var _loc3_ = grideMc.containerMc["slot" + _loc2_];
         _loc3_._visible = _loc2_ >= this.scrolls && _loc2_ < this.scrolls + this.CSROWSSIZE;
         if(grideMc.multi)
         {
            var _loc5_ = int(_loc2_ / grideMc.CSROWSSIZE);
            var _loc4_ = _loc2_ % MULTISIZE;
            _loc3_._x = grideMc.slotStartX + grideMc.scrollWidth * (_loc4_ + MULTISIZE * _loc5_) - grideMc.distance - _loc6_;
         }
         else
         {
            _loc3_._x = grideMc.slotStartX + _loc2_ * grideMc.scrollWidth - grideMc.distance - _loc6_;
         }
         _loc2_ = _loc2_ + 1;
      }
   };
   grideMc.setScroll(int(_loc28_ / ROWS) * ROWS);
   grideMc.setEndPosition(1);
}
function convertColorValue(value)
{
   if(value == null || value.length == 0)
   {
      return 0;
   }
   var _loc1_ = value.split(",");
   if(_loc1_.length != 3)
   {
      return 0;
   }
   return Number(_loc1_[0]) << 16 | Number(_loc1_[1]) << 8 | Number(_loc1_[2]);
}
function calcVelo(grideMc, flag)
{
   var _loc6_ = undefined;
   var _loc7_ = undefined;
   var _loc3_ = undefined;
   if(flag)
   {
      veloObj.mc = grideMc;
      veloObj.startTime = getTimer();
      veloObj.x = _level0._xmouse;
   }
   else if(veloObj != undefined && veloObj.mc == grideMc)
   {
      _loc3_ = getTimer();
      var _loc4_ = veloObj.x - _level0._xmouse;
      var _loc2_ = _loc4_ / (_loc3_ - veloObj.startTime);
      if(_loc2_ > 0.1 && grideMc.nextBtn.enabled)
      {
         grideMc.nextBtn.onRelease();
      }
      if(_loc2_ < -0.1 && grideMc.preBtn.enabled)
      {
         grideMc.preBtn.onRelease();
      }
      veloObj = {};
   }
}
function finishEndPosition(slotMc, flag)
{
   slotMc._visible = flag;
}
function grideSlotOver(grideMc, slot)
{
   if(isSliding)
   {
      return undefined;
   }
   var _loc8_ = slot.index;
   var _loc2_ = 0;
   while(_loc2_ < grideMc.totalCount)
   {
      var _loc6_ = grideMc.containerMc["slot" + _loc2_];
      var _loc3_ = undefined;
      var _loc5_ = 100;
      var _loc7_ = 0;
      var _loc4_ = Math.abs(_loc8_ - _loc2_);
      if(_loc8_ > _loc6_.index)
      {
         _loc3_ = (_loc2_ - grideMc.scrolls) * grideMc.scrollWidth - 1;
         _loc5_ = _loc5_ - 5 * _loc4_;
         _loc7_ = _loc4_ * 1.5;
      }
      else if(_loc8_ < _loc6_.index)
      {
         _loc3_ = (_loc2_ - grideMc.scrolls) * grideMc.scrollWidth + 1;
         _loc7_ = _loc4_ * 1.5;
         _loc5_ = _loc5_ - 5 * _loc4_;
      }
      else
      {
         _loc3_ = (_loc2_ - grideMc.scrolls) * grideMc.scrollWidth;
      }
      _loc3_ = (_loc2_ - grideMc.scrolls) * grideMc.scrollWidth;
      gs.TweenLite.to(_loc6_,0.4,{_x:_loc3_,_y:_loc7_,_xscale:_loc5_,_yscale:_loc5_,ease:gs.easing.Back.easeOut,overwrite:2});
      _loc2_ = _loc2_ + 1;
   }
}
function grideSlotOut(grideMc, slot)
{
   if(isSliding)
   {
      return undefined;
   }
   var _loc14_ = slot.index;
   var _loc1_ = 0;
   while(_loc1_ < grideMc.totalCount)
   {
      var _loc4_ = grideMc.containerMc["slot" + _loc1_];
      var _loc10_ = (_loc1_ - grideMc.scrolls) * grideMc.scrollWidth;
      var _loc5_ = 0;
      var _loc3_ = 100;
      var _loc11_ = Math.abs(_loc14_ - _loc1_);
      gs.TweenLite.to(_loc4_,0.6,{_y:_loc5_,_xscale:_loc3_,_yscale:_loc3_,ease:gs.easing.Strong.easeOut,delay:0.1,overwrite:2});
      _loc1_ = _loc1_ + 1;
   }
}
function grideClear(tg)
{
   var _loc2_ = tg;
   _loc2_.containerMc._x = 0;
   _loc2_.containerMc._y = 0;
   _loc2_.slotStartX = _loc2_.containerMc.slot0._x = 0;
   _loc2_.slotStartY = _loc2_.containerMc.slot0._y = 0;
   var _loc4_ = tg._name;
   _loc2_.slotWidth = CSSLOTWIDTH;
   if(_loc4_ == "slotGrideMc1" || _loc4_ == "slotGrideMc6")
   {
      _loc2_.slotWidth = CSSLOTWIDTH2;
   }
   _loc2_.containerMc.slot0._alpha = 100;
   _loc2_.containerMc.slot0._visible = false;
   var _loc1_ = 1;
   while(_loc1_ < _loc2_.totalCount)
   {
      var _loc3_ = _loc2_.containerMc["slot" + _loc1_];
      _loc3_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   _loc2_.totalCount = 0;
}
function grideNavigate(currentIndex, nextIndex)
{
   var _loc1_ = 0;
   while(_loc1_ <= 10)
   {
      customInfoMc["slotGrideMc" + _loc1_]._visible = false;
      _loc1_ = _loc1_ + 1;
   }
   switch(nextIndex)
   {
      case 0:
         customInfoMc.slotGrideMc0._visible = true;
         customInfoMc.slotGrideMc1._visible = true;
         slideCusSlot(customInfoMc.slotGrideMc0,0);
         slideCusSlot(customInfoMc.slotGrideMc1,1);
         break;
      case 2:
         customInfoMc.slotGrideMc3._visible = true;
         customInfoMc.slotGrideMc4._visible = true;
         slideCusSlot(customInfoMc.slotGrideMc3,0);
         slideCusSlot(customInfoMc.slotGrideMc4,1);
         break;
      case 3:
         customInfoMc.slotGrideMc5._visible = true;
         customInfoMc.slotGrideMc6._visible = true;
         slideCusSlot(customInfoMc.slotGrideMc5,0);
         slideCusSlot(customInfoMc.slotGrideMc6,1);
         break;
      case 5:
         customInfoMc.slotGrideMc8._visible = true;
         slideCusSlot(customInfoMc.slotGrideMc8,0);
         break;
      case 4:
         customInfoMc.slotGrideMc10._visible = true;
         customInfoMc.slotGrideMc9._visible = true;
         sliderBox._visible = false;
         slideCusSlot(customInfoMc.slotGrideMc10,0);
         slideCusSlot(customInfoMc.slotGrideMc9,-2);
   }
   isSliding = true;
}
function slideCusSlot(nextGride, index)
{
   var _loc2_ = nextGride.scrolls;
   while(_loc2_ < nextGride.totalCount)
   {
      var _loc3_ = nextGride.containerMc["slot" + _loc2_];
      var _loc6_ = undefined;
      var _loc7_ = undefined;
      if(nextGride.multi)
      {
         var _loc5_ = int(_loc2_ / grideMc.CSROWSSIZE);
         var _loc4_ = _loc2_ % MULTISIZE;
         _loc7_ = 0.005 * (_loc4_ + MULTISIZE * _loc5_);
         _loc3_._x = nextGride.slotStartX + nextGride.scrollWidth * (_loc4_ + MULTISIZE * _loc5_) + nextGride.scrollWidth;
         _loc5_ = int((_loc2_ - nextGride.scrolls) / grideMc.CSROWSSIZE);
         _loc4_ = (_loc2_ - nextGride.scrolls) % MULTISIZE;
         _loc6_ = nextGride.slotStartX + nextGride.scrollWidth * (_loc4_ + MULTISIZE * _loc5_);
      }
      else
      {
         _loc3_._x = nextGride.scrollWidth * _loc2_ + nextGride.slotStartX + nextGride.scrollWidth;
         _loc6_ = (_loc2_ - nextGride.scrolls) * nextGride.scrollWidth + nextGride.slotStartX;
         _loc7_ = 0.005 * (_loc2_ - nextGride.scrolls);
      }
      _loc3_._visible = _loc2_ >= nextGride.scrolls && _loc2_ < nextGride.scrolls + nextGride.CSROWSSIZE;
      gs.TweenLite.to(_loc3_,0.3,{_x:_loc6_,ease:gs.easing.Strong.easeOut,delay:_loc7_});
      _loc2_ = _loc2_ + 1;
   }
}
function selectCustom(index)
{
   customInfoMc.bg.gotoAndStop(Number(index) + 1);
   if(index == 0 || index == 2 || index == 3 || index == 4 || index == 5 || index == 6)
   {
      customInfoMc_Check = true;
   }
   else
   {
      customInfoMc_Check = false;
   }
   var _loc2_ = customInfoMc.slotGrideMc6;
   if(index == 3)
   {
      if(_loc2_.totalCount < 37)
      {
         _loc2_.preBtn._visible = false;
         _loc2_.nextBtn._visible = false;
      }
      else
      {
         _loc2_.preBtn._visible = true;
         _loc2_.nextBtn._visible = true;
      }
   }
   showVoiceCustom(index == 6);
   customInfoMc.presetSlider._visible = index == 20;
   if(m_RNum == 4)
   {
      if(index == 3)
      {
         customInfoMc.bg.gotoAndStop(2);
         grideNavigate(customInfoMc._currentframe - 2,Number(index));
      }
      else
      {
         grideNavigate(customInfoMc._currentframe - 2,Number(index));
      }
   }
   else
   {
      grideNavigate(customInfoMc._currentframe - 2,Number(index));
   }
   if(index == 5)
   {
      ToGame_CreateCharacter_PreviewOutfit();
   }
   nameCheckPop(false);
   showBoneCustom(index == 1);
}
function basicCustom()
{
   var _loc2_ = btmMc.resetContainer;
   _loc2_.txt.text = a_BtnTextArr[3];
   _loc2_.onRollOver = function()
   {
      lib.util.FrameSeeker.seek(this,1,12);
   };
   _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
   {
      lib.util.FrameSeeker.seek(this,12,1);
   };
   _loc2_.onRelease = function()
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      ToGame_CreateCharacter_ResetFaceDetail();
   };
}
function clearBoneGroup()
{
   sliderGroup = {};
   for(var _loc1_ in groupBox)
   {
      if(typeof groupBox[_loc1_] == "movieclip")
      {
         groupBox[_loc1_].removeMovieClip();
      }
   }
   for(var _loc1_ in sliderBox)
   {
      if(typeof sliderBox[_loc1_] == "movieclip")
      {
         sliderBox[_loc1_].removeMovieClip();
      }
   }
}
function showBoneCustom(_show)
{
   dragBlockBtn._visible = _show;
   if(!_show)
   {
      btmMc.resetContainer._visible = false;
      groupBox._visible = false;
      sliderBox._visible = false;
      ChBtn_basicCustomCheck = false;
      infoBgMc._visible = true;
      customInfoMc._visible = true;
   }
   else
   {
      ToGame_CreateCharacter_StartFaceDetail();
      btmMc.resetContainer._visible = true;
      groupBox._visible = true;
      sliderBox._visible = true;
      infoBgMc._visible = false;
      customInfoMc._visible = false;
      delete groupBox.onEnterFrame;
      groupBox._x = groupBox._x + groupBox._width;
      sliderBox._x = sliderBox._x + sliderBox._width;
      groupBox.onEnterFrame = function()
      {
         this._x = this._x + 0.6 * (tXboneGContain - this._x);
         sliderBox._x = sliderBox._x + 0.6 * (tXboneSContain - sliderBox._x);
         if(this._x - tXboneGContain <= 1)
         {
            this._x = tXboneGContain;
            sliderBox._x = tXboneSContain;
            delete this.onEnterFrame;
         }
      };
   }
}
function buildSlider(groupid, grupname, sliderid, slidername, min, minT, max, maxT, current, level)
{
   if(sliderGroup["G_" + groupid] == undefined)
   {
      var _loc5_ = groupBox.attachMovie("sliderGroupBtn","groupBtn" + groupid,groupid);
      _loc5_.TextBtn.txt.text = grupname;
      _loc5_._y = groupid * (_loc5_._height - 20);
      var _loc4_ = new lib.util.TxtBtn(_loc5_.mc,_loc5_.txt);
      _loc4_.pressColor = _loc4_.overColor = _loc4_.outColor;
      _loc5_.txtBtn = _loc4_;
      _loc4_.btn.groupId = groupid;
      _loc4_.setToggleMode(true);
      _loc4_.btn.onRelease2 = function()
      {
         selectBoneGroup(this.groupId);
      };
      sliderGroup["G_" + groupid] = sliderBox.createEmptyMovieClip("sliderContainerMc" + groupid,groupid);
      sliderBox._y = groupBox._y + groupBox._height + 30;
   }
   var _loc7_ = sliderGroup["G_" + groupid];
   var _loc6_ = _loc7_.getNextHighestDepth();
   var _loc2_ = _loc7_.attachMovie("Comp:S_Slider","slider" + sliderid,_loc6_);
   _loc2_.showSpaceBar = false;
   custom_slider_array.push(_loc2_);
   _loc2_.showTipMarkValue = !customDevMode;
   _loc2_.returnLevel = true;
   _loc2_.isRealTime = true;
   _loc2_.id = sliderid;
   _loc2_.groupId = groupid;
   _loc2_._y = _loc6_ * (_loc2_._height - 2);
   _loc2_.title = slidername;
   _loc2_.setData(min,minT,max,maxT,current,level);
   _loc2_.onChanged = function(_value, _mc)
   {
      ToGame_CreateCharacter_SelectFaceDetail(this.groupId,this.id,_value);
   };
}
function selectBoneGroup(groupId)
{
   sliderBox._visible = false;
   var num1 = 0;
   UI.onEnterFrame = function()
   {
      if(num1 >= 1)
      {
         UI.onEnterFrame = null;
         for(var _loc2_ in groupBox)
         {
            var _loc1_ = _loc2_.slice(-1);
            if(groupId != _loc1_)
            {
               groupBox[_loc2_].txtBtn.setToggle(false);
            }
         }
         groupBox["groupBtn" + groupId].txtBtn.setToggle(true);
         if(custom_silder_check == false)
         {
            sliderBox._visible = true;
            for(var _loc2_ in sliderBox)
            {
               sliderBox[_loc2_]._visible = false;
            }
         }
         else if(custom_silder_check == true)
         {
            custom_silder_check = false;
         }
         sliderBox["sliderContainerMc" + groupId]._visible = true;
      }
      else
      {
         num1++;
         for(var _loc2_ in sliderBox)
         {
            sliderBox[_loc2_]._visible = false;
         }
      }
   };
}
function showVoiceCustom(_show)
{
   customInfoMc.voiceController._alpha = 100;
   customInfoMc.voiceController._visible = _show;
}
function CustomMode2()
{
   customBtn_array = [];
   nameTitleMc._visible = true;
   customInfoMc.presetSlider._alpha = 100;
   customInfoMc.presetSlider.returnLevel = true;
   customInfoMc.presetSlider.isRealTime = true;
   customInfoMc.presetSlider.setData(presetData[0],presetData[1],presetData[2],presetData[3],presetData[4],presetData[5]);
}
function customGrideInit()
{
   gs.TweenLite.killGarbage();
   customInfoMc.slotGrideMc0.id = 0;
   customInfoMc.slotGrideMc1.id = 2;
   customInfoMc.slotGrideMc3.id = 4;
   customInfoMc.slotGrideMc4.id = 5;
   customInfoMc.slotGrideMc5.id = 1;
   customInfoMc.slotGrideMc6.id = 3;
   customInfoMc.slotGrideMc8.id = 6;
   customInfoMc.slotGrideMc9.id = 7;
   customInfoMc.slotGrideMc10.id = 7;
   grideBuild(customInfoMc.slotGrideMc0,customFace_array,0);
   grideBuild(customInfoMc.slotGrideMc1,customSkinColor_array,0);
   if(m_RNum != "6")
   {
      grideBuild(customInfoMc.slotGrideMc5,customHair_array,0);
      grideBuild(customInfoMc.slotGrideMc6,customHairColor_array,0);
   }
   grideBuild(customInfoMc.slotGrideMc3,customDecal_array,0);
   grideBuild(customInfoMc.slotGrideMc4,customDeco_array,0);
   grideBuild(customInfoMc.slotGrideMc8,customEquip_array,0);
   if(Additional_Preset != "-1")
   {
      grideBuild(customInfoMc.slotGrideMc10,customPreset_array,Number(Additional_Preset));
   }
   else
   {
      SelectTabNumber = 1;
      Ramdom_Slot_Noselect(customInfoMc.slotGrideMc10);
      Ramdom_Slot_Noselect(customInfoMc.slotGrideMc9);
   }
   grideBuild(customInfoMc.slotGrideMc9,customRandom_array,-2);
}
function ToGame_CreateCharacter_SelectCustomizing(tabNum, id)
{
   if(tabNum == 7)
   {
      if(id == 9000)
      {
         SelectTabNumber = 1;
         Ramdom_Slot_Noselect(customInfoMc.slotGrideMc10);
         Ramdom_Slot_Noselect(customInfoMc.slotGrideMc9);
      }
      else
      {
         SelectTabNumber = -1;
      }
      SelectTabSlider = true;
   }
   else
   {
      SelectTabNumber = 1;
      Ramdom_Slot_Noselect(customInfoMc.slotGrideMc10);
      Ramdom_Slot_Noselect(customInfoMc.slotGrideMc9);
   }
   getURL("FSCommand:ToGame_CreateCharacter_SelectCustomizing",tabNum + "\t" + id);
}
function ToGame_CreateCharacter_SelectFaceDetail(groupId, sliderId, _value)
{
   getURL("FSCommand:ToGame_CreateCharacter_SelectFaceDetail",groupId + "\t" + sliderId + "\t" + _value);
}
function ToGame_CreateCharacter_SelectPreset(_value)
{
   getURL("FSCommand:ToGame_CreateCharacter_SelectPreset",_value);
}
function ToGame_CreateCharacter_ResetFaceDetail()
{
   fscommand("ToGame_CreateCharacter_ResetFaceDetail");
   myListener.OnGame_CreateCharacter_SetFaceDetail(faceDetailData);
}
function ToGame_CreateCharacter_SelectVoice(index, bPreview)
{
   var _loc1_ = index + "\t" + bPreview;
   getURL("FSCommand:ToGame_CreateCharacter_SelectVoice",_loc1_);
}
function ToGame_CreateCharacter_SelectRandomPreset()
{
   fscommand("ToGame_CreateCharacter_SelectRandomPreset");
}
function ToGame_CreateCharacter_StartFaceDetail()
{
   fscommand("ToGame_CreateCharacter_StartFaceDetail");
}
function ToGame_CreateCharacter_StartBodyDetail()
{
   fscommand("ToGame_CreateCharacter_StartBodyDetail");
}
function Ramdom_Slot_Noselect(mc)
{
   var _loc1_ = 0;
   while(_loc1_ < customPreset_array.length)
   {
      mc.containerMc["slot" + _loc1_].bgMc.gotoAndStop(1);
      mc.selectSlot = undefined;
      _loc1_ = _loc1_ + 1;
   }
}
function setMenuState()
{
   var _loc2_ = 0;
   while(_loc2_ < menu_array.length)
   {
      var _loc3_ = menu_array[_loc2_];
      var _loc5_ = _loc3_.btnId;
      var _loc4_ = _loc3_.bEnabled;
      var _loc1_ = customListMc["btn" + _loc2_];
      _loc1_.bEnabled = _loc4_;
      if(_loc4_ == false)
      {
         _loc1_.gotoAndStop(4);
         _loc1_.txt.textColor = "0x666666";
      }
      else
      {
         _loc1_.gotoAndStop(1);
         _loc1_.txt.textColor = "0xFFFFFF";
      }
      _loc2_ = _loc2_ + 1;
   }
   if(selectMenuIndex != 0)
   {
      if(selectMenuIndex == 1)
      {
         custom_silder_check2 = true;
         selectCustom(4);
         if(displayMc.txt.text == "")
         {
            displayMc._visible = false;
         }
         else
         {
            displayMc._visible = true;
         }
         BackMc.txt._visible = false;
      }
      else if(selectMenuIndex == 2)
      {
         selectCustom(3);
         if(displayMc.txt.text == "")
         {
            displayMc._visible = false;
         }
         else
         {
            displayMc._visible = true;
         }
         BackMc.txt._visible = false;
      }
      else if(selectMenuIndex == 3)
      {
         custom_silder_check2 = true;
         selectCustom(0);
         if(displayMc.txt.text == "")
         {
            displayMc._visible = false;
         }
         else
         {
            displayMc._visible = true;
         }
         BackMc.txt._visible = false;
      }
      else if(selectMenuIndex == 4)
      {
         selectCustom(2);
         if(displayMc.txt.text == "")
         {
            displayMc._visible = false;
         }
         else
         {
            displayMc._visible = true;
         }
         BackMc.txt._visible = false;
      }
      else if(selectMenuIndex == 5)
      {
         custom_silder_check2 = false;
         selectBoneGroup(0);
         selectCustom(1);
         displayMc._visible = false;
         BackMc.txt._visible = true;
      }
      else if(selectMenuIndex == 6)
      {
         selectCustom(5);
         if(displayMc.txt.text == "")
         {
            displayMc._visible = false;
         }
         else
         {
            displayMc._visible = true;
         }
         BackMc.txt._visible = false;
      }
      else if(selectMenuIndex == 7)
      {
         selectCustom(6);
         if(displayMc.txt.text == "")
         {
            displayMc._visible = false;
         }
         else
         {
            displayMc._visible = true;
         }
         BackMc.txt._visible = false;
      }
   }
}
function buildVoiceController()
{
   var _loc1_ = customInfoMc.voiceController;
   grideBuild(_loc1_,voiceData_array,voiceSelect,true);
}
function DisableUI(bTrue)
{
   _root.setDisableUI(rMc,bTrue);
   _root.setDisableUI(cMc,bTrue);
   _root.setDisableUI(btmMc,bTrue);
}
function DisableUI_Select(bTrue)
{
   _root.setDisableUI(rMc,bTrue);
   _root.setDisableUI(cMc,bTrue);
}
function DisableUI_Custom(bTrue)
{
   _root.setDisableUI(customInfoMc,bTrue);
   _root.setDisableUI(customListMc,bTrue);
   _root.setDisableUI(sliderBox,bTrue);
   _root.setDisableUI(groupBox,bTrue);
}
_global.gfxExtensions = true;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var UI = this;
stop();
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() != "createcharacter")
   {
      return undefined;
   }
   if(bShow)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
myListener.OnGame_ChangeStageSize = function(width, height)
{
   if(width == undefined || height == undefined)
   {
      return undefined;
   }
   var _loc3_ = lib.info.AlignInfo.xRatioToPixel(0);
   var _loc5_ = lib.info.AlignInfo.xRatioToPixel(100);
   var _loc1_ = lib.info.AlignInfo.yRatioToPixel(0);
   var _loc4_ = lib.info.AlignInfo.yRatioToPixel(100);
   var _loc2_ = lib.info.AlignInfo.xRatioToPixel(50);
   var _loc6_ = lib.info.AlignInfo.yRatioToPixel(50);
   rMc._x = _loc3_ + 58;
   rMc._y = _loc1_ + 148;
   cMc._x = _loc5_ - 120;
   cMc._y = _loc1_ + 128;
   btmMc._x = _loc2_;
   btmMc._y = _loc4_;
   displayMc._x = _loc5_;
   displayMc._y = _loc1_;
   nameTitleMc._x = _loc2_;
   nameTitleMc._y = _loc1_;
   customInfoMc._x = _loc3_;
   customInfoMc._y = _loc4_ - 120;
   limitClassMc._x = _loc2_;
   limitClassMc._y = _loc6_;
};
var PlusFrame_Awaken_List = 50;
var ButtonStartFrame_Normal = 1;
var ButtonEndFrame_Normal = 12;
var ButtonStartFrame_Awaken = 15;
var ButtonEndFrame_Awaken = 26;
var m_SNum = 0;
var m_RNum = -1;
var m_CNum = -1;
var m_SFocus = null;
var m_RFocus = null;
var m_CFocus = null;
var RLEN = 7;
var CLEN = 13;
var s_CreateMode = "Select";
var a_ClassNum = [0,1,2,3,4,5,6,7,8,9,10,11,12];
var a_RaceNum = [0,1,2,3,4,5,6];
var a_BtnTextArr = ["$013061","$013173","$013174","$013072"];
var a_BtnTextArr2 = ["$013066","$013079","$013044","$013048","$013067","$013074","$013068","$013045"];
var m_CustomFocus = undefined;
var s_CharacterName = "";
var s_DefaultName = lib.util.UIString.getUIString("$013051");
var a_ClassArr = ["$013020","$013021","$013022","$013023","$013024","$013025","$013026","$013027","$013170","$013159","$013179","$013191","$013200"];
var a_ClassLock = ["$013020","$013021","$013022","$013023","$013024","$013025","$013026","$013027","$013171","$013172","$013182","$013171","$013201"];
var a_ClassLockGuide = ["","","","","","","","","5","1\t3","0","5","1"];
var a_RaceArr = ["$013001","$013002","$013003","$013006","$013004","$021015","$013005"];
var a_SkillToolTipId = ["$013096","$013097","$013098","$013099","$013100","$013101","$013102","$013103","$013104","$013105","$013106","$013107","$013111","$013112","$013113","$013108","$013109","$013110","$013114","$013115","$013116","$013117","$013118","$013119","$013152","$013153","$013154","$013164","$013165","$013166","$013183","$013184","$013185","$013195","$013196","$013197","$013202","$013203","$013204"];
var a_SkillToolTipData = [];
SetDefaultSkillToolTip();
var a_SkillData = [];
a_SkillData[0] = [a_SkillToolTipData[0],"img://__Icon_Skills.rushingslash_Tex",a_SkillToolTipData[1],"img://__Icon_Skills.aggravatingstrike_Tex",a_SkillToolTipData[2],"img://__Icon_Skills.tenaciousattack_Tex"];
a_SkillData[1] = [a_SkillToolTipData[3],"img://__Icon_Skills.shieldattack_Tex",a_SkillToolTipData[4],"img://__Icon_Skills.Leaprampage_Tex",a_SkillToolTipData[5],"img://__Icon_Skills.hookthrow_Tex"];
a_SkillData[2] = [a_SkillToolTipData[6],"img://__Icon_Skills.handyslash_Tex",a_SkillToolTipData[7],"img://__Icon_Skills.Cuttingslash_Tex",a_SkillToolTipData[8],"img://__Icon_Skills.Cuthead_Tex"];
a_SkillData[3] = [a_SkillToolTipData[9],"img://__Icon_Skills.Whirlwind_Tex",a_SkillToolTipData[10],"img://__Icon_Skills.blastSlash_Tex",a_SkillToolTipData[11],"img://__Icon_Skills.bash_Tex"];
a_SkillData[4] = [a_SkillToolTipData[12],"img://__Icon_Skills.hellfire_Tex",a_SkillToolTipData[13],"img://__Icon_Skills.icestorm_Tex",a_SkillToolTipData[14],"img://__Icon_Skills.Lightofruin_Tex"];
a_SkillData[5] = [a_SkillToolTipData[15],"img://__Icon_Skills.Arrowfall_Tex",a_SkillToolTipData[16],"img://__Icon_Skills.arrowshower_Tex",a_SkillToolTipData[17],"img://__Icon_Skills.RapidShot_Tex"];
a_SkillData[6] = [a_SkillToolTipData[18],"img://__Icon_Skills.Healinglightlockon_Tex",a_SkillToolTipData[19],"img://__Icon_Skills.SelfPreResurrection_Tex",a_SkillToolTipData[20],"img://__Icon_Skills.DivineLightning_Tex"];
a_SkillData[7] = [a_SkillToolTipData[21],"img://__Icon_Skills.summonspiritofheal_Tex",a_SkillToolTipData[22],"img://__Icon_Skills.Criticalupaura_Tex",a_SkillToolTipData[23],"img://__Icon_Skills.SpiritOfConfusion_Tex"];
a_SkillData[8] = [a_SkillToolTipData[24],"img://__Icon_Skills.ChainBlow_Tex",a_SkillToolTipData[25],"img://__Icon_Skills.DarkExplosion_Tex",a_SkillToolTipData[26],"img://__Icon_Skills.DarkGrasp_Tex"];
a_SkillData[9] = [a_SkillToolTipData[27],"img://__Icon_Skills.BuckShot_Tex",a_SkillToolTipData[28],"img://__Icon_Skills.GatlingShot_Tex",a_SkillToolTipData[29],"img://__Icon_Skills.ArcaneShockShot01_Tex"];
a_SkillData[10] = [a_SkillToolTipData[30],"img://__Icon_Skills.SmashAttack02_Tex",a_SkillToolTipData[31],"img://__Icon_Skills.BlowAttack_Tex",a_SkillToolTipData[32],"img://__Icon_Skills.DashAttack_Tex"];
a_SkillData[11] = [a_SkillToolTipData[33],"img://__Icon_Skills.C12_CatchBack",a_SkillToolTipData[34],"img://__Icon_Skills.C12_DashAttack",a_SkillToolTipData[35],"img://__Icon_Skills.C12_RapidSlash"];
a_SkillData[12] = [a_SkillToolTipData[36],"img://__Icon_Skills.RisingShot_Tex",a_SkillToolTipData[37],"img://__Icon_Skills.Crescentcut_Tex",a_SkillToolTipData[38],"img://__Icon_Skills.MoonLightDash_Tex"];
var a_TribeData = [];
a_TribeData[0] = ["$013128","$013129","$013130","$013131","img://skill__0__10104__9020100","img://passivity__19100","img://passivity__19101","img://passivity__19102"];
a_TribeData[1] = ["$013132","$013133","$013134","$013135","img://skill__0__10704__9020100","img://passivity__19300","img://passivity__19301","img://passivity__19302"];
a_TribeData[2] = ["$013136","$013137","$013138  ","$013139","img://skill__0__10504__9020100","img://passivity__19400","img://passivity__19401","img://passivity__19402"];
a_TribeData[3] = ["$013140","$013141","$013142","$013143","img://skill__0__10304__9020100","img://skill__0__10304__9010100","img://passivity__19200","img://passivity__19201"];
a_TribeData[4] = ["$013148","$013149","$013150","$013151","img://skill__0__11004__9020100","img://skill__0__11004__9030100","img://passivity__19500","img://passivity__19501"];
a_TribeData[5] = ["$013148","$013149","$013150","$013151","img://skill__0__11004__9020100","img://skill__0__11004__9030100","img://passivity__19500","img://passivity__19501"];
a_TribeData[6] = ["$013144","$013141","$013146","$013147","img://skill__0__11104__9020100","img://skill__0__10304__9010100","img://passivity__19601","img://passivity__19602"];
var tribeTxt0 = ["$013001","$013002","$013003","$013006","$013004","$013005","$021015"];
var tribeTxt1 = ["$013008","$013010","$013012","$013018","$013014","$013016","$021017"];
var tribeTxt2 = ["$013009","$013011","$013013","$013019","$013015","$013017","$021018"];
var MaxSkillSlotCount_Normal = 3;
var MaxSkillSlotCount_Awaken = 6;
var requestClassSkillToolTip = false;
var b_initCheck = false;
var b_initAni = false;
customInfoMc._visible = false;
groupBox._visible = false;
sliderBox._visible = false;
btmMc.resetContainer._visible = false;
dragBlockBtn._visible = false;
limitClassMc._visible = false;
var TxtStart_Normal = 340;
var TxtStart_Awaken = 308;
var BarStart_Normal = 343;
var BarStart_Awaken = 311;
var BgStart_Normal = 341;
var BgStart_Awaken = 309;
var s_ClickLock = false;
var m_NameField = new lib.util.ExtTextField(btmMc.nameInputMc.txt,0,btmMc.nameInputMc.txtFocus);
m_NameField.__set__maxschar(NameTextLength);
m_NameField.__set__caption(s_DefaultName);
m_NameField.onChanged = function(changed)
{
   lib.util.StrByteLen.getLenth3(btmMc.nameInputMc.txt,NameTextLength);
};
m_NameField.onEnterKey = function()
{
   Selection.setFocus(null);
};
m_NameField.onKillFocusEvent = function()
{
   ToGame_CreateCharacter_CheckName(m_NameField.__get__text());
};
var a_GageData = [];
myListener.OnGame_CreateCharacter_SetGage = function(s_Data)
{
   FrameAnimation();
   a_GageData = s_Data.split("\n");
};
myListener.OnGame_CreateCharacter_SetSecond = function()
{
   FrameAnimation();
};
var x_btn = new lib.util.TxtBtn(limitClassMc.x_mc);
x_btn.setRelease(ToGame_CreateCharacter_PopupClose);
var MAX_BUTTON_LIMITCLASS = 3;
var button_pos_x = [];
button_pos_x[0] = [-76,-76,-156,-228];
button_pos_x[1] = [-76,-76,5,-76];
button_pos_x[2] = [-76,-76,-76,77];
limitClassMc.txt.verticalAlign = "center";
myListener.OnGame_CreateCharacter_Popup = function(s_Type, s_Title, s_Str, s_Btn)
{
   var _loc10_ = Number(s_Type) + 1;
   var _loc9_ = lib.util.ExtString.split(s_Btn,"\n");
   var _loc8_ = _loc9_.length;
   if(3 == _loc10_ && 2 < _loc8_)
   {
      _loc10_ = 7;
   }
   if(4 == _loc10_ && 1 < _loc8_)
   {
      _loc10_ = 8;
   }
   limitClassMc.gotoAndStop(_loc10_);
   limitClassMc.txt.htmlText = s_Str;
   limitClassMc.titleTxt.text = s_Title;
   if(_loc10_ == 1)
   {
      limitClassMc._visible = false;
      if(s_ClickLock)
      {
         _root.setDisableUI(rMc,false);
         _root.setDisableUI(cMc,false);
         _root.setDisableUI(btmMc,true);
      }
      else
      {
         DisableUI(false);
      }
   }
   else
   {
      DisableUI(true);
      limitClassMc._visible = true;
   }
   var _loc3_ = 0;
   while(_loc3_ < MAX_BUTTON_LIMITCLASS)
   {
      var _loc4_ = limitClassMc["btn" + _loc3_];
      _loc4_._visible = false;
      _loc3_ = _loc3_ + 1;
   }
   _loc3_ = 0;
   while(_loc3_ < _loc8_)
   {
      _loc4_ = limitClassMc["btn" + _loc3_];
      _loc4_._visible = true;
      lib.manager.ToolTip.remove(_loc4_);
      var _loc2_ = lib.util.ExtString.split(_loc9_[_loc3_],"\t");
      var _loc5_ = _loc4_.txtBtn;
      var _loc7_ = undefined != _loc2_[2]?Boolean(Number(_loc2_[2])):true;
      var _loc6_ = _loc2_[3];
      _loc5_.setText(_loc2_[1]);
      _loc5_.setEnabled(_loc7_);
      if(undefined != _loc6_ && "" != _loc6_)
      {
         lib.manager.ToolTip.add(_loc4_,_loc6_,1);
      }
      _loc4_._x = button_pos_x[_loc3_][_loc8_];
      PopUpButton(_loc5_,s_Type,_loc2_[0]);
      _loc3_ = _loc3_ + 1;
   }
};
var a_PopUpSelectRace = ["","0\t5","0\t1\t3","0\t0","0\t5"];
var a_PopUpSelectClass = ["0","8","9","10","11"];
myListener.OnGame_CreateCharacter_SetSex = function(s_Type, s_Mode, s_Tooltip)
{
   var _loc3_ = rMc["bg" + rMc.bgChange];
   var _loc1_ = _loc3_.listMc["btn" + s_Type];
   var _loc2_ = _loc3_.listMc["btn" + Number(s_Type + 1) % 2];
   if(s_Mode == "0")
   {
      _loc1_.gotoAndStop(1);
   }
   else if(s_Mode == "1")
   {
      if(_loc1_._currentframe != 13)
      {
         _loc1_.gotoAndStop(13);
      }
      if(_loc2_._currentframe == 13)
      {
         _loc2_.gotoAndStop(1);
      }
      m_SNum = Number(s_Type);
   }
   else
   {
      _loc1_.gotoAndStop(14);
      _loc2_.gotoAndStop(1);
      if(s_Tooltip)
      {
         lib.manager.ToolTip.add(_loc1_,s_Tooltip,1);
      }
      else
      {
         lib.manager.ToolTip.remove(_loc1_);
      }
   }
};
var a_ClassFont = ["0x000000","0xffffff","0xffffff","0xffffff","0xffffff","0xffffff","0xffffff"];
myListener.OnGame_CreateCharacter_SetRace = function(s_Type, s_Mode, s_Tooltip, s_Event)
{
   var _loc1_ = rMc["btn" + s_Type];
   var _loc4_ = rMc["bg" + rMc.bgChange];
   _loc1_._visible = true;
   _loc1_._alpha = 100;
   lib.manager.ToolTip.remove(_loc1_);
   lib.manager.ToolTip.add(_loc1_,a_RaceArr[s_Type],1);
   if(s_Mode == "0")
   {
      _loc1_.gotoAndStop(1);
   }
   else if(s_Mode == "1")
   {
      m_RFocus = _loc1_;
      m_RNum = _loc1_.idx;
      _loc1_.gotoAndStop(12);
      _loc4_.listMc.gotoAndStop(Number(m_RNum) + 1);
      cMc.titleFont.textColor = a_ClassFont[m_RNum];
      rMc.titleFont.textColor = a_ClassFont[m_RNum];
      cMc.titleFont._alpha = 20;
      rMc.titleFont._alpha = 20;
      SetSexBtn(m_RNum);
      SetRaceSKill(_loc4_.listMc,_loc1_.idx);
   }
   else if(s_Mode == "2")
   {
      _loc1_._alpha = 90;
      lib.manager.ToolTip.remove(_loc1_);
      if(s_Tooltip)
      {
         lib.manager.ToolTip.add(_loc1_,s_Tooltip,1);
      }
      else
      {
         lib.manager.ToolTip.add(_loc1_,a_RaceArr[s_Type],1);
      }
   }
   else if(s_Mode == "3")
   {
      _loc1_.gotoAndStop(1);
      _loc1_._alpha = 50;
      lib.manager.ToolTip.remove(_loc1_);
      if(s_Tooltip)
      {
         lib.manager.ToolTip.add(_loc1_,s_Tooltip,1);
      }
      else
      {
         lib.manager.ToolTip.add(_loc1_,a_RaceArr[s_Type],1);
      }
   }
   else
   {
      _loc1_._visible = false;
   }
   _loc1_.eventMc.gotoAndStop(Number(s_Event) + 1);
};
myListener.OnGame_CreateCharacter_SetClass = function(s_Type, s_Mode, s_Tooltip, s_Event, s_Awaken, s_SkillList)
{
   var _loc6_ = Boolean(Number(s_Awaken));
   var _loc3_ = cMc["btn" + s_Type];
   _loc3_.bAwaken = _loc6_;
   _loc3_.awakenIcon._visible = false;
   _loc3_.awakenIcon.gotoAndPlay(1);
   var _loc11_ = cMc["bg" + cMc.bgChange];
   s_Type = Number(s_Type);
   if(s_SkillList != "" && s_SkillList != undefined && s_SkillList != "undefined" && s_SkillList != null)
   {
      var _loc5_ = s_SkillList.split("\n");
      var _loc9_ = _loc5_.length;
      if(_loc5_[_loc9_ - 1] == "undefined" || _loc5_[_loc9_ - 1] == "")
      {
         _loc5_.splice(_loc9_ - 1,1);
      }
      a_SkillData[s_Type] = [];
      var _loc1_ = 0;
      while(_loc1_ < _loc5_.length)
      {
         var _loc2_ = _loc5_[_loc1_].split("\t");
         a_SkillData[s_Type].push(_loc2_[0]);
         a_SkillData[s_Type].push(_loc2_[1]);
         _loc1_ = _loc1_ + 1;
      }
      requestClassSkillToolTip = true;
   }
   var _loc12_ = !("2" == s_Mode || "3" == s_Mode)?a_ClassArr[s_Type]:a_ClassLock[s_Type];
   _loc12_ = !("" != s_Tooltip && null != s_Tooltip && undefined != s_Tooltip && "undefined" != s_Tooltip)?_loc12_:s_Tooltip;
   lib.manager.ToolTip.remove(_loc3_);
   lib.manager.ToolTip.add(_loc3_,_loc12_,1);
   _loc3_._visible = true;
   _loc3_._alpha = 100;
   var _loc13_ = !_loc6_?ButtonStartFrame_Normal:ButtonStartFrame_Awaken;
   var _loc14_ = !_loc6_?ButtonEndFrame_Normal:ButtonEndFrame_Awaken;
   if(s_Mode == "0")
   {
      _loc3_.gotoAndStop(1);
      _loc3_.effect.gotoAndStop(Number(s_Type) + 1);
   }
   else if(s_Mode == "1")
   {
      m_CFocus = _loc3_;
      m_CNum = _loc3_.idx;
      _loc3_.gotoAndStop(12);
      _loc3_.effect.gotoAndStop(Number(s_Type) + 1);
      _loc11_.listMc.gotoAndStop(m_CNum + 1);
      SetClassListState(_loc11_,_loc6_);
      lib.net.NetConnect.StopVideo();
      m_ParentMc.videoMc._visible = false;
      SetClassSkill(_loc11_.listMc,_loc3_.idx,_loc6_);
   }
   else if(s_Mode == "2")
   {
      _loc3_.gotoAndStop(1);
      _loc3_.effect.gotoAndStop(Number(s_Type) + 1);
      _loc3_._alpha = 90;
   }
   else if(s_Mode == "3")
   {
      _loc3_.gotoAndStop(1);
      _loc3_.effect.gotoAndStop(Number(s_Type) + 1);
      _loc3_._alpha = 50;
   }
   else
   {
      _loc3_._visible = false;
   }
   _loc3_.eventMc.gotoAndStop(Number(s_Event) + 1);
};
myListener.OnGame_CreateCharacter_SetDisplay = function(s_Txt, s_Index)
{
   myListener.OnGame_CreateCharacter_Additional_SetDisplay(s_Txt,s_Index);
};
myListener.OnGame_CreateCharacter_Disappear = function()
{
   EndMode();
};
myListener.OnGame_CreateCharacter_NameOK = function(s_Name)
{
   nameTitleMc._visible = true;
   nameTitleMc._alpha = 100;
   s_CharacterName = s_Name;
   nameTitleMc.nameFd.htmlText = s_CharacterName;
   btmMc.nameInputMc.txt1.text = "";
   btmMc.btn1.gotoAndStop(1);
   btmMc.btn1.txt.textColor = "0xffffff";
   lib.manager.ToolTip.remove(btmMc.btn1);
};
myListener.OnGame_CreateCharacter_NameError = function(s_Error)
{
   nameTitleMc._visible = false;
   if(btmMc.nameInputMc.txt.text == "")
   {
      btmMc.nameInputMc.txt1.text = "";
      s_CharacterName = "";
   }
   else
   {
      btmMc.nameInputMc.txt1.text = s_Error;
   }
   btmMc.btn1.gotoAndStop(15);
   btmMc.btn1.txt.textColor = "0x666666";
   lib.manager.ToolTip.add(btmMc.btn1,"$013051",1);
};
var Additional_Index = -1;
myListener.OnGame_CreateCharacter_Additional_SetDisplay = function(s_Txt, s_Index, n_raceNum, n_sexNum)
{
   m_RNum = Number(n_raceNum);
   m_SNum = Number(n_sexNum);
   btmMc.nameInputMc._visible = false;
   Additional_Index = s_Index;
   if(s_Txt == "0")
   {
      displayMc.txt.text = "$013087";
   }
   else if(s_Txt == "1")
   {
      displayMc.txt.text = "$013159";
   }
   else
   {
      displayMc.txt.text = "";
   }
   if(s_Index == "0" || s_Index == "1")
   {
      s_CreateMode = "Select";
      FrameAnimation();
   }
   else if(s_Index == "2" || s_Index == "3")
   {
      s_CreateMode = "Custom";
      CustomMode2();
      FrameAnimation();
   }
   else if(s_Index == "4")
   {
      s_CreateMode = "Custom";
      FrameAnimation();
      displayMc._alpha = 0;
      return undefined;
   }
   displayMc._x = displayMc._x + 50;
   displayMc._alpha = 0;
   gs.TweenLite.to(displayMc,0.5,{delay:0.2,_x:displayMc._x - 50,_alpha:100,ease:gs.easing.Strong.easeOut});
};
myListener.OnGame_CreateCharacter_Additional_SetName = function(NameStr)
{
   nameTitleMc._visible = true;
   nameTitleMc._alpha = 100;
   s_CharacterName = NameStr;
   nameTitleMc.nameFd.htmlText = s_CharacterName;
};
myListener.OnGame_CreateCharacter_Additional_SetCharacter = function(CharIndex, SexIndex)
{
   if(CharIndex == 3)
   {
      customListMc.btn2.txt.text = a_BtnTextArr2[2];
   }
   else
   {
      customListMc.btn2.txt.text = a_BtnTextArr2[2];
   }
};
var customFace_array = new Array();
var customHair_array = new Array();
var customSkinColor_array = new Array();
var customHairColor_array = new Array();
var customDecal_array = new Array();
var customDeco_array = new Array();
var customEquip_array = new Array();
var customPreset_array = new Array();
var customRandom_array = new Array();
var arrayName_array = ["customFace_array","customHair_array","customSkinColor_array","customHairColor_array","customDecal_array","customDeco_array","customEquip_array","customPreset_array","customRandom_array"];
var s_CharacterName = "";
var SelectTabNumber = -1;
var SelectTabSlider = false;
var customInfoMc_Check = false;
var custom_silder_check = false;
var custom_silder_check2 = false;
var custom_slider_array = new Array();
var NameTextLength = 16;
var CharName = lib.util.UIString.getUIString("$013051");
var customInfoMc_y = 0;
var ChBtn_basicCustomCheck = false;
var Additional_Preset = "0";
var EndCreate = false;
myListener.OnGame_Lobby_Disappear = function()
{
   if(s_CreateMode == "Custom")
   {
      s_CreateMode = "Select";
      EndMode("Custom");
      if(!EndCreate)
      {
         SelectMode();
      }
   }
};
myListener.OnGame_CreateCharacter_SetCustomizingData = function(faceDataList, hairDataList, skinColorDataList, hairColorDataList, decalDataList, decoDataList, equipDataList, selectFaceID, selectHairID, selectSkinID, selectHairColorID, selectDecalID, selectDecoID, selectEquipID, presetList, selectPresetID, randomList)
{
   customFace_array = [];
   customHair_array = [];
   customSkinColor_array = [];
   customHairColor_array = [];
   customDecal_array = [];
   customDeco_array = [];
   customEquip_array = [];
   customPreset_array = [];
   customRandom_array = [];
   var _loc4_ = 0;
   while(_loc4_ < arguments.length)
   {
      var _loc2_ = arguments[_loc4_].split("\n");
      if(_loc2_[_loc2_.length - 1] == "undefined" || _loc2_[_loc2_.length - 1] == "")
      {
         _loc2_.splice(_loc2_.length - 1,1);
      }
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         var _loc7_ = _loc2_[_loc3_].split("\t");
         if(_loc7_.length != 1)
         {
            UI[arrayName_array[_loc4_]].push({id:_loc7_[0],img:_loc7_[1],color:_loc7_[2]});
         }
         _loc3_ = _loc3_ + 1;
      }
      _loc4_ = _loc4_ + 1;
   }
   var _loc6_ = presetList.split("\n");
   _loc4_ = 0;
   while(_loc4_ < _loc6_.length - 2)
   {
      _loc7_ = _loc6_[_loc4_].split("\t");
      UI[arrayName_array[7]].push({id:_loc7_[0],img:_loc7_[1]});
      _loc4_ = _loc4_ + 1;
   }
   _loc7_ = _loc6_[_loc6_.length - 2].split("\t");
   customRandom_array.push({id:randomList,img:_loc7_[1]});
   grideBuild(customInfoMc.slotGrideMc0,customFace_array,selectFaceID);
   grideBuild(customInfoMc.slotGrideMc1,customSkinColor_array,selectSkinID);
   if(m_RNum != "6")
   {
      grideBuild(customInfoMc.slotGrideMc5,customHair_array,selectHairID);
      grideBuild(customInfoMc.slotGrideMc6,customHairColor_array,selectHairColorID);
   }
   grideBuild(customInfoMc.slotGrideMc3,customDecal_array,selectDecalID);
   grideBuild(customInfoMc.slotGrideMc4,customDeco_array,selectDecoID);
   grideBuild(customInfoMc.slotGrideMc8,customEquip_array,selectEquipID);
   if(SelectTabNumber == -1)
   {
      grideBuild(customInfoMc.slotGrideMc10,customPreset_array,selectPresetID);
   }
   else
   {
      grideBuild(customInfoMc.slotGrideMc10,customPreset_array,-2);
   }
   grideBuild(customInfoMc.slotGrideMc9,customRandom_array,-2);
};
myListener.OnGame_CreateCharacter_SetFaceDetail = function(dataList)
{
   clearBoneGroup();
   faceDetailData = dataList;
   var _loc3_ = dataList.split("\n");
   if(_loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.splice(_loc3_.length - 1,1);
   }
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      var _loc1_ = _loc3_[_loc2_].split("\t");
      buildSlider(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9]);
      _loc2_ = _loc2_ + 1;
   }
   if(custom_silder_check2 == false)
   {
      selectBoneGroup(0);
   }
};
myListener.OnGame_CreateCharacter_SetPreset = function(dataList)
{
   var _loc2_ = dataList.split("\n");
   if(_loc2_[_loc2_.length - 1] == "undefined" || _loc2_[_loc2_.length - 1] == "")
   {
      _loc2_.splice(_loc2_.length - 1,1);
   }
   var _loc1_ = 0;
   while(_loc1_ < _loc2_.length)
   {
      var _loc3_ = _loc2_[_loc1_].split("\t");
      presetData = _loc3_.concat();
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_CreateCharacter_Additional_CreateConfirm = function()
{
   EndMode("Custom");
   EndCreate = true;
};
var isSliding = false;
var CSROWSSIZE = 9;
var MULTISIZE = 18;
var CSROWSSIZE2 = MULTISIZE * 2;
var NOSELECTALP = 50;
var CSSLOTWIDTH = 70;
var CSSLOTWIDTH2 = 35;
var veloObj = {};
var selecetCustomBtn;
basicCustom();
var tXboneGContain = groupBox._x;
var tXboneSContain = sliderBox._x;
myListener.OnGame_CreateCharacter_LengthLocal = function(lengthnum)
{
   NameTextLength = lengthnum;
};
var bChangeBtnName = false;
var selectMenuIndex = 0;
var menu_array = [];
customInfoMc.voiceController.guideMc.textFd.htmlText = lib.util.UIString.getUIString("$013158");
customInfoMc.voiceController.guideMc._visible = false;
OnGame_CreateCharacter_SetMenu = function(menuDatas, selectIndex)
{
   myListener.OnGame_CreateCharacter_Additional_SetMenu(menuDatas,selectIndex);
};
myListener.OnGame_CreateCharacter_Additional_SetMenu = function(menuDatas, selectIndex)
{
   menu_array = [];
   selectMenuIndex = 0;
   var _loc6_ = lib.util.ExtString.split(menuDatas,"\n");
   var _loc7_ = _loc6_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc7_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc6_[_loc1_],"\t");
      var _loc4_ = Number(_loc2_[0]);
      var _loc5_ = Number(_loc2_[1]);
      var _loc3_ = {btnId:_loc4_,bEnabled:_loc5_};
      menu_array.push(_loc3_);
      _loc1_ = _loc1_ + 1;
   }
   selectIndex = Number(selectIndex);
   if(isNaN(selectIndex) == false)
   {
      selectMenuIndex = selectIndex;
   }
   setMenuState();
};
var voiceData_array = new Array();
var voiceSelect = -1;
myListener.OnGame_CreateCharacter_SetVoice = function(voiceData, select)
{
   voiceData_array = [];
   select = Number(select);
   if(isNaN(select))
   {
      select = -1;
   }
   var _loc9_ = false;
   var _loc11_ = lib.util.ExtString.split(voiceData,"\n");
   var _loc12_ = _loc11_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc12_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc11_[_loc2_],"\t");
      var _loc7_ = _loc2_;
      var _loc8_ = _loc3_[0];
      var _loc4_ = Number(_loc3_[1]);
      var _loc5_ = Number(_loc3_[2]);
      var _loc6_ = Number(_loc3_[3]);
      if(select == _loc5_)
      {
         voiceSelect = _loc7_;
      }
      var _loc1_ = new Object();
      _loc1_.id = _loc2_;
      _loc1_.img = _loc8_;
      _loc1_.bPreview = _loc4_;
      _loc1_.voiceIndex = _loc5_;
      _loc1_.bExtra = _loc6_;
      voiceData_array.push(_loc1_);
      if(_loc9_ == false && _loc6_ && _loc4_)
      {
         _loc9_ = true;
      }
      _loc2_ = _loc2_ + 1;
   }
   UI.customInfoMc.voiceController.guideMc._visible = _loc9_;
   buildVoiceController();
};
myListener.OnGame_ChangeStageSize(Stage.width,Stage.height);
FrameStart();
