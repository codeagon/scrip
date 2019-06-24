class gfx.managers.InputDelegate extends gfx.events.EventDispatcher
{
   function InputDelegate()
   {
      super();
      Key.addListener(this);
   }
   static function __get__instance()
   {
      if(gfx.managers.InputDelegate._instance == null)
      {
         gfx.managers.InputDelegate._instance = new gfx.managers.InputDelegate();
      }
      return gfx.managers.InputDelegate._instance;
   }
   function readInput(type, code, scope, callBack)
   {
      return null;
   }
   function inputToNav(type, code, value)
   {
      if(type == "key")
      {
         switch(code)
         {
            case 38:
               return gfx.ui.NavigationCode.UP;
            case 40:
               return gfx.ui.NavigationCode.DOWN;
            case 37:
               return gfx.ui.NavigationCode.LEFT;
            case 39:
               return gfx.ui.NavigationCode.RIGHT;
            case 13:
            case 32:
               return gfx.ui.NavigationCode.ENTER;
            case 8:
               return gfx.ui.NavigationCode.BACK;
            case 9:
               return !Key.isDown(16)?gfx.ui.NavigationCode.TAB:gfx.ui.NavigationCode.SHIFT_TAB;
            case 36:
               return gfx.ui.NavigationCode.HOME;
            case 35:
               return gfx.ui.NavigationCode.END;
            case 34:
               return gfx.ui.NavigationCode.PAGE_DOWN;
            case 33:
               return gfx.ui.NavigationCode.PAGE_UP;
            case 27:
               return gfx.ui.NavigationCode.ESCAPE;
         }
      }
   }
   function onKeyDown()
   {
      this.handleKeyPress("keyDown");
   }
   function onKeyUp()
   {
      this.handleKeyPress("keyUp");
   }
   function handleKeyPress(type)
   {
      var _loc2_ = Key.getCode();
      var _loc3_ = new gfx.ui.InputDetails("key",_loc2_,type,this.inputToNav("key",_loc2_));
      this.dispatchEvent({type:"input",details:_loc3_});
   }
}
