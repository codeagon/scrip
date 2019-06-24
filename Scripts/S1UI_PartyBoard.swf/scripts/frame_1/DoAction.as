function clearInfo()
{
   list1.clear();
   list2.clear();
   clickStat1 = null;
   clickId1 = null;
   purpose = "";
   container_mc.purpose_txt.text = "";
   container_mc.pur1_txt._visible = false;
   container_mc.pur2_txt._visible = false;
   volunteer_btn.setEnabled(false);
}
function ToGame_PartyBoard_ClickLine(lineId)
{
   getURL("FSCommand:ToGame_PartyBoard_ClickLine",lineId);
}
function ToGame_PartyBoard_RequestSetPage(num)
{
   getURL("FSCommand:ToGame_PartyBoard_RequestSetPage",num);
}
function ToGame_PartyBoard_CloseUI()
{
   fscommand("ToGame_PartyBoard_CloseUI");
}
function ToGame_PartyBoard_Write()
{
   fscommand("ToGame_PartyBoard_Write");
}
function ToGame_PartyBoard_Refresh()
{
   fscommand("ToGame_PartyBoard_Refresh");
}
function ToGame_PartyBoard_Promote()
{
   fscommand("ToGame_PartyBoard_Promote");
}
function ToGame_PartyBoard_Remove()
{
   fscommand("ToGame_PartyBoard_Remove");
}
function ToGame_PartyBoard_Search()
{
   var _loc1_ = getSearchConditionStr();
   getURL("FSCommand:ToGame_PartyBoard_Search",_loc1_);
}
function getSearchConditionStr()
{
   var _loc2_ = "";
   var _loc1_ = lib.util.ExtString.trim(searchInput_txt.text);
   if(_loc1_ == lib.util.UIString.getUIString("$331016"))
   {
      _loc1_ = "";
   }
   _loc2_ = minLevel_txt.text + "\t" + maxLevel_txt.text + "\t" + _loc1_;
   return _loc2_;
}
function ToGame_PartyBoard_InitSearchCondition()
{
   fscommand("ToGame_PartyBoard_InitSearchCondition");
}
function ToGame_PartyBoard_SortList(sortKey)
{
   getURL("FSCommand:ToGame_PartyBoard_SortList",sortKey);
}
function ToGame_PartyBoard_SearchCondition()
{
   var _loc1_ = getSearchConditionStr();
   getURL("FSCommand:ToGame_PartyBoard_SearchCondition",_loc1_);
}
function ToGame_PartyBoard_RequestPartyMatching()
{
   fscommand("ToGame_PartyBoard_RequestPartyMatching");
}
function write()
{
   ToGame_PartyBoard_Write();
}
function volunteer()
{
   ToGame_PartyBoard_Volunteer();
}
function closeUI()
{
   ToGame_PartyBoard_CloseUI();
}
function refresh()
{
   ToGame_PartyBoard_Refresh();
}
var UI = this;
UI._visible = false;
var UIname = "PartyBoard";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var con = this;
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.defaultStr.textColor = lib.info.TextColor.GENERAL_DISABLE;
container_mc.purpose_txt.autoSize = "fit";
container_mc.tab2_txt.autoSize = "shrink";
container_mc.explain_0.hitTestDisable = container_mc.lv2_txt.hitTestDisable = true;
lib.util.ExtString.textCut(container_mc.refresh_txt,lib.util.UIString.getUIString("$331002"),1);
lib.util.ExtString.textCut(container_mc.tab0_txt,lib.util.UIString.getUIString("$331003"),1);
lib.util.ExtString.textCut(container_mc.tab1_txt,lib.util.UIString.getUIString("$331004"),1);
lib.util.ExtString.textCut(container_mc.tab2_txt,lib.util.UIString.getUIString("$331005"),1);
lib.util.ExtString.textCut(container_mc.tab2_0_txt,lib.util.UIString.getUIString("$331006"),1);
lib.util.ExtString.textCut(container_mc.tab2_1_txt,lib.util.UIString.getUIString("$331007"),1);
lib.util.ExtString.textCut(container_mc.tab2_2_txt,lib.util.UIString.getUIString("$331008"),1);
lib.util.ExtString.textCut(container_mc.tab2_3_txt,lib.util.UIString.getUIString("$331009"),1);
container_mc.defaultStr.setText(lib.util.UIString.getUIString("$111039"));
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var CustomScaleEvent;
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
         ToGame_PartyBoard_SearchCondition();
      }
      if(UI._visible == true)
      {
         CustomScaleEvent = new CustomScaleEvent();
         CustomScaleEvent.CustomScaleEventCheck(UI,UIname);
         UI.scaleExpander.scaleExpanderEventCheck(UI,UIname);
      }
      else
      {
         CustomScaleEvent.CustomScaleEventRemoveCheck();
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
myListener.OnGame_PartyBoard_SetPageInfo = function(currentPage, totalPage)
{
   var _loc1_ = container_mc.numberSteper;
   _loc1_.min = 0;
   _loc1_.max = totalPage;
   _loc1_.min = 1;
   _loc1_.setPage(currentPage,totalPage);
   _loc1_.onChanged = function(changed)
   {
      if(changed)
      {
         ToGame_PartyBoard_RequestSetPage(changed);
      }
   };
};
var clickStat1 = null;
var clickId1 = null;
var list = container_mc.list_mc;
var detail = container_mc.detail_mc;
var lineName = "line";
var detailName = "detail";
var list1 = new lib.util.List(list,lineName,0);
var list2 = new lib.util.List(detail,detailName,0);
list1.bg = "bg_mc";
var purpose = "";
var NameTextLength_Local = 0;
myListener.OnGame_PartyBoard_SetPageData = function(dataList)
{
   clearInfo();
   var _loc5_ = dataList.split("\n");
   if(_loc5_[_loc5_.length - 1] == "0" || _loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
   {
      _loc5_.splice(_loc5_.length - 1,1);
   }
   if(_loc5_[0] != undefined && _loc5_[0] != "")
   {
      container_mc.defaultStr._visible = false;
   }
   else
   {
      container_mc.defaultStr._visible = true;
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc5_.length)
   {
      var _loc3_ = _loc5_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc2_ = list1.add(_loc3_[0],lineName);
         var _loc6_ = Number(_loc3_[6]);
         _loc2_.block_mc._visible = _loc6_;
         if(_loc6_)
         {
            _loc2_.txt1._width = 122;
            _loc2_.txt1._x = 397;
            lib.manager.ToolTip.add(_loc2_.block_mc,lib.util.UIString.getUIString("$101085"),1);
         }
         else
         {
            _loc2_.txt1._width = 139;
            _loc2_.txt1._x = 380;
         }
         _loc2_.stat = _loc4_;
         if(_loc3_[7] == 0)
         {
            _loc2_.txt0.setText(_loc3_[1]);
         }
         else
         {
            var _loc7_ = "<img src=\'raid_icon\' vspace=\'-2\'>" + _loc3_[1];
            _loc2_.txt0.setText(_loc7_);
            lib.manager.ToolTip.add(_loc2_.raid_tooltip,lib.util.UIString.getUIString("$331022"),1);
         }
         _loc2_.purpose = _loc3_[1];
         _loc2_.txt1.setText(_loc3_[2]);
         _loc2_.txt2.text = _loc3_[3] + "/" + _loc3_[4];
         if(_loc3_[5] == "1")
         {
            _loc2_.txt0.textColor = _loc2_.txt1.textColor = _loc2_.txt2.textColor = lib.info.TextColor.LIST_PARTYBOARD_MY;
         }
         else
         {
            _loc2_.txt0.textColor = _loc2_.txt1.textColor = _loc2_.txt2.textColor = lib.info.TextColor.GENERAL_CONTENTS;
         }
         _loc2_.hit_mc.stat = _loc4_;
         _loc2_.hit_mc.onRollOver = function()
         {
            if(clickStat1 != this._parent.stat)
            {
               this._parent.effect_mc.gotoAndStop("over");
            }
            else
            {
               this._parent.effect_mc.gotoAndStop("press");
            }
         };
         _loc2_.hit_mc.onRollOut = _loc2_.hit_mc.onReleaseOutside = function()
         {
            if(clickStat1 != this._parent.stat)
            {
               this._parent.effect_mc.gotoAndStop("out");
            }
            else
            {
               this._parent.effect_mc.gotoAndStop("active");
            }
         };
         _loc2_.hit_mc.onRelease = function()
         {
            if(clickStat1 != this._parent.stat)
            {
               list1.getItem(clickStat1).effect_mc.gotoAndStop("out");
               clickStat1 = this._parent.stat;
               clickId1 = this._parent.id;
               purpose = this._parent.purpose;
               this._parent.effect_mc.gotoAndStop("active");
            }
            ToGame_PartyBoard_ClickLine(this._parent.id);
         };
         lib.util.InteractionGroup.addInteraction(UIname,_loc3_[2],_loc2_.txt100);
      }
      _loc4_ = _loc4_ + 1;
   }
};
myListener.OnGame_PartyBoard_SetSearchInfo = function(minLv, maxLv, searchInputText, searchMaxLevel)
{
   minLevel_txt.setChanged(false);
   maxLevel_txt.setChanged(false);
   searchInput_txt.setChanged(false);
   if(searchMaxLevel != undefined)
   {
      minLevel_txt.max = Number(searchMaxLevel);
      maxLevel_txt.max = Number(searchMaxLevel);
   }
   minLevel_txt.min = 1;
   maxLevel_txt.min = 1;
   minLevel_txt.caption = minLv;
   maxLevel_txt.caption = maxLv;
   if(searchInputText == undefined || searchInputText == "")
   {
      searchInput_txt.caption = lib.util.UIString.getUIString("$331016");
   }
   else
   {
      searchInput_txt.text = searchInputText;
   }
};
myListener.OnGame_PartyBoard_SetBtnText = function(str)
{
   write_btn.setText(str);
};
myListener.OnGame_PartyBoard_SetEnableWriteBtn = function(bEnable)
{
   bEnable = Number(bEnable);
   write_btn.setEnabled(bEnable);
};
myListener.OnGame_PartyBoard_SetEnableRemoveBtn = function(bEnable)
{
   bEnable = Number(bEnable);
   remove_btn.setEnabled(bEnable);
};
myListener.OnGame_PartyBoard_SetEnablePromoteBtn = function(bEnable)
{
   bEnable = Number(bEnable);
   promote_btn.setEnabled(bEnable);
};
container_mc.sortBtn.onSelected = function(index)
{
   ToGame_PartyBoard_SortList(index);
};
var minLevel_txt = new lib.util.ExtTextField(container_mc.minLevel_txt,1,container_mc.minLevel_focus);
var maxLevel_txt = new lib.util.ExtTextField(container_mc.maxLevel_txt,1,container_mc.maxLevel_focus);
var searchInput_txt = new lib.util.ExtTextField(container_mc.searchInput_txt,0,container_mc.searchInput_focus);
minLevel_txt.onEnterKey = function()
{
   Selection.setFocus(maxLevel_txt.textField);
};
maxLevel_txt.onEnterKey = function()
{
   Selection.setFocus(searchInput_txt.textField);
};
searchInput_txt.onEnterKey = function()
{
   ToGame_PartyBoard_Search();
};
searchInput_txt.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc1_ = NameTextLength_Local;
   }
   else
   {
      _loc1_ = 60;
   }
   lib.util.StrByteLen.getLenth3(container_mc.searchInput_txt,_loc1_);
};
lib.manager.Focus.addFocusGroup(UIname,1,[minLevel_txt,maxLevel_txt,searchInput_txt]);
var partMatchinBtn = new lib.util.TxtBtn(container_mc.partMatchingBtn,container_mc.partMatchingTxt);
partMatchinBtn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
var refresh_btn = new lib.util.TxtBtn(container_mc.refresh_mc,container_mc.refresh_txt);
var search_btn = new lib.util.TxtBtn(container_mc.txtBtn3);
var init_btn = new lib.util.TxtBtn(container_mc.txtBtn4);
var searchStr = lib.util.UIString.getUIString("$331014");
var resetStr = lib.util.UIString.getUIString("$331015");
lib.manager.ToolTip.add(container_mc.txtBtn3,searchStr,1);
lib.manager.ToolTip.add(container_mc.txtBtn4,resetStr,1);
var remove_btn = container_mc.txtBtn1.txtBtn;
var promote_btn = container_mc.txtBtn0.txtBtn;
var write_btn = container_mc.txtBtn2.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
volunteer_btn.setEnabled(false);
write_btn.setEnabled(true);
volunteer_btn.setRelease(volunteer);
write_btn.setRelease(write);
close_btn.setRelease(closeUI);
refresh_btn.setRelease(refresh);
x_btn.setRelease(closeUI);
partMatchinBtn.setRelease(ToGame_PartyBoard_RequestPartyMatching);
search_btn.setRelease(function()
{
   ToGame_PartyBoard_Search();
}
);
init_btn.setRelease(function()
{
   ToGame_PartyBoard_InitSearchCondition();
}
);
promote_btn.setRelease(function()
{
   ToGame_PartyBoard_Promote();
}
);
remove_btn.setRelease(function()
{
   ToGame_PartyBoard_Remove();
}
);
clearInfo();
searchInput_txt.caption = lib.util.UIString.getUIString("$331016");
myListener.OnGame_PartyBoard_SetSearchInfo("1","60");
container_mc.numberSteper.inputFd.type = "dynamic";
container_mc.numberSteper.setPage(0,0);
myListener.OnGame_PartyBoard_LengthLocal = function(lengthnum)
{
   NameTextLength_Local = lengthnum;
};
fscommand("ToGame_PartyBoard_Init");
