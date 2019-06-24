class lib.gamedata.Item extends lib.gamedata.GameDataCoolTimeable
{
   var id = undefined;
   var img = null;
   var stackedNum = 0;
   var bStackable = 1;
   var disableState = 0;
   var grade = 0;
   var sealType = 0;
   var bMasterpiece = 0;
   var durability = 0;
   var bNew = 0;
   function Item(id)
   {
      super(id);
      if(typeof id == "object")
      {
         this.getPropInObject(id);
      }
      else
      {
         this.setId(id);
      }
   }
   function getId()
   {
      return this.id;
   }
   function setId(_id)
   {
      this.id = _id;
   }
   function getImg()
   {
      return this.img;
   }
   function setImg(_img)
   {
      this.img = _img;
   }
   function getStackedNum()
   {
      return this.stackedNum;
   }
   function setStackedNum(_stackedNum)
   {
      this.stackedNum = Number(_stackedNum);
   }
   function getStackable()
   {
      return this.bStackable;
   }
   function setStackable(_bStackable)
   {
      this.bStackable = Number(_bStackable);
   }
   function getDisableState()
   {
      return this.disableState;
   }
   function setDisableState(_disableState)
   {
      this.disableState = Number(_disableState);
   }
   function getGrade()
   {
      return this.grade;
   }
   function setGrade(_grade)
   {
      this.grade = Number(_grade);
   }
   function getSealType()
   {
      return this.sealType;
   }
   function setSealType(_sealType)
   {
      this.sealType = Number(_sealType);
   }
   function getMasterpiece()
   {
      return this.bMasterpiece;
   }
   function setMasterpiece(_bMasterpiece)
   {
      this.bMasterpiece = Number(_bMasterpiece);
   }
   function getDurability()
   {
      return this.durability;
   }
   function setDurability(_durability)
   {
      this.durability = Number(_durability);
   }
   function getIsNew()
   {
      return this.bNew;
   }
   function setIsNew(_bTrue)
   {
      this.bNew = _bTrue;
   }
   function updateData(dataObject)
   {
      this.getPropInObject(dataObject);
   }
   function checkEqual(data)
   {
      var _loc3_ = true;
      if(this.getId() != data.getId())
      {
         return false;
      }
      if(this.getImg() != data.getImg())
      {
         return false;
      }
      if(this.getStackedNum() != data.getStackedNum())
      {
         return false;
      }
      if(this.getStackable() != data.getStackable())
      {
         return false;
      }
      if(this.getDisableState() != data.getDisableState())
      {
         return false;
      }
      if(this.getGrade() != data.getGrade())
      {
         return false;
      }
      if(this.getSealType() != data.getSealType())
      {
         return false;
      }
      if(this.getMasterpiece() != data.getMasterpiece())
      {
         return false;
      }
      if(this.getDurability() != data.getDurability())
      {
         return false;
      }
      if(this.getIsNew() != data.getIsNew())
      {
         return false;
      }
      return _loc3_;
   }
   function getPropInObject(obj)
   {
      super(obj);
      for(var _loc5_ in obj)
      {
         var _loc3_ = obj[_loc5_];
         if(_loc5_ == "id" || _loc5_ == "ID")
         {
            this.setId(_loc3_);
         }
         else if(_loc5_ == "img")
         {
            this.setImg(_loc3_);
         }
         else if(_loc5_ == "stackedNum" || _loc5_ == "quantity")
         {
            this.setStackedNum(Number(_loc3_));
         }
         else if(_loc5_ == "bStackable" || _loc5_ == "stackable")
         {
            this.setStackable(Number(_loc3_));
         }
         else if(_loc5_ == "disableState" || _loc5_ == "disable")
         {
            this.setDisableState(Number(_loc3_));
         }
         else if(_loc5_ == "grade")
         {
            this.setGrade(Number(_loc3_));
         }
         else if(_loc5_ == "sealType" || _loc5_ == "seal")
         {
            this.setSealType(Number(_loc3_));
         }
         else if(_loc5_ == "bMasterpiece" || _loc5_ == "masterpiece")
         {
            this.setMasterpiece(Number(_loc3_));
         }
         else if(_loc5_ == "durability")
         {
            this.setDurability(Number(_loc3_));
         }
         else if(_loc5_ == "bNew" || _loc5_ == "isNew")
         {
            this.setIsNew(Number(_loc3_));
         }
      }
   }
}
