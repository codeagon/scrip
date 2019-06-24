class lib.controls.S_3DepthList_View extends MovieClip
{
   var n_Count = 0;
   var Func = new Function();
   var b_focus = false;
   var n_View = 0;
   var s_Folder = "OPEN";
   function S_3DepthList_View()
   {
      super();
      this.m_This = this;
      if(this.m_This.favorite_mc)
      {
         this.s_Type = "SUB";
         this.m_This.bg.onRelease = function()
         {
            this._parent.b_focus = true;
            this._parent.effect_mc.gotoAndStop(4);
            this._parent.Func(0,this._parent.ID);
         };
         this.m_This.favorite_mc.onRelease = function()
         {
            var _loc2_ = this._parent.ID;
            if(this._parent.Favor == 0)
            {
               this._parent.Favor = 1;
               this._alpha = 100;
               lib.manager.ToolTip.add(this,lib.util.UIString.getUIString("$153011"),1);
               _loc2_ = _loc2_ + "\t1";
            }
            else
            {
               this._parent.Favor = 0;
               this._alpha = 0;
               lib.manager.ToolTip.add(this,lib.util.UIString.getUIString("$153010"),1);
               _loc2_ = _loc2_ + "\t0";
            }
            this._parent.Func(1,_loc2_);
         };
      }
      else
      {
         this.s_Type = "CATE";
         this.m_This.bg.onRelease = function()
         {
            if(this._parent.n_Count == 0)
            {
               return undefined;
            }
            this.gotoAndStop(1);
            if(this._parent.s_Folder == "OPEN")
            {
               this._parent.s_Folder = "CLOSE";
               this._parent.opened_mc.gotoAndStop(2);
            }
            else
            {
               this._parent.s_Folder = "OPEN";
               this._parent.opened_mc.gotoAndStop(1);
            }
            this._parent.Func(2);
         };
      }
      this.m_This.bg.onRollOver = function()
      {
         if(this._parent.b_focus)
         {
            return undefined;
         }
         this.gotoAndStop(2);
      };
      this.m_This.bg.onRollOut = this.m_This.hit.onReleaseOutside = function()
      {
         if(this._parent.b_focus)
         {
            return undefined;
         }
         this.gotoAndStop(1);
      };
      this.m_This.bg.onPress = function()
      {
         if(this._parent.b_focus)
         {
            return undefined;
         }
         this.gotoAndStop(3);
      };
   }
   function __get__ID()
   {
      return this.o_Data.Id;
   }
   function __get__Favor()
   {
      return this.o_Data.Favor;
   }
   function __set__Favor(_num)
   {
      this.o_Data.Favor = _num;
      return this.__get__Favor();
   }
   function UpDate(_Data)
   {
      this.o_Data = _Data;
      this.SetSkinData();
   }
   function SetSkinData()
   {
      var _loc2_ = this.o_Data.Name;
      this.m_This.txt.setText(_loc2_);
      this.m_This.txt.text = _loc2_;
      if(this.s_Type == "SUB")
      {
         var _loc3_ = this.o_Data.Material;
         if(_loc3_ > 0)
         {
            this.m_This.cnt.textAutoSize = "shrink";
            this.m_This.cnt.verticalAlign = "center";
            this.m_This.cnt.htmlText = "[" + _loc3_ + "]";
         }
         else
         {
            this.m_This.cnt.htmlText = "";
         }
         var _loc5_ = this.o_Data.Level;
         var _loc6_ = this.o_Data.Learn;
         if(_loc6_ == 0)
         {
            this.m_This.favorite_bg._visible = false;
            this.m_This.favorite_mc._visible = false;
            this.m_This.txt.textColor = "0x707070";
            return undefined;
         }
         this.m_This.favorite_bg._visible = true;
         this.m_This.favorite_mc._visible = true;
         if(_loc5_ == 0)
         {
            this.m_This.txt.textColor = "0xffffff";
         }
         else if(_loc5_ == 1)
         {
            this.m_This.txt.textColor = "0xffffff";
         }
         var _loc4_ = Number(this.o_Data.Favor);
         var _loc7_ = !_loc4_?lib.util.UIString.getUIString("$153010"):lib.util.UIString.getUIString("$153011");
         this.m_This.favorite_mc._alpha = Number(_loc4_) * 100;
         lib.manager.ToolTip.add(this.m_This.favorite_mc,_loc7_,1);
      }
   }
   function Count(_num, _type)
   {
      if(_num == 0)
      {
         this.n_Count = 0;
      }
      else
      {
         this.n_Count = this.n_Count + _num;
      }
      this.m_This.txt.text = this.o_Data.Name + " [" + this.n_Count + "]";
      if(!_type)
      {
      }
   }
   function SetFocus(_type)
   {
      if(_type)
      {
         this.b_focus = true;
         this.m_This.bg.gotoAndStop(4);
      }
      else
      {
         this.b_focus = false;
         this.m_This.bg.gotoAndStop(1);
      }
   }
}
