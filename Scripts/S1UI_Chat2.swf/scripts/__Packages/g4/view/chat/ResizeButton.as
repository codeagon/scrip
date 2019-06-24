class g4.view.chat.ResizeButton extends g4.core.SimpleView
{
   var tabID = -1;
   var minWidth = 0;
   var minHeight = 0;
   var maxWidth = 0;
   var maxHeight = 0;
   var regMouseX = 0;
   var regMouseY = 0;
   var regX = 0;
   var regY = 0;
   var regWidth = 0;
   var regHeight = 0;
   var minY = 0;
   var maxY = 0;
   var scaleRatio = 1;
   function ResizeButton(targetMovieClip, minWidth, minHeight, maxWidth, maxHeight, resizingStartHandler, resizingHandler, resizingEndHandler, container)
   {
      super(targetMovieClip);
      this.minWidth = minWidth;
      this.minHeight = minHeight;
      this.maxWidth = maxWidth;
      this.maxHeight = maxHeight;
      this.resizingStartHandler = resizingStartHandler;
      this.resizingHandler = resizingHandler;
      this.resizingEndHandler = resizingEndHandler;
      this.container = container;
      this.configUI();
   }
   function configUI()
   {
      lib.manager.ToolTip.add(this.__get__targetMovieClip(),lib.util.UIString.getUIString("$031077"),1);
      this.__get__targetMovieClip().onRollOver = gfx.utils.Delegate.create(this,function()
      {
         this.targetMovieClip.gotoAndStop(2);
      }
      );
      this.__get__targetMovieClip().onRollOut = gfx.utils.Delegate.create(this,function()
      {
         this.targetMovieClip.gotoAndStop(1);
      }
      );
      this.__get__targetMovieClip().onPress = gfx.utils.Delegate.create(this,function()
      {
         lib.manager.ToolTip.hide(this.targetMovieClip);
         if(g4.model.GameModel.chatModel.__get__locked())
         {
            return undefined;
         }
         this.targetMovieClip.gotoAndStop(3);
         var _loc3_ = g4.model.GameModel.chatModel.getChatTabData(this.tabID);
         this.regX = this.container._x;
         this.regY = this.container._y;
         this.regWidth = _loc3_.width;
         this.regHeight = _loc3_.height;
         this.regMouseX = _root._xmouse;
         this.regMouseY = _root._ymouse;
         this.scaleRatio = this.container._xscale / 100;
         this.minY = this.regY + this.regHeight * this.scaleRatio - this.maxHeight * this.scaleRatio;
         this.maxY = this.regY + this.regHeight * this.scaleRatio - this.minHeight * this.scaleRatio;
         g4.model.GameModel.chatModel.startResizing(this.tabID);
         this.resizingStartHandler();
         g4.util.UIUtil.addEnterFrameListener(this,"onEnterFrameHandler_forResizing");
      }
      );
      this.__get__targetMovieClip().onRelease = this.__get__targetMovieClip().onReleaseOutside = gfx.utils.Delegate.create(this,function()
      {
         this.targetMovieClip.gotoAndStop(1);
         g4.util.UIUtil.removeEnterFrameListener(this,"onEnterFrameHandler_forResizing");
         this.calculateSize(true);
         this.resizingEndHandler();
         g4.model.GameModel.chatModel.endResizing();
      }
      );
   }
   function onEnterFrameHandler_forResizing()
   {
      this.calculateSize(false);
   }
   function calculateSize(save)
   {
      var _loc8_ = _root._xmouse - this.regMouseX;
      var _loc7_ = _root._ymouse - this.regMouseY;
      var _loc9_ = _loc8_ / this.scaleRatio;
      var _loc10_ = _loc7_ / this.scaleRatio;
      var _loc6_ = this.regX;
      var _loc5_ = Math.max(this.minY,Math.min(this.maxY,this.regY + _loc7_));
      var _loc4_ = Math.max(this.minWidth,Math.min(this.maxWidth,this.regWidth + _loc9_));
      var _loc3_ = Math.max(this.minHeight,Math.min(this.maxHeight,this.regHeight - _loc10_));
      this.resizingHandler(_loc6_,_loc5_,_loc4_,_loc3_);
      if(save)
      {
         g4.model.GameModel.chatModel.saveChatTabPositionAndSize(this.tabID,_loc6_,_loc5_,_loc4_,_loc3_);
      }
   }
   function setTabID(tabID)
   {
      this.tabID = tabID;
   }
}
