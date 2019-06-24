class g4.view.debugger.Debugger
{
   function Debugger(targetMovieClip)
   {
      super();
      _global.gfxExtensions = true;
      this.nameFdTest = targetMovieClip.nameFdTest;
      this.regCost = targetMovieClip.regCost;
      this.testFd = targetMovieClip.testFd;
      this.regCost0 = targetMovieClip.regCost0;
      this.regCost = targetMovieClip.regCost;
      this.btn = targetMovieClip.btn;
      this.testFd = targetMovieClip.testFd;
      this.onGameFd = targetMovieClip.onGameFd;
      this.scrollbar1 = targetMovieClip.scrollbar1;
      this.con = targetMovieClip.con;
      this.stopFd = targetMovieClip.stopFd;
      this.openBtn = targetMovieClip.openBtn;
      this.closeBtn = targetMovieClip.closeBtn;
      this.expFd = targetMovieClip.expFd;
      this.apiFd = targetMovieClip.apiFd;
      this.excuteBtn = targetMovieClip.excuteBtn;
      this.hideBtn = targetMovieClip.hideBtn;
      this.clearBtn = targetMovieClip.clearBtn;
      this.autoBuilder = targetMovieClip.autoBuilder;
      this.combobox = targetMovieClip.combobox;
      this.aaa = targetMovieClip.aaa;
      this.button_game_interface_tester = targetMovieClip.button_game_interface_tester;
      this.text_game_interface_tester = targetMovieClip.text_game_interface_tester;
      this.mc_game_interface_tester = targetMovieClip.mc_game_interface_tester;
      this.button_font = targetMovieClip.button_font;
      this.stopBtn = targetMovieClip.stopBtn;
      this.titleFD = targetMovieClip.titleFD;
      this.dragerMc = targetMovieClip.dragerMc;
      this.isStop = false;
      this.str = this.expFd.text;
      this.exps = this.str.split(";");
      this.count = 0;
      this.tempmaxscroll = this.onGameFd.maxscroll;
      this.copy = "";
      this.bGameInterfaceTesterVisible = false;
      var _loc22_ = new TextFormat();
      _loc22_.tabStops = [15];
      this.onGameFd.setTextFormat(_loc22_);
      var _loc25_ = this.nameFdTest.getTextFormat();
      _loc25_.color = 26112;
      var writing = "<a href=\'asfunction:chatLinkAction,1#####14\'><FONT color=\'#000000\'>&lt;발키온 훈장&gt;</FONT></a> <FONT color=\'#000000\'>[100]</FONT>개, 3,123<img src=\'Gold_smalltoken\' vspace=\'-2\'/><font color=\'#D7D7D7\'>00</font><img src=\'Silver_smalltoken\' vspace=\'-2\'/><font color=\'#C87551\'>00</font><img src=\'Copper_smalltoken\' vspace=\'-2\'/>0";
      writing = "sfdsfdsfsd&nbsp;dsfdsf";
      this.regCost0.htmlText = writing;
      this.btn.onRelease = g4.util.Delegate.create(this,function()
      {
         this.regCost.htmlText = writing;
         var _loc2_ = this.regCost.text;
         this.regCost.setText(writing);
      }
      );
      var _loc12_ = this.testFd.getCharBoundaries(6);
      var _loc20_ = this.testFd.getCharBoundaries(9);
      var _loc13_ = this.con.attachMovie("rec","rec1",10);
      _loc13_._x = _loc12_.x - 1;
      _loc13_._y = _loc12_.y - 4;
      _loc13_._width = _loc20_.x - _loc12_.x + 4;
      this.inputText(1,_loc12_ + "  rect  " + _loc12_.x + "/" + _loc12_.y);
      _loc12_ = this.testFd.getCharBoundaries(10);
      _loc20_ = this.testFd.getCharBoundaries(20);
      _loc13_ = this.con.attachMovie("rec","rec2",11);
      _loc13_._x = _loc12_.x - 1;
      _loc13_._y = _loc12_.y - 4;
      _loc13_._width = _loc20_.x - _loc12_.x + 4;
      this.inputText(1,_loc12_ + "  rect  " + _loc12_.x + "/" + _loc12_.y);
      this.scrollbar1.setTextField(this.onGameFd);
      this.clearBtn.onRelease = g4.util.Delegate.create(this,function()
      {
         this.onGameFd.text = "";
         this.count = 0;
      }
      );
      this.stopBtn.onRelease = g4.util.Delegate.create(this,function()
      {
         this.isStop = !this.isStop;
         if(this.isStop)
         {
            this.stopFd.text = "play";
         }
         else
         {
            this.stopFd.text = "stop";
         }
      }
      );
      var _loc18_ = new Object();
      _global.EventBroadCaster.addListener(_loc18_);
      _loc18_.OnDebuger = g4.util.Delegate.create(this,function(index, _message)
      {
         this.inputText(index,_message);
      }
      );
      this.autoBuilder.onChanged = g4.util.Delegate.create(this,function(str)
      {
         this.autoBuilder.searchResult();
         var _loc8_ = [];
         var _loc9_ = _root.gRegisterUIDataList.length;
         str = str.toUpperCase();
         var _loc3_ = 0;
         while(_loc3_ < _loc9_)
         {
            var _loc7_ = _root.gRegisterUIDataList[_loc3_];
            var _loc4_ = _loc7_.Name;
            var _loc6_ = _loc4_.toUpperCase();
            var _loc5_ = _loc6_.indexOf(str);
            if(_loc5_ == 0)
            {
               _loc8_.push(_loc4_);
            }
            _loc3_ = _loc3_ + 1;
         }
         this.autoBuilder.searchResult(_loc8_);
      }
      );
      this.openBtn.onRelease = g4.util.Delegate.create(this,function()
      {
         var _loc3_ = this.autoBuilder.inputFd.text;
         _loc3_ = lib.util.ExtString.trim(_loc3_);
         _root.OnGameEvent("OnGameEventShowUI",_loc3_,1);
      }
      );
      this.closeBtn.onRelease = g4.util.Delegate.create(this,function()
      {
         var _loc3_ = this.autoBuilder.inputFd.text;
         _loc3_ = lib.util.ExtString.trim(_loc3_);
         _root.OnGameEvent("OnGameEventShowUI",_loc3_,0);
      }
      );
      this.excuteBtn.onRelease = g4.util.Delegate.create(this,function()
      {
         var _loc4_ = this.apiFd.text;
         var _loc3_ = _loc4_.split(" ");
         _root.OnGameEvent(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17]);
      }
      );
      this.expFd.onSetFocus = function()
      {
         _global.inputing = true;
      };
      this.expFd.onKillFocus = function()
      {
         var _loc3_ = this.text;
         this.exps = _loc3_.split(";");
         _global.inputing = false;
      };
      this.apiFd.onSetFocus = function()
      {
         _global.inputing = true;
      };
      this.apiFd.onKillFocus = function()
      {
         _global.inputing = false;
      };
      var isHide = false;
      this.hideBtn.onRelease = g4.util.Delegate.create(this,function($this)
      {
         isHide = !isHide;
         for(var _loc3_ in $this._parent)
         {
            trace($this._parent[_loc3_]);
            if($this._parent[_loc3_] != this.hideBtn && $this._parent[_loc3_] != this.titleFD && $this._parent[_loc3_] != this.dragerMc)
            {
               $this._parent[_loc3_]._visible = !isHide;
            }
         }
         this.isStop = false;
         this.stopBtn.onRelease();
      }
      ,this.hideBtn);
      _loc18_.localTest = g4.util.Delegate.create(this,function()
      {
         var _loc5_ = this.apiFd.text;
         var _loc6_ = _loc5_.split(" ");
         var _loc4_ = _root.GetLoadedUI(arguments[0]);
         if(_loc4_ == undefined)
         {
            this.inputText(1,"[LOCAL_TEST] UI Read Erro!! ");
         }
         this.inputText(1,"[LOCAL_TEST] UI Read  " + _loc4_);
         this.findTextField(_loc4_,arguments[1]);
      }
      );
      var _loc24_ = {};
      _loc24_.onMouseUp = g4.util.Delegate.create(this,function()
      {
         if(Key.isDown(16) && Key.isDown(17))
         {
            var _loc5_ = this.apiFd.text;
            var _loc4_ = _loc5_.split("|");
            var _loc3_ = "";
            if(_loc4_.length > 1)
            {
               _loc3_ = _loc4_[1];
            }
            else if(_loc4_.length == 1)
            {
               _loc3_ = _loc4_[0];
            }
            var _loc2_ = Mouse.getTopMostEntity();
            this.inputText(1,":::::::::getTopMostEntity::::::::::\n  " + _loc2_);
            if(_loc2_ instanceof TextField)
            {
               this.getTextFdInfo(_loc2_,_loc3_);
            }
            else if(_loc2_ instanceof MovieClip)
            {
               while(_loc2_ instanceof MovieClip && _loc2_ != undefined)
               {
                  _loc2_.hitTestDisable = true;
                  _loc2_ = Mouse.getTopMostEntity();
               }
               this.getTextFdInfo(_loc2_,_loc3_);
            }
         }
         else if(Key.isDown(17))
         {
            this.inputText(1,":::::::::copyToClipboard::::::::::\n  ");
         }
      }
      );
      Mouse.addListener(_loc24_);
      this.combobox.__set__data(["KR","JP","USA"]);
      var _loc23_ = {};
      _loc23_.onChanged = g4.util.Delegate.create(this,function(target, id, index)
      {
         if(index == 0)
         {
            this.apiFd.text = "가나다라마바사아자차아타카파하사히러더하나하오너";
         }
         if(index == 1)
         {
            this.apiFd.text = "一二三韓文明化された種族たちの連合体である今日のヴァルキオン連合を創設するなど";
         }
         if(index == 2)
         {
            this.apiFd.text = "dasdkjsadljsadkjslkajdlsajdlksajdklsajdklsajdkslajdlskadjlksajdslkajdklsajdksajd";
         }
      }
      );
      this.combobox.addListener(_loc23_);
      this.excuteBtn.onRelease = g4.util.Delegate.create(this,function()
      {
         this.testFd.text = this.apiFd.text;
         lib.util.ExtString.alignJoint(this.testFd,this.apiFd.text);
      }
      );
      this.aaa.text = "gfdgsdfgdfgdfgdsfgsdf";
      this.button_game_interface_tester.onRelease = g4.util.Delegate.create(this,this.toggleGameInterfaceTesterVisible);
      this.updateByGameInterfaceTesterVisible();
      this.button_font.onRelease = g4.util.Delegate.create(this,this.button_font_onReleaseHandler);
      g4.util.Debug.getInstance().addEventListener(g4.util.Debug.LOG,this,"onDebugLog");
   }
   function button_font_onReleaseHandler()
   {
      this.apiFd.text = "기능 제거됨";
   }
   function onDebugLog(event)
   {
      trace("g4.view.debugger.Debugger.onDebugLog > event : " + event.str);
      this.inputText(1,event.str);
   }
   function toggleGameInterfaceTesterVisible()
   {
      this.bGameInterfaceTesterVisible = !this.bGameInterfaceTesterVisible;
      this.updateByGameInterfaceTesterVisible();
   }
   function updateByGameInterfaceTesterVisible()
   {
      if(this.bGameInterfaceTesterVisible)
      {
         this.text_game_interface_tester.text = "Hide GameInterface Tester";
         this.mc_game_interface_tester._visible = true;
      }
      else
      {
         this.text_game_interface_tester.text = "Show GameInterface Tester";
         this.mc_game_interface_tester._visible = false;
      }
   }
   function findTextField(mc, str)
   {
      for(var _loc3_ in mc)
      {
         if(mc[_loc3_] instanceof MovieClip)
         {
            this.inputText(1,"[LOCAL_TEST] UI find movie  " + mc[_loc3_]);
         }
         else if(mc[_loc3_] instanceof TextField)
         {
            this.inputText(1,"[LOCAL_TEST] UI find textFd  " + mc[_loc3_]);
         }
      }
   }
   function inputText(index, _message)
   {
      if(this.isStop)
      {
         return undefined;
      }
      var _loc2_ = this.exps.length;
      while(_loc2_ > 0)
      {
         var _loc3_ = this.exps[_loc2_ - 1];
         if(_message.indexOf(_loc3_) >= 0)
         {
            return undefined;
         }
         _loc2_ = _loc2_ - 1;
      }
      this.count = this.count + 1;
      if(this.count != 0 && this.count % 1000 == 0)
      {
         this.onGameFd.text = "";
      }
      this.onGameFd.appendText("[" + this.count + "]\t" + _message + "\r");
      if(this.onGameFd.scroll == this.tempmaxscroll)
      {
         this.onGameFd.scroll = this.onGameFd.maxscroll;
      }
      this.tempmaxscroll = this.onGameFd.maxscroll;
   }
   function copyText(txtFd)
   {
      this.copy = "";
      this.inputText(1,":::::::::copyText::::::::::\n  " + txtFd.text);
      if(txtFd.text != "" && txtFd.text != undefined)
      {
         this.copy = txtFd.text;
      }
      return undefined;
   }
   function pasteText(txtFd)
   {
      this.inputText(1,":::::::::pasteText1::::::::::\n  " + this.copy);
      if(this.copy == "" || this.copy == undefined)
      {
         return undefined;
      }
      this.inputText(1,":::::::::pasteText2::::::::::\n  " + this.copy);
      if(txtFd.type == "input")
      {
         txtFd.text = this.copy;
      }
   }
   function getTextFdInfo(tfd, str)
   {
      var _loc2_ = "**********************[FindTextField]************************\n\t" + tfd;
      var _loc4_ = tfd.getTextFormat();
      var _loc5_ = _loc4_.bold;
      var _loc8_ = _loc4_.italic;
      var _loc9_ = _loc4_.font;
      var _loc7_ = tfd.multiline;
      var _loc6_ = _loc4_.size;
      _loc2_ = _loc2_ + ("\n\t[text] " + tfd.text);
      _loc2_ = _loc2_ + ("\n\t[Format]bold:" + _loc5_ + "/italic:" + _loc8_ + "/font:" + _loc9_ + "/multiline:" + _loc7_ + "/size:" + _loc6_);
      if(tfd.isTextCut == true)
      {
         _loc2_ = _loc2_ + "\n\t[TextCut] true";
         tfd.setText(str);
      }
      else
      {
         _loc2_ = _loc2_ + "\n\t[TextCut] false";
         tfd.text = str;
      }
      _loc2_ = _loc2_ + "\n\t***************************************************************";
      this.inputText(1,_loc2_);
   }
}
