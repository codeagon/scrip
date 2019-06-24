class g4.view.mentor.Mentor extends g4.core.View implements g4.gameInterface.IMentorWindow
{
   var _max = 5;
   function Mentor($targetMovie)
   {
      super($targetMovie);
   }
   function getUIName()
   {
      return "Mentor";
   }
   function configGameInterface()
   {
      this.registerGameInterface("OnGame_Mentor_SetData",g4.util.Delegate.create(this,this.OnGame_Mentor_SetData));
   }
   function configUI()
   {
      super.configUI();
      this.items_active = [];
      this.items_pool = [];
      var _loc3_ = 0;
      while(_loc3_ < 10)
      {
         var _loc5_ = this.__get__targetMovieClip().container_mc.getNextHighestDepth();
         var _loc4_ = (g4.view.mentor.MentorPlayerItem)this.__get__targetMovieClip().container_mc.attachMovie("MentorPlayerItem","item" + _loc3_,_loc5_);
         _loc4_.__set__visible(false);
         this.items_pool.push(_loc4_);
         _loc3_ = _loc3_ + 1;
      }
      this.textField = this.__get__targetMovieClip().container_mc.textField;
      this.tGuide = this.__get__targetMovieClip().container_mc.tGuide;
      this.bConfirm = this.__get__targetMovieClip().container_mc.bConfirm;
      this.mBackground = this.__get__targetMovieClip().container_mc.mBackground;
      this.bConfirm.addEventListener(gfx.events.EventTypes.CLICK,this,"confirmHandlerClick");
      this.tGuide.verticalAlign = "center";
      this.tGuide.text = lib.util.UIString.getUIString("$731002");
      this.textField.text = lib.util.UIString.getUIString("$731001");
      this.bConfirm.__set__label(lib.util.UIString.getUIString("$731003"));
      this.initInterval = setInterval(this,"initComp",100);
   }
   function initComp()
   {
      clearInterval(this.initInterval);
      this.ToGame_Mentor_Init();
      if(_global.gfxPlayer)
      {
         this.setViewVisible(true);
         this.OnGame_Mentor_SetData(1,"동해물과백두산이마르고닳\t3\t65\n백두산이\t2\t65\n마르고\t3\t65");
      }
   }
   function confirmHandlerClick(event)
   {
      this.ToGame_Mentor_Confirm(this.getSelectedPlayer());
   }
   function getSelectedPlayer()
   {
      var _loc4_ = "";
      var _loc5_ = this.items_active.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         var _loc3_ = (g4.view.mentor.MentorPlayerItem)this.items_active[_loc2_];
         if(_loc3_.__get__selected())
         {
            if(_loc4_ != "")
            {
               _loc4_ = _loc4_ + "\t";
            }
            _loc4_ = _loc4_ + _loc3_.getAccountName();
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc4_;
   }
   function getMentorItem()
   {
      var _loc2_ = undefined;
      if(this.items_active.length < this._max)
      {
         _loc2_ = (g4.view.mentor.MentorPlayerItem)this.items_pool.pop();
         _loc2_.__set__visible(true);
         this.items_active.push(_loc2_);
      }
      return _loc2_;
   }
   function resetMentorItem()
   {
      while(this.items_active.length > 0)
      {
         var _loc2_ = (g4.view.mentor.MentorPlayerItem)this.items_active.pop();
         _loc2_.__set__visible(false);
         _loc2_.resetData();
         this.items_pool.push(_loc2_);
      }
   }
   function OnGame_Mentor_SetData($type, $players)
   {
      $type = Number($type);
      this.mBackground.gotoAndStop($type + 1);
      if($type == 0)
      {
         this._max = 4;
         this.tGuide._y = 205;
         this.bConfirm._y = 315;
      }
      else if($type == 1)
      {
         this._max = 10;
         this.tGuide._y = 240;
         this.bConfirm._y = 348;
      }
      this.resetMentorItem();
      var _loc5_ = lib.util.ExtString.split($players,"\n");
      var _loc6_ = _loc5_.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc6_)
      {
         var _loc3_ = this.getMentorItem();
         _loc3_.setData(_loc5_[_loc2_],$type);
         if($type == 0)
         {
            _loc3_._x = 15;
            _loc3_._y = _loc2_ * 34 + 56;
         }
         else if($type == 1)
         {
            _loc3_._x = _loc2_ % 2 * 227 + 15;
            _loc3_._y = Math.floor(_loc2_ / 2) * 34 + 56;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function ToGame_Mentor_Init()
   {
      fscommand("ToGame_Mentor_Init");
   }
   function ToGame_Mentor_Confirm($players)
   {
      getURL("FSCommand:ToGame_Mentor_Confirm",$players);
   }
}
