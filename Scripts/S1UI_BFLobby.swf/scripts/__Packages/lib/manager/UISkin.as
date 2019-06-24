class lib.manager.UISkin
{
   static var LISTLINE_HEIGHT = 30;
   static var LISTLINE_SPACE = 0;
   static var LISTLINE_LMARGINE = 0;
   static var LISTLINE_TMARGINE = 0;
   static var TXTBTN_Y = 700;
   static var TXTBTN_XPOSITION = [18,200,300,400];
   static var SLOT1LIST_HSPACE = 2;
   static var SLOT1LIST_VSPACE = 2;
   static var SLOT2LIST_HSPACE = 3;
   static var SLOT2LIST_VSPACE = 2;
   static var SLOT1LIST_HEIGHT = 54;
   static var SLOT2LIST_HEIGHT = 60;
   static var SLOT3LIST_HEIGHT = 60;
   static var SLOT1LIST_WIDTH = 54;
   static var SLOT2LIST_WIDTH = 213;
   static var SLOT3LIST_WIDTH = 225;
   static var NORMALPOPUP_WIDTH = 474;
   static var NORMALPOPUP_HEIGHT = 346;
   static var NORMALUI_WIDTH = 480;
   var MEDIUMUI_WIDTH = 635;
   var LARGEUI_WIDTH = 958;
   static var LOCKBTNBYBG_Y = 9;
   static var XBTNBYBG_Y = 9;
   static var NORMALLOCKBTNBYBG_X = 403;
   static var NORMALXBTNBYBG_X = 435;
   var MEDIUMLOCKBTNBYBG_X = 562;
   var MEDIUMXBTNBYBG_X = 594;
   var LARGELOCKBTNBYBG_X = 889;
   static var LARGEXBTNBYBG_X = 920;
   static var TITLEBYBG_X = 108;
   static var TITLEBYBG_Y = 7;
   static var NORMALTITLE_WIDTH = 289;
   var LARGETITLE_WIDTH = 774;
   var MEDIUMTITLE_WIDTH = 448;
   var POPUPTITLE_WIDTH = 463;
   static var POPUPTITLEBYBG_X = 5;
   static var EMBLEM_X = 0;
   static var EMBLEM_Y = -80;
   var skinException = ["WorldMap2","TargetInfo","OverlayMap2","SenatorMap","TradeHouse"];
   static var EMBLEM_UNIQUE_PRODUCTIONLIST_HEAVY = "ProductionList_Heavy";
   static var EMBLEM_UNIQUE_PRODUCTIONLIST_LIGHT = "ProductionList_Light";
   static var EMBLEM_UNIQUE_PRODUCTIONLIST_ROBE = "ProductionList_Robe";
   static var EMBLEM_UNIQUE_PRODUCTIONLIST_MAGIC = "ProductionList_Magic";
   static var EMBLEM_UNIQUE_PRODUCTIONLIST_METAL = "ProductionList_Metal";
   static var EMBLEM_UNIQUE_PRODUCTIONLIST_SUPPLIES = "ProductionList_Supplies";
   static var EMBLEM_UNIQUE_HOMUNVENDOR_BUY = "HomunVendor_Buy";
   static var EMBLEM_UNIQUE_HOMUNVENDOR_SALE = "HomunVendor_Sale";
   function UISkin(ui)
   {
      this.uiInstance = ui;
      this.uiName = ui.UIname;
      lib.manager.UISkin.drawEmblem(ui,this.uiName);
      this.setAlingSkin();
      lib.manager.UISkin.drawBg(this.uiName,this.uiInstance.container_mc.uiBgMc,this.uiInstance);
   }
   static function instance(uiobj)
   {
      var _loc1_ = new lib.manager.UISkin(uiobj);
   }
   function setAlingSkin()
   {
      var _loc2_ = this.skinException.length;
      var _loc3_ = new TextFormat();
      _loc3_.leading = -1;
      while(true)
      {
         _loc2_;
         if(_loc2_-- >= 0)
         {
            if(this.uiName.toLowerCase() == this.skinException[_loc2_].toLowerCase())
            {
               return undefined;
            }
            continue;
         }
         break;
      }
      if(this.uiInstance.container_mc.text_name == undefined)
      {
         this.uiInstance.container_mc.title_txt.multiline = true;
         this.uiInstance.container_mc.title_txt.wordWrap = true;
         this.uiInstance.container_mc.title_txt._height = 38;
         this.uiInstance.container_mc.title_txt.textAutoSize = "shrink";
         this.uiInstance.container_mc.title_txt.verticalAlign = "center";
         this.uiInstance.container_mc.title_txt.setTextFormat(_loc3_);
      }
      else
      {
         this.uiInstance.container_mc.text_name.multiline = true;
         this.uiInstance.container_mc.text_name.wordWrap = true;
         this.uiInstance.container_mc.text_name._height = 38;
         this.uiInstance.container_mc.text_name.textAutoSize = "shrink";
         this.uiInstance.container_mc.text_name.verticalAlign = "center";
         this.uiInstance.container_mc.text_name.setTextFormat(_loc3_);
      }
      var _loc6_ = this.uiInstance.container_mc.uiBgMc._x;
      var _loc5_ = this.uiInstance.container_mc.uiBgMc._y;
      var _loc4_ = this.uiInstance.hit._width;
      if(this.uiInstance["img://__S1UIRES_Emblem.Emblem_" + this.uiName] == undefined)
      {
         this.uiInstance.container_mc.lock_mc._x = lib.manager.UISkin.NORMALLOCKBTNBYBG_X;
         this.uiInstance.container_mc.lock_mc._y = lib.manager.UISkin.LOCKBTNBYBG_Y;
         this.uiInstance.container_mc.x_mc._x = lib.manager.UISkin.NORMALXBTNBYBG_X;
         this.uiInstance.container_mc.x_mc._y = lib.manager.UISkin.XBTNBYBG_Y;
         this.uiInstance.container_mc.text_name._width = this.POPUPTITLE_WIDTH;
         this.uiInstance.container_mc.text_name._x = lib.manager.UISkin.POPUPTITLEBYBG_X;
         this.uiInstance.container_mc.text_name._y = lib.manager.UISkin.TITLEBYBG_Y;
         if(this.uiInstance.container_mc.text_name == undefined)
         {
            this.uiInstance.container_mc.title_txt._width = this.POPUPTITLE_WIDTH;
            this.uiInstance.container_mc.title_txt._x = lib.manager.UISkin.POPUPTITLEBYBG_X;
            this.uiInstance.container_mc.title_txt._y = lib.manager.UISkin.TITLEBYBG_Y;
         }
      }
      else if(_loc4_ <= lib.manager.UISkin.NORMALUI_WIDTH)
      {
         this.uiInstance.container_mc.lock_mc._x = lib.manager.UISkin.NORMALLOCKBTNBYBG_X;
         this.uiInstance.container_mc.lock_mc._y = lib.manager.UISkin.LOCKBTNBYBG_Y;
         this.uiInstance.container_mc.x_mc._x = lib.manager.UISkin.NORMALXBTNBYBG_X;
         this.uiInstance.container_mc.x_mc._y = lib.manager.UISkin.XBTNBYBG_Y;
         this.uiInstance.container_mc.text_name._width = lib.manager.UISkin.NORMALTITLE_WIDTH;
         this.uiInstance.container_mc.text_name._x = lib.manager.UISkin.TITLEBYBG_X;
         this.uiInstance.container_mc.text_name._y = lib.manager.UISkin.TITLEBYBG_Y;
         if(this.uiInstance.container_mc.text_name == undefined)
         {
            this.uiInstance.container_mc.title_txt._width = lib.manager.UISkin.NORMALTITLE_WIDTH;
            this.uiInstance.container_mc.title_txt._x = lib.manager.UISkin.TITLEBYBG_X;
            this.uiInstance.container_mc.title_txt._y = lib.manager.UISkin.TITLEBYBG_Y;
         }
      }
      else if(_loc4_ <= this.MEDIUMUI_WIDTH)
      {
         this.uiInstance.container_mc.lock_mc._x = this.MEDIUMLOCKBTNBYBG_X;
         this.uiInstance.container_mc.lock_mc._y = lib.manager.UISkin.LOCKBTNBYBG_Y;
         this.uiInstance.container_mc.x_mc._x = this.MEDIUMXBTNBYBG_X;
         this.uiInstance.container_mc.x_mc._y = lib.manager.UISkin.XBTNBYBG_Y;
         this.uiInstance.container_mc.text_name._width = this.MEDIUMTITLE_WIDTH;
         this.uiInstance.container_mc.text_name._x = lib.manager.UISkin.TITLEBYBG_X;
         this.uiInstance.container_mc.text_name._y = lib.manager.UISkin.TITLEBYBG_Y;
         if(this.uiInstance.container_mc.text_name == undefined)
         {
            this.uiInstance.container_mc.title_txt._width = this.MEDIUMTITLE_WIDTH;
            this.uiInstance.container_mc.title_txt._x = lib.manager.UISkin.TITLEBYBG_X;
            this.uiInstance.container_mc.title_txt._y = lib.manager.UISkin.TITLEBYBG_Y;
         }
      }
      else
      {
         this.uiInstance.container_mc.lock_mc._x = this.LARGELOCKBTNBYBG_X;
         this.uiInstance.container_mc.lock_mc._y = lib.manager.UISkin.LOCKBTNBYBG_Y;
         this.uiInstance.container_mc.x_mc._x = lib.manager.UISkin.LARGEXBTNBYBG_X;
         this.uiInstance.container_mc.x_mc._y = lib.manager.UISkin.XBTNBYBG_Y;
         this.uiInstance.container_mc.text_name._width = this.LARGETITLE_WIDTH;
         this.uiInstance.container_mc.text_name._x = lib.manager.UISkin.TITLEBYBG_X;
         this.uiInstance.container_mc.text_name._y = lib.manager.UISkin.TITLEBYBG_Y;
         if(this.uiInstance.container_mc.text_name == undefined)
         {
            this.uiInstance.container_mc.title_txt._width = this.LARGETITLE_WIDTH;
            this.uiInstance.container_mc.title_txt._x = lib.manager.UISkin.TITLEBYBG_X;
            this.uiInstance.container_mc.title_txt._y = lib.manager.UISkin.TITLEBYBG_Y;
         }
      }
   }
   static function drawEmblem(ui, emblemName)
   {
      var _loc1_ = lib.util.DrawBitmap.makeMcAndDraw(ui,"img://__S1UIRES_Emblem.Emblem_" + emblemName);
      if(_loc1_._height >= 50)
      {
         _loc1_._x = lib.manager.UISkin.EMBLEM_X;
         _loc1_._y = lib.manager.UISkin.EMBLEM_Y;
         _loc1_.hitTestDisable = true;
      }
      else
      {
         _loc1_.removeMovieClip();
      }
   }
   static function drawBg(uiName, container)
   {
      if(container != undefined)
      {
         var _loc1_ = lib.util.DrawBitmap.makeMcAndDraw(container,"img://__S1UIRES_Skin.BG_" + uiName.toLowerCase());
         _loc1_.hitTestDisable = true;
      }
   }
   static function setInGameCharacterName(container, __name)
   {
      var _loc2_ = new TextFormat();
      _loc2_.font = "$NormalFont";
      _loc2_.size = 16;
      var _loc4_ = 260;
      var _loc3_ = -10;
      var _loc1_ = container.pcname;
      if(_loc1_ == undefined)
      {
         _loc1_ = container.createTextField("pcname",container.getNextHighestDepth(),_loc4_,_loc3_,1,1);
      }
      _loc1_.autoSize = "center";
      _loc1_.background = true;
      _loc1_.setNewTextFormat(_loc2_);
      _loc1_.text = __name;
   }
}
