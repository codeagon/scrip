class lib.controls.S_3DepthList_Memory
{
   function S_3DepthList_Memory(_data)
   {
      this.o_Data = _data;
      this.a_Child = [];
   }
   function __get__ID()
   {
      return this.o_Data.Id;
   }
   function __get__Name()
   {
      return this.o_Data.Name;
   }
   function __get__Child()
   {
      return this.a_Child;
   }
   function __get__Skin()
   {
      return this.m_SkinMc;
   }
   function __get__Data()
   {
      return this.o_Data;
   }
   function __set__Data(_data)
   {
      this.o_Data = _data;
      this.UpDate();
      return this.__get__Data();
   }
   function __set__Skin(_skinMc)
   {
      if(_skinMc == undefined)
      {
         return undefined;
      }
      this.m_SkinMc = _skinMc;
      this.UpDate();
      return this.__get__Skin();
   }
   function AddChild(_chObj)
   {
      var _loc2_ = this.SearchChild(_chObj.__get__ID());
      if(_loc2_ == undefined)
      {
         this.a_Child.push(_chObj);
      }
   }
   function ClearChild()
   {
      this.a_Child = [];
   }
   function SearchChild(_id)
   {
      for(var _loc3_ in this.a_Child)
      {
         if(this.a_Child[_loc3_].ID == _id)
         {
            return this.a_Child[_loc3_];
         }
      }
      return undefined;
   }
   function UpDate()
   {
      if(this.m_SkinMc != undefined)
      {
         this.m_SkinMc.UpDate(this.__get__Data());
      }
   }
}
