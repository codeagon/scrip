class lib.manager.UISound
{
   static var MAIN_BTN = 1001;
   static var SUB_BTN = 1140;
   static var UIROCKON_BTN = 1141;
   static var ITEMSLOT_CLICK = 1142;
   static var NUMBERINPUT_BTN = 1038;
   static var POPUPMENU_OPEN = 1138;
   static var TREEMENU_BTN = 1143;
   static var UI_OPEN = 1006;
   static var UI_CLOSE = 1007;
   static var NAMEINPUT_OPEN = 1042;
   static var NAMEINPUT_CLOSE = 1043;
   static var SKILL_PICKUP = 1009;
   static var SKILL_DROP = 1010;
   static var SKILL_COOLTIME = 1011;
   static var ENCHANT_SUCCESS = 1016;
   static var ENCHANT_FAIL = 1017;
   static var ENCHANT_COOLTIME = 1018;
   static var PANDORA_COOLTIME = 1018;
   static var PRODUCTION_DOUBLE = 1035;
   static var PRODUCTION_QUARDRUPLE = 1036;
   static var INVENTORY_PICKUP = 1037;
   static var SCROLL_BTN = 1008;
   static var SCROLL_MOVE = 1181;
   static var FULLDOWNMENU_OPEN = 1012;
   static var FULLDOWNMENU_CLOSE = 1013;
   static var FULLDOWNMENU_CLICK = 1144;
   static var CHECKBTN_CHECK = 1014;
   static var CHECKBTN_UNCHECK = 1015;
   static var NUMBERSTEPER_BTN = 1137;
   static var TABMENU_BTN = 1138;
   static var SLIDEBAR_DRAG = 1179;
   static var SLIDEBAR_DROP = 1180;
   static var SHORTCUT_UP = 1001;
   static var SHORTCUT_DOWN = 1001;
   static var SHORTCUT_EXTEND = 1001;
   static var SHORTCUT_BLOCK = 1001;
   static var CHAT_OPTION = 1001;
   static var CONTEXMENU_CLICK = 1138;
   static var MOUSE_RCLICK = 1138;
   static var QUEST_CHANGED = 1188;
   static var QUEST_CLEAR = 1189;
   static var MAP_BTN = 1030;
   static var UIonSound = {};
   function UISound()
   {
   }
   static function play(sound, target)
   {
      getURL("FSCommand:ToGame_PlaySound",sound);
   }
   static function showUI(UIname, showState, target)
   {
      var _loc2_ = UIname.toLowerCase();
      var _loc1_ = !!showState?lib.manager.UISound.UIonSound[String(_loc2_)]._on:lib.manager.UISound.UIonSound[String(_loc2_)]._off;
      var _loc3_ = _level0.GetLoadedUI(UIname)._visible;
      if(_loc1_ == "" || _loc1_ == undefined || showState == _loc3_)
      {
         return undefined;
      }
      getURL("FSCommand:ToGame_PlaySound",_loc1_);
   }
   static function addOnSound(uiName, soundArg)
   {
      var _loc2_ = uiName.toLowerCase();
      if(soundArg == "" || soundArg == undefined)
      {
         return undefined;
      }
      var _loc1_ = soundArg.split(",");
      lib.manager.UISound.UIonSound[String(_loc2_)] = {_on:_loc1_[0],_off:_loc1_[1]};
   }
}
