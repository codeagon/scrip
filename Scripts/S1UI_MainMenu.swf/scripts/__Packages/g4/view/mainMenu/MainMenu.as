class g4.view.mainMenu.MainMenu extends g4.core.View implements g4.gameInterface.IMainMenu_Renewal
{
   var isTop = false;
   var viewAlways = true;
   function MainMenu($targetMovie)
   {
      super($targetMovie);
   }
   function getUIName()
   {
      return g4.view.ViewID.MAIN_MENU;
   }
   function configUI()
   {
      this.__get__targetMovieClip().container_mc.UIDrager.setData(this.getUIName(),this.__get__targetMovieClip());
      this.__get__targetMovieClip().container_mc.UIDrager.onPress2 = g4.util.Delegate.create(this,this.draggerHandlerPress);
      this.__get__targetMovieClip().container_mc.UIDrager.onRelease2 = g4.util.Delegate.create(this,this.draggerHandlerRelease);
      this.subMenu = this.__get__targetMovieClip().container_mc.subMenu;
      this.menuQuickMatching2 = this.__get__targetMovieClip().container_mc.menuQuickMatching2;
      this.menuQuickMatching2.__set__visible(false);
      this.subMenu.__set__visible(false);
      this.subMenu.addEventListener("ToGame_MainMenu_RequestDisableUI",this,"handlerRequestDisableUI");
      this.subMenu.addEventListener("ToGame_MainMenu_RequestShowUI",this,"handlerRequestShowUI");
      this.subMenu.addEventListener(gfx.events.EventTypes.ITEM_ROLL_OVER,this,"subHandlerOver");
      this.subMenu.addEventListener(gfx.events.EventTypes.ITEM_ROLL_OUT,this,"subHandlerOut");
      this.mBackground = this.__get__targetMovieClip().container_mc.mBackground;
      this.customizeData = lib.gamedata.CustomizedUIDataCollection.getInstance();
      this.customizeData.addEventListener(gfx.events.EventTypes.VALUE_CHANGE,this,"valueHandlerChange");
      this.viewAlways = this.customizeData.valueOf(lib.gamedata.CustomizedUIDataKey.MAINMENU_SHOW_BOOLEAN) == 0;
      this.ToGame_MainMenu_Init();
      if(_global.gfxPlayer)
      {
         this.setViewVisible(true);
         var _loc3_ = "";
         _loc3_ = _loc3_ + "Event\t0\tEvent\t이벤트\tFF\n";
         _loc3_ = _loc3_ + "MyCharacter\t0\tPaperDoll\t내 캐릭터\tS\n";
         _loc3_ = _loc3_ + "Inventory\t0\tInventory\t소지품\tI\n";
         _loc3_ = _loc3_ + "Party\t0\tParty\t파티\tP\n";
         _loc3_ = _loc3_ + "Community\t0\tSocial\t소셜\tU\n";
         _loc3_ = _loc3_ + "QuickMatching\t0\tMatch\t퀵매칭\tO\n";
         _loc3_ = _loc3_ + "store\t0\tShop\t상점\tF\n";
         _loc3_ = _loc3_ + "System\t0\tSystem\t시스템\tS\n";
         this.OnGame_MainMenu_SetMenu(_loc3_);
         var _loc4_ = "";
         _loc4_ = _loc4_ + "TimeEvent\tPC방 누적시간 이벤트\t\t\n";
         _loc4_ = _loc4_ + "AttendEvent\t누적 출석 이벤트\t\t\n";
         _loc4_ = _loc4_ + "OXEvent\tOX 퀴즈 이벤트\t\t\n";
         _loc4_ = _loc4_ + "CharEvent\t캐릭터 이벤트\t\t\n";
         _loc4_ = _loc4_ + "Schedule\t이벤트 일정\t\t\n";
         _loc4_ = _loc4_ + "Returner\t복귀자 이벤트\t\t\n";
         this.OnGame_MainMenu_SetSubMenu("Event",_loc4_);
         _loc4_ = "";
         _loc4_ = _loc4_ + "CharInfo\t캐릭터 정보\tP\t\n";
         _loc4_ = _loc4_ + "Skill\t스킬\tK\t\n";
         _loc4_ = _loc4_ + "QuestJournal\t퀘스트 일지\tL\t\n";
         _loc4_ = _loc4_ + "Craft\t제작\tJ\t\n";
         _loc4_ = _loc4_ + "Achievement\t업적\tV\t\n";
         _loc4_ = _loc4_ + "Account\t계정 상태\t\t\n";
         this.OnGame_MainMenu_SetSubMenu("MyCharacter",_loc4_);
         _loc4_ = "";
         _loc4_ = _loc4_ + "LFG\t파티 찾기\tY\t\n";
         _loc4_ = _loc4_ + "AttackGroup\t공격대\tB\t\n";
         _loc4_ = _loc4_ + "Duel\t그룹결투\t\t\n";
         _loc4_ = _loc4_ + "Guild\t길드\tG\t\n";
         _loc4_ = _loc4_ + "GuildInfo\t길드 현황\t\t\n";
         this.OnGame_MainMenu_SetSubMenu("Party",_loc4_);
         _loc4_ = "";
         _loc4_ = _loc4_ + "Friend\t친구\tU\t\n";
         _loc4_ = _loc4_ + "Mail\t우편\t\t\n";
         _loc4_ = _loc4_ + "LeaderBoard\t리더보드\t\t\n";
         _loc4_ = _loc4_ + "Motion\t소셜모션\t\t\n";
         _loc4_ = _loc4_ + "TradeInfo\t교환기록\t\t\n";
         this.OnGame_MainMenu_SetSubMenu("Community",_loc4_);
         _loc4_ = "";
         _loc4_ = _loc4_ + "Order\t발키온 연합 지령서\tH\t\n";
         _loc4_ = _loc4_ + "DungeonMatch\t던전 매칭\t\t\n";
         _loc4_ = _loc4_ + "BFMatch\t전장 매칭\t\t\n";
         this.OnGame_MainMenu_SetSubMenu("QuickMatching",_loc4_);
         _loc4_ = "";
         _loc4_ = _loc4_ + "GoddesGift\t여신의 선물\t\t\n";
         _loc4_ = _loc4_ + "WebStore\t테라 상점\t\t\n";
         _loc4_ = _loc4_ + "TCatStore\tT-cat 상점\t\t\n";
         _loc4_ = _loc4_ + "StyleShop\t스타일 샵\t\t\n";
         _loc4_ = _loc4_ + "HatTransform\t모자변환\t\t\n";
         this.OnGame_MainMenu_SetSubMenu("store",_loc4_);
         _loc4_ = "";
         _loc4_ = _loc4_ + "Quit\t접속종료\t\t\n";
         _loc4_ = _loc4_ + "Option\t시스템 설정\tO\t\n";
         _loc4_ = _loc4_ + "Eject\t비상탈출\t\t\n";
         _loc4_ = _loc4_ + "MoveGuide\t조작방법\t\t\n";
         _loc4_ = _loc4_ + "Help\t도움말\t\t\n";
         _loc4_ = _loc4_ + "HomePage\t테라 홈페이지\t\t\n";
         _loc4_ = _loc4_ + "PatchNote\t패치노트\t\t\n";
         _loc4_ = _loc4_ + "Recommend\t장비추천\t\t\n";
         this.OnGame_MainMenu_SetSubMenu("System",_loc4_);
         _loc4_ = "";
         _loc4_ = _loc4_ + "PCRoom\t테라 PC방\t\t\n";
         _loc4_ = _loc4_ + "VIP\tVIP\t\t\n";
         _loc4_ = _loc4_ + "Frontier\t프론티어\t\t\n";
         _loc4_ = _loc4_ + "TradeBlock\t거래제한\t\t\n";
         this.OnGame_MainMenu_SetSecondSubMenu("MyCharacter","Account",_loc4_);
         _loc4_ = "";
         _loc4_ = _loc4_ + "Official\t공식 홈페이지\t\t\n";
         _loc4_ = _loc4_ + "FanSite\t테라 팬사이트\t\t\n";
         this.OnGame_MainMenu_SetSecondSubMenu("System","HomePage",_loc4_);
         this.OnGame_MainMenu_UpDateSub("Guild","캐릭터 이벤트 : 엘린 마공사 이벤트\t");
         this.OnGame_MainMenu_UpDateSub("GuildInfo","캐릭터 이벤트 : 엘린 마공사 이벤트\t");
         this.OnGame_MainMenu_Tag("Guild","3");
         this.OnGame_MainMenu_Tag("GuildInfo","99");
         this.OnGame_MainMenu_Effect("QuickMatching",1);
         this.OnGame_MainMenu_Effect("DungeonMatch",1);
      }
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_MainMenu_SetMenu",g4.util.Delegate.create(this,this.OnGame_MainMenu_SetMenu));
      this.registerGameInterface("OnGame_MainMenu_UpDateMenu",g4.util.Delegate.create(this,this.OnGame_MainMenu_UpDateMenu));
      this.registerGameInterface("OnGame_MainMenu_SetSubMenu",g4.util.Delegate.create(this,this.OnGame_MainMenu_SetSubMenu));
      this.registerGameInterface("OnGame_MainMenu_SetSecondSubMenu",g4.util.Delegate.create(this,this.OnGame_MainMenu_SetSecondSubMenu));
      this.registerGameInterface("OnGame_MainMenu_UpDateSub",g4.util.Delegate.create(this,this.OnGame_MainMenu_UpDateSub));
      this.registerGameInterface("OnGame_MainMenu_Disable",g4.util.Delegate.create(this,this.OnGame_MainMenu_Disable));
      this.registerGameInterface("OnGame_MainMenu_Tag",g4.util.Delegate.create(this,this.OnGame_MainMenu_Tag));
      this.registerGameInterface("OnGame_MainMenu_Effect",g4.util.Delegate.create(this,this.OnGame_MainMenu_Effect));
      this.registerGameInterface("OnGameEventChangeUIMode",g4.util.Delegate.create(this,this.OnGameEventChangeUIMode));
   }
   function valueHandlerChange(event)
   {
      if(event.key == lib.gamedata.CustomizedUIDataKey.MAINMENU_SHOW_BOOLEAN)
      {
         var _loc2_ = Number(event.value) == 1;
         this.viewAlways = !_loc2_;
      }
   }
   function draggerHandlerPress()
   {
      clearInterval(this.positionInterval);
      this.positionInterval = setInterval(this,"positionTick",100);
   }
   function draggerHandlerRelease()
   {
      clearInterval(this.positionInterval);
      this.positionTick();
   }
   function positionTick()
   {
      this.isTop = g4.util.UIUtil.getScaledPosition(this.__get__targetMovieClip()._y) < g4.util.UIUtil.getStageScaledHeight() / 2;
      if(this.isTop)
      {
         this.mBackground._y = 34;
         this.mBackground._yscale = -100;
      }
      else
      {
         this.mBackground._y = 0;
         this.mBackground._yscale = 100;
      }
   }
   function getItem($type)
   {
      var _loc2_ = (g4.view.mainMenu.MainMenuItem)this.__get__targetMovieClip().container_mc["menu" + $type];
      if(_loc2_ != null)
      {
         if(!_loc2_.hasEventListener("ToGame_MainMenu_RequestDisableUI"))
         {
            _loc2_.addEventListener("ToGame_MainMenu_RequestDisableUI",this,"handlerRequestDisableUI");
            _loc2_.addEventListener("ToGame_MainMenu_RequestShowUI",this,"handlerRequestShowUI");
            _loc2_.addEventListener(gfx.events.EventTypes.ITEM_CLICK,this,"handlerItemClick");
            _loc2_.addEventListener(gfx.events.EventTypes.ITEM_ROLL_OVER,this,"mainHandlerOver");
            _loc2_.addEventListener(gfx.events.EventTypes.ITEM_ROLL_OUT,this,"mainHandlerOut");
            _loc2_.addEventListener("showSubMenu",this,"subMenuHandlerShow");
            switch($type)
            {
               case "Event":
                  _loc2_.index = 1;
                  break;
               case "MyCharacter":
                  _loc2_.index = 2;
                  break;
               case "Inventory":
                  _loc2_.index = 3;
                  break;
               case "Party":
                  _loc2_.index = 4;
                  break;
               case "Community":
                  _loc2_.index = 5;
                  break;
               case "QuickMatching":
                  _loc2_.index = 6;
                  var _loc3_ = (g4.view.mainMenu.MainMenuItem)this.__get__targetMovieClip().container_mc.menuQuickMatching2;
                  _loc3_.addEventListener("ToGame_MainMenu_RequestDisableUI",this,"handlerRequestDisableUI");
                  _loc3_.addEventListener("ToGame_MainMenu_RequestShowUI",this,"handlerRequestShowUI");
                  _loc3_.addEventListener(gfx.events.EventTypes.ITEM_CLICK,this,"handlerItemClick");
                  _loc3_.addEventListener(gfx.events.EventTypes.ITEM_ROLL_OVER,this,"mainHandlerOver");
                  _loc3_.addEventListener(gfx.events.EventTypes.ITEM_ROLL_OUT,this,"mainHandlerOut");
                  _loc3_.addEventListener("showSubMenu",this,"subMenuHandlerShow");
                  _loc3_.index = 6;
                  _loc3_.__set__visible(false);
                  break;
               case "store":
                  _loc2_.index = 7;
                  break;
               case "Premium":
                  _loc2_.index = 8;
                  break;
               case "System":
                  _loc2_.index = 9;
            }
         }
      }
      return _loc2_;
   }
   function handlerRequestDisableUI($event)
   {
      this.ToGame_MainMenu_RequestDisableUI($event.id);
      this.subMenu.__set__visible(false);
      if(this.selectedItem != null)
      {
         this.selectedItem.__set__selected(false);
         this.selectedItem = null;
      }
   }
   function handlerRequestShowUI($event)
   {
      this.ToGame_MainMenu_RequestShowUI($event.id);
   }
   function subMenuHandlerShow($event)
   {
      clearInterval(this.subMenuInterval);
      if(this.selectedItem != null)
      {
         this.selectedItem.__set__selected(false);
         if(this.selectedItem == $event.target)
         {
            return undefined;
         }
      }
      this.selectedItem = $event.target;
      this.selectedItem.__set__selected(true);
      this.subMenu.showSubMenu($event.id,this.isTop);
      this.subMenu.textField.text = lib.util.UIString.getUIString("$01500" + this.selectedItem.index);
      this.subMenu.textField._width = Math.round(this.subMenu.textField.textWidth + 4);
      var _loc6_ = $event.target._x;
      var _loc4_ = this.__get__targetMovieClip()._x / (this.__get__targetMovieClip()._xscale / 100);
      var _loc2_ = _loc6_ + _loc4_ + 5;
      if(_loc2_ + this.subMenu.mBackground._width > this.getStageScaledWidth())
      {
         _loc2_ = _loc6_ + _loc4_ + $event.target._width - this.subMenu.mBackground._width - 5;
         this.subMenu.mArrow.gotoAndStop(2);
         this.subMenu.mArrow._x = this.subMenu.mBackground._width - this.subMenu.mArrow._width;
      }
      else
      {
         this.subMenu.mArrow.gotoAndStop(1);
         this.subMenu.mArrow._x = 0;
      }
      _loc2_ = Math.max(0,_loc2_);
      _loc2_ = _loc2_ - _loc4_;
      var _loc5_ = undefined;
      if(this.isTop)
      {
         this.subMenu.mArrow._yscale = -100;
         this.subMenu.mBackground._yscale = - this.subMenu.mBackground._yscale;
         this.subMenu.mBackground._y = this.subMenu.mBackground._height;
         this.subMenu.mArrow._y = 0;
         _loc5_ = $event.target._y + 40;
      }
      else
      {
         this.subMenu.mArrow._yscale = 100;
         this.subMenu.mBackground._y = 0;
         this.subMenu.mArrow._y = this.subMenu.mBackground._height;
         _loc5_ = $event.target._y - (this.subMenu._height - 25);
      }
      this.subMenu._x = _loc2_;
      this.subMenu._y = _loc5_;
   }
   function handlerItemClick($event)
   {
      clearInterval(this.subMenuInterval);
      if(this.selectedItem != null)
      {
         this.selectedItem.__set__selected(false);
         if(this.selectedItem == $event.target)
         {
            this.subMenuExpire();
            return undefined;
         }
      }
      this.selectedItem = $event.target;
      this.selectedItem.__set__selected(true);
      this.subMenu.showSubMenu($event.id,this.isTop);
      this.subMenu.textField.text = lib.util.UIString.getUIString("$01500" + this.selectedItem.index);
      this.subMenu.textField._width = Math.round(this.subMenu.textField.textWidth + 4);
      var _loc6_ = $event.target._x;
      var _loc4_ = this.__get__targetMovieClip()._x / (this.__get__targetMovieClip()._xscale / 100);
      var _loc2_ = _loc6_ + _loc4_ + 5;
      if(_loc2_ + this.subMenu.mBackground._width > this.getStageScaledWidth())
      {
         _loc2_ = _loc6_ + _loc4_ + $event.target._width - this.subMenu.mBackground._width - 5;
         this.subMenu.mArrow.gotoAndStop(2);
         this.subMenu.mArrow._x = this.subMenu.mBackground._width - this.subMenu.mArrow._width;
      }
      else
      {
         this.subMenu.mArrow.gotoAndStop(1);
         this.subMenu.mArrow._x = 0;
      }
      _loc2_ = Math.max(g4.util.ScreenUtil.getScreenMinX(),_loc2_);
      _loc2_ = _loc2_ - _loc4_;
      var _loc5_ = undefined;
      if(this.isTop)
      {
         this.subMenu.mArrow._yscale = -100;
         this.subMenu.mBackground._yscale = - this.subMenu.mBackground._yscale;
         this.subMenu.mBackground._y = this.subMenu.mBackground._height;
         this.subMenu.mArrow._y = 0;
         _loc5_ = $event.target._y + 40;
      }
      else
      {
         this.subMenu.mArrow._yscale = 100;
         this.subMenu.mBackground._y = 0;
         this.subMenu.mArrow._y = this.subMenu.mBackground._height;
         _loc5_ = $event.target._y - (this.subMenu._height - 25);
      }
      this.subMenu._x = _loc2_;
      this.subMenu._y = _loc5_;
   }
   function getStageScaledWidth()
   {
      var _loc2_ = this.__get__targetMovieClip()._xscale / 100;
      return 1 / _loc2_ * g4.util.ScreenUtil.getScreenMaxX();
   }
   function subHandlerOver($event)
   {
      clearInterval(this.subMenuInterval);
   }
   function sub2HandlerOver($event)
   {
      clearInterval(this.subMenuInterval);
   }
   function subHandlerOut($event)
   {
      clearInterval(this.subMenuInterval);
      this.subMenuInterval = setInterval(this,"subMenuExpire",300);
   }
   function mainHandlerOver($event)
   {
      this.positionTick();
   }
   function mainHandlerOut($event)
   {
      clearInterval(this.subMenuInterval);
      this.subMenuInterval = setInterval(this,"subMenuExpire",300);
   }
   function subMenuExpire()
   {
      clearInterval(this.subMenuInterval);
      delete this.subMenuInterval;
      if(!this.subMenu.mBackground.hitTest(_root._xmouse,_root._ymouse))
      {
         this.subMenu.__set__visible(false);
         if(this.selectedItem != null)
         {
            this.selectedItem.__set__selected(false);
            this.selectedItem = null;
         }
      }
   }
   function getMainMenu($id)
   {
      var _loc2_ = (g4.view.mainMenu.MainMenuItem)this.__get__targetMovieClip().container_mc["menu" + $id];
      return _loc2_;
   }
   function OnGame_MainMenu_SetMenu($menus)
   {
      var _loc6_ = lib.util.ExtString.split($menus,"\n");
      var _loc7_ = _loc6_.length;
      var _loc3_ = 0;
      while(_loc3_ < _loc7_)
      {
         var _loc2_ = lib.util.ExtString.split(_loc6_[_loc3_],"\t");
         var _loc5_ = this.getItem(_loc2_[0]);
         _loc5_.setData(_loc2_);
         if(_loc2_[0] == "QuickMatching")
         {
            var _loc4_ = this.menuQuickMatching2;
            _loc4_.setData(_loc2_);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function OnGame_MainMenu_UpDateMenu($id, $datas)
   {
      var _loc2_ = this.getMainMenu($id);
      if(_loc2_ != null)
      {
         var _loc3_ = lib.util.ExtString.split($datas,"\t");
         _loc2_.updateData(_loc3_);
      }
   }
   function OnGame_MainMenu_SetSubMenu($id, $subMenu)
   {
      var _loc5_ = this.getMainMenu($id);
      _loc5_.setSubMenu($subMenu != "");
      this.subMenu.addSubMenu($id,$subMenu);
      if($id == "QuickMatching")
      {
         var _loc2_ = this.menuQuickMatching2;
         _loc2_.setSubMenu($subMenu != "");
      }
   }
   function OnGame_MainMenu_SetSecondSubMenu($id, $subId, $subMenu)
   {
      return undefined;
   }
   function OnGame_MainMenu_UpDateSub($id, $subMenu)
   {
      this.subMenu.updateSubMenu($id,$subMenu);
   }
   function OnGame_MainMenu_Disable($id, $disable)
   {
      var _loc2_ = this.getMainMenu($id);
      if(_loc2_ != null)
      {
         _loc2_.setMenuDisabled($disable);
      }
      else
      {
         this.subMenu.setMenuDisabled($id,$disable);
      }
   }
   function OnGame_MainMenu_Tag($id, $tag)
   {
      var _loc2_ = this.__get__targetMovieClip().container_mc["mNew" + $id];
      if(_loc2_ != null)
      {
         if($tag != "" && $tag != "0")
         {
            _loc2_._visible = true;
         }
         else
         {
            _loc2_._visible = false;
         }
      }
      else
      {
         this.subMenu.setTag($id,$tag);
      }
   }
   function OnGame_MainMenu_Effect($id, $type)
   {
      var _loc4_ = this.getMainMenu($id);
      if(_loc4_ != null)
      {
         if($id != "QuickMatching")
         {
            _loc4_.setEffect($type);
         }
      }
      else
      {
         this.subMenu.setEffect($id,$type);
      }
      if($id == "IconBFMatching" || $id == "IconDungeonMatching")
      {
         var _loc3_ = 0;
         if(this.subMenu.getSubMenuData("QuickMatching","IconBFMatching").Effect == 1)
         {
            _loc3_ = _loc3_ + 1;
         }
         if(this.subMenu.getSubMenuData("QuickMatching","IconDungeonMatching").Effect == 1)
         {
            _loc3_ = _loc3_ + 1;
         }
         if(_loc3_ > 0)
         {
            this.__get__targetMovieClip().container_mc.menuQuickMatching._visible = false;
            this.__get__targetMovieClip().container_mc.menuQuickMatching2._visible = true;
         }
         else
         {
            this.__get__targetMovieClip().container_mc.menuQuickMatching._visible = true;
            this.__get__targetMovieClip().container_mc.menuQuickMatching2._visible = false;
         }
      }
   }
   function OnGameEventChangeUIMode($show)
   {
      if($show)
      {
         this.__get__targetMovieClip().container_mc._visible = true;
         this.mBackground._visible = true;
         this.__get__targetMovieClip().container_mc.menuEvent._alpha = 100;
         this.__get__targetMovieClip().container_mc.menuMyCharacter._alpha = 100;
         this.__get__targetMovieClip().container_mc.menuInventory._alpha = 100;
         this.__get__targetMovieClip().container_mc.menuParty._alpha = 100;
         this.__get__targetMovieClip().container_mc.menuCommunity._alpha = 100;
         this.__get__targetMovieClip().container_mc.menuQuickMatching._alpha = 100;
         this.__get__targetMovieClip().container_mc.menustore._alpha = 100;
         this.__get__targetMovieClip().container_mc.menuPremium._alpha = 100;
         this.__get__targetMovieClip().container_mc.menuSystem._alpha = 100;
      }
      else
      {
         if(!this.viewAlways)
         {
            this.__get__targetMovieClip().container_mc._visible = false;
         }
         this.mBackground._visible = false;
         this.__get__targetMovieClip().container_mc.menuEvent._alpha = 70;
         this.__get__targetMovieClip().container_mc.menuMyCharacter._alpha = 70;
         this.__get__targetMovieClip().container_mc.menuInventory._alpha = 70;
         this.__get__targetMovieClip().container_mc.menuParty._alpha = 70;
         this.__get__targetMovieClip().container_mc.menuCommunity._alpha = 70;
         this.__get__targetMovieClip().container_mc.menuQuickMatching._alpha = 70;
         this.__get__targetMovieClip().container_mc.menustore._alpha = 70;
         this.__get__targetMovieClip().container_mc.menuPremium._alpha = 70;
         this.__get__targetMovieClip().container_mc.menuSystem._alpha = 70;
      }
      this.subMenuExpire();
   }
   function ToGame_MainMenu_Init()
   {
      fscommand("ToGame_MainMenu_Init");
   }
   function ToGame_MainMenu_RequestShowUI($id)
   {
      getURL("FSCommand:ToGame_MainMenu_RequestShowUI",$id);
   }
   function ToGame_MainMenu_RequestDisableUI($id)
   {
      getURL("FSCommand:ToGame_MainMenu_RequestDisableUI",$id);
   }
}
