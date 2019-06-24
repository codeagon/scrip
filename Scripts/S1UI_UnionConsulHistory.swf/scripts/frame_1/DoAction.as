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
_global.gfxExtensions = true;
var UI = this;
UI._visible = false;
var UIname = "UnionConsulHistory";
this.bWindowOpen = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var LIST_TOTAL = 0;
var LINE_HEIGHT = 60;
var TXT_Y = 7;
var STR_0 = lib.util.UIString.getUIString("$471081");
var STR_1 = lib.util.UIString.getUIString("$471082");
var STR_2 = lib.util.UIString.getUIString("$471083");
var STR_3 = lib.util.UIString.getUIString("$471084");
var check_Btn = container_mc.checkBtn.txtBtn;
check_Btn.setRelease(function()
{
   myListener.ToGame_UnionConsulHistory_CloseUI();
}
);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(function()
{
   myListener.ToGame_UnionConsulHistory_CloseUI();
}
);
myListener.OnGameEventShowWindow = function(WindowName, bShow)
{
   if(WindowName.toLowerCase() == UIname.toLowerCase())
   {
      bWindowOpen = bShow;
      if(_global.gbUIMode && bWindowOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
         lib.util.InteractionGroup.delInteraction(UIname);
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
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
myListener.OnGame_UnionConsulHistory_SetList = function(_data, _currentpage, _totalpage)
{
   var _loc4_ = container_mc.listMc;
   listReset(_loc4_);
   var _loc6_ = lib.util.ExtString.split(_data,"\n");
   LIST_TOTAL = _loc6_.length;
   var _loc2_ = 0;
   while(_loc2_ < LIST_TOTAL)
   {
      var _loc3_ = lib.util.ExtString.split(_loc6_[_loc2_],"\t");
      var _loc1_ = _loc4_.attachMovie("line","line" + _loc2_,_loc4_.getNextHighestDepth());
      _loc1_.txt0.text = _loc3_[0];
      _loc1_.txt1.setText(_loc3_[2]);
      _loc1_.txt2.setText(_loc3_[3]);
      var _loc5_ = new src.union.S1Icon(_loc1_.iconMc,_loc3_[1],"icon_" + _loc2_,0,0,32,32);
      _loc1_._y = LINE_HEIGHT * _loc2_;
      lib.util.InteractionGroup.addInteraction(UIname,_loc3_[3],_loc1_.txt2);
      _loc2_ = _loc2_ + 1;
   }
   container_mc.numberSteper.setPage(Number(_currentpage),Number(_totalpage));
};
myListener.ToGame_UnionConsulHistory_SetPage = function(_page)
{
   getURL("FSCommand:ToGame_UnionConsulHistory_SetPage",_page);
};
myListener.ToGame_UnionConsulHistory_CloseUI = function()
{
   fscommand("ToGame_UnionConsulHistory_CloseUI");
};
container_mc.numberSteper.onChanged = function(changed)
{
   myListener.ToGame_UnionConsulHistory_SetPage(changed);
};
fscommand("ToGame_UnionConsulHistory_Init");
