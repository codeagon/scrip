class g4.manager.MouseEventManager
{
   static var RIGHT_BUTTON_DOWN = "rightButtonDown";
   static var RIGHT_BUTTON_CLICK = "rightButtonClick";
   static var LEFT_BUTTON_DOUBLE_CLICK = "leftButtonDoubleClick";
   var _clickCnt = 0;
   var _doubleClickCheckCnt = 0;
   var _doubleClickInterval = new Array();
   var _mouseClicked = false;
   var _currentOver = null;
   var _clickedAlignUI = null;
   var _currentUI = null;
   function MouseEventManager()
   {
   }
   static function getInstance()
   {
      return g4.manager.MouseEventManager._instance = g4.manager.MouseEventManager._instance != null?g4.manager.MouseEventManager._instance:new g4.manager.MouseEventManager();
   }
   function init(container, baseUI)
   {
      this._container = container;
      this._baseUI = baseUI;
      this._mouseHere_mc = container.mouseHere_mc;
      this._container_battleUp_mc = container.container_battleUp_mc;
      this._container_normal_mc = container.container_normal_mc;
      this._container_chat_mc = container.container_chat_mc;
      this._doubleClickInterval[0] = 1;
      _root.freezeGame = g4.util.Delegate.create(this,this.freezeGame);
      Mouse.addListener(g4.manager.MouseEventManager._instance);
   }
   function addEventListener(target, eventType, scope, method)
   {
      var _loc2_ = targetPath(target);
      if(this._listener[_loc2_][eventType])
      {
         return undefined;
      }
      if(this._listener == null)
      {
         this._listener = new Object();
      }
      if(this._listener[_loc2_] == null)
      {
         this._listener[_loc2_] = new Object();
      }
      if(this._listener[_loc2_][eventType] == null)
      {
         this._listener[_loc2_][eventType] = new Array();
      }
      this._listener[_loc2_][eventType].push({scope:scope,method:method,target:target});
   }
   function removeEventListener(target, eventType, scope, method)
   {
      var _loc6_ = targetPath(target);
      var _loc3_ = this._listener[_loc6_][eventType];
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].scope == scope && _loc3_[_loc2_].method == method)
         {
            _loc3_.splice(_loc2_,1);
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc3_.length <= 0)
      {
         this._listener[_loc6_][eventType] = null;
      }
      else
      {
         this._listener[_loc6_][eventType] = _loc3_;
      }
   }
   function dispatchEvent(targetPath, eventType)
   {
      var _loc3_ = this._listener[targetPath][eventType];
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         var _loc5_ = _loc3_[_loc2_].scope;
         var _loc4_ = _loc3_[_loc2_].method;
         _loc4_.apply(_loc5_,[{target:_loc3_[_loc2_].target}]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function freezeGame(bTrue)
   {
      _global.freezeGame = bTrue;
      this._mouseClicked = false;
   }
   function onMouseWheel(Delta, target)
   {
      _root.OnGameEvent("OnGame_MouseWheel",Delta,target);
   }
   function onMouseMove()
   {
      if(_global.gbUIMode)
      {
         var _loc4_ = Mouse.getTopMostEntity(false);
         var _loc5_ = Mouse.getTopMostEntity();
         if(_loc4_._name != null && _loc4_._name.substr(0,4) == "SLOT" && _loc4_._parent.effect != false)
         {
            if(this._currentOver != _loc4_._parent.FX_OVER)
            {
               this._currentOver._visible = false;
            }
            _loc4_._parent.FX_OVER._visible = true;
            this._currentOver = _loc4_._parent.FX_OVER;
         }
         else
         {
            this._currentOver._visible = false;
            this._currentOver = null;
         }
         if(this._mouseHere_mc._visible)
         {
            this._mouseHere_mc._x = _root._xmouse;
            this._mouseHere_mc._y = _root._ymouse;
         }
         _root.OnGameEvent("OnGame_MouseMove",_loc5_);
      }
   }
   function onMouseDown(button, targetPath, mouseIdx, x, y, dblClick)
   {
      if(_global.freezeGame == true)
      {
         return undefined;
      }
      var targetMc = eval(targetPath);
      var splited = targetPath == null?null:targetPath.split(".");
      var depthProcessTargetContainer = this._container[splited[1]];
      if(depthProcessTargetContainer == this._container_battleUp_mc || depthProcessTargetContainer == this._container_normal_mc)
      {
         var top = null;
         var depth1 = this._container_battleUp_mc.getDepth();
         var depth2 = this._container_normal_mc.getDepth();
         if(depth1 > depth2)
         {
            top = depth1;
         }
         else
         {
            top = depth2;
         }
         depthProcessTargetContainer.swapDepths(top);
      }
      else if(depthProcessTargetContainer == this._container_chat_mc)
      {
         depthProcessTargetContainer[splited[2]][splited[3]].swapDepths(depthProcessTargetContainer[splited[2]].getNextHighestDepth());
      }
      if(!this._mouseClicked)
      {
         if(!targetMc.clickArea)
         {
            this.ProcessWindowDepth(depthProcessTargetContainer);
         }
         if(this._baseUI.checkDisableUI(splited[2]) == null)
         {
            _root.OnGameEvent("OnGame_MouseDown",button,targetMc,targetPath);
            if(button == Mouse.RIGHT)
            {
               this.dispatchEvent(targetPath(targetMc),g4.manager.MouseEventManager.RIGHT_BUTTON_DOWN);
            }
            if(targetMc.onPressAux != null && button != 1)
            {
               targetMc.onPressAux(mouseIdx,1,button);
            }
         }
         else if(depthProcessTargetContainer[splited[2]].container_mc.x_mc.hitTest(_root._xmouse,_root._ymouse,true))
         {
            depthProcessTargetContainer[splited[2]].container_mc.x_mc.onRelease();
         }
      }
      this._clickCnt = this._clickCnt + 1;
      if(this._clickCnt == 1)
      {
         this._doubleClickInterval[0] = setInterval(g4.util.Delegate.create(this,this.doubleClickCheck),50,targetMc,button);
      }
      this._mouseClicked = true;
      this._pressedTarget = Mouse.getTopMostEntity(false);
   }
   function onMouseUp(button, targetPath, mouseIdx, x, y)
   {
      if(_global.freezeGame == true)
      {
         return undefined;
      }
      this._mouseClicked = false;
      _root.OnGameEvent("OnGame_MouseUp",button,eval(targetPath));
      var target = Mouse.getTopMostEntity(false);
      if(button == Mouse.RIGHT && target == this._pressedTarget)
      {
         this.dispatchEvent(targetPath(target),g4.manager.MouseEventManager.RIGHT_BUTTON_CLICK);
      }
      this._pressedTarget = null;
   }
   function ProcessWindowDepth(targetContainer)
   {
      var _loc4_ = null;
      var _loc5_ = undefined;
      var _loc7_ = false;
      var _loc8_ = new Array();
      for(var _loc9_ in targetContainer)
      {
         var _loc3_ = targetContainer[_loc9_];
         if(typeof _loc3_ == "movieclip" && _loc3_.hit.hitTest(_root._xmouse,_root._ymouse,true) && _loc3_._visible == true)
         {
            _loc7_ = true;
            _loc8_.push(_loc3_);
            if(_loc4_ == null)
            {
               _loc4_ = _loc3_.getDepth();
               _loc5_ = _loc3_;
            }
            else if(_loc3_.getDepth() > _loc4_)
            {
               _loc4_ = _loc3_.getDepth();
               _loc5_ = _loc3_;
            }
         }
      }
      if(targetContainer == this._container_normal_mc)
      {
         var _loc11_ = this._clickedAlignUI;
         var _loc10_ = _loc5_;
         var _loc13_ = this._baseUI.GetRegisterUIData(this._clickedAlignUI._name);
         var _loc12_ = this._baseUI.GetRegisterUIData(_loc5_._name);
         if(this._clickedAlignUI != _loc5_)
         {
            this._clickedAlignUI = _loc10_;
         }
      }
      if(_loc5_ != null && targetContainer != null)
      {
         _loc5_.swapDepths(targetContainer.getNextHighestDepth());
      }
      this._currentUI = _loc5_;
      return _loc7_;
   }
   function doubleClickCheck(target, button)
   {
      this._doubleClickCheckCnt = this._doubleClickCheckCnt + 1;
      if(this._doubleClickCheckCnt >= 5)
      {
         clearInterval(this._doubleClickInterval[0]);
         this._doubleClickInterval.shift();
         this._doubleClickInterval[0] = 1;
         this._doubleClickCheckCnt = 0;
         this._clickCnt = 0;
      }
      else if(this._clickCnt == 2)
      {
         _root.OnGameEvent("OnGame_DoubleClick",target);
         if(button == Mouse.LEFT)
         {
            this.dispatchEvent(targetPath(target),g4.manager.MouseEventManager.LEFT_BUTTON_DOUBLE_CLICK);
         }
         this._clickCnt = 0;
         clearInterval(this._doubleClickInterval[0]);
         this._doubleClickInterval.shift();
         this._doubleClickInterval[0] = 1;
         this._doubleClickCheckCnt = 0;
      }
   }
}
