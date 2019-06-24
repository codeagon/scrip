function clearDuengenList()
{
   var _loc1_ = 0;
   while(_loc1_ < listTotal)
   {
      var _loc2_ = container_mc.dungenContainerMc["lineMc" + _loc1_];
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   listTotal = 0;
   container_mc.scrollbar.pageSize = container_mc.dungenContainerMc._height;
}
function resizeList(flag)
{
}
function resizeList2()
{
   if(container_mc.partyContainerMc._visible == true && container_mc.partyMasterMc._visible == true && container_mc.timeContainerMc._visible == true)
   {
      container_mc.partyContainerMc._y = 257;
      container_mc.partyMasterMc._y = 314;
      container_mc.timeContainerMc._y = 345;
      container_mc.scrollbar.pageSize = container_mc.dungenContainerMc._height;
      container_mc.maskMc._height = 112;
      container_mc.scrollbar.displaySize = container_mc.maskMc._height;
      container_mc.scrollbar._height = 115;
      container_mc.scrollbar.resize();
      container_mc.listBgMc._height = 151;
   }
   else if(container_mc.partyContainerMc._visible == false && container_mc.partyMasterMc._visible == true && container_mc.timeContainerMc._visible == true)
   {
      container_mc.partyMasterMc._y = 314;
      container_mc.timeContainerMc._y = 345;
      container_mc.scrollbar.pageSize = container_mc.dungenContainerMc._height;
      container_mc.maskMc._height = 169;
      container_mc.scrollbar.displaySize = container_mc.maskMc._height;
      container_mc.scrollbar._height = 172;
      container_mc.scrollbar.resize();
      container_mc.listBgMc._height = 208;
   }
   else if(container_mc.partyContainerMc._visible == true && container_mc.partyMasterMc._visible == false && container_mc.timeContainerMc._visible == true)
   {
      container_mc.partyContainerMc._y = 289;
      container_mc.timeContainerMc._y = 345;
      container_mc.scrollbar.pageSize = container_mc.dungenContainerMc._height;
      container_mc.maskMc._height = 144;
      container_mc.scrollbar.displaySize = container_mc.maskMc._height;
      container_mc.scrollbar._height = 147;
      container_mc.scrollbar.resize();
      container_mc.listBgMc._height = 183;
   }
   else if(container_mc.partyContainerMc._visible == true && container_mc.partyMasterMc._visible == true && container_mc.timeContainerMc._visible == false)
   {
      container_mc.partyContainerMc._y = 319;
      container_mc.partyMasterMc._y = 376;
      container_mc.scrollbar.pageSize = container_mc.dungenContainerMc._height;
      container_mc.maskMc._height = 174;
      container_mc.scrollbar.displaySize = container_mc.maskMc._height;
      container_mc.scrollbar._height = 177;
      container_mc.scrollbar.resize();
      container_mc.listBgMc._height = 213;
   }
   else if(container_mc.partyContainerMc._visible == false && container_mc.partyMasterMc._visible == false && container_mc.timeContainerMc._visible == true)
   {
      container_mc.timeContainerMc._y = 345;
      container_mc.scrollbar.pageSize = container_mc.dungenContainerMc._height;
      container_mc.maskMc._height = 200;
      container_mc.scrollbar.displaySize = container_mc.maskMc._height;
      container_mc.scrollbar._height = 203;
      container_mc.scrollbar.resize();
      container_mc.listBgMc._height = 239;
   }
   else if(container_mc.partyContainerMc._visible == true && container_mc.partyMasterMc._visible == false && container_mc.timeContainerMc._visible == false)
   {
      container_mc.partyContainerMc._y = 350;
      container_mc.scrollbar.pageSize = container_mc.dungenContainerMc._height;
      container_mc.maskMc._height = 205;
      container_mc.scrollbar.displaySize = container_mc.maskMc._height;
      container_mc.scrollbar._height = 208;
      container_mc.scrollbar.resize();
      container_mc.listBgMc._height = 244;
   }
   else if(container_mc.partyContainerMc._visible == false && container_mc.partyMasterMc._visible == true && container_mc.timeContainerMc._visible == false)
   {
      container_mc.partyMasterMc._y = 376;
      container_mc.scrollbar.pageSize = container_mc.dungenContainerMc._height;
      container_mc.maskMc._height = 231;
      container_mc.scrollbar.displaySize = container_mc.maskMc._height;
      container_mc.scrollbar._height = 234;
      container_mc.scrollbar.resize();
      container_mc.listBgMc._height = 270;
   }
   else if(container_mc.partyContainerMc._visible == false && container_mc.partyMasterMc._visible == false && container_mc.timeContainerMc._visible == false)
   {
      container_mc.scrollbar.pageSize = container_mc.dungenContainerMc._height;
      container_mc.maskMc._height = 262;
      container_mc.scrollbar.displaySize = container_mc.maskMc._height;
      container_mc.scrollbar._height = 265;
      container_mc.scrollbar.resize();
      container_mc.listBgMc._height = 302;
   }
}
function ToGame_DungeonPartyMatchingProcess_Init()
{
   fscommand("ToGame_DungeonPartyMatchingProcess_Init");
}
function ToGame_DungeonPartyMatchingProcess_Close()
{
   fscommand("ToGame_DungeonPartyMatchingProcess_Close");
}
function ToGame_DungeonPartyMatchingProcess_BtnEvent(btnId)
{
   getURL("FSCommand:ToGame_DungeonPartyMatchingProcess_BtnEvent",btnId);
}
var UI = this;
UI._visible = false;
var UIname = "DungeonPartyMatchingProcess";
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
var listContainerY = container_mc.dungenContainerMc._y;
var defaultMaskH = container_mc.maskMc._height;
var defaultScrollH = container_mc.scrollbar._height;
var defaultListBgH = container_mc.listBgMc._height;
var defaultPartyY = container_mc.partyContainerMc._y;
var resizeMaskH = 199;
var resizeScrollH = 200;
var resizeListBgH = 239;
var resizePartyY = 348;
var defaultBtnMc0X;
var defaultBtnTxt0X;
var partyH = container_mc.partyContainerMc._height;
var listTotal;
container_mc.partyContainerMc._visible = false;
container_mc.partyMasterMc._visible = false;
container_mc.timeContainerMc._visible = false;
myListener.OnGame_DungeonPartyMatchingProcess_SetDisplay = function(_title, btn0_Id, btn0_Name, btn1_Id, btn1_Name)
{
   container_mc.text_name2.text = _title;
   var _loc2_ = btn0_Name != "" && btn0_Name != undefined;
   var _loc1_ = btn1_Name != "" && btn1_Name != undefined;
   btn0.setVisible(_loc2_);
   btn1.setVisible(_loc1_);
   btn0.setText(btn0_Name);
   btn1.setText(btn1_Name);
   btn0.setRelease(function()
   {
      ToGame_DungeonPartyMatchingProcess_BtnEvent(btn0_Id);
   }
   );
   btn1.setRelease(function()
   {
      ToGame_DungeonPartyMatchingProcess_BtnEvent(btn1_Id);
   }
   );
   if(!_loc1_)
   {
      btn0.btn._x = 184;
      btn0.txt._x = 191;
   }
   else
   {
      btn0.btn._x = defaultBtnMc0X;
      btn0.txt._x = defaultBtnTxt0X;
   }
};
myListener.OnGame_DungeonPartyMatchingProcess_DungenList = function(dungenData)
{
   clearDuengenList();
   var _loc8_ = lib.util.ExtString.split(dungenData,"\n");
   var _loc7_ = _loc8_.length;
   if(dungenData == "" || dungenData == undefined)
   {
      return undefined;
   }
   listTotal = _loc7_;
   var _loc2_ = 0;
   while(_loc2_ < _loc7_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc8_[_loc2_],"\t");
      var _loc4_ = Number(_loc3_[0]);
      var _loc5_ = _loc3_[1];
      var _loc6_ = _loc3_[2];
      var _loc1_ = container_mc.dungenContainerMc.attachMovie("lineMc","lineMc" + _loc2_,_loc2_);
      _loc1_._y = _loc1_._height * _loc2_;
      _loc1_.txt.setText(_loc6_);
      _loc1_.levelMc.txt.text = _loc5_;
      _loc1_.balkionMc._visible = _loc4_;
      _loc1_.balkionMc._x = _loc1_.txt._x + _loc1_.txt.textWidth + 4;
      if(_loc1_.balkionMc._visible)
      {
         lib.manager.ToolTip.add(_loc1_.balkionMc,"$461007",1);
      }
      _loc2_ = _loc2_ + 1;
   }
   container_mc.scrollbar.pageSize = container_mc.dungenContainerMc._height;
};
myListener.OnGame_DungeonPartyMatchingProcess_PartyMember = function(members)
{
   if(members == "" || members == undefined)
   {
      container_mc.partyContainerMc._visible = false;
      resizeList(true);
   }
   else
   {
      var _loc4_ = "";
      container_mc.partyContainerMc._visible = true;
      var _loc3_ = lib.util.ExtString.split(members,"\n");
      var _loc5_ = _loc3_.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc5_)
      {
         var _loc2_ = lib.util.ExtString.split(_loc3_[_loc1_],"\t");
         _loc4_ = _loc4_ + ("<img src=\'Icon_class_" + _loc2_[1] + "\' width=\'20\' height=\'20\' vspace=\'-5\'>" + _loc2_[0] + " ");
         _loc1_ = _loc1_ + 1;
      }
      container_mc.partyContainerMc.txt.setText(_loc4_);
   }
   resizeList2();
   var delaynum = 0;
   UI.onEnterFrame = null;
   UI.onEnterFrame = function()
   {
      delaynum++;
      if(delaynum > 0)
      {
         UI.onEnterFrame = null;
         delaynum = 0;
         resizeList2();
      }
   };
};
var prevHeight_0 = false;
var prevHeight_1 = false;
var prevHeight_2 = false;
myListener.OnGame_DungeonPartyMatchingProcess_SetProcessTime = function(remaintime, progresstime)
{
   container_mc.timeContainerMc._visible = !(remaintime == undefined && remaintime == undefined);
   container_mc.timeContainerMc.waitingTimeFd.htmlText = remaintime != undefined?remaintime:"";
   container_mc.timeContainerMc.processTimeFd.htmlText = progresstime != undefined?progresstime:"";
   if(container_mc.partyContainerMc._visible == prevHeight_0 && container_mc.partyMasterMc._visible == prevHeight_1 && container_mc.timeContainerMc._visible == prevHeight_2)
   {
      return undefined;
   }
   prevHeight_0 = container_mc.partyContainerMc._visible;
   prevHeight_1 = container_mc.partyMasterMc._visible;
   prevHeight_2 = container_mc.timeContainerMc._visible;
   resizeList2();
};
myListener.OnGame_DungeonPartyMatchingProcess_PartyMasterAgree = function(_data)
{
   if(_data == "" || _data == undefined)
   {
      container_mc.partyMasterMc._visible = false;
   }
   else
   {
      container_mc.partyMasterMc._visible = true;
      container_mc.partyMasterMc.txt.htmlText = _data;
   }
   resizeList2();
};
var x_btn = new lib.util.TxtBtn(container_mc.xmc);
var btn0 = new lib.util.TxtBtn(container_mc.btn_mc0,container_mc.btn_txt0);
var btn1 = new lib.util.TxtBtn(container_mc.btn_mc1,container_mc.btn_txt1);
defaultBtnMc0X = btn0.btn._x;
defaultBtnTxt0X = btn0.txt._x;
btn0.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
btn1.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
x_btn.setRelease(ToGame_DungeonPartyMatchingProcess_Close);
container_mc.scrollbar.pageSize = 0;
container_mc.scrollbar.rowHeight = 300;
container_mc.dungenContainerMc.onScroll = function()
{
   this._y = listContainerY - arguments[0];
};
container_mc.scrollbar.setWheel(container_mc.dungenContainerMc);
container_mc.scrollbar.addListener(container_mc.dungenContainerMc);
resizeList(true);
ToGame_DungeonPartyMatchingProcess_Init();
