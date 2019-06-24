function allInfoClear()
{
   var _loc2_ = 0;
   while(_loc2_ < NUM_AUTHORITY)
   {
      container_mc["GuildGroupInfo_" + _loc2_]._visible = false;
      container_mc["GuildGroupInfo_" + _loc2_].checkBox.idx = _loc2_;
      container_mc["GuildGroupInfo_" + _loc2_].checkBox.setText(container_mc["GuildGroupInfo_" + _loc2_].text_GuildGroupInfo);
      container_mc["GuildGroupInfo_" + _loc2_].checkBox.onRollOver = function()
      {
         ToolTipObj = this._parent;
         ToGame_GuildGroupWindow_RequestToolTip(this.idx);
      };
      container_mc["GuildGroupInfo_" + _loc2_].checkBox.onRollOut = container_mc["GuildGroupInfo_" + _loc2_].checkBox.onReleaseOutside = function()
      {
         ToolTipObj = undefined;
         lib.manager.ToolTip.hide();
      };
      _loc2_ = _loc2_ + 1;
   }
}
function ToGameSendSelectedGuildGroup(GroupIndex)
{
   getURL("FSCommand:ToGameSendSelectedGuildGroup",GroupIndex);
}
function ToGameSendSelectedGuildGroupInfo()
{
   var _loc2_ = "";
   var _loc1_ = "";
   i = 0;
   while(i < current_authority)
   {
      _loc2_ = "GuildGroupInfo_" + i;
      if(container_mc[_loc2_].checkBox.checked)
      {
         _loc1_ = _loc1_ + "1" + "\t";
      }
      else
      {
         _loc1_ = _loc1_ + "0" + "\t";
      }
      i++;
   }
   getURL("FSCommand:ToGameSendSelectedGuildGroupInfo",container_mc.comboBox.selectLabel.text + "\t" + _loc1_);
   ToGame_GuildGroupWindow_Close();
}
function ToGameAddGuildGroup()
{
   fscommand("ToGameAddGuildGroup");
}
function ToGameDeleteGuildGroup(GroupIndex)
{
   getURL("FSCommand:ToGameDeleteGuildGroup",GroupIndex);
}
function ToGame_GuildGroupWindow_Init()
{
   fscommand("ToGame_GuildGroupWindow_Init");
}
function ToGame_GuildGroupWindow_Close()
{
   fscommand("ToGame_GuildGroupWindow_Close");
}
function ToGame_GuildGroupWindow_RequestToolTip(idx)
{
   if(ToolTipObj != undefined)
   {
      getURL("FSCommand:ToGame_GuildGroupWindow_RequestToolTip",idx);
   }
}
function ToGame_GuildGroupWindow_RequestRename()
{
   var _loc1_ = container_mc.comboBox.selected;
   getURL("FSCommand:ToGame_GuildGroupWindow_RequestRename",_loc1_);
}
var UI = this;
UI._visible = false;
var NUM_AUTHORITY = 20;
var current_authority = 0;
_global.gfxExtensions = 1;
var UIname = "guildgroupwindow";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.explain_0.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
container_mc.explain_1.textColor = lib.info.TextColor.GENERAL_EXPLAIN_DETAIL;
this.bUImode = false;
bWindowOpen = false;
var ToolTipObj;
container_mc.title_txt.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.text_guildGroup1.verticalAlign = "bottom";
container_mc.text_guildGroup2.verticalAlign = "bottom";
allInfoClear();
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
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
myListener.OnGameEventSetGuildGroupTexts = function(strTitle, strText1, strText2, strText3, strText4, strText5, strText6)
{
   container_mc.title_txt.text = strTitle;
   container_mc.text_guildGroup1.text = strText1;
   container_mc.text_guildGroup2.text = strText2;
   add_btn.txt.text = strText3;
   remove_btn.txt.text = strText4;
   check_btn.txt.text = strText5;
};
myListener.OnGameEventSetGuildGroupAuthorityTexts = function(textList)
{
   allInfoClear();
   var _loc3_ = textList.split("\t");
   var _loc1_ = undefined;
   var _loc2_ = 0;
   while(_loc2_ < _loc3_.length)
   {
      current_authority = _loc3_.length;
      if(_loc3_[_loc2_] != "")
      {
         _loc1_ = "GuildGroupInfo_" + _loc2_;
         container_mc[_loc1_]._visible = true;
         container_mc[_loc1_].text_GuildGroupInfo.textAutoSize = "shrink";
         container_mc[_loc1_].text_GuildGroupInfo.verticalAlign = "center";
         container_mc[_loc1_].text_GuildGroupInfo.text = _loc3_[_loc2_];
         container_mc[_loc1_].checkBox.setText(container_mc[_loc1_].text_GuildGroupInfo);
      }
      _loc2_ = _loc2_ + 1;
   }
};
myListener.OnGameEventSetSelectedGuildGroupInfo = function(infoList)
{
   var _loc2_ = infoList.split("\t");
   var _loc3_ = undefined;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_.length)
   {
      if(_loc2_[_loc1_] != "")
      {
         _loc3_ = "GuildGroupInfo_" + _loc1_;
         if(_loc2_[_loc1_] == 1)
         {
            container_mc[_loc3_].checkBox.checked = true;
         }
         else
         {
            container_mc[_loc3_].checkBox.checked = false;
         }
      }
      _loc1_ = _loc1_ + 1;
   }
};
myListener.OnGameEventSetGuildGroupList = function(GuildGroupList)
{
   var _loc3_ = GuildGroupList.split("\n");
   if(_loc3_[_loc3_.length - 1] == "undefined" || _loc3_[_loc3_.length - 1] == "")
   {
      _loc3_.splice(_loc3_.length - 1,1);
   }
   var _loc6_ = [];
   var _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      var _loc2_ = _loc3_[_loc1_].split("\t");
      _loc6_.push({label:_loc2_[1],id:Number(_loc2_[0])});
      _loc1_ = _loc1_ + 1;
   }
   if(_loc3_.length > 0)
   {
      container_mc.comboBox.data = _loc6_;
   }
   remove_btn.setEnabled(Number(_loc6_[0].id) != 1 && Number(_loc6_[0].id) != 2);
};
myListener.OnGame_GuildGroupWindow_SetToolTip = function(tooltip)
{
   lib.manager.ToolTip.show(ToolTipObj,1,tooltip);
};
var remove_btn = container_mc.txtBtn0.txtBtn;
var add_btn = container_mc.txtBtn1.txtBtn;
var rename_btn = container_mc.txtBtn3.txtBtn;
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
var check_btn = container_mc.txtBtn2.txtBtn;
x_btn.setRelease(ToGame_GuildGroupWindow_Close);
check_btn.setRelease(ToGameSendSelectedGuildGroupInfo);
remove_btn.setRelease(function()
{
   ToGameDeleteGuildGroup(container_mc.comboBox.selected);
}
);
add_btn.setRelease(ToGameAddGuildGroup);
rename_btn.setRelease(ToGame_GuildGroupWindow_RequestRename);
comboListener = {};
comboListener.onChanged = function(tg, id, index)
{
   remove_btn.setEnabled(id != 1 && id != 2);
   container_mc.comboBox.backBg.hitTestDisable = !(id != 1 && id != 2);
   ToGameSendSelectedGuildGroup(id);
};
container_mc.comboBox.addListener(comboListener);
ToGame_GuildGroupWindow_Init();
