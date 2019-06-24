var UI = this;
var UIname = "ScenarioAlim";
UI._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var bWidgetOpen = true;
container_mc.UIDrager.setData(UIname,UI,container_mc.lock_mc);
var mainArr = [];
var subArr = [];
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == "scenarioalim")
   {
      bWidgetOpen = bShow;
      UI._visible = bWidgetOpen;
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
};
myListener.OnGame_ScaleUI = function()
{
   var _loc2_ = _root.GetLoadedUI("QuestTaskInfo");
   lib.Debuger.trace("여기" + _loc2_._xscale);
   UI._xscale = _loc2_._xscale;
   UI._yscale = _loc2_._yscale;
};
myListener.OnGame_ScenarioAlim_SetTitle = function(txt, lv)
{
   container_mc.titleMc.gotoAndPlay(1);
   container_mc.titleMc._alpha = 100;
   container_mc.titleMc.txtMc.txt.htmlText = txt;
};
myListener.OnGame_ScenarioAlim_SetClose = function()
{
   gs.TweenLite.to(container_mc.titleMc,0.5,{_delay:1,_alpha:0,ease:easing.Strong.easeOut});
};
myListener.OnGame_ScenarioAlim_UpdateMainMission = function(infoData, itemData)
{
   var _loc3_ = lib.util.ExtString.split(infoData,"\t");
   var _loc5_ = _loc3_[0];
   var _loc2_ = container_mc.boxMc["mainMc" + _loc5_];
   if(!_loc2_)
   {
      _loc2_ = container_mc.boxMc.attachMovie("mainMc","mainMc" + _loc5_,container_mc.boxMc.getNextHighestDepth());
      _loc2_.addMc._visible = false;
      _loc2_.numMc._visible = false;
      _loc2_.id = _loc5_;
      mainArr.push(_loc2_);
      SetButton2(_loc2_.toggle_mc);
      _loc2_.updateEffect_mc._alpha = 0;
      EffectStart(_loc2_,0);
   }
   if(_loc3_[1] == "0")
   {
      if(!_loc3_[5])
      {
         _loc2_.icon_txt.htmlText = "<img src=\'qicon_2\' width=\'32\' height=\'32\' vspace=\'0\'>";
         _loc2_.numMc._visible = false;
         _loc2_.numMc.txt.text = "";
         _loc2_.bMarker = 1;
      }
      else
      {
         _loc2_.icon_txt.htmlText = "";
         _loc2_.numMc._visible = true;
         _loc2_.numMc.txt.text = _loc3_[5];
         _loc2_.bMarker = 0;
      }
   }
   else
   {
      _loc2_.numMc.txt.text = "";
      _loc2_.numMc._visible = false;
      _loc2_.icon_txt.htmlText = "<img src=\'qicon_3\' width=\'32\' height=\'32\' vspace=\'0\'>";
      _loc2_.bMarker = 1;
   }
   _loc2_.main_txt.autoSize = true;
   _loc2_.name_txt.htmlText = _loc3_[2];
   _loc2_.markerHit.onRelease = function()
   {
      var _loc2_ = this._parent.id;
      var _loc3_ = this._parent.bMarker;
      ToGame_ScenarioAlim_RequestSparkleImage(_loc2_,_loc3_);
   };
   var _loc8_ = _loc2_.main_txt.text;
   var _loc10_ = _loc2_.info_txt.text;
   if(_loc8_ != _loc3_[3])
   {
      EffectStart(_loc2_,1);
   }
   _loc2_.main_txt.htmlText = _loc3_[3];
   _loc2_.info_txt.htmlText = _loc3_[4];
   var _loc4_ = 48 + _loc2_.main_txt._height;
   _loc2_.info_txt._y = _loc4_;
   _loc4_ = _loc4_ + 30;
   var _loc6_ = lib.util.ExtString.split(itemData,"\n");
   if(_loc6_.length > 0)
   {
      _loc2_.itemMc._y = _loc4_;
      SetItem(_loc2_.itemMc,_loc6_);
      _loc4_ = _loc4_ + 40;
   }
   _loc2_.bg_mc._height = _loc2_.newBg_mc._height = _loc2_.updateEffect_mc._height = _loc4_ - 5;
   _loc2_.h = _loc2_.saveH = _loc2_.hit_mc._height = _loc4_ - 5;
   SetPosition(true);
};
myListener.OnGame_ScenarioAlim_CompleteMainMission = function(id)
{
   ClearArr(id,mainArr);
   SetPosition(true);
};
myListener.OnGame_ScenarioAlim_UpdateSubMission = function(infoData)
{
   var _loc2_ = lib.util.ExtString.split(infoData,"\t");
   var _loc3_ = _loc2_[0];
   var _loc4_ = container_mc.addMc;
   var _loc1_ = _loc4_["subMc" + _loc3_];
   if(!_loc1_)
   {
      _loc1_ = _loc4_.attachMovie("subMc","subMc" + _loc3_,_loc4_.getNextHighestDepth());
      _loc1_.id = _loc3_;
      _loc1_.updateEffect_mc._alpha = 0;
      subArr.push(_loc1_);
   }
   if(_loc2_[4] == "0")
   {
   }
   _loc1_.info_txt.htmlText = _loc2_[2];
   TextEffect(_loc1_.updateEffect_mc);
   lib.manager.ToolTip.add(_loc1_.info_txt,_loc2_[3],1);
   _loc1_.h = _loc1_.hit_mc._height = _loc1_.updateEffect_mc._height = 20 + _loc1_.info_txt.textHeight;
   SetSubPosition();
};
myListener.OnGame_ScenarioAlim_CompleteSubMission = function(subID)
{
   ClearArr(subID,subArr);
   SetSubPosition();
};
var bHideQuest = false;
container_mc.addMc._alpha = 0;
var ADD_TOOLTIP = lib.util.UIString.getUIString("$093019");
lib.manager.ToolTip.add(container_mc.addMc.hit_mc,ADD_TOOLTIP,1);
function ToGame_ScenarioAlim_RequestSparkleImage(id, bMarker)
{
   var _loc1_ = id + "\t" + bMarker;
   getURL("FSCommand:ToGame_ScenarioAlim_RequestSparkleImage",_loc1_);
}
function EffectStart(mc, type)
{
   if(type == 0)
   {
      mc.newBg_mc._alpha = 0;
      mc.newBg_mc._width = 608;
      mc.newBg_mc._x = -150;
      gs.TweenLite.killTweensOf(mc.newBg_mc,false);
      gs.TweenLite.to(mc.newBg_mc,0.2,{_alpha:100,_x:-5,_width:308,ease:easing.Strong.easeOut,onComplete:EffectEnd,onCompleteParams:[mc.newBg_mc]});
   }
   mc.updateEffect_mc._alpha = 0;
   gs.TweenLite.killTweensOf(mc.updateEffect_mc,false);
   gs.TweenLite.to(mc.updateEffect_mc,0.3,{_alpha:100,ease:easing.Strong.easeOut,onComplete:EffectEnd,onCompleteParams:[mc.updateEffect_mc]});
}
function EffectEnd(mc)
{
   gs.TweenLite.killTweensOf(mc,false);
   gs.TweenLite.to(mc,0.3,{_alpha:0,ease:easing.Strong.easeOut});
}
function TextEffect(mc)
{
   gs.TweenLite.killTweensOf(mc,false);
   gs.TweenLite.to(mc,0.2,{_alpha:100,ease:easing.Strong.easeOut,onComplete:TextEffectEnd,onCompleteParams:[mc]});
}
function TextEffectEnd(mc)
{
   gs.TweenLite.killTweensOf(mc,false);
   gs.TweenLite.to(mc,0.3,{_alpha:0,ease:easing.Strong.easeOut});
}
function ClearArr(ID, arr)
{
   var _loc4_ = arr.length;
   var _loc1_ = 0;
   var _loc2_ = undefined;
   _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      _loc2_ = arr[_loc1_];
      if(_loc2_.id == ID)
      {
         _loc2_.removeMovieClip();
         arr.splice(_loc1_,1);
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function SetPosition(type)
{
   if(type)
   {
      var _loc4_ = mainArr.length;
      var _loc1_ = 0;
      var _loc3_ = 0;
      _loc1_ = 0;
      while(_loc1_ < _loc4_)
      {
         var _loc2_ = mainArr[_loc1_];
         _loc2_._y = _loc3_;
         _loc3_ = _loc3_ + (_loc2_.h + 10);
         _loc1_ = _loc1_ + 1;
      }
   }
   if(subArr.length == 0)
   {
      if(container_mc.addMc._alpha != 0)
      {
         gs.TweenLite.killTweensOf(container_mc.addMc,false);
         gs.TweenLite.to(container_mc.addMc,1,{_alpha:0,ease:easing.Strong.easeOut});
      }
   }
   else if(container_mc.addMc._alpha != 100)
   {
      gs.TweenLite.killTweensOf(container_mc.addMc,false);
      gs.TweenLite.to(container_mc.addMc,1,{_alpha:100,ease:easing.Strong.easeOut});
      container_mc.addMc.gotoAndPlay(2);
   }
   container_mc.addMc._y = _loc3_ + 50;
}
function SetSubPosition(mainMc)
{
   var _loc4_ = subArr.length;
   var _loc1_ = 0;
   var _loc3_ = 30;
   if(_loc4_ == 0)
   {
      if(container_mc.addMc._alpha != 0)
      {
         gs.TweenLite.killTweensOf(container_mc.addMc,false);
         gs.TweenLite.to(container_mc.addMc,1,{_alpha:0,ease:easing.Strong.easeOut});
         return undefined;
      }
   }
   else if(container_mc.addMc._alpha != 100)
   {
      gs.TweenLite.killTweensOf(container_mc.addMc,false);
      gs.TweenLite.to(container_mc.addMc,1,{_alpha:100,ease:easing.Strong.easeOut});
      container_mc.addMc.gotoAndPlay(2);
   }
   _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = subArr[_loc1_];
      _loc2_._y = _loc3_;
      _loc3_ = _loc3_ + _loc2_.h;
      _loc1_ = _loc1_ + 1;
   }
   SetPosition(false);
}
function SetButton(btnMc)
{
   btnMc.onRelease = function()
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      if(bHideQuest)
      {
         showQuests();
      }
      else
      {
         hideQuests();
      }
   };
}
function showQuests()
{
   var _loc1_ = lib.util.UIString.getUIString("$093007");
   bHideQuest = false;
   container_mc.titleMc._visible = true;
   container_mc.boxMc._visible = true;
   container_mc.addMc._visible = true;
   container_mc.mainLabel.folderUp._visible = true;
   container_mc.mainLabel.folderDown._visible = false;
   SetButton(container_mc.mainLabel.folderUp);
   lib.manager.ToolTip.add(container_mc.mainLabel.folderUp,_loc1_,1);
}
function hideQuests()
{
   var _loc1_ = lib.util.UIString.getUIString("$093008");
   bHideQuest = true;
   container_mc.titleMc._visible = false;
   container_mc.boxMc._visible = false;
   container_mc.addMc._visible = false;
   container_mc.mainLabel.folderUp._visible = false;
   container_mc.mainLabel.folderDown._visible = true;
   SetButton(container_mc.mainLabel.folderDown);
   lib.manager.ToolTip.add(container_mc.mainLabel.folderDown,_loc1_,1);
}
function SetButton2(btnMc)
{
   btnMc.onRelease = function()
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      if(this._currentframe == 2)
      {
         showMission(this);
      }
      else
      {
         hideMission(this);
      }
   };
}
function showMission(btnMc)
{
   var _loc3_ = lib.util.UIString.getUIString("$093007");
   var _loc1_ = btnMc._parent;
   _loc1_.bg_mc._height = _loc1_.hit_mc._height = _loc1_.h = _loc1_.saveH;
   btnMc.gotoAndStop(1);
   _loc1_.main_txt._visible = true;
   _loc1_.info_txt._visible = true;
   _loc1_.itemMc._visible = true;
   lib.manager.ToolTip.add(btnMc,_loc3_,1);
   SetPosition(true);
}
function hideMission(btnMc)
{
   var _loc3_ = lib.util.UIString.getUIString("$093008");
   var _loc1_ = btnMc._parent;
   _loc1_.bg_mc._height = _loc1_.hit_mc._height = _loc1_.h = 40;
   btnMc.gotoAndStop(2);
   _loc1_.main_txt._visible = false;
   _loc1_.info_txt._visible = false;
   _loc1_.itemMc._visible = false;
   lib.manager.ToolTip.add(btnMc,_loc3_,1);
   SetPosition(true);
}
function drawSlot(_tgMc, _index, _img, _num, _size)
{
   var _loc2_ = _size / 64;
   lib.display.DrawBitmapData.draw(_tgMc,_img,0,0,0,0,_size,_size,_loc2_);
   lib.manager.ToolTip.add(_tgMc,_index,6);
   if(_num > 1)
   {
      _tgMc.numTxt.text = _num;
   }
   else
   {
      _tgMc.numTxt.text = "";
   }
}
function SetItem(mc, iData)
{
   var _loc5_ = iData.length;
   var _loc1_ = 0;
   _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc2_ = lib.util.ExtString.split(iData[_loc1_],"\t");
      var _loc3_ = mc.attachMovie("slotDraw","slot" + _loc1_,mc.getNextHighestDepth());
      _loc3_._x = _loc1_ * 32;
      drawSlot(_loc3_,_loc2_[0],_loc2_[1],_loc2_[2],30);
      _loc1_ = _loc1_ + 1;
   }
}
if(container_mc.mainLabel.folderUp._visible)
{
   SetButton(container_mc.mainLabel.folderUp);
}
else
{
   SetButton(container_mc.mainLabel.folderDown);
}
lib.manager.ToolTip.add(container_mc.mainLabel.folderUp,lib.util.UIString.getUIString("$093007"),1);
fscommand("ToGame_ScenarioAlim_Init");
