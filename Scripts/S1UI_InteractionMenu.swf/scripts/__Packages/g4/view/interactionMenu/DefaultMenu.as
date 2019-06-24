class g4.view.interactionMenu.DefaultMenu extends g4.view.interactionMenu.Menu
{
   function DefaultMenu(targetMovieClip)
   {
      super(targetMovieClip);
      this.configUI();
   }
   function configUI()
   {
      this.mc_name = this.__get__targetMovieClip().mc_name;
      this.mc_bg = this.__get__targetMovieClip().mc_bg;
      this.textField1 = this.mc_name.textField1;
      this.textField2 = this.mc_name.textField2;
      var _loc2_ = new TextFormat();
      _loc2_.leftMargin = g4.view.interactionMenu.InteractionMenuConstants.TEXT_MARGIN;
      _loc2_.rightMargin = g4.view.interactionMenu.InteractionMenuConstants.TEXT_MARGIN;
      this.textField1.verticalAlign = "bottom";
      this.textField1.textAutoSize = "shrink";
      this.textField1.setNewTextFormat(_loc2_);
      g4.util.UIUtil.setMouseEnabled(this.textField1,false);
      g4.util.UIUtil.setTextFieldStyle(this.textField1,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.textField2.verticalAlign = "top";
      this.textField2.textAutoSize = "shrink";
      this.textField2.setNewTextFormat(_loc2_);
      g4.util.UIUtil.setMouseEnabled(this.textField2,false);
      g4.util.UIUtil.setTextFieldStyle(this.textField2,g4.util.UIUtil.TEXT_FIELD_STYLE_1);
      this.mc_list = this.__get__targetMovieClip().createEmptyMovieClip("mc_list",this.__get__targetMovieClip().getNextHighestDepth());
      this.mc_list._x = g4.view.interactionMenu.InteractionMenuConstants.PADDING_LEFT;
      this.mc_list._y = g4.view.interactionMenu.InteractionMenuConstants.PADDING_TOP;
      this.list = new g4.view.interactionMenu.List(this.mc_list);
      this.list.addEventListener(g4.view.interactionMenu.List.ITEM_ROLL_OVER,this,"list_itemRollOverHandler");
      this.list.addEventListener(g4.view.interactionMenu.List.ITEM_ROLL_OUT,this,"list_itemRollOutHandler");
      this.list.addEventListener(g4.view.interactionMenu.List.ITEM_CLICK,this,"list_itemClickHandler");
      this.__get__targetMovieClip()._visible = false;
      g4.model.GameModel.addEventListener(g4.view.ViewID.INTERACTION_MENU,g4.model.GameModelEventType.INTERACTION_MENU_OPEN_DEFAULT,this,"model_interactionMenuOpenDefaultHandler");
      g4.model.GameModel.addEventListener(g4.view.ViewID.INTERACTION_MENU,g4.model.GameModelEventType.INTERACTION_MENU_MOVE,this,"model_interactionMenuMoveHandler");
   }
   function afterClose()
   {
      g4.model.GameModel.mainModel.ToGame_InteractionMenu_CloseUI();
   }
   function convertToMenuDataArray(dataString)
   {
      var _loc1_ = lib.util.ExtString.split(dataString,"\n");
      while(true)
      {
         if(_loc1_ == null || _loc1_.length == 0)
         {
            break;
         }
         var _loc2_ = _loc1_[_loc1_.length - 1];
         if(_loc2_ == undefined || _loc2_ == "undefined" || _loc2_ == "" || _loc2_ == " ")
         {
            _loc1_.pop();
            continue;
         }
         break;
      }
      if(_loc1_ == null || _loc1_.length == 0)
      {
         return null;
      }
      var _loc5_ = [];
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc6_ = _loc1_.length;
      _loc3_ = 0;
      while(_loc3_ < _loc6_)
      {
         _loc4_ = new g4.model.main.InteractionMenuData();
         _loc4_.label = _loc1_[_loc3_];
         _loc4_.data = _loc3_;
         _loc5_.push(_loc4_);
         _loc3_ = _loc3_ + 1;
      }
      return _loc5_;
   }
   function setCharInfo(visible, text1, text2)
   {
      if(!visible)
      {
         this.mc_name._visible = false;
         this.textField1.htmlText = "";
         this.textField1.htmlText = "";
         return undefined;
      }
      this.textField1.htmlText = this.wrapHtml(text1);
      this.textField2.htmlText = this.wrapHtml(text2);
      this.mc_name._visible = true;
   }
   function wrapHtml(text)
   {
      return "<textformat leftmargin=\'" + g4.view.interactionMenu.InteractionMenuConstants.TEXT_MARGIN + "\' rightmargin=\'" + g4.view.interactionMenu.InteractionMenuConstants.TEXT_MARGIN + "\'>" + text + "</textformat>";
   }
   function setDataAndOpenMenu(x, y, dataList)
   {
      var _loc3_ = this.convertToMenuDataArray(dataList);
      if(_loc3_ == null || _loc3_.length == 0)
      {
         this.closeMenuImmediately();
         return undefined;
      }
      var _loc6_ = 0;
      var _loc4_ = _loc3_[0].label;
      var _loc2_ = _loc4_.indexOf("[");
      if(_loc2_ != -1)
      {
         _loc3_.shift();
         var _loc8_ = _loc4_.substring(0,_loc2_);
         var _loc5_ = _loc4_.substring(_loc2_ + 1,_loc4_.length - 1);
         _loc2_ = _loc5_.indexOf("/");
         var _loc7_ = _loc5_.substring(0,_loc2_);
         var _loc9_ = _loc5_.substring(_loc2_ + 1);
         var _loc11_ = _loc7_;
         var _loc10_ = _loc9_ + " " + _loc8_;
         this.setCharInfo(true,_loc11_,_loc10_);
         _loc6_ = g4.view.interactionMenu.InteractionMenuConstants.NAME_HEIGHT;
      }
      else
      {
         this.setCharInfo(false);
      }
      this.list.setData(_loc3_);
      this.mc_list._y = g4.view.interactionMenu.InteractionMenuConstants.PADDING_TOP + _loc6_;
      this.mc_bg._height = g4.view.interactionMenu.InteractionMenuConstants.PADDING_TOP + g4.view.interactionMenu.InteractionMenuConstants.PADDING_BOTTOM + _loc6_ + this.list.getActualHeight();
      this.move(x,y);
      this.openMenu();
      this.closeMenuLater();
   }
   function move(x, y)
   {
      var _loc6_ = Stage.visibleRect.x;
      var _loc18_ = Stage.visibleRect.x + Stage.visibleRect.width;
      var _loc5_ = Stage.visibleRect.y;
      var _loc15_ = Stage.visibleRect.y + Stage.visibleRect.height;
      var _loc16_ = Stage.visibleRect.width;
      var _loc13_ = Stage.visibleRect.height;
      var _loc14_ = x / g4.model.GameModel.mainModel.resolutionX;
      var _loc17_ = y / g4.model.GameModel.mainModel.resolutionY;
      x = _loc6_ + _loc16_ * _loc14_;
      y = _loc5_ + _loc13_ * _loc17_;
      var _loc4_ = this.__get__targetMovieClip()._xscale / 100;
      var _loc9_ = this.mc_bg._width * _loc4_;
      var _loc10_ = this.mc_bg._height * _loc4_;
      var _loc8_ = g4.view.interactionMenu.InteractionMenuConstants.MENU_OFFSET_X * _loc4_;
      var _loc7_ = g4.view.interactionMenu.InteractionMenuConstants.MENU_OFFSET_Y * _loc4_;
      var _loc2_ = x + _loc8_;
      if(_loc2_ + _loc9_ > _loc18_)
      {
         _loc2_ = x - _loc8_ - _loc9_;
      }
      if(_loc2_ < _loc6_)
      {
         _loc2_ = _loc6_;
      }
      var _loc3_ = y + _loc7_;
      if(_loc3_ + _loc10_ > _loc15_)
      {
         _loc3_ = y - _loc7_ - _loc10_;
      }
      if(_loc3_ < _loc5_)
      {
         _loc3_ = _loc5_;
      }
      this.__get__targetMovieClip()._x = _loc2_;
      this.__get__targetMovieClip()._y = _loc3_;
   }
   function list_itemRollOverHandler(event)
   {
      this.cancelAutoClose();
   }
   function list_itemRollOutHandler(event)
   {
      this.closeMenuLater();
   }
   function list_itemClickHandler(event)
   {
      lib.manager.UISound.play(lib.manager.UISound.MAIN_BTN);
      var _loc2_ = Number(event.data);
      g4.model.GameModel.mainModel.ToGame_InteractionMenu_Select(_loc2_);
      this.closeMenuImmediately();
   }
   function model_interactionMenuOpenDefaultHandler(event)
   {
      this.setDataAndOpenMenu(event.data.x,event.data.y,event.data.dataList);
   }
   function model_interactionMenuMoveHandler(event)
   {
      this.move(event.data.x,event.data.y);
   }
}
