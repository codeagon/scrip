var UI = this;
UI._visible = false;
var UIname = "BFMatchingProcess";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var listTotal;
var CONTENT_START_Y = 107;
var CONTENT_END_Y = 540;
var CONTENT_TITLE_HEIGHT = 37;
var listContainerY = container_mc.listMc._y;
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
var btn0ID;
var btn1ID;
var equippedData;
var presetData;
var _slotIndexList = [21,22,23,24,25,26,27,28,31,32,41,42];
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
container_mc.mc_crystal._visible = false;
container_mc.mc_crystal.textField.html = true;
container_mc.mc_crystal.textField.htmlText = lib.util.UIString.getUIString("$279118");
container_mc.partyContainerMc._visible = false;
container_mc.partyMasterMc._visible = false;
container_mc.timeContainerMc._visible = false;
myListener.OnGame_BFMatchingProcess_SetDisplay = function(_title, btn0_Id, btn0_Name, btn1_Id, btn1_Name)
{
   container_mc.text_name2.text = _title;
   var _loc2_ = btn0_Name != "" && btn0_Name != undefined;
   var _loc1_ = btn1_Name != "" && btn1_Name != undefined;
   bConfirm.__set__visible(_loc2_);
   bCancel.__set__visible(_loc1_);
   bConfirm.__set__label(btn0_Name);
   bCancel.__set__label(btn1_Name);
   btn0ID = btn0_Id;
   btn1ID = btn1_Id;
   if(!_loc1_)
   {
      bConfirm._x = 184;
      raEquipped.setEnabled(false);
      raPreset.setEnabled(false);
   }
   else
   {
      bConfirm._x = defaultBtnMc0X;
      raEquipped.setEnabled(true);
      raPreset.setEnabled(true);
   }
};
myListener.OnGame_BFMatchingProcess_BFList = function(BFData)
{
   clearBFList();
   var _loc6_ = lib.util.ExtString.split(BFData,"\n");
   var _loc7_ = _loc6_.length;
   if(BFData == "" || BFData == undefined)
   {
      return undefined;
   }
   listTotal = _loc7_;
   var _loc1_ = 0;
   while(_loc1_ < _loc7_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc6_[_loc1_],"\t");
      var _loc4_ = _loc3_[0];
      var _loc5_ = _loc3_[1];
      var _loc2_ = container_mc.listMc.attachMovie("lineMc","lineMc" + _loc1_,_loc1_);
      _loc2_._y = _loc2_._height * _loc1_;
      _loc2_.txt.setText(_loc5_);
      _loc2_.levelMc.txt.text = _loc4_;
      _loc1_ = _loc1_ + 1;
   }
   container_mc.scrollbar.pageSize = container_mc.listMc._height;
};
myListener.OnGame_BFMatchingProcess_PartyMember = function(members)
{
   if(members == "" || members == undefined)
   {
      container_mc.partyContainerMc._visible = false;
      resizeList(true);
   }
   else
   {
      container_mc.partyContainerMc._visible = true;
      var _loc2_ = lib.util.ExtString.split(members,"\t");
      var _loc1_ = _loc2_.join(", ");
      container_mc.partyContainerMc.txt.setText(_loc1_);
   }
   resizeList();
   var delaynum = 0;
   UI.onEnterFrame = null;
   UI.onEnterFrame = function()
   {
      delaynum++;
      if(delaynum > 0)
      {
         UI.onEnterFrame = null;
         delaynum = 0;
         resizeList();
      }
   };
};
var prevHeight_0 = false;
var prevHeight_1 = false;
var prevHeight_2 = false;
myListener.OnGame_BFMatchingProcess_SetProcessTime = function(remaintime, progresstime)
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
   resizeList();
};
myListener.OnGame_BFMatchingProcess_PartyMasterAgree = function(_data)
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
   resizeList();
};
myListener.OnGame_BFMatchingProcess_SetCrystalOptionVisible = function(bVisible, $equipped, $preset, $selectedIndex)
{
   if($selectedIndex != 0 && $selectedIndex != 1)
   {
      $selectedIndex = 0;
   }
   if(g4.util.Converter.toBoolean(bVisible))
   {
      container_mc.mc_crystal._visible = true;
      $equipped = lib.util.ExtString.split($equipped,"\n");
      var _loc3_ = $equipped.length;
      equippedData = [];
      var _loc1_ = 0;
      while(_loc1_ < _loc3_)
      {
         var _loc2_ = lib.util.ExtString.split($equipped[_loc1_],"\t");
         equippedData.push(_loc2_);
         _loc1_ = _loc1_ + 1;
      }
      $preset = lib.util.ExtString.split($preset,"\n");
      _loc3_ = $preset.length;
      presetData = [];
      _loc1_ = 0;
      while(_loc1_ < _loc3_)
      {
         _loc2_ = lib.util.ExtString.split($preset[_loc1_],"\t");
         presetData.push(_loc2_);
         _loc1_ = _loc1_ + 1;
      }
      if($selectedIndex == 0)
      {
         raEquipped.__set__checked(true);
         raPreset.__set__checked(false);
      }
      else if($selectedIndex == 1)
      {
         raEquipped.__set__checked(false);
         raPreset.__set__checked(true);
      }
      changeCrystal();
   }
   else
   {
      container_mc.mc_crystal._visible = false;
   }
   resizeList();
};
var bClose = (gfx.controls.Button)container_mc.bClose;
var bConfirm = (gfx.controls.Button)container_mc.bConfirm;
var bCancel = (gfx.controls.Button)container_mc.bCancel;
bClose.addEventListener(gfx.events.EventTypes.CLICK,this,"closeHandlerClick");
bConfirm.addEventListener(gfx.events.EventTypes.CLICK,this,"confirmHandlerClick");
bCancel.addEventListener(gfx.events.EventTypes.CLICK,this,"cancelHandlerClick");
var raEquipped = (lib.controls.S_CheckBox)container_mc.mc_crystal.raEquipped;
var raPreset = (lib.controls.S_CheckBox)container_mc.mc_crystal.raPreset;
raPreset.__set__checked(true);
raEquipped.onChanged = g4.util.Delegate.create(this,equippedHandlerChange);
raPreset.onChanged = g4.util.Delegate.create(this,presetHandlerChange);
var i = 0;
while(i < 12)
{
   var slot = container_mc.mc_crystal.mCrystalGroup["mCrystal" + i];
   slot.clear();
   slot.Icon.clear();
   slot.SLOT.enabled = false;
   slot.FX_IMPOSSIBLE._visible = false;
   i++;
}
defaultBtnMc0X = bConfirm._x;
defaultBtnTxt0X = bCancel._x;
container_mc.scrollbar.pageSize = 0;
container_mc.scrollbar.rowHeight = 300;
container_mc.listMc.onScroll = function()
{
   this._y = listContainerY - arguments[0];
};
container_mc.scrollbar.setWheel(container_mc.listMc);
container_mc.scrollbar.addListener(container_mc.listMc);
resizeList(true);
ToGame_BFMatchingProcess_Init();
function clearBFList()
{
   var _loc1_ = 0;
   while(_loc1_ < listTotal)
   {
      var _loc2_ = container_mc.listMc["lineMc" + _loc1_];
      _loc2_.removeMovieClip();
      _loc1_ = _loc1_ + 1;
   }
   listTotal = 0;
   container_mc.scrollbar.pageSize = container_mc.listMc._height;
}
function changeCrystal()
{
   var _loc3_ = undefined;
   if(raEquipped.__get__checked())
   {
      _loc3_ = equippedData;
   }
   else if(raPreset.__get__checked())
   {
      _loc3_ = presetData;
   }
   var _loc1_ = 0;
   while(_loc1_ < 12)
   {
      var _loc2_ = container_mc.mc_crystal.mCrystalGroup["mCrystal" + _loc1_];
      if(_loc3_[_loc1_][0] == null || _loc3_[_loc1_][0] == "")
      {
         lib.manager.ToolTip.remove(_loc2_.SLOT);
         _loc2_._visible = false;
      }
      else
      {
         _loc2_._visible = true;
         lib.util.DrawBitmap.draw(_loc2_.Icon,_loc3_[_loc1_][0],50,50);
         _loc2_.grade = _loc3_[_loc1_][2];
         _loc2_.id = _loc3_[_loc1_][0];
         var _loc4_ = _slotIndexList[_loc1_];
         if(raEquipped.__get__checked())
         {
            _loc4_ = _loc4_ + "\t0";
         }
         else if(raPreset)
         {
            _loc4_ = _loc4_ + "\t1";
         }
         lib.manager.ToolTip.add(_loc2_.SLOT,_loc4_,6,_loc2_.Icon);
      }
      _loc1_ = _loc1_ + 1;
   }
}
function resizeList()
{
   var _loc5_ = [];
   if(container_mc.mc_crystal._visible)
   {
      _loc5_.push(container_mc.mc_crystal);
   }
   if(container_mc.partyContainerMc._visible)
   {
      _loc5_.push(container_mc.partyContainerMc);
   }
   if(container_mc.partyMasterMc._visible)
   {
      _loc5_.push(container_mc.partyMasterMc);
   }
   if(container_mc.timeContainerMc._visible)
   {
      _loc5_.push(container_mc.timeContainerMc);
   }
   var _loc3_ = CONTENT_END_Y;
   if(_loc5_.length > 0)
   {
      var _loc1_ = undefined;
      var _loc4_ = _loc5_.length;
      _loc1_ = 0;
      while(_loc1_ < _loc4_)
      {
         var _loc2_ = _loc5_[_loc4_ - 1 - _loc1_];
         _loc3_ = _loc3_ - (_loc2_._height - 2);
         _loc2_._y = _loc3_;
         _loc1_ = _loc1_ + 1;
      }
   }
   var _loc6_ = _loc3_ - (CONTENT_START_Y + CONTENT_TITLE_HEIGHT);
   container_mc.listBgMc._height = CONTENT_TITLE_HEIGHT + _loc6_;
   container_mc.maskMc._height = _loc6_;
   container_mc.scrollbar.pageSize = container_mc.listMc._height;
   container_mc.scrollbar.displaySize = _loc6_;
   container_mc.scrollbar._height = _loc6_ + 3;
   container_mc.scrollbar.resize();
}
function ToGame_BFMatchingProcess_Init()
{
   fscommand("ToGame_BFMatchingProcess_Init");
}
function ToGame_BFMatchingProcess_Close()
{
   fscommand("ToGame_BFMatchingProcess_Close");
}
function ToGame_BFMatchingProcess_BtnEvent(btnId)
{
   var _loc1_ = btnId;
   if(container_mc.mc_crystal._visible)
   {
      if(raPreset.__get__checked())
      {
         _loc1_ = _loc1_ + "\t1";
      }
      else
      {
         _loc1_ = _loc1_ + "\t0";
      }
   }
   getURL("FSCommand:ToGame_BFMatchingProcess_BtnEvent",_loc1_);
}
function closeHandlerClick(event)
{
   ToGame_BFMatchingProcess_Close();
}
function confirmHandlerClick(event)
{
   ToGame_BFMatchingProcess_BtnEvent(btn0ID);
}
function cancelHandlerClick(event)
{
   ToGame_BFMatchingProcess_BtnEvent(btn1ID);
}
function equippedHandlerChange()
{
   raEquipped.__set__checked(true);
   raPreset.__set__checked(false);
   changeCrystal();
}
function presetHandlerChange()
{
   raEquipped.__set__checked(false);
   raPreset.__set__checked(true);
   changeCrystal();
}
if(_global.gfxPlayer)
{
   UI._visible = true;
   myListener.OnGame_BFMatchingProcess_SetDisplay("aa","0","Confirm","","");
   myListener.OnGame_BFMatchingProcess_SetCrystalOptionVisible(true,"","",0);
}
