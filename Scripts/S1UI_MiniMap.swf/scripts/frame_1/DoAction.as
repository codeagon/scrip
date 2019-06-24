_global.gfxExtensions = true;
var UI = this;
UI._visible = false;
var UIname = "MiniMap";
var _scope = this;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var bWindowOpen = false;
var opened = false;
var rotateMode = 0;
var zoneId = null;
var reduceTax = null;
var bMinimizeMode = false;
var bEnableChannel = false;
var bRestZone = false;
var bPkZone = false;
var bFishingZone = false;
var axis = new lib.util.AxisResetter();
var icon_array = new Array();
var multyIconMenu = container_mc.multyIconMenu;
container_mc.channel_mc.bg1.UIDrager.setData(UIname,UI,container_mc.lock_mc);
container_mc.channel_mc.bg2.UIDrager.setData(UIname,UI,container_mc.lock_mc);
container_mc.channel_mc.bg1.UIDrager.adjustDragLimit(50,-81,0,-11);
container_mc.channel_mc.bg2.UIDrager.adjustDragLimit(50,0,0,-11);
var textAlpha = 80;
container_mc.channel_mc.change_txt._alpha = textAlpha;
container_mc.channel_mc.change_txt.textAutoSize = "shrink";
container_mc.channel_mc.channel_txt._alpha = textAlpha;
container_mc.channel_mc.sectionName_txt._alpha = textAlpha;
container_mc.channel_mc.sectionName_txt.verticalAlign = "center";
container_mc.canUseHomun_mc.taxInfo._visible = false;
container_mc.senatorIcon_mc._visible = false;
container_mc.vote_mc._visible = false;
container_mc.guildWarIcon_mc._visible = false;
container_mc.BFIcon_mc._visible = false;
container_mc.dungenPartyIcon_mc._visible = false;
container_mc.eventIcon_mc._visible = false;
container_mc.fishing_mc._visible = false;
container_mc.vote_mc.effect.stop();
container_mc.multyIcon_mc.effect.stop();
container_mc.miniMap.roundBg._visible = false;
var rad = 0.017453292519943295;
var radius = 150;
var obj_Angle = new Object();
var sArc = 0;
multyIconMenu._visible = false;
multyIconMenu._alpha = 0;
multyIconMenu.lineH = 34;
multyIconMenu.length = 0;
multyIconMenu.array = [];
multyIconMenu.closeCount = 0;
multyIconMenu.addMenu = function(menuName, str)
{
   if(this.contains(menuName))
   {
      var _loc2_ = this[menuName];
      var _loc6_ = _loc2_.txt.text;
      if(_loc2_.txt.setText(str))
      {
         lib.manager.ToolTip.remove(_loc2_.txt);
         _loc2_.txt.fontScaleFactor = 0.8;
         _loc2_.txt.text = str;
         lib.util.ExtString.alignJoint(_loc2_.txt,_loc2_.txt.text);
         if(_loc2_.txt.numLines <= 1)
         {
            _loc2_.txt.text = str;
         }
      }
      else
      {
         _loc2_.txt.fontScaleFactor = 1;
         _loc2_.txt.text = str;
      }
      if(_loc6_ != _loc2_.txt.text)
      {
         this.setWarning(true);
      }
      return undefined;
   }
   Set_AlimIcon(true,menuName);
   _loc2_ = this.attachMovie("generalMenu_line",menuName,this.getNextHighestDepth());
   _loc2_._y = this.getLength() * this.lineH;
   _loc2_.over._visible = false;
   var _loc7_ = _loc2_.attachMovie(menuName + "_icon","icon",this.getNextHighestDepth(),{_x:7});
   if(_loc7_ != undefined)
   {
      _loc2_.txt._x = 43;
      _loc2_.txt._width = _loc2_.txt._width - 43;
   }
   _loc2_.over.hitTestDisable = true;
   _loc2_.txt.verticalAlign = "center";
   if(_loc2_.txt.setText(str))
   {
      lib.manager.ToolTip.remove(_loc2_.txt);
      _loc2_.txt.fontScaleFactor = 0.8;
      _loc2_.txt.text = str;
      lib.util.ExtString.alignJoint(_loc2_.txt,_loc2_.txt.text);
      if(_loc2_.txt.numLines <= 1)
      {
         _loc2_.txt.text = str;
      }
   }
   else
   {
      _loc2_.txt.fontScaleFactor = 1;
      _loc2_.txt.text = str;
   }
   _loc2_.hit.onRollOver = function()
   {
      this._parent.txt.textColor = 16777215;
      this._parent.txt.shadowColor = 5742335;
      this._parent.txt.shadowStrength = 1;
      this._parent.txt.shadowBlurX = this._parent.txt.shadowBlurY = 10;
      this._parent.txt.shadowDistance = 0;
      this._parent.over._visible = true;
      multyIconMenu.stopCloseCount();
   };
   _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
   {
      this._parent.txt.textColor = 7974357;
      this._parent.txt.shadowColor = 0;
      this._parent.txt.shadowStrength = 1.5;
      this._parent.txt.shadowBlurX = this._parent.txt.shadowBlurY = 3;
      this._parent.txt.shadowDistance = 0;
      this._parent.over._visible = false;
      multyIconMenu.close();
   };
   _loc2_.hit.onRelease = function()
   {
      var _loc2_ = this._parent._name;
      if(_loc2_ == "petition")
      {
         fscommand("ToGame_Petition_IconClick");
      }
      else if(_loc2_ == "couponbox")
      {
         fscommand("ToGame_CouponBox_IconClick");
      }
      else if(_loc2_ == "parcelpost")
      {
         fscommand("ToGame_MiniMap_ClickPostIcon");
      }
      this._parent.over._visible = false;
      multyIconMenu.close(true);
   };
   multyIconMenu.array.push(menuName);
   this.checkShowMultyIcon();
   this.setWarning(true);
   this.bg._height = this.getLength() * this.lineH + 18;
};
var tweenCompleteMode = false;
multyIconMenu.open = function()
{
   gs.TweenLite.killTweensOf(this,false);
   this._y = container_mc.multyIcon_mc._y + container_mc.multyIcon_mc._height;
   this._visible = true;
   gs.TweenLite.to(this,0.3,{_alpha:100,ease:gs.easing.Strong.easeInOut});
};
multyIconMenu.close = function(rightNow)
{
   this.closeCount = 0;
   tweenCompleteMode = true;
   if(rightNow)
   {
      this.closeCount = 5;
   }
   this.onEnterFrame = function()
   {
      if(this.closeCount >= 5)
      {
         delete this.onEnterFrame;
         gs.TweenLite.killTweensOf(this,false);
         gs.TweenLite.to(this,0.2,{_alpha:0,ease:gs.easing.Strong.easeInOut,onComplete:this.noVisible});
      }
      this.closeCount = this.closeCount + 1;
   };
};
multyIconMenu.stopCloseCount = function()
{
   this.closeCount = 0;
   tweenCompleteMode = false;
   delete this.onEnterFrame;
};
multyIconMenu.redraw = function()
{
   var _loc2_ = 0;
   while(_loc2_ < this.array.length)
   {
      var _loc3_ = this[this.array[_loc2_]];
      _loc3_._y = this.lineH * _loc2_;
      _loc2_ = _loc2_ + 1;
   }
   this.bg._height = this.getLength() * this.lineH + 18;
};
multyIconMenu.removeMenu = function(menuName)
{
   Set_AlimIcon(false,menuName);
   var _loc3_ = undefined;
   var _loc2_ = 0;
   while(_loc2_ < this.array.length)
   {
      if(this.array[_loc2_] == menuName)
      {
         _loc3_ = _loc2_;
         break;
      }
      _loc2_ = _loc2_ + 1;
   }
   if(_loc3_ != undefined)
   {
      this.array.splice(_loc3_,1);
      this[menuName].removeMovieClip();
   }
   this.checkShowMultyIcon();
   this.redraw();
};
multyIconMenu.contains = function(menuName)
{
   if(this[menuName] != undefined)
   {
      return true;
   }
   return false;
};
multyIconMenu.clear = function()
{
   this.array = [];
   this.checkShowMultyIcon();
};
multyIconMenu.getLength = function()
{
   return this.array.length;
};
multyIconMenu.setWarning = function(bTrue)
{
   if(bTrue)
   {
      container_mc.multyIcon_mc.effect._visible = true;
      container_mc.multyIcon_mc.effect.gotoAndPlay(2);
   }
   else
   {
      container_mc.multyIcon_mc.effect._visible = false;
      container_mc.multyIcon_mc.effect.gotoAndStop(1);
   }
};
multyIconMenu.checkShowMultyIcon = function()
{
   if(this.getLength() >= 1)
   {
      container_mc.multyIcon_mc._visible = true;
   }
   else
   {
      container_mc.multyIcon_mc._visible = false;
   }
};
multyIconMenu.noVisible = function()
{
   if(tweenCompleteMode)
   {
      multyIconMenu._visible = false;
   }
};
lib.manager.ToolTip.add(container_mc.optionOpen_mc,lib.util.UIString.getUIString("$022047"),1);
lib.manager.ToolTip.add(container_mc.enablePk_mc.btn,lib.info.ToolTipStr.PK_DISABLE,1);
lib.manager.ToolTip.add(container_mc.fishing_mc,lib.util.UIString.getUIString("$770011"),1);
HelpMsg._visible = false;
_scope.container_mc.HelpMsg.txt_mc._visible = false;
_scope.container_mc.HelpMsg.MenuBtn.MenuBtnEffect._visible = false;
var HelpMsgArray = new Array();
var HelpMsgTotalArray = new Array();
_scope.container_mc.HelpMsg._visible = false;
container_mc.enablePk_mc.btn.onRollOver = function()
{
   lib.util.FrameSeeker.seek(this._parent.over,1,4);
};
container_mc.enablePk_mc.btn.onRollOut = container_mc.enablePk_mc.btn.onReleaseOutside = function()
{
   lib.util.FrameSeeker.seek(this._parent.over,4,1);
};
container_mc.BFIcon_mc.btn.onRollOver = function()
{
   lib.util.FrameSeeker.seek(this._parent.over,1,4);
   this._parent.clickMe.gotoAndStop(2);
};
container_mc.BFIcon_mc.btn.onRollOut = container_mc.BFIcon_mc.btn.onReleaseOutside = function()
{
   lib.util.FrameSeeker.seek(this._parent.over,4,1);
   this._parent.clickMe.gotoAndStop(1);
};
container_mc.vote_mc.btn.onRollOver = function()
{
   lib.util.FrameSeeker.seek(this._parent.over,1,4);
   this._parent.clickMe.gotoAndStop(2);
};
container_mc.vote_mc.btn.onRollOut = container_mc.vote_mc.btn.onReleaseOutside = function()
{
   lib.util.FrameSeeker.seek(this._parent.over,4,1);
   this._parent.clickMe.gotoAndStop(1);
};
container_mc.multyIcon_mc.btn.onRelease = function()
{
   var _loc1_ = postArray[postFocus].name;
   if(_loc1_ == "petition")
   {
      fscommand("ToGame_Petition_IconClick");
   }
   else if(_loc1_ == "couponbox")
   {
      fscommand("ToGame_CouponBox_IconClick");
   }
   else if(_loc1_ == "parcelpost")
   {
      fscommand("ToGame_MiniMap_ClickPostIcon");
   }
};
container_mc.multyIcon_mc.btn.onRollOver = function()
{
   lib.util.FrameSeeker.seek(this._parent.over,1,4);
   this._parent.clickMe.gotoAndStop(2);
   multyIconMenu.stopCloseCount();
   multyIconMenu.open();
};
container_mc.multyIcon_mc.btn.onRollOut = container_mc.multyIcon_mc.btn.onReleaseOutside = function()
{
   lib.util.FrameSeeker.seek(this._parent.over,4,1);
   this._parent.clickMe.gotoAndStop(1);
   multyIconMenu.close();
   multyIconMenu.setWarning(false);
};
container_mc.guildWarIcon_mc.btn.onRollOver = function()
{
   fscommand("ToGame_GuildWar_SetIcon");
   lib.util.FrameSeeker.seek(this._parent.over,1,4);
   this._parent.clickMe.gotoAndStop(2);
   GuildWarMenuOpen();
};
container_mc.guildWarIcon_mc.btn.onRollOut = container_mc.guildWarIcon_mc.btn.onReleaseOutside = function()
{
   lib.util.FrameSeeker.seek(this._parent.over,4,1);
   this._parent.clickMe.gotoAndStop(1);
   GuildWarMenuClose();
};
var allSymbol_array = new Array();
var homunDisable = lib.gamedata.DefaultData.getDefaultUIData("homundisable").param0;
var unionDisable = lib.gamedata.DefaultData.getDefaultUIData("unionDisable").param0;
function checkIconVisible()
{
   var _loc1_ = 0;
   while(_loc1_ < icon_array.length)
   {
      if(icon_array[_loc1_].zoneID == zoneId)
      {
         icon_array[_loc1_].mc._visible = true;
      }
      else
      {
         icon_array[_loc1_].mc._visible = false;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function changeUITransform()
{
   var _loc2_ = searchCurVisibleSymbols();
   var _loc4_ = 1;
   if(lib.info.AlignInfo.yPixelToRatio(UI._y + hit._height * lib.info.AlignInfo.scaleRatio) < 80)
   {
      bTransformedY = false;
      if(bMinimizeMode)
      {
         var _loc1_ = 0;
         while(_loc1_ < _loc2_.length)
         {
            _loc2_[_loc1_]._y = iconPosStartY_T;
            _loc1_ = _loc1_ + 1;
         }
         container_mc.multyIconMenu._y = container_mc.multyIcon_mc._y + container_mc.multyIcon_mc._height;
         _loc4_ = 5;
      }
      else
      {
         _loc1_ = 0;
         while(_loc1_ < pos_array.length)
         {
            pos_array[_loc1_].mc._y = pos_array[_loc1_].y;
            _loc1_ = _loc1_ + 1;
         }
      }
      comboboxViewY = 43;
      comboboxHideY = comboboxViewY - container_mc.channel_mc.channelList._height;
      if(bComboboxOpen)
      {
         container_mc.channel_mc.channelList._y = comboboxViewY;
         container_mc.channel_mc.arrow_mc._rotation = 90;
      }
      else
      {
         container_mc.channel_mc.channelList._y = comboboxHideY;
         container_mc.channel_mc.arrow_mc._rotation = 0;
      }
      container_mc.channel_mc.mask_mc._y = comboboxViewY;
   }
   else
   {
      bTransformedY = true;
      if(bMinimizeMode)
      {
         _loc1_ = 0;
         while(_loc1_ < _loc2_.length)
         {
            _loc2_[_loc1_]._y = iconPosStartY_B;
            _loc1_ = _loc1_ + 1;
         }
         container_mc.multyIconMenu._y = container_mc.multyIcon_mc._y - container_mc.multyIconMenu._height;
         _loc4_ = 5;
      }
      else
      {
         _loc1_ = 0;
         while(_loc1_ < pos_array.length)
         {
            if(pos_array[_loc1_].mc._name == "vote_mc")
            {
               pos_array[_loc1_].mc._y = -276;
            }
            else if(pos_array[_loc1_].mc._name == "guildWarIcon_mc")
            {
               pos_array[_loc1_].mc._y = -290;
            }
            else if(pos_array[_loc1_].mc._name == "optionOpen_mc")
            {
               pos_array[_loc1_].mc._y = -51;
            }
            else if(pos_array[_loc1_].mc._name == "eventIcon_mc")
            {
               pos_array[_loc1_].mc._y = -263;
            }
            else
            {
               pos_array[_loc1_].mc._y = pos_array[_loc1_].y - 283;
            }
            _loc1_ = _loc1_ + 1;
         }
         _loc4_ = 3;
      }
      comboboxViewY = container_mc.channel_mc.bg2._y - container_mc.channel_mc.channelList._height;
      comboboxHideY = container_mc.channel_mc.bg2._y + 10;
      if(bComboboxOpen)
      {
         container_mc.channel_mc.channelList._y = comboboxViewY;
         container_mc.channel_mc.arrow_mc._rotation = -90;
      }
      else
      {
         container_mc.channel_mc.channelList._y = comboboxHideY;
         container_mc.channel_mc.arrow_mc._rotation = 0;
      }
      container_mc.channel_mc.mask_mc._y = comboboxViewY;
   }
   if(lib.info.AlignInfo.xPixelToRatio(UI._x + hit._width * lib.info.AlignInfo.scaleRatio) > 50)
   {
      if(bMinimizeMode)
      {
         var _loc3_ = undefined;
         _loc1_ = 0;
         while(_loc1_ < _loc2_.length)
         {
            if(_loc1_ == 0)
            {
               _loc3_ = iconPosStartX_R;
            }
            else
            {
               _loc3_ = _loc3_ - (iconWidth + iconGapX);
            }
            _loc2_[_loc1_]._x = _loc3_;
            _loc1_ = _loc1_ + 1;
         }
         container_mc.multyIconMenu._x = container_mc.multyIcon_mc._x - 120;
      }
      else
      {
         _loc1_ = 0;
         while(_loc1_ < pos_array.length)
         {
            pos_array[_loc1_].mc._x = pos_array[_loc1_].x;
            _loc1_ = _loc1_ + 1;
         }
         container_mc.multyIconMenu._x = -300;
      }
      container_mc.channel_mc.bg1._x = 161.8;
      container_mc.channel_mc.sectionName_txt._x = 213.4;
      container_mc.channel_mc.folder_mc._x = 442.8;
   }
   else
   {
      if(bEnableChannel)
      {
         container_mc.channel_mc.folder_mc._x = 442.8;
      }
      else
      {
         container_mc.channel_mc.folder_mc._x = 292;
      }
      if(bMinimizeMode)
      {
         _loc1_ = 0;
         while(_loc1_ < _loc2_.length)
         {
            if(_loc1_ == 0)
            {
               _loc3_ = iconPosStartX_L;
            }
            else
            {
               _loc3_ = _loc3_ + (iconWidth + iconGapX);
            }
            _loc2_[_loc1_]._x = _loc3_;
            _loc1_ = _loc1_ + 1;
         }
         container_mc.multyIconMenu._x = container_mc.multyIcon_mc._x - 120;
      }
      else
      {
         _loc1_ = 0;
         while(_loc1_ < pos_array.length)
         {
            if(pos_array[_loc1_].mc._name == "option")
            {
               pos_array[_loc1_].mc._x = pos_array[_loc1_].x + 330;
            }
            else if(pos_array[_loc1_].mc._name == "HelpMsg")
            {
               pos_array[_loc1_].mc._x = pos_array[_loc1_].x + 250;
            }
            else
            {
               pos_array[_loc1_].mc._x = pos_array[_loc1_].x - 150;
            }
            _loc1_ = _loc1_ + 1;
         }
         container_mc.multyIconMenu._x = -165;
         _loc4_ = 3 != _loc4_?2:4;
      }
      container_mc.channel_mc.bg1._x = 11.800000000000011;
      if(container_mc.channel_mc.bg1._visible)
      {
         container_mc.channel_mc.sectionName_txt._x = 63.400000000000006;
      }
      else
      {
         container_mc.channel_mc.sectionName_txt._x = 213.4;
      }
   }
   hit.gotoAndStop(_loc4_);
}
function searchCurVisibleSymbols()
{
   var _loc3_ = new Array();
   var _loc1_ = 0;
   while(_loc1_ < allSymbol_array.length)
   {
      var _loc2_ = allSymbol_array[_loc1_];
      if(_loc2_._visible)
      {
         _loc3_.push(_loc2_);
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc3_;
}
function showMinimap()
{
   var _loc2_ = lib.util.UIString.getUIString("$022062");
   bMinimizeMode = false;
   container_mc.miniMap._visible = true;
   if(_global.gbUIMode)
   {
      container_mc.optionOpen_mc._visible = true;
   }
   container_mc.channel_mc.folder_mc.gotoAndStop(1);
   lib.manager.ToolTip.add(container_mc.channel_mc.folder_mc,_loc2_,1);
   changeUITransform();
}
function hideMinimap()
{
   var _loc1_ = lib.util.UIString.getUIString("$022063");
   bMinimizeMode = true;
   container_mc.miniMap._visible = false;
   container_mc.optionOpen_mc._visible = false;
   container_mc.channel_mc.folder_mc.gotoAndStop(2);
   lib.manager.ToolTip.add(container_mc.channel_mc.folder_mc,_loc1_,1);
   if(opened)
   {
      hideOption();
   }
   changeUITransform();
}
function optionLoad()
{
   if(optionLoded)
   {
      return undefined;
   }
   container_mc.option.bg_mc._height = optinList.length * 36 + 10;
   optionLoded = true;
   var _loc6_ = 0;
   while(_loc6_ < optinList.length)
   {
      var _loc7_ = optinList[_loc6_];
      var _loc2_ = container_mc.option.content_mc.attachMovie("optionLine","check_" + _loc7_,container_mc.option.content_mc.getNextHighestDepth());
      _loc2_._x = 9;
      _loc2_._y = 36 * _loc6_ + 5;
      _loc2_.txt.text = OPTIONSTR[_loc7_ - 1];
      _loc2_.txt.verticalAlign = "center";
      _loc2_.txt.textAutoSize = "shrink”";
      _loc2_.checkMc.stat = _loc7_;
      _loc2_.checkMc.onChanged = function()
      {
         var _loc4_ = "";
         var _loc1_ = 0;
         while(_loc1_ < optinList.length)
         {
            var _loc2_ = optinList[_loc1_];
            var _loc3_ = container_mc.option.content_mc["check_" + _loc2_].checkMc;
            _loc4_ = _loc4_ + (optionToSave(Number(_loc2_)) + "\b" + Number(_loc3_.checked) + "\t");
            _loc1_ = _loc1_ + 1;
         }
         g4.util.Debug.log("#: " + _loc4_);
         ToGame_MiniMap_CloseOption(_loc4_);
      };
      _loc6_ = _loc6_ + 1;
   }
}
function optionToSave($index)
{
   var _loc1_ = 0;
   switch($index)
   {
      case 1:
         _loc1_ = 7;
         break;
      case 2:
         _loc1_ = 7;
         break;
      case 3:
         _loc1_ = 0;
         break;
      case 4:
         _loc1_ = 1;
         break;
      case 5:
         _loc1_ = 2;
         break;
      case 6:
         _loc1_ = 3;
         break;
      case 7:
         _loc1_ = 6;
         break;
      case 8:
         _loc1_ = 4;
         break;
      case 9:
         _loc1_ = 5;
         break;
      default:
         _loc1_ = 7;
   }
   return _loc1_;
}
function optionToLoad($index)
{
   var _loc1_ = 0;
   switch($index)
   {
      case 0:
         _loc1_ = 3;
         break;
      case 1:
         _loc1_ = 4;
         break;
      case 2:
         _loc1_ = 5;
         break;
      case 3:
         _loc1_ = 6;
         break;
      case 4:
         _loc1_ = 8;
         break;
      case 5:
         _loc1_ = 9;
         break;
      case 6:
         _loc1_ = 7;
         break;
      default:
         _loc1_ = 0;
   }
   return _loc1_;
}
function hideOption()
{
   opened = false;
   container_mc.option._visible = false;
   container_mc.optionOpen_mc.gotoAndStop(1);
}
function addIcon(iconID, iconType, icon_x, icon_y)
{
   var _loc3_ = 100;
   if(iconType == 2)
   {
      _loc3_ = 80;
   }
   else if(iconType == 3)
   {
      _loc3_ = 70;
   }
   else if(iconType >= 20 && iconType <= 23)
   {
      _loc3_ = 70;
   }
   else if(iconType >= 25 && iconType <= 35)
   {
      _loc3_ = 70;
   }
   else if(iconType >= 200 && iconType <= 205)
   {
      _loc3_ = 70;
   }
   else if(iconType >= 36 && iconType <= 45)
   {
      _loc3_ = 70;
   }
   var _loc5_ = "icon_" + iconType;
   var _loc4_ = checkOutSide(icon_x,icon_y);
   var _loc1_ = container_mc.miniMap.inside.iconDraw.attachMovie(_loc5_,iconID,container_mc.miniMap.inside.iconDraw.getNextHighestDepth());
   _loc1_._xscale = _loc1_._yscale = _loc3_;
   if(_loc3_ == 70)
   {
      _loc1_.icon_outside._xscale = _loc1_.icon_outside._yscale = 160;
   }
   else if(_loc3_ == 80)
   {
      _loc1_.icon_outside._xscale = _loc1_.icon_outside._yscale = 110;
   }
   _loc1_.iconType = iconType;
   _loc1_._x = icon_x;
   _loc1_._y = icon_y;
   _loc1_.cnt = 0;
   _loc1_.icon_outside._visible = false;
   setOutSide(_loc1_,_loc4_.bOutSide,_loc4_.nRotation);
   return _loc1_;
}
function setOutSide(targetIcon, bOutSide, Rotation)
{
   if(bOutSide)
   {
      targetIcon.icon_outside._visible = true;
      targetIcon.icon_default._visible = false;
   }
   else
   {
      targetIcon.icon_outside._visible = false;
      targetIcon.icon_default._visible = true;
   }
   targetIcon.icon_outside._rotation = Rotation;
}
function checkOutSide(posX, posY)
{
   var _loc2_ = Number(posX - R);
   var _loc1_ = Number(posY - R);
   var _loc4_ = _loc2_ * _loc2_ + _loc1_ * _loc1_;
   if(_loc4_ > R * R)
   {
      var _loc3_ = Math.sqrt(_loc4_);
      var _loc6_ = R * _loc2_ / _loc3_ + R;
      var _loc5_ = R * _loc1_ / _loc3_ + R;
      var _loc8_ = (- _loc1_) / _loc2_;
      var _loc7_ = 180 * Math.atan2(_loc1_,_loc2_) / 3.141592653589793 + 90;
      return {_x:_loc6_,_y:_loc5_,bOutSide:true,nRotation:_loc7_};
   }
   return {_x:posX,_y:posY,bOutSide:false};
}
function updateIconPosition(iconID, icon_x, icon_y)
{
   var _loc1_ = checkOutSide(icon_x,icon_y);
   var _loc2_ = container_mc.miniMap.inside.iconDraw[iconID];
   _loc2_._x = _loc1_._x;
   _loc2_._y = _loc1_._y;
   setOutSide(_loc2_,_loc1_.bOutSide,_loc1_.nRotation);
}
function removeIcon(iconID)
{
   var _loc1_ = container_mc.miniMap.inside.iconDraw[iconID];
   _loc1_.removeMovieClip();
   lib.util.Warning.remove(_loc1_.aggro);
}
function clearIcon()
{
   for(var _loc1_ in container_mc.miniMap.inside.iconDraw)
   {
      removeMovieClip(_loc1_);
   }
}
function clearChannelCombobox()
{
   bComboboxOpen = false;
   var _loc4_ = container_mc.channel_mc.channelList._visible;
   var _loc2_ = container_mc.channel_mc.channelList._name;
   var _loc3_ = container_mc.channel_mc.channelList.getDepth();
   var _loc6_ = container_mc.channel_mc.channelList._x;
   var _loc5_ = container_mc.channel_mc.channelList._y;
   var _loc1_ = container_mc.channel_mc.channelList._parent.createEmptyMovieClip(_loc2_,_loc3_);
   _loc1_._x = _loc6_;
   _loc1_._y = _loc5_;
   _loc1_._visible = _loc4_;
   gs.TweenLite.killTweensOf(container_mc.channel_mc.channelList);
}
function getChannelHtmlStr(channelNumber, trafficState)
{
   channelNumber = Number(channelNumber);
   trafficState = Number(trafficState);
   if(isNaN(channelNumber))
   {
      channelNumber = 1;
   }
   if(isNaN(trafficState))
   {
      trafficState = 0;
   }
   var _loc3_ = lib.info.TextColor.LIST_PERSONNEL_COMFORTABLE.toString(16);
   var _loc4_ = "";
   if(trafficState == 0)
   {
      _loc4_ = lib.util.UIString.getUIString("$022003");
      _loc3_ = lib.info.TextColor.LIST_PERSONNEL_COMFORTABLE.toString(16);
   }
   else if(trafficState == 1)
   {
      _loc4_ = lib.util.UIString.getUIString("$022004");
      _loc3_ = lib.info.TextColor.LIST_PERSONNEL_SMOOTH.toString(16);
   }
   else if(trafficState == 2)
   {
      _loc4_ = lib.util.UIString.getUIString("$022005");
      _loc3_ = lib.info.TextColor.LIST_PERSONNEL_CROWD.toString(16);
   }
   var _loc2_ = lib.util.UIString.getUIString("$022001") + " " + channelNumber + "   ";
   _loc2_ = _loc2_ + ("<FONT color=\'#" + _loc3_ + "\'>");
   _loc2_ = _loc2_ + _loc4_;
   _loc2_ = _loc2_ + "</FONT>";
   return _loc2_;
}
function channelComboboxOpen()
{
   bComboboxOpen = true;
   if(bTransformedY)
   {
      container_mc.channel_mc.arrow_mc._rotation = -90;
   }
   else
   {
      container_mc.channel_mc.arrow_mc._rotation = 90;
   }
   gs.TweenLite.to(container_mc.channel_mc.channelList,0.3,{_y:UI.comboboxViewY,ease:gs.easing.Strong.easeInOut});
}
function channelComboboxClose()
{
   bComboboxOpen = false;
   container_mc.channel_mc.arrow_mc._rotation = 0;
   gs.TweenLite.to(container_mc.channel_mc.channelList,0.3,{_y:UI.comboboxHideY,ease:gs.easing.Strong.easeInOut});
}
function ToGame_ChannelSelect_ClickChannelBtn(channelNum)
{
   getURL("FSCommand:ToGame_ChannelSelect_ClickChannelBtn",channelNum);
}
function ToGame_ChannelSelect_ClickOpenChannelListBtn()
{
   fscommand("ToGame_ChannelSelect_ClickOpenChannelListBtn");
}
function Set_AlimIcon(__visible, messageType)
{
   var _loc3_ = PostArraySearch(messageType);
   if(_loc3_ == undefined && __visible == 1)
   {
      var _loc2_ = container_mc.multyIcon_mc.rotationBox.attachMovie("postIcon",messageType,depthLevel + postListLen + 10);
      rotationCount = -1;
      switch(messageType)
      {
         case "parcelpost":
            _loc2_.gotoAndStop(1);
            break;
         case "petition":
            _loc2_.gotoAndStop(2);
            break;
         case "couponbox":
            _loc2_.gotoAndStop(3);
            break;
         case "tradehouse":
            _loc2_.gotoAndStop(4);
            break;
         case "quest":
            _loc2_.gotoAndStop(5);
      }
      _loc2_.name = messageType;
      postArray.push(_loc2_);
      postListLen = postArray.length;
      if(postListLen > 1)
      {
         var _loc1_ = 0;
         while(_loc1_ < postListLen - 1)
         {
            postArray[_loc1_]._alpha = 0;
            _loc1_ = _loc1_ + 1;
         }
      }
      postFocus = postListLen - 1;
      postArray[postFocus]._alpha = 100;
   }
   else if(_loc3_ != undefined && __visible == 0)
   {
      postArray.splice(_loc3_,1);
      postListLen = postArray.length;
      container_mc.multyIcon_mc.rotationBox[messageType].removeMovieClip();
      if(_loc3_ == postFocus)
      {
         postFocus++;
         postFocus = postFocus % postListLen;
         _loc1_ = 0;
         while(_loc1_ < postListLen)
         {
            postArray[_loc1_]._alpha = 0;
            _loc1_ = _loc1_ + 1;
         }
         postArray[postFocus]._alpha = 100;
      }
      if(postListLen < 2)
      {
         delete UI.container_mc.multyIcon_mc.onEnterFrame;
         postFocus = 0;
         postArray[postFocus]._alpha = 100;
         rotationCount = -1;
      }
   }
   if(rotationCount < 0 && postListLen > 1)
   {
      rotationCount = 0;
      delete UI.container_mc.multyIcon_mc.onEnterFrame;
      RotationAni();
   }
}
function PostArraySearch(_postName)
{
   var _loc1_ = postListLen;
   while(true)
   {
      _loc1_;
      if(_loc1_-- > 0)
      {
         if(_postName == postArray[_loc1_].name)
         {
            return _loc1_;
         }
         continue;
      }
      break;
   }
   return undefined;
}
function RotationAni()
{
   UI.container_mc.multyIcon_mc.onEnterFrame = function()
   {
      rotationCount++;
      if(rotationCount > rotationTimer + 9)
      {
         postArray[postFocus].alpha = 0;
         postArray[(postFocus + 1) % postListLen]._alpha = 100;
         rotationCount = 0;
         postFocus++;
         postFocus = postFocus % postListLen;
         var _loc1_ = 0;
         while(_loc1_ < postListLen)
         {
            postArray[(postFocus + _loc1_) % postListLen].swapDepths(depthLevel - _loc1_);
            _loc1_ = _loc1_ + 1;
         }
      }
      else if(rotationCount > rotationTimer)
      {
         postArray[postFocus]._alpha = postArray[postFocus]._alpha - 10;
         postArray[(postFocus + 1) % postListLen]._alpha = postArray[(postFocus + 1) % postListLen]._alpha + 10;
      }
   };
}
function Set_GuildIcon(dataList)
{
   menuNameList[0] = lib.util.UIString.getUIString("$123077","count",dataList[0]);
   menuNameList[1] = lib.util.UIString.getUIString("$123078","count",dataList[1]);
   menuNameList[2] = lib.util.UIString.getUIString("$123079","count",dataList[2]);
   if(container_mc.GuildWarMenu)
   {
      GuildWarMenuOpen();
   }
}
function GuildWarMenuOpen()
{
   delete container_mc.GuildWarMenu.onEnterFrame;
   container_mc.GuildWarMenu.removeMovieClip();
   var _loc7_ = 0;
   var _loc6_ = menuNameList.length;
   var _loc3_ = container_mc.attachMovie("generalMenu","GuildWarMenu",container_mc.getNextHighestDepth());
   var _loc5_ = 0;
   while(_loc5_ < _loc6_)
   {
      var _loc4_ = menuNameList[_loc5_];
      var _loc2_ = _loc3_.attachMovie("generalMenu_line",_loc4_,_loc3_.getNextHighestDepth());
      _loc2_._y = _loc7_;
      _loc2_.over._visible = false;
      _loc7_ = _loc7_ + 34;
      _loc2_.idx = _loc5_;
      _loc2_.over.hitTestDisable = true;
      _loc2_.txt.verticalAlign = "center";
      if(_loc2_.txt.setText(_loc4_))
      {
         _loc2_.txt.fontScaleFactor = 0.8;
         _loc2_.txt.text = _loc4_;
         lib.util.ExtString.alignJoint(_loc2_.txt,_loc2_.txt.text);
         if(_loc2_.txt.numLines <= 1)
         {
            _loc2_.txt.text = _loc4_;
         }
      }
      else
      {
         _loc2_.txt.fontScaleFactor = 1;
         _loc2_.txt.text = _loc4_;
      }
      _loc2_.hit.onRollOver = function()
      {
         this._parent.txt.textColor = 16777215;
         this._parent.txt.shadowColor = 5742335;
         this._parent.txt.shadowStrength = 1;
         this._parent.txt.shadowBlurX = this._parent.txt.shadowBlurY = 10;
         this._parent.txt.shadowDistance = 0;
         this._parent.over._visible = true;
         GuildWarMenuCloseStop();
      };
      _loc2_.hit.onRollOut = _loc2_.hit.onReleaseOutside = function()
      {
         this._parent.txt.textColor = 7974357;
         this._parent.txt.shadowColor = 0;
         this._parent.txt.shadowStrength = 1.5;
         this._parent.txt.shadowBlurX = this._parent.txt.shadowBlurY = 3;
         this._parent.txt.shadowDistance = 0;
         this._parent.over._visible = false;
         GuildWarMenuClose();
      };
      _loc2_.hit.onRelease = function()
      {
         getURL("FSCommand:ToGame_GuildWar_IconClick",this._parent.idx);
         this._parent.over._visible = false;
         GuildWarMenuClose(true);
      };
      _loc3_.bg._height = _loc6_ * 34 + 18;
      _loc3_._alpha = 0;
      _loc3_._x = container_mc.guildWarIcon_mc._x - 250;
      _loc3_._y = container_mc.guildWarIcon_mc._y + 20;
      gs.TweenLite.killTweensOf(_loc3_,false);
      gs.TweenLite.to(_loc3_,0.3,{delay:0.1,_alpha:100,ease:gs.easing.Strong.easeInOut});
      _loc5_ = _loc5_ + 1;
   }
}
function GuildWarMenuClose(rightNow)
{
   var _loc2_ = container_mc.GuildWarMenu;
   _loc2_.tweenCompleteMode = true;
   _loc2_.count = 0;
   if(rightNow)
   {
      _loc2_.count = 8;
   }
   _loc2_.onEnterFrame = function()
   {
      if(this.count >= 8)
      {
         delete this.onEnterFrame;
         gs.TweenLite.killTweensOf(this,false);
         gs.TweenLite.to(this,0.2,{_alpha:0,ease:gs.easing.Strong.easeInOut,onComplete:GuildWarMenuClear});
      }
      this.count = this.count + 1;
   };
}
function GuildWarMenuCloseStop()
{
   var _loc1_ = container_mc.GuildWarMenu;
   _loc1_.count = 0;
   _loc1_.tweenCompleteMode = false;
   delete register1.onEnterFrame;
}
function GuildWarMenuClear()
{
   var _loc1_ = container_mc.GuildWarMenu;
   if(_loc1_.tweenCompleteMode)
   {
      _loc1_.removeMovieClip();
   }
}
function drawArc(mc, x, y, radius, r1, r2)
{
   var _loc15_ = Math.ceil((r2 - r1) / 45);
   var _loc1_ = (r2 - r1) / _loc15_;
   var _loc6_ = 0;
   var _loc13_ = container_mc.miniMap.line_mc;
   _loc13_.clear();
   _loc13_.lineStyle(10,16764108,100,false,"normal","none");
   var _loc17_ = x + radius * Math.sin(r1 * rad);
   var _loc16_ = y - radius * Math.cos(r1 * rad);
   _loc13_.moveTo(_loc17_,_loc16_);
   while(_loc6_ < _loc15_)
   {
      var _loc4_ = r1 + _loc1_ * _loc6_;
      var _loc3_ = _loc4_ + _loc1_;
      var _loc5_ = -90 + _loc4_ + _loc1_ / 2;
      var _loc8_ = x + radius * Math.sin(_loc3_ * rad);
      var _loc7_ = y - radius * Math.cos(_loc3_ * rad);
      var _loc10_ = x + radius * Math.cos(_loc5_ * rad) / Math.cos(_loc1_ / 2 * rad);
      var _loc9_ = y + radius * Math.sin(_loc5_ * rad) / Math.cos(_loc1_ / 2 * rad);
      _loc13_.curveTo(_loc10_,_loc9_,_loc8_,_loc7_);
      _loc6_ = _loc6_ + 1;
   }
   return _loc13_;
}
function ToGame_MiniMap_ClickSenatorIcon(states)
{
   getURL("FSCommand:ToGame_MiniMap_ClickSenatorIcon",states);
}
function ToGame_MiniMap_OpenOption()
{
   fscommand("ToGame_MiniMap_OpenOption");
}
function ToGame_MiniMap_CloseOption(saveData)
{
   getURL("FSCommand:ToGame_MiniMap_CloseOption",saveData);
}
function ToGameMinimapSetSize(nWidth, nHeight)
{
   getURL("FSCommand:ToGameMinimapSetSize",nWidth + "\t" + nHeight);
}
function ToGameMinimapSetScale(nScale)
{
   getURL("FSCommand:ToGameMinimapSetScale",nScale);
}
function minimizeHandler(value)
{
   if(value != null)
   {
      bMinimizeMode = value;
      if(value == 1)
      {
         hideMinimap();
      }
      else
      {
         showMinimap();
      }
   }
}
function valueChangeHandler(event)
{
   if(event.key == lib.gamedata.CustomizedUIDataKey.MINIMAP_MINIMIZE_BOOLEAN)
   {
      minimizeHandler(event.value);
   }
}
if(homunDisable == undefined)
{
   allSymbol_array = [container_mc.enablePk_mc,container_mc.canUseHomun_mc,container_mc.multyIcon_mc,container_mc.guildWarIcon_mc,container_mc.BFIcon_mc,container_mc.dungenPartyIcon_mc,container_mc.eventIcon_mc,container_mc.fishing_mc];
   container_mc.canUseHomun_mc.btn.onRollOver = function()
   {
      lib.util.FrameSeeker.seek(this._parent.over,1,4);
   };
   container_mc.canUseHomun_mc.btn.onRollOut = container_mc.canUseHomun_mc.btn.onReleaseOutside = function()
   {
      lib.util.FrameSeeker.seek(this._parent.over,4,1);
   };
}
else if(homunDisable == "1")
{
   allSymbol_array = [container_mc.enablePk_mc,container_mc.multyIcon_mc,container_mc.guildWarIcon_mc,container_mc.BFIcon_mc,container_mc.dungenPartyIcon_mc,container_mc.eventIcon_mc,container_mc.fishing_mc];
   var _len = allSymbol_array.length - 1;
   var i = _len;
   while(i > 1)
   {
      allSymbol_array[i]._x = allSymbol_array[i - 1]._x;
      allSymbol_array[i]._y = allSymbol_array[i - 1]._y;
      i--;
   }
   allSymbol_array[1]._x = container_mc.canUseHomun_mc._x;
   allSymbol_array[1]._y = container_mc.canUseHomun_mc._y;
   container_mc.canUseHomun_mc._visible = false;
}
else
{
   allSymbol_array = [container_mc.enablePk_mc,container_mc.canUseHomun_mc,container_mc.multyIcon_mc,container_mc.guildWarIcon_mc,container_mc.BFIcon_mc,container_mc.dungenPartyIcon_mc,container_mc.eventIcon_mc,container_mc.fishing_mc];
   container_mc.canUseHomun_mc.btn.onRollOver = function()
   {
      lib.util.FrameSeeker.seek(this._parent.over,1,4);
   };
   container_mc.canUseHomun_mc.btn.onRollOut = container_mc.canUseHomun_mc.btn.onReleaseOutside = function()
   {
      lib.util.FrameSeeker.seek(this._parent.over,4,1);
   };
}
var BFEnable = lib.gamedata.DefaultData.getDefaultUIData("BFEnable").param0;
if(BFEnable == "0")
{
   container_mc.BFIcon_mc._visible = false;
}
var curSymbol_array = [];
var pos_array = [];
for(_mc in container_mc)
{
   var mc = container_mc[_mc];
   if(typeof mc == "movieclip" && mc != UI && mc != container_mc && mc != container_mc.channel_mc)
   {
      pos_array.push({mc:mc,y:mc._y,x:mc._x});
   }
}
var iconPosStartX_R = 160;
var iconPosStartY_T = 44;
var iconPosStartY_B = -50;
var iconPosStartX_L = -230;
var iconWidth = 70;
var iconGapX = -15;
var bTransformedY = false;
container_mc.channel_mc.bg1.UIDrager.onPress2 = function()
{
   this.onEnterFrame = function()
   {
      changeUITransform();
   };
};
container_mc.channel_mc.bg1.UIDrager.onRelease2 = function()
{
   delete container_mc.onEnterFrame;
};
container_mc.channel_mc.bg2.UIDrager.onPress2 = function()
{
   this.onEnterFrame = function()
   {
      changeUITransform();
   };
};
container_mc.channel_mc.bg2.UIDrager.onRelease2 = function()
{
   delete container_mc.onEnterFrame;
};
lib.manager.ToolTip.add(container_mc.channel_mc.folder_mc,lib.util.UIString.getUIString("$022062"),1);
container_mc.channel_mc.folder_mc.onRollOver = function()
{
   this.mc.gotoAndStop(2);
};
container_mc.channel_mc.folder_mc.onRollOut = function()
{
   this.mc.gotoAndStop(1);
};
container_mc.channel_mc.folder_mc.onPress = function()
{
   this.mc.gotoAndStop(3);
};
container_mc.channel_mc.folder_mc.onReleaseOutside = function()
{
   this.mc.gotoAndStop(1);
};
container_mc.channel_mc.folder_mc.onRelease = function()
{
   lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
   if(bMinimizeMode)
   {
      showMinimap();
   }
   else
   {
      hideMinimap();
   }
   this.mc.gotoAndStop(2);
   container_mc.channel_mc.folder_mc.onRollOver();
   customizeData.saveData(lib.gamedata.CustomizedUIDataKey.MINIMAP_MINIMIZE_BOOLEAN,Number(bMinimizeMode),true);
};
var OPTIONSTR = ["$022008","$022009","$022010","$022014","$022018","$022048","$022049","$091029","$091037"];
var optinList = [3,4,5,6,8,9,7,1];
if(homunDisable == "1")
{
   optinList = [3,4,5,6,8,9,7];
   if(unionDisable == "1")
   {
      optinList = [3,4,5,6,8,9,7];
   }
}
else if(unionDisable == "1")
{
   optinList = [3,4,5,6,8,9,7,1];
}
var optionLoded = false;
container_mc.optionOpen_mc.onRollOver = function()
{
   if(!opened)
   {
      this.gotoAndStop(2);
   }
};
container_mc.optionOpen_mc.onRollOut = container_mc.optionOpen_mc.onReleaseOutside = function()
{
   if(!opened)
   {
      this.gotoAndStop(1);
   }
};
container_mc.optionOpen_mc.onPress = function()
{
   lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
   if(!opened)
   {
      opened = true;
      optionLoad();
      ToGame_MiniMap_OpenOption();
      container_mc.option._visible = true;
      this.gotoAndStop(3);
   }
   else
   {
      opened = false;
      container_mc.option._visible = false;
      this.gotoAndStop(2);
   }
};
container_mc.option._visible = false;
container_mc.optionOpen_mc._visible = false;
container_mc.onMouseUp = function()
{
   if(!container_mc.hitTest(_root._xmouse,_root._ymouse,true,true))
   {
      if(opened)
      {
         hideOption();
      }
      if(bComboboxOpen)
      {
         channelComboboxClose();
      }
   }
};
var mapWidth = 172;
var mapHeight = 172;
var R = mapWidth / 2;
myListener.OnGame_ResetUIPosition = function()
{
   changeUITransform();
};
myListener.OnGame_MiniMap_SetUnionSeasonStates = function(bShow, states, stone, tooltipData)
{
   return undefined;
};
myListener.OnGame_MiniMap_SetUnionTrainStates = function(bShow, states, tooltipData)
{
   return undefined;
};
myListener.OnGame_MiniMap_SetSenatorStates = function(bShow, states, tooltipData)
{
   container_mc.senatorIcon_mc._visible = Number(bShow);
   states = Number(states);
   container_mc.senatorIcon_mc.bShow = bShow;
   container_mc.senatorIcon_mc.states = states;
   container_mc.senatorIcon_mc.gotoAndStop(states + 1);
   container_mc.senatorIcon_mc.btn.onPress = function()
   {
      ToGame_MiniMap_ClickSenatorIcon(this._parent.states);
      this._parent.clickMe.gotoAndStop(3);
   };
   var _loc3_ = "$022050";
   if(states == 0)
   {
      _loc3_ = "$022050";
   }
   else if(states == 1)
   {
      _loc3_ = "$022051";
   }
   else if(states == 2)
   {
      _loc3_ = "$022052";
   }
   else if(states == 3)
   {
      _loc3_ = "$022053";
   }
   lib.manager.ToolTip.add(container_mc.senatorIcon_mc.btn,lib.util.UIString.getUIString(_loc3_),1);
   if(tooltipData != "" && tooltipData != undefined)
   {
      lib.manager.ToolTip.add(container_mc.senatorIcon_mc.btn,tooltipData,1);
   }
   if(bMinimizeMode)
   {
      changeUITransform();
   }
};
myListener.OnGame_MiniMap_SetDungeonPartyIcon = function(flag, enable, _message)
{
   flag = Number(flag);
   enable = Number(enable);
   container_mc.dungenPartyIcon_mc._visible = true;
   container_mc.dungenPartyIcon_mc.gotoAndStop(flag + 1);
   if(enable)
   {
      container_mc.dungenPartyIcon_mc.btn.onRollOver = function()
      {
         lib.util.FrameSeeker.seek(this._parent.over,1,4);
         this._parent.clickMe.gotoAndStop(2);
      };
      container_mc.dungenPartyIcon_mc.btn.onRollOut = container_mc.dungenPartyIcon_mc.btn.onReleaseOutside = function()
      {
         lib.util.FrameSeeker.seek(this._parent.over,4,1);
         this._parent.clickMe.gotoAndStop(1);
      };
      container_mc.dungenPartyIcon_mc.btn.onRelease = function()
      {
         fscommand("ToGame_MiniMap_DungeonPartyIconBtnEvent");
      };
   }
   else
   {
      container_mc.dungenPartyIcon_mc.btn.onRollOver = container_mc.dungenPartyIcon_mc.btn.onRelease = null;
      container_mc.dungenPartyIcon_mc.btn.onRollOut = container_mc.dungenPartyIcon_mc.btn.onReleaseOutside = null;
   }
   lib.manager.ToolTip.add(container_mc.dungenPartyIcon_mc.btn,_message,1);
   if(bMinimizeMode)
   {
      changeUITransform();
   }
};
myListener.OnGame_MiniMap_SetOption = function(dataList)
{
   g4.util.Debug.log("OnGame_MiniMap_SetOption : " + dataList);
   var _loc4_ = dataList.split("\t");
   var _loc5_ = _loc4_.length;
   if(_loc4_[lengh - 1] == "0" || _loc4_[_loc5_ - 1] == "undefined" || _loc4_[_loc5_ - 1] == "")
   {
      _loc4_.pop();
   }
   _loc5_ = _loc4_.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc5_)
   {
      var _loc1_ = _loc4_[_loc2_].split("\b");
      _loc1_[0] = optionToLoad(Number(_loc1_[0]));
      if(_loc1_.length != 1)
      {
         var _loc3_ = container_mc.option.content_mc["check_" + _loc1_[0]];
         if(undefined != _loc3_)
         {
            _loc3_.checkMc.checked = Number(_loc1_[1]);
         }
      }
      _loc2_ = _loc2_ + 1;
   }
};
myListener.OnGame_SetUIPosition = function(bLocked, _UIName, posXRatio, posYRatio)
{
   if(_UIName.toLowerCase() == UIname.toLowerCase())
   {
      changeUITransform();
   }
};
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      UI._visible = bShow;
      if(bShow)
      {
         var _loc2_ = new lib.controls.CustomScaleEvent();
         _loc2_.CustomScaleEventCheck(UI,UIname);
         changeUITransform();
         myListener.OnGameEventChangeUIMode(_global.gbUIMode);
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode)
   {
      if(!bMinimizeMode)
      {
         container_mc.optionOpen_mc._visible = true;
      }
      container_mc.senatorIcon_mc.clickMe._visible = true;
      container_mc.vote_mc.clickMe._visible = true;
      container_mc.multyIcon_mc.clickMe._visible = true;
      container_mc.guildWarIcon_mc.clickMe._visible = true;
      container_mc.channel_mc.folder_mc._visible = true;
      container_mc.BFIcon_mc.clickMe._visible = true;
      container_mc.dungenPartyIcon_mc.clickMe._visible = true;
      container_mc.eventIcon_mc.clickMe._visible = true;
   }
   else
   {
      container_mc.optionOpen_mc._visible = false;
      container_mc.senatorIcon_mc.clickMe._visible = false;
      container_mc.vote_mc.clickMe._visible = false;
      container_mc.multyIcon_mc.clickMe._visible = false;
      container_mc.guildWarIcon_mc.clickMe._visible = false;
      container_mc.channel_mc.folder_mc._visible = false;
      container_mc.BFIcon_mc.clickMe._visible = false;
      container_mc.dungenPartyIcon_mc.clickMe._visible = false;
      container_mc.eventIcon_mc.clickMe._visible = false;
      if(opened)
      {
         container_mc.optionOpen_mc.onPress();
      }
   }
};
myListener.OnGameEventMinimapAddIcon = function(iconID, iconType, icon_x, icon_y, zoneID)
{
   var _loc1_ = addIcon(iconID,iconType,icon_x,icon_y);
   icon_array.push({id:iconID,zoneID:zoneID,mc:_loc1_});
   if(zoneID != zoneId)
   {
      _loc1_._visible = false;
   }
};
myListener.OnGame_MiniMap_SetAggro = function(id, bTrue)
{
   bTrue = Number(bTrue);
   var _loc5_ = icon_array.length;
   var _loc2_ = 0;
   while(_loc2_ < _loc5_)
   {
      if(icon_array[_loc2_].id == id)
      {
         var _loc1_ = icon_array[_loc2_].mc;
         if(bTrue)
         {
            var _loc3_ = _loc1_.attachMovie("icon_" + _loc1_.iconType,"aggro",_loc1_.getNextHighestDepth());
            var _loc4_ = new flash.geom.Transform(_loc3_);
            _loc4_.colorTransform = new flash.geom.ColorTransform(1,1,1,1,100,100,100,0);
            _loc3_.blendMode = "add";
            lib.util.Warning.add(_loc3_);
         }
         else
         {
            lib.util.Warning.remove(_loc1_.aggro);
            _loc1_.aggro.removeMovieClip();
         }
      }
      _loc2_ = _loc2_ + 1;
   }
};
myListener.OnGameEventMinimapRemoveIcon = function(iconID)
{
   var _loc2_ = null;
   var _loc3_ = icon_array.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      if(icon_array[_loc1_].id == iconID)
      {
         _loc2_ = _loc1_;
      }
      _loc1_ = _loc1_ + 1;
   }
   icon_array.splice(_loc2_,1);
   removeIcon(iconID);
};
myListener.OnGame_MiniMap_RemoveIconByType = function(type)
{
   var _loc3_ = icon_array.length;
   var _loc2_ = new Array();
   var _loc1_ = 0;
   while(_loc1_ < _loc3_)
   {
      if(icon_array[_loc1_].mc.iconType == type)
      {
         _loc2_.unshift(_loc1_);
         lib.util.Warning.remove(icon_array[_loc1_].mc.aggro);
         icon_array[_loc1_].mc.removeMovieClip();
      }
      _loc1_ = _loc1_ + 1;
   }
   var _loc4_ = _loc2_.length;
   _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      icon_array.splice(_loc2_[_loc1_],1);
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGameEventMinimapUpdateIconPosition = function(iconID, icon_x, icon_y)
{
   updateIconPosition(iconID,icon_x,icon_y);
};
myListener.OnGame_MiniMap_SetSparkle = function(id)
{
   if(id == "myself")
   {
      container_mc.miniMap.inside.sight.me.sparkle_mc.gotoAndPlay(2);
   }
   else
   {
      var _loc1_ = 0;
      while(_loc1_ < icon_array.length)
      {
         if(icon_array[_loc1_].id == id)
         {
            icon_array[_loc1_].mc.sparkle_mc.gotoAndPlay(2);
         }
         _loc1_ = _loc1_ + 1;
      }
   }
};
myListener.OnGame_MiniMap_SetCurrentZoneId = function(id)
{
   zoneId = id;
   checkIconVisible();
};
var prevYaw = -1;
myListener.OnGameEventMinimapSetCameraAngle = function(nYaw, nPitch)
{
   if(prevYaw == nYaw)
   {
      return undefined;
   }
   prevYaw = nYaw;
   if(rotateMode == 0)
   {
      container_mc.miniMap.inside.sight._rotation = nYaw;
   }
   else
   {
      container_mc.miniMap.inside._rotation = nYaw;
   }
};
myListener.OnGame_MiniMap_SetPkEnable = function(bTrue)
{
   bPkZone = Number(bTrue);
   container_mc.enablePk_mc.gotoAndStop(bPkZone + 1);
   if(bPkZone == 1)
   {
      lib.manager.ToolTip.add(container_mc.enablePk_mc.btn,lib.info.ToolTipStr.PK_ENABLE,1);
   }
   else
   {
      lib.manager.ToolTip.add(container_mc.enablePk_mc.btn,lib.info.ToolTipStr.PK_DISABLE,1);
   }
};
myListener.OnGame_MiniMap_SetFishingEnable = function(bTrue)
{
   bFishingZone = Number(bTrue);
   container_mc.fishing_mc._visible = bFishingZone == 1;
   if(bMinimizeMode)
   {
      changeUITransform();
   }
};
myListener.OnGame_MiniMap_SetRestZone = function(bTrue)
{
   bRestZone = Number(bTrue);
   if(bRestZone == 1)
   {
      container_mc.enablePk_mc.gotoAndStop(3);
      lib.manager.ToolTip.add(container_mc.enablePk_mc.btn,lib.util.UIString.getUIString("$022064"),1);
   }
   else
   {
      myListener.OnGame_MiniMap_SetPkEnable(bPkZone);
   }
};
myListener.OnGame_MiniMap_SetSeigeEnable = function()
{
   container_mc.enablePk_mc.gotoAndStop(4);
   lib.manager.ToolTip.add(container_mc.enablePk_mc.btn,lib.util.UIString.getUIString("$471120"),1);
};
myListener.OnGame_MiniMap_SetPossibleVendor = function(bTrue)
{
   bTrue = Number(bTrue);
   container_mc.canUseHomun_mc.gotoAndStop(bTrue + 1);
   if(bTrue)
   {
      if(reduceTax)
      {
         lib.manager.ToolTip.add(container_mc.canUseHomun_mc.btn,lib.info.ToolTipStr.VENDOR_ENABLE + "(" + lib.info.ToolTipStr.VENDOR_TAX_YES + ")",1);
      }
      else
      {
         lib.manager.ToolTip.add(container_mc.canUseHomun_mc.btn,lib.info.ToolTipStr.VENDOR_ENABLE + "(" + lib.info.ToolTipStr.VENDOR_TAX_NO + ")",1);
      }
      container_mc.canUseHomun_mc.taxInfo._visible = true;
   }
   else
   {
      lib.manager.ToolTip.add(container_mc.canUseHomun_mc.btn,lib.info.ToolTipStr.VENDOR_DISABLE,1);
      container_mc.canUseHomun_mc.taxInfo._visible = false;
   }
};
myListener.OnGame_MiniMap_SetReduceVendorTax = function(bTrue)
{
};
myListener.OnGame_MiniMap_SetSectionName = function(str)
{
   lib.util.ExtString.textCut(container_mc.channel_mc.sectionName_txt,str,true);
};
myListener.OnGame_MiniMap_SetZoom = function(cur, min, max)
{
   zoom_txt.text = cur + ", " + min + ", " + max;
};
myListener.OnGame_ChannelSelect_SetChannelAlim = function(bTrue, channelNumber, channelState, disableChnnel)
{
   bEnableChannel = bTrue = Number(bTrue);
   channelState = Number(channelState);
   if(bTrue)
   {
      container_mc.channel_mc.bg1._visible = false;
      container_mc.channel_mc.bg2._visible = true;
      container_mc.channel_mc.change_txt._visible = true;
      container_mc.channel_mc.channel_txt._visible = true;
      container_mc.miniMap.UIDrager._visible = false;
      container_mc.miniMap.UIDrager2._visible = true;
      container_mc.channel_mc.hit._visible = true;
   }
   else
   {
      container_mc.channel_mc.bg1._visible = true;
      container_mc.channel_mc.bg2._visible = false;
      container_mc.channel_mc.change_txt._visible = false;
      container_mc.channel_mc.channel_txt._visible = false;
      container_mc.miniMap.UIDrager._visible = true;
      container_mc.miniMap.UIDrager2._visible = false;
      container_mc.channel_mc.hit._visible = false;
   }
   container_mc.channel_mc.arrow_mc._visible = bTrue;
   container_mc.channel_mc.channelBlet_mc._visible = bTrue;
   if(disableChnnel == "1")
   {
      container_mc.channel_mc.hit.hitTestDisable = true;
      var _loc2_ = lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16);
      container_mc.channel_mc.channel_txt.htmlText = lib.util.UIString.getUIString("$022001") + " <FONT color=\'#" + _loc2_ + "\'>" + channelNumber + "</font>";
   }
   else
   {
      container_mc.channel_mc.hit.hitTestDisable = false;
      container_mc.channel_mc.channel_txt.htmlText = getChannelHtmlStr(channelNumber,channelState);
   }
   changeUITransform();
};
myListener.OnGame_ChannelSelect_OpenChannelList = function(channelDataList)
{
   if(channelDataList != "" && channelDataList != undefined)
   {
      clearChannelCombobox();
      var _loc5_ = lib.util.ExtString.split(channelDataList,"\n");
      var _loc3_ = 0;
      while(_loc3_ < _loc5_.length)
      {
         var _loc2_ = container_mc.channel_mc.channelList.attachMovie("comboBoxSlot","comboBoxSlot" + _loc3_,_loc3_);
         _loc2_._y = _loc3_ * (_loc2_._height + comboboxGap);
         var _loc4_ = lib.util.ExtString.split(_loc5_[_loc3_],"\t");
         _loc2_.txt.htmlText = getChannelHtmlStr(_loc4_[0],_loc4_[1]);
         _loc2_.id = _loc4_[0];
         _loc2_.over._visible = false;
         _loc2_.onRollOver = function()
         {
            this.over._visible = true;
         };
         _loc2_.onRollOut = _loc2_.onReleaseOutside = function()
         {
            this.over._visible = false;
         };
         _loc2_.onRelease = function()
         {
            lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
            ToGame_ChannelSelect_ClickChannelBtn(this.id);
            channelComboboxClose();
         };
         _loc3_ = _loc3_ + 1;
      }
      container_mc.channel_mc.mask_mc._height = container_mc.channel_mc.channelList._height;
      changeUITransform();
      channelComboboxOpen();
   }
};
var comboboxGap = 2;
var comboboxViewY = 43;
var comboboxHideY = 0;
var bComboboxOpen = false;
container_mc.channel_mc.hit.onRelease = function()
{
   lib.manager.ToolTip.remove(this);
   lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
   if(bComboboxOpen)
   {
      channelComboboxClose();
   }
   else
   {
      ToGame_ChannelSelect_ClickOpenChannelListBtn();
   }
};
container_mc.channel_mc.hit.onRollOver = function()
{
   lib.manager.ToolTip.add(container_mc.channel_mc.hit,lib.util.UIString.getUIString("$022059"),1);
   container_mc.channel_mc.over._visible = true;
};
container_mc.channel_mc.hit.onRollOut = container_mc.channel_mc.hit.onReleaseOutside = function()
{
   container_mc.channel_mc.over._visible = false;
};
container_mc.channel_mc.over._visible = false;
myListener.OnGame_BFAdmission_SetIcon = function(_flag, _enable, _message)
{
   var _loc2_ = Number(_flag);
   var _loc3_ = Number(_enable);
   if(BFEnable != "0")
   {
      container_mc.BFIcon_mc._visible = true;
   }
   container_mc.BFIcon_mc.gotoAndStop(Number(_loc2_ + 1));
   if(_loc3_)
   {
      container_mc.BFIcon_mc.clickMe._visible = true;
      container_mc.BFIcon_mc.btn.onRollOver = function()
      {
         lib.util.FrameSeeker.seek(this._parent.over,1,4);
         this._parent.clickMe.gotoAndStop(2);
      };
      container_mc.BFIcon_mc.btn.onRollOut = container_mc.BFIcon_mc.btn.onReleaseOutside = function()
      {
         lib.util.FrameSeeker.seek(this._parent.over,4,1);
         this._parent.clickMe.gotoAndStop(1);
      };
      container_mc.BFIcon_mc.btn.onRelease = function()
      {
         fscommand("ToGame_BFAdmission_IconClick");
         this._parent.clickMe.gotoAndStop(3);
      };
   }
   else
   {
      container_mc.BFIcon_mc.clickMe._visible = false;
      container_mc.BFIcon_mc.btn.onRollOver = container_mc.BFIcon_mc.btn.onRelease = null;
      container_mc.BFIcon_mc.btn.onRollOut = container_mc.BFIcon_mc.btn.onReleaseOutside = null;
   }
   lib.manager.ToolTip.add(container_mc.BFIcon_mc.btn,_message,1);
   if(bMinimizeMode)
   {
      changeUITransform();
   }
};
myListener.OnGame_MiniMap_SetEventMatching = function(_flag, _enable, _message, _count)
{
   var _loc4_ = Number(_flag);
   var _loc5_ = Number(_enable);
   container_mc.eventIcon_mc._visible = true;
   container_mc.eventIcon_mc.gotoAndStop(Number(_loc4_ + 1));
   if(_loc5_)
   {
      container_mc.eventIcon_mc.clickMe._visible = true;
      container_mc.eventIcon_mc.btn.onRollOver = function()
      {
         lib.util.FrameSeeker.seek(this._parent.over,1,4);
         this._parent.clickMe.gotoAndStop(2);
      };
      container_mc.eventIcon_mc.btn.onRollOut = container_mc.eventIcon_mc.btn.onReleaseOutside = function()
      {
         lib.util.FrameSeeker.seek(this._parent.over,4,1);
         this._parent.clickMe.gotoAndStop(1);
      };
      container_mc.eventIcon_mc.btn.onRelease = function()
      {
         fscommand("ToGame_MiniMap_EventMatchingIconBtnEvent");
         this._parent.clickMe.gotoAndStop(3);
      };
   }
   else
   {
      container_mc.eventIcon_mc.clickMe._visible = false;
      container_mc.eventIcon_mc.btn.onRollOver = container_mc.eventIcon_mc.btn.onRelease = null;
      container_mc.eventIcon_mc.btn.onRollOut = container_mc.eventIcon_mc.btn.onReleaseOutside = null;
   }
   lib.manager.ToolTip.add(container_mc.eventIcon_mc.btn,_message,1);
   if(bMinimizeMode)
   {
      changeUITransform();
   }
   var _loc3_ = lib.util.ExtString.split(_count,"\t");
   var _loc2_ = _loc3_[0];
   if(_loc2_ > 0 || _loc2_ == "N")
   {
      container_mc.eventIcon_mc.countMc._visible = true;
      container_mc.eventIcon_mc.countMc.txt.text = _loc2_;
   }
   else
   {
      container_mc.eventIcon_mc.countMc._visible = false;
   }
   if(_loc3_[1] == "1")
   {
      container_mc.eventIcon_mc.bg.gotoAndPlay(2);
   }
   else
   {
      container_mc.eventIcon_mc.bg.gotoAndStop(1);
   }
};
var postArray = [];
var postFocus = 0;
var postListLen = 0;
var rotationCount = -1;
var rotationTimer = 120;
var depthLevel = 20;
var menuNameList = [];
myListener.OnGame_ParcelPost_AlimIcon = function(messageCount, goodsCount, newMessage, questMessage)
{
   var _loc1_ = "";
   if(Number(messageCount) > 0)
   {
      _loc1_ = _loc1_ + (lib.info.ToolTipStr.PARCELPOSTALIM_MESSAGECNT + lib.util.UIString.getUIString("$091013","ItemCount",messageCount) + "\n");
   }
   if(Number(goodsCount) > 0)
   {
      _loc1_ = _loc1_ + (lib.info.ToolTipStr.PARCELPOSTALIM_GOODSCNT + lib.util.UIString.getUIString("$091013","ItemCount",goodsCount));
   }
   var _loc2_ = questMessage != "1"?"parcelpost":"quest";
   if(_loc1_ != "")
   {
      multyIconMenu.addMenu(_loc2_,_loc1_);
   }
   else
   {
      questMessage != "1"?multyIconMenu.removeMenu("parcelpost"):multyIconMenu.removeMenu("quest");
   }
   if(bMinimizeMode)
   {
      changeUITransform();
   }
};
myListener.OnGame_Petition_SetIcon = function(__visible, _message)
{
   __visible = Number(__visible);
   if(__visible)
   {
      multyIconMenu.addMenu("petition",_message);
   }
   else
   {
      multyIconMenu.removeMenu("petition");
   }
   if(bMinimizeMode)
   {
      changeUITransform();
   }
};
myListener.OnGame_CouponBox_SetIcon = function(__visible)
{
   __visible = Number(__visible);
   if(__visible)
   {
      multyIconMenu.addMenu("couponbox",lib.util.UIString.getUIString("$102145"));
   }
   else
   {
      multyIconMenu.removeMenu("couponbox");
   }
   if(bMinimizeMode)
   {
      changeUITransform();
   }
};
myListener.OnGame_MiniMap_ShowTradeHouseIcon = function(bShow, tooltip)
{
   bShow = Number(bShow);
   if(bShow)
   {
      multyIconMenu.addMenu("tradehouse",tooltip);
   }
   else
   {
      multyIconMenu.removeMenu("tradehouse");
   }
   if(bMinimizeMode)
   {
      changeUITransform();
   }
};
myListener.OnGame_Senator_SetVoteIcon = function(__visible)
{
   __visible = Number(__visible);
   container_mc.vote_mc._visible = __visible;
   container_mc.vote_mc.btn.onPress = function()
   {
      fscommand("ToGame_Senator_IconClick");
      this._parent.clickMe.gotoAndStop(3);
   };
   if(__visible)
   {
      container_mc.vote_mc.effect.gotoAndPlay(2);
   }
   else
   {
      container_mc.vote_mc.effect.gotoAndStop(1);
   }
   lib.manager.ToolTip.add(container_mc.vote_mc.btn,"$371012",1);
   if(bMinimizeMode)
   {
      changeUITransform();
   }
};
myListener.OnGame_GuildWar_SetIcon = function(__visible, menuList, effect)
{
   __visible = Number(__visible);
   container_mc.guildWarIcon_mc._visible = __visible;
   if(effect == 1)
   {
      container_mc.guildWarIcon_mc.effect.gotoAndPlay(2);
   }
   else
   {
      container_mc.guildWarIcon_mc.effect.gotoAndStop(1);
   }
   if(menuList != undefined && menuList != "")
   {
      menuNameList = menuList.split("\t");
   }
   if(bMinimizeMode)
   {
      changeUITransform();
   }
};
var prevLevels = 0;
var prevReputationCnt = 0;
var prevReputationMax = 0;
var prevAreas = "";
myListener.OnGame_MiniMap_SetReputationGage = function(levels, reputationCnt, reputationMax, areas)
{
   if(levels == prevLevels && reputationCnt == prevReputationCnt && reputationMax == prevReputationMax && areas == prevAreas)
   {
      return undefined;
   }
   prevLevels = levels;
   prevReputationCnt = reputationCnt;
   prevReputationMax = reputationMax;
   prevAreas = areas;
   var _loc8_ = reputationCnt / reputationMax * 360;
   if(reputationMax > 0)
   {
      container_mc.miniMap.roundBg._visible = true;
      container_mc.miniMap.roundEfc.gotoAndPlay(2);
   }
   else
   {
      container_mc.miniMap.roundBg._visible = false;
      container_mc.miniMap.roundEfc.gotoAndStop(1);
   }
   var _loc6_ = drawArc(container_mc.miniMap,96,96,93,0,_loc8_);
   _loc6_._xscale = -100;
   _loc6_._x = container_mc.miniMap.circle_mc._width + container_mc.miniMap.circle_mc._x;
   var _loc3_ = undefined;
   var _loc9_ = undefined;
   var _loc2_ = undefined;
   if(levels == 0)
   {
      _loc3_ = 1;
      str1_data = lib.util.UIString.getUIString("$005015");
      _loc2_ = "C00005";
   }
   else if(levels == 1)
   {
      _loc3_ = 1;
      str1_data = lib.util.UIString.getUIString("$005016");
      _loc2_ = "C00005";
   }
   else if(levels == 2)
   {
      _loc3_ = 1;
      str1_data = lib.util.UIString.getUIString("$005017");
      _loc2_ = "C00005";
   }
   else if(levels == 3)
   {
      _loc3_ = 2;
      str1_data = lib.util.UIString.getUIString("$005018");
      _loc2_ = "54cf00";
   }
   else if(levels == 4)
   {
      _loc3_ = 2;
      str1_data = lib.util.UIString.getUIString("$005019");
      _loc2_ = "54cf00";
   }
   else if(levels == 5)
   {
      _loc3_ = 2;
      str1_data = lib.util.UIString.getUIString("$005020");
      _loc2_ = "54cf00";
   }
   else if(levels == 6)
   {
      _loc3_ = 3;
      str1_data = lib.util.UIString.getUIString("$005021");
      _loc2_ = "0090ff";
   }
   else if(levels == 7)
   {
      _loc3_ = 3;
      str1_data = lib.util.UIString.getUIString("$005022");
      _loc2_ = "0090ff";
   }
   else if(levels == 8)
   {
      _loc3_ = 3;
      str1_data = lib.util.UIString.getUIString("$005023");
      _loc2_ = "0090ff";
   }
   container_mc.miniMap.circle_mc.gotoAndStop(_loc3_);
   if(areas == "" || areas == undefined)
   {
      lib.manager.ToolTip.remove(container_mc.miniMap.hitBox_mc);
   }
   else
   {
      lib.manager.ToolTip.add(container_mc.miniMap.hitBox_mc,lib.util.UIString.getUIString("$022065","fontColor1",_loc2_,"data1",areas,"data2",str1_data,"data3",reputationCnt,"data4",reputationMax),1);
   }
};
myListener.OnGame_MiniMap_SetBlind = function(flag)
{
   container_mc.miniMap.mapBlockMc._visible = Number(flag);
};
myListener.OnGame_LogOut = function()
{
   HelpMsgArray = new Array();
   HelpMsgTotalArray = new Array();
};
myListener.OnGame_Message_Add = function(type, id)
{
};
myListener.OnGame_Message_Remove = function(id)
{
};
Help_Icon_Acion = function()
{
   _scope.container_mc.HelpMsg.btn.onRollOver = function()
   {
      this._parent.MenuBtn.MenuBtnEffect._visible = true;
      lib.util.FrameSeeker.seek(this._parent.over,1,4);
      lib.manager.ToolTip.add(_scope.container_mc.HelpMsg.btn,"$102157",1);
   };
   _scope.container_mc.HelpMsg.btn.onRollOut = function()
   {
      this._parent.MenuBtn.MenuBtnEffect._visible = false;
      this._parent.MenuBtn.MenuBtnEffect.gotoAndStop(1);
      lib.util.FrameSeeker.seek(this._parent.over,4,1);
      lib.manager.ToolTip.remove(_scope.container_mc.HelpMsg.btn);
   };
   _scope.container_mc.HelpMsg.btn.onReleaseOutside = function()
   {
      this._parent.MenuBtn.MenuBtnEffect._visible = false;
      this._parent.MenuBtn.MenuBtnEffect.gotoAndStop(1);
      this._parent.MenuBtn.gotoAndStop(1);
   };
   _scope.container_mc.HelpMsg.btn.onPress = function()
   {
      this._parent.MenuBtn.MenuBtnEffect.gotoAndStop(2);
      this._parent.MenuBtn.gotoAndStop(2);
      this._parent.MenuBtn.gotoAndStop(2);
   };
   _scope.container_mc.HelpMsg.btn.onRelease = function()
   {
      this._parent.MenuBtn.MenuBtnEffect._visible = false;
      this._parent.MenuBtn.MenuBtnEffect.gotoAndStop(1);
      this._parent.MenuBtn.gotoAndStop(1);
      getURL("FSCommand:ToGame_Message_HelpBtn",_scope.HelpMsgArray[_scope.HelpMsgArray.length - 1]);
      _scope.Help_Icon_Remove(_scope.HelpMsgArray[_scope.HelpMsgArray.length - 1]);
      lib.manager.ToolTip.remove(_scope.container_mc.HelpMsg.btn);
   };
};
Help_Icon_Remove = function(Id)
{
   var _loc2_ = "false";
   var _loc1_ = 0;
   while(_loc1_ <= _scope.HelpMsgArray.length)
   {
      if(_scope.HelpMsgArray[_loc1_] == Id)
      {
         _loc2_ = "true";
         _scope.HelpMsgArray.splice(_loc1_,1);
      }
      _loc1_ = _loc1_ + 1;
   }
   if(_scope.HelpMsgArray.length > 1)
   {
      _scope.container_mc.HelpMsg.txt_mc._visible = true;
   }
   else
   {
      _scope.container_mc.HelpMsg.txt_mc._visible = false;
   }
   if(_scope.HelpMsgArray.length == 0)
   {
      _scope.container_mc.HelpMsg._visible = false;
   }
   _scope.container_mc.HelpMsg.txt_mc.txt.text = _scope.HelpMsgArray.length;
   lib.manager.ToolTip.remove(_scope.container_mc.HelpMsg.btn);
};
Help_Icon_RemoveMotion = function(Mc)
{
};
Help_Icon_Add = function(Id)
{
   if(!_scope.container_mc.HelpMsg._visible)
   {
      lib.manager.UISound.play("1198");
   }
   _scope.container_mc.HelpMsg._visible = true;
   if(_scope.HelpMsgArray.length == 0)
   {
      _scope.container_mc.HelpMsg._alpha = 0;
      _scope.container_mc.HelpMsg._xscale = 30;
      _scope.container_mc.HelpMsg._yscale = 30;
      gs.TweenLite.killTweensOf(_scope.container_mc.HelpMsg,false);
      gs.TweenLite.to(_scope.container_mc.HelpMsg,0.4,{_alpha:100,_xscale:100,_yscale:100,ease:gs.easing.Back.easeOut});
   }
   var _loc2_ = "false";
   var _loc1_ = 0;
   while(_loc1_ < _scope.HelpMsgArray.length)
   {
      if(_scope.HelpMsgArray[_loc1_] == Id)
      {
         _loc2_ = "true";
      }
      _loc1_ = _loc1_ + 1;
   }
   if(_loc2_ == "false")
   {
      HelpMsgArray.push(Id);
   }
   if(_scope.HelpMsgArray.length > 1)
   {
      _scope.container_mc.HelpMsg.txt_mc._visible = true;
   }
   else
   {
      _scope.container_mc.HelpMsg.txt_mc._visible = false;
   }
   _scope.container_mc.HelpMsg.MenuBtnEffect.gotoAndStop(1);
   _scope.container_mc.HelpMsg.txt_mc.txt.text = _scope.HelpMsgArray.length;
   _scope.Help_Icon_Acion();
};
var customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MINIMAP_MINIMIZE_BOOLEAN,this,"minimizeHandler");
customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueChangeHandler");
myListener.OnGame_MiniMap_SetOption("1\b1\t2\b0\t3\b1\t4\b0\t5\b1");
myListener.OnGame_CouponBox_SetIcon(0);
myListener.OnGame_ChannelSelect_SetChannelAlim(0);
myListener.OnGame_ChannelSelect_SetChannelAlim(1,1,0);
myListener.OnGame_MiniMap_SetPossibleVendor("0");
myListener.OnGame_MiniMap_SetZoom(50,0,100);
ToGameMinimapSetSize(mapWidth,mapHeight);
container_mc.miniMap.inside.sight.hitTestDisable = true;
container_mc.miniMap.mapBlockMc._visible = false;
fscommand("ToGame_MiniMap_Init");
