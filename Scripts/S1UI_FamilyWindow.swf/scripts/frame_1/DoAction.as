function ToGame_FamilyWindow_Init()
{
   fscommand("ToGame_FamilyWindow_Init");
}
function ToGame_FamilyWindow_Request()
{
   fscommand("ToGame_FamilyWindow_Request");
}
function ToGame_FamilyWindow_NameEdit()
{
   fscommand("ToGame_FamilyWindow_NameEdit");
}
function ToGame_FamilyWindow_AppellationEdit(_idx)
{
   getURL("FSCommand:ToGame_FamilyWindow_AppellationEdit",_idx);
}
function ToGame_FamilyWindow_RequestSort(_num)
{
   getURL("FSCommand:ToGame_FamilyWindow_RequestSort",_num);
}
function ToGame_FamilyWindow_CloseUI()
{
   fscommand("ToGame_FamilyWindow_CloseUI");
}
function listReset(_lineMc)
{
   var _loc1_ = _lineMc;
   for(var _loc2_ in _loc1_)
   {
      if(typeof _loc1_[_loc2_] == "movieclip")
      {
         _loc1_[_loc2_].removeMovieClip();
      }
   }
}
var UI = this;
UI._visible = false;
var UIname = "FamilyWindow";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var ListTotal = 0;
var FamilyMaster = false;
var CustomScaleEvent;
var x_btn = new lib.util.TxtBtn(container_mc.xBtn);
x_btn.setRelease(ToGame_FamilyWindow_CloseUI);
var t_btn = (lib.util.TxtBtn)container_mc.txtBtn0.txtBtn;
t_btn.setRelease(ToGame_FamilyWindow_Request);
var c_btn = (lib.util.TxtBtn)container_mc.txtBtn1.txtBtn;
c_btn.setRelease(ToGame_FamilyWindow_NameEdit);
var listMcY = container_mc.listMc._y;
var scrollbarMc = container_mc.scrollbar;
scrollbarMc.addListener(container_mc.listMc);
container_mc.listMc.onScroll = function()
{
   container_mc.listMc._y = listMcY - arguments[0];
};
scrollbarMc.setWheel(container_mc.listMc);
scrollbarMc.wheelDelta = 1;
scrollbarMc.pageSize = 0;
scrollbarMc.displaySize = container_mc.maskMc._height;
scrollbarMc.defaultBarSizeRatio = 0.3333333333333333;
scrollbarMc.rowHeight = 30;
scrollbarMc.scroll = 0;
myListener.OnGameEventShowWindow = function(_WindowName, _bShow)
{
   if(_WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = _bShow;
      if(_global.gbUIMode && bWindowOpen)
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
      CustomScaleEvent.CustomScaleEventRemoveCheck();
   }
};
myListener.OnGameEventChangeUIMode = function(_bShow)
{
   if(_global.gbUIMode && bWindowOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
myListener.OnGame_FamilyWindow_SetFamilyMaster = function(_bool)
{
   FamilyMaster = Boolean(Number(_bool));
   container_mc.txtBtn1._visible = FamilyMaster;
};
myListener.OnGame_FamilyWindow_SetInfo = function(_txt0, _txt1)
{
   container_mc.familyName.htmlText = _txt0;
   container_mc.masterName.htmlText = _txt1;
   container_mc.txtBtn1._x = 200 + container_mc.familyName.textWidth;
};
myListener.OnGame_FamilyWindow_SetList = function(_dataList)
{
   listReset(container_mc.listMc);
   scrollbarMc.pageSize = 0;
   scrollbarMc.scroll = 0;
   var _loc7_ = lib.util.ExtString.split(_dataList,"\n");
   ListTotal = _loc7_.length;
   var _loc6_ = 0;
   var _loc5_ = 0;
   while(_loc5_ < ListTotal)
   {
      var _loc3_ = lib.util.ExtString.split(_loc7_[_loc5_],"\t");
      var _loc2_ = container_mc.listMc.attachMovie("line","line_" + _loc5_,container_mc.listMc.getNextHighestDepth());
      _loc2_._y = _loc6_;
      _loc6_ = _loc6_ + 35;
      _loc2_.txt0.setText(_loc3_[0]);
      _loc2_.txt1.setText(_loc3_[1]);
      _loc2_.txt2.setText(_loc3_[2]);
      _loc2_.txt3.setText(_loc3_[3]);
      var _loc4_ = "";
      if(_loc3_[5] == 1)
      {
         _loc4_ = lib.info.TextColor.LIST_GUILD_MEMBER_OFFLINE;
      }
      else
      {
         _loc4_ = lib.info.TextColor.LIST_GUILD_MEMBER_ONLINE;
      }
      _loc2_.txt0.textColor = _loc4_;
      _loc2_.txt1.textColor = _loc4_;
      _loc2_.txt2.textColor = _loc4_;
      _loc2_.txt3.textColor = _loc4_;
      _loc2_.txt4.textColor = _loc4_;
      if(_loc3_[4] != undefined)
      {
         _loc2_.txt4.setText(_loc3_[4]);
      }
      else
      {
         _loc2_.txt4.text = "";
      }
      _loc2_.idx = _loc5_;
      lib.util.InteractionGroup.addInteraction(UIname,_loc3_[0],_loc2_.hit_mc);
      _loc2_.btn._visible = FamilyMaster;
      _loc2_.btn.onRollOver = function()
      {
         this.gotoAndStop(2);
      };
      _loc2_.btn.onRollOut = _loc2_.btn.onReleaseOutside = function()
      {
         this.gotoAndStop(1);
      };
      _loc2_.btn.onPress = function()
      {
         this.gotoAndStop(3);
      };
      _loc2_.btn.onRelease = function()
      {
         this.gotoAndStop(2);
         ToGame_FamilyWindow_AppellationEdit(this._parent.idx);
      };
      _loc5_ = _loc5_ + 1;
   }
   scrollbarMc.pageSize = container_mc.listMc._height;
};
container_mc.sortBtn.onSelected = function(_index)
{
   ToGame_FamilyWindow_RequestSort(_index);
};
ToGame_FamilyWindow_Init();
