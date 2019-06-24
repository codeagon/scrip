function ToGame_SelectCharacter_InviteCode()
{
   DisableUI(true);
   fscommand("ToGame_SelectCharacter_InviteCode");
}
function FrameStart()
{
   SetButton();
   SetInitAnimation();
   ToGame_SelectCharacter_Init();
}
function SetInitAnimation()
{
   listMc.hit._visible = false;
   titleMc.eventBox._visible = false;
   centerMc.infoBox._visible = false;
   listMc.moveGuideMc._alpha = 0;
   listMc._x = -200;
   listMc._alpha = 0;
   titleMc._alpha = 0;
   centerMc._alpha = 0;
   listMc._alpha = 0;
   listMc._alpha = 0;
   gs.TweenLite.to(listMc,1,{_x:0,_alpha:100,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(titleMc,0.5,{delay:1,_alpha:100,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(centerMc,0.5,{delay:1,_alpha:100,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(btmLMc,0.5,{delay:1,_alpha:100,ease:gs.easing.Strong.easeOut});
}
function closeUIMotion()
{
   m_OptionBtn.setEnabled(false);
   m_MemberBtn.setEnabled(false);
   m_ModeBtn.setEnabled(false);
   m_VideoBtn.setEnabled(false);
   SetDisableButton(listMc.createBtn,false);
   SetDisableButton(listMc.removeBtn,false);
   SetDisableButton(centerMc.backBtn,false);
   SetDisableButton(centerMc.startBtn,false);
   SetDisableButton(listMc.moveBtn,false);
   gs.TweenLite.to(listMc,1,{delay:0.5,_x:-200,_alpha:0,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(titleMc,0.5,{_alpha:0,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(centerMc,0.5,{_alpha:0,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(btmLMc,0.5,{_alpha:0,ease:gs.easing.Strong.easeOut});
   fscommand("ToGame_SystemOption_CloseUI");
}
function SetDisableButton(m_Btn, b_Mode)
{
   if(b_Mode)
   {
      m_Btn._alpha = 100;
      m_Btn.gotoAndStop(1);
      m_Btn.txt.textColor = "0xffffff";
   }
   else
   {
      m_Btn._alpha = 60;
      lib.util.FrameSeeker.seek(m_Btn,15,15);
      m_Btn.txt.textColor = "0x666666";
   }
}
function SetButton()
{
   CreateButton(listMc.createBtn,"$012010",ToGame_SelectCharacter_Create);
   CreateButton(listMc.removeBtn,"$012011",ToGame_SelectCharacter_Remove);
   CreateButton(listMc.moveBtn,"$012047",DragLockOff);
   CreateButton(centerMc.startBtn,"$012012",ToGame_SelectCharacter_StartGame);
   CreateButton(centerMc.backBtn,"$012009",ToGame_SelectCharacter_Cancel);
   SetDisableButton(listMc.removeBtn,false);
   SetDisableButton(listMc.moveBtn,true);
   SetDisableButton(centerMc.startBtn,false);
   m_ModeBtn = new lib.util.TxtBtn(btmLMc.modeBtn);
   m_OptionBtn = new lib.util.TxtBtn(btmLMc.optionBtn);
   m_MemberBtn = new lib.util.TxtBtn(btmLMc.memberBtn);
   m_VideoBtn = new lib.util.TxtBtn(btmLMc.videoBtn);
   m_ModeBtn.setRelease(ToGame_SelectCharacter_ViewMode);
   m_OptionBtn.setRelease(ToGame_MainMenu_RequestShowUI);
   m_MemberBtn.setRelease(ToGame_CreditMembers_show);
   m_VideoBtn.setRelease(ToGame_SelectCharacter_VideoOn);
   lib.manager.ToolTip.add(btmLMc.modeBtn,"$012045",1);
   lib.manager.ToolTip.add(btmLMc.optionBtn,"$012013",1);
   lib.manager.ToolTip.add(btmLMc.memberBtn,"$011023",1);
   lib.manager.ToolTip.add(btmLMc.videoBtn,"$005028",1);
}
function CreateButton(mc, txt, eventFunc)
{
   mc.txt.text = txt;
   mc.onRollOver = function()
   {
      if(this._alpha != 100)
      {
         return undefined;
      }
      Sound_Play();
      lib.util.FrameSeeker.seek(this,1,12);
   };
   mc.onRollOut = mc0.onReleaseOutside = function()
   {
      if(this._alpha != 100)
      {
         return undefined;
      }
      if(this._currentframe > 1)
      {
         lib.util.FrameSeeker.seek(this,12,1);
      }
   };
   mc.onPress = function()
   {
      if(this._alpha != 100)
      {
         return undefined;
      }
      this.gotoAndStop(14);
   };
   mc.onRelease = function()
   {
      if(this._alpha != 100)
      {
         return undefined;
      }
      this.gotoAndStop(1);
      eventFunc();
   };
}
function alignBanner()
{
   var _loc1_ = 220;
   _loc1_ = !titleMc.rollingBannerBox._visible?_loc1_:435;
   titleMc.bannerBox._y = _loc1_;
   _loc1_ = 0 >= currentBannerCount?_loc1_:_loc1_ + 120 * currentBannerCount + 5;
   titleMc.eventBox._y = _loc1_;
}
function IntergrationBtn(cntnum, total)
{
   m_PageBtnL.setEnabled(true);
   m_PageBtnR.setEnabled(true);
   if(cntnum == total)
   {
      m_PageBtnR.setEnabled(false);
   }
   else if(cntnum < 2)
   {
      m_PageBtnL.setEnabled(false);
   }
}
function PageChange(num)
{
   var _loc1_ = 44 - (num - 1) * 350;
   gs.TweenLite.to(listMc.box,0.5,{_x:_loc1_,ease:gs.easing.Strong.easeOut,onComplete:PageChangeEnd});
}
function PageChangeEnd()
{
   pageChangeLock = false;
}
function ToGame_SelectCharacter_IntergrationPageNumber(num, type)
{
   if(pageChangeLock)
   {
      return undefined;
   }
   pageChangeType = type;
   pageChangeLock = true;
   var _loc1_ = n_Page + num;
   n_Page = n_Page + num;
   PageChange(_loc1_);
   getURL("FSCommand:ToGame_SelectCharacter_IntergrationPageNumber",_loc1_);
}
function ToGame_SelectCharacter_Init()
{
   fscommand("ToGame_SelectCharacter_Init");
}
function ToGame_SelectCharacter_Cancel()
{
   getUrl("FSCommand:ToGame_MainMenu_RequestShowUI", "SystemOption\t0");
   fscommand("ToGame_SelectCharacter_Cancel");
}
function ToGame_SelectCharacter_Create()
{
   fscommand("ToGame_SelectCharacter_Create");
}
function ToGame_SelectCharacter_Remove()
{
   if(m_ClickFocus.delMc._visible)
   {
      fscommand("ToGame_SelectCharacter_RemoveCancel");
   }
   else
   {
      getURL("FSCommand:ToGame_SelectCharacter_Remove",m_ClickFocus.id);
   }
}
function ToGame_MainMenu_RequestShowUI()
{
   getUrl("FSCommand:ToGame_MainMenu_RequestShowUI", "SystemOption\t1");
}
function ToGame_SelectCharacter_StartGame()
{
   fscommand("ToGame_SelectCharacter_StartGame");
}
function ToGame_CreditMembers_show()
{
   fscommand("ToGame_CreditMembers_show");
}
function ToGame_SelectCharacter_ListChangeMode(num)
{
   getURL("FSCommand:ToGame_SelectCharacter_ListChangeMode",num);
}
function ToGame_SelectCharacter_ListChange(id, num)
{
   getURL("FSCommand:ToGame_SelectCharacter_ListChange",id + "\t" + num);
}
function ToGame_SelectCharacter_ServerChange(idx)
{
   getURL("FSCommand:ToGame_SelectCharacter_ServerChange",idx);
}
function ToGame_SelectCharacter_LineClick(s_Id)
{
   getURL("FSCommand:ToGame_SelectCharacter_LineClick",s_Id);
}
function ToGame_MainMenu_Call()
{
   getUrl("FSCommand:ToGame_MainMenu_Call", "SystemOption");
}
function ToGame_SelectCharacter_VideoOn()
{
   fscommand("ToGame_SelectCharacter_VideoOn");
}
function ToGame_SelectCharacter_BannerClick(s_Id)
{
   getURL("FSCommand:ToGame_SelectCharacter_BannerClick",s_Id);
}
function ToGame_SelectCharacter_ViewMode()
{
   if(listMc._visible)
   {
      listMc._visible = false;
      titleMc._visible = false;
      centerMc._visible = false;
   }
   else
   {
      listMc._visible = true;
      titleMc._visible = true;
      centerMc._visible = true;
   }
}
function ToGame_SelectCharacter_ClickRollingBanner()
{
   var _loc2_ = rollingBannerData[currentIndex];
   var _loc1_ = _loc2_.id;
   getURL("FSCommand:ToGame_SelectCharacter_ClickRollingBanner",_loc1_);
}
function pageChangeCheck(n_Num)
{
   if(n_Num < 50 && n_Num > -50)
   {
      listMc.sideR.gotoAndStop(1);
      listMc.sideL.gotoAndStop(1);
      return undefined;
   }
   if(n_Page == 1 && n_Num > 50)
   {
      listMc.sideL.gotoAndStop(1);
      return undefined;
   }
   if(n_Page == t_Page && n_Num < -50)
   {
      listMc.sideR.gotoAndStop(1);
      return undefined;
   }
   delete listMc.box.onEnterFrame;
   var n_Count = 0;
   if(n_Num < -50)
   {
      listMc.sideR.gotoAndStop(2);
   }
   else
   {
      listMc.sideL.gotoAndStop(2);
   }
   listMc.box.onEnterFrame = function()
   {
      n_Count++;
      if(n_Count > 4)
      {
         delete this.onEnterFrame;
         n_Count = 0;
         n_LX = 0;
         n_LY = _ymouse - 100;
         n_ChangePage = 0;
         if(n_Num < -50)
         {
            n_LX = n_Page * 350;
            n_ChangePage = n_Page;
            listMc.sideR.gotoAndStop(1);
            ToGame_SelectCharacter_IntergrationPageNumber(1,"drag");
         }
         else
         {
            n_LX = (n_Page - 2) * 350;
            n_ChangePage = n_Page - 2;
            listMc.sideL.gotoAndStop(1);
            ToGame_SelectCharacter_IntergrationPageNumber(-1,"drag");
         }
      }
   };
}
function DragLockOff()
{
   m_ClickFocus = undefined;
   if(b_DragLock)
   {
      SetDisableButton(listMc.createBtn,false);
      listMc.hit._visible = true;
      b_DragLock = false;
      listMc.moveBtn.txt.text = "$012048";
      listMc.moveBtn.effect.gotoAndPlay(2);
      LineChangeEvent(true);
      Mouse.addListener(mouseListner);
      ToGame_SelectCharacter_ListChangeMode(1);
   }
   else
   {
      SetDisableButton(listMc.createBtn,true);
      listMc.hit._visible = false;
      b_DragLock = true;
      listMc.moveBtn.txt.text = "$012047";
      LineChangeEvent(false);
      Mouse.removeListener(mouseListner);
      listMc.moveBtn.effect.gotoAndStop(1);
      ToGame_SelectCharacter_ListChangeMode(0);
   }
}
function Sound_Play()
{
   lib.manager.UISound.play(3101);
}
function LineChangeEvent(b_Mode)
{
   var _loc1_ = listMc.box;
   for(var _loc4_ in _loc1_)
   {
      if(typeof _loc1_[_loc4_] == "movieclip")
      {
         var _loc2_ = _loc1_[_loc4_];
         _loc2_.cMc._visible = b_Mode;
      }
   }
}
function dragCheck(m_Line)
{
   if(!b_DragLock)
   {
      n_ClickMousePosition = _ymouse - (110 + m_Line._y);
      m_ClickFocus = undefined;
      m_DragFocus = m_Line;
      dragStart();
   }
}
function dragStart()
{
   b_DragMode = true;
   var _loc3_ = m_DragFocus.saveData;
   var _loc2_ = LINE_MAX - 38;
   listMc.moveGuideMc.gotoAndStop(Number(m_DragFocus.idx % 8) + 1);
   gs.TweenLite.to(listMc.moveGuideMc,0.5,{_alpha:100,ease:gs.easing.Strong.easeOut});
   var _loc1_ = (n_Page - 1) * 350;
   saveX = m_DragFocus._y;
   saveY = m_DragFocus._x;
   m_DragFocus._y = _ymouse - 110 - n_ClickMousePosition;
   m_DragFocus.startDrag(false,_loc1_,-5,_loc1_,_loc2_);
   m_DragFocus.swapDepths(n_ChangeDepth);
   n_ChangeDepth = n_ChangeDepth + 1;
   CheckMouse = _xmouse;
}
function dragStop()
{
   listMc.sideL.gotoAndStop(1);
   listMc.sideR.gotoAndStop(1);
   m_DragFocus.stopDrag();
   delete m_DragFocus.onEnterFrame;
   ToGame_SelectCharacter_ListChange(m_DragFocus.id,Number(m_DragFocus.idx) + 1);
   gs.TweenLite.to(listMc.moveGuideMc,0.5,{_alpha:0,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(m_DragFocus,0.2,{_x:int(m_DragFocus.idx / 8) * 350,_y:m_DragFocus.idx % 8 * LINE_H,ease:gs.easing.Strong.easeOut});
   b_DragMode = false;
   if(m_LineFocus != m_DragFocus)
   {
      m_DragFocus.gotoAndStop(1);
      m_DragFocus.overAni.gotoAndStop(1);
   }
}
function setLineState(n_Num)
{
   var _loc3_ = listMc.box;
   for(var _loc9_ in _loc3_)
   {
      if(typeof _loc3_[_loc9_] == "movieclip")
      {
         var _loc1_ = _loc3_[_loc9_];
         if(n_Num > m_DragFocus.idx)
         {
            if(_loc1_.idx > m_DragFocus.idx && _loc1_.idx <= n_Num)
            {
               _loc1_.idx = _loc1_.idx - 1;
            }
         }
         else if(n_Num < m_DragFocus.idx)
         {
            if(_loc1_.idx < m_DragFocus.idx && _loc1_.idx >= n_Num)
            {
               _loc1_.idx = _loc1_.idx + 1;
            }
         }
         if(_loc1_ == m_DragFocus)
         {
            continue;
         }
         var _loc5_ = int(_loc1_.idx / 8) * 350;
         var _loc4_ = _loc1_.idx % 8 * LINE_H;
         gs.TweenLite.to(_loc1_,0.3,{_x:_loc5_,_y:_loc4_,ease:gs.easing.Strong.easeOut});
      }
   }
   m_DragFocus.idx = n_Num;
   listMc.moveGuideMc.gotoAndStop(Number(m_DragFocus.idx % 8) + 1);
}
function SetListClick()
{
   if(!m_LineFocus)
   {
      listMc.removeBtn.txt.text = "$012011";
      SetDisableButton(centerMc.startBtn,false);
      SetDisableButton(listMc.moveBtn,true);
      SetDisableButton(listMc.removeBtn,false);
      gs.TweenLite.to(centerMc.infoBox,1,{_x:20,_alpha:0,ease:gs.easing.Strong.easeOut});
      return undefined;
   }
   m_LineFocus.gotoAndStop(3);
   m_LineFocus.releaseAni.gotoAndPlay(2);
   m_LineFocus.txt.textColor = "0xffffff";
   SetDisableButton(listMc.moveBtn,false);
   SetDisableButton(listMc.removeBtn,true);
   if(m_LineFocus.delMc._visible)
   {
      listMc.removeBtn.txt.text = "$012052";
      SetDisableButton(centerMc.startBtn,false);
   }
   else
   {
      listMc.removeBtn.txt.text = "$012011";
      SetDisableButton(centerMc.startBtn,true);
   }
   centerMc.infoBox._visible = true;
   centerMc.infoBox._alpha = 0;
   centerMc.infoBox._x = 25;
   gs.TweenLite.to(centerMc.infoBox,1,{_x:125,_alpha:100,ease:gs.easing.Strong.easeOut});
}
function rollingBannerMenuRollOut(mc)
{
   mc._visible = false;
}
function setRollingBannerMenuEvent(menu)
{
   menu.onRollOver = function()
   {
      if(timerId != null)
      {
         clearTimeout(timerId);
         timerId = null;
      }
      if(currentIndex != this.index)
      {
         this.overMc._visible = true;
         lib.util.FrameSeeker.seek(this.overMc,this.overMc._currentframe,this.overMc._totalframes);
      }
   };
   menu.onRollOut = menu.onReleaseOutside = function()
   {
      if(currentIndex != this.index)
      {
         lib.util.FrameSeeker.seek(this.overMc,this.overMc._currentframe,1,rollingBannerMenuRollOut,this.overMc);
      }
      setRollingEvent();
   };
   menu.onRelease = function()
   {
      if(this.index == currentIndex)
      {
         return undefined;
      }
      clickedIndex = this.index;
      if(false == bRolling)
      {
         var _loc3_ = (currentViewIndex + 1) % 2;
         var _loc2_ = rollingBannerData[clickedIndex];
         setRollingBanner(_loc3_,_loc2_);
         changeRollingBanner();
      }
   };
}
function initRollingBanner()
{
   var _loc4_ = titleMc.rollingBannerBox;
   _loc4_._visible = false;
   var _loc3_ = 0;
   while(_loc3_ < MAX_COUNT_MENU)
   {
      var _loc2_ = _loc4_["menu_" + _loc3_];
      _loc2_.index = _loc3_;
      _loc2_.iconMc._visible = true;
      _loc2_.overMc._visible = false;
      setRollingBannerMenuEvent(_loc2_);
      _loc3_ = _loc3_ + 1;
   }
   _loc4_.img_light.onRollOver = function()
   {
      if(null != imgLightTimerId)
      {
         clearTimeout(imgLightTimerId);
         imgLightTimerId = null;
      }
      lib.util.FrameSeeker.seek(this,this._currentframe,this._totalframes);
      var _loc2_ = this._parent.tfMc;
      lib.util.FrameSeeker.seek(_loc2_,_loc2_._currentframe,_loc2_._totalframes);
      if(null != timerId)
      {
         clearTimeout(timerId);
         timerId = null;
      }
   };
   _loc4_.img_light.onRollOut = function()
   {
      lib.util.FrameSeeker.seek(this,this._currentframe,1);
      var _loc2_ = this._parent.tfMc;
      lib.util.FrameSeeker.seek(_loc2_,_loc2_._currentframe,1);
      setRollingEvent();
   };
   _loc4_.img_light.onRelease = function()
   {
      ToGame_SelectCharacter_ClickRollingBanner();
   };
   clearRollingBanner();
}
function clearRollingBanner()
{
   currentIndex = -1;
   currentViewIndex = -1;
   clickedIndex = -1;
   var _loc3_ = titleMc.rollingBannerBox;
   var _loc2_ = 0;
   while(_loc2_ < MAX_COUNT_MENU)
   {
      var _loc1_ = _loc3_["menu_" + _loc2_];
      _loc1_._visible = false;
      _loc1_.gotoAndStop(1);
      _loc1_.iconMc._visible = true;
      _loc1_.overMc._visible = false;
      _loc2_ = _loc2_ + 1;
   }
   _loc3_.tfMc = null;
   _loc3_.img_light.gotoAndStop(1);
   _loc3_.img_light_effect.gotoAndStop(1);
   _loc3_.img_light_effect._visible = false;
   _loc3_.img_0._visible = false;
   _loc3_.img_0._alpha = 0;
   _loc3_.img_1._visible = false;
   _loc3_.img_1._alpha = 0;
   _loc3_.tf_0._visible = false;
   _loc3_.tf_0._alpha = 0;
   _loc3_.tf_0.gotoAndStop(1);
   _loc3_.tf_1._visible = false;
   _loc3_.tf_1._alpha = 0;
   _loc3_.tf_1.gotoAndStop(1);
}
function setRollingBanner(targetViewIndex, obj)
{
   if(bRolling)
   {
      return undefined;
   }
   var _loc8_ = obj.index;
   var _loc5_ = obj.imgBD;
   var _loc7_ = obj.txt0;
   var _loc6_ = obj.txt1;
   var _loc2_ = titleMc.rollingBannerBox;
   var _loc3_ = _loc2_["img_" + targetViewIndex];
   var _loc1_ = _loc2_["tf_" + targetViewIndex];
   _loc1_.gotoAndStop(1);
   var _loc10_ = _loc2_["menu_" + _loc8_];
   _loc1_.tfMc.tf_0.htmlText = _loc7_;
   _loc1_.tfMc.tf_1.htmlText = _loc6_;
   _loc3_.clear();
   lib.display.DrawBitmapData.draw(_loc3_,_loc5_,0,0,0,0,ROLLING_IMAGE_WIDTH,ROLLING_IMAGE_HEIGHT);
}
function startRollingBanner()
{
   var _loc3_ = titleMc.rollingBannerBox;
   _loc3_.img_light_effect._visible = true;
   _loc3_.img_light_effect.gotoAndPlay(1);
   var _loc5_ = rollingBannerData.length;
   if(_loc5_ <= 0)
   {
      return undefined;
   }
   currentIndex = 0;
   var _loc4_ = Math.min(_loc5_,2);
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = rollingBannerData[_loc1_];
      setRollingBanner(_loc1_,_loc2_);
      _loc1_ = _loc1_ + 1;
   }
   currentViewIndex = 0;
   _loc3_.img_0._visible = _loc3_.tf_0._visible = true;
   _loc3_.menu_0.gotoAndPlay(1);
   _loc3_.img_0._alpha = 100;
   _loc3_.tf_0._alpha = 100;
   _loc3_.tfMc = tf_0;
   setRollingEvent();
   titleMc.rollingBannerBox._visible = true;
}
function setRollingEvent()
{
   if(timerId != null)
   {
      return undefined;
   }
   var _loc1_ = rollingBannerData.length;
   if(1 < _loc1_)
   {
      timerId = setTimeout(changeRollingBanner,5000);
   }
}
function changeRollingBanner()
{
   var _loc5_ = rollingBannerData.length;
   if(_loc5_ < 2)
   {
      return undefined;
   }
   if(bRolling)
   {
      return undefined;
   }
   bRolling = true;
   var _loc1_ = titleMc.rollingBannerBox;
   var _loc7_ = _loc1_["tf_" + currentViewIndex];
   var _loc8_ = _loc1_["img_" + currentViewIndex];
   var _loc3_ = _loc1_["menu_" + currentIndex];
   currentIndex = -1 == clickedIndex?++currentIndex % _loc5_:clickedIndex;
   currentViewIndex = ++currentViewIndex % 2;
   var _loc4_ = _loc1_["tf_" + currentViewIndex];
   var _loc6_ = _loc1_["img_" + currentViewIndex];
   var _loc2_ = _loc1_["menu_" + currentIndex];
   _loc4_._visible = _loc6_._visible = true;
   lib.util.FrameSeeker.seek(_loc3_,_loc3_._totalframes,1);
   lib.util.FrameSeeker.seek(_loc3_.iconMc,_loc3_.iconMc._totalframes,1);
   gs.TweenLite.to(_loc8_,0.5,{_alpha:0,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(_loc7_,0.5,{_alpha:0,ease:gs.easing.Strong.easeOut});
   lib.util.FrameSeeker.seek(_loc2_,1,_loc2_._totalframes);
   lib.util.FrameSeeker.seek(_loc2_.iconMc,1,_loc2_.iconMc._totalframes);
   _loc2_.overMc.gotoAndStop(1);
   _loc2_.overMc._visible = false;
   gs.TweenLite.to(_loc6_,0.5,{delay:0.1,_alpha:100,ease:gs.easing.Strong.easeOut});
   gs.TweenLite.to(_loc4_,0.5,{delay:0.1,_alpha:100,ease:gs.easing.Strong.easeOut,onComplete:changeRollingBannerEnd,onCompleteParams:[clickedIndex == -1]});
   if(-1 == clickedIndex)
   {
      clearTimeout(imgLightTimerId);
      imgLightTimerId = setTimeout(showImgLight,100);
   }
   _loc1_.tfMc = _loc4_;
   clickedIndex = -1;
}
function changeRollingBannerEnd(bSetTimer)
{
   bRolling = false;
   var _loc2_ = rollingBannerData.length;
   var _loc4_ = -1 == clickedIndex?(currentIndex + 1) % _loc2_:clickedIndex;
   var _loc5_ = (currentViewIndex + 1) % 2;
   var _loc3_ = rollingBannerData[_loc4_];
   setRollingBanner(_loc5_,_loc3_);
   var _loc1_ = titleMc.rollingBannerBox;
   _loc1_.tfMc = _loc1_["tf_" + currentViewIndex];
   if(-1 != clickedIndex)
   {
      changeRollingBanner();
   }
   else if(bSetTimer)
   {
      clearTimeout(timerId);
      timerId = null;
      setRollingEvent();
   }
}
function showImgLight()
{
   clearTimeout(imgLightTimerId);
   imgLightTimerId = null;
   var _loc2_ = titleMc.rollingBannerBox;
   var _loc1_ = _loc2_.img_light;
   lib.util.FrameSeeker.seek(_loc1_,_loc1_._currentframe,_loc1_._totalframes,setHideEventImgLight);
}
function setHideEventImgLight()
{
   imgLightTimerId = setTimeout(hideImgLight,1500);
}
function hideImgLight()
{
   clearTimeout(imgLightTimerId);
   imgLightTimerId = null;
   var _loc2_ = titleMc.rollingBannerBox;
   var _loc1_ = _loc2_.img_light;
   lib.util.FrameSeeker.seek(_loc1_,_loc1_._currentframe,1);
}
function DisableUI(bTrue)
{
   _root.setDisableUI(titleMc,bTrue);
   _root.setDisableUI(listMc,bTrue);
   _root.setDisableUI(btmLMc,bTrue);
   _root.setDisableUI(centerMc,bTrue);
}
_global.gfxExtensions = true;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var UI = this;
stop();
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() != "selectcharacter")
   {
      return undefined;
   }
   bWidgetOpen = bShow;
   if(bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      closeUIMotion();
      UI._visible = false;
      if(null != timerId)
      {
         clearTimeout(timerId);
         timerId = null;
      }
   }
};
myListener.OnGame_ChangeStageSize = function(width, height)
{
   if(width == undefined || height == undefined)
   {
      return undefined;
   }
   var _loc4_ = lib.info.AlignInfo.xRatioToPixel(0);
   var _loc2_ = lib.info.AlignInfo.xRatioToPixel(100);
   var _loc1_ = lib.info.AlignInfo.yRatioToPixel(0);
   var _loc3_ = lib.info.AlignInfo.yRatioToPixel(100);
   var _loc5_ = lib.info.AlignInfo.xRatioToPixel(50);
   var _loc6_ = lib.info.AlignInfo.yRatioToPixel(50);
   listMc._x = _loc4_;
   listMc._y = _loc1_;
   vipLine._x = _loc2_;
   vipLine._y = _loc1_;
   titleMc._x = _loc2_;
   if(vipLine._currentframe == 1)
   {
      titleMc._y = _loc1_;
   }
   else
   {
      titleMc._y = _loc1_ + 72;
   }
   centerMc._x = _loc5_;
   centerMc._y = _loc3_;
   btmLMc._x = _loc2_;
   btmLMc._y = _loc3_;
};
titleMc.eventBox._visible = false;
myListener.OnGame_SelectCharacter_VipGrade = function(type, level)
{
   var _loc1_ = Number(type) + 1;
   vipLine.gotoAndStop(_loc1_);
   vipLine.num.text = level;
   if(_loc1_ == 2)
   {
      vipLine.txt.textColor = "0xff8954";
      vipLine.num.textColor = "0xff8954";
   }
   else if(_loc1_ == 3)
   {
      vipLine.txt.textColor = "0x9ec7f2";
      vipLine.num.textColor = "0x9ec7f2";
   }
   else
   {
      vipLine.txt.textColor = "0xffbe33";
      vipLine.num.textColor = "0xffbe33";
   }
   var _loc3_ = vipLine.txt.textWidth;
   var _loc4_ = vipLine.num.textWidth;
   vipLine.txt._x = -182 - (_loc3_ + _loc4_ + 5) / 2;
   vipLine.num._x = vipLine.txt._x + _loc3_ + 7;
   var _loc2_ = lib.info.AlignInfo.yRatioToPixel(0);
   if(_loc1_ > 1)
   {
      titleMc._y = _loc2_ + 72;
   }
   else
   {
      titleMc._y = _loc2_;
   }
};
myListener.OnGame_SelectCharacter_InviteCodeClose = function()
{
   DisableUI(false);
};
myListener.OnGame_SelectCharacter_InviteCode = function(bMode, txt0, txt1, btnMode)
{
   titleMc.eventBox._visible = Boolean(Number(bMode));
   titleMc.eventBox.bMode = Boolean(Number(btnMode));
   titleMc.eventBox.onRollOver = function()
   {
      if(!this.bMode)
      {
         return undefined;
      }
      Sound_Play();
      this.gotoAndStop(2);
   };
   titleMc.eventBox.onRollOut = function()
   {
      if(!this.bMode)
      {
         return undefined;
      }
      this.gotoAndStop(1);
   };
   titleMc.eventBox.onPress = function()
   {
      if(!this.bMode)
      {
         return undefined;
      }
      this.gotoAndStop(3);
   };
   titleMc.eventBox.onRelease = titleMc.eventBox.onReleaseOutside = function()
   {
      if(!this.bMode)
      {
         return undefined;
      }
      this.gotoAndStop(1);
      ToGame_SelectCharacter_InviteCode();
   };
   if(txt0 != undefined)
   {
      titleMc.eventBox.guideTxt0.htmlText = txt0;
   }
   if(txt1 != undefined)
   {
      titleMc.eventBox.guideTxt1.htmlText = txt1;
   }
   titleMc.eventBox.guideTxt0.verticalAlign = "center";
   alignBanner();
};
var m_ClickFocus = undefined;
var m_DragFocus = undefined;
var m_OverFocus = undefined;
var LINE_H = 48;
var LINE_MAX = 384;
var m_LineFocus = undefined;
var n_LineCount = -1;
var m_ModeBtn;
var m_OptionBtn;
var m_MemberBtn;
var m_VideoBtn;
var DELETECOLOR = "#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16);
myListener.OnGame_SetUIPosition = function()
{
   if(!closeUI_Check)
   {
      _level0.OnGameEvent("OnGameEvent_SystemOption_LobbyOpen",lib.info.AlignInfo.xRatioToPixel(39),lib.info.AlignInfo.yRatioToPixel(15));
   }
};
myListener.OnGame_Lobby_Disappear = function()
{
   getUrl("FSCommand:ToGame_MainMenu_RequestShowUI", "SystemOption\t0");
   closeUIMotion();
};
myListener.OnGame_SelectCharacter_ListClear = function()
{
   var _loc1_ = listMc.box;
   for(var _loc2_ in _loc1_)
   {
      if(typeof _loc1_[_loc2_] == "movieclip")
      {
         _loc1_[_loc2_].removeMovieClip();
      }
   }
   m_LineFocus = undefined;
   n_LineCount = -1;
   listMc.removeBtn.txt.text = "$012011";
};
myListener.OnGame_SelectCharacter_SetListAdd = function(s_DataList)
{
   var _loc4_ = lib.util.ExtString.split(s_DataList,"\t");
   var _loc5_ = _loc4_[0];
   var _loc11_ = _loc4_[1];
   var _loc12_ = Number(_loc4_[2]) + 1;
   var _loc8_ = _loc4_[3];
   var _loc7_ = Boolean(Number(_loc4_[4]));
   var _loc2_ = listMc.box["line" + _loc5_];
   if(!_loc2_)
   {
      _loc2_ = listMc.box.attachMovie("lineMc","line" + _loc5_,n_ChangeDepth);
      n_ChangeDepth++;
      n_LineCount++;
      _loc2_._x = int(n_LineCount / 8) * 350;
      _loc2_._y = n_LineCount % 8 * LINE_H;
      _loc2_.id = _loc5_;
      _loc2_.idx = n_LineCount;
      _loc2_.classMc.gotoAndStop(_loc12_);
      _loc2_.txt.verticalAlign = "center";
      var _loc3_ = lib.util.UIString.getUIString("$012046");
      _loc3_ = _loc3_ + (_loc8_ + " " + _loc11_);
      _loc2_.txt.multiline = false;
      _loc2_.txt.text = _loc3_;
      if(_loc2_.txt.textWidth > _loc2_.txt._width)
      {
         var _loc6_ = _loc2_.txt.getCharIndexAtPoint(212,20);
         var _loc10_ = _loc3_.substr(0,_loc6_);
         var _loc9_ = _loc3_.substr(_loc6_);
         _loc3_ = _loc10_ + "\n" + _loc9_;
         _loc2_.txt.multiline = true;
         _loc2_.txt.text = _loc3_;
      }
   }
   lib.manager.ToolTip.remove(_loc2_.abledIcon);
   _loc2_.saveData = s_DataList;
   _loc2_.delMc._visible = false;
   _loc2_.cMc._visible = false;
   _loc2_.abledIcon._visible = false;
   if(false == _loc7_)
   {
      _loc2_.abledIcon.gotoAndStop(1);
   }
   lib.manager.ToolTip.add(_loc2_.abledIcon,lib.util.UIString.getUIString("$012080"),1);
   _loc2_.onRollOver = function()
   {
      if(this._currentframe == 4 || m_LineFocus == this)
      {
         return undefined;
      }
      this.gotoAndStop(2);
      Sound_Play();
      lib.util.FrameSeeker.seek(this.overAni,1,6);
   };
   _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
   {
      if(this._currentframe == 4 || m_LineFocus == this)
      {
         return undefined;
      }
      this.gotoAndStop(1);
      lib.util.FrameSeeker.seek(this.overAni,6,1);
   };
   _loc2_.onPress = function()
   {
      dragCheck(this);
      if(this._currentframe == 4 || m_LineFocus == this)
      {
         return undefined;
      }
      this.gotoAndStop(3);
   };
   _loc2_.onRelease = function()
   {
      if(this._currentframe == 4 || b_DragMode)
      {
         return undefined;
      }
      if(m_ClickFocus != this && b_DragLock)
      {
         m_ClickFocus = this;
         ToGame_SelectCharacter_LineClick(this.id);
         m_LineFocus.gotoAndStop(1);
         lib.util.FrameSeeker.seek(m_LineFocus.overAni,6,1);
         m_LineFocus = this;
         SetListClick();
      }
   };
};
myListener.OnGame_SelectCharacter_SetListDel = function(s_Id)
{
   var _loc1_ = listMc.box["line" + s_Id];
   var _loc2_ = _loc1_.idx;
   _loc1_.removeMovieClip();
   n_LineCount--;
};
myListener.OnGame_SelectCharacter_SetListFocus = function(s_Id)
{
   var _loc1_ = listMc.box["line" + s_Id];
   m_LineFocus.gotoAndStop(1);
   lib.util.FrameSeeker.seek(m_LineFocus.overAni,6,1);
   m_LineFocus = m_ClickFocus = _loc1_;
   SetListClick();
};
myListener.OnGame_SelectCharacter_SetListState = function(s_Id, s_Mode)
{
   var _loc1_ = listMc.box["line" + s_Id];
   if(!_loc1_)
   {
      return undefined;
   }
   if(s_Mode == "0")
   {
      _loc1_.gotoAndStop(4);
      _loc1_.delMc._visible = false;
   }
   else if(s_Mode == "1")
   {
      _loc1_.gotoAndStop(1);
      _loc1_.delMc._visible = false;
      listMc.removeBtn.txt.text = "$012011";
      if(m_LineFocus)
      {
         SetDisableButton(centerMc.startBtn,true);
      }
   }
   else
   {
      _loc1_.delMc._visible = true;
      listMc.removeBtn.txt.text = "$012052";
      SetDisableButton(centerMc.startBtn,false);
   }
};
myListener.OnGame_SelectCharacter_SetServerName = function(serverName)
{
   if(serverName == undefined)
   {
      serverName = "";
   }
   titleMc.serverTxt.htmlText = serverName;
};
var rollingBannerData = new Array();
var timerId = null;
var currentIndex = 0;
var currentViewIndex = 0;
var currentInfo = null;
var clickedIndex = -1;
var bRolling = false;
var MAX_COUNT_MENU = 7;
var menuDefaultAlpha = 80;
var menuDefaultPosY = -23;
var bannerTitle = ["$013232"];
var BANNER_IMG_WIDTH = 378;
var BANNER_IMG_HEIGHT = 108;
var bannerIdArray = new Array();
var maxBannerCount = 0;
var currentBannerCount = 0;
myListener.OnGame_SelectCharacter_SetBannerList = function(s_DataList)
{
   var _loc12_ = lib.util.ExtString.split(s_DataList,"\n");
   var _loc13_ = _loc12_.length;
   var _loc14_ = 0;
   currentBannerCount = _loc13_;
   var _loc4_ = 0;
   while(_loc4_ < maxBannerCount)
   {
      var _loc2_ = titleMc.bannerBox["banner_" + _loc4_];
      _loc2_._visible = false;
      _loc4_ = _loc4_ + 1;
   }
   _loc4_ = 0;
   while(_loc4_ < _loc13_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc12_[_loc4_],"\t");
      var _loc10_ = _loc3_[0];
      var _loc5_ = _loc3_[1];
      var _loc7_ = _loc3_[2];
      var _loc9_ = _loc3_[3];
      var _loc6_ = _loc3_[4];
      var _loc11_ = Boolean(Number(_loc3_[5]));
      _loc2_ = titleMc.bannerBox["banner_" + _loc4_];
      if(undefined == _loc2_)
      {
         _loc2_ = titleMc.bannerBox.attachMovie("bannerMc","banner_" + _loc4_,titleMc.bannerBox.getNextHighestDepth());
         _loc2_._y = 120 * _loc4_;
         maxBannerCount++;
      }
      _loc2_._visible = true;
      _loc2_.img.clear();
      _loc2_.id = _loc10_;
      _loc2_.titleTxt.htmlText = _loc7_;
      _loc2_.infoTxt.htmlText = _loc9_;
      _loc2_.subTxt.htmlText = _loc6_;
      _loc2_.bInteraction = _loc11_;
      var _loc8_ = flash.display.BitmapData.loadBitmap(_loc5_);
      lib.display.DrawBitmapData.draw(_loc2_.img,_loc8_,0,0,0,0,BANNER_IMG_WIDTH,BANNER_IMG_HEIGHT);
      _loc2_.hit.onRollOver = function()
      {
         if(false == this._parent.bInteraction)
         {
            return undefined;
         }
         Sound_Play();
         this._parent.gotoAndStop(2);
      };
      _loc2_.hit.onRollOut = function()
      {
         if(false == this._parent.bInteraction)
         {
            return undefined;
         }
         this._parent.gotoAndStop(1);
      };
      _loc2_.hit.onPress = function()
      {
         if(false == this._parent.bInteraction)
         {
            return undefined;
         }
         this._parent.gotoAndStop(3);
      };
      _loc2_.hit.onRelease = _loc2_.hit.onReleaseOutside = function()
      {
         if(false == this._parent.bInteraction)
         {
            return undefined;
         }
         this._parent.gotoAndStop(1);
         ToGame_SelectCharacter_BannerClick(this._parent.id);
      };
      _loc4_ = _loc4_ + 1;
   }
   alignBanner();
};
myListener.OnGame_SelectCharacter_SetMyInfo = function(s_AccountTime, s_Buff, s_AccountType, s_InfoStr)
{
   titleMc.accountTxt._width = 680;
   titleMc.buffTxt._width = 680;
   var _loc1_ = lib.util.ExtString.split(s_AccountTime,"\t");
   var _loc10_ = "";
   var _loc3_ = "";
   var _loc5_ = "";
   s_AccountType = Number(s_AccountType);
   if(s_AccountType == 0)
   {
      _loc5_ = lib.util.UIString.getUIString("$012033");
   }
   else if(s_AccountType == 1)
   {
      _loc5_ = lib.util.UIString.getUIString("$012034") + " ";
   }
   else if(s_AccountType == 2)
   {
      _loc5_ = lib.util.UIString.getUIString("$012035") + " ";
   }
   else if(s_AccountType == 3)
   {
      _loc5_ = lib.util.UIString.getUIString("$012036") + " ";
   }
   else if(s_AccountType == 4)
   {
      _loc5_ = lib.util.UIString.getUIString("$012041") + " ";
   }
   var _loc2_ = _loc1_.length - 1;
   if(s_AccountType == "1")
   {
      _loc3_ = lib.util.UIString.getUIString("$012028","year",_loc1_[0],"month",_loc1_[1],"day",_loc1_[2],"hour",_loc1_[3],"minute",_loc1_[4]);
   }
   else if(s_AccountType == "2")
   {
      if(Number(_loc1_[_loc2_]) != 0 && Number(_loc1_[_loc2_ - 1]) != 0)
      {
         _loc3_ = lib.util.UIString.getUIString("$012029","hour",_loc1_[_loc2_ - 1],"minute",_loc1_[_loc2_]);
      }
      else if(Number(_loc1_[_loc2_]) == 0 && Number(_loc1_[_loc2_ - 1]) != 0)
      {
         _loc3_ = lib.util.UIString.getUIString("$012030","hour",_loc1_[_loc2_ - 1]);
      }
      else if(Number(_loc1_[_loc2_]) != 0 && Number(_loc1_[_loc2_ - 1]) == 0)
      {
         _loc3_ = lib.util.UIString.getUIString("$012031","minute",_loc1_[_loc2_]);
      }
      else if(Number(_loc1_[_loc2_]) == 0 && Number(_loc1_[_loc2_ - 1]) == 0)
      {
         _loc3_ = lib.util.UIString.getUIString("$012032","time",1);
      }
   }
   else if(s_AccountType == "4")
   {
      _loc3_ = s_AccountTime;
   }
   var _loc6_ = "";
   if(s_Buff == undefined || s_Buff == "" || Number(s_Buff) == 0)
   {
      _loc6_ = "";
   }
   else
   {
      _loc6_ = lib.util.UIString.getUIString("$012018","time",s_Buff);
   }
   titleMc.buffTxt.text = _loc6_;
   if(s_InfoStr != undefined && s_InfoStr != "")
   {
      titleMc.accountTxt.text = _loc5_ + _loc3_ + "\n" + s_InfoStr;
   }
   else
   {
      titleMc.accountTxt.text = _loc5_ + _loc3_;
   }
   titleMc.accountTxt._width = titleMc.accountTxt.textWidth + 10;
   titleMc.accountTxt._x = - titleMc.accountTxt.textWidth - 40;
   titleMc.buffTxt._width = titleMc.buffTxt.textWidth + 10;
   titleMc.buffTxt._x = - titleMc.buffTxt.textWidth - 40;
};
myListener.OnGame_SelectCharacter_SetDetailData = function(s_DataList)
{
   var _loc1_ = lib.util.ExtString.split(s_DataList,"\t");
   centerMc.infoBox.txt0.text = "Lv." + _loc1_[1];
   centerMc.infoBox.txt1.verticalAlign = "center";
   centerMc.infoBox.txt1.multiline = false;
   var _loc2_ = _loc1_[0];
   centerMc.infoBox.txt1.text = _loc2_;
   if(centerMc.infoBox.txt1.textWidth > centerMc.infoBox.txt1._width)
   {
      var _loc3_ = centerMc.infoBox.txt1.getCharIndexAtPoint(295,20);
      var _loc5_ = _loc2_.substr(0,_loc3_);
      var _loc4_ = _loc2_.substr(_loc3_);
      _loc2_ = _loc5_ + "\n" + _loc4_;
      centerMc.infoBox.txt1.multiline = true;
      centerMc.infoBox.txt1.text = _loc2_;
   }
   centerMc.infoBox.gotoAndStop(Number(_loc1_[13]) + 1);
   if(_loc1_[10] == undefined)
   {
      centerMc.infoBox.txt2.text = "";
   }
   else
   {
      centerMc.infoBox.txt2.text = _loc1_[10];
   }
   if(_loc1_[11] == undefined)
   {
      centerMc.infoBox.txt3.text = "";
   }
   else
   {
      centerMc.infoBox.txt3.text = _loc1_[11];
   }
   if(_loc1_[17] == undefined)
   {
      centerMc.infoBox.txt4.text = "";
   }
   else
   {
      centerMc.infoBox.txt4.text = _loc1_[17];
   }
   if(_loc1_[18] == undefined)
   {
      centerMc.infoBox.txt5.text = "";
   }
   else
   {
      centerMc.infoBox.txt5.autoSize = true;
      centerMc.infoBox.txt5.setText(_loc1_[18]);
   }
   etmc.deleteremain_title.textColor = lib.info.TextColor.UI_LOBBY_INFOSUBTITLE;
   if(_loc1_[13] == 1)
   {
      centerMc.infoBox.txt2.htmlText = _loc1_[14];
      centerMc.infoBox.txt3.htmlText = _loc1_[15];
      centerMc.infoBox.txt1.htmlText = centerMc.infoBox.txt1.htmlText + (" <font color=\'" + DELETECOLOR + "\'>[" + lib.util.UIString.getUIString("$012025") + "]</font>");
   }
   else if(_loc1_[13] == 2)
   {
      centerMc.infoBox.txt2.htmlText = _loc1_[14];
      centerMc.infoBox.txt3.htmlText = _loc1_[15];
      centerMc.infoBox.txt1.htmlText = centerMc.infoBox.txt1.htmlText + (" <font color=\'" + DELETECOLOR + "\'>[" + lib.util.UIString.getUIString("$012026") + "]</font>");
   }
   centerMc.infoBox.guildMc.clear();
   lib.util.DrawBitmap.draw(centerMc.infoBox.guildMc,_loc1_[19],32,32);
};
myListener.OnGame_SelectCharacter_SetAchievment = function(s_Grade, s_Score)
{
   var _loc1_ = lib.util.UIString.getUIString("$272012");
   if(s_Score == undefined)
   {
      centerMc.infoBox.txt6.text = "";
   }
   else
   {
      centerMc.infoBox.txt6.text = s_Score + _loc1_;
   }
   centerMc.infoBox.gradeMc.gotoAndStop(Number(s_Grade) + 1);
};
var m_PageBtnL;
var m_PageBtnR;
var n_Page = 1;
var t_Page = -1;
m_PageBtnL = new lib.util.TxtBtn(listMc.pageBtnL);
m_PageBtnR = new lib.util.TxtBtn(listMc.pageBtnR);
m_PageBtnL.setRelease(function()
{
   ToGame_SelectCharacter_IntergrationPageNumber(-1,"click");
}
);
m_PageBtnR.setRelease(function()
{
   ToGame_SelectCharacter_IntergrationPageNumber(1,"click");
}
);
myListener.OnGame_SelectCharacter_IntergrationSet = function(flag)
{
   if(flag == "1")
   {
      listMc.pageTxt._visible = true;
      listMc.pageBtnL._visible = true;
      listMc.pageBtnR._visible = true;
   }
   else
   {
      listMc.pageTxt._visible = false;
      listMc.pageBtnL._visible = false;
      listMc.pageBtnR._visible = false;
   }
   m_PageBtnR.setEnabled(false);
   m_PageBtnR.setEnabled(false);
};
myListener.OnGame_SelectCharacter_IntergrationPage = function(cntnum, total)
{
   listMc.pageTxt.text = cntnum + " / " + total;
   n_Page = cntnum;
   t_Page = total;
   PageChange(cntnum);
   IntergrationBtn(cntnum,total);
};
var pageChangeLock = false;
var pageChangeType = "click";
myListener.OnGame_SelectCharacter_IntergrationDeleteCharacter = function(_num)
{
   if(_num == "" || _num == null || _num == undefined || _num == "undefined")
   {
      listMc.pageTxt1.text = "";
   }
   else
   {
      var _loc2_ = lib.util.UIString.getUIString("$012037","deletecharacternum",_num);
      listMc.pageTxt1.text = _loc2_;
   }
};
listMc.pageTxt2._visible = false;
myListener.OnGame_SelectCharacter_IntergrationValidity = function(flag, count, date)
{
   if(flag == "1")
   {
      listMc.pageTxt2._visible = true;
   }
   else
   {
      listMc.pageTxt2._visible = false;
   }
   if(date == undefined || date == null || date == "" || date == "undefined")
   {
      var _loc3_ = lib.util.UIString.getUIString("$012039","pccount",count);
      listMc.pageTxt2.text = _loc3_;
   }
   else
   {
      var _loc2_ = lib.util.ExtString.split(date,"\t");
      _loc3_ = lib.util.UIString.getUIString("$012038","pccount",count,"deletecharacteryear",_loc2_[0],"deletecharactermonth",_loc2_[1],"deletecharacterdate",_loc2_[2]);
      listMc.pageTxt2.text = _loc3_;
   }
};
var s_ChangePage = "end";
myListener.OnGame_SelectCharacter_ChangePageBegin = function()
{
   s_ChangePage = "start";
   if(pageChangeType == "click")
   {
      return undefined;
   }
   var _loc1_ = int(n_LY / LINE_H) + n_ChangePage * 8;
   if(n_ChangePage == t_Page - 1)
   {
      var _loc2_ = n_LineCount % 8 * LINE_H;
      if(n_LY >= _loc2_)
      {
         setLineState(n_LineCount);
      }
      else
      {
         setLineState(_loc1_,1);
      }
   }
   else
   {
      setLineState(_loc1_);
   }
   m_DragFocus._y = n_LY;
   m_DragFocus.stopDrag();
   m_DragFocus.startDrag(false,n_LX,-5,n_LX,LINE_MAX - 38);
};
myListener.OnGame_SelectCharacter_ChangePageEnd = function()
{
   s_ChangePage = "end";
   if(pageChangeType == "click")
   {
      return undefined;
   }
   if(m_DragFocus)
   {
      var _loc1_ = Number(m_DragFocus.idx) + 1;
      ToGame_SelectCharacter_ListChange(m_DragFocus.id,_loc1_);
   }
};
var classNameToolTipIdArray = ["$012081","$012082","$012083","$012084","$012085","$012086","$012087","$012088","$012089","$012090","$012091","$012092","$012093"];
var classNameToolTipArray = new Array();
var i = 0;
while(i < classNameToolTipIdArray.length)
{
   var classNameId = classNameToolTipIdArray[i];
   var classNameToolTipStr = lib.util.UIString.getUIString(classNameId);
   classNameToolTipArray.push(classNameToolTipStr);
   i++;
}
myListener.OnGame_SelectCharacter_SetRollingBannerList = function(s_DataList)
{
   if(timerId != null)
   {
      clearTimeout(timerId);
      timerId = null;
   }
   rollingBannerData = [];
   clearRollingBanner();
   var _loc6_ = lib.util.ExtString.split(s_DataList,"\n");
   var _loc7_ = _loc6_.length;
   var _loc8_ = titleMc.rollingBannerBox;
   var _loc5_ = 0;
   while(_loc5_ < _loc7_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc6_[_loc5_],"\t");
      var _loc1_ = new Object();
      _loc1_.index = _loc5_;
      _loc1_.id = _loc2_[0];
      _loc1_.buttonType = _loc2_[1];
      var _loc4_ = Number(_loc2_[2]);
      _loc1_.classType = _loc4_;
      _loc1_.img = _loc2_[3];
      _loc1_.imgBD = flash.display.BitmapData.loadBitmap(_loc1_.img);
      _loc1_.txt0 = _loc2_[4];
      _loc1_.txt1 = _loc2_[5];
      _loc1_.txt2 = _loc2_[6];
      _loc1_.txt3 = _loc2_[7];
      var _loc3_ = _loc8_["menu_" + _loc5_];
      lib.manager.ToolTip.remove(_loc3_);
      _loc3_.overMc.mark.gotoAndStop(_loc4_ + 1);
      _loc3_.iconMc.mark_g.mark.gotoAndStop(_loc4_ + 1);
      _loc3_.iconMc.mark_w.mark.gotoAndStop(_loc4_ + 1);
      lib.manager.ToolTip.add(_loc3_,classNameToolTipArray[_loc4_],1);
      _loc3_._visible = true;
      rollingBannerData.push(_loc1_);
      _loc5_ = _loc5_ + 1;
   }
   startRollingBanner();
   alignBanner();
};
var mouseListner = {};
var b_DragMode = false;
var b_DragLock = true;
myListener.OnGame_DoubleClick = function(target)
{
   if(doubleCount < 2)
   {
      return undefined;
   }
   doubleCount = 0;
   if(m_LineFocus == target._parent)
   {
      ToGame_SelectCharacter_StartGame();
   }
};
var doubleCount = 0;
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 1)
   {
      doubleCount++;
   }
   else
   {
      doubleCount = 0;
   }
   if(b_DragLock)
   {
      return undefined;
   }
   if(button == 2)
   {
      if(!b_DragMode)
      {
         DragLockOff();
      }
   }
};
mouseListner.onMouseUp = function()
{
   delete m_ClickFocus.onEnterFrame;
   delete listMc.box.onEnterFrame;
   if(!b_DragMode)
   {
      return undefined;
   }
   if(s_ChangePage == "start")
   {
      gs.TweenLite.to(listMc.moveGuideMc,0.1,{onComplete:dragStop});
   }
   else
   {
      dragStop();
   }
};
mouseListner.onMouseMove = function()
{
   if(!b_DragMode)
   {
      return undefined;
   }
   var _loc2_ = CheckMouse - _xmouse;
   var _loc1_ = int(m_DragFocus._y / LINE_H) + (n_Page - 1) * 8;
   pageChangeCheck(_loc2_);
   if(_loc1_ == m_DragFocus.idx)
   {
      return undefined;
   }
   if(_loc1_ > n_LineCount)
   {
      _loc1_ = n_LineCount;
   }
   if(_loc1_ < 0)
   {
      _loc1_ = 0;
   }
   setLineState(_loc1_);
};
var n_ChangeDepth = 0;
var n_LX = 0;
var n_LY = 0;
var n_ChangePage = 0;
var n_ClickMousePosition = 0;
var CheckMouse = 0;
var saveX = 0;
var saveY = 0;
initRollingBanner();
var ROLLING_IMAGE_WIDTH = 378;
var ROLLING_IMAGE_HEIGHT = 150;
var ROLLING_SKILL_POS_X = 256;
var ROLLING_SKILL_POS_Y = 110;
var ROLLING_SKILL_SIZE = 34;
var ROLLING_SKILL_SCALE = ROLLING_SKILL_SIZE / 64;
var imgLightTimerId = null;
myListener.OnGame_ChangeStageSize(Stage.width,Stage.height);
FrameStart();
