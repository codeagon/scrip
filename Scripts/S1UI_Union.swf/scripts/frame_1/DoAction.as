function buildList(_fieldData, _columData, _data, selectIndex, _selectable, interactionIndex)
{
   changeContainer(container_mc.listContainerMc);
   clearList();
   container_mc.listContainerMc.sortMc.clear();
   container_mc.listContainerMc.sortMc.colums = _fieldData.size;
   container_mc.listContainerMc.sortMc.labels = _fieldData.label;
   var _loc11_ = container_mc.listContainerMc.containerMc;
   if(_loc11_ == undefined)
   {
      _loc11_ = container_mc.listContainerMc.createEmptyMovieClip("containerMc",container_mc.listContainerMc.getNextHighestDepth());
      _loc11_._x = 1;
      _loc11_._y = 35;
   }
   _loc11_.selectIndex = selectIndex;
   if(_data[0][1] == undefined || _data[0][1] == "")
   {
      return undefined;
   }
   container_mc.listContainerMc.defaultStr._visible = false;
   var _loc3_ = 0;
   while(_loc3_ < _data.length)
   {
      if(_data[_loc3_] != undefined)
      {
         var _loc4_ = _loc11_.attachMovie("lineObj","line" + _loc3_,_loc11_.getNextHighestDepth());
         _loc4_.index = _loc3_;
         _loc4_._y = 30 * _loc3_;
         if(_selectable)
         {
            _loc4_.hit.onRollOver = function()
            {
               if(this._parent._parent.selectIndex != this._parent.index)
               {
                  this._parent.effect_mc.gotoAndStop("over");
               }
            };
            _loc4_.hit.onRollOut = _loc4_.hit.onReleaseOutside = function()
            {
               if(this._parent._parent.selectIndex != this._parent.index)
               {
                  this._parent.effect_mc.gotoAndStop("out");
               }
            };
         }
         if(selectIndex == _loc3_)
         {
            _loc4_.effect_mc.gotoAndStop("active");
         }
         var _loc6_ = 0;
         var _loc2_ = 0;
         while(_loc2_ < _data[_loc3_].length)
         {
            var _loc7_ = _data[_loc3_][_loc2_];
            var _loc8_ = _columData[_loc2_].create(_loc4_,"colum" + _loc2_,_loc7_,_loc6_,0,selectIndex == _loc3_);
            if(interactionIndex == _loc2_)
            {
               lib.util.InteractionGroup.addInteraction(UIname,str,_loc8_);
            }
            _loc6_ = _loc6_ + (_columData[_loc2_]._w + container_mc.listContainerMc.sortMc._space);
            _loc2_ = _loc2_ + 1;
         }
      }
      _loc3_ = _loc3_ + 1;
   }
}
function clearList()
{
   container_mc.listContainerMc.defaultStr._visible = true;
   var _loc1_ = 0;
   while(container_mc.listContainerMc.containerMc["line" + _loc1_] != undefined)
   {
      container_mc.listContainerMc.containerMc["line" + _loc1_].removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   container_mc.listContainerMc.containerMc["line" + container_mc.listContainerMc.containerMc.selectIndex].removeMovieClip();
   container_mc.serchMc._visible = false;
   container_mc.listContainerMc.numberSteper._visible = false;
   container_mc.popupBtn._visible = false;
}
function visibleList(f)
{
   container_mc.listContainerMc._visible = f;
   if(f)
   {
      container_mc.summaryContainer._visible = false;
      container_mc.subTabContainer._visible = true;
   }
}
function parser(_data)
{
   var _loc4_ = [];
   var _loc5_ = lib.util.ExtString.split(_data,"\n");
   var _loc3_ = _loc5_.shift();
   while(_loc3_ != undefined)
   {
      var _loc2_ = lib.util.ExtString.split(_loc3_,"\t");
      var _loc1_ = 0;
      while(_loc1_ < _loc2_.length)
      {
         _loc2_[_loc1_] = lib.util.ExtString.split(_loc2_[_loc1_],"|");
         _loc1_ = _loc1_ + 1;
      }
      _loc4_.push(_loc2_);
      _loc3_ = _loc5_.shift();
   }
   return _loc4_;
}
function setGuideText(str)
{
   if(str == undefined || str == "")
   {
      container_mc.guideFd.htmlText = "";
      container_mc.guideIconMc._visible = false;
      return undefined;
   }
   container_mc.guideFd.htmlText = str;
   container_mc.guideIconMc._visible = true;
}
function setSubTitle(visibleUnionTitle, subtitle)
{
   subtitle = subtitle != undefined?subtitle:"";
   if(visibleUnionTitle && (unionTitle != "" && unionTitle != undefined))
   {
      container_mc.unionTitleFd._visible = true;
      container_mc.unionTitleBgMc._visible = true;
      container_mc.subTitleFd._x = 275;
      container_mc.subTitleFd._width = 709;
   }
   else
   {
      container_mc.unionTitleFd._visible = false;
      container_mc.unionTitleBgMc._visible = false;
      container_mc.subTitleFd._x = 16;
      container_mc.subTitleFd._width = 1105;
   }
   container_mc.subTitleFd.htmlText = subtitle;
}
function changeContainer(tg)
{
   for(var _loc1_ in containerStorage)
   {
      containerStorage[_loc1_]._visible = false;
   }
   container_mc.scrollbar._visible = false;
   container_mc.popupBtn._visible = false;
   container_mc.serchMc._visible = false;
   tg._visible = true;
}
function setUnionTax(v)
{
   var _loc1_ = uinionTax + v;
   if(_loc1_ == undefined)
   {
      return undefined;
   }
   saveUse = true;
   uinionTax = _loc1_;
   taxUpBtn.setEnabled(uinionTax < uinionTaxMax);
   taxDownBtn.setEnabled(uinionTax > uinionTaxMin);
   taxSaveBtn.setEnabled(true);
   container_mc.polyticalContainer.taxFd.text = _loc1_ + "%";
}
function clearPowerCool()
{
   var _loc1_ = powerCools.pop();
   while(_loc1_ != undefined && _loc1_ != "")
   {
      _loc1_.cool.remove();
      _loc1_.CoolTime.clear();
      delete register1.cool;
      _loc1_ = powerCools.pop();
   }
}
function endCoolTime(slotMc)
{
   slotMc.cool.remove();
   slotMc.CoolTime.clear();
   delete slotMc.cool;
   slotMc.swapDepths(1000);
   var _loc2_ = lib.util.McMaker.attach(slotMc.EFFECT,"effect_standby",50);
   _loc2_.blendMode = "add";
   lib.util.DrawBitmap.makeMcAndDraw(_loc2_.a_mc,slotMc.img,68,68);
   lib.util.DrawBitmap.makeMcAndDraw(_loc2_.b_mc,slotMc.img,68,68);
   lib.util.DrawBitmap.makeMcAndDraw(_loc2_.c_mc,slotMc.img,68,68);
   slotMc.Count.txt.text = "";
   slotMc.remain = slotMc.total = 0;
   skillActive = true;
}
function popUpBtnCall(target)
{
   if(target.selected == true)
   {
      clearPopUp();
      return undefined;
   }
   selectPopupBtn.selected = false;
   target.selected = true;
   selectPopupBtn.onRollOut();
   selectPopupBtn = target;
   if(target != undefined)
   {
      ToGame_Union_PopOpen(target._parent.index);
   }
}
function clearPopUp()
{
   myListener.OnGame_Union_SetPopUp();
   popUpBtnCall();
}
function ToGame_Union_Init()
{
   fscommand("ToGame_Union_Init");
}
function ToGame_Union_Close()
{
   fscommand("ToGame_Union_Close");
}
function ToGame_Union_ChangeMainTab(index)
{
   getURL("FSCommand:ToGame_Union_ChangeMainTab",index);
}
function ToGame_Union_ChangeSubTab(index)
{
   getURL("FSCommand:ToGame_Union_ChangeSubTab",index);
}
function ToGame_Union_GoToPage(pageNumber)
{
   getURL("FSCommand:ToGame_Union_GoToPage",pageNumber);
}
function ToGame_Union_GoToHistoryPage(pageNumber)
{
   getURL("FSCommand:ToGame_Union_GoToHistoryPage",pageNumber);
}
function ToGame_Union_GuildSeach(str)
{
   getURL("FSCommand:ToGame_Union_GuildSeach",str);
}
function ToGame_Union_ConsulHistory()
{
   fscommand("ToGame_Union_ConsulHistory");
}
function ToGame_Union_Sort(index)
{
   getURL("FSCommand:ToGame_Union_Sort",index);
}
function ToGame_Union_UnionPopBtn(index)
{
   getURL("FSCommand:ToGame_Union_UnionPopBtn",index);
}
function ToGame_Union_PopOpen(index)
{
   getURL("FSCommand:ToGame_Union_PopOpen",index);
}
function ToGame_Union_SelectPopMenu(id)
{
   clearPopUp();
   getURL("FSCommand:ToGame_Union_SelectPopMenu",id);
}
function ToGame_Union_Tax()
{
   getURL("FSCommand:ToGame_Union_Tax",uinionTax);
}
function ToGame_Union_Notice()
{
   var _loc1_ = container_mc.polyticalContainer.noticeFd.text;
   noticeUse = false;
   if(_loc1_ == undefined)
   {
      _loc1_ = "";
   }
   getURL("FSCommand:ToGame_Union_Notice",_loc1_);
}
_global.gfxExtensions = true;
var UI = this;
UI._visible = false;
var UIname = "Union";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.tit_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var containerStorage = [container_mc.polyticalContainer,container_mc.listContainerMc,container_mc.summaryContainer,container_mc.unionRaceChartContainer,container_mc.myInfoContainer,container_mc.trainingContainer,container_mc.trainingScheduleContainer,container_mc.consulPolicyContainer];
clearList();
setGuideText();
changeContainer();
myListener.OnGame_Union_SetUnionTitle();
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
      }
      else
      {
         clearPowerCool();
         UI._visible = false;
         lib.util.InteractionGroup.delInteraction(UIname);
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
var listContainerMc = container_mc.listContainerMc;
var MAXLISTCOUNT = 15;
container_mc.listContainerMc.sortMc.onSelected = function(index)
{
   ToGame_Union_Sort(index);
};
container_mc.listContainerMc.numberSteper.onChanged = function(page)
{
   ToGame_Union_GoToPage(page);
};
var mainTab;
myListener.OnGame_Union_SetMainTab = function()
{
   function mainTabRelease()
   {
      if(!arguments[1])
      {
         ToGame_Union_ChangeMainTab(mainTab.activedNum);
      }
   }
   var _loc3_ = [];
   var _loc2_ = 0;
   while(arguments[_loc2_] != undefined)
   {
      _loc3_.push(arguments[_loc2_]);
      _loc2_ = _loc2_ + 1;
   }
   container_mc.mainTabBtn.clear();
   container_mc.mainTabBtn.labels = _loc3_;
   mainTab = container_mc.mainTabBtn.tab;
   mainTab.setRelease(mainTabRelease);
};
var subTab;
myListener.OnGame_Union_SetSubTab = function()
{
   var _loc5_ = [];
   var _loc3_ = 0;
   while(arguments[_loc3_] != undefined)
   {
      _loc5_.push(arguments[_loc3_]);
      _loc3_ = _loc3_ + 1;
   }
   _loc3_ = 0;
   while(container_mc.subTabContainer["subtab" + _loc3_] != undefined)
   {
      container_mc.subTabContainer["subtab" + _loc3_].removeMovieClip();
      _loc3_ = _loc3_ + 1;
   }
   function subTabRelease()
   {
      if(!arguments[1])
      {
         ToGame_Union_ChangeSubTab(subTab.activedNum);
      }
   }
   if(_loc5_[0] == undefined)
   {
      container_mc.subTabContainer._visible = false;
      return undefined;
   }
   container_mc.subTabContainer._visible = true;
   var _loc7_ = [];
   var _loc8_ = [];
   var _loc6_ = 0;
   _loc3_ = 0;
   while(_loc3_ < _loc5_.length)
   {
      var _loc2_ = container_mc.subTabContainer.attachMovie("subTabClip",["subtab" + _loc3_],_loc3_);
      var _loc4_ = 46 * _loc3_ + 2;
      _loc2_._x = 2;
      _loc2_._y = _loc4_;
      _loc2_.txt.textAutoSize = "shrink";
      _loc2_.txt.verticalAlign = "center";
      _loc2_.txt.htmlText = _loc5_[_loc3_];
      _loc7_.push(_loc2_.mc);
      _loc8_.push(_loc2_.txt);
      _loc6_ = _loc4_ + _loc2_._height;
      _loc3_ = _loc3_ + 1;
   }
   container_mc.subTabContainer.bgMc._height = _loc6_ - 1;
   container_mc.subTabContainer.bottomBgMc._y = _loc6_ - 1;
   subTab = new lib.util.TabBtn(_loc7_,_loc8_);
   subTab.setRelease(subTabRelease);
};
myListener.OnGame_Union_SelectedMainTabIndex = function(index)
{
   mainTab.setTab(Number(index),1);
};
myListener.OnGame_Union_SelectedSubTabIndex = function(index)
{
   subTab.setTab(Number(index),1);
};
var unionTitle = "";
myListener.OnGame_Union_SetUnionTitle = function(_title, index)
{
   unionTitle = _title;
   index = Number(index);
   container_mc.unionTitleFd.text = _title;
   container_mc.unionTitleBgMc.gotoAndStop(index + 1);
};
var unionPopBtn0 = new lib.util.TxtBtn(container_mc.summaryContainer.summaryMc0.popBtn);
var unionPopBtn1 = new lib.util.TxtBtn(container_mc.summaryContainer.summaryMc1.popBtn);
var unionPopBtn2 = new lib.util.TxtBtn(container_mc.summaryContainer.summaryMc2.popBtn);
unionPopBtn0.setRelease(function()
{
   ToGame_Union_UnionPopBtn(0);
}
);
unionPopBtn1.setRelease(function()
{
   ToGame_Union_UnionPopBtn(1);
}
);
unionPopBtn2.setRelease(function()
{
   ToGame_Union_UnionPopBtn(2);
}
);
lib.manager.ToolTip.add(container_mc.summaryContainer.summaryMc0.popBtn,"$471127",1);
lib.manager.ToolTip.add(container_mc.summaryContainer.summaryMc1.popBtn,"$471127",1);
lib.manager.ToolTip.add(container_mc.summaryContainer.summaryMc2.popBtn,"$471127",1);
myListener.OnGame_Union_SetSummary = function(summary0, summary1, summary2)
{
   SetRateTime = [{str:"",timer:0},{str:"",timer:0},{str:"",timer:0}];
   container_mc.subTabContainer._visible = false;
   changeContainer(container_mc.summaryContainer);
   var _loc8_ = [];
   _loc8_[0] = lib.util.ExtString.split(summary0,"\t");
   _loc8_[1] = lib.util.ExtString.split(summary1,"\t");
   _loc8_[2] = lib.util.ExtString.split(summary2,"\t");
   var _loc7_ = 0;
   while(_loc7_ < _loc8_.length)
   {
      var _loc4_ = _loc8_[_loc7_];
      var _loc6_ = 0;
      while(_loc6_ < _loc4_.length)
      {
         var _loc2_ = container_mc.summaryContainer["summaryMc" + _loc7_];
         _loc2_.unionNameFd.text = _loc4_[0];
         var _loc5_ = 1;
         while(_loc5_ < 7)
         {
            var _loc3_ = _loc2_.gageMc0["gage" + _loc5_];
            if(_loc3_ == undefined)
            {
               _loc3_ = _loc2_.gageMc0.gage1.duplicateMovieClip("gage" + _loc5_,_loc2_.gageMc0.getNextHighestDepth());
               _loc3_._x = _loc2_.gageMc0.gage1._x + _loc3_._width * (_loc5_ - 1);
            }
            _loc3_._visible = Number(_loc4_[1]) >= _loc5_;
            _loc5_ = _loc5_ + 1;
         }
         _loc5_ = 1;
         while(_loc5_ < 7)
         {
            _loc3_ = _loc2_.gageMc1["gage" + _loc5_];
            if(_loc3_ == undefined)
            {
               _loc3_ = _loc2_.gageMc1.gage1.duplicateMovieClip("gage" + _loc5_,_loc2_.gageMc1.getNextHighestDepth());
               _loc3_._x = _loc2_.gageMc1.gage1._x + _loc3_._width * (_loc5_ - 1);
               _loc3_.onEnterFrame = function()
               {
                  this.gotoAndStop(2);
                  delete this.onEnterFrame;
               };
            }
            _loc3_.gotoAndStop(2);
            _loc3_._visible = Number(_loc4_[4]) >= _loc5_;
            _loc5_ = _loc5_ + 1;
         }
         _loc2_.rateFd.htmlText = _loc4_[2] + "%";
         _loc2_.trainRampMc.gotoAndStop(Number(_loc4_[3]) + 1);
         if(_loc4_[3] == "0")
         {
            _loc2_.trainFd.textColor = 7368816;
            _loc2_.trainFd.text = "$275021";
         }
         else
         {
            _loc2_.trainFd.textColor = 8447772;
            _loc2_.trainFd.text = "$275028";
         }
         _loc2_.authorityCountFd.text = _loc4_[5] + lib.util.UIString.getUIString("$221060");
         _loc2_.consulNameFd.text = _loc4_[6];
         _loc2_.consulCountFd.text = _loc4_[7] + lib.util.UIString.getUIString("$221060");
         _loc6_ = _loc6_ + 1;
      }
      _loc7_ = _loc7_ + 1;
   }
   setGuideText("");
   setSubTitle(false);
};
var noticeExtFd = new lib.util.ExtTextField(container_mc.polyticalContainer.noticeFd,0,container_mc.polyticalContainer.noticeFocus);
var taxUpBtn = new lib.util.TxtBtn(container_mc.polyticalContainer.upBtn);
var taxDownBtn = new lib.util.TxtBtn(container_mc.polyticalContainer.downBtn);
var noticeSaveBtn = container_mc.polyticalContainer.noticeBtn.txtBtn;
var taxSaveBtn = container_mc.polyticalContainer.taxBtn.txtBtn;
taxUpBtn.setRelease(function()
{
   setUnionTax(1);
}
);
taxDownBtn.setRelease(function()
{
   setUnionTax(-1);
}
);
taxSaveBtn.setRelease(ToGame_Union_Tax);
noticeSaveBtn.setRelease(ToGame_Union_Notice);
var uinionTax = 0;
var uinionTaxMin = 0;
var uinionTaxMax = 0;
var inputMax = 50;
var noticeUse = false;
var saveUse = false;
myListener.OnGame_Union_SetPolicy_LengthLocal = function(len)
{
   inputMax = Number(len);
};
myListener.OnGame_Union_SetPolicy = function(unionCrestImg, guildCrestImg, guildName, pcName, notice, tax, authorityBuff, authorityCount, editable)
{
   var _loc3_ = container_mc.polyticalContainer;
   changeContainer(_loc3_);
   new src.union.S1Icon(_loc3_,unionCrestImg,"unionCrest",637,43,512,512);
   new src.union.S1Icon(_loc3_.crestMc,guildCrestImg,"guildCrest",3,3,64,64);
   _loc3_.guildNameFd.text = guildName;
   _loc3_.pcNameFd.text = pcName;
   if(noticeUse == false)
   {
      _loc3_.scrollbar.setTextField(_loc3_.noticeFd);
      _loc3_.noticeFd.text = notice;
   }
   noticeSaveBtn.setEnabled(noticeUse);
   var _loc4_ = lib.util.ExtString.split(tax,"\t");
   if(saveUse == false)
   {
      uinionTaxMin = _loc4_[1];
      uinionTaxMax = _loc4_[2];
      if(_loc4_[0] == undefined)
      {
         _loc4_[0] = 0;
      }
      uinionTax = Number(_loc4_[0]);
      _loc3_.taxFd.text = _loc4_[0] + "%";
      taxUpBtn.setEnabled(uinionTax < uinionTaxMax);
      taxDownBtn.setEnabled(uinionTax > uinionTaxMin);
   }
   taxSaveBtn.setEnabled(saveUse);
   var _loc1_ = 1;
   while(_loc1_ < 7)
   {
      var _loc2_ = _loc3_.gageMc["gage" + _loc1_];
      if(_loc2_ == undefined)
      {
         _loc2_ = _loc3_.gageMc.gage1.duplicateMovieClip("gage" + _loc1_,_loc3_.gageMc.getNextHighestDepth());
         _loc2_._x = _loc3_.gageMc.gage1._x + _loc2_._width * (_loc1_ - 1);
      }
      _loc2_._visible = Number(authorityBuff) >= _loc1_;
      _loc1_ = _loc1_ + 1;
   }
   _loc3_.countFd.text = authorityCount + lib.util.UIString.getUIString("$221060");
   if(editable == "1")
   {
      _loc3_.noticeFd.type = "input";
      _loc3_.noticeFd.selectable = true;
   }
   else
   {
      _loc3_.noticeFd.type = "dynamic";
      _loc3_.noticeFd.selectable = false;
   }
   taxSaveBtn.setVisible(editable == "1");
   noticeSaveBtn.setVisible(editable == "1");
   taxUpBtn.setVisible(editable == "1");
   taxDownBtn.setVisible(editable == "1");
   setSubTitle(true,"$471108");
   setGuideText("$471030");
   container_mc.popupBtn._visible = true;
};
noticeExtFd.onChanged = function()
{
   lib.util.StrByteLen.getLenth3(container_mc.polyticalContainer.noticeFd,inputMax);
   noticeUse = true;
   noticeSaveBtn.setEnabled(noticeUse);
};
noticeExtFd.onKillFocusEvent = function()
{
   lib.util.StrByteLen.getLenth3(container_mc.polyticalContainer.noticeFd,inputMax);
};
var powerCools = [];
myListener.OnGame_Union_SetConsulPower = function(powers)
{
   clearPowerCool();
   powerData = lib.util.ExtString.split(powers,"\n");
   var _loc5_ = powerData.length;
   var _loc4_ = 0;
   while(_loc4_ < _loc5_)
   {
      var _loc3_ = lib.util.ExtString.split(powerData[_loc4_],"\t");
      _remainTime = Number(_loc3_[2]);
      _totalTime = Number(_loc3_[3]);
      var _loc2_ = container_mc.polyticalContainer["powerSlot" + _loc4_];
      _loc2_.clear();
      if(_loc2_ == undefined)
      {
         _loc2_ = container_mc.polyticalContainer.attachMovie("Slot_link","powerSlot" + _loc4_,_loc4_);
         _loc2_._x = 19 + 62 * _loc4_;
         _loc2_._y = 419;
      }
      powerCools.push(_loc2_);
      _loc2_.img = _loc3_[1];
      _loc2_.draw(_loc3_[1]);
      lib.manager.ToolTip.add(_loc2_.SLOT,_loc3_[0],6,_loc2_.Icon);
      _loc2_.FX_DISABLE._visible = _loc3_[4] == "0";
      _loc2_.grade = _loc3_[5];
      _loc2_.active = _loc3_[4] == "2";
      if(_loc2_.remain == -1 || _loc2_.remain != _remainTime)
      {
         _loc2_.cool.remove();
         delete register2.cool;
         _loc2_.cool = new lib.util.CoolTime(_remainTime,_totalTime);
         _loc2_.cool.mc = _loc2_;
         if(_remainTime <= 0 || _totalTime <= 0)
         {
            endCoolTime(_loc2_);
         }
         else
         {
            _loc2_.cool.onTick = function()
            {
               this.mc.remain = this.getRemainTime();
               this.mc.total = this.getTotalTime();
               this.mc.Count.txt.text = this.getCountText();
               lib.util.CoolTime.draw(this.mc.CoolTime,50,50,360 - this.getDgree(),0,60,true);
            };
            _loc2_.cool.onFinished = function()
            {
               endCoolTime(this.mc);
               this.mc.active = true;
            };
            skillActive = false;
         }
      }
      _loc4_ = _loc4_ + 1;
   }
};
var NameTextLength_Local = 50;
myListener.OnGame_Union_LengthLocal = function(lengthnum)
{
   NameTextLength_Local = lengthnum;
};
var guildSearch = new lib.util.ExtTextField(container_mc.serchMc.searchFd,0,container_mc.serchMc.searchFd_focus);
guildSearch.onEnterKey = function()
{
   container_mc.serchMc.searchFd_focus._visible = false;
   ToGame_Union_GuildSeach(this.text);
};
guildSearch.onKillFocusEvent = function()
{
   var _loc2_ = this.text;
   _loc2_ = lib.util.ExtString.trim(_loc2_);
   lib.util.StrByteLen.getLenth3(container_mc.serchMc.searchFd,NameTextLength_Local);
};
guildSearch.onChanged = function()
{
   lib.util.StrByteLen.getLenth3(container_mc.serchMc.searchFd,NameTextLength_Local);
};
var search_btn = container_mc.serchMc.searchBtn.txtBtn;
search_btn.setRelease(function()
{
   ToGame_Union_GuildSeach(container_mc.serchMc.searchFd.text);
}
);
var optionPopUpMc;
var selectPopupBtn;
myListener.OnGame_Union_SetGuild = function(_data, total, myGuild, currentpage, totalpage, sortDisable, permmision)
{
   var _loc2_ = parser(_data);
   _loc2_[MAXLISTCOUNT - 2] = parser(myGuild)[0];
   var _loc1_ = [new src.union.ColumRankType(100,30),new src.union.ColumIconType(199,30),new src.union.ColumNormal(164,30),new src.union.ColumNormal(150,30,"right"),new src.union.ColumIconType(154,30,"center"),new src.union.ColumIconType(174,30)];
   if(permmision == "1")
   {
      _loc1_[5] = new src.union.ColumBtnType(new src.union.ColumIconType(174,30),popUpBtnCall);
   }
   var _loc4_ = {label:["$221056","$271020","$124011","$471031","$471032","$471033"],size:[100,199,164,150,154,174]};
   buildList(_loc4_,_loc1_,_loc2_,MAXLISTCOUNT - 2,permmision == "1",3);
   var _loc3_ = lib.util.ExtString.split(sortDisable,"\t");
   container_mc.listContainerMc.sortMc.setSortEnable(false,_loc3_);
   container_mc.listContainerMc.countFd.htmlText = lib.util.UIString.getUIString("471034","union",unionTitle) + "<font color=\'#7FE71B\'>" + lib.util.CurrencyFormat.makeComma(total) + "</font>";
   container_mc.listContainerMc.countFdBg._visible = true;
   container_mc.listContainerMc.numberSteper._visible = true;
   container_mc.listContainerMc.numberSteper.setPage(Number(currentpage),Number(totalpage));
   setSubTitle(true,"");
   setGuideText("$471035");
   container_mc.serchMc._visible = true;
};
myListener.OnGame_Union_SetPopUp = function(authorize, menu)
{
   container_mc.listContainerMc.optionPopup.removeMovieClip();
   if(authorize == undefined && menu == undefined)
   {
      return undefined;
   }
   optionPopUpMc = container_mc.listContainerMc.attachMovie("optionPopup","optionPopup",container_mc.listContainerMc.getNextHighestDepth());
   optionPopUpMc._x = container_mc.listContainerMc.containerMc._width + 5;
   optionPopUpMc._y = container_mc.listContainerMc.containerMc._y + selectPopupBtn._parent._y;
   var _loc7_ = parser(authorize);
   var _loc8_ = parser(menu);
   var _loc6_ = 0;
   var _loc4_ = 29;
   var _loc3_ = 0;
   while(_loc3_ < _loc7_.length)
   {
      var _loc2_ = optionPopUpMc.attachMovie("PopMenuline","AMenuMc" + _loc3_,optionPopUpMc.getNextHighestDepth());
      _loc2_._x = 2;
      _loc2_._y = 34 * _loc3_ + _loc4_;
      _loc6_ = 34 * _loc3_ + _loc2_._height + _loc4_;
      _loc2_.id = _loc7_[_loc3_][0];
      _loc2_.txt.verticalAlign = "center";
      _loc2_.txt.htmlText = _loc7_[_loc3_][1];
      _loc2_.onRelease = function()
      {
         ToGame_Union_SelectPopMenu(this.id);
      };
      _loc2_.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      _loc3_ = _loc3_ + 1;
   }
   _loc4_ = _loc4_ + _loc6_;
   _loc3_ = 0;
   while(_loc3_ < _loc8_.length)
   {
      _loc2_ = optionPopUpMc.attachMovie("PopMenuline","BMenuMc" + _loc3_,optionPopUpMc.getNextHighestDepth());
      if(_loc6_ > 0)
      {
         var _loc5_ = optionPopUpMc.attachMovie("popupLine","lineMc" + _loc3_,optionPopUpMc.getNextHighestDepth());
         _loc5_._x = 2;
         _loc5_._y = _loc4_ + 34 * _loc3_;
      }
      _loc2_._x = 2;
      _loc2_._y = _loc4_ + 34 * _loc3_;
      _loc6_ = _loc2_._y + _loc2_._height;
      _loc2_.id = _loc8_[_loc3_][0];
      _loc2_.txt.verticalAlign = "center";
      _loc2_.txt.htmlText = _loc8_[_loc3_][1];
      _loc2_.onRelease = function()
      {
         ToGame_Union_SelectPopMenu(this.id);
      };
      _loc2_.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      _loc3_ = _loc3_ + 1;
   }
   optionPopUpMc.bgMc._height = _loc6_ + 5;
   var _loc9_ = new lib.util.TxtBtn(optionPopUpMc.close_mc);
   _loc9_.setRelease(clearPopUp);
};
myListener.OnGame_Union_SetCommander = function(_data, currentpage, totalpage, sortDisable)
{
   var _loc3_ = parser(_data);
   var _loc2_ = [new src.union.ColumIconType(174,30),new src.union.ColumNormal(184,30),new src.union.ColumIconType(199,30),new src.union.ColumIconType(384,30,"left",true)];
   var _loc4_ = {label:["$471033","$111006","$471036","$471037"],size:[174,184,199,384],aling:["left","left","left","left"]};
   buildList(_loc4_,_loc2_,_loc3_,undefined,undefined,1);
   container_mc.listContainerMc.countFd.htmlText = "";
   container_mc.listContainerMc.countFdBg._visible = false;
   container_mc.listContainerMc.numberSteper._visible = true;
   container_mc.listContainerMc.numberSteper.setPage(Number(currentpage),Number(totalpage));
   var _loc1_ = lib.util.ExtString.split(sortDisable,"\t");
   container_mc.listContainerMc.sortMc.setSortEnable(false,_loc1_);
   setSubTitle(true,"$471109");
   setGuideText("$471038");
};
var viewPrevConsulBtn = container_mc.popupBtn.txtBtn;
viewPrevConsulBtn.setRelease(ToGame_Union_ConsulHistory);
myListener.OnGame_Union_SetConsulRace = function(_data, myRace, sortDisable)
{
   var _loc1_ = parser(_data);
   _loc1_[MAXLISTCOUNT - 1] = parser(myRace)[0];
   var _loc3_ = [new src.union.ColumRankType(100,30),new src.union.ColumNormal(209,30),new src.union.ColumIconType(209,30),new src.union.ColumGageType(249,30),new src.union.ColumIconType(174,30)];
   var _loc4_ = {label:["$221056","$111006","$271020","$471031","$471039"],size:[100,209,209,249,174]};
   buildList(_loc4_,_loc3_,_loc1_,MAXLISTCOUNT - 1,false,2);
   container_mc.listContainerMc.countFd.htmlText = "";
   container_mc.listContainerMc.countFdBg._visible = false;
   var _loc2_ = lib.util.ExtString.split(sortDisable,"\t");
   container_mc.listContainerMc.sortMc.setSortEnable(false,_loc2_);
   setSubTitle(true,"$471040");
   setGuideText("$471041");
};
myListener.OnGame_Union_SetJobInfo = function(_data)
{
   var _loc15_ = container_mc.jobInfoContainerMc;
   changeContainer(_loc15_);
   if(_loc15_ == undefined)
   {
      _loc15_ = container_mc.createEmptyMovieClip("jobInfoContainerMc",container_mc.getNextHighestDepth());
      _loc15_.setMask(container_mc.maskArea);
      containerStorage.push(_loc15_);
   }
   _loc15_._x = listContainerMc._x;
   _loc15_._y = listContainerMc._y;
   var contContainerMcY = _loc15_._y;
   var _loc20_ = lib.util.ExtString.split(_data,"\n");
   var _loc17_ = 0;
   var _loc18_ = "";
   var _loc4_ = [];
   var _loc19_ = new src.union.S1Icon();
   var _loc7_ = 228;
   var _loc8_ = 0;
   while(_loc8_ < _loc20_.length)
   {
      var _loc5_ = lib.util.ExtString.split(_loc20_[_loc8_],"\t");
      var _loc14_ = undefined;
      var _loc11_ = undefined;
      if(String(_loc18_) != String(_loc5_[0]) || _loc18_ == "")
      {
         _loc11_ = _loc15_.attachMovie("jobHeader","header" + _loc8_,_loc8_ + 100);
         _loc11_._x = 1;
         _loc11_._y = _loc8_ != 0?_loc17_ + 6:0;
         _loc17_ = _loc17_ + (_loc8_ != 0?36:30);
         _loc11_.txt.htmlText = _loc5_[0];
         _loc4_ = [];
         _loc14_ = undefined;
         _loc7_ = 228;
      }
      _loc18_ = _loc5_[0];
      if(_loc5_[1] != "" && _loc5_[1] != undefined && _loc5_[1] != _loc5_[0])
      {
         _loc14_ = _loc15_.attachMovie("jobSkilSub","subHeader" + _loc8_,_loc8_);
         _loc14_.txt.htmlText = _loc5_[1];
         _loc4_.push(_loc14_);
      }
      var _loc12_ = _loc14_ != undefined?_loc14_:_loc11_;
      var _loc6_ = 2;
      while(_loc6_ < _loc5_.length)
      {
         var _loc10_ = _loc12_.attachMovie("jobSkillIcon","skillIcon" + _loc6_,_loc12_.getNextHighestDepth());
         var _loc13_ = (MovieClip)_loc19_.create(_loc10_,_loc5_[_loc6_ + 1],"icon",3,3,40,40);
         lib.manager.ToolTip.add(_loc13_,_loc5_[_loc6_],6,_loc13_.icon);
         _loc10_._x = 55 * (_loc6_ / 2 - 1) + 14;
         _loc10_._y = 36;
         _loc6_ = _loc6_ + 2;
      }
      if(_loc5_.length < 7)
      {
         _loc7_ = Math.max(_loc7_,228);
      }
      else if(_loc5_.length > 12)
      {
         _loc7_ = Math.max(_loc7_,913);
      }
      else
      {
         _loc7_ = Math.max(_loc7_,456);
      }
      var _loc9_ = _loc11_._y + _loc11_._height - 4;
      var _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         var _loc16_ = _loc4_[_loc3_];
         _loc4_[_loc3_].bg._width = _loc7_;
         if(_loc4_[_loc3_ - 1] == undefined)
         {
            _loc4_[_loc3_]._x = 1;
            _loc4_[_loc3_]._y = _loc9_;
         }
         else if(_loc4_[_loc3_ - 1]._x + _loc7_ * 2 < 920)
         {
            _loc4_[_loc3_]._x = _loc4_[_loc3_ - 1]._x + _loc7_;
            _loc4_[_loc3_]._y = _loc9_;
         }
         else
         {
            _loc4_[_loc3_]._x = 1;
            _loc4_[_loc3_]._y = _loc9_ + _loc4_[_loc3_]._height;
         }
         _loc9_ = _loc4_[_loc3_]._y;
         _loc3_ = _loc3_ + 1;
      }
      _loc17_ = _loc12_._y + _loc12_._height + 1;
      _loc8_ = _loc8_ + 1;
   }
   setSubTitle(true,"$471042");
   setGuideText("$471114");
   container_mc.scrollbar._visible = true;
   container_mc.scrollbar.pageSize = _loc15_._height;
   container_mc.scrollbar.displaySize = container_mc.maskArea._height;
   container_mc.scrollbar.rowHeight = lib.manager.UISkin.LISTLINE_HEIGHT;
   _loc15_.onScroll = function()
   {
      this._y = contContainerMcY - arguments[0];
   };
   container_mc.scrollbar.setWheel(_loc15_);
   container_mc.scrollbar.addListener(_loc15_);
};
var infoBoxFd = new src.union.S1TextField();
myListener.OnGame_Union_SetMyInfo = function(_data)
{
   var _loc10_ = container_mc.myInfoContainer;
   changeContainer(_loc10_);
   var _loc3_ = parser(_data);
   var _loc4_ = _loc10_.infoContainer;
   _loc4_.removeMovieClip();
   _loc4_ = _loc10_.createEmptyMovieClip("infoContainer",10);
   _loc4_._x = 193;
   _loc4_._y = 136;
   var _loc7_ = -3;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      var _loc6_ = _loc4_.attachMovie("myinfoBox","infoBox" + _loc1_,_loc4_.getNextHighestDepth());
      _loc6_._x = 0;
      _loc6_._y = _loc7_ + 3;
      _loc6_._width = 454;
      infoBoxFd.textFormat.color = 13824767;
      infoBoxFd.textFormat.align = "left";
      infoBoxFd.create(_loc4_,"boxtitle" + _loc1_,_loc3_[_loc1_][0],_loc6_._x + 5,_loc6_._y + 2,442,36);
      var _loc2_ = 1;
      while(_loc2_ < _loc3_[_loc1_].length)
      {
         var _loc5_ = _loc6_._y + 32 + 30 * int(_loc2_ / 2);
         if(_loc3_[_loc1_].length > 3 && _loc2_ < _loc3_[_loc1_].length - 3)
         {
            _loc4_.attachMovie("myinfoBoxLine","line" + _loc1_ + "_" + _loc2_,_loc4_.getNextHighestDepth(),{_x:140,_y:_loc5_ + 14});
         }
         infoBoxFd.textFormat.color = 6915227;
         infoBoxFd.textFormat.align = "left";
         infoBoxFd.create(_loc4_,"label" + _loc1_ + "_" + _loc2_,_loc3_[_loc1_][_loc2_],5,_loc5_,250,36);
         infoBoxFd.textFormat.color = 14145495;
         infoBoxFd.textFormat.align = "right";
         infoBoxFd.create(_loc4_,"value" + _loc1_ + "_" + (_loc2_ + 1),_loc3_[_loc1_][_loc2_ + 1],150,_loc5_,300,36);
         _loc7_ = _loc5_ + 40;
         _loc2_ = _loc2_ + 2;
      }
      _loc6_._height = _loc7_ - _loc6_._y;
      _loc1_ = _loc1_ + 1;
   }
   setSubTitle(true,"$471110");
   setGuideText("$471043");
};
var historyStyle = new TextField.StyleSheet();
historyStyle.setStyle("time",{color:"#acd373"});
historyStyle.setStyle("hl",{color:"#00ff00"});
container_mc.myInfoContainer.historyFd.styleSheet = historyStyle;
myListener.OnGame_Union_SetMyInfoHistory = function(_history, currentpage, totalpage)
{
   if(_history == undefined)
   {
      _history = "";
   }
   var _loc1_ = container_mc.myInfoContainer;
   _loc1_.defaultStr._visible = _history == "";
   _loc1_.scrollbar.setTextField(_loc1_.historyFd);
   _loc1_.historyFd.htmlText = _history;
   _loc1_.numberSteper.setPage(Number(currentpage),Number(totalpage));
   _loc1_.numberSteper.onChanged = function(page)
   {
      ToGame_Union_GoToHistoryPage(page);
   };
};
var _chartDataInst0 = new src.union.chart.ChartData(0,"$471021");
var _chartDataInst1 = new src.union.chart.ChartData(1,"$471022");
var _chartDataInst2 = new src.union.chart.ChartData(2,"$471023");
_chartDataInst0.addSkin(container_mc.unionRaceChartContainer.chartContainer0);
_chartDataInst1.addSkin(container_mc.unionRaceChartContainer.chartContainer1);
_chartDataInst2.addSkin(container_mc.unionRaceChartContainer.chartContainer2);
var chartColorTable = [undefined,{color:4535954},{color:8926016},{color:11113766},{color:1615767}];
container_mc.unionRaceChartContainer.chartContainer0.setStyle(chartColorTable);
container_mc.unionRaceChartContainer.chartContainer1.setStyle(chartColorTable);
container_mc.unionRaceChartContainer.chartContainer2.setStyle(chartColorTable);
container_mc.unionRaceChartContainer.chartContainer0.maxSize = 100;
container_mc.unionRaceChartContainer.chartContainer1.maxSize = 100;
container_mc.unionRaceChartContainer.chartContainer2.maxSize = 100;
var prevCheck = [];
myListener.OnGame_Union_SetUnionRace = function(_data0, _data1, _data2)
{
   changeContainer(container_mc.unionRaceChartContainer);
   var _loc6_ = parser(_data0);
   var _loc11_ = parser(_data1);
   var _loc12_ = parser(_data2);
   container_mc.unionRaceChartContainer.chartContainer0.txt.text = "$471021";
   container_mc.unionRaceChartContainer.chartContainer1.txt.text = "$471022";
   container_mc.unionRaceChartContainer.chartContainer2.txt.text = "$471023";
   var _loc13_ = new flash.geom.ColorTransform();
   var _loc2_ = 0;
   while(_loc2_ < _loc6_.length)
   {
      var _loc5_ = new src.union.chart.ChartData(_loc2_,_loc6_[_loc2_][0],Number(_loc6_[_loc2_][1]),100);
      var _loc8_ = new src.union.chart.ChartData(_loc2_,_loc11_[_loc2_][0],Number(_loc11_[_loc2_][1]),100);
      var _loc7_ = new src.union.chart.ChartData(_loc2_,_loc12_[_loc2_][0],Number(_loc12_[_loc2_][1]),100);
      var _loc3_ = container_mc.unionRaceChartContainer.chartSectionContainer["sectionMc" + _loc2_];
      if(_loc3_ == undefined)
      {
         _loc3_ = container_mc.unionRaceChartContainer.chartSectionContainer.attachMovie("chartSection","sectionMc" + _loc2_,container_mc.unionRaceChartContainer.chartSectionContainer.getNextHighestDepth());
         _loc3_.idx = _loc2_;
         _loc3_._x = 18;
         _loc3_._y = 40 * _loc2_ + 4;
         container_mc.unionRaceChartContainer.chartSectionContainer.bgMc._height = 40 * (_loc2_ + 1) + 8;
         _loc3_.checkBtn.onChanged = function(flag)
         {
            prevCheck[this._parent.idx] = flag;
            this._parent.data0.toggle = flag;
            this._parent.data1.toggle = flag;
            this._parent.data2.toggle = flag;
         };
         _loc3_.txt.verticalAlign = "center";
         _loc3_.txt.setText(_loc6_[_loc2_][0]);
         var _loc10_ = new flash.geom.Transform(_loc3_.colorMc);
         var _loc9_ = chartColorTable[_loc2_];
         if(_loc9_ != undefined)
         {
            _loc13_.rgb = _loc9_.color;
            _loc10_.colorTransform = _loc13_;
         }
      }
      var _loc4_ = Number(_loc6_[_loc2_][2]);
      if(prevCheck[_loc2_] == false)
      {
         _loc4_ = false;
      }
      _loc5_.toggle = Boolean(_loc4_);
      _loc8_.toggle = Boolean(_loc4_);
      _loc7_.toggle = Boolean(_loc4_);
      _loc3_.data0 = _loc5_;
      _loc3_.data1 = _loc8_;
      _loc3_.data2 = _loc7_;
      _loc3_.checkBtn.onEnterFrame = function()
      {
         delete this.onEnterFrame;
         if(this.checked !== this._parent.data0.toggle)
         {
            this.checked = this._parent.data0.toggle;
         }
      };
      (lib.controls.S_CheckBox)_loc3_.checkBtn.__set__checked(_loc5_.toggle);
      _chartDataInst0.add(_loc5_);
      _chartDataInst1.add(_loc8_);
      _chartDataInst2.add(_loc7_);
      _loc2_ = _loc2_ + 1;
   }
   setSubTitle(true,"$471111");
   setGuideText("$471115");
};
myListener.OnGame_Union_SetGuildRace = function(_data, myGuild, currentpage, totalpage, sortDisable)
{
   var _loc1_ = parser(_data);
   _loc1_[MAXLISTCOUNT - 1] = parser(myGuild)[0];
   var _loc3_ = [new src.union.ColumRankType(100,30),new src.union.ColumIconType(229,30),new src.union.ColumIconType(234,30),new src.union.ColumNormal(184,30,"right"),new src.union.ColumIconType(194,30,"center")];
   var _loc4_ = {label:["$221056","$271020","$471044","$471031","$471032"],size:[100,229,234,184,194]};
   buildList(_loc4_,_loc3_,_loc1_,MAXLISTCOUNT - 1,false);
   container_mc.listContainerMc.countFd.htmlText = "";
   container_mc.listContainerMc.countFdBg._visible = false;
   container_mc.listContainerMc.numberSteper._visible = true;
   container_mc.listContainerMc.numberSteper.setPage(Number(currentpage),Number(totalpage));
   var _loc2_ = lib.util.ExtString.split(sortDisable,"\t");
   container_mc.listContainerMc.sortMc.setSortEnable(false,_loc2_);
   setSubTitle(true,"$471045");
   setGuideText("$471046");
};
myListener.OnGame_Union_SetPersonalRace = function(_data, myIndex, currentpage, totalpage, sortDisable)
{
   var _loc3_ = parser(_data);
   var _loc1_ = [new src.union.ColumRankType(100,30),new src.union.ColumNormal(179,30),new src.union.ColumIconType(176,30),new src.union.ColumIconType(199,30),new src.union.ColumNormal(133,30,"right"),new src.union.ColumIconType(154,30,"center")];
   var _loc4_ = {label:["$221056","$111006","$471044","$271020","$471031","$471032"],size:[100,179,176,199,133,154]};
   if(permmision == "0")
   {
      _loc1_[5] = undefined;
   }
   buildList(_loc4_,_loc1_,_loc3_,Number(myIndex),false,2);
   container_mc.listContainerMc.numberSteper._visible = true;
   container_mc.listContainerMc.numberSteper.setPage(Number(currentpage),Number(totalpage));
   container_mc.listContainerMc.countFd.htmlText = "";
   container_mc.listContainerMc.countFdBg._visible = false;
   var _loc2_ = lib.util.ExtString.split(sortDisable,"\t");
   container_mc.listContainerMc.sortMc.setSortEnable(false,_loc2_);
   setSubTitle(true,"$471047");
   setGuideText("$471144");
};
var maxNocInfoX = 100;
var i = 0;
while(i < 3)
{
   maxNocInfoX = Math.max(container_mc.trainingContainer["title" + i].textWidth,maxNocInfoX);
   i++;
}
var nocToolTip = lib.util.UIString.getUIString("$471126") + "/" + lib.util.UIString.getUIString("$471125");
myListener.OnGame_Union_SetTrainingRace = function(timer, union, guide)
{
   var _loc2_ = container_mc.trainingContainer;
   changeContainer(_loc2_);
   var _loc5_ = parser(timer);
   var _loc4_ = parser(union);
   if(guide == "$470116")
   {
      guide = lib.util.UIString.getUIString("$470116");
   }
   _loc2_.startTimeFd.text = lib.util.UIString.getUIString("$471049","hour",_loc5_[0][0]);
   _loc2_.endTimeFd.text = lib.util.UIString.getUIString("$471049","hour",_loc5_[0][1]);
   if(_loc5_[0][3] == "0")
   {
      _loc2_.remainTimeFd.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
      _loc2_.remainTimeFd.text = lib.util.UIString.getUIString("$471117");
   }
   else
   {
      _loc2_.remainTimeFd.textColor = 14145495;
      _loc2_.remainTimeFd.text = _loc5_[0][2] + lib.util.UIString.getUIString("$471050");
   }
   _loc2_.timerBarMc.mask._xscale = Number(_loc5_[0][3]);
   _loc2_.timerBarMc.lineMc._x = _loc2_.timerBarMc.mask._x - _loc2_.timerBarMc.mask._width;
   var _loc1_ = 0;
   while(_loc1_ < 3)
   {
      _loc2_["gageFd" + _loc1_].text = _loc4_[_loc1_][0] + "%";
      _loc2_["gageBar" + _loc1_].mask._xscale = Number(_loc4_[_loc1_][0]);
      _loc2_["rankMc" + _loc1_].rankFd.text = _loc4_[_loc1_][1] + lib.util.UIString.getUIString("$221058");
      _loc2_["rankMc" + _loc1_]._x = Math.max(_loc2_["gageBar" + _loc1_]._x + _loc2_["rankMc" + _loc1_].rankFd.textWidth + _loc2_["gageFd" + _loc1_].textWidth + 15,_loc2_["gageBar" + _loc1_]._x + _loc2_["gageBar" + _loc1_].mask._width + 20);
      _loc2_["rankMc" + _loc1_].gotoAndStop(Number(_loc4_[_loc1_][1]));
      var _loc3_ = _loc2_["compInfMc" + _loc1_];
      _loc3_.pointTxt.htmlText = "<font color=\'#0DC5F2\'>" + _loc4_[_loc1_][3] + "</font> / <font color=\'#80E71C\'>" + _loc4_[_loc1_][2] + "<img src=\'img://__Icon_Items.UnionpointCoin\' width=\'22\' height=\'22\' vspace=\'-3\'></font>";
      _loc3_.bg._width = _loc3_.pointTxt._x + _loc3_.pointTxt.textWidth + 10;
      _loc3_._x = _loc2_["title" + _loc1_]._x + maxNocInfoX + 30;
      lib.manager.ToolTip.add(_loc3_.pointTxt,nocToolTip,1);
      _loc1_ = _loc1_ + 1;
   }
   _loc2_.guideFd.htmlText = guide;
   setSubTitle(true,"$471112");
   setGuideText("$471116");
};
var scheduleUnionName = new src.union.ColumIconType(167,31);
myListener.OnGame_Union_SetTrainingSchedule = function(todayDate, nextDate, todayShare, nextShare, todaySchedule, nextSchedule, timeLagNum)
{
   var _loc10_ = 0;
   if(timeLagNum)
   {
      _loc10_ = timeLagNum;
   }
   var _loc4_ = container_mc.trainingScheduleContainer;
   changeContainer(_loc4_);
   _loc4_.titleFd0.text = lib.util.UIString.getUIString("$471051") + "(" + todayDate + ")";
   _loc4_.titleFd1.text = lib.util.UIString.getUIString("$471052") + "(" + nextDate + ")";
   var _loc7_ = parser(todayShare);
   _loc4_.infoFd0.htmlText = "";
   var _loc2_ = 0;
   while(_loc2_ < _loc7_.length)
   {
      _loc4_.infoFd0.htmlText = _loc4_.infoFd0.htmlText + ("<img src=\'" + _loc7_[_loc2_][0] + "\' width=\'22\' height=\'22\' vspace=\'-7\'/>" + _loc7_[_loc2_][1] + " : <font color=\'#d7d7d7\'>" + _loc7_[_loc2_][2] + "</font><br>");
      _loc2_ = _loc2_ + 1;
   }
   if(_loc7_.length < 2)
   {
      _loc4_.infoFd0.htmlText = todayShare;
   }
   var _loc8_ = parser(nextShare);
   _loc4_.infoFd1.htmlText = "";
   _loc2_ = 0;
   while(_loc2_ < _loc8_.length)
   {
      _loc4_.infoFd1.htmlText = _loc4_.infoFd1.htmlText + ("<img src=\'" + _loc8_[_loc2_][0] + "\' width=\'22\' height=\'22\' vspace=\'-7\'/>" + _loc8_[_loc2_][1] + " : <font color=\'#d7d7d7\'>" + _loc8_[_loc2_][2] + "</font><br>");
      _loc2_ = _loc2_ + 1;
   }
   if(_loc8_.length < 2)
   {
      _loc4_.infoFd1.htmlText = nextShare;
   }
   var _loc6_ = parser(todaySchedule);
   var _loc9_ = parser(nextSchedule);
   _loc2_ = 0;
   while(_loc2_ < 24)
   {
      var _loc1_ = _loc4_["scheduleLine0_" + _loc2_];
      var _loc3_ = _loc4_["scheduleLine1_" + _loc2_];
      var _loc5_ = (Number(_loc2_) + 24 + Number(_loc10_)) % 24;
      if(_loc1_ == undefined)
      {
         _loc1_ = _loc4_.attachMovie("scheduleLine","scheduleLine0_" + _loc2_,_loc4_.getNextHighestDepth());
         _loc3_ = _loc4_.attachMovie("scheduleLine","scheduleLine1_" + _loc2_,_loc4_.getNextHighestDepth());
         _loc1_._x = 190 + int(_loc2_ / 12) * 232;
         _loc1_._y = 247 + 34 * (_loc2_ % 12);
         _loc1_.timeFd.text = _loc5_;
         _loc3_.timeFd.text = _loc5_;
         if(_loc5_ < 10)
         {
            _loc1_.timeFd.text = "0" + _loc1_.timeFd.text;
            _loc3_.timeFd.text = "0" + _loc3_.timeFd.text;
         }
         _loc3_._x = 190 + int(_loc2_ / 12) * 232 + 470;
         _loc3_._y = 247 + 34 * (_loc2_ % 12);
         _loc3_.timeFd.textColor = 6915227;
      }
      scheduleUnionName.create(_loc1_,"nameFd",_loc6_[_loc2_],64,2);
      scheduleUnionName.create(_loc3_,"nameFd",_loc9_[_loc2_],64,2);
      _loc3_.nameFd.textColor = 7368816;
      _loc3_.scheduleLineBg._visible = false;
      _loc1_.timeFd.text = _loc5_;
      _loc3_.timeFd.text = _loc5_;
      if(_loc5_ < 10)
      {
         _loc1_.timeFd.text = "0" + _loc1_.timeFd.text;
         _loc3_.timeFd.text = "0" + _loc3_.timeFd.text;
      }
      if(_loc6_[_loc2_][2] == "-1")
      {
         _loc1_.nameFd.textColor = 7368816;
         _loc1_.timeFd.textColor = 7368816;
      }
      else if(_loc6_[_loc2_][2] == "1")
      {
         _loc1_.nameFd.textColor = 8447772;
         _loc1_.timeFd.textColor = 14145495;
      }
      else
      {
         _loc1_.nameFd.textColor = 14145495;
         _loc1_.timeFd.textColor = 14145495;
      }
      _loc1_.scheduleLineBg._visible = _loc6_[_loc2_][2] == "1";
      _loc1_.unionBg.gotoAndStop(Number(_loc6_[_loc2_][3]) + 1);
      _loc3_.unionBg.gotoAndStop(Number(_loc9_[_loc2_][2]) + 1);
      _loc2_ = _loc2_ + 1;
   }
   setGuideText("$471053");
   setSubTitle(true,"$471054");
};
myListener.OnGame_Union_SetConsulPolicyLog = function(_data0, _data1, point, permmision)
{
   changeContainer(container_mc.consulPolicyContainer);
   container_mc.consulPolicyContainer.sortMc0.clear();
   container_mc.consulPolicyContainer.sortMc0.colums = [523,204,214];
   container_mc.consulPolicyContainer.sortMc0.labels = ["$471025","$471026","$471027"];
   container_mc.consulPolicyContainer.sortMc1.clear();
   container_mc.consulPolicyContainer.sortMc1.colums = [330,193,204,214];
   container_mc.consulPolicyContainer.sortMc1.labels = ["$471055","$471028","$471056","$471027"];
   var _loc4_ = parser(_data0);
   var _loc3_ = parser(_data1);
   var _loc10_ = container_mc.consulPolicyContainer.containerMc0;
   var _loc11_ = container_mc.consulPolicyContainer.containerMc1;
   _loc10_.removeMovieClip();
   _loc11_.removeMovieClip();
   _loc10_ = container_mc.consulPolicyContainer.createEmptyMovieClip("containerMc0",container_mc.consulPolicyContainer.getNextHighestDepth());
   _loc10_._x = 191;
   _loc10_._y = 171;
   _loc11_ = container_mc.consulPolicyContainer.createEmptyMovieClip("containerMc1",container_mc.consulPolicyContainer.getNextHighestDepth());
   _loc11_._x = 191;
   _loc11_._y = 351;
   var _loc8_ = [new src.union.ColumNormal(523,30,"center"),new src.union.ColumNormal(204,30,"center"),new src.union.ColumNormal(214,30,"right",undefined,20)];
   var _loc9_ = [new src.union.ColumNormal(330,30,"center"),new src.union.ColumNormal(193,30,"right",undefined,20),new src.union.ColumNormal(204,30,"center"),new src.union.ColumNormal(214,30,"right",undefined,20)];
   container_mc.consulPolicyContainer.countFd._visible = true;
   if(permmision == "0")
   {
      _loc8_[2] = undefined;
      _loc9_[3] = undefined;
      container_mc.consulPolicyContainer.sortMc0.setDisable([2]);
      container_mc.consulPolicyContainer.sortMc1.setDisable([3]);
      container_mc.consulPolicyContainer.countFd._visible = false;
   }
   var _loc2_ = 0;
   while(_loc2_ < _loc4_.length)
   {
      if(_loc4_[_loc2_] != undefined)
      {
         var _loc6_ = _loc10_.attachMovie("lineObj","line" + _loc2_,_loc10_.getNextHighestDepth());
         _loc6_.index = _loc2_;
         _loc6_._y = 30 * _loc2_;
         var _loc7_ = 0;
         var _loc1_ = 0;
         while(_loc1_ < _loc4_[_loc2_].length)
         {
            var _loc5_ = _loc4_[_loc2_][_loc1_];
            if(_loc1_ == 1)
            {
               _loc5_ = _loc4_[_loc2_][_loc1_] != "1"?["<font color=\'#707070\'>" + lib.util.UIString.getUIString("$471058") + "</font>"]:["<font color=\'#80E71C\'>" + lib.util.UIString.getUIString("$471057") + "</font>"];
            }
            _loc8_[_loc1_].create(_loc6_,"fd" + _loc1_,_loc5_,_loc7_,0);
            _loc7_ = _loc7_ + (_loc8_[_loc1_]._w + container_mc.consulPolicyContainer.sortMc0._space);
            _loc1_ = _loc1_ + 1;
         }
      }
      _loc2_ = _loc2_ + 1;
   }
   _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      if(_loc3_[_loc2_] != undefined)
      {
         _loc6_ = _loc11_.attachMovie("lineObj","line" + _loc2_,_loc11_.getNextHighestDepth());
         _loc6_.index = _loc2_;
         _loc6_._y = 30 * _loc2_;
         _loc7_ = 0;
         _loc1_ = 0;
         while(_loc1_ < _loc3_[_loc2_].length)
         {
            _loc5_ = _loc3_[_loc2_][_loc1_];
            if(_loc1_ == 2)
            {
               _loc5_ = _loc3_[_loc2_][_loc1_] != "1"?["<font color=\'#707070\'>" + lib.util.UIString.getUIString("$471059") + "</font>"]:["<font color=\'#80E71C\'>" + lib.util.UIString.getUIString("$471056") + "</font>"];
            }
            _loc9_[_loc1_].create(_loc6_,"fd" + _loc1_,_loc5_,_loc7_,0);
            _loc7_ = _loc7_ + (_loc9_[_loc1_]._w + container_mc.consulPolicyContainer.sortMc1._space);
            _loc1_ = _loc1_ + 1;
         }
      }
      _loc2_ = _loc2_ + 1;
   }
   container_mc.consulPolicyContainer.countFd.htmlText = lib.util.UIString.getUIString("$471060") + "<font color=\'#80E71C\'>" + lib.util.CurrencyFormat.makeComma(point) + "</font>";
   setGuideText("$471061");
   setSubTitle(true,"$471062");
};
myListener.OnGame_Union_SetCommanderPolicyLog = function(_data, currentpage, totalpage, sortDisable, permmision)
{
   var _loc4_ = parser(_data);
   var _loc1_ = [new src.union.ColumNormal(96,30,"center"),new src.union.ColumIconType(176,30),new src.union.ColumNormal(200,30),new src.union.ColumIconType(200,30),new src.union.ColumNormal(114,30,"right",undefine,10),new src.union.ColumNormal(155,30,"right",undefined,10)];
   var _loc5_ = {label:["$471063","$471033","$471064","$271020","$471065","$471122"],size:[96,176,200,200,114,155]};
   if(permmision == "0")
   {
      _loc1_[5] = undefined;
   }
   buildList(_loc5_,_loc1_,_loc4_,undefined,permmision == "1",2);
   container_mc.listContainerMc.numberSteper._visible = true;
   container_mc.listContainerMc.numberSteper.setPage(Number(currentpage),Number(totalpage));
   container_mc.listContainerMc.countFd.htmlText = "";
   container_mc.listContainerMc.countFdBg._visible = false;
   var _loc2_ = lib.util.ExtString.split(sortDisable,"\t");
   container_mc.listContainerMc.sortMc.setSortEnable(false,_loc2_);
   if(permmision == "0")
   {
      container_mc.listContainerMc.sortMc.setDisable([5]);
   }
   setSubTitle(true,"$471113");
   setGuideText("$471123");
};
myListener.OnGame_Union_SetElitePolicyLog = function(_data, currentpage, totalpage, sortDisable, permmision)
{
   var _loc3_ = parser(_data);
   var _loc1_ = [new src.union.ColumNormal(96,30,"center"),new src.union.ColumNormal(200,30),new src.union.ColumIconType(200,30),new src.union.ColumNormal(114,30,"right",undefined,10),new src.union.ColumNormal(176,30,"right",undefined,10),new src.union.ColumNormal(155,30,"right",undefined,10)];
   var _loc4_ = {label:["$471063","$471064","$271020","$471065","$471068","$471122"],size:[96,200,200,114,176,155]};
   if(permmision == "0")
   {
      _loc1_[5] = undefined;
   }
   buildList(_loc4_,_loc1_,_loc3_,undefined,undefined,1);
   container_mc.listContainerMc.numberSteper._visible = true;
   container_mc.listContainerMc.numberSteper.setPage(Number(currentpage),Number(totalpage));
   container_mc.listContainerMc.countFd.htmlText = "";
   container_mc.listContainerMc.countFdBg._visible = false;
   var _loc2_ = lib.util.ExtString.split(sortDisable,"\t");
   container_mc.listContainerMc.sortMc.setSortEnable(false,_loc2_);
   if(permmision == "0")
   {
      container_mc.listContainerMc.sortMc.setDisable([5]);
   }
   setSubTitle(true,"$471069",undefined,true);
   setGuideText("$471070");
};
var x_btn = new lib.util.TxtBtn(container_mc.x_m);
x_btn.setRelease(ToGame_Union_Close);
ToGame_Union_Init();
