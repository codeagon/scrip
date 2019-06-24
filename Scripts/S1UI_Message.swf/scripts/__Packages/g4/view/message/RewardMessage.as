class g4.view.message.RewardMessage extends MovieClip
{
   function RewardMessage()
   {
      super();
   }
   function onLoad()
   {
      this.hitTestDisable = true;
      this.items_pool = [];
      this.items_active = [];
      this.datas = [];
      var _loc3_ = 0;
      while(_loc3_ < 4)
      {
         var _loc2_ = (g4.view.message.RewardMessageItem)this["mItem" + _loc3_];
         _loc2_.addEventListener(gfx.events.EventTypes.COMPLETE,this,"itemHandlerComplete");
         _loc2_.__set__visible(false);
         this.items_pool.push(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
   }
   function itemHandlerComplete(event)
   {
      var _loc3_ = -1;
      var _loc4_ = this.items_active.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         if(this.items_active[_loc2_] == event.target)
         {
            _loc3_ = _loc2_;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc3_ != -1)
      {
         var _loc6_ = (g4.view.message.RewardMessageItem)this.items_active.splice(_loc3_,1)[0];
         _loc6_.__set__visible(false);
         this.items_pool.push(_loc6_);
      }
      if(this.datas.length > 0)
      {
         this.showData(String(this.datas.shift()));
      }
   }
   function getItem()
   {
      var _loc2_ = undefined;
      if(this.items_pool.length > 0)
      {
         _loc2_ = (g4.view.message.RewardMessageItem)this.items_pool.pop();
      }
      else
      {
         _loc2_ = (g4.view.message.RewardMessageItem)this.items_active.shift();
      }
      this.items_active.push(_loc2_);
      return _loc2_;
   }
   function pushItem($data)
   {
      if(this.items_pool.length > 0)
      {
         this.showData($data);
      }
      else
      {
         this.datas.push($data);
      }
   }
   function forcePush()
   {
      if(this.items_active.length > 0)
      {
         this.items_active[0].expire();
      }
      else
      {
         clearInterval(this.forcePushInterval);
      }
   }
   function showData($data)
   {
      var _loc7_ = this.getItem();
      _loc7_.setRewardData($data);
      _loc7_._y = 148;
      var _loc6_ = this.items_active.length;
      var _loc4_ = 111;
      var _loc2_ = _loc6_ - 1;
      while(_loc2_ >= 0)
      {
         var _loc3_ = this.items_active[_loc2_];
         g4.util.TweenX.killTweenOf(_loc3_);
         g4.util.TweenX.to(_loc3_,0.5,{_y:_loc4_},gs.easing.Strong.easeOut);
         _loc4_ = _loc4_ - 37;
         _loc2_ = _loc2_ - 1;
      }
      clearInterval(this.forcePushInterval);
      this.forcePushInterval = setInterval(this,"forcePush",2000);
   }
   function Message_Reward($type, $data)
   {
      this.pushItem($data);
   }
   function Root_Item($id, $img, $enchant, $itemName, $quantity, $grade, $sealType, $masterPiece)
   {
      var _loc2_ = "<item src=\'" + $img + "\' grade=\'" + $grade + "\' count=\'" + $quantity + "\'>\t" + $itemName;
      this.pushItem(_loc2_);
   }
   function clearMessage()
   {
      this.datas = [];
      clearInterval(this.forcePushInterval);
      while(this.items_active.length > 0)
      {
         var _loc2_ = (g4.view.message.RewardMessageItem)this.items_active.pop();
         _loc2_.resetData();
         this.items_pool.push(_loc2_);
      }
   }
}
