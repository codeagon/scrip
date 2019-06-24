function buildList(teamListData)
{
   lib.Debuger.trace("buildList");
   lib.Debuger.trace("teamListData : " + teamListData);
   listReset();
   var _loc6_ = teamListData.length;
   lib.Debuger.trace("listL : " + _loc6_);
   if(_loc6_ == 1)
   {
      _loc6_ = 2;
   }
   lib.Debuger.trace("listL : " + _loc6_);
   var _loc3_ = 0;
   while(_loc3_ < _loc6_)
   {
      var _loc2_ = teamListData[_loc3_];
      var lineMc;
      lineMc = container_mc.teamListMc.attachMovie("line0","line" + _loc3_,container_mc.teamListMc.getNextHighestDepth());
      lineMc._y = (lineH + 20) * _loc3_;
      lineMc.GuildMc1.btn._visible = false;
      lineMc.GuildMc2.btn._visible = false;
      teamListData[_loc3_] = _loc2_;
      var _btn1;
      var _loc7_ = undefined;
      lineMc.index = _loc3_;
      lineMc.index0 = _loc2_[0];
      lineMc.index1 = _loc2_[1];
      lineMc.index2 = _loc2_[2];
      lineMc.index3 = _loc2_[3];
      lineMc.index4 = _loc2_[4];
      lineMc.index5 = _loc2_[5];
      lineMc.index6 = _loc2_[6];
      lineMc.index7 = _loc2_[7];
      lineMc.index8 = _loc2_[8];
      lineMc.index9 = _loc2_[9];
      var str3 = lib.util.UIString.getUIString("$128003");
      lineMc.GuildMc1.btn1.onEnterFrame = function()
      {
         if(lineMc.GuildMc1.btn1 != undefined)
         {
            this.onEnterFrame = null;
            _btn1 = this.txtBtn;
            if(this._parent._parent.index4 == "0")
            {
               _btn1.setEnabled(false);
            }
            var _data = this._parent._parent.index0;
            lib.Debuger.trace("this : " + this);
            lib.util.DrawBitmap.draw(this._parent.IconMc,this._parent._parent.index1,50,50);
            if(this._parent._parent.index2 != undefined)
            {
               if(this._parent._parent.index4 == "0")
               {
                  var _loc2_ = lib.util.UIString.getUIString("$128004","guilddata1",this._parent._parent.index2);
                  lib.manager.ToolTip.add(this._parent.iconmcs,_loc2_,1);
                  this._parent.imgmcs.gotoAndStop(1);
                  this._parent.iconmcs.gotoAndStop(1);
               }
               else if(this._parent._parent.index4 == "1")
               {
                  _loc2_ = lib.util.UIString.getUIString("$128005","guilddata2",this._parent._parent.index2);
                  lib.manager.ToolTip.add(this._parent.iconmcs,_loc2_,1);
                  this._parent.imgmcs.gotoAndStop(1);
                  this._parent.iconmcs.gotoAndStop(2);
               }
            }
            else
            {
               this._parent.imgmcs.gotoAndStop(2);
               this._parent.iconmcs.gotoAndStop(3);
            }
            this._parent.txt0.setText(this._parent._parent.index2);
            if(this._parent.txt0.text == "undefined")
            {
               this._parent.txt0.text = "";
               this._parent.mcs._alpha = 30;
               _btn1.setEnabled(false);
            }
            else
            {
               this._parent.effect.gotoAndPlay(2);
            }
            this._parent.txt1.text = str3 + this._parent._parent.index3;
            if(this._parent._parent.index3 == undefined)
            {
               this._parent.txt1.text = "";
            }
            _btn1.setRelease(function()
            {
               btns1func(_data);
            }
            );
         }
      };
      lineMc.GuildMc2.btn1.onEnterFrame = function()
      {
         if(lineMc.GuildMc2.btn1 != undefined)
         {
            this.onEnterFrame = null;
            _btn1 = this.txtBtn;
            if(this._parent._parent.index9 == "0")
            {
               _btn1.setEnabled(false);
            }
            var _data = this._parent._parent.index5;
            lib.util.DrawBitmap.draw(this._parent.IconMc,this._parent._parent.index6,50,50);
            if(this._parent._parent.index7 != undefined)
            {
               if(this._parent._parent.index9 == "0")
               {
                  var _loc2_ = lib.util.UIString.getUIString("$128004","guilddata1",this._parent._parent.index7);
                  lib.manager.ToolTip.add(this._parent.iconmcs,_loc2_,1);
                  this._parent.imgmcs.gotoAndStop(1);
                  this._parent.iconmcs.gotoAndStop(1);
               }
               else if(this._parent._parent.index9 == "1")
               {
                  _loc2_ = lib.util.UIString.getUIString("$128005","guilddata2",this._parent._parent.index7);
                  lib.manager.ToolTip.add(this._parent.iconmcs,_loc2_,1);
                  this._parent.imgmcs.gotoAndStop(1);
                  this._parent.iconmcs.gotoAndStop(2);
               }
            }
            else
            {
               this._parent.imgmcs.gotoAndStop(2);
               this._parent.iconmcs.gotoAndStop(3);
            }
            this._parent.txt0.setText(this._parent._parent.index7);
            if(this._parent.txt0.text == "undefined")
            {
               this._parent.txt0.text = "";
               this._parent.mcs._alpha = 30;
               _btn1.setEnabled(false);
            }
            else
            {
               this._parent.effect.gotoAndPlay(2);
            }
            this._parent.txt1.text = str3 + this._parent._parent.index8;
            if(this._parent._parent.index8 == undefined)
            {
               this._parent.txt1.text = "";
            }
            _btn1.setRelease(function()
            {
               btns1func(_data);
            }
            );
         }
      };
      _loc3_ = _loc3_ + 1;
   }
}
function listReset()
{
   var _loc1_ = container_mc.teamListMc;
   for(var _loc2_ in _loc1_)
   {
      if(typeof _loc1_[_loc2_] == "movieclip")
      {
         _loc1_[_loc2_].removeMovieClip();
      }
   }
}
function ListScrollBar(bool)
{
   lib.Debuger.trace("ListScrollBar");
   var _loc2_ = undefined;
   var _loc6_ = 0;
   var _loc5_ = 165;
   var _loc4_ = undefined;
   _loc4_ = container_mc.ListMask._height;
   _loc2_ = container_mc.moviescroll1;
   var _loc3_ = {};
   _loc2_.addListener(_loc3_);
   _loc3_.onScroll = function()
   {
      container_mc.teamListMc._y = 233.4 - arguments[0];
   };
   _loc2_.setWheel(container_mc.teamListMc);
   if(listHeight == undefined)
   {
      _loc2_.__set__pageSize(container_mc.teamListMc._height);
   }
   else
   {
      _loc2_.__set__pageSize(listHeight);
   }
   _loc2_.__set__displaySize(_loc4_);
   _loc2_.__set__rowHeight(_loc5_ + _loc6_);
   _loc2_.__set__scroll(0);
   var _loc7_ = 0;
   var _loc9_ = 165;
   var _loc8_ = 345;
}
function ToGame_GuildWarClose_Init()
{
   lib.Debuger.trace("ToGame_GuildWarClose_Init");
   fscommand("ToGame_GuildWarClose_Init");
}
function ToGame_GuildWarClose_CloseUI()
{
   lib.Debuger.trace("ToGame_GuildWarClose_CloseUI");
   fscommand("ToGame_GuildWarClose_CloseUI");
}
function ToGame_GuildWarClose_WarEnd(index)
{
   lib.Debuger.trace("ToGame_GuildWarClose_WarEnd : " + index);
   getURL("FSCommand:ToGame_GuildWarClose_WarEnd",index);
}
function ToGame_GuildWarClose_SetList(index)
{
   lib.Debuger.trace("ToGame_GuildWarClose_SetList : " + index);
   getURL("FSCommand:ToGame_GuildWarClose_SetList",index);
}
function btns1func(index)
{
   lib.Debuger.trace("btns1func");
   ToGame_GuildWarClose_WarEnd(index);
}
function btns2func(index)
{
   lib.Debuger.trace("btns2func");
   ToGame_GuildWarClose_WarEnd(index);
}
function testbtn1func()
{
   myListener.OnGame_GuildWarClose_OwnSetData("Icon_1_TEX\t내꺼");
}
function testbtn2func()
{
   myListener.OnGame_GuildWarClose_RelativeSetData("0\tIcon_1_TEX\tzz\t1일1시간1분\t1\t1\tIcon_1_TEX\tzz\t1일1시간1분\t1",1,10);
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "GuildWarClose";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
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
var NameTextLength_Local1 = 0;
var NameTextLength_Local2 = 0;
var str_data0 = lib.util.UIString.getUIString("$128002");
container_mc.txt0.text = "";
container_mc.final_txt.setText(str_data0);
var teamListData = [];
var lineH = 165;
container_mc.ani.gotoAndStop(1);
myListener.OnGame_GuildWarClose_OwnSetData = function(setdata)
{
   lib.Debuger.trace("OnGame_GuildWarClose_OwnSetData");
   lib.Debuger.trace("setdata : " + setdata);
   var _loc1_ = setdata.split("\t");
   lib.util.DrawBitmap.draw(container_mc.IconMc,_loc1_[0],50,50);
   container_mc.txt0.setText(_loc1_[1]);
   if(container_mc.txt0.text == "undefined")
   {
      container_mc.txt0.text = "";
   }
};
myListener.OnGame_GuildWarClose_RelativeSetData = function(teamList, currentPage, totalPage)
{
   lib.Debuger.trace("OnGame_GuildWarClose_RelativeSetData");
   lib.Debuger.trace("teamList : " + teamList);
   lib.Debuger.trace("\n");
   container_mc.scrollbar.scroll = 0;
   container_mc.numberSteper.setPage(Number(currentPage),Number(totalPage));
   container_mc.ani.gotoAndPlay(2);
   teamList = lib.util.ExtString.split(teamList,"\n");
   var _loc7_ = teamList.length;
   teamListData = [];
   var _loc2_ = 0;
   while(_loc2_ < _loc7_)
   {
      teamListData[_loc2_] = [];
      var _loc4_ = lib.util.ExtString.split(teamList[_loc2_],"\t");
      var _loc5_ = _loc4_.length;
      var _loc1_ = 0;
      while(_loc1_ < _loc5_)
      {
         var _loc3_ = _loc4_[_loc1_];
         teamListData[_loc2_].push(_loc3_);
         _loc1_ = _loc1_ + 1;
      }
      _loc2_ = _loc2_ + 1;
   }
   buildList(teamListData);
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_GuildWarClose_CloseUI);
container_mc.numberSteper.onChanged = function(page)
{
   ToGame_GuildWarClose_SetList(page);
};
ToGame_GuildWarClose_Init();
var test_btn1 = testbtn1.txtBtn;
test_btn1.setRelease(function()
{
   testbtn1func();
}
);
var test_btn2 = testbtn2.txtBtn;
test_btn2.setRelease(function()
{
   testbtn2func();
}
);
