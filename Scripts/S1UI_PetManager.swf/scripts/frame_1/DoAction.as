function ToGame_PetManager_Init()
{
   fscommand("ToGame_PetManager_Init");
}
function ToGame_PetManager_CloseUI()
{
   fscommand("ToGame_PetManager_CloseUI");
}
function ToGame_PetManager_RotateHomun(_pitch, _yaw, _roll)
{
   getURL("FSCommand:ToGame_PetManager_RotateHomun",_pitch + "\t" + _yaw + "\t" + _roll);
}
function ToGame_PetManager_ClickSKill(_skillID)
{
   getURL("FSCommand:ToGame_PetManager_ClickSKill",_skillID);
}
function ToGame_PetManager_InputName(_str)
{
   getURL("FSCommand:ToGame_PetManager_InputName",_str);
}
function ToGame_PetManager_UseSlot(_SlotIndex, _type)
{
   getURL("FSCommand:ToGame_PetManager_UseSlot",_SlotIndex + "\t" + _type);
}
function endCoolTime(slotMc)
{
   slotMc.cool.remove();
   slotMc.CoolTime.clear();
   delete slotMc.cool;
   skillActive = true;
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
function searchSkillInSlot(SkillId)
{
   var _loc1_ = new Array();
   for(var _loc2_ in arrSkill)
   {
      if(arrSkill[_loc2_] == SkillId)
      {
         _loc1_.push(_loc2_);
      }
   }
   return _loc1_;
}
var UI = this;
UI._visible = false;
var UIname = "PetManager";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var skillSlotList = new g4.view.petManager.PetManagerSkillSlotList(UI.container_mc.skillContainer);
var spinDegree = 0;
var intervalId;
var currentEnergy = 0;
var maxEnergy = 0;
var NameDefault = lib.util.UIString.getUIString("$221033");
var RemainDate = lib.util.UIString.getUIString("$490002");
var NameTxt = new lib.util.ExtTextField(container_mc.name_txt,0,container_mc.introBgMc.focus);
var rightClicked = false;
var targetIndex = null;
var rightClickedTarget = null;
var arrSkill = new Array();
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(function()
{
   ToGame_PetManager_CloseUI();
}
);
var disableTrans = lib.info.ColorTrans.disableTrans();
var enableTrans = lib.info.ColorTrans.enableTrans();
var left_btn = container_mc.leftBtn;
var right_btn = container_mc.rightBtn;
LinkageID = "img://ServantManager3DView__258__258";
var myBitmapData = flash.display.BitmapData.loadBitmap(LinkageID);
var mc_bitmap = container_mc.mc_paperDoll.createEmptyMovieClip(LinkageID,container_mc.mc_paperDoll.getNextHighestDepth());
mc_bitmap.attachBitmap(myBitmapData,this.getNextHighestDepth());
mc_bitmap.setMask(container_mc.mc_paperDoll.mask_mc);
mc_bitmap._width = 258;
mc_bitmap._height = 258;
NameTxt.caption = NameDefault;
container_mc.termMc._visible = false;
container_mc.endurance_mc.enduranceMask_mc._xscale = 0;
myListener.OnGame_MouseDown = function(button, target)
{
   if(target == undefined)
   {
      return undefined;
   }
   button = Number(button);
   if(button == 2)
   {
      if(target._parent._parent._parent._parent.UIname == UIname)
      {
         rightClicked = true;
         rightClickedTarget = target._parent.Slot;
         targetIndex = rightClickedTarget.index;
         rightClickedTarget.drag = false;
         ToGame_PetManager_UseSlot(targetIndex,0);
      }
   }
};
myListener.OnGame_MouseUp = function(button, target)
{
   if(target == undefined)
   {
      return undefined;
   }
   button = Number(button);
   if(button == 2)
   {
      if(rightClicked)
      {
         rightClicked = false;
         rightClickedTarget.drag = true;
         ToGame_PetManager_UseSlot(targetIndex,1);
         rightClickedTarget = null;
      }
   }
   if(mIntervalRun)
   {
      myListener.StopSpin();
   }
};
myListener.OnGameEventShowWindow = function(_widgetName, _bShow)
{
   if(_widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = _bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
         myListener.StopSpin();
         skillSlotList.clearCoolTime();
      }
   }
};
myListener.OnGameEventChangeUIMode = function(_bShow)
{
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
      myListener.StopSpin();
   }
};
myListener.OnGame_PetManager_SetPetData = function(_petName, _petGuide)
{
   var _loc1_ = undefined;
   if(_petName == undefined || _petName == "")
   {
      _loc1_ = NameDefault;
   }
   else
   {
      _loc1_ = _petName;
   }
   NameTxt.text = _loc1_;
   NameTxt.textField.textColor = lib.info.TextColor.GENERAL_NORMAL;
   container_mc.guide_txt.text = _petGuide;
};
myListener.OnGame_PetManager_Energy = function(_currentEnergy, _maxEnergy)
{
   currentEnergy = Number(_currentEnergy);
   maxEnergy = Number(_maxEnergy);
   container_mc.endurance_mc.enduranceMask_mc._xscale = currentEnergy / maxEnergy * 100;
   container_mc.endurance_txt.text = currentEnergy + "/" + maxEnergy;
};
myListener.OnGame_PetManager_SetUpdateSlot = function(_SlotIndex, _bActive, _SkillId, _IconName, _SkillName, _remain, _total)
{
   arrSkill[_SlotIndex] = _SkillId;
   var _loc2_ = skillSlotList.getSkillSlotAt(_SlotIndex);
   _loc2_.SLOT.enabled = true;
   var _loc1_ = _loc2_.Slot;
   _loc1_.Count.txt.text = "";
   _loc1_.cool.remove();
   _loc1_.CoolTime.clear();
   _loc1_.index = _SlotIndex;
   _loc1_.img = _IconName;
   _loc1_.id = _SkillId;
   _loc1_.SLOT.enabled = false;
   _loc1_.bgs._visible = false;
   _loc1_.disableSlot = false;
   _loc2_.draw(_IconName);
   if(_IconName != "")
   {
      _loc1_.drag = true;
      _loc1_._parent.drag = true;
      _loc1_._parent.bgs._visible = true;
   }
   _loc1_.EFFECT.IconName = _IconName;
   _loc1_.Icon._visible = true;
   _loc2_.upText = _SkillName;
   PetManager;
   lib.manager.ToolTip.add(_loc2_.SLOT,_SlotIndex,6,_loc1_.Icon);
   var _loc3_ = Number(_bActive);
   if(_loc3_ == 0)
   {
      _loc2_.down_txt.textColor = lib.info.TextColor.SLOT_SKILL_PASSIVE;
      _loc2_.down_txt.text = "$490006";
   }
   else if(_loc3_ == 1)
   {
      _loc2_.down_txt.textColor = lib.info.TextColor.SLOT_SKILL_ACTIVE;
      _loc2_.down_txt.text = "$490007";
   }
   else
   {
      _loc2_.down_txt.textColor = lib.info.TextColor.SLOT_SKILL_PASSIVE;
      _loc2_.down_txt.text = "$490008";
   }
   _loc2_.up_txt.textColor = 16777215;
   _loc2_.center_txt.textColor = 16777215;
   myListener.OnGameEventSetSkillCoolTime(_SkillId,_remain,_total);
};
myListener.OnGame_PetManager_SetToggle = function(_SkillId, _bTrue)
{
   _bTrue = Number(_bTrue);
   var _loc3_ = searchSkillInSlot(_SkillId);
   var _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      var _loc2_ = skillSlotList.getSkillSlotAt(_loc3_[_loc1_]);
      _loc2_.Slot.active = _bTrue;
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_PetManager_SetDisable = function(disable)
{
   if(Number(disable))
   {
      container_mc.skillContainer.onRelease = function()
      {
      };
   }
   else
   {
      delete container_mc.skillContainer.onRelease;
   }
};
myListener.OnGameEventSetSkillEnable = function(_SkillId, _bEnable)
{
   _bEnable = Number(_bEnable);
   var _loc5_ = searchSkillInSlot(_SkillId);
   var _loc2_ = 0;
   while(_loc2_ < _loc5_.length)
   {
      var _loc4_ = skillSlotList.getSkillSlotAt(_loc5_[_loc2_]);
      var _loc1_ = _loc4_.Slot;
      _loc1_.Icon._visible = true;
      _loc1_.SLOT.enabled = bEnable;
      _loc1_.bgs._visible = true;
      if(_bEnable)
      {
         var _loc3_ = new flash.geom.Transform(_loc1_.Icon);
         _loc3_.colorTransform = enableTrans;
         _loc1_.coolTimeMask.gotoAndStop(420);
      }
      else
      {
         _loc3_ = new flash.geom.Transform(_loc1_.Icon);
         _loc3_.colorTransform = disableTrans;
         _loc1_.coolTimeMask.gotoAndStop(419);
      }
      _loc2_ = _loc2_ + 1;
   }
};
myListener.OnGameEventSetSkillCoolTime = function(_SkillId, _remain, _total)
{
   _remain = Number(_remain);
   _total = Number(_total);
   var _loc2_ = undefined;
   var _loc4_ = g4.view.petManager.PetManagerConstants.SKILL_SLOT_COUNT;
   _loc2_ = 0;
   while(_loc2_ < _loc4_)
   {
      if(arrSkill[_loc2_] == _SkillId)
      {
         var _loc3_ = skillSlotList.getSkillSlotAt(_loc2_);
         var mc = _loc3_.Slot;
         if(slotMc.remain == -1 || slotMc.remain != _remainTime)
         {
            slotMc.cool.remove();
            delete slotMc.cool;
            slotMc.cool = new lib.util.CoolTime(_remainTime,_totalTime);
            slotMc.cool.mc = slotMc;
            if(_remainTime <= 0 || _totalTime <= 0)
            {
               endCoolTime(slotMc);
            }
            else
            {
               slotMc.cool.onTick = function()
               {
                  this.mc.remain = this.getRemainTime();
                  this.mc.total = this.getTotalTime();
                  this.mc.Count.txt.text = this.getCountText();
                  lib.util.CoolTime.draw(this.mc.CoolTime,50,50,360 - this.getDgree(),0,60,true);
               };
               slotMc.cool.onFinished = function()
               {
                  endCoolTime(this.mc);
               };
               skillActive = false;
            }
         }
      }
      _loc2_ = _loc2_ + 1;
   }
};
myListener.OnGame_PetManager_SetTerm = function(_flag, _date)
{
   container_mc.termMc._visible = Boolean(Number(_flag));
   container_mc.termMc.txt0.text = RemainDate + _date;
};
container_mc.balloonMc.onMouseMove = function()
{
   if(this.hitTest(_root._xmouse,_root._ymouse))
   {
      container_mc.introBgMc.bg.onEnterFrame = function()
      {
         this._alpha = this._alpha + 20;
         if(this._alpha >= 100)
         {
            this._alpha = 100;
            delete this.onEnterFrame;
         }
      };
   }
   else if(Selection.getFocus() != container_mc.name_txt)
   {
      delete container_mc.introBgMc.bg.onEnterFrame;
      container_mc.introBgMc.bg._alpha = 0;
   }
};
NameTxt.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local > 0)
   {
      _loc1_ = NameTextLength_Local;
   }
   else
   {
      _loc1_ = 40;
   }
   lib.util.StrByteLen.getLenth3(container_mc.name_txt,_loc1_);
};
NameTxt.onKillFocusEvent = function()
{
   var _loc2_ = lib.util.ExtString.trim(this.text);
   if(NameDefault == _loc2_)
   {
      ToGame_PetManager_InputName("");
   }
   else
   {
      ToGame_PetManager_InputName(this.text);
   }
   this.textField.textColor = lib.info.TextColor.GENERAL_NORMAL;
   container_mc.introBgMc.bg._alpha = 0;
};
NameTxt.onEnterKey = function()
{
   Selection.setFocus(null);
};
var mIntervalRun = false;
myListener.updateDegreeDelta = function(DegreeDelta)
{
   spinDegree = spinDegree + DegreeDelta;
   if(spinDegree > 360)
   {
      spinDegree = spinDegree - 360;
   }
   else if(spinDegree < 0)
   {
      spinDegree = spinDegree + 360;
   }
   ToGame_PetManager_RotateHomun(0,spinDegree,0);
};
myListener.StartSpin = function(Degree)
{
   mIntervalRun = true;
   if(intervalId != null)
   {
      intervalId = setInterval(this,"updateDegreeDelta",20,Degree);
   }
   else
   {
      clearInterval(intervalId);
      intervalId = setInterval(this,"updateDegreeDelta",20,Degree);
   }
};
myListener.StopSpin = function()
{
   mIntervalRun = false;
   clearInterval(intervalId);
};
left_btn.onRelease = left_btn.onReleaseOutside = left_btn.onRollOut = function()
{
   this.gotoAndStop(1);
   myListener.StopSpin();
};
left_btn.onPress = function()
{
   this.gotoAndStop(3);
   myListener.StartSpin(-5);
};
left_btn.onRollOver = function()
{
   this.gotoAndStop(2);
};
right_btn.onRelease = right_btn.onReleaseOutside = right_btn.onRollOut = function()
{
   this.gotoAndStop(1);
   myListener.StopSpin();
};
right_btn.onPress = function()
{
   this.gotoAndStop(3);
   myListener.StartSpin(5);
};
right_btn.onRollOver = function()
{
   this.gotoAndStop(2);
};
ToGame_PetManager_Init();
