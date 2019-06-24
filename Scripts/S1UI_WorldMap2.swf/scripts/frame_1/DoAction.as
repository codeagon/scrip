function ToGame_WorldMap_ClickShowGuardInfoBtn()
{
   fscommand("ToGame_WorldMap_ClickShowGuardInfoBtn");
}
function setVisibleBottomInfo()
{
   var _loc1_ = 0;
   if(closeLock)
   {
      _loc1_ = 1;
   }
   else if(bVisibleFieldEvent)
   {
      _loc1_ = 2;
   }
   else if(0 < numberCount && false == deleteLock)
   {
      _loc1_ = 3;
   }
   var _loc2_ = 0;
   switch(_loc1_)
   {
      case 1:
         _loc2_ = 36;
         break;
      case 2:
         _loc2_ = 68;
         break;
      case 3:
         _loc2_ = 63;
   }
   var _loc3_ = !closeLock?bVisibleFieldEvent:false;
   var _loc4_ = !closeLock?false == bVisibleFieldEvent && 0 < numberCount:false;
   container_mc.fieldEventMc._visible = _loc1_ == 2;
   container_mc.notice_mc._visible = _loc1_ == 3;
   setResize2(_loc2_);
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
function addNumber(questId, id, leftMargin, topMargin, res, posX, posY, number, tooltipStr)
{
   var _loc5_ = container_mc.marker_mc.num;
   var _loc3_ = _loc5_.createEmptyMovieClip(id,_loc5_.getNextHighestDepth());
   var _loc2_ = _loc3_.attachMovie("number","number",_loc3_.getNextHighestDepth());
   _loc2_._x = _loc2_._x + leftMargin;
   _loc2_._y = _loc2_._y + topMargin;
   _loc2_.textFd._x = -1 * leftMargin - 16;
   _loc2_.textFd._y = -1 * topMargin - 11;
   _loc2_.textFd.htmlText = number;
   _loc2_.textFd.textAutoSize = "shrink";
   _loc2_.bg.hitTestDisable = true;
   if(questId != undefined && questId != "" && questId != null && questId != "undefined" && questId != "0" && questId != "-1")
   {
      _loc2_.textFd.textColor = "0xFFFFFF";
      _loc2_.questId = questId;
      _loc2_.MDRNAME = "number";
      _loc3_.questId = questId;
      _loc3_.MDRNAME = "number";
      numberCount++;
      setVisibleBottomInfo();
   }
   lib.util.DrawBitmap.draw(_loc2_.bg,res);
   _loc3_._x = posX;
   _loc3_._y = posY;
   _loc3_.id = id;
   lib.manager.ToolTip.add(_loc3_,tooltipStr,1);
   _loc3_.onRollOver = function()
   {
      markerOver(this);
   };
   marker_array.push(_loc3_);
}
function updateNumber(questId, id, number, x, y, tooltipStr)
{
   var _loc1_ = searchMarker(id);
   var _loc2_ = _loc1_.number;
   _loc2_.textFd.htmlText = number;
   if(_loc1_.MDRNAME == "number")
   {
      _loc2_.textFd.textColor = "0xFFFFFF";
   }
   _loc1_._x = x;
   _loc1_._y = y;
}
function markerOver(target)
{
   target.swapDepths(target._parent.getNextHighestDepth());
}
function transferEndMarker(marker)
{
   marker.onRollOver = function()
   {
      this.out._visible = false;
      this.over._visible = true;
      markerOver(this);
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
      this.out._visible = true;
      this.over._visible = false;
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
      lib.manager.UISound.play(lib.manager.UISound.MAP_BTN);
      ToGame_WorldMap_RespondCommand(this.clickId);
   };
}
function searchMarker(identifier, bRemove)
{
   var _loc3_ = null;
   var _loc2_ = null;
   var _loc1_ = 0;
   while(_loc1_ < marker_array.length)
   {
      if(marker_array[_loc1_].id == identifier)
      {
         _loc2_ = marker_array[_loc1_];
         _loc3_ = _loc1_;
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   if(bRemove)
   {
      var _loc5_ = _loc2_.markerHit;
      if(_loc5_ != undefined)
      {
         lib.manager.ToolTip.remove(_loc5_);
      }
      else
      {
         lib.manager.ToolTip.remove(_loc2_);
      }
      var _loc6_ = _loc2_.sparkle;
      if(_loc6_ != undefined)
      {
         clearSparkle(identifier,true);
      }
      if(_loc3_ != null)
      {
         marker_array.splice(_loc3_,1);
      }
      if(_loc2_.questId != undefined)
      {
         numberCount--;
      }
      setVisibleBottomInfo();
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
   for(m in container_mc.text_mc)
   {
      var _loc1_ = container_mc.text_mc[m];
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
function searchMapBtn(identifier)
{
   var _loc2_ = new Array();
   for(m in container_mc.mapBtn_mc)
   {
      var _loc1_ = container_mc.mapBtn_mc[m];
      if(typeof _loc1_ == "movieclip")
      {
         if(_loc1_.id == identifier)
         {
            _loc2_.push(_loc1_);
            return _loc2_;
         }
      }
   }
   return null;
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
function ToGame_WorldMap_RespondCommand(commandString)
{
   getURL("FSCommand:ToGame_WorldMap_RespondCommand",commandString);
}
function noClickerWork()
{
   if(mapMode != 0)
   {
      container_mc.noClicker._visible = true;
   }
   else
   {
      container_mc.noClicker._visible = false;
   }
}
function clearCommanderInfo()
{
   clickCommanderSkill = false;
   clickedSkillId = null;
   for(skill in container_mc.commander_mc)
   {
      if(typeof container_mc.commander_mc[skill] == "movieclip")
      {
         var _loc1_ = container_mc.commander_mc[skill];
         if(_loc1_.cool)
         {
            _loc1_.cool.remove();
            delete register1.cool;
         }
         _loc1_.removeMovieClip();
      }
   }
   container_mc.range_mc._visible = false;
   delete container_mc.range_mc.onEnterFrame;
}
function searchCommanderInfo(_id)
{
   var _loc2_ = false;
   for(skill in container_mc.commander_mc)
   {
      if(typeof container_mc.commander_mc[skill] == "movieclip")
      {
         var _loc1_ = container_mc.commander_mc[skill];
         if(_loc1_.id == _id)
         {
            _loc2_ = true;
         }
      }
   }
   return _loc2_;
}
function ToGame_WorldMap_RequestRemoveNumber()
{
   getURL("FSCommand:ToGame_WorldMap_RequestRemoveNumber",selectedNumberId);
   closePopup();
}
function closePopup()
{
   container_mc.popup._visible = false;
   selectedNumberId = null;
   timerId = null;
}
function SkillSet(dataList)
{
   var _loc6_ = dataList.split("\n");
   if(_loc6_[_loc6_.length - 1] == "undefined" || _loc6_[_loc6_.length - 1] == "")
   {
      _loc6_.splice(_loc6_.length - 1,1);
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc6_.length)
   {
      var _loc3_ = _loc6_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc2_ = undefined;
         var _loc7_ = searchCommanderInfo(_loc3_[0]);
         if(_loc7_)
         {
            return undefined;
         }
         _loc2_ = container_mc.commander_mc.attachMovie("commander","commander" + _loc3_[0],container_mc.commander_mc.getNextHighestDepth());
         _loc2_._width = _loc2_._height = 79;
         _loc2_._x = (_loc2_._width + 20) * _loc4_;
         _loc2_.Count.txt.textAutoSize = "shrink";
         var _loc5_ = container_mc.commander_mc.attachMovie("commander_Frame","commander_Frame" + _loc3_[0],container_mc.commander_mc.getNextHighestDepth());
         _loc5_._x = _loc2_._x;
         _loc5_._y = _loc5_._y - 3.4;
         _loc5_.hitTestDisable = true;
         _loc2_.CoolTime._visible = false;
         _loc2_.stat = _loc4_;
         _loc2_.img = _loc3_[1];
         _loc2_.id = _loc3_[0];
         _loc2_.radius = _loc3_[2];
         _loc2_.draw(_loc3_[1]);
         _loc2_.drag = false;
         var _loc8_ = _loc4_ + "\t0";
         lib.manager.ToolTip.add(_loc2_.SLOT,_loc8_,6,this.Icon);
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
            if(this.CoolTime._visible)
            {
               return undefined;
            }
            if(this.id == clickedSkillId)
            {
               this.active = false;
               this.FX_ACTIVE.gotoAndStop(1);
            }
            clickedSkillId = this.id;
            this.active = true;
            this.FX_ACTIVE.gotoAndPlay(2);
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
               ToGame_BattleFieldMap_UseCommanderSkill(clickedSkillId,container_mc._xmouse - 10,container_mc._ymouse - 79);
            }
         };
      }
      _loc4_ = _loc4_ + 1;
   }
}
function SkillCoolTimeMotion(id, remain, total)
{
   var _loc4_ = Number(remain);
   var _loc5_ = Number(total);
   var _loc2_ = container_mc.commander_mc["commander" + id];
   if(_loc2_.cool)
   {
      _loc2_.cool.remove();
      delete register2.cool;
   }
   if(_loc4_ <= 0)
   {
      _loc2_.CoolTime._visible = false;
      _loc2_.Count.txt.text = "";
      if(!_loc2_.disableSlot)
      {
         var _loc3_ = lib.util.McMaker.attach(_loc2_.EFFECT,"effect_standby",50);
         _loc3_.blendMode = "add";
         lib.util.DrawBitmap.makeMcAndDraw(_loc3_.a_mc,_loc2_.img,68,68);
         lib.util.DrawBitmap.makeMcAndDraw(_loc3_.b_mc,_loc2_.img,68,68);
         lib.util.DrawBitmap.makeMcAndDraw(_loc3_.c_mc,_loc2_.img,68,68);
      }
   }
   else
   {
      _loc2_.CoolTime._visible = true;
      _loc2_.cool = new lib.util.CoolTime(_loc4_,_loc5_);
      _loc2_.cool.target = _loc2_;
      _loc2_.cool.onTick = function()
      {
         this.target.Count.txt.text = this.getCountText();
         lib.util.CoolTime.draw(this.target.CoolTime,50,50,this.getDgree(),0,60);
      };
      _loc2_.cool.onFinished = function()
      {
         this.target.Count.txt.text = "";
         myListener.OnGame_BattleFieldMap_SetCommanderSkillCoolTime(id,0);
         delete this.cool;
      };
   }
}
function setFreeNamedInfoPos(posIndex)
{
   var _loc1_ = container_mc.freeNamed_mc;
   var _loc3_ = _loc1_.list_mc;
   if(posIndex == "1")
   {
      _loc1_._x = positions[1].x - _loc1_._width;
      _loc1_._y = positions[1].y;
   }
   else if(posIndex == "2")
   {
      _loc1_._x = positions[2].x - _loc1_._width;
      _loc1_._y = positions[2].y - _loc1_._height;
   }
   else if(posIndex == "3")
   {
      _loc1_._x = positions[3].x;
      _loc1_._y = positions[3].y - _loc1_._height;
   }
   else
   {
      _loc1_._x = positions[0].x;
      _loc1_._y = positions[0].y;
   }
}
function clearContainer(target)
{
   var _loc3_ = target._name;
   var _loc4_ = target.getDepth();
   var _loc1_ = target._parent.createEmptyMovieClip(_loc3_,_loc4_);
   if(target == container_mc.marker_mc)
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
   container_mc.marker_mc._x = markerContainerXY.x + left;
   container_mc.marker_mc._y = markerContainerXY.y + top;
   container_mc.BlackMarker_mc._x = markerContainerXY.x + left;
   container_mc.BlackMarker_mc._y = markerContainerXY.y + top;
   container_mc.markerStatic_mc._x = markerContainerXY.x + left;
   container_mc.markerStatic_mc._y = markerContainerXY.y + top;
   container_mc.bgImg_mc._x = markerContainerXY.x + left;
   container_mc.bgImg_mc._y = markerContainerXY.y + top;
   container_mc.text_mc._x = markerContainerXY.x + left;
   container_mc.text_mc._y = markerContainerXY.y + top;
   container_mc.line_mc._x = markerContainerXY.x + left;
   container_mc.line_mc._y = markerContainerXY.y + top;
   container_mc.mapBtn_mc._x = markerContainerXY.x + left;
   container_mc.mapBtn_mc._y = markerContainerXY.y + top;
}
function ToGame_BattleFieldMap_UseCommanderSkill(skillId, x, y)
{
   getURL("FSCommand:ToGame_BattleFieldMap_UseCommanderSkill",skillId + "\t" + x + "\t" + y);
   for(skill in container_mc.commander_mc)
   {
      if(typeof container_mc.commander_mc[skill] == "movieclip")
      {
         var _loc1_ = container_mc.commander_mc[skill];
         if(_loc1_.id == clickedSkillId)
         {
            _loc1_.active = false;
            _loc1_.FX_ACTIVE.gotoAndStop(1);
            break;
         }
      }
   }
   clickedSkillId = null;
}
function ToGame_BattleFieldMap_PrepareCommanderSkill(skillId)
{
   getURL("FSCommand:ToGame_BattleFieldMap_PrepareCommanderSkill",skillId);
}
function ToGame_AgitMap_RequestSortSize(comboBoxId)
{
   getURL("FSCommand:ToGame_AgitMap_RequestSortSize",comboBoxId);
}
function ToGame_AgitMap_ShowAgitBuyUI(id)
{
   getURL("FSCommand:ToGame_AgitMap_ShowAgitBuyUI",id);
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
function ToGame_WorldMap_PointAllClear()
{
   fscommand("ToGame_WorldMap_PointAllClear");
}
function ToGame_WorldMap_PartyPointAdd(idx)
{
   getURL("FSCommand:ToGame_WorldMap_PartyPointAdd",idx);
}
function ToGame_WorldMap_CheckPointAdd(idx)
{
   getURL("FSCommand:ToGame_WorldMap_CheckPointAdd",idx);
}
function ToGame_WorldMap_CheckPointClick(type, info)
{
   getURL("FSCommand:ToGame_WorldMap_CheckPointClick",type + "\t" + info);
}
function setResize(num)
{
   container_mc.bg._height = 859 + num;
   container_mc.hit._height = 859 + num;
   hit._height = 859 + num;
   scaleExpander._y = 835 + num;
   container_mc.skillMask_mc._y = 79 + num;
   container_mc.DGbg_mc._y = 79 + num;
   container_mc.scaleExpander2._y = 835 + num;
   container_mc.notice_mc._y = 846 + num;
   setMargin(LM,TM + num);
}
function setResize2(num)
{
   container_mc.bg._height = 859 + num;
   container_mc.hit._height = 859 + num;
   hit._height = 859 + num;
   scaleExpander._y = 835 + num;
   container_mc.scaleExpander2._y = 835 + num;
}
function setMarkerBtn(dataList, type, xP, yP, xD, yD)
{
   var _loc8_ = container_mc.point_mc;
   var _loc9_ = dataList.split("\n");
   var _loc10_ = _loc9_.length;
   var _loc7_ = xP;
   var _loc6_ = yP;
   var _loc4_ = 0;
   while(_loc4_ < _loc10_)
   {
      var _loc3_ = _loc9_[_loc4_].split("\t");
      if(_loc3_[2] == undefined)
      {
         break;
      }
      var _loc2_ = undefined;
      _loc2_ = _loc8_.attachMovie(type,"PointBtn" + _loc3_[0],_loc8_.getNextHighestDepth());
      _loc2_._x = _loc7_;
      _loc2_._y = _loc6_;
      _loc2_.btn.focus_mc._visible = false;
      _loc7_ = _loc7_ + xD;
      _loc6_ = _loc6_ + yD;
      _loc2_.idx = _loc3_[0];
      _loc2_.img = _loc3_[1];
      buttonImgStr = _loc3_[1];
      _loc2_.clickType = type;
      _loc2_.txt.htmlText = _loc3_[2];
      if(type == "partyPointBtn")
      {
         _loc2_.str = _loc3_[2];
      }
      else
      {
         lib.util.DrawBitmap.draw(_loc2_.mc,_loc2_.img);
      }
      lib.manager.ToolTip.add(_loc2_,_loc3_[3],1);
      _loc2_.disible = _loc3_[4];
      if(_loc2_.disible != 1)
      {
         _loc2_.txt.textColor = "0xffffff";
         _loc2_.onPress = function()
         {
            if(checkPointMode)
            {
               return undefined;
            }
            this.btn.gotoAndStop(3);
         };
         _loc2_.onRollOver = function()
         {
            if(checkPointMode)
            {
               return undefined;
            }
            this.btn.gotoAndStop(2);
         };
         _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
         {
            if(checkPointMode)
            {
               return undefined;
            }
            this.btn.gotoAndStop(1);
         };
         _loc2_.onRelease = function()
         {
            if(checkPointMode)
            {
               return undefined;
            }
            this.btn.gotoAndStop(1);
            CheckPointActivate(this);
         };
      }
      else
      {
         _loc2_.btn.gotoAndStop(4);
         _loc2_.txt.textColor = "0x797979";
      }
      _loc4_ = _loc4_ + 1;
   }
   container_mc.cityWarTipMc._visible = false;
   if(buttonImgStr.substr(0,CITYWAR_COMMAND.length) == CITYWAR_COMMAND)
   {
      container_mc.cityWarTipMc._visible = true;
   }
   return _loc6_;
}
function CheckPointActivate(btn)
{
   if(btn.clickType == "checkPointBtn")
   {
      ToGame_WorldMap_CheckPointAdd(btn.idx);
   }
   else
   {
      ToGame_WorldMap_PartyPointAdd(btn.idx);
   }
   var _loc3_ = container_mc.point_mc;
   lockPointButton(4);
   checkPointMode = true;
   var cpIcon = _loc3_.attachMovie("pointMc","pointMc",_loc3_.getNextHighestDepth());
   lib.util.DrawBitmap.draw(cpIcon,btn.img);
   if(btn.str)
   {
      var _loc2_ = new TextFormat();
      var _loc4_ = cpIcon.createTextField("txt",cpIcon.getNextHighestDepth(),10,8,16,28);
      _loc4_.multiline = false;
      _loc2_.color = 0;
      _loc2_.size = 16;
      _loc2_.font = "$NormalFont";
      _loc4_.setNewTextFormat(_loc2_);
      _loc4_.text = btn.str;
   }
   cpIcon._x = container_mc._xmouse - 32;
   cpIcon._y = container_mc._ymouse - 32;
   _loc3_.onEnterFrame = function()
   {
      cpIcon._x = container_mc._xmouse - 32;
      cpIcon._y = container_mc._ymouse - 32;
      if(container_mc._xmouse >= 10 && container_mc._xmouse < 1034 && container_mc._ymouse >= 140 && container_mc._ymouse < 847)
      {
         cpIcon._alpha = 100;
      }
      else
      {
         cpIcon._alpha = 30;
      }
   };
}
function clearPointButton()
{
   var _loc1_ = container_mc.point_mc;
   for(i in _loc1_)
   {
      if(typeof _loc1_[i] == "movieclip")
      {
         var _loc2_ = _loc1_[i];
         _loc2_.removeMovieClip();
      }
   }
}
function lockPointButton(type)
{
   var _loc2_ = container_mc.point_mc;
   for(i in _loc2_)
   {
      if(typeof _loc2_[i] == "movieclip")
      {
         var _loc1_ = _loc2_[i];
         if(_loc1_.disible != 1)
         {
            _loc1_.btn.gotoAndStop(type);
         }
      }
   }
   checkPointMode = false;
   delete register2.onEnterFrame;
   _loc2_.pointMc.removeMovieClip();
}
function ToGame_WorldMap_DarkRiftClick()
{
   fscommand("ToGame_WorldMap_DarkRiftClick");
}
function DarkSlot(mc, rData)
{
   var _loc7_ = rData.split("\n");
   var _loc9_ = _loc7_.length;
   var _loc6_ = 0;
   if(slotDataCheck)
   {
      return undefined;
   }
   slotDataCheck = true;
   mc.slotBox.gotoAndStop(Number(_loc9_) + 1);
   _loc6_ = 0;
   while(_loc6_ < 5)
   {
      var _loc1_ = mc.slotBox["slot" + _loc6_];
      var _loc4_ = _loc7_[_loc6_].split("\t");
      if(_loc4_ == undefined)
      {
         _loc1_._visible = false;
      }
      else
      {
         if(_loc4_[3] == "0")
         {
            _loc1_.grade._visible = false;
         }
         else
         {
            _loc1_.grade.gotoAndStop(Number(_loc4_[3]));
         }
         var _loc2_ = 0;
         var _loc3_ = _loc4_[2];
         var _loc5_ = _loc4_[4];
         if(_loc5_ == 1 || _loc5_ == 2)
         {
            _loc2_ = lib.util.GoldCurrency.SetGoldText(_loc3_,0,0,0,0);
            tooltipStr = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc2_ + "</font>";
            lib.manager.ToolTip.add(_loc1_,GOLD_STR + tooltipStr,1);
         }
         else if(_loc5_ == 3)
         {
            _loc2_ = lib.util.CurrencyFormat.makeComma(_loc3_);
            tooltipStr = "<font color=\'#" + lib.info.TextColor.GENERAL_EXP.toString(16) + "\'>" + _loc2_ + "</font>";
            lib.manager.ToolTip.add(_loc1_,EXP_STR + tooltipStr,1);
         }
         else if(_loc5_ == 4)
         {
            _loc2_ = lib.util.CurrencyFormat.makeComma(_loc3_);
            tooltipStr = "<font color=\'#00B4FF\'>" + lib.util.UIString.getUIString("$500063") + "</font>" + "<font color=\'#7d7d7d\'> : </font><font color=\'#007EFF\'>" + _loc2_ + "</font>";
            lib.manager.ToolTip.add(_loc1_,tooltipStr,1);
         }
         else if(_loc5_ == 5)
         {
            _loc2_ = lib.util.GoldCurrency.SetGoldText(_loc3_,0,0,0,1);
            tooltipStr = "<font color=\'#" + lib.info.TextColor.GENERAL_MONEY.toString(16) + "\'>" + _loc2_ + "</font>";
            lib.manager.ToolTip.add(_loc1_,GOLD_STR + tooltipStr,1);
         }
         else if(_loc5_ == 6)
         {
            _loc2_ = lib.util.CurrencyFormat.makeComma(_loc3_);
            tooltipStr = "<font color=\'#00BAFF\'>" + _loc2_ + "</font>";
            lib.manager.ToolTip.add(_loc1_,TIRED_STR + tooltipStr,1);
         }
         else
         {
            lib.manager.ToolTip.add(_loc1_,_loc4_[0] + "\t1",6);
            if(_loc3_ > 1)
            {
               _loc1_.num_txt.text = _loc3_;
            }
         }
         lib.display.DrawBitmapData.draw(_loc1_.img,_loc4_[1],0,0,0,0,54,54,0.84375);
      }
      _loc6_ = _loc6_ + 1;
   }
}
function DarkRiftBtn(mc, page)
{
   var _loc2_ = mc.btn;
   _loc2_.onPress = function()
   {
      this.btn.gotoAndStop(3);
   };
   _loc2_.onRollOver = function()
   {
      this.btn.gotoAndStop(2);
   };
   _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
   {
      this.btn.gotoAndStop(1);
   };
   if(page == "3")
   {
      _loc2_.txt.text = lib.util.UIString.getUIString("$241215");
      _loc2_.onRelease = function()
      {
         this.btn.gotoAndStop(1);
         ToGame_WorldMap_DarkRiftClick();
      };
   }
   else
   {
      _loc2_.txt.text = lib.util.UIString.getUIString("$241216");
      _loc2_.onRelease = function()
      {
         this.btn.gotoAndStop(1);
         ToGame_WorldMap_DarkRiftClick();
         var _loc2_ = this._parent.tipMc;
         if(_loc2_._visible)
         {
            _loc2_._visible = false;
         }
         else
         {
            _loc2_._visible = true;
         }
      };
   }
}
function DarkRiftPage(mc, page)
{
   var _loc1_ = 0;
   while(_loc1_ < 4)
   {
      var _loc2_ = mc["page" + _loc1_];
      if(_loc1_ == page)
      {
         _loc2_._visible = true;
      }
      else
      {
         _loc2_._visible = false;
      }
      _loc1_ = _loc1_ + 1;
   }
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
function setFieldEventButtonTooltip()
{
   var _loc1_ = !container_mc.fieldEventButton.img_on._visible?lib.util.UIString.getUIString("$720011"):lib.util.UIString.getUIString("$720010");
   lib.manager.ToolTip.add(container_mc.fieldEventButton,_loc1_,1);
}
function setRewardButtonCount(button, mc_count, count)
{
   if(count > 0)
   {
      button.__set__disabled(false);
      mc_count._visible = true;
      mc_count.txt.text = String(count);
      var _loc2_ = Math.max(17,mc_count.txt.textWidth + 12);
      mc_count.txt._width = _loc2_;
      mc_count.bg._width = _loc2_;
      if(mc_count.$origX == undefined)
      {
         mc_count.$origX = mc_count._x;
      }
      mc_count._x = mc_count.$origX + 9 - Math.floor(_loc2_ / 2);
   }
   else
   {
      button.__set__disabled(true);
      mc_count._visible = false;
   }
}
function initFieldEvent()
{
   container_mc.fieldEventButton.buttonType = BUTTON_TYPE_FIELDEVENT;
   container_mc.fieldEventMc.trackButton.buttonType = BUTTON_TYPE_FIELDEVENT_TRACKING;
   container_mc.fieldEventMc.rewardButton.buttonType = BUTTON_TYPE_FIELDEVENT_REWARD;
   initFieldEventButton();
   var _loc2_ = container_mc.fieldEventMc.mc_reward_new;
   _loc2_.text_reward.verticalAlign = "center";
   _loc2_.button_field_event.addEventListener("click",this,"fieldEventRewardButton_clickHandler");
   _loc2_.button_flying_nb.addEventListener("click",this,"flyingNBRewardButton_clickHandler");
   _loc2_.mc_count_field_event.hitTestDisable = true;
   _loc2_.mc_count_flying_nb.hitTestDisable = true;
}
function initFieldEventButton()
{
   var _loc4_ = container_mc.fieldEventMc.trackButton.txtBtn;
   container_mc.fieldEventMc.gage.setRewardButtonRelease(ToGame_WorldMap_ClickFieldEventButton,BUTTON_TYPE_FIELDEVENT_REWARD);
   container_mc.fieldEventMc.trackButton.btn.onRelease2 = function()
   {
      ToGame_WorldMap_ClickFieldEventButton(this._parent.buttonType);
   };
   var _loc2_ = container_mc.fieldEventButton;
   _loc2_.buttonMode = BUTTON_MODE_NORMAL;
   _loc2_.onRollOver = function()
   {
      if(this.bg._currentframe == 4)
      {
         return undefined;
      }
      this.img_on.gotoAndStop(2);
      this.img_off.gotoAndStop(2);
      this.bg.gotoAndStop(2);
   };
   _loc2_.onPress = function()
   {
      if(this.bg._currentframe == 4)
      {
         return undefined;
      }
      this.img_on.gotoAndStop(3);
      this.img_off.gotoAndStop(3);
      this.bg.gotoAndStop(3);
   };
   _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
   {
      if(this.bg._currentframe == 4)
      {
         return undefined;
      }
      this.img_on.gotoAndStop(1);
      this.img_off.gotoAndStop(1);
      this.bg.gotoAndStop(1);
   };
   _loc2_.onRelease = function()
   {
      if(this.bg._currentframe == 4)
      {
         return undefined;
      }
      var _loc2_ = this.buttonMode;
      _loc2_ = (_loc2_ + 1) % 2;
      this.buttonMode = _loc2_;
      this.img_on._visible = BUTTON_MODE_FIEDL_EVENT == _loc2_;
      this.img_off._visible = BUTTON_MODE_NORMAL == _loc2_;
      this.img_on.gotoAndStop(2);
      this.img_off.gotoAndStop(2);
      this.bg.gotoAndStop(2);
      setFieldEventButtonTooltip();
      ToGame_WorldMap_ClickFieldEventButton(this.buttonType);
   };
}
function ToGame_WorldMap_ClickFieldEventButton(buttonIndex)
{
   getURL("FSCommand:ToGame_WorldMap_ClickFieldEventButton",buttonIndex);
}
function fieldEventRewardButton_clickHandler(event)
{
   ToGame_WorldMap_ClickFieldEventButton(BUTTON_TYPE_FIELDEVENT_REWARD_FIELD_EVENT);
}
function flyingNBRewardButton_clickHandler(event)
{
   ToGame_WorldMap_ClickFieldEventButton(BUTTON_TYPE_FIELDEVENT_REWARD_FLYING_NB);
}
var UI = this;
UI._visible = true;
var UIname = "WorldMap2";
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
lib.manager.UISkin.drawBg(UIName,container_mc.uiBgMc);
preload_marker._visible = false;
preload_mapButton1._visible = false;
preload_mapButton2._visible = false;
preload_mapButton3._visible = false;
preload_mapButton4._visible = false;
preload_mapButton5._visible = false;
container_mc.range_mc._visible = false;
container_mc.agitToolTip_mc._visible = false;
container_mc.message_mc._visible = false;
container_mc.noClicker.useHandCursor = false;
container_mc.DGbg_mc._visible = false;
container_mc.freeNamed_mc._visible = false;
container_mc.notice_mc._visible = false;
container_mc.fieldEventMc._visible = false;
container_mc.fieldEventMc.gage._visible = false;
container_mc.fieldEventMc.mc_reward_new._visible = false;
container_mc.fieldEventButton._visible = false;
container_mc.title2_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.guildInfo_mc.name_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.frame_mc.hitTestDisable = true;
container_mc.guildInfo_mc.btn_txt.hitTestDisable = true;
container_mc.guildInfo_mc.crest_mc.hitTestDisable = true;
container_mc.guildInfo_mc.info_txt.hitTestDisable = true;
container_mc.guildInfo_mc.name_txt.hitTestDisable = true;
container_mc.title2_txt.textAutoSize = "shrink";
var notExploredStr = lib.util.UIString.getUIString("$241006");
var notSelectedStr = lib.util.UIString.getUIString("$241201");
var fieldEventInfoStr = lib.util.UIString.getUIString("$720001");
lib.manager.ToolTip.add(container_mc.fieldEventMc.helpIcon,fieldEventInfoStr,1);
var bWidgetOpen = false;
var cityWarTipTextWidth = container_mc.cityWarTipMc.textFd_1.textWidth;
container_mc.cityWarTipMc.textFd_1._width = cityWarTipTextWidth + 5;
container_mc.cityWarTipMc.bg._width = cityWarTipTextWidth + 45;
container_mc.cityWarTipMc._x = 1025 - container_mc.cityWarTipMc._width;
var upLevelLinkSave = null;
var LM = 0;
var TM = 0;
var myMarkerId = null;
var marker_array = new Array();
var lineStartingPoint = new Object();
var floatingIsland;
var viewSenator_btn = new lib.util.TxtBtn(container_mc.guildInfo_mc.btn_mc);
viewSenator_btn.setRollOver(function()
{
   container_mc.guildInfo_mc.btn_effect.gotoAndPlay(2);
}
);
viewSenator_btn.setRelease(ToGame_WorldMap_ClickShowGuardInfoBtn);
lib.manager.ToolTip.add(container_mc.guildInfo_mc.btn_mc,lib.util.UIString.getUIString("$241205"),1);
container_mc.guildInfo_mc.btn_effect.hitTestDisable = true;
var CustomScaleEvent;
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
   if(UI._visible == true)
   {
      CustomScaleEvent = new CustomScaleEvent();
      CustomScaleEvent.CustomScaleEventCheck(UI,UIname);
      UI.scaleExpander.scaleExpanderEventCheck(UI,UIname);
   }
   else
   {
      clearCommanderInfo();
      CustomScaleEvent.CustomScaleEventRemoveCheck();
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   _global.gbUIMode = bShow;
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      clearCommanderInfo();
      UI._visible = false;
   }
};
myListener.OnGame_WorldMap_ShowGuardInfoBtn = function(bShow, guildName, guildCrestImg)
{
   bShow = Number(bShow);
   lib.util.DrawBitmap.draw(container_mc.guildInfo_mc.Icon,guildCrestImg,50,50);
   var _loc1_ = new TextFormat();
   if(bShow)
   {
      if(guildCrestImg != "" && guildCrestImg != undefined)
      {
         container_mc.guildInfo_mc.btn_effect.gotoAndPlay(2);
      }
      container_mc.title2_txt._y = 14;
      _loc1_.size = 22;
   }
   else
   {
      container_mc.title2_txt._y = 24;
      _loc1_.size = 30;
   }
   container_mc.title2_txt.setTextFormat(_loc1_);
   container_mc.guildInfo_mc._visible = bShow;
   container_mc.guildInfo_mc.name_txt.setText("[ " + guildName + " ]");
};
myListener.OnGame_WorldMap_EnableClickMap = function(_bTrue)
{
   var _loc1_ = Number(_bTrue);
   container_mc.noClicker._visible = _loc1_;
};
var closeLock = false;
myListener.OnGame_WorldMap_CloseLock = function(_bTrue)
{
   closeLock = Boolean(Number(_bTrue));
   x_btn.setEnabled(!closeLock);
   if(closeLock)
   {
      var _loc1_ = container_mc.attachMovie("resurrectionTip","resurrectionTip",container_mc.getNextHighestDepth());
      _loc1_._x = 20;
      _loc1_._y = 856;
   }
   else
   {
      removeMovieClip(container_mc.resurrectionTip);
   }
   setVisibleBottomInfo();
};
myListener.OnGame_WorldMap_Clear = function()
{
   setMargin(0,0);
   setResize(0);
   gotoUpDepth_btn.setEnabled(false);
   clearContainer(container_mc.BlackMarker_mc);
   clearContainer(container_mc.marker_mc);
   clearContainer(container_mc.markerStatic_mc);
   clearContainer(container_mc.bgImg_mc);
   clearContainer(container_mc.text_mc);
   clearContainer(container_mc.line_mc);
   clearContainer(container_mc.mapBtn_mc);
   clearContainer(container_mc.number_mc);
   clearCommanderInfo();
   clearComboBox();
   container_mc.range_mc._visible = false;
   container_mc.agitToolTip_mc._visible = false;
   container_mc.message_mc._visible = false;
   container_mc.noClicker.useHandCursor = false;
   container_mc.DGbg_mc._visible = false;
   container_mc.freeNamed_mc._visible = false;
   container_mc.notice_mc._visible = false;
   container_mc.cityWarTipMc._visible = false;
   container_mc.txtLeftTimeTitle._visible = false;
   container_mc.txtLeftTime._visible = false;
   container_mc.siegeWarLeftTimeMc._visible = false;
   container_mc.siegeWarLeftTowerMc._visible = false;
   container_mc.fieldEventMc._visible = false;
   container_mc.fieldEventMc.gage._visible = false;
   container_mc.fieldEventMc.mc_reward_new._visible = false;
   container_mc.fieldEventButton._visible = false;
   container_mc.bg._height = 859;
   container_mc.hit._height = 857;
   scaleExpander._y = 835;
   container_mc.scaleExpander2._y = 835;
   hit._height = 859;
   numberCount = 0;
};
container_mc._visible = false;
myListener.OnGame_WorldMap_Init = function(titleStr, bgImg, upLevelLink, leftMargin, topMargin, guardComboBoxInfo, sectionComboBoxInfo, imgList, textList, mapBtnList, pointBtnList)
{
   container_mc.title2_txt.text = titleStr;
   upLevelLinkSave = upLevelLink;
   setResize(0);
   numberCount = 0;
   container_mc.notice_mc._visible = false;
   container_mc.cityWarTipMc._visible = false;
   container_mc.DGbg_mc._visible = false;
   myListener.OnGame_WorldMap_AddImage("0\t0\t0\t0\t0\t0\t" + bgImg + "\t0\t\t0\t0\t0");
   if(upLevelLink == "")
   {
      gotoUpDepth_btn.setEnabled(false);
      container_mc.gotoUpDepthBtn._visible = false;
   }
   else
   {
      gotoUpDepth_btn.setEnabled(true);
      container_mc.gotoUpDepthBtn._visible = true;
      gotoUpDepth_btn.setRelease(function()
      {
         ToGame_WorldMap_RespondCommand(upLevelLink);
      }
      );
   }
   LM = TM = 0;
   var _loc1_ = effectLMargin = Number(leftMargin);
   var _loc2_ = effectTMargin = Number(topMargin);
   if((effectLMargin = Number(leftMargin)) != undefined)
   {
      LM = effectLMargin = Number(leftMargin);
   }
   if((effectTMargin = Number(topMargin)) != undefined)
   {
      TM = effectTMargin = Number(topMargin);
   }
   setMargin(effectLMargin = Number(leftMargin),Number(effectTMargin = Number(topMargin)));
   if(guardComboBoxInfo == "" || guardComboBoxInfo == undefined)
   {
      container_mc.combobox1._visible = false;
      container_mc.comboBg1._visible = false;
   }
   else
   {
      container_mc.combobox1._visible = true;
      container_mc.comboBg1._visible = true;
   }
   if(sectionComboBoxInfo == "" || sectionComboBoxInfo == undefined)
   {
      container_mc.combobox2._visible = false;
      container_mc.comboBg2._visible = false;
   }
   else
   {
      container_mc.combobox2._visible = true;
      container_mc.comboBg2._visible = true;
   }
   myListener.OnGame_WorldMap_SetComboBox(guardComboBoxInfo,sectionComboBoxInfo);
   myListener.OnGame_WorldMap_AddImage(imgList);
   myListener.OnGame_WorldMap_AddText(textList);
   myListener.OnGame_WorldMap_AddMapButton(mapBtnList);
   if(pointBtnList)
   {
      myListener.OnGame_WorldMap_SetCheckPointButton(pointBtnList);
   }
   container_mc._visible = true;
   setVisibleBottomInfo();
};
var STRONG_STR_0 = "img://__WMap_Marker.MARKER_BF_NEUTRAL_STRONGHOLD";
var STRONG_STR_1 = "img://__WMap_Marker.MARKER_BF_OURTEAM_OCCUPIED_STRONGHOLD";
var STRONG_STR_2 = "img://__WMap_Marker.MARKER_BF_ENEMY_OCCUPIED_STRONGHOLD";
var prevStrong = ["","",""];
var numberCount = 0;
var effectLMargin = 0;
var effectTMargin = 0;
var CITYWAR_TOWER_ICON_SIZE = 64;
var CITYWAR_TOWER_GAUGE_WIDTH = 32;
var CITYWAR_MONSTER = "img://__WMap_Marker.MARKER_CITYWAR_MONSTER";
var CITYWAR_COMMAND = "img://__WMap_Marker.MARKER_UNION_POST_COMMAND";
myListener.OnGame_WorldMap_AddImage = function(dataList)
{
   var _loc39_ = dataList.split("\n");
   var _loc40_ = _loc39_.length;
   if(_loc39_[_loc40_ - 1] == "0" || _loc39_[_loc40_ - 1] == "undefined" || _loc39_[_loc40_ - 1] == "")
   {
      _loc39_.pop();
   }
   _loc40_ = _loc39_.length;
   if(container_mc.marker_mc.resurrection.BG)
   {
      removeMovieClip(container_mc.marker_mc.resurrection.BG);
   }
   var _loc38_ = 0;
   var _loc23_ = 0;
   while(_loc23_ < _loc40_)
   {
      var _loc4_ = _loc39_[_loc23_].split("\t");
      if(_loc4_.length != 1)
      {
         var _loc2_ = null;
         var out = null;
         var _loc5_ = _loc4_[0];
         var _loc18_ = Number(_loc4_[1]);
         var _loc17_ = Number(_loc4_[2]);
         var _loc32_ = Number(_loc4_[3]);
         var _loc8_ = Number(_loc4_[4]);
         var _loc7_ = Number(_loc4_[5]);
         var _loc3_ = _loc4_[6];
         var _loc11_ = _loc4_[7];
         var _loc33_ = _loc4_[8];
         var _loc9_ = Number(_loc4_[9]);
         var _loc26_ = _loc4_[10];
         var _loc29_ = Number(_loc4_[11]);
         var clickId = _loc4_[12];
         var _loc37_ = _loc4_[13];
         var _loc21_ = Number(_loc4_[14]);
         var _loc14_ = Number(_loc4_[15]);
         var _loc13_ = Number(_loc4_[16]);
         var _loc10_ = Number(_loc4_[17]);
         var _loc12_ = Number(_loc4_[18]);
         _loc8_ = !isNaN(_loc8_)?_loc8_:0;
         _loc7_ = !isNaN(_loc7_)?_loc7_:0;
         _loc14_ = !(isNaN(_loc14_) || -1 == _loc14_ || 0 == _loc14_)?_loc14_:1;
         _loc13_ = !(isNaN(_loc13_) || -1 == _loc13_ || 0 == _loc13_)?_loc13_:1;
         if(isNaN(_loc21_) == false && _loc21_ != -1)
         {
            addNumber(_loc37_,_loc5_,_loc8_,_loc7_,_loc3_,_loc18_,_loc17_,_loc21_,_loc11_);
         }
         else
         {
            _loc2_ = searchMarker(_loc5_);
            if(_loc2_ != null)
            {
               myListener.OnGame_WorldMap_RemoveImage(_loc5_);
            }
            if(_loc9_ == 0)
            {
               lib.util.DrawBitmap.draw(container_mc.bgImg_mc,_loc3_);
               if(_loc3_.substr(0,15) == "img://__WMap_DG" || _loc3_.substr(19,8) == "WMap_DG_")
               {
                  container_mc.DGbg_mc._visible = true;
                  container_mc.bgImg_mc._alpha = 85;
               }
               else
               {
                  container_mc.bgImg_mc._alpha = 100;
               }
            }
            else
            {
               if(_loc9_ == 5)
               {
                  _loc2_ = container_mc.markerStatic_mc.createEmptyMovieClip(_loc5_,container_mc.markerStatic_mc.getNextHighestDepth());
                  out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
               }
               else if(_loc9_ == 6)
               {
                  _loc2_ = container_mc.marker_mc.alimMc.createEmptyMovieClip(_loc5_,container_mc.marker_mc.alimMc.getNextHighestDepth());
                  out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
               }
               else if(_loc9_ == 10)
               {
                  if(_loc3_.substr(0,36) == "img://__WMap_Marker.MARKER_BLACKHOLE")
                  {
                     _loc2_ = container_mc.BlackMarker_mc.createEmptyMovieClip(_loc5_,container_mc.BlackMarker_mc.getNextHighestDepth());
                  }
                  else if(CITYWAR_MONSTER == _loc3_ || 1 == _loc10_)
                  {
                     _loc2_ = container_mc.marker_mc.citywarHit.createEmptyMovieClip(_loc5_,container_mc.marker_mc.citywarHit.getNextHighestDepth());
                  }
                  else
                  {
                     _loc2_ = container_mc.marker_mc.normal.createEmptyMovieClip(_loc5_,container_mc.marker_mc.normal.getNextHighestDepth());
                  }
                  out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
               }
               else if(_loc9_ == 11)
               {
                  _loc2_ = container_mc.marker_mc.quest.createEmptyMovieClip(_loc5_,container_mc.marker_mc.quest.getNextHighestDepth());
                  out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
               }
               else if(_loc9_ == 12)
               {
                  _loc2_ = container_mc.marker_mc.my.createEmptyMovieClip(_loc5_,container_mc.marker_mc.my.getNextHighestDepth());
                  out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
               }
               else if(_loc9_ == 13)
               {
                  _loc2_ = container_mc.marker_mc.strong.createEmptyMovieClip(_loc5_,container_mc.marker_mc.strong.getNextHighestDepth());
                  out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
                  if(_loc3_ == STRONG_STR_0 || _loc3_ == STRONG_STR_1 || _loc3_ == STRONG_STR_2)
                  {
                     EffectAnimation(_loc38_,_loc3_,_loc2_);
                     _loc38_ = _loc38_ + 1;
                  }
               }
               else if(_loc9_ == 14)
               {
                  var _loc28_ = container_mc.marker_mc.resurrection;
                  _loc2_ = _loc28_.createEmptyMovieClip(_loc5_,_loc28_.getNextHighestDepth());
                  out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
               }
               else if(_loc9_ == 17)
               {
                  _loc2_ = container_mc.marker_mc.point.createEmptyMovieClip(_loc5_,container_mc.marker_mc.point.getNextHighestDepth());
                  out = _loc2_.createEmptyMovieClip("out",_loc2_.getNextHighestDepth());
               }
               if("MARKER_PING" == _loc26_)
               {
                  var _loc31_ = out.attachMovie("pingHit","pingHit",out.getNextHighestDepth());
                  _loc31_._alpha = 0;
               }
               else
               {
                  lib.util.DrawBitmap.draw(out,_loc3_);
               }
               out._xscale = _loc14_ * 100;
               out._yscale = _loc13_ * 100;
               out._x = out._x + _loc8_ * _loc14_;
               out._y = out._y + _loc7_ * _loc13_;
               if(0 < _loc12_)
               {
                  var _loc30_ = "markerBg";
                  var _loc16_ = _loc2_.attachMovie(_loc30_,"markerBg",_loc2_.getNextHighestDepth());
                  if(1 == _loc12_ || 2 == _loc12_)
                  {
                     _loc16_.gauge_1._visible = 1 == _loc12_;
                     _loc16_.gauge_2._visible = 2 == _loc12_;
                     _loc16_.gotoAndStop(_loc12_);
                     var _loc35_ = _loc16_["gauge_" + _loc12_];
                     var _loc25_ = -22;
                     var _loc24_ = -79;
                     _loc16_._x = _loc25_;
                     _loc16_._y = _loc24_;
                     out._x = _loc25_ + 7;
                     out._y = _loc24_ + 19.5;
                     var _loc36_ = getCityWarTowerHP(_loc11_);
                     _loc35_._width = CITYWAR_TOWER_GAUGE_WIDTH * (_loc36_ / 100);
                  }
               }
               _loc2_.clickId = clickId;
               if(_loc29_)
               {
                  var over = _loc2_.createEmptyMovieClip("over",_loc2_.getNextHighestDepth());
                  lib.util.DrawBitmap.draw(over,_loc33_);
                  over._x = over._x + _loc8_;
                  over._y = over._y + _loc7_;
                  over._visible = false;
                  _loc2_.onRollOver = function()
                  {
                     this.out._visible = false;
                     this.over._visible = true;
                     markerOver(this);
                  };
                  _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
                  {
                     this.out._visible = true;
                     this.over._visible = false;
                  };
               }
               else if(_loc3_ == "img://__WMap_Marker.MARKER_PC_CAMERA")
               {
                  _loc2_.hitTestDisable = true;
               }
               else if(_loc3_.substr(0,36) != "img://__WMap_Marker.MARKER_BLACKHOLE")
               {
                  _loc2_.onRollOver = function()
                  {
                     markerOver(this);
                  };
               }
               var _loc20_ = _loc2_;
               if(CITYWAR_MONSTER == _loc3_ || 1 == _loc10_ || _loc3_.substr(0,CITYWAR_COMMAND.length) == CITYWAR_COMMAND)
               {
                  if(1 != _loc10_)
                  {
                     var _loc15_ = _loc2_.attachMovie("citywar_marker_hit","hit",_loc2_.getNextHighestDepth());
                     _loc15_._x = -24;
                     _loc15_._y = -24;
                     _loc15_._alpha = 0;
                  }
                  _loc15_ = 1 != _loc10_?_loc15_:_loc2_.markerBg.hit;
                  _loc20_ = _loc15_;
                  _loc2_.markerHit = _loc15_;
               }
               if(2 == _loc10_)
               {
                  tooltipStr = _loc5_ + "\t2";
                  lib.manager.ToolTip.add(_loc20_,tooltipStr,6);
               }
               else if("" != _loc11_)
               {
                  _loc10_ = _loc10_ != 1?1:99;
                  lib.manager.ToolTip.add(_loc20_,_loc11_,_loc10_);
               }
               _loc2_._x = _loc18_;
               _loc2_._y = _loc17_;
               _loc2_._rotation = _loc32_;
               if(_loc2_ != null)
               {
                  _loc2_.id = _loc5_;
                  _loc2_.mn = _loc26_;
                  marker_array.push(_loc2_);
               }
               _loc2_.res = _loc3_;
               if(clickId != "")
               {
                  _loc2_.onRelease = function()
                  {
                     lib.manager.UISound.play(lib.manager.UISound.MAP_BTN);
                     ToGame_WorldMap_RespondCommand(this.clickId);
                  };
               }
               if(_loc3_ == "img://__WMap_Marker.MARKER_LINK_TARGET" || _loc3_ == "img://__WMap_Marker.MARKER_LINK_TARGET_POINT2")
               {
                  var _loc41_ = container_mc.BlackMarker_mc.attachMovie("Warning","Warning",container_mc.BlackMarker_mc.getNextHighestDepth());
                  _loc41_._x = _loc2_._x + effectLMargin;
                  _loc41_._y = _loc2_._y + effectTMargin;
                  _loc41_.hitTestDisable = true;
                  _loc41_.blendMode = "add";
               }
               else if(_loc3_ == "img://__WMap_Marker.MARKER_BF_METRO_SKILL")
               {
                  _loc41_ = container_mc.BlackMarker_mc.attachMovie("Warning2","Warning2",container_mc.BlackMarker_mc.getNextHighestDepth());
                  _loc41_._x = _loc2_._x + _loc8_ + 16 + effectLMargin;
                  _loc41_._y = _loc2_._y + _loc7_ + 16 + effectTMargin;
                  _loc41_.hitTestDisable = true;
                  _loc41_.blendMode = "add";
               }
               if(_loc3_ == "img://__WMap_Marker.MARKER_PEGASUS")
               {
                  lineStartingPoint.x = _loc18_ + _loc2_._width / 2 + _loc8_;
                  lineStartingPoint.y = _loc17_ + _loc2_._height / 2 + _loc7_;
               }
               else if(_loc3_ == "img://__WMap_Marker.MARKER_PEGASUS_DESTINATION")
               {
                  var _loc19_ = container_mc.line_mc.createEmptyMovieClip("line" + _loc5_,container_mc.line_mc.getNextHighestDepth());
                  if(lineStartingPoint.x != null && lineStartingPoint.y != null)
                  {
                     _loc19_._alpha = 50;
                     _loc19_.lineStyle(3,16764006,100);
                     _loc19_.moveTo(lineStartingPoint.x,lineStartingPoint.y);
                     _loc19_.lineTo(_loc18_ + _loc2_._width / 2 + _loc8_,_loc17_ + _loc2_._height / 2 + _loc7_);
                     _loc19_.blendMode = "add";
                  }
                  transferEndMarker(_loc2_);
                  var _loc6_ = _loc11_.split("\b");
                  var _loc22_ = _loc6_.length;
                  if(_loc6_[_loc22_ - 1] == "0" || _loc6_[_loc22_ - 1] == "undefined" || _loc6_[_loc22_ - 1] == "")
                  {
                     _loc6_.pop();
                  }
                  var _loc34_ = !(_loc6_[1] == "0" || _loc6_[1] == undefined)?"\r" + lib.util.GoldCurrency.SetGoldText(_loc6_[1]):"";
                  var _loc27_ = _loc6_[0] + _loc34_;
                  if(_loc6_[2] != "" && _loc6_[2] != undefined && _loc6_[2] != "undefined")
                  {
                     _loc27_ = _loc27_ + ("\r<font color=\'#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16) + "\'>" + lib.util.UIString.getUIString("$241008") + _loc6_[2]);
                  }
                  lib.manager.ToolTip.add(_loc2_,_loc27_,1);
               }
               else if(_loc3_ == "img://__WMap_Marker.MARKER_PEGASUS_INACTIVE")
               {
                  _loc6_ = _loc11_.split("\b");
                  _loc22_ = _loc6_.length;
                  if(_loc6_[_loc22_ - 1] == "0" || _loc6_[_loc22_ - 1] == "undefined" || _loc6_[_loc22_ - 1] == "")
                  {
                     _loc6_.pop();
                  }
                  _loc34_ = !(_loc6_[1] == "0" || _loc6_[1] == undefined)?"\r" + lib.util.GoldCurrency.SetGoldText(_loc6_[1]):"";
                  _loc27_ = _loc6_[0] + _loc34_;
                  if(_loc6_[2] != "" && _loc6_[2] != undefined && _loc6_[2] != "undefined")
                  {
                     _loc27_ = _loc27_ + ("\r<font color=\'#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16) + "\'>" + lib.util.UIString.getUIString("$241008") + _loc6_[2]);
                  }
                  lib.manager.ToolTip.add(_loc2_,_loc27_,1);
               }
               else if(_loc3_ == "img://__WMap_Marker.MARKER_CAMP")
               {
                  lineStartingPoint.x = _loc18_ + _loc2_._width / 2 + _loc8_;
                  lineStartingPoint.y = _loc17_ + _loc2_._height / 2 + _loc7_;
               }
               else if(_loc3_ == "img://__WMap_Marker.MARKER_CAMP_CAN_TEL")
               {
                  _loc19_ = container_mc.line_mc.createEmptyMovieClip("line" + _loc5_,container_mc.line_mc.getNextHighestDepth());
                  _loc19_._alpha = 50;
                  _loc19_.lineStyle(3,16764006,100);
                  _loc19_.moveTo(lineStartingPoint.x,lineStartingPoint.y);
                  _loc19_.lineTo(_loc18_ + _loc2_._width / 2 + _loc8_,_loc17_ + _loc2_._height / 2 + _loc7_);
                  _loc19_.blendMode = "add";
                  transferEndMarker(_loc2_);
                  _loc6_ = _loc11_.split("\b");
                  _loc22_ = _loc6_.length;
                  if(_loc6_[_loc22_ - 1] == "0" || _loc6_[_loc22_ - 1] == "undefined" || _loc6_[_loc22_ - 1] == "")
                  {
                     _loc6_.pop();
                  }
                  _loc34_ = !(_loc6_[1] == "0" || _loc6_[1] == undefined)?"\r" + lib.util.GoldCurrency.SetGoldText(_loc6_[1]):"";
                  _loc27_ = _loc6_[0] + _loc34_;
                  if(_loc6_[2] != "" && _loc6_[2] != undefined && _loc6_[2] != "undefined")
                  {
                     _loc27_ = _loc27_ + ("\r<font color=\'#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16) + "\'>" + lib.util.UIString.getUIString("$241008") + _loc6_[2]);
                  }
                  lib.manager.ToolTip.add(_loc2_,_loc27_,1);
               }
               else if(_loc3_ == "img://__WMap_Marker.MARKER_CAMP_CANNOT_TEL")
               {
                  _loc6_ = _loc11_.split("\b");
                  _loc22_ = _loc6_.length;
                  if(_loc6_[_loc22_ - 1] == "0" || _loc6_[_loc22_ - 1] == "undefined" || _loc6_[_loc22_ - 1] == "")
                  {
                     _loc6_.pop();
                  }
                  _loc34_ = !(_loc6_[1] == "0" || _loc6_[1] == undefined)?"\r" + lib.util.GoldCurrency.SetGoldText(_loc6_[1]):"";
                  _loc27_ = _loc6_[0] + _loc34_;
                  if(_loc6_[2] != "" && _loc6_[2] != undefined && _loc6_[2] != "undefined")
                  {
                     _loc27_ = _loc27_ + ("\r<font color=\'#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16) + "\'>" + lib.util.UIString.getUIString("$241008") + _loc6_[2]);
                  }
                  lib.manager.ToolTip.add(_loc2_,_loc27_,1);
               }
               else if(_loc3_.substr(0,31) == "img://__WMap_Marker.battlePoint")
               {
                  _loc41_ = _loc2_.attachMovie("pointHit","pointHit",_loc2_.getNextHighestDepth());
               }
            }
         }
      }
      _loc23_ = _loc23_ + 1;
   }
};
myListener.OnGame_WorldMap_UpdateImage = function(dataList)
{
   var _loc18_ = dataList.split("\n");
   var _loc19_ = _loc18_.length;
   if(_loc18_[_loc19_ - 1] == "0" || _loc18_[_loc19_ - 1] == "undefined" || _loc18_[_loc19_ - 1] == "")
   {
      _loc18_.pop();
   }
   _loc19_ = _loc18_.length;
   var _loc9_ = 0;
   while(_loc9_ < _loc19_)
   {
      var _loc1_ = _loc18_[_loc9_].split("\t");
      if(_loc1_.length != 1)
      {
         var _loc20_ = undefined;
         var _loc7_ = _loc1_[0];
         var _loc13_ = Number(_loc1_[1]);
         var _loc12_ = Number(_loc1_[2]);
         var _loc14_ = Number(_loc1_[3]);
         var _loc5_ = _loc1_[4];
         var _loc17_ = _loc1_[5];
         var _loc8_ = Number(_loc1_[6]);
         var _loc6_ = Number(_loc1_[7]);
         var _loc3_ = Number(_loc1_[8]);
         if(isNaN(_loc8_) == false && _loc8_ != -1)
         {
            updateNumber(_loc17_,_loc7_,_loc8_,_loc13_,_loc12_,_loc5_);
         }
         else
         {
            var _loc2_ = searchMarker(_loc7_);
            if(undefined != _loc2_)
            {
               var _loc10_ = _loc2_.markerHit;
               var _loc4_ = _loc2_.markerBg;
               var _loc11_ = undefined == _loc10_?_loc2_:_loc10_;
               if(2 == _loc6_)
               {
                  _loc5_ = _loc7_ + "\t2";
                  lib.manager.ToolTip.add(_loc11_,_loc5_,6);
               }
               else if("" != _loc5_)
               {
                  _loc6_ = _loc6_ != 1?1:99;
                  lib.manager.ToolTip.add(_loc11_,_loc5_,_loc6_);
               }
               _loc2_._x = _loc13_;
               _loc2_._y = _loc12_;
               _loc2_._rotation = _loc14_;
               if(!(isNaN(_loc3_) || 0 == _loc3_))
               {
                  if(1 == _loc3_ || 2 == _loc3_)
                  {
                     if(undefined == _loc4_)
                     {
                        _loc4_ = _loc2_.attachMovie("markerBg","markerBg",_loc2_.getNextHighestDepth());
                     }
                     var _loc15_ = getCityWarTowerHP(_loc5_);
                     var _loc16_ = _loc4_["gauge_" + _loc3_];
                     _loc4_.gotoAndStop(_loc3_);
                     _loc4_.gauge_1._visible = 1 == _loc3_;
                     _loc4_.gauge_2._visible = 2 == _loc3_;
                     _loc16_._width = CITYWAR_TOWER_GAUGE_WIDTH * (_loc15_ / 100);
                  }
               }
            }
         }
      }
      _loc9_ = _loc9_ + 1;
   }
};
myListener.OnGame_WorldMap_RemoveImage = function(dataList)
{
   var _loc2_ = dataList.split("\n");
   var _loc3_ = _loc2_.length;
   if(_loc2_[_loc3_ - 1] == "0" || _loc2_[_loc3_ - 1] == "undefined" || _loc2_[_loc3_ - 1] == "")
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
myListener.OnGame_WorldMap_AlimClear = function()
{
   var _loc2_ = container_mc.marker_mc.alimMc;
   var _loc3_ = _loc2_.getDepth();
   var _loc1_ = container_mc.marker_mc.createEmptyMovieClip("alimMc",_loc3_);
   _loc1_._x = markerContainerXY.x;
   _loc1_._y = markerContainerXY.y;
};
var sparkleArray = new Array();
myListener.OnGame_WorldMap_SparkleImage = function(imgId, type)
{
   var _loc1_ = searchMarker(imgId);
   if(_loc1_)
   {
      var _loc2_ = undefined;
      var _loc5_ = container_mc.BlackMarker_mc;
      var _loc7_ = _loc5_.getNextHighestDepth();
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
         _loc2_ = _loc5_.attachMovie(_loc3_,"sparkle_" + imgId,_loc7_);
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
      _loc2_._x = _loc1_._x;
      _loc2_._y = _loc1_._y;
   }
};
var effectFocus0 = null;
var effectFocus1 = null;
var effectFocus2 = null;
var effectFocus3 = null;
myListener.OnGame_WorldMap_SparkleClear = function()
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
myListener.OnGame_WorldMap_RemoveSparkleImage = function(imgId)
{
   clearSparkle(imgId,true);
};
myListener.OnGame_WorldMap_Guide = function(imgId, str)
{
   return undefined;
};
myListener.OnGame_WorldMap_RemoveNumberImage = function(dataList)
{
   var _loc7_ = dataList.split("\n");
   var _loc8_ = _loc7_.length;
   _loc8_ = _loc7_.length;
   var _loc4_ = 0;
   while(_loc4_ < _loc8_)
   {
      var _loc3_ = _loc7_[_loc4_];
      var _loc6_ = container_mc.number_mc["number_" + _loc3_ + "0"];
      var _loc5_ = _loc6_.len;
      var _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         var _loc1_ = container_mc.number_mc["number_" + _loc3_ + _loc2_];
         if(_loc1_ != undefined)
         {
            lib.manager.ToolTip.remove(_loc1_);
            _loc1_.removeMovieClip();
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc4_ = _loc4_ + 1;
   }
};
myListener.OnGame_WorldMap_SameChannelImage = function(imgId, _bTrue)
{
   var _loc1_ = searchMarker(imgId);
   if(_loc1_ != null)
   {
      if(_bTrue)
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
myListener.OnGame_WorldMap_AddText = function(dataList)
{
   var _loc12_ = dataList.split("\n");
   var _loc13_ = _loc12_.length;
   if(_loc12_[_loc13_ - 1] == "0" || _loc12_[_loc13_ - 1] == "undefined" || _loc12_[_loc13_ - 1] == "")
   {
      _loc12_.pop();
   }
   _loc13_ = _loc12_.length;
   var _loc5_ = 0;
   while(_loc5_ < _loc13_)
   {
      var _loc3_ = _loc12_[_loc5_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc14_ = undefined;
         var _loc6_ = _loc3_[0];
         var _loc11_ = Number(_loc3_[1]);
         var _loc10_ = Number(_loc3_[2]);
         var _loc7_ = _loc3_[3];
         var _loc8_ = _loc3_[4];
         var _loc9_ = _loc3_[5];
         var clickId = _loc3_[6];
         var _loc2_ = container_mc.text_mc.attachMovie("txt_id",_loc6_,container_mc.text_mc.getNextHighestDepth());
         _loc2_.id = _loc6_;
         _loc2_.style = _loc7_;
         _loc2_.txt.text = _loc9_;
         lib.info.TextColor.setWorldMapTextColor(0,_loc7_,_loc2_.txt);
         _loc2_.txt._width = _loc2_.txt.textWidth + 5;
         if(_loc8_ == "center")
         {
            _loc2_.txt._width = _loc2_.txt.textWidth + 45;
            _loc2_.txt._height = _loc2_.txt.textHeight + 30;
            _loc2_.txt.verticalAlign = "center";
            var _loc4_ = new TextFormat();
            _loc4_.leftMargin = _loc4_.rightMargin = 20;
            _loc2_.txt.setTextFormat(_loc4_);
            _loc2_.txt._x = _loc2_.txt._x - _loc2_.txt._width / 2;
            _loc2_.txt._y = _loc2_.txt._y - 13;
         }
         else if(_loc8_ == "right")
         {
            _loc2_.txt._x = _loc2_.txt._x - _loc2_.txt._width;
         }
         if(clickId != "")
         {
            _loc2_.clickId = clickId;
            _loc2_.onRollOver = function()
            {
               lib.info.TextColor.setWorldMapTextColor(1,this.style,this.txt);
            };
            _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
            {
               lib.info.TextColor.setWorldMapTextColor(0,this.style,this.txt);
            };
            _loc2_.onRelease = function()
            {
               lib.manager.UISound.play(lib.manager.UISound.MAP_BTN);
               ToGame_WorldMap_RespondCommand(this.clickId);
            };
         }
         _loc2_._x = _loc11_;
         _loc2_._y = _loc10_;
      }
      _loc5_ = _loc5_ + 1;
   }
};
myListener.OnGame_WorldMap_RemoveText = function(dataList)
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
      if(_loc2_)
      {
         _loc2_.removeMovieClip();
      }
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_WorldMap_AddMapButton = function(dataList)
{
   var _loc13_ = dataList.split("\n");
   var _loc14_ = _loc13_.length;
   if(_loc13_[_loc14_ - 1] == "0" || _loc13_[_loc14_ - 1] == "undefined" || _loc13_[_loc14_ - 1] == "")
   {
      _loc13_.pop();
   }
   _loc14_ = _loc13_.length;
   var _loc5_ = 0;
   while(_loc5_ < _loc14_)
   {
      var _loc3_ = _loc13_[_loc5_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc4_ = _loc3_[0];
         var _loc12_ = Number(_loc3_[1]);
         var _loc11_ = Number(_loc3_[2]);
         var _loc9_ = Number(_loc3_[3]);
         var _loc8_ = Number(_loc3_[4]);
         var _loc7_ = _loc3_[5];
         var _loc10_ = _loc3_[6];
         var _loc6_ = Number(_loc3_[7]);
         var _loc2_ = container_mc.mapBtn_mc.attachMovie(_loc4_,_loc4_,container_mc.mapBtn_mc.getNextHighestDepth());
         if(_loc4_ == "WMap_World_BTN_FDI")
         {
            floatingIsland = _loc2_;
         }
         _loc2_.id = _loc4_;
         _loc2_.clickId = _loc10_;
         _loc2_._x = _loc12_;
         _loc2_._y = _loc11_;
         _loc2_.txt._x = _loc9_;
         _loc2_.txt._y = _loc8_;
         _loc2_.txt.autoSize = true;
         _loc2_.txt.text = _loc7_;
         if(_loc4_.substr(0,10) == "WMap_World")
         {
            lib.info.TextColor.setWorldMapTextColor(0,"guard",_loc2_.txt);
         }
         else
         {
            if(!_loc6_)
            {
               lib.info.TextColor.setWorldMapTextColor(0,"field",_loc2_.txt);
            }
            else
            {
               lib.info.TextColor.setWorldMapTextColor(1,"field",_loc2_.txt);
            }
            if(_loc6_)
            {
               _loc2_.hit.enabled = true;
            }
            else
            {
               _loc2_.hit.enabled = false;
            }
         }
         _loc2_.hit.onRelease = function()
         {
            lib.manager.UISound.play(lib.manager.UISound.MAP_BTN);
            ToGame_WorldMap_RespondCommand(this._parent.clickId);
         };
         _loc2_.hit.onRollOver = function()
         {
            this._parent.gotoAndStop(2);
         };
         _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
         {
            this._parent.gotoAndStop(1);
         };
      }
      _loc5_ = _loc5_ + 1;
   }
};
myListener.OnGame_WorldMap_UpdateMapButton = function(dataList)
{
   var _loc5_ = dataList.split("\n");
   var _loc6_ = _loc5_.length;
   if(_loc5_[_loc6_ - 1] == "0" || _loc5_[_loc6_ - 1] == "undefined" || _loc5_[_loc6_ - 1] == "")
   {
      _loc5_.pop();
   }
   _loc6_ = _loc5_.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc6_)
   {
      var _loc1_ = _loc5_[_loc3_].split("\t");
      if(_loc1_.length != 1)
      {
         var _loc2_ = searchMapBtn(_loc1_[0])[0];
         var _loc4_ = Number(_loc1_[1]);
         if(_loc2_)
         {
            _loc2_.hit.enabled = _loc4_;
            lib.info.TextColor.setWorldMapTextColor(_loc4_,"field",_loc2_.txt);
         }
      }
      _loc3_ = _loc3_ + 1;
   }
};
myListener.OnGame_WorldMap_RemoveMapButton = function(dataList)
{
   var _loc3_ = dataList.split("\n");
   var _loc4_ = _loc3_.length;
   if(_loc3_[_loc4_ - 1] == "0" || _loc3_[_loc4_ - 1] == "undefined" || _loc3_[_loc4_ - 1] == "")
   {
      _loc3_.pop();
   }
   _loc4_ = _loc3_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc4_)
   {
      var _loc1_ = searchMapBtn(_loc3_[_loc2_])[0];
      if(_loc1_)
      {
         lib.manager.ToolTip.remove(_loc1_);
         _loc1_.removeMovieClip();
      }
      _loc2_ = _loc2_ + 1;
   }
};
var mapMode = 0;
myListener.OnGame_WorldMap_SetMode = function(mode)
{
   mode = Number(mode);
   mapMode = mode;
   myListener.OnGame_WorldMap_Clear();
   if(mode == 0)
   {
      container_mc.title2_txt.text = "$241001";
      container_mc.combobox1._visible = true;
      container_mc.combobox2._visible = true;
   }
   else if(mode == 1)
   {
      container_mc.title2_txt.text = "$241002";
      container_mc.combobox1._visible = false;
      container_mc.combobox2._visible = false;
   }
   else if(mode == 2)
   {
      container_mc.title2_txt.text = "$241003";
      container_mc.combobox1._visible = false;
      container_mc.combobox2._visible = false;
   }
   else if(mode == 3)
   {
      container_mc.title2_txt.text = "$241004";
      container_mc.combobox1._visible = false;
      container_mc.combobox2._visible = true;
   }
   else if(mode == 4)
   {
      container_mc.title2_txt.text = "$241005";
      container_mc.combobox1._visible = false;
      container_mc.combobox2._visible = false;
   }
   noClickerWork();
};
var clickedSkillId = null;
var clickCommanderSkill = false;
myListener.OnGame_BattleFieldMap_SetCommanderSkillSlot = function(dataList)
{
   if(dataList == undefined || dataList == "")
   {
      clearCommanderInfo();
      return undefined;
   }
   if(mapMode == 1)
   {
      var delayCount2 = 0;
      container_mc.onEnterFrame = function()
      {
         if(delayCount2 > 1)
         {
            delete this.onEnterFrame;
            SkillSet(dataList);
         }
         delayCount2++;
      };
   }
};
myListener.OnGame_BattleFieldMap_DisableSkill = function(_bTrue)
{
   var _loc2_ = Number(_bTrue);
   for(skill in container_mc.commander_mc)
   {
      if(typeof container_mc.commander_mc[skill] == "movieclip")
      {
         var _loc1_ = container_mc.commander_mc[skill];
         _loc1_.disableSlot = _loc2_;
      }
   }
};
myListener.OnGame_BattleFieldMap_CancelPrepareCommanderSkill = function()
{
   for(skill in container_mc.commander_mc)
   {
      if(typeof container_mc.commander_mc[skill] == "movieclip")
      {
         var _loc1_ = container_mc.commander_mc[skill];
         if(_loc1_.id == clickedSkillId)
         {
            _loc1_.active = false;
            _loc1_.FX_ACTIVE.gotoAndStop(1);
            break;
         }
      }
   }
   clickCommanderSkill = false;
   clickedSkillId = null;
   container_mc.range_mc._visible = false;
   delete container_mc.range_mc.onEnterFrame;
};
myListener.OnGame_MouseDown = function(button, target)
{
   if(timerId != null)
   {
      clearTimeout(timerId);
      closePopup();
   }
   if(_global.control)
   {
      if(container_mc._xmouse >= 10 && container_mc._xmouse < 1034 && container_mc._ymouse >= 79 && container_mc._ymouse < 847)
      {
         var _loc8_ = "";
         _loc8_ = _loc8_ + (container_mc._xmouse - container_mc.marker_mc._x + "@" + (container_mc._ymouse - container_mc.marker_mc._y));
         _root.ToGame_CTRLMouseDown("WorldMap2",_loc8_);
      }
   }
   else
   {
      if(button == 1 && checkPointMode)
      {
         if(!(container_mc._xmouse >= 10 && container_mc._xmouse < 1034 && container_mc._ymouse >= 79 && container_mc._ymouse < 140))
         {
            lockPointButton(1);
            _loc8_ = container_mc._xmouse - container_mc.marker_mc._x + "@" + (container_mc._ymouse - container_mc.marker_mc._y);
            ToGame_WorldMap_CheckPointClick("WorldMap2",_loc8_);
         }
      }
      if(button == 1 && clickCommanderSkill)
      {
         if(container_mc._xmouse >= 10 && container_mc._xmouse < 1034 && container_mc._ymouse >= 79 && container_mc._ymouse < 847)
         {
            ToGame_BattleFieldMap_UseCommanderSkill(clickedSkillId,container_mc._xmouse - 10,container_mc._ymouse - 79);
            delete container_mc.range_mc.onEnterFrame;
            container_mc.range_mc._visible = false;
            clickCommanderSkill = false;
         }
      }
   }
   var _loc4_ = target.toString().split(".");
   if(button == 2 && _loc4_[2].toLowerCase() == "worldmap2")
   {
      if(_loc4_[7].toLowerCase() == "pointhit")
      {
         if(deleteLock)
         {
            return undefined;
         }
         var _loc6_ = target._parent._x;
         var _loc5_ = target._parent._y;
         ToGame_WorldMap_CheckPointDel(_loc6_,_loc5_);
      }
      if(target._parent.MDRNAME == "number")
      {
         if(deleteLock)
         {
            return undefined;
         }
         selectedNumberId = target._parent.questId;
         container_mc.popup._visible = true;
         timerId = setTimeout(closePopup,2000);
         container_mc.popup._x = UI._xmouse;
         container_mc.popup._y = UI._ymouse;
      }
      else
      {
         ToGame_WorldMap_RespondCommand(upLevelLinkSave);
      }
   }
};
var timerId = null;
var coolTimer;
container_mc.popup._visible = false;
container_mc.popup.line_0.txt.text = lib.util.UIString.getUIString("$241209");
container_mc.popup.line_1.txt.text = lib.util.UIString.getUIString("$241210");
container_mc.popup.line_0.txt.verticalAlign = "center";
container_mc.popup.line_1.txt.verticalAlign = "center";
container_mc.popup.line_0.hit.onRollOver = container_mc.popup.line_1.hit.onRollOver = function()
{
   clearTimeout(timerId);
   timerId = null;
   this._parent.gotoAndStop(2);
   this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
   this._parent.txt.shadowColor = 16777215;
};
container_mc.popup.line_0.hit.onRollOut = container_mc.popup.line_0.hit.onReleaseOutside = container_mc.popup.line_1.hit.onRollOut = container_mc.popup.line_1.hit.onReleaseOutside = function()
{
   timerId = setTimeout(closePopup,1000);
   this._parent.gotoAndStop(1);
   this._parent.txt.textColor = lib.info.TextColor.SUBMENU_NORMAL;
   this._parent.txt.shadowColor = 0;
};
container_mc.popup.line_0.hit.onRelease = function()
{
   this._parent.gotoAndStop(2);
   this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
   this._parent.txt.shadowColor = 0;
   ToGame_WorldMap_RequestRemoveNumber();
};
container_mc.popup.line_1.hit.onRelease = function()
{
   this._parent.gotoAndStop(2);
   this._parent.txt.textColor = lib.info.TextColor.SUBMENU_OVER;
   this._parent.txt.shadowColor = 0;
   closePopup();
};
container_mc.popup._visible = false;
var selectedNumberId = null;
var delayCount = 0;
var coolTimeData = [];
myListener.OnGame_BattleFieldMap_SetCommanderSkillCoolTime = function(id, remain, total)
{
   var _loc4_ = new Object();
   _loc4_.id = id;
   _loc4_.remain = remain;
   _loc4_.total = total;
   coolTimeData.push(_loc4_);
   if(delayCount > 0)
   {
      return undefined;
   }
   container_mc.commander_mc.onEnterFrame = function()
   {
      delayCount++;
      if(delayCount > 3)
      {
         delete container_mc.commander_mc.onEnterFrame;
         delayCount = 0;
         var _loc3_ = coolTimeData.length;
         var _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            var _loc1_ = coolTimeData[_loc2_];
            SkillCoolTimeMotion(_loc1_.id,_loc1_.remain,_loc1_.total);
            _loc2_ = _loc2_ + 1;
         }
         coolTimeData = [];
      }
   };
};
container_mc.freeNamed_mc.title_txt.verticalAlign = "center";
myListener.OnGame_WorldMap_SetFreeNamedVisible = function(visible)
{
   var _loc2_ = container_mc.freeNamed_mc;
   visible = Number(visible);
   _loc2_._visible = visible;
};
var positions = [{x:40,y:116},{x:1001,y:116},{x:1001,y:810},{x:40,y:810}];
var maxNamedCount = 10;
var NAMED_NAME = 0;
var NAMED_STATE = 1;
var NAMED_BG_HEIGHT = 93;
var NAMED_LIST_HEIGHT = 29;
var NAMED_LIST_WIDTH = 200;
var NAMED_LIST_POS_X = 6;
var NAMED_LIST_START_Y = 34;
var curListCount = 0;
myListener.OnGame_WorldMap_SetFreeNamedList = function(namedList, posIndex)
{
   var _loc3_ = container_mc.freeNamed_mc;
   var _loc8_ = namedList.split("\n");
   if(_loc8_[_loc8_.length - 1] == "undefined" || _loc8_[_loc8_.length - 1] == "")
   {
      _loc8_.splice(_loc8_.length - 1,1);
   }
   var _loc7_ = _loc8_.length;
   var _loc11_ = curListCount - _loc7_;
   var _loc1_ = 0;
   var _loc2_ = null;
   var _loc4_ = null;
   var _loc5_ = new TextFormat();
   if(_loc11_ < 0)
   {
      _loc11_ = Math.abs(_loc11_);
      _loc1_ = curListCount;
      while(_loc1_ < _loc7_)
      {
         _loc2_ = _loc3_.attachMovie("freeNamedList","list_" + String(_loc1_),_loc3_.getNextHighestDepth(),{_x:NAMED_LIST_POS_X,_y:NAMED_LIST_START_Y + NAMED_LIST_HEIGHT * _loc1_});
         _loc4_ = _loc2_.createTextField("txt",_loc2_.getNextHighestDepth(),40,0,230,28);
         _loc4_.html = true;
         _loc4_.multiline = true;
         _loc4_.verticalAlign = "center";
         _loc4_.textAutoSize = "shrink";
         _loc5_.color = 16777215;
         _loc5_.size = 17;
         _loc5_.font = "$NormalFont";
         _loc4_.setNewTextFormat(_loc5_);
         _loc1_ = _loc1_ + 1;
      }
   }
   else if(_loc11_ > 0)
   {
      _loc1_ = _loc7_;
      while(_loc1_ < curListCount)
      {
         _loc2_ = _loc3_["list_" + String(_loc1_)];
         _loc2_.removeMovieClip();
         _loc1_ = _loc1_ + 1;
      }
   }
   curListCount = _loc7_;
   _loc4_ = null;
   var _loc12_ = new TextFormat();
   _loc1_ = 0;
   while(_loc1_ < _loc7_)
   {
      var _loc6_ = _loc8_[_loc1_].split("\t");
      _loc2_ = _loc3_["list_" + _loc1_];
      _loc4_ = _loc2_.txt;
      if(_loc6_[1] == "0")
      {
         _loc4_.textColor = lib.info.TextColor.GENERAL_IMPOSSIBLE;
         _loc2_.icon.gotoAndStop(2);
      }
      else
      {
         _loc4_.textColor = 16777215;
         _loc2_.icon.gotoAndStop(1);
      }
      _loc4_.htmlText = _loc6_[0];
      _loc1_ = _loc1_ + 1;
   }
   _loc3_.bg._height = (_loc7_ - 1) * NAMED_LIST_HEIGHT + NAMED_BG_HEIGHT;
   _loc3_.timer_txt._y = _loc3_.bg._height - 33;
   setFreeNamedInfoPos(posIndex);
};
myListener.OnGame_WorldMap_SetFreeNamedTimer = function(time)
{
   var _loc1_ = container_mc.freeNamed_mc.timer_txt;
   _loc1_.textColor = 16711680;
   _loc1_.htmlText = "<img src=\'freeNamed_Icon_Timer\' vspace=\'-7\'> " + time;
};
var markerContainerXY = {x:container_mc.marker_mc._x,y:container_mc.marker_mc._y};
var guardStates;
var sectionStates;
container_mc.combobox1.addListener(container_mc.combobox1);
container_mc.combobox2.addListener(container_mc.combobox2);
container_mc.combobox1.onChanged = function(This, selected, selectedIndex)
{
   ToGame_WorldMap_RespondCommand(selected);
};
container_mc.combobox2.onChanged = function(This, selected, selectedIndex)
{
   ToGame_WorldMap_RespondCommand(selected);
};
container_mc.combobox1.rowMax = 6;
container_mc.combobox2.rowMax = 6;
myListener.OnGame_WorldMap_SetComboBox = function(guardInfo, sectionInfo)
{
   var _loc13_ = [];
   var _loc12_ = [];
   var _loc6_ = guardInfo.split("\n");
   if(_loc6_[_loc6_.length - 1] == "undefined" || _loc6_[_loc6_.length - 1] == "")
   {
      _loc6_.splice(_loc6_.length - 1,1);
   }
   var _loc3_ = 0;
   while(_loc3_ < _loc6_.length)
   {
      var _loc1_ = _loc6_[_loc3_].split("\t");
      if(_loc1_.length != 1)
      {
         var _loc2_ = _loc1_[1];
         var _loc7_ = _loc1_[0];
         var _loc11_ = _loc1_[2];
         var _loc4_ = 1;
         if(_loc1_[2] == "1")
         {
            _loc2_ = notExploredStr;
            _loc4_ = 0;
         }
         else if(_loc1_[2] == "2")
         {
            _loc2_ = notSelectedStr;
            _loc4_ = 0;
         }
         _loc13_.push({label:_loc2_,id:_loc7_,enable:_loc4_});
      }
      _loc3_ = _loc3_ + 1;
   }
   container_mc.combobox1.data = _loc13_;
   var _loc5_ = sectionInfo.split("\n");
   if(_loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
   {
      _loc5_.splice(_loc5_.length - 1,1);
   }
   _loc3_ = 0;
   while(_loc3_ < _loc5_.length)
   {
      _loc1_ = _loc5_[_loc3_].split("\t");
      if(_loc1_.length != 1)
      {
         _loc2_ = _loc1_[1];
         _loc7_ = _loc1_[0];
         _loc11_ = _loc1_[2];
         _loc4_ = 1;
         if(_loc1_[2] == "1")
         {
            _loc2_ = notExploredStr;
            _loc4_ = 0;
         }
         else if(_loc1_[2] == "2")
         {
            _loc2_ = notSelectedStr;
            _loc4_ = 0;
         }
         _loc12_.push({label:_loc2_,id:_loc7_,enable:_loc4_});
      }
      _loc3_ = _loc3_ + 1;
   }
   container_mc.combobox2.data = _loc12_;
};
myListener.OnGame_WorldMap_SetMarkerCoolTime = function(targetID, coolTime)
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
myListener.OnGame_AgitMap_SetComboBox = function(dataList)
{
   myListener.OnGame_WorldMap_SetComboBox("",dataList);
};
var checkPointMode = false;
myListener.OnGame_WorldMap_SetPartyMarkerButton = function(dataList)
{
   setResize(0);
   clearPointButton();
   if(dataList == undefined || dataList == "")
   {
      return undefined;
   }
   var _loc3_ = setMarkerBtn(dataList,"partyPointBtn",948,122,0,60);
   var _loc2_ = container_mc.point_mc.attachMovie("clearPointBtn","clearMc",container_mc.point_mc.getNextHighestDepth());
   _loc2_._x = 953;
   _loc2_._y = _loc3_;
   _loc2_.onPress = function()
   {
      this.btn.gotoAndStop(3);
   };
   _loc2_.onRollOver = function()
   {
      this.btn.gotoAndStop(2);
   };
   _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
   {
      this.btn.gotoAndStop(1);
   };
   _loc2_.onRelease = function()
   {
      this.btn.gotoAndStop(1);
      ToGame_WorldMap_PointAllClear();
   };
};
myListener.OnGame_WorldMap_SetCheckPointButton = function(dataList)
{
   clearPointButton();
   if(dataList == undefined || dataList == "")
   {
      setResize(0);
      return undefined;
   }
   setResize(41);
   setMarkerBtn(dataList,"checkPointBtn",18,85,150,0);
};
var DarkRiftFocus = -2;
var darkRewardTextColor = ["#737373","#00BAFF"];
myListener.OnGame_WorldMap_DarkRiftGuard = function(dataList)
{
   var _loc3_ = container_mc.DarkRiftMc.page1;
   var _loc2_ = container_mc.DarkRiftMc.page2;
   var _loc1_ = dataList.split("\t");
   _loc3_.txt0.text = _loc2_.txt0.text = lib.util.UIString.getUIString("$241213") + _loc1_[0];
   _loc3_.txt1.text = _loc2_.txt1.text = lib.util.UIString.getUIString("$241214") + _loc1_[1] + " / " + _loc1_[2];
};
myListener.OnGame_WorldMap_DarkRiftReady = function(str)
{
   container_mc.DarkRiftMc.page0.txt0.htmlText = str;
};
myListener.OnGame_WorldMap_DarkRiftMap = function(dataList)
{
   var _loc2_ = container_mc.DarkRiftMc.page2;
   var _loc1_ = dataList.split("\t");
   _loc2_.txt2.text = _loc1_[0];
   _loc2_.txt3.text = lib.util.UIString.getUIString("$241214") + _loc1_[1] + " / " + _loc1_[2];
};
var slotDataCheck = false;
myListener.OnGame_WorldMap_DarkRiftMode = function(bool, page, slotData)
{
   var _loc3_ = Boolean(Number(bool));
   var _loc1_ = container_mc.DarkRiftMc;
   if(!_loc3_)
   {
      container_mc.DarkRiftMc.removeMovieClip();
      return undefined;
   }
   if(!_loc1_)
   {
      _loc1_ = container_mc.attachMovie("DarkRift","DarkRiftMc",container_mc.point_mc.getNextHighestDepth());
      _loc1_._x = 30;
      _loc1_._y = 125;
      DarkRiftBtn(_loc1_.page3,"3");
      DarkRiftBtn(_loc1_.page0,"0");
      DarkRiftBtn(_loc1_.page1,"1");
      DarkRiftBtn(_loc1_.page2,"2");
   }
   if(slotData != undefined)
   {
      _loc1_.page1.slotBox._visible = true;
      DarkSlot(_loc1_.page1,slotData);
   }
   else
   {
      _loc1_.page1.slotBox._visible = false;
   }
   if(DarkRiftFocus == page)
   {
      return undefined;
   }
   if(page == "-1")
   {
      page = 3;
   }
   DarkRiftFocus = page;
   DarkRiftPage(_loc1_,page);
};
container_mc.txtLeftTimeTitle._visible = false;
container_mc.txtLeftTime._visible = false;
container_mc.txtLeftTimeTitle.text = lib.util.UIString.getUIString("$241212");
container_mc.txtLeftTime._x = container_mc.txtLeftTimeTitle._x + container_mc.txtLeftTimeTitle.textWidth + 10;
myListener.OnGame_GT_SetLeftTime = function(showUI, leftTime)
{
   container_mc.txtLeftTimeTitle._visible = showUI;
   container_mc.txtLeftTime._visible = showUI;
   if(showUI)
   {
      var _loc1_ = leftTime.split(":");
      container_mc.txtLeftTime.htmlText = String(_loc1_[0] + "시간 " + _loc1_[1] + "분 " + _loc1_[2] + "초 남음");
   }
};
container_mc.txtMapStatus._visible = false;
myListener.OnGame_GT_SetMapStatus = function(showUI, txtStatus)
{
   container_mc.txtMapStatus._visible = showUI;
   if(showUI)
   {
      container_mc.txtMapStatus.htmlText = String(txtStatus);
   }
};
var deleteLock = false;
myListener.OnGame_WorldMap_DisableMapMarkerDelete = function(bool)
{
   bool = Boolean(Number(bool));
   deleteLock = bool;
   setVisibleBottomInfo();
};
lib.manager.ToolTip.add(container_mc.siegeWarLeftTimeMc,lib.util.UIString.getUIString("$241225"),1);
container_mc.siegeWarLeftTimeMc._visible = false;
container_mc.siegeWarLeftTowerMc._visible = false;
myListener.OnGame_WorldMap_SetSiegeWarLeftTime = function(leftTime)
{
   container_mc.siegeWarLeftTimeMc._visible = true;
   var _loc1_ = leftTime.split(":");
   var _loc2_ = lib.util.UIString.getUIString("$241226","time",_loc1_[0],"min",_loc1_[1],"sec",_loc1_[2]);
   container_mc.siegeWarLeftTimeMc.textFd.text = _loc2_;
};
myListener.OnGame_WorldMap_SetSiegeWarLeftTower = function(leftTower)
{
   container_mc.siegeWarLeftTowerMc._visible = true;
   container_mc.siegeWarLeftTowerMc.textFd.text = String(leftTower);
};
var gotoUpDepth_btn = container_mc.gotoUpDepthBtn.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var BUTTON_STATE_HIDE = 0;
var BUTTON_STATE_ENABLED = 1;
var BUTTON_STATE_DISABLED = 2;
var BUTTON_TYPE_FIELDEVENT = 0;
var BUTTON_TYPE_FIELDEVENT_TRACKING = 1;
var BUTTON_TYPE_FIELDEVENT_REWARD = 2;
var BUTTON_TYPE_FIELDEVENT_REWARD_FIELD_EVENT = 3;
var BUTTON_TYPE_FIELDEVENT_REWARD_FLYING_NB = 4;
var BUTTON_MODE_NORMAL = 0;
var BUTTON_MODE_FIEDL_EVENT = 1;
var REWARD_TYPE_BUTTON = 0;
var REWARD_TYPE_GAGE = 1;
var bVisibleFieldEvent = false;
myListener.OnGame_WorldMap_SetFieldEventButton = function(buttonState, buttonMode)
{
   buttonMode = Number(buttonMode);
   var _loc4_ = buttonState != BUTTON_STATE_HIDE?true:false;
   var _loc3_ = buttonState != BUTTON_STATE_ENABLED?false:true;
   container_mc.fieldEventButton._visible = _loc4_;
   var _loc1_ = false != _loc3_?1:4;
   container_mc.fieldEventButton.img_on._visible = BUTTON_MODE_FIEDL_EVENT == buttonMode;
   container_mc.fieldEventButton.img_off._visible = BUTTON_MODE_NORMAL == buttonMode;
   container_mc.fieldEventButton.img_on.gotoAndStop(_loc1_);
   container_mc.fieldEventButton.img_off.gotoAndStop(_loc1_);
   container_mc.fieldEventButton.bg.gotoAndStop(_loc1_);
   container_mc.fieldEventButton.buttonMode = buttonMode;
   setFieldEventButtonTooltip();
};
myListener.OnGame_WorldMap_SetFieldEventInfo = function(bVisible, nameStr, cur, max, buttonNum, bGageVisible)
{
   var _loc1_ = container_mc.fieldEventMc;
   bVisibleFieldEvent = Boolean(Number(bVisible));
   cur = Number(cur);
   max = Number(max);
   buttonNum = Number(buttonNum);
   bGageVisible = Boolean(Number(bGageVisible));
   _loc1_.titleTF.htmlText = nameStr;
   _loc1_.gage.setGage(cur,max);
   _loc1_.gage.setButton(buttonNum);
   _loc1_.gage._visible = bGageVisible;
   _loc1_.mc_reward_new._visible = false;
   setVisibleBottomInfo();
};
myListener.OnGame_WorldMap_SetFieldEventInfo2 = function(visible, titleText, rewardCurrent, rewardMax, rewardCountFieldEvent, rewardCountFlyingNB)
{
   visible = Boolean(Number(visible));
   rewardCurrent = Number(rewardCurrent);
   rewardMax = Number(rewardMax);
   rewardCountFieldEvent = Number(rewardCountFieldEvent);
   rewardCountFlyingNB = Number(rewardCountFlyingNB);
   bVisibleFieldEvent = visible;
   var _loc2_ = container_mc.fieldEventMc;
   _loc2_.gage._visible = false;
   _loc2_.mc_reward_new._visible = true;
   var _loc1_ = _loc2_.mc_reward_new;
   _loc1_.text_reward.text = lib.util.UIString.getUIString("$720014","current",rewardCurrent,"max",rewardMax);
   setRewardButtonCount(_loc1_.button_field_event,_loc1_.mc_count_field_event,rewardCountFieldEvent);
   setRewardButtonCount(_loc1_.button_flying_nb,_loc1_.mc_count_flying_nb,rewardCountFlyingNB);
   setVisibleBottomInfo();
};
myListener.OnGame_WorldMap_SetFieldEventTrackingButton = function(bEnabled, cool)
{
   bEnabled = Boolean(Number(bEnabled));
   var _loc1_ = container_mc.fieldEventMc.trackButton.txtBtn;
   _loc1_.setEnabled(bEnabled);
   var _loc3_ = lib.util.UIString.getUIString("720003");
   var _loc4_ = !bEnabled?_loc3_ + "(" + cool + ")":_loc3_;
   _loc1_.setText(_loc4_);
};
myListener.OnGame_WorldMap_UpdateFieldEventRewardButton = function(num)
{
   num = Number(num);
   container_mc.fieldEventMc.gage.setButton(num);
};
myListener.OnGame_WorldMap_SetFieldEventTime = function(id, timeStr, colorType)
{
   var _loc2_ = searchMarker(id);
   if(undefined == _loc2_)
   {
      return undefined;
   }
   colorType = Number(colorType);
   var _loc1_ = _loc2_.attachMovie("fieldEventTimeMc","fieldEventTimeMc",_loc2_.getNextHighestDepth());
   _loc1_.swapDepths(_loc2_.out);
   _loc1_._y = 12;
   _loc1_.hitTestDisable = true;
   _loc1_.tf.htmlText = timeStr;
   var _loc4_ = 1 != colorType?"0xD2F2FF":"0xFF0000";
   _loc1_.tf.textColor = _loc4_;
};
myListener.OnGame_WorldMap_RemoveFieldEventTime = function(id)
{
   var _loc1_ = searchMarker(id);
   if(undefined == _loc1_)
   {
   }
   var _loc2_ = _loc1_.fieldEventTimeMc;
   if(_loc2_)
   {
      _loc2_.removeMovieClip();
   }
};
myListener.OnGame_WorldMap_SetIslandPosition = function($x, $y)
{
   floatingIsland._x = $x;
   floatingIsland._y = $y;
};
initFieldEvent();
gotoUpDepth_btn.setRelease(gotoUp);
x_btn.setRelease(closeUI);
myListener.OnGame_WorldMap_SetMode(0);
lib.util.DrawBitmap.draw(container_mc.DGbg_mc,"img://__WMap_ETC.WMap_ETC_Empty");
container_mc.guildInfo_mc._visible = false;
fscommand("ToGame_WorldMap_Init");
