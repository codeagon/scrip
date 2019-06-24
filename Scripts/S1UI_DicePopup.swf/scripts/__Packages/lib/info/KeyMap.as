class lib.info.KeyMap
{
   static var CTRL_STR = "ctrl";
   static var ALT_STR = "Alt";
   static var SHIFT_STR = "Shift";
   static var KYEMAP = {k96:"$231063",k97:"$231064",k98:"$231065",k99:"$231066",k100:"$231067",k101:"$231068",k102:"$231069",k103:"$231070",k104:"$231071",k105:"$231072",k106:"$231073",k107:"$231074",k13:"$231075",k109:"$231076",k110:"$231077",k111:"$231078",k112:"$231079",k113:"$231080",k114:"$231081",k115:"$231082",k116:"$231083",k117:"$231084",k118:"$231085",k119:"$231086",k120:"$231087",k121:"$231088",k122:"$231089",k123:"$231090",k8:"$231091",k9:"$231092",k13:"$231093",k16:"$231094",k17:"$231095",k18:"$231096",k20:"$231097",k27:"$231098",k32:"$231099",k33:"$231100",k34:"$231101",k35:"$231102",k36:"$231103",k37:"$231104",k38:"$231105",k39:"$231106",k40:"$231107",k45:"$231108",k46:"$231109",k144:"$231110",k145:"$231111",k19:"$231112",k186:"$231118",k187:"$231119",k188:"$231120",k189:"$231121",k190:"$231122",k191:"$231123",k192:"$231124",k219:"$231125",k220:"$231126",k221:"$231127",k222:"$231128",kLeftMouseButton:"$231113",kRightMouseButton:"$231114",kMiddleMouseButton:"$231115",kThumbMouseButton:"$231116",kThumbMouseButton2:"$231117",kXboxTypeS_LeftThumbstick:"$231129",kXboxTypeS_RightThumbstick:"$231130",kXboxTypeS_Back:"$231131",kXboxTypeS_Start:"$231132",kXboxTypeS_A:"$231133",kXboxTypeS_B:"$231134",kXboxTypeS_X:"$231135",kXboxTypeS_Y:"$231136",kXboxTypeS_LeftShoulder:"$231137",kXboxTypeS_RightShoulder:"$231138",kXboxTypeS_LeftTrigger:"$231139",kXboxTypeS_RightTrigger:"$231140",kXboxTypeS_DPad_Up:"$231141",kXboxTypeS_DPad_Down:"$231142",kXboxTypeS_DPad_Right:"$231143",kXboxTypeS_DPad_Left:"$231144",kXboxTypeS_LeftStickUp:"$231145",kXboxTypeS_LeftStickDown:"$231146",kXboxTypeS_LeftStickLeft:"$231147",kXboxTypeS_LeftStickRight:"$231148",kXboxTypeS_RightStickUp:"$231149",kXboxTypeS_RightStickDown:"$231150",kXboxTypeS_RightStickLeft:"$231151",kXboxTypeS_RightStickRight:"$231152",kXboxTypeS_LeftMove:"$231153",kXboxTypeS_RightMove:"$231154",kMouseMove:"$231188",kMouseScrollUp:"$231189",kMouseScrollDown:"$231190",kGamepad_Button_One:"$231191",kGamepad_Button_Two:"$231192",kGamepad_Button_Three:"$231193",kGamepad_Button_Four:"$231194",kGamepad_Button_Five:"$231195",kGamepad_Button_Six:"$231196",kGamepad_Button_Seven:"$231197",kGamepad_Button_Eight:"$231198",kGamepad_Button_Nine:"$231199",kGamepad_Button_Ten:"$231200",kGamepad_Button_Eleven:"$231201",kGamepad_Button_Twelve:"$231202",kGamepad_DPad_Up:"$231203",kGamepad_DPad_Down:"$231204",kGamepad_DPad_Left:"$231205",kGamepad_DPad_Right:"$231206",kGamepad_LeftStick_Up:"$231207",kGamepad_LeftStick_Down:"$231208",kGamepad_LeftStick_Left:"$231209",kGamepad_LeftStick_Right:"$231210",kGamepad_RightStick_Up:"$231211",kGamepad_RightStick_Down:"$231212",kGamepad_RightStick_Left:"$231213",kGamepad_RightStick_Right:"$231214"};
   function KeyMap()
   {
   }
   static function getKey(keyCode, wantNotTranslate)
   {
      if((keyCode >= 65 && keyCode <= 90 || keyCode >= 48 && keyCode <= 57) && !isNaN(keyCode))
      {
         return String.fromCharCode(keyCode);
      }
      if(wantNotTranslate)
      {
         return lib.info.KeyMap.KYEMAP["k" + keyCode].substr(1);
      }
      return lib.util.UIString.getUIString(lib.info.KeyMap.KYEMAP["k" + keyCode]);
   }
   static function toKeyCode(_keyString, wantNotTranslate)
   {
      if(_keyString == undefined || _keyString == 0 || _keyString == "")
      {
         return "";
      }
      var _loc2_ = _keyString.split("+");
      if(_loc2_ == undefined)
      {
         var _loc6_ = lib.info.KeyMap.getKey(_keyString,wantNotTranslate);
         if(_loc6_ == undefined)
         {
            return "";
         }
         return _loc6_;
      }
      var _loc1_ = 0;
      while(_loc1_ < _loc2_.length)
      {
         var _loc3_ = _loc2_[_loc1_];
         _loc2_[_loc1_] = lib.info.KeyMap.getKey(_loc3_,wantNotTranslate);
         _loc1_ = _loc1_ + 1;
      }
      return _loc2_.join("+");
   }
}
