class g4.manager.TooltipManager
{
   static var TOOL_TIP_TYPE_PREMIUM_WINDOW = 13;
   static var TOOL_TIP_TYPE_DELIVERY = 14;
   var _tooltiplist = {};
   function TooltipManager()
   {
   }
   static function getInstance()
   {
      return g4.manager.TooltipManager._instance = g4.manager.TooltipManager._instance != null?g4.manager.TooltipManager._instance:new g4.manager.TooltipManager();
   }
   function __get__tooltipList()
   {
      return this._tooltiplist;
   }
   function init(tooltipmodule)
   {
      this._tooltipmodule = tooltipmodule;
   }
   function add(targetMc, value, type, iconmc)
   {
      if(this._tooltiplist == undefined)
      {
         this._tooltiplist = {};
      }
      this._tooltiplist[String(targetMc)] = {tg:targetMc,val:value,type:type,iconhas:iconmc != undefined};
      if(targetMc && this._tooltipmodule.getSelectTarget().tg == targetMc)
      {
         this._tooltipmodule.showToolTip(this._tooltiplist[String(targetMc)]);
      }
      if(iconmc != undefined)
      {
         this._tooltiplist[String(targetMc)].ic = iconmc;
      }
   }
   function remove(targetMc)
   {
      var _loc2_ = this._tooltiplist[String(targetMc)];
      if(_loc2_ != undefined)
      {
         if(this._tooltipmodule.getSelectTarget() == _loc2_)
         {
            this._tooltipmodule.directHide();
         }
         delete this._tooltiplist[String(targetMc)];
         this.refresh();
      }
   }
   function show(object, type, value)
   {
      this._tooltipmodule.directShow(object,type,value);
   }
   function hide()
   {
      this._tooltipmodule.directHide();
   }
   function move(x, y)
   {
      this._tooltipmodule.toolTipMove(x,y);
   }
   function clear()
   {
      this._tooltiplist = {};
   }
   function refresh()
   {
      this.invalidateTooltipList();
   }
   function invalidateTooltipList()
   {
      if(!g4.manager.TooltipManager._instance)
      {
         g4.manager.TooltipManager._instance = new g4.manager.TooltipManager();
      }
      if(this.invalidationIntervalID)
      {
         return undefined;
      }
      this.invalidationIntervalID = setInterval(g4.manager.TooltipManager._instance,"refreshNow",1);
   }
   function refreshNow()
   {
      clearInterval(this.invalidationIntervalID);
      delete this.invalidationIntervalID;
      for(var _loc3_ in this._tooltiplist)
      {
         var _loc2_ = this._tooltiplist[_loc3_];
         if(_loc2_.tg.enabled == undefined || _loc2_.iconhas && _loc2_.ic.enabled == undefined)
         {
            false;
         }
      }
   }
   function addUiTooltip(viewId, mc_target, value, type)
   {
      if(mc_target instanceof g4.core.UIComponent)
      {
         (g4.core.UIComponent)mc_target.addEventListener("rollOver",this,g4.util.Delegate.create(this,this.showUiTooltip,viewId,mc_target,value,type));
         (g4.core.UIComponent)mc_target.addEventListener("disabledRollOver",this,g4.util.Delegate.create(this,this.showUiTooltip,viewId,mc_target,value,type));
         (g4.core.UIComponent)mc_target.addEventListener("rollOut",this,this.hideToolTip);
         (g4.core.UIComponent)mc_target.addEventListener("disabledRollOut",this,this.hideToolTip);
         (g4.core.UIComponent)mc_target.addEventListener("dragOut",this,this.hideToolTip);
      }
      else
      {
         mc_target.onRollOver = g4.util.Delegate.create(this,this.showUiTooltip,viewId,mc_target,value,type);
         mc_target.onRollOut = g4.util.Delegate.create(this,this.hideToolTip);
         mc_target.onDragOut = g4.util.Delegate.create(this,this.hideToolTip);
      }
   }
   function addMessageTooltip(mc_target, message)
   {
      if(mc_target instanceof g4.core.UIComponent)
      {
         (g4.core.UIComponent)mc_target.addEventListener("rollOver",this,g4.util.Delegate.create(this,this.showMessageTooltip,mc_target,message));
         (g4.core.UIComponent)mc_target.addEventListener("disabledRollOver",this,g4.util.Delegate.create(this,this.showMessageTooltip,mc_target,message));
         (g4.core.UIComponent)mc_target.addEventListener("rollOut",this,this.hideToolTip);
         (g4.core.UIComponent)mc_target.addEventListener("disabledRollOut",this,this.hideToolTip);
         (g4.core.UIComponent)mc_target.addEventListener("dragOut",this,this.hideToolTip);
      }
      else
      {
         mc_target.onRollOver = g4.util.Delegate.create(this,this.showMessageTooltip,mc_target,message);
         mc_target.onRollOut = g4.util.Delegate.create(this,this.hideToolTip);
         mc_target.onDragOut = g4.util.Delegate.create(this,this.hideToolTip);
      }
   }
   function showUiTooltip(viewId, mc_target, value, type)
   {
      this._tooltipmodule.showUiTooltip(viewId,mc_target,value,type);
   }
   function showMessageTooltip(mc_target, message)
   {
      this._tooltipmodule.showMessageTooltip(mc_target,message);
   }
   function hideToolTip()
   {
      this._tooltipmodule.hideToolTip(true);
   }
}
