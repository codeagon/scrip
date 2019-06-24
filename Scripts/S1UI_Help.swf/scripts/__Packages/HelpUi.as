class HelpUi extends MovieClip
{
   static var before_addSave = "";
   static var getScrollY_init = false;
   static var listType = "";
   static var bWindowOpen = false;
   static var MenuOpen = false;
   function HelpUi()
   {
      super();
      _global.gfxExtensions = true;
      HelpUi.scope = _root;
      HelpUi._scope = this;
      HelpUi._scope._parent.myListener = new Object();
      HelpUi._scope._parent.UIname = "Help";
      this._focusrect = false;
      HelpUi._scope._parent._visible = false;
      _global.EventBroadCaster.addListener(HelpUi._scope._parent.myListener);
      HelpUi._scope._parent.myListener.OnGame_Help_Add = function(data1, data2, data3)
      {
         if(HelpUi._scope.List1DepthName.length > 0)
         {
            var _loc1_ = 0;
            while(_loc1_ < HelpUi._scope.List1DepthName.length)
            {
               if(HelpUi._scope.List1DepthName[_loc1_] == data1)
               {
                  HelpUi._scope.depth2List2.addData(_loc1_,data1,data3,data2);
                  AbstractData.ListBtnDataInput(data1,data2,data3);
                  break;
               }
               if(HelpUi._scope.List1DepthName[_loc1_] != data1)
               {
                  HelpUi._scope.List1DepthName.push(data1);
               }
               _loc1_ = _loc1_ + 1;
            }
         }
         else
         {
            HelpUi._scope.List1DepthName.push(data1);
            HelpUi._scope.depth2List2.addData(0,data1,data3,data2);
            AbstractData.ListBtnDataInput(data1,data2,data3);
         }
         HelpUi._scope.ListScrollBar();
         HelpUi._scope.ListScrollBar_w();
      };
      HelpUi._scope._parent.myListener.OnGame_Help_SetData = function(types1, id, nextbtnbool, prevbtnbool, texts, addargs)
      {
         AbstractData.ListDataInput(types1,id,nextbtnbool,prevbtnbool,texts,addargs);
         HelpUi._scope.depth2List2.menuselect(id);
         if(!HelpUi.getScrollY_init)
         {
            HelpUi.getScrollY_init = true;
            var _loc3_ = HelpUi._scope.depth2List2.selectedMc.getBounds(HelpUi._scope.depth2List2);
            HelpUi._scope.ListScrollbar.setScrollPosition(Math.floor(_loc3_.yMin) - 60);
         }
         HelpUi._scope.TextBtnAction(prevbtnbool,nextbtnbool);
         HelpUi._scope.OutputMc.txt.htmlText = texts;
         if(addargs !== HelpUi.before_addSave)
         {
            HelpUi.before_addSave = addargs;
            AbstractOutput.AbstractOutputData(HelpUi._scope,types1,addargs,HelpUi.MenuOpen);
         }
         HelpUi.listType = types1;
         HelpUi._scope.TextScrollBar();
         if(HelpUi.MenuOpen == true)
         {
            HelpUi.MenuOpen = false;
         }
      };
      HelpUi._scope._parent.myListener.OnGame_Help_SetFocus = function(idData)
      {
         if(idData == undefined || idData == "")
         {
            HelpUi._scope.depth2List2.setFocusOff();
         }
         else
         {
            HelpUi._scope.depth2List2.setFocusOn(idData);
            var _loc2_ = HelpUi._scope.depth2List2.getSubMc(idData);
            if(_loc2_)
            {
               var _loc3_ = undefined;
               _loc3_ = HelpUi._scope.ListScrollbar;
               _loc3_.setScrollPosition(_loc2_._y);
            }
         }
      };
      HelpUi._scope._parent.myListener.OnGameEventShowWindow = function(WindowName, bShow)
      {
         if(WindowName.toLowerCase() == HelpUi._scope._parent.UIname.toLowerCase())
         {
            HelpUi.bWindowOpen = bShow;
            var _loc1_ = new lib.controls.CustomScaleEvent();
            _loc1_.CustomScaleEventCheck(HelpUi._scope._parent,HelpUi._scope._parent.UIname);
            HelpUi._scope._parent.scaleExpander.scaleExpanderEventCheck(HelpUi._scope._parent,HelpUi._scope._parent.UIname);
            HelpUi._scope._parent._visible = bShow;
         }
      };
      HelpUi._scope.ListEnabled = function()
      {
         var _loc1_ = 0;
         while(_loc1_ <= HelpUi._scope.depth2List2.parentLength)
         {
            HelpUi._scope.depth2List2.selectParentDepth2(_loc1_,false);
            _loc1_ = _loc1_ + 1;
         }
         HelpUi._scope.ListScrollCheck(HelpUi._scope.depth2List2.listHeight);
      };
      HelpUi._scope.ListScrollCheck = function(ListScrollBar)
      {
         HelpUi._scope.ListScrollBar(ListScrollBar);
         HelpUi._scope.ListScrollBar_w();
      };
      HelpUi._scope.TextScrollCheck = function()
      {
         HelpUi._scope.TextScrollBar();
      };
      HelpUi._scope.Temp_SetData = function(id)
      {
         if(id == "101")
         {
            HelpUi._scope._parent.myListener.OnGame_Help_SetData("1",id,false,true,"동영상 조건 테스트","help_101");
         }
         else if(id == "103")
         {
            HelpUi._scope._parent.myListener.OnGame_Help_SetData("2",id,true,false,"이미지 조건 테스트","test");
         }
         else if(id == "104")
         {
            HelpUi._scope._parent.myListener.OnGame_Help_SetData("3",id,true,true,"텍스트 조건 테스트","Null");
         }
      };
      HelpUi._scope.Temp_SetData2 = function(id)
      {
         HelpUi.MenuOpen = id;
      };
   }
   function onLoad()
   {
      this.Monitor();
      this.configUI();
      this.Init();
   }
   function configUI()
   {
      HelpUi._scope.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
      HelpUi._scope.UIDrager.setData(HelpUi._scope._parent.UIname,HelpUi._scope._parent,HelpUi._scope.lock_mc);
   }
   function Monitor()
   {
   }
   function Init()
   {
      HelpUi.before_addSave = "";
      HelpUi.listType = "0";
      HelpUi.getScrollY_init = false;
      HelpUi._scope.List1DepthName = new Array();
      AbstractData.ListBtnData = new Array();
      HelpUi._scope.TextBtnAction(false,false);
      HelpUi._scope.TextScrollBar();
      HelpUi._scope.CloseBtnAction();
      lib.externals.ExternalManager5.Fscommand("ToGame_Help_Init");
   }
   function TextBtnAction(prevbool, nextbool)
   {
      var _loc1_ = HelpUi._scope.PrevBtn.txtBtn;
      _loc1_.setEnabled(prevbool);
      var _loc2_ = HelpUi._scope.NextBtn.txtBtn;
      _loc2_.setEnabled(nextbool);
      HelpUi._scope.PrevBtn.btn.onPress2 = function()
      {
      };
      HelpUi._scope.PrevBtn.btn.onRelease2 = function()
      {
         HelpUi._scope.Temp_SetData2(true);
         lib.externals.ExternalManager5.Fscommand("ToGame_Help_PrevBtn");
      };
      HelpUi._scope.NextBtn.btn.onPress2 = function()
      {
      };
      HelpUi._scope.NextBtn.btn.onRelease2 = function()
      {
         HelpUi._scope.Temp_SetData2(true);
         lib.externals.ExternalManager5.Fscommand("ToGame_Help_NextBtn");
      };
   }
   function ListScrollBar(listHeight)
   {
      var _loc2_ = undefined;
      var _loc6_ = 0;
      var _loc5_ = 30;
      var _loc4_ = HelpUi._scope.ListMask._height;
      _loc2_ = HelpUi._scope.ListScrollbar;
      var _loc3_ = {};
      _loc2_.addListener(_loc3_);
      _loc3_.onScroll = function()
      {
         HelpUi._scope.depth2List2._y = 55 - arguments[0];
      };
      _loc2_.setWheel(HelpUi._scope.depth2List2);
      if(listHeight == undefined)
      {
         _loc2_.__set__pageSize(290 + HelpUi._scope.OutputMc.txt.textHeight);
      }
      else
      {
         _loc2_.__set__pageSize(listHeight);
      }
      _loc2_.__set__displaySize(_loc4_);
      _loc2_.__set__rowHeight(_loc5_ + _loc6_);
      _loc2_.__set__scroll(0);
      var _loc7_ = 0;
      var _loc10_ = 30;
      var _loc8_ = 340;
   }
   function ListScrollBar_W()
   {
      var _loc2_ = undefined;
      var _loc4_ = 0;
      var _loc6_ = 10;
      var _loc5_ = HelpUi._scope.depth2List2._width;
      _loc2_ = HelpUi._scope.scrollbar_w;
      _loc2_._width = 184;
      var _loc3_ = {};
      var _loc7_ = {};
      var _loc8_ = {};
      _loc2_.addListener(_loc3_);
      _loc3_.onScroll = function()
      {
         HelpUi._scope.depth2List2._x = - arguments[0];
      };
      _loc2_.__set__pageSize(0);
      _loc2_.__set__displaySize(_loc5_);
      _loc2_.__set__rowHeight(_loc6_ + _loc4_);
      _loc2_.__set__scroll(0);
   }
   function TextScrollBar()
   {
      var _loc2_ = undefined;
      var _loc8_ = 0;
      var _loc6_ = 0;
      var _loc4_ = HelpUi._scope.ListMask2._height + 5;
      _loc2_ = HelpUi._scope.ListScrollbar2;
      var _loc3_ = {};
      _loc2_.addListener(_loc3_);
      _loc3_.onScroll = function()
      {
         HelpUi._scope.OutputMc._y = 50 - arguments[0];
      };
      _loc2_.setWheel(HelpUi._scope.OutputMc);
      if(HelpUi.listType == "3")
      {
         HelpUi._scope.OutputMc.txt._height = HelpUi._scope.OutputMc.txt.textHeight + 20;
         _loc2_.__set__pageSize(HelpUi._scope.OutputMc.txt.textHeight + 20);
      }
      else
      {
         _loc2_.__set__pageSize(290 + HelpUi._scope.OutputMc.txt.textHeight);
      }
      _loc2_.__set__displaySize(_loc4_);
      _loc2_.__set__rowHeight(10);
      _loc2_.__set__scroll(0);
      var _loc5_ = 0;
      var _loc7_ = 0;
   }
   function CloseBtnAction()
   {
      function ToGame_Help_CloseUI()
      {
         lib.externals.ExternalManager5.Fscommand("ToGame_Help_CloseUI");
      }
      var _loc1_ = new lib.util.TxtBtn(HelpUi._scope.x_mc);
      _loc1_.setRelease(ToGame_Help_CloseUI);
   }
   function OnGame_Help_Adds(data1, data2, data3)
   {
   }
   function OnGame_Help_SetDatas(types1, id, nextbtnbool, prevbtnbool, texts, addargs)
   {
   }
}
