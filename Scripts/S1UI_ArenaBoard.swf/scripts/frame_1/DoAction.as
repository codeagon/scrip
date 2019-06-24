function ToGame_ArenaBoard_Init()
{
   fscommand("ToGame_ArenaBoard_Init");
}
function SetBoard(infoData)
{
   teamMc.nameTxt0.text = infoData[0];
   teamMc.nameTxt1.text = infoData[1];
   teamMc.textFocusL.txt.text = infoData[0];
   teamMc.textFocusR.txt.text = infoData[1];
   teamMc.textFocusL._visible = false;
   teamMc.textFocusR._visible = false;
   lib.display.DrawBitmapData.draw(teamMc.monsterL.img,infoData[2],0,0,0,0,226,156,0.42,0.42);
   lib.display.DrawBitmapData.draw(teamMc.monsterR.img,infoData[3],0,0,0,0,226,156,0.42,0.42);
}
function RealTimeEvent_A(realTimeData)
{
   var _loc7_ = realTimeData[0];
   var _loc10_ = realTimeData[1];
   var _loc11_ = realTimeData[2];
   var _loc8_ = realTimeData[3];
   var _loc2_ = Number(_loc7_) / Number(_loc10_);
   var _loc4_ = Number(_loc11_) / Number(_loc8_);
   var _loc1_ = _loc2_ * 278;
   var _loc5_ = _loc4_ * 278;
   var _loc6_ = teamMc.maskL._width - _loc1_;
   var _loc9_ = teamMc.maskR._width - _loc5_;
   if(_loc6_ > criticalDamage)
   {
      EffectPlay(teamMc.gageL.effect,teamMc.monsterL);
   }
   if(_loc9_ > criticalDamage)
   {
      EffectPlay(teamMc.gageR.effect,teamMc.monsterR);
   }
   teamMc.maskL._width = _loc1_;
   teamMc.maskR._width = _loc5_;
   teamMc.txtL.text = int(_loc2_ * 100) + "%";
   teamMc.txtR.text = int(_loc4_ * 100) + "%";
   teamMc.txtL._x = 278 - teamMc.maskL._width - 385;
   teamMc.txtR._x = 285 - (278 - teamMc.maskR._width);
}
function EffectPlay(_targetMc0, _targetMc1)
{
   _targetMc0._alpha = 90;
   gs.TweenLite.killTweensOf(_targetMc0,false);
   gs.TweenLite.to(_targetMc0,1,{_alpha:0});
   _targetMc1.count = 0;
   _targetMc1.x = _targetMc1._x;
   _targetMc1.y = _targetMc1._y;
   _targetMc1.onEnterFrame = function()
   {
      this.count = this.count + 1;
      this._x = this.x + (3 - random(6));
      this._y = this.y + (3 - random(6));
      if(this.count > 5)
      {
         this._x = this.x;
         this._y = this.y;
         delete this.onEnterFrame;
      }
   };
}
function timerPlay(_num, _danger)
{
   clearInterval(timeInterval);
   timeInterval = null;
   battleTime = 0;
   if(_num > 0)
   {
      battleTime = _num;
      dangerTimer = _danger;
      timeInterval = setInterval(this,"SetTimer",1000);
   }
}
function SetTimer()
{
   var _loc4_ = int(Number(battleTime) / 60);
   var _loc3_ = Number(battleTime) % 60;
   var _loc1_ = String(_loc4_);
   var _loc2_ = String(_loc3_);
   if(_loc4_ < 10)
   {
      _loc1_ = "0" + _loc1_;
   }
   if(_loc3_ < 10)
   {
      _loc2_ = "0" + _loc2_;
   }
   container_mc.stateFd.text = _loc1_ + ":" + _loc2_;
   if(dangerTimer >= battleTime)
   {
      container_mc.stateFd.textColor = TEXT_DANGER_COLOR;
   }
   else
   {
      container_mc.stateFd.textColor = TEXT_NORMAL_COLOR;
   }
   battleTime--;
   if(battleTime < 0)
   {
      clearInterval(timeInterval);
      timeInterval = null;
   }
}
function searchBuff(team, id)
{
   var _loc2_ = undefined;
   if(team == 0)
   {
      _loc2_ = LbuffList.getIterator();
   }
   else
   {
      _loc2_ = RbuffList.getIterator();
   }
   while(_loc2_.hasNext())
   {
      var _loc1_ = _loc2_.next();
      if(_loc1_.id == id)
      {
         return _loc1_;
      }
   }
   return null;
}
function containerClear(_targetMc)
{
   for(var _loc2_ in _targetMc)
   {
      if(typeof _targetMc[_loc2_] == "movieclip")
      {
         _targetMc[_loc2_].removeMovieClip();
      }
   }
}
var UI = this;
UI._visible = false;
var UIname = "ArenaBoard";
this.bWindowOpen = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI);
var criticalDamage = 5;
var TEXT_NORMAL_COLOR = 16777215;
var TEXT_DANGER_COLOR = lib.info.TextColor.GENERAL_CRITICAL;
var arenaMode = 0;
var teamMc;
var buffGap = 5;
var LbuffList = new lib.util.List(container_mc.LMc,"Lbuff_");
var RbuffList = new lib.util.List(container_mc.RMc,"Rbuff_");
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      var _loc1_ = new lib.controls.CustomScaleEvent();
      _loc1_.CustomScaleEventCheck(UI,UIname);
      if(bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         clearInterval(timeInterval);
         timeInterval = null;
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(_bShow)
{
};
myListener.OnGame_ArenaBoard_SetBoardType = function(Mode)
{
   arenaMode = Mode;
   BoardReset(container_mc.boardMc);
   teamMc = container_mc.boardMc.attachMovie("boardType" + Mode,"board" + Mode,Number(Mode));
   teamMc.gageL.effect._alpha = 0;
   teamMc.gageR.effect._alpha = 0;
};
myListener.OnGame_ArenaBoard_SetData = function(Data)
{
   var _loc1_ = lib.util.ExtString.split(Data,"\t");
   SetBoard(_loc1_);
};
myListener.OnGame_ArenaBoard_RealTimeData = function(Data)
{
   var _loc1_ = lib.util.ExtString.split(Data,"\t");
   if((var _loc0_ = arenaMode) === 0)
   {
      RealTimeEvent_A(_loc1_);
   }
};
myListener.OnGame_ArenaBoard_SetTimer = function(str, num, alert)
{
   if(num)
   {
      timerPlay(num,alert);
   }
   else
   {
      container_mc.stateFd.text = str;
   }
};
myListener.OnGame_ArenaBoard_SetTeam = function(team)
{
   if(team == 0)
   {
      teamMc.monsterL._xscale = 130;
      teamMc.monsterL._yscale = 130;
      teamMc.monsterL._x = -443;
      teamMc.monsterL._y = -45;
      teamMc.nameTxt0._visible = false;
      teamMc.textFocusL._visible = true;
   }
   else if(team == 1)
   {
      teamMc.monsterR._xscale = 130;
      teamMc.monsterR._yscale = 130;
      teamMc.monsterR._x = 443;
      teamMc.monsterR._y = -45;
      teamMc.nameTxt1._visible = false;
      teamMc.textFocusR._visible = true;
   }
};
myListener.OnGame_ArenaBoard_AddBuff = function(team, id, stackCnt, img, remain, total)
{
   var maked;
   remain = Math.abs(Number(remain));
   total = Math.abs(Number(total));
   stackCnt = Number(stackCnt);
   var _loc11_ = null;
   var _loc7_ = null;
   var _loc8_ = null;
   var _loc10_ = null;
   var _loc6_ = searchBuff(id);
   if(_loc6_ == null)
   {
      if(team == 0)
      {
         maked = LbuffList.add(id,"Slot_link");
         LbuffList.xGap = buffGap;
         LbuffList.setAlignDirection("L");
      }
      else
      {
         maked = RbuffList.add(id,"Slot_link");
         RbuffList.xGap = buffGap;
         RbuffList.setAlignDirection("R");
      }
      maked.Count.txt.textColor = lib.info.TextColor.SLOT_ABNORMALITY_BUFF;
      maked.warn = false;
      maked.stack.text = stackCnt;
      if(total == 0)
      {
         maked.Count._visible = false;
         maked.CoolTime._visible = false;
      }
      else
      {
         maked.CoolTime._visible = true;
         maked.Count._visible = true;
         maked.cool = new lib.util.CoolTime(remain,total);
         var _loc5_ = random(1000000);
         maked.cool.tempCount = _loc5_;
         if(remain <= 0)
         {
            maked.cool.remove();
            delete maked.cool;
            myListener.OnGame_Abnormality_RemoveBuff(team,id);
         }
         else
         {
            maked.cool.onTick = function()
            {
               maked.Count.txt.text = this.getCountText();
               if(this.getSecond() <= 3 && maked.warn == false)
               {
                  lib.util.Warning.add(maked);
                  maked.warn = true;
               }
               lib.util.CoolTime.draw(maked.CoolTime,58.7,58.7,this.getDgree(),0,45,true);
            };
            maked.cool.onFinished = function()
            {
               delete maked.cool;
               myListener.OnGame_ArenaBoard_RemoveBuff(team,id);
            };
         }
      }
      maked.id = id;
      maked._xscale = maked._yscale = 50;
      maked.img = img;
      maked.draw(img,58.7,58.7);
      maked.drag = false;
      maked.effect = false;
      maked.Count._alpha = 100;
      maked.Count.txt.textAutoSize = "fit";
      lib.manager.ToolTip.add(maked.SLOT,id,4,maked.Icon);
      maked.onUnload = function()
      {
         lib.util.Warning.remove(this);
         this.cool.remove();
      };
   }
};
myListener.OnGame_ArenaBoard_UpdateBuff = function(team, id, stackCnt, img, remain, total)
{
   remain = Number(remain);
   total = Number(total);
   stackCnt = Number(stackCnt);
   var searched = searchBuff(team,id);
   if(img != undefined && img != "null" && img != "")
   {
      if(searched.TEX != img)
      {
         searched.draw(img,58.7,58.7);
      }
   }
   searched.stack.text = stackCnt;
   if(total == 0)
   {
      lib.util.Warning.remove(searched,true);
      searched.warn = false;
      searched.cool.remove();
      delete searched.cool;
      searched.Count._visible = false;
      searched.CoolTime._visible = false;
      return undefined;
   }
   searched.Count._visible = true;
   searched.CoolTime._visible = false;
   if(remain != undefined && total != undefined && remain != "null" && total != "null" && remain != "" && total != "")
   {
      searched.cool.remove();
      delete searched.cool;
      lib.util.Warning.remove(searched,true);
      searched.warn = false;
      searched._alpha = 100;
      searched.cool = new lib.util.CoolTime(remain,total);
      searched.cool.reverse = true;
      searched.cool.onTick = function()
      {
         searched.Count.txt.text = this.getCountText();
         lib.util.CoolTime.draw(searched.CoolTime,58.7,58.7,this.getDgree(),0,45,true);
      };
      searched.cool.onFinished = function()
      {
         delete searched.cool;
         myListener.OnGame_ArenaBoard_RemoveBuff(team,id);
      };
   }
};
myListener.OnGame_ArenaBoard_RemoveBuff = function(team, id)
{
   var _loc1_ = undefined;
   if(team == 0)
   {
      _loc1_ = LbuffList.getItem(id);
      _loc1_.cool.remove();
      delete register1.cool;
      LbuffList.remove(id);
   }
   else
   {
      _loc1_ = RbuffList.getItem(id);
      _loc1_.cool.remove();
      delete register1.cool;
      RbuffList.remove(id);
   }
};
myListener.OnGame_ArenaBoard_ClearBuff = function(team)
{
   LbuffList.clear();
   RbuffList.clear();
};
var timeInterval;
var battleTime = 0;
var dangerTimer = 0;
ToGame_ArenaBoard_Init();
