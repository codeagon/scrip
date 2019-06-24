function ToGame_GroupDuel_Init()
{
   fscommand("ToGame_GroupDuel_Init");
}
function ToGame_GroupDuel_CloseUI()
{
   fscommand("ToGame_GroupDuel_CloseUI");
}
function ToGame_GroupDuel_SwapElement(teamIndex1, slotIndex1, teamIndex2, slotIndex2)
{
   getURL("FSCommand:ToGame_GroupDuel_SwapElement",teamIndex1 + "\t" + slotIndex1 + "\t" + teamIndex2 + "\t" + slotIndex2);
}
function ToGame_GroupDuel_ToggleSlot(teamIndex, slotIndex, isNewStateOpen)
{
   getURL("FSCommand:ToGame_GroupDuel_ToggleSlot",teamIndex + "\t" + slotIndex + "\t" + isNewStateOpen);
}
function ToGame_GroupDuel_ToggleReady()
{
   fscommand("ToGame_GroupDuel_ToggleReady");
}
function ToGame_GroupDuel_Propaganda()
{
   var _loc1_ = getTimer();
   if(_loc1_ - prTimer >= LIMTPRTIME)
   {
      prTimer = _loc1_;
      fscommand("ToGame_GroupDuel_Propaganda");
   }
}
function ToGame_GroupDuel_Bet()
{
   fscommand("ToGame_GroupDuel_Bet");
}
function ToGame_GroupDuel_Exit()
{
   fscommand("ToGame_GroupDuel_Exit");
}
function ToGame_GroupDuel_Create()
{
   fscommand("ToGame_GroupDuel_Create");
}
function ToGame_GroupDuel_remove(indexA, indexB)
{
   getURL("FSCommand:ToGame_GroupDuel_remove",indexA + "\t" + indexB);
}
function ToGame_GroupDuel_ChangeRepresent(temaIndex, index)
{
   getURL("FSCommand:ToGame_GroupDuel_ChangeRepresent",temaIndex + "\t" + index);
}
function upDateList()
{
   dragSlotMc.removeMovieClip();
   isChangedSlot = false;
   gs.TweenLite.killTweensOf(copyMc0,false);
   gs.TweenLite.killTweensOf(copyMc1,false);
   copyMc0.removeMovieClip();
   copyMc1.removeMovieClip();
   clearList();
   var _loc4_ = MEMBERCOUNT * TEAMCOUNT;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = int(_loc1_ / MEMBERCOUNT);
      var _loc3_ = int(_loc1_ % MEMBERCOUNT);
      addList(groupData[_loc2_][_loc3_]);
      _loc1_ = _loc1_ + 1;
   }
}
function clearList()
{
   var _loc3_ = 0;
   while(_loc3_ < TEAMCOUNT)
   {
      var _loc1_ = 0;
      while(_loc1_ < MEMBERCOUNT)
      {
         var _loc2_ = container_mc[SLOTNAMETAG + "_" + _loc3_ + "_" + _loc1_];
         clearSlot(_loc2_);
         _loc1_ = _loc1_ + 1;
      }
      _loc3_ = _loc3_ + 1;
   }
}
function changeMembers(teamIndex0, index0, teamIndex1, index1)
{
   var _loc2_ = container_mc[SLOTNAMETAG + "_" + teamIndex0 + "_" + index0];
   var _loc1_ = container_mc[SLOTNAMETAG + "_" + teamIndex1 + "_" + index1];
   _loc2_._visible = false;
   _loc1_._visible = false;
   gs.TweenLite.killTweensOf(copyMc0,false);
   gs.TweenLite.killTweensOf(copyMc1,false);
   copyMc0 = _loc2_.duplicateMovieClip("copyMc0",container_mc.getNextHighestDepth());
   copyMc1 = _loc1_.duplicateMovieClip("copyMc1",container_mc.getNextHighestDepth());
   cloneSlot(_loc2_,copyMc0);
   cloneSlot(_loc1_,copyMc1);
   if(imJJang)
   {
      copyMc0._x = _loc1_._x;
      copyMc0._y = _loc1_._y;
      pushAni(copyMc0,_loc1_);
      fullAni(copyMc1,_loc2_);
   }
   else
   {
      changePosition(copyMc0,copyMc1);
   }
}
function changePosition(slot0, slot1)
{
   var _loc6_ = slot0._x;
   var _loc4_ = slot1._y < slot0._y?slot0._y - slot0._height / 2:slot0._y + slot0._height / 2;
   var _loc5_ = slot1._x;
   var _loc3_ = slot0._y < slot1._y?slot1._y - slot1._height / 2:slot1._y + slot1._height / 2;
   var _loc10_ = slot1._x;
   var _loc8_ = slot1._y;
   var _loc9_ = slot0._x;
   var _loc7_ = slot0._y;
   gs.TweenLite.to(slot0,PFSPEED,{_x:_loc6_,_y:_loc4_,ease:gs.easing.Back.easeOut,onComplete:onChTween,onCompleteParams:[slot0,_loc10_,_loc8_]});
   gs.TweenLite.to(slot1,PFSPEED,{_x:_loc5_,_y:_loc3_,ease:gs.easing.Back.easeOut,onComplete:onChTween,onCompleteParams:[slot1,_loc9_,_loc7_]});
}
function onChTween(selectMc, x, y)
{
   gs.TweenLite.to(selectMc,SPEED,{_x:x,_y:y,ease:gs.easing.Strong.easeOut,onComplete:onEndChTween,onCompleteParams:[selectMc]});
}
function onEndChTween(selectMc)
{
   selectMc.removeMovieClip();
   upDateList();
}
function addList(slotData)
{
   var slotMc = container_mc[SLOTNAMETAG + "_" + slotData[0] + "_" + slotData[1]];
   slotMc._visible = true;
   slotMc.enabled = true;
   slotMc.hit.enabled = true;
   slotMc.userName = slotData[0] + "_" + slotData[1];
   openSlot(slotMc,Number(slotData[7]));
   delete slotMc.hit.onRollOver;
   delete slotMc.hit.onRollOut;
   delete slotMc.hit.onReleaseOutside;
   slotMc.leaderBtn._visible = Number(slotData[7]) && slotData[3] != "";
   if(Number(slotData[7]) == 0)
   {
      slotMc.hit.onPress = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         var _loc2_ = this._parent.userName.split("_");
         ToGame_GroupDuel_ToggleSlot(_loc2_[0],_loc2_[1],1);
         slotMc.readyMc.btn.gotoAndStop(3);
      };
      slotMc.hit.onRelease = function()
      {
         slotMc.readyMc.btn.gotoAndStop(1);
      };
      slotMc.hit.onRollOver = function()
      {
         slotMc.readyMc.btn.gotoAndStop(2);
      };
      slotMc.hit.onRollOut = function()
      {
         slotMc.readyMc.btn.gotoAndStop(1);
      };
      slotMc.readyMc.btn.onPress = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         var _loc2_ = this._parent._parent.userName.split("_");
         ToGame_GroupDuel_ToggleSlot(_loc2_[0],_loc2_[1],1);
         this.gotoAndStop(3);
      };
      slotMc.readyMc.btn.onRelease = slotMc.readyMc.btn.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      slotMc.readyMc.btn.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      slotMc.readyMc.btn.onRollOut = function()
      {
         this.gotoAndStop(1);
      };
      return undefined;
   }
   if(slotData[3] == "")
   {
      slotMc.hit.onPress = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         var _loc2_ = this._parent.userName.split("_");
         ToGame_GroupDuel_ToggleSlot(_loc2_[0],_loc2_[1],0);
         slotMc.readyMc.btn.gotoAndStop(3);
      };
      slotMc.hit.onRelease = function()
      {
         slotMc.readyMc.btn.gotoAndStop(1);
      };
      slotMc.hit.onRollOver = function()
      {
         slotMc.readyMc.btn.gotoAndStop(2);
      };
      slotMc.hit.onRollOut = function()
      {
         slotMc.readyMc.btn.gotoAndStop(1);
      };
      slotMc.readyMc.btn.onPress = function()
      {
         lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
         var _loc2_ = this._parent._parent.userName.split("_");
         ToGame_GroupDuel_ToggleSlot(_loc2_[0],_loc2_[1],0);
         this.gotoAndStop(3);
      };
      slotMc.readyMc.btn.onRelease = slotMc.readyMc.btn.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      slotMc.readyMc.btn.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      slotMc.readyMc.btn.onRollOut = function()
      {
         this.gotoAndStop(1);
      };
      return undefined;
   }
   readySlot(slotMc,Number(slotData[2]));
   classSlot(slotMc,Number(slotData[5]));
   slotMc.txt0.text = "$171026";
   slotMc.txt1.text = slotData[3];
   slotMc.txt2.setText(slotData[4]);
   slotMc.txt3.setText(slotData[6]);
   if(slotData[5] == undefined)
   {
      slotMc.classMc._visible = false;
   }
   else
   {
      slotMc.classMc._visible = true;
      slotMc.classMc.gotoAndStop(Number(slotData[5]) + 1);
   }
   slotMc.hit.onPress = function()
   {
      if(enableSwap && imJJang)
      {
         startDragSlot(this._parent);
         Mouse.addListener(mouseListner);
      }
   };
   slotMc.leaderBtn.isToggle = false;
   slotMc.leaderBtn.checked = Boolean(Number(slotData[8]));
   slotMc.leaderBtn.enabled = imJJang;
   if(jjangMc == slotMc)
   {
      slotMc.readyMc.gotoAndStop(3);
   }
   slotMc.leaderBtn.onChanged = function(checked)
   {
      var _loc2_ = this._parent.userName.split("_");
      ToGame_GroupDuel_ChangeRepresent(_loc2_[0],_loc2_[1]);
   };
   slotMc.hit.onRollOver = function()
   {
      this._parent.slotBg.gotoAndStop(2);
   };
   slotMc.hit.onRollOut = slotMc.hit.onReleaseOutside = function()
   {
      this._parent.slotBg.gotoAndStop(4);
   };
   lib.util.InteractionGroup.addInteraction(UIname,slotData[6],slotMc.txt100);
}
function cloneSlot(slotMc, targetMc)
{
   targetMc.txt0.text = slotMc.txt0.text;
   targetMc.txt1.text = slotMc.txt1.text;
   targetMc.txt2.text = slotMc.txt2.text;
   targetMc.txt3.text = slotMc.txt3.text;
   targetMc.userName = slotMc.userName;
   targetMc.readyMc.gotoAndStop(slotMc.readyMc._currentframe);
   targetMc.classMc.gotoAndStop(slotMc.classMc._currentframe);
   targetMc.classMc._visible = slotMc.classMc._visible;
   targetMc.leaderBtn._visible = slotMc.leaderBtn._visible;
   targetMc.leaderBtn.enabled = slotMc.leaderBtn.enabled;
   targetMc.leaderBtn.tempCheck = slotMc.leaderBtn.checked;
   targetMc.leaderBtn.onLoad = function()
   {
      targetMc.leaderBtn.checked = this.tempCheck;
   };
   slotMc.enabled = false;
   slotMc.hit.enabled = false;
   slotMc.leaderBtn.enabled = false;
   targetMc.jjangMc.removeMovieClip();
   if(slotMc.jjangMc)
   {
      targetMc.attachMovie("jjang","jjangMc",slotMc.getNextHighestDepth());
   }
}
function itemClear()
{
   var _loc2_ = 0;
   while(_loc2_ < 8)
   {
      var _loc1_ = container_mc["groupduelItem__" + _loc2_];
      _loc1_.SLOT.enabled = false;
      _loc1_.impossible = false;
      _loc1_.clear();
      lib.manager.ToolTip.remove(_loc1_.SLOT);
      _loc2_ = _loc2_ + 1;
   }
}
function clearSlot(slotMc)
{
   slotMc.txt0.text = "";
   slotMc.txt1.text = "";
   slotMc.txt2.setText("");
   slotMc.txt3.setText("");
   slotMc.classMc._visible = false;
   slotMc.userName = undefined;
   slotMc.readyMc.gotoAndStop(1);
   slotMc.leaderBtn._visible = false;
   slotMc.leaderBtn.checked = false;
   setSlotState(slotMc,0);
   delete slotMc.hit.onPress;
}
function openSlot(slotMc, isOpen)
{
   slotMc.isOpne = isOpen;
   if(!isOpen)
   {
      slotMc.readyMc.gotoAndStop(5);
      setSlotState(slotMc,4);
   }
   else
   {
      slotMc.readyMc.gotoAndStop(4);
      setSlotState(slotMc,0);
   }
}
function readySlot(slotMc, isReady)
{
   if(isReady)
   {
      slotMc.readyMc.gotoAndStop(2);
      slotMc.txt0.textColor = 9429087;
      slotMc.txt1.textColor = 9429087;
      slotMc.txt2.textColor = 9429087;
      slotMc.txt3.textColor = 9429087;
   }
   else
   {
      slotMc.readyMc.gotoAndStop(1);
      slotMc.txt0.textColor = 14145495;
      slotMc.txt1.textColor = 14145495;
      slotMc.txt2.textColor = 14145495;
      slotMc.txt3.textColor = 14145495;
   }
}
function classSlot(slotMc, _class)
{
   slotMc.classMc._visible = true;
   slotMc.classMc.gotoAndStop(Number(_class) + 1);
}
function startDragSlot(slotMc)
{
   dragTargetUserName = slotMc.userName;
   dragTargetMc = slotMc;
   var _loc2_ = slotMc._name.split("_");
   dragSlotMc = slotMc.duplicateMovieClip("gDDragMc_" + _loc2_[1] + "_" + _loc2_[2],container_mc.getNextHighestDepth());
   cloneSlot(slotMc,dragSlotMc);
   dragSlotMc.startDrag();
   setSlotState(slotMc,1);
   setSlotState(dragSlotMc,3);
}
function dragDropSlot()
{
   dragSlotMc.stopDrag();
   var _loc8_ = dragSlotMc._droptarget;
   var _loc4_ = _loc8_.split("/");
   _loc4_.pop();
   var _loc7_ = _loc4_.pop();
   var _loc2_ = container_mc[_loc7_];
   if(dragTargetMc == undefined || dragTargetMc == _loc2_)
   {
      dragTargetMc.enabled = true;
      dragTargetMc.leaderBtn.setEnabled(imJJang);
      setSlotState(dragTargetMc,0);
      dragSlotMc.removeMovieClip();
      dragSlotMc = undefined;
      dragTargetMc.hit.enabled = true;
      dragTargetUserName = undefined;
      dragTargetMc = undefined;
      return undefined;
   }
   var _loc5_ = _loc2_._name.split("_");
   var _loc9_ = _loc5_[0];
   var _loc11_ = _loc5_[1];
   var _loc10_ = _loc5_[2];
   if(_loc9_ == SLOTNAMETAG)
   {
      setSlotState(_loc2_,2);
      if(_loc2_.userName == undefined)
      {
         var _loc6_ = dragSlotMc._name.split("_");
         var _loc3_ = _loc2_._name.split("_");
         dragSlotMc.removeMovieClip();
         ToGame_GroupDuel_SwapElement(_loc6_[1],_loc6_[2],_loc3_[1],_loc3_[2]);
      }
      else
      {
         _loc6_ = dragSlotMc._name.split("_");
         _loc3_ = _loc2_._name.split("_");
         dragSlotMc.removeMovieClip();
         ToGame_GroupDuel_SwapElement(_loc6_[1],_loc6_[2],_loc3_[1],_loc3_[2]);
      }
   }
   else if(hit.hitTest(_root._xmouse,_root._ymouse) || dragTargetMc == jjangMc)
   {
      moveAni(dragSlotMc,dragTargetMc,2);
   }
   else
   {
      dragSlotMc.removeMovieClip();
      dragSlotMc = undefined;
      dragTargetUserName = undefined;
      _loc5_ = dragTargetMc._name.split("_");
      ToGame_GroupDuel_remove(_loc5_[1],_loc5_[2]);
      dragTargetMc = undefined;
   }
}
function setSlotState(slotMc, _state)
{
   if(_state == 0)
   {
      slotMc._alpha = 100;
      slotMc.slotBg.gotoAndStop(4);
   }
   else if(_state == 1)
   {
      slotMc._alpha = 30;
      slotMc.slotBg.gotoAndStop(2);
   }
   else if(_state == 2)
   {
      slotMc._alpha = 50;
      slotMc.slotBg.gotoAndStop(2);
   }
   else if(_state == 3)
   {
      slotMc._alpha = 100;
      slotMc.slotBg.gotoAndStop(3);
   }
   else if(_state == 4)
   {
      slotMc._alpha = 100;
      slotMc.slotBg.gotoAndStop(1);
   }
}
function moveAni(selectMc, targetMc, flag)
{
   var _loc3_ = targetMc._x;
   var _loc2_ = targetMc._y;
   isMoving = true;
   gs.TweenLite.to(selectMc,SPEED,{_x:_loc3_,_y:_loc2_,ease:gs.easing.Strong.easeOut,onComplete:onFinishTween,onCompleteParams:[selectMc,targetMc,flag]});
}
function pushAni(selectMc, targetMc, flag)
{
   var _loc4_ = targetMc._x;
   var _loc3_ = targetMc._y <= dragTargetMc._y?targetMc._y - targetMc._height / 2:targetMc._y + targetMc._height / 2;
   isMoving = true;
   selectMc._x = _loc4_;
   gs.TweenLite.to(selectMc,PFSPEED,{_y:_loc3_,ease:gs.easing.Back.easeOut,onComplete:onPfFinishTween,onCompleteParams:[selectMc,targetMc,flag]});
}
function inputMember(selectMc)
{
   var _loc1_ = selectMc._y - 20;
   gs.TweenLite.from(selectMc,PFSPEED,{_y:_loc1_,ease:gs.easing.Back.easeOut});
}
function fullAni(selectMc, targetMc, flag)
{
   var _loc3_ = selectMc._x;
   var _loc2_ = targetMc._y < selectMc._y?selectMc._y - selectMc._height / 2:selectMc._y + selectMc._height / 2;
   isMoving = true;
   gs.TweenLite.to(selectMc,PFSPEED,{_x:_loc3_,_y:_loc2_,ease:gs.easing.Back.easeOut,onComplete:onPfFinishTween,onCompleteParams:[selectMc,targetMc,flag]});
}
function onPfFinishTween(selectMc, targetMc, flag)
{
   moveAni(selectMc,targetMc,flag);
}
function onFinishTween(selectMc, targetMc, flag)
{
   selectMc.removeMovieClip();
   upDateList();
}
function getSlot(userName)
{
   var _loc3_ = 0;
   while(_loc3_ < TEAMCOUNT)
   {
      var _loc1_ = 0;
      while(_loc1_ < MEMBERCOUNT)
      {
         var _loc4_ = String(_loc3_) + String(_loc1_);
         var _loc2_ = container_mc[SLOTNAMETAG + "_" + _loc4_];
         if(_loc2_.userName == userName)
         {
            return _loc2_;
         }
         _loc1_ = _loc1_ + 1;
      }
      _loc3_ = _loc3_ + 1;
   }
   return undefined;
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "GroupDuel";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.abet.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.bbet.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.mybet.textColor = lib.info.TextColor.GENERAL_MONEY;
container_mc.totalbet.textColor = lib.info.TextColor.GENERAL_MONEY;
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
         UI._visible = false;
      }
      if(UI._visible == false)
      {
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
   container_mc.ToolTip._visible = bShow;
};
var TEAMA = "$171007";
var TEAMB = "$171008";
var RESULTSTR = ["$171009","$171010","$171011","$171012"];
var TEAMCOUNT = 2;
var MEMBERCOUNT = 10;
var SLOTNAMETAG = "groupDuelSlot";
var SPEED = 0.3;
var PFSPEED = 0.2;
var LIMTPRTIME = 1000;
var A_TEAMNAME = "$171007";
var B_TEAMNAME = "$171008";
var waitObj = {};
var changedSlotObj = {};
container_mc.teamAName.text = A_TEAMNAME;
container_mc.teamBName.text = B_TEAMNAME;
var dragSlotMc;
var dragTargetUserName;
var dragTargetMc;
var jjangMc;
var imReady = false;
var imJJang = false;
var enableSwap = false;
var isMoving = false;
var prTimer = getTimer();
var represent = [];
var duelData;
var groupData = [];
groupData[0] = [];
groupData[1] = [];
var copyMc0;
var copyMc1;
container_mc.resut.htmlText = "<img src=\'icon_notice\' vspace=\'-0\'> " + lib.util.UIString.getUIString("$171014");
myListener.OnGame_GroupDuel_AddElement = function(_data)
{
   var _loc5_ = lib.util.ExtString.split(_data,"\n");
   var _loc6_ = _loc5_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc6_)
   {
      var _loc1_ = lib.util.ExtString.split(_loc5_[_loc2_],"\t");
      var _loc3_ = _loc1_[0];
      var _loc4_ = _loc1_[1];
      groupData[_loc3_][_loc4_] = _loc1_;
      _loc2_ = _loc2_ + 1;
   }
   upDateList();
};
myListener.OnGame_GroupDuel_DeleteElement = function(teamIndex, slotIndex)
{
   groupData[teamIndex][slotIndex] = undefined;
   upDateList();
};
myListener.OnGame_GroupDuel_SetData = function(_data, changedTindex0, memberIndex0, changedTindex1, memberIndex1)
{
   if(changedTindex0 != undefined && memberIndex0 != undefined && changedTindex1 != undefined && memberIndex1 != undefined)
   {
      isChangedSlot = true;
      changeMembers(changedTindex0,memberIndex0,changedTindex1,memberIndex1);
   }
   else if(changedTindex0 != undefined && memberIndex0 != undefined)
   {
      inputMember(container_mc[SLOTNAMETAG + "_" + changedTindex0 + "_" + memberIndex0]);
   }
   var _loc5_ = lib.util.ExtString.split(_data,"\n");
   var _loc6_ = _loc5_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc6_)
   {
      var _loc1_ = lib.util.ExtString.split(_loc5_[_loc2_],"\t");
      var _loc3_ = _loc1_[0];
      var _loc4_ = _loc1_[1];
      groupData[_loc3_][_loc4_] = _loc1_;
      _loc2_ = _loc2_ + 1;
   }
   if(!isChangedSlot)
   {
      upDateList();
   }
   isChangedSlot = false;
};
myListener.OnGame_GroupDuel_ClearData = function()
{
   groupData[0] = [];
   groupData[1] = [];
   upDateList();
   container_mc.resultMc._visible = false;
   itemClear();
};
myListener.OnGame_GroupDuel_SetReady = function(teamIndex, slotIndex, ready, you)
{
   if(Number(you))
   {
      imReady = Number(ready);
      if(Number(ready))
      {
         ready_btn.txt.setText("$171003");
      }
      else
      {
         ready_btn.txt.setText("$171004");
      }
   }
   var _loc1_ = container_mc[SLOTNAMETAG + "_" + teamIndex + "_" + slotIndex];
   readySlot(_loc1_,Number(ready));
};
myListener.OnGame_GroupDuel_SetMaster = function(teamIndex, slotIndex, youAreMaster)
{
   imJJang = Number(youAreMaster);
   if(Number(youAreMaster))
   {
      create_btn.txt.setText("$171006");
      ready_btn.txt.setText("$171005");
   }
   else
   {
      create_btn.txt.setText("$171002");
   }
   create_btn.setEnabled(Number(youAreMaster));
   if(jjangMc.readyMc._currentframe == 3)
   {
      jjangMc.readyMc.gotoAndStop(1);
   }
   var _loc3_ = container_mc[SLOTNAMETAG + "_" + teamIndex + "_" + slotIndex];
   jjangMc = _loc3_;
   jjangMc.readyMc.gotoAndStop(3);
   jjangMc.txt0.textColor = 9429087;
   jjangMc.txt1.textColor = 9429087;
   jjangMc.txt2.textColor = 9429087;
   jjangMc.txt3.textColor = 9429087;
   var _loc4_ = 0;
   while(_loc4_ < TEAMCOUNT)
   {
      var _loc2_ = 0;
      while(_loc2_ < MEMBERCOUNT)
      {
         _loc3_ = container_mc[SLOTNAMETAG + "_" + _loc4_ + "_" + _loc2_];
         _loc3_.leaderBtn.enabled = imJJang;
         _loc3_.leaderBtn.onLoad = function()
         {
            this.enabled = imJJang;
         };
         _loc2_ = _loc2_ + 1;
      }
      _loc4_ = _loc4_ + 1;
   }
};
myListener.OnGame_GroupDuel_SetWinOrLose = function(leftTeamState, rightTeamState)
{
   trace(leftTeamState + "   /   " + rightTeamState);
   container_mc.resultA.gotoAndStop(Number(leftTeamState) + 2);
   container_mc.resultB.gotoAndStop(Number(rightTeamState) + 2);
   if(leftTeamState == 4)
   {
      container_mc.resultA.gotoAndStop(1);
   }
   if(rightTeamState == 4)
   {
      container_mc.resultB.gotoAndStop(1);
   }
};
myListener.OnGame_GroupDuel_SetWinningCondition = function(_data)
{
   container_mc.winningCondition.text = _data;
};
myListener.OnGame_GroupDuel_SetBettingData = function(team1, team2, goldType)
{
   if(goldType == undefined || goldType == "undefined" || goldType == "")
   {
      goldType = 0;
   }
   var _loc2_ = lib.util.GoldCurrency.SetGoldText(team1,0,0,0,goldType);
   var _loc3_ = lib.util.GoldCurrency.SetGoldText(team2,0,0,0,goldType);
   container_mc.abet.htmlText = _loc2_;
   container_mc.bbet.htmlText = _loc3_;
};
myListener.OnGame_GroupDuel_SetMyBettingData = function(my, total, goldType)
{
   if(goldType == undefined || goldType == "undefined" || goldType == "")
   {
      goldType = 0;
   }
   var _loc2_ = lib.util.GoldCurrency.SetGoldText(my,0,0,0,goldType);
   var _loc3_ = lib.util.GoldCurrency.SetGoldText(total,0,0,0,goldType);
   container_mc.mybet.htmlText = _loc2_;
   container_mc.totalbet.htmlText = _loc3_;
};
myListener.OnGame_GroupDuel_SetItemBettingData = function(itemList)
{
   itemClear();
   var _loc5_ = lib.util.ExtString.split(itemList,"\n");
   var _loc4_ = 0;
   while(_loc4_ < _loc5_.length)
   {
      var _loc2_ = lib.util.ExtString.split(_loc5_[_loc4_],"\t");
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         var _loc1_ = container_mc["groupduelItem__" + _loc2_[0]];
         _loc1_.index = _loc2_[0];
         _loc1_.draw(_loc2_[1]);
         _loc1_.grade = _loc2_[5];
         _loc1_.sealType = _loc2_[6];
         _loc1_.masterpiece = _loc2_[7];
         lib.manager.ToolTip.add(_loc1_.SLOT,_loc1_.index,6,_loc1_.Icon);
         if(Number(_loc2_[3]) == 1 && _loc2_[2] > 1)
         {
            _loc1_.num = _loc2_[2];
         }
         else
         {
            _loc1_.num = "";
         }
         _loc1_.impossible = Number(info[4]);
         _loc3_ = _loc3_ + 1;
      }
      _loc4_ = _loc4_ + 1;
   }
};
myListener.OnGame_GroupDuel_SetEnableCreationButton = function(enable)
{
   create_btn.setEnabled(Number(enable));
};
myListener.OnGame_GroupDuel_SetEnableSwapElement = function(enable)
{
   enableSwap = Number(enable);
   var _loc3_ = 0;
   while(_loc3_ < TEAMCOUNT)
   {
      var _loc1_ = 0;
      while(_loc1_ < MEMBERCOUNT)
      {
         var _loc2_ = container_mc[SLOTNAMETAG + "_" + _loc3_ + "_" + _loc1_];
         _loc2_.leaderBtn.enabled = enableSwap && imJJang;
         _loc2_._alpha = !enableSwap?30:100;
         _loc1_ = _loc1_ + 1;
      }
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_GroupDuel_SetEnableBettingButton = function(enable)
{
   bet_btn.setEnabled(Number(enable));
};
myListener.OnGame_GroupDuel_SetEnableReadyButton = function(enable)
{
   ready_btn.setEnabled(Number(enable));
};
myListener.OnGame_GroupDuel_SetEnablePropagandaButton = function(enable)
{
   propaganda_btn.setEnabled(Number(enable));
};
myListener.OnGame_GroupDuel_SetEnableExitButton = function(enable)
{
   exit_btn.setEnabled(Number(enable));
};
myListener.OnGame_GroupDuel_SetEnableAllUI = function(enable)
{
   create_btn.setEnabled(Number(enable));
   bet_btn.setEnabled(Number(enable));
   ready_btn.setEnabled(Number(enable));
   propaganda_btn.setEnabled(Number(enable));
   exit_btn.setEnabled(Number(enable));
   myListener.OnGame_GroupDuel_SetEnableSwapElement(enable);
};
myListener.OnGame_GroupDuel_SetReadyAll = function(ready)
{
   var _loc3_ = 0;
   while(_loc3_ < TEAMCOUNT)
   {
      var _loc1_ = 0;
      while(_loc1_ < MEMBERCOUNT)
      {
         var _loc2_ = container_mc[SLOTNAMETAG + "_" + _loc3_ + "_" + _loc1_];
         if(_loc2_.readyMc._currentframe <= 2)
         {
            readySlot(_loc2_,Number(ready));
         }
         _loc1_ = _loc1_ + 1;
      }
      _loc3_ = _loc3_ + 1;
   }
   if(Number(imJJang))
   {
      return undefined;
   }
   if(Number(ready))
   {
      ready_btn.txt.seText("$171003");
   }
   else
   {
      ready_btn.txt.setText("$171004");
   }
};
myListener.OnGame_GroupDuel_ChangedSlot = function(teamIndex0, index0, teamIdex1, index1)
{
   isChangedSlot = true;
   changeMembers(teamIndex0,index0,teamIdex1,index1);
};
var mouseListner = {};
mouseListner.onMouseUp = function()
{
   Mouse.removeListener(mouseListner);
   dragDropSlot();
};
mouseListner.onMouseMove = function()
{
   for(var _loc1_ in container_mc)
   {
      if(!(dragTargetMc == container_mc[_loc1_] || dragSlotMc == container_mc[_loc1_]))
      {
         if(container_mc[_loc1_].hit.hitTest(_level0._xmouse,_level0._ymouse))
         {
            container_mc[_loc1_].slotBg.gotoAndStop(2);
         }
         else if(container_mc[_loc1_].isOpne)
         {
            container_mc[_loc1_].slotBg.gotoAndStop(4);
         }
         else
         {
            container_mc[_loc1_].slotBg.gotoAndStop(1);
         }
      }
   }
};
var create_btn = container_mc.createBtn.txtBtn;
var bet_btn = container_mc.betBtn.txtBtn;
var ready_btn = container_mc.txtBtn1.txtBtn;
var propaganda_btn = container_mc.txtBtn0.txtBtn;
var exit_btn = container_mc.txtBtn2.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
close_btn.setRelease(ToGame_GroupDuel_CloseUI);
create_btn.setRelease(ToGame_GroupDuel_Create);
bet_btn.setRelease(ToGame_GroupDuel_Bet);
ready_btn.setRelease(ToGame_GroupDuel_ToggleReady);
propaganda_btn.setRelease(ToGame_GroupDuel_Propaganda);
exit_btn.setRelease(ToGame_GroupDuel_Exit);
x_btn.setRelease(ToGame_GroupDuel_CloseUI);
myListener.OnGame_GroupDuel_ClearData();
ToGame_GroupDuel_Init();
