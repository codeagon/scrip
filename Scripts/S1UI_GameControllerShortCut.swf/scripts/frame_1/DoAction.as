function clearSlot(mc)
{
   mc.name_txt.text = "";
   mc.draw("");
   mc.drag = false;
   mc.effect = false;
   mc.active = false;
   mc.FX_ACTIVE.gotoAndStop(1);
   mc.num_txt._visible = false;
   mc.validRange_mc.gotoAndStop(1);
   mc.FX_IMPOSSIBLE._visible = false;
   mc.FX_DISABLE._visible = false;
   mc.impossible = false;
   var _loc2_ = new flash.geom.Transform(mc.Icon);
   _loc2_.colorTransform = enableTrans;
   mc.Count.txt.text = "";
   mc.cool.remove();
   mc.CoolTime.clear();
   mc.grade = 0;
   mc.id = undefined;
}
function searchSlot(SetIndex, skillOrItemID)
{
   var _loc4_ = new Array();
   if(SetIndex != undefined)
   {
      var _loc3_ = 0;
      while(_loc3_ < combinationMaxNum)
      {
         if(_loc3_ == SetIndex)
         {
            var _loc6_ = UI["Set" + _loc3_];
            var _loc1_ = 0;
            while(_loc1_ < slotMaxNum)
            {
               var _loc2_ = _loc6_[slotPrefix + _loc1_];
               if(_loc2_.id == skillOrItemID)
               {
                  _loc4_.push(_loc2_);
               }
               _loc1_ = _loc1_ + 1;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   else
   {
      _loc3_ = 0;
      while(_loc3_ < combinationMaxNum)
      {
         _loc6_ = UI["Set" + _loc3_];
         _loc1_ = 0;
         while(_loc1_ < slotMaxNum)
         {
            _loc2_ = _loc6_[slotPrefix + _loc1_];
            if(_loc2_.id == skillOrItemID)
            {
               _loc4_.push(_loc2_);
            }
            _loc1_ = _loc1_ + 1;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   return _loc4_;
}
var UI = this;
UI._visible = false;
var UIname = "GameControllerShortCut";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var disableTrans = lib.info.ColorTrans.disableTrans();
var enableTrans = lib.info.ColorTrans.enableTrans();
var butonMaxNum = 6;
var buttonArray = [];
var slotMaxNum = 6;
var slotPrefix = "gameController__";
var currentControllerType = 0;
var combinationMaxNum = 4;
var currentCombination = 0;
var Set0 = container_mc.sets.set0;
var Set1 = container_mc.sets.set1;
var Set2 = container_mc.sets.set2;
var Set3 = container_mc.sets.set3;
var i = 0;
while(i < combinationMaxNum)
{
   var Set = UI["Set" + i];
   Set._visible = false;
   Set.arrSkill = new Array();
   Set.arrItem = new Array();
   var j = 0;
   while(j < slotMaxNum)
   {
      var slot = Set[slotPrefix + j];
      slot.name_txt.verticalAlign = "center";
      slot.FX_DISABLE._visible = false;
      slot.remain = slot.total = 0;
      slot.FX_ACTIVE.gotoAndStop(1);
      j++;
   }
   i++;
}
var allSlots = [];
var i = 0;
while(i < combinationMaxNum)
{
   var Set = UI["Set" + i];
   var j = 0;
   while(j < slotMaxNum)
   {
      var slot = Set[slotPrefix + j];
      allSlots.push(slot);
      j++;
   }
   i++;
}
var bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowUI = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase() && !bShow)
   {
      myListener.OnGame_GameControllerShortCut_ClearSlot();
   }
};
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      UI._visible = bWidgetOpen;
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
};
myListener.OnGame_GameControllerShortCut_ClearSlot = function(SetIndex, slotIndex)
{
   if(SetIndex != undefined)
   {
      SetIndex = Number(SetIndex);
   }
   if(slotIndex != undefined)
   {
      slotIndex = Number(slotIndex);
   }
   if(slotIndex == undefined)
   {
      var _loc2_ = 0;
      while(_loc2_ < combinationMaxNum)
      {
         if(_loc2_ == SetIndex || SetIndex == undefined)
         {
            var _loc3_ = UI["Set" + _loc2_];
            var _loc1_ = 0;
            while(_loc1_ < slotMaxNum)
            {
               var _loc6_ = _loc3_[slotPrefix + _loc1_];
               clearSlot(_loc6_);
               _loc1_ = _loc1_ + 1;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   else
   {
      _loc6_ = UI["Set" + SetIndex][slotPrefix + slotIndex];
      clearSlot(_loc6_);
   }
};
myListener.OnGame_GameControllerShortCut_UseSuccessed = function(slotIndex)
{
   var _loc1_ = UI["Set" + currentCombination][slotPrefix + slotIndex];
   _loc1_.swapDepths(1000);
   var _loc2_ = lib.util.McMaker.attach(_loc1_.EFFECT,"effect_use");
   lib.util.DrawBitmap.makeMcAndDraw(_loc2_.c_mc,_loc1_.img,64,64);
};
myListener.OnGame_GameControllerShortCut_SetToggle = function(slotIndex, bTrue)
{
   bTrue = Number(bTrue);
   var _loc1_ = UI["Set" + currentCombination][slotPrefix + slotIndex];
   _loc1_.FX_ACTIVE._visible = bTrue;
   if(_loc1_.FX_ACTIVE._currentframe == 1)
   {
      _loc1_.FX_ACTIVE.gotoAndPlay(2);
   }
};
myListener.OnGame_GameControllerShortCut_SetDisable = function(slotIndex, bTrue)
{
   bTrue = Number(bTrue);
   var _loc1_ = UI["Set" + currentCombination][slotPrefix + slotIndex];
   if(bTrue)
   {
      _loc1_.FX_IMPOSSIBLE._visible = true;
   }
   else
   {
      _loc1_.FX_IMPOSSIBLE._visible = false;
   }
};
myListener.OnGame_GameControllerShortCut_SetSlot = function(SetIndex, slotIndex, img, itemAmount, grade, shortcutName)
{
   var _loc1_ = UI["Set" + SetIndex][slotPrefix + slotIndex];
   clearSlot(_loc1_);
   _loc1_.img = img;
   _loc1_.EFFECT.img = img;
   _loc1_.setIndex = SetIndex;
   _loc1_.draw(img);
   if(grade != "" && grade != undefined)
   {
      _loc1_.grade = grade;
   }
   if(img != "")
   {
      lib.manager.ToolTip.add(_loc1_.SLOT,slotIndex,6,_loc1_.Icon);
   }
   if(itemAmount != "" && itemAmount != undefined && itemAmount != "-1")
   {
      _loc1_.num_txt._visible = true;
      _loc1_.num_txt.text = itemAmount;
   }
   else
   {
      _loc1_.num_txt._visible = false;
   }
   _loc1_.Icon._visible = true;
   if(img == "" || img == undefined)
   {
      clearSlot(_loc1_);
      _loc1_.name_txt.setText(shortcutName);
   }
};
myListener.OnGame_GameControllerShortCut_SetCoolTime = function(setIndex, slotIndex, remain, total)
{
   remain = Number(remain);
   total = Number(total);
   var mc = UI["Set" + setIndex][slotPrefix + slotIndex];
   if(mc.remain == -1 || mc.remain != remain)
   {
      mc.cool.remove();
      delete mc.cool;
      mc.cool = new lib.util.CoolTime(remain,total);
      mc.cool.mc = mc;
      if(remain <= 0 || total <= 0)
      {
         mc.cool.remove();
         mc.CoolTime.clear();
         delete mc.cool;
         mc.swapDepths(1000);
         skillActive = true;
         var _loc2_ = lib.util.McMaker.attach(mc.EFFECT,"effect_standby",50);
         _loc2_.blendMode = "add";
         lib.util.DrawBitmap.makeMcAndDraw(_loc2_.a_mc,mc.img,68,68);
         lib.util.DrawBitmap.makeMcAndDraw(_loc2_.b_mc,mc.img,68,68);
         lib.util.DrawBitmap.makeMcAndDraw(_loc2_.c_mc,mc.img,68,68);
         mc.Count.txt.text = "";
         mc.remain = mc.total = 0;
      }
      else
      {
         mc.cool.onTick = function()
         {
            this.mc.remain = this.getRemainTime();
            this.mc.total = this.getTotalTime();
            this.mc.Count.txt.text = this.getCountText();
            lib.util.CoolTime.draw(this.mc.CoolTime,50,50,360 - this.getDgree(),0,60,true);
         };
         mc.cool.onFinished = function()
         {
            myListener.OnGame_GameControllerShortCut_SetCoolTime(this.mc.setIndex,this.mc.id,-1,-1);
         };
         skillActive = false;
      }
   }
};
myListener.OnGame_GameControllerShortCut_SetControllerType = function(type)
{
   type = Number(type);
   buttonArray = [];
   if(currentControllerType != type)
   {
      myListener.OnGame_GameControllerShortCut_ClearSlot(0);
      myListener.OnGame_GameControllerShortCut_ClearSlot(1);
      myListener.OnGame_GameControllerShortCut_ClearSlot(2);
      myListener.OnGame_GameControllerShortCut_ClearSlot(3);
   }
   currentControllerType = type;
   if(type == 0)
   {
      container_mc.xbox_mc._visible = true;
      container_mc.ps_mc._visible = false;
      var _loc1_ = 0;
      while(_loc1_ < butonMaxNum)
      {
         var _loc2_ = container_mc.xbox_mc["button" + _loc1_];
         _loc2_._visible = false;
         buttonArray.push(_loc2_);
         _loc1_ = _loc1_ + 1;
      }
   }
   else
   {
      container_mc.xbox_mc._visible = false;
      container_mc.ps_mc._visible = true;
      _loc1_ = 0;
      while(_loc1_ < butonMaxNum)
      {
         _loc2_ = container_mc.ps_mc["button" + _loc1_];
         _loc2_._visible = false;
         buttonArray.push(_loc2_);
         _loc1_ = _loc1_ + 1;
      }
   }
};
myListener.OnGame_GameControllerShortCut_PressedButton = function(buttonIndex, bPressed)
{
   buttonIndex = Number(buttonIndex);
   bPressed = Number(bPressed);
   buttonArray[buttonIndex]._visible = bPressed;
};
myListener.OnGame_GameControllerShortCut_ChangeSet = function(SetType)
{
   SetType = Number(SetType);
   currentCombination = SetType;
   var _loc1_ = 0;
   while(_loc1_ < combinationMaxNum)
   {
      var _loc2_ = UI["Set" + _loc1_];
      _loc2_._visible = false;
      _loc1_ = _loc1_ + 1;
   }
   UI["Set" + SetType]._visible = true;
};
myListener.OnGame_GameControllerShortCut_SetControllerType(0);
myListener.OnGame_GameControllerShortCut_ChangeSet(0);
fscommand("ToGame_GameControllerShortCut_Init");
