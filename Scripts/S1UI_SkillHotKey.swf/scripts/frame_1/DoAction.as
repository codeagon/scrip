function searchBuff(id, type, remove)
{
   if(type == 0)
   {
      var _loc1_ = 0;
      while(_loc1_ < skill_array.length)
      {
         if(skill_array[_loc1_]._name == "skill_" + id)
         {
            var _loc2_ = skill_array[_loc1_];
            if(remove == 1)
            {
               skill_array.splice(_loc1_,1);
            }
            return _loc2_;
         }
         _loc1_ = _loc1_ + 1;
      }
      return null;
   }
   if(type == 1)
   {
      _loc1_ = 0;
      while(_loc1_ < skill_array.length)
      {
         if(skill_array[_loc1_]._name == "skill_" + id)
         {
            _loc2_ = skill_array[_loc1_];
            if(remove == 1)
            {
               skill_array.splice(_loc1_,1);
            }
            return _loc2_;
         }
         _loc1_ = _loc1_ + 1;
      }
      return null;
   }
   _loc1_ = 0;
   while(_loc1_ < skill_array.length)
   {
      if(skill_array[_loc1_]._name == "skill_" + id)
      {
         _loc2_ = skill_array[_loc1_];
         if(remove == 1)
         {
            skill_array.splice(_loc1_,1);
         }
         return _loc2_;
      }
      _loc1_ = _loc1_ + 1;
   }
   return null;
}
function SkillTime_Check(num)
{
   timecheck = timecheck + 0.5;
   var _loc1_ = num / 1000 - timecheck;
   if(_loc1_ <= 0.5)
   {
      gs.TweenLite.killTweensOf(skilltimemc,false);
      gs.TweenLite.to(skilltimemc,0.5,{_alpha:0,ease:gs.easing.Strong.easeOut});
   }
}
function SkillHotKey_ConsoleAdd(_data)
{
   var _loc2_ = _data.split("\t");
   var _loc3_ = undefined;
   if(_loc2_.length > 1)
   {
      var _loc1_ = 0;
      while(_loc1_ < _loc2_.length)
      {
         _loc3_ = lib.info.KeyMap.toKeyCode(_loc2_[_loc1_],1);
         SkillIcon_ConsoleLoad(_loc3_);
         _loc1_ = _loc1_ + 1;
      }
   }
   else
   {
      _loc3_ = lib.info.KeyMap.toKeyCode(_data,1);
      SkillIcon_ConsoleLoad(_loc3_);
   }
}
function SkillIcon_ConsoleLoad(_data)
{
   if(!(_data == undefined || _data == "undefined" || _data == ""))
   {
      ConsoleMovieCount++;
      UI["ConsoleMovie" + ConsoleMovieCount] = skilltimemc.console_mc.createEmptyMovieClip("ConsoleMovies" + ConsoleMovieCount,ConsoleMovieCount);
      lib.util.DrawBitmap.draw(UI["ConsoleMovie" + ConsoleMovieCount],"img://__S1UIRES_GameControllerIcon." + _data);
      UI["ConsoleMovie" + ConsoleMovieCount]._xscale = UI["ConsoleMovie" + ConsoleMovieCount]._yscale = 130;
      if(ConsoleMovieCount > 1)
      {
         UI["ConsoleMovie" + ConsoleMovieCount]._x = UI["ConsoleMovie" + (ConsoleMovieCount - 1)]._width + UI["ConsoleMovie" + (ConsoleMovieCount - 1)]._x;
      }
   }
}
var UI = this;
UI._visible = false;
var UIname = "SkillHotKey";
var bWindowOpen = true;
container_mc.bg._visible = false;
container_mc.UIDrager._visible = false;
container_mc.UIDrager.adjustDragLimit(30,0,0,0);
container_mc.UIDrager.onRollOver = function()
{
   container_mc.bg._alpha = 60;
};
container_mc.UIDrager.onRollOut = function()
{
   container_mc.bg._alpha = 30;
};
container_mc.UIDrager.onReleaseOutside = function()
{
   container_mc.bg._alpha = 30;
};
container_mc.UIDrager.onPress2 = function()
{
};
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      UI._visible = bShow;
      if(!bShow)
      {
         clearInterval(UI.skilltimecheck);
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode)
   {
      if(array.length >= 1)
      {
         container_mc.bg._visible = true;
         container_mc.bg._alpha = 30;
         container_mc.UIDrager._visible = true;
      }
   }
   else
   {
      clearInterval(UI.skilltimecheck);
      container_mc.bg._visible = false;
      container_mc.UIDrager._visible = false;
   }
};
var curNumOfLine = 1;
var slotHeight = 60;
var slotGap = 15;
var skill_array = [];
var cnt = 0;
skill_array.cnt = 0;
var skilltimecheck;
var timecheck = 0;
var skilltimemc;
var ConsoleMovie1;
var ConsoleMovie2;
var ConsoleMovie3;
var ConsoleMovie4;
var ConsoleMovie5;
var ConsoleMovie6;
var ConsoleMovie7;
var ConsoleMovie8;
var ConsoleMovie9;
var ConsoleMovieCount = 0;
var enterFrameFocus;
myListener.OnGame_SkillHotKey_Add = function(id, type, bEnable, img, Name, remain, total, hotKeyRemain, hotKeyTotal, hotKeyStr, custom, consoledata)
{
   var _loc2_ = 0;
   while(_loc2_ < 10)
   {
      UI["ConsoleMovie" + (_loc2_ + 1)].removeMovieClip;
      _loc2_ = _loc2_ + 1;
   }
   ConsoleMovieCount = 0;
   clearInterval(UI.skilltimecheck);
   var hotKeyStr = lib.info.KeyMap.toKeyCode(hotKeyStr);
   cnt++;
   type = Number(type);
   remain = Number(remain);
   total = Number(total);
   var _loc6_ = null;
   var _loc5_ = null;
   var _loc3_ = null;
   var _loc4_ = null;
   if(type == 0)
   {
      _loc6_ = container_mc.abnormality;
      _loc4_ = skill_array;
      _loc3_ = _loc4_.length;
      _loc5_ = "skill_";
   }
   else if(type == 1)
   {
      _loc6_ = container_mc.abnormality;
      _loc4_ = skill_array;
      _loc3_ = _loc4_.length;
      _loc5_ = "skill_";
   }
   var _loc9_ = searchBuff(id,type);
   if(_loc9_ == null)
   {
      var _loc7_ = "Slot_link";
      if(type == 1)
      {
         _loc7_ = "Slot_link";
      }
      var maked = _loc6_.attachMovie(_loc7_,_loc5_ + id,cnt);
      skilltimemc = maked;
      maked.Count.txt.textAutoSize = "shrink";
      _loc4_.cnt = _loc4_.cnt + 1;
      if(total == 0)
      {
         maked.cool.remove();
         delete maked.cool;
         maked.CoolTime._visible = false;
      }
      else
      {
         maked.CoolTime._visible = true;
         maked.cool = new lib.util.CoolTime(remain,total);
         if(remain <= 0)
         {
            maked.cool.remove();
            lib.util.Warning.remove(maked);
            _loc9_.cool.remove();
            delete maked.cool;
            maked.CoolTime.clear();
         }
         else
         {
            maked.cool.onTick = function()
            {
               maked.Count.txt.text = this.getCountText();
               lib.util.CoolTime.draw(maked.CoolTime,50,50,360 - this.getDgree(),0,45,true);
            };
            maked.cool.onFinished = function()
            {
               lib.util.Warning.remove(maked);
               maked.cool.remove();
               delete maked.cool;
               maked.Count.txt.text = "";
               maked.CoolTime.clear();
            };
         }
      }
      if(hotKeyTotal == 0)
      {
         maked.cool2.remove();
         delete maked.cool2;
         maked.CoolTime2._visible = false;
         maked.Count._visible = false;
      }
      else
      {
         maked.CoolTime2._visible = true;
         maked.Count._visible = true;
         if(type == 0)
         {
            maked.color = 52479;
         }
         else
         {
            maked.color = 16711680;
         }
         maked.cool2 = new lib.util.CoolTime(hotKeyRemain,hotKeyTotal);
         timecheck = 0;
         UI.skilltimecheck = setInterval(SkillTime_Check,500,hotKeyRemain,maked);
         if(hotKeyRemain <= 0)
         {
            maked.cool2.remove();
            delete maked.cool2;
            myListener.OnGame_SkillHotKey_Remove(id);
         }
         else
         {
            maked.cool2.onTick = function()
            {
               lib.util.CoolTime.draw(maked.CoolTime2,65,65,this.getDgree(),maked.color,40,true);
            };
            maked.cool2.onFinished = function()
            {
               maked.cool2.remove();
               delete maked.cool2;
               myListener.OnGame_SkillHotKey_Remove(id);
            };
         }
      }
      maked.id = id;
      maked.type = type;
      maked.img = img;
      maked.hotKeyStr = hotKeyStr;
      maked.Count._alpha = 70;
      maked.Count.txt.textAutoSize = "fit";
      maked.name_txt.text = Name;
      maked.onEnterFrame = function()
      {
         if(this.drag)
         {
            delete this.onEnterFrame;
            this.display = true;
            this.drag = false;
            this.effect = false;
            if(type == "0")
            {
               this.hotKey_mc.shortcut0._visible = false;
               this.hotKey_mc.shortcut0_1._visible = false;
               this.hotKey_mc.txt.text = this.hotKeyStr;
               this.hotKey_mc.txt2.text = this.hotKeyStr;
               this.hotKey_mc.txt._width = this.hotKey_mc.txt2._width = this.hotKey_mc.txt.textWidth + 6;
               this.hotKey_mc.shortcut2._width = this.hotKey_mc.shortcut2_1._width = this.hotKey_mc.txt._width + 22;
               this.draw(this.img);
            }
            else
            {
               this.hotKey_mc.shortcut2._visible = false;
               this.hotKey_mc.shortcut2_1._visible = false;
               this.hotKey_mc.txt.text = this.hotKeyStr;
               this.hotKey_mc.txt2.text = this.hotKeyStr;
               this.hotKey_mc.txt._width = this.hotKey_mc.txt2._width = this.hotKey_mc.txt.textWidth + 6;
               this.hotKey_mc.shortcut0._width = this.hotKey_mc.shortcut0_1._width = this.hotKey_mc.txt._width + 22;
               this.draw(this.img);
            }
            this.FX_IMPOSSIBLE._visible = Number(bEnable) == 0;
         }
      };
   }
   maked._alpha = 0;
   maked._y = maked._y + (slotHeight + slotGap);
   _loc3_ = skill_array.length;
   _loc2_ = 0;
   while(_loc2_ < _loc3_)
   {
      gs.TweenLite.killTweensOf(skill_array[_loc2_],false);
      gs.TweenLite.to(skill_array[_loc2_],0.2,{_y:_loc2_ * (- slotHeight - slotGap) - slotHeight,ease:Regular.easeOut});
      _loc2_ = _loc2_ + 1;
   }
   gs.TweenLite.killTweensOf(maked,false);
   gs.TweenLite.to(maked,0.2,{_y:maked._y - slotHeight,_alpha:100,ease:Regular.easeOut});
   skill_array.unshift(maked);
   SkillHotKey_ConsoleAdd(consoledata);
};
myListener.OnGame_SkillHotKey_Update = function(id, bEnable, remain, total, hotKeyRemain, hotKeyTotal)
{
   remain = Number(remain);
   total = Number(total);
   bEnable = Number(bEnable);
   var _loc1_ = searchBuff(id);
   if(!bEnable)
   {
      var _loc7_ = new flash.geom.Transform(_loc1_.Icon);
      _loc7_.colorTransform = lib.info.ColorTrans.disableTrans();
   }
   else
   {
      _loc7_ = new flash.geom.Transform(_loc1_.Icon);
      _loc7_.colorTransform = lib.info.ColorTrans.enableTrans();
   }
   if(remain != undefined && total != undefined && remain != "null" && total != "null" && remain != "" && total != "")
   {
      _loc1_.cool.update(remain,total);
   }
   if(total == 0)
   {
      lib.util.Warning.remove(_loc1_);
      _loc1_.warn = false;
      _loc1_.cool.remove();
      delete register1.cool;
      _loc1_.Count._visible = false;
      _loc1_.CoolTime._visible = false;
   }
   else
   {
      _loc1_.Count._visible = true;
      _loc1_.CoolTime._visible = true;
   }
   if(hotKeyRemain != undefined && hotKeyTotal != undefined && hotKeyRemain != "null" && hotKeyTotal != "null" && hotKeyRemain != "" && hotKeyTotal != "")
   {
      _loc1_.cool2.update(hotKeyRemain,hotKeyTotal);
   }
   if(hotKeyTotal == 0)
   {
      _loc1_.cool2.remove();
      delete register1.cool2;
      _loc1_.CoolTime2._visible = false;
   }
   else
   {
      _loc1_.CoolTime2._visible = true;
   }
};
myListener.OnGame_SkillHotKey_Remove = function(id)
{
   clearInterval(UI.skilltimecheck);
   var _loc1_ = searchBuff(id,null,1);
   lib.util.Warning.remove(_loc1_);
   var _loc3_ = undefined;
   var _loc2_ = _loc1_.type;
   if(_loc2_ == 0)
   {
      _loc3_ = skill_array;
   }
   else if(_loc2_ == 1)
   {
      _loc3_ = skill_array;
   }
   lib.util.Warning.remove(_loc1_);
   _loc1_.cool.remove();
   _loc1_.cool2.remove();
   delete register1.cool;
   delete register1.cool2;
   removeMovieClip(_loc1_);
};
myListener.OnGame_SkillHotKey_Clear = function(type)
{
   type = Number(type);
   var _loc5_ = undefined;
   if(type == 0)
   {
      imsi_arrray = skill_array.concat();
      var _loc1_ = 0;
      while(_loc1_ < imsi_arrray.length)
      {
         myListener.OnGame_SkillHotKey_Remove(imsi_arrray[_loc1_].id);
         _loc1_ = _loc1_ + 1;
      }
   }
   else if(type == 1)
   {
      imsi_arrray = skill_array.concat();
      _loc1_ = 0;
      while(_loc1_ < imsi_arrray.length)
      {
         myListener.OnGame_SkillHotKey_Remove(imsi_arrray[_loc1_].id);
         _loc1_ = _loc1_ + 1;
      }
   }
   else
   {
      var _loc2_ = skill_array.concat();
      var _loc3_ = skill_array.concat();
      _loc1_ = 0;
      while(_loc1_ < _loc2_.length)
      {
         myListener.OnGame_SkillHotKey_Remove(_loc2_[_loc1_].id);
         _loc1_ = _loc1_ + 1;
      }
      _loc1_ = 0;
      while(_loc1_ < _loc3_.length)
      {
         myListener.OnGame_SkillHotKey_Remove(_loc3_[_loc1_].id);
         _loc1_ = _loc1_ + 1;
      }
   }
};
myListener.OnGame_SkillHotKey_ConsoleAdd = function(_data)
{
   var _loc2_ = _data.split("\t");
   var _loc3_ = undefined;
   if(_loc2_.length > 1)
   {
      var _loc1_ = 0;
      while(_loc1_ < _loc2_.length)
      {
         _loc3_ = lib.info.KeyMap.toKeyCode(_loc2_[_loc1_],1);
         SkillIcon_ConsoleLoad(_loc3_);
         _loc1_ = _loc1_ + 1;
      }
   }
   else
   {
      _loc3_ = lib.info.KeyMap.toKeyCode(_data,1);
      SkillIcon_ConsoleLoad(_loc3_);
   }
};
