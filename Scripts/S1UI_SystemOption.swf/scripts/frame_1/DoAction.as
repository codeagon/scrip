var UI = this;
UI._visible = false;
var UIname = "SystemOption";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
bWidgetOpen = false;
var clickStat;
var containerY = container_mc.setUp0_mc._y;
var SPER = ":";
var isLobbyOpened = false;
var MAXSCALE = 130;
var screenMode;
var lbX;
var lbY;
var custormizedData = lib.gamedata.CustomizedUIDataCollection.getInstance();
var savedCustormizedData = custormizedData.clone();
var bHomun = lib.gamedata.DefaultData.getDefaultUIData("homundisable").param0 == "1";
var bGore = lib.gamedata.DefaultData.getDefaultUIData("goredisable").param0 == "1";
var BFEnable = lib.gamedata.DefaultData.getDefaultUIData("BFEnable").param0;
var PetEnable = lib.gamedata.DefaultData.getDefaultUIData("PetEnable").param0 == "1";
var unionDisable = lib.gamedata.DefaultData.getDefaultUIData("unionDisable").param0 == "1";
var scaleBFUIs = [{id:lib.gamedata.CustomizedUIDataKey.UISCALE_CHARACTERWINDOW_PERCENT,label:lib.util.UIString.getUIString("$231225")},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_SHORTCUT_PERCENT,label:lib.util.UIString.getUIString("$231230")},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_EXTSHORTCUT_PERCENT,label:lib.util.UIString.getUIString("$231276")},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_GAGEBOSS_PERCENT,label:lib.util.UIString.getUIString("$231344")},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_ABNORMALITY_PERCENT,label:lib.util.UIString.getUIString("$231232")},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_MINIMAP_PERCENT,label:lib.util.UIString.getUIString("$231226")},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_OVERLAYMAP2_PERCENT,label:lib.util.UIString.getUIString("$231227")},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_QUESTTASKINFO_PERCENT,label:lib.util.UIString.getUIString("$231229")},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_PARTYWINDOW_PERCENT,label:lib.util.UIString.getUIString("$231235")},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_PARTYWINDOWRAIDINFO_PERCENT,label:lib.util.UIString.getUIString("$231286")},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_MAINMENU_PERCENT,label:lib.util.UIString.getUIString("$231231")}];
function sliderWork(target, dataList)
{
   var _loc3_ = target.split_mc._name;
   var _loc2_ = target.split_mc.getDepth();
   target.createEmptyMovieClip(_loc3_,_loc2_);
   target.dragSplit = undefined;
   var _loc4_ = true;
   var _loc1_ = lib.util.ExtString.split(dataList,"\t");
   target.setData(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5]);
   target.defV = Number(_loc1_[4]);
   target.onChanged = function(v, tg)
   {
      target.defV = v;
      slideChaned(tg);
   };
}
function comboBoxWork(target, dataList)
{
   var _loc2_ = lib.util.ExtString.split(dataList,"\t");
   var _loc3_ = Number(_loc2_.pop());
   var _loc5_ = target.active;
   target.active = true;
   target.data = _loc2_;
   if(!isNaN(_loc3_))
   {
      target.defV = target.selectedIndex = _loc3_;
   }
   else
   {
      target.defV = target.selectedIndex = 0;
   }
   var _loc4_ = {};
   _loc4_.onChanged = function(target, id, index)
   {
      target.defV = index;
   };
   target.addListener(_loc4_);
   target.active = _loc5_;
}
function ToGame_SystemOption_CloseUI()
{
   cancelCustomize();
   fscommand("ToGame_SystemOption_CloseUI");
   if(isLobbyOpened)
   {
      _root.OnGameEvent("OnGameEventShowUI","SystemOption",false);
   }
}
function ToGame_SystemOption_RequestDefaultValue()
{
   fscommand("ToGame_SystemOption_RequestDefaultValue");
}
function getSeparationMarkType()
{
   var _loc1_ = 0;
   while(_loc1_ < MAX_SEPARATION_MARK_COUNT)
   {
      var _loc2_ = container_mc.setUp0_mc["BMMT_mc" + _loc1_];
      if(_loc2_.checked)
      {
         return _loc1_;
      }
      _loc1_ = _loc1_ + 1;
   }
   return 0;
}
function getGameOptionResult()
{
   var _loc4_ = [];
   var _loc6_ = gameOptionIndex.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc6_)
   {
      var _loc1_ = gameOptionIndex[_loc3_];
      if(_loc1_ == "BMMT")
      {
         var _loc5_ = getSeparationMarkType();
         _loc4_.push(_loc1_ + ":" + _loc5_);
      }
      else
      {
         var _loc2_ = container_mc.setUp0_mc[_loc1_ + "_mc"];
         if(_loc1_ == "NCA" || _loc1_ == "CCA")
         {
            _loc2_ = container_mc.setUp0_mc[_loc1_ + "_mc"].combo_mc;
         }
         if(_loc2_ != undefined)
         {
            if(_loc1_ == "QMM0" || _loc1_ == "QMM1" || _loc1_ == "QMM2" || _loc1_ == "QMM3")
            {
               _loc4_.push(_loc1_ + ":" + _loc2_.text);
            }
            else
            {
               _loc4_.push(_loc1_ + ":" + getOptionValue(_loc2_));
            }
         }
      }
      _loc3_ = _loc3_ + 1;
   }
   return _loc4_.join("\t");
}
function getVideoOptionResult()
{
   var _loc5_ = [];
   var _loc6_ = videoOptionIndex.length;
   var _loc3_ = 0;
   while(_loc3_ < _loc6_)
   {
      var _loc1_ = videoOptionIndex[_loc3_];
      var _loc4_ = container_mc.setUp2_mc[_loc1_ + "_mc"];
      var _loc2_ = undefined;
      if(_loc1_ == "SR" || _loc1_ == "RN" || _loc1_ == "CL")
      {
         _loc4_ = container_mc.setUp2_mc[_loc1_ + "_mc"].combo_mc;
      }
      if(_loc1_ == "FS")
      {
         _loc2_ = screenMode;
      }
      else
      {
         _loc2_ = getOptionValue(_loc4_);
      }
      if(_loc2_ != undefined)
      {
         _loc5_.push(_loc1_ + ":" + _loc2_);
      }
      _loc3_ = _loc3_ + 1;
   }
   lib.Debuger.trace("## : " + _loc5_.join("\t"));
   return _loc5_.join("\t");
}
function getAudioOptionResult()
{
   var _loc4_ = [];
   var _loc5_ = audioOptionIndex.length;
   var _loc1_ = 0;
   while(_loc1_ < _loc5_)
   {
      var _loc2_ = audioOptionIndex[_loc1_];
      var _loc3_ = container_mc.setUp1_mc[_loc2_ + "_mc"];
      _loc4_.push(_loc2_ + ":" + getOptionValue(_loc3_));
      _loc1_ = _loc1_ + 1;
   }
   return _loc4_.join("\t");
}
function setAutoVideoOption(flag)
{
   return undefined;
}
function ToGame_SystemOption_Confirm()
{
   ToGame_SystemOption_GameOptionResult();
   ToGame_SystemOption_AudioOptionResult();
   ToGame_SystemOption_VideoOptionResult();
   ToGame_SystemOption_KeyMapOptionResult();
   savedCustormizedData = custormizedData.clone();
   custormizedData.saveDataAll(true);
   ToGame_SystemOption_CloseUI();
}
function ToGame_SystemOption_Apply()
{
   if(tab.activedNum == 0)
   {
      ToGame_SystemOption_GameOptionResult();
   }
   else if(tab.activedNum == 1)
   {
      ToGame_SystemOption_AudioOptionResult();
   }
   else if(tab.activedNum == 2)
   {
      ToGame_SystemOption_VideoOptionResult();
   }
   else if(tab.activedNum == 3)
   {
      ToGame_SystemOption_KeyMapOptionResult();
   }
   else if(tab.activedNum == 4)
   {
      savedCustormizedData = custormizedData.clone();
      custormizedData.saveDataAll(true);
   }
}
function ToGame_SystemOption_GameOptionResult()
{
   getURL("FSCommand:ToGame_SystemOption_GameOptionResult",getGameOptionResult());
}
function ToGame_SystemOption_AudioOptionResult()
{
   getURL("FSCommand:ToGame_SystemOption_AudioOptionResult",getAudioOptionResult());
}
function ToGame_SystemOption_VideoOptionResult()
{
   getURL("FSCommand:ToGame_SystemOption_VideoOptionResult",getVideoOptionResult());
}
function ToGame_SystemOption_SetUIPositionDefault()
{
   fscommand("ToGame_SystemOption_SetUIPositionDefault");
}
function ToGame_SystemOption_PreSetResult()
{
   getURL("FSCommand:ToGame_SystemOption_PreSetResult","AF:" + getOptionValue(container_mc.setUp2_mc.AF_mc));
}
function ToGame_SystemOption_SetUserSetting()
{
   getURL("FSCommand:ToGame_SystemOption_SetUserSetting",getVideoOptionResult());
}
function ToGame_SystemOption_SetFrameAuto()
{
   getURL("FSCommand:ToGame_SystemOption_SetFrameAuto",getOptionValue(container_mc.setUp2_mc.SF_mc));
}
function ToGame_SystemOption_SetAutoPreSet()
{
   container_mc.setUp2_mc.AS_mc.checked = true;
   fscommand("ToGame_SystemOption_SetAutoPreSet");
}
function ToGame_SystemOption_SetScreenRate(rate)
{
   getURL("FSCommand:ToGame_SystemOption_SetScreenRate",rate);
}
function ToGame_SystemOption_RequestDefaultGameOption()
{
   fscommand("ToGame_SystemOption_RequestDefaultGameOption");
}
function ToGame_SystemOption_RequestDefaultAudioOption()
{
   fscommand("ToGame_SystemOption_RequestDefaultAudioOption");
}
function ToGame_SystemOption_RequestDefaultVideoOption()
{
   fscommand("ToGame_SystemOption_RequestDefaultVideoOption");
}
function ToGame_SystemOption_ResetUIPosition()
{
   fscommand("ToGame_SystemOption_ResetUIPosition");
   _root.resetUIPosition();
}
function ToGame_SystemOption_ScreenLight(val)
{
   getURL("FSCommand:ToGame_SystemOption_ScreenLight",val);
}
function ToGame_SystemOption_RequestDefaultUIOption()
{
   custormizedData.resetDefaults();
   getUICustormizeData();
}
function ToGame_SystemOption_ResetScale()
{
   var _loc2_ = 0;
   while(_loc2_ < scaleBFUIs.length)
   {
      var _loc3_ = scaleBFUIs[_loc2_].id;
      setCombatUIScale(_loc3_,100,true);
      _loc2_ = _loc2_ + 1;
   }
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_SKILLWINDOW_PERCENT,100,true);
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_QUESTJOURNAL_PERCENT,100,true);
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_INVENTORY_PERCENT,100,true);
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_WAREHOUSEWINDOW_PERCENT,100,true);
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_WORLDMAP2_PERCENT,100,true);
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_PRODUCTIONLIST_PERCENT,100,true);
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_GUILDWINDOW_PERCENT,100,true);
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_COMMUNITYWINDOW_PERCENT,100,true);
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_PARTYBOARD_PERCENT,100,true);
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_TRADEHOUSE_PERCENT,100,true);
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_STOREWINDOW_PERCENT,100,true);
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_PARCELPOST_PERCENT,100,true);
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_HELP_PERCENT,100,true);
   custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_ALL_PERCENT,defaultUIScale,true);
   savedCustormizedData = custormizedData.clone();
   getUICustormizeData();
   _root.OnGameEvent("OnGame_ScaleUI",defaultUIScale,UIname);
}
function setCombatUIScale(id, scalePercent, saveToServer)
{
   custormizedData.saveData(id,scalePercent,saveToServer);
   if(id == lib.gamedata.CustomizedUIDataKey.UISCALE_EXTSHORTCUT_PERCENT)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_EXTSHORTCUT2_PERCENT,scalePercent,saveToServer);
   }
   else if(id == lib.gamedata.CustomizedUIDataKey.UISCALE_GAGEBOSS_PERCENT)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_TARGETINFO_PERCENT,scalePercent,saveToServer);
   }
}
function getTagIndex(strg, _data)
{
   var _loc2_ = _data[0];
   if(_data.length > 2)
   {
      _data.splice(0,1);
      var _loc6_ = _data.join(":");
      var _loc7_ = [];
      _data.splice(0,_data.length,_loc2_,_loc6_);
   }
   var _loc1_ = 0;
   var _loc3_ = strg.length;
   while(_loc1_ < _loc3_)
   {
      if(strg[_loc1_] == _loc2_)
      {
         return _loc1_;
      }
      _loc1_ = _loc1_ + 1;
   }
   return -1;
}
function setOptionValue(_obj, _value)
{
   if(_value == undefined || _obj == undefined)
   {
      return undefined;
   }
   if(_obj instanceof lib.controls.S_CheckBox)
   {
      var _loc3_ = lib.util.ExtString.split(_value,"\t");
      _obj.checked = Number(_loc3_[0]) == 1;
      var _loc4_ = _obj._name.split("_")[0];
      var _loc5_ = _obj._parent[_loc4_ + "_txt"];
   }
   else if(_obj instanceof lib.controls.S_SimpleComboBox)
   {
      comboBoxWork(_obj,_value);
   }
   else if(_obj instanceof TextField)
   {
      _obj.text = _value;
   }
   else
   {
      sliderWork(_obj,_value);
   }
}
function getOptionValue(_obj)
{
   if(_obj instanceof lib.controls.S_CheckBox)
   {
      return Number(_obj.checked);
   }
   return _obj.defV;
}
function confirm()
{
   ToGame_SystemOption_Confirm();
}
function apply()
{
   ToGame_SystemOption_Apply();
}
function closeUI()
{
   ToGame_SystemOption_CloseUI();
}
function release(num)
{
   if(num == 4)
   {
      default_btn.txt.text = "$231057";
      default_btn.setRelease(ToGame_SystemOption_RequestDefaultUIOption);
   }
   else if(num == 3)
   {
      default_btn.txt.text = "$231061";
      default_btn.setRelease(ToGame_SystemOption_RequestDefaultKeyMapOption);
   }
   else if(num == 0)
   {
      default_btn.txt.text = "$231057";
      default_btn.setRelease(ToGame_SystemOption_RequestDefaultGameOption);
   }
   else if(num == 1)
   {
      default_btn.txt.text = "$231057";
      default_btn.setRelease(ToGame_SystemOption_RequestDefaultAudioOption);
   }
   else if(num == 2)
   {
      default_btn.txt.text = "$231057";
      default_btn.setRelease(ToGame_SystemOption_RequestDefaultVideoOption);
   }
   if(tab.activedNum == 0)
   {
      container_mc.scrollbar.pageSize = container_mc.setUp0_mc._height;
      container_mc.scrollbar.addListener(container_mc.setUp0_mc);
      container_mc.scrollbar.setWheel(container_mc.setUp0_mc);
      if(SaveData.tab_scroll_0 != undefined)
      {
         container_mc.scrollbar.scroll = SaveData.tab_scroll_0;
      }
      else
      {
         container_mc.scrollbar.scroll = 0;
      }
      container_mc.setUp0_mc._visible = true;
      container_mc.setUp1_mc._visible = false;
      container_mc.setUp2_mc._visible = false;
      container_mc.setUp3_mc._visible = false;
      container_mc.setUp4_mc._visible = false;
   }
   else if(tab.activedNum == 1)
   {
      container_mc.setUp0_mc._visible = false;
      container_mc.setUp1_mc._visible = true;
      container_mc.setUp2_mc._visible = false;
      container_mc.setUp3_mc._visible = false;
      container_mc.setUp4_mc._visible = false;
      container_mc.scrollbar.pageSize = container_mc.setUp1_mc._height;
   }
   else if(tab.activedNum == 2)
   {
      container_mc.scrollbar.pageSize = container_mc.setUp2_mc._height;
      container_mc.scrollbar.addListener(container_mc.setUp2_mc);
      container_mc.scrollbar.setWheel(container_mc.setUp2_mc);
      if(SaveData.tab_scroll_2 != undefined)
      {
         container_mc.scrollbar.scroll = SaveData.tab_scroll_2;
      }
      else
      {
         container_mc.scrollbar.scroll = 0;
      }
      container_mc.setUp0_mc._visible = false;
      container_mc.setUp1_mc._visible = false;
      container_mc.setUp2_mc._visible = true;
      container_mc.setUp3_mc._visible = false;
      container_mc.setUp4_mc._visible = false;
   }
   else if(tab.activedNum == 3)
   {
      var delaynum = 0;
      container_mc.onEnterFrame = null;
      container_mc.onEnterFrame = function()
      {
         delaynum++;
         if(delaynum > 1)
         {
            container_mc.onEnterFrame = null;
            container_mc.scrollbar.pageSize = container_mc.setUp3_mc._height + 50;
            container_mc.scrollbar.addListener(container_mc.setUp3_mc);
            container_mc.scrollbar.setWheel(container_mc.setUp3_mc);
            if(SaveData.tab_scroll_3 != undefined)
            {
               container_mc.scrollbar.scroll = SaveData.tab_scroll_3;
            }
            else
            {
               container_mc.scrollbar.scroll = 0;
            }
            container_mc.setUp0_mc._visible = false;
            container_mc.setUp1_mc._visible = false;
            container_mc.setUp2_mc._visible = false;
            container_mc.setUp3_mc._visible = true;
            container_mc.setUp4_mc._visible = false;
         }
      };
   }
   else if(tab.activedNum == 4)
   {
      container_mc.scrollbar.pageSize = container_mc.setUp4_mc._height;
      container_mc.scrollbar.addListener(container_mc.setUp4_mc);
      container_mc.scrollbar.setWheel(container_mc.setUp4_mc);
      if(SaveData.tab_scroll_4 != undefined)
      {
         container_mc.scrollbar.scroll = SaveData.tab_scroll_4;
      }
      else
      {
         container_mc.scrollbar.scroll = 0;
      }
      container_mc.setUp0_mc._visible = false;
      container_mc.setUp1_mc._visible = false;
      container_mc.setUp2_mc._visible = false;
      container_mc.setUp3_mc._visible = false;
      container_mc.setUp4_mc._visible = true;
   }
}
function setScreenMode(_mode)
{
   screenMode = _mode;
   container_mc.setUp2_mc.SR_mc.combo_mc.setEnabled(screenMode != 1);
   container_mc.setUp2_mc.RN_mc.combo_mc.setEnabled(screenMode != 1);
}
function slideChaned(slide)
{
   if(slide == container_mc.setUp2_mc.AF_mc)
   {
      container_mc.setUp2_mc.AS_mc.checked = true;
      ToGame_SystemOption_PreSetResult();
      return undefined;
   }
   if(slide == container_mc.setUp2_mc.LS_mc)
   {
      ToGame_SystemOption_ScreenLight(slide.defV);
   }
   for(var _loc3_ in detailQus)
   {
      var _loc1_ = container_mc.setUp2_mc[detailQus[_loc3_] + "_mc"];
      if(slide == _loc1_)
      {
         container_mc.setUp2_mc.ASR_mc.checked = true;
         return undefined;
      }
   }
}
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
         var _loc6_ = lib.info.KeyMap.toKeyCode(_loc2_[_loc1_][0]);
         var _loc5_ = lib.info.KeyMap.toKeyCode(_loc2_[_loc1_][1]);
         lib.util.ExtString.textCut(_loc3_.key0_txt,_loc6_,1);
         lib.util.ExtString.textCut(_loc3_.key1_txt,_loc5_,1);
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
   ToGame_SystemOption_KeyMapFocusIn(true);
}
function keyEventClear()
{
   pressedKeyCode = [];
   selectKeyBox = undefined;
   Selection.setFocus(null);
}
function changeKeyMap(keymc, isclear)
{
   if(selectKeyBox == undefined || keyCodes == undefined && !isclear)
   {
      return undefined;
   }
   var _loc2_ = 0;
   var _loc3_ = "";
   if(!isclear)
   {
      _loc2_ = keyCodes;
      _loc3_ = keymc.text;
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
            keymc.textColor = lib.info.TextColor.GENERAL_EQUIPPED;
         }
         else
         {
            keymc.textColor = lib.info.TextColor.GENERAL_NORMAL;
         }
         var _loc4_ = lib.util.UIString.getUIString("$231051","RemoveColor",DSC,"CommandName",overapKey._parent.name_txt.text) + "," + lib.util.UIString.getUIString("$231052","CommandColor",KCS,"CommandName",keymc._parent.name_txt.text,"KeyColor",KCS,"KeyString",keymc.text);
         keyMapMessage(_loc4_);
      }
      else if(isChanged(keymc,keyCodes))
      {
         keymc.textColor = lib.info.TextColor.GENERAL_EQUIPPED;
         if(keymc.text == "")
         {
            keyMapMessage(lib.util.UIString.getUIString("$231051","RemoveColor",DSC,"CommandName",keymc._parent.name_txt.text));
         }
         else
         {
            keyMapMessage(lib.util.UIString.getUIString("$231052","CommandColor",KCS,"CommandName",keymc._parent.name_txt.text,"KeyColor",KCS,"KeyString",keymc.text));
         }
      }
      else
      {
         keymc.textColor = lib.info.TextColor.GENERAL_NORMAL;
         if(keymc.text != "")
         {
            keyMapMessage(lib.util.UIString.getUIString("$231052","CommandColor",KCS,"CommandName",keymc._parent.name_txt.text,"KeyColor",KCS,"KeyString",keymc.text));
         }
         else
         {
            keyMapMessage(KEYGIDESTR);
         }
      }
   }
   lib.util.ExtString.textCut(keymc,_loc3_,1);
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
   keyMapMessageFd.htmlText = "<img src=\'icon_notice\' vspace=\'-2\'>" + _message;
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
      _loc3_.key0_focus._visible = false;
      _loc3_.key1_focus._visible = false;
      _loc3_._x = 3;
      _loc3_.key0_txt.onSetFocus = function()
      {
         _global.inputing = true;
      };
      _loc3_.key1_txt.onSetFocus = function()
      {
         _global.inputing = true;
      };
      if(_loc5_ == 0 && _loc6_ == 0)
      {
         _loc3_._y = 42;
      }
      else
      {
         _loc3_._y = keyMapOptionCon._height;
      }
      if(_loc6_ == 0)
      {
         _loc3_._y = _loc3_._y + 5;
      }
   }
   _loc3_._index = _keys[0];
   _loc3_.name_txt.textAutoSize = "shrink";
   _loc3_.name_txt.verticalAlign = "center";
   _loc3_.name_txt.text = _keys[1];
   var _loc8_ = lib.info.KeyMap.toKeyCode(_keys[2]);
   var _loc7_ = lib.info.KeyMap.toKeyCode(_keys[3]);
   lib.util.ExtString.textCut(_loc3_.key0_txt,_loc8_,1);
   lib.util.ExtString.textCut(_loc3_.key1_txt,_loc7_,1);
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
      ToGame_SystemOption_KeyMapFocusIn(false);
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
   alertToolTipMc.removeMovieClip();
   if(arguments[0] == undefined)
   {
      return undefined;
   }
   var _loc3_ = container_mc.setUp3_mc._x + keyMapOptionCon._x + arguments[0]._parent._x + arguments[0]._x + arguments[0]._width + 3;
   var _loc2_ = container_mc.setUp3_mc._y + arguments[0]._parent._y + arguments[0]._y - 2;
   alertToolTipMc = container_mc.attachMovie("toolTipMc","alertToolTip",100000,{_x:_loc3_,_y:_loc2_});
   alertToolTipMc.tipText.htmlText = arguments[1];
   alertToolTipMc.bgMc._width = alertToolTipMc.tipText.textWidth + 20;
   alertToolTipMc.bgMc._height = Math.max(alertToolTipMc.tipText.textHeight + 5,32);
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
      var _loc2_ = lib.info.KeyMap.toKeyCode(precode);
      lib.util.ExtString.textCut(selectKeyBox,_loc2_,1);
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
function ToGame_SystemOption_KeyMapOptionResult()
{
   if(isLobbyOpened)
   {
      return undefined;
   }
   var _loc1_ = returnKeyMap();
   getURL("FSCommand:ToGame_SystemOption_KeyMapOptionResult",_loc1_);
}
function ToGame_SystemOption_KeyMapFocusIn(flag)
{
   getURL("FSCommand:ToGame_SystemOption_KeyMapFocusIn",Number(flag));
}
function ToGame_SystemOption_RequestDefaultKeyMapOption()
{
   keyCodes = overapKey = selectKeyBox = undefined;
   keyMapMessage("$231050");
   fscommand("ToGame_SystemOption_RequestDefaultKeyMapOption");
}
function getUICustormizeData()
{
   var contMc = container_mc.setUp4_mc;
   var _loc11_ = undefined;
   contMc.OMSB_mc.checked = Boolean(Number(custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.OVERLAYMAP_STATIC_BOOLEAN)));
   contMc.OMSB_mc.onChanged = function(checked)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.OVERLAYMAP_STATIC_BOOLEAN,Number(checked));
   };
   _loc11_ = custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.OVERLAYMAP_ALPHA_PERCENT);
   contMc.OMAP_mc.setData(0,"0%",100,"100%",_loc11_);
   contMc.OMAP_mc.defV = _loc11_;
   contMc.OMAP_mc.onChanged = function(v, tg)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.OVERLAYMAP_ALPHA_PERCENT,v);
   };
   _loc11_ = custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.ABNORMALITY_ALIGN_TYPE);
   var _loc4_ = 0;
   while(_loc4_ < 4)
   {
      var _loc8_ = contMc["ANAT_mc" + _loc4_];
      _loc8_.indexN = _loc4_;
      _loc8_.checked = _loc11_ == _loc4_;
      _loc8_.onChanged = function(checked)
      {
         if(checked)
         {
            var _loc2_ = 0;
            while(_loc2_ < 4)
            {
               if(this.indexN != _loc2_)
               {
                  container_mc.setUp4_mc["ANAT_mc" + _loc2_].checked = false;
               }
               _loc2_ = _loc2_ + 1;
            }
            custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.ABNORMALITY_ALIGN_TYPE,this.indexN);
         }
      };
      _loc4_ = _loc4_ + 1;
   }
   contMc.MMSB_mc.checked = Boolean(Number(custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.MAINMENU_SHOW_BOOLEAN)));
   contMc.MMSB_mc.onChanged = function(checked)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.MAINMENU_SHOW_BOOLEAN,Number(checked));
   };
   contMc.IACB_mc.checked = Boolean(Number(custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.INTERACTIONPOPUPALIM_CENTER_BOOLEAN)));
   contMc.IACB_mc.onChanged = function(checked)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.INTERACTIONPOPUPALIM_CENTER_BOOLEAN,Number(checked));
   };
   contMc.CTWV_mc.checked = Boolean(Number(custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.CHAT_WHISPER_VISIBLE)));
   contMc.CTWV_mc.onChanged = function(checked)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.CHAT_WHISPER_VISIBLE,Number(checked));
   };
   contMc.COSB_mc.checked = Boolean(Number(custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.COOLTIMEALIM_SHOW_BOOLEAN)));
   contMc.COSB_mc.onChanged = function(checked)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.COOLTIMEALIM_SHOW_BOOLEAN,Number(checked));
   };
   contMc.CWSB_mc.checked = Boolean(Number(custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.CLOCKWINDOW_SHOW_BOOLEAN)));
   contMc.CWSB_mc.onChanged = function(checked)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.CLOCKWINDOW_SHOW_BOOLEAN,Number(checked));
   };
   contMc.FPSSB_mc.checked = Boolean(Number(custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.FPS_SHOW_BOOLEAN)));
   contMc.FPSSB_mc.onChanged = function(checked)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.FPS_SHOW_BOOLEAN,Number(checked));
   };
   contMc.GSSB_mc.checked = Boolean(Number(custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.GLADI_STACK_BOOLEAN)));
   contMc.GSSB_mc.onChanged = function(checked)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.GLADI_STACK_BOOLEAN,Number(checked));
   };
   contMc.MGSB_mc.checked = Boolean(Number(custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.MAINGAUGE_SHOW_BOOLEAN)));
   contMc.MGSB_mc.onChanged = function(checked)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.MAINGAUGE_SHOW_BOOLEAN,Number(checked));
   };
   contMc.MT4V_mc.checked = Boolean(Number(custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE4_VISIBLE)));
   contMc.MT4V_mc.onChanged = function(checked)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE4_VISIBLE,Number(checked));
   };
   contMc.MT6V_mc.checked = Boolean(Number(custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE6_VISIBLE)));
   contMc.MT6V_mc.onChanged = function(checked)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE6_VISIBLE,Number(checked));
   };
   contMc.MT9V_mc.checked = Boolean(Number(custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE9_VISIBLE)));
   contMc.MT9V_mc.onChanged = function(checked)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPE9_VISIBLE,Number(checked));
   };
   contMc.MTBV_mc.checked = Boolean(Number(custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPEB_VISIBLE)));
   contMc.MTBV_mc.onChanged = function(checked)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.MESSAGE_TYPEB_VISIBLE,Number(checked));
   };
   contMc.USC_mc.setData(50,"50%",150,"150%",custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.UISCALE_ALL_PERCENT));
   contMc.USC_mc.onChanged = function(v, tg)
   {
      custormizedData.saveData(lib.gamedata.CustomizedUIDataKey.UISCALE_ALL_PERCENT,v);
      _root.OnGameEvent("OnGame_ScaleUI",v,UIname);
   };
   contMc.BUSC_mc0.combo_mc.data = scaleBFUIs;
   var _loc12_ = {};
   _loc12_.onChanged = function(target, id, index)
   {
      var id = scaleBFUIs[index].id;
      var _loc4_ = custormizedData.valueOf(id);
      contMc.BUSC_mc1.setData(50,"50%",200,"200%",_loc4_);
      contMc.BUSC_mc1.onChanged = function(v, tg)
      {
         setCombatUIScale(id,v,false);
         var _loc1_ = "";
         if(Number(v) != 100)
         {
            _loc1_ = "#80e71c";
         }
         else
         {
            _loc1_ = "#cccccc";
         }
         contMc.BUSC_mc0.combo_mc.setLabelText(index,scaleBFUIs[index].label + "<font color=\'" + _loc1_ + "\'>  (" + v + ")</font>");
      };
      var _loc1_ = 0;
      while(_loc1_ < scaleBFUIs.length)
      {
         var _loc3_ = custormizedData.valueOf(scaleBFUIs[_loc1_].id);
         var _loc2_ = "";
         if(Number(_loc3_) != 100)
         {
            _loc2_ = "#80e71c";
         }
         else
         {
            _loc2_ = "#cccccc";
         }
         contMc.BUSC_mc0.combo_mc.setLabelText(_loc1_,scaleBFUIs[_loc1_].label + "<font color=\'" + _loc2_ + "\'>  (" + _loc3_ + ")</font>");
         _loc1_ = _loc1_ + 1;
      }
   };
   contMc.BUSC_mc0.combo_mc.addListener(_loc12_);
   contMc.BUSC_mc0.combo_mc.selectedIndex = 0;
   var _loc9_ = 0;
   while(_loc9_ < battleModeVisibleKey.length)
   {
      var _loc5_ = battleModeVisibleKey[_loc9_];
      var _loc7_ = contMc[_loc5_ + "_mc"];
      _loc7_.keyId = _loc5_;
      _loc7_.onChecked = function(checked)
      {
         custormizedData.saveData(this.keyId,Number(checked));
      };
      _loc7_.checked = Boolean(Number(custormizedData.valueOf(_loc5_)));
      _loc9_ = _loc9_ + 1;
   }
}
function cancelCustomize()
{
   var _loc3_ = savedCustormizedData.getIterator();
   while(_loc3_.hasNext())
   {
      var _loc2_ = _loc3_.next();
      custormizedData.saveData(_loc2_.getId(),_loc2_.getValue());
   }
   _root.OnGameEvent("OnGame_ScaleUI",custormizedData.valueOf(lib.gamedata.CustomizedUIDataKey.UISCALE_ALL_PERCENT));
}
function historySave_All()
{
   SaveData.tabIndex = tab.activedNum;
   SaveData.tab_scroll_0 = tab_scroll_0;
   SaveData.tab_scroll_1 = tab_scroll_1;
   SaveData.tab_scroll_2 = tab_scroll_2;
   SaveData.tab_scroll_3 = tab_scroll_3;
   SaveData.tab_scroll_4 = tab_scroll_4;
   lib.gamedata.HistoryData.addHistoryData(UIname,SaveData);
}
if(BFEnable == "1" || BFEnable == undefined)
{
   scaleBFUIs.push({id:lib.gamedata.CustomizedUIDataKey.UISCALE_BFSCOREBOARD_PERCENT,label:lib.util.UIString.getUIString("$231274")});
}
scaleBFUIs.push({id:lib.gamedata.CustomizedUIDataKey.UISCALE_CROSSHAIR_PERCENT,label:lib.util.UIString.getUIString("$231236")});
scaleBFUIs.push({id:lib.gamedata.CustomizedUIDataKey.UISCALE_GAGEBAR_PERCENT,label:lib.util.UIString.getUIString("$231234")});
scaleBFUIs.push({id:lib.gamedata.CustomizedUIDataKey.UISCALE_GAMECONTROLLERSHORTCUT_PERCENT,label:lib.util.UIString.getUIString("$231288")});
if(bHomun == "0" || bHomun == undefined)
{
   scaleBFUIs.push({id:lib.gamedata.CustomizedUIDataKey.UISCALE_HOMUNSHORTCUT_PERCENT,label:lib.util.UIString.getUIString("$231233")});
}
if(bGore == "0" || bGore == undefined)
{
   lib.manager.ToolTip.add(container_mc.setUp2_mc.GR_mc,"$102131",1);
}
if(unionDisable)
{
   container_mc.setUp0_mc.unionLbBarMc._visible = false;
   container_mc.setUp0_mc.UNCM_mc._visible = false;
   container_mc.setUp0_mc.UNNM_mc._visible = false;
}
var defaultUIScale = lib.gamedata.DefaultData.getDefaultUIData("uiscale").param0 != undefined?Number(lib.gamedata.DefaultData.getDefaultUIData("uiscale").param0):80;
var SaveData = lib.gamedata.HistoryData.getHistoryData(UIname);
if(SaveData == undefined)
{
   SaveData = new Object();
}
var tab_currentPage;
var tab_scroll_0 = SaveData.tab_scroll_0 != undefined?SaveData.tab_scroll_0:0;
var tab_scroll_1 = SaveData.tab_scroll_1 != undefined?SaveData.tab_scroll_1:0;
var tab_scroll_2 = SaveData.tab_scroll_2 != undefined?SaveData.tab_scroll_2:0;
var tab_scroll_3 = SaveData.tab_scroll_3 != undefined?SaveData.tab_scroll_3:0;
var tab_scroll_4 = SaveData.tab_scroll_4 != undefined?SaveData.tab_scroll_4:0;
var NameTextLength_Local1 = 0;
var NameTextLength_Local2 = 0;
var NameTextLength_Local3 = 0;
var NameTextLength_Local4 = 0;
container_mc.setUp0_mc.gameOPFd0.textAutoSize = "shrink";
container_mc.setUp0_mc.gameOPFd0.verticalAlign = "center";
container_mc.setUp3_mc.keyMapMessageFd.textAutoSize = "shrink";
container_mc.setUp3_mc.keyMapMessageFd.verticalAlign = "center";
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
         if(lib.info.AlignInfo.scaleRatio * 100 > MAXSCALE)
         {
            var _loc2_ = new lib.util.AxisResetter();
            _loc2_.setXscale(UI,MAXSCALE);
            _loc2_.setYscale(UI,MAXSCALE);
         }
      }
      else
      {
         historySave_All();
         cancelCustomize();
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
myListener.OnGame_ScaleUI = function()
{
   if(isLobbyOpened)
   {
      myListener.OnGameEvent_SystemOption_LobbyOpen(lbX,lbY);
   }
};
myListener.OnGameEvent_SystemOption_LobbyOpen = function(xT, yT)
{
   isLobbyOpened = true;
   tab.setVisible(3,false);
   container_mc.dragUI_mc._visible = false;
   UI.lock_mc._visible = false;
};
var CURRENTCOMBOBOX = null;
var gameOptionIndex = ["SN","PN","ON","GN","HN","MN","VN","MCS","PCS","CI","CS","US","SC","SB","SR","UA","SQ","QN","QM","HA","RI","RT","RB","RF","RP","RG","RD","RW","SP","UM","TN","USC","QMK","QMM0","QMM1","QMM2","QMM3","NCA","CCA","HT","HP","HBE","HBB","ASS","HMV","PMV","MME","MSI","MDB","MMAR","NMAR","MMA","MDM","MDA","PTY","PSI","PDB","PDM","PDR","PDA","PHR","CH","SWAO","CMF","CMH","MG","CMD","BMSB","BMMT","BMRB","BMDF"];
myListener.OnGame_SystemOption_SetGameOption = function(dataList)
{
   var _loc6_ = dataList.split("\n");
   if(_loc6_[_loc6_.length - 1] == "undefined" || _loc6_[_loc6_.length - 1] == "")
   {
      _loc6_.splice(_loc6_.length - 1,1);
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc6_.length)
   {
      var _loc3_ = _loc6_[_loc4_].split(SPER);
      var _loc7_ = getTagIndex(gameOptionIndex,_loc3_);
      var _loc1_ = _loc3_[0];
      if(_loc1_ == "QMM0" || _loc1_ == "QMM1" || _loc1_ == "QMM2" || _loc1_ == "QMM3")
      {
         if(_loc3_[1] != undefined)
         {
            container_mc.setUp0_mc[_loc1_ + "_mc"].text = _loc3_[1];
         }
      }
      else if(_loc1_ == "NCA" || _loc1_ == "CCA")
      {
         setOptionValue(container_mc.setUp0_mc[_loc1_ + "_mc"].combo_mc,_loc3_[1]);
      }
      else if(_loc1_ == "BMMT")
      {
         var _loc5_ = Number(_loc3_[1]);
         var _loc2_ = 0;
         while(_loc2_ < 3)
         {
            container_mc.setUp0_mc[_loc1_ + "_mc" + _loc2_].checked = _loc2_ == _loc5_;
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         setOptionValue(container_mc.setUp0_mc[_loc1_ + "_mc"],_loc3_[1]);
      }
      _loc4_ = _loc4_ + 1;
   }
};
container_mc.setUp0_mc.USC_mc.showSpaceBar = false;
var videoOptionIndex = ["SR","RN","FS","CR","CL","GR","SF","SFS","AS","AF","CD","SD","BD","MD","WD","CE","BE","KD","SP","VL","FD","TS","HM","LL","MU","LS","ES","PE","OPE","TX","GEL","BEQ","BEL","CEF","CED","FQ","WRE","SL"];
myListener.OnGame_SystemOption_SetVideoOption = function(dataList)
{
   var _loc5_ = dataList.split("\n");
   if(_loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
   {
      _loc5_.splice(_loc5_.length - 1,1);
   }
   comboLostner.flag = false;
   var _loc3_ = 0;
   while(_loc3_ < _loc5_.length)
   {
      var _loc2_ = _loc5_[_loc3_].split(SPER);
      var _loc6_ = getTagIndex(videoOptionIndex,_loc2_);
      var _loc1_ = _loc2_[0];
      if(_loc1_ == "SR" || _loc1_ == "RN" || _loc1_ == "CL")
      {
         setOptionValue(container_mc.setUp2_mc[_loc1_ + "_mc"].combo_mc,_loc2_[1]);
      }
      else if(_loc1_ == "FS")
      {
         var _loc4_ = lib.util.ExtString.split(_loc2_[1],"\t");
         setScreenMode(Number(_loc4_[0]));
         container_mc.setUp2_mc["FS" + _loc4_[0] + "_mc"].checked = true;
      }
      else
      {
         setOptionValue(container_mc.setUp2_mc[_loc1_ + "_mc"],_loc2_[1]);
      }
      _loc3_ = _loc3_ + 1;
   }
   if(container_mc.setUp2_mc.SF_mc != undefined)
   {
      setAutoVideoOption(container_mc.setUp2_mc.SF_mc.checked);
   }
   else
   {
      setAutoVideoOption(false);
   }
   container_mc.setUp2_mc.ASR_mc.checked = !container_mc.setUp2_mc.AS_mc.checked;
   comboLostner.flag = true;
};
var audioOptionIndex = ["TM","GM","ES","BS","US","SGB","DS"];
myListener.OnGame_SystemOption_SetAudioOption = function(dataList)
{
   var _loc3_ = dataList.split("\n");
   if(_loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.splice(_loc3_.length - 1,1);
   }
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      var _loc1_ = _loc3_[_loc2_].split(SPER);
      var _loc5_ = getTagIndex(audioOptionIndex,_loc1_);
      var _loc4_ = _loc1_[0];
      setOptionValue(container_mc.setUp1_mc[_loc4_ + "_mc"],_loc1_[1]);
      _loc2_ = _loc2_ + 1;
   }
};
var MAX_SEPARATION_MARK_COUNT = 3;
var screenQus = ["AS","AF","CD","SD","BD","MD","WD","CE","BE","KD","SP","VL","FD","TS","HM","LL","MU","ASR"];
var confirm_btn = container_mc.txtBtn2.txtBtn;
var apply_btn = container_mc.txtBtn1.txtBtn;
var default_btn = container_mc.txtBtn0.txtBtn;
var auto_btn = container_mc.setUp2_mc.autoBtn.txtBtn;
var uipos_btn = container_mc.setUp4_mc.uiposBtn.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
confirm_btn.setRelease(confirm);
apply_btn.setRelease(apply);
default_btn.setRelease(ToGame_SystemOption_RequestDefaultValue);
x_btn.setRelease(closeUI);
auto_btn.setRelease(ToGame_SystemOption_SetAutoPreSet);
uipos_btn.setRelease(ToGame_SystemOption_ResetUIPosition);
var i = 0;
while(i < 5)
{
   container_mc["catBtn_txt" + i].textAutoSize = "shrink";
   container_mc["catBtn_txt" + i].verticalAlign = "center";
   i++;
}
var tabBtns = [container_mc.catBtn_mc0,container_mc.catBtn_mc1,container_mc.catBtn_mc2,container_mc.catBtn_mc3,container_mc.catBtn_mc4];
var tabTxts = [container_mc.catBtn_txt0,container_mc.catBtn_txt1,container_mc.catBtn_txt2,container_mc.catBtn_txt3,container_mc.catBtn_txt4];
var tab = new lib.util.TabBtn(tabBtns,tabTxts);
tab.setRelease(release);
container_mc.setUp3_mc.keyMapMessageFd.textColor = lib.info.TextColor.GENERAL_NOTICE;
container_mc.scrollbar.displaySize = container_mc.maskMc._height;
container_mc.scrollbar.rowHeight = 100;
container_mc.setUp0_mc.onScroll = function()
{
   this._y = containerY - arguments[0];
   tab_scroll_0 = container_mc.scrollbar.scroll;
};
container_mc.setUp2_mc.onScroll = function()
{
   this._y = containerY - arguments[0];
   tab_scroll_2 = container_mc.scrollbar.scroll;
};
container_mc.setUp3_mc.onScroll = function(a, b, c)
{
   keyMapOptionCon._y = - arguments[0];
   tab_scroll_3 = container_mc.scrollbar.scroll;
};
container_mc.setUp4_mc.onScroll = function()
{
   this._y = containerY - arguments[0];
   tab_scroll_4 = container_mc.scrollbar.scroll;
};
container_mc.setUp4_mc.BUSC_mc0.combo_mc.useBaseTextColor = false;
container_mc.setUp2_mc.SF_mc.onChanged = function(_check)
{
   setAutoVideoOption(_check);
   ToGame_SystemOption_SetFrameAuto();
};
var autoSettingGroup = {};
autoSettingGroup.onChanged = function(tg)
{
   if(tg == container_mc.setUp2_mc.AS_mc)
   {
      ToGame_SystemOption_PreSetResult();
   }
};
container_mc.setUp2_mc.AS_mc.addListener(autoSettingGroup);
container_mc.setUp2_mc.ASR_mc.addListener(autoSettingGroup);
container_mc.setUp2_mc.AS_mc.enabled = false;
container_mc.setUp2_mc.ASR_mc.enabled = false;
var screenGroup = {};
container_mc.setUp2_mc.FS0_mc.addListener(screenGroup);
container_mc.setUp2_mc.FS1_mc.addListener(screenGroup);
container_mc.setUp2_mc.FS2_mc.addListener(screenGroup);
screenGroup.onChanged = function(tg)
{
   if(tg == container_mc.setUp2_mc.FS0_mc)
   {
      setScreenMode(0);
   }
   else if(tg == container_mc.setUp2_mc.FS1_mc)
   {
      setScreenMode(1);
   }
   else if(tg == container_mc.setUp2_mc.FS2_mc)
   {
      setScreenMode(2);
   }
};
var quickChat0 = new lib.util.ExtTextField(container_mc.setUp0_mc.QMM0_mc,0,container_mc.setUp0_mc.QMM0_focus);
var quickChat1 = new lib.util.ExtTextField(container_mc.setUp0_mc.QMM1_mc,0,container_mc.setUp0_mc.QMM1_focus);
var quickChat2 = new lib.util.ExtTextField(container_mc.setUp0_mc.QMM2_mc,0,container_mc.setUp0_mc.QMM2_focus);
var quickChat3 = new lib.util.ExtTextField(container_mc.setUp0_mc.QMM3_mc,0,container_mc.setUp0_mc.QMM3_focus);
lib.manager.Focus.addFocusGroup(UIname,1,[container_mc.setUp0_mc.CS_mc.valueMc.txt,container_mc.setUp0_mc.USC_mc.valueMc.txt]);
lib.manager.Focus.addFocusGroup(UIname,2,[quickChat0,quickChat1,quickChat2,quickChat3]);
lib.manager.Focus.addFocusGroup(UIname,3,[container_mc.setUp2_mc.ES_mc.valueMc.txt,container_mc.setUp2_mc.GR_mc.valueMc.txt]);
lib.manager.Focus.addFocusGroup(UIname,4,[container_mc.setUp2_mc.CR_mc.valueMc.txt,container_mc.setUp2_mc.CD_mc.valueMc.txt,container_mc.setUp2_mc.SD_mc.valueMc.txt]);
lib.manager.Focus.addFocusGroup(UIname,5,[container_mc.setUp2_mc.BD_mc.valueMc.txt,container_mc.setUp2_mc.MD_mc.valueMc.txt,container_mc.setUp2_mc.KD_mc.valueMc.txt]);
lib.manager.Focus.addFocusGroup(UIname,6,[container_mc.setUp2_mc.GEL_mc.valueMc.txt,container_mc.setUp2_mc.BEQ_mc.valueMc.txt,container_mc.setUp2_mc.BEL_mc.valueMc.txt,container_mc.setUp2_mc.CEF_mc.valueMc.txt,container_mc.setUp2_mc.CED_mc.valueMc.txt]);
lib.manager.Focus.addFocusGroup(UIname,7,[container_mc.setUp1_mc.TM_mc.valueMc.txt,container_mc.setUp1_mc.GM_mc.valueMc.txt,container_mc.setUp1_mc.ES_mc.valueMc.txt,container_mc.setUp1_mc.BS_mc.valueMc.txt,container_mc.setUp1_mc.US_mc.valueMc.txt]);
quickChat0.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local1 > 0)
   {
      _loc1_ = NameTextLength_Local1;
   }
   else
   {
      _loc1_ = 100;
   }
   lib.util.StrByteLen.getLenth3(container_mc.setUp0_mc.QMM0_mc,_loc1_);
};
quickChat1.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local2 > 0)
   {
      _loc1_ = NameTextLength_Local2;
   }
   else
   {
      _loc1_ = 100;
   }
   lib.util.StrByteLen.getLenth3(container_mc.setUp0_mc.QMM1_mc,_loc1_);
};
quickChat2.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local3 > 0)
   {
      _loc1_ = NameTextLength_Local3;
   }
   else
   {
      _loc1_ = 100;
   }
   lib.util.StrByteLen.getLenth3(container_mc.setUp0_mc.QMM2_mc,_loc1_);
};
quickChat3.onChanged = function()
{
   var _loc1_ = 0;
   if(NameTextLength_Local4 > 0)
   {
      _loc1_ = NameTextLength_Local4;
   }
   else
   {
      _loc1_ = 100;
   }
   lib.util.StrByteLen.getLenth3(container_mc.setUp0_mc.QMM3_mc,_loc1_);
};
var detailQus = ["CD","SD","BD","MD","WD","CE","BE","KD","SP","VL","FD","TS","HM","ES","PE","TT","GEL","BEQ","BEL","CEF","CED","FQ","CR","TX"];
var comboLostner = {};
comboLostner.onChanged = function(target, id, index)
{
   if(this.flag)
   {
      target.defV = index;
      ToGame_SystemOption_SetScreenRate(index);
   }
};
container_mc.setUp2_mc.SR_mc.combo_mc.addListener(comboLostner);
container_mc.setUp0_mc.MME_mc.onChecked = function(_check)
{
   container_mc.setUp0_mc.MSI_mc.setEnabled(_check);
   container_mc.setUp0_mc.MDB_mc.setEnabled(_check);
   container_mc.setUp0_mc.MMA_mc.setEnabled(_check);
   container_mc.setUp0_mc.MDM_mc.setEnabled(_check);
   container_mc.setUp0_mc.MDA_mc.setEnabled(_check);
   container_mc.setUp0_mc.MMAR_mc.setEnabled(_check);
   container_mc.setUp0_mc.NMAR_mc.setEnabled(_check);
   if(_check)
   {
      container_mc.setUp0_mc.MSI_mc.txt.textColor = lib.info.TextColor.CHECKBTN_NORMAL;
      container_mc.setUp0_mc.MDB_mc.txt.textColor = lib.info.TextColor.CHECKBTN_NORMAL;
      container_mc.setUp0_mc.MMA_mc.txt.textColor = lib.info.TextColor.CHECKBTN_NORMAL;
      container_mc.setUp0_mc.MDM_mc.txt.textColor = lib.info.TextColor.CHECKBTN_NORMAL;
      container_mc.setUp0_mc.MDA_mc.txt.textColor = lib.info.TextColor.CHECKBTN_NORMAL;
      container_mc.setUp0_mc.MMAR_mc.txt.textColor = lib.info.TextColor.CHECKBTN_NORMAL;
      container_mc.setUp0_mc.NMAR_mc.txt.textColor = lib.info.TextColor.CHECKBTN_NORMAL;
   }
   else
   {
      container_mc.setUp0_mc.MSI_mc.txt.textColor = lib.info.TextColor.CHECKBTN_DISABLE;
      container_mc.setUp0_mc.MDB_mc.txt.textColor = lib.info.TextColor.CHECKBTN_DISABLE;
      container_mc.setUp0_mc.MMA_mc.txt.textColor = lib.info.TextColor.CHECKBTN_DISABLE;
      container_mc.setUp0_mc.MDM_mc.txt.textColor = lib.info.TextColor.CHECKBTN_DISABLE;
      container_mc.setUp0_mc.MDA_mc.txt.textColor = lib.info.TextColor.CHECKBTN_DISABLE;
      container_mc.setUp0_mc.MMAR_mc.txt.textColor = lib.info.TextColor.CHECKBTN_DISABLE;
      container_mc.setUp0_mc.NMAR_mc.txt.textColor = lib.info.TextColor.CHECKBTN_DISABLE;
   }
};
container_mc.setUp0_mc.PTY_mc.onChecked = function(_check)
{
   container_mc.setUp0_mc.PSI_mc.setEnabled(_check);
   container_mc.setUp0_mc.PDB_mc.setEnabled(_check);
   container_mc.setUp0_mc.PDM_mc.setEnabled(_check);
   container_mc.setUp0_mc.PDA_mc.setEnabled(_check);
   if(_check)
   {
      container_mc.setUp0_mc.PSI_mc.txt.textColor = lib.info.TextColor.CHECKBTN_NORMAL;
      container_mc.setUp0_mc.PDB_mc.txt.textColor = lib.info.TextColor.CHECKBTN_NORMAL;
      container_mc.setUp0_mc.PDM_mc.txt.textColor = lib.info.TextColor.CHECKBTN_NORMAL;
      container_mc.setUp0_mc.PDA_mc.txt.textColor = lib.info.TextColor.CHECKBTN_NORMAL;
   }
   else
   {
      container_mc.setUp0_mc.PSI_mc.txt.textColor = lib.info.TextColor.CHECKBTN_DISABLE;
      container_mc.setUp0_mc.PDB_mc.txt.textColor = lib.info.TextColor.CHECKBTN_DISABLE;
      container_mc.setUp0_mc.PDM_mc.txt.textColor = lib.info.TextColor.CHECKBTN_DISABLE;
      container_mc.setUp0_mc.PDA_mc.txt.textColor = lib.info.TextColor.CHECKBTN_DISABLE;
   }
   container_mc.setUp0_mc.PDR_mc.setEnable(_check && container_mc.setUp0_mc.PDM_mc.checked);
   container_mc.setUp0_mc.PHR_mc.setEnable(_check && container_mc.setUp0_mc.PDA_mc.checked);
};
container_mc.setUp0_mc.BMSB_mc.onChecked = function(_check)
{
   var _loc1_ = !_check?lib.info.TextColor.CHECKBTN_DISABLE:lib.info.TextColor.CHECKBTN_NORMAL;
   container_mc.setUp0_mc.BMMT_mc0.setEnabled(_check);
   container_mc.setUp0_mc.BMMT_mc1.setEnabled(_check);
   container_mc.setUp0_mc.BMMT_mc2.setEnabled(_check);
   container_mc.setUp0_mc.BMMT_mc0.txt.textColor = _loc1_;
   container_mc.setUp0_mc.BMMT_mc1.txt.textColor = _loc1_;
   container_mc.setUp0_mc.BMMT_mc2.txt.textColor = _loc1_;
};
var i = 0;
while(i < MAX_SEPARATION_MARK_COUNT)
{
   var checkMc = container_mc.setUp0_mc["BMMT_mc" + i];
   checkMc.indexN = i;
   checkMc.onChanged = function(checked)
   {
      if(checked)
      {
         var _loc2_ = 0;
         while(_loc2_ < MAX_SEPARATION_MARK_COUNT)
         {
            if(this.indexN != _loc2_)
            {
               container_mc.setUp0_mc["BMMT_mc" + _loc2_].checked = false;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   };
   i++;
}
container_mc.setUp0_mc.PDM_mc.onChecked = function(_check)
{
   container_mc.setUp0_mc.PDR_mc.setEnable(_check && container_mc.setUp0_mc.PTY_mc.checked);
};
container_mc.setUp0_mc.PDA_mc.onChecked = function(_check)
{
   container_mc.setUp0_mc.PHR_mc.setEnable(_check && container_mc.setUp0_mc.PDA_mc.checked);
};
lib.manager.ToolTip.add(container_mc.setUp2_mc.SR_mc,"\t" + lib.util.UIString.getUIString("$102084"),2);
lib.manager.ToolTip.add(container_mc.setUp2_mc.RN_mc,"\t" + lib.util.UIString.getUIString("$102085"),2);
lib.manager.ToolTip.add(container_mc.setUp2_mc.FS0_mc,"$102086",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.FS1_mc,"$102086",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.FS2_mc,"$102086",1);
lib.manager.ToolTip.add(container_mc.setUp0_mc.CMH_mc,"$102266",1);
lib.manager.ToolTip.add(container_mc.setUp0_mc.SWAO_mc,"$102283",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.CR_mc,"$102087",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.CL_mc,"\t" + lib.util.UIString.getUIString("$102088"),2);
lib.manager.ToolTip.add(container_mc.setUp2_mc.SF_mc,"$102090",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.SFS_mc,"$102090",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.AS_mc,"$102091",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.AF_mc,"$102091",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.autoBtn,"$102092",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.ASR_mc,"$102093",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.CD_mc,"$102094",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.SD_mc,"$102095",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.BD_mc,"$102096",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.MD_mc,"$102097",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.WD_mc,"$102098",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.CE_mc,"$102099",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.BE_mc,"$102100",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.KD_mc,"$102101",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.SP_mc,"$102102",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.VL_mc,"$102103",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.FD_mc,"$102104",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.TS_mc,"$102105",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.HM_mc,"$102106",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.MU_mc,"$102107",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.LL_mc,"$102108",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.LS_mc,"$102109",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.ES_mc,"$102129",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.PE_mc,"$102130",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.OPE_mc,"$102287",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.CT_mc,"$102132",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.BT_mc,"$102133",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.ET_mc,"$102134",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.GEL_mc,"$102137",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.BEQ_mc,"$102138",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.BEL_mc,"$102139",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.CEF_mc,"$231336",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.CED_mc,"$231337",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.FQ_mc,"$102140",1);
lib.manager.ToolTip.add(container_mc.setUp2_mc.TX_mc,"$102169",1);
lib.manager.ToolTip.add(container_mc.setUp0_mc.CMD_mc,"$102274",1);
var keyMapOptionCon = container_mc.setUp3_mc.keyMapContainerMc;
var keyMapMessageFd = container_mc.setUp3_mc.keyMapMessageFd;
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
keyMapMessageFd.htmlText = "<img src=\'icon_notice\' vspace=\'-2\'>" + KEYGIDESTR;
var disableStr = lib.util.UIString.getUIString("$231054");
var alertToolTipMc;
myListener.OnGame_SystemOption_SetKeyMapOption = function(dataList)
{
   if(!isLobbyOpened)
   {
      keyMapLoad(dataList);
   }
};
myListener.OnGame_SystemOption_InputKey = function(pKeyCode)
{
   if(pKeyCode == 27)
   {
      keyReturn(pKeyCode);
      return undefined;
   }
   if(pKeyCode == 13)
   {
      var _loc3_ = keyCodes.split("+");
      var _loc2_ = true;
      var _loc1_ = _loc3_.length - 1;
      while(_loc1_ >= 0 && _loc2_)
      {
         _loc2_ = _loc3_[_loc1_] == 17 || _loc3_[_loc1_] == 16;
         _loc1_ = _loc1_ - 1;
      }
      if(_loc2_)
      {
         keyReturn(pKeyCode);
         keyMapMessage("<font color=\'" + DSC + "\'>" + disableStr + "</font>");
         return undefined;
      }
      ToGame_SystemOption_KeyMapFocusIn(false);
      Selection.setFocus(null);
      return undefined;
   }
   if(pKeyCode == undefined || pKeyCode == "")
   {
      keyReturn(pKeyCode);
      keyMapMessage("<font color=\'" + DSC + "\'>" + disableStr + "</font>");
      return undefined;
   }
   var _loc5_ = lib.info.KeyMap.toKeyCode(pKeyCode);
   selectKeyBox.text = _loc5_;
   keyMapMessage(KEYGIDESTR);
   keyCodes = pKeyCode;
   searchKeyMap(keyCodes);
};
var selectFocusFd;
myListener.OnGame_MouseDown = function()
{
   var _loc2_ = arguments[1];
   if(_loc2_._parent._parent == keyMapOptionCon && arguments[0] == 1)
   {
      if(_loc2_._name == "key0_txt" || _loc2_._name == "key1_txt")
      {
         selectFocusFd = _loc2_;
      }
   }
};
myListener.OnGame_MouseUp = function()
{
   var _loc4_ = arguments[1];
   if(arguments[0] == 1 && selectFocusFd != undefined)
   {
      var _loc3_ = selectFocusFd;
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
};
myListener.OnGame_SystemOption_LengthLocal = function(lengthnum1, lengthnum2, lengthnum3, lengthnum4)
{
   NameTextLength_Local1 = lengthnum1;
   NameTextLength_Local2 = lengthnum2;
   NameTextLength_Local3 = lengthnum3;
   NameTextLength_Local4 = lengthnum4;
};
myListener.OnGame_SystemOption_SetTab = function(index)
{
   tab.setTab(index,1);
};
getUICustormizeData();
var scaleRestBtn = container_mc.setUp4_mc.uiscaleBtn.txtBtn;
scaleRestBtn.setRelease(ToGame_SystemOption_ResetScale);
container_mc.setUp0_mc.HN_mc._visible = !bHomun;
container_mc.setUp0_mc.HMV_mc._visible = !bHomun;
container_mc.setUp0_mc.PMV_mc._visible = PetEnable;
if(PetEnable == false && bHomun == true)
{
   container_mc.setUp0_mc.comunityTitleBar._visible = false;
}
else
{
   container_mc.setUp0_mc.comunityTitleBar._visible = true;
}
if(SaveData.tabIndex != undefined)
{
   var tabIndex = Number(SaveData.tabIndex);
   tab.setTab(tabIndex,1);
   tab_scroll_0 = SaveData.tab_scroll_0;
   tab_scroll_1 = SaveData.tab_scroll_1;
   tab_scroll_2 = SaveData.tab_scroll_2;
   tab_scroll_3 = SaveData.tab_scroll_3;
   tab_scroll_4 = SaveData.tab_scroll_4;
}
else
{
   tab.setTab(0,1);
}
fscommand("ToGame_SystemOption_Init");
