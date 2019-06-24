class g4.view.chat.OptionButton extends g4.core.SimpleView
{
   var menuShown = false;
   var rollOver = false;
   function OptionButton(targetMovieClip)
   {
      super(targetMovieClip);
      this.button = targetMovieClip;
      this.configUI();
   }
   function configUI()
   {
      this.configOptionButton();
      this.updateByUIMode();
      g4.model.GameModel.addEventListener(g4.view.ViewID.CHAT_2,g4.model.GameModelEventType.MAIN_UI_MODE_CHANGED,this,"model_mainUIModeChangeHandler");
   }
   function configOptionButton()
   {
      this.button.onRollOver = gfx.utils.Delegate.create(this,function()
      {
         lib.manager.ToolTip.add(this.button,this.toolTipText,1);
         this.rollOver = true;
         this.updateButtonByState();
      }
      );
      this.button.onRollOut = this.button.onReleseOutside = gfx.utils.Delegate.create(this,function()
      {
         this.rollOver = false;
         this.updateButtonByState();
      }
      );
      this.button.onPress = gfx.utils.Delegate.create(this,function()
      {
         lib.manager.ToolTip.remove(this.button);
         this.toggleMenu();
      }
      );
      lib.manager.ToolTip.add(this.button,this.toolTipText,1);
   }
   function updateButtonByState()
   {
      if(this.menuShown)
      {
         this.button.gotoAndStop(3);
      }
      else if(this.rollOver)
      {
         this.button.gotoAndStop(2);
      }
      else
      {
         this.button.gotoAndStop(1);
      }
   }
   function updateByUIMode()
   {
      if(g4.model.GameModel.mainModel.uiMode)
      {
         this.button._visible = true;
      }
      else
      {
         this.button._visible = false;
      }
   }
   function toggleMenu()
   {
      if(this.menuShown)
      {
         this.closeMenu();
      }
      else
      {
         this.showMenu();
      }
   }
   function showMenu()
   {
      lib.manager.UISound.play(lib.manager.UISound.CHAT_OPTION);
      g4.model.GameModel.mainModel.openInteractionMenuCommon(this.getMenuDataArray(),gfx.utils.Delegate.create(this,this.interactionMenu_closeHandler),gfx.utils.Delegate.create(this,this.interactionMenu_openHandler));
   }
   function closeMenu()
   {
      lib.manager.UISound.play(lib.manager.UISound.CHAT_OPTION);
      g4.model.GameModel.mainModel.closeInteractionMenu();
   }
   function interactionMenu_openHandler()
   {
      this.menuShown = true;
      this.updateButtonByState();
   }
   function interactionMenu_closeHandler(data)
   {
      this.menuShown = false;
      this.updateButtonByState();
      this.executeCommand(data);
   }
   function getMenuDataArray()
   {
      return null;
   }
   function executeCommand(command)
   {
   }
   function model_mainUIModeChangeHandler(event)
   {
      this.updateByUIMode();
   }
}
