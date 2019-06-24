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
function setRadioButton(_McList, _Group)
{
   var _len = _McList.length;
   var _loc3_ = 0;
   while(_loc3_ < _len)
   {
      _McList[_loc3_]._type = _loc3_;
      _McList[_loc3_]._id = _Group;
      _McList[_loc3_].onRollOver = function()
      {
         if(this._parent.checked == 0)
         {
            this._parent.rollMc.gotoAndStop(4);
            this._parent.checkMc.gotoAndStop(4);
         }
      };
      _McList[_loc3_].onRollOut = container_mc.rollBtn0.hit.onReleaseOutside = function()
      {
         if(this._parent.checked == 0)
         {
            this._parent.rollMc.gotoAndStop(1);
            this._parent.checkMc.gotoAndStop(1);
         }
      };
      _McList[_loc3_].onRelease = function()
      {
         if(this._parent.checked == 0)
         {
            this._parent.checked = 1;
            this._parent.rollMc.gotoAndStop(2);
            this._parent.checkMc.gotoAndStop(2);
            if(this._id == undefined)
            {
               ToGame_DungeonPartyMatching_SetPosition(this._type);
            }
            else
            {
               ToGame_DungeonPartyMatching_SetMasterOption(this._id,this._type);
            }
            var _loc2_ = 0;
            while(_loc2_ < _len)
            {
               if(this._type != _McList[_loc2_]._type && _McList[_loc2_]._parent.checked != 2)
               {
                  _McList[_loc2_]._parent.checked = 0;
                  _McList[_loc2_]._parent.rollMc.gotoAndStop(1);
                  _McList[_loc2_]._parent.checkMc.gotoAndStop(1);
               }
               _loc2_ = _loc2_ + 1;
            }
         }
      };
      _loc3_ = _loc3_ + 1;
   }
}
function clearOptionList()
{
   _boxScroll._visible = false;
   var _loc2_ = 0;
   while(_loc2_ < listTotal2)
   {
      var _loc1_ = container_mc.masterOption.listBox["selectBox_" + _loc2_];
      lib.manager.ToolTip.remove(_loc1_.roll0.hit);
      lib.manager.ToolTip.remove(_loc1_.roll1.hit);
      lib.manager.ToolTip.remove(_loc1_.roll2.hit);
      _loc1_.removeMovieClip();
      _loc2_ = _loc2_ + 1;
   }
}
function clearDuengenList()
{
   var _loc1_ = 0;
   while(_loc1_ < listTotal)
   {
      var _loc2_ = container_mc.listContainerMc.mc0["lineMc" + _loc1_];
      lib.manager.ToolTip.remove(_loc2_.checkMc);
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   listTotal = 0;
   if(selectedTabIndex == 0)
   {
      container_mc.scrollbar.pageSize = container_mc.listContainerMc.mc0._height;
   }
}
function ToGame_DungeonPartyMatching_DeSelect(dungenid)
{
   getURL("FSCommand:ToGame_DungeonPartyMatching_DeSelect",dungenid);
}
function ToGame_DungeonPartyMatching_Select(dungenid)
{
   getURL("FSCommand:ToGame_DungeonPartyMatching_Select",dungenid);
}
function ToGame_DungeonPartyMatching_Init()
{
   fscommand("ToGame_DungeonPartyMatching_Init");
}
function ToGame_DungeonPartyMatching_Close()
{
   fscommand("ToGame_DungeonPartyMatching_Close");
}
function ToGame_DungeonPartyMatching_Confirm()
{
   fscommand("ToGame_DungeonPartyMatching_Confirm");
}
function ToGame_DungeonPartyMatching_Refresh()
{
   allCheckEventLock = false;
   fscommand("ToGame_DungeonPartyMatching_Refresh");
}
function ToGame_DungeonPartyMatching_RequestPatyMemberState(dungenid)
{
   getURL("FSCommand:ToGame_ToolTip_RequestDungeonPartyMatching",dungenid);
}
function ToGame_DungeonPartyMatching_SetPartyMaster(index)
{
   getURL("FSCommand:ToGame_DungeonPartyMatching_SetPartyMaster",index);
}
function ToGame_DungeonPartyMatching_SetPosition(type)
{
   getURL("FSCommand:ToGame_DungeonPartyMatching_SetPosition",type);
}
function ToGame_DungeonPartyMatching_SetMasterOption(id, type)
{
   var _loc1_ = id + "\t" + type;
   getURL("FSCommand:ToGame_DungeonPartyMatching_SetMasterOption",_loc1_);
}
function ToGame_DungeonPartyMatching_Guide()
{
   fscommand("ToGame_DungeonPartyMatching_Guide");
}
function checkAll(flag)
{
   var _loc2_ = 0;
   while(_loc2_ < listTotal)
   {
      var _loc1_ = container_mc.listContainerMc.mc0["lineMc" + _loc2_];
      if(!flag && _loc1_.joinState == 1)
      {
         _loc1_.onSelected(0);
      }
      else if(flag && _loc1_.joinState == 0)
      {
         _loc1_.onSelected(1);
      }
      _loc2_ = _loc2_ + 1;
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
function historySave_All()
{
   SaveData.listTotal = listTotal;
   SaveData.scrollY = container_mc.scrollbar.scroll;
   SaveData.checkArray = [];
   var _loc1_ = 0;
   while(_loc1_ < listTotal)
   {
      var _loc2_ = container_mc.listContainerMc.mc0["lineMc" + _loc1_];
      if(_loc2_.joinState == 0)
      {
         SaveData.checkArray.push(_loc2_.id);
      }
      _loc1_ = _loc1_ + 1;
   }
   lib.gamedata.HistoryData.addHistoryData(UIname,SaveData);
}
function historyLoad_Scroll()
{
   if(SaveData.listTotal == listTotal)
   {
      container_mc.scrollbar.scroll = SaveData.scrollY;
   }
}
function historyLoad_Check()
{
   var _loc5_ = SaveData.checkArray;
   var _loc6_ = _loc5_.length;
   var _loc4_ = 0;
   while(_loc4_ < listTotal)
   {
      var _loc3_ = container_mc.listContainerMc.mc0["lineMc" + _loc4_];
      if(_loc3_.joinState == 1)
      {
         var _loc2_ = 0;
         while(_loc2_ < _loc6_)
         {
            if(_loc3_.id == _loc5_[_loc2_])
            {
               allCheckEventLock = true;
               this.checked = false;
               _loc3_.onSelected(0);
               _loc5_.splice(_loc2_,1);
               _loc6_ = _loc6_ - 1;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      _loc4_ = _loc4_ + 1;
   }
}
function tabRelease(num)
{
   selectedTabIndex = num;
   clearSoloList();
   clearSoloMission();
   ToGame_DungeonPartyMatching_Tab(num);
   var _loc1_ = undefined;
   if(num == 0)
   {
      container_mc.titleTxt.text = "$461001";
      container_mc.guideTxt.text = "$461022";
      container_mc.bg.gotoAndStop(1);
      container_mc.scrollbar._x = 731;
      container_mc.soloMc._visible = false;
      if(guideBtnVisible)
      {
         container_mc.btn_txt3._visible = true;
         container_mc.btn_mc3._visible = true;
      }
      else
      {
         container_mc.btn_txt3._visible = false;
         container_mc.btn_mc3._visible = false;
      }
   }
   else
   {
      container_mc.titleTxt.text = "$461039";
      container_mc.selectedMission.text = "461040";
      container_mc.guideTxt.text = "$461039";
      container_mc.bg.gotoAndStop(2);
      container_mc.scrollbar._x = 454;
      container_mc.soloMc._visible = true;
      container_mc.btn_txt3._visible = false;
      container_mc.btn_mc3._visible = false;
   }
   _loc1_ = 0;
   while(_loc1_ < soloNonVisibleElements.length)
   {
      soloNonVisibleElements[_loc1_]._visible = num == 0;
      _loc1_ = _loc1_ + 1;
   }
}
function setEffectVisibility(index, bool)
{
   var _loc1_ = bool == 1 || bool == true;
   container_mc.tabBtn.tab.btn_array[index]._parent.effect._visible = _loc1_;
   if(_loc1_)
   {
      container_mc.tabBtn.tab.btn_array[index]._parent.effect.play();
   }
   else
   {
      container_mc.tabBtn.tab.btn_array[index]._parent.effect.stop();
   }
}
function setLine(mc, idx, lineMode, checkMode)
{
   mc.idx = idx;
   mc.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      this.checkBtn.checked = Boolean(Number(checkMode));
   };
   if(Number(lineMode) > 0)
   {
      mc.bg.gotoAndStop(Number(lineMode) + 3);
   }
   mc.txt.textColor = ColorArr[Number(lineMode) + 1];
   mc.hit.onRollOver = function()
   {
      var _loc2_ = this._parent;
      if(_loc2_.bg._currentframe == 4 || _loc2_.bg._currentframe == 5)
      {
         return undefined;
      }
      _loc2_.txt.textColor = ColorArr[2];
      _loc2_.bg.gotoAndStop(2);
   };
   mc.hit.onRollOut = mc.hit.onReleaseOutside = function()
   {
      var _loc2_ = this._parent;
      if(_loc2_.bg._currentframe == 4 || _loc2_.bg._currentframe == 5)
      {
         return undefined;
      }
      var _loc3_ = _loc2_.checkBtn.checked;
      if(!_loc3_)
      {
         _loc2_.txt.textColor = ColorArr[1];
         _loc2_.bg.gotoAndStop(1);
      }
      else
      {
         _loc2_.txt.textColor = ColorArr[6];
         _loc2_.bg.gotoAndStop(6);
      }
   };
   mc.hit.onPress = function()
   {
      var _loc2_ = this._parent;
      if(_loc2_.bg._currentframe == 4 || _loc2_.bg._currentframe == 5)
      {
         return undefined;
      }
      _loc2_.txt.textColor = ColorArr[3];
      _loc2_.bg.gotoAndStop(3);
   };
   mc.hit.onRelease = function()
   {
      var _loc2_ = this._parent;
      if(_loc2_.bg._currentframe == 4 || _loc2_.bg._currentframe == 5)
      {
         return undefined;
      }
      var _loc3_ = _loc2_.checkBtn.checked;
      if(!_loc3_)
      {
         _loc2_.checkBtn.checked = true;
         _loc2_.txt.textColor = ColorArr[6];
         _loc2_.bg.gotoAndStop(6);
      }
      else
      {
         _loc2_.checkBtn.checked = false;
         _loc2_.txt.textColor = ColorArr[1];
         _loc2_.bg.gotoAndStop(1);
      }
      if(_loc2_ == container_mc.soloMc.misionR)
      {
         ToGame_DungeonPartyMatching_RandomMission(_loc2_);
      }
      else
      {
         ToGame_DungeonPartyMatching_SoloMission(_loc2_);
      }
   };
}
function ToGame_DungeonPartyMatching_RandomMission(mission)
{
   getURL("FSCommand:ToGame_DungeonPartyMatching_RandomMission",mission.idx + "\t" + (!mission.checkBtn.checked?0:1));
}
function ToGame_DungeonPartyMatching_SoloMission(mission)
{
   getURL("FSCommand:ToGame_DungeonPartyMatching_SoloMission",mission.idx + "\t" + (!mission.checkBtn.checked?0:1));
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
   var _loc1_ = undefined;
   var _loc2_ = undefined;
   if(_type == 1)
   {
      _loc1_ = lib.util.GoldCurrency.SetGoldText(_num,0,0,0,0);
      _loc2_ = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc1_ + "</font>";
      lib.manager.ToolTip.add(_tgMc,GOLD_STR + _loc2_,1);
   }
   else if(_type == 3)
   {
      _loc1_ = lib.util.CurrencyFormat.makeComma(_num);
      _loc2_ = "<font color=\'#" + lib.info.TextColor.GENERAL_EXP.toString(16) + "\'>" + _loc1_ + "</font>";
      lib.manager.ToolTip.add(_tgMc,EXP_STR + _loc2_,1);
   }
   else if(_type == 4)
   {
      _loc1_ = lib.util.CurrencyFormat.makeComma(_num);
      _loc2_ = "<font color=\'#00B4FF\'>" + _IconName + "</font>" + "<font color=\'#7d7d7d\'> : </font><font color=\'#007EFF\'>" + _loc1_ + "</font>";
      lib.manager.ToolTip.add(_tgMc,_loc2_,1);
   }
   else if(_type == 5)
   {
      _loc1_ = lib.util.GoldCurrency.SetGoldText(_num,0,0,0,1);
      _loc2_ = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc1_ + "</font>";
      lib.manager.ToolTip.add(_tgMc,GOLD_STR + _loc2_,1);
   }
   else if(_type == 6)
   {
      _loc1_ = lib.util.CurrencyFormat.makeComma(_num);
      _loc2_ = "<font color=\'#00BAFF\'>" + _loc1_ + "</font>";
      lib.manager.ToolTip.add(_tgMc,TIRED_STR + _loc2_,1);
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
function clearSoloMission()
{
   var _loc3_ = container_mc.soloMc.missionContainer;
   var _loc1_ = 0;
   while(_loc1_ < missionLen)
   {
      var _loc2_ = _loc3_["mision" + _loc1_];
      lib.manager.ToolTip.remove(_loc2_.tip);
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
}
function clearSoloList()
{
   var _loc1_ = 0;
   while(_loc1_ < soloList.length)
   {
      var _loc2_ = container_mc.listContainerMc.mc1["lineMc" + soloList[_loc1_]];
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   soloList = [];
}
function ToGame_DungeonPartyMatching_Tab(num)
{
   getURL("FSCommand:ToGame_DungeonPartyMatching_Tab",num);
}
function ToGame_DungeonPartyMatching_SoloList(id)
{
   getURL("FSCommand:ToGame_DungeonPartyMatching_SoloList",id);
}
function ToGame_DungeonPartyMatching_SoloShop()
{
   fscommand("ToGame_DungeonPartyMatching_SoloShop");
}
function ToGame_DungeonPartyMatching_SoloConfirm()
{
   fscommand("ToGame_DungeonPartyMatching_SoloConfirm");
}
function setPos()
{
   var _loc1_ = container_mc.scenarioMc.boxMc.missionContainer._height + 55;
   var _loc2_ = container_mc.scenarioMc.boxMc.slotContainer._height + 60;
   var _loc3_ = 140;
   if(_loc1_ < 112)
   {
      _loc1_ = 112;
   }
   if(_loc2_ < 112)
   {
      _loc2_ = 112;
   }
   container_mc.scenarioMc.boxMc.bg0._height = _loc1_;
   container_mc.scenarioMc.boxMc.collectMc._y = _loc1_ + 85 + _loc3_;
   container_mc.scenarioMc.boxMc.slotContainer._y = _loc1_ + 125 + _loc3_;
   container_mc.scenarioMc.boxMc.bg1._y = _loc1_ + 80 + _loc3_;
   container_mc.scenarioMc.boxMc.bg1._height = _loc2_;
   container_mc.scenarioMc.boxMc.bg._height = _loc1_ + _loc2_ + _loc3_ + 100;
   container_mc.scenarioMc.scrollbar2.pageSize = container_mc.scenarioMc.boxMc.bg._height;
   container_mc.scenarioMc.scrollbar2.scroll = 0;
}
function ToGame_DungeonPartyMatching_ScenarioList(id)
{
   getURL("FSCommand:ToGame_DungeonPartyMatching_ScenarioList",id);
}
function ToGame_DungeonPartyMatching_ScenarioEnter()
{
   fscommand("ToGame_DungeonPartyMatching_ScenarioEnter");
}
function clearScenarioList(mc)
{
   for(var _loc2_ in mc)
   {
      if(typeof mc[_loc2_] == "movieclip")
      {
         lib.manager.ToolTip.remove(mc[_loc2_].hit);
         mc[_loc2_].removeMovieClip();
      }
   }
}
function clearScenarioSlot(mc)
{
   for(var _loc2_ in mc)
   {
      if(typeof mc[_loc2_] == "movieclip")
      {
         lib.manager.ToolTip.remove(mc[_loc2_].slot);
         mc[_loc2_].removeMovieClip();
      }
   }
}
var UI = this;
UI._visible = false;
var UIname = "DungeonPartyMatching";
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
var selectedDunges = [];
var listTotal = 0;
var listContainerY = container_mc.listContainerMc._y;
var guideContainerY = container_mc.guideContainerMc._y;
var rewardPosTX = 5;
var rewardPosTY = 3;
var diffToolTipStr = lib.util.UIString.getUIString("$461032");
defaultStr.hitTestDisable = true;
myListener.OnGame_DungeonPartyMatching_DungenList = function(dungenData)
{
   clearDuengenList();
   var _loc32_ = lib.util.ExtString.split(dungenData,"\n");
   var _loc31_ = _loc32_.length;
   if(dungenData == "" || dungenData == undefined)
   {
      container_mc.defaultStr._visible = true;
      return undefined;
   }
   container_mc.defaultStr._visible = false;
   listTotal = _loc31_;
   var _loc8_ = 0;
   while(_loc8_ < _loc31_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc32_[_loc8_],"\t");
      var id = _loc2_[0];
      var joinState = Number(_loc2_[1]);
      var _loc24_ = _loc2_[2];
      var _loc26_ = _loc2_[3];
      var _loc15_ = lib.util.ExtString.split(_loc2_[4],"/");
      var _loc17_ = _loc15_[1];
      var _loc28_ = Number(_loc15_[0]) >= Number(_loc15_[1]);
      var _loc18_ = _loc2_[5];
      var _loc30_ = _loc2_[5];
      var _loc19_ = lib.util.ExtString.split(_loc2_[6],"/");
      var _loc20_ = _loc2_[6];
      var _loc22_ = Number(_loc19_[0]) < Number(_loc19_[1]);
      var _loc21_ = _loc2_[7];
      var _loc16_ = _loc2_[11];
      var _loc29_ = _loc2_[8];
      var _loc27_ = _loc2_[9];
      var _loc25_ = Number(_loc2_[10]);
      var _loc12_ = Number(_loc2_[12]);
      var _loc23_ = _loc2_[13];
      var lineMc = container_mc.listContainerMc.mc0.attachMovie("lineId","lineMc" + _loc8_,_loc8_);
      lineMc._y = (lineMc._height + 1) * _loc8_;
      lineMc.id = id;
      lineMc.levelMc.txt.text = _loc24_;
      lineMc.txt0.setText(_loc26_);
      lineMc.partyMc.txt.text = _loc21_;
      lineMc.partyMc._visible = _loc21_ != "";
      if(lineMc.partyMc._visible)
      {
         lib.manager.ToolTip.add(lineMc.partyMc,id,6);
      }
      lineMc.bpMc._visible = _loc16_ != "" && _loc16_ != undefined;
      lineMc.bpMc.txt.text = _loc16_;
      lib.manager.ToolTip.add(lineMc.bpMc,"$461030",1);
      var _loc9_ = lineMc.attachMovie("starMc","starMc",10);
      _loc9_._x = lineMc.txt0._x + lineMc.txt0.textWidth + 4;
      _loc9_._y = lineMc.txt0._y + 2;
      _loc9_.gotoAndStop(_loc25_);
      lib.manager.ToolTip.add(_loc9_,diffToolTipStr,1);
      lineMc.partyMc._x = _loc9_._x + _loc9_._width;
      var _loc11_ = lib.util.ExtString.split(_loc29_,"|");
      lineMc.recommandMc._visible = _loc11_[0] != "" && _loc11_[0] != undefined;
      lineMc.recommandMc.txt.htmlText = _loc11_[0];
      lineMc.recommandMc.txt._width = lineMc.recommandMc.txt.textWidth + 4;
      lib.manager.ToolTip.add(lineMc.recommandMc,_loc11_[1],1);
      var _loc5_ = lib.util.ExtString.split(_loc27_,"|");
      lineMc.equipmentMc._visible = _loc5_[0] != "" && _loc5_[0] != undefined;
      lineMc.equipmentMc.txt.htmlText = _loc5_[0];
      var _loc10_ = lineMc.equipmentMc.txt.textWidth + 4;
      lineMc.equipmentMc.txt._width = _loc10_;
      lineMc.equipmentMc.hit._width = _loc10_ + 24;
      lib.manager.ToolTip.add(lineMc.equipmentMc.hit,_loc5_[1],1);
      var _loc13_ = 6;
      var _loc3_ = 2;
      while(_loc3_ < _loc5_.length)
      {
         var _loc7_ = lib.util.ExtString.split(_loc5_[_loc3_],"=");
         var _loc6_ = _loc7_[1];
         if(_loc6_ != "" && _loc6_ != undefined)
         {
            var _loc4_ = lineMc.equipmentMc.createEmptyMovieClip("img" + (_loc3_ - 2),_loc3_ - 2 + 1);
            _loc4_._x = _loc10_ + 28 + 30 * (_loc3_ - 2);
            _loc4_._y = -5;
            lib.util.DrawBitmap.draw(_loc4_,_loc6_,28,28);
            lib.manager.ToolTip.add(_loc4_,_loc7_[0],6);
            _loc13_ = _loc13_ + 30;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(_loc5_.length > 2)
      {
         var _loc14_ = lineMc.equipmentMc.attachMovie("itembg","itembg",0);
         _loc14_._x = _loc10_ + 24;
         _loc14_._y = -10;
         _loc14_._width = _loc13_;
      }
      if(lineMc.recommandMc._visible)
      {
         lineMc.equipmentMc._x = lineMc.recommandMc._x + lineMc.recommandMc._width + 17;
      }
      else
      {
         lineMc.equipmentMc._x = lineMc.recommandMc._x;
      }
      lineMc.itemLevelMc.txt.text = _loc17_;
      lineMc.itemLevelMc.txt.textColor = !_loc28_?12582917:2261247;
      lineMc.itemLevelMc._visible = _loc17_ != undefined;
      if(lineMc.itemLevelMc._visible)
      {
         lib.manager.ToolTip.add(lineMc.itemLevelMc,"$461008",1);
      }
      lineMc.coolTimeMc.txt.text = _loc18_;
      lineMc.coolTimeMc._visible = _loc18_ != "";
      lineMc.countMc.txt.text = _loc20_;
      lineMc.countMc.txt.textColor = !_loc22_?12582917:14145495;
      lineMc.countMc._visible = _loc20_ != "";
      if(lineMc.countMc._visible)
      {
         lib.manager.ToolTip.add(lineMc.countMc,"$461010",1);
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
         allCheckEventLock = false;
         lib.manager.UISound.play(lib.manager.UISound.CHECKBTN_CHECK);
         if(this._parent.joinState == 0)
         {
            this._parent.onSelected(1);
         }
         else if(this._parent.joinState == 1)
         {
            this._parent.onSelected(0);
         }
      };
      lineMc.onSelected = function(flag)
      {
         this.joinState = flag;
         if(flag == 0)
         {
            container_mc.checkAllBtn.checked = false;
            container_mc.checkAllBtn.checkAllMc.gotoAndStop(1);
            this.txt0.textColor = 14145495;
            this.txt1.textColor = 14145495;
            this.checkMc.gotoAndStop(1);
            this.bgMc.gotoAndStop(1);
            overAni(this.bgMc.lineOverBgMc,0);
            ToGame_DungeonPartyMatching_DeSelect(this.id);
         }
         else if(flag == 1)
         {
            this.txt0.textColor = 14145495;
            this.txt1.textColor = 14145495;
            this.checkMc.gotoAndStop(3);
            this.bgMc.gotoAndStop(1);
            overAni(this.bgMc.lineOverBgMc,100);
            ToGame_DungeonPartyMatching_Select(this.id);
         }
         else
         {
            this.lineMc.levelMc.txt.textColor = lib.info.TextColor.GENERAL_DISABLE;
            this.txt0.textColor = lib.info.TextColor.GENERAL_DISABLE;
            this.txt1.textColor = lib.info.TextColor.GENERAL_DISABLE;
            this.bgMc.gotoAndStop(2);
            this.checkMc.gotoAndStop(4);
            overAni(this.bgMc.lineOverBgMc,0);
            lib.manager.ToolTip.add(this.checkMc,"<font color=\'#C00005\'>" + lib.util.UIString.getUIString("$461011") + "</font>",2);
         }
      };
      lineMc.notice.gotoAndStop(_loc12_);
      if(_loc12_ == 1)
      {
         lib.manager.ToolTip.add(lineMc.notice,lib.util.UIString.getUIString("$279111"),1);
      }
      else if(_loc12_ == 2)
      {
         lib.manager.ToolTip.add(lineMc.notice,lib.util.UIString.getUIString("$279112"),1);
      }
      else if(_loc12_ == 3)
      {
         lib.manager.ToolTip.add(lineMc.notice,lib.util.UIString.getUIString("$279113"),1);
      }
      else
      {
         lineMc.notice._visible = false;
      }
      lib.manager.ToolTip.add(lineMc.notice,_loc23_,1);
      lineMc.onSelected(joinState);
      _loc8_ = _loc8_ + 1;
   }
   if(selectedTabIndex == 0)
   {
      container_mc.scrollbar.pageSize = container_mc.listContainerMc.mc0._height;
   }
   historyLoad_Check();
   historyLoad_Scroll();
};
myListener.OnGame_DungeonPartyMatching_SetPosition = function(guard, dealer, healer)
{
   guard = Number(guard);
   dealer = Number(dealer);
   healer = Number(healer);
   container_mc.rollBtn0.checked = guard;
   container_mc.rollBtn1.checked = dealer;
   container_mc.rollBtn2.checked = healer;
   container_mc.rollBtn0.rollMc.gotoAndStop(guard + 1);
   container_mc.rollBtn0.checkMc.gotoAndStop(guard + 1);
   container_mc.rollBtn1.rollMc.gotoAndStop(dealer + 1);
   container_mc.rollBtn1.checkMc.gotoAndStop(dealer + 1);
   container_mc.rollBtn2.rollMc.gotoAndStop(healer + 1);
   container_mc.rollBtn2.checkMc.gotoAndStop(healer + 1);
   setRadioButton([container_mc.rollBtn0.hit,container_mc.rollBtn1.hit,container_mc.rollBtn2.hit]);
};
lib.manager.ToolTip.add(container_mc.rollBtn0.hit,"$461012",1);
lib.manager.ToolTip.add(container_mc.rollBtn1.hit,"$461013",1);
lib.manager.ToolTip.add(container_mc.rollBtn2.hit,"$461014",1);
var listTotal2 = 0;
myListener.OnGame_DungeonPartyMatching_SetMasterOption = function(_list)
{
   clearOptionList();
   var _loc5_ = lib.util.ExtString.split(_list,"\n");
   var _loc4_ = _loc5_.length;
   container_mc.scrollbar.pageSize = 0;
   if(_loc4_ == 0)
   {
      container_mc.checkBtn1._y = 671;
      container_mc.checkBtn1._x = 50;
      container_mc.masterOption.gotoAndStop(1);
      container_mc.scrollbar.resize(478);
      container_mc.scrollbar.displaySize = container_mc.maskMc._height = 481;
      container_mc.scrollbar.rowHeight = 500;
   }
   else if(_loc4_ < 5)
   {
      container_mc.checkBtn1._y = 596;
      container_mc.checkBtn1._x = 690 - container_mc.checkBtn1.txt.textWidth;
      container_mc.masterOption.gotoAndStop(2);
      container_mc.scrollbar.resize(399);
      container_mc.scrollbar.displaySize = container_mc.maskMc._height = 402;
      container_mc.scrollbar.rowHeight = 410;
   }
   else
   {
      container_mc.checkBtn1._y = 531;
      container_mc.checkBtn1._x = 690 - container_mc.checkBtn1.txt.textWidth;
      container_mc.masterOption.gotoAndStop(3);
      container_mc.scrollbar.resize(338);
      container_mc.scrollbar.displaySize = container_mc.maskMc._height = 341;
      container_mc.scrollbar.rowHeight = 350;
   }
   container_mc.scrollbar.pageSize = container_mc.listContainerMc.mc0._height;
   if(_loc5_ == "" || _loc5_ == undefined)
   {
      return undefined;
   }
   listTotal2 = _loc4_;
   var _loc2_ = 0;
   while(_loc2_ < _loc4_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc5_[_loc2_],"\t");
      var _loc1_ = container_mc.masterOption.listBox.attachMovie("selectBox","selectBox_" + _loc2_,_loc2_);
      _loc1_.name_txt.text = _loc3_[0];
      _loc1_.class_icon.gotoAndStop(Number(_loc3_[1]) + 1);
      guard = Number(_loc3_[2]);
      dealer = Number(_loc3_[3]);
      healer = Number(_loc3_[4]);
      _loc1_.roll0.checked = guard;
      _loc1_.roll1.checked = dealer;
      _loc1_.roll2.checked = healer;
      _loc1_.roll0.rollMc.gotoAndStop(guard + 1);
      _loc1_.roll0.checkMc.gotoAndStop(guard + 1);
      _loc1_.roll1.rollMc.gotoAndStop(dealer + 1);
      _loc1_.roll1.checkMc.gotoAndStop(dealer + 1);
      _loc1_.roll2.rollMc.gotoAndStop(healer + 1);
      _loc1_.roll2.checkMc.gotoAndStop(healer + 1);
      lib.manager.ToolTip.add(container_mc.roll0.hit,"$461012",1);
      lib.manager.ToolTip.add(container_mc.roll1.hit,"$461013",1);
      lib.manager.ToolTip.add(container_mc.roll2.hit,"$461014",1);
      setRadioButton([_loc1_.roll0.hit,_loc1_.roll1.hit,_loc1_.roll2.hit],_loc3_[0]);
      _loc1_._x = 171 * (_loc2_ % 4);
      if(_loc4_ > 4)
      {
         _loc1_._y = 65 * int(_loc2_ / 4);
      }
      _loc2_ = _loc2_ + 1;
   }
   if(_loc4_ > 4)
   {
      var _loc6_ = int(_loc4_ / 4) + 1;
      var _loc7_ = ((_loc6_ - 3) * 65 + 62) / (_loc6_ - 2);
      container_mc.masterOption.listBox._y = -24;
      _boxScroll.pageSize = container_mc.masterOption.listBox._height;
      _boxScroll._visible = true;
      _boxScroll.rowHeight = _loc7_;
   }
   else
   {
      container_mc.masterOption.listBox._y = 41;
      _boxScroll._visible = false;
   }
};
myListener.OnGame_DungeonPartyMatching_SetGuide = function(reward)
{
   var _loc14_ = lib.util.ExtString.split(reward,"\n");
   var _loc15_ = _loc14_.length;
   if(reward == "" || reward == undefined)
   {
      return undefined;
   }
   var _loc5_ = undefined;
   var _loc4_ = 0;
   while(_loc4_ < _loc15_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc14_[_loc4_],"\t");
      var _loc7_ = _loc3_[0];
      var _loc9_ = _loc3_[1];
      var _loc13_ = _loc3_[2];
      var _loc12_ = _loc3_[3];
      var _loc11_ = Number(_loc3_[4]);
      var grade = Number(_loc3_[5]);
      var _loc10_ = Number(_loc3_[6]);
      var _loc8_ = Number(_loc3_[7]);
      var _loc2_ = container_mc.guideContainerMc.mc0.attachMovie("rewardId","rewardLineMc" + _loc4_,_loc4_);
      _loc2_._x = rewardPosTX;
      if(_loc5_ == undefined)
      {
         _loc2_._y = rewardPosTY;
      }
      else
      {
         _loc2_._y = _loc5_._y + _loc5_._height + 9;
      }
      _loc5_ = _loc2_;
      _loc2_.txt.setText(_loc7_);
      var _loc6_ = _loc2_.slotMc;
      _loc6_._y = _loc2_.txt._y + _loc2_.txt.textHeight + 3;
      _loc2_.id = _loc9_;
      _loc2_.img = _loc12_;
      _loc2_.count = _loc11_;
      _loc2_.grade = grade;
      _loc2_.seal = _loc10_;
      _loc2_.master = _loc8_;
      _loc2_.itemname = _loc13_;
      _loc2_.multiNum = Number(_loc3_[8]);
      _loc6_.onLoad = function()
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
      _loc4_ = _loc4_ + 1;
   }
   container_mc.guideContainerMc.mc0.helpGuideBg._y = _loc5_._y + _loc5_._height + 10;
   container_mc.guideContainerMc.mc0.txt._y = container_mc.guideContainerMc.mc0.helpGuideBg._y + 20;
   container_mc.scrollbar1.pageSize = container_mc.guideContainerMc.mc0.txt._y + container_mc.guideContainerMc.mc0.txt.textHeight + 40;
};
myListener.OnGame_DungeonPartyMatching_SetEnableConfirmBtn = function(enable)
{
   btn1_btn.setEnabled(Number(enable));
};
var allCheckEventLock = false;
myListener.OnGame_DungeonPartyMatching_SetCheckAll = function(checked)
{
   if(allCheckEventLock == true)
   {
      return undefined;
   }
   checked = Number(checked);
   container_mc.checkAllBtn.checked = checked;
   if(checked)
   {
      container_mc.checkAllBtn.checkAllMc.gotoAndStop(3);
   }
   else
   {
      container_mc.checkAllBtn.checkAllMc.gotoAndStop(1);
   }
};
myListener.OnGame_DungeonPartyMatching_SetPartyMaster = function(flag)
{
   container_mc.checkBtn1.checked = Boolean(Number(flag));
};
container_mc.checkBtn1.onChanged = function(changed)
{
   ToGame_DungeonPartyMatching_SetPartyMaster(this.checked);
};
container_mc.guideContainerMc.mc0.txt.htmlText = lib.util.UIString.getUIString("$461015") + "<br>" + lib.util.UIString.getUIString("$461029");
container_mc.guideContainerMc.mc0.txt._height = container_mc.guideContainerMc.mc0.txt.textHeight + 4;
container_mc.guideContainerMc.mc0.helpGuideBg._height = container_mc.guideContainerMc.mc0.txt.textHeight + 40;
var dBtnMcX0 = container_mc.btn_mc0._x;
var dBtnTxtX0 = container_mc.btn_txt0._x;
var btnSpace = 206;
var guideBtnVisible = true;
myListener.OnGame_DungeonPartyMatching_VisibleGuideBtn = function(__visible)
{
   var _loc1_ = container_mc.btn_mc0;
   var _loc2_ = container_mc.btn_txt0;
   if(__visible == "1")
   {
      _loc1_._x = 762;
      _loc2_._x = 769.5;
      btn3_btn.setVisible(true);
      guideBtnVisible = true;
   }
   else
   {
      _loc1_._x = 853;
      _loc2_._x = 860.5;
      btn3_btn.setVisible(false);
      guideBtnVisible = false;
   }
};
var x_btn = new lib.util.TxtBtn(container_mc.xmc);
var btn0_btn = new lib.util.TxtBtn(container_mc.btn_mc0,container_mc.btn_txt0);
var btn1_btn = new lib.util.TxtBtn(container_mc.btn_mc1,container_mc.btn_txt1);
var btn3_btn = new lib.util.TxtBtn(container_mc.btn_mc3,container_mc.btn_txt3);
btn1_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
btn3_btn.setTextColor(12636922,12636922,12636922,lib.info.TextColor.BTN_UINIQUE_DISABLE);
btn0_btn.setTextColor(12636922,12636922,12636922,lib.info.TextColor.BTN_UINIQUE_DISABLE);
btn0_btn.setRelease(ToGame_DungeonPartyMatching_Refresh);
btn1_btn.setRelease(ToGame_DungeonPartyMatching_Confirm);
btn3_btn.setRelease(ToGame_DungeonPartyMatching_Guide);
x_btn.setRelease(ToGame_DungeonPartyMatching_Close);
btn1_btn.setEnabled(false);
var guideBtnStr = lib.util.UIString.getUIString("$461031");
container_mc.btn_txt3.htmlText = "<img src=\'guideIcon\' vspace=\'-6\'>" + guideBtnStr;
container_mc.checkAllBtn.checked = false;
container_mc.checkAllBtn.onRollOver = function()
{
   if(!this.checked)
   {
      this.checkAllMc.gotoAndStop(2);
   }
};
container_mc.checkAllBtn.onRollOut = container_mc.checkAllBtn.onReleaseOutside = function()
{
   if(!this.checked)
   {
      this.checkAllMc.gotoAndStop(1);
   }
};
container_mc.checkAllBtn.onRelease = function()
{
   allCheckEventLock = false;
   this.checked = !this.checked;
   lib.manager.UISound.play(lib.manager.UISound.CHECKBTN_CHECK);
   if(this.checked)
   {
      this.checkAllMc.gotoAndStop(3);
   }
   else
   {
      this.checkAllMc.gotoAndStop(2);
   }
   checkAll(this.checked);
};
container_mc.scrollbar.pageSize = 0;
container_mc.scrollbar.displaySize = container_mc.maskMc._height;
container_mc.scrollbar.rowHeight = 500;
container_mc.listContainerMc.onScroll = function()
{
   this._y = listContainerY - arguments[0];
};
container_mc.scrollbar.setWheel(container_mc.maskMc);
container_mc.scrollbar.addListener(container_mc.listContainerMc);
container_mc.scrollbar1.pageSize = 0;
container_mc.scrollbar1.displaySize = container_mc.maskMc1._height;
container_mc.scrollbar1.rowHeight = 300;
container_mc.guideContainerMc.onScroll = function()
{
   this._y = guideContainerY - arguments[0];
};
container_mc.scrollbar1.setWheel(container_mc.maskMc1);
container_mc.scrollbar1.addListener(container_mc.guideContainerMc);
var _boxScroll = container_mc.masterOption.scrollbar;
_boxScroll.pageSize = 0;
_boxScroll.displaySize = 131;
_boxScroll.rowHeight = 120;
container_mc.masterOption.listBox.onScroll = function()
{
   this._y = -24 - arguments[0];
};
_boxScroll.setWheel(container_mc.masterOption.listBox);
_boxScroll.addListener(container_mc.masterOption.listBox);
_boxScroll._visible = false;
var scenarioContainerY = container_mc.scenarioMc.boxMc._y;
container_mc.scenarioMc.scrollbar2.pageSize = 0;
container_mc.scenarioMc.scrollbar2.displaySize = container_mc.scenarioMc.maskMc2._height;
container_mc.scenarioMc.scrollbar2.rowHeight = 470;
container_mc.scenarioMc.boxMc.onScroll = function()
{
   this._y = scenarioContainerY - arguments[0];
};
container_mc.scenarioMc.scrollbar2.setWheel(container_mc.scenarioMc.maskMc2);
container_mc.scenarioMc.scrollbar2.addListener(container_mc.scenarioMc.boxMc);
var SaveData = lib.gamedata.HistoryData.getHistoryData(UIname);
myListener.OnGame_DungeonPartyMatching_VisibleGuideBtn("0");
container_mc.soloMc._visible = false;
var soloLineFocus = "";
var soloTotal = 0;
var soloList = [];
var missionTotal = 0;
var soloVisibleElements = [];
var soloNonVisibleElements = [];
var missionLen = 0;
var tab = container_mc.tabBtn.tab;
tab.setTab(0,1);
var solo_shop_btn = new lib.util.TxtBtn(container_mc.soloMc.soloShopBtn,container_mc.soloMc.soloShopBtnTxt);
solo_shop_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
solo_shop_btn.setRelease(ToGame_DungeonPartyMatching_SoloShop);
var solo_confirm_btn = new lib.util.TxtBtn(container_mc.soloMc.soloConfirmBtn,container_mc.soloMc.soloConfirmBtnTxt);
solo_confirm_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
solo_confirm_btn.setRelease(ToGame_DungeonPartyMatching_SoloConfirm);
myListener.OnGame_DungeonPartyMatching_SoloShop = function(count, btnType, tooltip)
{
   container_mc.soloMc.medalCount.text = "X " + count;
   solo_shop_btn.setEnabled(Boolean(Number(btnType)));
   if(tooltip)
   {
      lib.manager.ToolTip.add(container_mc.soloMc.soloConfirmBtnTxt,tooltip,1);
   }
   else
   {
      lib.manager.ToolTip.remove(container_mc.soloMc.soloConfirmBtnTxt);
   }
};
myListener.OnGame_DungeonPartyMatching_ConfirmBtnEnabled = function(isEnabled, tooltip)
{
   solo_confirm_btn.setEnabled(Boolean(Number(isEnabled)));
   if(tooltip)
   {
      lib.manager.ToolTip.add(container_mc.soloMc.soloConfirmBtnTxt,tooltip,1);
   }
   else
   {
      lib.manager.ToolTip.remove(container_mc.soloMc.soloConfirmBtnTxt);
   }
};
myListener.OnGame_DungeonPartyMatching_SoloReward = function(countList)
{
   var _loc1_ = lib.util.ExtString.split(countList,"\t");
   rewardStr = lib.util.UIString.getUIString("$461041","ss",_loc1_[4],"s",_loc1_[3],"a",_loc1_[2],"b",_loc1_[1],"c",_loc1_[0]);
   container_mc.soloMc.rewardTxt.htmlText = rewardStr;
};
soloNonVisibleElements.push(container_mc.btn_txt1);
soloNonVisibleElements.push(container_mc.btn_mc1);
soloNonVisibleElements.push(container_mc.btn_txt0);
soloNonVisibleElements.push(container_mc.btn_mc0);
soloNonVisibleElements.push(container_mc.bg_frame);
soloNonVisibleElements.push(container_mc.guideContainerMc);
soloNonVisibleElements.push(container_mc.listContainerMc.mc0);
soloNonVisibleElements.push(container_mc.checkBtn1);
soloNonVisibleElements.push(container_mc.checkAllBtn);
soloNonVisibleElements.push(container_mc.scrollbar1);
soloNonVisibleElements.push(container_mc.masterOption);
var selectedTabIndex = 0;
tab.setRelease(tabRelease);
container_mc.tabBtn._visible = false;
lib.manager.ToolTip.add(container_mc.soloHelpIcon,"$461042",1);
myListener.OnGame_DungeonPartyMatching_TabVisible = function(isV)
{
   container_mc.tabBtn._visible = isV == 1;
};
myListener.OnGame_DungeonPartyMatching_TabEffect = function(index, bool)
{
   setEffectVisibility(index,bool);
};
setEffectVisibility(0,0);
setEffectVisibility(1,0);
myListener.OnGame_DungeonPartyMatching_TabFocus = function(idx)
{
   tab.setTab(idx);
};
myListener.OnGame_DungeonPartyMatching_SoloListFocus = function(id)
{
   var _loc1_ = container_mc.listContainerMc.mc1["lineMc" + id];
   if(_loc1_)
   {
      soloLineFocus.checkMc.gotoAndStop(1);
      soloLineFocus.bgMc.lineOverBgMc._alpha = 0;
      soloLineFocus = _loc1_;
      _loc1_.checkMc.gotoAndStop(3);
      ToGame_DungeonPartyMatching_SoloList(id);
   }
};
myListener.OnGame_DungeonPartyMatching_SelectCount = function(num)
{
   container_mc.soloMc.titleTxt.text = lib.util.UIString.getUIString("$461052","count",num);
};
myListener.OnGame_DungeonPartyMatching_SoloList = function(dataList)
{
   clearSoloList();
   var _loc13_ = lib.util.ExtString.split(dataList,"\n");
   var _loc12_ = _loc13_.length;
   soloTotal = _loc12_;
   container_mc.defaultStr._visible = _loc12_ == 0;
   var _loc7_ = 0;
   while(_loc7_ < _loc12_)
   {
      var _loc5_ = lib.util.ExtString.split(_loc13_[_loc7_],"\t");
      var _loc2_ = container_mc.listContainerMc.mc1.attachMovie("soloLine","lineMc" + _loc5_[0],_loc7_);
      soloList.push(_loc5_[0]);
      _loc2_.id = _loc5_[0];
      _loc2_.txt0.text = _loc5_[1];
      _loc2_.txt1.text = lib.util.UIString.getUIString("$461037");
      _loc2_.levelMc.txt.text = _loc5_[2];
      _loc2_._y = (_loc2_._height + 1) * _loc7_;
      _loc2_.enable = Boolean(Number(_loc5_[3]));
      if(_loc2_.enable)
      {
         _loc2_.bg.gotoAndStop(1);
         _loc2_.hit.onRollOver = function()
         {
            if(this._parent != soloLineFocus)
            {
               this._parent.checkMc.gotoAndStop(2);
               overAni(this._parent.bgMc.lineOverBgMc,55);
            }
         };
         _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
         {
            if(this._parent != soloLineFocus)
            {
               this._parent.checkMc.gotoAndStop(1);
               overAni(this._parent.bgMc.lineOverBgMc,0);
            }
         };
         _loc2_.hit.onRelease = function()
         {
            lib.manager.UISound.play(lib.manager.UISound.CHECKBTN_CHECK);
            if(this._parent != soloLineFocus)
            {
               soloLineFocus.checkMc.gotoAndStop(1);
               soloLineFocus.bgMc.lineOverBgMc._alpha = 0;
               soloLineFocus = this._parent;
               this._parent.checkMc.gotoAndStop(3);
               ToGame_DungeonPartyMatching_SoloList(this._parent.id);
            }
         };
      }
      else
      {
         _loc2_.checkMc.gotoAndStop(4);
         _loc2_.bgMc.gotoAndStop(2);
      }
      var _loc9_ = lib.util.ExtString.split(_loc5_[4],"|");
      var _loc3_ = 0;
      while(_loc3_ < _loc9_.length)
      {
         var _loc6_ = lib.util.ExtString.split(_loc9_[_loc3_],"=");
         var _loc8_ = _loc6_[1];
         var _loc4_ = _loc2_.attachMovie("slotDraw","slot" + _loc3_,_loc2_.getNextHighestDepth());
         _loc4_._x = _loc2_.txt1._x + _loc2_.txt1.textWidth + 32 * _loc3_ + 8;
         _loc4_._y = 40;
         lib.util.DrawBitmap.draw(_loc4_,_loc8_,28,28);
         lib.manager.ToolTip.add(_loc4_,_loc6_[0],6);
         _loc3_ = _loc3_ + 1;
      }
      var _loc11_ = Number(_loc5_[5]);
      var _loc10_ = _loc2_.attachMovie("starMc","starMc",10);
      _loc10_._x = _loc2_.txt0._x + _loc2_.txt0.textWidth + 4;
      _loc10_._y = _loc2_.txt0._y + 2;
      _loc10_.gotoAndStop(_loc11_);
      lib.manager.ToolTip.add(_loc10_,diffToolTipStr,1);
      _loc2_.count.text = _loc5_[6] + "/" + _loc5_[7];
      _loc7_ = _loc7_ + 1;
   }
   container_mc.scrollbar.pageSize = container_mc.listContainerMc.mc1._height;
};
var ColorArr = ["","0xCCCCCC","0xFFFFFF","0x666666","0x666666","0x666666","0xFFFFFF"];
container_mc.soloMc.misionR.gotoAndStop(2);
myListener.OnGame_DungeonPartyMatching_Random = function(id, num, isEnabled, checkBtn, tooltip)
{
   var _loc1_ = container_mc.soloMc.misionR;
   _loc1_._y = 42 * missionLen - 360;
   _loc1_.txt.htmlText = lib.util.UIString.getUIString("$461053","count",num);
   if(tooltip)
   {
      lib.manager.ToolTip.add(_loc1_.hit,tooltip,1);
   }
   else
   {
      lib.manager.ToolTip.remove(_loc1_.hit);
   }
   setLine(_loc1_,id,isEnabled,checkBtn);
};
myListener.OnGame_DungeonPartyMatching_SoloMission = function(dataList)
{
   clearSoloMission();
   var _loc5_ = container_mc.soloMc.missionContainer;
   var _loc4_ = lib.util.ExtString.split(dataList,"\n");
   missionLen = _loc4_.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc4_.length)
   {
      var _loc1_ = lib.util.ExtString.split(_loc4_[_loc3_],"\t");
      var _loc2_ = _loc5_.attachMovie("SoloMission","mision" + _loc3_,_loc5_.getNextHighestDepth());
      _loc2_._y = 42 * _loc3_;
      _loc2_.txt.htmlText = _loc1_[1];
      lib.manager.ToolTip.add(_loc2_.tip,_loc1_[4],1);
      if(_loc1_[5])
      {
         lib.manager.ToolTip.add(_loc2_.hit,_loc1_[5],1);
      }
      else
      {
         lib.manager.ToolTip.remove(_loc2_.hit);
      }
      setLine(_loc2_,_loc1_[0],_loc1_[2],_loc1_[3]);
      _loc3_ = _loc3_ + 1;
   }
   container_mc.soloMc.misionR._y = 42 * missionLen - 370;
};
container_mc.scenarioMc._visible = false;
var scenarioLineFocus = "";
var scenarioTotal = 0;
var scenarioList = [];
var solo_enter_btn = new lib.util.TxtBtn(container_mc.scenarioMc.btnMc,container_mc.scenarioMc.btnTxt);
solo_enter_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
solo_enter_btn.setRelease(ToGame_DungeonPartyMatching_ScenarioEnter);
myListener.OnGame_DungeonPartyMatching_ScenarioMode = function()
{
   container_mc.rollBtn0._visible = false;
   container_mc.rollBtn1._visible = false;
   container_mc.rollBtn2._visible = false;
   container_mc.titleTxt.text = "$093018";
   container_mc.selectedMission.text = "461040";
   container_mc.guideTxt.text = "$461039";
   container_mc.bg.gotoAndStop(3);
   container_mc.scrollbar._x = 454;
   container_mc.soloMc._visible = false;
   container_mc.scenarioMc._visible = true;
   container_mc.defaultStr._visible = false;
   container_mc.btn_txt3._visible = false;
   container_mc.btn_mc3._visible = false;
   var _loc1_ = undefined;
   _loc1_ = 0;
   while(_loc1_ < soloNonVisibleElements.length)
   {
      soloNonVisibleElements[_loc1_]._visible = false;
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_DungeonPartyMatching_ScenarioList = function(dataList)
{
   clearScenarioList(container_mc.listContainerMc.mc0);
   clearScenarioList(container_mc.listContainerMc.mc1);
   var _loc12_ = lib.util.ExtString.split(dataList,"\n");
   var _loc13_ = _loc12_.length;
   container_mc.defaultStr._visible = _loc13_ == 0;
   var _loc7_ = 0;
   while(_loc7_ < _loc13_)
   {
      var _loc5_ = lib.util.ExtString.split(_loc12_[_loc7_],"\t");
      var _loc2_ = container_mc.listContainerMc.mc1.attachMovie("scenarioLine","lineMc" + _loc5_[0],_loc7_);
      _loc2_.id = _loc5_[0];
      _loc2_.txt0.text = _loc5_[1];
      _loc2_.levelMc.txt.text = _loc5_[2];
      _loc2_._y = (_loc2_._height + 1) * _loc7_;
      _loc2_.enable = Boolean(Number(_loc5_[3]));
      if(_loc2_.enable)
      {
         _loc2_.bg.gotoAndStop(1);
         _loc2_.hit.onRollOver = function()
         {
            if(this._parent != scenarioLineFocus)
            {
               this._parent.checkMc.gotoAndStop(2);
               overAni(this._parent.bgMc.lineOverBgMc,55);
            }
         };
         _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
         {
            if(this._parent != scenarioLineFocus)
            {
               this._parent.checkMc.gotoAndStop(1);
               overAni(this._parent.bgMc.lineOverBgMc,0);
            }
         };
         _loc2_.hit.onRelease = function()
         {
            lib.manager.UISound.play(lib.manager.UISound.CHECKBTN_CHECK);
            if(this._parent != scenarioLineFocus)
            {
               scenarioLineFocus.checkMc.gotoAndStop(1);
               scenarioLineFocus.bgMc.lineOverBgMc._alpha = 0;
               scenarioLineFocus = this._parent;
               this._parent.checkMc.gotoAndStop(3);
               ToGame_DungeonPartyMatching_ScenarioList(this._parent.id);
            }
         };
      }
      else
      {
         _loc2_.checkMc.gotoAndStop(4);
         _loc2_.bgMc.gotoAndStop(2);
      }
      var _loc10_ = lib.util.ExtString.split(_loc5_[4],"|");
      var _loc3_ = 0;
      while(_loc3_ < _loc10_.length)
      {
         var _loc6_ = lib.util.ExtString.split(_loc10_[_loc3_],"=");
         var _loc8_ = _loc6_[1];
         var _loc4_ = _loc2_.attachMovie("slotDraw","slot" + _loc3_,_loc2_.getNextHighestDepth());
         _loc4_._x = 29 * _loc3_ + 74;
         _loc4_._y = 50;
         lib.util.DrawBitmap.draw(_loc4_,_loc8_,28,28);
         lib.manager.ToolTip.add(_loc4_,_loc6_[0],6);
         _loc3_ = _loc3_ + 1;
      }
      var _loc9_ = Number(_loc5_[5]);
      var _loc11_ = _loc2_.attachMovie("starMc","starMc",10);
      if(_loc9_ == 0)
      {
         _loc9_ = 1;
      }
      _loc11_._x = 400 - _loc9_ * 18;
      _loc11_._y = _loc2_.txt0._y + 1;
      _loc11_.gotoAndStop(_loc9_);
      lib.manager.ToolTip.add(_loc11_,diffToolTipStr,1);
      _loc2_.txt1.text = _loc5_[7];
      if(_loc5_[8] == "0")
      {
         _loc2_.txt1.textColor = 12582917;
      }
      _loc2_.txt2.text = _loc5_[9];
      lib.manager.ToolTip.add(_loc2_.rewardMc,"$630015",1);
      lib.manager.ToolTip.add(_loc2_.equipMc,"$461008",1);
      lib.manager.ToolTip.add(_loc2_.countMc,"$600007",1);
      _loc7_ = _loc7_ + 1;
   }
   container_mc.scrollbar.pageSize = container_mc.listContainerMc.mc1._height;
};
myListener.OnGame_DungeonPartyMatching_SetScenario = function(titleStr, subStr, imgType)
{
   var _loc1_ = container_mc.scenarioMc.boxMc;
   _loc1_.imgTxt0.text = titleStr;
   _loc1_.imgTxt1.setText(subStr);
   _loc1_.imgMc.gotoAndStop(Number(imgType) + 1);
   var _loc2_ = _loc1_.imgTxt0.textWidth / 2;
   _loc1_.tl._x = 198 - _loc2_;
   _loc1_.tr._x = 254 + _loc2_;
};
myListener.OnGame_DungeonPartyMatching_ScenarioMission = function(titleStr, dataList)
{
   var _loc5_ = container_mc.scenarioMc.boxMc.missionContainer;
   clearScenarioList(_loc5_);
   var _loc4_ = lib.util.ExtString.split(dataList,"\n");
   var _loc6_ = _loc4_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc6_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc4_[_loc1_],"\t");
      var _loc2_ = _loc5_.attachMovie("scenarioList","lineMc" + _loc1_,_loc1_);
      _loc2_.gotoAndStop(Number(_loc3_[1]) + 1);
      if(_loc3_[1] < 2)
      {
         _loc2_.txt.setText(_loc3_[0]);
      }
      _loc2_._y = 35 * _loc1_;
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_DungeonPartyMatching_ScenarioCollectProgress = function(titleStr, current, total)
{
   container_mc.scenarioMc.boxMc.collectMc.collectTxt.text = titleStr;
   container_mc.scenarioMc.boxMc.collectMc.gageMc._width = current / total * 85;
   container_mc.scenarioMc.boxMc.collectMc.gageTxt.text = current + " / " + total;
};
myListener.OnGame_DungeonPartyMatching_ScenarioCollectList = function(dataList)
{
   var _loc4_ = container_mc.scenarioMc.boxMc.slotContainer;
   clearScenarioSlot(_loc4_);
   var _loc5_ = lib.util.ExtString.split(dataList,"\n");
   var _loc6_ = _loc5_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc6_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc5_[_loc2_],"\t");
      var _loc1_ = _loc4_.attachMovie("slotMc2","slotMc" + _loc2_,_loc4_.getNextHighestDepth());
      _loc1_._x = Number(_loc2_ % 2) * 240;
      _loc1_._y = int(_loc2_ / 2) * 69;
      if(_loc3_[3] == "0")
      {
         _loc1_.gotoAndStop(2);
      }
      else if(_loc3_[3] == "1")
      {
         _loc1_.gotoAndStop(1);
         _loc1_.txt.text = _loc3_[2];
         lib.util.DrawBitmap.draw(_loc1_.slot,_loc3_[1],52,52);
         lib.manager.ToolTip.add(_loc1_.SLOT,_loc3_[4],1);
      }
      else
      {
         _loc1_.gotoAndStop(3);
      }
      _loc2_ = _loc2_ + 1;
   }
   setPos();
};
myListener.OnGame_DungeonPartyMatching_ScenarioFocus = function(id)
{
   var _loc1_ = container_mc.listContainerMc.mc1["lineMc" + id];
   if(_loc1_)
   {
      scenarioLineFocus.checkMc.gotoAndStop(1);
      scenarioLineFocus.bgMc.lineOverBgMc._alpha = 0;
      scenarioLineFocus = _loc1_;
      _loc1_.checkMc.gotoAndStop(3);
      ToGame_DungeonPartyMatching_ScenarioList(id);
   }
};
myListener.OnGame_DungeonPartyMatching_ScenarioBtnEnabled = function(isEnabled, tooltip)
{
   solo_enter_btn.setEnabled(Boolean(Number(isEnabled)));
   if(tooltip)
   {
      lib.manager.ToolTip.add(container_mc.scenarioMc.btnTxt,tooltip,1);
   }
   else
   {
      lib.manager.ToolTip.remove(container_mc.scenarioMc.btnTxt);
   }
};
ToGame_DungeonPartyMatching_Init();
