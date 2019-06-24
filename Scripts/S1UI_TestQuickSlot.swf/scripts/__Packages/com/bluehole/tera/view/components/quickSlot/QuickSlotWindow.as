class com.bluehole.tera.view.components.quickSlot.QuickSlotWindow extends com.bluehole.tera.view.components.quickSlot.BaseQuickSlot
{
   var sUIRotate = "DEFAULT";
   var NUM_SLOT = 27;
   var elementsPositionChanged = false;
   var tweenMove = false;
   function QuickSlotWindow()
   {
      super();
      this.UI.UIname = "ShortCut";
   }
   function toString()
   {
      return "[com.bluehole.tera.view.components.quickSlot.QuickSlotWindow " + this._name + "]";
   }
   function configUI()
   {
      super.configUI();
      this.pageTF = this.mTextAnim.mText.pageTF;
      this.pageTF.onChanged = g4.util.Delegate.create(this,this.textHandlerChange);
      this.pageUpBtn.__set__disableFocus(true);
      this.pageUpBtn.addEventListener(gfx.events.EventTypes.CLICK,this,"onPageHandler");
      this.pageUpBtn.addEventListener(gfx.events.EventTypes.ROLL_OVER,this,"pageHandlerOver");
      this.pageDownBtn.__set__disableFocus(true);
      this.pageDownBtn.addEventListener(gfx.events.EventTypes.CLICK,this,"onPageHandler");
      this.pageDownBtn.addEventListener(gfx.events.EventTypes.ROLL_OVER,this,"pageHandlerOver");
      this.pageBG.onRollOver = g4.util.Delegate.create(this,this.pageHandlerOver);
      this.addShortcutBtn.__set__disableFocus(true);
      this.addShortcutBtn.addEventListener(gfx.events.EventTypes.CLICK,this,"onAddShortcutHandler");
      this.addShortcutBtn2.__set__disableFocus(true);
      this.addShortcutBtn2.addEventListener(gfx.events.EventTypes.CLICK,this,"onAddShortcut2Handler");
      this.preShortcutBtn.__set__disableFocus(true);
      this.preShortcutBtn.addEventListener(gfx.events.EventTypes.CLICK,this,"onPremiumShortcutHandler");
      this.UI.listCtrl = this.listCtrl;
      this.listCtrl.__set__mode("small");
      this.listCtrl.addEventListener("modeChanged",this,"listCtrl_modeChangedHandler");
      this.listCtrl.addEventListener("itemPress",this,"listCtrl_itemPressHandler");
      this.listCtrl.addEventListener("itemClick",this,"listCtrl_itemClickHandler");
      this.shortCutListCtrl.addEventListener("itemPress",this,"shortCutListCtrl_itemPressHandler");
      this.shortCutListCtrl.addEventListener("itemClick",this,"shortCutListCtrl_itemClickHandler");
      this.registerTooltip(null);
      this.setTransform();
      this.pageTF.hitTestDisable = true;
   }
   function draw()
   {
      super.draw();
      if(this.elementsPositionChanged)
      {
         this.elementsPositionChanged = false;
         this.reflowElements(this.sUIRotate);
      }
   }
   function checkDragArea(bool)
   {
      if(!bool)
      {
         delete this.onMouseMove;
      }
      else
      {
         this.onMouseMove = function()
         {
            this.setTransform();
         };
      }
   }
   function getDragRight()
   {
      var _loc3_ = undefined;
      var _loc2_ = this.getUIParentLeftTop();
      _loc3_ = Math.floor(Stage.visibleRect.bottomRight.x - _loc2_.x - (this.titleBtn._x + 110) * this.UI._xscale * 0.01);
      return _loc3_;
   }
   function configEvents()
   {
      super.configEvents();
      if(_root.BaseUI)
      {
         var _loc5_ = _root.GetRegisterUIData(this.UI.UIname);
      }
      var thisObject = this;
      this.UI.myListener.OnGameEventShowWindow = function(widgetName, bShow, expandOption)
      {
         if(widgetName.toLowerCase() == thisObject.UI.UIname.toLowerCase())
         {
            thisObject.UI.bWidgetOpen = Number(bShow);
            thisObject.UI._visible = Boolean(bShow);
            thisObject.setTransform();
         }
      };
      this.UI.myListener.OnGameEventChangeUIMode = function(bShow)
      {
         var _loc1_ = thisObject.container;
         if(bShow)
         {
            _loc1_.pageDownBtn._visible = _loc1_.pageUpBtn._visible = true;
            _loc1_.addShortcutBtn._visible = _loc1_.addShortcutBtn2._visible = true;
            _loc1_.pageBG._visible = _loc1_.mTextAnim._visible = true;
            _loc1_.listCtrl._visible = _loc1_.shortCutListCtrl._visible = true;
            _loc1_.titleBtn.visible = true;
            if(_loc1_.preShortcutBtn.isVisible == true)
            {
               _loc1_.preShortcutBtn._visible = true;
            }
         }
         else
         {
            _loc1_.pageDownBtn._visible = _loc1_.pageUpBtn._visible = false;
            _loc1_.addShortcutBtn._visible = _loc1_.addShortcutBtn2._visible = _loc1_.preShortcutBtn._visible = false;
            _loc1_.pageBG._visible = _loc1_.mTextAnim._visible = false;
            _loc1_.titleBtn.visible = false;
         }
      };
      this.UI.myListener.OnGame_SetUIPosition = function(bLocked, _UIName, posXRatio, posYRatio)
      {
         if(_UIName.toLowerCase() == thisObject.UI.UIname.toLowerCase())
         {
            this.transformInterval = setInterval(thisObject,"setTransform",10);
         }
      };
      this.UI.myListener.OnGame_ShortCut_PremiumToggle = function(bShow, flag)
      {
         var _loc1_ = thisObject.container;
         _loc1_.preShortcutBtn._visible = Boolean(Number(bShow));
         _loc1_.preShortcutBtn.selected = flag;
         _loc1_.preShortcutBtn.isVisible = _loc1_.preShortcutBtn._visible;
      };
   }
   function setTransform()
   {
      if(this.transformInterval)
      {
         clearInterval(this.transformInterval);
      }
      var _loc2_ = "DEFAULT";
      if(this.sUIRotate != _loc2_)
      {
         this.sUIRotate = _loc2_;
         this.setUIPosition(this.sUIRotate);
      }
   }
   function setUIPosition(sPosition)
   {
      var _loc2_ = undefined;
      if(sPosition == "TO_THE_LEFT" || sPosition == "TO_THE_RIGHT")
      {
         _loc2_ = 2;
         this.listCtrl.__set__type("transform");
      }
      else
      {
         this.listCtrl.__set__type("default");
      }
      this.invalidateUIElementsPosition();
   }
   function reflowElements(sPosition)
   {
      var _loc4_ = 55;
      var _loc5_ = undefined;
      var _loc2_ = undefined;
      if(sPosition == "TO_THE_LEFT" || sPosition == "TO_THE_RIGHT")
      {
         this.listCtrl.__set__arrangeMode(com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_VERTICAL);
         this.shortCutListCtrl.__set__arrangeMode(com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_VERTICAL);
         this.pageDownBtn._x = 35;
         this.pageDownBtn._y = 61;
         this.pageDownBtn._rotation = -90;
         this.pageUpBtn._x = 77;
         this.pageUpBtn._y = 61;
         this.pageUpBtn._rotation = -90;
         this.mTextAnim._x = 33;
         this.mTextAnim._y = 34;
         this.pageBG._x = this.mTextAnim._x + 10;
         this.pageBG._y = this.mTextAnim._y - 5;
         this.listCtrl._x = -1;
         this.listCtrl._y = 75;
         this.shortCutListCtrl._x = this.listCtrl._x;
         this.addShortcutBtn._x = this.titleBtn._width - 36;
         _loc2_ = this.listCtrl.__get__mode() != "small"?760:425;
         this.shortCutListCtrl._y = _loc2_;
         this.addShortcutBtn._y = _loc2_;
      }
      else
      {
         this.listCtrl.__set__arrangeMode(com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_HORIZONTAL);
         this.shortCutListCtrl.__set__arrangeMode(com.bluehole.tera.contants.ActionBarArrangeMode.ACTION_BAR_ARRANGE_MODE_HORIZONTAL);
         this.pageDownBtn._x = 16;
         this.pageDownBtn._y = 62;
         this.pageDownBtn._rotation = 180;
         this.pageUpBtn._x = 2;
         this.pageUpBtn._y = 3;
         this.pageUpBtn._rotation = 0;
         this.mTextAnim._x = 1;
         this.mTextAnim._y = 22;
         this.pageBG._x = 1;
         this.pageBG._y = 1;
         this.listCtrl._x = 18;
         this.listCtrl._y = 1;
         this.listCtrl.__get__mode() != "small"?760:425;
         this.addShortcutBtn._x = 1;
         this.shortCutListCtrl._x = 261;
         this.shortCutListCtrl._y = this.listCtrl._y + 39;
         this.preShortcutBtn._x = 587;
         this.preShortcutBtn._y = 2;
      }
   }
   function registerTooltip(targetMc)
   {
      var _loc3_ = !this.addShortcutBtn.__get__selected()?lib.info.ToolTipStr.SHORTEXTENABLE:lib.info.ToolTipStr.SHORTEXTDISABLE;
      var _loc2_ = !this.addShortcutBtn2.__get__selected()?lib.info.ToolTipStr.SHORTEXTENABLE:lib.info.ToolTipStr.SHORTEXTDISABLE;
      var _loc4_ = !this.preShortcutBtn.__get__selected()?lib.info.ToolTipStr.SHORTPREENABLE:lib.info.ToolTipStr.SHORTPREDISABLE;
      lib.manager.ToolTip.add(this.addShortcutBtn,_loc3_,1);
      lib.manager.ToolTip.add(this.addShortcutBtn2,_loc2_,1);
      lib.manager.ToolTip.add(this.preShortcutBtn,_loc4_,1);
   }
   function invalidateUIElementsPosition(tweenMove)
   {
      this.tweenMove = tweenMove;
      this.elementsPositionChanged = true;
      this.invalidate();
   }
   function textHandlerChange()
   {
      lib.Debuger.trace("textHandlerChange");
      this.mTextAnim.gotoAndPlay(2);
   }
   function onPageHandler(e)
   {
      var _loc2_ = Number(this.pageTF.text);
      if(e.target == this.pageDownBtn)
      {
         _loc2_ = _loc2_ - 1;
      }
      else
      {
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = _loc2_ % 10;
      if(_loc2_ == 0)
      {
         _loc2_ = 10;
      }
      getURL("FSCommand:ToGameRequestShortCutPage",_loc2_);
      lib.manager.UISound.play("1138");
   }
   function pageHandlerOver()
   {
      if(this.pageBG._currentframe == 1)
      {
         this.pageBG.gotoAndPlay(2);
         this.pageInterval = setInterval(this,"pageTick",300);
      }
   }
   function pageTick()
   {
      if(!this.pageBG.hitTest(_root._xmouse,_root._ymouse))
      {
         clearInterval(this.pageInterval);
         this.pageBG.gotoAndStop(1);
      }
   }
   function onAddShortcutHandler(e)
   {
      var _loc2_ = (gfx.controls.Button)e.target;
      this.registerTooltip(e.target);
      lib.manager.UISound.play("1138");
      getURL("FSCommand:ToGame_ShortCut_EnableExtShortCut",_loc2_.__get__selected());
   }
   function onAddShortcut2Handler(e)
   {
      var _loc2_ = (gfx.controls.Button)e.target;
      this.registerTooltip(e.target);
      lib.manager.UISound.play("1138");
      getURL("FSCommand:ToGame_ShortCut_EnableExtShortCut2",_loc2_.__get__selected());
   }
   function onPremiumShortcutHandler(e)
   {
      var _loc2_ = (gfx.controls.Button)e.target;
      this.registerTooltip(e.target);
      lib.manager.UISound.play("1138");
      getURL("FSCommand:ToGame_PremiumSlotPanel_Toggle",_loc2_.__get__selected());
   }
   function listCtrl_modeChangedHandler()
   {
      this.invalidateUIElementsPosition(false);
   }
   function listCtrl_itemPressHandler(event)
   {
      flash.external.ExternalInterface.call(gfx.events.EventTypes.PRESS,Number(event.index));
   }
   function listCtrl_itemClickHandler(event)
   {
      flash.external.ExternalInterface.call(gfx.events.EventTypes.CLICK,Number(event.index));
   }
   function shortCutListCtrl_itemPressHandler(event)
   {
      flash.external.ExternalInterface.call(gfx.events.EventTypes.PRESS,Number(event.index + 24));
   }
   function shortCutListCtrl_itemClickHandler(event)
   {
      flash.external.ExternalInterface.call(gfx.events.EventTypes.CLICK,Number(event.index + 24));
   }
}
