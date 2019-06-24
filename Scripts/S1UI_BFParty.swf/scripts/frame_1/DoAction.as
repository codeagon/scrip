function checkOutofStage()
{
   var _loc2_ = 0;
   while(_loc2_ < 5)
   {
      var _loc1_ = UI["PartyMc" + _loc2_];
      var _loc4_ = lib.info.AlignInfo.xPixelToRatio(_loc1_._x + _loc1_._width);
      var _loc3_ = lib.info.AlignInfo.yPixelToRatio(_loc1_._y + _loc1_._height);
      if(_loc1_._x < 0)
      {
         _loc1_._x = lib.info.AlignInfo.zeroPointX;
      }
      if(_loc4_ > 100)
      {
         _loc1_._x = lib.info.AlignInfo.xRatioToPixel(100) - _loc1_._width;
      }
      if(_loc1_._y < 0)
      {
         _loc1_._y = lib.info.AlignInfo.zeroPointY;
      }
      else if(_loc3_ > 100)
      {
         _loc1_._y = lib.info.AlignInfo.yRatioToPixel(100) - _loc1_._height;
      }
      _loc2_ = _loc2_ + 1;
   }
}
function BFParty_UpdateStamina2(_scope, class_name)
{
   if(class_name == "1" || class_name == "3")
   {
      _scope.bg.gotoAndStop(2);
      _scope.MC_party_warning.gotoAndStop(2);
      _scope.gagebg.gotoAndStop(2);
      _scope.St_Bar._visible = true;
      _scope.class_mc._y = 24;
      _scope.partyIcon._y = 26;
      _scope.die_mc._y = 25;
   }
   else
   {
      _scope.bg.gotoAndStop(1);
      _scope.MC_party_warning.gotoAndStop(1);
      _scope.gagebg.gotoAndStop(1);
      _scope.St_Bar._visible = false;
      _scope.class_mc._y = 19;
      _scope.partyIcon._y = 21;
      _scope.die_mc._y = 20;
   }
   BFParty_ResetParty();
}
function BFParty_ResetParty()
{
   var _loc4_ = 0;
   var _loc2_ = 0;
   var _loc3_ = 0;
   var _loc1_ = 0;
   while(_loc1_ < BFParty_Setlist1[0])
   {
      UI["BFPartyMc2_SubMc" + Number(_loc1_ + 1)]._y = _loc4_ + 26;
      if(UI["BFPartyMc2_SubMc" + Number(_loc1_ + 1)]._height >= 55)
      {
         _loc4_ = _loc4_ + 56;
      }
      else
      {
         _loc4_ = _loc4_ + 48;
      }
      _loc1_ = _loc1_ + 1;
   }
   _loc1_ = 0;
   while(_loc1_ < BFParty_Setlist2[0])
   {
      UI["BFPartyMc3_SubMc" + Number(_loc1_ + 1)]._y = _loc2_ + 26;
      if(UI["BFPartyMc3_SubMc" + Number(_loc1_ + 1)]._height >= 55)
      {
         _loc2_ = _loc2_ + 56;
      }
      else
      {
         _loc2_ = _loc2_ + 48;
      }
      _loc1_ = _loc1_ + 1;
   }
   _loc1_ = 0;
   while(_loc1_ < BFParty_Setlist3[0])
   {
      UI["BFPartyMc4_SubMc" + Number(_loc1_ + 1)]._y = _loc3_ + 26;
      if(UI["BFPartyMc4_SubMc" + Number(_loc1_ + 1)]._height >= 55)
      {
         _loc3_ = _loc3_ + 56;
      }
      else
      {
         _loc3_ = _loc3_ + 48;
      }
      _loc1_ = _loc1_ + 1;
   }
}
function ToGame_BFParty_Init()
{
   fscommand("ToGame_BFParty_Init");
}
stop();
var UI = this;
UI._visible = false;
var UIname = "BFParty";
bWidgetOpen = false;
var aniSpeed = 15;
var warningTime = 0;
var NUM_ABNORMAL_SLOT = 17;
var COLOR_DISTRIBUTION_ACTIVE = 65535;
var COLOR_DISTRIBUTION_NOT_ACTIVE = 16776960;
var con = this;
var levelStr = lib.util.UIString.getUIString("$023001");
var BFPartyMcPosition_x;
var BFPartyMcPosition_y;
var BFPartyMcPosition_space;
var BFPartyMc2;
var BFPartyMc3;
var BFPartyMc4;
var BFPartyMc2_SubMc1;
var BFPartyMc2_SubMc2;
var BFPartyMc2_SubMc3;
var BFPartyMc2_SubMc4;
var BFPartyMc2_SubMc5;
var BFPartyMc3_SubMc1;
var BFPartyMc3_SubMc2;
var BFPartyMc3_SubMc3;
var BFPartyMc3_SubMc4;
var BFPartyMc3_SubMc5;
var BFPartyMc4_SubMc1;
var BFPartyMc4_SubMc2;
var BFPartyMc4_SubMc3;
var BFPartyMc4_SubMc4;
var BFPartyMc4_SubMc5;
var BFPartyMc2_SubMc1_die = 0;
var BFPartyMc2_SubMc1_connection = 0;
var BFPartyMc2_SubMc1_partyIcon = false;
var tPointX = 6.7;
var tPointY = 537;
var BFPartyBaseX_array = [0,0,0,9.8,19.6];
var snapperGroup = new lib.util.SnapperGroup();
var BFParty_Setlist1 = [];
var BFParty_Setlist2 = [];
var BFParty_Setlist3 = [];
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         UI._visible = true;
         myListener.OnGame_ChangeStageSize();
      }
      else
      {
         UI._visible = false;
      }
   }
};
var alphaMode = 0;
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(!_global.gbUIMode)
   {
   }
};
myListener.OnGame_ScaleUI = function()
{
   checkOutofStage();
};
myListener.OnGame_ChangeStageSize = function()
{
   checkOutofStage();
};
myListener.OnGame_BFParty_SetPartyWindow = function(list1, list2, list3)
{
   snapperGroup.clear();
   BFPartyMc2.removeMovieClip();
   BFPartyMc3.removeMovieClip();
   BFPartyMc4.removeMovieClip();
   BFParty_Setlist1 = [];
   BFParty_Setlist2 = [];
   BFParty_Setlist3 = [];
   if(list1 != undefined)
   {
      _root.ToGame_RequestSetUIPosition("PartyMc2");
      var _loc3_ = new Array();
      _loc3_ = list1.split("\t");
      BFParty_Setlist1 = _loc3_;
      BFPartyMc2 = UI.attachMovie("PartyMc","PartyMc2",UI.getNextHighestDepth());
      BFPartyMc2.onEnterFrame = function()
      {
         if(BFPartyMc2 != undefined)
         {
            BFPartyMc2.onEnterFrame = null;
            BFPartyMc2.UIDrager._height = BFPartyMc2._height;
            BFPartyMc2._xscale = BFPartyMc2._yscale = 100 * lib.info.AlignInfo.scaleRatio;
            BFPartyMc2.UIDrager.setData(BFPartyMc2._name,BFPartyMc2);
            snapperGroup.add(BFPartyMc2.UIDrager);
         }
      };
      BFPartyMc2.id = _loc3_[1];
      BFPartyMc2.partytitlemc.title_Name.text = _loc3_[2];
      var _loc2_ = 0;
      while(_loc2_ < _loc3_[0])
      {
         UI["BFPartyMc2_SubMc" + Number(_loc2_ + 1)] = BFPartyMc2.attachMovie("PartyTabMc","PartyTabMc" + _loc2_,BFPartyMc2.getNextHighestDepth());
         UI["BFPartyMc2_SubMc" + Number(_loc2_ + 1)].id = _loc2_;
         UI["BFPartyMc2_SubMc" + Number(_loc2_ + 1)]._x = 0;
         UI["BFPartyMc2_SubMc" + Number(_loc2_ + 1)]._y = _loc2_ * 48 + 26;
         UI["BFPartyMc2_SubMc" + Number(_loc2_ + 1)].text_lv.text = "";
         UI["BFPartyMc2_SubMc" + Number(_loc2_ + 1)].text_Name.text = "";
         UI["BFPartyMc2_SubMc" + Number(_loc2_ + 1)].class_mc.gotoAndStop(5);
         UI["BFPartyMc2_SubMc" + Number(_loc2_ + 1)].text_state._visible = false;
         UI["BFPartyMc2_SubMc" + Number(_loc2_ + 1)].partyIcon._visible = false;
         UI["BFPartyMc2_SubMc" + Number(_loc2_ + 1)].die_mc._visible = false;
         UI["BFPartyMc2_SubMc" + Number(_loc2_ + 1)].MC_party_warning._visible = false;
         UI["BFPartyMc2_SubMc" + Number(_loc2_ + 1)].St_Bar._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   if(list2 != undefined)
   {
      _root.ToGame_RequestSetUIPosition("PartyMc3");
      _loc3_ = new Array();
      _loc3_ = list2.split("\t");
      BFParty_Setlist2 = _loc3_;
      BFPartyMc3 = UI.attachMovie("PartyMc","PartyMc3",UI.getNextHighestDepth());
      BFPartyMc3.onEnterFrame = function()
      {
         if(BFPartyMc3 != undefined)
         {
            BFPartyMc3.onEnterFrame = null;
            lib.Debuger.trace("BFPartyMc3 : " + BFPartyMc3._x);
            lib.Debuger.trace("BFPartyMc3 : " + BFPartyMc3._y);
            BFPartyMc3.UIDrager._height = BFPartyMc3._height;
            BFPartyMc3._xscale = BFPartyMc3._yscale = 100 * lib.info.AlignInfo.scaleRatio;
            BFPartyMc3.UIDrager.setData(BFPartyMc3._name,BFPartyMc3);
            snapperGroup.add(BFPartyMc3.UIDrager);
         }
      };
      BFPartyMc3.id = _loc3_[1];
      BFPartyMc3.partytitlemc.title_Name.text = _loc3_[2];
      _loc2_ = 0;
      while(_loc2_ < _loc3_[0])
      {
         UI["BFPartyMc3_SubMc" + Number(_loc2_ + 1)] = BFPartyMc3.attachMovie("PartyTabMc","PartyTabMc" + _loc2_,BFPartyMc3.getNextHighestDepth());
         UI["BFPartyMc3_SubMc" + Number(_loc2_ + 1)].id = _loc2_;
         UI["BFPartyMc3_SubMc" + Number(_loc2_ + 1)]._x = 0;
         UI["BFPartyMc3_SubMc" + Number(_loc2_ + 1)]._y = _loc2_ * 48 + 26;
         UI["BFPartyMc3_SubMc" + Number(_loc2_ + 1)].text_lv.text = "";
         UI["BFPartyMc3_SubMc" + Number(_loc2_ + 1)].text_Name.text = "";
         UI["BFPartyMc3_SubMc" + Number(_loc2_ + 1)].class_mc.gotoAndStop(5);
         UI["BFPartyMc3_SubMc" + Number(_loc2_ + 1)].text_state._visible = false;
         UI["BFPartyMc3_SubMc" + Number(_loc2_ + 1)].partyIcon._visible = false;
         UI["BFPartyMc3_SubMc" + Number(_loc2_ + 1)].die_mc._visible = false;
         UI["BFPartyMc3_SubMc" + Number(_loc2_ + 1)].MC_party_warning._visible = false;
         UI["BFPartyMc3_SubMc" + Number(_loc2_ + 1)].St_Bar._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   if(list3 != undefined)
   {
      _root.ToGame_RequestSetUIPosition("PartyMc4");
      _loc3_ = new Array();
      _loc3_ = list3.split("\t");
      BFParty_Setlist3 = _loc3_;
      BFPartyMc4 = UI.attachMovie("PartyMc","PartyMc4",UI.getNextHighestDepth());
      BFPartyMc4.onEnterFrame = function()
      {
         if(BFPartyMc4 != undefined)
         {
            BFPartyMc4.onEnterFrame = null;
            lib.Debuger.trace("BFPartyMc4 : " + BFPartyMc4._x);
            lib.Debuger.trace("BFPartyMc4 : " + BFPartyMc4._y);
            BFPartyMc4.UIDrager._height = BFPartyMc4._height;
            BFPartyMc4._xscale = BFPartyMc4._yscale = 100 * lib.info.AlignInfo.scaleRatio;
            BFPartyMc4.UIDrager.setData(BFPartyMc4._name,BFPartyMc4);
            snapperGroup.add(BFPartyMc4.UIDrager);
         }
      };
      BFPartyMc4.id = _loc3_[1];
      BFPartyMc4.partytitlemc.title_Name.text = _loc3_[2];
      _loc2_ = 0;
      while(_loc2_ < _loc3_[0])
      {
         UI["BFPartyMc4_SubMc" + Number(_loc2_ + 1)] = BFPartyMc4.attachMovie("PartyTabMc","PartyTabMc" + _loc2_,BFPartyMc4.getNextHighestDepth());
         UI["BFPartyMc4_SubMc" + Number(_loc2_ + 1)].id = _loc2_;
         UI["BFPartyMc4_SubMc" + Number(_loc2_ + 1)]._x = 0;
         UI["BFPartyMc4_SubMc" + Number(_loc2_ + 1)]._y = _loc2_ * 48 + 26;
         UI["BFPartyMc4_SubMc" + Number(_loc2_ + 1)].text_lv.text = "";
         UI["BFPartyMc4_SubMc" + Number(_loc2_ + 1)].text_Name.text = "";
         UI["BFPartyMc4_SubMc" + Number(_loc2_ + 1)].class_mc.gotoAndStop(5);
         UI["BFPartyMc4_SubMc" + Number(_loc2_ + 1)].text_state._visible = false;
         UI["BFPartyMc4_SubMc" + Number(_loc2_ + 1)].partyIcon._visible = false;
         UI["BFPartyMc4_SubMc" + Number(_loc2_ + 1)].die_mc._visible = false;
         UI["BFPartyMc4_SubMc" + Number(_loc2_ + 1)].MC_party_warning._visible = false;
         UI["BFPartyMc4_SubMc" + Number(_loc2_ + 1)].St_Bar._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
};
myListener.OnGame_SetUIPosition = function(bLocked, UIName, posXRatio, posYRatio, notRatio)
{
   var _loc1_ = 2;
   while(_loc1_ < 5)
   {
      if("PartyMc" + _loc1_ == UIName)
      {
         bLocked = Number(bLocked);
         posXRatio = Number(posXRatio);
         posYRatio = Number(posYRatio);
         var _loc4_ = UI["PartyMc" + _loc1_];
         getURL("FSCommand:" add ("OnGame_SetUIPosition: " + bLocked + ", " + UIName + ", " + posXRatio + ", " + posYRatio),"");
         if(bLocked == 0)
         {
            posXRatio = BFPartyBaseX_array[_loc1_];
            posYRatio = 49;
         }
         _loc4_._x = lib.info.AlignInfo.zeroPointX + lib.info.AlignInfo.onePercentPixelW * posXRatio;
         _loc4_._y = lib.info.AlignInfo.zeroPointY + lib.info.AlignInfo.onePercentPixelH * posYRatio;
      }
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGame_ResetUIPosition = function()
{
   snapperGroup.clear();
   var _loc1_ = 2;
   while(_loc1_ < 5)
   {
      var _loc2_ = UI["PartyMc" + _loc1_];
      if(_loc1_ == 2)
      {
         _loc2_._x = lib.info.AlignInfo.xRatioToPixel(BFPartyBaseX_array[_loc1_]);
      }
      else
      {
         _loc2_._x = UI["PartyMc" + (_loc1_ - 1)]._x + UI["PartyMc" + (_loc1_ - 1)]._width - 12;
      }
      _loc2_._y = lib.info.AlignInfo.yRatioToPixel(49);
      lib.info.AlignInfo.savePos(_loc2_,0);
      _loc1_ = _loc1_ + 1;
   }
   snapperGroup.add(BFPartyMc2.UIDrager);
   snapperGroup.add(BFPartyMc3.UIDrager);
   snapperGroup.add(BFPartyMc4.UIDrager);
};
myListener.OnGame_BFParty_UpdateSurvival = function(partyid, partymemberid, bool)
{
   var _loc1_ = undefined;
   if(bool == "1")
   {
      _loc1_ = false;
   }
   else
   {
      _loc1_ = true;
   }
   if(BFPartyMc2.id == partyid)
   {
      if(BFPartyMc2_SubMc1.id == partymemberid)
      {
         BFPartyMc2_SubMc1.die_mc._visible = _loc1_;
         BFPartyMc2_SubMc1.MC_party_warning._visible = _loc1_;
         if(BFPartyMc2_SubMc1.partyIcon._visible == true)
         {
            BFPartyMc2_SubMc1.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc2_SubMc1.die_mc.gotoAndStop(1);
         }
      }
      if(BFPartyMc2_SubMc2.id == partymemberid)
      {
         BFPartyMc2_SubMc2.die_mc._visible = _loc1_;
         BFPartyMc2_SubMc2.MC_party_warning._visible = _loc1_;
         if(BFPartyMc2_SubMc2.partyIcon._visible == true)
         {
            BFPartyMc2_SubMc2.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc2_SubMc2.die_mc.gotoAndStop(1);
         }
      }
      if(BFPartyMc2_SubMc3.id == partymemberid)
      {
         BFPartyMc2_SubMc3.die_mc._visible = _loc1_;
         BFPartyMc2_SubMc3.MC_party_warning._visible = _loc1_;
         if(BFPartyMc2_SubMc3.partyIcon._visible == true)
         {
            BFPartyMc2_SubMc3.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc2_SubMc3.die_mc.gotoAndStop(1);
         }
      }
      if(BFPartyMc2_SubMc4.id == partymemberid)
      {
         BFPartyMc2_SubMc4.die_mc._visible = _loc1_;
         BFPartyMc2_SubMc4.MC_party_warning._visible = _loc1_;
         if(BFPartyMc2_SubMc4.partyIcon._visible == true)
         {
            BFPartyMc2_SubMc4.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc2_SubMc4.die_mc.gotoAndStop(1);
         }
      }
      if(BFPartyMc2_SubMc5.id == partymemberid)
      {
         BFPartyMc2_SubMc5.die_mc._visible = _loc1_;
         BFPartyMc2_SubMc5.MC_party_warning._visible = _loc1_;
         if(BFPartyMc2_SubMc5.partyIcon._visible == true)
         {
            BFPartyMc2_SubMc5.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc2_SubMc5.die_mc.gotoAndStop(1);
         }
      }
   }
   else if(BFPartyMc3.id == partyid)
   {
      if(BFPartyMc3_SubMc1.id == partymemberid)
      {
         BFPartyMc3_SubMc1.die_mc._visible = _loc1_;
         BFPartyMc3_SubMc1.MC_party_warning._visible = _loc1_;
         if(BFPartyMc3_SubMc1.partyIcon._visible == true)
         {
            BFPartyMc3_SubMc1.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc3_SubMc1.die_mc.gotoAndStop(1);
         }
      }
      if(BFPartyMc3_SubMc2.id == partymemberid)
      {
         BFPartyMc3_SubMc2.die_mc._visible = _loc1_;
         BFPartyMc3_SubMc2.MC_party_warning._visible = _loc1_;
         if(BFPartyMc3_SubMc2.partyIcon._visible == true)
         {
            BFPartyMc3_SubMc2.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc3_SubMc2.die_mc.gotoAndStop(1);
         }
      }
      if(BFPartyMc3_SubMc3.id == partymemberid)
      {
         BFPartyMc3_SubMc3.die_mc._visible = _loc1_;
         BFPartyMc3_SubMc3.MC_party_warning._visible = _loc1_;
         if(BFPartyMc3_SubMc3.partyIcon._visible == true)
         {
            BFPartyMc3_SubMc3.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc3_SubMc3.die_mc.gotoAndStop(1);
         }
      }
      if(BFPartyMc3_SubMc4.id == partymemberid)
      {
         BFPartyMc3_SubMc4.die_mc._visible = _loc1_;
         BFPartyMc3_SubMc4.MC_party_warning._visible = _loc1_;
         if(BFPartyMc3_SubMc4.partyIcon._visible == true)
         {
            BFPartyMc3_SubMc4.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc3_SubMc4.die_mc.gotoAndStop(1);
         }
      }
      if(BFPartyMc3_SubMc5.id == partymemberid)
      {
         BFPartyMc3_SubMc5.die_mc._visible = _loc1_;
         BFPartyMc3_SubMc5.MC_party_warning._visible = _loc1_;
         if(BFPartyMc3_SubMc5.partyIcon._visible == true)
         {
            BFPartyMc3_SubMc5.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc3_SubMc5.die_mc.gotoAndStop(1);
         }
      }
   }
   else if(BFPartyMc4.id == partyid)
   {
      if(BFPartyMc4_SubMc1.id == partymemberid)
      {
         BFPartyMc4_SubMc1.die_mc._visible = _loc1_;
         BFPartyMc4_SubMc1.MC_party_warning._visible = _loc1_;
         if(BFPartyMc4_SubMc1.partyIcon._visible == true)
         {
            BFPartyMc4_SubMc1.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc4_SubMc1.die_mc.gotoAndStop(1);
         }
      }
      if(BFPartyMc4_SubMc2.id == partymemberid)
      {
         BFPartyMc4_SubMc2.die_mc._visible = _loc1_;
         BFPartyMc4_SubMc2.MC_party_warning._visible = _loc1_;
         if(BFPartyMc4_SubMc2.partyIcon._visible == true)
         {
            BFPartyMc4_SubMc2.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc4_SubMc2.die_mc.gotoAndStop(1);
         }
      }
      if(BFPartyMc4_SubMc3.id == partymemberid)
      {
         BFPartyMc4_SubMc3.die_mc._visible = _loc1_;
         BFPartyMc4_SubMc3.MC_party_warning._visible = _loc1_;
         if(BFPartyMc4_SubMc3.partyIcon._visible == true)
         {
            BFPartyMc4_SubMc3.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc4_SubMc3.die_mc.gotoAndStop(1);
         }
      }
      if(BFPartyMc4_SubMc4.id == partymemberid)
      {
         BFPartyMc4_SubMc4.die_mc._visible = _loc1_;
         BFPartyMc4_SubMc4.MC_party_warning._visible = _loc1_;
         if(BFPartyMc4_SubMc4.partyIcon._visible == true)
         {
            BFPartyMc4_SubMc4.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc4_SubMc4.die_mc.gotoAndStop(1);
         }
      }
      if(BFPartyMc4_SubMc5.id == partymemberid)
      {
         BFPartyMc4_SubMc5.die_mc._visible = _loc1_;
         BFPartyMc4_SubMc5.MC_party_warning._visible = _loc1_;
         if(BFPartyMc4_SubMc5.partyIcon._visible == true)
         {
            BFPartyMc4_SubMc5.die_mc.gotoAndStop(2);
         }
         else
         {
            BFPartyMc4_SubMc5.die_mc.gotoAndStop(1);
         }
      }
   }
};
myListener.OnGame_BFParty_UpdateConnection = function(partyid, partymemberid, bool)
{
   var _loc1_ = undefined;
   var _loc5_ = undefined;
   if(bool == "1")
   {
      _loc1_ = false;
   }
   else
   {
      _loc1_ = true;
   }
   if(BFPartyMc2.id == partyid)
   {
      if(BFPartyMc2_SubMc1.id == partymemberid)
      {
         BFPartyMc2_SubMc1.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc2_SubMc1.MC_party_warning._visible = false;
            BFPartyMc2_SubMc1.die_mc._visible = false;
         }
      }
      if(BFPartyMc2_SubMc2.id == partymemberid)
      {
         BFPartyMc2_SubMc2.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc2_SubMc2.MC_party_warning._visible = false;
            BFPartyMc2_SubMc2.die_mc._visible = false;
         }
      }
      if(BFPartyMc2_SubMc3.id == partymemberid)
      {
         BFPartyMc2_SubMc3.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc2_SubMc3.MC_party_warning._visible = false;
            BFPartyMc2_SubMc3.die_mc._visible = false;
         }
      }
      if(BFPartyMc2_SubMc4.id == partymemberid)
      {
         BFPartyMc2_SubMc4.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc2_SubMc4.MC_party_warning._visible = false;
            BFPartyMc2_SubMc4.die_mc._visible = false;
         }
      }
      if(BFPartyMc2_SubMc5.id == partymemberid)
      {
         BFPartyMc2_SubMc5.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc2_SubMc5.MC_party_warning._visible = false;
            BFPartyMc2_SubMc5.die_mc._visible = false;
         }
      }
   }
   else if(BFPartyMc3.id == partyid)
   {
      if(BFPartyMc3_SubMc1.id == partymemberid)
      {
         BFPartyMc3_SubMc1.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc3_SubMc1.MC_party_warning._visible = false;
            BFPartyMc3_SubMc1.die_mc._visible = false;
         }
      }
      if(BFPartyMc3_SubMc2.id == partymemberid)
      {
         BFPartyMc3_SubMc2.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc3_SubMc2.MC_party_warning._visible = false;
            BFPartyMc3_SubMc2.die_mc._visible = false;
         }
      }
      if(BFPartyMc3_SubMc3.id == partymemberid)
      {
         BFPartyMc3_SubMc3.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc3_SubMc3.MC_party_warning._visible = false;
            BFPartyMc3_SubMc3.die_mc._visible = false;
         }
      }
      if(BFPartyMc3_SubMc4.id == partymemberid)
      {
         BFPartyMc3_SubMc4.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc3_SubMc4.MC_party_warning._visible = false;
            BFPartyMc3_SubMc4.die_mc._visible = false;
         }
      }
      if(BFPartyMc3_SubMc5.id == partymemberid)
      {
         BFPartyMc3_SubMc5.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc3_SubMc5.MC_party_warning._visible = false;
            BFPartyMc3_SubMc5.die_mc._visible = false;
         }
      }
   }
   else if(BFPartyMc4.id == partyid)
   {
      if(BFPartyMc4_SubMc1.id == partymemberid)
      {
         BFPartyMc4_SubMc1.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc4_SubMc1.MC_party_warning._visible = false;
            BFPartyMc4_SubMc1.die_mc._visible = false;
         }
      }
      if(BFPartyMc4_SubMc2.id == partymemberid)
      {
         BFPartyMc4_SubMc2.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc4_SubMc2.MC_party_warning._visible = false;
            BFPartyMc4_SubMc2.die_mc._visible = false;
         }
      }
      if(BFPartyMc4_SubMc3.id == partymemberid)
      {
         BFPartyMc4_SubMc3.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc4_SubMc3.MC_party_warning._visible = false;
            BFPartyMc4_SubMc3.die_mc._visible = false;
         }
      }
      if(BFPartyMc4_SubMc4.id == partymemberid)
      {
         BFPartyMc4_SubMc4.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc4_SubMc4.MC_party_warning._visible = false;
            BFPartyMc4_SubMc4.die_mc._visible = false;
         }
      }
      if(BFPartyMc4_SubMc5.id == partymemberid)
      {
         BFPartyMc4_SubMc5.text_state._visible = _loc1_;
         if(_loc1_ == true)
         {
            BFPartyMc4_SubMc5.MC_party_warning._visible = false;
            BFPartyMc4_SubMc5.die_mc._visible = false;
         }
      }
   }
};
myListener.OnGame_BFParty_UpdateMaster = function(partyid, partymemberid, bool)
{
   var _loc1_ = undefined;
   if(bool == "1")
   {
      _loc1_ = true;
   }
   else
   {
      _loc1_ = false;
   }
   if(BFPartyMc2.id == partyid)
   {
      if(BFPartyMc2_SubMc1.id == partymemberid)
      {
         BFPartyMc2_SubMc1.partyIcon._visible = _loc1_;
      }
      if(BFPartyMc2_SubMc2.id == partymemberid)
      {
         BFPartyMc2_SubMc2.partyIcon._visible = _loc1_;
      }
      if(BFPartyMc2_SubMc3.id == partymemberid)
      {
         BFPartyMc2_SubMc3.partyIcon._visible = _loc1_;
      }
      if(BFPartyMc2_SubMc4.id == partymemberid)
      {
         BFPartyMc2_SubMc4.partyIcon._visible = _loc1_;
      }
      if(BFPartyMc2_SubMc5.id == partymemberid)
      {
         BFPartyMc2_SubMc5.partyIcon._visible = _loc1_;
      }
   }
   else if(BFPartyMc3.id == partyid)
   {
      if(BFPartyMc3_SubMc1.id == partymemberid)
      {
         BFPartyMc3_SubMc1.partyIcon._visible = _loc1_;
      }
      if(BFPartyMc3_SubMc2.id == partymemberid)
      {
         BFPartyMc3_SubMc2.partyIcon._visible = _loc1_;
      }
      if(BFPartyMc3_SubMc3.id == partymemberid)
      {
         BFPartyMc3_SubMc3.partyIcon._visible = _loc1_;
      }
      if(BFPartyMc3_SubMc4.id == partymemberid)
      {
         BFPartyMc3_SubMc4.partyIcon._visible = _loc1_;
      }
      if(BFPartyMc3_SubMc5.id == partymemberid)
      {
         BFPartyMc3_SubMc5.partyIcon._visible = _loc1_;
      }
   }
   else if(BFPartyMc4.id == partyid)
   {
      if(BFPartyMc4_SubMc1.id == partymemberid)
      {
         BFPartyMc4_SubMc1.partyIcon._visible = _loc1_;
      }
      if(BFPartyMc4_SubMc2.id == partymemberid)
      {
         BFPartyMc4_SubMc2.partyIcon._visible = _loc1_;
      }
      if(BFPartyMc4_SubMc3.id == partymemberid)
      {
         BFPartyMc4_SubMc3.partyIcon._visible = _loc1_;
      }
      if(BFPartyMc4_SubMc4.id == partymemberid)
      {
         BFPartyMc4_SubMc4.partyIcon._visible = _loc1_;
      }
      if(BFPartyMc4_SubMc5.id == partymemberid)
      {
         BFPartyMc4_SubMc5.partyIcon._visible = _loc1_;
      }
   }
};
myListener.OnGame_BFParty_UpdateChar = function(partyid, partymemberid, level_txt, name_txt, class_name)
{
   var _loc1_ = Number(class_name) + 1;
   if(BFPartyMc2.id == partyid)
   {
      if(BFPartyMc2_SubMc1.id == partymemberid)
      {
         BFPartyMc2_SubMc1.text_lv.text = "[" + level_txt + "]";
         BFPartyMc2_SubMc1.text_Name.text = name_txt;
         BFPartyMc2_SubMc1.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc2_SubMc1,class_name);
      }
      if(BFPartyMc2_SubMc2.id == partymemberid)
      {
         BFPartyMc2_SubMc2.text_lv.text = "[" + level_txt + "]";
         BFPartyMc2_SubMc2.text_Name.text = name_txt;
         BFPartyMc2_SubMc2.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc2_SubMc2,class_name);
      }
      if(BFPartyMc2_SubMc3.id == partymemberid)
      {
         BFPartyMc2_SubMc3.text_lv.text = "[" + level_txt + "]";
         BFPartyMc2_SubMc3.text_Name.text = name_txt;
         BFPartyMc2_SubMc3.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc2_SubMc3,class_name);
      }
      if(BFPartyMc2_SubMc4.id == partymemberid)
      {
         BFPartyMc2_SubMc4.text_lv.text = "[" + level_txt + "]";
         BFPartyMc2_SubMc4.text_Name.text = name_txt;
         BFPartyMc2_SubMc4.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc2_SubMc4,class_name);
      }
      if(BFPartyMc2_SubMc5.id == partymemberid)
      {
         BFPartyMc2_SubMc5.text_lv.text = "[" + level_txt + "]";
         BFPartyMc2_SubMc5.text_Name.text = name_txt;
         BFPartyMc2_SubMc5.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc2_SubMc5,class_name);
      }
   }
   else if(BFPartyMc3.id == partyid)
   {
      if(BFPartyMc3_SubMc1.id == partymemberid)
      {
         BFPartyMc3_SubMc1.text_lv.text = "[" + level_txt + "]";
         BFPartyMc3_SubMc1.text_Name.text = name_txt;
         BFPartyMc3_SubMc1.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc3_SubMc1,class_name);
      }
      if(BFPartyMc3_SubMc2.id == partymemberid)
      {
         BFPartyMc3_SubMc2.text_lv.text = "[" + level_txt + "]";
         BFPartyMc3_SubMc2.text_Name.text = name_txt;
         BFPartyMc3_SubMc2.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc3_SubMc2,class_name);
      }
      if(BFPartyMc3_SubMc3.id == partymemberid)
      {
         BFPartyMc3_SubMc3.text_lv.text = "[" + level_txt + "]";
         BFPartyMc3_SubMc3.text_Name.text = name_txt;
         BFPartyMc3_SubMc3.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc3_SubMc3,class_name);
      }
      if(BFPartyMc3_SubMc4.id == partymemberid)
      {
         BFPartyMc3_SubMc4.text_lv.text = "[" + level_txt + "]";
         BFPartyMc3_SubMc4.text_Name.text = name_txt;
         BFPartyMc3_SubMc4.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc3_SubMc4,class_name);
      }
      if(BFPartyMc3_SubMc5.id == partymemberid)
      {
         BFPartyMc3_SubMc5.text_lv.text = "[" + level_txt + "]";
         BFPartyMc3_SubMc5.text_Name.text = name_txt;
         BFPartyMc3_SubMc5.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc3_SubMc5,class_name);
      }
   }
   else if(BFPartyMc4.id == partyid)
   {
      if(BFPartyMc4_SubMc1.id == partymemberid)
      {
         BFPartyMc4_SubMc1.text_lv.text = "[" + level_txt + "]";
         BFPartyMc4_SubMc1.text_Name.text = name_txt;
         BFPartyMc4_SubMc1.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc4_SubMc1,class_name);
      }
      if(BFPartyMc4_SubMc2.id == partymemberid)
      {
         BFPartyMc4_SubMc2.text_lv.text = "[" + level_txt + "]";
         BFPartyMc4_SubMc2.text_Name.text = name_txt;
         BFPartyMc4_SubMc2.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc4_SubMc2,class_name);
      }
      if(BFPartyMc4_SubMc3.id == partymemberid)
      {
         BFPartyMc4_SubMc3.text_lv.text = "[" + level_txt + "]";
         BFPartyMc4_SubMc3.text_Name.text = name_txt;
         BFPartyMc4_SubMc3.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc4_SubMc3,class_name);
      }
      if(BFPartyMc4_SubMc4.id == partymemberid)
      {
         BFPartyMc4_SubMc4.text_lv.text = "[" + level_txt + "]";
         BFPartyMc4_SubMc4.text_Name.text = name_txt;
         BFPartyMc4_SubMc4.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc4_SubMc4,class_name);
      }
      if(BFPartyMc4_SubMc5.id == partymemberid)
      {
         BFPartyMc4_SubMc5.text_lv.text = "[" + level_txt + "]";
         BFPartyMc4_SubMc5.text_Name.text = name_txt;
         BFPartyMc4_SubMc5.class_mc.gotoAndStop(_loc1_);
         BFParty_UpdateStamina(BFPartyMc4_SubMc5,class_name);
      }
   }
};
myListener.OnGame_BFParty_UpdtaeHP = function(partyid, partymemberid, hp, maxHp, maxHpAdd)
{
   var _loc2_ = Number(hp);
   var _loc5_ = Number(maxHp);
   var _loc6_ = Number(maxHpAdd);
   var _loc1_ = _loc5_ + _loc6_;
   if(BFPartyMc2.id == partyid)
   {
      if(BFPartyMc2_SubMc1.id == partymemberid)
      {
         BFPartyMc2_SubMc1.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc1.Hp_Bar._width > 120)
         {
            BFPartyMc2_SubMc1.Hp_Bar._width = 120;
         }
      }
      if(BFPartyMc2_SubMc2.id == partymemberid)
      {
         BFPartyMc2_SubMc2.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc2.Hp_Bar._width > 120)
         {
            BFPartyMc2_SubMc2.Hp_Bar._width = 120;
         }
      }
      if(BFPartyMc2_SubMc3.id == partymemberid)
      {
         BFPartyMc2_SubMc3.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc3.Hp_Bar._width > 120)
         {
            BFPartyMc2_SubMc3.Hp_Bar._width = 120;
         }
      }
      if(BFPartyMc2_SubMc4.id == partymemberid)
      {
         BFPartyMc2_SubMc4.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc4.Hp_Bar._width > 120)
         {
            BFPartyMc2_SubMc4.Hp_Bar._width = 120;
         }
      }
      if(BFPartyMc2_SubMc5.id == partymemberid)
      {
         BFPartyMc2_SubMc5.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc5.Hp_Bar._width > 120)
         {
            BFPartyMc2_SubMc5.Hp_Bar._width = 120;
         }
      }
   }
   else if(BFPartyMc3.id == partyid)
   {
      if(BFPartyMc3_SubMc1.id == partymemberid)
      {
         BFPartyMc3_SubMc1.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc1.Hp_Bar._width > 120)
         {
            BFPartyMc3_SubMc1.Hp_Bar._width = 120;
         }
      }
      if(BFPartyMc3_SubMc2.id == partymemberid)
      {
         BFPartyMc3_SubMc2.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc2.Hp_Bar._width > 120)
         {
            BFPartyMc3_SubMc2.Hp_Bar._width = 120;
         }
      }
      if(BFPartyMc3_SubMc3.id == partymemberid)
      {
         BFPartyMc3_SubMc3.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc3.Hp_Bar._width > 120)
         {
            BFPartyMc3_SubMc3.Hp_Bar._width = 120;
         }
      }
      if(BFPartyMc3_SubMc4.id == partymemberid)
      {
         BFPartyMc3_SubMc4.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc4.Hp_Bar._width > 120)
         {
            BFPartyMc3_SubMc4.Hp_Bar._width = 120;
         }
      }
      if(BFPartyMc3_SubMc5.id == partymemberid)
      {
         BFPartyMc3_SubMc5.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc5.Hp_Bar._width > 120)
         {
            BFPartyMc3_SubMc5.Hp_Bar._width = 120;
         }
      }
   }
   else if(BFPartyMc4.id == partyid)
   {
      if(BFPartyMc4_SubMc1.id == partymemberid)
      {
         BFPartyMc4_SubMc1.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc1.Hp_Bar._width > 120)
         {
            BFPartyMc4_SubMc1.Hp_Bar._width = 120;
         }
      }
      if(BFPartyMc4_SubMc2.id == partymemberid)
      {
         BFPartyMc4_SubMc2.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc2.Hp_Bar._width > 120)
         {
            BFPartyMc4_SubMc2.Hp_Bar._width = 120;
         }
      }
      if(BFPartyMc4_SubMc3.id == partymemberid)
      {
         BFPartyMc4_SubMc3.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc3.Hp_Bar._width > 120)
         {
            BFPartyMc4_SubMc3.Hp_Bar._width = 120;
         }
      }
      if(BFPartyMc4_SubMc4.id == partymemberid)
      {
         BFPartyMc4_SubMc4.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc4.Hp_Bar._width > 120)
         {
            BFPartyMc4_SubMc4.Hp_Bar._width = 120;
         }
      }
      if(BFPartyMc4_SubMc5.id == partymemberid)
      {
         BFPartyMc4_SubMc5.Hp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc5.Hp_Bar._width > 120)
         {
            BFPartyMc4_SubMc5.Hp_Bar._width = 120;
         }
      }
   }
};
myListener.OnGame_BFParty_UpdateMP = function(partyid, partymemberid, mp, maxMp, maxMpAdd)
{
   var _loc2_ = Number(mp);
   var _loc6_ = Number(maxMp);
   var _loc5_ = Number(maxMpAdd);
   var _loc1_ = _loc6_ + _loc5_;
   if(BFPartyMc2.id == partyid)
   {
      if(BFPartyMc2_SubMc1.id == partymemberid)
      {
         BFPartyMc2_SubMc1.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc1.Mp_Bar._width > 120)
         {
            BFPartyMc2_SubMc1.Mp_Bar._width = 120;
         }
      }
      if(BFPartyMc2_SubMc2.id == partymemberid)
      {
         BFPartyMc2_SubMc2.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc2.Mp_Bar._width > 120)
         {
            BFPartyMc2_SubMc2.Mp_Bar._width = 120;
         }
      }
      if(BFPartyMc2_SubMc3.id == partymemberid)
      {
         BFPartyMc2_SubMc3.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc3.Mp_Bar._width > 120)
         {
            BFPartyMc2_SubMc3.Mp_Bar._width = 120;
         }
      }
      if(BFPartyMc2_SubMc4.id == partymemberid)
      {
         BFPartyMc2_SubMc4.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc4.Mp_Bar._width > 120)
         {
            BFPartyMc2_SubMc4.Mp_Bar._width = 120;
         }
      }
      if(BFPartyMc2_SubMc5.id == partymemberid)
      {
         BFPartyMc2_SubMc5.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc5.Mp_Bar._width > 120)
         {
            BFPartyMc2_SubMc5.Mp_Bar._width = 120;
         }
      }
   }
   else if(BFPartyMc3.id == partyid)
   {
      if(BFPartyMc3_SubMc1.id == partymemberid)
      {
         BFPartyMc3_SubMc1.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc1.Mp_Bar._width > 120)
         {
            BFPartyMc3_SubMc1.Mp_Bar._width = 120;
         }
      }
      if(BFPartyMc3_SubMc2.id == partymemberid)
      {
         BFPartyMc3_SubMc2.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc2.Mp_Bar._width > 120)
         {
            BFPartyMc3_SubMc2.Mp_Bar._width = 120;
         }
      }
      if(BFPartyMc3_SubMc3.id == partymemberid)
      {
         BFPartyMc3_SubMc3.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc3.Mp_Bar._width > 120)
         {
            BFPartyMc3_SubMc3.Mp_Bar._width = 120;
         }
      }
      if(BFPartyMc3_SubMc4.id == partymemberid)
      {
         BFPartyMc3_SubMc4.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc4.Mp_Bar._width > 120)
         {
            BFPartyMc3_SubMc4.Mp_Bar._width = 120;
         }
      }
      if(BFPartyMc3_SubMc5.id == partymemberid)
      {
         BFPartyMc3_SubMc5.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc5.Mp_Bar._width > 120)
         {
            BFPartyMc3_SubMc5.Mp_Bar._width = 120;
         }
      }
   }
   else if(BFPartyMc4.id == partyid)
   {
      if(BFPartyMc4_SubMc1.id == partymemberid)
      {
         BFPartyMc4_SubMc1.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc1.Mp_Bar._width > 120)
         {
            BFPartyMc4_SubMc1.Mp_Bar._width = 120;
         }
      }
      if(BFPartyMc4_SubMc2.id == partymemberid)
      {
         BFPartyMc4_SubMc2.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc2.Mp_Bar._width > 120)
         {
            BFPartyMc4_SubMc2.Mp_Bar._width = 120;
         }
      }
      if(BFPartyMc4_SubMc3.id == partymemberid)
      {
         BFPartyMc4_SubMc3.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc3.Mp_Bar._width > 120)
         {
            BFPartyMc4_SubMc3.Mp_Bar._width = 120;
         }
      }
      if(BFPartyMc4_SubMc4.id == partymemberid)
      {
         BFPartyMc4_SubMc4.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc4.Mp_Bar._width > 120)
         {
            BFPartyMc4_SubMc4.Mp_Bar._width = 120;
         }
      }
      if(BFPartyMc4_SubMc5.id == partymemberid)
      {
         BFPartyMc4_SubMc5.Mp_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc5.Mp_Bar._width > 120)
         {
            BFPartyMc4_SubMc5.Mp_Bar._width = 120;
         }
      }
   }
};
myListener.OnGame_BFParty_UpdtaeST = function(partyid, partymemberid, st, maxSt, maxStAdd)
{
   var _loc2_ = Number(st);
   var _loc5_ = Number(maxSt);
   var _loc6_ = Number(maxStAdd);
   var _loc1_ = _loc5_ + _loc6_;
   if(BFPartyMc2.id == partyid)
   {
      if(BFPartyMc2_SubMc1.id == partymemberid)
      {
         BFPartyMc2_SubMc1.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc1.St_Bar._width > 120)
         {
            BFPartyMc2_SubMc1.St_Bar._width = 120;
         }
      }
      if(BFPartyMc2_SubMc2.id == partymemberid)
      {
         BFPartyMc2_SubMc2.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc2.St_Bar._width > 120)
         {
            BFPartyMc2_SubMc2.St_Bar._width = 120;
         }
      }
      if(BFPartyMc2_SubMc3.id == partymemberid)
      {
         BFPartyMc2_SubMc3.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc3.St_Bar._width > 120)
         {
            BFPartyMc2_SubMc3.St_Bar._width = 120;
         }
      }
      if(BFPartyMc2_SubMc4.id == partymemberid)
      {
         BFPartyMc2_SubMc4.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc4.St_Bar._width > 120)
         {
            BFPartyMc2_SubMc4.St_Bar._width = 120;
         }
      }
      if(BFPartyMc2_SubMc5.id == partymemberid)
      {
         BFPartyMc2_SubMc5.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc2_SubMc5.St_Bar._width > 120)
         {
            BFPartyMc2_SubMc5.St_Bar._width = 120;
         }
      }
   }
   else if(BFPartyMc3.id == partyid)
   {
      if(BFPartyMc3_SubMc1.id == partymemberid)
      {
         BFPartyMc3_SubMc1.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc1.St_Bar._width > 120)
         {
            BFPartyMc3_SubMc1.St_Bar._width = 120;
         }
      }
      if(BFPartyMc3_SubMc2.id == partymemberid)
      {
         BFPartyMc3_SubMc2.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc2.St_Bar._width > 120)
         {
            BFPartyMc3_SubMc2.St_Bar._width = 120;
         }
      }
      if(BFPartyMc3_SubMc3.id == partymemberid)
      {
         BFPartyMc3_SubMc3.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc3.St_Bar._width > 120)
         {
            BFPartyMc3_SubMc3.St_Bar._width = 120;
         }
      }
      if(BFPartyMc3_SubMc4.id == partymemberid)
      {
         BFPartyMc3_SubMc4.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc4.St_Bar._width > 120)
         {
            BFPartyMc3_SubMc4.St_Bar._width = 120;
         }
      }
      if(BFPartyMc3_SubMc5.id == partymemberid)
      {
         BFPartyMc3_SubMc5.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc3_SubMc5.St_Bar._width > 120)
         {
            BFPartyMc3_SubMc5.St_Bar._width = 120;
         }
      }
   }
   else if(BFPartyMc4.id == partyid)
   {
      if(BFPartyMc4_SubMc1.id == partymemberid)
      {
         BFPartyMc4_SubMc1.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc1.St_Bar._width > 120)
         {
            BFPartyMc4_SubMc1.St_Bar._width = 120;
         }
      }
      if(BFPartyMc4_SubMc2.id == partymemberid)
      {
         BFPartyMc4_SubMc2.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc2.St_Bar._width > 120)
         {
            BFPartyMc4_SubMc2.St_Bar._width = 120;
         }
      }
      if(BFPartyMc4_SubMc3.id == partymemberid)
      {
         BFPartyMc4_SubMc3.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc3.St_Bar._width > 120)
         {
            BFPartyMc4_SubMc3.St_Bar._width = 120;
         }
      }
      if(BFPartyMc4_SubMc4.id == partymemberid)
      {
         BFPartyMc4_SubMc4.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc4.St_Bar._width > 120)
         {
            BFPartyMc4_SubMc4.St_Bar._width = 120;
         }
      }
      if(BFPartyMc4_SubMc5.id == partymemberid)
      {
         BFPartyMc4_SubMc5.St_Bar._width = _loc2_ / _loc1_ * 120;
         if(BFPartyMc4_SubMc5.St_Bar._width > 120)
         {
            BFPartyMc4_SubMc5.St_Bar._width = 120;
         }
      }
   }
};
myListener.OnGame_BFParty_UpdateVisible = function(partyid, bool)
{
   var _loc1_ = undefined;
   if(bool == "1")
   {
      _loc1_ = true;
   }
   else
   {
      _loc1_ = false;
   }
   if(BFPartyMc2.id == partyid)
   {
      BFPartyMc2._visible = _loc1_;
   }
   if(BFPartyMc3.id == partyid)
   {
      BFPartyMc3._visible = _loc1_;
   }
   if(BFPartyMc4.id == partyid)
   {
      BFPartyMc4._visible = _loc1_;
   }
};
ToGame_BFParty_Init();
