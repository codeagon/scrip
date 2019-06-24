function ToGame_InGameManageTool_Init()
{
   fscommand("ToGame_InGameManageTool_Init");
   lib.Debuger.trace("ToGame_InGameManageTool_Init");
}
function ToGame_InGameManageTool_CloseUI()
{
   fscommand("ToGame_InGameManageTool_CloseUI");
   lib.Debuger.trace("ToGame_InGameManageTool_CloseUI");
}
function ToGame_InGameManageTool_Execute()
{
   if(command != "" && command != undefined)
   {
      var _loc1_ = command + "\t" + container_mc.inputBox.text + "\t" + container_mc.memoFd.text;
      getURL("FSCommand:ToGame_InGameManageTool_Execute",_loc1_);
      lib.Debuger.trace("ToGame_InGameManageTool_Execute : " + _loc1_);
   }
}
function onChanged(target, id, index)
{
   command = target.value;
   container_mc.inputBox.text = "";
   if(index != undefined)
   {
      container_mc.descFd.text = commandDesc[index];
   }
}
var UI = this;
var bWidgetOpen = true;
var UIname = "InGameManageTool";
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var command = "";
var commandDesc;
container_mc.memoFd.text = "";
myListener.OnGameEventShowWindow = function(widgetName, bShow)
{
   if(widgetName.toLowerCase() == UIname.toLowerCase())
   {
      bWidgetOpen = bShow;
      if(bShow)
      {
         UI._visible = true;
      }
      else
      {
         UI._visible = false;
      }
   }
};
myListener.OnGame_InGameManageTool_SetCommand = function(commands)
{
   var _loc4_ = lib.util.ExtString.split(commands,"\n");
   commandDesc = [];
   command = "";
   container_mc.memoFd.text = "";
   container_mc.inputBox.text = "";
   var _loc3_ = [];
   var _loc2_ = _loc4_.shift();
   while(_loc2_ != undefined)
   {
      var _loc1_ = lib.util.ExtString.split(_loc2_,"\t");
      _loc3_.push(_loc1_[0]);
      commandDesc.push(_loc1_[1]);
      _loc2_ = _loc4_.shift();
   }
   container_mc.combobox.cation = "명령어를 입력하세요";
   container_mc.combobox.data = _loc3_;
};
var execute_btn = new lib.util.TxtAniBtn(container_mc.execute_mc,container_mc.execute_txt,20,27,33,43);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_InGameManageTool_CloseUI);
execute_btn.setRelease(ToGame_InGameManageTool_Execute);
container_mc.inputBox.onSetFocus = function()
{
   _global.inputing = true;
};
container_mc.inputBox.onKillFocus = function()
{
   _global.inputing = false;
};
container_mc.memoFd.onSetFocus = function()
{
   _global.inputing = true;
};
container_mc.memoFd.onKillFocus = function()
{
   _global.inputing = false;
};
container_mc.combobox.rowMax = 10;
container_mc.combobox.addListener(this);
ToGame_InGameManageTool_Init();
