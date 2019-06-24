function release(num, notSendToGame)
{
   if(notSendToGame != 1)
   {
      ToGame_PlayGuide_LinkClick(btnIds[num]);
   }
}
function BannerAuto()
{
   gs.TweenLite.killTweensOf(container_mc.topMc.addMc2,false);
   gs.TweenLite.to(container_mc.topMc.addMc2,BannerTime,{onComplete:BannerEvent});
}
function BannerEvent()
{
   var _loc1_ = BannerIndex + 1;
   if(_loc1_ >= BannerLen)
   {
      _loc1_ = 0;
   }
   BannerChange(_loc1_,"auto");
}
function BannerStop()
{
   gs.TweenLite.killTweensOf(container_mc.topMc.addMc2,false);
}
function BannerChange(idx, type)
{
   BannerAuto();
   if(idx == BannerIndex || BannerMotion)
   {
      return undefined;
   }
   BannerMotion = true;
   var _loc1_ = container_mc.topMc.addMc2;
   BannerFocus.gotoAndStop(1);
   BannerFocus = _loc1_["check" + idx];
   BannerFocus.gotoAndStop(2);
   var _loc2_ = 0;
   if(type == "click")
   {
      if(BannerIndex < idx)
      {
         _loc1_.box1._x = 215;
         _loc2_ = -215;
      }
      else
      {
         _loc1_.box1._x = -215;
         _loc2_ = 215;
      }
   }
   else if(BannerIndex < idx || idx == 0)
   {
      _loc1_.box1._x = 215;
      _loc2_ = -215;
   }
   else
   {
      _loc1_.box1._x = -215;
      _loc2_ = 215;
   }
   _loc1_.box0._x = 0;
   _loc1_.box1._visible = true;
   _loc1_.box1.clear();
   lib.display.DrawBitmapData.draw(_loc1_.box1,BannerFocus.img,0,0,0,0,215,211,1);
   _loc1_.box1.mainTxt.setText(BannerFocus.titleTxt);
   _loc1_.box1.subTxt.htmlText = BannerFocus.subTxt;
   gs.TweenLite.killTweensOf(_loc1_.box0,false);
   gs.TweenLite.to(_loc1_.box0,0.4,{_x:_loc2_,ease:Strong.easeIn});
   gs.TweenLite.killTweensOf(_loc1_.box1,false);
   gs.TweenLite.to(_loc1_.box1,0.4,{_x:0,ease:Strong.easeIn,onComplete:bannerMotionEnd});
   BannerIndex = idx;
   BannerLock = false;
}
function bannerMotionEnd()
{
   var _loc1_ = container_mc.topMc.addMc2;
   gs.TweenLite.killTweensOf(_loc1_.box0,false);
   _loc1_.box0.clear();
   _loc1_.box0._x = 0;
   lib.display.DrawBitmapData.draw(_loc1_.box0,BannerFocus.img,0,0,0,0,215,211,1);
   _loc1_.box0.mainTxt.setText(BannerFocus.titleTxt);
   _loc1_.box0.subTxt.htmlText = BannerFocus.subTxt;
   _loc1_.box1._visible = false;
   BannerMotion = false;
}
function ToGame_PlayGuide_BannerClick()
{
   getURL("FSCommand:ToGame_PlayGuide_BannerClick",BannerFocus.id);
}
function setPostion()
{
   var _loc1_ = subMissionBox.length;
   if(_loc1_ > 1)
   {
      subMissionBox[0]._x = SUB_BOX_POS_X_0;
      subMissionBox[1]._x = SUB_BOX_POS_X_1;
      container_mc.topMc.missionBg._x = SUB_BOX_POS_X_0 - MBG_POS_SPACE;
   }
   else
   {
      subMissionBox[0]._x = SUB_BOX_POS_X_1;
      container_mc.topMc.missionBg._x = SUB_BOX_POS_X_1 - MBG_POS_SPACE;
   }
}
function ToGame_PlayGuide_QuickMatching(id)
{
   getURL("FSCommand:ToGame_PlayGuide_QuickMatching",id);
}
function ToGame_PlayGuide_DungoenBtnClicked(dungeonCode)
{
   getURL("FSCommand:ToGame_PlayGuide_DungoenBtnClicked",dungeonCode);
}
function PlayGuideView(b_Mode)
{
   container_mc.topMc._visible = b_Mode;
   container_mc.btmMc._visible = b_Mode;
   container_mc.tipBtn._visible = b_Mode;
}
function EventPagePosition(num)
{
   var _loc4_ = todayMcArr.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc4_)
   {
      var _loc1_ = todayMcArr[_loc3_];
      _loc1_.bg._width = num;
      _loc1_.btnMc._width = num;
      _loc1_.txt0._width = num - 40;
      _loc1_.txt1._width = num - 40;
      _loc1_.txt2._width = num - 40;
      _loc3_ = _loc3_ + 1;
   }
   container_mc.todayMc.scrollbar2._x = num;
}
function SetLineButton(m_Btn)
{
   m_Btn._alpha = 0;
   m_Btn.onRollOver = function()
   {
      this._alpha = 100;
   };
   m_Btn.onRollOut = m_Btn.onReleaseOutside = function()
   {
      this._alpha = 0;
   };
   m_Btn.onRelease = function()
   {
      this._alpha = 0;
      ToGame_PlayGuide_TodayEventClick(this._parent.id);
   };
}
function setBtn2(mc, _mode)
{
   var _loc1_ = new lib.util.TxtBtn(mc.btn,mc.txt);
   _loc1_.setTextColor("0xffffff","0xefe78f","0xd7d7d7","0x485460");
   _loc1_.setRelease(function()
   {
      ToGame_PlayGuide_AttendEventClick(mc);
   }
   );
   _loc1_.setEnabled(Boolean(Number(_mode)));
}
function ToGame_PlayGuide_TodayEventClick(id)
{
   getURL("FSCommand:ToGame_PlayGuide_TodayEventClick",id);
}
function ToGame_PlayGuide_AttendEventClick(mc)
{
   mc.txt._y = 74;
   getURL("FSCommand:ToGame_PlayGuide_AttendEventClick",mc.dayNum);
}
function ToGame_PlayGuide_AttendNextMonth()
{
   fscommand("ToGame_PlayGuide_AttendNextMonth");
}
function ToGame_PlayGuide_AttendPrevMonth()
{
   fscommand("ToGame_PlayGuide_AttendPrevMonth");
}
function ToGame_PlayGuide_ComebackCheck(mc)
{
   if(mc.checkMode)
   {
      mc.checkMode = false;
      getURL("FSCommand:ToGame_PlayGuide_ComebackMenual",true);
   }
   else
   {
      mc.checkMode = true;
      getURL("FSCommand:ToGame_PlayGuide_ComebackMenual",false);
   }
}
function ToGame_PlayGuide_ComebackClick(type)
{
   getURL("FSCommand:ToGame_PlayGuide_ComebackClick",type);
}
function ToGame_PlayGuide_Init()
{
   fscommand("ToGame_PlayGuide_Init");
}
function ToGame_PlayGuide_CloseUI()
{
   fscommand("ToGame_PlayGuide_CloseUI");
}
function ToGame_PlayGuide_LinkClick(idx)
{
   getURL("FSCommand:ToGame_PlayGuide_LinkClick",idx);
}
function ToGame_PlayGuide_ListClick(id)
{
   getURL("FSCommand:ToGame_PlayGuide_ListClick",id);
}
function ToGame_PlayGuide_CompleteClick(id)
{
   getURL("FSCommand:ToGame_PlayGuide_CompleteClick",id);
}
function ToGame_PlayGuide_CheckClick(id, type)
{
   getURL("FSCommand:ToGame_PlayGuide_CheckClick",id + "\t" + type);
}
function ToGame_PlayGuide_AdditionClick()
{
   fscommand("ToGame_PlayGuide_AdditionClick");
}
function ToGame_PlayGuide_NextMission()
{
   fscommand("ToGame_PlayGuide_NextMission");
}
function ToGame_PlayGuide_PrevMission()
{
   fscommand("ToGame_PlayGuide_PrevMission");
}
function ToGame_PlayGuide_QuestLink(id)
{
   getURL("FSCommand:ToGame_PlayGuide_QuestLink",id);
}
function ToGame_PlayGuide_GuideBallon()
{
   fscommand("ToGame_PlayGuide_GuideBallon");
}
function pageMotionEvent(titleTxt, img)
{
   container_mc.topMc.missionTitle._visible = false;
   container_mc.topMc.missionBg._visible = false;
   container_mc.topMc.missionMc._visible = false;
   container_mc.topMc.missionType._visible = false;
   container_mc.topMc.missionTxt0._alpha = 0;
   var _loc2_ = container_mc.topMc.mPage.getNextHighestDepth();
   var _loc1_ = container_mc.topMc.mPage.attachMovie("pageMotion","pageMotion",_loc2_);
   var _loc3_ = container_mc.topMc.missionTitle._x;
   var _loc4_ = container_mc.topMc.missionBg._x;
   _loc1_._alpha = 0;
   _loc1_.txt._x = _loc3_;
   _loc1_.txt.htmlText = titleTxt;
   lib.display.DrawBitmapData.draw(_loc1_,img,_loc4_,36,0,0,MBG_WID,MBG_HIG,1);
   gs.TweenLite.killTweensOf(_loc1_,false);
   gs.TweenLite.to(_loc1_,0.3,{_alpha:100,onComplete:pageMotionEnd,onCompleteParams:[_loc1_],ease:Strong.easeIn});
}
function pageMotionEnd(pMotion)
{
   container_mc.topMc.missionTitle._visible = true;
   container_mc.topMc.missionBg._visible = true;
   container_mc.topMc.missionMc._visible = true;
   container_mc.topMc.missionType._visible = true;
   container_mc.topMc.missionTxt0._alpha = 100;
   pMotion.removeMovieClip();
   prevTitle = "";
   prevImg = "";
}
function attendDraw(pMc, remainData)
{
   listReset(pMc);
   var _loc3_ = lib.util.ExtString.split(remainData,"\t");
   var _loc4_ = 0;
   var _loc2_ = _loc3_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_)
   {
      if(_loc3_[_loc1_] == 1)
      {
         _loc4_ = _loc4_ + 1;
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc4_ + "\t" + _loc2_;
}
function drawSlot(_tgMc, _index, _IconName, _img, _grade, _num, _size, _type)
{
   var _loc6_ = _size / 64;
   var _loc7_ = 16 * _loc6_;
   lib.display.DrawBitmapData.draw(_tgMc,_img,0,0,0,0,_size,_size,_loc6_);
   if(_grade > 0)
   {
      lib.display.DrawBitmapData.draw(_tgMc,UI["gradeBm" + _grade],0,0,0,0,_loc7_,_loc7_,_loc6_ * 1.25);
   }
   var _loc2_ = undefined;
   var _loc1_ = undefined;
   if(_type == 1)
   {
      _loc2_ = lib.util.GoldCurrency.SetGoldText(_num,0,0,0,0);
      _loc1_ = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc2_ + "</font>";
      lib.manager.ToolTip.add(_tgMc,GOLD_STR + _loc1_,1);
   }
   else if(_type == 3)
   {
      _loc2_ = lib.util.CurrencyFormat.makeComma(_num);
      _loc1_ = "<font color=\'#" + lib.info.TextColor.GENERAL_EXP.toString(16) + "\'>" + _loc2_ + "</font>";
      lib.manager.ToolTip.add(_tgMc,EXP_STR + _loc1_,1);
   }
   else if(_type == 4)
   {
      _loc2_ = lib.util.CurrencyFormat.makeComma(_num);
      _loc1_ = "<font color=\'#00B4FF\'>" + _IconName + "</font>" + "<font color=\'#7d7d7d\'> : </font><font color=\'#007EFF\'>" + _loc2_ + "</font>";
      lib.manager.ToolTip.add(_tgMc,_loc1_,1);
   }
   else if(_type == 5)
   {
      _loc2_ = lib.util.GoldCurrency.SetGoldText(_num,0,0,0,1);
      _loc1_ = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc2_ + "</font>";
      lib.manager.ToolTip.add(_tgMc,GOLD_STR + _loc1_,1);
   }
   else if(_type == 6)
   {
      _loc2_ = lib.util.CurrencyFormat.makeComma(_num);
      _loc1_ = "<font color=\'#00BAFF\'>" + _loc2_ + "</font>";
      lib.manager.ToolTip.add(_tgMc,TIRED_STR + _loc1_,1);
   }
   else if(_type == 7)
   {
      _loc1_ = "<font color=\'#15BBA9\'>" + _IconName + "</font>";
      lib.manager.ToolTip.add(_tgMc,_loc1_,1);
   }
   else
   {
      lib.manager.ToolTip.add(_tgMc,_index + "\t0",6);
      if(_num > 1)
      {
         _tgMc.numTxt.text = _num;
      }
   }
}
function tipButtonClick(type)
{
   if(motionOn == true)
   {
      return undefined;
   }
   motionCount = motionCount + type;
   if(motionCount < 0)
   {
      motionCount = 0;
      return undefined;
   }
   if(motionCount >= motionLen)
   {
      motionCount = motionLen - 1;
      return undefined;
   }
   motionOn = true;
   clearInterval(motionInterval);
   motionInterval = setInterval(textMotion,motionDelay);
   var _loc1_ = container_mc.tipMc._y - fontWid * type;
   gs.TweenLite.killTweensOf(container_mc.tipMc,false);
   gs.TweenLite.to(container_mc.tipMc,0.5,{_y:_loc1_,onComplete:textMotionEnd2});
   container_mc.tipbtnT._visible = true;
   container_mc.tipbtnB._visible = true;
   if(motionCount == 0)
   {
      container_mc.tipbtnT._visible = false;
   }
   else if(motionCount == motionLen - 1)
   {
      container_mc.tipbtnB._visible = false;
   }
}
function textMotion()
{
   var _loc1_ = container_mc.tipMc._y - fontWid;
   motionOn = true;
   gs.TweenLite.killTweensOf(container_mc.tipMc,false);
   gs.TweenLite.to(container_mc.tipMc,0.5,{_y:_loc1_,onComplete:textMotionEnd});
}
function textMotionEnd2()
{
   motionOn = false;
}
function textMotionEnd()
{
   motionCount++;
   if(motionLen <= motionCount)
   {
      container_mc.tipMc._y = container_mc.tipMc._y + motionLen * fontWid;
      motionCount = 0;
   }
   container_mc.tipbtnT._visible = true;
   container_mc.tipbtnB._visible = true;
   if(motionCount == 0)
   {
      container_mc.tipbtnT._visible = false;
   }
   else if(motionCount == motionLen - 1)
   {
      container_mc.tipbtnB._visible = false;
   }
   motionOn = false;
}
function setAlign()
{
   var _loc2_ = container_mc.btmMc.listMc;
   var _loc3_ = 1;
   for(var _loc4_ in _loc2_)
   {
      var _loc1_ = _loc2_[_loc4_];
      if(typeof _loc1_ == "movieclip")
      {
         _loc1_._y = (totalLen - _loc3_) * LINE_HIGHT;
         _loc3_ = _loc3_ + 1;
      }
   }
   scrollbar.pageSize = totalLen * LINE_HIGHT;
}
function setBtn(mc, _mode)
{
   var _loc1_ = new lib.util.TxtBtn(mc.btn,mc.txt);
   if(_mode == true)
   {
      _loc1_.setTextColor("0xffffff","0xefe78f","0xd7d7d7","0x485460");
      _loc1_.setRelease(function()
      {
         ToGame_PlayGuide_LinkClick(mc.idx);
      }
      );
   }
   else
   {
      _loc1_.setTextColor("0xefe78f","0xefe78f","0xefe78f","0xefe78f");
      _loc1_.setRelease();
   }
}
function listReset(_lineMc)
{
   var _loc1_ = _lineMc;
   for(var _loc2_ in _loc1_)
   {
      if(typeof _loc1_[_loc2_] == "movieclip")
      {
         _loc1_[_loc2_].removeMovieClip();
      }
   }
}
function setKey(keyCode, txt)
{
   var _loc1_ = lib.info.KeyMap.toKeyCode(keyCode);
   return _loc1_;
}
function setCheckBtn(mc)
{
   lib.manager.ToolTip.add(mc,lib.util.UIString.getUIString("$091031"),1);
   mc.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      this.checked = this.ck;
      this.onChanged = function(changed)
      {
         lib.manager.ToolTip.remove(this);
         if(changed == true)
         {
            lib.manager.ToolTip.add(this,lib.util.UIString.getUIString("$091032"),1);
            ToGame_PlayGuide_CheckClick(this.id,1);
         }
         else if(changed == false)
         {
            lib.manager.ToolTip.add(this,lib.util.UIString.getUIString("$091031"),1);
            ToGame_PlayGuide_CheckClick(this.id,0);
         }
      };
   };
}
function setLineState(mc, type)
{
   if(type == 0)
   {
      mc.gotoAndStop(2);
   }
   else
   {
      mc.gotoAndStop(1);
   }
   if(mc.btn2._visible)
   {
      mc.btn2.effect.gotoAndPlay(2);
   }
}
function invalidateFilter()
{
   missionFilter.onEnterFrame = function()
   {
      this.dataProvider = missionFilterData;
      delete this.onEnterFrame;
   };
}
function missionFilterChangedHandler(event)
{
   getURL("FSCommand:ToGame_PlayGuide_FilterChanged",event.msg);
}
function missionFilterCheckedHandler(event)
{
   getURL("FSCommand:ToGame_PlayGuide_FilterChecked",event.msg);
}
var UI = this;
UI._visible = false;
var UIname = "PlayGuide";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var totalLen = 0;
var RINK_MENU_DIS = 20;
var MISSION_LIST_DIS = 24;
var LINE_HIGHT = 64;
var BG_WID = 1140;
var BG_HIG = 730;
var addBg0 = flash.display.BitmapData.loadBitmap("addBg_0");
var addBg1 = flash.display.BitmapData.loadBitmap("addBg_1");
var REPUTATION_IMG = "<img src=\'img://__Icon_Items.ReputationPointCoin\' vspace=\'-3\'>";
var COUNT_COLOR = "<font color=\'#D7D7D7\'>";
var motionInterval = null;
var motionDelay = 5000;
var motionCount = 0;
var motionLen = 0;
var addMcPosition = [890,674];
var ENABLE_TRANS_TRUE = lib.info.ColorTrans.popupDisableTrans();
var ENABLE_TRANS_FALSE = lib.info.ColorTrans.enableTrans();
var QUEST_TYPE = ["<font color=\'#ff9933\'>" + lib.util.UIString.getUIString("$094013"),"<font color=\'#00baff\'>" + lib.util.UIString.getUIString("$094014"),"<font color=\'#efe78f\'>" + lib.util.UIString.getUIString("$094015"),"<font color=\'#78af36\'>" + lib.util.UIString.getUIString("$094016"),"<font color=\'#00baff\'>" + lib.util.UIString.getUIString("$094014")];
var FONTCOLOR_TYPE = ["0xff9933","0x00baff","0xefe78f","0x78af36","0x00baff"];
var GOLD_STR = lib.util.UIString.getUIString("$101087") + " ";
var EXP_STR = lib.util.UIString.getUIString("$101088") + " ";
var TIRED_STR = lib.util.UIString.getUIString("$094021") + ": ";
var MONTH_STR = lib.util.UIString.getUIString("$094024");
var ADD_ICON = "<img src=\'icon_add\'>";
var missionBg = "";
var MBG_WID = 512;
var MBG_HIG = 256;
var subMissionBox = [];
var SUB_BOX_POS_X_0 = 675;
var SUB_BOX_POS_X_1 = 890;
var MBG_POS_SPACE = 475;
var SLOT_SPACE = 33;
var BAR_WID = 130;
var x_btn = new lib.util.TxtBtn(container_mc.x_btn);
x_btn.setRelease(ToGame_PlayGuide_CloseUI);
var g_btn = new lib.util.TxtBtn(container_mc.g_btn);
g_btn.setRelease(ToGame_PlayGuide_GuideBallon);
container_mc.tipbtnB.onRelease = function()
{
   tipButtonClick(1);
};
container_mc.tipbtnT.onRelease = function()
{
   tipButtonClick(-1);
};
var mUp_btn = new lib.util.TxtBtn(container_mc.topMc.mUpBtn);
mUp_btn.setRelease(ToGame_PlayGuide_PrevMission);
var mDown_btn = new lib.util.TxtBtn(container_mc.topMc.mDownBtn);
mDown_btn.setRelease(ToGame_PlayGuide_NextMission);
var list_mcY = container_mc.btmMc.listMc._y;
var scrollbar = container_mc.btmMc.scrollbar;
scrollbar.addListener(container_mc.btmMc.listMc);
container_mc.btmMc.listMc.onScroll = function()
{
   container_mc.btmMc.listMc._y = list_mcY - arguments[0];
};
scrollbar.setWheel(container_mc.btmMc.listMc);
scrollbar.wheelDelta = 1;
scrollbar.pageSize = 0;
scrollbar.displaySize = container_mc.btmMc.maskMc._height;
scrollbar.defaultBarSizeRatio = 0.3333333333333333;
scrollbar.rowHeight = LINE_HIGHT / 2;
scrollbar.scroll = 0;
container_mc.topMc.mUpBtn._visible = false;
container_mc.topMc.mDownBtn._visible = false;
container_mc.topMc.mPage._visible = false;
lib.display.DrawBitmapData.draw(container_mc,"img://__S1UIRES_Skin.BG_PlayGuide_0",0,0,0,0,BG_WID,BG_HIG,1);
container_mc.btmMc.sortMc.gotoAndStop(2);
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
         UI._x = lib.info.AlignInfo.xRatioToPixel(50) - hit._width / 2;
         UI._y = lib.info.AlignInfo.yRatioToPixel(40) - hit._height / 2;
      }
      else
      {
         UI._visible = false;
         clearInterval(motionInterval);
      }
   }
};
myListener.OnGameEventChangeUIMode = function(_bShow)
{
   if(_global.gbUIMode && bWindowOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
myListener.OnGame_PlayGuide_BG = function(img)
{
   container_mc.clear();
   lib.display.DrawBitmapData.draw(container_mc,img,0,0,0,0,BG_WID,BG_HIG,1);
};
var btnModes = [];
var btnIds = [];
var tabInit = true;
myListener.OnGame_PlayGuide_SetLink = function(listData)
{
   listReset(container_mc.linkBox);
   var _loc11_ = 0;
   var _loc7_ = lib.util.ExtString.split(listData,"\n");
   var _loc10_ = _loc7_.length;
   var _loc9_ = [];
   btnModes = [];
   btnIds = [];
   var _loc8_ = [];
   var _loc3_ = 0;
   while(_loc3_ < _loc10_)
   {
      var _loc1_ = lib.util.ExtString.split(_loc7_[_loc3_],"\t");
      var _loc4_ = _loc1_[1];
      var _loc2_ = _loc1_[2];
      var _loc6_ = _loc1_[3];
      var _loc5_ = _loc1_[4];
      if(_loc2_ != -1 && _loc2_ != undefined && _loc2_ != "")
      {
         _loc4_ = _loc4_ + ("(" + setKey(_loc2_,btnMc.txt) + ")");
      }
      btnMc.txt.autoSize = true;
      btnMc.txt.text = _loc4_;
      _loc9_.push(String(_loc4_));
      btnMc.idx = _loc1_[0];
      btnModes.push(Number(_loc6_));
      btnIds[_loc3_] = _loc1_[0];
      _loc8_.push(Number(_loc5_));
      _loc3_ = _loc3_ + 1;
   }
   if(tabInit)
   {
      tabInit = false;
      container_mc.tab.labels = _loc9_;
      container_mc.tab.tab.setTab(0,1);
      container_mc.tab.tab.setRelease(release);
   }
   container_mc.tab.btnModes = btnModes;
   container_mc.tab.btnIds = btnIds;
   container_mc.tab.counts = _loc8_;
};
var preTab = -1;
myListener.OnGame_PlayGuide_Tip = function(str)
{
   var _loc3_ = lib.util.ExtString.split(str,"\t");
   motionLen = _loc3_.length;
   _loc3_.push(_loc3_[0]);
   var _loc4_ = _loc3_.length;
   var _loc5_ = "";
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = container_mc.tipMc.attachMovie("tipTxt","tipTxt" + _loc1_,container_mc.tipMc.getNextHighestDepth());
      _loc2_.txt.htmlText = _loc3_[_loc1_];
      _loc2_._y = fontWid * _loc1_;
      _loc1_ = _loc1_ + 1;
   }
   motionCount = 0;
   container_mc.tipMc._y = 703;
   container_mc.tipbtnT._visible = false;
   if(motionLen > 1)
   {
      clearInterval(motionInterval);
      motionInterval = setInterval(textMotion,motionDelay);
   }
   else
   {
      container_mc.tipbtnB._visible = false;
   }
};
myListener.OnGame_PlayGuide_Mission = function(titleStr, missionData, rewardData, img)
{
   listReset(container_mc.topMc.missionMc);
   container_mc.topMc.missionTitle.htmlText = titleStr;
   container_mc.topMc.missionTitle._x = container_mc.topMc.missionType.textWidth + 50;
   container_mc.topMc.missionBg.clear();
   if(img != undefined && img != "")
   {
      lib.display.DrawBitmapData.draw(container_mc.topMc.missionBg,img,0,0,0,0,MBG_WID,MBG_HIG,1);
   }
   var _loc9_ = lib.util.ExtString.split(missionData,"\n");
   var _loc11_ = _loc9_.length;
   var _loc5_ = 0;
   while(_loc5_ < _loc11_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc9_[_loc5_],"\t");
      var _loc3_ = container_mc.topMc.missionMc.attachMovie("missionList","list" + _loc5_,container_mc.topMc.missionMc.getNextHighestDepth());
      _loc3_._x = SLOT_SPACE;
      _loc3_._y = 62 + _loc5_ * MISSION_LIST_DIS;
      _loc3_.gotoAndStop(Number(_loc2_[3]) + 1);
      _loc3_.txt.htmlText = _loc2_[0];
      if(_loc2_[1] != -1)
      {
         _loc3_.txt.htmlText = _loc3_.txt.htmlText + (COUNT_COLOR + " (" + _loc2_[1] + "/" + _loc2_[2] + ")</font>");
      }
      _loc5_ = _loc5_ + 1;
   }
   var _loc8_ = lib.util.ExtString.split(rewardData,"\n");
   var _loc7_ = _loc8_.length;
   if(_loc7_ == 0 || _loc7_ == undefined)
   {
      container_mc.topMc.missionTxt0._visible = false;
      return undefined;
   }
   container_mc.topMc.missionTxt0._visible = true;
   var _loc10_ = container_mc.topMc.missionTxt0.textWidth + 70;
   var _loc4_ = 0;
   while(_loc4_ < _loc7_)
   {
      var _loc1_ = lib.util.ExtString.split(_loc8_[_loc4_],"\t");
      var _loc6_ = container_mc.topMc.missionMc.attachMovie("slotDraw","slot" + _loc4_,container_mc.topMc.missionMc.getNextHighestDepth());
      _loc6_._x = _loc10_ + _loc4_ * SLOT_SPACE;
      _loc6_._y = 161;
      drawSlot(_loc6_,_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[5],_loc1_[3],28,_loc1_[8]);
      _loc4_ = _loc4_ + 1;
   }
};
var BannerMotion = false;
var BannerLock = false;
var BannerIndex = -1;
var BannerLen = 1;
var BannerBtn;
var BannerFocus;
var BannerTime = 10;
myListener.OnGame_PlayGuide_Banner = function(dataList, btn, time)
{
   var _loc5_ = container_mc.topMc.addMc2;
   BannerTime = time;
   if(!_loc5_)
   {
      _loc5_ = container_mc.topMc.attachMovie("addMc2","addMc2",container_mc.topMc.getNextHighestDepth());
      _loc5_._y = 36;
      _loc5_.box0.mainTxt.verticalAlign = "center";
      _loc5_.box1.mainTxt.verticalAlign = "center";
      subMissionBox.push(_loc5_);
      var _loc7_ = lib.util.ExtString.split(dataList,"\n");
      BannerLen = _loc7_.length;
      var _loc8_ = 100 - (BannerLen - 1) * 13;
      var _loc3_ = 0;
      while(_loc3_ < BannerLen)
      {
         var _loc4_ = lib.util.ExtString.split(_loc7_[_loc3_],"\t");
         var _loc6_ = _loc3_ * 215;
         var _loc2_ = _loc5_.attachMovie("checkMc","check" + _loc3_,_loc5_.getNextHighestDepth());
         _loc2_._x = _loc8_ + _loc3_ * 26;
         _loc2_._y = 190;
         _loc2_.idx = _loc3_;
         _loc2_.id = _loc4_[0];
         _loc2_.img = _loc4_[1];
         _loc2_.titleTxt = _loc4_[2];
         _loc2_.subTxt = _loc4_[3];
         _loc2_.onRollOver = function()
         {
            BannerStop();
            if(this == BannerFocus)
            {
               return undefined;
            }
            this.gotoAndStop(2);
         };
         _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
         {
            BannerAuto();
            if(this == BannerFocus)
            {
               return undefined;
            }
            this.gotoAndStop(1);
         };
         _loc2_.onPress = function()
         {
            if(this == BannerFocus)
            {
               return undefined;
            }
            BannerChange(this.idx,"click");
         };
         _loc3_ = _loc3_ + 1;
      }
      _loc5_.bg.onRollOver = function()
      {
         BannerStop();
      };
      _loc5_.bg.onRollOut = _loc5_.bg.onReleaseOutside = function()
      {
         BannerAuto();
      };
      BannerBtn = new lib.util.TxtBtn(_loc5_.btn,_loc5_.txt);
      BannerBtn.setRelease(ToGame_PlayGuide_BannerClick);
      BannerBtn.setTextColor("0xFFFFFF","0xefe78f","0xd7d7d7","0x485460");
      BannerBtn.setRollOver(BannerStop);
      BannerBtn.setRollOut(BannerAuto);
      BannerBtn.setRollOutSide(BannerAuto);
      if(BannerLen > 1)
      {
         BannerAuto();
      }
      setPostion();
      BannerChange(0,"auto");
   }
};
var s_AttendStr = "";
var a_AttenData0 = "";
var a_AttenData1 = "";
myListener.OnGame_PlayGuide_Attend = function(titleStr, subStr, checkData, missionData, rewardData, tipTxt)
{
   var _loc4_ = attendDraw(mc.checkBox,checkData);
   var _loc1_ = lib.util.ExtString.split(_loc4_,"\t");
   var _loc3_ = _loc1_[1];
   var _loc2_ = _loc1_[0];
   s_AttendStr = lib.util.UIString.getUIString("$094007","total",_loc3_,"count",_loc2_);
   a_AttenData0 = missionData;
   a_AttenData1 = rewardData;
};
myListener.OnGame_PlayGuide_Addition = function(titleStr, subStr, checkData, rewardData, btn, tipTxt)
{
   var _loc3_ = container_mc.topMc.addMc1;
   if(!_loc3_)
   {
      _loc3_ = container_mc.topMc.attachMovie("addMc1","addMc1",container_mc.topMc.getNextHighestDepth());
      _loc3_._y = 36;
      subMissionBox.push(_loc3_);
   }
   var _loc11_ = lib.util.ExtString.split(checkData,"\t");
   var _loc8_ = Number(_loc11_[0]);
   var _loc9_ = Number(_loc11_[1]);
   var _loc10_ = _loc9_ - _loc8_;
   _loc3_.barTxt.text = _loc8_ + "/" + _loc9_;
   _loc3_.bar._width = BAR_WID * _loc8_ / _loc9_;
   if(btn == 1)
   {
      _loc3_.btn._visible = true;
      _loc3_.btn.gotoAndPlay(2);
      _loc3_.subTxt._visible = false;
      _loc3_.barTxt2._visible = false;
      var _loc12_ = new lib.util.TxtBtn(_loc3_.btn.btn,_loc3_.btn.txt);
      _loc12_.setRelease(ToGame_PlayGuide_AdditionClick);
      _loc12_.setTextColor("0xFFFFFF","0xefe78f","0xd7d7d7","0x485460");
   }
   else
   {
      _loc3_.btn._visible = false;
      _loc3_.btn.gotoAndStop(1);
      _loc3_.subTxt._visible = true;
      _loc3_.barTxt2._visible = true;
   }
   _loc3_.titleTxt.setText(titleStr);
   _loc3_.subTxt.setText(subStr);
   if(_loc10_ == 0)
   {
      _loc3_.barTxt2.htmlText = lib.util.UIString.getUIString("$094020");
   }
   else
   {
      _loc3_.barTxt2.htmlText = lib.util.UIString.getUIString("$094010") + " " + lib.util.UIString.getUIString("$094009","count",_loc10_);
   }
   listReset(_loc3_.rewardBox);
   var _loc5_ = lib.util.ExtString.split(rewardData,"\n");
   var _loc7_ = _loc5_.length;
   var _loc6_ = _loc3_.rewardTxt.textWidth + 23;
   var _loc2_ = 0;
   while(_loc2_ < _loc7_)
   {
      var _loc1_ = lib.util.ExtString.split(_loc5_[_loc2_],"\t");
      var _loc4_ = _loc3_.rewardBox.attachMovie("slotDraw","slot" + _loc2_,_loc3_.rewardBox.getNextHighestDepth());
      _loc4_._x = _loc6_ + _loc2_ * SLOT_SPACE;
      drawSlot(_loc4_,_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[5],_loc1_[3],28,_loc1_[8]);
      _loc2_ = _loc2_ + 1;
   }
   lib.manager.ToolTip.remove(_loc3_.hit);
   if(tipTxt != undefined && tipTxt != "")
   {
      lib.manager.ToolTip.add(_loc3_.hit,tipTxt,1);
   }
   setPostion();
};
myListener.OnGame_PlayGuide_UpDateList = function(id, dList, rewardList, plusList, btnMode, checkData, isEmphasized, dungeonCode)
{
   var lineMc = container_mc.btmMc.listMc["line_" + id];
   var _loc6_ = lib.util.ExtString.split(dList,"\t");
   if(dList == "" || dList == undefined)
   {
      if(lineMc)
      {
         lineMc.removeMovieClip();
         totalLen = totalLen - 1;
         setAlign();
      }
      return undefined;
   }
   var _loc7_ = lineMc.xpMc;
   if(!lineMc)
   {
      lineMc = container_mc.btmMc.listMc.attachMovie("lineMc","line_" + id,container_mc.btmMc.listMc.getNextHighestDepth());
      _loc7_ = lineMc.attachMovie("symbol_xp","xpMc",lineMc.getNextHighestDepth());
      _loc7_.hitTestDisable = true;
      _loc7_._xscale = _loc7_._yscale = 80;
      totalLen = totalLen + 1;
      setAlign();
   }
   var _loc20_ = _loc6_[0];
   var _loc38_ = FONTCOLOR_TYPE[_loc20_];
   var _loc21_ = _loc6_[1];
   if(_loc21_ == "0")
   {
      _loc21_ = "-";
   }
   lineMc.id = id;
   lineMc.txt0.htmlText = QUEST_TYPE[_loc20_] + "</font>";
   lineMc.txt1.htmlText = _loc21_;
   var _loc35_ = lineMc.txt1.textWidth;
   if(_loc35_ > 20)
   {
      lineMc.txt1Bg.gotoAndStop(2);
   }
   var _loc15_ = Number(_loc6_[7]);
   var _loc37_ = Number(_loc6_[8]);
   lineMc.txt2.verticalAlign = "center";
   lineMc.partyMc.gotoAndStop(1);
   var _loc17_ = 0;
   if(_loc15_ > 1)
   {
      if(_loc15_ > 20)
      {
         lineMc.partyMc.gotoAndStop(_loc15_);
      }
      else
      {
         lineMc.partyMc.gotoAndStop(_loc15_);
         lineMc.partyMc.txt.text = _loc15_;
      }
      _loc17_ = 22;
   }
   lineMc.txt2._width = 310 - _loc17_;
   var _loc24_ = _loc6_[2];
   lineMc.txt2.setText(_loc24_);
   var _loc39_ = _loc24_.substring(1,5);
   if(_loc39_ != "font")
   {
      lineMc.txt2.textColor = _loc38_;
   }
   if(_loc37_ == 1)
   {
      var _loc40_ = lib.util.UIString.getUIString("$094018");
      lib.manager.ToolTip.remove(lineMc.addTxt);
      lib.manager.ToolTip.add(lineMc.addTxt,_loc40_,1);
      lineMc.addTxt.htmlText = ADD_ICON;
   }
   lineMc.txt3.setText(_loc6_[3]);
   lineMc.txt4.verticalAlign = "center";
   lineMc.txt4.htmlText = _loc6_[4];
   var _loc29_ = _loc6_[5];
   var _loc28_ = _loc6_[6];
   lineMc.txt5.htmlText = COUNT_COLOR + _loc29_ + "/" + _loc28_ + "</font>";
   if(_loc29_ == _loc28_ && _loc6_[9] != 0)
   {
      lineMc.btn2._visible = true;
      var _loc27_ = new lib.util.TxtBtn(lineMc.btn2.btn,lineMc.btn2.txt);
      _loc27_.setRelease(function()
      {
         ToGame_PlayGuide_CompleteClick(lineMc.id);
      }
      );
      _loc27_.setTextColor("0xFFFFFF","0x00BAFF","0xFFFFFF","0x485460");
   }
   else
   {
      lineMc.btn2._visible = false;
   }
   listReset(lineMc.itemMc);
   var _loc8_ = lib.util.ExtString.split(rewardList,"\n");
   var _loc9_ = _loc8_.length;
   var _loc13_ = 0;
   var _loc12_ = 0;
   var _loc5_ = 100;
   var _loc11_ = 32;
   if(_loc9_ > 4)
   {
      _loc13_ = 6;
      _loc12_ = -12;
      _loc5_ = 80;
      _loc11_ = 26;
   }
   var _loc3_ = 0;
   while(_loc3_ < _loc9_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc8_[_loc3_],"\t");
      var _loc4_ = lineMc.itemMc.attachMovie("slotDraw","slot" + _loc3_,lineMc.itemMc.getNextHighestDepth());
      _loc4_._x = _loc13_ - _loc3_ % 4 * _loc11_;
      _loc4_._y = _loc12_ + int(_loc3_ / 4) * 26;
      _loc4_._xscale = _loc5_;
      _loc4_._yscale = _loc5_;
      drawSlot(_loc4_,_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[5],_loc2_[3],28,_loc2_[8]);
      _loc3_ = _loc3_ + 1;
   }
   var _loc25_ = 0;
   var _loc22_ = 0;
   _loc7_._visible = false;
   lineMc.txt6.text = "";
   lineMc.txt7.text = "";
   lineMc.txt8.text = "";
   if(plusList != undefined && plusList != "")
   {
      lineMc.addBg._visible = true;
      lineMc.itemMc._x = 736;
      var _loc14_ = lib.util.ExtString.split(plusList,"\t");
      var _loc45_ = "";
      var _loc30_ = Number(_loc14_[0]);
      var _loc33_ = Number(_loc14_[1]);
      var _loc23_ = Number(_loc14_[3]);
      if(_loc30_ > 0)
      {
         var _loc43_ = lib.util.CurrencyFormat.makeComma(_loc30_);
         lineMc.txt6.htmlText = _loc43_;
         _loc7_._visible = true;
      }
      if(_loc33_ > 0)
      {
         _loc33_ = lib.util.GoldCurrency.SetGoldText(_loc14_[1],0,0,0,_loc14_[2]);
         var _loc34_ = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc33_ + "</font>";
         lineMc.txt7.htmlText = _loc34_;
      }
      if(_loc23_ > 0)
      {
         var _loc31_ = TIRED_STR + lib.util.CurrencyFormat.makeComma(_loc23_) + "P";
         lineMc.txt8.htmlText = _loc31_;
         _loc25_ = -10;
         _loc22_ = -12;
      }
   }
   else
   {
      lineMc.addBg._visible = false;
      lineMc.itemMc._x = 738 + lineMc.itemMc._width / 2;
   }
   lineMc.txt6._y = 14 + _loc25_;
   lineMc.txt7._y = 31 + _loc22_;
   _loc7_._x = lineMc.txt6._x + lineMc.txt6.textWidth + 6;
   _loc7_._y = lineMc.txt6._y;
   var _loc10_ = lib.util.ExtString.split(btnMode,"\t");
   lineMc.btn.txt.text = _loc10_[0];
   var _loc16_ = new lib.util.TxtBtn(lineMc.btn.btn,lineMc.btn.txt);
   _loc16_.setRelease(function()
   {
      ToGame_PlayGuide_ListClick(lineMc.id);
   }
   );
   if(_loc10_[2] == 1)
   {
      _loc16_.setTextColor("0x00baff","0x00BAFF","0x00baff","0x485460");
   }
   else
   {
      _loc16_.setTextColor("0xFFFFFF","0xFFFFFF","0xFFFFFF","0x485460");
   }
   if(_loc10_[1] == -1)
   {
      lineMc.btn._visible = false;
   }
   else
   {
      lineMc.btn._visible = true;
      _loc16_.setEnabled(Boolean(Number(_loc10_[1])));
   }
   if(checkData != "" && checkData != undefined)
   {
      lineMc.checkBox._visible = true;
      lineMc.checkBox.id = lineMc.id;
      lineMc.checkBox.ck = Boolean(Number(checkData));
      setCheckBtn(lineMc.checkBox);
   }
   else
   {
      lineMc.checkBox._visible = false;
   }
   setLineState(lineMc,_loc20_);
   var _loc19_ = lineMc.txt2.textWidth;
   if(_loc19_ > 315)
   {
      _loc19_ = 315;
   }
   lineMc.txt2._x = 83 + _loc17_;
   lineMc.addTxt._x = _loc19_ + 84 + _loc17_;
   lineMc.btn3._visible = false;
   if(_loc6_[10] == 1)
   {
      if(lineMc.btn._visible)
      {
         lineMc.btn._xscale = 90;
         lineMc.btn._yscale = 90;
         lineMc.btn._x = 874;
         lineMc.btn._y = 13;
      }
      else
      {
         lineMc.btn3._width = 121;
         lineMc.btn3._height = 30;
         lineMc.btn3._x = 862;
         lineMc.btn3._y = 27;
      }
      lineMc.btn3._visible = true;
      lineMc.btn3.txt.text = "$094022";
      var _loc26_ = new lib.util.TxtBtn(lineMc.btn3.btn,lineMc.btn3.txt);
      _loc26_.setTextColor("0xFFFFFF","0xFFFFFF","0xFFFFFF","0x485460");
      _loc26_.setRelease(function()
      {
         ToGame_PlayGuide_QuestLink(this._parent.id);
      }
      );
   }
   lineMc.emphasizingBg._visible = isEmphasized == 1;
   lineMc.emphasizingMark._visible = isEmphasized == 1;
   lineMc.dungeonBtn._visible = lineMc.btn5._visible = lineMc.btn4._visible = false;
   if(dungeonCode > 0)
   {
      lineMc.btn._visible = lineMc.btn3._visible = false;
      var _loc18_ = undefined;
      lineMc.btn4._visible = true;
      lineMc.btn4.txt.textAutoSize = "shrink";
      _loc18_.id = id;
      _loc18_ = new lib.util.TxtBtn(lineMc.btn4.btn,lineMc.btn4.txt);
      lineMc.dungeonBtn._visible = true;
      var _loc41_ = new lib.util.TxtBtn(lineMc.dungeonBtn);
      _loc41_.setRelease(function()
      {
         ToGame_PlayGuide_DungoenBtnClicked(dungeonCode);
      }
      );
      if(_loc10_[0] != "" || _loc10_[0] != undefined)
      {
         lineMc.btn4.txt.text = _loc10_[0];
      }
      else
      {
         lineMc.btn4.txt.text = lib.util.UIString.getUIString("$279109");
      }
      _loc18_.setTextColor("0x00BAFF","0x00BAFF","0x00BAFF","0x485460");
      _loc18_.setRelease(function()
      {
         ToGame_PlayGuide_ListClick(id);
      }
      );
      lib.manager.ToolTip.add(lineMc.dungeonBtn,lib.util.UIString.getUIString("$279110"),1);
   }
};
var todayEventMode = false;
var attendEventMode = false;
var comebackEventMode = false;
PlayGuideView(true);
var todayMcArr = [];
myListener.OnGame_PlayGuide_TodayEventPage = function(s_Mode, s_Title, s_DataList)
{
   todayEventMode = Boolean(Number(s_Mode));
   if(!todayEventMode && !attendEventMode)
   {
      PlayGuideView(true);
   }
   else
   {
      PlayGuideView(false);
   }
   container_mc.todayMc.removeMovieClip();
   var m_Page;
   if(todayEventMode)
   {
      m_Page = container_mc.attachMovie("todayMc","todayMc",container_mc.getNextHighestDepth());
      container_mc.comebackMc.removeMovieClip();
      todayMcArr = [];
      var _loc6_ = lib.util.ExtString.split(s_DataList,"\n");
      var n_Len = _loc6_.length;
      var _loc5_ = 0;
      while(_loc5_ < n_Len)
      {
         var _loc4_ = lib.util.ExtString.split(_loc6_[_loc5_],"\t");
         var _loc3_ = m_Page.listMc.attachMovie("todayLine","todayLine",m_Page.listMc.getNextHighestDepth());
         _loc3_._y = 130 * _loc5_;
         _loc3_.id = _loc4_[0];
         _loc3_.txt0.textAutoSize = "shrink";
         _loc3_.txt1.textAutoSize = "shrink";
         _loc3_.txt2.textAutoSize = "shrink";
         _loc3_.txt0.htmlText = _loc4_[1];
         _loc3_.txt1.htmlText = _loc4_[2];
         _loc3_.txt2.htmlText = _loc4_[3];
         SetLineButton(_loc3_.btnMc);
         todayMcArr.push(_loc3_);
         _loc5_ = _loc5_ + 1;
      }
      if(attendEventMode)
      {
         container_mc.attendMc._x = 504;
         m_Page._x = 33;
         EventPagePosition(439);
      }
      else
      {
         m_Page._x = 190;
         EventPagePosition(759);
      }
      if(n_Len > 5)
      {
         var list_mcY2 = m_Page.listMc._y;
         var _loc7_ = m_Page.scrollbar2;
         _loc7_._visible = false;
         _loc7_.onEnterFrame = function()
         {
            delete this.onEnterFrame;
            this.addListener(m_Page.listMc);
            m_Page.listMc.onScroll = function()
            {
               m_Page.listMc._y = list_mcY2 - arguments[0];
            };
            this.setWheel(m_Page.listMc);
            this.wheelDelta = 1;
            this.displaySize = 652;
            this.defaultBarSizeRatio = 0.3333333333333333;
            this.rowHeight = 30;
            if(attendEventMode)
            {
               this._x = 439;
            }
            else
            {
               this._x = 759;
            }
            this._visible = true;
            this.scroll = 0;
            this.pageSize = 130 * n_Len;
         };
      }
      else
      {
         m_Page.scrollbar2._visible = false;
      }
   }
   container_mc.attendMc._x = 268;
   return undefined;
};
var m_Btn0;
var m_Btn1;
myListener.OnGame_PlayGuide_AttendEventPage = function(s_Mode, s_Title, s_DataList, s_Month, prevB, nextB)
{
   attendEventMode = Boolean(Number(s_Mode));
   if(!todayEventMode && !attendEventMode)
   {
      PlayGuideView(true);
   }
   else
   {
      PlayGuideView(false);
   }
   var _loc4_ = container_mc.attendMc;
   if(attendEventMode)
   {
      if(!_loc4_)
      {
         _loc4_ = container_mc.attachMovie("attendMc","attendMc",container_mc.getNextHighestDepth());
      }
      container_mc.comebackMc.removeMovieClip();
      m_Btn0 = new lib.util.TxtBtn(_loc4_.mBtn0);
      m_Btn0.setRelease(ToGame_PlayGuide_AttendNextMonth);
      m_Btn1 = new lib.util.TxtBtn(_loc4_.mBtn1);
      m_Btn1.setRelease(ToGame_PlayGuide_AttendPrevMonth);
      EventPagePosition(439);
      listReset(_loc4_.rewardBox);
      var _loc16_ = lib.util.ExtString.split(a_AttenData0,"\n");
      var _loc19_ = _loc16_.length;
      var _loc7_ = 0;
      while(_loc7_ < _loc19_)
      {
         var _loc11_ = lib.util.ExtString.split(_loc16_[_loc7_],"\t");
         var _loc8_ = _loc4_.rewardBox.attachMovie("attendList","attendList" + _loc7_,_loc4_.rewardBox.getNextHighestDepth());
         _loc8_._x = _loc7_ * 150;
         _loc8_.gotoAndStop(Number(_loc11_[1]) + 1);
         _loc8_.txt.htmlText = _loc11_[0];
         _loc7_ = _loc7_ + 1;
      }
      var _loc14_ = lib.util.ExtString.split(a_AttenData1,"\n");
      var _loc18_ = _loc14_.length;
      var _loc6_ = 0;
      while(_loc6_ < _loc18_)
      {
         var _loc5_ = lib.util.ExtString.split(_loc14_[_loc6_],"\t");
         var _loc9_ = _loc4_.rewardBox.attachMovie("slotDraw","slot" + _loc6_,_loc4_.rewardBox.getNextHighestDepth());
         _loc9_._x = _loc6_ * 150 - 100;
         _loc9_._y = 30;
         drawSlot(_loc9_,_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[5],_loc5_[3],28,_loc5_[8]);
         _loc6_ = _loc6_ + 1;
      }
      m_Btn0.setEnabled(Boolean(Number(nextB)));
      m_Btn1.setEnabled(Boolean(Number(prevB)));
      var _loc20_ = lib.util.ExtString.split(s_Month,"\t");
      _loc4_.mTxt0.textAutoSize = "shrink";
      _loc4_.mTxt1.textAutoSize = "shrink";
      _loc4_.mTxt2.textAutoSize = "shrink";
      _loc4_.mTxt0.htmlText = _loc20_[0];
      _loc4_.mTxt1.htmlText = _loc20_[1];
      _loc4_.mTxt2.htmlText = _loc20_[2];
      if(todayEventMode)
      {
         container_mc.todayMc._x = 33;
         container_mc.todayMc.maskMc._width = 450;
         _loc4_._x = 504;
      }
      else
      {
         _loc4_._x = 268;
      }
      if(s_Title)
      {
         _loc4_.mainTxt.htmlText = s_Title;
      }
      _loc4_.subTxt.htmlText = s_AttendStr;
      _loc4_.subTxt._x = _loc4_.mainTxt.textWidth + 170;
      var _loc15_ = lib.util.ExtString.split(s_DataList,"\n");
      var _loc17_ = _loc15_.length;
      var _loc3_ = 0;
      while(_loc3_ < 35)
      {
         var _loc2_ = lib.util.ExtString.split(_loc15_[_loc3_],"\t");
         var _loc12_ = Number(_loc3_) + 1;
         var _loc1_ = _loc4_["check" + _loc12_];
         if(_loc2_[5] == "-1" || _loc3_ >= _loc17_)
         {
            _loc1_.gotoAndStop(4);
         }
         else
         {
            _loc1_.dayTxt.text = _loc2_[6];
            var _loc10_ = (_loc3_ + 1) % 7;
            if(_loc10_ == 1 || _loc10_ == 0)
            {
               _loc1_.dayTxt.textColor = "0xFF3300";
               _loc1_.bg.gotoAndStop(2);
            }
            else
            {
               _loc1_.dayTxt.textColor = "0xFFFFFF";
               _loc1_.bg.gotoAndStop(1);
            }
            var _loc13_ = _loc1_.imgMc.attachMovie("slotDraw2","slot" + _loc3_,_loc1_.imgMc.getNextHighestDepth());
            _loc1_.gotoAndStop(Number(_loc2_[4]) + 1);
            _loc1_.disableMc.hitTestDisable = true;
            _loc1_.clearMc.hitTestDisable = true;
            _loc1_.id = _loc2_[0];
            _loc1_.imgMc._alpha = 80;
            _loc1_.dayNum = _loc2_[5] + "\t" + _loc2_[6];
            drawSlot(_loc13_,_loc2_[0],"",_loc2_[1],_loc2_[2],_loc2_[3],42);
            if(_loc2_[7] == "1")
            {
               _loc1_.focusMc._visible = true;
            }
            else
            {
               _loc1_.focusMc._visible = false;
            }
            _loc1_.clearMc._visible = false;
            if(_loc2_[8] == "-1")
            {
               _loc1_.btn._visible = false;
               _loc1_.txt._visible = false;
               if(_loc2_[4] == "1")
               {
                  _loc1_.clearMc._visible = true;
               }
            }
            else
            {
               setBtn2(_loc1_,_loc2_[8]);
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      container_mc.checkBox.getNextHighestDepth();
   }
   if(_loc4_)
   {
      _loc4_.removeMovieClip();
   }
   container_mc.todayMc._x = 190;
   EventPagePosition(759);
   return undefined;
};
myListener.OnGame_PlayGuide_ComebackEventPage = function(s_Mode, s_Level, s_CheckBtn)
{
   comebackEventMode = Boolean(Number(s_Mode));
   if(!comebackEventMode)
   {
      PlayGuideView(true);
   }
   else
   {
      PlayGuideView(false);
   }
   var _loc1_ = container_mc.comebackMc;
   if(comebackEventMode)
   {
      if(!_loc1_)
      {
         _loc1_ = container_mc.attachMovie("comebackMc","comebackMc",container_mc.getNextHighestDepth());
      }
      container_mc.todayMc.removeMovieClip();
      container_mc.attendMc.removeMovieClip();
      if(s_Level == "1")
      {
         _loc1_.mc.gotoAndStop(2);
         _loc1_.mc.tab2.verticalAlign = "center";
         _loc1_.mc.tab2.htmlText = lib.util.UIString.getUIString("$094056");
         _loc1_.mc.title2.htmlText = lib.util.UIString.getUIString("$094061");
         _loc1_.mc.txt2.htmlText = lib.util.UIString.getUIString("$094062");
      }
      else
      {
         _loc1_.mc.gotoAndStop(1);
      }
      _loc1_.mc.tab0.verticalAlign = "center";
      _loc1_.mc.tab1.verticalAlign = "center";
      _loc1_.mc.tab0.htmlText = lib.util.UIString.getUIString("$094054");
      _loc1_.mc.tab1.htmlText = lib.util.UIString.getUIString("$094055");
      _loc1_.mc.title0.htmlText = lib.util.UIString.getUIString("$094057");
      _loc1_.mc.txt0.htmlText = lib.util.UIString.getUIString("$094058");
      _loc1_.mc.title1.htmlText = lib.util.UIString.getUIString("$094059");
      _loc1_.mc.txt1.htmlText = lib.util.UIString.getUIString("$094060");
      _loc1_.mainTxt.htmlText = lib.util.UIString.getUIString("$094053");
      var _loc2_ = new lib.util.TxtBtn(_loc1_.btnMc0,_loc1_.btnTxt0);
      _loc2_.setTextColor("0xffeda6","0xffffff","0x967747","0x999999");
      _loc2_.setRelease(function()
      {
         ToGame_PlayGuide_ComebackClick(1);
      }
      );
      var _loc3_ = new lib.util.TxtBtn(_loc1_.btnMc1,_loc1_.btnTxt1);
      _loc3_.setTextColor("0x999999","0xd3d3d3","0x565656","0x333333");
      _loc3_.setRelease(function()
      {
         ToGame_PlayGuide_ComebackClick(0);
      }
      );
      _loc2_.setEnabled(Boolean(Number(s_CheckBtn)));
   }
   if(_loc1_)
   {
      _loc1_.removeMovieClip();
   }
   return undefined;
};
var tipbtn2 = new lib.util.TxtBtn(container_mc.tipBtn);
lib.manager.ToolTip.add(container_mc.tipBtn,"$094047",1);
tipbtn2.setRelease(function()
{
   ToGame_PlayGuide_ComebackCheck(container_mc.tipBtn);
}
);
container_mc.itemList_mc.checkBox.onChanged = function(checked)
{
   ToGame_TradeHouse_CheckedTradeAble(Number(checked));
};
myListener.OnGame_PlayGuide_AllClear = function(_dataList)
{
   totalLen = 0;
   listReset(container_mc.btmMc.listMc);
   scrollbar.pageSize = 0;
   scrollbar.scroll = 0;
};
myListener.OnGame_PlayGuide_CompleteInfo = function(completeData, tipTxt)
{
   if(completeData == undefined || completeData == "")
   {
      container_mc.btmMc.sortMc.gotoAndStop(2);
   }
   else
   {
      container_mc.btmMc.sortMc.gotoAndStop(1);
   }
   var _loc2_ = lib.util.ExtString.split(completeData,"\t");
   var _loc1_ = "X " + _loc2_[0] + "  (" + lib.util.UIString.getUIString("$094012");
   _loc1_ = _loc1_ + ("  " + QUEST_TYPE[1] + " X " + _loc2_[1] + "</font> ");
   _loc1_ = _loc1_ + ("  " + QUEST_TYPE[2] + " X " + _loc2_[2] + "</font> ");
   _loc1_ = _loc1_ + ("  " + QUEST_TYPE[3] + " X " + _loc2_[3] + "</font> ");
   _loc1_ = _loc1_ + " )";
   container_mc.btmMc.sortMc.txt0.text = lib.util.UIString.getUIString("$094010") + " :";
   container_mc.btmMc.sortMc.txt2.htmlText = _loc1_;
   lib.manager.ToolTip.remove(container_mc.btmMc.sortMc.CompleteTip);
   if(tipTxt != undefined && tipTxt != "")
   {
      lib.manager.ToolTip.add(container_mc.btmMc.sortMc.CompleteTip,tipTxt,1);
   }
};
myListener.OnGame_PlayGuide_ReputePoint = function(reputeTitle, pointData, tipTxt)
{
   var _loc1_ = lib.util.ExtString.split(pointData,"\t");
   container_mc.btmMc.sortMc.pointTxt.htmlText = reputeTitle + "   " + _loc1_[0] + "/" + _loc1_[1] + " " + REPUTATION_IMG;
   lib.manager.ToolTip.remove(container_mc.btmMc.sortMc.pointTip);
   if(tipTxt != undefined && tipTxt != "")
   {
      lib.manager.ToolTip.add(container_mc.btmMc.sortMc.pointTip,tipTxt,1);
   }
};
myListener.OnGame_PlayGuide_PrevMissionButton = function(enable, effectMode)
{
   if(enable == -1)
   {
      container_mc.topMc.mUpBtn._visible = false;
   }
   else
   {
      container_mc.topMc.mUpBtn._visible = true;
      mUp_btn.setEnabled(Boolean(Number(enable)));
   }
   if(effectMode == 1)
   {
      container_mc.topMc.mUpBtn.effect.gotoAndPlay(2);
   }
   else
   {
      container_mc.topMc.mUpBtn.effect.gotoAndStop(1);
   }
};
myListener.OnGame_PlayGuide_NextMissionButton = function(enable, effectMode)
{
   if(enable == -1)
   {
      container_mc.topMc.mDownBtn._visible = false;
   }
   else
   {
      container_mc.topMc.mDownBtn._visible = true;
      mDown_btn.setEnabled(Boolean(Number(enable)));
   }
   if(effectMode == 1)
   {
      container_mc.topMc.mDownBtn.effect.gotoAndPlay(2);
   }
   else
   {
      container_mc.topMc.mDownBtn.effect.gotoAndStop(1);
   }
};
myListener.OnGame_PlayGuide_MissionPage = function(enable, current, total)
{
   if(enable == -1)
   {
      container_mc.topMc.mPage._visible = false;
   }
   else
   {
      container_mc.topMc.mPage._visible = true;
      container_mc.topMc.mPage.txt.text = current + "/" + total;
   }
};
myListener.OnGame_PlayGuide_SetAccent = function(needAccent, linkIndex)
{
   if(needAccent == 1)
   {
      var _loc1_ = 0;
      while(_loc1_ < btnIds.length)
      {
         if(btnIds[_loc1_] == linkIndex)
         {
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
      container_mc.tab.accentIndex = _loc1_;
      container_mc.tab.accent = true;
   }
   else
   {
      container_mc.tab.accent = false;
   }
};
lib.util.GoldCurrency.SetGoldText(plusInfo[1],0,0,0,plusInfo[2]);
var fontWid = 30;
var motionOn = false;
var missionFilterData;
var missionFilter = container_mc.btmMc.sortMc.missionFilter;
missionFilter.addEventListener("changed",this,"missionFilterChangedHandler");
missionFilter.addEventListener("checked",this,"missionFilterCheckedHandler");
missionFilter.defaultLabel = lib.util.UIString.getUIString("$094051");
missionFilter.filteringLabel = lib.util.UIString.getUIString("$094052");
missionFilter._visible = false;
myListener.OnGame_PlayGuide_FilterData = function(dataList)
{
   var _loc3_ = lib.util.ExtString.split(dataList,"\n");
   missionFilterData = [];
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      var _loc1_ = lib.util.ExtString.split(_loc3_[_loc2_],"\t");
      lib.Debuger.trace("fData[0] : " + _loc1_[0]);
      missionFilterData.push({id:_loc1_[0],selected:Number(_loc1_[1]) == 1,label:_loc1_[2]});
      _loc2_ = _loc2_ + 1;
   }
   invalidateFilter();
   missionFilter._visible = true;
};
ToGame_PlayGuide_Init();
