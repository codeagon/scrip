function coolTimeAlimHandler(value)
{
   if(value != null)
   {
      bShowCoolTimeAlim = Number(value);
      if(value == "0")
      {
         clearCoolTimeAlim();
      }
      else if(value == "1")
      {
         showAllCoolTimes();
      }
   }
}
function valueChangeHandler(event)
{
   if(event.key == lib.gamedata.CustomizedUIDataKey.COOLTIMEALIM_SHOW_BOOLEAN)
   {
      coolTimeAlimHandler(event.value);
   }
}
function checkEqual(slotIndex)
{
   var _loc2_ = 0;
   while(_loc2_ < coolData.length)
   {
      var _loc1_ = coolData[_loc2_].slotIndex;
      lib.Debuger.trace("index : " + _loc1_);
      if(slotIndex != _loc1_ && slotData[_loc1_].img == slotData[slotIndex].img)
      {
         lib.Debuger.trace("slotData[" + _loc1_ + "].img : " + slotData[_loc1_].img + "slotData[" + slotIndex + "].img : " + slotData[slotIndex].img);
         return true;
      }
      _loc2_ = _loc2_ + 1;
   }
   return false;
}
function alignCoolTimeAlim()
{
   var _loc1_ = 0;
   while(_loc1_ < coolData.length)
   {
      var _loc6_ = coolData[_loc1_];
      var _loc4_ = _loc6_.slotIndex;
      var _loc5_ = slotData[_loc4_].cool;
      _loc6_.sortKey = _loc5_.getRemainTime();
      if(_loc6_.sortKey == NaN)
      {
         _loc6_.sortKey = _loc6_.remain;
      }
      _loc1_ = _loc1_ + 1;
   }
   coolData.sortOn("sortKey",Array.NUMERIC);
   _loc1_ = 0;
   while(_loc1_ < coolData.length)
   {
      _loc6_ = coolData[_loc1_];
      _loc4_ = _loc6_.slotIndex;
      var _loc3_ = slotData[_loc4_];
      _loc3_.coolIndex = _loc1_;
      if(bShowCoolTimeAlim)
      {
         var _loc2_ = _loc3_.mc;
         _loc2_._x = 57 * _loc1_;
         _loc2_._y = 0;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function changeIndex()
{
   var _loc1_ = 0;
   while(_loc1_ < coolData.length)
   {
      var _loc3_ = coolData[_loc1_];
      var _loc2_ = _loc3_.slotIndex;
      slotData[_loc2_].coolIndex = _loc1_;
      _loc1_ = _loc1_ + 1;
   }
}
function clearSlot(slotIndex, bFlag)
{
   var _loc1_ = slotData[slotIndex];
   _loc1_.cool.remove();
   delete register1.cool;
   var _loc2_ = _loc1_.coolIndex;
   if(_loc2_ != undefined)
   {
      coolData.splice(_loc2_,1);
      changeIndex();
   }
   delete register1.coolIndex;
   if(bFlag)
   {
      clearMc(slotIndex);
   }
}
function clearMc(slotIndex)
{
   var _loc1_ = container_mc.slotContainer["coolTime__" + slotIndex];
   if(_loc1_ == draggingMc && _loc1_ != null && _loc1_ != undefined)
   {
      UI.stopDrag();
      draggingMc = null;
   }
   _loc1_.removeMovieClip();
   delete slotData[slotIndex].mc;
   delete slotData[slotIndex].cool.mc;
}
function clearCoolTimeAlim()
{
   var _loc1_ = 0;
   while(_loc1_ < coolData.length)
   {
      var _loc2_ = coolData[_loc1_].slotIndex;
      clearMc(_loc2_);
      _loc1_ = _loc1_ + 1;
   }
}
function showAllCoolTimes()
{
   var _loc4_ = 0;
   while(_loc4_ < coolData.length)
   {
      var _loc3_ = coolData[_loc4_].slotIndex;
      var _loc2_ = container_mc.slotContainer["coolTime__" + _loc3_];
      if(_loc2_ == undefined)
      {
         _loc2_ = container_mc.slotContainer.attachMovie("Slot_link","coolTime__" + _loc3_,container_mc.slotContainer.getNextHighestDepth());
         _loc2_.Count.txt.text = "";
         _loc2_.drag = false;
         _loc2_.effect = false;
         _loc2_.onPress2 = function()
         {
            UI.startDrag();
            lib.manager.ToolTip.hide();
            draggingMc = this;
         };
         _loc2_.onRelease2 = function()
         {
            UI.stopDrag();
            lib.info.AlignInfo.savePos(UI,1);
            draggingMc = null;
         };
      }
      _loc2_.draw(slotData[_loc3_].img);
      slotData[_loc3_].mc = _loc2_;
      slotData[_loc3_].cool.mc = _loc2_;
      _loc4_ = _loc4_ + 1;
   }
}
var UI = this;
UI._visible = false;
var UIname = "CoolTimeAlim";
var bWindowOpen = true;
container_mc.UIDrager._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var draggingMc = null;
preLoadSlot.unloadMovie();
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == "characterwindow")
   {
      getURL("FSCommand:ToGame_RequestSetUIPosition",UIname);
      clearCoolTimeAlim();
      if(bShowCoolTimeAlim == 1)
      {
         showAllCoolTimes();
      }
      UI._visible = true;
   }
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      UI._visible = bShow;
      myListener.OnGameEventChangeUIMode();
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(!_global.gbUIMode)
   {
   }
};
var bShowCoolTimeAlim = 1;
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.COOLTIMEALIM_SHOW_BOOLEAN,this,"coolTimeAlimHandler");
customizeData.addEventListener(lib.gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
var slotData = new Array();
var coolData = new Array();
myListener.OnGameEventSetShortCut = function(slotIndex, img, ItemAmount, grade)
{
   slotIndex = Number(slotIndex);
   if(slotData[slotIndex].img == img)
   {
      return undefined;
   }
   clearSlot(slotIndex,true);
   var _loc2_ = {img:img,grade:grade};
   slotData[slotIndex] = _loc2_;
};
myListener.OnGameEventClearShortCut = function(slotIndex)
{
   slotIndex = Number(slotIndex);
   clearSlot(slotIndex,true);
   delete slotData.slotIndex;
};
myListener.OnGame_ShortCut_CoolTime = function(slotIndex, remain, total)
{
   slotIndex = Number(slotIndex);
   remain = Number(remain);
   total = Number(total);
   if(checkEqual(slotIndex))
   {
      return undefined;
   }
   var _loc2_ = slotData[slotIndex];
   clearSlot(slotIndex,false);
   _loc2_.cool = new lib.util.CoolTime(remain,total);
   _loc2_.remain = remain;
   _loc2_.cool.slotIndex = slotIndex;
   var _loc5_ = coolData.length;
   slotData[slotIndex].coolIndex = _loc5_;
   var _loc6_ = {slotIndex:slotIndex,remain:remain};
   coolData.push(_loc6_);
   if(bShowCoolTimeAlim)
   {
      var _loc3_ = container_mc.slotContainer["coolTime__" + slotIndex];
      if(_loc3_ == undefined)
      {
         _loc3_ = container_mc.slotContainer.attachMovie("Slot_link","coolTime__" + slotIndex,container_mc.slotContainer.getNextHighestDepth());
         _loc3_.Count.txt.text = "";
         _loc3_.drag = false;
         _loc3_.effect = false;
         _loc3_.onPress2 = function()
         {
            UI.startDrag();
            lib.manager.ToolTip.hide();
            draggingMc = this;
         };
         _loc3_.onRelease2 = function()
         {
            UI.stopDrag();
            lib.info.AlignInfo.savePos(UI,1);
            draggingMc = null;
         };
      }
      _loc3_.draw(slotData[slotIndex].img);
      _loc2_.mc = _loc3_;
      _loc2_.cool.mc = _loc3_;
   }
   alignCoolTimeAlim();
   if(remain <= 0 || total <= 0)
   {
      clearSlot(slotIndex,true);
      alignCoolTimeAlim();
   }
   else
   {
      _loc2_.cool.onTick = function()
      {
         var _loc2_ = this.mc;
         if(_loc2_ != undefined)
         {
            _loc2_.Count.txt.text = this.getCountText();
            lib.util.CoolTime.draw(_loc2_.CoolTime,50,50,360 - this.getDgree(),0,60,true);
         }
      };
      _loc2_.cool.onFinished = function()
      {
         myListener.OnGame_ShortCut_CoolTime(this.slotIndex,-1,-1);
      };
   }
};
testBtn.onRelease = function()
{
   lib.Debuger.trace("coolData.length : " + coolData.length);
   var _loc1_ = 0;
   while(_loc1_ < coolData.length)
   {
      lib.Debuger.trace(_loc1_ + " : " + coolData[_loc1_].slotIndex);
      _loc1_ = _loc1_ + 1;
   }
};
