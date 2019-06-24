function debug(str)
{
   trace(str);
}
function setDrag(dragMc, contentMc, maskMc, contentMcHeight)
{
   delete conten.content_mc.onEnterFrame;
   function moving()
   {
      dragTween.stop();
      dragAim = maskMc._y - dragMc.drager_mc._y / dragMoveHeight * contentMoveHeight;
      trace("컨텐츠이동목표점=" + dragAim);
      if(contentMc._y > dragAim)
      {
         upDown = "up";
      }
      else
      {
         upDown = "down";
      }
      contentMc.onEnterFrame = function()
      {
         this._y = this._y + (dragAim - this._y) * 0.2;
         if(upDown == "up")
         {
            if(this._y - 1 <= dragAim)
            {
               delete this.onEnterFrame;
               this._y = dragAim;
            }
         }
         else if(this._y + 1 >= dragAim)
         {
            delete this.onEnterFrame;
            this._y = dragAim;
         }
         trace(this._y);
      };
   }
   if(contentMcHeight - maskMc._height > 0)
   {
      dragMc._visible = true;
   }
   else
   {
      dragMc._visible = false;
   }
   btnSpeed = (1224 - contentMcHeight) / 51;
   trace("컨텐츠=" + contentMc + " , 마스크=" + maskMc);
   contentMc._y = contentMc.fY;
   trace("컨텐츠_y=" + contentMc._y);
   var contentMoveHeight = contentMcHeight - maskMc._height;
   trace("컨텐츠최대이동가능길이=" + contentMoveHeight);
   dragMc.drager_mc._y = 0;
   var dragMoveHeight = dragMc.dragBg_mc._height - dragMc.drager_mc.hit_mc._height + 2;
   dragMc.drager_mc.hit_mc.onRollOver = function()
   {
      this._parent.gotoAndStop(2);
   };
   dragMc.drager_mc.hit_mc.onRollOut = function()
   {
      this._parent.gotoAndStop(1);
   };
   dragMc.drager_mc.hit_mc.onPress = function()
   {
      this._parent.gotoAndStop(2);
      startDrag(this._parent,0,0,0,0,dragMoveHeight + 1);
      dragId = setInterval(moving,50);
   };
   dragMc.drager_mc.hit_mc.onRelease = dragMc.drager_mc.hit_mc.onReleaseOutside = function()
   {
      this._parent.gotoAndStop(1);
      this._parent.stopDrag();
      moving();
      clearInterval(dragId);
   };
   dragMc.dragTop_btn.hit_mc.onRollOver = function()
   {
      this._parent.gotoAndStop(2);
   };
   dragMc.dragTop_btn.hit_mc.onRollOut = function()
   {
      this._parent.gotoAndStop(1);
   };
   dragMc.dragTop_btn.hit_mc.onPress = function()
   {
      this._parent.gotoAndStop(2);
      this.onEnterFrame = function()
      {
         dragMc.drager_mc._y = dragMc.drager_mc._y - btnSpeed;
         if(dragMc.drager_mc._y <= 0)
         {
            dragMc.drager_mc._y = 0;
         }
         moving();
      };
   };
   dragMc.dragTop_btn.hit_mc.onRelease = dragMc.dragTop_btn.hit_mc.onReleaseOutside = function()
   {
      delete this.onEnterFrame;
      this._parent.gotoAndStop(1);
   };
   dragMc.dragBottom_btn.hit_mc.onRollOver = function()
   {
      this._parent.gotoAndStop(2);
   };
   dragMc.dragBottom_btn.hit_mc.onRollOut = function()
   {
      this._parent.gotoAndStop(1);
   };
   dragMc.dragBottom_btn.hit_mc.onPress = function()
   {
      this._parent.gotoAndStop(2);
      this.onEnterFrame = function()
      {
         dragMc.drager_mc._y = dragMc.drager_mc._y + btnSpeed;
         if(dragMc.drager_mc._y >= dragMoveHeight)
         {
            dragMc.drager_mc._y = dragMoveHeight;
         }
         moving();
      };
   };
   dragMc.dragBottom_btn.hit_mc.onRelease = dragMc.dragBottom_btn.hit_mc.onReleaseOutside = function()
   {
      delete this.onEnterFrame;
      this._parent.gotoAndStop(1);
   };
}
function rePositionParts(h)
{
   var _loc2_ = h - 40;
   trace("바디길이=" + _loc2_);
   var _loc1_ = _loc2_ - 16;
   drag_mc.dragBg_mc.dragBgBody_mc._y = 8;
   drag_mc.dragBg_mc.dragBgBody_mc._height = _loc1_;
   drag_mc.dragBg_mc.dragBgBottom_mc._y = _loc1_ + 8;
   drag_mc.dragBottom_btn._y = drag_mc.dragBg_mc._height + 3;
}
conten = this._parent[this._targetInstanceName];
conten.content_mc.fY = conten.content_mc._y;
var dragTween;
var dragId = 1;
var callback = function(prop, oldV, newV)
{
   trace("속성=" + prop + ", " + "변하기전속성=" + oldV + "," + "변한속성=" + newV);
   setDrag(drag_mc,conten.content_mc,conten.mask_mc,newV);
   return newV;
};
this.watch("__height",callback);
rePositionParts(scroller_height);
setDrag(drag_mc,conten.content_mc,conten.mask_mc,__height);
