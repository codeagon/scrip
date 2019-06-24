function setText(targetMc, info)
{
   var _loc1_ = 0;
   while(_loc1_ < textFdCount)
   {
      targetMc["textFd_" + _loc1_].text = info[_loc1_];
      _loc1_ = _loc1_ + 1;
   }
}
function createTextField(targetMc)
{
   var _loc3_ = 0;
   var _loc2_ = 0;
   while(_loc2_ < textFdCount)
   {
      if(_loc2_ > 0)
      {
         _loc3_ = _loc3_ + textFdWidth[_loc2_ - 1];
      }
      var _loc1_ = targetMc.createTextField("textFd_" + _loc2_,targetMc.getNextHighestDepth(),_loc3_,4,textFdWidth[_loc2_],22);
      _loc1_.border = false;
      _loc1_.background = false;
      _loc1_.selectable = false;
      _loc1_.wordWrap = false;
      _loc1_.type = "dynamic";
      _loc1_.multiline = false;
      _loc1_.html = false;
      _loc1_.antiAliasType = "normal";
      _loc1_.setNewTextFormat(textFormat);
      txtField.shadowColor = 0;
      txtField.shadowBlurX = 5;
      txtField.shadowBlurY = 5;
      txtField.shadowStrength = 150;
      txtField.shadowDistance = 0;
      txtField.shadowAngle = 45;
      _loc2_ = _loc2_ + 1;
   }
}
function clearList(startIndex)
{
   var _loc1_ = startIndex;
   while(_loc1_ < listCount)
   {
      var _loc2_ = container_mc.listContainer["list_" + _loc1_];
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
}
function setDefaultFdPos()
{
   var _loc1_ = container_mc.defaultFd;
   var _loc2_ = listCount * LIST_HEIGHT;
   _loc1_._y = LIST_START_Y + _loc2_ / 2 - _loc1_._height / 2;
}
function getListCount()
{
   var _loc2_ = container_mc.noticeMc.bg._height;
   var _loc3_ = BG_HEIGHT - LIST_START_Y;
   var _loc1_ = int((_loc3_ - _loc2_ - NUMBERSTEPER_MIN) / LIST_HEIGHT);
   if(_loc1_ < listCount)
   {
      clearList(_loc1_);
   }
   listCount = _loc1_;
   container_mc.listBg._height = listCount * LIST_HEIGHT + 35;
   setDefaultFdPos();
   var _loc4_ = _loc3_ - _loc2_ - listCount * LIST_HEIGHT;
   container_mc.numberSteper._y = LIST_START_Y + listCount * LIST_HEIGHT + _loc4_ / 2 - 16;
}
function ToGame_Board_RequestSetPage(page)
{
   lib.Debuger.trace("ToGame_Board_RequestSetPage : " + page);
   getURL("FSCommand:ToGame_Board_RequestSetPage",page);
}
function ToGame_Board_RequestSort(index)
{
   lib.Debuger.trace("ToGame_Board_RequestSort : " + index);
   getURL("FSCommand:ToGame_Board_RequestSort",index);
}
function ToGame_Board_SaveListCount(count)
{
   lib.Debuger.trace("ToGame_Board_SaveListCount : " + count);
   getURL("FSCommand:ToGame_Board_SaveListCount",count);
}
function ToGame_Board_Init()
{
   lib.Debuger.trace("ToGame_Board_Init");
   fscommand("ToGame_Board_Init");
}
function ToGame_Board_CloseUI()
{
   lib.Debuger.trace("ToGame_Board_CloseUI");
   fscommand("ToGame_Board_CloseUI");
}
function ToGame_Board_ClickWriteBtn()
{
   lib.Debuger.trace("ToGame_Board_ClickWriteBtn");
   fscommand("ToGame_Board_ClickWriteBtn");
}
var UI = this;
UI._visible = false;
var UIname = "Board";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var curPage = 0;
var maxPage = 0;
var textFdCount = 0;
var textFdWidth = [];
container_mc.defaultFd._visible = false;
var textFormat = new TextFormat("$NormalFont",16,14145495,false,false,false,null,null,"center",0,0,0,0);
var closeBtn = new lib.util.TxtBtn(container_mc.closeBtn);
closeBtn.setRelease(ToGame_Board_CloseUI);
var writeBtn = container_mc.writeBtn.txtBtn;
writeBtn.setRelease(ToGame_Board_ClickWriteBtn);
container_mc.numberSteper.onChanged = function(page)
{
   ToGame_Board_RequestSetPage(page);
};
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
myListener.OnGame_Board_SetList = function(listData, nameIndex)
{
   var _loc7_ = lib.util.ExtString.split(listData,"\n");
   var _loc5_ = _loc7_.length;
   nameIndex = Number(nameIndex);
   lib.Debuger.trace("len : " + _loc5_);
   if(_loc5_ == 0 || _loc5_ == "undefined" || _loc5_ == undefined)
   {
      container_mc.defaultFd._visible = true;
      _loc5_ = 0;
   }
   else
   {
      container_mc.defaultFd._visible = false;
   }
   clearList(_loc5_);
   var _loc4_ = container_mc.listContainer;
   var _loc2_ = 0;
   while(_loc2_ < _loc5_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc7_[_loc2_],"\t");
      var _loc1_ = _loc4_["list_" + _loc2_];
      if(_loc1_ == undefined)
      {
         _loc1_ = _loc4_.attachMovie("listMc","list_" + _loc2_,_loc4_.getNextHighestDepth());
         _loc1_._y = _loc2_ * LIST_HEIGHT;
         createTextField(_loc1_);
      }
      setText(_loc1_,_loc3_);
      if(nameIndex != -1)
      {
         lib.util.InteractionGroup.addInteraction(UIname,_loc3_[nameIndex],_loc1_.textFd_100);
      }
      _loc2_ = _loc2_ + 1;
   }
};
myListener.OnGame_Board_SetSortBtn = function(btnData)
{
   var _loc7_ = lib.util.ExtString.split(btnData,"\n");
   var _loc5_ = _loc7_.length;
   var _loc6_ = [];
   textFdWidth = [];
   clearList(0);
   textFdCount = _loc5_;
   var _loc8_ = container_mc.sortBtn;
   _loc8_.clear();
   var _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc7_[_loc1_],"\t");
      var _loc4_ = _loc2_[0];
      lib.Debuger.trace("btnLabel : " + _loc4_);
      var _loc3_ = Number(_loc2_[1]);
      lib.Debuger.trace("btnWidth : " + _loc3_);
      _loc6_.push(_loc4_);
      textFdWidth.push(_loc3_);
      _loc1_ = _loc1_ + 1;
   }
   _loc8_.colums = textFdWidth;
   _loc8_.labels = _loc6_;
   _loc8_.onSelected = function(index)
   {
      ToGame_Board_RequestSort(index);
   };
};
myListener.OnGame_Board_SetNotice = function(noticeTxt)
{
   var _loc1_ = container_mc.noticeMc;
   _loc1_.textFd.htmlText = noticeTxt;
   _loc1_.textFd._height = _loc1_.textFd.textHeight + 5;
   _loc1_.bg._height = _loc1_.textFd._height + 8;
   _loc1_._y = BG_HEIGHT - _loc1_._height;
   getListCount();
   ToGame_Board_SaveListCount(listCount);
};
var BG_HEIGHT = 665;
var NUMBERSTEPER_MIN = 32;
var LIST_START_Y = 87;
var LIST_HEIGHT = 30;
var listCount = 0;
myListener.OnGame_Board_SetDefaultText = function(defaultTxt)
{
   var _loc1_ = container_mc.defaultFd;
   _loc1_._visible = true;
   _loc1_.htmlText = defaultTxt;
   _loc1_._height = _loc1_.textHeight + 5;
   setDefaultFdPos();
};
myListener.OnGame_Board_SetPage = function(curPageNum, maxPageNum)
{
   curPage = Number(curPageNum);
   maxPage = Number(maxPageNum);
   container_mc.numberSteper.setPage(curPage,maxPage);
};
myListener.OnGame_Board_SetTitle = function(titleTxt)
{
   container_mc.titleFd.htmlText = titleTxt;
};
ToGame_Board_Init();
