class g4.view.message.MessageStyle3 extends gfx.core.UIComponent
{
   var isPlay = false;
   function MessageStyle3()
   {
      super();
   }
   function onLoad()
   {
      super.onLoad();
      this.mText.textField.html = true;
      this.mText2.textField.html = true;
      this.playMessage();
      this.bConfirm.__set__label(lib.util.UIString.getUIString("$009046"));
      this.bConfirm.__set__visible(false);
      this.bConfirm.addEventListener(gfx.events.EventTypes.CLICK,this,"confirmHandlerClick");
   }
   function confirmHandlerClick(event)
   {
      this.delayComp();
      this.hitTestDisable = true;
      getURL("FSCommand:ToGame_Message_ButtonClick",this._buttonIndex);
   }
   function setData($type, $title, $subMessage, $idx)
   {
      if(this.params == null)
      {
         this.params = [];
      }
      $type = Number($type) + 1;
      if($idx == null)
      {
         $idx = -1;
      }
      else
      {
         $idx = Number($idx);
      }
      var _loc3_ = {type:$type,title:$title,subMessage:$subMessage,buttonIndex:$idx};
      this.params.push(_loc3_);
      this.playMessage();
   }
   function playMessage()
   {
      if(!this.initialized)
      {
         return undefined;
      }
      if(this.isPlay)
      {
         return undefined;
      }
      if(this.params.length > 0)
      {
         var _loc3_ = this.params.shift();
         var _loc5_ = _loc3_.title;
         var _loc6_ = _loc3_.subMessage;
         var _loc2_ = Number(_loc3_.type);
         var _loc4_ = Number(_loc3_.buttonIndex);
         this.mLight.mc0.gotoAndStop(_loc2_);
         this.mLight.mc1.gotoAndStop(_loc2_);
         this.mIcon.gIcon0.gotoAndStop(_loc2_);
         this.mIcon.gIcon1.gotoAndStop(_loc2_);
         this.mSubText.gotoAndStop(_loc2_);
         this.mIconBack.gotoAndStop(_loc2_);
         this.mIconBack2.gotoAndStop(_loc2_);
         this.mText.textField.htmlText = _loc5_;
         this.mText2.textField.htmlText = _loc5_;
         this.mSubText.textField.htmlText = _loc6_;
         if(_loc2_ == 1)
         {
            this.mText.textField.textColor = 15329772;
            this.mText2.textField.textColor = 15329772;
         }
         if(_loc4_ == -1)
         {
            this.bConfirm.__set__visible(false);
         }
         else
         {
            this.bConfirm.__set__visible(true);
         }
         this._buttonIndex = _loc4_;
         this.isPlay = true;
         this.__set__visible(true);
         this.hitTestDisable = false;
         this.gotoAndPlay(2);
      }
   }
   function msgComp()
   {
      this.isPlay = false;
      this.__set__visible(false);
      this.playMessage();
   }
   function checkDelay()
   {
      if(this._buttonIndex != -1)
      {
         this.stop();
         clearInterval(this.delayInterval);
         this.delayInterval = setInterval(this,"delayComp",27000);
      }
      else
      {
         this.gotoAndPlay("reAnimation");
      }
   }
   function delayComp()
   {
      clearInterval(this.delayInterval);
      this.gotoAndPlay("reAnimation");
   }
   function clearMessage()
   {
      this.isPlay = false;
      this.gotoAndStop(1);
      this.__set__visible(false);
      this.params = [];
   }
}
