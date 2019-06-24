function bgLockHandler(value)
{
   container_mc.UIDrager._visible = !Number(value);
   container_mc.bg._visible = !Number(value);
   bBgLock = Number(value);
}
function bgAlphaHandler(value)
{
   container_mc._alpha = value;
}
function valueChangeHandler(event)
{
   if(event.key == lib.gamedata.CustomizedUIDataKey.OVERLAYMAP_STATIC_BOOLEAN)
   {
      bgLockHandler(event.value);
   }
   else if(event.key == lib.gamedata.CustomizedUIDataKey.OVERLAYMAP_ALPHA_PERCENT)
   {
      bgAlphaHandler(event.value);
   }
}
function initMapScale()
{
   if(_root.__overlayMapScale)
   {
      if(_root.__overlayMapScale > 10)
      {
         _root.__overlayMapScale = 1;
      }
      curScaleStep = _root.__overlayMapScale;
      changeMapScale();
   }
   if(_root.__overlayMapX)
   {
      container_mc.mapContainer_mc._x = _root.__overlayMapX;
   }
   if(_root.__overlayMapY)
   {
      container_mc.mapContainer_mc._y = _root.__overlayMapY;
   }
}
function changeMapScale()
{
   var _loc9_ = curScaleStep / oneStep;
   container_mc.scaleBtn._y = 501 - scaleBarH / maxStep * _loc9_;
   container_mc.scaleBar._y = container_mc.scaleBtn._y;
   container_mc.scaleBar._height = 501 - container_mc.scaleBtn._y;
   plusBtn.setEnabled(curScaleStep < maxScale);
   minusBtn.setEnabled(curScaleStep > 0);
   var _loc2_ = 1 + curScaleStep / 10;
   container_mc.mapContainer_mc.bgImg_mc._xscale = container_mc.mapContainer_mc.bgImg_mc._yscale = _loc2_ * 100;
   container_mc.mapContainer_mc.hit._xscale = container_mc.mapContainer_mc.hit._yscale = _loc2_ * 100;
   var _loc4_ = 0;
   while(_loc4_ < marker_array.length)
   {
      var _loc5_ = marker_array[_loc4_];
      var _loc7_ = _loc5_.posX;
      var _loc6_ = _loc5_.posY;
      _loc5_._x = _loc7_ * _loc2_;
      _loc5_._y = _loc6_ * _loc2_;
      _loc4_ = _loc4_ + 1;
   }
   var _loc8_ = changedScaleMarker.length;
   _loc4_ = 0;
   while(_loc4_ < _loc8_)
   {
      _loc5_ = changedScaleMarker[_loc4_];
      _loc5_._xscale = 100 * _loc2_;
      _loc5_._yscale = 100 * _loc2_;
      _loc4_ = _loc4_ + 1;
   }
   _loc4_ = 0;
   while(_loc4_ < text_array.length)
   {
      var _loc3_ = text_array[_loc4_];
      _loc7_ = _loc3_.posX;
      _loc6_ = _loc3_.posY;
      _loc3_._x = _loc7_ * _loc2_;
      _loc3_._y = _loc6_ * _loc2_;
      _loc4_ = _loc4_ + 1;
   }
   _root.__overlayMapScale = curScaleStep;
}
function setMouseDown()
{
   myListener.OnGame_MouseDown = function(button, targetMc, target)
   {
      if(scaleLock)
      {
         return undefined;
      }
      if(!_global.gbUIMode)
      {
         return undefined;
      }
      if(target == undefined || target == "")
      {
         if(!bBgLock)
         {
            if(button == 1 && container_mc._xmouse > container_mc.bg._x && container_mc._xmouse <= container_mc.bg._x + container_mc._width && container_mc._ymouse >= container_mc.bg._y && container_mc._ymouse <= container_mc.bg._y + container_mc._height)
            {
               bDragging = true;
            }
         }
      }
      if(_global.control)
      {
         var _loc7_ = Mouse.getTopMostEntity()._target.split("/");
         if(target == undefined || target == "" || _loc7_[1] == "container_overlayMap_mc")
         {
            if(container_mc._visible && container_mc._xmouse >= 0 && container_mc._xmouse < 768 && container_mc._ymouse >= 0 && container_mc._ymouse < 768)
            {
               var _loc4_ = container_mc.mapContainer_mc.bgImg_mc._xscale / 100;
               var _loc6_ = container_mc.mapContainer_mc._xmouse / _loc4_;
               var _loc5_ = container_mc.mapContainer_mc._ymouse / _loc4_;
               var _loc8_ = _loc6_ + "@" + _loc5_;
               _root.ToGame_CTRLMouseDown("OverlayMap2",_loc8_);
            }
         }
      }
   };
}
function setMouseUp()
{
   myListener.OnGame_MouseUp = function(button, target)
   {
      if(scaleLock)
      {
         return undefined;
      }
      if(bBgLock)
      {
         return undefined;
      }
      if(bDragging)
      {
         bDragging = false;
      }
      _root.__overlayMapX = container_mc.mapContainer_mc._x;
      _root.__overlayMapY = container_mc.mapContainer_mc._y;
   };
}
function onTick()
{
   var _loc1_ = container_mc.bg;
   if(flag == "next")
   {
      _loc1_.nextFrame();
      if(_loc1_._currentframe == _loc1_._totalframes)
      {
         clearInterval(intervalId);
         intervalId = null;
         flag = "";
      }
   }
   else if(flag == "prev")
   {
      _loc1_.prevFrame();
      if(_loc1_._currentframe == 1)
      {
         clearInterval(intervalId);
         intervalId = null;
         flag = "";
         _loc1_._visible = false;
      }
   }
}
function setTween(type)
{
   if(tweenType == type)
   {
      return undefined;
   }
   tweenType = type;
   gs.TweenLite.killTweensOf(container_mc.bg,false);
   gs.TweenLite.killTweensOf(container_mc.titleMc,false);
   gs.TweenLite.killTweensOf(container_mc.trackingBtn,false);
   gs.TweenLite.killTweensOf(container_mc.plusBtn,false);
   gs.TweenLite.killTweensOf(container_mc.scaleBtn,false);
   gs.TweenLite.killTweensOf(container_mc.scaleBar,false);
   gs.TweenLite.killTweensOf(container_mc.scaleBarBg,false);
   gs.TweenLite.killTweensOf(container_mc.minusBtn,false);
   if(tweenType == "show")
   {
      if(bBgLock == false)
      {
         gs.TweenLite.to(container_mc.bg,0.3,{_alpha:100,ease:gs.easing.Strong.easeOut});
         gs.TweenLite.to(container_mc.trackingBtn,0.3,{_alpha:100,ease:gs.easing.Strong.easeOut});
      }
      gs.TweenLite.to(container_mc.plusBtn,0.3,{_alpha:100,ease:gs.easing.Strong.easeOut});
      gs.TweenLite.to(container_mc.scaleBtn,0.3,{_alpha:100,ease:gs.easing.Strong.easeOut});
      gs.TweenLite.to(container_mc.scaleBar,0.3,{_alpha:100,ease:gs.easing.Strong.easeOut});
      gs.TweenLite.to(container_mc.scaleBarBg,0.3,{_alpha:100,ease:gs.easing.Strong.easeOut});
      gs.TweenLite.to(container_mc.minusBtn,0.3,{_alpha:100,ease:gs.easing.Strong.easeOut});
      gs.TweenLite.to(container_mc.titleMc,0.3,{_alpha:100,ease:gs.easing.Strong.easeOut,onComplete:finishTween});
   }
   else if(tweenType == "hide")
   {
      gs.TweenLite.to(container_mc.bg,0.3,{_alpha:0,ease:gs.easing.Strong.easeOut});
      gs.TweenLite.to(container_mc.trackingBtn,0.3,{_alpha:0,ease:gs.easing.Strong.easeOut});
      gs.TweenLite.to(container_mc.plusBtn,0.3,{_alpha:0,ease:gs.easing.Strong.easeOut});
      gs.TweenLite.to(container_mc.scaleBtn,0.3,{_alpha:0,ease:gs.easing.Strong.easeOut});
      gs.TweenLite.to(container_mc.scaleBar,0.3,{_alpha:0,ease:gs.easing.Strong.easeOut});
      gs.TweenLite.to(container_mc.scaleBarBg,0.3,{_alpha:0,ease:gs.easing.Strong.easeOut});
      gs.TweenLite.to(container_mc.minusBtn,0.3,{_alpha:0,ease:gs.easing.Strong.easeOut});
      gs.TweenLite.to(container_mc.titleMc,0.3,{_alpha:0,ease:gs.easing.Strong.easeOut,onComplete:finishTween});
   }
}
function finishTween()
{
   if(tweenType == "hide")
   {
      container_mc.bg._visible = false;
      container_mc.titleMc._visible = false;
      container_mc.trackingBtn._visible = false;
      container_mc.plusBtn._visible = false;
      container_mc.scaleBtn._visible = false;
      container_mc.scaleBar._visible = false;
      container_mc.scaleBarBg._visible = false;
      container_mc.minusBtn._visible = false;
   }
   tweenType = "notTween";
}
function setMouseMove()
{
   myListener.OnGame_MouseMove = function(target)
   {
      if(bBgLock)
      {
         return undefined;
      }
      var _loc3_ = target._target;
      var _loc2_ = _loc3_.split("/");
      if(target == undefined || target == "" || _loc2_[1] == "container_overlayMap_mc")
      {
         if(container_mc._xmouse > container_mc.bg._x && container_mc._xmouse <= container_mc.bg._x + container_mc._width && container_mc._ymouse >= container_mc.bg._y && container_mc._ymouse <= container_mc.bg._y + container_mc._height)
         {
            if(bBgLock == false)
            {
               container_mc.bg._visible = true;
            }
            container_mc.titleMc._visible = true;
            container_mc.trackingBtn._visible = true;
            container_mc.plusBtn._visible = true;
            container_mc.minusBtn._visible = true;
            container_mc.scaleBar._visible = true;
            container_mc.scaleBarBg._visible = true;
            container_mc.scaleBtn._visible = true;
            if(container_mc.trackingBtn._alpha != 100)
            {
               setTween("show");
            }
         }
         else if(container_mc.trackingBtn._alpha != 0 && !bDragging)
         {
            setTween("hide");
         }
      }
      else if(container_mc.trackingBtn._alpha != 0 && !bDragging)
      {
         setTween("hide");
      }
   };
}
function setMouseEvent()
{
   setMouseDown();
   setMouseUp();
   setMouseMove();
}
function deleteMouseEvent()
{
   delete myListener.OnGame_MouseDown;
   delete myListener.OnGame_MouseUp;
   delete myListener.OnGame_MouseMove;
}
function showFrame(bTrue)
{
   if(bTrue)
   {
      container_mc.frame_mc.onEnterFrame = function()
      {
         this._alpha = this._alpha + 20;
         if(this._alpha >= 100)
         {
            this._alpha = 100;
            delete this.onEnterFrame;
         }
      };
   }
   else
   {
      container_mc.frame_mc.onEnterFrame = function()
      {
         this._alpha = this._alpha - 20;
         if(this._alpha <= 0)
         {
            this._alpha = 0;
            delete this.onEnterFrame;
         }
      };
   }
}
function clearContainer(target)
{
   var _loc3_ = target._name;
   var _loc4_ = target.getDepth();
   var _loc1_ = target._parent.createEmptyMovieClip(_loc3_,_loc4_);
   if(target == container_mc.mapContainer_mc.marker_mc)
   {
      _loc1_.createEmptyMovieClip("strong",_loc1_.getNextHighestDepth());
      _loc1_.createEmptyMovieClip("normal",_loc1_.getNextHighestDepth());
      _loc1_.createEmptyMovieClip("num",_loc1_.getNextHighestDepth());
      _loc1_.createEmptyMovieClip("quest",_loc1_.getNextHighestDepth());
      _loc1_.createEmptyMovieClip("my",_loc1_.getNextHighestDepth());
      _loc1_.createEmptyMovieClip("point",_loc1_.getNextHighestDepth());
      _loc1_.createEmptyMovieClip("citywarHit",_loc1_.getNextHighestDepth());
      _loc1_.createEmptyMovieClip("resurrection",_loc1_.getNextHighestDepth());
      _loc1_.createEmptyMovieClip("alimMc",_loc1_.getNextHighestDepth());
   }
   _loc1_._x = markerContainerXY.x;
   _loc1_._y = markerContainerXY.y;
}
function setMargin(left, top)
{
   container_mc.mapContainer_mc._x = markerContainerXY.x + left;
   container_mc.mapContainer_mc._y = markerContainerXY.y + top;
}
function ToGame_OverlayMap_ChangeLocationTracking(bChecked)
{
   getURL("FSCommand:ToGame_OverlayMap_ChangeLocationTracking",bChecked);
}
function getCityWarTowerHP(tooltipStr)
{
   var _loc1_ = tooltipStr.split(":");
   var _loc6_ = _loc1_[0] + ":" + _loc1_[1];
   var _loc5_ = _loc1_[2];
   var _loc4_ = _loc1_[3];
   var _loc7_ = _loc1_[4];
   var _loc3_ = _loc1_[5];
   var _loc2_ = _loc1_[6];
   return Number(_loc2_);
}
function clearSparkle(targetId, bRemoveAtArray)
{
   var _loc1_ = 0;
   while(_loc1_ < sparkleArray.length)
   {
      var _loc2_ = sparkleArray[_loc1_];
      if(_loc2_.id == targetId)
      {
         var _loc3_ = _loc2_.targetMc;
         _loc3_.sparkle = undefined;
         _loc3_.sparkleType = undefined;
         if(bRemoveAtArray)
         {
            sparkleArray.splice(_loc1_,1);
         }
         _loc2_.removeMovieClip();
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function finishEffectIn()
{
   gs.TweenMax.to(container_mc.mapContainer_mc.bgImg_mc,0.9,{_alpha:mapAlpha,ease:gs.easing.Strong.easeOut,onComplete:finishEffectOut});
}
function finishEffectOut()
{
   effectCount++;
   if(effectCount > 1)
   {
      return undefined;
   }
   gs.TweenMax.to(container_mc.mapContainer_mc.bgImg_mc,0.9,{_alpha:90,ease:gs.easing.Strong.easeOut,onComplete:finishEffectIn});
}
function addNumber(questId, id, leftMargin, topMargin, res, posX, posY, number, tooltipStr)
{
   var _loc8_ = container_mc.mapContainer_mc.marker_mc.num;
   var _loc2_ = _loc8_.createEmptyMovieClip(id,_loc8_.getNextHighestDepth());
   var _loc4_ = _loc2_.attachMovie("number","number",_loc2_.getNextHighestDepth());
   _loc4_.hitTestDisable = true;
   _loc4_._x = _loc4_._x + leftMargin;
   _loc4_._y = _loc4_._y + topMargin;
   if(questId != undefined && questId != "" && questId != null && questId != "undefined" && questId != "0" && questId != "-1")
   {
      _loc4_.textFd.textColor = "0xFFFFFF";
   }
   _loc4_.textFd.text = number;
   _loc4_.textFd._x = -1 * leftMargin - 16;
   _loc4_.textFd._y = -1 * topMargin - 11;
   _loc4_.textFd.textAutoSize = "shrink";
   lib.util.DrawBitmap.draw(_loc4_.bg,res);
   var _loc5_ = 50;
   var _loc3_ = _loc2_.createEmptyMovieClip("hitMC",_loc2_.getNextHighestDepth());
   _loc3_._x = (- _loc5_) / 2;
   _loc3_._y = (- _loc5_) / 2;
   _loc3_.beginFill(65280,0);
   _loc3_.moveTo(0,0);
   _loc3_.lineTo(_loc5_,0);
   _loc3_.lineTo(_loc5_,_loc5_);
   _loc3_.lineTo(0,_loc5_);
   _loc3_.lineTo(0,0);
   _loc3_.endFill();
   _loc3_.onRelease = null;
   var _loc7_ = 1 + curScaleStep / 10;
   _loc2_._x = posX * _loc7_;
   _loc2_._y = posY * _loc7_;
   _loc2_.posX = posX;
   _loc2_.posY = posY;
   _loc2_.id = id;
   _loc2_.questId = questId;
   lib.manager.ToolTip.add(_loc2_,tooltipStr,1);
   _loc2_.onRollOver = function()
   {
      markerOver(this);
   };
   marker_array.push(_loc2_);
}
function updateNumber(questId, id, number, x, y, tooltipStr)
{
   var _loc1_ = searchMarker(id);
   var _loc3_ = _loc1_.number;
   _loc3_.textFd.text = number;
   var _loc2_ = 1 + scale / 10;
   _loc1_._x = x * _loc2_;
   _loc1_._y = y * _loc2_;
   _loc1_.posX = x;
   _loc1_.posY = y;
}
function markerOver(target)
{
   target.swapDepths(target._parent.getNextHighestDepth());
}
function searchMarker(identifier, bRemove)
{
   var _loc4_ = null;
   var _loc2_ = null;
   var _loc1_ = 0;
   while(_loc1_ < marker_array.length)
   {
      if(marker_array[_loc1_].id == identifier)
      {
         _loc2_ = marker_array[_loc1_];
         _loc4_ = _loc1_;
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   if(bRemove)
   {
      var _loc6_ = _loc2_.markerHit;
      if(_loc6_ != undefined)
      {
         lib.manager.ToolTip.remove(_loc6_);
      }
      else
      {
         lib.manager.ToolTip.remove(_loc2_);
      }
      var _loc7_ = _loc2_.sparkle;
      if(_loc7_ != undefined)
      {
         clearSparkle(identifier,true);
      }
      if(_loc4_ != null)
      {
         marker_array.splice(_loc4_,1);
      }
      if(_loc2_.bChangedScale)
      {
         var _loc5_ = changedScaleMarker.length;
         _loc1_ = 0;
         while(_loc1_ < _loc5_)
         {
            if(changedScaleMarker[_loc1_].id == identifier)
            {
               changedScaleMarker.splice(_loc1_,1);
               break;
            }
            _loc1_ = _loc1_ + 1;
         }
      }
      _loc2_.removeMovieClip();
   }
   else if(_loc2_ != null)
   {
      return _loc2_;
   }
   return null;
}
function searchText(identifier)
{
   var _loc3_ = new Array();
   for(m in container_mc.mapContainer_mc.text_mc)
   {
      var _loc1_ = container_mc.mapContainer_mc.text_mc[m];
      if(typeof _loc1_ == "movieclip")
      {
         if(_loc1_.id == identifier)
         {
            return _loc1_;
         }
      }
   }
   return null;
}
function ToGame_OverlayMap_CloseUI()
{
   _root.__overlayMapScale = scale;
   fscommand("ToGame_OverlayMap_CloseUI");
}
function dontUse()
{
   if(useStat)
   {
      container_mc.UIDrager._visible = false;
      container_mc.frame_mc._visible = false;
      container_mc.UIDrager.hitTestDisable = true;
      container_mc.frame_mc.hitTestDisable = true;
      container_mc.mapContainer_mc.hitTestDisable = true;
      hit._visible = false;
      container_mc.dontUse_mc.toolip = lib.info.ToolTipStr.OVERLAY_DRAG_DISABLE;
      lib.manager.ToolTip.add(container_mc.dontUse_mc,lib.info.ToolTipStr.OVERLAY_DRAG_DISABLE,1);
      container_mc.dontUse_mc.gotoAndStop(2);
   }
   else
   {
      container_mc.UIDrager._visible = true;
      container_mc.frame_mc._visible = true;
      container_mc.UIDrager.hitTestDisable = false;
      container_mc.frame_mc.hitTestDisable = false;
      container_mc.mapContainer_mc.hitTestDisable = false;
      hit._visible = true;
      container_mc.dontUse_mc.toolip = lib.info.ToolTipStr.OVERLAY_DRAG_ENABLE;
      lib.manager.ToolTip.add(container_mc.dontUse_mc,lib.info.ToolTipStr.OVERLAY_DRAG_ENABLE,1);
      container_mc.dontUse_mc.gotoAndStop(1);
   }
   lib.manager.ToolTip.add(container_mc.dontUse_mc,container_mc.dontUse_mc.toolip,1);
}
function EffectAnimation(_index, res, marker)
{
   var _loc3_ = prevStrong[_index];
   if(_loc3_ == "")
   {
      prevStrong[_index] = res;
   }
   else if(_loc3_ != res)
   {
      prevStrong[_index] = res;
      var _effect;
      if(res == STRONG_STR_0)
      {
         _effect = marker.attachMovie("strong_blue","effect",marker._parent.getNextHighestDepth());
      }
      else if(res == STRONG_STR_1)
      {
         _effect = marker.attachMovie("strong_nor","effect",marker._parent.getNextHighestDepth());
      }
      else if(res == STRONG_STR_2)
      {
         _effect = marker.attachMovie("strong_red","effect",marker._parent.getNextHighestDepth());
      }
      lib.util.FrameSeeker.seek(_effect,1,_effect._totalframes,function()
      {
         _effect.removeMovieClip();
      }
      );
      lib.manager.UISound.play("1202");
   }
}
var UI = this;
UI._visible = false;
var UIname = "OverlayMap2";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.bg.hitTestDisable = true;
container_mc.mapContainer_mc.bgImg_mc.hitTestDisable = true;
container_mc.frame_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
bWidgetOpen = true;
container_mc.noClicker.useHandCursor = false;
container_mc.frame_mc._visible = false;
container_mc.frame_mc._alpha = 0;
container_mc.bg._visible = false;
preload_marker._visible = false;
preload_mapButton1._visible = false;
preload_mapButton2._visible = false;
preload_overlay1._visible = false;
preload_overlay2._visible = false;
preload_overlay3._visible = false;
var mapScale = 0.75;
var bWidgetOpen = false;
var bBgLock = false;
var axis = new lib.util.AxisResetter();
container_mc.mapContainer_mc.hit.WHEELNAME = "MAPSCALE";
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.OVERLAYMAP_STATIC_BOOLEAN,this,"bgLockHandler");
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.OVERLAYMAP_ALPHA_PERCENT,this,"bgAlphaHandler");
customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
var curScaleStep = 0;
var maxScale = 10;
var maxStep = 5;
var oneStep = 2;
var scaleBarH = 221;
initMapScale();
var plusBtn = new lib.util.TxtBtn(container_mc.plusBtn);
container_mc.plusBtn.onRelease2 = function()
{
   curScaleStep = curScaleStep + oneStep;
   changeMapScale();
};
var minusBtn = new lib.util.TxtBtn(container_mc.minusBtn);
container_mc.minusBtn.onRelease2 = function()
{
   curScaleStep = curScaleStep - oneStep;
   changeMapScale();
};
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      var _loc2_ = new lib.controls.CustomScaleEvent();
      _loc2_.CustomScaleEventCheck(UI,UIname);
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         _root.__overlayMapScale = curScaleStep;
         UI._visible = false;
      }
   }
   myListener.OnGameEventChangeUIMode(bShow);
};
var scaleLock = false;
var prevScale = 0;
lib.Debuger.trace("_root.__overlayMapScale : " + _root.__overlayMapScale);
myListener.OnGame_OverlayMap_FocusView = function(bMode, posX, posY, scaleSize)
{
   container_mc.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      scaleLock = Boolean(Number(bMode));
      var _loc12_ = !scaleLock;
      if(_loc12_)
      {
         this.trackingBtn._x = 718;
         this.plusBtn._x = 716;
         this.scaleBtn._x = 730;
         this.scaleBar._x = 727;
         this.scaleBarBg._x = 723;
         this.minusBtn._x = 716;
         if(_root.__overlayMapScale)
         {
            prevScale = _root.__overlayMapScale;
         }
         curScaleStep = prevScale;
         changeMapScale();
         if(_root.__overlayMapScale && _root.__overlayMapX && _root.__overlayMapY)
         {
            container_mc.mapContainer_mc._x = _root.__overlayMapX;
            container_mc.mapContainer_mc._y = _root.__overlayMapY;
         }
         removeMovieClip(container_mc.DarkMc);
      }
      else
      {
         this.trackingBtn._x = 4718;
         this.plusBtn._x = 4716;
         this.scaleBtn._x = 4730;
         this.scaleBar._x = 4727;
         this.scaleBarBg._x = 4723;
         this.minusBtn._x = 716;
         if(!this.DarkMc)
         {
            this.attachMovie("DarkMc","DarkMc",this.getNextHighestDepth());
         }
         prevScale = curScaleStep;
         var _loc6_ = scaleSize;
         curScaleStep = (scaleSize - 1) * 10;
         this.mapContainer_mc.bgImg_mc._xscale = this.mapContainer_mc.bgImg_mc._yscale = _loc6_ * 100;
         this.mapContainer_mc.hit._xscale = this.mapContainer_mc.hit._yscale = _loc6_ * 100;
         var _loc9_ = (- _loc6_) * 0.75;
         var _loc11_ = posX * _loc9_;
         var _loc10_ = posY * _loc9_;
         var _loc5_ = 0;
         while(_loc5_ < marker_array.length)
         {
            var _loc3_ = marker_array[_loc5_];
            var _loc8_ = _loc3_.posX;
            var _loc7_ = _loc3_.posY;
            _loc3_._x = _loc8_ * _loc6_;
            _loc3_._y = _loc7_ * _loc6_ - 5;
            _loc5_ = _loc5_ + 1;
         }
         this.mapContainer_mc._x = _loc11_ + 384;
         this.mapContainer_mc._y = _loc10_ + 384;
         _loc5_ = 0;
         while(_loc5_ < text_array.length)
         {
            var _loc4_ = text_array[_loc5_];
            var posX = _loc4_.posX;
            var posY = _loc4_.posY;
            _loc4_._x = posX * _loc6_;
            _loc4_._y = posY * _loc6_;
            _loc5_ = _loc5_ + 1;
         }
      }
   };
};
myListener.OnGame_OverlayMap_DarkRiftTime = function(time)
{
   var _loc3_ = "0xFFFFFF";
   if(time < WarningTime)
   {
      _loc3_ = "0xFF0000";
   }
   var _loc2_ = int(Number(time) / 60);
   var _loc1_ = Number(time) % 60;
   if(_loc2_ < 10)
   {
      _loc2_ = "0" + _loc2_;
   }
   if(_loc1_ < 10)
   {
      _loc1_ = "0" + _loc1_;
   }
   var _loc5_ = _loc2_ + ":" + _loc1_;
   container_mc.DarkMc.timeTxt.htmlText = "<font color=\'>" + _loc3_ + "\'>" + _loc5_ + "</font>";
};
myListener.OnGame_OverlayMap_SetScale = function(value)
{
   if(value < 0)
   {
      value = 0;
   }
   if(value > 10)
   {
      value = 10;
   }
   curScaleStep = value;
   changeMapScale();
   var _loc5_ = 768;
   var _loc4_ = 768;
   var _loc3_ = container_mc.mapContainer_mc;
   var _loc2_ = container_mc.mapContainer_mc.bgImg_mc;
   _loc3_._x = - Math.floor((_loc2_._width - _loc5_) / 2);
   _loc3_._y = - Math.floor((_loc2_._height - _loc4_) / 2);
};
var bDragging = false;
var intervalId = null;
var flag = "";
myListener.OnGame_MouseWheel = function(delta, target)
{
   if(scaleLock)
   {
      return undefined;
   }
   var _loc4_ = String(target).split(".");
   var _loc3_ = _loc4_[4];
   if(_global.gbUIMode && _loc3_ == "mapContainer_mc")
   {
      var _loc2_ = delta >= 0?curScaleStep + 2:curScaleStep - 2;
      if(_loc2_ > 10 || _loc2_ < 0)
      {
         return undefined;
      }
      curScaleStep = _loc2_;
      changeMapScale();
   }
};
var tweenType = "notTween";
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWidgetOpen)
   {
      container_mc.frame_mc._visible = true;
      setMouseEvent();
   }
   else
   {
      container_mc.frame_mc._visible = false;
      container_mc.x_mc._visible = false;
      container_mc.bg._visible = false;
      container_mc.titleMc._visible = false;
      container_mc.trackingBtn._visible = false;
      container_mc.plusBtn._visible = false;
      container_mc.minusBtn._visible = false;
      container_mc.scaleBar._visible = false;
      container_mc.scaleBarBg._visible = false;
      container_mc.scaleBtn._visible = false;
      deleteMouseEvent();
      if(intervalId != null)
      {
         clearInterval(intervalId);
         intervalId = null;
         flag = "";
      }
      if(bDragMap)
      {
         bDragMap = false;
         container_mc.mapContainer_mc.stopDrag();
      }
   }
   if(_global.gbUIMode)
   {
      container_mc.dontUse_mc._visible = true;
      container_mc.x_mc._visible = true;
   }
   else
   {
      container_mc.dontUse_mc._visible = false;
      container_mc.x_mc._visible = false;
   }
};
var bDragMap = false;
container_mc.mapContainer_mc.hit.onPress = function()
{
   if(scaleLock)
   {
      return undefined;
   }
   var _loc2_ = this._parent;
   var _loc8_ = _loc2_._x != 0 || _loc2_._y != 0;
   if(curScaleStep > 0 || _loc8_)
   {
      var _loc3_ = container_mc.mapContainer_mc.bgImg_mc.getRect(_loc2_._parent);
      var _loc6_ = _loc3_.xMax - _loc3_.xMin >> 1;
      var _loc7_ = _loc3_.yMax - _loc3_.yMin >> 1;
      var _loc4_ = new flash.geom.Point(0,0);
      var _loc5_ = new flash.geom.Point(780,780);
      container_mc.localToGlobal(_loc4_);
      _loc2_._parent.globalToLocal(_loc4_);
      container_mc.localToGlobal(_loc5_);
      _loc2_._parent.globalToLocal(_loc5_);
      var _loc9_ = 40;
      _loc2_.startDrag(false,_loc4_.x - _loc6_,_loc4_.y - _loc7_,_loc5_.x - _loc6_,_loc5_.y - _loc7_);
      bDragMap = true;
   }
};
container_mc.mapContainer_mc.hit.onRelease = function()
{
   if(scaleLock)
   {
      return undefined;
   }
   if(bDragMap)
   {
      bDragMap = false;
      this._parent.stopDrag();
   }
};
container_mc.mapContainer_mc.hit.onReleaseOutside = function()
{
   if(scaleLock)
   {
      return undefined;
   }
   if(bDragMap)
   {
      bDragMap = false;
      this._parent.stopDrag();
   }
};
var markerContainerXY = {x:container_mc.mapContainer_mc.marker_mc._x,y:container_mc.mapContainer_mc.marker_mc._y};
myListener.OnGame_OverlayMap_Clear = function()
{
   curScaleStep = 0;
   var _loc1_ = curScaleStep / oneStep;
   container_mc.scaleBtn._y = 501;
   container_mc.scaleBar._y = container_mc.scaleBtn._y;
   container_mc.scaleBar._height = 0;
   plusBtn.setEnabled(true);
   minusBtn.setEnabled(false);
   setMargin(0,0);
   clearContainer(container_mc.mapContainer_mc.marker_mc);
   clearContainer(container_mc.mapContainer_mc.markerStatic_mc);
   clearContainer(container_mc.mapContainer_mc.bgImg_mc);
   clearContainer(container_mc.mapContainer_mc.text_mc);
   clearContainer(container_mc.mapContainer_mc.areabg_mc);
   container_mc.mapContainer_mc.bgImg_mc.hitTestDisable = true;
   container_mc.mapContainer_mc.hit._xscale = container_mc.mapContainer_mc.hit._yscale = 100;
   container_mc.titleMc.mapNameFd.text = "";
};
var trackingToolTip = lib.util.UIString.getUIString("$102278");
lib.manager.ToolTip.add(container_mc.trackingBtn,trackingToolTip,1);
container_mc.trackingBtn.onRelease = function()
{
   var _loc1_ = container_mc.trackingBtn._currentframe != 1?1:0;
   var _loc2_ = !_loc1_?2:1;
   container_mc.trackingBtn.gotoAndStop(_loc2_);
   ToGame_OverlayMap_ChangeLocationTracking(_loc1_);
};
myListener.OnGame_OverlayMap_SetLocationTracking = function(bFlag)
{
   bFlag = Number(bFlag);
   var _loc2_ = !bFlag?2:1;
   container_mc.trackingBtn.gotoAndStop(_loc2_);
};
var mapAlpha = 60;
myListener.OnGame_OverlayMap_Init = function(id, type, leftMargin, topMargin, imgList, textList, mapName)
{
   myListener.OnGame_OverlayMap_Clear();
   if(type == "field" || type == "city")
   {
      var _loc4_ = container_mc.mapContainer_mc.bgImg_mc.attachMovie(id,id,container_mc.mapContainer_mc.bgImg_mc.getNextHighestDepth());
      _loc4_._alpha = mapAlpha;
   }
   else if(type == "dungeon" || type == "village")
   {
      _loc4_ = lib.util.DrawBitmap.draw(container_mc.mapContainer_mc.bgImg_mc,id);
      _loc4_._alpha = mapAlpha;
   }
   container_mc.mapContainer_mc._xscale = container_mc.mapContainer_mc._yscale = mapScale * 100;
   container_mc.cooltime_mc._xscale = container_mc.cooltime_mc._yscale = mapScale * 100;
   setMargin(Number(leftMargin),Number(topMargin));
   myListener.OnGame_OverlayMap_AddImage(imgList);
   myListener.OnGame_OverlayMap_AddText(textList);
   if(mapName != undefined)
   {
      container_mc.titleMc.mapNameFd.text = "<" + mapName + ">";
   }
   _root.__preMap = _root.__currentMap;
   _root.__currentMap = id;
   if(_root.__preMap == _root.__currentMap)
   {
      if(_root.__overlayMapX)
      {
         container_mc.mapContainer_mc._x = _root.__overlayMapX;
      }
      if(_root.__overlayMapY)
      {
         container_mc.mapContainer_mc._y = _root.__overlayMapY;
      }
   }
};
var marker_array = new Array();
var changedScaleMarker = new Array();
var STRONG_STR_0 = "img://__WMap_Marker.MARKER_BF_NEUTRAL_STRONGHOLD";
var STRONG_STR_1 = "img://__WMap_Marker.MARKER_BF_OURTEAM_OCCUPIED_STRONGHOLD";
var STRONG_STR_2 = "img://__WMap_Marker.MARKER_BF_ENEMY_OCCUPIED_STRONGHOLD";
var prevStrong = ["","",""];
var CITYWAR_MONSTER = "img://__WMap_Marker.MARKER_CITYWAR_MONSTER";
var CITYWAR_COMMAND = "img://__WMap_Marker.MARKER_UNION_POST_COMMAND";
var CITYWAR_TOWER_GAUGE_WIDTH = 34;
myListener.OnGame_OverlayMap_AddImage = function(dataList)
{
   var _loc34_ = dataList.split("\n");
   var _loc35_ = _loc34_.length;
   if(_loc34_[_loc35_ - 1] == "0" || _loc34_[_loc35_ - 1] == "undefined" || _loc34_[_loc35_ - 1] == "")
   {
      _loc34_.pop();
   }
   _loc35_ = _loc34_.length;
   var _loc33_ = 0;
   var _loc21_ = 0;
   while(_loc21_ < _loc35_)
   {
      var _loc3_ = _loc34_[_loc21_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc5_ = _loc3_[0];
         var _loc23_ = Number(_loc3_[1]);
         var _loc22_ = Number(_loc3_[2]);
         var _loc29_ = Number(_loc3_[3]);
         var _loc12_ = Number(_loc3_[4]);
         var _loc11_ = Number(_loc3_[5]);
         var _loc4_ = _loc3_[6];
         var _loc17_ = _loc3_[7];
         var _loc7_ = Number(_loc3_[8]);
         var _loc27_ = _loc3_[9];
         var _loc32_ = _loc3_[10];
         var _loc20_ = Number(_loc3_[11]);
         var _loc8_ = Number(_loc3_[12]);
         var _loc6_ = Number(_loc3_[13]);
         var _loc9_ = Number(_loc3_[14]);
         var _loc10_ = Number(_loc3_[15]);
         var _loc24_ = Boolean(Number(_loc3_[16]));
         if(isNaN(_loc20_) == false && _loc20_ != -1)
         {
            addNumber(_loc32_,_loc5_,_loc12_,_loc11_,_loc4_,_loc23_,_loc22_,_loc20_,_loc17_);
         }
         else
         {
            _loc8_ = !(isNaN(_loc8_) || -1 == _loc8_ || 0 == _loc8_)?_loc8_:1;
            _loc6_ = !(isNaN(_loc6_) || -1 == _loc6_ || 0 == _loc6_)?_loc6_:1;
            _loc12_ = !isNaN(_loc12_)?_loc12_:0;
            _loc11_ = !isNaN(_loc11_)?_loc11_:0;
            var _loc2_ = searchMarker(_loc5_);
            if(_loc2_ != null)
            {
               myListener.OnGame_OverlayMap_RemoveImage(_loc5_);
            }
            if(_loc7_ == 0)
            {
               lib.util.DrawBitmap.draw(container_mc.mapContainer_mc.bgImg_mc,_loc4_);
            }
            else if(_loc7_ == 5)
            {
               _loc2_ = container_mc.mapContainer_mc.markerStatic_mc.createEmptyMovieClip(_loc5_,container_mc.mapContainer_mc.markerStatic_mc.getNextHighestDepth());
               out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
            }
            else if(_loc7_ == 6)
            {
               _loc2_ = container_mc.mapContainer_mc.marker_mc.alimMc.createEmptyMovieClip(_loc5_,container_mc.mapContainer_mc.marker_mc.alimMc.getNextHighestDepth());
               out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
            }
            else if(_loc7_ == 10)
            {
               if(CITYWAR_MONSTER == _loc4_ || 1 == _loc9_)
               {
                  _loc2_ = container_mc.mapContainer_mc.marker_mc.citywarHit.createEmptyMovieClip(_loc5_,container_mc.mapContainer_mc.marker_mc.citywarHit.getNextHighestDepth());
               }
               else
               {
                  _loc2_ = container_mc.mapContainer_mc.marker_mc.normal.createEmptyMovieClip(_loc5_,container_mc.mapContainer_mc.marker_mc.normal.getNextHighestDepth());
               }
               out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
            }
            else if(_loc7_ == 11)
            {
               _loc2_ = container_mc.mapContainer_mc.marker_mc.quest.createEmptyMovieClip(_loc5_,container_mc.mapContainer_mc.marker_mc.quest.getNextHighestDepth());
               out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
            }
            else if(_loc7_ == 12)
            {
               _loc2_ = container_mc.mapContainer_mc.marker_mc.my.createEmptyMovieClip(_loc5_,container_mc.mapContainer_mc.marker_mc.my.getNextHighestDepth());
               out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
            }
            else if(_loc7_ == 13)
            {
               _loc2_ = container_mc.mapContainer_mc.marker_mc.strong.createEmptyMovieClip(_loc5_,container_mc.mapContainer_mc.marker_mc.strong.getNextHighestDepth());
               out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
               if(_loc4_ == STRONG_STR_0 || _loc4_ == STRONG_STR_1 || _loc4_ == STRONG_STR_2)
               {
                  EffectAnimation(_loc33_,_loc4_,_loc2_);
                  _loc33_ = _loc33_ + 1;
               }
            }
            else if(_loc7_ == 14)
            {
               _loc2_ = container_mc.mapContainer_mc.marker_mc.resurrection.createEmptyMovieClip(_loc5_,container_mc.mapContainer_mc.marker_mc.resurrection.getNextHighestDepth());
               out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
            }
            else if(_loc7_ == 15)
            {
               _loc2_ = container_mc.mapContainer_mc.areabg_mc.createEmptyMovieClip(_loc5_,container_mc.mapContainer_mc.areabg_mc.getNextHighestDepth());
               out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
            }
            if("MARKER_PING" == _loc27_)
            {
               var _loc28_ = out.attachMovie("pingHit","pingHit",out.getNextHighestDepth());
               _loc28_._alpha = 0;
            }
            else
            {
               lib.util.DrawBitmap.draw(out,_loc4_);
            }
            var _loc14_ = undefined;
            if(_loc4_ == "img://__WMap_Marker.MARKER_BLACKHOLE_BG")
            {
               _loc14_ = 70;
            }
            lib.util.DrawBitmap.draw(out,_loc4_,_loc14_,_loc14_);
            out._xscale = _loc8_ * 100;
            out._yscale = _loc6_ * 100;
            if(undefined != _loc14_ && _loc12_ == 0 && _loc11_ == 0)
            {
               out._x = out._x - _loc14_ * _loc8_ / 2;
               out._y = out._y - _loc14_ * _loc6_ / 2;
            }
            else
            {
               out._x = out._x + _loc12_ * _loc8_;
               out._y = out._y + _loc11_ * _loc6_;
            }
            if(0 < _loc10_)
            {
               var _loc15_ = _loc2_.attachMovie("markerBg","markerBg",_loc2_.getNextHighestDepth());
               if(1 == _loc10_ || 2 == _loc10_)
               {
                  var _loc30_ = _loc15_["gauge_" + _loc10_];
                  _loc15_.gauge_1._visible = 1 == _loc10_;
                  _loc15_.gauge_2._visible = 2 == _loc10_;
                  _loc15_.gotoAndStop(_loc10_);
                  var _loc26_ = -22;
                  var _loc25_ = -79;
                  _loc15_._x = _loc26_;
                  _loc15_._y = _loc25_;
                  out._x = _loc26_ + 7;
                  out._y = _loc25_ + 19.5;
                  var _loc31_ = getCityWarTowerHP(_loc17_);
                  _loc30_._width = CITYWAR_TOWER_GAUGE_WIDTH * (_loc31_ / 100);
               }
            }
            if(_loc4_ == "img://__WMap_Marker.MARKER_PC_CAMERA")
            {
               _loc2_.hitTestDisable = true;
            }
            else
            {
               _loc2_.onRollOver = function()
               {
                  markerOver(this);
               };
            }
            if(_loc4_ == "img://__WMap_Marker.MARKER_LINK_TARGET" || _loc4_ == "img://__WMap_Marker.MARKER_LINK_TARGET_POINT2")
            {
               var _loc18_ = _loc2_.attachMovie("Warning","Warning",_loc2_.getNextHighestDepth());
               _loc18_.hitTestDisable = true;
               _loc18_.blendMode = "add";
            }
            else if(_loc4_ == "img://__WMap_Marker.MARKER_BF_METRO_SKILL")
            {
               _loc18_ = _loc2_.attachMovie("Warning2","Warning2",-100);
               _loc18_._x = _loc12_ + 16;
               _loc18_._y = _loc11_ + 16;
               _loc18_.hitTestDisable = true;
               _loc18_.blendMode = "add";
            }
            var _loc16_ = 1 + curScaleStep / 10;
            var _loc19_ = _loc2_;
            if(CITYWAR_MONSTER == _loc4_ || 1 == _loc9_ || _loc4_.substr(0,CITYWAR_COMMAND.length) == CITYWAR_COMMAND)
            {
               if(1 != _loc9_)
               {
                  var _loc13_ = _loc2_.attachMovie("citywar_marker_hit","hit",_loc2_.getNextHighestDepth());
                  _loc13_._x = -24;
                  _loc13_._y = -24;
                  _loc13_._alpha = 0;
               }
               _loc13_ = 1 != _loc9_?_loc13_:_loc2_.markerBg.hit;
               _loc19_ = _loc13_;
               _loc2_.markerHit = _loc13_;
            }
            if(2 == _loc9_)
            {
               lib.manager.ToolTip.add(_loc19_,_loc5_,6);
            }
            else if("" != _loc17_)
            {
               _loc9_ = _loc9_ != 1?1:99;
               lib.manager.ToolTip.add(_loc19_,_loc17_,_loc9_);
            }
            _loc2_._x = _loc23_ * _loc16_;
            _loc2_._y = _loc22_ * _loc16_;
            _loc2_._rotation = _loc29_;
            _loc2_.posX = _loc23_;
            _loc2_.posY = _loc22_;
            _loc2_.bChangedScale = _loc24_;
            if(_loc2_ != null)
            {
               _loc2_.id = _loc5_;
               _loc2_.mn = _loc27_;
               marker_array.push(_loc2_);
               if(_loc24_)
               {
                  _loc2_.scale_x = _loc8_;
                  _loc2_.scale_y = _loc6_;
                  _loc2_._xscale = 100 * _loc16_;
                  _loc2_._yscale = 100 * _loc16_;
                  changedScaleMarker.push(_loc2_);
               }
            }
            _loc2_.res = _loc4_;
         }
      }
      _loc21_ = _loc21_ + 1;
   }
};
myListener.OnGame_OverlayMap_UpdateImage = function(dataList)
{
   var _loc18_ = dataList.split("\n");
   var _loc20_ = _loc18_.length;
   if(_loc18_[_loc20_ - 1] == "0" || _loc18_[_loc20_ - 1] == "undefined" || _loc18_[_loc20_ - 1] == "")
   {
      _loc18_.pop();
   }
   _loc20_ = _loc18_.length;
   var _loc19_ = 1 + curScaleStep / 10;
   var _loc7_ = 0;
   while(_loc7_ < _loc20_)
   {
      var _loc2_ = _loc18_[_loc7_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc21_ = undefined;
         var _loc11_ = _loc2_[0];
         var _loc9_ = Number(_loc2_[1]);
         var _loc8_ = Number(_loc2_[2]);
         var _loc14_ = Number(_loc2_[3]);
         var _loc5_ = _loc2_[4];
         var _loc17_ = _loc2_[5];
         var _loc12_ = Number(_loc2_[6]);
         var _loc6_ = Number(_loc2_[7]);
         var _loc3_ = Number(_loc2_[8]);
         if(_loc12_ != -1)
         {
            updateNumber(_loc17_,_loc11_,_loc12_,_loc9_,_loc8_,_loc5_);
         }
         else
         {
            var _loc1_ = searchMarker(_loc11_);
            if(undefined != _loc1_)
            {
               _loc1_.posX = _loc9_;
               _loc1_.posY = _loc8_;
               _loc1_._x = _loc9_ * _loc19_;
               _loc1_._y = _loc8_ * _loc19_;
               _loc1_._rotation = _loc14_;
               var _loc10_ = _loc1_.markerHit;
               var _loc4_ = _loc1_.markerBg;
               var _loc13_ = undefined == _loc10_?_loc1_:_loc10_;
               if("" != _loc5_)
               {
                  _loc6_ = _loc6_ != 1?1:99;
                  lib.manager.ToolTip.add(_loc13_,_loc5_,_loc6_);
               }
               if(!(isNaN(_loc3_) || 0 == _loc3_))
               {
                  if(1 == _loc3_ || 2 == _loc3_)
                  {
                     if(undefined == _loc4_)
                     {
                        _loc4_ = _loc1_.attachMovie("markerBg","markerBg",_loc1_.getNextHighestDepth());
                     }
                     _loc4_.gauge_1._visible = 1 == _loc3_;
                     _loc4_.gauge_2._visible = 2 == _loc3_;
                     _loc4_.gotoAndStop(_loc3_);
                     var _loc15_ = _loc4_["gauge_" + _loc3_];
                     var _loc16_ = getCityWarTowerHP(_loc5_);
                     _loc15_._width = CITYWAR_TOWER_GAUGE_WIDTH * (_loc16_ / 100);
                  }
               }
            }
         }
      }
      _loc7_ = _loc7_ + 1;
   }
};
myListener.OnGame_OverlayMap_RemoveImage = function(dataList)
{
   var _loc2_ = dataList.split("\n");
   var _loc3_ = _loc2_.length;
   if(_loc2_[_loc3_ - 1] == "0" || _loc2_[_loc3_ - 1] == "undefined" || _loc2_[_loc3_ - 1] == undefined || _loc2_[_loc3_ - 1] == "")
   {
      _loc2_.pop();
   }
   _loc3_ = _loc2_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      var _loc4_ = searchMarker(_loc2_[_loc1_],1);
      _loc1_ = _loc1_ + 1;
   }
};
var prevTargetX = -1;
var prevTargetY = -1;
myListener.OnGame_OverlayMap_AlimClear = function()
{
   var _loc1_ = container_mc.mapContainer_mc.marker_mc.alimMc;
   var _loc2_ = _loc1_.getDepth();
   var _loc3_ = container_mc.mapContainer_mc.marker_mc.createEmptyMovieClip("alimMc",_loc2_);
};
var sparkleArray = new Array();
myListener.OnGame_OverlayMap_SparkleImage = function(imgId, type)
{
   var _loc1_ = searchMarker(imgId);
   if(_loc1_)
   {
      var _loc2_ = undefined;
      type = Number(type);
      var _loc3_ = "sparkle1";
      if(1 == type || 2 == type)
      {
         _loc3_ = "Warning2";
      }
      else if(_loc1_.res == "img://__WMap_Marker.MARKER_BF_KUMASWD_DIA_Focus" || _loc1_.res == "img://__WMap_Marker.MARKER_BF_KUMASWD_DIA_EnemyFocus")
      {
         _loc3_ = "makerSparkle";
      }
      else if(_loc1_.mn == "MARKER_BF_LINK_STRONG")
      {
         _loc3_ = "sparkle3";
      }
      if(_loc1_.sparkleType != type)
      {
         clearSparkle(_loc1_,true);
      }
      if(undefined == _loc1_.sparkle)
      {
         _loc2_ = _loc1_.attachMovie(_loc3_,"sparkle_" + imgId,_loc1_.getNextHighestDepth());
         _loc2_.id = imgId;
         _loc2_.targetMc = _loc1_;
         _loc2_.finishFun = clearSparkle;
         sparkleArray.push(_loc2_);
         _loc1_.sparkle = _loc2_;
         _loc1_.sparkleType = type;
      }
      else
      {
         _loc2_ = _loc1_.sparkle;
      }
   }
};
var effectFocus0 = null;
var effectFocus1 = null;
var effectFocus2 = null;
var effectFocus3 = null;
myListener.OnGame_OverlayMap_SparkleClear = function()
{
   var _loc1_ = 0;
   while(_loc1_ < sparkleArray.length)
   {
      var _loc2_ = sparkleArray[_loc1_];
      clearSparkle(_loc2_.id,false);
      _loc1_ = _loc1_ + 1;
   }
   sparkleArray = [];
};
myListener.OnGame_OverlayMap_RemoveSparkleImage = function(imgId)
{
   clearSparkle(imgId,true);
};
var effectCount = 0;
myListener.OnGame_OverlayMap_SameChannelImage = function(imgId, bTrue)
{
   var _loc1_ = searchMarker(imgId);
   if(_loc1_ != null)
   {
      if(bTrue)
      {
         var _loc2_ = new flash.geom.Transform(_loc1_);
         _loc2_.colorTransform = lib.info.ColorTrans.popupDisableTrans();
      }
      else
      {
         _loc2_ = new flash.geom.Transform(_loc1_);
         _loc2_.colorTransform = enableTrans;
      }
   }
};
var text_array = new Array();
myListener.OnGame_OverlayMap_AddText = function(dataList)
{
   var _loc10_ = dataList.split("\n");
   var _loc12_ = _loc10_.length;
   if(_loc10_[_loc12_ - 1] == "0" || _loc10_[_loc12_ - 1] == "undefined" || _loc10_[_loc12_ - 1] == "")
   {
      _loc10_.pop();
   }
   _loc12_ = _loc10_.length;
   var _loc11_ = 1 + scale / 10;
   var _loc3_ = 0;
   while(_loc3_ < _loc12_)
   {
      var _loc2_ = _loc10_[_loc3_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc13_ = undefined;
         var _loc4_ = _loc2_[0];
         var _loc8_ = Number(_loc2_[1]);
         var _loc6_ = Number(_loc2_[2]);
         var _loc5_ = _loc2_[3];
         var _loc7_ = _loc2_[4];
         var _loc9_ = _loc2_[5];
         var _loc1_ = container_mc.mapContainer_mc.text_mc.attachMovie("txt_id",_loc4_,container_mc.mapContainer_mc.text_mc.getNextHighestDepth());
         _loc1_.hitTestDisable = true;
         _loc1_.id = _loc4_;
         _loc1_.style = _loc5_;
         _loc1_.txt.text = _loc9_;
         _loc1_.posX = _loc8_;
         _loc1_.posY = _loc6_;
         lib.info.TextColor.setWorldMapTextColor(0,_loc5_,_loc1_.txt);
         _loc1_.txt._width = _loc1_.txt.textWidth + 5;
         if(_loc7_ == "center")
         {
            _loc1_.txt._x = _loc1_.txt._x - _loc1_.txt._width / 2;
         }
         else if(_loc7_ == "right")
         {
            _loc1_.txt._x = _loc1_.txt._x - _loc1_.txt._width;
         }
         _loc1_._x = _loc8_ * _loc11_;
         _loc1_._y = _loc6_ * _loc11_;
         text_array.push(_loc1_);
      }
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_OverlayMap_RemoveText = function(dataList)
{
   var _loc3_ = dataList.split("\n");
   var _loc4_ = _loc3_.length;
   if(_loc3_[_loc4_ - 1] == "0" || _loc3_[_loc4_ - 1] == "undefined" || _loc3_[_loc4_ - 1] == "")
   {
      _loc3_.pop();
   }
   _loc4_ = _loc3_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = searchText(_loc3_[_loc1_]);
      if(_loc2_ != null)
      {
         _loc2_.removeMovieClip();
      }
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_OverlayMap_SetMarkerGage = function(targetID, curNum, maxNum)
{
   var _loc2_ = searchMarker(targetID);
   if(_loc2_ != null)
   {
      var _loc1_ = undefined;
      if(!_loc2_["gageMc" + targetID])
      {
         _loc1_ = _loc2_.attachMovie("gageMc","gageMc" + targetID,_loc2_.getNextHighestDepth());
      }
      else
      {
         _loc1_ = _loc2_["gageMc" + targetID];
      }
      _loc1_._x = 12;
      _loc1_._y = -8;
      var _loc3_ = curNum / maxNum * 100;
      _loc1_.bar._xscale = _loc3_;
      if(maxNum == 0)
      {
         removeMovieClip(_loc1_);
      }
      else if(_loc3_ < 50)
      {
         mc.gotoAndStop(2);
      }
   }
};
myListener.OnGame_OverlayMap_SetMarkerCoolTime = function(targetID, coolTime)
{
   var _loc2_ = searchMarker(targetID);
   if(_loc2_ != null)
   {
      var _loc1_ = undefined;
      if(!container_mc.cooltime_mc["timeMc" + targetID])
      {
         _loc1_ = container_mc.cooltime_mc.attachMovie("timeMc","timeMc" + targetID,container_mc.cooltime_mc.getNextHighestDepth());
      }
      else
      {
         _loc1_ = container_mc.cooltime_mc["timeMc" + targetID];
      }
      _loc1_._x = _loc2_._x;
      _loc1_._y = _loc2_._y + _loc2_._height / 2;
      var _loc4_ = int(coolTime / 60);
      var _loc3_ = int(coolTime % 60);
      if(_loc4_ < 10)
      {
         _loc4_ = "0" + _loc4_;
      }
      if(_loc3_ < 10)
      {
         _loc3_ = "0" + _loc3_;
      }
      _loc1_.txt.text = _loc4_ + ":" + _loc3_;
      if(coolTime <= 0)
      {
         removeMovieClip(_loc1_);
      }
   }
};
var useStat = 1;
lib.manager.ToolTip.add(container_mc.dontUse_mc,lib.info.ToolTipStr.OVERLAY_DRAG_ENABLE,1);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(end = function()
{
   ToGame_OverlayMap_CloseUI();
});
container_mc.dontUse_mc.onRollOver = function()
{
   this.mc.gotoAndStop(2);
};
container_mc.dontUse_mc.onRollOut = container_mc.dontUse_mc.onReleaseOutside = function()
{
   this.mc.gotoAndStop(1);
   lib.manager.ToolTip.hide();
};
container_mc.dontUse_mc.onPress = function()
{
   this.mc.gotoAndStop(3);
};
container_mc.dontUse_mc.onRelease = function()
{
   this.mc.gotoAndStop(2);
   dontUse();
   useStat = !useStat;
};
fscommand("ToGame_OverlayMap2_Init");
