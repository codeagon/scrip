var UI = this;
UI._visible = false;
var UIname = "QuestJournal";
var dialog = container_mc.dialogContents_mc.content_mc;
var ft = dialog.aimContainer.txt.getTextFormat();
ft.tabStops = [150];
dialog.aimContainer.txt.setNewTextFormat(ft);
var questCompleteMc = dialog.questCompleteMc;
var questCompleteFd = questCompleteMc.txt;
var questCompleteFdW = questCompleteFd.textWidth + 5;
function ListCheck()
{
   var _loc2_ = 0;
   _loc2_ = 0;
   while(_loc2_ < saveOuestLen)
   {
      var _loc1_ = saveQuestData[_loc2_];
      if(_loc1_)
      {
         zoneManager("add",_loc1_[0],_loc1_[1],_loc1_[2],Number(_loc1_[3]),_loc1_[4],Number(_loc1_[5]),Number(_loc1_[6]),Number(_loc1_[7]),Number(_loc1_[8]),Number(_loc1_[9]),Number(_loc1_[10]),Number(_loc1_[11]),Number(_loc1_[12]),Number(_loc1_[13]),Number(_loc1_[14]),Number(_loc1_[15]),Number(_loc1_[16]),Number(_loc1_[17]),Number(_loc1_[18]),Number(_loc1_[19]),Number(_loc1_[20]));
      }
      _loc2_ = _loc2_ + 1;
   }
}
function SearchQuestInfo(id)
{
   var _loc1_ = 0;
   _loc1_ = 0;
   while(_loc1_ < saveOuestLen)
   {
      var _loc2_ = saveQuestData[_loc1_];
      if(_loc2_[2] == id)
      {
         return _loc2_;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function SearchQuestIndex(id)
{
   var _loc1_ = 0;
   _loc1_ = 0;
   while(_loc1_ < saveOuestLen)
   {
      var _loc2_ = saveQuestData[_loc1_];
      if(_loc2_[2] == id)
      {
         return _loc1_;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function autoSelect()
{
   if(tab.activedNum == 1)
   {
      if(clickQuest == null)
      {
         if(quest_array.length >= 1)
         {
            myListener.OnGame_QuestJournal_SelectQuest(quest_array[0].id,1);
         }
         else
         {
            giveUp_btn.setEnabled(false);
            share_btn.setEnabled(false);
            ToGame_QuestJournal_RequestSetDetailInfo("0");
         }
      }
      else
      {
         myListener.OnGame_QuestJournal_SelectQuest(clickQuest,1);
      }
   }
   else if(tab.activedNum == 0)
   {
      if(clickQuest2 == null)
      {
         if(storyQuest_array.length >= 1)
         {
            myListener.OnGame_QuestJournal_SelectQuest(storyQuest_array[0].id,1);
         }
         else
         {
            giveUp_btn.setEnabled(false);
            share_btn.setEnabled(false);
            ToGame_QuestJournal_RequestSetDetailInfo("0");
         }
      }
      else
      {
         myListener.OnGame_QuestJournal_SelectQuest(clickQuest2,1);
      }
   }
   else if(tab.activedNum == 2)
   {
      if(clickQuest3 == null)
      {
         if(guildQuest_array.length >= 1)
         {
            myListener.OnGame_QuestJournal_SelectQuest(guildQuest_array[0].id,1);
         }
         else
         {
            giveUp_btn.setEnabled(false);
            share_btn.setEnabled(false);
            ToGame_QuestJournal_RequestSetDetailInfo("0");
         }
      }
      else
      {
         myListener.OnGame_QuestJournal_SelectQuest(clickQuest3,1);
      }
   }
   else if(tab.activedNum == 3)
   {
      if(clickQuest4 == null)
      {
         if(reputationQuest_array.length >= 1)
         {
            myListener.OnGame_QuestJournal_SelectQuest(reputationQuest_array[0].id,1);
         }
         else
         {
            giveUp_btn.setEnabled(false);
            share_btn.setEnabled(false);
            ToGame_QuestJournal_RequestSetDetailInfo("0");
         }
      }
      else
      {
         myListener.OnGame_QuestJournal_SelectQuest(clickQuest4,1);
      }
   }
}
function getZone(zoneId, isStoryQuest)
{
   var _loc2_ = undefined;
   var _loc1_ = zone_array;
   if(isStoryQuest == 1)
   {
      _loc1_ = storyZone_array;
   }
   else if(isStoryQuest == 2 || isStoryQuest == 4)
   {
      _loc1_ = guildZone_array;
   }
   else if(isStoryQuest == 3)
   {
      _loc1_ = reputationZone_array;
   }
   for(element in _loc1_)
   {
      if(_loc1_[element].id == zoneId)
      {
         _loc2_ = _loc1_[element];
         return _loc2_;
      }
   }
   return null;
}
function getQuest(questId, isStoryQuest)
{
   var _loc3_ = undefined;
   var _loc2_ = quest_array;
   if(isStoryQuest == 1)
   {
      _loc2_ = storyQuest_array;
   }
   else if(isStoryQuest == 2 || isStoryQuest == 4)
   {
      _loc2_ = guildQuest_array;
   }
   else if(isStoryQuest == 3)
   {
      _loc2_ = reputationQuest_array;
   }
   var _loc4_ = _loc2_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      if(_loc2_[_loc1_].id == questId)
      {
         _loc3_ = _loc2_[_loc1_];
         temp_Quest = _loc2_[_loc1_];
         return _loc3_;
      }
      _loc1_ = _loc1_ + 1;
   }
   return null;
}
function calculateContentHeight(type)
{
   var _loc3_ = zone_array;
   if(type == 1)
   {
      _loc3_ = storyZone_array;
   }
   else if(type == 2)
   {
      _loc3_ = guildZone_array;
   }
   else if(type == 3)
   {
      _loc3_ = reputationZone_array;
   }
   var _loc4_ = 0;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      var _loc2_ = _loc3_[_loc1_];
      if(_loc2_.opened)
      {
         _loc4_ = _loc4_ + (_loc2_.questNum * HEIGHT_QUEST + HEIGHT_QUEST);
      }
      else
      {
         _loc4_ = _loc4_ + HEIGHT_QUEST;
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc4_;
}
function refreshZoneHeight(type)
{
   var _loc4_ = zone_array;
   if(type == 1)
   {
      _loc4_ = storyZone_array;
   }
   else if(type == 2)
   {
      _loc4_ = guildZone_array;
   }
   else if(type == 3)
   {
      _loc4_ = reputationZone_array;
   }
   if(type != 2)
   {
      _loc4_.sortOn(["zoneAttachIndex"],Array.NUMERIC);
   }
   var _loc6_ = _loc4_.length;
   var _loc3_ = 0;
   var _loc1_ = 0;
   while(_loc1_ < _loc6_)
   {
      var _loc2_ = _loc4_[_loc1_];
      var _loc5_ = _loc4_[_loc1_].mc;
      _loc5_._y = _loc3_;
      if(_loc2_.opened)
      {
         _loc3_ = _loc3_ + (_loc2_.questNum * HEIGHT_QUEST + HEIGHT_QUEST);
      }
      else
      {
         _loc3_ = _loc3_ + HEIGHT_QUEST;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function zoneManager(order, zoneId, zoneName, questId, questNumber, questName, questType, questIsStoried, questIsFailed, repeatCurNum, repeatTotalNum, questLevel, goodLevel, bPartyZone, bEnableGiveUp, bNotAccept, bQuestComplete, bCantProgress, zoneAttachIndex, bPartyQuest, markerType, toggleType)
{
   var _loc12_ = getZone(zoneId);
   if(questIsStoried == 1)
   {
      _loc12_ = getZone(zoneId,1);
   }
   else if(questIsStoried == 2 || questIsStoried == 4)
   {
      _loc12_ = getZone(zoneId,2);
   }
   else if(questIsStoried == 3)
   {
      _loc12_ = getZone(zoneId,3);
   }
   if(_loc12_)
   {
      questManager(order,_loc12_,questId,questNumber,questName,questType,questIsStoried,questIsFailed,repeatCurNum,repeatTotalNum,questLevel,goodLevel,bEnableGiveUp,bNotAccept,bQuestComplete,bCantProgress,bPartyQuest,markerType,toggleType);
   }
   else if(order == "add")
   {
      var mc;
      if(questIsStoried == 1)
      {
         mc = container_mc.storyContents_mc.content_mc.attachMovie("depth1","zone" + zoneId,cnt);
         container_mc.storyContents_mc.defaultStr._visible = false;
      }
      else if(questIsStoried == 0)
      {
         mc = container_mc.contents_mc.content_mc.attachMovie("depth1","zone" + zoneId,cnt);
         container_mc.contents_mc.defaultStr._visible = false;
      }
      else if(questIsStoried == 2 || questIsStoried == 4)
      {
         mc = container_mc.guildContents_mc.content_mc.attachMovie("depth1","zone" + zoneId,cnt);
         container_mc.guildContents_mc.defaultStr._visible = false;
      }
      else if(questIsStoried == 3)
      {
         mc = container_mc.reputation_mc.content_mc.attachMovie("depth1","zone" + zoneId,cnt);
         container_mc.reputation_mc.defaultStr._visible = false;
      }
      mc.name_txt.verticalAlign = "center";
      mc.name_txt.textColor = lib.info.TextColor.TREEBTN_FIRST_NORMAL;
      var _loc2_ = new Object();
      _loc2_.mc = mc;
      _loc2_.id = zoneId;
      _loc2_.opened = mc.opened = true;
      mc.opened_mc.gotoAndStop(2);
      mc.questType = questIsStoried;
      _loc2_.questNum = 0;
      _loc2_.questArray = new Array();
      if(questIsStoried == 1)
      {
         _loc2_.zoneArray = storyZone_array;
      }
      else if(questIsStoried == 0)
      {
         _loc2_.zoneArray = zone_array;
      }
      else if(questIsStoried == 2 || questIsStoried == 4)
      {
         _loc2_.zoneArray = guildZone_array;
      }
      else if(questIsStoried == 3)
      {
         _loc2_.zoneArray = reputationZone_array;
      }
      if(questIsStoried == 4)
      {
         _loc2_.zoneArray.unshift(_loc2_);
      }
      else
      {
         _loc2_.zoneArray.push(_loc2_);
      }
      if(zoneAttachIndex == "" || zoneAttachIndex == "undefined" || zoneAttachIndex == undefined)
      {
         zoneAttachIndex = _loc2_.zoneArray.length + 1;
      }
      _loc2_.zoneAttachIndex = zoneAttachIndex;
      mc.name_txt.text = zoneName;
      lib.util.ExtString.textCut(mc.name_txt,mc.name_txt.text,1);
      if(bPartyZone == 1)
      {
         mc.name_txt._width = mc.name_txt.textWidth + 5;
         mc.partyNum_mc._x = mc.name_txt._x + mc.name_txt._width;
         mc.partyNum_mc._alpha = 100;
      }
      else
      {
         mc.partyNum_mc._visible = false;
      }
      mc.o = _loc2_;
      lib.manager.ToolTip.add(mc.removeQuestBtn,lib.util.UIString.getUIString("$091033"),1);
      mc.removeQuestBtn.depth = 1;
      mc.removeQuestBtn.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      mc.removeQuestBtn.onRollOut = mc.removeQuestBtn.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      mc.removeQuestBtn.onPress = function()
      {
         this.gotoAndStop(3);
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      };
      mc.removeQuestBtn.onRelease = function()
      {
         this.gotoAndStop(2);
         giveUp(this._parent);
      };
      mc.questAlimBtn.onRollOver = function()
      {
         this.mc.gotoAndStop(2);
      };
      mc.questAlimBtn.onRollOut = mc.questAlimBtn.onReleaseOutside = function()
      {
         this.mc.gotoAndStop(1);
      };
      mc.questAlimBtn.onPress = function()
      {
         this.mc.gotoAndStop(3);
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      };
      mc.questAlimBtn.onRelease = function()
      {
         this.mc.gotoAndStop(2);
         if(this._currentframe == 1)
         {
            this.gotoAndStop(2);
         }
         else
         {
            this.gotoAndStop(1);
         }
         ToGame_QuestJournal_ToggleTaskInfo(this._parent.o.id,this._currentframe - 1,1,this._parent.questType);
         if(this._currentframe == 1)
         {
            lib.manager.ToolTip.add(this,lib.util.UIString.getUIString("$091031"),1);
         }
         else
         {
            lib.manager.ToolTip.add(this,lib.util.UIString.getUIString("$091032"),1);
         }
      };
      if(toggleType == "1")
      {
         mc.questAlimBtn.gotoAndStop(2);
         lib.manager.ToolTip.add(mc.questAlimBtn,lib.util.UIString.getUIString("$091032"),1);
      }
      else
      {
         mc.questAlimBtn.gotoAndStop(1);
         lib.manager.ToolTip.add(mc.questAlimBtn,lib.util.UIString.getUIString("$091031"),1);
      }
      mc.radio_btn.onChanged = function(checked)
      {
         var _loc4_ = this._parent.o.questArray;
         var _loc5_ = _loc4_.length;
         var _loc2_ = 0;
         while(_loc2_ < _loc5_)
         {
            var _loc3_ = _loc4_[_loc2_].mc;
            _loc3_.radio_btn.checked = checked;
            _loc2_ = _loc2_ + 1;
         }
      };
      mc.hit.onRollOver = function()
      {
         this._parent.effect_mc.gotoAndStop("over");
         this._parent.name_txt.textColor = lib.info.TextColor.TREEBTN_FIRST_OVER;
      };
      mc.hit.onRollOut = mc.hit.onReleaseOutside = function()
      {
         this._parent.effect_mc.gotoAndStop("out");
         this._parent.name_txt.textColor = lib.info.TextColor.TREEBTN_FIRST_NORMAL;
      };
      mc.hit.onPress = function()
      {
         this._parent.effect_mc.gotoAndStop("press");
         this._parent.name_txt.textColor = lib.info.TextColor.TREEBTN_FIRST_PRESS;
      };
      mc.hit.onRelease = function()
      {
         this.onRollOver();
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         var _loc2_ = this._parent.o;
         var _loc4_ = null;
         if(_loc2_.opened == true)
         {
            _loc2_.opened = false;
            this._parent.opened_mc.gotoAndStop(1);
            var _loc6_ = _loc2_.questNum * HEIGHT_QUEST;
            this._parent.quest_mc._visible = false;
            var _loc5_ = 0;
            while(_loc5_ < _loc2_.zoneArray.length)
            {
               if(_loc2_.zoneArray[_loc5_].id == this._parent.o.id)
               {
                  _loc4_ = _loc5_;
                  var _loc3_ = 0;
                  while(_loc3_ < _loc2_.zoneArray.length)
                  {
                     if(_loc3_ > _loc4_)
                     {
                        _loc2_.zoneArray[_loc3_].mc._y = _loc2_.zoneArray[_loc3_].mc._y - _loc6_;
                     }
                     _loc3_ = _loc3_ + 1;
                  }
               }
               _loc5_ = _loc5_ + 1;
            }
         }
         else if(_loc2_.opened == false)
         {
            _loc2_.opened = true;
            this._parent.opened_mc.gotoAndStop(2);
            _loc6_ = _loc2_.questNum * HEIGHT_QUEST;
            this._parent.quest_mc._visible = true;
            _loc5_ = 0;
            while(_loc5_ < _loc2_.zoneArray.length)
            {
               if(_loc2_.zoneArray[_loc5_].id == this._parent.o.id)
               {
                  _loc4_ = _loc5_;
                  _loc3_ = 0;
                  while(_loc3_ < _loc2_.zoneArray.length)
                  {
                     if(_loc3_ > _loc4_)
                     {
                        _loc2_.zoneArray[_loc3_].mc._y = _loc2_.zoneArray[_loc3_].mc._y + _loc6_;
                     }
                     _loc3_ = _loc3_ + 1;
                  }
               }
               _loc5_ = _loc5_ + 1;
            }
         }
         if(questIsStoried == 1)
         {
            storyScrollBar.pageSize = calculateContentHeight(1);
         }
         else if(questIsStoried == 0)
         {
            scrollBar.pageSize = calculateContentHeight();
         }
         else if(questIsStoried == 2 || questIsStoried == 4)
         {
            guildScrollBar.pageSize = calculateContentHeight(2);
         }
         else if(questIsStoried == 3)
         {
            reputatiobscrollBar.pageSize = calculateContentHeight(3);
         }
      };
      questManager(order,_loc2_,questId,questNumber,questName,questType,questIsStoried,questIsFailed,repeatCurNum,repeatTotalNum,questLevel,goodLevel,bEnableGiveUp,bNotAccept,bQuestComplete,bCantProgress,bPartyQuest,markerType,toggleType);
      cnt++;
   }
   if(questIsStoried == 1)
   {
      storyScrollBar.pageSize = calculateContentHeight(1);
   }
   else if(questIsStoried == 0)
   {
      scrollBar.pageSize = calculateContentHeight();
   }
   else if(questIsStoried == 2 || questIsStoried == 4)
   {
      guildScrollBar.pageSize = calculateContentHeight(2);
   }
   else if(questIsStoried == 3)
   {
      reputatiobscrollBar.pageSize = calculateContentHeight(3);
   }
   if(questIsStoried == 1)
   {
      refreshZoneHeight(1);
   }
   else if(questIsStoried == 0)
   {
      refreshZoneHeight();
   }
   else if(questIsStoried == 2 || questIsStoried == 4)
   {
      refreshZoneHeight(2);
   }
   else if(questIsStoried == 3)
   {
      refreshZoneHeight(3);
   }
}
function questManager(order, zone, questId, questNumber, questName, questType, questIsStoried, questIsFailed, repeatCurNum, repeatTotalNum, questLevel, goodLevel, bEnableGiveUp, bNotAccept, bQuestComplete, bCantProgress, bPartyQuest, markerType, toggleType)
{
   var _loc35_ = zone.mc;
   questIsStoried = Number(questIsStoried);
   var _loc19_ = undefined;
   var _loc13_ = undefined;
   if(questIsStoried == 1)
   {
      _loc19_ = getQuest(questId,1);
      _loc13_ = storyQuest_array;
      zoneArr = storyZone_array;
   }
   else if(questIsStoried == 0)
   {
      _loc19_ = getQuest(questId);
      _loc13_ = quest_array;
      zoneArr = zone_array;
   }
   else if(questIsStoried == 2 || questIsStoried == 4)
   {
      _loc19_ = getQuest(questId,2);
      _loc13_ = guildQuest_array;
      zoneArr = guildZone_array;
   }
   else if(questIsStoried == 3)
   {
      _loc19_ = getQuest(questId,3);
      _loc13_ = reputationQuest_array;
      zoneArr = reputationZone_array;
   }
   if(_loc19_)
   {
      if(order == "remove")
      {
         var _loc9_ = null;
         var _loc8_ = 0;
         while(_loc8_ < _loc13_.length)
         {
            if(_loc13_[_loc8_].id == questId)
            {
               var _loc7_ = null;
               if(zone.opened == true)
               {
                  var _loc6_ = 0;
                  while(_loc6_ < zoneArr.length)
                  {
                     if(zoneArr[_loc6_].id == zone.id)
                     {
                        _loc7_ = _loc6_;
                        var _loc4_ = 0;
                        while(_loc4_ < zoneArr.length)
                        {
                           if(_loc4_ > _loc7_)
                           {
                              zoneArr[_loc4_].mc._y = zoneArr[_loc4_].mc._y - 30;
                           }
                           _loc4_ = _loc4_ + 1;
                        }
                     }
                     _loc6_ = _loc6_ + 1;
                  }
               }
               var _loc12_ = zone.questArray.length;
               var _loc10_ = null;
               _loc4_ = 0;
               while(_loc4_ < _loc12_)
               {
                  if(zone.questArray[_loc4_].id == questId)
                  {
                     _loc10_ = _loc4_;
                     break;
                  }
                  _loc4_ = _loc4_ + 1;
               }
               zone.questArray.splice(_loc10_,1);
               removeQuest = _loc13_.splice(_loc8_,1);
               removeMovieClip(removeQuest[0].mc);
               zone.questNum = zone.questNum - 1;
               if(zone.questNum <= 0)
               {
                  _loc6_ = 0;
                  while(_loc6_ < zoneArr.length)
                  {
                     if(zoneArr[_loc6_].id == zone.id)
                     {
                        _loc9_ = _loc6_;
                        _loc4_ = 0;
                        while(_loc4_ < zoneArr.length)
                        {
                           if(_loc4_ > _loc9_)
                           {
                              zoneArr[_loc4_].mc._y = zoneArr[_loc4_].mc._y - 30;
                           }
                           _loc4_ = _loc4_ + 1;
                        }
                        removeZone = zoneArr.splice(_loc6_,1);
                        removeMovieClip(removeZone[0].mc);
                     }
                     _loc6_ = _loc6_ + 1;
                  }
               }
            }
            _loc8_ = _loc8_ + 1;
         }
         zone.questArray.sortOn(["questNumber"],Array.NUMERIC);
         _loc8_ = 0;
         while(_loc8_ < zone.questArray.length)
         {
            zone.questArray[_loc8_].mc._y = _loc8_ * 30;
            _loc8_ = _loc8_ + 1;
         }
      }
      else
      {
         myListener.OnGame_QuestJournal_UpdateQuest(questId + "\t" + questNumber + "\t" + questName + "\t" + questType + "\t" + questIsStoried + "\t" + questIsFailed + "\t" + repeatCurNum + "\t" + repeatTotalNum + "\t" + questLevel + "\t" + goodLevel + "\t" + bEnableGiveUp + "\t" + bNotAccept + "\t" + bQuestComplete + "\t" + bCantProgress + "\t" + bPartyQuest + "\t" + markerType);
      }
   }
   else
   {
      if(order == "add")
      {
         var mc;
         var mc = _loc35_.quest_mc.attachMovie("depth2","quest" + questId,cnt2);
         mc.name_txt.textColor = lib.info.TextColor.GENERAL_CONTENTS;
         var _loc15_ = new Object();
         zone.questArray.push(_loc15_);
         if(bNotAccept == 1)
         {
            mc.questAlimBtn._visible = false;
         }
         if(isNaN(bPartyQuest))
         {
            bPartyQuest = 1;
         }
         if(bPartyQuest >= 2)
         {
            mc.partyNum_mc._visible = true;
            mc.partyNum_mc._alpha = 100;
            mc.partyNum_mc.gotoAndStop(bPartyQuest);
            lib.manager.ToolTip.add(mc.partyNum_mc,lib.util.UIString.getUIString("$101086","PersonNum",bPartyQuest),1);
         }
         else if(bPartyQuest == 0)
         {
            mc.partyNum_mc._visible = true;
            mc.partyNum_mc._alpha = 100;
            mc.partyNum_mc.gotoAndStop(1);
            lib.manager.ToolTip.add(mc.partyNum_mc,"$102192",1);
         }
         else
         {
            mc.partyNum_mc._visible = false;
         }
         mc.name_txt._x = !mc.partyNum_mc._visible?67:90;
         mc.name_txt._width = !mc.partyNum_mc._visible?303:280;
         mc.bEnableGiveUp = bEnableGiveUp;
         mc.removeQuestBtn._visible = bEnableGiveUp;
         mc.o = _loc15_;
         mc.id = questId;
         _loc15_.id = questId;
         _loc15_.zone = zone;
         _loc15_.mc = mc;
         mc.questType = questIsStoried;
         checkZoneGiveUp(zone);
         if(questNumber == "")
         {
            questNumber = zone.questArray.length + 1;
         }
         _loc15_.questNumber = Number(questNumber);
         if(questIsStoried == 1)
         {
            storyQuest_array.push(_loc15_);
         }
         else if(questIsStoried == 0)
         {
            quest_array.push(_loc15_);
         }
         else if(questIsStoried == 2 || questIsStoried == 4)
         {
            guildQuest_array.push(_loc15_);
         }
         else if(questIsStoried == 3)
         {
            reputationQuest_array.push(_loc15_);
         }
         zone.questNum = zone.questNum + 1;
         cnt2++;
         zone.questArray.sortOn(["questNumber"],Array.NUMERIC);
         _loc8_ = 0;
         while(_loc8_ < zone.questArray.length)
         {
            zone.questArray[_loc8_].mc._y = _loc8_ * 30;
            _loc8_ = _loc8_ + 1;
         }
         mc.hit.onRollOver = function()
         {
            var _loc2_ = undefined;
            if(tab.activedNum == 1)
            {
               _loc2_ = clickQuest;
            }
            else if(tab.activedNum == 0)
            {
               _loc2_ = clickQuest2;
            }
            else if(tab.activedNum == 2)
            {
               _loc2_ = clickQuest3;
            }
            else if(tab.activedNum == 3)
            {
               _loc2_ = clickQuest4;
            }
            if(this._parent.o.id != _loc2_)
            {
               this._parent.effect_mc.gotoAndStop("over");
            }
         };
         mc.hit.onRollOut = mc.hit.onReleaseOutside = function()
         {
            var _loc2_ = undefined;
            if(tab.activedNum == 1)
            {
               _loc2_ = clickQuest;
            }
            else if(tab.activedNum == 0)
            {
               _loc2_ = clickQuest2;
            }
            else if(tab.activedNum == 2)
            {
               _loc2_ = clickQuest3;
            }
            else if(tab.activedNum == 3)
            {
               _loc2_ = clickQuest4;
            }
            if(this._parent.o.id != _loc2_)
            {
               this._parent.effect_mc.gotoAndStop("out");
            }
         };
         mc.hit.onRelease = function()
         {
            lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
            if(_global.control)
            {
               _root.ToGame_CTRLMouseDown("QuestJournal",this._parent.o.id);
            }
            else if(tab.activedNum == 1)
            {
               container_mc.contents_mc.content_mc["zone" + clickZone].quest_mc["quest" + clickQuest].effect_mc.gotoAndStop(1);
               clickZone = this._parent.o.zone.id;
               curQuestId = clickQuest = this._parent.o.id;
               if(this._parent.bEnableGiveUp == 1)
               {
                  giveUp_btn.setEnabled(true);
               }
               else
               {
                  giveUp_btn.setEnabled(false);
               }
               ToGame_QuestJournal_RequestSetDetailInfo(clickQuest);
               this._parent.effect_mc.gotoAndStop("active");
            }
            else if(tab.activedNum == 0)
            {
               container_mc.storyContents_mc.content_mc["zone" + clickZone2].quest_mc["quest" + clickQuest2].effect_mc.gotoAndStop(1);
               clickZone2 = this._parent.o.zone.id;
               curQuestId = clickQuest2 = this._parent.o.id;
               if(this._parent.bEnableGiveUp == 1)
               {
                  giveUp_btn.setEnabled(true);
               }
               else
               {
                  giveUp_btn.setEnabled(false);
               }
               ToGame_QuestJournal_RequestSetDetailInfo(clickQuest2);
               this._parent.effect_mc.gotoAndStop("active");
            }
            else if(tab.activedNum == 2)
            {
               container_mc.guildContents_mc.content_mc["zone" + clickZone3].quest_mc["quest" + clickQuest3].effect_mc.gotoAndStop(1);
               clickZone3 = this._parent.o.zone.id;
               curQuestId = clickQuest3 = this._parent.o.id;
               if(this._parent.bEnableGiveUp == 1)
               {
                  giveUp_btn.setEnabled(true);
               }
               else
               {
                  giveUp_btn.setEnabled(false);
               }
               ToGame_QuestJournal_RequestSetDetailInfo(clickQuest3);
               this._parent.effect_mc.gotoAndStop("active");
            }
            else if(tab.activedNum == 3)
            {
               container_mc.reputation_mc.content_mc["zone" + clickZone4].quest_mc["quest" + clickQuest4].effect_mc.gotoAndStop(1);
               clickZone4 = this._parent.o.zone.id;
               curQuestId = clickQuest4 = this._parent.o.id;
               if(this._parent.bEnableGiveUp == 1)
               {
                  giveUp_btn.setEnabled(true);
               }
               else
               {
                  giveUp_btn.setEnabled(false);
               }
               ToGame_QuestJournal_RequestSetDetailInfo(clickQuest4);
               this._parent.effect_mc.gotoAndStop("active");
            }
         };
         lib.manager.ToolTip.add(mc.removeQuestBtn,lib.util.UIString.getUIString("$091033"),1);
         mc.removeQuestBtn.depth = 2;
         mc.removeQuestBtn.onRollOver = function()
         {
            this.gotoAndStop(2);
         };
         mc.removeQuestBtn.onRollOut = mc.removeQuestBtn.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
         };
         mc.removeQuestBtn.onPress = function()
         {
            this.gotoAndStop(3);
            lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         };
         mc.removeQuestBtn.onRelease = function()
         {
            this.gotoAndStop(2);
            giveUp(this._parent);
         };
         mc.questAlimBtn.onRollOver = function()
         {
            this.mc.gotoAndStop(2);
         };
         mc.questAlimBtn.onRollOut = mc.questAlimBtn.onReleaseOutside = function()
         {
            this.mc.gotoAndStop(1);
         };
         mc.questAlimBtn.onPress = function()
         {
            this.mc.gotoAndStop(3);
            lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         };
         mc.questAlimBtn.onRelease = function()
         {
            this.mc.gotoAndStop(2);
            if(this._currentframe == 1)
            {
               this.gotoAndStop(2);
            }
            else
            {
               this.gotoAndStop(1);
            }
            ToGame_QuestJournal_ToggleTaskInfo(this._parent.o.id,this._currentframe - 1,0,this._parent.questType);
            if(this._currentframe == 1)
            {
               lib.manager.ToolTip.add(this,lib.util.UIString.getUIString("$091031"),1);
            }
            else
            {
               lib.manager.ToolTip.add(this,lib.util.UIString.getUIString("$091032"),1);
            }
         };
         if(toggleType == "1")
         {
            mc.questAlimBtn.gotoAndStop(2);
            lib.manager.ToolTip.add(mc.questAlimBtn,lib.util.UIString.getUIString("$091032"),1);
         }
         else
         {
            mc.questAlimBtn.gotoAndStop(1);
            lib.manager.ToolTip.add(mc.questAlimBtn,lib.util.UIString.getUIString("$091031"),1);
         }
         mc.radio_btn.onChanged = function(checked)
         {
         };
         mc.questName = questName;
         var _loc16_ = "";
         if(mc.name_txt.text != "" || mc.name_txt.text != null || mc.name_txt.text != undefined)
         {
            _loc16_ = _loc16_ + mc.name_txt.text;
         }
         if(questIsFailed == 1)
         {
            _loc16_ = _loc16_ + STR_FAIL;
         }
         else if(questType != 0)
         {
            if(questType == 1)
            {
               if(repeatTotalNum != -1)
               {
                  _loc16_ = _loc16_ + (" &lt; " + repeatCurNum + "/" + repeatTotalNum + " &gt;");
               }
               else
               {
                  _loc16_ = _loc16_ + (" &lt; " + repeatCurNum + "/" + STR_INFINITY + " &gt;");
               }
            }
            else if(questType == 2)
            {
               _loc16_ = _loc16_ + STR_TIMELIMIT;
            }
            else if(questType == 3)
            {
               if(repeatTotalNum != -1)
               {
                  _loc16_ = _loc16_ + (" &lt; " + repeatCurNum + "/" + repeatTotalNum + " &gt;" + STR_TIMELIMIT);
               }
               else
               {
                  _loc16_ = _loc16_ + (" &lt; " + repeatCurNum + "/" + STR_INFINITY + " &gt;" + STR_TIMELIMIT);
               }
            }
         }
      }
      var _loc29_ = lib.util.UIString.getUIString("$091028");
      mc.complete_txt.htmlText = _loc29_;
      mc.complete_txt._visible = bQuestComplete == 1;
      if(mc.complete_txt.length > 5 && mc.complete_txt._visible)
      {
         mc.complete_txt._visible = false;
         questType = 2;
         markerType = 4;
         questIsStoried = 0;
      }
      var _loc36_ = mc.complete_txt.textWidth + 5;
      mc.complete_txt._width = _loc36_;
      lib.util.DrawBitmap.clear(mc.marker_mc);
      if(mc.complete_txt._visible == false && markerType > 0)
      {
         var _loc27_ = questType;
         if(questType > 1)
         {
            _loc27_ = questType - 2;
         }
         var _loc31_ = markerType != 2?"marker_" + markerType + "_" + questIsStoried + "_" + _loc27_:"marker_" + markerType + "_" + questIsStoried;
         var _loc37_ = flash.display.BitmapData.loadBitmap(_loc31_);
         mc.marker_mc.attachBitmap(_loc37_,1);
         mc.marker_mc._width = mc.marker_mc._height = 30;
      }
      if(goodLevel > 0)
      {
         mc.levelMc.txt.text = goodLevel;
      }
      var _loc24_ = "";
      if(bCantProgress == 1)
      {
         _loc24_ = lib.util.UIString.getUIString("$091030");
      }
      _loc24_ = _loc24_ + questName;
      lib.util.ExtString.textCut(mc.name_txt,_loc24_ + _loc16_,1);
      if(questIsFailed == 1)
      {
         mc.name_txt.setNewTextFormat(tf1);
      }
      else if(bQuestComplete == 1)
      {
         mc.name_txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL0;
      }
      else if(questLevel < 2)
      {
         mc.name_txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL1;
         mc.levelMc.txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL1;
      }
      else if(questLevel == 2)
      {
         mc.name_txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL2;
         mc.levelMc.txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL2;
      }
      else if(questLevel == 3)
      {
         mc.name_txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL3;
         mc.levelMc.txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL3;
      }
      else
      {
         mc.name_txt.textColor = lib.info.TextColor["UI_QUESTJOURNAL_LEVEL" + random(4)];
      }
   }
   if(questIsStoried == 1)
   {
      storyScrollBar.pageSize = calculateContentHeight(1);
   }
   else if(questIsStoried == 0)
   {
      scrollBar.pageSize = calculateContentHeight();
   }
   else if(questIsStoried == 2 || questIsStoried == 4)
   {
      guildScrollBar.pageSize = calculateContentHeight(2);
   }
   else if(questIsStoried == 3)
   {
      reputationScrollBar.pageSize = calculateContentHeight(3);
   }
}
function updateQuestData(updateQuestData)
{
   var _loc2_ = undefined;
   var _loc1_ = 0;
   while(_loc1_ < saveQuestData.length)
   {
      _loc2_ = saveQuestData[_loc1_];
      if(_loc2_[2] == updateQuestData[0])
      {
         break;
      }
      _loc2_ = null;
      _loc1_ = _loc1_ + 1;
   }
   if(_loc2_)
   {
      var _loc3_ = 2;
      _loc1_ = 3;
      while(_loc1_ < _loc2_.length)
      {
         if(_loc1_ == 12 || _loc1_ == 17)
         {
            _loc3_ = _loc3_ + 1;
         }
         else
         {
            _loc2_[_loc1_] = updateQuestData[_loc1_ - _loc3_];
         }
         _loc1_ = _loc1_ + 1;
      }
   }
}
function ListClear()
{
   clearDialog();
   zone_array = [];
   quest_array = [];
   storyZone_array = [];
   storyQuest_array = [];
   guildZone_array = [];
   guildQuest_array = [];
   reputationZone_array = [];
   reputationQuest_array = [];
   clickZone = null;
   clickZone2 = null;
   clickZone3 = null;
   clickZone4 = null;
   clickQuest = null;
   clickQuest2 = null;
   clickQuest3 = null;
   clickQuest4 = null;
   curQuestId = null;
   giveUp_btn.setEnabled(false);
   share_btn.setEnabled(false);
   var _loc1_ = container_mc.contents_mc.content_mc._name;
   var _loc2_ = container_mc.contents_mc.content_mc.getDepth();
   container_mc.contents_mc.createEmptyMovieClip(_loc1_,_loc2_);
   _loc1_ = container_mc.storyContents_mc.content_mc._name;
   _loc2_ = container_mc.storyContents_mc.content_mc.getDepth();
   container_mc.storyContents_mc.createEmptyMovieClip(_loc1_,_loc2_);
   _loc1_ = container_mc.guildContents_mc.content_mc._name;
   _loc2_ = container_mc.guildContents_mc.content_mc.getDepth();
   container_mc.guildContents_mc.createEmptyMovieClip(_loc1_,_loc2_);
   _loc1_ = container_mc.reputation_mc.content_mc._name;
   _loc2_ = container_mc.reputation_mc.content_mc.getDepth();
   container_mc.reputation_mc.createEmptyMovieClip(_loc1_,_loc2_);
   container_mc.contents_mc.defaultStr._visible = true;
   container_mc.storyContents_mc.defaultStr._visible = true;
   container_mc.guildContents_mc.defaultStr._visible = true;
   container_mc.reputation_mc.defaultStr._visible = true;
   scrollBar.pageSize = 0;
   scrollBar2.pageSize = 0;
   storyScrollBar.pageSize = 0;
   dialogScrollBar.pageSize = 0;
   dialogScrollBar.scroll = 0;
   guildScrollBar.pageSize = 0;
   reputationScrollBar.pageSize = 0;
}
function toggleEventSave(mc, type)
{
   lib.Debuger.trace("아이디 : " + mc.id);
   var _loc1_ = SearchQuestInfo(mc.id);
   lib.Debuger.trace("아이디 : " + _loc1_);
   _loc1_[20] = type;
}
function clearDialog()
{
   var _loc1_ = 0;
   while(_loc1_ < aimMovieClip_array.length)
   {
      var _loc2_ = aimMovieClip_array[_loc1_];
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   aimMovieClip_array = [];
   dialog.noAccepted_txt._visible = false;
   dialog.questInfo_txt._visible = false;
   dialog.aimContainer.title_txt._visible = false;
   dialog.questCompleteMc._visible = false;
   container_mc.darkBgMc._visible = false;
   dialog.stepMc._visible = false;
   dialog.groupMc._visible = false;
   dialog.groupMc.txt.text = "";
   dialog.questName_txt.text = "";
   dialog.aimContainer._visible = false;
   dialog.aimContainer.txt.text = "";
   dialog.aimContainer._y = 0;
   dialog.aimContainer.txt2.text = "";
   dialog.slots_mc._y = 0;
   dialog.slots2_mc._y = 0;
   dialog.slots3_mc._y = 0;
   dialog.slots4_mc._y = 0;
   dialog.dialog_txt.text = "";
   dialogScrollBar.pageSize = 0;
   dialogScrollBar.scroll = 0;
   dialog.npcName_txt.text = "";
   dialog.nameBg_mc._visible = false;
   baseRequitalItemList.clear();
   repeatRequitalItemList.clear();
   selectRequitalItemList.clear();
   AddRequitalItemDataList.clear();
   baseRequitalItemList.gold = 0;
   repeatRequitalItemList.gold = 0;
   selectRequitalItemList.gold = 0;
   AddRequitalItemDataList.gold = 0;
   for(mc in dialog)
   {
      if(typeof dialog[mc] == "movieclip")
      {
         if(dialog[mc]._name != "slots_mc" && dialog[mc]._name != "slots2_mc" && dialog[mc]._name != "slots3_mc" && dialog[mc]._name != "slots4_mc" && dialog[mc]._name != "aimContainer")
         {
            dialog[mc].removeMovieClip();
         }
      }
   }
   baseRequitalItemList.selectedSlot = null;
   repeatRequitalItemList.selectedSlot = null;
   container_mc.numberSteper.setPage(1,1);
}
function getQuestTask(id)
{
   for(mc in dialog.aimContainer)
   {
      var _loc1_ = dialog.aimContainer[mc];
      if(typeof _loc1_ == "movieclip" && _loc1_.id == id)
      {
         return _loc1_;
      }
   }
   return null;
}
function ToGame_QuestJournal_ToggleTaskInfo(questId, toggle, bZone, questState)
{
   getURL("FSCommand:ToGame_QuestJournal_ToggleTaskInfo",questId + "\t" + toggle + "\t" + questState + "\t" + bZone);
}
function ToGame_QuestJournal_RequestSetDetailInfo(questId)
{
   getURL("FSCommand:ToGame_QuestJournal_RequestSetDetailInfo",questId);
}
function ToGame_QuestJournal_GiveUp(questId)
{
   getURL("FSCommand:ToGame_QuestJournal_GiveUp",questId);
}
function ToGame_QuestJournal_CloseUI()
{
   fscommand("ToGame_QuestJournal_CloseUI");
}
function ToGame_QuestJournal_SelectBtn(btnId)
{
   getURL("FSCommand:ToGame_QuestJournal_SelectBtn",btnId);
}
function ToGame_QuestJournal_RequestSetPage(num)
{
   getURL("FSCommand:ToGame_QuestJournal_RequestSetPage",num);
}
function ToGame_QuestJournal_ShareQuest(questId)
{
   getURL("FSCommand:ToGame_QuestJournal_ShareQuest",questId);
}
function ToGame_QuestJournal_RequestSetCompleteQuest(stat)
{
   getURL("FSCommand:ToGame_QuestJournal_RequestSetCompleteQuest",stat);
}
function ToGame_QuestJournal_ClickLink(id)
{
   getURL("FSCommand:ToGame_QuestJournal_ClickLink",id);
}
function ToGame_QuestJournal_SelectTab(stat)
{
   getURL("FSCommand:ToGame_QuestJournal_SelectTab",stat);
}
function ToGame_QuestJournal_SelectReputation()
{
   fscommand("ToGame_QuestJournal_SelectReputation");
}
function ToGame_RewardItem_RequestPreview(id)
{
   getURL("FSCommand:ToGame_RewardItem_RequestPreview",id);
}
function ToGame_QuestJournal_BackUpItem()
{
   var _loc1_ = curQuestId;
   if(_loc1_ == undefined || _loc1_ == null)
   {
      return undefined;
   }
   lib.Debuger.trace("ToGame_QuestJournal_BackUpItem : " + _loc1_);
   getURL("FSCommand:ToGame_QuestJournal_BackUpItem",_loc1_);
}
function giveUp(targetQuestMc)
{
   if(targetQuestMc == undefined)
   {
      if(tab.activedNum == 1)
      {
         ToGame_QuestJournal_GiveUp(clickQuest);
      }
      else if(tab.activedNum == 0)
      {
         ToGame_QuestJournal_GiveUp(clickQuest2);
      }
      else if(tab.activedNum == 2)
      {
         ToGame_QuestJournal_GiveUp(clickQuest3);
      }
      else if(tab.activedNum == 3)
      {
         ToGame_QuestJournal_GiveUp(clickQuest4);
      }
      return undefined;
   }
   var _loc6_ = targetQuestMc.opened == undefined?false:true;
   if(_loc6_)
   {
      var _loc3_ = targetQuestMc.o.questArray;
      var _loc4_ = "";
      var _loc1_ = 0;
      while(_loc1_ < _loc3_.length)
      {
         var _loc2_ = _loc3_[_loc1_].mc;
         if(_loc2_.removeQuestBtn._visible)
         {
            _loc4_ = _loc4_ + (_loc2_.id + "\t");
         }
         _loc1_ = _loc1_ + 1;
      }
      ToGame_QuestJournal_GiveUp(_loc4_);
   }
   else if(targetQuestMc.removeQuestBtn._visible)
   {
      ToGame_QuestJournal_GiveUp(targetQuestMc.id);
   }
}
function share()
{
   if(tab.activedNum == 1)
   {
      ToGame_QuestJournal_ShareQuest(clickQuest);
   }
   else if(tab.activedNum == 0)
   {
      ToGame_QuestJournal_ShareQuest(clickQuest2);
   }
   else if(tab.activedNum == 2)
   {
      ToGame_QuestJournal_ShareQuest(clickQuest3);
   }
   else if(tab.activedNum == 3)
   {
      ToGame_QuestJournal_ShareQuest(clickQuest4);
   }
}
function closeUI()
{
   ToGame_QuestJournal_CloseUI();
}
function reputation_set()
{
   ToGame_QuestJournal_SelectReputation();
}
function release(num, dontAutoSelect)
{
   ToGame_QuestJournal_SelectTab(num);
   showTabContainer(num);
   if(num == 0)
   {
      container_mc.questNum_txt._visible = false;
      container_mc.pastQuest_txt._visible = true;
      container_mc.pastQuest_btn._visible = true;
      container_mc.reputation_txt.text = "";
      share_btn.setVisible(false);
      container_mc.txtBtn1._x = 155;
   }
   else if(num == 1)
   {
      container_mc.questNum_txt._visible = true;
      container_mc.pastQuest_txt._visible = false;
      container_mc.pastQuest_btn._visible = false;
      container_mc.reputation_txt.text = "";
      share_btn.setVisible(true);
      container_mc.txtBtn1._x = 244.7;
   }
   else if(num == 2)
   {
      container_mc.questNum_txt._visible = false;
      container_mc.pastQuest_txt._visible = false;
      container_mc.pastQuest_btn._visible = false;
      container_mc.reputation_txt.htmlText = guildGuidest;
      share_btn.setVisible(true);
      container_mc.txtBtn1._x = 244.7;
   }
   else if(num == 3)
   {
      container_mc.questNum_txt._visible = false;
      container_mc.pastQuest_txt._visible = false;
      container_mc.pastQuest_btn._visible = false;
      container_mc.reputation_txt.htmlText = reputationGuidest;
      share_btn.setVisible(true);
      container_mc.txtBtn1._x = 244.7;
   }
   if(dontAutoSelect != 1)
   {
      autoSelect();
   }
}
function showTabContainer(num)
{
   if(num == 1)
   {
      container_mc.contents_mc._visible = true;
      container_mc.storyContents_mc._visible = false;
      container_mc.guildContents_mc._visible = false;
      container_mc.reputation_mc._visible = false;
   }
   else if(num == 0)
   {
      container_mc.contents_mc._visible = false;
      container_mc.storyContents_mc._visible = true;
      container_mc.guildContents_mc._visible = false;
      container_mc.reputation_mc._visible = false;
   }
   else if(num == 2)
   {
      container_mc.contents_mc._visible = false;
      container_mc.storyContents_mc._visible = false;
      container_mc.guildContents_mc._visible = true;
      container_mc.reputation_mc._visible = false;
   }
   else if(num == 3)
   {
      container_mc.contents_mc._visible = false;
      container_mc.storyContents_mc._visible = false;
      container_mc.guildContents_mc._visible = false;
      container_mc.reputation_mc._visible = true;
   }
}
function checkZoneGiveUp(zoneObject)
{
   var _loc4_ = false;
   var _loc3_ = zoneObject.questArray;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      var _loc2_ = _loc3_[_loc1_].mc;
      if(_loc2_.bEnableGiveUp)
      {
         _loc4_ = true;
      }
      _loc1_ = _loc1_ + 1;
   }
   zoneObject.mc.removeQuestBtn._visible = _loc4_;
   return _loc4_;
}
function preViewEvent(_targetMc)
{
   var _loc2_ = _targetMc.SLOT;
   _loc2_.onRollOver = function()
   {
      myListener.OnGame_MouseDown = function(button)
      {
         if(button == 2 && _global.control)
         {
            var _loc3_ = "";
            var _loc2_ = _targetMc.img.split("__");
            if(_loc2_.length > 1)
            {
               _loc3_ = _loc2_[1];
            }
            ToGame_RewardItem_RequestPreview(_loc3_);
         }
      };
   };
   _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
   {
      myListener.OnGame_MouseDown = null;
   };
}
function SetMultiply(_targetMc, _num)
{
   if(_num > 1)
   {
      _targetMc._visible = true;
      _targetMc.txt.textAutoSize = "shrink";
      _targetMc.txt.htmlText = "<img src=\'multIcon\' vspace=\'-2\'>" + _num;
   }
   else
   {
      _targetMc._visible = false;
   }
}
if(questCompleteFdW > 150)
{
   questCompleteFd._width = questCompleteFdW + 20;
   questCompleteMc.mc._x = 196 + (questCompleteFdW - 150);
}
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.storyContents_mc.defaultStr.textColor = lib.info.TextColor.GENERAL_DISABLE;
container_mc.contents_mc.defaultStr.textColor = lib.info.TextColor.GENERAL_DISABLE;
container_mc.guildContents_mc.defaultStr.textColor = lib.info.TextColor.GENERAL_DISABLE;
container_mc.reputation_mc.defaultStr.textColor = lib.info.TextColor.GENERAL_DISABLE;
container_mc.contents_mc._visible = false;
container_mc.storyContents_mc._visible = false;
container_mc.guildContents_mc._visible = false;
container_mc.reputation_mc._visible = false;
container_mc.contents_mc2.content_mc.link_mc._visible = false;
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var completeStr = lib.util.UIString.getUIString("$181018");
var questNumStr = lib.util.UIString.getUIString("$091004");
var levelStr = lib.util.UIString.getUIString("$091027");
var STR_STEP = lib.util.UIString.getUIString("$091008");
var STR_FAIL = lib.util.UIString.getUIString("$091009");
var STR_REPEAT = lib.util.UIString.getUIString("$091010");
var STR_TIMELIMIT = lib.util.UIString.getUIString("$091011");
var STR_REAPEATNTIME = lib.util.UIString.getUIString("$091012");
var STR_INFINITY = lib.util.UIString.getUIString("$091021");
container_mc.contents_mc.defaultStr.setText(lib.util.UIString.getUIString("$111039"));
container_mc.storyContents_mc.defaultStr.setText(lib.util.UIString.getUIString("$111039"));
container_mc.guildContents_mc.defaultStr.setText(lib.util.UIString.getUIString("$111039"));
container_mc.reputation_mc.defaultStr.setText(lib.util.UIString.getUIString("$111039"));
var reputationGuidest = "<img src=\'icon_notice\' vspace=\'-1\'> " + lib.util.UIString.getUIString("$091035");
var guildGuidest = lib.util.UIString.getUIString("$091044");
container_mc.reputation_mc.reputation_gage_mc.txt0.htmlText = lib.util.UIString.getUIString("$091036");
container_mc.reputation_mc.reputation_gage_mc.txt1.htmlText = "(<font color=\'#80e71c\'>0</font>/15)";
var clickZone = null;
var clickZone2 = null;
var clickZone3 = null;
var clickZone4 = null;
var clickQuest = null;
var clickQuest2 = null;
var clickQuest3 = null;
var clickQuest4 = null;
var curQuestId = null;
var zone_array = new Array();
var quest_array = new Array();
var storyZone_array = new Array();
var storyQuest_array = new Array();
var guildZone_array = new Array();
var guildQuest_array = new Array();
var reputationZone_array = new Array();
var reputationQuest_array = new Array();
var lowExpQuestColor = lib.info.TextColor.UI_QUESTINFO_NAME_LOWEXP;
var missionQuestColor = lib.info.TextColor.UI_QUESTINFO_NAME_MISSION;
var tf1 = new TextFormat();
tf1.color = lib.info.TextColor.TREEBTN_SECOND_FAILD;
var aimMovieClip_array = new Array();
var temp_Quest;
var temp_Quest2;
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var LISTROWS = 11;
var ROWSPACE = 0;
var lineHeight = 30;
var contentsHeight = container_mc.contents_mc.mask_mc._height;
var scrollBar = container_mc.contents_mc.scrollbar;
var listObj = {};
scrollBar.addListener(listObj);
listObj.onScroll = function()
{
   container_mc.contents_mc.content_mc._y = - arguments[0];
};
scrollBar.setWheel(container_mc.contents_mc.content_mc);
scrollBar.wheelDelta = 1;
scrollBar.pageSize = 0;
scrollBar.displaySize = contentsHeight - 50;
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.rowHeight = lineHeight + ROWSPACE;
scrollBar.scroll = 0;
var storyQuestList = container_mc.storyContents_mc.content_mc;
var LISTROWS3 = 11;
var ROWSPACE3 = 0;
var lineHeight3 = 30;
var contentsHeight3 = container_mc.contents_mc.mask_mc._height;
storyScrollBar = container_mc.storyContents_mc.scrollbar;
var listObj3 = {};
storyScrollBar.addListener(listObj3);
listObj3.onScroll = function()
{
   storyQuestList._y = - arguments[0];
};
storyScrollBar.setWheel(storyQuestList);
storyScrollBar.wheelDelta = 1;
storyScrollBar.pageSize = 0;
storyScrollBar.displaySize = contentsHeight3 - 50;
storyScrollBar.defaultBarSizeRatio = 0.3333333333333333;
storyScrollBar.rowHeight = lineHeight3 + ROWSPACE3;
storyScrollBar.scroll = 0;
var guildQuestList = container_mc.guildContents_mc.content_mc;
var contentsHeight5 = container_mc.guildContents_mc.mask_mc._height;
var guildScrollBar = container_mc.guildContents_mc.scrollbar;
var listObj5 = {};
guildScrollBar.addListener(listObj5);
listObj5.onScroll = function()
{
   guildQuestList._y = - arguments[0];
};
guildScrollBar.setWheel(guildQuestList);
guildScrollBar.wheelDelta = 1;
guildScrollBar.pageSize = 0;
guildScrollBar.displaySize = contentsHeight - 50;
guildScrollBar.defaultBarSizeRatio = 0.3333333333333333;
guildScrollBar.rowHeight = lineHeight + ROWSPACE;
guildScrollBar.scroll = 0;
var ROWSPACE4 = 0;
var lineHeight4 = 30;
var contentsHeight4 = container_mc.dialogContents_mc.mask_mc._height;
dialogScrollBar = container_mc.dialogContents_mc.scrollbar4;
var listObj4 = {};
dialogScrollBar.addListener(listObj4);
listObj4.onScroll = function()
{
   dialog._y = - arguments[0];
};
dialogScrollBar.setWheel(container_mc.dialogContents_mc);
dialogScrollBar.wheelDelta = 3;
dialogScrollBar.pageSize = 0;
dialogScrollBar.displaySize = contentsHeight4 - 50;
dialogScrollBar.defaultBarSizeRatio = 0.3333333333333333;
dialogScrollBar.rowHeight = lineHeight3 + ROWSPACE4;
dialogScrollBar.scroll = 0;
dialog.blet1_mc._visible = false;
dialog.blet2_mc._visible = false;
dialog.aimContainer._visible = false;
var LISTROWS6 = 11;
var ROWSPACE6 = 0;
var lineHeight6 = 30;
var contentsHeight6 = container_mc.reputation_mc.mask_mc._height;
var reputatiobscrollBar = container_mc.reputation_mc.scrollbar;
var listObj6 = {};
reputatiobscrollBar.addListener(listObj6);
listObj6.onScroll = function()
{
   container_mc.reputation_mc.content_mc._y = - arguments[0];
};
reputatiobscrollBar.setWheel(container_mc.reputation_mc.content_mc);
reputatiobscrollBar.wheelDelta = 1;
reputatiobscrollBar.pageSize = 0;
reputatiobscrollBar.displaySize = contentsHeight6 - 50;
reputatiobscrollBar.defaultBarSizeRatio = 0.3333333333333333;
reputatiobscrollBar.rowHeight = lineHeight6 + ROWSPACE6;
reputatiobscrollBar.scroll = 0;
var _CustomScaleEvent;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI.scaleExpander.scaleExpanderEventCheck(UI,UIname);
         UI._visible = true;
         autoSelect();
         ListCheck();
      }
      else
      {
         ListClear();
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
      ListCheck();
   }
   else
   {
      ListClear();
      UI._visible = false;
   }
};
var HEIGHT_ZONE = 30;
var HEIGHT_QUEST = 30;
var cnt = 0;
var cnt2 = 0;
var saveQuestCheck = [];
var saveQuestData = [];
var saveQeustObject = [];
var saveOuestLen = 0;
myListener.OnGame_QuestJournal_AddQuest = function(questData)
{
   var _loc1_ = questData.split("\t");
   if(_loc1_.length != 1)
   {
      var _loc2_ = Number(_loc1_[0]);
      var _loc3_ = Number(_loc1_[3]);
      if(saveQuestCheck[_loc2_] == undefined)
      {
         saveQuestCheck[_loc2_] = [];
      }
      if(saveQuestCheck[_loc2_][_loc3_] != "1")
      {
         saveQuestCheck[_loc2_][_loc3_] = "1";
         saveQuestData.push(_loc1_);
      }
      if(UI._visible)
      {
         zoneManager("add",_loc1_[0],_loc1_[1],_loc1_[2],Number(_loc1_[3]),_loc1_[4],Number(_loc1_[5]),Number(_loc1_[6]),Number(_loc1_[7]),Number(_loc1_[8]),Number(_loc1_[9]),Number(_loc1_[10]),Number(_loc1_[11]),Number(_loc1_[12]),Number(_loc1_[13]),Number(_loc1_[14]),Number(_loc1_[15]),Number(_loc1_[16]),Number(_loc1_[17]),Number(_loc1_[18]),Number(_loc1_[19]));
      }
   }
   saveOuestLen = saveQuestData.length;
};
myListener.OnGame_QuestJournal_UpdateQuest = function(questData)
{
   var _loc2_ = questData.split("\t");
   if(_loc2_.length != 1)
   {
      var _loc13_ = SearchQuestIndex(_loc2_[2]);
      updateQuestData(_loc2_);
      if(!UI._visible)
      {
         return undefined;
      }
      var _loc1_ = undefined;
      var _loc3_ = _loc2_[4];
      if(_loc3_ == 1)
      {
         _loc1_ = getQuest(_loc2_[0],1);
      }
      else if(_loc3_ == 2 || _loc3_ == 4)
      {
         _loc1_ = getQuest(_loc2_[0],2);
      }
      else if(_loc3_ == 3)
      {
         _loc1_ = getQuest(_loc2_[0],3);
      }
      else
      {
         _loc1_ = getQuest(_loc2_[0]);
      }
      if(_loc1_ != null)
      {
         _loc1_ = temp_Quest;
         _loc1_.mc.name_txt.text = "";
         var _loc5_ = "";
         if(_loc2_[5] != "1")
         {
            if(_loc2_[3] != "0")
            {
               if(_loc2_[3] == "1")
               {
                  if(_loc2_[7] != "-1")
                  {
                     _loc5_ = _loc5_ + (" &lt; " + _loc2_[6] + "/" + _loc2_[7] + " &gt;");
                  }
                  else
                  {
                     _loc5_ = _loc5_ + (" &lt; " + _loc2_[6] + "/" + STR_INFINITY + " &gt;");
                  }
               }
               else if(_loc2_[3] == "2")
               {
                  _loc5_ = _loc5_ + STR_TIMELIMIT;
               }
               else if(_loc2_[3] == "3")
               {
                  if(_loc2_[7] != "-1")
                  {
                     _loc5_ = _loc5_ + (" &lt; " + _loc2_[6] + "/" + _loc2_[7] + " &gt;" + STR_TIMELIMIT);
                  }
                  else
                  {
                     _loc5_ = _loc5_ + (" &lt; " + _loc2_[6] + "/" + STR_INFINITY + " &gt;" + STR_TIMELIMIT);
                  }
               }
            }
         }
         var _loc10_ = lib.util.UIString.getUIString("$091028");
         _loc1_.mc.complete_txt.htmlText = _loc10_;
         _loc1_.mc.complete_txt._visible = Number(_loc2_[12]) == 1;
         var _loc4_ = Number(_loc2_[15]);
         if(_loc1_.mc.complete_txt.length > 5 && _loc1_.mc.complete_txt._visible)
         {
            _loc1_.mc.complete_txt._visible = false;
            _loc3_ = 2;
            _loc4_ = 4;
            questIsStoried = 0;
         }
         if(mc.complete_txt._visible == false && _loc4_ > 0)
         {
            var _loc9_ = _loc3_;
            if(_loc3_ > 1)
            {
               _loc9_ = _loc3_ - 2;
            }
            var _loc11_ = _loc4_ != 2?"marker_" + _loc4_ + "_" + questIsStoried + "_" + _loc9_:"marker_" + _loc4_ + "_" + questIsStoried;
            var _loc12_ = flash.display.BitmapData.loadBitmap(_loc11_);
            mc.marker_mc.attachBitmap(_loc12_,1);
            mc.marker_mc._width = mc.marker_mc._height = 30;
         }
         if(_loc1_.mc.complete_txt._visible == false && _loc4_ > 0)
         {
            var _loc8_ = Number(_loc2_[3]);
            _loc9_ = _loc8_;
            if(_loc8_ > 1)
            {
               _loc9_ = _loc8_ - 2;
            }
            _loc11_ = _loc4_ != 2?"marker_" + _loc4_ + "_" + _loc3_ + "_" + _loc9_:"marker_" + _loc4_ + "_" + _loc3_;
            _loc12_ = flash.display.BitmapData.loadBitmap(_loc11_);
            _loc1_.mc.marker_mc.attachBitmap(_loc12_,1);
            _loc1_.mc.marker_mc._width = _loc1_.mc.marker_mc._height = 30;
         }
         else
         {
            lib.util.DrawBitmap.clear(_loc1_.mc.marker_mc);
         }
         if(Number(_loc2_[9]) > 0)
         {
            _loc1_.mc.levelMc.txt.text = _loc2_[9];
         }
         var _loc7_ = "";
         if(_loc2_[13] == "1")
         {
            _loc7_ = lib.util.UIString.getUIString("$091030");
         }
         _loc7_ = _loc7_ + _loc2_[2];
         lib.util.ExtString.textCut(_loc1_.mc.name_txt,_loc7_ + _loc5_,1);
         if(_loc2_[5] == "1")
         {
            _loc1_.mc.name_txt.setNewTextFormat(tf1);
         }
         else if(Number(_loc2_[12]) == 1)
         {
            _loc1_.mc.name_txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL0;
         }
         else if(_loc2_[8] == "0" || _loc2_[8] == "1")
         {
            _loc1_.mc.name_txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL1;
            _loc1_.mc.levelMc.txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL1;
         }
         else if(_loc2_[8] == "2")
         {
            _loc1_.mc.name_txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL2;
            _loc1_.mc.levelMc.txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL2;
         }
         else if(_loc2_[8] == "3")
         {
            _loc1_.mc.name_txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL3;
            _loc1_.mc.levelMc.txt.textColor = lib.info.TextColor.UI_QUESTJOURNAL_LEVEL3;
         }
         else
         {
            _loc1_.mc.name_txt.textColor = lib.info.TextColor["UI_QUESTJOURNAL_LEVEL" + random(4)];
         }
         _loc1_.mc.bEnableGiveUp = _loc2_[10];
         checkZoneGiveUp(_loc1_.zone);
         if(_loc2_[11] == "1")
         {
            _loc1_.mc.questAlimBtn._visible = false;
         }
         else
         {
            _loc1_.mc.questAlimBtn._visible = true;
         }
         var _loc6_ = Number(_loc2_[14]);
         if(isNaN(_loc6_))
         {
            _loc6_ = 0;
         }
         if(_loc6_ >= 2)
         {
            _loc1_.mc.partyNum_mc._visible = true;
            _loc1_.mc.partyNum_mc._alpha = 100;
            _loc1_.mc.partyNum_mc.gotoAndStop(_loc6_);
            lib.manager.ToolTip.add(_loc1_.mc.partyNum_mc,lib.util.UIString.getUIString("$101086","PersonNum",_loc6_),1);
         }
         else
         {
            _loc1_.mc.partyNum_mc._visible = false;
         }
         _loc1_.mc.name_txt._x = !_loc1_.mc.partyNum_mc._visible?67:90;
         _loc1_.mc.name_txt._width = !_loc1_.mc.partyNum_mc._visible?303:280;
      }
   }
};
myListener.OnGame_QuestJournal_RemoveQuest = function(questId)
{
   var _loc6_ = SearchQuestIndex(questId);
   var _loc2_ = SearchQuestInfo(questId);
   saveQuestCheck[Number(_loc2_[0])][Number(_loc2_[3])] = null;
   saveQuestData.splice(_loc6_,1);
   if(!UI._visible)
   {
      return undefined;
   }
   var _loc4_ = undefined;
   var _loc5_ = false;
   var _loc3_ = 0;
   if(getQuest(questId) != null)
   {
      _loc4_ = getQuest(questId).zone;
      _loc5_ = true;
   }
   else if(getQuest(questId,1) != null)
   {
      _loc4_ = getQuest(questId,1).zone;
      _loc5_ = true;
      _loc3_ = 1;
   }
   else if(getQuest(questId,2) != null)
   {
      _loc4_ = getQuest(questId,2).zone;
      _loc5_ = true;
      _loc3_ = 2;
   }
   else if(getQuest(questId,3) != null)
   {
      _loc4_ = getQuest(questId,3).zone;
      _loc5_ = true;
      _loc3_ = 3;
   }
   if(questId == curQuestId)
   {
      curQuestId = null;
   }
   if(questId == clickQuest)
   {
      clickQuest = null;
      if(tab.activedNum == 1)
      {
         giveUp_btn.setEnabled(false);
         share_btn.setEnabled(false);
      }
   }
   if(questId == clickQuest2)
   {
      clickQuest2 = null;
      if(tab.activedNum == 0)
      {
         giveUp_btn.setEnabled(false);
         share_btn.setEnabled(false);
      }
   }
   if(questId == clickQuest3)
   {
      clickQuest3 = null;
      if(tab.activedNum == 2)
      {
         giveUp_btn.setEnabled(false);
         share_btn.setEnabled(false);
      }
   }
   if(questId == clickQuest4)
   {
      clickQuest4 = null;
      if(tab.activedNum == 3)
      {
         giveUp_btn.setEnabled(false);
         share_btn.setEnabled(false);
      }
   }
   if(_loc3_ == 1)
   {
      zoneManager("remove",_loc4_.id,"이름은상관없음",questId,_loc2_[4],_loc2_[5],_loc2_[6],"1");
   }
   else if(_loc3_ == 2 || _loc3_ == 4)
   {
      zoneManager("remove",_loc4_.id,"이름은상관없음",questId,_loc2_[4],_loc2_[5],_loc2_[6],"2");
   }
   else if(_loc3_ == 3)
   {
      zoneManager("remove",_loc4_.id,"이름은상관없음",questId,_loc2_[4],_loc2_[5],_loc2_[6],"3");
   }
   else
   {
      zoneManager("remove",_loc4_.id,"이름은상관없음",questId,_loc2_[4],_loc2_[5],_loc2_[6],"0");
   }
   autoSelect();
};
myListener.OnGame_QuestJournal_Clear = function()
{
   ListClear();
   saveQuestCheck = [];
   saveQuestData = [];
   saveOuestLen = 0;
};
myListener.OnGame_QuestJournal_SelectQuest = function(questId, dontSelectTab)
{
   dontSelectTab = Number(dontSelectTab);
   var _loc3_ = false;
   var _loc1_ = getQuest(questId);
   if(_loc1_)
   {
      if(dontSelectTab != 1)
      {
         tab.setTab(1,1);
      }
      _loc1_.mc.hit.onRelease();
      _loc3_ = true;
   }
   if(!_loc3_)
   {
      _loc1_ = getQuest(questId,1);
      if(_loc1_)
      {
         if(dontSelectTab != 1)
         {
            tab.setTab(0,1);
         }
         _loc1_.mc.hit.onRelease();
      }
   }
   if(!_loc3_)
   {
      _loc1_ = getQuest(questId,2);
      if(_loc1_)
      {
         if(dontSelectTab != 1)
         {
            tab.setTab(2,1);
         }
         _loc1_.mc.hit.onRelease();
      }
   }
   if(!_loc3_)
   {
      _loc1_ = getQuest(questId,3);
      if(_loc1_)
      {
         if(dontSelectTab != 1)
         {
            tab.setTab(3,1);
         }
         _loc1_.mc.hit.onRelease();
      }
   }
};
myListener.OnGame_QuestJournal_SetTab = function(stat)
{
   tab.setTab(stat,1);
};
myListener.OnGame_QuestJournal_SetTotalQuestNum = function(currentQuestNum, totalQuestNum)
{
   container_mc.questNum_txt.text = questNumStr + " <" + currentQuestNum + "/" + totalQuestNum + ">";
};
myListener.OnGame_QuestJournal_SetTotalReputationQuestNum = function(currentQuestNum, totalQuestNum)
{
   container_mc.reputation_mc.reputation_gage_mc.txt1.htmlText = "(<font color=\'#80e71c\'>" + currentQuestNum + "</font>" + "/" + totalQuestNum + ")";
   container_mc.reputation_mc.reputation_gage_mc.gage_mask._width = currentQuestNum / totalQuestNum * 439;
};
myListener.OnGame_QuestJournal_SetToggleTaskInfo = function(questOrZone, toggle, tabState, toggleState, bZone)
{
   toggle = Number(toggle);
   tabState = Number(tabState);
   toggleState = Number(toggleState);
   bZone = Number(bZone);
   if(isNaN(bZone))
   {
      bZone = 0;
   }
   if(bZone)
   {
      var _loc8_ = getZone(questOrZone);
      if(_loc8_ != null)
      {
         var _loc9_ = _loc8_.mc._parent._parent;
         if(_loc9_ == container_mc.storyContents_mc && tabState == 1 || _loc9_ == container_mc.contents_mc && tabState == 0 || _loc9_ == container_mc.guildContents_mc && (tabState == 2 || tabState == 4) || _loc9_ == container_mc.reputation_mc && tabState == 3)
         {
            if(toggle == 0)
            {
               lib.manager.ToolTip.add(_loc8_.mc.questAlimBtn,lib.util.UIString.getUIString("$091031"),1);
            }
            else if(toggle == 1)
            {
               lib.manager.ToolTip.add(_loc8_.mc.questAlimBtn,lib.util.UIString.getUIString("$091032"),1);
            }
            if(toggleState)
            {
               _loc8_.mc.questAlimBtn._visible = toggle;
            }
         }
      }
      var _loc5_ = getZone(questOrZone,1);
      if(_loc5_ != null)
      {
         _loc9_ = _loc5_.mc._parent._parent;
         if(_loc9_ == container_mc.storyContents_mc && tabState == 1 || _loc9_ == container_mc.contents_mc && tabState == 0 || _loc9_ == container_mc.guildContents_mc && (tabState == 2 || tabState == 4) || _loc9_ == container_mc.reputation_mc && tabState == 3)
         {
            if(toggle == 0)
            {
               lib.manager.ToolTip.add(_loc5_.mc.questAlimBtn,lib.util.UIString.getUIString("$091031"),1);
            }
            else if(toggle == 1)
            {
               lib.manager.ToolTip.add(_loc5_.mc.questAlimBtn,lib.util.UIString.getUIString("$091032"),1);
            }
            if(toggleState)
            {
               _loc5_.mc.questAlimBtn._visible = toggle;
            }
            else
            {
               _loc5_.mc.questAlimBtn.gotoAndStop(toggle + 1);
               toggleEventSave(_loc5_.mc,toggle);
            }
         }
      }
      var _loc6_ = getZone(questOrZone,2);
      if(_loc6_ != null)
      {
         _loc9_ = _loc6_.mc._parent._parent;
         if(_loc9_ == container_mc.storyContents_mc && tabState == 1 || _loc9_ == container_mc.contents_mc && tabState == 0 || _loc9_ == container_mc.guildContents_mc && (tabState == 2 || tabState == 4) || _loc9_ == container_mc.reputation_mc && tabState == 3)
         {
            if(toggle == 0)
            {
               lib.manager.ToolTip.add(_loc6_.mc.questAlimBtn,lib.util.UIString.getUIString("$091031"),1);
            }
            else if(toggle == 1)
            {
               lib.manager.ToolTip.add(_loc6_.mc.questAlimBtn,lib.util.UIString.getUIString("$091032"),1);
            }
            if(toggleState)
            {
               _loc6_.mc.questAlimBtn._visible = toggle;
            }
            else
            {
               _loc6_.mc.questAlimBtn.gotoAndStop(toggle + 1);
               toggleEventSave(_loc6_.mc,toggle);
            }
         }
      }
      _loc6_ = getZone(questOrZone,3);
      if(_loc6_ != null)
      {
         _loc9_ = _loc6_.mc._parent._parent;
         if(_loc9_ == container_mc.storyContents_mc && tabState == 1 || _loc9_ == container_mc.contents_mc && tabState == 0 || _loc9_ == container_mc.guildContents_mc && (tabState == 2 || tabState == 4) || _loc9_ == container_mc.reputation_mc && tabState == 3)
         {
            if(toggle == 0)
            {
               lib.manager.ToolTip.add(_loc6_.mc.questAlimBtn,lib.util.UIString.getUIString("$091031"),1);
            }
            else if(toggle == 1)
            {
               lib.manager.ToolTip.add(_loc6_.mc.questAlimBtn,lib.util.UIString.getUIString("$091032"),1);
            }
            if(toggleState)
            {
               _loc6_.mc.questAlimBtn._visible = toggle;
            }
            else
            {
               _loc6_.mc.questAlimBtn.gotoAndStop(toggle + 1);
               toggleEventSave(_loc6_.mc,toggle);
            }
         }
      }
   }
   else
   {
      var _loc4_ = getQuest(questOrZone);
      if(_loc4_ != null)
      {
         _loc9_ = _loc4_.mc._parent._parent._parent._parent;
         if(_loc9_ == container_mc.storyContents_mc && tabState == 1 || _loc9_ == container_mc.contents_mc && tabState == 0 || _loc9_ == container_mc.guildContents_mc && (tabState == 2 || tabState == 4) || _loc9_ == container_mc.reputation_mc && tabState == 3)
         {
            if(toggle == 0)
            {
               lib.manager.ToolTip.add(_loc4_.mc.questAlimBtn,lib.util.UIString.getUIString("$091031"),1);
            }
            else if(toggle == 1)
            {
               lib.manager.ToolTip.add(_loc4_.mc.questAlimBtn,lib.util.UIString.getUIString("$091032"),1);
            }
            if(toggleState)
            {
               _loc4_.mc.questAlimBtn._visible = toggle;
            }
            else
            {
               _loc4_.mc.questAlimBtn.gotoAndStop(toggle + 1);
               toggleEventSave(_loc4_.mc,toggle);
            }
         }
      }
      _loc4_ = getQuest(questOrZone,1);
      if(_loc4_ != null)
      {
         _loc9_ = _loc4_.mc._parent._parent._parent._parent;
         if(_loc9_ == container_mc.storyContents_mc && tabState == 1 || _loc9_ == container_mc.contents_mc && tabState == 0 || _loc9_ == container_mc.guildContents_mc && (tabState == 2 || tabState == 4) || _loc9_ == container_mc.reputation_mc && tabState == 3)
         {
            if(toggle == 0)
            {
               lib.manager.ToolTip.add(_loc4_.mc.questAlimBtn,lib.util.UIString.getUIString("$091031"),1);
            }
            else if(toggle == 1)
            {
               lib.manager.ToolTip.add(_loc4_.mc.questAlimBtn,lib.util.UIString.getUIString("$091032"),1);
            }
            if(toggleState)
            {
               _loc4_.mc.questAlimBtn._visible = toggle;
            }
            _loc4_.mc.questAlimBtn.gotoAndStop(toggle + 1);
            toggleEventSave(_loc4_.mc,toggle);
         }
      }
      _loc4_ = getQuest(questOrZone,2);
      if(_loc4_ != null)
      {
         _loc9_ = _loc4_.mc._parent._parent._parent._parent;
         if(_loc9_ == container_mc.storyContents_mc && tabState == 1 || _loc9_ == container_mc.contents_mc && tabState == 0 || _loc9_ == container_mc.guildContents_mc && (tabState == 2 || tabState == 4) || _loc9_ == container_mc.reputation_mc && tabState == 3)
         {
            if(toggle == 0)
            {
               lib.manager.ToolTip.add(_loc4_.mc.questAlimBtn,lib.util.UIString.getUIString("$091031"),1);
            }
            else if(toggle == 1)
            {
               lib.manager.ToolTip.add(_loc4_.mc.questAlimBtn,lib.util.UIString.getUIString("$091032"),1);
            }
            if(toggleState)
            {
               _loc4_.mc.questAlimBtn._visible = toggle;
            }
            _loc4_.mc.questAlimBtn.gotoAndStop(toggle + 1);
            toggleEventSave(_loc4_.mc,toggle);
         }
      }
      _loc4_ = getQuest(questOrZone,3);
      if(_loc4_ != null)
      {
         _loc9_ = _loc4_.mc._parent._parent._parent._parent;
         if(_loc9_ == container_mc.storyContents_mc && tabState == 1 || _loc9_ == container_mc.contents_mc && tabState == 0 || _loc9_ == container_mc.guildContents_mc && (tabState == 2 || tabState == 4) || _loc9_ == container_mc.reputation_mc && tabState == 3)
         {
            if(toggle == 0)
            {
               lib.manager.ToolTip.add(_loc4_.mc.questAlimBtn,lib.util.UIString.getUIString("$091031"),1);
            }
            else if(toggle == 1)
            {
               lib.manager.ToolTip.add(_loc4_.mc.questAlimBtn,lib.util.UIString.getUIString("$091032"),1);
            }
            if(toggleState)
            {
               _loc4_.mc.questAlimBtn._visible = toggle;
            }
            _loc4_.mc.questAlimBtn.gotoAndStop(toggle + 1);
            toggleEventSave(_loc4_.mc,toggle);
         }
      }
   }
};
myListener.OnGame_QuestJournal_SetCompleteQuestBtn = function(checked)
{
   checked = Number(checked);
   container_mc.pastQuest_btn.checked = checked;
};
container_mc.pastQuest_btn.onRelease = function()
{
   lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
   if(this.checked)
   {
      ToGame_QuestJournal_RequestSetCompleteQuest(0);
   }
   else
   {
      ToGame_QuestJournal_RequestSetCompleteQuest(1);
   }
};
container_mc.pastQuest_btn.setText(container_mc.pastQuest_txt);
var btnX = 10;
var btnYGap = 2;
var baseRequitalItemList = new lib.util.List(dialog.slots_mc,"baseRequitalItem",btnYGap);
var repeatRequitalItemList = new lib.util.List(dialog.slots2_mc,"repeatRequitalItem",btnYGap);
var selectRequitalItemList = new lib.util.List(dialog.slots3_mc,"selectRequitalItem",btnYGap);
var AddRequitalItemDataList = new lib.util.List(dialog.slots4_mc,"AddRequitalItem",btnYGap);
baseRequitalItemList.useTile = true;
repeatRequitalItemList.useTile = true;
selectRequitalItemList.useTile = true;
AddRequitalItemDataList.useTile = true;
myListener.OnGame_QuestJournal_SetEnableShareBtn = function(bEnabled)
{
   bEnabled = Number(bEnabled);
   share_btn.setEnabled(bEnabled);
};
myListener.OnGame_QuestJournal_UpdateTask = function(taskId, curNum, totalNum)
{
   var _loc1_ = getQuestTask(taskId);
   if(_loc1_ != null)
   {
      if(_loc1_.type == 1)
      {
         if(totalNum != 0 && totalNum != undefined && totalNum != null)
         {
            _loc1_.upText = _loc1_.name + " &lt;" + curNum + "/" + totalNum + "&gt;";
            if(Number(curNum) == Number(totalNum))
            {
               _loc1_.up_txt.textColor = lib.info.TextColor.FILL_FULL;
            }
            else
            {
               _loc1_.up_txt.textColor = lib.info.TextColor.FILL_SHORT;
            }
         }
         else
         {
            _loc1_.upText = "";
         }
         if(_loc1_.grade >= 1)
         {
            _loc1_.up_txt.textColor = lib.info.TextColor["RAREGRADE_PAPER" + _loc1_.grade];
         }
      }
      else if(_loc1_.type == 2)
      {
         if(totalNum != "0" && totalNum != undefined && totalNum != null)
         {
            _loc1_.txt.text = _loc1_.name + " <" + curNum + "/" + totalNum + ">";
            if(Number(curNum) == Number(totalNum))
            {
               _loc1_.txt.textColor = lib.info.TextColor.FILL_FULL;
            }
            else
            {
               _loc1_.txt.textColor = lib.info.TextColor.FILL_SHORT;
            }
         }
         else
         {
            _loc1_.txt.text = _loc1_.name;
         }
      }
   }
};
myListener.OnGame_QuestJournal_SetDialogCompleted = function(storyGroup, questName, htmlText)
{
   clearDialog();
   dialog.aimContainer._visible = false;
   container_mc.darkBgMc._visible = questType == DARK_TYPE;
   dialog.groupMc._visible = storyGroup != undefined && storyGroup != "";
   dialog.groupMc.txt.text = storyGroup;
   var _loc1_ = !dialog.groupMc._visible?null:dialog.groupMc;
   dialog.questName_txt.setText(questName);
   dialog.questName_txt._visible = questName != undefined && questName != "";
   dialog.nameBg_mc._visible = questName != undefined && questName != "";
   dialog.nameBg_mc._y = _loc1_ == null?0:_loc1_._y + _loc1_._height;
   dialog.questName_txt._y = dialog.nameBg_mc._y + 12;
   _loc1_ = !dialog.questName_txt._visible?_loc1_:dialog.questName_txt;
   dialog.questCompleteMc._visible = true;
   dialog.questCompleteMc._y = _loc1_ == null?0:_loc1_._y + _loc1_._height + 15;
   _loc1_ = !dialog.questCompleteMc._visible?_loc1_:dialog.questCompleteMc;
   var _loc4_ = _loc1_ != dialog.questCompleteMc?_loc1_._height:30;
   dialog.dialog_txt.htmlText = htmlText;
   dialog.dialog_txt._y = _loc1_ == null?10:_loc1_._y + _loc4_ + 10;
   lib.util.ExtString.alignJoint(dialog.dialog_txt);
   dialog.dialog_txt._visible = true;
   dialog.dialog_txt._height = dialog.dialog_txt.textHeight + 5;
   dialogScrollBar.pageSize = dialog._height;
};
myListener.OnGame_QuestJournal_SetDialogNoAccepted = function(storyGroup, questName, htmlText, conditionQuest)
{
   clearDialog();
   container_mc.darkBgMc._visible = questType == DARK_TYPE;
   dialog.groupMc._visible = storyGroup != undefined && storyGroup != "";
   dialog.groupMc.txt.text = storyGroup;
   var _loc1_ = !dialog.groupMc._visible?null:dialog.groupMc;
   dialog.questName_txt.setText(questName);
   dialog.questName_txt._visible = questName != undefined && questName != "";
   dialog.nameBg_mc._visible = questName != undefined && questName != "";
   dialog.nameBg_mc._y = _loc1_ == null?0:_loc1_._y + _loc1_._height;
   dialog.questName_txt._y = dialog.nameBg_mc._y + 12;
   _loc1_ = !dialog.questName_txt._visible?_loc1_:dialog.questName_txt;
   dialog.noAccepted_txt._visible = true;
   dialog.noAccepted_txt._y = _loc1_ == null?0:_loc1_._y + _loc1_._height + 15;
   _loc1_ = dialog.noAccepted_txt;
   dialog.dialog_txt.htmlText = htmlText;
   dialog.dialog_txt._y = _loc1_ == null?10:_loc1_._y + _loc1_._height + 10;
   lib.util.ExtString.alignJoint(dialog.dialog_txt);
   dialog.dialog_txt._visible = true;
   dialog.dialog_txt._height = dialog.dialog_txt.textHeight + 5;
   var _loc5_ = dialog.dialog_txt._y + dialog.dialog_txt.textHeight + 30;
   if(conditionQuest != "" && conditionQuest != "undefined" && conditionQuest != undefined)
   {
      dialog.aimContainer._visible = true;
      dialog.aimContainer._y = _loc5_;
      dialog.aimContainer.title_txt._visible = true;
      dialog.aimContainer.txt.htmlText = conditionQuest;
      lib.util.ExtString.alignJoint(dialog.aimContainer.txt);
      dialog.aimContainer.txt._height = dialog.aimContainer.txt.textHeight + 5;
      dialog.aimContainer.txt._y = dialog.aimContainer.title_txt._y + dialog.aimContainer.title_txt._height + 15;
      dialog.aimContainer.bg._height = dialog.aimContainer.txt._y + dialog.aimContainer.txt._height + 30;
   }
   dialogScrollBar.pageSize = dialog._height;
};
var DARK_TYPE = "5";
var DARK_STEP_STR = lib.util.UIString.getUIString("$005024");
var BACK_UP_ITEM_STR = lib.util.UIString.getUIString("$091046");
myListener.OnGame_QuestJournal_SetDialog = function(npcName, htmlText, aimText, aimTaskData, aimLinkData, dialogBtnData, currentPage, totalPage, bBaseRequitalComplete, baseRequitalItemData, repayMoney, bRepeatRequitalComplete, repeatRequitalCompleteNum, repeatRequitalItemData, bSelectableRequitalComplete, selectableRequitalCompleteNum, selectableRequitalItemData, bReduceRepeatQuestReward, questType, bAddRequitalComplete, AddRequitalItemData, questStep, rewardTitles, pointInfo, questName, level, zoneName, storyGroup, bBackUpItem)
{
   clearDialog();
   if(htmlText == "" || htmlText == undefined || htmlText == null)
   {
      return undefined;
   }
   currentPage = Number(currentPage);
   totalPage = Number(totalPage);
   bBackUpItem = Boolean(Number(bBackUpItem));
   if(isNaN(currentPage))
   {
      currentPage = 0;
   }
   if(isNaN(totalPage))
   {
      totalPage = 0;
   }
   bBaseRequitalComplete = Number(bBaseRequitalComplete);
   bRepeatRequitalComplete = Number(bRepeatRequitalComplete);
   repeatRequitalCompleteNum = Number(repeatRequitalCompleteNum);
   bSelectableRequitalComplete = Number(bSelectableRequitalComplete);
   selectableRequitalCompleteNum = Number(selectableRequitalCompleteNum);
   bAddRequitalComplete = Number(bAddRequitalComplete);
   bReduceRepeatQuestReward = Number(bReduceRepeatQuestReward);
   dialog.dialog_txt._visible = false;
   dialog.aimContainer._visible = false;
   dialog.groupMc._visible = storyGroup != undefined && storyGroup != "";
   dialog.groupMc.txt.text = storyGroup;
   var _loc14_ = !dialog.groupMc._visible?null:dialog.groupMc;
   dialog.questName_txt.setText(questName);
   dialog.questName_txt._visible = questName != undefined && questName != "";
   dialog.nameBg_mc._visible = questName != undefined && questName != "";
   if(_loc14_ == null)
   {
      dialog.nameBg_mc._y = 0;
   }
   else
   {
      dialog.nameBg_mc._y = _loc14_._y + _loc14_._height;
   }
   dialog.questName_txt._y = dialog.nameBg_mc._y + 12;
   _loc14_ = !dialog.questName_txt._visible?_loc14_:dialog.questName_txt;
   if(level == undefined || level == "")
   {
      level = "";
   }
   else
   {
      level = "[" + levelStr + " " + level + "] ";
   }
   if(zoneName == undefined || zoneName == "")
   {
      zoneName = "";
   }
   var _loc52_ = level + zoneName;
   dialog.questInfo_txt.text = _loc52_;
   dialog.questInfo_txt._visible = _loc52_ != "";
   dialog.questInfo_txt._y = _loc14_ == null?0:_loc14_._y + _loc14_._height + 10;
   _loc14_ = !dialog.questInfo_txt._visible?_loc14_:dialog.questInfo_txt;
   if(questStep != undefined && questStep != "" && questStep != 0)
   {
      var _loc36_ = lib.util.ExtString.split(questStep,"\t");
      if(_loc36_[0] == _loc36_[1])
      {
         dialog.questInfo_txt.htmlText = DARK_STEP_STR + " <font color=\'#80E71C\'>" + _loc36_[0] + "/" + _loc36_[1] + "</font>";
      }
      else
      {
         dialog.questInfo_txt.htmlText = DARK_STEP_STR + " <font color=\'#80E71C\'>" + _loc36_[0] + "</font><font color=\'#d7d7d7\'>/" + _loc36_[1] + "</font>";
      }
   }
   container_mc.darkBgMc._visible = questType == DARK_TYPE;
   dialog.npcName_txt.htmlText = npcName;
   dialog.npcName_txt._visible = npcName != undefined && npcName != "";
   if(_loc14_ == null)
   {
      dialog.npcName_txt._y = 0;
   }
   else if(_loc14_ == dialog.questInfo_txt)
   {
      dialog.npcName_txt._y = _loc14_._y + _loc14_._height + 3;
   }
   else
   {
      dialog.npcName_txt._y = _loc14_._y + _loc14_._height + 10;
   }
   dialog.npcName_txt._y = _loc14_ == null?0:_loc14_._y + _loc14_._height + 10;
   _loc14_ = !dialog.npcName_txt._visible?_loc14_:dialog.npcName_txt;
   dialog.dialog_txt.htmlText = htmlText;
   dialog.dialog_txt._y = _loc14_ == null?10:_loc14_._y + _loc14_._height + 10;
   lib.util.ExtString.alignJoint(dialog.dialog_txt);
   dialog.dialog_txt._visible = true;
   dialog.dialog_txt._height = dialog.dialog_txt.textHeight + 5;
   var _loc8_ = dialog.dialog_txt._y + dialog.dialog_txt.textHeight + 30;
   if(aimText != "" || aimTaskData != "" || aimLinkData != "")
   {
      dialog.aimContainer._visible = true;
      dialog.aimContainer._y = _loc8_;
   }
   if(aimText != "" && aimText != undefined)
   {
      dialog.aimContainer.txt.htmlText = aimText;
      lib.util.ExtString.alignJoint(dialog.aimContainer.txt);
      dialog.aimContainer.txt._height = dialog.aimContainer.txt.textHeight + 5;
      dialog.aimContainer.txt._y = 24;
   }
   var _loc24_ = dialog.aimContainer.txt._y + dialog.aimContainer.txt.textHeight + 15;
   if(aimTaskData != undefined && aimTaskData != "undefined" && aimTaskData != 0 && aimTaskData != "0" && aimTaskData != null && aimTaskData != "null")
   {
      var _loc32_ = lib.util.ExtString.split(aimTaskData,"\n");
      var _loc28_ = 0;
      var _loc38_ = _loc32_.length;
      var _loc7_ = 0;
      while(_loc7_ < _loc38_)
      {
         var _loc4_ = _loc32_[_loc7_].split("\t");
         if(_loc4_.length != 1)
         {
            var _loc3_ = undefined;
            var _loc9_ = Number(_loc4_[3]);
            var _loc6_ = Number(_loc4_[4]);
            if(_loc4_[1] != "img://")
            {
               var _loc13_ = Number(_loc4_[6]);
               mcBg = dialog.aimContainer.attachMovie("needItemBg","needItemBg" + _loc7_,dialog.aimContainer.getNextHighestDepth());
               _loc3_ = dialog.aimContainer.attachMovie("Slot4_link","task" + _loc7_,dialog.aimContainer.getNextHighestDepth());
               aimMovieClip_array.push(mcBg);
               aimMovieClip_array.push(_loc3_);
               _loc28_ = _loc28_ + 1;
               _loc3_._x = btnX + 25;
               mcBg._x = btnX + 27;
               _loc3_.type = 1;
               _loc3_.id = _loc4_[0];
               _loc3_.name = _loc4_[2];
               _loc3_.draw(_loc4_[1]);
               _loc3_.grade = _loc13_;
               _loc3_.sealType = _loc4_[7];
               _loc3_.masterpiece = _loc4_[8];
               _loc3_.display = true;
               _loc3_.guidNum_mc._visible = false;
               _loc3_.drag = false;
               _loc3_.effect = false;
               _loc3_.hideAllBg();
               _loc3_.Slot.hideBg();
               _loc3_.setLineNum(1);
               _loc3_.up_txt._x = _loc3_.up_txt._x + 8;
               _loc3_.up_txt._width = 300;
               _loc3_.up_txt._height = 55;
               _loc3_.up_txt.verticalAlign = "center";
               _loc3_.up_txt.shadowStrength = 3;
               _loc3_.up_txt.shadowBlurX = 1;
               _loc3_.up_txt.shadowBlurY = 1;
               _loc3_.up_txt.shadowDistance = 1;
               SetMultiply(_loc3_.multiply,0);
               lib.manager.ToolTip.add(_loc3_.SLOT,_loc4_[0],6,_loc3_.Slot.Icon);
               if(_loc6_ != 0 && _loc6_ != undefined && _loc6_ != null)
               {
                  _loc3_.upText = _loc4_[2] + " &lt;" + _loc9_ + "/" + _loc6_ + "&gt;";
                  if(_loc9_ == _loc6_)
                  {
                     _loc3_.up_txt.textColor = lib.info.TextColor.FILL_FULL;
                  }
                  else
                  {
                     _loc3_.up_txt.textColor = lib.info.TextColor.FILL_SHORT;
                  }
               }
               else
               {
                  _loc3_.upText = _loc4_[2];
               }
               _loc3_.up_txt.textColor = 16777215;
               if(_loc13_ >= 1)
               {
                  _loc3_.up_txt.textColor = lib.info.TextColor["RAREGRADE_PAPER" + _loc13_];
               }
               myListener.OnGame_QuestJournal_UpdateTask(_loc4_[0],_loc4_[3],_loc4_[4]);
            }
            else if(_loc6_ != 0 && _loc6_ != undefined && _loc6_ != null)
            {
               _loc3_ = dialog.aimContainer.attachMovie("aimTask","task" + _loc7_,dialog.aimContainer.getNextHighestDepth());
               aimMovieClip_array.push(_loc3_);
               _loc28_ = _loc28_ + 1;
               _loc3_.type = 2;
               _loc3_.id = _loc4_[0];
               _loc3_.name = _loc4_[2];
               _loc3_._x = btnX + 21;
               _loc3_.id = _loc4_[0];
               _loc3_.txt.text = _loc4_[2];
               _loc3_.txt.text = _loc3_.txt.text + (" <" + _loc9_ + "/" + _loc6_ + ">");
               if(_loc9_ == _loc6_)
               {
                  _loc3_.txt.textColor = lib.info.TextColor.FILL_FULL;
               }
               else
               {
                  _loc3_.txt.textColor = 16777215;
               }
            }
            else
            {
               _loc3_.txt.text = "";
            }
            if(_loc3_ != undefined)
            {
               _loc3_._y = _loc24_;
               mcBg._y = _loc3_._y + 2;
               _loc24_ = _loc24_ + _loc3_._height;
            }
         }
         _loc7_ = _loc7_ + 1;
      }
      if(_loc28_ == 0)
      {
         _loc24_ = _loc24_ + 20;
      }
   }
   if(aimLinkData != undefined && aimLinkData != "undefined" && aimLinkData != 0 && aimLinkData != "0" && aimLinkData != null && aimLinkData != "null")
   {
      _loc24_ = _loc24_ + 5;
      dialog.aimContainer.txt2.htmlText = aimLinkData;
      dialog.aimContainer.txt2._y = _loc24_;
      dialog.aimContainer.txt2._height = dialog.aimContainer.txt2.textHeight + 5;
      _loc24_ = _loc24_ + (dialog.aimContainer.txt2.textHeight + 5);
   }
   if(dialog.aimContainer._visible)
   {
      dialog.aimContainer.bg._height = _loc24_ + 20;
      _loc8_ = _loc8_ + (dialog.aimContainer._height - 20);
   }
   if(bBackUpItem)
   {
      var _loc30_ = dialog.attachMovie("dialog_btn","dialog_btn" + dialog.getNextHighestDepth(),dialog.getNextHighestDepth());
      _loc30_._x = btnX;
      _loc30_._y = _loc8_;
      _loc8_ = _loc8_ + (_loc30_._height + btnYGap);
      _loc30_.txt.text = BACK_UP_ITEM_STR;
      _loc30_.onRollOver = function()
      {
         this.gotoAndStop(2);
         this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_OVER;
      };
      _loc30_.onRollOut = btn.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
         this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_NORMAL;
         this.txt._y = 11;
      };
      _loc30_.onPress = function()
      {
         this.gotoAndStop(3);
         this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_PRESS;
         this.txt._y = 12;
      };
      _loc30_.onRelease = function()
      {
         ToGame_QuestJournal_BackUpItem();
         this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_OVER;
         this.txt._y = 11;
      };
   }
   if(pointInfo != "" && pointInfo != undefined)
   {
      var _loc40_ = dialog.attachMovie("pointguide","pointGuide",dialog.getNextHighestDepth());
      _loc40_.txt.htmlText = pointInfo;
      _loc40_.txt._height = _loc40_.txt.textHeight + 4;
      _loc40_._x = btnX + 10;
      _loc40_._y = _loc8_ + 18;
      _loc8_ = _loc8_ + (_loc40_._height + 23);
   }
   if(bBaseRequitalComplete >= 0 && (baseRequitalItemData != undefined && baseRequitalItemData != ""))
   {
      var _loc31_ = dialog.attachMovie("bosang","bosang",dialog.getNextHighestDepth());
      _loc31_.type.gotoAndStop(1);
      if(bBaseRequitalComplete == 0)
      {
         _loc31_.txt.text = lib.util.UIString.getUIString("$181016");
      }
      else
      {
         _loc31_.txt.text = lib.util.UIString.getUIString("$181016") + completeStr;
      }
      _loc31_.txt.textAutoSize = "shrink";
      _loc31_._x = btnX - 2;
      _loc31_._y = _loc8_ + 30;
      _loc8_ = _loc8_ + (36 + _loc31_._height);
      dialog.slots_mc._y = _loc8_;
      var _loc18_ = baseRequitalItemData.split("\n");
      if(_loc18_[_loc18_.length - 1] == "0" || _loc18_[_loc18_.length - 1] == "undefined" || _loc18_[_loc18_.length - 1] == "")
      {
         _loc18_.splice(_loc18_.length - 1,1);
      }
      if(_loc18_.length >= 1)
      {
         dialog.blet1_mc._visible = true;
         _loc7_ = 0;
         while(_loc7_ < _loc18_.length)
         {
            var _loc16_ = _loc18_[_loc7_].split("\t");
            var _loc2_ = baseRequitalItemList.add(_loc16_[0],"Slot4_link");
            _loc2_.guidNum_mc._visible = false;
            _loc2_.BG.bg._visible = false;
            _loc2_.effect = false;
            _loc2_.img = _loc16_[1];
            _loc2_.grade = _loc16_[7];
            _loc2_.sealType = _loc16_[8];
            _loc2_.masterpiece = _loc16_[9];
            SetMultiply(_loc2_.multiply,Number(_loc16_[10]));
            var _loc15_ = Number(_loc16_[2]);
            var _loc25_ = Number(_loc16_[4]);
            var _loc27_ = Number(_loc16_[6]);
            var _loc10_ = "";
            if(_loc15_ > 0)
            {
               _loc10_ = "+" + _loc15_ + " " + _loc16_[3];
            }
            else
            {
               _loc10_ = _loc16_[3];
            }
            _loc2_.upTxt = _loc10_;
            _loc2_.downTxt = _loc25_;
            _loc2_.useable = _loc16_[5];
            _loc2_.itemType = _loc16_[6];
            if(_loc27_ == 2)
            {
               baseRequitalItemList.gold = 1;
            }
            _loc2_.draw(_loc2_.img);
            _loc2_.display = true;
            lib.util.ExtString.textCut(_loc2_.up_txt,_loc2_.upTxt);
            if(_loc2_.itemType == 2)
            {
               var _loc17_ = 0;
               if(_loc16_[11] != undefined && _loc16_[11] != "" && _loc16_[11] != "undefined")
               {
                  _loc17_ = Number(_loc16_[11]);
               }
               _loc2_.setLineNum(3);
               _loc2_.upText = "";
               _loc2_.center_txt.html = true;
               var _loc26_ = lib.util.GoldCurrency.SetGoldText(_loc2_.downTxt,0,0,0,_loc17_);
               _loc2_.center_txt.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc26_ + "</font>";
               _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
               }
               _loc2_.showMoney(false);
               _loc2_.money_mc._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc2_.money_mc._y = _loc2_.center_txt._y + 2;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$101087") + " " + _loc2_.center_txt.htmlText,1);
            }
            else if(_loc2_.itemType == 3)
            {
               _loc2_.setLineNum(3);
               _loc2_.upText = "";
               _loc2_.centerText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_EXP;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
               }
               var _loc12_ = _loc2_.attachMovie("symbol_xp","symbol_xp",_loc2_.getNextHighestDepth());
               _loc12_._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc12_._y = _loc2_.center_txt._y;
               _loc12_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$101088") + " " + _loc2_.center_txt.htmlText,1);
            }
            else if(_loc2_.itemType == 4)
            {
               _loc2_.setLineNum(3);
               _loc2_.upText = "";
               _loc2_.centerText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
               }
               var _loc11_ = _loc2_.attachMovie("symbol_p","symbol_p",_loc2_.getNextHighestDepth());
               _loc11_._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc11_._y = _loc2_.center_txt._y;
               _loc11_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$101089") + " " + _loc2_.center_txt.htmlText,1);
            }
            else if(_loc2_.itemType == 5)
            {
               _loc2_.draw("img://__Icon_Items.ReputationXP_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc16_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.center_txt.textColor = 32511;
               }
               _loc11_ = _loc2_.attachMovie("symbol_rp_xp","symbol_rp_xp",_loc2_.getNextHighestDepth());
               _loc2_.down_txt._width = 123;
               _loc11_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc11_._y = _loc2_.down_txt._y;
               _loc11_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$102185") + " " + "<font color=\'#00B4FF\'>" + _loc2_.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + _loc2_.downTxt + "</font>",1);
            }
            else if(_loc2_.itemType == 6)
            {
               _loc2_.draw("img://__Icon_Items.ReputationPoint_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc16_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.down_txt.textColor = 32511;
               }
               _loc11_ = lib.util.DrawBitmap.makeMcAndDraw(_loc2_,"img://__Icon_Items.ReputationPointCoin");
               _loc2_.down_txt._width = 123;
               _loc11_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc11_._y = _loc2_.down_txt._y;
               _loc11_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$102186") + " " + "<font color=\'#00B4FF\'>" + _loc2_.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + _loc2_.downTxt + "</font>",1);
            }
            else if(_loc2_.itemType == 7)
            {
               _loc2_.draw("img://__Icon_Items.UnionPoint_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc16_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.down_txt.textColor = 32511;
               }
               _loc11_ = lib.util.DrawBitmap.makeMcAndDraw(_loc2_,"img://__Icon_Items.UnionPointCoin");
               _loc2_.down_txt._width = 123;
               _loc11_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc11_._y = _loc2_.down_txt._y;
               _loc11_.hitTestDisable = true;
            }
            else if(_loc2_.itemType == 8)
            {
               _loc2_.setLineNum(3);
               _loc2_.center_txt.htmlText = _loc16_[3];
               _loc2_.upText = "";
               _loc2_.center_txt._y = 10;
               _loc2_.center_txt._height = 40;
               _loc2_.center_txt.verticalAlign = "center";
               if(_loc2_.id == -1)
               {
                  _loc2_.up_txt.textColor = 46335;
                  lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.center_txt.htmlText,1);
               }
               else
               {
                  lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.id + "\t8",6,_loc2_.Slot.Icon);
               }
            }
            else
            {
               preViewEvent(_loc2_);
               _loc2_.setLineNum(2);
               if(_loc2_.downTxt > 0)
               {
                  _loc2_.downText = lib.util.UIString.getUIString("$181002","ItemCount",_loc2_.downTxt);
               }
               else
               {
                  _loc2_.downText = "";
               }
               lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.id + "\t" + _loc2_.itemType,6,_loc2_.Slot.Icon);
            }
            if(!(_loc2_.itemType == 5 || _loc2_.itemType == 6 || _loc2_.itemType == 7))
            {
               _loc2_.down_txt.textColor = 16777215;
            }
            if(this.useable != undefined)
            {
               this.impossible = Number(this.useable);
            }
            _loc7_ = _loc7_ + 1;
         }
         dialog.slots_mc._y = _loc8_;
         _loc8_ = _loc8_ + dialog.slots_mc._height;
      }
      _loc8_ = dialog.slots_mc._y + dialog.slots_mc._height + btnYGap;
   }
   if(bReduceRepeatQuestReward)
   {
      var _loc35_ = dialog.attachMovie("guide","reduceGuide",dialog.getNextHighestDepth());
      _loc35_.txt.text = lib.util.UIString.getUIString("$181019");
      _loc35_.txt._height = _loc35_.txt.textHeight + 4;
      _loc35_._x = btnX + 10;
      _loc35_._y = _loc8_ + 3;
      _loc8_ = _loc8_ + (_loc35_._height + 3);
   }
   if(bAddRequitalComplete >= 0 && (AddRequitalItemData != undefined && AddRequitalItemData != ""))
   {
      var _loc33_ = dialog.attachMovie("bosang","bosang4",dialog.getNextHighestDepth());
      _loc33_.type.gotoAndStop(3);
      if(bAddRequitalComplete == 0)
      {
         _loc33_.txt.text = lib.util.UIString.getUIString("$091038");
      }
      else
      {
         _loc33_.txt.text = lib.util.UIString.getUIString("$091039");
      }
      _loc33_.txt.textAutoSize = "shrink";
      _loc33_._x = btnX - 2;
      _loc33_._y = _loc8_ + 30;
      _loc8_ = _loc8_ + (36 + _loc33_._height);
      dialog.slots4_mc._y = _loc8_;
      var _loc21_ = AddRequitalItemData.split("\n");
      if(_loc21_[_loc21_.length - 1] == "0" || _loc21_[_loc21_.length - 1] == "undefined" || _loc21_[_loc21_.length - 1] == "")
      {
         _loc21_.splice(_loc21_.length - 1,1);
      }
      if(_loc21_.length >= 1)
      {
         dialog.blet1_mc._visible = true;
         _loc7_ = 0;
         while(_loc7_ < _loc21_.length)
         {
            _loc16_ = _loc21_[_loc7_].split("\t");
            _loc2_ = AddRequitalItemDataList.add(_loc16_[0],"Slot4_link");
            _loc2_.guidNum_mc._visible = false;
            _loc2_.BG.bg._visible = false;
            _loc2_.effect = false;
            _loc2_.img = _loc16_[1];
            _loc2_.grade = _loc16_[7];
            _loc2_.sealType = _loc16_[8];
            _loc2_.masterpiece = _loc16_[9];
            SetMultiply(_loc2_.multiply,Number(_loc16_[10]));
            _loc15_ = Number(_loc16_[2]);
            _loc25_ = Number(_loc16_[4]);
            _loc27_ = Number(_loc16_[6]);
            _loc10_ = "";
            if(_loc15_ > 0)
            {
               _loc10_ = "+" + _loc15_ + " " + _loc16_[3];
            }
            else
            {
               _loc10_ = _loc16_[3];
            }
            _loc2_.upTxt = _loc10_;
            _loc2_.downTxt = _loc25_;
            _loc2_.useable = _loc16_[5];
            _loc2_.itemType = _loc16_[6];
            if(_loc27_ == 2)
            {
               AddRequitalItemDataList.gold = 1;
            }
            _loc2_.draw(_loc2_.img);
            _loc2_.display = true;
            lib.util.ExtString.textCut(_loc2_.up_txt,_loc2_.upTxt);
            if(_loc2_.itemType == 2)
            {
               _loc17_ = 0;
               if(_loc16_[11] != undefined && _loc16_[11] != "" && _loc16_[11] != "undefined")
               {
                  _loc17_ = Number(_loc16_[11]);
               }
               _loc2_.setLineNum(3);
               _loc2_.upText = "";
               _loc2_.center_txt.html = true;
               _loc26_ = lib.util.GoldCurrency.SetGoldText(_loc2_.downTxt,0,0,0,_loc17_);
               _loc2_.center_txt.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc26_ + "</font>";
               _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
               }
               _loc2_.showMoney(false);
               _loc2_.money_mc._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc2_.money_mc._y = _loc2_.center_txt._y + 2;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$101087") + " " + _loc2_.center_txt.htmlText,1);
            }
            else if(_loc2_.itemType == 3)
            {
               _loc2_.setLineNum(3);
               _loc2_.upText = "";
               _loc2_.centerText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_EXP;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
               }
               _loc12_ = _loc2_.attachMovie("symbol_xp","symbol_xp",_loc2_.getNextHighestDepth());
               _loc12_._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc12_._y = _loc2_.center_txt._y;
               _loc12_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$101088") + " " + _loc2_.center_txt.htmlText,1);
            }
            else if(_loc2_.itemType == 4)
            {
               _loc2_.setLineNum(3);
               _loc2_.upText = "";
               _loc2_.centerText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
               }
               _loc11_ = _loc2_.attachMovie("symbol_p","symbol_p",_loc2_.getNextHighestDepth());
               _loc11_._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc11_._y = _loc2_.center_txt._y;
               _loc11_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$101089") + " " + _loc2_.center_txt.htmlText,1);
            }
            else if(_loc2_.itemType == 5)
            {
               _loc2_.draw("img://__Icon_Items.ReputationXP_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc16_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.down_txt.textColor = 32511;
               }
               _loc11_ = _loc2_.attachMovie("symbol_rp_xp","symbol_rp_xp",_loc2_.getNextHighestDepth());
               _loc2_.down_txt._width = 123;
               _loc11_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc11_._y = _loc2_.down_txt._y;
               _loc11_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$102185") + " " + "<font color=\'#00B4FF\'>" + _loc2_.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + _loc2_.downTxt + "</font>",1);
            }
            else if(_loc2_.itemType == 6)
            {
               _loc2_.draw("img://__Icon_Items.ReputationPoint_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc16_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.down_txt.textColor = 32511;
               }
               _loc11_ = lib.util.DrawBitmap.makeMcAndDraw(_loc2_,"img://__Icon_Items.ReputationPointCoin");
               _loc2_.down_txt._width = 123;
               _loc11_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc11_._y = _loc2_.down_txt._y;
               _loc11_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$102186") + " " + "<font color=\'#00B4FF\'>" + _loc2_.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + _loc2_.downTxt + "</font>",1);
            }
            else if(_loc2_.itemType == 7)
            {
               _loc2_.draw("img://__Icon_Items.UnionPoint_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc16_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.down_txt.textColor = 32511;
               }
               _loc11_ = lib.util.DrawBitmap.makeMcAndDraw(_loc2_,"img://__Icon_Items.UnionPointCoin");
               _loc2_.down_txt._width = 123;
               _loc11_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc11_._y = _loc2_.down_txt._y;
               _loc11_.hitTestDisable = true;
            }
            else if(_loc2_.itemType == 8)
            {
               _loc2_.setLineNum(3);
               _loc2_.center_txt.htmlText = _loc16_[3];
               _loc2_.upText = "";
               _loc2_.center_txt._y = 10;
               _loc2_.center_txt._height = 40;
               _loc2_.center_txt.verticalAlign = "center";
               if(_loc2_.id == -1)
               {
                  _loc2_.up_txt.textColor = 46335;
                  lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.center_txt.htmlText,1);
               }
               else
               {
                  lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.id + "\t8",6,_loc2_.Slot.Icon);
               }
            }
            else
            {
               preViewEvent(_loc2_);
               _loc2_.setLineNum(2);
               if(_loc2_.downTxt > 0)
               {
                  _loc2_.downText = lib.util.UIString.getUIString("$181002","ItemCount",_loc2_.downTxt);
               }
               else
               {
                  _loc2_.downText = "";
               }
               lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.id + "\t" + _loc2_.itemType,6,_loc2_.Slot.Icon);
            }
            if(!(_loc2_.itemType == 5 || _loc2_.itemType == 6 || _loc2_.itemType == 7))
            {
               _loc2_.down_txt.textColor = 16777215;
            }
            if(this.useable != undefined)
            {
               this.impossible = Number(this.useable);
            }
            _loc7_ = _loc7_ + 1;
         }
         dialog.slots4_mc._y = _loc8_;
         _loc8_ = _loc8_ + dialog.slots4_mc._height;
      }
      _loc8_ = dialog.slots4_mc._y + dialog.slots4_mc._height + btnYGap * 2;
   }
   if(bRepeatRequitalComplete >= 0 && (repeatRequitalItemData != undefined && repeatRequitalItemData != ""))
   {
      var _loc37_ = dialog.attachMovie("bosang","bosang2",dialog.getNextHighestDepth());
      if(bRepeatRequitalComplete == 0)
      {
         _loc37_.txt.text = lib.util.UIString.getUIString("$181013","count",repeatRequitalCompleteNum);
      }
      else
      {
         _loc37_.txt.text = lib.util.UIString.getUIString("$181013","count",repeatRequitalCompleteNum) + completeStr;
      }
      _loc37_.txt.textAutoSize = "shrink";
      _loc37_._x = btnX - 2;
      _loc37_._y = _loc8_ + 10;
      _loc8_ = _loc8_ + (5 + _loc37_._height);
      dialog.slots2_mc._y = _loc8_ + 10;
      var _loc20_ = repeatRequitalItemData.split("\n");
      if(_loc20_[_loc20_.length - 1] == "0" || _loc20_[_loc20_.length - 1] == "undefined" || _loc20_[_loc20_.length - 1] == "")
      {
         _loc20_.splice(_loc20_.length - 1,1);
      }
      if(_loc20_.length >= 1)
      {
         _loc7_ = 0;
         while(_loc7_ < _loc20_.length)
         {
            _loc16_ = _loc20_[_loc7_].split("\t");
            _loc2_ = repeatRequitalItemList.add(_loc16_[0],"Slot4_link");
            _loc2_.guidNum_mc._visible = false;
            _loc2_.BG.bg._visible = false;
            _loc2_.effect = false;
            _loc2_.img = _loc16_[1];
            _loc15_ = Number(_loc16_[2]);
            _loc25_ = Number(_loc16_[4]);
            _loc10_ = "";
            if(_loc15_ > 0)
            {
               _loc10_ = "+" + _loc15_ + " " + _loc16_[3];
            }
            else
            {
               _loc10_ = _loc16_[3];
            }
            _loc2_.upTxt = _loc10_;
            _loc2_.downTxt = _loc25_;
            _loc2_.useable = _loc16_[5];
            _loc2_.itemType = _loc16_[6];
            _loc2_.grade = _loc16_[7];
            _loc2_.sealType = _loc16_[8];
            _loc2_.masterpiece = _loc16_[9];
            SetMultiply(_loc2_.multiply,Number(_loc16_[10]));
            if(_loc16_[6] == "2")
            {
               repeatRequitalItemList.gold = 1;
            }
            _loc2_.draw(_loc2_.img);
            _loc2_.display = true;
            lib.util.ExtString.textCut(_loc2_.up_txt,_loc2_.upTxt);
            _loc2_.sealType = _loc2_.sealType;
            _loc2_.masterpiece = _loc2_.masterpiece;
            if(_loc2_.itemType == 2)
            {
               _loc17_ = 0;
               if(_loc16_[11] != undefined && _loc16_[11] != "" && _loc16_[11] != "undefined")
               {
                  _loc17_ = Number(_loc16_[11]);
               }
               _loc2_.setLineNum(3);
               _loc2_.upText = "";
               _loc2_.center_txt.html = true;
               _loc26_ = lib.util.GoldCurrency.SetGoldText(_loc2_.downTxt,0,0,0,_loc17_);
               _loc2_.center_txt.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc26_ + "</font>";
               _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
               _loc2_.showMoney(false);
               _loc2_.money_mc._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc2_.money_mc._y = _loc2_.center_txt._y + 2;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$101087") + " " + _loc2_.center_txt.htmlText,1);
            }
            else if(_loc2_.itemType == 3)
            {
               _loc2_.setLineNum(3);
               _loc2_.upText = "";
               _loc2_.centerText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_EXP;
               _loc12_ = _loc2_.attachMovie("symbol_xp","symbol_xp",_loc2_.getNextHighestDepth());
               _loc12_._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc12_._y = _loc2_.center_txt._y;
               _loc12_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$101088") + " " + _loc2_.center_txt.htmlText,1);
            }
            else if(_loc2_.itemType == 4)
            {
               _loc2_.setLineNum(3);
               _loc2_.upText = "";
               _loc2_.centerText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
               _loc11_ = _loc2_.attachMovie("symbol_p","symbol_p",_loc2_.getNextHighestDepth());
               _loc11_._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc11_._y = _loc2_.center_txt._y;
               _loc11_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$101089") + " " + _loc2_.center_txt.htmlText,1);
            }
            else if(_loc2_.itemType == 5)
            {
               _loc2_.draw("img://__Icon_Items.ReputationXP_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc16_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.down_txt.textColor = 32511;
               }
               _loc11_ = _loc2_.attachMovie("symbol_rp_xp","symbol_rp_xp",_loc2_.getNextHighestDepth());
               _loc2_.down_txt._width = 123;
               _loc11_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc11_._y = _loc2_.down_txt._y;
               _loc11_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$102185") + " " + "<font color=\'#00B4FF\'>" + _loc2_.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + _loc2_.downTxt + "</font>",1);
            }
            else if(_loc2_.itemType == 6)
            {
               _loc2_.draw("img://__Icon_Items.ReputationPoint_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc16_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.down_txt.textColor = 32511;
               }
               _loc11_ = lib.util.DrawBitmap.makeMcAndDraw(_loc2_,"img://__Icon_Items.ReputationPointCoin");
               _loc2_.down_txt._width = 123;
               _loc11_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc11_._y = _loc2_.down_txt._y;
               _loc11_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$102186") + " " + "<font color=\'#00B4FF\'>" + _loc2_.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + _loc2_.downTxt + "</font>",1);
            }
            else if(_loc2_.itemType == 7)
            {
               _loc2_.draw("img://__Icon_Items.UnionPoint_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc16_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.down_txt.textColor = 32511;
               }
               _loc11_ = lib.util.DrawBitmap.makeMcAndDraw(_loc2_,"img://__Icon_Items.UnionPointCoin");
               _loc2_.down_txt._width = 123;
               _loc11_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc11_._y = _loc2_.down_txt._y;
               _loc11_.hitTestDisable = true;
            }
            else if(_loc2_.itemType == 8)
            {
               _loc2_.setLineNum(3);
               _loc2_.center_txt.htmlText = _loc16_[3];
               _loc2_.upText = "";
               _loc2_.center_txt._y = 10;
               _loc2_.center_txt._height = 40;
               _loc2_.center_txt.verticalAlign = "center";
               if(_loc2_.id == -1)
               {
                  _loc2_.up_txt.textColor = 46335;
                  lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.center_txt.htmlText,1);
               }
               else
               {
                  lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.id + "\t8",6,_loc2_.Slot.Icon);
               }
            }
            else
            {
               preViewEvent(_loc2_);
               _loc2_.setLineNum(2);
               if(_loc2_.downTxt > 0)
               {
                  _loc2_.downText = lib.util.UIString.getUIString("$181002","ItemCount",_loc2_.downTxt);
               }
               else
               {
                  _loc2_.downText = "";
               }
               lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.id + "\t" + _loc2_.itemType,6,_loc2_.Slot.Icon);
            }
            if(!(_loc2_.itemType == 5 || _loc2_.itemType == 6 || _loc2_.itemType == 7))
            {
               _loc2_.down_txt.textColor = 16777215;
            }
            if(_loc2_.useable != undefined)
            {
               _loc2_.impossible = Number(_loc2_.useable);
            }
            _loc7_ = _loc7_ + 1;
         }
         _loc8_ = dialog.slots2_mc._y + dialog.slots2_mc._height + btnYGap * 4;
      }
   }
   if(bRepeatRequitalComplete >= 0 && repayMoney > 0)
   {
      _loc17_ = 0;
      if(repayGoldType != undefined && repayGoldType != "" && repayGoldType != "undefined")
      {
         _loc17_ = Number(repayGoldType);
      }
      var _loc45_ = dialog.attachMovie("repay","repay_mc",dialog.getNextHighestDepth());
      _loc26_ = lib.util.GoldCurrency.SetGoldText(repayMoney,0,0,0,_loc17_);
      _loc45_.txt.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc26_ + "</font>";
      _loc45_._x = btnX + 10;
      _loc45_._y = _loc8_ + 3;
      _loc8_ = _loc8_ + (_loc45_._height + btnYGap + 3);
   }
   if(bSelectableRequitalComplete >= 0 && (selectableRequitalItemData != undefined && selectableRequitalItemData != ""))
   {
      var _loc29_ = dialog.attachMovie("bosang","bosang3",dialog.getNextHighestDepth());
      _loc29_.type.gotoAndStop(2);
      if(bSelectableRequitalComplete == 0)
      {
         if(selectableRequitalCompleteNum <= 0)
         {
            _loc29_.txt.text = lib.util.UIString.getUIString("$181017");
         }
         else
         {
            _loc29_.txt.text = lib.util.UIString.getUIString("$181012","count",selectableRequitalCompleteNum);
         }
      }
      else if(selectableRequitalCompleteNum <= 0)
      {
         _loc29_.txt.text = lib.util.UIString.getUIString("$181017") + completeStr;
      }
      else
      {
         _loc29_.txt.text = lib.util.UIString.getUIString("$181012","count",selectableRequitalCompleteNum) + completeStr;
      }
      _loc29_.txt.textAutoSize = "shrink";
      _loc29_._x = btnX - 2;
      _loc29_._y = _loc8_ + 10;
      _loc8_ = _loc8_ + (5 + _loc29_._height);
      var _loc42_ = dialog.attachMovie("guide","guide_select",dialog.getNextHighestDepth());
      _loc42_.txt.text = "[ " + lib.util.UIString.getUIString("$181015") + " ]";
      _loc42_._x = btnX;
      _loc42_._y = _loc8_ + 5;
      _loc8_ = _loc8_ + _loc42_._height;
      dialog.slots3_mc._y = _loc8_ + 10;
      var _loc22_ = selectableRequitalItemData.split("\n");
      if(_loc22_[_loc22_.length - 1] == "0" || _loc22_[_loc22_.length - 1] == "undefined" || _loc22_[_loc22_.length - 1] == "")
      {
         _loc22_.splice(_loc22_.length - 1,1);
      }
      if(_loc22_.length >= 1)
      {
         _loc7_ = 0;
         while(_loc7_ < _loc22_.length)
         {
            _loc16_ = _loc22_[_loc7_].split("\t");
            _loc2_ = selectRequitalItemList.add(_loc16_[0],"Slot4_link");
            _loc2_.guidNum_mc._visible = true;
            _loc2_.img = _loc16_[1];
            _loc15_ = Number(_loc16_[2]);
            _loc25_ = Number(_loc16_[4]);
            _loc10_ = "";
            if(_loc15_ > 0)
            {
               _loc10_ = "+" + _loc15_ + " " + _loc16_[3];
            }
            else
            {
               _loc10_ = _loc16_[3];
            }
            _loc2_.upTxt = _loc10_;
            _loc2_.downTxt = _loc25_;
            _loc2_.useable = _loc16_[5];
            _loc2_.itemType = _loc16_[6];
            _loc2_.grade = _loc16_[7];
            _loc2_.sealType = _loc16_[8];
            _loc2_.masterpiece = _loc16_[9];
            SetMultiply(_loc2_.multiply,Number(_loc16_[10]));
            if(_loc16_[6] == "2")
            {
               selectRequitalItemList.gold = 1;
            }
            _loc2_.draw(_loc2_.img);
            _loc2_.display = false;
            if(_loc2_.useable != undefined)
            {
               _loc2_.impossible = Number(_loc2_.useable);
            }
            _loc2_.upText = _loc2_.upTxt;
            lib.util.ExtString.textCut(_loc2_.up_txt,_loc2_.upTxt);
            _loc2_.sealType = _loc2_.sealType;
            _loc2_.masterpiece = _loc2_.masterpiece;
            if(_loc2_.itemType == 2)
            {
               _loc17_ = 0;
               if(_loc16_[11] != undefined && _loc16_[11] != "" && _loc16_[11] != "undefined")
               {
                  _loc17_ = Number(_loc16_[11]);
               }
               _loc2_.setLineNum(3);
               _loc2_.upText = "";
               _loc2_.center_txt.html = true;
               _loc26_ = lib.util.GoldCurrency.SetGoldText(_loc2_.downTxt,0,0,0,_loc17_);
               _loc2_.center_txt.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc26_ + "</font>";
               _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
               _loc2_.showMoney(false);
               _loc2_.money_mc._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc2_.money_mc._y = _loc2_.center_txt._y + 2;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$101087") + " " + _loc2_.center_txt.htmlText,1);
            }
            else if(_loc2_.itemType == 3)
            {
               _loc2_.setLineNum(3);
               _loc2_.upText = "";
               _loc2_.centerText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_EXP;
               _loc12_ = _loc2_.attachMovie("symbol_xp","symbol_xp",_loc2_.getNextHighestDepth());
               _loc12_._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc12_._y = _loc2_.center_txt._y;
               _loc12_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$101088") + " " + _loc2_.center_txt.htmlText,1);
            }
            else if(_loc2_.itemType == 4)
            {
               _loc2_.setLineNum(3);
               _loc2_.upText = "";
               _loc2_.centerText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_POLICYPOINT;
               _loc11_ = _loc2_.attachMovie("symbol_p","symbol_p",_loc2_.getNextHighestDepth());
               _loc11_._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc11_._y = _loc2_.center_txt._y;
               _loc11_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$101089") + " " + _loc2_.center_txt.htmlText,1);
            }
            else if(_loc2_.itemType == 5)
            {
               _loc2_.draw("img://__Icon_Items.ReputationXP_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc16_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.down_txt.textColor = 32511;
               }
               _loc11_ = _loc2_.attachMovie("symbol_rp_xp","symbol_rp_xp",_loc2_.getNextHighestDepth());
               _loc2_.down_txt._width = 123;
               _loc11_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc11_._y = _loc2_.down_txt._y;
               _loc11_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$102185") + " " + "<font color=\'#00B4FF\'>" + _loc2_.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + _loc2_.downTxt + "</font>",1);
            }
            else if(_loc2_.itemType == 6)
            {
               _loc2_.draw("img://__Icon_Items.ReputationPoint_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc16_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.down_txt.textColor = 32511;
               }
               _loc11_ = lib.util.DrawBitmap.makeMcAndDraw(_loc2_,"img://__Icon_Items.ReputationPointCoin");
               _loc2_.down_txt._width = 123;
               _loc11_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc11_._y = _loc2_.down_txt._y;
               _loc11_.hitTestDisable = true;
               lib.manager.ToolTip.add(_loc2_.SLOT,lib.util.UIString.getUIString("$102186") + " " + "<font color=\'#00B4FF\'>" + _loc2_.upTxt + "<font color=\'#7d7d7d\'>" + " / " + "<font color=\'#007EFF\'>" + _loc2_.downTxt + "</font>",1);
            }
            else if(_loc2_.itemType == 7)
            {
               _loc2_.draw("img://__Icon_Items.UnionPoint_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc16_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.down_txt.textColor = 32511;
               }
               _loc11_ = lib.util.DrawBitmap.makeMcAndDraw(_loc2_,"img://__Icon_Items.UnionPointCoin");
               _loc2_.down_txt._width = 123;
               _loc11_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc11_._y = _loc2_.down_txt._y;
               _loc11_.hitTestDisable = true;
            }
            else if(_loc2_.itemType == 8)
            {
               _loc2_.setLineNum(3);
               _loc2_.center_txt.htmlText = _loc16_[3];
               _loc2_.upText = "";
               _loc2_.center_txt._y = 10;
               _loc2_.center_txt._height = 40;
               _loc2_.center_txt.verticalAlign = "center";
               if(_loc2_.id == -1)
               {
                  lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.center_txt.htmlText,1);
               }
               else
               {
                  lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.id + "\t8",6,_loc2_.Slot.Icon);
               }
            }
            else
            {
               preViewEvent(_loc2_);
               _loc2_.setLineNum(2);
               if(_loc2_.downTxt > 0)
               {
                  _loc2_.downText = lib.util.UIString.getUIString("$181002","ItemCount",_loc2_.downTxt);
               }
               else
               {
                  _loc2_.downText = "";
               }
               lib.manager.ToolTip.add(_loc2_.SLOT,_loc2_.id + "\t" + _loc2_.itemType,6,_loc2_.Slot.Icon);
            }
            if(!(_loc2_.itemType == 5 || _loc2_.itemType == 6 || _loc2_.itemType == 7))
            {
               _loc2_.down_txt.textColor = 16777215;
            }
            _loc2_.drag = false;
            _loc7_ = _loc7_ + 1;
         }
         _loc8_ = dialog.slots3_mc._y + dialog.slots3_mc._height + btnYGap * 4;
      }
   }
   var _loc19_ = dialogBtnData.split("\n");
   if(_loc19_[_loc19_.length - 1] == "0" || _loc19_[_loc19_.length - 1] == "undefined" || _loc19_[_loc19_.length - 1] == "")
   {
      _loc19_.splice(_loc19_.length - 1,1);
   }
   if(_loc19_.length >= 1)
   {
      dialog.blet1_mc._visible = true;
      _loc7_ = 0;
      while(_loc7_ < _loc19_.length)
      {
         _loc16_ = _loc19_[_loc7_].split("\t");
         var btn = dialog.attachMovie("dialog_btn","dialog_btn" + dialog.getNextHighestDepth(),dialog.getNextHighestDepth());
         btn.stat = _loc7_;
         btn._y = _loc8_;
         _loc8_ = _loc8_ + (btn._height + btnYGap);
         btn._x = btnX;
         btn.id = _loc16_[0];
         btn.txt.text = _loc16_[1];
         btn.onRollOver = function()
         {
            this.gotoAndStop(2);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_OVER;
         };
         btn.onRollOut = btn.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_NORMAL;
            this.txt._y = 11;
         };
         btn.onPress = function()
         {
            this.gotoAndStop(3);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_PRESS;
            this.txt._y = 12;
         };
         btn.onRelease = function()
         {
            ToGame_QuestJournal_SelectBtn(this.id);
            this.txt.textColor = lib.info.TextColor.UI_VILLAGERDIALOG_BTN_OVER;
            this.txt._y = 11;
         };
         _loc7_ = _loc7_ + 1;
      }
   }
   dialogScrollBar.pageSize = dialog._height;
   if(currentPage == 0 && totalPage == 0 || currentPage == 1 && totalPage == 1)
   {
      prev_btn.setEnabled(false,100);
      next_btn.setEnabled(false,100);
   }
   else
   {
      if(currentPage >= 2)
      {
         prev_btn.setEnabled(true);
      }
      else
      {
         prev_btn.setEnabled(false,100);
      }
      if(currentPage < totalPage)
      {
         next_btn.setEnabled(true);
      }
      else
      {
         next_btn.setEnabled(false,100);
      }
   }
   prev_btn.setRelease(function()
   {
      ToGame_QuestJournal_RequestSetPage(currentPage - 1);
   }
   );
   next_btn.setRelease(function()
   {
      ToGame_QuestJournal_RequestSetPage(currentPage + 1);
   }
   );
   var _loc23_ = rewardTitles.split("\t");
   _loc7_ = 0;
   while(_loc7_ < 3)
   {
      if(_loc23_[_loc7_] != "" && _loc23_[_loc7_] != undefined)
      {
         dialog["bosang" + (4 - _loc7_)].txt.text = _loc23_[_loc7_];
      }
      _loc7_ = _loc7_ + 1;
   }
};
myListener.OnGame_QuestJournal_SetCharacterName = function(__name)
{
   lib.manager.UISkin.setInGameCharacterName(container_mc,__name);
};
var giveUp_btn = container_mc.txtBtn1.txtBtn;
var share_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var prev_btn = container_mc.txtBtn2.txtBtn;
var next_btn = container_mc.txtBtn3.txtBtn;
prev_btn.setEnabled(false,100);
next_btn.setEnabled(false,100);
giveUp_btn.setEnabled(false);
share_btn.setEnabled(false);
share_btn.setVisible(false);
var reputation_btn = container_mc.reputation_mc.reputation_gage_mc.btn1.txtBtn;
learn_btn.setRelease(sendBack);
giveUp_btn.setRelease(giveUp);
close_btn.setRelease(closeUI);
x_btn.setRelease(closeUI);
share_btn.setRelease(share);
reputation_btn.setRelease(reputation_set);
var tab = container_mc.tabBtn.tab;
tab.setRelease(release);
tab.setTab(0,1);
container_mc.numberSteper.setPage(1,1);
container_mc.darkBgMc._visible = false;
fscommand("ToGame_QuestJournal_Init");
