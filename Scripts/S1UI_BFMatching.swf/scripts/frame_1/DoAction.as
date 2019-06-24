var UI = this;
UI._visible = false;
var UIname = "BFMatching";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         historySave_All();
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
var listTotal = 0;
var giftTotal = 0;
var listContainerY = container_mc.listContainerMc._y;
var guideContainerY = container_mc.guideContainerMc._y;
var rewardPosTX = 5;
var rewardPosTY = 3;
var checkIdx = -1;
var guideFocusType = "-1";
var markerText = [];
markerText[0] = ["$279012","$279013","$279014","$279015","$279016","$279017"];
markerText[1] = ["$279015","$279016"];
var ACCESS_LOCK_OFF = lib.util.UIString.getUIString("$279008");
var ACCESS_LOCK_ON = lib.util.UIString.getUIString("$279009");
function radioButtonEvent(_focus)
{
   if(_focus != prevButtonFocus)
   {
      prevButtonFocus.onSelected(0,false);
      prevButtonFocus = _focus;
   }
}
function overAni(mc, alp)
{
   if(alp == 0)
   {
      gs.TweenLite.to(mc,0.2,{_alpha:alp,ease:gs.easing.Strong.easeIn});
   }
   else
   {
      gs.TweenLite.to(mc,0.1,{_alpha:alp,ease:gs.easing.Strong.easeOut});
   }
}
function clearBFList()
{
   var _loc1_ = 0;
   while(_loc1_ < listTotal)
   {
      var _loc2_ = container_mc.listContainerMc["lineMc" + _loc1_];
      lib.manager.ToolTip.remove(_loc2_.checkMc);
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   checkIdx = -1;
   listTotal = 0;
   container_mc.scrollbar.pageSize = container_mc.listContainerMc._height;
}
function clearGift()
{
   var _loc1_ = 0;
   while(_loc1_ < giftTotal)
   {
      var _loc2_ = container_mc.guideContainerMc["rewardLineMc" + _loc1_];
      lib.manager.ToolTip.remove(_loc2_.slotMc.SLOT);
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   giftTotal = 0;
   container_mc.scrollbar1.pageSize = container_mc.guideContainerMc._height;
}
function ToGame_BFMatching_DeSelect(BFid)
{
   getURL("FSCommand:ToGame_BFMatching_DeSelect",BFid);
}
function ToGame_BFMatching_Select(BFid)
{
   getURL("FSCommand:ToGame_BFMatching_Select",BFid);
}
function ToGame_BFMatching_Init()
{
   fscommand("ToGame_BFMatching_Init");
}
function ToGame_BFMatching_Close()
{
   fscommand("ToGame_BFMatching_Close");
}
function ToGame_BFMatching_FreeConfirm()
{
   fscommand("ToGame_BFMatching_FreeConfirm");
}
function ToGame_BFMatching_Refresh()
{
   fscommand("ToGame_BFMatching_Refresh");
}
function ToGame_BFMatching_RequestPartyMemberState(BFid)
{
   getURL("FSCommand:ToGame_ToolTip_RequestBFMatching",BFid);
}
function ToGame_BFMatching_SetCheckBtn(id, type)
{
   var _loc1_ = id + "\t" + type;
   getURL("FSCommand:ToGame_BFMatching_SetCheckBtn",_loc1_);
}
function ToGame_BFMatching_VictoryShop()
{
   fscommand("ToGame_BFMatching_VictoryShop");
}
function ToGame_BFMatching_ShowHelp(BfId)
{
   getURL("FSCommand:ToGame_BFMatching_ShowHelp",BfId);
}
function historySave_All()
{
   SaveData.listTotal = listTotal;
   SaveData.scrollY = container_mc.scrollbar.scroll;
   lib.gamedata.HistoryData.addHistoryData(UIname,SaveData);
}
function historyLoad_Scroll()
{
   if(SaveData.listTotal == listTotal)
   {
      container_mc.scrollbar.scroll = SaveData.scrollY;
   }
}
function SetMultiply(_targetMc, _num)
{
   if(_num > 1)
   {
      _targetMc._visible = true;
      _targetMc.txt.text = _num;
      _targetMc.mc._x = 30 - _targetMc.txt.textWidth / 2;
   }
   else
   {
      _targetMc._visible = false;
   }
}
if(guideFocusType == "-1")
{
   container_mc.guideContainerMc.markerTip._visible = false;
   container_mc.guideContainerMc.helpGuideBg._y = 0;
   container_mc.guideContainerMc.helpGuideFd._y = 20;
}
var prevButtonFocus = new MovieClip();
myListener.OnGame_BFMatching_BFList = function(_listData)
{
   clearBFList();
   var _loc23_ = lib.util.ExtString.split(_listData,"\n");
   var _loc24_ = _loc23_.length;
   if(_listData == "" || _listData == undefined)
   {
      container_mc.defaultStr._visible = true;
      return undefined;
   }
   container_mc.defaultStr._visible = false;
   listTotal = _loc24_;
   var _loc3_ = 0;
   while(_loc3_ < _loc24_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc23_[_loc3_],"\t");
      var _loc21_ = _loc2_[0];
      var joinState = Number(_loc2_[1]);
      var _loc17_ = _loc2_[2];
      var _loc18_ = _loc2_[3];
      var _loc19_ = _loc2_[4];
      var _loc20_ = _loc2_[5];
      var _loc9_ = _loc2_[6];
      var _loc4_ = _loc2_[7];
      var _loc13_ = _loc2_[8];
      var _loc14_ = _loc2_[9];
      var _loc22_ = _loc2_[11];
      var _loc5_ = _loc2_[14];
      if(joinState == 1 || _loc3_ == 0)
      {
         guideFocusType = _loc22_;
         container_mc.guideContainerMc.markerTip.gotoAndStop(Number(guideFocusType) + 1);
      }
      container_mc.guideContainerMc.markerTip._visible = true;
      var _loc11_ = 0;
      var _loc12_ = 0;
      _loc11_ = Number(_loc2_[10]);
      _loc12_ = Number(_loc2_[13]);
      var lineMc = container_mc.listContainerMc.attachMovie("lineId","lineMc" + _loc3_,_loc3_);
      var _loc15_ = new TextFormat();
      _loc15_.letterSpacing = -1;
      lineMc.levelMc.txt.setNewTextFormat(_loc15_);
      lineMc.guideType = Number(_loc2_[11]);
      lineMc.checkMode = _loc2_[12];
      lineMc._y = (lineMc._height + 1) * _loc3_;
      lineMc.txt0.verticalAlign = "center";
      lineMc.idx = _loc3_;
      lineMc.id = _loc21_;
      lineMc.levelMc.txt.text = _loc17_;
      lineMc.levelMc.txt._width = Math.round(lineMc.levelMc.txt.textWidth + 6);
      lineMc.levelMc.mBack._width = lineMc.levelMc.txt._width + 8;
      lineMc.txt0._x = lineMc.levelMc._width + lineMc.levelMc._x;
      lineMc.txt0._width = 488 - lineMc.txt0._x;
      lineMc.txt0.setText(_loc18_);
      lineMc.partyMc._x = lineMc.txt0._x + lineMc.txt0.textWidth + 4;
      if(_loc11_ > 0)
      {
         lineMc.partyMc._visible = true;
         lineMc.partyMc.txt.text = _loc11_;
         lib.manager.ToolTip.add(lineMc.partyMc,id,6);
      }
      else
      {
         lineMc.partyMc._visible = false;
      }
      var _loc6_ = undefined;
      var _loc10_ = undefined;
      if(_loc9_ == -1 || _loc9_ == "")
      {
         _loc6_ = false;
      }
      else
      {
         _loc6_ = true;
      }
      if(_loc4_ != -1 && _loc4_ != "")
      {
         _loc10_ = true;
      }
      else
      {
         _loc10_ = false;
      }
      lineMc.coolTimeMc.txt1.text = _loc9_;
      lineMc.coolTimeMc.txt1._visible = _loc6_;
      if(_loc6_)
      {
         lineMc.coolTimeMc.IconMc._visible = false;
      }
      else
      {
         lineMc.coolTimeMc.txt0.textColor = "0x80E71C";
         lineMc.coolTimeMc.txt0.text = ACCESS_LOCK_OFF;
         lineMc.coolTimeMc.IconMc._visible = _loc10_;
         if(_loc10_)
         {
            lineMc.coolTimeMc.txt0.text = _loc4_;
            lib.manager.ToolTip.add(lineMc.coolTimeMc.IconMc,_loc4_,1);
            lineMc.coolTimeMc.IconMc._x = 95 + lineMc.coolTimeMc.txt0.textWidth / 2 + 2;
         }
      }
      if(_loc12_ == 1)
      {
         lineMc.coolTimeMc.txt1._visible = false;
         lineMc.coolTimeMc.txt0.textColor = "0xC00005";
         lineMc.coolTimeMc.txt0.text = ACCESS_LOCK_ON;
      }
      lib.manager.ToolTip.remove(lineMc.coolTimeMc);
      if("" != _loc5_ && undefined != _loc5_ && "undefined" != _loc5_)
      {
         lib.manager.ToolTip.add(lineMc.coolTimeMc,_loc5_,98);
      }
      lineMc.onEnterFrame = function()
      {
         if(this.checkMode != -1)
         {
            this.checkBtn._visible = true;
            this.txt4.verticalAlign = "center";
            this.txt4.text = lib.util.UIString.getUIString("$279006");
            this.checkBtn.checked = this.checkMode;
            this.checkBtn.onChanged = function(changed)
            {
               ToGame_BFMatching_SetCheckBtn(this._parent.id,this.checked);
            };
         }
         else
         {
            this.checkBtn._visible = false;
         }
         delete this.onEnterFrame;
      };
      lineMc.txt1.setText(_loc19_);
      lib.util.DrawBitmap.draw(lineMc.mapMc,_loc20_);
      if(_loc13_ != -1)
      {
         lineMc.txt22.setText(_loc13_);
      }
      if(_loc14_ != -1)
      {
         lineMc.txt32.setText(_loc14_);
      }
      var _loc8_ = lineMc.txt21.textWidth;
      var _loc7_ = lineMc.txt31.textWidth;
      if(_loc8_ > _loc7_)
      {
         lineMc.txt22._x = 247 + _loc8_ + 20;
         lineMc.txt32._x = 247 + _loc8_ + 20;
      }
      else
      {
         lineMc.txt22._x = 247 + _loc7_ + 20;
         lineMc.txt32._x = 247 + _loc7_ + 20;
      }
      lineMc.hit.enabled = joinState != 2;
      lineMc.hit.onRollOver = function()
      {
         if(this._parent.joinState == 0)
         {
            this._parent.checkMc.gotoAndStop(2);
            overAni(this._parent.bgMc.lineOverBgMc,55);
         }
      };
      lineMc.hit.onRollOut = lineMc.hit.onReleaseOutside = function()
      {
         if(this._parent.joinState == 0)
         {
            this._parent.checkMc.gotoAndStop(1);
            overAni(this._parent.bgMc.lineOverBgMc,0);
         }
      };
      lineMc.hit.onRelease = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.CHECKBTN_CHECK);
         if(this._parent.joinState == 0)
         {
            this._parent.onSelected(1,true);
            guideFocusType = this._parent.guideType;
         }
         else if(this._parent.joinState == 1)
         {
            this._parent.onSelected(0,true);
         }
      };
      lineMc.onSelected = function(flag, type)
      {
         if(this.joinState == flag)
         {
            return undefined;
         }
         this.joinState = flag;
         if(flag == 0)
         {
            if(this.idx == checkIdx)
            {
               checkIdx = -1;
            }
            this.txt0.textColor = 14145495;
            this.txt1.textColor = 14145495;
            this.checkMc.gotoAndStop(1);
            this.bgMc.gotoAndStop(1);
            overAni(this.bgMc.lineOverBgMc,0);
            ToGame_BFMatching_DeSelect(this.id);
            container_mc.guideContainerMc._visible = false;
            container_mc.scrollbar1.pageSize = 0;
         }
         else if(flag == 1)
         {
            if(-1 != checkIdx)
            {
               var _loc3_ = this._parent["lineMc" + checkIdx];
               _loc3_.onSelected(0,true);
            }
            checkIdx = this.idx;
            this.txt0.textColor = 14145495;
            this.txt1.textColor = 14145495;
            this.checkMc.gotoAndStop(3);
            this.bgMc.gotoAndStop(1);
            overAni(this.bgMc.lineOverBgMc,100);
            ToGame_BFMatching_Select(this.id);
         }
         else
         {
            this.lineMc.levelMc.txt.textColor = lib.info.TextColor.GENERAL_DISABLE;
            this.txt0.textColor = lib.info.TextColor.GENERAL_DISABLE;
            this.txt1.textColor = lib.info.TextColor.GENERAL_DISABLE;
            this.bgMc.gotoAndStop(2);
            this.checkMc.gotoAndStop(4);
            overAni(this.bgMc.lineOverBgMc,0);
         }
      };
      lineMc.onSelected(joinState,true);
      _loc3_ = _loc3_ + 1;
   }
   container_mc.scrollbar.pageSize = container_mc.listContainerMc._height;
   historyLoad_Scroll();
};
var prevButtonFocus;
prevButtonFocus.onSelected = function(flag, type)
{
};
myListener.OnGame_BFMatching_SetPosition = function(guard, dealer, healer)
{
   container_mc.rollBtn0.rollMc.gotoAndStop(3);
   container_mc.rollBtn0.checkMc.gotoAndStop(3);
   container_mc.rollBtn1.rollMc.gotoAndStop(3);
   container_mc.rollBtn1.checkMc.gotoAndStop(3);
   container_mc.rollBtn2.rollMc.gotoAndStop(3);
   container_mc.rollBtn2.checkMc.gotoAndStop(3);
};
myListener.OnGame_BFMatching_SetGuide = function(reward, _text, isGuide, attackGuide, defenceGuide)
{
   clearGift();
   container_mc.guideContainerMc._visible = true;
   var _loc15_ = lib.util.ExtString.split(reward,"\n");
   var _loc16_ = _loc15_.length;
   giftTotal = _loc16_;
   if(reward == "" || reward == undefined)
   {
      if(_text == "" || _text == undefined)
      {
         container_mc.guideContainerMc.helpGuideFd.htmlText = lib.util.UIString.getUIString("$279003");
      }
      else
      {
         container_mc.guideContainerMc.helpGuideFd.htmlText = _text;
      }
      if(isGuide)
      {
         container_mc.guideContainerMc.txtGuide0.htmlText = "<a href=\'asfunction:guideLink,0\'>" + attackGuide + "</a>";
         container_mc.guideContainerMc.txtGuide1.htmlText = "<a href=\'asfunction:guideLink,1\'>" + defenceGuide + "</a>";
         container_mc.guideContainerMc.txtGuide0._visible = container_mc.guideContainerMc.txtGuide1._visible = true;
      }
      else
      {
         container_mc.guideContainerMc.txtGuide0._visible = container_mc.guideContainerMc.txtGuide1._visible = false;
      }
      if(guideFocusType == "-1")
      {
         container_mc.guideContainerMc.markerTip._visible = false;
         container_mc.guideContainerMc.helpGuideBg._y = 0;
         container_mc.guideContainerMc.helpGuideFd._y = 20;
      }
      else
      {
         container_mc.guideContainerMc.markerTip._visible = true;
         container_mc.guideContainerMc.markerTip.gotoAndStop(Number(guideFocusType) + 1);
         var _loc18_ = container_mc.guideContainerMc.markerTip._height + 5;
         container_mc.guideContainerMc.helpGuideBg._y = _loc18_;
         container_mc.guideContainerMc.helpGuideFd._y = _loc18_ + 20;
         if(isGuide)
         {
            container_mc.guideContainerMc.txtGuide0._y = container_mc.guideContainerMc.helpGuideFd._y + container_mc.guideContainerMc.helpGuideFd.textHeight + 10;
            container_mc.guideContainerMc.txtGuide1._y = container_mc.guideContainerMc.txtGuide0._y + container_mc.guideContainerMc.txtGuide0._height;
         }
         var _loc17_ = markerText[guideFocusType].length;
         var _loc4_ = 0;
         while(_loc4_ < _loc17_)
         {
            container_mc.guideContainerMc.markerTip["txt" + _loc4_].verticalAlign = "center";
            container_mc.guideContainerMc.markerTip["txt" + _loc4_].text = lib.util.UIString.getUIString(markerText[guideFocusType][_loc4_]);
            _loc4_ = _loc4_ + 1;
         }
      }
      container_mc.guideContainerMc.helpGuideFd._height = container_mc.guideContainerMc.helpGuideFd.textHeight + 4;
      container_mc.guideContainerMc.helpGuideBg._height = container_mc.guideContainerMc.helpGuideFd.textHeight + 40;
      if(isGuide)
      {
         container_mc.scrollbar1.pageSize = container_mc.guideContainerMc._height + container_mc.guideContainerMc.txtGuide0._height + container_mc.guideContainerMc.txtGuide1._height;
      }
      else
      {
         container_mc.scrollbar1.pageSize = container_mc.guideContainerMc._height;
      }
      return undefined;
   }
   var _loc6_ = undefined;
   var _loc5_ = 0;
   while(_loc5_ < _loc16_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc15_[_loc5_],"\t");
      var _loc8_ = _loc3_[0];
      var _loc10_ = _loc3_[1];
      var _loc14_ = _loc3_[2];
      var _loc13_ = _loc3_[3];
      var _loc12_ = Number(_loc3_[4]);
      var grade = Number(_loc3_[5]);
      var _loc11_ = Number(_loc3_[6]);
      var _loc9_ = Number(_loc3_[7]);
      var _loc2_ = container_mc.guideContainerMc.attachMovie("rewardId","rewardLineMc" + _loc5_,_loc5_);
      _loc2_._x = rewardPosTX;
      if(_loc6_ == undefined)
      {
         _loc2_._y = rewardPosTY;
      }
      else
      {
         _loc2_._y = _loc6_._y + _loc6_._height + 9;
      }
      _loc6_ = _loc2_;
      _loc2_.txt.setText(_loc8_);
      var _loc7_ = _loc2_.slotMc;
      _loc7_._y = _loc2_.txt._y + _loc2_.txt.textHeight + 3;
      _loc2_.id = _loc10_;
      _loc2_.img = _loc13_;
      _loc2_.count = _loc12_;
      _loc2_.grade = grade;
      _loc2_.seal = _loc11_;
      _loc2_.master = _loc9_;
      _loc2_.itemname = _loc14_;
      _loc2_.multiNum = Number(_loc3_[8]);
      _loc7_.onLoad = function()
      {
         this.draw(this._parent.img);
         this.setLineNum(2);
         this.showMoney(false);
         this.grade = this._parent.grade;
         this.sealType = this._parent.seal;
         this.masterpiece = this._parent.master;
         this.drag = false;
         this.effect = false;
         this.upText = this._parent.itemname;
         SetMultiply(this.multiply,this._parent.multiNum);
         lib.manager.ToolTip.add(this.SLOT,this._parent.id,6,this.Icon);
      };
      _loc5_ = _loc5_ + 1;
   }
   container_mc.guideContainerMc.helpGuideBg._y = _loc6_._y + _loc6_._height + 10;
   container_mc.guideContainerMc.helpGuideFd._y = container_mc.guideContainerMc.helpGuideBg._y + 20;
   container_mc.scrollbar1.pageSize = container_mc.guideContainerMc._height;
};
container_mc.guideContainerMc.txtGuide0._visible = container_mc.guideContainerMc.txtGuide1._visible = false;
_global.guideLink = function(type)
{
   getURL("FSCommand:ToGame_BFMatching_ShowGuide",type);
};
myListener.OnGame_BFMatching_SetPoints = function(victoryPoint, slayerPoint)
{
   container_mc.shopUI.victoryPoint.htmlText = victoryPoint;
};
myListener.OnGame_BFMatching_SetEnableConfirmBtn = function(enable)
{
   btn1_btn.setEnabled(Number(enable));
};
container_mc.shopUI.txtShop0.htmlText = lib.util.UIString.getUIString("$279300");
container_mc.shopUI.txtShop1.htmlText = lib.util.UIString.getUIString("$279301");
var x_btn = new lib.util.TxtBtn(container_mc.xmc);
var btn0_btn = new lib.util.TxtBtn(container_mc.btn_mc0,container_mc.btn_txt0);
var btn1_btn = new lib.util.TxtBtn(container_mc.btn_mc1,container_mc.btn_txt1);
var btn2_btn = new lib.util.TxtBtn(container_mc.btn_mc2,container_mc.btn_txt2);
var victoryBtn = new lib.util.TxtBtn(container_mc.shopUI.victoryBtn,container_mc.shopUI.btn_txt11);
victoryBtn.setTextColor(16773561,16777215,16773561,10268600);
btn0_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
btn1_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
btn2_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
victoryBtn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
btn0_btn.setRelease(ToGame_BFMatching_Refresh);
btn1_btn.setRelease(ToGame_BFMatching_FreeConfirm);
btn2_btn.setRelease(ToGame_BFMatching_Close);
victoryBtn.setRelease(ToGame_BFMatching_VictoryShop);
x_btn.setRelease(ToGame_BFMatching_Close);
btn1_btn.setEnabled(false);
container_mc.scrollbar.pageSize = 0;
container_mc.scrollbar.displaySize = container_mc.maskMc._height;
container_mc.scrollbar.rowHeight = 500;
container_mc.listContainerMc.onScroll = function()
{
   this._y = listContainerY - arguments[0];
};
container_mc.scrollbar.setWheel(container_mc.listContainerMc);
container_mc.scrollbar.addListener(container_mc.listContainerMc);
container_mc.scrollbar1.pageSize = 0;
container_mc.scrollbar1.displaySize = container_mc.maskMc1._height;
container_mc.scrollbar1.rowHeight = 300;
container_mc.guideContainerMc.onScroll = function()
{
   this._y = guideContainerY - arguments[0];
};
container_mc.scrollbar1.setWheel(container_mc.guideContainerMc);
container_mc.scrollbar1.addListener(container_mc.guideContainerMc);
var SaveData = lib.gamedata.HistoryData.getHistoryData(UIname);
if(SaveData == undefined)
{
   SaveData = new Object();
}
ToGame_BFMatching_Init();
