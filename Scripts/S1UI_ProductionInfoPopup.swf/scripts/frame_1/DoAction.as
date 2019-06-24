function ProductionInfoPopUp_init()
{
   UI.onEnterFrame = function()
   {
      delete this.onEnterFrame;
      var _loc5_ = this._width;
      var _loc4_ = _root.GetLoadedUI("productionlist");
      var _loc3_ = _loc4_._x + _loc4_._width;
      var _loc6_ = _loc3_ + _loc5_;
      if(Stage.width > _loc6_)
      {
         this._x = _loc3_;
      }
      else
      {
         _loc3_ = _loc4_._x - _loc5_;
         if(_loc3_ > 0)
         {
            this._x = _loc3_;
         }
      }
      this._y = _loc4_._y;
   };
}
function ToGame_ProductionInfoPopUp_Init()
{
   ProductionInfoPopUp_init();
   fscommand("ToGame_ProductionInfoPopUp_Init");
}
function ToGame_ProductionInfoPopUp_CloseUI()
{
   fscommand("ToGame_ProductionInfoPopUp_CloseUI");
}
function ToGame_ProductionInfoPopUp_Cancel()
{
   fscommand("ToGame_ProductionInfoPopUp_Cancel");
}
function clearBox(_tgMc)
{
   for(str in _tgMc)
   {
      var _loc1_ = _tgMc[str];
      _loc1_.removeMovieClip();
   }
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "ProductionInfoPopUp";
container_mc.UIDrager.setData(UIName,UI);
container_mc.titleTxt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var x_btn = new lib.util.TxtBtn(container_mc.xBtn);
x_btn.setRelease(ToGame_ProductionInfoPopUp_CloseUI);
var cancel_btn = new lib.util.TxtBtn(container_mc.bgBtm.cancelBtn.btn,container_mc.bgBtm.cancelBtn.txt);
cancel_btn.setTextColor("0xD7D7D7","0xFFFFFF","0xFFFFFF","0x485460");
cancel_btn.setRelease(ToGame_ProductionInfoPopUp_Cancel);
var gageWid = 278;
var gradeType = ["$153041","$153042","$153043"];
var GRADE_POINT_STR = lib.util.UIString.getUIString("$153035");
var TOTAL_POINT_STR = lib.util.UIString.getUIString("$153039");
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
myListener.OnGame_ProductionInfoPopUp_SetTitle = function(_str)
{
   container_mc.titleTxt.text = _str;
};
myListener.OnGame_ProductionInfoPopUp_SetPoint = function(_grade, _current, _max)
{
   _grade = Number(_grade);
   container_mc.pointTxt.htmlText = GRADE_POINT_STR + " (<font color=\'#fdca00\'>" + _current + "</font>/<font color=\'#0086ff\'>" + _max + "</font>)";
   var _loc1_ = _current / _max;
   container_mc.gageTxt.text = int(_loc1_ * 100) + "%";
   container_mc.gageMc._width = _loc1_ * gageWid;
   if(_grade > 0)
   {
      container_mc.gradeMaster._visible = true;
      container_mc.gradeNext.textColor = "0xfdca00";
      container_mc.gradeCurrent.text = lib.util.UIString.getUIString(gradeType[1]);
      container_mc.gradeNext.text = lib.util.UIString.getUIString(gradeType[2]);
   }
   else
   {
      container_mc.gradeMaster._visible = false;
      container_mc.gradeNext.textColor = "0xffffff";
      container_mc.gradeCurrent.text = lib.util.UIString.getUIString(gradeType[0]);
      container_mc.gradeNext.text = lib.util.UIString.getUIString(gradeType[1]);
   }
};
myListener.OnGame_ProductionInfoPopUp_SetList = function(_data)
{
   var _loc8_ = lib.util.ExtString.split(_data,"\n");
   var _loc7_ = _loc8_.length;
   var _loc9_ = 0;
   var _loc6_ = 3;
   clearBox(container_mc.listBox);
   var _loc2_ = 0;
   while(_loc2_ < _loc7_)
   {
      var _loc3_ = lib.util.ExtString.split(_loc8_[_loc2_],"\t");
      var _loc4_ = _loc3_[2];
      var _loc5_ = _loc3_[3];
      var _loc1_ = container_mc.listBox.attachMovie("lineMc","lineMc" + _loc2_,_loc2_);
      _loc1_._y = _loc6_;
      _loc6_ = _loc6_ + 27;
      _loc1_.txt0.textAutoSize = "shrink";
      _loc1_.txt0.htmlText = _loc3_[0];
      _loc1_.txt1.htmlText = _loc3_[1];
      if(_loc4_ == _loc5_)
      {
         _loc1_.txt2.htmlText = "<font color=\'#0086ff\'>" + _loc4_ + "</font>" + " / <font color=\'#fdca00\'>" + _loc5_ + "</font>";
      }
      else
      {
         _loc1_.txt2.htmlText = "<font color=\'#fdca00\'>" + _loc4_ + "</font>" + " / <font color=\'#fdca00\'>" + _loc5_ + "</font>";
      }
      _loc9_ = _loc9_ + Number(_loc4_);
      _loc2_ = _loc2_ + 1;
   }
   var _loc10_ = container_mc.bgMid3.tipTxt.textHeight;
   container_mc.bgMid3.tipTxt._height = _loc10_ + 5;
   container_mc.bgMid3.bg._height = _loc10_ + 20;
   container_mc.bgMid2.totalTxt.htmlText = TOTAL_POINT_STR + " <font color=\'#fdca00\'>" + _loc9_ + "</font>";
   var _loc11_ = 16;
   if(_loc7_ > 4)
   {
      _loc11_ = 16 + (_loc7_ - 4) * 27;
   }
   container_mc.bgMid._height = _loc11_;
   container_mc.bgMid2._y = container_mc.bgMid._y + _loc11_ - 1;
   container_mc.bgMid3._y = container_mc.bgMid2._y + 40;
   container_mc.bgBtm._y = container_mc.bgMid3._y + _loc10_ + 18;
   hit._height = container_mc._height;
};
container_mc.gageMc._width = 0.1;
container_mc.gradeMaster._visible = false;
ToGame_ProductionInfoPopUp_Init();
