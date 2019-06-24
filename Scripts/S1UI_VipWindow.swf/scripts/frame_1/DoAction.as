function pageEvent(num)
{
   pointLv = pointLv + num;
   if(pointLv < 1 || checkLv == pointLv)
   {
      container_mc.midMc.pointMc._visible = false;
   }
   else
   {
      container_mc.midMc.pointMc._visible = true;
   }
   if(pointLv <= 0)
   {
      container_mc.defaultMc._visible = true;
      container_mc.listMc._visible = false;
      pointLv = 0;
   }
   else if(pointLv > 10)
   {
      pointLv = 10;
      container_mc.defaultMc._visible = false;
      container_mc.listMc._visible = true;
   }
   else
   {
      container_mc.defaultMc._visible = false;
      container_mc.listMc._visible = true;
   }
   var _loc1_ = 90 + 43.2 * pointLv;
   gs.TweenLite.to(container_mc.midMc.pointMc,0.2,{_x:_loc1_,ease:Regular.easeOut});
}
function ButtonLock(mc, type)
{
   if(type == "0")
   {
      if(mc._currentframe == "2")
      {
         mc.gotoAndStop(3);
         mc.aniMc.gotoAndPlay(2);
      }
      else
      {
         mc.gotoAndStop(1);
      }
   }
   else
   {
      mc.gotoAndStop(2);
   }
}
function ToGame_VipWindow_Init()
{
   fscommand("ToGame_VipWindow_Init");
}
function ToGame_VipWindow_CloseUI()
{
   fscommand("ToGame_VipWindow_CloseUI");
}
function ToGame_VipWindow_GuideButton()
{
   fscommand("ToGame_VipWindow_GuideButton");
}
function ToGame_VipWindow_CurrentPage()
{
   pointLv = checkLv;
   pageEvent(0);
   fscommand("ToGame_VipWindow_CurrentPage");
}
function ToGame_VipWindow_PrevPage()
{
   pageEvent(-1);
   fscommand("ToGame_VipWindow_PrevPage");
}
function ToGame_VipWindow_NextPage()
{
   pageEvent(1);
   fscommand("ToGame_VipWindow_NextPage");
}
function ToGame_VipWindow_ShopButton()
{
   fscommand("ToGame_VipWindow_ShopButton");
}
function ToGame_VipWindow_DungeonButton()
{
   fscommand("ToGame_VipWindow_DungeonButton");
}
function ToGame_VipWindow_RewardButton()
{
   fscommand("ToGame_VipWindow_RewardButton");
}
function ToGame_VipWindow_VisibleCheck(type)
{
   getURL("FSCommand:ToGame_VipWindow_VisibleCheck",type);
}
function effectEvent(mc, effect)
{
   if(effect)
   {
      mc.gotoAndPlay(2);
   }
   else
   {
      mc.gotoAndStop(1);
   }
}
function coolTimeEvent(mc, coolTime)
{
   if(coolTime)
   {
      var _loc2_ = lib.util.ExtString.split(coolTime,"\t");
      mc.text = _loc2_[0];
      mc._visible = true;
   }
   else
   {
      mc._visible = false;
   }
}
function listReset(mc)
{
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
var UIname = "VipWindow";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var x_btn = new lib.util.TxtBtn(container_mc.xBtn);
x_btn.setRelease(ToGame_VipWindow_CloseUI);
var guide_btn = new lib.util.TxtBtn(container_mc.guideBtn);
guide_btn.setRelease(ToGame_VipWindow_GuideButton);
var current_btn = new lib.util.TxtBtn(container_mc.midMc.currentBtn);
current_btn.setRelease(ToGame_VipWindow_CurrentPage);
var prev_btn = new lib.util.TxtBtn(container_mc.midMc.prevBtn);
prev_btn.setRelease(ToGame_VipWindow_PrevPage);
var next_btn = new lib.util.TxtBtn(container_mc.midMc.nextBtn);
next_btn.setRelease(ToGame_VipWindow_NextPage);
var shop_btn = new lib.util.TxtBtn(container_mc.shopBtn,container_mc.shopBtn.shopTxt);
shop_btn.setRelease(ToGame_VipWindow_ShopButton);
var dungeon_btn = new lib.util.TxtBtn(container_mc.dungeonBtn,container_mc.dungeonBtn.dungeonTxt);
dungeon_btn.setRelease(ToGame_VipWindow_DungeonButton);
var reward_btn = new lib.util.TxtBtn(container_mc.rewardBtn,container_mc.rewardBtn.rewardTxt);
reward_btn.setRelease(ToGame_VipWindow_RewardButton);
shop_btn.setTextColor("0xCCE987","0xFFFFFF","0xCCE987","0x666666");
dungeon_btn.setTextColor("0xCCE987","0xFFFFFF","0xCCE987","0x666666");
reward_btn.setTextColor("0xCCE987","0xFFFFFF","0xCCE987","0x666666");
container_mc.rewardBtn.rewardTxt.verticalAlign = "center";
container_mc.dungeonBtn.dungeonTxt.verticalAlign = "center";
container_mc.shopBtn.shopTxt.verticalAlign = "center";
container_mc.rewardBtn.rewardTxt.htmlText = lib.util.UIString.getUIString("$500091");
container_mc.dungeonBtn.dungeonTxt.htmlText = lib.util.UIString.getUIString("$500092");
container_mc.shopBtn.shopTxt.htmlText = lib.util.UIString.getUIString("$500093");
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
var EXP_WID = 479;
var checkLv = 0;
var pointLv = 0;
var PAGE_STR0 = lib.util.UIString.getUIString("$500086");
var PAGE_STR1 = lib.util.UIString.getUIString("$500087");
var PAGE_STR2 = lib.util.UIString.getUIString("$500089");
container_mc.bgMc._height = 948;
var DEFAULT_STR = lib.util.UIString.getUIString("$500109");
container_mc.defaultMc._visible = false;
container_mc.defaultMc.txt.htmlText = DEFAULT_STR;
myListener.OnGame_VipWindow_SetData = function(Lv, pExp, tExp, nExp)
{
   container_mc.titleTxt.text = lib.util.UIString.getUIString("$500084");
   container_mc.expMc._width = int(EXP_WID * pExp / tExp);
   container_mc.lvTxt.text = Lv;
   checkLv = pointLv = Number(Lv);
   pageEvent(0);
   if(checkLv == 0)
   {
      container_mc.midMc.currentBtn._visible = false;
      container_mc.midMc.maskMc._width = 1;
   }
   else
   {
      container_mc.midMc.currentBtn._visible = true;
      container_mc.midMc.currentBtn.txt.text = checkLv;
      container_mc.midMc.currentBtn._x = container_mc.midMc.maskMc._width = 67 + 43.2 * checkLv;
   }
   container_mc.midMc.ballMc.gotoAndStop(Number(lvNum) + 1);
   var _loc1_ = Number(Lv) + 1;
   var _loc3_ = nExp;
   if(_loc1_ < 11)
   {
      container_mc.expTxt.text = lib.util.UIString.getUIString("$500085","level",_loc1_,"count",_loc3_);
      var _loc4_ = int(pExp / tExp * 100) + "%";
      lib.manager.ToolTip.add(container_mc.expMc,_loc4_,1);
   }
   else
   {
      container_mc.expTxt.text = PAGE_STR0;
      lib.manager.ToolTip.remove(container_mc.expMc);
   }
};
container_mc.midMc.currentBtn._visible = false;
container_mc.midMc.pointMc._visible = false;
myListener.OnGame_VipWindow_SetPage = function(titleStr, listData)
{
   listReset(container_mc.listMc);
   var _loc13_ = Number(titleStr);
   var _loc12_ = PAGE_STR1;
   if(_loc13_ != checkLv)
   {
      _loc12_ = lib.util.UIString.getUIString("$500088","level",_loc13_);
   }
   container_mc.mainTxt.text = _loc12_;
   var _loc10_ = lib.util.ExtString.split(listData,"\n");
   var _loc11_ = _loc10_.length;
   var _loc9_ = 0;
   var _loc8_ = -60;
   var _loc4_ = 0;
   while(_loc4_ < _loc11_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc10_[_loc4_],"\t");
      var _loc1_ = container_mc.listMc.attachMovie("lineMc","lineMc" + _loc4_,_loc4_);
      var _loc6_ = Number(_loc2_[0]) + 2;
      if(_loc6_ != _loc9_)
      {
         _loc1_.gotoAndStop(_loc6_);
         _loc9_ = _loc6_;
         _loc8_ = _loc8_ + 60;
      }
      else
      {
         _loc8_ = _loc8_ + 36;
      }
      var _loc3_ = Number(_loc2_[3]) * 1.67;
      var _loc5_ = Number(_loc2_[4]) * 1.67;
      var _loc7_ = _loc5_ - _loc3_;
      _loc1_.bar0._width = _loc3_;
      if(_loc7_ > 0)
      {
         _loc1_.bar1._width = _loc3_;
         _loc1_.bar2._width = _loc5_;
         _loc1_.bar2._visible = true;
      }
      else if(_loc7_ < 0)
      {
         _loc1_.bar1._width = _loc5_;
         _loc1_.bar2._visible = false;
      }
      else
      {
         _loc1_.bar1._width = _loc3_;
         _loc1_.bar2._visible = false;
      }
      _loc1_.txt.verticalAlign = "center";
      _loc1_.txt.htmlText = _loc2_[1];
      _loc1_.txt2.htmlText = _loc2_[2];
      if(_loc2_[5] == 2)
      {
         _loc1_.txt1.htmlText = PAGE_STR2;
      }
      else
      {
         _loc1_.txt1.htmlText = "";
      }
      _loc1_._y = _loc8_;
      if(_loc3_ < 20)
      {
         _loc1_.bar0._visible = false;
         _loc1_.bar1._visible = false;
      }
      if(_loc5_ < 20)
      {
         _loc1_.bar1._visible = false;
         _loc1_.bar2._visible = false;
      }
      _loc4_ = _loc4_ + 1;
   }
};
myListener.OnGame_VipWindow_PrevPage = function(Mode)
{
   prev_btn.setEnabled(Boolean(Number(Mode)));
};
myListener.OnGame_VipWindow_NextPage = function(Mode)
{
   next_btn.setEnabled(Boolean(Number(Mode)));
};
myListener.OnGame_VipWindow_ShopButton = function(Mode, Lock, coolTime, effect, tooltip)
{
   shop_btn.setEnabled(Boolean(Number(Mode)));
   ButtonLock(container_mc.lockMc2,Lock);
   coolTimeEvent(container_mc.shopBtn.timeTxt2,coolTime);
   effectEvent(container_mc.shopBtn.effectMc,effect);
   lib.manager.ToolTip.add(container_mc.shopBtn,tooltip,1);
};
myListener.OnGame_VipWindow_DungeonButton = function(Mode, Lock, coolTime, effect, tooltip)
{
   dungeon_btn.setEnabled(Boolean(Number(Mode)));
   ButtonLock(container_mc.lockMc1,Lock);
   coolTimeEvent(container_mc.dungeonBtn.timeTxt1,coolTime);
   effectEvent(container_mc.dungeonBtn.effectMc,effect);
   lib.manager.ToolTip.add(container_mc.dungeonBtn,tooltip,1);
};
myListener.OnGame_VipWindow_RewardButton = function(Mode, Lock, coolTime, effect, tooltip)
{
   reward_btn.setEnabled(Boolean(Number(Mode)));
   ButtonLock(container_mc.lockMc0,Lock);
   coolTimeEvent(container_mc.rewardBtn.timeTxt0,coolTime);
   effectEvent(container_mc.rewardBtn.effectMc,effect);
   lib.manager.ToolTip.add(container_mc.rewardBtn,tooltip,1);
};
myListener.OnGame_VipWindow_SetCoin = function(num)
{
   container_mc.btmMc.coinTxt.text = num;
};
myListener.OnGame_VipWindow_SetCheck = function(type)
{
   container_mc.btmMc.checkBtn.checked = Boolean(Number(type));
};
container_mc.btmMc.checkBtn.onChanged = function(changed)
{
   ToGame_VipWindow_VisibleCheck(Number(changed));
};
ToGame_VipWindow_Init();
