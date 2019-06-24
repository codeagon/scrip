var UI = this;
UI._visible = false;
var UIname = "CommunityWindow";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIname,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.blockList.defaultStr.setText(lib.util.UIString.getUIString("$111039"));
container_mc.blockList.defaultStr.textColor = lib.info.TextColor.GENERAL_DISABLE;
var LINENAME = "line";
var LINECOUNT = 16;
var POPTIMER = 24;
var onlyOnlineFriendsStr = lib.util.UIString.getUIString("$111005");
var amIGuildMaster = false;
var clickMemberLine = null;
var clickMemberGroup = null;
var hasJoinMember = false;
var selectFriendMc;
var selectBlockMc;
var NameTextLength_Local1 = 18;
var NameTextLength_Local2 = 38;
var NameTextLength_Local3 = 30;
var CATE_TIP = lib.util.UIString.getUIString("$111077");
var INPUT_STR0 = lib.util.UIString.getUIString("$111078");
var CLOSENES_STR0 = lib.util.UIString.getUIString("$111079");
var CLOSENES_STR1 = lib.util.UIString.getUIString("$111080");
var INVITE_BTN = lib.util.UIString.getUIString("$111108");
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
         container_mc.tabBtn.tabBtn3.labelFd._visible = false;
      }
      else
      {
         lib.util.InteractionGroup.delInteraction(UIname);
         historySave_All();
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
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
var myStateNames = ["$111053","$111054"];
container_mc.friendList.myStateCb.data = myStateNames;
var myStateObj = {};
var myStateIconMc = container_mc.friendList.myStateCb.createEmptyMovieClip("myStateIconMc",container_mc.getNextHighestDepth());
myStateIconMc._x = 7;
myStateIconMc._y = 7;
myStateObj.onChanged = function(target, id, index)
{
   var _loc1_ = "stateIcon" + index;
   myStateIconMc.clear();
   var _loc2_ = flash.display.BitmapData.loadBitmap(_loc1_);
   myStateIconMc.attachBitmap(_loc2_,1);
   ToGame_CommunityWindow_MyState(index);
};
container_mc.friendList.myStateCb.addListener(myStateObj);
myListener.OnGame_CommunityWindow_MyState = function(stateIndex)
{
   container_mc.friendList.myStateCb.setSelectedIndex(Number(stateIndex));
   var _loc1_ = "stateIcon" + stateIndex;
   myStateIconMc.clear();
   var _loc2_ = flash.display.BitmapData.loadBitmap(_loc1_);
   myStateIconMc.attachBitmap(_loc2_,1);
};
myListener.OnGame_CommunityWindow_SetTab = function(idx)
{
   tab.setTab(Number(idx),1);
};
myListener.OnGame_CommunityWindow_MyState(0);
myListener.OnGame_CommunityWindow_SetGroupUpDate = function(index, str)
{
   var _loc1_ = container_mc.friendList.container["group" + index];
   _loc1_.txt.setText(str);
   var _loc2_ = _loc1_.txt.textWidth;
   _loc1_.txt1._x = _loc2_ + 35;
};
var myInputTxt = new lib.util.ExtTextField(container_mc.friendList.txt_1,0,container_mc.friendList.txt_1_focus);
myInputTxt.onSetFocusEvent = function()
{
   var _loc1_ = container_mc.friendList.txt_1.sourceStr;
   if(_loc1_ == "undefined" || _loc1_ == null)
   {
      _loc1_ = "";
   }
   var _loc2_ = _loc1_.length;
   container_mc.friendList.txt_1.text = _loc1_;
   Selection.setSelection(0,_loc2_);
};
myInputTxt.onKillFocusEvent = function()
{
   ToGame_CommunityWindow_Introduction(this.text);
};
myInputTxt.onChanged = function()
{
   var _loc1_ = container_mc.friendList.txt_1.text;
   var _loc2_ = _loc1_.length;
   if(NameTextLength_Local3 < _loc2_)
   {
      container_mc.friendList.txt_1.text = _loc1_.substr(0,NameTextLength_Local3);
   }
};
myInputTxt.onEnterKey = function()
{
   Selection.setFocus(null);
};
myListener.OnGame_CommunityWindow_SetMyUpDate = function(dataList)
{
   var _loc1_ = container_mc.friendList;
   var _loc2_ = lib.util.ExtString.split(dataList,"\t");
   var _loc8_ = _loc2_[0];
   var _loc4_ = _loc2_[1];
   var _loc7_ = Number(_loc2_[2]) + 1;
   var _loc5_ = _loc2_[3];
   var _loc3_ = _loc2_[4];
   var _loc6_ = _loc5_ + " " + _loc4_;
   _loc1_.classMc.gotoAndStop(_loc7_);
   _loc1_.txt_0.setText(_loc6_);
   if(_loc3_ == "undefined")
   {
      _loc1_.txt_1.sourceStr = "";
      _loc1_.txt_1.setText("");
   }
   else if(_loc3_ != undefined)
   {
      _loc1_.txt_1.sourceStr = _loc3_;
      _loc1_.txt_1.setText(_loc3_);
   }
};
myListener.OnGame_CommunityWindow_SetFriendUpDate = function(index, dataList)
{
   var _loc9_ = container_mc.friendList.container["group" + index];
   var _loc2_ = lib.util.ExtString.split(dataList,"\t");
   var _loc7_ = _loc2_[0];
   var _loc6_ = _loc2_[1];
   var _loc20_ = _loc2_[2];
   var _loc21_ = _loc2_[3];
   var _loc10_ = _loc2_[4];
   var _loc13_ = _loc2_[5];
   var _loc16_ = Number(_loc2_[6]);
   var _loc18_ = _loc2_[7];
   var _loc22_ = Number(_loc2_[8]);
   var _loc19_ = Number(_loc2_[9]);
   var _loc5_ = Number(_loc2_[10]) + 1;
   var _loc17_ = Number(_loc2_[11]) + 1;
   var _loc4_ = _loc2_[12];
   var _loc11_ = Boolean(Number(_loc2_[13]));
   var _loc1_ = _loc9_.box["line" + _loc7_];
   if(_loc1_ == undefined)
   {
      return undefined;
   }
   _loc1_.id = _loc7_;
   var _loc14_ = "stateIcon" + _loc18_;
   var _loc12_ = "<img src=\'" + _loc14_ + "\' vspace=\'-3\'>" + _loc6_;
   var _loc8_ = _loc5_ + CLOSENES_STR0;
   _loc1_.bar.gotoAndStop(_loc5_);
   _loc1_.bar._width = _loc17_;
   var _loc15_ = _loc8_ + "(" + _loc19_ + CLOSENES_STR1 + ") : " + friendGrade[_loc5_ - 1];
   lib.manager.ToolTip.add(_loc1_.txt_5,_loc15_,1);
   _loc1_.txt_0.setText(_loc12_);
   _loc1_.txt_1.textAutoSize = "shrink";
   _loc1_.txt_1.text = _loc21_;
   _loc1_.txt_2.setText(_loc10_);
   _loc1_.txt_3.setText(_loc13_);
   _loc1_.txt_3.textColor = POSIOTIONTYPECOLOR[_loc16_];
   _loc1_.txt_4.setText(_loc20_);
   _loc1_.txt_5.text = _loc8_;
   if(!(_loc4_ == undefined || _loc4_ == ""))
   {
      _loc1_.txt_6.htmlText = _loc4_;
      var _loc3_ = _loc1_.txt_6.textWidth + 28;
      if(_loc3_ < 48)
      {
         _loc3_ = 48;
      }
      else if(_loc3_ > 256)
      {
         _loc1_.txt_6.setText(_loc4_);
         _loc3_ = 256;
      }
      _loc1_.balloon._width = _loc3_;
   }
   if(!_loc11_)
   {
      _loc1_.btn.gotoAndStop(4);
   }
   lib.util.InteractionGroup.addInteraction(UIname,_loc6_,_loc1_);
};
container_mc.friendList.sortBtn0._visible = true;
container_mc.friendList.sortBtn1._visible = false;
container_mc.friendList.closenessTip._visible = true;
var CLOSENESS_TIP = lib.util.UIString.getUIString("$111081");
lib.manager.ToolTip.add(container_mc.friendList.sortBtn0.sortBtn4,CLOSENESS_TIP,1);
var friendGrade = [lib.util.UIString.getUIString("$111082"),lib.util.UIString.getUIString("$111083"),lib.util.UIString.getUIString("$111084"),lib.util.UIString.getUIString("$111085"),lib.util.UIString.getUIString("$111086"),lib.util.UIString.getUIString("$111087")];
container_mc.friendList.closenessTip._x = 538 + container_mc.friendList.sortBtn0.sortBtn4.labelFd.textWidth / 2;
container_mc.friendList.closenessTip.hitTestDisable = true;
var LINEH = 30;
var FREINDLIST = [];
var POSIOTIONTYPECOLOR = [10066329,52479,16639772,16750848];
myListener.OnGame_CommunityWindow_SetFriendList = function(groupList, dataList)
{
   FREINDLIST = [];
   selectFriendMc = undefined;
   var _loc12_ = container_mc.friendList;
   var _loc34_ = lib.util.ExtString.split(groupList,"\n");
   var _loc32_ = _loc34_.length;
   _loc12_.len = _loc32_;
   _loc12_.groupList = [];
   listClear(_loc12_);
   var _loc6_ = 0;
   while(_loc6_ < _loc32_)
   {
      var _loc11_ = lib.util.ExtString.split(_loc34_[_loc6_],"\t");
      var _loc18_ = _loc11_[1];
      var _loc15_ = _loc11_[0];
      var _loc4_ = _loc12_.container.attachMovie("groupBar","group" + _loc15_,_loc12_.container.getNextHighestDepth());
      _loc12_.groupList[_loc6_] = _loc15_;
      _loc4_.count = 0;
      _loc4_.login = 0;
      _loc4_.txt.setText(_loc18_);
      _loc4_.id = _loc4_.txt.text;
      var _loc23_ = _loc4_.txt.textWidth;
      _loc4_.txt1._x = _loc23_ + 35;
      _loc4_.box._visible = Boolean(Number(_loc11_[2]));
      _loc4_.overMc._height = 30;
      _loc4_.overMc._alpha = 0;
      _loc4_.overMc.hitTestDisable = true;
      _loc4_.cateBtn.tooltip = true;
      cateButton(_loc4_.cateBtn);
      _loc6_ = _loc6_ + 1;
   }
   var _loc33_ = lib.util.ExtString.split(dataList,"\n");
   var _loc35_ = _loc33_.length;
   var _loc36_ = _loc12_.container;
   var _loc9_ = 0;
   while(_loc9_ < _loc35_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc33_[_loc9_],"\t");
      var _loc14_ = _loc3_[0];
      var _loc13_ = _loc3_[1];
      var _loc30_ = _loc3_[2];
      var _loc31_ = _loc3_[3];
      var _loc19_ = _loc3_[4];
      var _loc24_ = _loc3_[5];
      var _loc27_ = Number(_loc3_[6]);
      var _loc16_ = _loc3_[7];
      var _loc20_ = Number(_loc3_[8]);
      var _loc29_ = Number(_loc3_[9]);
      var _loc8_ = Number(_loc3_[10]) + 1;
      var _loc28_ = Number(_loc3_[11]) + 1;
      var _loc10_ = _loc3_[12];
      var _loc21_ = Boolean(Number(_loc3_[13]));
      var _loc25_ = "stateIcon" + _loc16_;
      var _loc22_ = "<img src=\'" + _loc25_ + "\' vspace=\'-3\'>" + _loc13_;
      var _loc17_ = _loc8_ + CLOSENES_STR0;
      var _loc26_ = _loc17_ + "(" + _loc29_ + CLOSENES_STR1 + ") : " + friendGrade[_loc8_ - 1];
      _loc4_ = _loc36_["group" + _loc20_];
      if(_loc4_ != undefined)
      {
         var _loc7_ = _loc4_.count;
         var _loc2_ = _loc4_.box.attachMovie("line0",LINENAME + _loc7_,_loc4_.box.getNextHighestDepth());
         lib.manager.ToolTip.add(_loc2_.txt_5,_loc26_,1);
         _loc2_.id = _loc14_;
         _loc2_._y = LINEH * _loc7_;
         _loc2_.idx = _loc7_;
         if(_loc16_ != 2)
         {
            _loc4_.login = _loc4_.login + 1;
         }
         _loc4_.count = _loc4_.count + 1;
         _loc2_.bar.gotoAndStop(_loc8_);
         _loc2_.bar._width = _loc28_;
         _loc2_.txt_0.setText(_loc22_);
         _loc2_.txt_1.textAutoSize = "shrink";
         _loc2_.txt_1.text = _loc31_;
         _loc2_.txt_2.setText(_loc19_);
         _loc2_.txt_3.setText(_loc24_);
         _loc2_.txt_3.textColor = POSIOTIONTYPECOLOR[_loc27_];
         _loc2_.txt_4.setText(_loc30_);
         _loc2_.txt_5.text = _loc17_;
         if(!(_loc10_ == undefined || _loc10_ == ""))
         {
            _loc2_.txt_6.setText(_loc10_);
            var _loc5_ = _loc2_.txt_6.textWidth + 28;
            if(_loc5_ < 48)
            {
               _loc5_ = 48;
            }
            else if(_loc5_ > 256)
            {
               _loc5_ = 256;
            }
            _loc2_.balloon._width = _loc5_;
         }
         _loc2_.btn.onRollOver = function()
         {
            if(this._currentframe == 4)
            {
               return undefined;
            }
            this.gotoAndStop(2);
         };
         _loc2_.btn.onRollOut = _loc2_.btn.onReleaseOutside = function()
         {
            if(this._currentframe == 4)
            {
               return undefined;
            }
            this.gotoAndStop(1);
         };
         _loc2_.btn.onPress = function()
         {
            if(this._currentframe == 4)
            {
               return undefined;
            }
            this.gotoAndStop(3);
         };
         _loc2_.btn.onRelease = function()
         {
            if(this._currentframe == 4)
            {
               return undefined;
            }
            this.gotoAndStop(2);
            ToGame_CommunityWindow_Teleport(this._parent.id);
         };
         lib.manager.ToolTip.add(_loc2_.btn.hit,_loc14_ + "\t0",6);
         if(!_loc21_)
         {
            _loc2_.btn.gotoAndStop(4);
         }
         _loc2_.hit_mc.onPress = function()
         {
            Mouse.addListener(mouseListner);
            dragFocus = this._parent;
            dragStartY = _ymouse;
            dragCopy = true;
         };
         _loc2_.hit_mc.onRollOver = function()
         {
            if(selectFriendMc != this._parent)
            {
               this._parent.effect_mc.gotoAndStop("over");
            }
         };
         _loc2_.hit_mc.onRollOut = _loc2_.hit_mc.onReleaseOutside = function()
         {
            if(selectFriendMc != this._parent)
            {
               this._parent.effect_mc.gotoAndStop("out");
            }
         };
         lib.util.InteractionGroup.addInteraction(UIname,_loc13_,_loc2_);
         _loc2_.txt_4._visible = false;
         _loc2_.txt_6._visible = false;
         _loc2_.memoBg._visible = false;
         _loc2_.balloon._visible = false;
         setMemo(_loc2_);
         FREINDLIST.push(_loc2_);
      }
      _loc9_ = _loc9_ + 1;
   }
   catePostion(_loc12_);
   changeItroduceMode(introduceShow);
};
var dragStartY = 0;
var dragFocus = null;
var dragCopy = false;
var ADDFREINDGROUPNAME = ["$111059","$111060"];
container_mc.tagMc._visible = false;
myListener.OnGame_CommunityWindow_SetAddList = function(dataList)
{
   var _loc19_ = container_mc.addList;
   listClear(_loc19_);
   _loc19_.len = 2;
   _loc19_.groupList = [1,2];
   var _loc16_ = _loc19_.container.attachMovie("groupBar","group1",container_mc.addList.container.getNextHighestDepth());
   _loc16_.txt.text = ADDFREINDGROUPNAME[0];
   _loc16_.overMc._visible = false;
   _loc16_.overMc._height = 40;
   groupLabelMc0.idx = 0;
   _loc16_.count = 0;
   _loc16_.cateBtn.tooltip = false;
   cateButton(_loc16_.cateBtn);
   var _loc17_ = _loc19_.container.attachMovie("groupBar","group2",container_mc.addList.container.getNextHighestDepth());
   _loc17_.txt.text = ADDFREINDGROUPNAME[1];
   _loc17_.overMc._visible = false;
   _loc17_.overMc._height = 40;
   _loc16_.idx = 1;
   _loc17_.count = 0;
   _loc17_.cateBtn.tooltip = false;
   cateButton(_loc17_.cateBtn);
   var _loc18_ = lib.util.ExtString.split(dataList,"\n");
   var _loc20_ = _loc18_.length;
   container_mc.tagMc._visible = false;
   var _loc21_ = _loc19_.container;
   var _loc8_ = 0;
   while(_loc8_ < _loc20_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc18_[_loc8_],"\t");
      if(_loc3_ != undefined)
      {
         var _loc11_ = _loc3_[0];
         var _loc9_ = _loc3_[1];
         var _loc13_ = _loc3_[2];
         var _loc12_ = _loc3_[3];
         var _loc14_ = _loc3_[4];
         var _loc15_ = _loc3_[5];
         var _loc10_ = Number(_loc3_[6]) + 1;
         var _loc5_ = _loc21_["group" + _loc10_];
         if(_loc5_ != undefined)
         {
            var _loc2_ = _loc5_.box.attachMovie("line1",LINENAME + line_count,_loc5_.box.getNextHighestDepth());
            _loc2_.id = _loc11_;
            _loc2_._y = LINEH * _loc5_.count;
            _loc5_.count = _loc5_.count + 1;
            _loc2_.txt_0.setText(_loc9_);
            _loc2_.txt_1.textAutoSize = "shrink";
            _loc2_.txt_1.text = _loc13_;
            _loc2_.txt_2.setText(_loc12_);
            _loc2_.txt_3.setText(_loc14_);
            if(_loc10_ == 1)
            {
               var _loc4_ = _loc2_.attachMovie("Comp:TxtBtn2","acceptBtn",_loc2_.getNextHighestDepth());
               var _loc6_ = _loc2_.attachMovie("Comp:TxtBtn2","denyBtn",_loc2_.getNextHighestDepth());
               _loc4_._x = 462;
               _loc4_._y = 0;
               _loc4_._width = 64;
               _loc4_.resize();
               _loc4_.txtBtn.setText("$111061");
               _loc6_._x = 527;
               _loc6_._y = 0;
               _loc6_._width = 64;
               _loc6_.resize();
               _loc6_.txtBtn.setText("$111062");
               _loc4_.btn.onRelease2 = function()
               {
                  ToGame_CommunityWindow_Accept(this._parent._parent.id);
               };
               _loc6_.btn.onRelease2 = function()
               {
                  ToGame_CommunityWindow_Deny(this._parent._parent.id);
               };
               container_mc.tagMc._visible = true;
               container_mc.tagMc.txt.text = _loc5_.count;
            }
            else
            {
               var _loc7_ = _loc2_.attachMovie("Comp:TxtBtn2","cancelBtn",_loc2_.getNextHighestDepth());
               _loc7_._x = 462;
               _loc7_._y = 0;
               _loc7_._width = 128;
               _loc7_.resize();
               _loc7_.txtBtn.setText("$111063");
               _loc7_.btn.onRelease2 = function()
               {
                  ToGame_CommunityWindow_Cancel(this._parent._parent.id);
               };
            }
            lib.util.InteractionGroup.addInteraction(UIname,_loc9_,_loc2_);
         }
      }
      _loc8_ = _loc8_ + 1;
   }
   _loc16_.txt1._x = _loc16_.txt.textWidth + 35;
   _loc17_.txt1._x = _loc17_.txt.textWidth + 35;
   catePostion(_loc19_);
};
myListener.OnGame_CommunityWindow_SetBlockList = function(dataList)
{
   var _loc3_ = container_mc.blockList;
   listClear(_loc3_);
   selectBlockMc = undefined;
   blockObjects = {};
   removeBlock_btn.setEnabled(false);
   _loc3_.len = 0;
   var _loc14_ = lib.util.ExtString.split(dataList,"\n");
   var _loc7_ = _loc14_.shift();
   if(_loc7_ != undefined)
   {
      container_mc.blockList.defaultStr._visible = false;
   }
   else
   {
      container_mc.blockList.defaultStr._visible = true;
   }
   while(_loc7_ != undefined)
   {
      var _loc2_ = lib.util.ExtString.split(_loc7_,"\t");
      if(_loc2_ != undefined)
      {
         var _loc5_ = _loc3_.container;
         var lineMc = _loc5_.attachMovie("line2","LINENAME" + _loc3_.listLength,_loc5_.getNextHighestDepth());
         blockObjects[lineMc._name] = lineMc;
         var _loc11_ = _loc2_[3];
         var _loc8_ = _loc2_[4];
         lineMc.index = _loc3_.listLength;
         lineMc.id = _loc2_[0];
         lineMc._x = 0;
         lineMc._y = 30 * _loc3_.listLength;
         var _loc13_ = _loc2_[1].indexOf("src=");
         var _loc6_ = _loc2_[1].lastIndexOf(">");
         var _loc12_ = _loc2_[1].length;
         var _loc10_ = _loc2_[1].substr(_loc6_ + 1,_loc12_);
         var _loc9_ = _loc2_[1].substr(0,_loc6_ + 1);
         lineMc.txt_2.textAutoSize = "shrink";
         lineMc.txt_2.text = _loc11_;
         lineMc.txt_3.setText(_loc8_);
         if(_loc13_ == -1)
         {
            lineMc.txt_11.htmlText = "";
            lineMc.txt_1.htmlText = "";
            lineMc.txt_12._visible = true;
            lineMc.txt_12.setText(_loc2_[1]);
            lineMc.user = lineMc.txt_12.text;
         }
         else
         {
            lineMc.txt_12._visible = false;
            lineMc.txt_11.setText(_loc10_);
            lineMc.txt_1.htmlText = _loc9_;
            lineMc.user = lineMc.txt_11.text;
         }
         if(_loc2_[2] != undefined)
         {
            lineMc.txt_4.setText(_loc2_[2]);
         }
         else
         {
            lineMc.txt_4.setText("");
         }
         lineMc.hit_mc.onRollOver = function()
         {
            if(selectBlockMc != this._parent)
            {
               this._parent.effect_mc.gotoAndStop("over");
            }
         };
         lineMc.hit_mc.onRollOut = lineMc.hit_mc.onReleaseOutside = function()
         {
            if(selectBlockMc != this._parent)
            {
               this._parent.effect_mc.gotoAndStop("out");
            }
         };
         lineMc.hit_mc.onPress = function()
         {
            if(selectBlockMc != this._parent)
            {
               this._parent.effect_mc.gotoAndStop("press");
            }
         };
         lineMc.hit_mc.onRelease = function()
         {
            if(selectBlockMc != this._parent)
            {
               selectBlockMc.effect_mc.gotoAndStop("out");
               this._parent.effect_mc.gotoAndStop("active");
               selectBlockMc = this._parent;
               removeBlock_btn.setEnabled(true);
            }
         };
         var _loc4_ = new lib.util.ExtTextField(lineMc.txt_4,0,lineMc.txt_4_focus);
         _loc4_.onSetFocusEvent = function()
         {
            selectBlockMc.effect_mc.gotoAndStop("out");
            selectBlockMc = null;
            removeBlock_btn.setEnabled(false);
            ToGame_CommunityWindow_DoingBlockMemo(true);
         };
         _loc4_.onChanged = function()
         {
            lib.util.StrByteLen.getLenth3(lineMc.txt_4,NameTextLength_Local2);
         };
         _loc4_.onKillFocusEvent = function()
         {
            ToGame_CommunityWindow_DoingBlockMemo(false);
            ToGame_CommunityWindow_SetBlockMemo(this.textField._parent.id,this.text);
         };
         _loc4_.onEnterKey = function()
         {
            Selection.setFocus(null);
         };
         _loc3_.listLength = _loc3_.listLength + 1;
         lib.util.InteractionGroup.addInteraction(UIname,_loc2_[1],lineMc);
      }
      _loc7_ = _loc14_.shift();
   }
   var _loc15_ = _loc3_.listLength;
   _loc3_.tipText.text = "";
   _loc3_.tipText.text = lib.util.UIString.getUIString("$111074","count",_loc15_);
   _loc3_.scrollbar.pageSize = _loc3_.container._height;
   if(_loc15_ < 120)
   {
      addBlock_btn.setEnabled(true);
   }
   else
   {
      addBlock_btn.setEnabled(false);
   }
};
myListener.OnGame_CommunityWindow_SetFriendTotalNum = function(totalNum, onlineNum)
{
   onlineNum = Number(onlineNum);
   var _loc2_ = container_mc.friendList;
   var _loc3_ = onlineNum <= 0?lib.info.TextColor.CHECKBTN_NORMAL.toString(16):"#" + lib.info.TextColor.GENERAL_EMPHASIS.toString(16);
   _loc2_.onlineCheck_txt.setText(onlyOnlineFriendsStr + "(<font color=\'" + _loc3_ + "\'>" + onlineNum + "</font>" + "/" + totalNum + ")");
};
myListener.OnGame_CommunityWindow_SetOnlineFriendOnly = function(bTrue)
{
   container_mc.friendList.onlineCheck.checked = Boolean(Number(bTrue));
};
myListener.OnGame_CommunityWindow_SetReward = function(idx, rewardText, rewardData, curPage, totalPage)
{
   var _loc14_ = container_mc.inviteList.container;
   var targetMc = _loc14_["rewardMc" + idx];
   if(!targetMc)
   {
      return undefined;
   }
   targetMc.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      this.titleTxt.htmlText = rewardText;
      this.pageTxt.text = curPage + "/" + totalPage;
      var _loc11_ = false;
      if(totalPage > 1)
      {
         var _loc12_ = false;
         var _loc13_ = false;
         if(curPage == "1")
         {
            _loc12_ = true;
         }
         if(curPage == totalPage)
         {
            _loc13_ = true;
         }
         _loc11_ = true;
         setPageBtn(this,idx,_loc12_,_loc13_);
      }
      this.nBtn._visible = _loc11_;
      this.pBtn._visible = _loc11_;
      this.pageTxt._visible = _loc11_;
      var _loc10_ = lib.util.ExtString.split(rewardData,"\n");
      var _loc9_ = _loc10_.length - 1;
      if(rewardData == undefined)
      {
         _loc9_ = -1;
      }
      var _loc4_ = 0;
      while(_loc4_ < 4)
      {
         var _loc2_ = targetMc["slot" + _loc4_];
         _loc2_.clear();
         lib.manager.ToolTip.remove(_loc2_.SLOT);
         if(_loc4_ > _loc9_)
         {
            _loc2_._visible = false;
         }
         else
         {
            _loc2_._visible = true;
            var _loc3_ = lib.util.ExtString.split(_loc10_[_loc4_],"\t");
            _loc2_.id = _loc3_[0];
            _loc2_.name = _loc3_[2];
            _loc2_.draw(_loc3_[1]);
            _loc2_.setLineNum(1);
            _loc2_.up_txt._x = _loc2_.up_txt._x + 8;
            _loc2_.up_txt._width = 300;
            _loc2_.up_txt._height = 55;
            _loc2_.up_txt.verticalAlign = "center";
            _loc2_.up_txt.shadowStrength = 3;
            _loc2_.up_txt.shadowBlurX = 1;
            _loc2_.up_txt.shadowBlurY = 1;
            _loc2_.up_txt.shadowDistance = 1;
            _loc2_.downTxt.htmlText = _loc3_[3];
            _loc2_.display = true;
            _loc2_.drag = false;
            _loc2_.effect = false;
            lib.manager.ToolTip.add(_loc2_.SLOT,_loc3_[0] + "\t1",6,_loc2_.Slot.Icon);
            _loc2_.overMc._visible = false;
            _loc2_.itemType = _loc3_[4];
            lib.util.ExtString.textCut(_loc2_.up_txt,_loc2_.upTxt);
            if(_loc2_.itemType == 2)
            {
               var _loc7_ = 0;
               if(_loc3_[3] != undefined && _loc3_[3] != "" && _loc3_[3] != "undefined")
               {
                  _loc7_ = Number(_loc3_[3]);
               }
               _loc2_.setLineNum(3);
               _loc2_.upText = "";
               _loc2_.center_txt.html = true;
               var _loc8_ = lib.util.GoldCurrency.SetGoldText(_loc2_.downTxt,0,0,0,_loc7_);
               _loc2_.center_txt.htmlText = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc8_ + "</font>";
               _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_MONEY;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.center_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
               }
               _loc2_.showMoney(false);
               _loc2_.money_mc._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc2_.money_mc._y = _loc2_.center_txt._y + 2;
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
               var _loc6_ = _loc2_.attachMovie("symbol_xp","symbol_xp",_loc2_.getNextHighestDepth());
               _loc6_._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc6_._y = _loc2_.center_txt._y;
               _loc6_.hitTestDisable = true;
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
               var _loc5_ = _loc2_.attachMovie("symbol_p","symbol_p",_loc2_.getNextHighestDepth());
               _loc5_._x = _loc2_.center_txt._x + _loc2_.center_txt.textWidth + 6;
               _loc5_._y = _loc2_.center_txt._y;
               _loc5_.hitTestDisable = true;
            }
            else if(_loc2_.itemType == 5)
            {
               _loc2_.draw("img://__Icon_Items.ReputationXP_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc3_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.down_txt.textColor = 32511;
               }
               _loc5_ = _loc2_.attachMovie("symbol_rp_xp","symbol_rp_xp",_loc2_.getNextHighestDepth());
               _loc2_.down_txt._width = 123;
               _loc5_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc5_._y = _loc2_.down_txt._y;
               _loc5_.hitTestDisable = true;
            }
            else if(_loc2_.itemType == 6)
            {
               _loc2_.draw("img://__Icon_Items.ReputationPoint_Tex");
               _loc2_.setLineNum(2);
               _loc2_.grade = -1;
               _loc2_.upText = _loc3_[3];
               _loc2_.up_txt.textColor = 46335;
               _loc2_.downText = lib.util.CurrencyFormat.makeComma(_loc2_.downTxt);
               _loc2_.down_txt.textColor = 32511;
               if(bReduceRepeatQuestReward)
               {
                  _loc2_.down_txt.textColor = 32511;
               }
               _loc5_ = lib.util.DrawBitmap.makeMcAndDraw(_loc2_,"img://__Icon_Items.ReputationPointCoin");
               _loc2_.down_txt._width = 123;
               _loc5_._x = _loc2_.down_txt._x + _loc2_.down_txt._width + 1;
               _loc5_._y = _loc2_.down_txt._y;
               _loc5_.hitTestDisable = true;
            }
            else
            {
               _loc2_.setLineNum(3);
               _loc2_.center_txt.htmlText = _loc3_[2];
               _loc2_.upText = "";
               _loc2_.center_txt._y = 10;
               _loc2_.center_txt._height = 40;
               _loc2_.center_txt.verticalAlign = "center";
            }
            if(!(_loc2_.itemType == 5 || _loc2_.itemType == 6 || _loc2_.itemType == 7))
            {
               _loc2_.down_txt.textColor = 16777215;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
   };
};
container_mc.inviteIcon.hitTestDisable = true;
myListener.OnGame_CommunityWindow_InviteEnable = function(bool, TooltipStr)
{
   var _loc1_ = Boolean(Number(bool));
   invite_btn.setEnabled(_loc1_);
   if(!_loc1_)
   {
      if(!TooltipStr)
      {
         lib.manager.ToolTip.add(container_mc.inviteList.txtBtn0,INVITE_BTN,1);
      }
      else
      {
         lib.manager.ToolTip.add(container_mc.inviteList.txtBtn0,TooltipStr,1);
      }
   }
   else
   {
      lib.manager.ToolTip.remove(container_mc.inviteList.txtBtn0);
   }
};
myListener.OnGame_CommunityWindow_InviteVisible = function(bool)
{
   var _loc1_ = Boolean(Number(bool));
   container_mc.inviteIcon._visible = _loc1_;
   if(!_loc1_)
   {
      tab.setTab(0,1);
   }
   tab.setVisible(3,_loc1_);
};
var prevInviteH = 0;
myListener.OnGame_CommunityWindow_InviteGuide = function(guideLine, tipTxt)
{
   var _loc9_ = lib.util.ExtString.split(guideLine,"\n");
   var _loc10_ = _loc9_.length;
   var _loc8_ = 20;
   var _loc3_ = container_mc.inviteList;
   var _loc6_ = 0;
   while(_loc6_ < _loc10_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc9_[_loc6_],"\t");
      var _loc1_ = _loc3_.container["rewardMc" + _loc2_[0]];
      var _loc4_ = _loc2_[1];
      var _loc7_ = _loc2_[2];
      var _loc5_ = 0;
      if(!_loc1_)
      {
         if(_loc4_ == "0")
         {
            _loc1_ = _loc3_.container.attachMovie("rewardMc0","rewardMc" + _loc2_[0],_loc3_.container.getNextHighestDepth());
         }
         else if(_loc4_ == "1")
         {
            _loc1_ = _loc3_.container.attachMovie("rewardMc1","rewardMc" + _loc2_[0],_loc3_.container.getNextHighestDepth());
            _loc5_ = 10;
         }
         else if(_loc4_ == "2")
         {
            _loc1_ = _loc3_.container.attachMovie("rewardMc2","rewardMc" + _loc2_[0],_loc3_.container.getNextHighestDepth());
            _loc5_ = 10;
         }
      }
      else if(_loc4_ == "1")
      {
         _loc5_ = 10;
      }
      else if(_loc4_ == "2")
      {
         _loc5_ = 10;
      }
      _loc1_._x = 28;
      _loc1_._y = _loc8_;
      _loc1_.txt.htmlText = _loc7_;
      _loc1_.txt._height = _loc1_.txt.textHeight + 10;
      _loc8_ = _loc8_ + (_loc1_._height + _loc5_);
      _loc6_ = _loc6_ + 1;
   }
   _loc3_.tipText.text = tipTxt;
   if(prevInviteH != _loc8_ + 100)
   {
      prevInviteH = _loc8_ + 100;
      _loc3_.scrollbar.pageSize = prevInviteH;
      _loc3_.container.bg._height = prevInviteH;
   }
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var refreshFriend_btn = container_mc.friendList.txtBtn0.txtBtn;
var addFriend_btn = container_mc.friendList.txtBtn1.txtBtn;
var addGroup_btn = container_mc.friendList.txtBtn2.txtBtn;
var refreshFriend_btn2 = container_mc.addList.txtBtn0.txtBtn;
var addFriend_btn2 = container_mc.addList.txtBtn1.txtBtn;
var addBlock_btn = container_mc.blockList.txtBtn0.txtBtn;
var removeBlock_btn = container_mc.blockList.txtBtn1.txtBtn;
refreshFriend_btn.setRelease(ToGame_CommunityWindow_RequestFriendList);
addFriend_btn.setRelease(ToGame_CommunityWindow_AddFriend);
addGroup_btn.setRelease(ToGame_CommunityWindow_AddGroup);
refreshFriend_btn2.setRelease(ToGame_CommunityWindow_RequestFriendList);
addFriend_btn2.setRelease(ToGame_CommunityWindow_AddFriend);
removeBlock_btn.setEnabled(false);
addBlock_btn.setRelease(ToGame_CommunityWindow_AddBlock);
removeBlock_btn.setRelease(function()
{
   ToGame_CommunityWindow_RemoveBlock(selectBlockMc.id);
}
);
close_btn.setRelease(ToGame_CommunityWindow_CloseUI);
x_btn.setRelease(ToGame_CommunityWindow_CloseUI);
var invite_btn = container_mc.inviteList.txtBtn0.txtBtn;
invite_btn.setRelease(ToGame_CommunityWindow_InviteCode);
var tab = container_mc.tabBtn.tab;
tab.setRelease(release);
container_mc.friendList.scrollbar.pageSize = container_mc.friendList.container._height;
container_mc.friendList.scrollbar.displaySize = container_mc.friendList.maskMc._height;
container_mc.friendList.scrollbar.rowHeight = lib.manager.UISkin.LISTLINE_HEIGHT;
var fListConY = container_mc.friendList.container._y;
container_mc.friendList.container.onScroll = function()
{
   this._y = fListConY - arguments[0];
};
container_mc.friendList.scrollbar.setWheel(container_mc.friendList.container);
container_mc.friendList.scrollbar.addListener(container_mc.friendList.container);
container_mc.addList.scrollbar.pageSize = container_mc.friendList.container._height;
container_mc.addList.scrollbar.displaySize = container_mc.friendList.maskMc._height;
container_mc.addList.scrollbar.rowHeight = lib.manager.UISkin.LISTLINE_HEIGHT;
var aListConY = container_mc.addList.container._y;
container_mc.addList.container.onScroll = function()
{
   this._y = aListConY - arguments[0];
   var _loc3_ = 0;
   while(_loc3_ < container_mc.addList.listLength)
   {
      this["line" + _loc3_]._visible = _loc3_ + 1 >= arguments[1] && _loc3_ - 1 < arguments[1] + LINECOUNT;
      _loc3_ = _loc3_ + 1;
   }
};
container_mc.addList.scrollbar.setWheel(container_mc.addList.container);
container_mc.addList.scrollbar.addListener(container_mc.addList.container);
container_mc.blockList.scrollbar.pageSize = container_mc.blockList.container._height;
container_mc.blockList.scrollbar.displaySize = container_mc.blockList.maskMc._height;
container_mc.blockList.scrollbar.rowHeight = lib.manager.UISkin.LISTLINE_HEIGHT;
var bListConY = container_mc.blockList.container._y;
container_mc.blockList.container.onScroll = function()
{
   this._y = bListConY - arguments[0];
   var _loc3_ = 0;
   while(_loc3_ < container_mc.blockList.listLength)
   {
      this["line" + _loc3_]._visible = _loc3_ + 1 >= arguments[1] && _loc3_ - 1 < arguments[1] + LINECOUNT + 1;
      _loc3_ = _loc3_ + 1;
   }
};
container_mc.blockList.scrollbar.setWheel(container_mc.blockList.container);
container_mc.blockList.scrollbar.addListener(container_mc.blockList.container);
container_mc.inviteList.scrollbar.pageSize = container_mc.inviteList.container._height;
container_mc.inviteList.scrollbar.displaySize = container_mc.inviteList.maskMc._height;
container_mc.inviteList.scrollbar.rowHeight = lib.manager.UISkin.LISTLINE_HEIGHT;
var iListConY = container_mc.inviteList.container._y;
container_mc.inviteList.container.onScroll = function()
{
   this._y = iListConY - arguments[0];
};
container_mc.inviteList.scrollbar.setWheel(container_mc.inviteList.container);
container_mc.inviteList.scrollbar.addListener(container_mc.inviteList.container);
container_mc.friendList.sortBtn0.onSelected = function(index)
{
   ToGame_CommunityWindow_RequestSortFriendList(index);
};
container_mc.addList.sortBtn.onSelected = function(index)
{
   ToGame_CommunityWindow_RequestSortAddList(index);
};
container_mc.blockList.sortBtn.onSelected = function(index)
{
   ToGame_CommunityWindow_RequestSortBlockList(index);
};
container_mc.friendList.onlineCheck.setText(container_mc.friendList.onlineCheck_txt);
container_mc.friendList.onlineCheck.onChanged = function(checked)
{
   ToGame_CommunityWindow_RequestSetOnlineFriendOnly(Number(checked));
};
var dragTargetMc = undefined;
var dragSlotMc = undefined;
var focusGroup = undefined;
var mouseListner = {};
mouseListner.onMouseUp = function()
{
   Mouse.removeListener(mouseListner);
   dragFocus = null;
   dragCopy = false;
   dragDropSlot();
};
mouseListner.onMouseMove = function()
{
   if(!dragCopy)
   {
      return undefined;
   }
   var _loc4_ = dragStartY - _ymouse;
   if(undefined == dragSlotMc && (_loc4_ > 10 || _loc4_ < -10))
   {
      startDragSlot(dragFocus);
   }
   var _loc2_ = container_mc.friendList.container;
   focusGroup = undefined;
   for(var _loc3_ in _loc2_)
   {
      var _loc1_ = _loc2_[_loc3_].overMc;
      if(!(!_loc1_ || _loc1_ == dragTargetMc._parent._parent.overMc))
      {
         if(_loc1_.hitTest(_level0._xmouse,_level0._ymouse))
         {
            _loc1_._alpha = 100;
            focusGroup = _loc1_._parent;
         }
         else
         {
            _loc1_._alpha = 0;
         }
      }
   }
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target != undefined)
   {
      if(target._name == "cateBtn")
      {
         lib.manager.ToolTip.remove(target);
         var _loc2_ = target._parent.id;
         if(_loc2_ != undefined)
         {
            ToGame_CommunityWindow_GroupEdit(target);
         }
      }
   }
};
var intro_btn = container_mc.friendList.txtBtn3.txtBtn;
intro_btn.setRelease(function()
{
   changeItroduceMode(!introduceShow);
}
);
var introduceShow = false;
myListener.OnGame_CommunityWindow_LengthLocal = function(lengthnum1, lengthnum2, lengthnum3)
{
   NameTextLength_Local1 = lengthnum1;
   NameTextLength_Local2 = lengthnum2;
   NameTextLength_Local3 = lengthnum3;
};
var SaveData = lib.gamedata.HistoryData.getHistoryData(UIname);
function setCategory(mc)
{
   if(mc.box._visible)
   {
      ToGame_CommunityWindow_OpenGroup(mc.id,0);
      mc.opened_mc.gotoAndStop(1);
      mc.box._visible = false;
   }
   else
   {
      ToGame_CommunityWindow_OpenGroup(mc.id,1);
      mc.opened_mc.gotoAndStop(2);
      mc.box._visible = true;
   }
   catePostion(mc._parent._parent);
}
function catePostion(focusMc)
{
   var _loc7_ = Number(focusMc.len);
   var _loc4_ = 0;
   var _loc2_ = 0;
   while(_loc2_ < _loc7_)
   {
      var _loc5_ = focusMc.groupList[_loc2_];
      var _loc1_ = focusMc.container["group" + _loc5_];
      _loc1_._y = _loc4_;
      if(_loc1_.login != undefined)
      {
         _loc1_.txt1.htmlText = "(<font color=\'#80e71c\'>" + _loc1_.login + "</font>/" + _loc1_.count + ")";
         if(_loc1_.count == 0)
         {
            if(_loc2_ < _loc7_ - 1)
            {
               _loc1_.box.attachMovie("lineD",LINENAME + "D",_loc1_.box.getNextHighestDepth());
            }
         }
      }
      else
      {
         _loc1_.txt1.htmlText = "<font color=\'#80e71c\'>" + _loc1_.count + "</font>";
      }
      if(_loc1_.box._visible)
      {
         var _loc3_ = _loc1_._height;
         _loc4_ = _loc4_ + _loc3_;
         _loc1_.overMc._height = _loc3_;
         _loc1_.opened_mc.gotoAndStop(1);
      }
      else
      {
         _loc4_ = _loc4_ + 40;
         _loc1_.overMc._height = 40;
         _loc1_.opened_mc.gotoAndStop(2);
      }
      _loc2_ = _loc2_ + 1;
   }
   focusMc.scrollbar.pageSize = focusMc.container._height;
}
function cateButton(mc)
{
   mc.onRollOver = function()
   {
      if(this.tooltip)
      {
         lib.manager.ToolTip.add(this,CATE_TIP,1);
      }
      this.gotoAndStop(2);
   };
   mc.onRollOut = mc.onReleaseOutside = function()
   {
      if(this.tooltip)
      {
         lib.manager.ToolTip.remove(this);
      }
      this.gotoAndStop(1);
   };
   mc.onPress = function()
   {
      this.gotoAndStop(1);
   };
   mc.onRelease = function()
   {
      this.gotoAndStop(2);
      setCategory(this._parent);
   };
}
function setMemo(lineMc)
{
   var _loc2_ = new lib.util.ExtTextField(lineMc.txt_4,0,lineMc.txt_4_focus);
   _loc2_.onSetFocusEvent = function()
   {
      ToGame_Community_DoingMemo(true);
   };
   _loc2_.onChanged = function()
   {
      lib.util.StrByteLen.getLenth3(lineMc.txt_4,NameTextLength_Local1);
   };
   _loc2_.onKillFocusEvent = function()
   {
      ToGame_Community_DoingMemo(false);
      ToGame_Community_SetMemo(this.textField._parent.id,this.text);
      if(this.textField._parent.online == 2)
      {
         this.textField.textColor = lib.info.TextColor.LIST_MEMO_OFFLINE;
      }
      else
      {
         this.textField.textColor = lib.info.TextColor.LIST_MEMO_ONLINE;
      }
   };
   _loc2_.onEnterKey = function()
   {
      Selection.setFocus(null);
   };
}
function setPageBtn(mc, idx, pDesable, nDesable)
{
   if(pDesable == false)
   {
      mc.pBtn.gotoAndStop(1);
      mc.pBtn.onRollOver = function()
      {
         if(this._currentframe == 4)
         {
            return undefined;
         }
         this.gotoAndStop(2);
      };
      mc.pBtn.onRollOut = mc.pBtn.onReleaseOutside = function()
      {
         if(this._currentframe == 4)
         {
            return undefined;
         }
         this.gotoAndStop(1);
      };
      mc.pBtn.onPress = function()
      {
         if(this._currentframe == 4)
         {
            return undefined;
         }
         this.gotoAndStop(3);
      };
      mc.pBtn.onRelease = function()
      {
         if(this._currentframe == 4)
         {
            return undefined;
         }
         this.gotoAndStop(1);
         ToGame_CommunityWindow_SetReward(idx,0);
      };
   }
   else
   {
      mc.pBtn.gotoAndStop(4);
   }
   if(nDesable == false)
   {
      mc.nBtn.gotoAndStop(1);
      mc.nBtn.onRollOver = function()
      {
         if(this._currentframe == 4)
         {
            return undefined;
         }
         this.gotoAndStop(2);
      };
      mc.nBtn.onRollOut = mc.nBtn.onReleaseOutside = function()
      {
         if(this._currentframe == 4)
         {
            return undefined;
         }
         this.gotoAndStop(1);
      };
      mc.nBtn.onPress = function()
      {
         if(this._currentframe == 4)
         {
            return undefined;
         }
         this.gotoAndStop(3);
      };
      mc.nBtn.onRelease = function()
      {
         if(this._currentframe == 4)
         {
            return undefined;
         }
         this.gotoAndStop(1);
         ToGame_CommunityWindow_SetReward(idx,1);
      };
   }
   else
   {
      mc.nBtn.gotoAndStop(4);
   }
}
function ToGame_CommunityWindow_CloseUI()
{
   fscommand("ToGame_CommunityWindow_CloseUI");
}
function ToGame_CommunityWindow_MyState(index)
{
   getURL("FSCommand:ToGame_CommunityWindow_MyState",index);
}
function ToGame_CommunityWindow_RequestSetOnlineFriendOnly(bTrue)
{
   getURL("FSCommand:ToGame_CommunityWindow_RequestSetOnlineFriendOnly",bTrue);
}
function ToGame_CommunityWindow_Introduction(memo)
{
   getURL("FSCommand:ToGame_CommunityWindow_Introduction",memo);
}
function ToGame_Community_DoingMemo(bTrue)
{
   getURL("FSCommand:ToGame_Community_DoingMemo",bTrue);
}
function ToGame_Community_SetMemo(id, memo)
{
   getURL("FSCommand:ToGame_Community_SetMemo",id + "\t" + memo);
}
function ToGame_CommunityWindow_AddGroup()
{
   fscommand("ToGame_CommunityWindow_AddGroup");
}
function ToGame_CommunityWindow_AddFriend()
{
   fscommand("ToGame_CommunityWindow_AddFriend");
}
function ToGame_CommunityWindow_Accept(id)
{
   getURL("FSCommand:ToGame_CommunityWindow_Accept",id);
}
function ToGame_CommunityWindow_Deny(id)
{
   getURL("FSCommand:ToGame_CommunityWindow_Deny",id);
}
function ToGame_CommunityWindow_Cancel(id)
{
   getURL("FSCommand:ToGame_CommunityWindow_Cancel",id);
}
function ToGame_CommunityWindow_RequestSortFriendList(sortType)
{
   getURL("FSCommand:ToGame_CommunityWindow_RequestSortFriendList",sortType);
}
function ToGame_CommunityWindow_RequestSortAddList(sortType)
{
   getURL("FSCommand:ToGame_CommunityWindow_RequestSortAddList",sortType);
}
function ToGame_CommunityWindow_RequestFriendList()
{
   fscommand("ToGame_CommunityWindow_RequestFriendList");
}
function ToGame_CommunityWindow_DoingBlockMemo(bTrue)
{
   getURL("FSCommand:ToGame_CommunityWindow_DoingBlockMemo",bTrue);
}
function ToGame_CommunityWindow_SetBlockMemo(id, memo)
{
   getURL("FSCommand:ToGame_CommunityWindow_SetBlockMemo",id + "\t" + memo);
}
function ToGame_CommunityWindow_AddBlock()
{
   fscommand("ToGame_CommunityWindow_AddBlock");
}
function ToGame_CommunityWindow_RemoveBlock(id)
{
   selectBlockMc.effect_mc.gotoAndStop("out");
   selectBlockMc = null;
   removeBlock_btn.setEnabled(false);
   getURL("FSCommand:ToGame_CommunityWindow_RemoveBlock",id);
}
function ToGame_CommunityWindow_RequestSortBlockList(index)
{
   getURL("FSCommand:ToGame_CommunityWindow_RequestSortBlockList",index);
}
function ToGame_CommunityWindow_OpenGroup(index, type)
{
   getURL("FSCommand:ToGame_CommunityWindow_OpenGroup",index + "\t" + type);
}
function ToGame_CommunityWindow_Teleport(id)
{
   getURL("FSCommand:ToGame_CommunityWindow_Teleport",id);
}
function ToGame_CommunityWindow_GroupPosion(prevNum, nextNum)
{
   getURL("FSCommand:" add ("ToGame_CommunityWindow_GroupPosion" + prevNum + "\t" + nextNum),"");
}
function ToGame_CommunityWindow_LinePosion(id, nextNum)
{
   getURL("FSCommand:ToGame_CommunityWindow_LinePosion",id + "\t" + nextNum);
}
function ToGame_CommunityWindow_GroupEdit(target)
{
   getURL("FSCommand:ToGame_CommunityWindow_GroupEdit",target._parent.txt.text);
}
function ToGame_CommunityWindow_InviteCode()
{
   fscommand("ToGame_CommunityWindow_InviteCode");
}
function ToGame_CommunityWindow_SetReward(idx, pMode)
{
   getURL("FSCommand:ToGame_CommunityWindow_SetReward",idx + "\t" + pMode);
}
function listClear(mc)
{
   for(var _loc2_ in mc.container)
   {
      mc.container[_loc2_].removeMovieClip();
   }
   mc.container._y = 0;
   mc.scrollbar.scroll = 0;
   removeCheck(null,false);
   mc.listLength = 0;
}
function release(num)
{
   container_mc.friendList._visible = tab.activedNum == 0;
   container_mc.addList._visible = tab.activedNum == 1;
   container_mc.blockList._visible = tab.activedNum == 2;
   container_mc.inviteList._visible = tab.activedNum == 3;
}
function startDragSlot(slotMc)
{
   dragTargetMc = slotMc;
   dragSlotMc = container_mc.friendList.attachMovie("line0","lineDrag",container_mc.friendList.getNextHighestDepth());
   dragSlotMc._y = slotMc._y + slotMc._parent._y + slotMc._parent._parent._y + container_mc.friendList.container._y;
   dragSlotMc.id = slotMc.id;
   dragSlotMc.bar.gotoAndStop(slotMc.bar._currentframe);
   dragSlotMc.bar._xscale(slotMc.bar._xscale);
   dragSlotMc.txt_0.setText(slotMc.txt_0.htmlText);
   dragSlotMc.txt_1.setText(slotMc.txt_1.htmlText);
   dragSlotMc.txt_2.setText(slotMc.txt_2.htmlText);
   dragSlotMc.txt_3.setText(slotMc.txt_3.htmlText);
   dragSlotMc.txt_3.textColor = slotMc.txt_3.textColor;
   dragSlotMc.txt_4.setText(slotMc.txt_4.htmlText);
   dragSlotMc.txt_5.text = slotMc.txt_5.text;
   dragSlotMc.txt_6.setText(slotMc.txt_6.htmlText);
   dragSlotMc.btn.gotoAndStop(lineMc.btn._currentframe);
   dragSlotMc.bar._width = slotMc.bar._width;
   dragSlotMc.txt_1._visible = slotMc.txt_1._visible;
   dragSlotMc.txt_2._visible = slotMc.txt_2._visible;
   dragSlotMc.txt_3._visible = slotMc.txt_3._visible;
   dragSlotMc.txt_4._visible = slotMc.txt_4._visible;
   dragSlotMc.txt_5._visible = slotMc.txt_5._visible;
   dragSlotMc.txt_6._visible = slotMc.txt_6._visible;
   dragSlotMc.bar._visible = slotMc.bar._visible;
   dragSlotMc.barBg._visible = slotMc.barBg._visible;
   dragSlotMc.memoBg._visible = slotMc.memoBg._visible;
   dragSlotMc.balloon._visible = slotMc.balloon._visible;
   dragSlotMc.btn._visible = slotMc.btn._visible;
   dragSlotMc.txt_4_focus._visible = false;
   dragSlotMc.startDrag();
   setSlotState(slotMc,1);
   setSlotState(dragSlotMc,3);
}
function dragDropSlot()
{
   dragSlotMc.stopDrag();
   var _loc1_ = dragTargetMc._parent._parent.overMc.hitTest(_level0._xmouse,_level0._ymouse);
   if(dragTargetMc == undefined || _loc1_ || !focusGroup)
   {
      setSlotState(dragTargetMc,0);
      dragSlotMc.removeMovieClip();
      dragSlotMc = undefined;
      dragTargetMc = undefined;
      focusGroup = undefined;
      return undefined;
   }
   focusGroup.overMc._alpha = 0;
   ToGame_CommunityWindow_LinePosion(dragTargetMc.id,focusGroup.id);
   setSlotState(dragTargetMc,0);
   dragSlotMc.removeMovieClip();
   dragSlotMc = undefined;
   dragTargetMc = undefined;
   focusGroup = undefined;
}
function setSlotState(slotMc, _state)
{
   if(_state == 0)
   {
      slotMc._alpha = 100;
      slotMc.effect_mc.gotoAndStop(1);
   }
   else if(_state == 1)
   {
      slotMc._alpha = 30;
      slotMc.slotBg.gotoAndStop(2);
   }
   else if(_stateeffect_mc = 2)
   {
      slotMc._alpha = 50;
      slotMc.effect_mc.gotoAndStop(2);
   }
   else if(_state == 3)
   {
      slotMc._alpha = 100;
      slotMc.effect_mc.gotoAndStop(3);
   }
}
function changeItroduceMode(flag)
{
   if(flag)
   {
      intro_btn.txt.setText("$111033");
   }
   else
   {
      intro_btn.txt.setText("$111034");
   }
   introduceShow = flag;
   container_mc.friendList.sortBtn0._visible = !introduceShow;
   container_mc.friendList.sortBtn1._visible = introduceShow;
   container_mc.friendList.closenessTip._visible = !introduceShow;
   var _loc3_ = FREINDLIST.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc3_)
   {
      var _loc1_ = FREINDLIST[_loc2_];
      _loc1_.txt_1._visible = !introduceShow;
      _loc1_.txt_2._visible = !introduceShow;
      _loc1_.txt_3._visible = !introduceShow;
      _loc1_.txt_5._visible = !introduceShow;
      _loc1_.barBg._visible = !introduceShow;
      _loc1_.bar._visible = !introduceShow;
      _loc1_.btn._visible = !introduceShow;
      _loc1_.txt_4._visible = introduceShow;
      _loc1_.txt_6._visible = introduceShow;
      _loc1_.memoBg._visible = introduceShow;
      if(_loc1_.txt_6.text == "" || _loc1_.txt_6.text == undefined)
      {
         _loc1_.balloon._visible = false;
      }
      else
      {
         _loc1_.balloon._visible = introduceShow;
      }
      _loc2_ = _loc2_ + 1;
   }
}
function historySave_All()
{
   SaveData.tabIndex = tab.activedNum;
   SaveData.onlineCheck = Number(container_mc.friendList.onlineCheck.checked);
   SaveData.memoview = introduceShow;
   lib.gamedata.HistoryData.addHistoryData(UIname,SaveData);
}
if(SaveData.tabIndex != undefined)
{
   var tabIndex = Number(SaveData.tabIndex);
   tab.setTab(tabIndex,1);
   ToGameSkillWindowSetTab(tabIndex);
}
else
{
   tab.setTab(0,1);
}
changeItroduceMode(false);
if(SaveData.onlineCheck != undefined)
{
   var f = Number(SaveData.onlineCheck);
   if(Boolean(f) == container_mc.friendList.onlineCheck.checked)
   {
      return undefined;
   }
   myListener.OnGame_CommunityWindow_SetOnlineFriendOnly(f);
   ToGame_CommunityWindow_RequestSetOnlineFriendOnly(f);
}
fscommand("ToGame_CommunityWindow_Init");
