function OnGame_BalloonWorld_SetMessage(_data, _type)
{
   tradeType = Number(_type);
   setMessage(_data);
}
function setMessage(_data)
{
   var _loc6_ = lib.util.ExtString.split(_data,"\t");
   var _loc1_ = [];
   var _loc5_ = undefined;
   if(_loc6_[2] != undefined || _loc6_[2] != "")
   {
      var _loc4_ = lib.util.ExtString.split(_loc6_[2]," ");
      var _loc3_ = _loc4_.shift();
      while(_loc3_ != undefined)
      {
         trace(" col  " + _loc3_ + "    " + _loc3_.charAt(0).toLowerCase());
         var _loc2_ = _loc3_.split("=");
         switch(_loc2_[0].toLowerCase())
         {
            case "r":
               _loc1_[0] = Number(_loc2_[1]).toString(16);
               if(_loc1_[0].length == 1)
               {
                  _loc1_[0] = "0" + _loc1_[0];
               }
               break;
            case "g":
               _loc1_[1] = Number(_loc2_[1]).toString(16);
               if(_loc1_[1].length == 1)
               {
                  _loc1_[1] = "0" + _loc1_[1];
               }
               break;
            case "b":
               _loc1_[2] = Number(_loc2_[1]).toString(16);
               if(_loc1_[2].length == 1)
               {
                  _loc1_[2] = "0" + _loc1_[2];
               }
               break;
            case "a":
               _loc5_ = Number(_loc2_[1]);
         }
         _loc3_ = _loc4_.shift();
      }
      color = Number("0x" + _loc1_.join(""));
   }
   messageFd.textColor = color;
   parseMessage(_loc6_[1]);
   var _loc8_ = messageFd.textWidth;
   var _loc7_ = Math.min(messageFd.textHeight + TMARG * 2,MAXH);
   bgMc.gotoAndStop(tradeType + 1);
   bgMc._width = Math.max(_loc8_ + LMARG * 2,MINIMUNSIZE);
   bgMc._height = Math.max(_loc7_,MINH);
   bgMc._visible = true;
   messageFd._y = bgMc._y - bgMc._height / 2 - messageFd.textHeight / 2;
}
function parseMessage(_message)
{
   messageFd.text = String(_message);
   if(messageFd.numLines > MAXLINES)
   {
      var _loc1_ = messageFd.getLineOffset(MAXLINES);
      messageFd.replace(_loc1_ - 2,_loc1_,"…");
   }
}
_global.gfxExtensions = true;
messageFd.autoSize = true;
var MAXLINES = 5;
var LMARG = 10;
var TMARG = 20;
var MINH = 50;
var MAXH = bgMc._height;
var ARROWMARG = -4;
var MINIMUNSIZE = 180;
var COLORS = [lib.info.TextColor.BALLOON_HOMUNVENDOR,lib.info.TextColor.BALLOON_BATTLEFIELD];
var tradeType;
messageFd.text = "";
bgMc._visible = false;
messageFd2.backgroundColor = 0;
messageFd3.noTranslate = false;
