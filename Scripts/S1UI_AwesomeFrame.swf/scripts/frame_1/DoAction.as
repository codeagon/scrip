function ToGame_AwesomeFrame_Init()
{
   lib.Debuger.trace("ToGame_AwesomeFrame_Init");
   fscommand("ToGame_AwesomeFrame_Init");
}
function ToGame_AwesomeFrame_CloseUI()
{
   lib.Debuger.trace("ToGame_AwesomeFrame_CloseUI");
   fscommand("ToGame_AwesomeFrame_CloseUI");
}
function ToGame_AwesomeFrame_MouseUp(btn, x, y)
{
   lib.Debuger.trace("ToGame_AwesomeFrame_MouseUp " + btn + "/" + x + "/" + y);
   getURL("FSCommand:ToGame_AwesomeFrame_MouseUp",btn + "\t" + x + "\t" + y);
}
function ToGame_AwesomeFrame_MouseDown(btn, x, y)
{
   lib.Debuger.trace("ToGame_AwesomeFrame_MouseDown " + btn + "/" + x + "/" + y);
   getURL("FSCommand:ToGame_AwesomeFrame_MouseDown",btn + "\t" + x + "\t" + y);
}
function ToGame_AwesomeFrame_MouseMove(x, y)
{
   lib.Debuger.trace("ToGame_AwesomeFrame_MouseMove " + x + "/" + y);
   getURL("FSCommand:ToGame_AwesomeFrame_MouseMove",x + "\t" + y);
}
function ToGame_AwesomeFrame_MouseWheel(d)
{
   lib.Debuger.trace("ToGame_AwesomeFrame_MouseWheel " + d);
   getURL("FSCommand:ToGame_AwesomeFrame_MouseWheel",d);
}
function ToGame_AwesomeFrame_Focus(type)
{
   lib.Debuger.trace("ToGame_AwesomeFrame_Focus" + type);
   getURL("FSCommand:ToGame_AwesomeFrame_Focus",type);
}
stop();
var UI = this;
var UIname = "AwesomeFrame";
var bWidgetOpen = false;
UI._visible = false;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var m_Focus = false;
var x_btn = new lib.util.TxtBtn(container_mc.xmc);
container_mc.UIDrager.setData(UIName,UI);
container_mc.titleFd.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bWidgetOpen)
      {
         myListener.OnGame_ChangeResolution(g4.model.GameModel.mainModel.resolutionX,g4.model.GameModel.mainModel.resolutionY);
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGame_ChangeResolution = function(w, h, f)
{
   var _loc1_ = Stage.height / h;
   var _loc2_ = Stage.width / w;
   UI._xscale = _loc2_ * 100;
   UI._yscale = _loc1_ * 100;
};
myListener.OnGame_AwesomeFrame_SetTitle = function(_title, emblem)
{
   lib.manager.UISkin.drawEmblem(UI,emblem);
   container_mc.titleFd.htmlText = _title;
};
myListener.OnGame_AwesomeFrame_DrawTexture = function(texture)
{
   container_mc.loadingMc.gotoAndPlay(2);
   lib.util.DrawBitmap.draw(container_mc.loaderMc,texture);
};
myListener.OnGame_AwesomeFrame_BgSize = function(w, h)
{
   w = Number(w) + 11;
   h = Number(h) + 45;
   container_mc.UIDrager._width = w;
   container_mc.titleFd._width = w - 50;
   container_mc.xmc._x = w - 6 - container_mc.xmc._width;
   container_mc.frameBg._width = w;
   container_mc.frameBg._height = h;
   hit._width = w;
   hit._height = h;
   container_mc.loadingMc._x = container_mc.loaderMc._x + w / 2 - 11;
   container_mc.loadingMc._y = container_mc.loaderMc._y + h / 2 - 45;
};
var isDrag = false;
myListener.OnGame_MouseDown = function(button, target)
{
   if(target._parent == container_mc.loaderMc)
   {
      isDrag = true;
      m_Focus = true;
      ToGame_AwesomeFrame_Focus(1);
      ToGame_AwesomeFrame_MouseDown(button,container_mc.loaderMc._xmouse,container_mc.loaderMc._ymouse);
   }
   else
   {
      m_Focus = false;
      ToGame_AwesomeFrame_Focus(0);
   }
};
myListener.OnGame_MouseUp = function(button, target)
{
   if(target._parent == container_mc.loaderMc || isDrag)
   {
      ToGame_AwesomeFrame_MouseUp(button,container_mc.loaderMc._xmouse,container_mc.loaderMc._ymouse);
   }
   isDrag = false;
};
myListener.OnGame_MouseMove = function(target)
{
   if(m_Focus == true && target._parent == container_mc.loaderMc || isDrag)
   {
      ToGame_AwesomeFrame_MouseMove(container_mc.loaderMc._xmouse,container_mc.loaderMc._ymouse);
   }
};
myListener.OnGame_MouseWheel = function(d)
{
   var _loc1_ = Mouse.getTopMostEntity();
   if(_loc1_._parent == container_mc.loaderMc)
   {
      ToGame_AwesomeFrame_MouseWheel(d);
   }
};
myListener.OnGame_AwesomeFrame_DebugeMode = function(flag)
{
   if(flag == "1")
   {
      var _loc2_ = 1;
      while(_loc2_ < 5)
      {
         UI["debugBtn" + _loc2_]._visible = true;
         var _loc3_ = UI["debugBtn" + _loc2_].txtBtn;
         _loc3_.btn.id = _loc2_;
         _loc3_.btn.onRelease2 = function()
         {
            getURL("FSCommand:ToGame_AwesomeFrame_DebugeEvent",this.id);
            lib.Debuger.trace("ToGame_AwesomeFrame_DebugeEvent " + this.id);
         };
         _loc2_ = _loc2_ + 1;
      }
   }
   else
   {
      _loc2_ = 1;
      while(_loc2_ < 5)
      {
         UI["debugBtn" + _loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
};
myListener.OnGame_AwesomeFrame_DebugeMode(0);
x_btn.setRelease(ToGame_AwesomeFrame_CloseUI);
ToGame_AwesomeFrame_Init();
