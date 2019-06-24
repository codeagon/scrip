function ToGame_GuildLeague_Init()
{
   init();
   fscommand("ToGame_GuildLeague_Init");
}
function ToGame_GuildLeague_CloseUI()
{
   fscommand("ToGame_GuildLeague_CloseUI");
}
function ToGame_GuildLeague_Tab(num)
{
   getURL("FSCommand:ToGame_GuildLeague_Tab",num);
}
function ToGame_GuildLeague_SortClick(num)
{
   getURL("FSCommand:ToGame_GuildLeague_CategoryClick",num);
}
function ToGame_GuildLeague_CateClick(id)
{
   getURL("FSCommand:ToGame_GuildLeague_CateClick",id);
}
function ToGame_GuildLeague_CheckClick(type)
{
   getURL("FSCommand:ToGame_GuildLeague_CheckClick",type);
}
function ToGame_GuildLeague_ButtonClick(index)
{
   getURL("FSCommand:ToGame_GuildLeague_ButtonClick",index);
}
function ToGame_GuildLeague_ChangeClick()
{
   fscommand("ToGame_GuildLeague_ChangeClick");
}
function init()
{
   prevFocus = -1;
   container_mc.tipTxt.text = "";
   container_mc.txt0.text = "";
   container_mc.txt1.text = "";
   container_mc.txt2.text = "";
   container_mc.txt3.text = "";
   container_mc.mainMc._visible = false;
   container_mc.checkBtn._visible = false;
}
function CateEdit(cateDate)
{
   var _loc6_ = lib.util.ExtString.split(cateDate,"\n");
   var _loc7_ = _loc6_.length;
   var _loc5_ = 0;
   var _loc4_ = 0;
   while(_loc4_ < _loc7_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
      var _loc2_ = container_mc.cateContainer.attachMovie("cateMc","cateMc" + _loc3_[0],container_mc.cateContainer.getNextHighestDepth());
      if(_loc4_ == 0)
      {
         _loc2_.gotoAndStop(2);
         _loc2_.norColor = "0x9f7964";
         _loc2_.overColor = "0xfee0d0";
         _loc2_.selColor = "0xfee0d0";
      }
      else
      {
         _loc2_.norColor = "0x6992b6";
         _loc2_.overColor = "0xc6e4ff";
         _loc2_.selColor = "0xe1f1ff";
      }
      _loc2_._y = _loc5_;
      _loc5_ = _loc5_ + CATE_HEIGHT;
      _loc2_.txt.verticalAlign = "center";
      _loc2_.txt.setText(_loc3_[1]);
      _loc2_.txt.textColor = _loc2_.norColor;
      _loc2_.id = _loc3_[0];
      if(_loc3_[2] == 0)
      {
         prevFocus.txt.textColor = _loc2_.norColor;
         this.txt._y = 1;
         _loc2_.bg.gotoAndStop(5);
      }
      else
      {
         _loc2_.onRelease = function()
         {
            if(prevFocus == this)
            {
               return undefined;
            }
            this.txt.textColor = this.overColor;
            this.txt._y = 1;
            myListener.OnGame_GuildLeague_CategoryFocus(this.id);
            ToGame_GuildLeague_CateClick(this.id);
         };
         _loc2_.onRollOver = function()
         {
            if(prevFocus == this)
            {
               return undefined;
            }
            this.txt.textColor = this.selColor;
            this.txt._y = 0;
            this.bg.gotoAndStop(2);
         };
         _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
         {
            if(prevFocus == this)
            {
               return undefined;
            }
            this.txt.textColor = this.norColor;
            this.txt._y = 1;
            this.bg.gotoAndStop(1);
         };
         _loc2_.onPress = function()
         {
            if(prevFocus == this)
            {
               return undefined;
            }
            this.txt.textColor = this.overColor;
            this.txt._y = 1;
            this.bg.gotoAndStop(3);
         };
      }
      _loc4_ = _loc4_ + 1;
   }
   container_mc.cateBg._height = _loc5_;
   scrollBar1.pageSize = _loc5_;
   scrollBar1.scroll = 0;
}
function SortEdit(sortData)
{
   var _loc6_ = lib.util.ExtString.split(sortData,"\n");
   var _loc5_ = _loc6_.length;
   Labels = [];
   Colums = [];
   TextCoulms = [];
   var _loc4_ = 0;
   var _loc2_ = 0;
   while(_loc2_ < _loc5_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc6_[_loc2_],"\t");
      var _loc1_ = Number(_loc3_[1]);
      if(_loc4_ > columMax)
      {
         return undefined;
      }
      if(_loc2_ == _loc5_ - 1)
      {
         _loc1_ = columMax - _loc4_;
      }
      else
      {
         _loc4_ = _loc4_ + _loc1_;
      }
      TextCoulms.push(_loc1_);
      if(_loc1_ != 0)
      {
         Colums.push(_loc1_);
         Labels.push(_loc3_[0]);
      }
      _loc2_ = _loc2_ + 1;
   }
   container_mc.sortBtn.clear();
   container_mc.sortBtn.colums = Colums;
   container_mc.sortBtn.labels = Labels;
   var _loc7_ = container_mc.sortBtn._width - 26;
   container_mc.maskMc._x = container_mc.sortBtn._x;
   container_mc.maskMc._width = _loc7_;
}
function LineEdit(lineData)
{
   clearContainer(container_mc.listContainer);
   scrollBar.scroll = 0;
   var _loc10_ = lib.util.ExtString.split(lineData,"\n");
   var _loc11_ = _loc10_.length;
   var _loc9_ = 0;
   if(lineData == undefined || lineData == "" || _loc11_ == 0)
   {
      var _loc12_ = container_mc.listContainer.attachMovie("defaultMc","defaultTxt",container_mc.listContainer.getNextHighestDepth());
      _loc12_._y = 200;
      _loc12_.txt._width = container_mc.maskMc._width;
      _loc12_.txt.setText(DEFAULT_TXT);
      return undefined;
   }
   var _loc3_ = 0;
   while(_loc3_ < _loc11_)
   {
      var _loc6_ = lib.util.ExtString.split(_loc10_[_loc3_],"\t");
      var _loc7_ = _loc6_.length;
      var _loc5_ = 0;
      var _loc4_ = container_mc.listContainer.attachMovie("line","line_" + _loc3_,container_mc.listContainer.getNextHighestDepth());
      _loc4_._y = _loc9_;
      _loc9_ = _loc9_ + LINE_HEIGHT;
      if(_loc3_ < 10)
      {
         _loc4_.gotoAndStop(2);
      }
      var _loc1_ = 0;
      while(_loc1_ < _loc7_)
      {
         var _loc2_ = TextCoulms[_loc1_] * 0.8;
         if(_loc2_ > 0)
         {
            var _loc8_ = createText(_loc4_,"Txt_" + _loc1_,_loc6_[_loc1_],_loc5_,0,_loc2_,LINE_HEIGHT);
            _loc5_ = _loc5_ + _loc2_;
         }
         _loc1_ = _loc1_ + 1;
      }
      _loc3_ = _loc3_ + 1;
   }
}
function TabClick(num)
{
   ToGame_GuildLeague_Tab(num);
}
function createText(_targetMc, _targetName, str, _posX, _posY, _w, _h)
{
   var _loc5_ = str.substring(30,53);
   var _loc2_ = "";
   if(_loc5_ == "Icon_GuildLeague_Grade_")
   {
      var _loc6_ = str.substring(53,54);
      _loc2_ = lib.util.UIString.getUIString("$123089","rank",_loc6_);
      _posY = _posY - 9;
      _h = _h + 16;
   }
   var _loc1_ = (TextField)_targetMc[_targetName];
   if(!_loc1_)
   {
      _loc1_ = _targetMc.createTextField(_targetName,_targetMc.getNextHighestDepth(),_posX,_posY,_w,_h);
   }
   if(_txt == undefined)
   {
      _txt = "";
   }
   _loc1_.wordWrap = false;
   _loc1_.multiline = false;
   _loc1_.selectable = false;
   _loc1_.html = true;
   _loc1_.verticalAlign = "center";
   _loc1_.setNewTextFormat(textFormat);
   _loc1_.htmlText = str;
   if(_loc2_ != "")
   {
      lib.manager.ToolTip.add(_loc1_,_loc2_,1);
   }
   else
   {
      lib.manager.ToolTip.remove(_loc1_);
   }
}
function clearContainer(mc)
{
   mc.clear();
   for(var _loc2_ in mc)
   {
      if(typeof mc[_loc2_] == "movieclip")
      {
         mc[_loc2_].removeMovieClip();
      }
   }
}
var UI = this;
UI._visible = false;
var UIname = "GuildLeague";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.tit_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var textFormat = new TextFormat("$NormalFont",12,10599105,false,false,false,"","","center",5,5,0,0);
var DEFAULT_TXT = lib.util.UIString.getUIString("$133005");
var x_btn = new lib.util.TxtBtn(container_mc.xBtn);
x_btn.setRelease(ToGame_GuildLeague_CloseUI);
var t_btn = container_mc.tabBtn.tab;
t_btn.setRelease(TabClick);
var Labels = [];
var Colums = [];
var TextCoulms = [];
var LINE_HEIGHT = 24;
var CATE_HEIGHT = 36;
var columMax = 795;
var prevFocus = -1;
var listY = container_mc.listContainer._y;
var scrollBar = container_mc.scrollMc;
scrollBar.addListener(container_mc.listContainer);
container_mc.listContainer.onScroll = function()
{
   container_mc.listContainer._y = listY - arguments[0];
};
scrollBar.setWheel(container_mc.listContainer);
scrollBar.wheelDelta = 1;
scrollBar.pageSize = 0;
scrollBar.displaySize = container_mc.maskMc._height;
scrollBar.defaultBarSizeRatio = 0.3333333333333333;
scrollBar.rowHeight = LINE_HEIGHT;
scrollBar.scroll = 0;
var listY1 = container_mc.cateContainer._y;
var scrollBar1 = container_mc.scrollMc1;
scrollBar1.addListener(container_mc.cateContainer);
container_mc.cateContainer.onScroll = function()
{
   container_mc.cateContainer._y = listY1 - arguments[0];
};
scrollBar1.setWheel(container_mc.cateContainer);
scrollBar1.wheelDelta = 1;
scrollBar1.pageSize = 0;
scrollBar1.displaySize = container_mc.maskMc1._height;
scrollBar1.defaultBarSizeRatio = 0.3333333333333333;
scrollBar1.rowHeight = CATE_HEIGHT;
scrollBar1.scroll = 0;
var checkMc = container_mc.checkBox;
checkMc.onChanged = function(changed)
{
   if(changed == true)
   {
      ToGame_GuildLeague_CheckClick(1);
   }
   else if(changed == false)
   {
      ToGame_GuildLeague_CheckClick(0);
   }
};
var checkButton = container_mc.checkBtn.txtBtn;
checkButton.setRelease(ToGame_GuildLeague_ChangeClick);
container_mc.checkBtn.txt.fontSize = 12;
container_mc.mainMc._visible = false;
container_mc.checkBtn._visible = false;
container_mc.txt3.verticalAlign = "bottom";
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      container_mc.lock_mc._x = 937;
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
myListener.OnGame_GuildLeague_SetMain = function(titleTxt, subTxt, dateTxt, btnData)
{
   if(titleTxt == undefined || titleTxt == "")
   {
      container_mc.sortBtn._visible = true;
      container_mc.scrollMc._visible = true;
      container_mc.scrollMc1._visible = true;
      container_mc.boardType.gotoAndStop(2);
      return undefined;
   }
   container_mc.sortBtn._visible = false;
   container_mc.checkBtn._visible = false;
   container_mc.checkBox._visible = false;
   container_mc.scrollMc._visible = false;
   container_mc.scrollMc1._visible = false;
   myListener.OnGame_GuildLeague_ListClear();
   container_mc.boardType.gotoAndStop(1);
   container_mc.boardType.titleTxt.verticalAlign = "center";
   container_mc.boardType.titleTxt.htmlText = titleTxt;
   container_mc.boardType.subTxt.htmlText = subTxt;
   container_mc.boardType.tipTxt.setText("<img src=\'tip\' vspace=\'-3\'>" + dateTxt);
   var _loc7_ = lib.util.ExtString.split(btnData,"\n");
   var _loc8_ = _loc7_.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc8_)
   {
      var _loc2_ = container_mc.boardType["btn" + _loc3_];
      var _loc5_ = lib.util.ExtString.split(_loc7_[_loc3_],"\t");
      _loc2_.txt.text = _loc5_[0];
      _loc2_.idx = _loc3_;
      var _loc4_ = new lib.util.TxtBtn(_loc2_.btn,_loc2_.txt);
      _loc4_.setTextColor("0xFFF1B9","0xFFFFFF","0xFFF1B9","0x666666");
      _loc2_.btn.onRelease = function()
      {
         ToGame_GuildLeague_ButtonClick(this._parent.idx);
      };
      var _loc6_ = Number(_loc5_[1]);
      if(_loc6_ == -1)
      {
         _loc2_._visible = false;
      }
      else
      {
         _loc2_._visible = true;
         _loc4_.setEnabled(Boolean(_loc6_));
      }
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_GuildLeague_SetPage = function(titleTxt, subTxt, dateTxt, btnData, checkMode)
{
   if(titleTxt != undefined && titleTxt != "")
   {
      container_mc.sortBtn._x = container_mc.listContainer._x = 390;
      columMax = 737;
      container_mc.boardType.bg._x = 235;
      container_mc.boardType.bg._width = 587;
      container_mc.boardType.txtBg._visible = true;
      container_mc.txt0.htmlText = titleTxt;
      container_mc.txt1.htmlText = subTxt;
      container_mc.txt2.htmlText = dateTxt;
      container_mc.txt3.text = "";
   }
   else
   {
      container_mc.sortBtn._x = container_mc.listContainer._x = 177;
      columMax = 1004;
      container_mc.boardType.bg._x = 22;
      container_mc.boardType.bg._width = 800;
      container_mc.boardType.txtBg._visible = false;
      container_mc.txt0.text = "";
      container_mc.txt1.text = "";
      container_mc.txt2.text = "";
      container_mc.txt3.setText(subTxt);
   }
   if(btnData != undefined && btnData != "")
   {
      container_mc.checkBtn.txt.text = btnData;
      container_mc.checkBtn._visible = true;
      container_mc.checkBox._visible = false;
   }
   else
   {
      container_mc.checkBtn._visible = false;
      container_mc.checkBox._visible = true;
   }
   checkMc.checked = Boolean(Number(checkMode));
};
myListener.OnGame_GuildLeague_TabFocus = function(tabNum)
{
   t_btn.setTab(tabNum);
};
myListener.OnGame_GuildLeague_SetCategory = function(categoryData)
{
   myListener.OnGame_GuildLeague_SetMain("");
   clearContainer(container_mc.cateContainer);
   CateEdit(categoryData);
};
myListener.OnGame_GuildLeague_CategoryFocus = function(id)
{
   prevFocus.txt.textColor = "0x80B5DE";
   prevFocus.bg.gotoAndStop(1);
   prevFocus = container_mc.cateContainer["cateMc" + id];
   prevFocus.bg.gotoAndStop(4);
   prevFocus.txt.textColor = "0xFFFFFF";
};
myListener.OnGame_GuildLeague_SetSort = function(sortData)
{
   myListener.OnGame_GuildLeague_SetMain("");
   SortEdit(sortData);
};
myListener.OnGame_GuildLeague_SetList = function(listData)
{
   LineEdit(listData);
   scrollBar.pageSize = container_mc.listContainer._height;
   scrollBar.scroll = 0;
};
myListener.OnGame_GuildLeague_UpDateList = function(index, listData, color)
{
   var _loc6_ = container_mc.listContainer["line_" + index];
   var _loc4_ = lib.util.ExtString.split(listData,"\t");
   var _loc5_ = _loc4_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc2_ = _loc6_["Txt_" + _loc1_];
      _loc2_.setText(_loc4_[_loc1_]);
      if(color)
      {
         _loc2_.textColor = color;
      }
      else
      {
         _loc2_.textColor = "0xFFFFFF";
      }
      _loc1_ = _loc1_ + 1;
   }
   var _loc7_ = index - 8;
   if(_loc7_ > 0)
   {
      scrollBar.scroll = _loc7_;
   }
   else
   {
      scrollBar.scroll = 0;
   }
};
myListener.OnGame_GuildLeague_SetTip = function(str)
{
   container_mc.tipTxt.setText("<img src=\'tip\' vspace=\'-3\'>" + str);
};
myListener.OnGame_GuildLeague_ListClear = function()
{
   clearContainer(container_mc.listContainer);
   init();
};
myListener.OnGame_GuildLeague_CategoryClear = function()
{
   clearContainer(container_mc.cateContainer);
   prevFocus = -1;
};
container_mc.sortBtn.onSelected = function(index)
{
   ToGame_GuildLeague_SortClick(index);
};
ToGame_GuildLeague_Init();
