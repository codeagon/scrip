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
   static var UIonSound = {};
   function UISound()
   {
   }
   static function play(sound, target)
   {
      _global.EventBroadCaster.broadcastMessage("onPlayUISound","play",sound,target);
      getURL("FSCommand:ToGame_PlaySound",sound);
   }
   static function showUI(UIname, showState, target)
   {
      var _loc3_ = UIname.toLowerCase();
      var _loc2_ = !!showState?lib.manager.UISound.UIonSound[String(_loc3_)]._on:lib.manager.UISound.UIonSound[String(_loc3_)]._off;
      lib.Debuger.trace("showUI   " + UIname + ":  showState = " + showState + "  sound  " + _loc2_);
      if(_loc2_ == "" || _loc2_ == undefined)
      {
         return undefined;
      }
      _global.EventBroadCaster.broadcastMessage("onPlayUISound","showUI",_loc3_,showState,_loc2_,target);
      getURL("FSCommand:ToGame_PlaySound",_loc2_);
   }
   static function addOnSound(uiName, soundArg)
   {
      var _loc3_ = uiName.toLowerCase();
      if(soundArg == "" || soundArg == undefined)
      {
         return undefined;
      }
      var _loc2_ = soundArg.split(",");
      lib.manager.UISound.UIonSound[String(_loc3_)] = {_on:_loc2_[0],_off:_loc2_[1]};
      _global.EventBroadCaster.broadcastMessage("onPlayUISound","addOnSound",_loc3_,soundArg);
   }
}
