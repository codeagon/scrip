function ToGame_PremiumFusion_Init()
{
   fscommand("ToGame_PremiumFusion_Init");
}
function ToGame_PremiumFusion_CloseUI()
{
   fscommand("ToGame_PremiumFusion_CloseUI");
}
function ToGame_PremiumFusion_Fusion()
{
   fscommand("ToGame_PremiumFusion_Fusion");
}
function ToGame_PremiumFusion_Reset()
{
   fscommand("ToGame_PremiumFusion_Reset");
}
function ToGame_PremiumFusion_ListClick(itemID)
{
   getURL("FSCommand:ToGame_PremiumFusion_ListClick",itemID);
}
function ToGame_PremiumFusion_RightClick(itemID)
{
   getURL("FSCommand:ToGame_PremiumFusion_RightClick",itemID);
}
function slotAniMationStart()
{
   delete containermc.list_mc.onEnterFrame;
   rouletteSpeed = 2;
   rouletteAdd = 1;
   motionStop = false;
   motionEffect = false;
   x_btn.setEnabled(false);
   lib.manager.UISound.play("1207");
   var nextIdx = 0;
   container_mc.list_mc.onEnterFrame = function()
   {
      var _loc4_ = 0;
      while(_loc4_ < ROULETTE_MAX)
      {
         var _loc3_ = container_mc.list_mc["premiumFusion__" + _loc4_];
         _loc3_._x = _loc3_._x - rouletteSpeed;
         if(motionStop == false)
         {
            if(_loc3_._x < -56)
            {
               focusSlot = _loc3_;
               _loc3_._x = _loc3_._x + 577;
               nextIdx = _loc4_ + 1;
               if(nextIdx == ROULETTE_MAX)
               {
                  nextIdx = 0;
               }
            }
         }
         else
         {
            if(focusSlot._x < 120)
            {
               var _loc5_ = container_mc.list_mc["premiumFusion__" + nextIdx];
               _loc5_._x = focusSlot._x + 56;
            }
            if(focusSlot._x < 0)
            {
               focusSlot._x = -0.5;
               lib.manager.ToolTip.add(focusSlot,focusSlot.index,6);
               x_btn.setEnabled(true);
               if(motionEffect)
               {
                  lib.manager.UISound.play("1209");
                  var _loc2_ = container_mc.attachMovie("effectMc","effectMc",container_mc.getNextHighestDepth());
                  _loc2_._xscale = 130;
                  _loc2_._yscale = 130;
                  _loc2_._x = 170;
                  _loc2_._y = 247;
                  _loc2_.hitTestDisable = true;
               }
               else
               {
                  lib.manager.UISound.play("1208");
               }
               delete this.onEnterFrame;
               return undefined;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      rouletteSpeed = rouletteSpeed + rouletteAdd;
      if(rouletteSpeed > MAXSPEED)
      {
         rouletteSpeed = MAXSPEED;
      }
      if(rouletteSpeed < 2)
      {
         rouletteSpeed = 2;
      }
   };
}
function slotAniMationStop()
{
   motionStop = true;
   rouletteAdd = -0.5;
}
function listReset(_lineMc)
{
   removeMovieClip(container_mc.effectMc);
   var _loc1_ = _lineMc;
   for(var _loc2_ in _loc1_)
   {
      if(typeof _loc1_[_loc2_] == "movieclip")
      {
         _loc1_[_loc2_].removeMovieClip();
      }
   }
}
var UI = this;
UI._visible = false;
var UIname = "PremiumFusion";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var ROULETTE_MAX = 10;
var materialLen = 0;
container_mc.booster__1.hitTestDisable = true;
container_mc.booster__1._visible = false;
var x_btn = new lib.util.TxtBtn(container_mc.xBtn);
x_btn.setRelease(ToGame_PremiumFusion_CloseUI);
var list_mcY = container_mc.itemContainer._y;
var scrollbar = container_mc.scrollbar;
scrollbar.addListener(container_mc.itemContainer);
container_mc.itemContainer.onScroll = function()
{
   container_mc.itemContainer._y = list_mcY - arguments[0];
};
scrollbar.setWheel(container_mc.itemContainer);
scrollbar.wheelDelta = 1;
scrollbar.pageSize = 0;
scrollbar.displaySize = 120;
scrollbar.rowHeight = 120;
scrollbar.scroll = 0;
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
container_mc.titleFd.textAutoSize = "shrink";
myListener.OnGame_PremiumFusion_SetTitle = function(_str)
{
   container_mc.titleFd.text = _str;
};
myListener.OnGame_PremiumFusion_FusionButtonEnable = function(_flag)
{
   fusion_btn.setEnabled(Number(_flag));
};
myListener.OnGame_PremiumFusion_ResetButtonEnable = function(_flag)
{
   reset_btn.setEnabled(Number(_flag));
};
myListener.OnGame_PremiumFusion_RouletteClear = function()
{
   x_btn.setEnabled(true);
   delete container_mc.list_mc.onEnterFrame;
   listReset(container_mc.list_mc);
   container_mc.booster__1._visible = false;
};
myListener.OnGame_PremiumFusion_SetRoulette = function(_dataList)
{
   listReset(container_mc.list_mc);
   rouletteArray = [];
   container_mc.booster__1._visible = true;
   var _loc6_ = lib.util.ExtString.split(_dataList,"\n");
   var _loc7_ = _loc6_.length;
   var _loc5_ = 0;
   var _loc3_ = 0;
   while(_loc3_ < ROULETTE_MAX)
   {
      var _loc4_ = _loc3_ % _loc7_;
      var _loc2_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
      var _loc1_ = container_mc.list_mc.attachMovie("Slot_link","premiumFusion__" + _loc3_,container_mc.list_mc.getNextHighestDepth());
      _loc1_.index = _loc2_[0];
      _loc1_.draw(_loc2_[1]);
      _loc1_.SLOT.enabled = false;
      _loc1_.drag = false;
      _loc1_.display = true;
      _loc1_.disable = Boolean(Number(_loc2_[2]));
      _loc1_.grade = _loc2_[3];
      _loc1_.masterpiece = _loc2_[5];
      _loc1_._x = _loc5_;
      _loc5_ = _loc5_ + 56;
      _loc3_ = _loc3_ + 1;
   }
   slotAniMationStart();
};
myListener.OnGame_PremiumFusion_SetResult = function(_dataList, flag)
{
   var _loc1_ = lib.util.ExtString.split(_dataList,"\t");
   focusSlot.index = _loc1_[0];
   focusSlot.draw(_loc1_[1]);
   focusSlot.SLOT.enabled = false;
   focusSlot.drag = false;
   focusSlot.display = true;
   focusSlot.disable = Boolean(Number(_loc1_[2]));
   focusSlot.grade = _loc1_[3];
   focusSlot.masterpiece = _loc1_[5];
   if(flag)
   {
      motionEffect = flag;
   }
   slotAniMationStop();
};
myListener.OnGame_PremiumFusion_SetMaterialMax = function(_num)
{
   listReset(container_mc.list_mc2);
   var _loc3_ = 0;
   materialData = [];
   materialLen = _num;
   container_mc.list_mc2._x = 212 - 31 * _num;
   var _loc1_ = 0;
   while(_loc1_ < _num)
   {
      var _loc2_ = container_mc.list_mc2.attachMovie("Slot_link","premiumFusion__" + _loc1_,container_mc.list_mc2.getNextHighestDepth());
      _loc2_.exist.hitTestDisable = true;
      _loc2_._x = _loc3_;
      _loc3_ = _loc3_ + 64;
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_PremiumFusion_SetMaterialUpdate = function(_dataList)
{
   var _loc4_ = lib.util.ExtString.split(_dataList,"\n");
   var _loc3_ = 0;
   while(_loc3_ < ROULETTE_MAX)
   {
      var _loc2_ = lib.util.ExtString.split(_loc4_[_loc3_],"\t");
      var _loc1_ = container_mc.list_mc2["premiumFusion__" + _loc3_];
      _loc1_.pos = _loc3_;
      _loc1_.index = _loc2_[0];
      _loc1_.draw(_loc2_[1]);
      _loc1_.SLOT.enabled = true;
      _loc1_.display = true;
      _loc1_.drag = true;
      _loc1_.disable = Boolean(Number(_loc2_[2]));
      _loc1_.grade = _loc2_[3];
      _loc1_.masterpiece = _loc2_[5];
      lib.manager.ToolTip.add(_loc1_.SLOT,_loc2_[0],6,_loc1_.Icon);
      _loc3_ = _loc3_ + 1;
   }
};
var fusion_btn;
var reset_btn;
myListener.OnGame_PremiumFusion_SetItemList = function(_dataList, type)
{
   var _loc9_ = Boolean(Number(type));
   container_mc.itemContainer._visible = !_loc9_;
   container_mc.scrollbar._visible = !_loc9_;
   container_mc.itemGuide._visible = _loc9_;
   container_mc.gotoAndStop(1 + Number(type));
   hit._height = 800;
   listReset(container_mc.itemContainer);
   if(_loc9_)
   {
      container_mc.itemGuide.htmlText = _dataList;
      var _loc6_ = container_mc.itemGuide.textHeight + 10;
      if(_loc6_ > 40)
      {
         container_mc.itemGuide._height = _loc6_;
         _loc6_ = _loc6_ - 40;
      }
      else
      {
         _loc6_ = 0;
      }
      container_mc.resetBtn._y = 602 + _loc6_;
      container_mc.fusionBtn._y = 602 + _loc6_;
      container_mc.resetTxt._y = 610 + _loc6_;
      container_mc.fusionTxt._y = 610 + _loc6_;
      container_mc.guideBg._height = 256 + _loc6_;
      hit._height = 680 + _loc6_;
   }
   else
   {
      var _loc7_ = lib.util.ExtString.split(_dataList,"\n");
      var _loc8_ = _loc7_.length;
      var _loc5_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < _loc8_)
      {
         var _loc4_ = lib.util.ExtString.split(_loc7_[_loc3_],"\t");
         var _loc2_ = container_mc.itemContainer.attachMovie("itemMc","line" + _loc3_,container_mc.itemContainer.getNextHighestDepth());
         _loc2_.tt = _loc4_[0];
         _loc2_.txt.setText(_loc4_[1]);
         _loc2_._y = _loc5_;
         _loc5_ = _loc5_ + 25;
         _loc2_.SLOT.onRollOver = function()
         {
            lib.manager.ToolTip.add(this,this._parent.tt,6);
            this.gotoAndStop(2);
         };
         _loc2_.SLOT.onRollOut = _loc2_.SLOT.onReleaseOutside = function()
         {
            this.gotoAndStop(1);
            lib.manager.ToolTip.remove(this);
         };
         _loc3_ = _loc3_ + 1;
      }
      scrollbar.scroll = 0;
      scrollbar.pageSize = _loc5_ + 30;
   }
   fusion_btn = new lib.util.TxtBtn(container_mc.fusionBtn,container_mc.fusionTxt);
   fusion_btn.setRelease(ToGame_PremiumFusion_Fusion);
   reset_btn = new lib.util.TxtBtn(container_mc.resetBtn,container_mc.resetTxt);
   reset_btn.setRelease(ToGame_PremiumFusion_Reset);
   fusion_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
   reset_btn.setTextColor(lib.info.TextColor.BTN_UINIQUE_NORMAL,lib.info.TextColor.BTN_UINIQUE_OVER,lib.info.TextColor.BTN_UINIQUE_PRESS,lib.info.TextColor.BTN_UINIQUE_DISABLE);
   fusion_btn.setEnabled(0);
   reset_btn.setEnabled(0);
};
myListener.OnGame_PremiumFusion_SetGuide = function(_str)
{
   container_mc.guideTxt.htmlText = _str;
};
myListener.OnGame_PremiumFusion_SetNotice = function(_str)
{
   container_mc.noticeTxt.verticalAlign = "center";
   container_mc.noticeTxt.htmlText = _str;
   var _loc1_ = container_mc.noticeTxt.textHeight + 10;
   if(_loc1_ > 70)
   {
      container_mc.noticeTxt._height = _loc1_;
      container_mc.noticeBg._y = 65 + _loc1_;
   }
};
var MAXSPEED = 20;
var rouletteSpeed = 2;
var rouletteAdd = 1;
var focusSlot;
var motionStop = false;
var motionEffect = false;
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2 && target._name == "SLOT")
   {
      var _loc2_ = target._parent._parent._name;
      if(_loc2_ == "list_mc2")
      {
         ToGame_PremiumFusion_RightClick(target._parent.pos);
      }
   }
};
ToGame_PremiumFusion_Init();
myListener.OnGame_PremiumFusion_SetMaterialMax(5);
