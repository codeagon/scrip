function guideMessage(index)
{
   var _loc1_ = null;
   if(index == 0)
   {
      _loc1_ = lib.util.UIString.getUIString("$480001");
   }
   else if(index == 1)
   {
      _loc1_ = lib.util.UIString.getUIString("$480002");
   }
   else if(index == 2)
   {
      _loc1_ = lib.util.UIString.getUIString("$480003");
   }
   else if(index == 3)
   {
      _loc1_ = lib.util.UIString.getUIString("$480004");
   }
   else if(index == 4)
   {
      _loc1_ = lib.util.UIString.getUIString("$480005");
   }
   container_mc.guideFd.text = _loc1_;
   container_mc.guideBg.gotoAndPlay(1);
}
function setTotalSlotVisible(bShow)
{
   var _loc1_ = container_mc.CoreSlot__100;
   _loc1_._visible = bShow;
}
function setSocketsVisible(bShow)
{
   var _loc2_ = null;
   var _loc1_ = 0;
   while(_loc1_ < socketCount)
   {
      _loc2_ = container_mc["CoreSlot__" + (_loc1_ + 10)];
      _loc2_._visible = bShow;
      _loc1_ = _loc1_ + 1;
   }
}
function setActive(target, bTrue)
{
   target.active = bTrue;
   var _loc1_ = target.FX_ACTIVE;
   var _loc2_ = null;
   var _loc4_ = 0;
   var _loc3_ = 0;
   if(target.index == 100)
   {
      _loc2_ = "core_select";
      _loc4_ = _loc3_ = 12;
   }
   else
   {
      _loc2_ = "socket_select";
      _loc4_ = _loc3_ = -1;
   }
   if(bTrue)
   {
      _loc1_.attachMovie(_loc2_,"select_effect",_loc1_.getNextHighestDepth(),{_x:_loc4_,_y:_loc3_});
   }
   else
   {
      _loc1_.select_effect.removeMovieClip();
   }
}
function removeEffect(target)
{
   target.removeMovieClip();
}
function ToGame_Core_Init()
{
   fscommand("ToGame_Core_Init");
}
function ToGame_Core_Close()
{
   fscommand("ToGame_Core_Close");
}
function ToGame_Core_SelectSocket(index)
{
   if(index == "100")
   {
      guideMessage(4);
   }
   else if(index != undefined)
   {
      guideMessage(2);
   }
   selectedSocket = index;
   getURL("FSCommand:ToGame_Core_SelectSocket",index);
   lib.Debuger.trace("ToGame_Core_SelectSocket  " + index);
}
function ToGame_Core_RightClick(index)
{
   getURL("FSCommand:ToGame_Core_RightClick",index);
   lib.Debuger.trace("ToGame_Core_RightClick  " + index);
}
var UI = this;
UI._visible = false;
var UIname = "Core";
container_mc.noticeFd.textAutoSize = "shrink";
var positions = [];
positions[0] = [{x:196,y:398}];
positions[1] = [{x:197,y:279},{x:197,y:519}];
positions[2] = [{x:197,y:279},{x:77,y:469},{x:317,y:469}];
positions[3] = [{x:97,y:309},{x:297,y:309},{x:297,y:489},{x:97,y:489}];
positions[4] = [{x:197,y:279},{x:317,y:359},{x:287,y:499},{x:107,y:499},{x:77,y:359}];
positions[5] = [{x:197,y:279},{x:317,y:339},{x:317,y:459},{x:197,y:519},{x:77,y:459},{x:77,y:339}];
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
guideMessage(0);
var coreType;
var socketCount = 6;
myListener.OnGame_Core_TypeSetting = function(type)
{
   selectedSocket = -1;
   coreType = Number(type);
   container_mc.CoreSlot__1._visible = coreType;
   guideMessage(0);
   var _loc4_ = null;
   if(coreType == 0)
   {
      _loc4_ = lib.util.UIString.getUIString("$480006");
      container_mc.CoreSlot__0._x = 209.5;
      container_mc.CoreSlot__0._y = 124;
   }
   else
   {
      _loc4_ = lib.util.UIString.getUIString("$480007");
      container_mc.CoreSlot__0._x = 138.5;
      container_mc.CoreSlot__0._y = 124;
      container_mc.CoreSlot__1._x = 278.5;
      container_mc.CoreSlot__1._y = 124;
   }
   container_mc.titleFd.text = _loc4_;
   var _loc2_ = 0;
   while(_loc2_ < socketCount)
   {
      var _loc1_ = container_mc["CoreSlot__" + (_loc2_ + 10)];
      _loc1_.SLOT.enabled = !coreType;
      if(_loc1_.disableSlot)
      {
         _loc1_.SLOT.enabled = false;
      }
      setActive(_loc1_,false);
      _loc2_ = _loc2_ + 1;
   }
   var _loc3_ = container_mc.CoreSlot__100;
   if(_loc3_)
   {
      _loc3_.SLOT.enabled = !coreType;
      setActive(_loc3_,coreType);
      if(_loc3_.disableSlot)
      {
         _loc3_.SLOT.enabled = false;
      }
   }
};
myListener.OnGame_Core_TargetItem = function(name, img, grade, master)
{
   if(name == undefined)
   {
      name = "테스트 아이템";
      img = "img://__Icon_Equipments.heavychest8_B_Tex";
      grade = random(4);
      master = random(2);
   }
   var _loc1_ = container_mc.CoreSlot__0;
   _loc1_.clear();
   lib.manager.ToolTip.remove(_loc1_.SLOT);
   if(img == "" || img == undefined)
   {
      guideMessage(0);
      return undefined;
   }
   _loc1_.draw(img,55,55);
   lib.manager.ToolTip.add(_loc1_.SLOT,0,6,_loc1_.Icon);
   _loc1_.grade = Number(grade);
   _loc1_.masterpiece = Number(master);
};
myListener.OnGame_Core_TrackItem = function(name, img, grade, count)
{
   if(name == undefined)
   {
      name = "테스트 아이템";
      img = "img://__Icon_Items.rawmineralA10_Tex";
      grade = random(4);
      count = random(90);
   }
   var _loc1_ = container_mc.CoreSlot__1;
   _loc1_.clear();
   lib.manager.ToolTip.remove(_loc1_.SLOT);
   if(img == "" || img == undefined)
   {
      return undefined;
   }
   _loc1_.draw(img,55,55);
   lib.manager.ToolTip.add(_loc1_.SLOT,0,6,_loc1_.Icon);
   _loc1_.grade = Number(grade);
   _loc1_.num = count;
};
var curSlotCount = 0;
myListener.OnGame_Core_SocketCount = function(corecount, addCore, addEffect)
{
   corecount = Number(corecount);
   selectedSocket = -1;
   var _loc6_ = curSlotCount - corecount;
   var _loc2_ = 0;
   if(_loc6_ > 0)
   {
      _loc2_ = corecount;
      while(_loc2_ < curSlotCount)
      {
         var _loc3_ = container_mc["CoreSlot__" + (_loc2_ + 10)];
         _loc3_.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
   }
   else if(_loc6_ < 0)
   {
      _loc6_ = Math.abs(_loc6_);
      _loc2_ = curSlotCount;
      while(_loc2_ < curSlotCount + _loc6_)
      {
         _loc3_ = container_mc.attachMovie("socketSlot","CoreSlot__" + (_loc2_ + 10),container_mc.getNextHighestDepth());
         _loc3_.index = _loc2_ + 10;
         _loc3_.display = false;
         _loc3_.SLOT.enabled = !coreType;
         _loc3_.drag = false;
         _loc3_.onPress2 = function()
         {
            if(this.index == selectedSocket)
            {
               return undefined;
            }
            this.variation._visible = false;
            this.attachMovie("socket_press","socket_press",this.getNextHighestDepth());
         };
         _loc3_.onRelease2 = function()
         {
            if(this.index == selectedSocket)
            {
               return undefined;
            }
            this.variation._visible = true;
            myListener.OnGame_Core_SelectSocket(this.index);
            ToGame_Core_SelectSocket(this.index);
         };
         _loc3_.onReleseOutside2 = function()
         {
            this.variation._visible = true;
         };
         _loc2_ = _loc2_ + 1;
      }
   }
   _loc2_ = 0;
   while(_loc2_ < corecount)
   {
      _loc3_ = container_mc["CoreSlot__" + (_loc2_ + 10)];
      _loc3_._x = positions[corecount - 1][_loc2_].x;
      _loc3_._y = positions[corecount - 1][_loc2_].y;
      setActive(_loc3_,false);
      _loc2_ = _loc2_ + 1;
   }
   if(addCore == "1")
   {
      var _loc5_ = container_mc.CoreSlot__100;
      if(_loc5_ == undefined)
      {
         _loc5_ = container_mc.attachMovie("totalSlot","CoreSlot__100",container_mc.getNextHighestDepth());
         _loc5_.index = 100;
         _loc5_.SLOT.enabled = !coreType;
         setActive(_loc5_,false);
         _loc5_.active = coreType;
         lib.Debuger.trace("totalSlot.active : " + _loc5_.active);
         _loc5_.drag = false;
         _loc5_._x = positions[0][0].x;
         _loc5_._y = positions[0][0].y;
         _loc5_.onPress2 = function()
         {
            if(this.index == selectedSocket)
            {
               return undefined;
            }
            this.attachMovie("core_press","core_press",this.getNextHighestDepth());
         };
         _loc5_.onRelease2 = function()
         {
            if(this.index == selectedSocket)
            {
               return undefined;
            }
            myListener.OnGame_Core_SelectSocket(this.index);
            ToGame_Core_SelectSocket(this.index);
         };
      }
      guideMessage(3);
   }
   else
   {
      container_mc.CoreSlot__100.removeMovieClip();
      guideMessage(Number(corecount > 1));
   }
   curSlotCount = corecount;
   selectedSocket = -1;
   if(addEffect == "1")
   {
      if(container_mc.getInstanceAtDepth(0) != undefined)
      {
         container_mc.getInstanceAtDepth(0).swapDepths(container_mc.getNextHighestDepth());
      }
      container_mc.bg_effect.removeMovieClip();
      var _loc8_ = container_mc.attachMovie("bg_effect","bg_effect",0,{_x:236.5,_y:437.5});
      _loc5_._visible = false;
      setSocketsVisible(false);
   }
};
myListener.OnGame_Core_Socket = function(index, socket, addEffect)
{
   if(socket == undefined)
   {
      var _loc3_ = "";
      if(random(3) == 0)
      {
         _loc3_ = "img://__Icon_Items.CoreColor0" + (random(8) + 1) + "_Lv0" + (random(4) + 1) + "_Tex";
      }
      socket = random(8) + "\t" + random(2) + "\t" + _loc3_ + "\t" + random(4);
   }
   lib.Debuger.trace("img    :  " + _loc3_);
   var _loc1_ = container_mc["CoreSlot__" + index];
   lib.manager.ToolTip.remove(_loc1_.SLOT);
   var _loc2_ = lib.util.ExtString.split(socket,"\t");
   lib.Debuger.trace("slotData : " + _loc2_);
   _loc1_.variation.gotoAndStop(Number(_loc2_[0]) + 1);
   _loc1_.FX_PRESS.variation.gotoAndStop(Number(_loc2_[0]) + 1);
   _loc1_.SLOT.enabled = !coreType;
   _loc1_.disableSlot = _loc2_[1] == "0";
   setActive(_loc1_,false);
   if(selectedSocket == index)
   {
      selectedSocket = -1;
   }
   if(_loc2_[2] != "")
   {
      _loc1_.draw(_loc2_[2],55,55);
   }
   lib.manager.ToolTip.add(_loc1_.SLOT,index,6,_loc1_.Icon);
   _loc1_.grade = Number(_loc2_[3]);
   if(addEffect == "1")
   {
      _loc1_.attachMovie("equip_effect","equip_effect",_loc1_.getNextHighestDepth(),{_x:29,_y:-7.5});
   }
   else if(addEffect == "2")
   {
      container_mc.attachMovie("core_effect","core_effect",container_mc.getNextHighestDepth());
      setTotalSlotVisible(false);
   }
};
myListener.OnGame_Core_SocketTest = function()
{
   myListener.OnGame_Core_Socket(10,"0\t1\timg://__Icon_Items.CoreColor0_2_Tex\t0");
   myListener.OnGame_Core_Socket(11,"0\t1\t\t0");
   myListener.OnGame_Core_Socket(12,"1\t0\t\t0");
   myListener.OnGame_Core_Socket(13,"2\t1\timg://__Icon_Items.CoreColor1_2_Tex\t0");
   myListener.OnGame_Core_Socket(14,"3\t1\timg://__Icon_Items.CoreColor_Inactive_4_Tex\t1");
   myListener.OnGame_Core_Socket(100,"100\t1\timg://__Icon_Items.TotalCore01_Tex\t");
};
myListener.OnGame_Core_Disable = function(flag)
{
   flag = !Number(flag);
   var _loc1_ = 0;
   while(_loc1_ < socketCount)
   {
      var _loc2_ = container_mc["CoreSlot__" + (_loc1_ + 10)];
      _loc2_.SLOT.enabled = flag;
      _loc1_ = _loc1_ + 1;
   }
   container_mc.CoreSlot__0.enabled = flag;
   container_mc.CoreSlot__1.enabled = flag;
   container_mc.CoreSlot__100.enabled = flag;
};
var selectedSocket = -1;
myListener.OnGame_Core_SelectSocket = function(index)
{
   var _loc3_ = container_mc["CoreSlot__" + selectedSocket];
   setActive(_loc3_,false);
   if(Number(index) == -1)
   {
      return undefined;
   }
   var _loc2_ = container_mc["CoreSlot__" + index];
   setActive(_loc2_,true);
   selectedSocket = Number(index);
   if(index == "100")
   {
      guideMessage(4);
   }
   else if(index != undefined)
   {
      guideMessage(2);
   }
};
myListener.OnGame_Core_SetGuideText = function(guideStr)
{
   var _loc1_ = container_mc.noticeFd;
   if(guideStr == "" || guideStr == undefined || guideStr == null)
   {
      _loc1_.text = "";
   }
   else
   {
      _loc1_.text = guideStr;
   }
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(button == 2)
   {
      var _loc1_ = target._parent._name;
      if(_loc1_ == "CoreSlot__0")
      {
         ToGame_Core_RightClick(0);
      }
      else if(_loc1_ == "CoreSlot__1")
      {
         ToGame_Core_RightClick(1);
      }
   }
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_Core_Close);
myListener.OnGame_Core_TypeSetting(0);
myListener.OnGame_Core_SocketCount(0,0);
ToGame_Core_Init();
