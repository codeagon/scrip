function initScrollBar(scrollBar, list, rendererHeight, gap)
{
   scrollBar.addListener(list.content_mc);
   list.content_mc.onScroll = function()
   {
      this._y = - arguments[0];
   };
   scrollBar.setWheel(list.content_mc);
   scrollBar.pageSize = list.content_mc._height;
   scrollBar.displaySize = list.mask_mc._height;
   scrollBar.rowHeight = Number(rendererHeight) + Number(gap);
   lib.Debuger.trace("scrollMax : " + (list.content_mc._height - list.mask_mc._height) / (Number(rendererHeight) + Number(gap)));
}
function drawFriendList(list)
{
   clearFriendList();
   var _loc6_ = lib.util.ExtString.split(list,"\n");
   var _loc4_ = 0;
   while(_loc4_ < _loc6_.length)
   {
      var _loc2_ = lib.util.ExtString.split(_loc6_[_loc4_],"\t");
      var _loc7_ = undefined;
      var _loc5_ = undefined;
      if(Number(_loc2_[0]) == 0)
      {
         _loc5_ = drawTitleRender(_loc4_,_loc2_[1]);
      }
      else
      {
         _loc5_ = drawRenderer(_loc4_,_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
      }
      rendererList.push(_loc5_);
      _loc4_ = _loc4_ + 1;
   }
   _loc5_.onEnterFrame = function()
   {
      var _loc3_ = 0;
      while(_loc3_ < friendList.length)
      {
         var _loc2_ = friendList[_loc3_];
         _loc2_.checkBox.checked = Number(_loc2_.checked);
         _loc2_.bg._visible = _loc2_.checked == 1;
         _loc3_ = _loc3_ + 1;
      }
      delete this.onEnterFrame;
   };
   container_mc.scrollbar0.pageSize = container_mc.contentHolder0.content_mc._height;
   container_mc.scrollbar0.rowHeight = 29;
}
function clearFriendList()
{
   rendererList = [];
   friendList = [];
   for(var _loc1_ in friendListContainer)
   {
      if(typeof friendListContainer[_loc1_] == "movieclip")
      {
         friendListContainer[_loc1_].removeMovieClip();
      }
   }
}
function drawTitleRender(index, titleName)
{
   mc = friendListContainer.attachMovie("TitleRenderer0","title_" + index,friendListContainer.getNextHighestDepth());
   mc._y = RENDERER0_HEIGHT * index;
   mc.titleName.text = titleName;
   return mc;
}
function drawRenderer(index, chrName, chrClass, chrLevel, checked)
{
   renderer = friendListContainer.attachMovie("ItemRenderer0","friend_" + index,friendListContainer.getNextHighestDepth());
   renderer._y = RENDERER0_HEIGHT * index;
   renderer.chrName = chrName;
   renderer.characterName.htmlText = chrName;
   renderer.characterClass.text = chrClass;
   renderer.characterLevel.text = chrLevel;
   renderer.over._visible = false;
   renderer.bg._visible = false;
   renderer.checked = checked;
   renderer.checkBox.onChanged = function()
   {
      this._parent.bg._visible = Boolean(this.checked);
      if(this.checked)
      {
         addToInviteList(this._parent.characterName.text);
      }
      else
      {
         removeFromInviteList(this._parent.characterName.text);
      }
      lib.manager.ToolTip.remove(container_mc.txtBtn0);
      btn0_btn.setEnabled(true);
   };
   renderer.onRollOver = function()
   {
      this.over._visible = true;
      this.checkBox.onRollOver();
   };
   renderer.onRollOut = function()
   {
      this.over._visible = false;
      this.checkBox.onRollOut();
   };
   renderer.onRelease = function()
   {
      this.checkBox.onRelease();
   };
   friendList.push(renderer);
   return renderer;
}
function addToInviteList(id)
{
   addInvited(id);
   container_mc.scrollbar1.pageSize = container_mc.contentHolder1.content_mc._height;
}
function removeFromInviteList(id)
{
   removeInvitedByName(id);
   container_mc.scrollbar1.pageSize = container_mc.contentHolder1.content_mc._height;
   lib.Debuger.trace("container_mc.scrollbar1.pageSize : " + container_mc.scrollbar1.pageSize);
}
function drawInvitedList(list)
{
   clearInvitedList();
   var _loc3_ = lib.util.ExtString.split(list,"\n");
   var _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      var _loc2_ = lib.util.ExtString.split(_loc3_[_loc1_],"\t");
      addInvited(_loc2_[0]);
      _loc1_ = _loc1_ + 1;
   }
   container_mc.scrollbar1.pageSize = container_mc.contentHolder1.content_mc._height;
}
function addInvited(invitedName)
{
   mc = invitedListContainer.attachMovie("ItemRenderer1","invited_" + invitedName,invitedListContainer.getNextHighestDepth());
   mc._y = RENDERER0_HEIGHT * invitedList.length;
   mc.characterName.text = invitedName;
   invitedList.push(mc);
   return mc;
}
function removeInvitedByName(invitedName)
{
   var _loc3_ = undefined;
   var _loc2_ = undefined;
   var _loc1_ = 0;
   while(_loc1_ < invitedList.length)
   {
      _loc2_ = invitedList[_loc1_];
      if(_loc2_._name == "invited_" + invitedName)
      {
         _loc3_ = _loc2_;
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   if(_loc3_)
   {
      invitedList.splice(_loc1_,1);
      _loc3_.removeMovieClip();
      while(_loc1_ < invitedList.length)
      {
         _loc2_ = invitedList[_loc1_];
         _loc2_._y = _loc2_._y - RENDERER0_HEIGHT;
         _loc1_ = _loc1_ + 1;
      }
   }
}
function clearInvitedList()
{
   invitedList = [];
   for(var _loc1_ in invitedListContainer)
   {
      if(typeof invitedListContainer[_loc1_] == "movieclip")
      {
         invitedListContainer[_loc1_].removeMovieClip();
      }
   }
}
function updateConfirmBtnState()
{
   if(!container_mc.nameBlocker._visible && (container_mc.nameFd.text == "" || container_mc.nameFd.text == nameDefaultText) || !container_mc.passBlocker._visible && (container_mc.passFd.text == "" || container_mc.passFd.text == passDefaultText))
   {
      lib.manager.ToolTip.add(container_mc.confirmTooltip,"$033012",1);
      btn0_btn.setEnabled(false);
   }
   else
   {
      lib.manager.ToolTip.remove(container_mc.confirmTooltip);
      btn0_btn.setEnabled(true);
   }
}
function arrangeRenderers(searchText)
{
   var _loc4_ = 0;
   var _loc2_ = 0;
   while(_loc2_ < friendList.length)
   {
      var _loc1_ = friendList[_loc2_];
      var _loc3_ = String(_loc1_.chrName).slice(0,searchText.length);
      if(_loc3_.toLowerCase() == searchText.toLowerCase())
      {
         _loc1_._y = _loc4_ * RENDERER0_HEIGHT;
         _loc1_._visible = true;
         _loc4_ = _loc4_ + 1;
      }
      else
      {
         _loc1_._visible = visibility;
      }
      _loc2_ = _loc2_ + 1;
   }
}
function defaultFriendsVisible(visibility)
{
   var _loc1_ = 0;
   while(_loc1_ < rendererList.length)
   {
      var _loc2_ = rendererList[_loc1_];
      _loc2_._visible = visibility;
      _loc2_._y = _loc1_ * RENDERER0_HEIGHT;
      _loc1_ = _loc1_ + 1;
   }
}
function ToGame_ChatPrivateChannel_Confirm()
{
   lib.Debuger.trace("!!!!");
   lib.manager.ToolTip.add(btn0_btn,"캬캬캬",1);
   lib.manager.ToolTip.add(container_mc.txtBtn0,"캬캬캬",1);
   lib.manager.ToolTip.add(btn0_btn.txt,"캬캬캬",1);
   var _loc2_ = "";
   var _loc1_ = 0;
   while(_loc1_ < invitedList.length)
   {
      _loc2_ = _loc2_ + (invitedList[_loc1_].characterName.text + "\t");
      _loc1_ = _loc1_ + 1;
   }
   getURL("FSCommand:ToGame_ChatPrivateChannel_Confirmed",container_mc.nameFd.text + "\t" + container_mc.passFd.text + "\t" + _loc2_);
}
function ToGame_ChatPrivateChannel_Cancel()
{
   fscommand("ToGame_ChatPrivateChannel_Cancel");
}
function ToGame_ChatPrivateChannel_Search(keyWord)
{
   getURL("FSCommand:ToGame_ChatPrivateChannel_Search",keyWord);
}
function ToGame_ChatPrivateChannel_Init()
{
   fscommand("ToGame_ChatPrivateChannel_Init");
}
var UI = this;
UI._visible = false;
var bWidgetOpen = false;
var UIname = "ChatPrivateChannel";
container_mc.UIDrager.setData(UIName,UI,container_mc.lock_mc);
container_mc.text_name.textColor = lib.info.TextColor.UI_TITLE_ACTIVE;
container_mc.text_name.text = lib.util.UIString.getUIString("$033001");
var myListener = new Object();
_global.EventBroadCaster.addListener(myListener);
var CustomScaleEvent;
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
      if(UI._visible == true)
      {
         CustomScaleEvent = new CustomScaleEvent();
         CustomScaleEvent.CustomScaleEventCheck(UI,UIname);
         UI.scaleExpander.scaleExpanderEventCheck(UI,UIname);
      }
      else
      {
         CustomScaleEvent.CustomScaleEventRemoveCheck();
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
   container_mc.ToolTip._visible = bShow;
};
container_mc.txtChattingName.text = lib.util.UIString.getUIString("$033002");
container_mc.txtPassWord.text = lib.util.UIString.getUIString("$033003");
container_mc.txtTip0.text = lib.util.UIString.getUIString("$033004");
container_mc.txtTip1.text = lib.util.UIString.getUIString("$033005");
container_mc.txtInvite.text = lib.util.UIString.getUIString("$033006");
container_mc.txtTip2.text = lib.util.UIString.getUIString("$033007");
container_mc.txtNotice.text = lib.util.UIString.getUIString("$033010");
var btn0_btn = container_mc.txtBtn0.txtBtn;
btn0_btn.txt.text = lib.util.UIString.getUIString("$033008");
btn0_btn.setRelease(ToGame_ChatPrivateChannel_Confirm);
btn0_btn.setEnabled(false);
var btn1_btn = container_mc.txtBtn1.txtBtn;
btn1_btn.txt.text = lib.util.UIString.getUIString("$033009");
btn1_btn.setRelease(ToGame_ChatPrivateChannel_Cancel);
var x_btn = new lib.util.TxtBtn(container_mc.x_mc);
x_btn.setRelease(ToGame_ChatPrivateChannel_Cancel);
initScrollBar(container_mc.scrollbar0,container_mc.contentHolder0,29,0);
initScrollBar(container_mc.scrollbar1,container_mc.contentHolder1,29,0);
lib.manager.ToolTip.add(container_mc.noticeIcon,lib.util.UIString.getUIString("$033011"),1);
var friendListContainer = container_mc.contentHolder0.content_mc.listContainer;
var rendererList = [];
var friendList = [];
myListener.OnGame_ChatPrivateChannel_SetFriendList = function(listData)
{
   drawFriendList(listData);
};
var RENDERER0_HEIGHT = 29;
myListener.OnGame_ChatPrivateChannel_SetInvitedList = function(listData)
{
   drawInvitedList(listData);
};
var invitedListContainer = container_mc.contentHolder1.content_mc.listContainer;
var invitedList = [];
lib.manager.Focus.addFocusGroup(UIname,1,[nameFd,passFd,searchFd]);
var nameDefaultText = "";
var passDefaultText = "";
var searchDefaultText = "";
container_mc.nameFd.onChanged = function()
{
   updateConfirmBtnState();
};
container_mc.passFd.onChanged = function()
{
   updateConfirmBtnState();
};
container_mc.searchFd.onChanged = function()
{
   if(this.text != "" && this.text != searchDefaultText)
   {
      defaultFriendsVisible(false);
      arrangeRenderers(this.text);
   }
   else
   {
      defaultFriendsVisible(true);
   }
};
container_mc.nameBlocker.onPress = function()
{
};
container_mc.passBlocker.onPress = function()
{
};
container_mc.searchBlocker.onPress = function()
{
};
myListener.OnGame_ChatPrivateChannel_SetInputs = function(datas)
{
   var _loc1_ = lib.util.ExtString.split(datas,"\t");
   container_mc.nameBlocker._visible = _loc1_[0] == 0;
   container_mc.passBlocker._visible = _loc1_[2] == 0;
   container_mc.searchBlocker._visible = _loc1_[4] == 0;
   nameDefaultText = container_mc.nameFd.text = _loc1_[1];
   passDefaultText = container_mc.passFd.text = _loc1_[3];
   searchDefaultText = container_mc.searchFd.text = _loc1_[5];
   updateConfirmBtnState();
};
ToGame_ChatPrivateChannel_Init();
