function drawBitmap(target, LinkageID, size)
{
   var _loc3_ = flash.display.BitmapData.loadBitmap(LinkageID);
   var _loc1_ = target.createEmptyMovieClip(LinkageID,1);
   _loc1_.attachBitmap(_loc3_,1);
   _loc1_._width = size;
   _loc1_._height = size;
   target.resourcID = LinkageID;
}
function noClickerWork()
{
   if(mapMode != 0)
   {
      if(currentDepth == "section")
      {
         container_mc.noClicker._visible = false;
         container_mc.guard_mc.container_mc.noBtnClicker._visible = true;
      }
      else
      {
         container_mc.noClicker._visible = true;
         container_mc.guard_mc.container_mc.noBtnClicker._visible = false;
      }
   }
   else
   {
      container_mc.noClicker._visible = false;
      container_mc.guard_mc.container_mc.noBtnClicker._visible = false;
   }
}
function mapBtnEnable(bTrue)
{
   for(mc in container_mc)
   {
      trace(container_mc[mc]);
      if(typeof container_mc[mc] == "movieclip")
      {
         if(container_mc[mc]._name.substr(0,4) == "over")
         {
            container_mc[mc].hit.enabled = bTrue;
         }
      }
   }
}
function clearCommanderInfo()
{
   skillMaker.clearMovie();
   Mouse.removeListener(mouseO);
   container_mc.range_mc._visible = false;
   delete container_mc.range_mc.onEnterFrame;
}
function ToGame_BattleFieldMap_UseCommanderSkill(skillId, x, y)
{
   getURL("FSCommand:ToGame_BattleFieldMap_UseCommanderSkill",skillId + "\t" + x + "\t" + y);
   trace("ToGame_BattleFieldMap_UseCommanderSkill : " + skillId + "\t" + x + "\t" + y);
   for(skill in container_mc.commander_mc)
   {
      if(typeof container_mc.commander_mc[skill] == "movieclip")
      {
         var _loc1_ = container_mc.commander_mc[skill];
         if(_loc1_.id == clickedSkillId)
         {
            _loc1_.active = false;
            break;
         }
      }
   }
   clickedSkillId = null;
}
function ToGame_BattleFieldMap_PrepareCommanderSkill(skillId)
{
   getURL("FSCommand:ToGame_BattleFieldMap_PrepareCommanderSkill",skillId);
   trace("ToGame_BattleFieldMap_PrepareCommanderSkill : " + skillId);
}
function clearComboBox()
{
   comboBox1Maker.clearMovie();
   comboBox2Maker.clearMovie();
   container_mc.comboBox1_mc.selected_txt.text = "";
   container_mc.comboBox2_mc.selected_txt.text = "";
   container_mc.comboBox1_mc.selected_txt.textColor = 16777113;
   container_mc.comboBox2_mc.selected_txt.textColor = 16777113;
   firstComboBox1Data = true;
   firstComboBox2Data = true;
   container_mc.comboBox1_mc.sub_mc.contents_mc.content_mc._y = 0;
   container_mc.comboBox2_mc.sub_mc.contents_mc.content_mc._y = 0;
   container_mc.comboBox1_mc.sub_mc.scroller.__height = 0;
   container_mc.comboBox2_mc.sub_mc.scroller.__height = 0;
}
function ToGame_AgitMap_RequestSortSize(comboBoxId)
{
   getURL("FSCommand:ToGame_AgitMap_RequestSortSize",comboBoxId);
   trace("ToGame_AgitMap_RequestSortSize : " + comboBoxId);
}
function ToGame_AgitMap_ShowAgitBuyUI(id)
{
   getURL("FSCommand:ToGame_AgitMap_ShowAgitBuyUI",id);
   trace("ToGame_AgitMap_ShowAgitBuyUI : " + id);
}
function clearLine()
{
   var _loc2_ = container_mc.line_mc._name;
   var _loc3_ = container_mc.line_mc.getDepth();
   var _loc5_ = container_mc.line_mc._x;
   var _loc4_ = container_mc.line_mc._y;
   var _loc1_ = container_mc.createEmptyMovieClip(_loc2_,_loc3_);
   _loc1_._x = _loc5_;
   _loc1_._y = _loc4_;
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
   markerType = Number(markerType);
   markerO.cnt = markerO.cnt + 1;
   markerO.totalCnt = markerO.totalCnt + 1;
   var _loc5_ = markerO.container.normal;
   if(markerType == 1 || markerType == 3)
   {
      _loc5_ = markerO.container.my;
   }
   else if(markerType >= 25 && markerType <= 35)
   {
      _loc5_ = markerO.container.quest;
   }
   else
   {
      _loc5_ = markerO.container.normal;
   }
   var marker = _loc5_.attachMovie("marker" + markerType,"marker" + markerId,_loc5_.getNextHighestDepth());
   marker.type = markerType;
   marker._xscale = marker._yscale = markerO.scale;
   marker.id = markerId;
   marker.desc = desc;
   marker._x = x;
   marker._y = y;
   _root.debug3.text = "[마커추가] Scale: " + markerO.scale + "\r" + _root.debug3.text;
   if(markerType == 1)
   {
      marker.sight.hitTestDisable = true;
      myMarkerId = markerId;
      myListener.OnGame_WorldMap_SetSparkle(myMarkerId);
      me = marker;
   }
   else if(markerType == 3)
   {
      marker.hitTestDisable = true;
   }
   else if(markerType == 6)
   {
      lib.util.FrameSeeker.seek(marker.effect,1,marker.effect._totalframes);
      marker.effect.hitTestDisable = true;
   }
   marker.onRollOver = function()
   {
      markerOver(marker);
   };
   if(markerType == 1 || markerType >= 200 && markerType <= 399)
   {
      if(markerType == 209)
      {
         marker.onRollOver = function()
         {
            this.in_mc.gotoAndStop(2);
            markerOver(marker);
         };
         marker.onRollOut = marker.onReleaseOutside = function()
         {
            this.in_mc.gotoAndStop(1);
         };
         marker.onRelease = function()
         {
            ToGame_BattleFieldMap_Resurrect(this.id);
         };
      }
   }
   else if(markerType >= 400 && markerType <= 599)
   {
      if(markerType == 401)
      {
         marker.onRollOver = function()
         {
            this.in_mc.gotoAndStop(2);
            markerOver(marker);
            for(mc in container_mc.line_mc)
            {
               if(typeof container_mc.line_mc[mc] == "movieclip")
               {
                  if(container_mc.line_mc[mc]._name == "line" + this.id)
                  {
                     container_mc.line_mc[mc].onEnterFrame = function()
                     {
                        this._alpha = this._alpha + 5;
                        if(this._alpha >= 100)
                        {
                           delete this.onEnterFrame;
                        }
                     };
                  }
                  else
                  {
                     container_mc.line_mc[mc].onEnterFrame = function()
                     {
                        this._alpha = this._alpha - 5;
                        if(this._alpha <= 10)
                        {
                           this._alpha = 10;
                           delete this.onEnterFrame;
                        }
                     };
                  }
               }
            }
         };
         marker.onRollOut = marker.onReleaseOutside = function()
         {
            this.in_mc.gotoAndStop(1);
            for(mc in container_mc.line_mc)
            {
               if(typeof container_mc.line_mc[mc] == "movieclip")
               {
                  container_mc.line_mc[mc].onEnterFrame = function()
                  {
                     if(this._alpha > 50)
                     {
                        this._alpha = this._alpha - 5;
                     }
                     else
                     {
                        this._alpha = this._alpha + 5;
                     }
                     if(this._alpha == 50)
                     {
                        delete this.onEnterFrame;
                     }
                  };
               }
            }
         };
         marker.onRelease = function()
         {
            ToGame_TransferVehicle_SelectDestination(this.id);
         };
      }
      if(markerType == 401 || markerType == 402)
      {
         var _loc4_ = desc.split("\t");
         if(_loc4_[_loc4_.length - 1] == "0" || _loc4_[_loc4_.length - 1] == "undefined" || _loc4_[_loc4_.length - 1] == "")
         {
            _loc4_.splice(_loc4_.length - 1,1);
         }
         var _loc6_ = _loc4_[0] + "\r" + "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + lib.util.CurrencyFormat.makeComma(_loc4_[1]) + "</font> <img src=\'moneyBitmap\'>";
         if(markerType == 402)
         {
            _loc6_ = _loc6_ + ("\r<font color=\'#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16) + "\'>" + lib.util.UIString.getUIString("$241008") + _loc4_[2]);
         }
         lib.manager.ToolTip.add(marker,_loc6_,1);
      }
   }
   else if(markerType >= 600 && markerType <= 799)
   {
      marker.onRollOver = function()
      {
         markerOver(marker);
         lib.manager.ToolTip.show(this,7,this.type - 600 + "\t" + this.desc);
      };
      marker.onRollOut = marker.onReleaseOutside = function()
      {
         lib.manager.ToolTip.hide();
      };
      marker.onRelease = function()
      {
         if(this.type == 601)
         {
            ToGame_AgitMap_ShowAgitBuyUI(this.id);
         }
      };
   }
   else if(markerType >= 800 && markerType <= 899)
   {
      if(markerType == 801)
      {
         marker.onRollOver = function()
         {
            this.in_mc.gotoAndStop(2);
            markerOver(marker);
            for(mc in container_mc.line_mc)
            {
               if(typeof container_mc.line_mc[mc] == "movieclip")
               {
                  if(container_mc.line_mc[mc]._name == "line" + this.id)
                  {
                     container_mc.line_mc[mc].onEnterFrame = function()
                     {
                        this._alpha = this._alpha + 5;
                        if(this._alpha >= 100)
                        {
                           delete this.onEnterFrame;
                        }
                     };
                  }
                  else
                  {
                     container_mc.line_mc[mc].onEnterFrame = function()
                     {
                        this._alpha = this._alpha - 5;
                        if(this._alpha <= 10)
                        {
                           this._alpha = 10;
                           delete this.onEnterFrame;
                        }
                     };
                  }
               }
            }
         };
         marker.onRollOut = marker.onReleaseOutside = function()
         {
            this.in_mc.gotoAndStop(1);
            for(mc in container_mc.line_mc)
            {
               if(typeof container_mc.line_mc[mc] == "movieclip")
               {
                  container_mc.line_mc[mc].onEnterFrame = function()
                  {
                     if(this._alpha > 50)
                     {
                        this._alpha = this._alpha - 5;
                     }
                     else
                     {
                        this._alpha = this._alpha + 5;
                     }
                     if(this._alpha == 50)
                     {
                        delete this.onEnterFrame;
                     }
                  };
               }
            }
         };
         marker.onRelease = function()
         {
            ToGame_TeleportToCamp_SelectDestination(this.id);
         };
      }
      if(markerType == 801 || markerType == 802)
      {
         _loc4_ = desc.split("\t");
         if(_loc4_[_loc4_.length - 1] == "0" || _loc4_[_loc4_.length - 1] == "undefined" || _loc4_[_loc4_.length - 1] == "")
         {
            _loc4_.splice(_loc4_.length - 1,1);
         }
         _loc6_ = _loc4_[0] + "\r" + "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + lib.util.CurrencyFormat.makeComma(_loc4_[1]) + "</font> <img src=\'moneyBitmap\'>";
         if(markerType == 802)
         {
            _loc6_ = _loc6_ + ("\r<font color=\'#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16) + "\'>" + lib.util.UIString.getUIString("$241007") + "</font>");
         }
         lib.manager.ToolTip.add(marker,_loc6_,1);
      }
   }
   if(markerType <= 400 || markerType == 800)
   {
      lib.manager.ToolTip.add(marker,desc,1);
   }
}
function markerOver(target)
{
   target.swapDepths(target._parent.getNextHighestDepth());
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
function worldMapBtnEnable()
{
   var _loc4_ = 1;
   var _loc3_ = 1;
   var _loc2_ = 1;
   while(_loc2_ < 30)
   {
      btn = container_mc["over_" + _loc4_ + "_" + _loc3_];
      txt = container_mc["worldText_" + _loc4_ + "_" + _loc3_];
      btn.hit.onRollOver = function()
      {
         this._parent.gotoAndStop(2);
         lib.info.TextColor.setWorldMapTextColor(1,"world",txt);
      };
      btn.hit.onRollOut = btn.hit.onReleaseOutside = function()
      {
         this._parent.gotoAndStop(1);
         lib.info.TextColor.setWorldMapTextColor(0,"world",txt);
      };
      btn.hit.onRelease = function()
      {
         worldMapBtnWork(this._parent._name);
      };
      _loc3_ = _loc3_ + 1;
      _loc2_ = _loc2_ + 1;
   }
}
function guardMapBtnEnable()
{
   var _loc1_ = 1;
}
function worldMapBtnWork(worldMapBtnName)
{
   clearMarkers(markerO.container);
   var _loc2_ = "";
   var _loc1_ = worldMapBtnName.split("_");
   _loc2_ = _loc1_[1];
   _loc2_ = _loc2_ + "\t";
   _loc2_ = _loc2_ + _loc1_[2];
   world = _loc1_[1];
   guard = _loc1_[2];
   var _loc3_ = _loc1_[1] + "_" + _loc1_[2];
   var _loc4_ = changeMapNumberToSting(_loc1_);
   loadMap(_loc4_,_loc3_);
   currentDepth = "guard";
   return _loc2_;
}
function guardMapBtnWork(guardMapBtnName)
{
   clearMarkers(markerO.container);
   var _loc2_ = "";
   var _loc1_ = guardMapBtnName.split("_");
   _loc2_ = _loc1_[1];
   _loc2_ = _loc2_ + "\t";
   _loc2_ = _loc2_ + _loc1_[2];
   _loc2_ = _loc2_ + "\t";
   _loc2_ = _loc2_ + _loc1_[3];
   world = _loc1_[1];
   guard = _loc1_[2];
   section = _loc1_[3];
   var _loc3_ = _loc1_[1] + "_" + _loc1_[2] + "_" + _loc1_[3];
   var _loc4_ = changeMapNumberToSting(_loc1_);
   container_mc.guard_mc.container_mc.depth3_mc._visible = true;
   container_mc.guard_mc.container_mc.depth3_mc.contents_mc.gotoAndStop(Number(_loc1_[3]) - container_mc.guard_mc.startSectionNumbering + 1);
   currentDepth = "section";
   trace("섹션맵으로 변경되었음currentDepth = " + currentDepth);
   markerO.container = container_mc.guard_mc.container_mc.depth3_mc.contents_mc.marker_mc;
   container_mc.guard_mc.container_mc.depth3_mc.contents_mc.mapTitle.textColor = lib.info.TextColor.WORLDMAP_SECTION_TITLE;
   ToGame_WorldMap_RequestMapInit(_loc3_);
   return _loc2_;
}
function sectionMapBtnWork(sectionMapBtnName)
{
   clearMarkers(markerO.container);
   var _loc2_ = "";
   var _loc1_ = sectionMapBtnName.split("_");
   _loc2_ = _loc1_[1];
   _loc2_ = _loc2_ + "\t";
   _loc2_ = _loc2_ + _loc1_[2];
   world = _loc1_[1];
   guard = _loc1_[2];
   section = _loc1_[3];
   var _loc3_ = _loc1_[1] + "_" + _loc1_[2] + "_" + _loc1_[3];
   var _loc4_ = changeMapNumberToSting(_loc1_);
   loadMap(_loc4_,_loc3_,_loc1_[3]);
   currentDepth == "section";
   return _loc2_;
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
   container_mc.guard_mc.zoomO.onMouseWheel(1);
}
function loadMap(url, mapName, sectionNum)
{
   Mouse.removeListener(mouseListener);
   var _loc1_ = new Object();
   var _loc2_ = new MovieClipLoader();
   _loc1_.onLoadInit = function(target)
   {
      if(sectionNum != undefined)
      {
         currentDepth = "section";
         inItSectionMap(mapName,sectionNum);
      }
      else
      {
         currentDepth = "guard";
         markerO.container = container_mc.marker_mc;
         container_mc.guard_mc.container_mc.depth2_mc.mapTitle.textColor = lib.info.TextColor.WORLDMAP_GUARD_TITLE;
         ToGame_WorldMap_RequestMapInit(mapName);
      }
      noClickerWork();
   };
   _loc2_.addListener(_loc1_);
   _loc2_.loadClip(url,container_mc.guard_mc);
}
function inItSectionMap(mapNum, sectionNum)
{
   container_mc.guard_mc._visible = false;
   UI.onEnterFrame = function()
   {
      if(container_mc.guard_mc.container_mc.depth3_mc.contents_mc)
      {
         ToGame_WorldMap_RequestMapInit(mapNum);
         container_mc.guard_mc.container_mc.depth3_mc.contents_mc.gotoAndStop(Number(sectionNum) - container_mc.guard_mc.startSectionNumbering + 1);
         markerO.container = container_mc.guard_mc.container_mc.depth3_mc.contents_mc.marker_mc;
         container_mc.guard_mc.container_mc.depth3_mc.contents_mc.mapTitle.textColor = lib.info.TextColor.WORLDMAP_SECTION_TITLE;
         container_mc.guard_mc.container_mc.depth3_mc._visible = true;
         container_mc.guard_mc._visible = true;
         delete this.onEnterFrame;
      }
   };
}
function showMessage(type)
{
   container_mc.message_mc._visible = true;
   container_mc.message_mc.gotoAndPlay(2);
   if(type == 1)
   {
      container_mc.message_mc.mc.txt.text = lib.util.UIString.getUIString("$241200");
      container_mc.message_mc.mc.txt.textColor = lib.info.TextColor.CHAT_SYSTEM_WARNING;
   }
   thisMapMessage = type;
}
function ToGame_WorldMap_RequestMapInit(mapName)
{
   getURL("FSCommand:ToGame_WorldMap_RequestMapInit",mapName);
   trace("ToGame_WorldMap_RequestMapInit : " + mapName);
   _root.debug3.text = "[월드맵]맵로드다됏으니 세팅해주세요. mapNum: " + mapName + "\r" + _root.debug3.text;
   myListener.OnGame_WorldMap_SetMode(mapMode);
   var _loc2_ = mapName.split("_");
   if(_loc2_.length == 1)
   {
      world = _loc2_[0];
      guard = null;
      section = null;
   }
   else if(_loc2_.length == 2)
   {
      world = _loc2_[0];
      guard = _loc2_[1];
      section = null;
   }
   else if(_loc2_.length == 3)
   {
      world = _loc2_[0];
      guard = _loc2_[1];
      section = _loc2_[2];
   }
}
function changeMapNumberToSting(numberArray)
{
   var _loc3_ = numberArray[1];
   var _loc2_ = numberArray[2];
   var _loc4_ = numberArray[3];
   var _loc1_ = new String();
   if(isNaN(_loc4_))
   {
      trace("현재클릭한 버튼은 가드맵이미지버튼입니다.");
      _loc1_ = "GuardMap_" + worldName_array[_loc3_ - 1] + "_" + guardName_array[_loc2_ - 1];
   }
   else
   {
      _loc1_ = "GuardMap_" + worldName_array[_loc3_ - 1] + "_" + guardName_array[_loc2_ - 1];
      isSectionLoad = true;
   }
   trace("맵이름 = " + _loc1_);
   return "/package/S1UI_" + _loc1_ + "/" + _loc1_ + ".swf";
}
function closeUI()
{
   fscommand("ToGame_WorldMap_CloseUI");
   _root.BaseUIListener.OnGameEventShowUI("WorldMap",0);
}
function gotoUp()
{
   if(currentDepth != "world")
   {
      if(currentDepth == "guard")
      {
         myListener.OnGame_WorldMap_SetMap(world);
         getURL("FSCommand:map =",world);
      }
      else if(currentDepth == "section")
      {
         myListener.OnGame_WorldMap_SetMap(world + "_" + guard);
         getURL("FSCommand:map =",world + "_" + guard);
      }
   }
}
function ToGame_BattleFieldMap_Resurrect(markerId)
{
   getURL("FSCommand:ToGame_BattleFieldMap_Resurrect",markerId);
   trace("ToGame_BattleFieldMap_Resurrect : " + markerId);
}
function ToGame_TransferVehicle_SelectDestination(markerId)
{
   getURL("FSCommand:ToGame_TransferVehicle_SelectDestination",markerId);
   trace("ToGame_TransferVehicle_SelectDestination : " + markerId);
}
function ToGame_TeleportToCamp_SelectDestination(markerId)
{
   getURL("FSCommand:ToGame_TeleportToCamp_SelectDestination",markerId);
   trace("ToGame_TeleportToCamp_SelectDestination : " + markerId);
}
var UI = this;
UI._visible = false;
var UIname = "WorldMap";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
preload._visible = false;
container_mc.range_mc._visible = false;
container_mc.agitToolTip_mc._visible = false;
container_mc.message_mc._visible = false;
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var notExploredStr = lib.util.UIString.getUIString("$241006");
var notSelectedStr = lib.util.UIString.getUIString("$241201");
var i = 0;
while(i < 30)
{
   lib.info.TextColor.setWorldMapTextColor(0,"world",container_mc["worldText_1_" + i]);
   i++;
}
container_mc.frame_mc.hitTestDisable = false;
var myMarkerId = null;
this.bWidgetOpen = false;
var world = 1;
var guard = null;
var section = null;
var currentDepth = "world";
var sectionMapX = 0;
var sectionMapY = 0;
var markerContainerXY = {x:container_mc.marker_mc._x,y:container_mc.marker_mc._y};
var isSectionLoad = false;
var mouseListener;
var myListener = new Object();
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
         if(thisMapMessage == 1)
         {
            showMessage(1);
         }
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   _global.gbUIMode = bShow;
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
      myListener.OnGame_WorldMap_SetSparkle(myMarkerId);
   }
   else
   {
      UI._visible = false;
   }
};
container_mc.noClicker.useHandCursor = false;
var mapMode = 0;
myListener.OnGame_WorldMap_SetMode = function(mode)
{
   mode = Number(mode);
   _root.debug3.text = "[월드맵 모드세팅] 모드 = " + mode + "\r" + _root.debug3.text;
   mapMode = mode;
   thisMapMessage = null;
   clearMarkers(markerO.container);
   clearLine();
   clearCommanderInfo();
   clearComboBox();
   container_mc.agitToolTip_mc._visible = false;
   container_mc.upDepth_btn._visible = false;
   container_mc.message_mc._visible = false;
   if(mode == 0)
   {
      container_mc.title_txt.text = "$241001";
      gotoUpDepth_btn.setVisible(true);
      container_mc.comboBox1_mc._visible = true;
      container_mc.comboBox2_mc._visible = true;
      container_mc.upDepth_btn._visible = true;
   }
   else if(mode == 1)
   {
      container_mc.title_txt.text = "$241002";
      gotoUpDepth_btn.setVisible(false);
      container_mc.comboBox1_mc._visible = false;
      container_mc.comboBox2_mc._visible = false;
   }
   else if(mode == 2)
   {
      container_mc.title_txt.text = "$241003";
      gotoUpDepth_btn.setVisible(false);
      container_mc.comboBox1_mc._visible = false;
      container_mc.comboBox2_mc._visible = false;
   }
   else if(mode == 3)
   {
      container_mc.title_txt.text = "$241004";
      gotoUpDepth_btn.setVisible(false);
      container_mc.comboBox1_mc._visible = false;
      container_mc.comboBox2_mc._visible = true;
   }
   else if(mode == 4)
   {
      container_mc.title_txt.text = "$241005";
      gotoUpDepth_btn.setVisible(false);
      container_mc.comboBox1_mc._visible = false;
      container_mc.comboBox2_mc._visible = false;
   }
   noClickerWork();
};
myListener.OnGame_WorldMap_SetEnableUpDepthBtn = function(bTrue)
{
   bTrue = Number(bTrue);
   gotoUpDepth_btn.setEnabled(bTrue);
};
var skillMaker = new lib.util.McMaker();
var clickedSkillId = null;
var mouseO;
var coolTime;
var coolTimeTotal;
var skillActive = true;
var clickCommanderSkill = false;
myListener.OnGame_BattleFieldMap_SetCommanderSkillSlot = function(dataList)
{
   clearCommanderInfo();
   if(mapMode == 1)
   {
      var _loc5_ = dataList.split("\n");
      if(_loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
      {
         _loc5_.splice(_loc5_.length - 1,1);
      }
      skillMaker.createMovie("commander",container_mc.commander_mc,"commander",0,0,_loc5_.length,1,0,0,0);
      container_mc.commander_mc._xscale = container_mc.commander_mc._yscale = 120;
      var _loc3_ = 0;
      while(_loc3_ < _loc5_.length)
      {
         var _loc4_ = _loc5_[_loc3_].split("\t");
         if(_loc4_.length != 1)
         {
            var _loc2_ = container_mc.commander_mc["commander" + _loc3_];
            _loc2_.Count.txt.textAutoSize = "shrink";
            _loc2_.CoolTime._visible = false;
            _loc2_.stat = _loc3_;
            _loc2_.img = _loc4_[1];
            _loc2_.id = _loc4_[0];
            _loc2_.radius = _loc4_[2];
            _loc2_.onEnterFrame = function()
            {
               if(this.drag)
               {
                  this.draw(this.img);
                  this.drag = false;
                  lib.manager.ToolTip.add(this.SLOT,this.stat,6,this.Icon);
                  delete this.onEnterFrame;
               }
            };
            _loc2_.onRelease2 = function()
            {
               if(skillActive)
               {
                  for(skill in container_mc.commander_mc)
                  {
                     if(typeof container_mc.commander_mc[skill] == "movieclip")
                     {
                        var _loc2_ = container_mc.commander_mc[skill];
                        if(_loc2_.id == clickedSkillId)
                        {
                           _loc2_.active = false;
                           break;
                        }
                     }
                  }
                  clickedSkillId = this.id;
                  this.active = true;
                  if(this.radius != "SCAN")
                  {
                     container_mc.range_mc._width = container_mc.range_mc._height = this.radius * 2;
                     container_mc.range_mc.onEnterFrame = function()
                     {
                        container_mc.range_mc._visible = true;
                        this._x = container_mc._xmouse - this._width / 2;
                        this._y = container_mc._ymouse - this._height / 2;
                     };
                     clickCommanderSkill = true;
                     ToGame_BattleFieldMap_PrepareCommanderSkill(clickedSkillId);
                  }
                  else
                  {
                     container_mc.range_mc._visible = false;
                     delete container_mc.range_mc.onEnterFrame;
                     container_mc.scan_mc.attachMovie("scan","scan",1);
                     ToGame_BattleFieldMap_UseCommanderSkill(clickedSkillId,container_mc._xmouse - 20,container_mc._ymouse - 128.4);
                  }
               }
            };
         }
         _loc3_ = _loc3_ + 1;
      }
   }
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(_global.control)
   {
      if(container_mc._xmouse >= 20 && container_mc._xmouse < 1044 && container_mc._ymouse >= 128.4 && container_mc._ymouse < 896.4)
      {
         var _loc3_ = world;
         if(guard != "" && guard != null && guard != "null" && guard != "undefined" && guard != undefined)
         {
            _loc3_ = _loc3_ + ("_" + guard);
         }
         if(section != "" && section != null && section != "null" && section != "undefined" && section != undefined)
         {
            _loc3_ = _loc3_ + ("_" + section);
         }
         _loc3_ = _loc3_ + ("@" + (container_mc._xmouse - 20) + "@" + (container_mc._ymouse - 128.4));
         _root.ToGame_CTRLMouseDown("WorldMap",_loc3_);
      }
   }
   else if(clickCommanderSkill)
   {
      if(container_mc._xmouse >= 20 && container_mc._xmouse < 1044 && container_mc._ymouse >= 128.4 && container_mc._ymouse < 896.4)
      {
         ToGame_BattleFieldMap_UseCommanderSkill(clickedSkillId,container_mc._xmouse - 20,container_mc._ymouse - 128.4);
         delete container_mc.range_mc.onEnterFrame;
         container_mc.range_mc._visible = false;
         clickCommanderSkill = false;
      }
   }
};
var coolTimer;
myListener.OnGame_BattleFieldMap_SetCommanderSkillCoolTime = function(remain)
{
   coolTime = Number(remain);
   coolTimeTotal = Number(remain);
   if(coolTime <= 0)
   {
      coolTime = 0;
      skillActive = true;
      for(skill in container_mc.commander_mc)
      {
         if(typeof container_mc.commander_mc[skill] == "movieclip")
         {
            var mc = container_mc.commander_mc[skill];
            mc.cool.remove();
            delete mc.cool;
            mc.CoolTime._visible = false;
            mc.Count.txt.text = "";
         }
      }
   }
   else
   {
      skillActive = false;
      for(skill in container_mc.commander_mc)
      {
         if(typeof container_mc.commander_mc[skill] == "movieclip")
         {
            var mc = container_mc.commander_mc[skill];
            mc.CoolTime._visible = true;
            mc.cool = new lib.util.CoolTime(coolTime,coolTime);
            mc.cool.target = mc;
            mc.cool.onTick = function()
            {
               this.target.Count.txt.text = this.getCountText();
               lib.util.CoolTime.draw(this.target.CoolTime,50,50,this.getDgree(),0,60);
            };
            mc.cool.onFinished = function()
            {
               this.target.Count.txt.text = "0";
               delete mc.cool;
            };
         }
      }
   }
};
var comboBox1Maker = new lib.util.McMaker();
var comboBox2Maker = new lib.util.McMaker();
var guardStates;
var sectionStates;
var comboBox1Tween;
var comboBox2Tween;
var firstComboBox1Data = true;
var firstComboBox2Data = true;
container_mc.comboBox1_mc.opened = false;
container_mc.comboBox2_mc.opened = false;
myListener.OnGame_WorldMap_SetComboBox = function(guardInfo, sectionInfo)
{
   clearComboBox();
   var _loc7_ = guardInfo.split("\n");
   if(_loc7_[_loc7_.length - 1] == "undefined" || _loc7_[_loc7_.length - 1] == "")
   {
      _loc7_.splice(_loc7_.length - 1,1);
   }
   if(guardInfo != "" && guardInfo != "null" && guardInfo != "undefined" && guardInfo != undefined)
   {
      comboBox1Maker.createMovie("comboBoxSlot",container_mc.comboBox1_mc.sub_mc.contents_mc.content_mc,"comboBox1Sub",0,0,1,_loc7_.length,0,0,0);
   }
   _root.debug3.text = "[월드맵 가드콤보박스]" + _loc7_.join("\n") + "\r" + _root.debug3.text;
   container_mc.comboBox1_mc.sub_mc.scroller.__height = container_mc.comboBox1_mc.sub_mc.contents_mc.content_mc._height;
   var _loc4_ = 0;
   while(_loc4_ < _loc7_.length)
   {
      var _loc3_ = _loc7_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         if(_loc4_ == 0)
         {
            container_mc.comboBox1_mc.selected_txt.text = _loc3_[1];
         }
         var _loc5_ = container_mc.comboBox1_mc.sub_mc.contents_mc.content_mc["comboBox1Sub" + _loc4_];
         _loc5_.id = _loc3_[0];
         _loc5_.text_txt.text = _loc3_[1];
         if(_loc3_[2] == 1)
         {
            if(_loc4_ == 0)
            {
               container_mc.comboBox1_mc.selected_txt.text = notExploredStr;
               container_mc.comboBox1_mc.selected_txt.textColor = lib.info.TextColor.GENERAL_DISABLE;
            }
            _loc5_ = container_mc.comboBox1_mc.sub_mc.contents_mc.content_mc["comboBox1Sub" + _loc4_];
            _loc5_.id = _loc3_[0];
            _loc5_.text_txt.text = notExploredStr;
            _loc5_.text_txt.textColor = lib.info.TextColor.GENERAL_DISABLE;
         }
         else if(_loc3_[2] == 2)
         {
            if(_loc4_ == 0)
            {
               container_mc.comboBox1_mc.selected_txt.text = notSelectedStr;
               container_mc.comboBox1_mc.selected_txt.textColor = lib.info.TextColor.GENERAL_DISABLE;
            }
         }
         if(_loc3_[2] != 1)
         {
            _loc5_.onRollOver = function()
            {
               this.effect_mc.gotoAndPlay("over");
            };
            _loc5_.onRollOut = _loc5_.onReleaseOutside = function()
            {
               this.effect_mc.gotoAndPlay("out");
            };
            _loc5_.onRelease = function()
            {
               myListener.OnGame_WorldMap_SetMap(this.id);
            };
         }
      }
      _loc4_ = _loc4_ + 1;
   }
   if(firstComboBox1Data)
   {
      container_mc.comboBox1_mc.sub_mc._y = container_mc.comboBox1_mc.sub_mc._y - container_mc.comboBox1_mc.sub_mc.contents_mc.content_mc._height;
      container_mc.comboBox1_mc.opened = false;
      firstComboBox1Data = false;
   }
   container_mc.comboBox1_mc.open_btn.onRollOver = function()
   {
      this._parent.arrow_mc.gotoAndStop(2);
   };
   container_mc.comboBox1_mc.open_btn.onRollOut = container_mc.comboBox1_mc.open_btn.onReleaseOutside = function()
   {
      this._parent.arrow_mc.gotoAndStop(1);
   };
   container_mc.comboBox1_mc.open_btn.onPress = function()
   {
      this._parent.arrow_mc.gotoAndStop(3);
   };
   container_mc.comboBox1_mc.open_btn.onRelease = function()
   {
      this._parent.arrow_mc.gotoAndStop(2);
      if(container_mc.comboBox1_mc.opened)
      {
         container_mc.comboBox1_mc.opened = false;
         comboBox1Tween = new mx.transitions.Tween(container_mc.comboBox1_mc.sub_mc,"_y",mx.transitions.easing.Strong.easeOut,container_mc.comboBox1_mc.sub_mc._y,- container_mc.comboBox1_mc.sub_mc._height,10,false);
      }
      else
      {
         container_mc.comboBox1_mc.opened = true;
         comboBox1Tween = new mx.transitions.Tween(container_mc.comboBox1_mc.sub_mc,"_y",mx.transitions.easing.Strong.easeOut,container_mc.comboBox1_mc.sub_mc._y,23,10,false);
         if(container_mc.comboBox2_mc.opened)
         {
            container_mc.comboBox2_mc.open_btn.onRelease();
         }
      }
   };
   var _loc6_ = sectionInfo.split("\n");
   if(_loc6_[_loc6_.length - 1] == "undefined" || _loc6_[_loc6_.length - 1] == "")
   {
      _loc6_.splice(_loc6_.length - 1,1);
   }
   if(sectionInfo != "" && sectionInfo != "null" && sectionInfo != "undefined" && sectionInfo != undefined)
   {
      comboBox2Maker.createMovie("comboBoxSlot",container_mc.comboBox2_mc.sub_mc.contents_mc.content_mc,"comboBox2Sub",0,0,1,_loc6_.length,0,0,0);
   }
   _root.debug3.text = "[월드맵 가드콤보박스]" + _loc6_.join("\n") + "\r" + _root.debug3.text;
   container_mc.comboBox2_mc.sub_mc.scroller.__height = container_mc.comboBox2_mc.sub_mc.contents_mc.content_mc._height;
   _loc4_ = 0;
   while(_loc4_ < _loc6_.length)
   {
      _loc3_ = _loc6_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         if(_loc4_ == 0)
         {
            container_mc.comboBox2_mc.selected_txt.text = _loc3_[1];
         }
         _loc5_ = container_mc.comboBox2_mc.sub_mc.contents_mc.content_mc["comboBox2Sub" + _loc4_];
         _loc5_.id = _loc3_[0];
         _loc5_.text_txt.text = _loc3_[1];
         if(_loc3_[2] == 1)
         {
            if(_loc4_ == 0)
            {
               container_mc.comboBox2_mc.selected_txt.text = notExploredStr;
               container_mc.comboBox2_mc.selected_txt.textColor = lib.info.TextColor.GENERAL_DISABLE;
            }
            _loc5_ = container_mc.comboBox2_mc.sub_mc.contents_mc.content_mc["comboBox2Sub" + _loc4_];
            _loc5_.id = _loc3_[0];
            _loc5_.text_txt.text = notExploredStr;
            _loc5_.text_txt.textColor = lib.info.TextColor.GENERAL_DISABLE;
         }
         else if(_loc3_[2] == 2)
         {
            if(_loc4_ == 0)
            {
               container_mc.comboBox2_mc.selected_txt.text = notSelectedStr;
               container_mc.comboBox2_mc.selected_txt.textColor = lib.info.TextColor.GENERAL_DISABLE;
            }
         }
         if(_loc3_[2] != 1)
         {
            _loc5_.onRollOver = function()
            {
               this.effect_mc.gotoAndPlay("over");
            };
            _loc5_.onRollOut = _loc5_.onReleaseOutside = function()
            {
               this.effect_mc.gotoAndPlay("out");
            };
            _loc5_.onRelease = function()
            {
               if(mapMode == 0)
               {
                  myListener.OnGame_WorldMap_SetMap(this.id);
               }
               else if(mapMode == 3)
               {
                  ToGame_AgitMap_RequestSortSize(this.id);
               }
            };
         }
      }
      _loc4_ = _loc4_ + 1;
   }
   if(firstComboBox2Data)
   {
      container_mc.comboBox2_mc.sub_mc._y = container_mc.comboBox2_mc.sub_mc._y - container_mc.comboBox2_mc.sub_mc.contents_mc.content_mc._height;
      container_mc.comboBox2_mc.opened = false;
      firstComboBox2Data = false;
   }
   container_mc.comboBox2_mc.open_btn.onRollOver = function()
   {
      this._parent.arrow_mc.gotoAndStop(2);
   };
   container_mc.comboBox2_mc.open_btn.onRollOut = container_mc.comboBox2_mc.open_btn.onReleaseOutside = function()
   {
      this._parent.arrow_mc.gotoAndStop(1);
   };
   container_mc.comboBox2_mc.open_btn.onPress = function()
   {
      this._parent.arrow_mc.gotoAndStop(3);
   };
   container_mc.comboBox2_mc.open_btn.onRelease = function()
   {
      this._parent.arrow_mc.gotoAndStop(2);
      if(container_mc.comboBox2_mc.opened)
      {
         container_mc.comboBox2_mc.opened = false;
         comboBox2Tween = new mx.transitions.Tween(container_mc.comboBox2_mc.sub_mc,"_y",mx.transitions.easing.Strong.easeOut,container_mc.comboBox2_mc.sub_mc._y,- container_mc.comboBox2_mc.sub_mc._height,10,false);
      }
      else
      {
         container_mc.comboBox2_mc.opened = true;
         comboBox2Tween = new mx.transitions.Tween(container_mc.comboBox2_mc.sub_mc,"_y",mx.transitions.easing.Strong.easeOut,container_mc.comboBox2_mc.sub_mc._y,23,10,false);
         if(container_mc.comboBox1_mc.opened)
         {
            container_mc.comboBox1_mc.open_btn.onRelease();
         }
      }
   };
};
myListener.OnGame_AgitMap_SetComboBox = function(dataList)
{
   myListener.OnGame_WorldMap_SetComboBox("",dataList);
};
myListener.OnGame_WorldMap_RotateCamera = function(degree)
{
   me.sight._rotation = Number(degree);
};
var markerO = new Object();
markerO.cnt = 0;
markerO.totalCnt = 0;
markerO.scale = 100;
markerO.container = container_mc.marker_mc;
var me = null;
myListener.OnGame_WorldMap_AddMarker = function(markerId, markerType, desc, x, y)
{
   _root.debug3.text = "[마커찍기]OnGame_WorldMap_AddMarker.  markerId: " + markerId + "markerType: " + markerType + ", x: " + x + ", y:+" + y + "\r" + _root.debug3.text;
   if(mapMode == 0 && markerType <= 199)
   {
      addMarker(markerId,markerType,desc,x,y);
   }
   else if(mapMode == 1 && (markerType == 1 || markerType >= 200 && markerType <= 399))
   {
      addMarker(markerId,markerType,desc,x,y);
   }
   else if(mapMode == 2 && markerType >= 400 && markerType <= 599)
   {
      if(markerType == 400)
      {
         markerO.startingPoint = {x:x,y:y};
      }
      else if(markerType == 401)
      {
         var _loc4_ = container_mc.line_mc.createEmptyMovieClip("line" + markerId,container_mc.line_mc.getNextHighestDepth());
         _loc4_._alpha = 50;
         _loc4_.lineStyle(3,16764006,100);
         _loc4_.moveTo(markerO.startingPoint.x,markerO.startingPoint.y);
         _loc4_.lineTo(x,y);
      }
      addMarker(markerId,markerType,desc,x,y);
   }
   else if(mapMode == 3 && markerType >= 600 && markerType <= 799)
   {
      addMarker(markerId,markerType,desc,x,y);
   }
   else if(mapMode == 4 && markerType >= 800 && markerType <= 899)
   {
      if(markerType == 800)
      {
         markerO.startingPoint = {x:x,y:y};
      }
      else if(markerType == 801)
      {
         _loc4_ = container_mc.line_mc.createEmptyMovieClip("line" + markerId,container_mc.line_mc.getNextHighestDepth());
         _loc4_._alpha = 50;
         _loc4_.lineStyle(3,16764006,100);
         _loc4_.moveTo(markerO.startingPoint.x,markerO.startingPoint.y);
         _loc4_.lineTo(x,y);
      }
      addMarker(markerId,markerType,desc,x,y);
   }
};
myListener.OnGame_WorldMap_RemoveMarker = function(markerId)
{
   var _loc1_ = searchMarker(markerO.container,"id",markerId)[0];
   lib.manager.ToolTip.remove(_loc1_);
   if(_loc1_)
   {
      markerO.cnt--;
      removeMovieClip(_loc1_);
   }
};
myListener.OnGame_WorldMap_ClearMarker = function()
{
   clearMarkers(markerO.container);
   clearLine();
};
myListener.OnGame_WorldMap_SetSparkle = function(markerId)
{
   var _loc1_ = searchMarker(markerO.container,"id",markerId)[0];
   if(_loc1_)
   {
      _loc1_.gotoAndStop(2);
   }
};
myListener.OnGame_WorldMap_UpdateMarker = function(markerId, x, y, rotation)
{
   var _loc1_ = searchMarker(markerO.container,"id",markerId)[0];
   if(_loc1_)
   {
      _loc1_._x = x;
      _loc1_._y = y;
      if(rotation != undefined && rotation != "undefined")
      {
         _loc1_._rotation = rotation;
      }
   }
};
myListener.OnGame_WorldMap_SetExplored = function(sectorNumList)
{
   var _loc6_ = sectorNumList.split("\n");
   var _loc4_ = 0;
   while(_loc4_ < _loc6_.length)
   {
      var _loc2_ = _loc6_[_loc4_].split("\t");
      if(_loc2_.length != 1)
      {
         var _loc3_ = undefined;
         var _loc5_ = undefined;
         if(currentDepth == "guard")
         {
            _loc3_ = container_mc.guard_mc.container_mc.depth2_mc["fog_" + _loc2_[0]];
            _loc5_ = container_mc.guard_mc.container_mc.depth2_mc["over_" + _loc2_[0]];
            txt = container_mc.guard_mc.container_mc.depth2_mc["guardText_" + _loc2_[0]];
         }
         else if(currentDepth == "section")
         {
            _loc3_ = container_mc.guard_mc.container_mc.depth3_mc.contents_mc["fog_" + _loc2_[0]];
         }
         trace("현재뎁스 = " + currentDepth + ", 지역은 =" + _loc2_[0] + ", 탐험지역1비탐험0 = " + _loc2_[1]);
         _root.debug3.text = "[월드맵 탐험정보] 지역은: " + _loc2_[0] + "탐험여부: " + _loc2_[1] + "\r" + _root.debug3.text;
         if(_loc2_[1] == "0")
         {
            _loc3_._visible = true;
            _loc5_._visible = false;
         }
         else
         {
            _loc3_._visible = false;
            _loc5_._visible = true;
            lib.info.TextColor.setWorldMapTextColor(1,"guard",txt);
         }
      }
      _loc4_ = _loc4_ + 1;
   }
};
worldMapBtnEnable();
myListener.OnGame_WorldMap_SetMap = function(mapNumber)
{
   mapNumber = String(mapNumber);
   clearMarkers(markerO.container);
   clearLine();
   clearCommanderInfo();
   clearComboBox();
   container_mc.agitToolTip_mc._visible = false;
   noClickerWork();
   thisMapMessage = null;
   var _loc1_ = mapNumber.split("_");
   if(_loc1_.length == 1)
   {
      Mouse.removeListener(mouseListener);
      unloadMovie(container_mc.guard_mc);
      world = 1;
      guard = null;
      section = null;
      currentDepth = "world";
      markerO.container = container_mc.marker_mc;
      ToGame_WorldMap_RequestMapInit("1");
   }
   else if(_loc1_.length == 2)
   {
      if(currentDepth == "world")
      {
         worldMapBtnWork("over_" + mapNumber);
      }
      else if(currentDepth == "guard" || currentDepth == "section")
      {
         if(guard == _loc1_[1])
         {
            container_mc.guard_mc.container_mc.depth3_mc._visible = false;
            container_mc.guard_mc.container_mc.depth3_mc.contents_mc.gotoAndStop(container_mc.guard_mc.container_mc.depth3_mc.contents_mc._totalframes);
            markerO.container = container_mc.marker_mc;
            sectionMapX = sectionMapY = 0;
            container_mc.guard_mc.scale = 100;
            resetSectionMap();
            ToGame_WorldMap_RequestMapInit(_loc1_[0] + "_" + _loc1_[1]);
            container_mc.guard_mc.container_mc.depth2_mc.mapTitle.textColor = lib.info.TextColor.WORLDMAP_GUARD_TITLE;
         }
         else
         {
            worldMapBtnWork("over_" + mapNumber);
         }
      }
      currentDepth = "guard";
   }
   else if(_loc1_.length == 3)
   {
      if(currentDepth == "world")
      {
         sectionMapBtnWork("over_" + mapNumber);
         trace("월드에서-->섹션으로");
      }
      else if(currentDepth == "guard")
      {
         if(guard == _loc1_[1])
         {
            container_mc.guard_mc.container_mc.depth3_mc._visible = true;
            container_mc.guard_mc.container_mc.depth3_mc.contents_mc.gotoAndStop(Number(_loc1_[2]) - container_mc.guard_mc.startSectionNumbering + 1);
            markerO.container = container_mc.guard_mc.container_mc.depth3_mc.contents_mc.marker_mc;
            container_mc.guard_mc.container_mc.depth3_mc.contents_mc.mapTitle.textColor = lib.info.TextColor.WORLDMAP_SECTION_TITLE;
            ToGame_WorldMap_RequestMapInit(_loc1_[0] + "_" + _loc1_[1] + "_" + _loc1_[2]);
         }
         else
         {
            sectionMapBtnWork("over_" + mapNumber);
         }
      }
      else if(currentDepth == "section")
      {
         if(guard == _loc1_[1])
         {
            var _loc3_ = Number(_loc1_[2]) - container_mc.guard_mc.startSectionNumbering + 1;
            container_mc.guard_mc.container_mc.depth3_mc.contents_mc.gotoAndStop(_loc3_);
            container_mc.guard_mc.container_mc.depth3_mc.contents_mc.mapTitle.textColor = lib.info.TextColor.WORLDMAP_SECTION_TITLE;
            ToGame_WorldMap_RequestMapInit(_loc1_[0] + "_" + _loc1_[1] + "_" + _loc1_[2]);
         }
         else
         {
            sectionMapBtnWork("over_" + mapNumber);
         }
      }
      currentDepth = "section";
   }
};
var thisMapMessage = null;
var worldName_array = new Array("1");
var guardName_array = new Array("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25");
var i = 0;
while(i < 200)
{
   guardName_array[i] = String(i + 1);
   i++;
}
var sectionName_array = new Array("s1","s2","s3","s4","s5","s6","s7","s8","s9","s10","s11");
_global.EventBroadCaster.addListener(myListener);
var gotoUpDepth_btn = new lib.util.TxtBtn(container_mc.gotoUpDepth_mc,container_mc.gotoUpDepth_txt);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
gotoUpDepth_btn.setRelease(gotoUp);
x_btn.setRelease(closeUI);
myListener.OnGame_WorldMap_SetMode(0);
fscommand("ToGame_WorldMap_Init");
