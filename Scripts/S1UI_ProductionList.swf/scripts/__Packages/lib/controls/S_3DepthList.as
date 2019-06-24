class lib.controls.S_3DepthList extends MovieClip
{
   static var preLoadVar = "preLoad";
   var n_1DYPos = 27;
   var n_2DYPos = 22;
   var n_3DYPos = 22;
   var a_1DepthList = [];
   var a_VIewList = [];
   var a_1DepthOpen = [];
   var a_2DepthOpen = [];
   var s_PrevFocus = -1;
   function S_3DepthList(_lineBox, _scroll, _func)
   {
      super();
      this.m_LineBox = _lineBox;
      this.m_Scroll = _scroll;
      this.f_Function = _func;
      this.AllListClear();
   }
   function AddFirstCategory(_skill, _List)
   {
      var _loc6_ = this.Search_Skill(_skill);
      _loc6_.Data = [];
      var _loc4_ = lib.util.ExtString.split(_List,"\t");
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         var _loc3_ = new Object();
         _loc3_.Id = _loc4_[_loc2_];
         _loc3_.Name = _loc4_[_loc2_];
         var _loc5_ = new lib.controls.S_3DepthList_Memory(_loc3_);
         _loc6_.Data.push(_loc5_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function AddSecondCategory(_skill, _DType, _List)
   {
      var _loc4_ = lib.util.ExtString.split(_List,"\t");
      var _loc7_ = this.Search_Skill(_skill);
      var _loc6_ = this.Search_Parent(_loc7_.Data,_DType);
      _loc6_.ClearChild();
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         var _loc3_ = new Object();
         _loc3_.Id = _loc4_[_loc2_];
         _loc3_.Name = _loc4_[_loc2_];
         var _loc5_ = new lib.controls.S_3DepthList_Memory(_loc3_);
         _loc6_.AddChild(_loc5_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function SetList(_skill, _DType, _List)
   {
      var _loc4_ = lib.util.ExtString.split(_DType,"\t");
      var _loc3_ = lib.util.ExtString.split(_List,"\t");
      var _loc8_ = this.Search_Skill(_skill);
      var _loc7_ = this.Search_Parent(_loc8_.Data,_loc4_[0]);
      var _loc6_ = this.Search_Parent(_loc7_.Child,_loc4_[1]);
      var _loc2_ = new Object();
      _loc2_.Id = _loc3_[0];
      _loc2_.Name = _loc3_[1];
      _loc2_.Material = _loc3_[2];
      _loc2_.Level = _loc3_[3];
      _loc2_.Favor = _loc3_[4];
      _loc2_.Learn = _loc3_[5];
      var _loc5_ = new lib.controls.S_3DepthList_Memory(_loc2_);
      _loc6_.AddChild(_loc5_);
   }
   function UpDateList(_skill, _DType, _Data)
   {
      var _loc5_ = lib.util.ExtString.split(_DType,"\t");
      var _loc3_ = lib.util.ExtString.split(_Data,"\t");
      var _loc8_ = this.Search_Skill(_skill);
      var _loc7_ = this.Search_Parent(_loc8_.Data,_loc5_[0]);
      var _loc6_ = this.Search_Parent(_loc7_.Child,_loc5_[1]);
      var _loc4_ = _loc6_.SearchChild(_loc3_[0]);
      if(_loc4_)
      {
         _Data = new Object();
         _Data.Id = _loc3_[0];
         _Data.Name = _loc3_[1];
         _Data.Material = _loc3_[2];
         _Data.Level = _loc3_[3];
         _Data.Favor = _loc3_[4];
         _Data.Learn = _loc3_[5];
         _loc4_.Data = _Data;
      }
   }
   function Search_Skill(_Skill)
   {
      var _loc2_ = this.m_LineBox["container_" + _Skill];
      if(!_loc2_)
      {
         _loc2_ = this.m_LineBox.createEmptyMovieClip("container_" + _Skill,this.m_LineBox.getNextHighestDepth());
         _loc2_.Name = _Skill;
         _loc2_.Data = [];
      }
      return _loc2_;
   }
   function Search_Parent(_Parent, _DType)
   {
      for(var _loc3_ in _Parent)
      {
         if(_Parent[_loc3_].ID == _DType)
         {
            return _Parent[_loc3_];
         }
      }
      return undefined;
   }
   function AllListClear()
   {
      for(var _loc2_ in this.m_LineBox)
      {
         if(typeof this.m_LineBox[_loc2_] == "movieclip")
         {
            if(this.m_LineBox[_loc2_]._visible)
            {
               this.ViewClear(this.m_LineBox[_loc2_].Name);
            }
         }
      }
   }
   function RemoveCategory(_Skill)
   {
      this.ViewClear(_Skill);
   }
   function ViewClear(_Skill)
   {
      var _loc2_ = this.m_LineBox["container_" + _Skill];
      _loc2_._visible = false;
      for(var _loc3_ in _loc2_)
      {
         if(typeof _loc2_[_loc3_] == "movieclip")
         {
            _loc2_[_loc3_]._y = 0;
            _loc2_[_loc3_]._visible = false;
         }
      }
   }
   function SetFocus(_Skill, _id)
   {
      var _loc2_ = this.m_LineBox["container_" + _Skill];
      if(this.s_PrevFocus != _id && this.s_PrevFocus != null)
      {
         _loc2_["3DL" + this.s_PrevFocus].SetFocus(false);
      }
      this.s_PrevFocus = _id;
      _loc2_["3DL" + _id].SetFocus(true);
   }
   function SetViewList(_skill, _data)
   {
      var _loc4_ = this.m_LineBox["container_" + _skill];
      this.a_VIewList = [];
      this.a_1DepthList = [];
      this.a_VIewList = lib.util.ExtString.split(_data,"\t");
      var _loc15_ = _loc4_.Data.length;
      var _loc6_ = 0;
      var _loc10_ = 0;
      while(_loc10_ < _loc15_)
      {
         var _loc13_ = _loc4_.Data[_loc10_];
         var _loc9_ = undefined;
         if(_loc4_["1DL" + _loc10_])
         {
            _loc9_ = _loc4_["1DL" + _loc10_];
         }
         else
         {
            _loc9_ = _loc4_.attachMovie("lineMc_1Depth","1DL" + _loc10_,_loc6_);
            _loc9_.Func = this.f_Function;
         }
         _loc13_.__set__Skin(_loc9_);
         _loc9_.Count(0,true);
         _loc6_ = _loc6_ + 1;
         this.a_1DepthList.push(_loc13_);
         var _loc12_ = _loc13_.__get__Child();
         var _loc14_ = _loc12_.length;
         var _loc8_ = 0;
         while(_loc8_ < _loc14_)
         {
            var _loc5_ = undefined;
            if(_loc4_["2DL" + _loc6_])
            {
               _loc5_ = _loc4_["2DL" + _loc6_];
            }
            else
            {
               _loc5_ = _loc4_.attachMovie("lineMc_2Depth","2DL" + _loc6_,_loc6_);
               _loc5_.Func = this.f_Function;
            }
            _loc12_[_loc8_].Skin = _loc5_;
            _loc5_.m_Parent = _loc9_;
            _loc5_._visible = false;
            _loc5_.Count(0,false);
            _loc6_ = _loc6_ + 1;
            var _loc7_ = _loc12_[_loc8_].Child;
            var _loc11_ = _loc7_.length;
            var _loc3_ = 0;
            while(_loc3_ < _loc11_)
            {
               var _loc2_ = undefined;
               if(_loc4_["3DL" + _loc7_[_loc3_].ID])
               {
                  _loc2_ = _loc4_["3DL" + _loc7_[_loc3_].ID];
               }
               else
               {
                  _loc2_ = _loc4_.attachMovie("lineMc_3Depth","3DL" + _loc7_[_loc3_].ID,_loc6_);
                  _loc2_.Func = this.f_Function;
               }
               _loc2_.bg.gotoAndStop(1);
               _loc7_[_loc3_].Skin = _loc2_;
               _loc2_.m_Parent = _loc5_;
               _loc2_._visible = false;
               _loc6_ = _loc6_ + 1;
               _loc3_ = _loc3_ + 1;
            }
            _loc8_ = _loc8_ + 1;
         }
         _loc10_ = _loc10_ + 1;
      }
      this.SetLinePosition(_skill,true);
   }
   function SetLinePosition(_skill, _mode)
   {
      var _loc15_ = this.m_LineBox["container_" + _skill];
      _loc15_._visible = true;
      var _loc16_ = this.a_1DepthList.length;
      var _loc17_ = this.a_VIewList.length;
      var _loc5_ = 0;
      var _loc13_ = 0;
      while(_loc13_ < _loc17_)
      {
         var _loc9_ = _loc15_["3DL" + this.a_VIewList[_loc13_]];
         if(_loc9_)
         {
            var _loc10_ = _loc9_.m_Parent;
            var _loc14_ = _loc10_.m_Parent;
            if(_mode)
            {
               _loc14_.Count(1,true);
               _loc10_.Count(1,false);
            }
            if(_loc14_.s_Folder == "CLOSE")
            {
               _loc9_._visible = false;
               _loc10_._visible = false;
            }
            else
            {
               _loc10_._visible = true;
               if(_loc10_.s_Folder == "CLOSE")
               {
                  _loc9_._visible = false;
               }
               else
               {
                  _loc9_._visible = true;
               }
            }
         }
         _loc13_ = _loc13_ + 1;
      }
      var _loc11_ = 0;
      while(_loc11_ < _loc16_)
      {
         var _loc12_ = this.a_1DepthList[_loc11_].Skin;
         _loc12_._y = _loc5_;
         _loc12_._visible = false;
         if(_loc12_.s_Folder != "CLOSE")
         {
            var _loc8_ = this.a_1DepthList[_loc11_].Child;
            var _loc4_ = 0;
            while(_loc4_ < _loc8_.length)
            {
               var _loc6_ = _loc8_[_loc4_].Skin;
               if(_loc6_._visible != false)
               {
                  _loc6_._y = _loc5_;
                  _loc5_ = _loc5_ + this.n_2DYPos;
                  if(_loc6_.s_Folder != "CLOSE")
                  {
                     var _loc7_ = _loc8_[_loc4_].Child;
                     var _loc2_ = 0;
                     while(_loc2_ < _loc7_.length)
                     {
                        var _loc3_ = _loc7_[_loc2_].Skin;
                        if(_loc3_._visible != false)
                        {
                           _loc3_._y = _loc5_;
                           _loc5_ = _loc5_ + this.n_3DYPos;
                        }
                        _loc2_ = _loc2_ + 1;
                     }
                  }
               }
               _loc4_ = _loc4_ + 1;
            }
         }
         _loc11_ = _loc11_ + 1;
      }
      this.m_Scroll.pageSize = _loc5_;
   }
}
