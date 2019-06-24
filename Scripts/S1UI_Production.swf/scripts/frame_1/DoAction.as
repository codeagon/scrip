var UI = this;
UI._visible = false;
var UIname = "Production";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
var completionSlotName = "ProductionCompletion__";
var extractionSlotName = "ProductionExtraction__";
slotName = extractionSlotName;
var i = 0;
while(i < 18)
{
   var c = i % 2;
   var r = int(i / 2);
   var slotContainer = container_mc.tab1Contents_mc;
   slotContainer._visible = true;
   var slot = slotContainer[slotName + i];
   slot.setLineNum(2);
   slot.drag = false;
   slot.effect = false;
   slot.display = false;
   slot.empty = true;
   i++;
}
var myListener = new Object();
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
         historySave_All();
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
myListener.OnGame_Production_SetTab = function(tabNo)
{
   if(Number(tabNo) == 1)
   {
      return undefined;
   }
   if(Number(tabNo) == 2)
   {
      tabNo = 1;
   }
   tab.setTab(Number(tabNo));
};
myListener.OnGame_Production_SetTabInfo = function()
{
   var _loc3_ = [];
   var _loc2_ = 0;
   while(arguments[_loc2_] != undefined)
   {
      _loc3_.push(arguments[_loc2_]);
      _loc2_ = _loc2_ + 1;
   }
   container_mc.tabBtn.labels = _loc3_;
   tab = container_mc.tabBtn.tab;
   tab.setRelease(release);
   tab.setTab(0,1);
};
myListener.OnGame_Production_SetCompletionThing = function(dataList)
{
   var _loc5_ = dataList.split("\n");
   if(_loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
   {
      _loc5_.splice(_loc5_.length - 1,1);
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc5_.length)
   {
      var _loc3_ = _loc5_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc7_ = Number(_loc3_[3]);
         var _loc6_ = Number(_loc3_[4]);
         var _loc2_ = container_mc.tab0Contents_mc[completionSlotName + _loc4_];
         _loc2_.SLOT.enabled = true;
         _loc2_.Slot.id = _loc2_.id = _loc3_[0];
         _loc2_.draw(_loc3_[1]);
         _loc2_.upText = _loc3_[2];
         _loc2_.effect = true;
         _loc2_.showBg();
         _loc2_.drag = false;
         _loc2_.Slot.hideBg();
         _loc2_.showGage();
         _loc2_.setGage(_loc7_,_loc6_);
         _loc2_.Slot.onPress2 = _loc2_.onPress2 = function()
         {
            ToGame_Production_RequestShowProductionListUI(this.id);
         };
         lib.manager.ToolTip.add(_loc2_.SLOT,_loc3_[0],2);
      }
      _loc4_ = _loc4_ + 1;
   }
};
myListener.OnGame_Production_SetExtractionThing = function(dataList)
{
   var _loc5_ = dataList.split("\n");
   if(_loc5_[_loc5_.length - 1] == "undefined" || _loc5_[_loc5_.length - 1] == "")
   {
      _loc5_.splice(_loc5_.length - 1,1);
   }
   var _loc4_ = 0;
   while(_loc4_ < _loc5_.length)
   {
      var _loc3_ = _loc5_[_loc4_].split("\t");
      if(_loc3_.length != 1)
      {
         var _loc7_ = Number(_loc3_[3]);
         var _loc6_ = Number(_loc3_[4]);
         var _loc2_ = container_mc.tab1Contents_mc[extractionSlotName + _loc4_];
         _loc2_.SLOT.enabled = true;
         _loc2_.Slot.id = _loc2_.id = _loc3_[0];
         _loc2_.draw(_loc3_[1]);
         _loc2_.upText = _loc3_[2];
         _loc2_.effect = true;
         _loc2_.showBg();
         _loc2_.drag = false;
         _loc2_.Slot.hideBg();
         _loc2_.showGage();
         _loc2_.setGage(_loc7_,_loc6_);
         _loc2_.Slot.onPress2 = _loc2_.onPress2 = function()
         {
            ToGame_Production_RequestShowProductionExtractionUI(this.id);
         };
         lib.manager.ToolTip.add(_loc2_.SLOT,_loc3_[0],2);
      }
      _loc4_ = _loc4_ + 1;
   }
};
_global.EventBroadCaster.addListener(myListener);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(closeUI);
var tab = container_mc.tabBtn.tab;
var SaveData = lib.gamedata.HistoryData.getHistoryData(UIname);
function ToGame_Production_CloseUI()
{
   fscommand("ToGame_Production_CloseUI");
}
function ToGame_Production_RequestShowProductionListUI(id)
{
   getURL("FSCommand:ToGame_Production_RequestShowProductionListUI",id);
}
function ToGame_Production_RequestShowProductionExtractionUI(id)
{
   getURL("FSCommand:ToGame_Production_RequestShowProductionExtractionUI",id);
}
function closeUI()
{
   ToGame_Production_CloseUI();
}
function historySave_All()
{
   SaveData.tabIndex = tab.activedNum;
   lib.gamedata.HistoryData.addHistoryData(UIname,SaveData);
}
if(SaveData.tabIndex != undefined)
{
   var tabIndex = Number(SaveData.tabIndex);
   tab.setTab(tabIndex);
}
else
{
   tab.setTab(0);
}
fscommand("ToGame_Production_Init");
