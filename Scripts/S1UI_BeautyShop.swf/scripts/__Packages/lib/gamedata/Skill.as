class lib.gamedata.Skill extends lib.gamedata.GameDataCoolTimeable
{
   var id = undefined;
   var img = "Inven_0_TEX";
   var stackedNum = 0;
   var disableState = 0;
   var crestState = 0;
   var bActive = 1;
   function Skill(id)
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
      this.crestArray = new Array();
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
   function getName()
   {
      return this.name;
   }
   function setName(_name)
   {
      this.name = _name;
   }
   function getDisableState()
   {
      return this.disableState;
   }
   function setDisableState(_disableState)
   {
      this.disableState = Number(_disableState);
   }
   function getCrestState()
   {
      return this.crestState;
   }
   function setCrestState(_crestState)
   {
      this.crestState = Number(_crestState);
   }
   function getActive()
   {
      return this.bActive;
   }
   function setActive(_bActive)
   {
      this.bActive = Number(_bActive);
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
      if(this.getName() != data.getName())
      {
         return false;
      }
      if(this.getDisableState() != data.getDisableState())
      {
         return false;
      }
      if(this.getCrestState != data.getCrestState())
      {
         return false;
      }
      if(this.getActive() != data.getActive())
      {
         return false;
      }
      return _loc3_;
   }
   function getPropInObject(obj)
   {
      super.getPropInObject(obj);
      for(var _loc5_ in obj)
      {
         var _loc3_ = obj[_loc5_];
         if(_loc5_ == "name")
         {
            this.setName(_loc3_);
         }
         else if(_loc5_ == "img")
         {
            this.setImg(_loc3_);
         }
         else if(_loc5_ == "stackedNum" || _loc5_ == "quantity")
         {
            this.setStackedNum(Number(_loc3_));
         }
         else if(_loc5_ == "disableState" || _loc5_ == "disable")
         {
            this.setDisableState(Number(_loc3_));
         }
         else if(_loc5_ == "crestState")
         {
            this.setCrestState(Number(_loc3_));
         }
         else if(_loc5_ == "bActive" || _loc5_ == "active")
         {
            this.setActive(Number(_loc3_));
         }
      }
   }
}
