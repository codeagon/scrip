function ToGame_HomunShortCut_UseOrb(orbId)
{
   getURL("FSCommand:ToGame_HomunShortCut_UseOrb",orbId);
}
function ToGame_HomunShortCut_RequestHomunMarker()
{
   fscommand("ToGame_HomunShortCut_RequestHomunMarker");
}
function drawCircle(r)
{
   r = r - 180;
   var _loc1_ = container_mc.maskMc;
   _loc1_.clear();
   _loc1_.beginFill(16733542);
   _loc1_.lineStyle(1);
   _loc1_.moveTo(0,0);
   _loc1_.lineTo(-150,0);
   var _loc3_ = undefined;
   var _loc2_ = undefined;
   if(r >= -90)
   {
      _loc3_ = 9.18454765366783e-15;
      _loc2_ = -150;
      _loc1_.lineTo(_loc3_,_loc2_);
   }
   if(r >= 0)
   {
      _loc3_ = 150;
      _loc2_ = 0;
      _loc1_.lineTo(_loc3_,_loc2_);
   }
   if(r >= 90)
   {
      _loc3_ = 9.18454765366783e-15;
      _loc2_ = 150;
      _loc1_.lineTo(_loc3_,_loc2_);
   }
   if(r >= 180)
   {
      _loc3_ = -150;
      _loc2_ = 1.836909530733566e-14;
      _loc1_.lineTo(_loc3_,_loc2_);
   }
   _loc3_ = 150 * Math.cos(r * 3.141592653589793 / 180);
   _loc2_ = 150 * Math.sin(r * 3.141592653589793 / 180);
   _loc1_.lineTo(_loc3_,_loc2_);
   _loc1_.lineTo(0,0);
   _loc1_.endFill();
}
function clearOrbSlot()
{
   orbSelectNum = null;
   orb_array = [];
   var _loc2_ = 0;
   while(_loc2_ < 5)
   {
      var _loc1_ = container_mc["orb" + _loc2_ + "_mc"];
      _loc1_.clear();
      _loc1_._visible = false;
      _loc1_.Icon._alpha = 100;
      _loc2_ = _loc2_ + 1;
   }
}
function homunEnabled(bTrue)
{
   var _loc2_ = 0;
   while(_loc2_ < orb_array.length)
   {
      var _loc1_ = orb_array[_loc2_];
      if(!bTrue)
      {
         if(_loc1_.canUse == "E" || _loc1_.canUse == "U")
         {
            _loc1_.SLOT.enabled = false;
            _loc1_.Icon._alpha = 30;
         }
      }
      else if(_loc1_.canUse == "E" || _loc1_.canUse == "U")
      {
         _loc1_.hit.enabled = true;
         _loc1_.Icon._alpha = 100;
      }
      _loc2_ = _loc2_ + 1;
   }
}
function showFrame(bTrue)
{
   if(bTrue)
   {
      container_mc.bg.onEnterFrame = function()
      {
         this._alpha = this._alpha + 20;
         if(this._alpha >= 100)
         {
            delete this.onEnterFrame;
         }
      };
   }
   else
   {
      container_mc.bg.onEnterFrame = function()
      {
         this._alpha = this._alpha - 20;
         if(this._alpha <= 0)
         {
            delete this.onEnterFrame;
         }
      };
   }
}
var UI = this;
var UIname = "HomunShortCut";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
bWidgetOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var orbSelectNum = null;
var orb_array = new Array();
var sparkleNum = null;
var sparkleCnt = 0;
var toolTipstr = "0/0";
var axis = new lib.util.AxisResetter();
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      var _loc1_ = new lib.controls.CustomScaleEvent();
      _loc1_.CustomScaleEventCheck(UI,UIname);
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function()
{
   if(!_global.gbUIMode)
   {
   }
};
myListener.OnGame_HomunShortCut_SetPortrait = function(img, id)
{
   lib.util.DrawBitmap.draw(container_mc.portrait_mc.Icon,img,37,37);
   lib.manager.ToolTip.add(container_mc.slotHit,id,6,container_mc.portrait_mc.Icon);
   container_mc.slotHit.onRelease = function()
   {
      ToGame_HomunShortCut_RequestHomunMarker();
   };
};
myListener.OnGame_HomunShortCut_SetOrbList = function(dataList)
{
   clearOrbSlot();
   var _loc7_ = dataList.split("\n");
   if(_loc7_[_loc7_.length - 1] == "undefined" || _loc7_[_loc7_.length - 1] == "")
   {
      _loc7_.splice(_loc7_.length - 1,1);
   }
   var _loc8_ = _loc7_.length;
   var _loc6_ = 0;
   while(_loc6_ < _loc8_)
   {
      var _loc5_ = _loc7_[_loc6_].split("\t");
      if(_loc5_.length == 3)
      {
         var _loc3_ = container_mc["orb" + _loc6_ + "_mc"];
         _loc3_._visible = true;
         _loc3_.id = _loc5_[0];
         lib.util.DrawBitmap.draw(_loc3_.Icon,_loc5_[1],56,56);
         lib.manager.ToolTip.add(_loc3_.SLOT,_loc3_.id,6,_loc3_.Icon);
         _loc3_.canUse = _loc5_[2];
         if(_loc5_[2] == "D")
         {
            _loc3_._visible = false;
         }
         else
         {
            _loc3_._visible = true;
            _loc3_.SLOT.enabled = true;
         }
         orb_array.push(_loc3_);
      }
      else
      {
         lib.manager.ToolTip.remove(container_mc["orb" + _loc6_ + "_mc"].SLOT);
         container_mc["orb" + _loc6_ + "_mc"]._visible = false;
      }
      _loc6_ = _loc6_ + 1;
   }
   _loc6_ = 0;
   while(_loc6_ < orb_array.length)
   {
      var _loc4_ = orb_array[_loc6_];
      _loc4_.stat = _loc6_;
      _loc4_.onRelease2 = function()
      {
         var _loc2_ = 0;
         while(_loc2_ < orb_array.length)
         {
            if(orb_array[_loc2_].stat == orbSelectNum)
            {
               orb_array[_loc2_].active = false;
               orb_array[_loc2_].canUse = "E";
            }
            _loc2_ = _loc2_ + 1;
         }
         orbSelectNum = this.stat;
         this.canUse = "U";
         this.active = true;
         ToGame_HomunShortCut_UseOrb(this.id);
      };
      if(_loc4_.canUse == "U")
      {
         _loc4_._visible = true;
         _loc4_.SLOT.enabled = true;
         _loc4_.Icon._alpha = 100;
         _loc4_.active = true;
         orbSelectNum = _loc4_.stat;
      }
      _loc6_ = _loc6_ + 1;
   }
};
myListener.OnGame_HomunShortCut_SetAttacked = function(attackedNum)
{
   if(attackedNum == "0")
   {
      sparkleNum = 0;
      container_mc.attacked_mc.gotoAndStop(1);
   }
   else if(attackedNum == "INFINITY")
   {
      sparkleNum = attackedNum;
      container_mc.attacked_mc.gotoAndPlay(2);
   }
   else
   {
      sparkleNum = attackedNum;
      container_mc.attacked_mc.gotoAndPlay(2);
   }
   sparkleCnt = 0;
};
myListener.OnGame_HomunShortCut_SetEndurance = function(currentEndurance, maxEndurance)
{
   var _loc2_ = currentEndurance / maxEndurance * 100;
   container_mc.maskMc._xscale = _loc2_;
   container_mc.endure_txt.text = currentEndurance + "/" + maxEndurance;
   container_mc.endure_txt._width = container_mc.endure_txt.textWidth + 5;
   container_mc.bg._width = container_mc.endure_txt._x + container_mc.endure_txt._width + 25;
   if(_loc2_ < 10)
   {
      container_mc.endure_txt.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
      delete container_mc.gageBtn.onEnterFrame;
      container_mc.gageBtn.tg = 40;
      container_mc.gageBtn._alpha = 100;
      container_mc.impossibleMc._alpha = 100;
      container_mc.gageBtn.onEnterFrame = function()
      {
         this._alpha = this._alpha + 0.4 * (this.tg - this._alpha);
         container_mc.impossibleMc._alpha = container_mc.impossibleMc._alpha + 0.4 * (this.tg - container_mc.impossibleMc._alpha);
         if(this._alpha <= 42)
         {
            this.tg = 100;
         }
         else if(this._alpha >= 98)
         {
            this.tg = 40;
         }
      };
   }
   else
   {
      container_mc.endure_txt.textColor = 10871039;
      delete container_mc.gageBtn.onEnterFrame;
      container_mc.gageBtn._alpha = 100;
      container_mc.impossibleMc._alpha = 0;
   }
};
myListener.OnGame_HomunShortCut_SetVendorState = function(_state, _message, endState)
{
   _state = Number(_state);
   endState = Number(endState);
   if(_state == 1)
   {
      lib.manager.ToolTip.add(container_mc.saleMc,_message,1);
      lib.manager.ToolTip.remove(container_mc.buyMc);
      container_mc.saleMc._visible = true;
      container_mc.buyMc._visible = false;
      container_mc.saleMc.gotoAndPlay(2);
      if(endState)
      {
         container_mc.saleMc.blinkMc.gotoAndPlay(2);
      }
      else
      {
         container_mc.saleMc.blinkMc.gotoAndStop(1);
      }
   }
   else if(_state == 2)
   {
      lib.manager.ToolTip.add(container_mc.buyMc,_message,1);
      lib.manager.ToolTip.remove(container_mc.saleMc);
      container_mc.saleMc._visible = false;
      container_mc.buyMc._visible = true;
      container_mc.buyMc.gotoAndPlay(2);
      if(endState)
      {
         container_mc.buyMc.blinkMc.gotoAndPlay(2);
      }
      else
      {
         container_mc.buyMc.blinkMc.gotoAndStop(1);
      }
   }
   else
   {
      container_mc.saleMc.blinkMc.gotoAndStop(1);
      container_mc.buyMc.blinkMc.gotoAndStop(1);
      lib.manager.ToolTip.remove(container_mc.buyMc);
      lib.manager.ToolTip.remove(container_mc.saleMc);
      container_mc.saleMc._visible = false;
      container_mc.buyMc._visible = false;
   }
};
var i = 0;
while(i < 5)
{
   container_mc["orb" + i + "_mc"]._visible = false;
   container_mc["orb" + i + "_mc"].SLOT.enabled = false;
   container_mc["orb" + i + "_mc"].drag = false;
   i++;
}
container_mc.impossibleMc._alpha = 0;
fscommand("ToGame_HomunShortCut_Init");
