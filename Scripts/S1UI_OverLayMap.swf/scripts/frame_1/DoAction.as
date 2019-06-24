function showFrame(bTrue)
{
   if(bTrue)
   {
      container_mc.frame_mc.frameBg.onEnterFrame = function()
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
      container_mc.frame_mc.frameBg.onEnterFrame = function()
      {
         this._alpha = this._alpha - 20;
         if(this._alpha <= 0)
         {
            delete this.onEnterFrame;
         }
      };
   }
}
function searchMarker(container, idOrType, identifier)
{
   var _loc2_ = new Array();
   for(m in container.normal)
   {
      var _loc1_ = container.normal[m];
      if(typeof _loc1_ == "movieclip")
      {
         if(idOrType == "id")
         {
            if(_loc1_.id == identifier)
            {
               _loc2_.push(_loc1_);
            }
         }
         else if(idOrType == "type")
         {
            if(_loc1_.type == identifier)
            {
               _loc2_.push(_loc1_);
            }
         }
      }
   }
   for(m in container.quest)
   {
      _loc1_ = container.quest[m];
      if(typeof _loc1_ == "movieclip")
      {
         if(idOrType == "id")
         {
            if(_loc1_.id == identifier)
            {
               _loc2_.push(_loc1_);
            }
         }
         else if(idOrType == "type")
         {
            if(_loc1_.type == identifier)
            {
               _loc2_.push(_loc1_);
            }
         }
      }
   }
   for(m in container.my)
   {
      _loc1_ = container.my[m];
      if(typeof _loc1_ == "movieclip")
      {
         if(idOrType == "id")
         {
            if(_loc1_.id == identifier)
            {
               _loc2_.push(_loc1_);
            }
         }
         else if(idOrType == "type")
         {
            if(_loc1_.type == identifier)
            {
               _loc2_.push(_loc1_);
            }
         }
      }
   }
   if(_loc2_.length > 0)
   {
      return _loc2_;
   }
   return null;
}
function addMarker(markerId, markerType, desc, x, y)
{
   markerO.cnt = markerO.cnt + 1;
   markerO.totalCnt = markerO.totalCnt + 1;
   var _loc3_ = markerO.container.normal;
   if(markerType == 1 || markerType == 3)
   {
      _loc3_ = markerO.container.my;
   }
   else if(markerType == 4)
   {
      _loc3_ = markerO.container.quest;
   }
   else
   {
      _loc3_ = markerO.container.normal;
   }
   var _loc1_ = _loc3_.attachMovie("marker" + markerType,"marker" + markerId,_loc3_.getNextHighestDepth());
   _loc1_._xscale = _loc1_._yscale = markerO.scale;
   _loc1_.type = markerType;
   _loc1_.id = markerId;
   _loc1_.desc = desc;
   _loc1_._x = x;
   _loc1_._y = y;
   if(markerType == 1)
   {
      _loc1_.sight.hitTestDisable = true;
      me = _loc1_;
   }
   if(markerType == 3)
   {
      _loc1_.hitTestDisable = true;
   }
   else if(markerType == 6)
   {
      lib.util.FrameSeeker.seek(_loc1_.effect,1,_loc1_.effect._totalframes);
      _loc1_.effect.hitTestDisable = true;
   }
   if(_loc1_.type != 1 && _loc1_.type != 2 && _loc1_.type != 3 && _loc1_.type != 4 && _loc1_.type != 25 && _loc1_.type != 26 && _loc1_.type != 27 && _loc1_.type != 28)
   {
      _loc1_._alpha = markerAlpha;
   }
}
function clearMarkers(target)
{
   var _loc4_ = target._name;
   var _loc6_ = target.getDepth();
   var _loc2_ = target._parent.createEmptyMovieClip(_loc4_,_loc6_);
   _loc2_.createEmptyMovieClip("normal",_loc2_.getNextHighestDepth());
   _loc2_.createEmptyMovieClip("quest",_loc2_.getNextHighestDepth());
   _loc2_.createEmptyMovieClip("my",_loc2_.getNextHighestDepth());
   if(markerO.container == container_mc.marker_mc)
   {
      _loc2_._x = markerContainerXY.x;
      _loc2_._y = markerContainerXY.y;
   }
   else
   {
      for(var _loc3_ in markerO.container)
      {
         var _loc1_ = undefined;
         if(typeof markerO.container[_loc3_] == "movieclip")
         {
            _loc1_ = markerO.container[_loc3_];
            _loc1_._xscale = _loc1_._yscale = 100;
         }
      }
   }
   markerO.cnt = 0;
   markerO.totalCnt = 0;
   markerO.scale = 100;
}
function resetSectionMap()
{
   trace("섹션맵리셋");
   clearMarkers(markerO.container);
   container_mc.guard_mc.container_mc.depth3_mc.contents_mc._xscale = container_mc.guard_mc.container_mc.depth3_mc.contents_mc._yscale = container_mc.guard_mc.scale;
   container_mc.guard_mc.container_mc.depth3_mc.contents_mc._x = sectionMapX;
   container_mc.guard_mc.container_mc.depth3_mc.contents_mc._y = sectionMapY;
   trace("scale = " + container_mc.guard_mc.scale);
   trace("sectionMapX = " + sectionMapX);
   trace("sectionMapY = " + sectionMapY);
}
function loadMap(url, sectionNum)
{
   var splitUrl = url.split("_");
   realUrl = splitUrl[0] + "_" + splitUrl[1];
   Mouse.removeListener(mouseListener);
   mapLoader.removeListener(mapLoaderListener);
   mapLoaderListener = new Object();
   mapLoaderListener.onLoadInit = function(target)
   {
      target.isOverlayMap = true;
      target.overlayMapMode = true;
      trace("loaded!");
      guard = splitUrl[1];
      section = splitUrl[2];
      if(sectionNum != undefined)
      {
         hideElement(url,sectionNum);
         trace(target);
      }
   };
   realUrl = "/package/S1UI_GuardMap_" + realUrl + "/" + "GuardMap_" + realUrl + ".swf";
   mapLoader.addListener(mapLoaderListener);
   mapLoader.loadClip(realUrl,container_mc.guard_mc);
}
function hideElement(mapNum, sectionNum)
{
   container_mc.guard_mc._visible = false;
   UI.onEnterFrame = function()
   {
      if(container_mc.guard_mc.container_mc.depth3_mc.contents_mc.marker_mc)
      {
         container_mc.guard_mc.container_mc.depth3_mc.contents_mc.gotoAndStop(Number(sectionNum) - container_mc.guard_mc.startSectionNumbering + 1);
         markerO.container = container_mc.guard_mc.container_mc.depth3_mc.contents_mc.marker_mc;
         container_mc.guard_mc._xscale = container_mc.guard_mc._yscale = 75;
         container_mc.guard_mc.container_mc.depth2_mc._visible = false;
         container_mc.guard_mc.container_mc.depth3_mc.mask_mc._visible = false;
         container_mc.guard_mc.container_mc.depth3_mc.contents_mc.setMask(null);
         container_mc.guard_mc.container_mc.depth3_mc.dragMask._visible = false;
         container_mc.guard_mc.container_mc.depth3_mc.contents_mc.img._visible = false;
         container_mc.guard_mc.container_mc.depth3_mc.contents_mc.mapTitle._visible = false;
         container_mc.guard_mc.container_mc.depth3_mc.contents_mc.overlay._alpha = mapAlpha;
         container_mc.guard_mc.container_mc.depth3_mc._visible = true;
         container_mc.guard_mc.container_mc.depth3_mc.bg_mc._visible = false;
         trace("Depth3 currentFrame = " + container_mc.guard_mc.container_mc.depth3_mc.contents_mc._currentframe);
         trace(container_mc.guard_mc.container_mc);
         trace(container_mc.guard_mc.container_mc.depth3_mc.bg_mc);
         trace(container_mc.guard_mc.container_mc.depth3_mc.contents_mc["fog_" + mapNum]);
         container_mc.guard_mc.container_mc.depth3_mc.contents_mc["fog_" + mapNum]._visible = false;
         container_mc.guard_mc._visible = true;
         ToGame_OverlayMap_RequestMapInit(mapNum);
         if(firstLoad)
         {
            firstLoad = false;
            container_mc.frame_mc.dontUse_mc.onRelease();
         }
         delete this.onEnterFrame;
      }
   };
}
function ToGame_OverlayMap_RequestMapInit(mapName)
{
   getURL("FSCommand:ToGame_OverlayMap_RequestMapInit",mapName);
   trace("ToGame_OverlayMap_RequestMapInit : " + mapName);
}
function ToGame_OverlayMap_CloseUI()
{
   fscommand("ToGame_OverlayMap_CloseUI");
   trace("ToGame_OverlayMap_CloseUI()");
}
function dontUse()
{
   if(useStat)
   {
      container_mc.frame_mc.UIDrager._visible = false;
      container_mc.frame_mc.frameBg._visible = false;
      container_mc.frame_mc.UIDrager.hitTestDisable = true;
      container_mc.frame_mc.frameBg.hitTestDisable = true;
      container_mc.guard_mc.hitTestDisable = true;
      hit._visible = false;
      container_mc.frame_mc.dontUse_mc.toolip = lib.info.ToolTipStr.OVERLAY_DRAG_DISABLE;
      lib.manager.ToolTip.add(container_mc.frame_mc.dontUse_mc,lib.info.ToolTipStr.OVERLAY_DRAG_DISABLE,1);
      container_mc.frame_mc.dontUse_mc.gotoAndStop(2);
   }
   else
   {
      container_mc.frame_mc.UIDrager._visible = true;
      container_mc.frame_mc.frameBg._visible = true;
      container_mc.frame_mc.UIDrager.hitTestDisable = false;
      container_mc.frame_mc.frameBg.hitTestDisable = false;
      container_mc.guard_mc.hitTestDisable = false;
      hit._visible = true;
      container_mc.frame_mc.dontUse_mc.toolip = lib.info.ToolTipStr.OVERLAY_DRAG_ENABLE;
      lib.manager.ToolTip.add(container_mc.frame_mc.dontUse_mc,lib.info.ToolTipStr.OVERLAY_DRAG_ENABLE,1);
      container_mc.frame_mc.dontUse_mc.gotoAndStop(1);
   }
   lib.manager.ToolTip.add(container_mc.frame_mc.dontUse_mc,container_mc.frame_mc.dontUse_mc.toolip,1);
}
var UI = this;
UI._visible = false;
var UIname = "OverlayMap";
container_mc.frame_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.frame_mc.UIDrager.adjustDragLimit(-400,0,0,0);
container_mc.frame_mc.UIDrager.onRollOver = function()
{
   showFrame(1);
};
container_mc.frame_mc.UIDrager.onRollOut = function()
{
   showFrame(0);
};
container_mc.frame_mc.UIDrager.onPress2 = function()
{
   container_mc.onEnterFrame = function()
   {
      if(lib.info.AlignInfo.xPixelToRatio(UI._x + hit._width * lib.info.AlignInfo.scaleRatio) >= 100)
      {
         container_mc.frame_mc.dontUse_mc._x = 8;
         container_mc.frame_mc.x_mc._x = 51;
      }
      else
      {
         container_mc.frame_mc.dontUse_mc._x = 693;
         container_mc.frame_mc.x_mc._x = 736;
      }
   };
};
container_mc.frame_mc.UIDrager.onRelease2 = function()
{
   delete container_mc.onEnterFrame;
};
container_mc.frame_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
bWidgetOpen = true;
container_mc.noClicker.useHandCursor = false;
container_mc.frame_mc._visible = false;
container_mc.frame_mc.frameBg._alpha = 0;
var firstLoad = true;
var markerAlpha = 100;
var mapAlpha = 65;
var guard = null;
var section = null;
var mouseListener;
var myListener = new Object();
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         if(lib.info.AlignInfo.xPixelToRatio(UI._x + hit._width * lib.info.AlignInfo.scaleRatio) >= 100)
         {
            container_mc.frame_mc.dontUse_mc._x = 8;
            container_mc.frame_mc.x_mc._x = 51;
         }
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
      container_mc.frame_mc._visible = true;
   }
   else
   {
      container_mc.frame_mc._visible = false;
      container_mc.frame_mc.x_mc._visible = false;
   }
   if(_global.gbUIMode)
   {
      container_mc.frame_mc.dontUse_mc._visible = true;
      container_mc.frame_mc.x_mc._visible = true;
   }
   else
   {
      container_mc.frame_mc.dontUse_mc._visible = false;
      container_mc.frame_mc.x_mc._visible = false;
   }
};
myListener.OnGame_WorldMap_RotateCamera = function(degree)
{
   me.sight._rotation = Number(degree);
};
var markerO = new Object();
markerO.cnt = 0;
markerO.totalCnt = 0;
markerO.scale = 160;
markerO.container = container_mc.guard_mc.container_mc.depth3_mc.contents_mc.marker_mc;
myListener.OnGame_OverlayMap_AddMarker = function(markerId, markerType, desc, x, y)
{
   _root.debug3.text = "[오버레이맵 마커찍기] ID: " + markerId + ", TYPE: " + markerType + ", DESC: " + desc + "\r" + _root.debug3.text;
   var _loc3_ = markerO.container["marker" + markerId];
   if(_loc3_)
   {
      myListener.OnGame_OverlayMap_UpdateMarker(markerId,x,y);
   }
   else
   {
      addMarker(markerId,markerType,desc,x,y);
   }
};
var me = null;
myListener.OnGame_OverlayMap_RemoveMarker = function(markerId)
{
   _root.debug3.text = "[오버레이맵 마커제거] ID: " + markerId + "\r" + _root.debug3.text;
   var _loc2_ = searchMarker(markerO.container,"id",markerId)[0];
   if(_loc2_)
   {
      markerO.cnt--;
      removeMovieClip(_loc2_);
   }
};
myListener.OnGame_OverlayMap_ClearMarker = function()
{
   clearMarkers(markerO.container);
};
myListener.OnGame_OverlayMap_SetSparkle = function(markerId)
{
   var _loc1_ = searchMarker(markerO.container,"id",markerId)[0];
   if(_loc1_)
   {
      _loc1_.gotoAndStop(2);
   }
};
myListener.OnGame_OverlayMap_ScaleMarker = function(markerId)
{
   var _loc1_ = searchMarker(markerO.container,"id",markerId)[0];
   if(_loc1_)
   {
      _loc1_._xscale = _loc1_._yscale = random(500);
   }
};
myListener.OnGame_OverlayMap_UpdateMarker = function(markerId, x, y, rotation)
{
   var _loc1_ = searchMarker(markerO.container,"id",markerId)[0];
   if(_loc1_)
   {
      _loc1_._x = x;
      _loc1_._y = y;
      if(rotation != undefined && rotation != "undefined" && rotation != "")
      {
         _loc1_._rotation = rotation;
      }
   }
};
myListener.OnGame_OverlayMap_SetMap = function(mapNumber)
{
   mapLoader.removeListener(mapLoaderListener);
   sectionMapX = sectionMapY = 0;
   mapNumber = String(mapNumber);
   var _loc1_ = mapNumber.split("_");
   if(_loc1_.length != 1)
   {
      if(_loc1_.length != 2)
      {
         if(_loc1_.length == 3)
         {
            if(guard == _loc1_[1])
            {
               trace("current Guard!");
               container_mc.guard_mc.container_mc.depth3_mc.contents_mc.gotoAndStop(Number(_loc1_[2]) - container_mc.guard_mc.startSectionNumbering + 1);
               guard = _loc1_[1];
               section = _loc1_[2];
               ToGame_OverlayMap_RequestMapInit(_loc1_[0] + "_" + _loc1_[1] + "_" + _loc1_[2]);
               hideElement(mapNumber,_loc1_[2]);
            }
            else
            {
               loadMap(mapNumber,_loc1_[2]);
            }
            currentDepth = "section";
         }
      }
   }
   clearMarkers(markerO.container);
};
var mapLoader = new MovieClipLoader();
var mapLoaderListener = new Object();
var useStat = 1;
lib.manager.ToolTip.add(container_mc.frame_mc.dontUse_mc,lib.info.ToolTipStr.OVERLAY_DRAG_ENABLE,1);
_global.EventBroadCaster.addListener(myListener);
var x_btn = new lib.util.TxtBtn(container_mc.frame_mc.x_mc);
x_btn.setRelease(end = function()
{
   ToGame_OverlayMap_CloseUI();
});
container_mc.frame_mc.dontUse_mc.onRollOver = function()
{
   this.mc.gotoAndStop(2);
};
container_mc.frame_mc.dontUse_mc.onRollOut = container_mc.frame_mc.dontUse_mc.onReleaseOutside = function()
{
   this.mc.gotoAndStop(1);
   lib.manager.ToolTip.hide();
};
container_mc.frame_mc.dontUse_mc.onPress = function()
{
   this.mc.gotoAndStop(3);
};
container_mc.frame_mc.dontUse_mc.onRelease = function()
{
   this.mc.gotoAndStop(2);
   dontUse();
   useStat = !useStat;
};
fscommand("ToGame_OverlayMap_Init");
