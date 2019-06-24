function keyMapLoad(_keydata)
{
   keyMaps = [];
   var _loc3_ = lib.util.ExtString.split(_keydata,"\n");
   var _loc4_ = _loc3_.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc4_)
   {
      var _loc2_ = lib.util.ExtString.split(_loc3_[_loc1_],"\t");
      if(_loc2_.length == 1)
      {
         addKeyGroupName(_loc2_[0]);
      }
      else
      {
         addKey(_loc2_);
      }
      _loc1_ = _loc1_ + 1;
   }
   container_mc.contents_mc.bg._height = keyMapOptionCon._height + 41;
   scrollBar.pageSize = container_mc.contents_mc._height + 31;
}
function resetKeyMap()
{
   var _loc9_ = keyMaps.length;
   keyCodes = overapKey = selectKeyBox = undefined;
   keyMapMessage("$231050");
   var _loc4_ = 0;
   while(_loc4_ < _loc9_)
   {
      var _loc2_ = keyMaps[_loc4_];
      var _loc8_ = _loc2_.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc8_)
      {
         var _loc7_ = _loc2_[_loc1_];
         var _loc3_ = keyMapOptionCon["key_" + _loc4_ + "_" + _loc1_];
         _loc3_.code0 = _loc2_[_loc1_][0];
         _loc3_.code1 = _loc2_[_loc1_][1];
         var _loc6_ = lib.info.KeyMap.toKeyCode(_loc2_[_loc1_][0],1);
         var _loc5_ = lib.info.KeyMap.toKeyCode(_loc2_[_loc1_][1],1);
         _loc3_.key0_txt.htmlText = drawIconKeys(_loc6_,0,_loc2_[_loc1_][0]);
         _loc3_.key1_txt.htmlText = drawIconKeys(_loc5_,0,_loc2_[_loc1_][0]);
         _loc3_.key0_txt.textColor = lib.info.TextColor.GENERAL_NORMAL;
         _loc3_.key1_txt.textColor = lib.info.TextColor.GENERAL_NORMAL;
         _loc1_ = _loc1_ + 1;
      }
      _loc4_ = _loc4_ + 1;
   }
}
function keyEventInit(fd)
{
   selectKeyBox = fd;
   prevKey = 0;
   pressedKeyCode = [];
   ToGame_GameControllerOption_KeyMapFocusIn(true);
}
function keyEventClear()
{
   pressedKeyCode = [];
   selectKeyBox = undefined;
   Selection.setFocus(null);
}
function skillPathKeyFocusIn()
{
   _global.inputing = true;
   skillPathFocusFd.text = "";
   skillPathContainer.bg0.gotoAndStop(2);
   skillPathContainer.removeBtn0._visible = f.text != "";
   skillPathContainer.key0_focus._visible = true;
   skillPathContainer.key0_focus.gotoAndPlay(2);
}
function skillPathKeyFocusOut()
{
   _global.inputing = false;
   skillPathContainer.bg0.gotoAndStop(1);
   skillPathContainer.removeBtn0._visible = false;
   skillPathContainer.key0_focus._visible = false;
   skillPathContainer.key0_focus.gotoAndStop(1);
   skillPathFocusFd = null;
   Selection.setFocus(null);
}
function changeKeyMap(keymc, isclear)
{
   if(selectKeyBox == undefined || keyCodes == undefined && !isclear)
   {
      return undefined;
   }
   var _loc2_ = 0;
   var _loc4_ = "";
   if(!isclear)
   {
      _loc2_ = keyCodes;
      _loc4_ = keymc.htmlText;
      if(overapKey != undefined)
      {
         overapKey.text = "";
         if("key0_txt" == overapKey._name)
         {
            overapKey._parent.code0 = 0;
         }
         else
         {
            overapKey._parent.code1 = 0;
         }
         overapKey.textColor = lib.info.TextColor.GENERAL_NORMAL;
         if(isChanged(keymc,keyCodes))
         {
            keymc.htmlTextColor = lib.info.TextColor.GENERAL_EQUIPPED;
         }
         else
         {
            keymc.htmlTextColor = lib.info.TextColor.GENERAL_NORMAL;
         }
         var _loc3_ = lib.util.UIString.getUIString("$231051","RemoveColor",DSC,"CommandName",overapKey._parent.name_txt.text) + "," + lib.util.UIString.getUIString("$231052","CommandColor",KCS,"CommandName",keymc._parent.name_txt.text,"KeyColor",KCS,"KeyString",drawIconKeys(keymc.code,guideTxtVSpace));
         keyMapMessage(_loc3_);
      }
      else if(isChanged(keymc,keyCodes))
      {
         keymc.htmlTextColor = lib.info.TextColor.GENERAL_EQUIPPED;
         if(keymc.htmlText == "")
         {
            keyMapMessage(lib.util.UIString.getUIString("$231051","RemoveColor",DSC,"CommandName",keymc._parent.name_txt.text));
         }
         else
         {
            keyMapMessage(lib.util.UIString.getUIString("$231052","CommandColor",KCS,"CommandName",keymc._parent.name_txt.text,"KeyColor",KCS,"KeyString",drawIconKeys(keymc.code,guideTxtVSpace)));
         }
      }
      else
      {
         keymc.htmlTextColor = lib.info.TextColor.GENERAL_NORMAL;
         if(keymc.htmlText != "")
         {
            keyMapMessage(lib.util.UIString.getUIString("$231052","CommandColor",KCS,"CommandName",keymc._parent.name_txt.text,"KeyColor",KCS,"KeyString",drawIconKeys(keymc.code,guideTxtVSpace)));
         }
         else
         {
            keyMapMessage(KEYGIDESTR);
         }
      }
   }
   keymc.htmlText = drawIconKeys(keymc.code,0,keymc.rawCode);
   if(isChanged(keymc,keyCodes))
   {
      keymc.textColor = lib.info.TextColor.GENERAL_EQUIPPED;
   }
   else
   {
      keymc.textColor = lib.info.TextColor.GENERAL_NORMAL;
   }
   if("key0_txt" == keymc._name)
   {
      keymc._parent.code0 = _loc2_;
   }
   else
   {
      keymc._parent.code1 = _loc2_;
   }
   keyCodes = overapKey = selectKeyBox = undefined;
}
function keyMapMessage(_message)
{
   alertToolTip();
   keyMapMessageFd.htmlText = "<img src=\'icon_notice\' vspace=\'-1\'> " + _message;
}
function exceptionKey(_keycode)
{
   for(var _loc1_ in exeptionMaps)
   {
      if(exeptionMaps[_loc1_] == _keycode)
      {
         keyDisable = true;
         return true;
      }
   }
   return false;
}
function searchKeyMap(_keycodes)
{
   selectKeyBox.textColor = lib.info.TextColor.GENERAL_NORMAL;
   if(isChanged(overapKey,overapKey._name != "key0_txt"?overapKey._parent.code1:overapKey._parent.code0))
   {
      overapKey.textColor = lib.info.TextColor.GENERAL_EQUIPPED;
   }
   else
   {
      overapKey.textColor = lib.info.TextColor.GENERAL_NORMAL;
   }
   overapKey = undefined;
   for(var _loc2_ in keyMapOptionCon)
   {
      if(typeof keyMapOptionCon[_loc2_] == "movieclip")
      {
         if(keyMapOptionCon[_loc2_].code0 == _keycodes && keyMapOptionCon[_loc2_].key0_txt != selectKeyBox)
         {
            alertToolTip(selectKeyBox._parent,lib.util.UIString.getUIString("$231053","RemoveColor",DSC,"CommandName",keyMapOptionCon[_loc2_].name_txt.text));
            overapKey = keyMapOptionCon[_loc2_].key0_txt;
            selectKeyBox.textColor = overapKey.textColor = lib.info.TextColor.GENERAL_CRITICAL;
            return undefined;
         }
         if(keyMapOptionCon[_loc2_].code1 == _keycodes && keyMapOptionCon[_loc2_].key1_txt != selectKeyBox)
         {
            alertToolTip(selectKeyBox._parent,lib.util.UIString.getUIString("$231053","RemoveColor",DSC,"CommandName",keyMapOptionCon[_loc2_].name_txt.text));
            overapKey = keyMapOptionCon[_loc2_].key1_txt;
            selectKeyBox.textColor = overapKey.textColor = lib.info.TextColor.GENERAL_CRITICAL;
            return undefined;
         }
      }
   }
}
function addKeyGroupName(_gNmae)
{
   var _loc2_ = keyMaps.length;
   var _loc1_ = keyMapOptionCon["keyGroup_" + _loc2_];
   if(_loc1_ == undefined)
   {
      _loc1_ = keyMapOptionCon.attachMovie("keyMapGLine","keyGroup_" + _loc2_,keyMapOptionCon.getNextHighestDepth());
      _loc1_.name_txt.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
      if(_loc2_ != 0)
      {
         _loc1_._y = keyMapOptionCon._height + 10;
      }
   }
   keyMaps.push(new Array());
   _loc1_.name_txt.text = _gNmae;
   _loc1_.name_txt.textColor = lib.info.TextColor.GENERAL_NORMAL;
}
function addKey(_keys)
{
   var _loc5_ = keyMaps.length - 1;
   var _loc6_ = keyMaps[_loc5_].length;
   var _loc3_ = keyMapOptionCon["key_" + _loc5_ + "_" + _loc6_];
   if(_loc3_ == undefined)
   {
      _loc3_ = keyMapOptionCon.attachMovie("keyMapLine","key_" + _loc5_ + "_" + _loc6_,keyMapOptionCon.getNextHighestDepth());
      _loc3_.name_txt.textColor = lib.info.TextColor.INPUT_LABEL;
      _loc3_.key0_focus._visible = false;
      _loc3_._x = 0;
      _loc3_.key0_txt.verticalAlign = "center";
      _loc3_.key0_txt.onSetFocus = function()
      {
         _global.inputing = true;
      };
      if(_loc6_ == 0)
      {
         _loc3_._y = keyMapOptionCon._height + 8;
      }
      else
      {
         _loc3_._y = keyMapOptionCon._height + 2;
      }
   }
   _loc3_._index = _keys[0];
   _loc3_.name_txt.text = _keys[1];
   var _loc8_ = lib.info.KeyMap.toKeyCode(_keys[2],1);
   var _loc7_ = lib.info.KeyMap.toKeyCode(_keys[3],1);
   _loc3_.key0_txt.htmlText = drawIconKeys(_loc8_,0,_keys[2]);
   _loc3_.key1_txt.htmlText = drawIconKeys(_loc7_,0,_keys[3]);
   _loc3_.name_txt.textColor = lib.info.TextColor.GENERAL_NORMAL;
   _loc3_.key0_txt.textColor = lib.info.TextColor.GENERAL_NORMAL;
   _loc3_.key1_txt.textColor = lib.info.TextColor.GENERAL_NORMAL;
   _loc3_.code0 = _keys[2];
   _loc3_.code1 = _keys[3];
   keyMaps[_loc5_].push([_keys[2],_keys[3]]);
   _loc3_.key1_txt.onKillFocus = _loc3_.key0_txt.onKillFocus = function()
   {
      _global.inputing = false;
      changeKeyMap(this);
      if(this._name == "key0_txt")
      {
         this._parent.bg0.gotoAndStop(1);
         this._parent.removeBtn0._visible = false;
         this._parent.key0_focus._visible = false;
         this._parent.key0_focus.gotoAndStop(1);
      }
      else
      {
         this._parent.bg1.gotoAndStop(1);
         this._parent.removeBtn1._visible = false;
         this._parent.key1_focus._visible = false;
         this._parent.key1_focus.gotoAndStop(1);
      }
      ToGame_GameControllerOption_KeyMapFocusIn(false);
   };
}
function returnKeyMap()
{
   var _loc9_ = "";
   var _loc10_ = keyMaps.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc10_)
   {
      var _loc8_ = keyMaps[_loc3_];
      var _loc7_ = _loc8_.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc7_)
      {
         var _loc2_ = keyMapOptionCon["key_" + _loc3_ + "_" + _loc1_];
         var _loc6_ = _loc2_.code0;
         var _loc5_ = _loc2_.code1;
         var _loc4_ = _loc2_._index;
         _loc9_ = _loc9_ + (_loc4_ + "\t" + _loc6_ + "\t" + _loc5_ + "\t\n");
         _loc1_ = _loc1_ + 1;
      }
      _loc3_ = _loc3_ + 1;
   }
   return _loc9_;
}
function toKeyCode(_keyString)
{
   if(_keyString == undefined)
   {
      return "";
   }
   var _loc2_ = _keyString.split("+");
   if(_loc2_ == undefined)
   {
      return lib.info.KeyMap.getKey(_keyString);
   }
   var _loc1_ = 0;
   while(_loc1_ < _loc2_.length)
   {
      var _loc3_ = _loc2_[_loc1_];
      _loc2_[_loc1_] = lib.info.KeyMap.getKey(_loc3_);
      _loc1_ = _loc1_ + 1;
   }
   return _loc2_.join("+");
}
function isChanged(fd, code)
{
   var _loc5_ = fd._parent._name;
   var _loc1_ = _loc5_.split("_");
   var _loc3_ = _loc1_[1];
   var _loc6_ = _loc1_[2];
   var _loc4_ = fd._name != "key0_txt"?1:0;
   var _loc2_ = keyMaps[_loc3_][_loc6_][_loc4_];
   return _loc2_ != code;
}
function alertToolTip()
{
   if(arguments[0] == undefined)
   {
      lib.manager.ToolTip.hide();
      return undefined;
   }
   var _loc2_ = {x:arguments[0]._x,y:arguments[0]._y};
   UI.localToGlobal(_loc2_);
   lib.manager.ToolTip.show(arguments[0],1,arguments[1]);
   var _loc3_ = (keyMapOptionCon._width - 80) * lib.info.AlignInfo.scaleRatio;
   lib.manager.ToolTip.move(_loc2_.x + _loc3_);
}
function guideRemove(flag)
{
   if(flag)
   {
      var _loc1_ = {x:_level0._xmouse,y:_level0._ymouse};
      container_mc.setUp3_mc.globalToLocal(_loc1_);
      guideRemoveMc = container_mc.setUp3_mc.attachMovie("guideR","guideRemoveMc",100);
      guideRemoveMc._x = _loc1_.x;
      guideRemoveMc._y = _loc1_.y;
   }
   else
   {
      guideRemoveMc.removeMovieClip();
   }
}
function keyReturn(precode)
{
   precode = "key0_txt" != selectKeyBox._name?selectKeyBox._parent.code1:selectKeyBox._parent.code0;
   if(precode != keyCodes && keyCodes != undefined)
   {
      var _loc2_ = lib.info.KeyMap.toKeyCode(precode,1);
      selectKeyBox.htmlText = drawIconKeys(_loc2_,0,precode);
      if(isChanged(selectKeyBox,precode))
      {
         selectKeyBox.textColor = lib.info.TextColor.GENERAL_EQUIPPED;
      }
      else
      {
         selectKeyBox.textColor = lib.info.TextColor.GENERAL_NORMAL;
      }
      if(isChanged(overapKey,keyCodes))
      {
         overapKey.textColor = lib.info.TextColor.GENERAL_EQUIPPED;
      }
      else
      {
         overapKey.textColor = lib.info.TextColor.GENERAL_NORMAL;
      }
      alertToolTip();
      keyCodes = overapKey = selectKeyBox = undefined;
   }
   keyMapMessage(KEYGIDESTR);
   keyEventClear();
}
function drawIconKeys(strKey, vspace, rawStr)
{
   var _loc3_ = strKey.split("+");
   var _loc4_ = "";
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      var _loc1_ = Number(_loc3_[_loc2_]);
      if(isNaN(_loc1_))
      {
         break;
      }
      if(_loc1_ >= 231129 && _loc1_ <= 231214)
      {
         _loc4_ = _loc4_ + ("<img src=\'img://__S1UIRES_GameControllerIcon." + _loc1_ + "\' vspace=\'" + vspace + "\'>");
         if(_loc2_ != _loc3_.length - 1)
         {
            _loc4_ = _loc4_ + ("<img src=\'img://__S1UIRES_GameControllerIcon.+\' vspace=\'" + vspace + "\'>");
         }
         _loc2_ = _loc2_ + 1;
         continue;
      }
      return lib.info.KeyMap.toKeyCode(rawStr);
   }
   if(_loc3_.length <= 1 && _loc4_ == "")
   {
      return lib.info.KeyMap.toKeyCode(rawStr);
   }
   return _loc4_;
}
function ToGame_GameControllerOption_ControllerTypeResult()
{
   var _loc1_ = !container_mc.contents_mc.radiobtn0.checked?1:0;
   getURL("FSCommand:ToGame_GameControllerOption_ControllerTypeResult",_loc1_);
}
function ToGame_GameControllerOption_ShowControllerShotCutResult()
{
   var _loc1_ = !showUI_btn.checked?0:1;
   getURL("FSCommand:ToGame_GameControllerOption_ShowControllerShotCutResult",_loc1_);
}
function ToGame_GameControllerOption_ControllerSensitivityResult()
{
   var _loc1_ = cameraSpeed.currentV + "\t" + mouseSpeed.currentV;
   getURL("FSCommand:ToGame_GameControllerOption_ControllerSensitivityResult",_loc1_);
}
function ToGame_GameControllerOption_SkillUseDirectionResult()
{
   var _loc1_ = !container_mc.contents_mc.radiobtn2.checked?1:0;
   getURL("FSCommand:ToGame_GameControllerOption_SkillUseDirectionResult",_loc1_);
}
function ToGame_GameControllerOption_KeyMapOptionResult()
{
   if(isLobbyOpened)
   {
      return undefined;
   }
   var _loc1_ = returnKeyMap();
   getURL("FSCommand:ToGame_GameControllerOption_KeyMapOptionResult",_loc1_);
}
function ToGame_GameControllerOption_KeyMapFocusIn(flag)
{
   getURL("FSCommand:ToGame_GameControllerOption_KeyMapFocusIn",Number(flag));
}
function ToGame_GameControllerOption_RequestDefaultKeyMapOption()
{
   keyCodes = overapKey = selectKeyBox = undefined;
   keyMapMessage("$231050");
   fscommand("ToGame_GameControllerOption_RequestDefaultKeyMapOption");
}
function ToGame_GameControllerOption_Confirm()
{
   ToGame_GameControllerOption_ControllerTypeResult();
   ToGame_GameControllerOption_ShowControllerShotCutResult();
   ToGame_GameControllerOption_ControllerSensitivityResult();
   ToGame_GameControllerOption_SkillUseDirectionResult();
   ToGame_GameControllerOption_KeyMapOptionResult();
   ToGame_GameControllerOption_SkillPathHotkeyResult();
   ToGame_GameControllerOption_CloseUI();
}
function ToGame_GameControllerOption_Apply()
{
   ToGame_GameControllerOption_ControllerTypeResult();
   ToGame_GameControllerOption_ShowControllerShotCutResult();
   ToGame_GameControllerOption_ControllerSensitivityResult();
   ToGame_GameControllerOption_SkillUseDirectionResult();
   ToGame_GameControllerOption_KeyMapOptionResult();
   ToGame_GameControllerOption_SkillPathHotkeyResult();
}
function ToGame_GameControllerOption_RequestDefaultValue()
{
   fscommand("ToGame_GameControllerOption_RequestDefaultValue");
}
function ToGame_GameControllerOption_CloseUI()
{
   fscommand("ToGame_GameControllerOption_CloseUI");
}
function ToGame_GameControllerOption_SkillPathHotkey(states, keystring)
{
   var _loc1_ = states + "\t" + keystring;
   getURL("FSCommand:ToGame_GameControllerOption_SkillPathHotkey",_loc1_);
}
function ToGame_GameControllerOption_SkillPathHotkeyResult()
{
   var _loc1_ = skillPathContainer.key0_txt.rawCode;
   getURL("FSCommand:ToGame_GameControllerOption_SkillPathHotkeyResult",_loc1_);
}
function release(num)
{
}
function confirm()
{
   ToGame_GameControllerOption_Confirm();
}
function apply()
{
   ToGame_GameControllerOption_Apply();
}
function closeUI()
{
   ToGame_GameControllerOption_CloseUI();
}
var UI = this;
UI._visible = false;
var UIname = "GameControllerOption";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.contents_mc.skillPath.name_txt.textColor = lib.info.TextColor.INPUT_LABEL;
container_mc.contents_mc.paragraph_txt0.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.contents_mc.paragraph_txt1.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.contents_mc.paragraph_txt2.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.contents_mc.paragraph_txt3.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
container_mc.contents_mc.paragraph_txt4.textColor = lib.info.TextColor.GENERAL_PARAGRAPH;
var guideTxtVSpace = -10;
var keyMapOptionCon = container_mc.contents_mc.keyMap_mc.keyMapContainerMc;
var keyMapMessageFd = container_mc.keyMapMessageFd;
keyMapMessageFd.textColor = lib.info.TextColor.GENERAL_NOTICE;
keyMapMessageFd.verticalAlign = "center";
var keyMaps = [];
var keyMapEventLisntner = {};
var pressedKeyCode = [];
var keyDisable = false;
var KEYMAXCOUNT = 4;
var prevKey;
var selectKeyBox;
var keyCodes;
var overapKey;
var KNC = "#" + lib.info.TextColor.GENERAL_NOTICE_EMPHASIS.toString(16);
var KCS = "#" + lib.info.TextColor.GENERAL_EQUIPPED.toString(16);
var DSC = "#" + lib.info.TextColor.GENERAL_IMPOSSIBLE.toString(16);
var guideRemoveMc;
var KEYGIDESTR = lib.util.UIString.getUIString("$231055","KeyColor1",KNC,"KeyColor2",KNC);
keyMapMessageFd.htmlText = "<img src=\'icon_notice\' vspace=\'-1\'> " + KEYGIDESTR;
var disableStr = lib.util.UIString.getUIString("$231054");
var skillPathContainer = container_mc.contents_mc.skillPath;
skillPathContainer.key0_focus._visible = false;
skillPathContainer.key0_focus.gotoAndStop(1);
skillPathContainer.name_txt.setText(lib.util.UIString.getUIString("$460018"));
skillPathContainer.name_txt.textColor = lib.info.TextColor.GENERAL_NORMAL;
var typeSelectO = {};
container_mc.contents_mc.radiobtn0.addListener(typeSelectO);
container_mc.contents_mc.radiobtn1.addListener(typeSelectO);
var showUI_btn = container_mc.contents_mc.showUI_btn;
var cameraSpeed = container_mc.contents_mc.cameraSpeed;
var mouseSpeed = container_mc.contents_mc.mouseSpeed;
cameraSpeed.setData(0,"0%",100,"100%",50);
cameraSpeed.title = lib.util.UIString.getUIString("$460010");
cameraSpeed.onChanged = function(value, obj)
{
   this.v = value;
};
mouseSpeed.setData(0,"0%",100,"100%",50);
mouseSpeed.title = lib.util.UIString.getUIString("$460011");
mouseSpeed.onChanged = function(value, obj)
{
   this.v = value;
};
var scrollBar = container_mc.scrollbar;
scrollBar.setWheel(container_mc.contents_mc);
scrollBar.pageSize = 0;
scrollBar.addListener(container_mc.contents_mc);
scrollBar.displaySize = container_mc.maskMc._height;
scrollBar.rowHeight = 100;
container_mc.contents_mc.onScroll = function()
{
   this._y = 53 - arguments[0];
};
var bWidgetOpen = false;
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
myListener.OnGame_GameControllerOption_SetControllerType = function(type)
{
   type = Number(type);
   container_mc.contents_mc["radiobtn" + type].checked = true;
};
myListener.OnGame_GameControllerOption_SetShowControllerShotCut = function(bTrue)
{
   bTrue = Number(bTrue);
   showUI_btn.checked = bTrue;
};
myListener.OnGame_GameControllerOption_SetControllerSensitivity = function(cameraSensPercent, mouseSensPercent)
{
   cameraSensPercent = Number(cameraSensPercent);
   mouseSensPercent = Number(mouseSensPercent);
   cameraSpeed.setData(0,"0%",100,"100%",cameraSensPercent);
   mouseSpeed.setData(0,"0%",100,"100%",mouseSensPercent);
};
myListener.OnGame_GameControllerOption_SetSkillUseDirection = function(type)
{
   type = Number(type);
   container_mc.contents_mc["radiobtn" + (2 + type)].checked = true;
};
myListener.OnGame_GameControllerOption_SetKeyMapOption = function(dataList)
{
   if(!isLobbyOpened)
   {
      keyMapLoad(dataList);
   }
};
myListener.OnGame_GameControllerOption_InputKey = function(pKeyCode)
{
   if(pKeyCode == 27)
   {
      keyReturn(pKeyCode);
      return undefined;
   }
   if(pKeyCode == 13)
   {
      var _loc3_ = keyCodes.split("+");
      var _loc4_ = true;
      var _loc2_ = _loc3_.length - 1;
      while(_loc2_ >= 0 && _loc4_)
      {
         _loc4_ = _loc3_[_loc2_] == 17 || _loc3_[_loc2_] == 16 || _loc3_[_loc2_] == 18;
         _loc2_ = _loc2_ - 1;
      }
      if(_loc4_)
      {
         keyReturn(pKeyCode);
         keyMapMessage("<font color=\'" + DSC + "\'>" + disableStr + "</font>");
         return undefined;
      }
      ToGame_GameControllerOption_KeyMapFocusIn(false);
      Selection.setFocus(_root.GetLoadedUI("Chat2").dummy2);
      return undefined;
   }
   if(pKeyCode == undefined || pKeyCode == "")
   {
      keyReturn(pKeyCode);
      keyMapMessage("<font color=\'" + DSC + "\'>" + disableStr + "</font>");
      return undefined;
   }
   var _loc6_ = lib.info.KeyMap.toKeyCode(pKeyCode,1);
   var _loc7_ = drawIconKeys(_loc6_,0,pKeyCode);
   selectKeyBox.code = _loc6_;
   selectKeyBox.rawCode = pKeyCode;
   selectKeyBox.htmlText = _loc7_;
   keyMapMessage(KEYGIDESTR);
   keyCodes = pKeyCode;
   searchKeyMap(keyCodes);
};
myListener.OnGame_GameControllerOption_SkillPathHotkey = function(pKeyCode)
{
   var _loc2_ = lib.info.KeyMap.toKeyCode(pKeyCode,1);
   var _loc3_ = drawIconKeys(_loc2_,0,pKeyCode);
   if(pKeyCode == 27)
   {
      skillPathContainer.key0_txt.htmlText = drawIconKeys(skillPathContainer.key0_txt.code,0,skillPathContainer.key0_txt.rawCode);
      ToGame_GameControllerOption_SkillPathHotkey("-1",skillPathContainer.key0_txt.rawCode);
      skillPathKeyFocusOut();
      return undefined;
   }
   if(pKeyCode == undefined || pKeyCode == "")
   {
      skillPathContainer.key0_txt.htmlText = drawIconKeys(skillPathContainer.key0_txt.code,0,skillPathContainer.key0_txt.rawCode);
      ToGame_GameControllerOption_SkillPathHotkey("-1",skillPathContainer.key0_txt.rawCode);
      skillPathKeyFocusOut();
      return undefined;
   }
   if(pKeyCode == 13)
   {
      skillPathContainer.key0_txt.htmlText = drawIconKeys(skillPathContainer.key0_txt.code,0,skillPathContainer.key0_txt.rawCode);
      ToGame_GameControllerOption_SkillPathHotkey("0",skillPathContainer.key0_txt.rawCode);
      skillPathKeyFocusOut();
      return undefined;
   }
   skillPathContainer.key0_txt.code = _loc2_;
   skillPathContainer.key0_txt.rawCode = pKeyCode;
   skillPathContainer.key0_txt.htmlText = _loc3_;
};
var selectFocusFd;
var skillPathFocusFd;
myListener.OnGame_MouseDown = function()
{
   var _loc2_ = arguments[1];
   if(_loc2_._parent == skillPathContainer && arguments[0] == 1)
   {
      if(_loc2_._name == "key0_txt" || _loc2_._name == "key1_txt")
      {
         skillPathFocusFd = _loc2_;
      }
   }
   else if(_loc2_._parent._parent == keyMapOptionCon && arguments[0] == 1)
   {
      if(_loc2_._name == "key0_txt" || _loc2_._name == "key1_txt")
      {
         selectFocusFd = _loc2_;
      }
   }
};
myListener.OnGame_MouseMove = function()
{
   getURL("FSCommand:" add ("_global.inputing= " + _global.inputing + ",  _global.chating= " + _global.chating),"");
};
myListener.OnGame_MouseUp = function()
{
   var _loc4_ = arguments[1];
   if(arguments[0] == 1 && skillPathFocusFd != undefined)
   {
      var _loc3_ = skillPathFocusFd;
      if(_loc3_ != undefined)
      {
         skillPathKeyFocusIn();
         ToGame_GameControllerOption_SkillPathHotkey("1",_loc3_.rawCode);
      }
   }
   else if(arguments[0] == 1 && selectFocusFd != undefined)
   {
      _loc3_ = selectFocusFd;
      if(_loc3_ != undefined)
      {
         _global.inputing = true;
         keyEventInit(_loc3_);
         _loc3_.text = "";
         keyCodes = 0;
         if(_loc3_._name == "key0_txt")
         {
            _loc3_._parent.bg0.gotoAndStop(2);
            _loc3_._parent.removeBtn0._visible = _loc3_.text != "";
            _loc3_._parent.key0_focus._visible = true;
            _loc3_._parent.key0_focus.gotoAndPlay(2);
         }
         else
         {
            _loc3_._parent.bg1.gotoAndStop(2);
            _loc3_._parent.removeBtn1._visible = _loc3_.text != "";
            _loc3_._parent.key1_focus._visible = true;
            _loc3_._parent.key1_focus.gotoAndPlay(2);
         }
      }
   }
   selectFocusFd = undefined;
   skillPathFocusFd = undefined;
};
var tab = container_mc.tabBtn.tab;
tab.setRelease(release);
tab.setTab(0,1);
var confirm_btn = container_mc.txtBtn2.txtBtn;
var apply_btn = container_mc.txtBtn1.txtBtn;
var default_btn = container_mc.txtBtn0.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var showUI_btn = container_mc.contents_mc.showUI_btn;
confirm_btn.setRelease(confirm);
apply_btn.setRelease(apply);
default_btn.setRelease(ToGame_GameControllerOption_RequestDefaultValue);
x_btn.setRelease(closeUI);
myListener.OnGame_GameControllerOption_SkillPathHotkey("XboxTypeS_Y");
fscommand("ToGame_GameControllerOption_Init");
