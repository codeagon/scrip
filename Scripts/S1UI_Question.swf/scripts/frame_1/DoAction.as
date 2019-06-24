function setPosition(target)
{
   target._x = (lib.info.AlignInfo.UI_WIDTH - target._width) / 2;
   target._y = (lib.info.AlignInfo.UI_HEIGHT - target._height) / 2;
   target._x = target._x + existNum * createGap;
   target._y = target._y + existNum * createGap;
}
function ToGame_Question_NextPage(id, result)
{
   if(result == undefined)
   {
      getURL("FSCommand:ToGame_Question_NextPage",id);
   }
   else
   {
      getURL("FSCommand:ToGame_Question_NextPage",id + "\t" + result);
   }
   trace("ToGame_Question_NextPage: " + id + "\t" + result);
}
function ToGame_Question_CloseUI()
{
   fscommand("ToGame_Question_CloseUI");
   trace("ToGame_Question_CloseUI");
}
var UI = this;
var UIname = "Question";
bWidgetOpen = false;
var createGap = 50;
var gDepth = 0;
var existNum = 0;
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
myListener.OnGame_Question_SetTitleText = function(id, str)
{
   var _loc1_ = UI["container_" + id];
   _loc1_.title_txt.text = str;
};
myListener.OnGame_Question_Add = function(id, questionMaxNum)
{
   var _loc3_ = UI["container_" + id];
   questionMaxNum = Number(questionMaxNum);
   if(!_loc3_)
   {
      var maked = UI.attachMovie("question","container_" + id,gDepth);
      setPosition(maked);
      existNum++;
      maked.id = id;
      maked.maxPage = questionMaxNum;
      maked.question_mc._visible = false;
      maked.notice_mc._visible = false;
      maked.btn = new lib.util.TxtAniBtn(maked.btn_mc,maked.btn_txt,20,27,33,43);
      maked.btn.setText("시 작");
      maked.btn.setRelease(aaa = function()
      {
         ToGame_Question_NextPage(maked.id);
      });
      gDepth++;
   }
};
myListener.OnGame_Question_Remove = function(id)
{
   var _loc1_ = UI["container_" + id];
   removeMovieClip(_loc1_);
   existNum--;
   if(existNum <= 0)
   {
      existNum = 0;
   }
};
myListener.OnGame_Question_SetNotice = function(id, str)
{
   var _loc1_ = UI["container_" + id];
   _loc1_.btn.setEnabled(true);
   _loc1_.notice_mc._visible = true;
   _loc1_.question_mc._visible = false;
   _loc1_.notice_mc.txt.text = str;
};
myListener.OnGame_Question_SetQuestion = function(id, type, currentPage, question, selectableDataInfo)
{
   var search = UI["container_" + id];
   search.question_mc.type0_mc["select" + search.select + "_btn"].radio.gotoAndStop(1);
   search.question_mc.type1_mc.txt.text = "";
   search.select = null;
   search.btn.setEnabled(false);
   search.notice_mc._visible = false;
   search.question_mc._visible = true;
   type = Number(type);
   currentPage = Number(currentPage);
   search.currentPage = currentPage;
   search.question_mc.currentPage_txt.text = search.currentPage + "/" + search.maxPage;
   if(search.maxPage == search.currentPage)
   {
      search.btn.setText("완 료");
   }
   else
   {
      search.btn.setText("다 음");
   }
   if(type == 0)
   {
      search.question_mc.type0_mc._visible = true;
      search.question_mc.type1_mc._visible = false;
      search.btn.setRelease(abc = function()
      {
         ToGame_Question_NextPage(search.id,search.select + 1);
      });
   }
   else if(type == 1)
   {
      search.question_mc.type0_mc._visible = false;
      search.question_mc.type1_mc._visible = true;
      search.question_mc.type1_mc.txt.onSetFocus = function()
      {
         _global.inputing = true;
         _root.debug3.text = "[설문]주관식입력에 포커스가 이동\r" + _root.debug3.text;
      };
      search.question_mc.type1_mc.txt.onKillFocus = function()
      {
         _global.inputing = false;
         _root.debug3.text = "[설문]주관식입력에 포커스가 사라짐\r" + _root.debug3.text;
      };
      search.question_mc.type1_mc.txt.onChanged = function()
      {
         if(lib.util.ExtString.trim(this.text) == "")
         {
            search.btn.setEnabled(false);
         }
         else
         {
            search.btn.setEnabled(true);
         }
      };
      search.btn.setRelease(def = function()
      {
         ToGame_Question_NextPage(search.id,search.question_mc.type1_mc.txt.text);
      });
      Selection.setFocus(search.question_mc.type1_mc.txt);
   }
   search.question_mc.question_txt.verticalAlign = "center";
   search.question_mc.question_txt.text = question;
   var _loc6_ = selectableDataInfo.split("\t");
   if(_loc6_[_loc6_.length - 1] == "")
   {
      _loc6_.pop();
   }
   var _loc5_ = 0;
   while(_loc5_ < 9)
   {
      var _loc4_ = search.question_mc.type0_mc["select" + _loc5_ + "_btn"];
      _loc4_._visible = false;
      _loc5_ = _loc5_ + 1;
   }
   _loc5_ = 0;
   while(_loc5_ < _loc6_.length)
   {
      _loc4_ = search.question_mc.type0_mc["select" + _loc5_ + "_btn"];
      _loc4_.txt.textColor = lib.info.TextColor.GENERAL_NORMAL;
      _loc4_._visible = true;
      _loc4_.txt.text = _loc6_[_loc5_];
      _loc4_.stat = _loc5_;
      _loc4_.hit.onRelease = function()
      {
         this._parent._parent["select" + search.select + "_btn"].radio.checked = false;
         search.select = this._parent.stat;
         this._parent.radio.onRelease();
         search.btn.setEnabled(true);
      };
      _loc5_ = _loc5_ + 1;
   }
};
_global.EventBroadCaster.addListener(myListener);
fscommand("ToGame_Question_Init");
