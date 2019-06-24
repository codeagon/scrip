class g4.view.mainMenu.DataSubMenu
{
   function DataSubMenu()
   {
   }
   function setData($id, $data)
   {
      this.MenuID = $id;
      var _loc2_ = lib.util.ExtString.split($data,"\t");
      this.SubID = _loc2_[0];
      this.MenuName = _loc2_[1];
      if(_loc2_[2] == null)
      {
         this.KeyName = "";
      }
      else
      {
         this.KeyName = _loc2_[2];
      }
      if(_loc2_[3] == null)
      {
         this.IconName = "";
      }
      else
      {
         this.IconName = _loc2_[3];
      }
      this.SubMenuContain = false;
      this.Tag = "";
      this.Effect = 0;
   }
}
