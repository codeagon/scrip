function ToGame_LeaderBoard_Init()
{
   fscommand("ToGame_LeaderBoard_Init");
}
function ToGame_LeaderBoard_Close()
{
   ToGame_PlaySound("3022");
   fscommand("ToGame_LeaderBoard_Close");
}
function ToGame_LeaderBoard_SelectTab(index, noRequestEvent)
{
   if(noRequestEvent == 0 && index != curTabIndex)
   {
      curTabIndex = index;
      container_mc.tabBg._x = 9 + curTabIndex * 153;
      container_mc.mBackPoint.gotoAndStop(curTabIndex + 1);
      getURL("FSCommand:ToGame_LeaderBoard_SelectTab",index);
   }
}
function ToGame_LeaderBoard_resetFilter()
{
   fscommand("ToGame_LeaderBoard_resetFilter");
}
function ToGame_LeaderBoard_SelectSubMenu(id)
{
   getURL("FSCommand:ToGame_LeaderBoard_SelectSubMenu",id);
}
function ToGame_LeaderBoard_SelectCombo(comboType, id)
{
   getURL("FSCommand:ToGame_LeaderBoard_SelectCombo",comboType + "\t" + id);
}
function clearSubMenu()
{
   var _loc2_ = 0;
   while(_loc2_ < createdSubMenuCount)
   {
      var _loc1_ = container_mc["subMenu_" + _loc2_];
      _loc1_.id = undefined;
      _loc1_.tf.textColor = SUB_MENU_TEXTCOLOR[0];
      _loc1_.tf._x = _loc1_.tf._y = 0;
      _loc1_.gotoAndStop(1);
      var _loc3_ = new TextFormat();
      _loc3_.size = 15;
      _loc1_.tf.setNewTextFormat(_loc3_);
      _loc1_._visible = false;
      _loc2_ = _loc2_ + 1;
   }
   container_mc.subMenuUnder._visible = false;
}
function setSubMenu(subMenu, id, str)
{
   var _loc1_ = subMenu.tf;
   _loc1_.text = str;
   if(_loc1_.numLines > 2)
   {
      var _loc2_ = new TextFormat();
      _loc2_.size = 13;
      _loc1_.setNewTextFormat(_loc2_);
      _loc1_.text = str;
   }
   subMenu.id = id;
   subMenu._visible = true;
}
function initSubMenu()
{
   var _loc2_ = 0;
   while(_loc2_ < createdSubMenuCount)
   {
      var _loc1_ = container_mc["subMenu_" + _loc2_];
      _loc1_._visible = false;
      _loc1_.tf.verticalAlign = "center";
      _loc1_.tf.hitTestDisable = true;
      setSubMenuMouseEvent(_loc1_);
      _loc2_ = _loc2_ + 1;
   }
}
function setSubMenuMouseEvent(subMenu)
{
   subMenu.onRollOver = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      this.gotoAndStop(2);
      this.tf.textColor = SUB_MENU_TEXTCOLOR[1];
      this.tf._y = -1;
   };
   subMenu.onRollOut = subMenu.onReleaseOutside = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      this.gotoAndStop(1);
      this.tf.textColor = SUB_MENU_TEXTCOLOR[0];
      this.tf._y = 0;
   };
   subMenu.onPress = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      this.gotoAndStop(3);
      this.tf.textColor = SUB_MENU_TEXTCOLOR[0];
      this.tf._y = 1;
   };
   subMenu.onRelease = function()
   {
      if(this._currentframe == 4)
      {
         return undefined;
      }
      currentSelectedSubMenu.gotoAndStop(1);
      currentSelectedSubMenu.tf.textColor = SUB_MENU_TEXTCOLOR[0];
      currentSelectedSubMenu.tf._y = 0;
      currentSelectedSubMenu = this;
      this.gotoAndStop(4);
      this.tf.textColor = SUB_MENU_TEXTCOLOR[3];
      this.tf._y = 0;
      ToGame_LeaderBoard_SelectSubMenu(this.id);
   };
}
function clearList()
{
   var _loc1_ = 0;
   while(_loc1_ < MAX_LIST_COUNT)
   {
      var _loc2_ = container_mc["mc_" + _loc1_];
      clearListMc(_loc2_);
      _loc1_ = _loc1_ + 1;
   }
}
function clearListMc(targetMc)
{
   targetMc.rankTF.text = "";
   targetMc.nameTF.text = "";
   targetMc.classTF.text = "";
   targetMc.pointTF.text = "";
   targetMc.gradeTF.text = "";
   targetMc.changeMc._visible = false;
   targetMc._visible = false;
}
function drawList()
{
   clearList();
   var _loc6_ = listArray.length;
   var _loc5_ = Math.min(scrollValue + MAX_LIST_COUNT,_loc6_);
   var _loc1_ = scrollValue;
   while(_loc1_ < _loc5_)
   {
      var _loc4_ = listArray[_loc1_];
      var _loc3_ = _loc1_ - scrollValue;
      var _loc2_ = container_mc["mc_" + _loc3_];
      _loc2_.bg.gotoAndStop(_loc1_ % 2 + 1);
      setList(_loc2_,_loc4_);
      _loc1_ = _loc1_ + 1;
   }
}
function setList(targetMc, obj)
{
   var _loc3_ = Number(obj.changedType);
   var _loc5_ = obj.changedCount;
   var _loc4_ = obj.rank;
   var _loc6_ = obj.characterName;
   var _loc7_ = obj.characterClass;
   var _loc8_ = obj.point;
   targetMc.gotoAndStop(currentType + 1);
   targetMc.changeMc.gotoAndStop(_loc3_ + 1);
   if(_loc3_ < 2)
   {
      targetMc.changeMc.tf.text = _loc5_;
   }
   targetMc.rankTF.text = _loc4_;
   targetMc.nameTF.text = _loc6_;
   targetMc.classTF.text = _loc7_;
   targetMc.pointTF.text = _loc8_;
   if(currentType == 1)
   {
      targetMc.gradeTF.text = obj.grade;
   }
   targetMc.changeMc._visible = true;
   targetMc._visible = true;
}
function initTab()
{
   var _loc1_ = container_mc.tabBtn.tab;
}
function init()
{
   container_mc.tabBg.hitTestDisable = true;
   initSubMenu();
   initTab();
   ToGame_LeaderBoard_Init();
   this.scaleExpander.scaleExpanderEventCheck(this,UIname);
   container_mc.tCompetitaion.text = lib.util.UIString.getUIString("$730005");
   container_mc.tCompetitaion._width = Math.round(container_mc.tCompetitaion.textWidth + 4);
   container_mc.tCompetitaion._x = TITLE_CENTER_POS - (container_mc.tCompetitaion._width + 24) / 2;
   container_mc.mCompetition._x = container_mc.tCompetitaion._x + container_mc.tCompetitaion._width + 8;
   container_mc.tReward.text = lib.util.UIString.getUIString("$730006");
   container_mc.tReward._width = Math.round(container_mc.tReward.textWidth + 4);
   container_mc.tReward._x = TITLE_CENTER_POS - (container_mc.tReward._width + 24) / 2;
   container_mc.mReward._x = container_mc.tReward._x + container_mc.tReward._width + 8;
   container_mc.tCompetitaion._visible = false;
   container_mc.mCompetition._visible = false;
   container_mc.tReward._visible = false;
   container_mc.mReward._visible = false;
}
function testSetList()
{
   var _loc11_ = ["전체 직업","검투사","창기사","무사","광전사","마법사","궁수","사제","정령사","비검사","마공사","권술사","인술사","월광무사"];
   var _loc13_ = _loc11_.length;
   var _loc12_ = "";
   var _loc10_ = random(50) + 1;
   var _loc1_ = 0;
   while(_loc1_ < _loc10_)
   {
      var _loc8_ = random(4);
      var _loc7_ = random(100);
      var _loc2_ = _loc1_ + 1 + maxRank;
      var _loc4_ = "character" + String(_loc1_ + 1);
      var _loc6_ = random(_loc13_);
      var _loc5_ = _loc11_[_loc6_];
      var _loc9_ = random(3000000) + 1;
      var _loc3_ = _loc8_ + "\t" + _loc7_ + "\t" + _loc2_ + "\t" + _loc4_ + "\t" + _loc5_ + "\t" + _loc9_ + "\n";
      _loc12_ = _loc12_ + _loc3_;
      _loc1_ = _loc1_ + 1;
   }
   myListener.OnGame_LeaderBoard_SetList(_loc12_);
   maxRank = maxRank + _loc10_;
}
function testSetList5()
{
   var _loc12_ = ["전체 직업","검투사","창기사","무사","광전사","마법사","궁수","사제","정령사","비검사","마공사","권술사","인술사","월광무사"];
   var _loc14_ = _loc12_.length;
   var _loc13_ = "";
   var _loc11_ = random(50) + 1;
   var _loc1_ = 0;
   while(_loc1_ < _loc11_)
   {
      var _loc8_ = random(4);
      var _loc7_ = random(100);
      var _loc2_ = _loc1_ + 1 + maxRank;
      var _loc4_ = "character" + String(_loc1_ + 1);
      var _loc6_ = random(_loc14_);
      var _loc5_ = _loc12_[_loc6_];
      var _loc9_ = random(3000000) + 1;
      var _loc10_ = random(20);
      var _loc3_ = _loc8_ + "\t" + _loc7_ + "\t" + _loc2_ + "\t" + _loc4_ + "\t" + _loc5_ + "\t" + _loc9_ + "\t" + _loc10_ + "\n";
      _loc13_ = _loc13_ + _loc3_;
      _loc1_ = _loc1_ + 1;
   }
   myListener.OnGame_LeaderBoard_SetList(_loc13_,1);
   maxRank = maxRank + _loc11_;
}
var UI = this;
UI._visible = false;
var UIname = "LeaderBoard";
var bWindowOpen = false;
var container_mc;
var curTabIndex = 0;
var currentType = 0;
var tabBtn = null;
var prevScrollPosition;
var createdSubMenuCount = 5;
var MAX_LIST_COUNT = 14;
var LIST_MC_HEIGHT = 30;
var COMBO_TYPE_CLASS = 0;
var COMBO_TYPE_SEASON = 1;
var TITLE_CENTER_POS = 341;
var SUB_MENU_TEXTCOLOR = ["0x6992b6","0xe1f1ff","0x6992b6","0xc6e4ff"];
var close_btn = new lib.util.TxtBtn(container_mc.closeBtn);
close_btn.setRelease(ToGame_LeaderBoard_Close);
container_mc.classCombo.type = COMBO_TYPE_CLASS;
container_mc.seasonCombo.type = COMBO_TYPE_SEASON;
container_mc.classCombo.onChanged = container_mc.seasonCombo.onChanged = function(This, selected, selectedIndex)
{
   ToGame_LeaderBoard_SelectCombo(this.type,selected);
};
container_mc.classCombo.onOpen = container_mc.seasonCombo.onOpen = function($target)
{
   if($target.isOpen)
   {
      prevScrollPosition = container_mc.scroll.scroll;
      container_mc.scroll.active = false;
      container_mc.scroll.removeListener(container_mc.scrollHit);
   }
   else
   {
      container_mc.scroll.active = true;
      container_mc.scroll.scroll = prevScrollPosition;
      container_mc.scroll.addListener(container_mc.scrollHit);
   }
};
var reset_btn = new lib.util.TxtBtn(container_mc.resetBtn);
reset_btn.setRelease(ToGame_LeaderBoard_resetFilter);
var resetTooltip = lib.util.UIString.getUIString("$730003");
lib.manager.ToolTip.add(container_mc.resetBtn,resetTooltip,1);
var scrollValue = 0;
container_mc.scroll.pageSize = LIST_MC_HEIGHT * MAX_LIST_COUNT;
container_mc.scroll.displaySize = container_mc.scrollHit._height;
container_mc.scroll.rowHeight = LIST_MC_HEIGHT;
container_mc.scrollHit.onScroll = function()
{
   if(!container_mc.classCombo.isOpen && !container_mc.seasonCombo.isOpen)
   {
      if(scrollValue != container_mc.scroll.scroll)
      {
         scrollValue = container_mc.scroll.scroll;
         drawList();
      }
   }
};
container_mc.scroll.setWheel(container_mc.scrollHit);
container_mc.scroll.addListener(container_mc.scrollHit);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
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
myListener.OnGame_LeaderBoard_SetTab = function(tabParam, selectedTab)
{
   var _loc3_ = lib.util.ExtString.split(tabParam,"\t");
   var _loc5_ = _loc3_.length;
   var _loc4_ = [];
   var _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc2_ = _loc3_[_loc1_];
      _loc4_.push(_loc2_);
      _loc1_ = _loc1_ + 1;
   }
   container_mc.tabBtn.clear();
   container_mc.tabBtn.labels = _loc4_;
   tabBtn = container_mc.tabBtn.tab;
   tabBtn.setRelease(ToGame_LeaderBoard_SelectTab);
   curTabIndex = Number(selectedTab);
   container_mc.mBackPoint.gotoAndStop(curTabIndex + 1);
   tabBtn.setTab(curTabIndex,1);
   container_mc.tabBg._x = 9 + curTabIndex * 153;
};
myListener.OnGame_LeaderBoard_SetCombo = function(comboType, comboParam, selectedId)
{
   var _loc8_ = comboType != COMBO_TYPE_CLASS?container_mc.seasonCombo:container_mc.classCombo;
   _loc8_.removeListener(_loc8_);
   var _loc6_ = lib.util.ExtString.split(comboParam,"\n");
   var _loc9_ = _loc6_.length;
   var _loc7_ = [];
   var _loc1_ = 0;
   while(_loc1_ < _loc9_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc6_[_loc1_],"\t");
      var _loc4_ = _loc2_[0];
      var _loc3_ = _loc2_[1];
      _loc7_.push({label:_loc3_,id:_loc4_});
      _loc1_ = _loc1_ + 1;
   }
   _loc8_.data = _loc7_;
   _loc8_.setSelectedId(selectedId);
   _loc8_.addListener(_loc8_);
};
myListener.OnGame_LeaderBoard_SetColumnName = function(columnParam)
{
   var _loc3_ = lib.util.ExtString.split(columnParam,"\t");
   var _loc4_ = _loc3_.length;
   var _loc2_ = [];
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      _loc2_.push(_loc3_[_loc1_]);
      _loc1_ = _loc1_ + 1;
   }
   if(_loc2_.length == 4)
   {
      (lib.controls.S_SortBtn)container_mc.sortBtn.__set__colums([114,189,139,161]);
   }
   else if(_loc2_.length == 5)
   {
      (lib.controls.S_SortBtn)container_mc.sortBtn.__set__colums([90,150,120,80,163]);
   }
   container_mc.sortBtn.labels = _loc2_;
};
myListener.OnGame_LeaderBoard_SetContentsInfo = function(nameStr, seasonStr, dateStr, imgType, tooltipStr, $tooltipCompe, $tooltipReward)
{
   lib.manager.ToolTip.remove(container_mc.helpIcon);
   container_mc.nameTF.text = nameStr;
   container_mc.helpIcon._visible = false;
   container_mc.seasonTF.text = seasonStr;
   container_mc.dateTF.text = dateStr;
   var _loc1_ = container_mc.nameTF.textWidth;
   var _loc2_ = _loc1_;
   if(tooltipStr != "" && tooltipStr != undefined && tooltipStr != "undefined")
   {
      _loc2_ = _loc1_ + 8 + 16;
      container_mc.nameTF._width = _loc1_ + 5;
      lib.manager.ToolTip.add(container_mc.helpIcon,tooltipStr,1);
      container_mc.helpIcon._visible = true;
   }
   container_mc.nameTF._x = TITLE_CENTER_POS - _loc2_ / 2;
   container_mc.helpIcon._x = container_mc.nameTF._x + _loc1_ + 8;
   container_mc.nameTF._width = _loc1_ + 5;
   if($tooltipCompe != "" && $tooltipCompe != null)
   {
      container_mc.tCompetitaion._visible = true;
      container_mc.mCompetition._visible = true;
      lib.manager.ToolTip.add(container_mc.mCompetition,$tooltipCompe,1);
   }
   else
   {
      container_mc.tCompetitaion._visible = false;
      container_mc.mCompetition._visible = false;
      lib.manager.ToolTip.remove(container_mc.mCompetition);
   }
   if($tooltipReward != "" && $tooltipReward != null)
   {
      container_mc.tReward._visible = true;
      container_mc.mReward._visible = true;
      lib.manager.ToolTip.add(container_mc.mReward,$tooltipCompe,1);
   }
   else
   {
      container_mc.tReward._visible = false;
      container_mc.mReward._visible = false;
      lib.manager.ToolTip.remove(container_mc.mReward);
   }
};
myListener.OnGame_LeaderBoard_SetSubMenu = function(menuParam, selectedId)
{
   clearSubMenu();
   var _loc7_ = lib.util.ExtString.split(menuParam,"\n");
   var _loc6_ = _loc7_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc6_)
   {
      var _loc1_ = container_mc["subMenu_" + _loc2_];
      var _loc4_ = lib.util.ExtString.split(_loc7_[_loc2_],"\t");
      var _loc3_ = _loc4_[0];
      var _loc5_ = _loc4_[1];
      setSubMenu(_loc1_,_loc3_,_loc5_);
      if(_loc3_ == selectedId)
      {
         currentSelectedSubMenu = _loc1_;
         _loc1_.gotoAndStop(4);
         _loc1_.tf.textColor = SUB_MENU_TEXTCOLOR[3];
         _loc1_.tf._y = 0;
      }
      _loc2_ = _loc2_ + 1;
   }
   container_mc.subMenuUnder._visible = true;
   container_mc.subMenuUnder._y = 87 + 45 * _loc6_ + 2;
};
var listArray = [];
myListener.OnGame_LeaderBoard_SetList = function($listParam, $type)
{
   if($type == null)
   {
      $type = 0;
   }
   listArray = [];
   container_mc.scroll.scroll = 0;
   currentType = $type;
   var _loc4_ = lib.util.ExtString.split($listParam,"\n");
   var _loc5_ = _loc4_.length;
   if(currentType == 0)
   {
      var _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         var _loc1_ = new Object();
         var _loc2_ = lib.util.ExtString.split(_loc4_[_loc3_],"\t");
         _loc1_.changedType = _loc2_[0];
         _loc1_.changedCount = _loc2_[1];
         _loc1_.rank = _loc2_[2];
         _loc1_.characterName = _loc2_[3];
         _loc1_.characterClass = _loc2_[4];
         _loc1_.point = _loc2_[5];
         listArray.push(_loc1_);
         _loc3_ = _loc3_ + 1;
      }
      var _loc7_ = listArray.length;
      container_mc.scroll.pageSize = LIST_MC_HEIGHT * _loc7_;
      drawList();
   }
   else if(currentType == 1)
   {
      _loc3_ = 0;
      while(_loc3_ < _loc5_)
      {
         _loc1_ = new Object();
         _loc2_ = lib.util.ExtString.split(_loc4_[_loc3_],"\t");
         _loc1_.changedType = _loc2_[0];
         _loc1_.changedCount = _loc2_[1];
         _loc1_.rank = _loc2_[2];
         _loc1_.characterName = _loc2_[3];
         _loc1_.characterClass = _loc2_[4];
         _loc1_.point = _loc2_[5];
         _loc1_.grade = _loc2_[6];
         listArray.push(_loc1_);
         _loc3_ = _loc3_ + 1;
      }
      _loc7_ = listArray.length;
      container_mc.scroll.pageSize = LIST_MC_HEIGHT * _loc7_;
      drawList();
   }
};
myListener.OnGame_LeaderBoard_ClearList = function()
{
   listArray = [];
   clearList();
};
var myObject = new Object();
myListener.OnGame_LeaderBoard_SetMyInfo = function(rankChangedType, rankChangedCount, rank, characterName, characterClass, point, grade, type)
{
   container_mc.my.tf.text = "";
   myObject.changedType = rankChangedType;
   myObject.changedCount = rankChangedCount;
   myObject.rank = rank;
   myObject.characterName = characterName;
   myObject.characterClass = characterClass;
   myObject.point = point;
   myObject.grade = grade;
   if(type == null)
   {
      type = 0;
   }
   currentType = type;
   setList(container_mc.my,myObject);
};
myListener.OnGame_LeaderBoard_SetMyInfoGuide = function(nameStr, needCount)
{
   clearListMc(container_mc.my);
   container_mc.my.tf.text = lib.util.UIString.getUIString("$730004","nameStr",nameStr,"needCount",needCount);
   container_mc.my._visible = true;
};
var currentSelectedSubMenu = null;
init();
var maxRank = 0;
