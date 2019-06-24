function ToGame_Support_Init()
{
   lib.Debuger.trace("ToGame_Support_Init  ");
   fscommand("ToGame_Support_Init");
}
function ToGame_Support_Close()
{
   lib.Debuger.trace("ToGame_Support_Close");
   fscommand("ToGame_Support_Close");
}
function ToGame_Support_RequestContents(id)
{
   lib.Debuger.trace("ToGame_Support_RequestContents  " + id);
   getURL("FSCommand:ToGame_Support_RequestContents",id);
}
function ToGame_Support_Contact()
{
   lib.Debuger.trace("ToGame_Support_Contact");
   fscommand("ToGame_Support_Contact");
}
function selectCategory(id)
{
   ToGame_Support_RequestContents(id);
}
_global.gfxExtensions = true;
var UI = this;
var UIname = "Support";
var bWidgetOpen = false;
UI._visible = false;
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var MAXLINES = 200;
var categoryData = [];
var selectCategoryId = 0;
var write_btn = container_mc.faqContainerMc.writeBtn.txtBtn;
write_btn.setRelease(ToGame_Petition_EditQuestion);
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(_global.gbUIMode && bWidgetOpen)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGameEventChangeUIMode = function(bShow)
{
   if(_global.gbUIMode && bWidgetOpen)
   {
      UI._visible = true;
   }
   else
   {
      UI._visible = false;
   }
};
myListener.OnGame_Support_AddCategory = function(id, __name)
{
   categoryId = Number(id);
   var _loc1_ = container_mc.combobox.data;
   if(_loc1_ == null)
   {
      _loc1_ = [];
   }
   _loc1_.push({id:categoryId,label:__name});
   container_mc.combobox.removeListener(container_mc);
   container_mc.combobox.data = _loc1_;
   container_mc.combobox.addListener(container_mc);
};
myListener.OnGame_Support_SetContents = function(contentsStr)
{
   container_mc.contentsFd.htmlText = contentsStr;
};
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_Support_Close);
var contactBtn = container_mc.contactBtn.txtBtn;
contactBtn.setRelease(ToGame_Support_Contact);
container_mc.onChanged = function()
{
   selectCategory(arguments[1]);
};
container_mc.scrollbar.setTextField(container_mc.contentsFd);
ToGame_Support_Init();
