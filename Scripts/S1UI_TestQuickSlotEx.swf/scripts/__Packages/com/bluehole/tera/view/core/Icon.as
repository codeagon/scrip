class com.bluehole.tera.view.core.Icon extends gfx.core.UIComponent
{
   static var EVENT_ICON_SET_ICON = "Icon/setIcon";
   var iconIndex = -1;
   var dataChanged = false;
   var _TEX = "";
   var _grade = 0;
   var _luxury = false;
   function Icon()
   {
      super();
   }
   function __get__iconWidth()
   {
      return this._iconWidth;
   }
   function __set__iconWidth(value)
   {
      if(this.mCoverImage != null)
      {
         this._iconWidth = this.mCoverImage._width;
      }
      else
      {
         this._iconWidth = value;
      }
      this.invalidateData();
      return this.__get__iconWidth();
   }
   function __get__iconHeight()
   {
      return this._iconHeight;
   }
   function __set__iconHeight(value)
   {
      if(this.mCoverImage != null)
      {
         this._iconHeight = this.mCoverImage._height;
      }
      else
      {
         this._iconHeight = value;
      }
      this.invalidateData();
      return this.__get__iconHeight();
   }
   function __get__TEX()
   {
      return this._TEX;
   }
   function __set__TEX(value)
   {
      if(this._TEX == value)
      {
         return undefined;
      }
      this._TEX = value;
      this.invalidateData();
      return this.__get__TEX();
   }
   function __get__grade()
   {
      return this._grade;
   }
   function __set__grade(value)
   {
      if(this._grade == value)
      {
         return undefined;
      }
      this._grade = value;
      this.invalidateData();
      return this.__get__grade();
   }
   function __get__luxury()
   {
      return this._luxury;
   }
   function __set__luxury(value)
   {
      if(this._luxury == value)
      {
         return undefined;
      }
      this._luxury = value;
      this.invalidateData();
      return this.__get__luxury();
   }
   function configUI()
   {
      super.configUI();
      this.luxuryMc._visible = false;
      this.scale9Grid = new flash.geom.Rectangle(0,0,this.__get__width(),this.__get__height());
   }
   function draw()
   {
      if(this.dataChanged)
      {
         this.dataChanged = false;
         this.bitmapIcons = flash.display.BitmapData.loadBitmap(this._TEX);
         if(this._TEX != "" && this.bitmapIcons)
         {
            if(this.iconImg != null)
            {
               this.iconImg.removeMovieClip();
               this.iconImg = null;
            }
            this.iconImg = this.iconContainer.createEmptyMovieClip("_iconImg",0);
            this.iconImg.attachBitmap(this.bitmapIcons,this.iconImg.getNextHighestDepth(),"auto",true);
            this.iconImg.hitTestDisable = true;
            this.iconImg.focusEnabled = false;
            this.iconImg._width = this._iconWidth;
            this.iconImg._height = this._iconHeight;
            this.gradeIconMc.__set__grade(this._grade);
            this.luxuryMc._visible = this._luxury;
            if(this.mCoverImage != null)
            {
               this.mCoverImage._visible = true;
            }
         }
         else if(this._TEX == "")
         {
            if(this.bitmapIcons)
            {
               this.bitmapIcons.dispose();
               this.bitmapIcons = null;
            }
            if(this.iconImg)
            {
               this.iconImg.removeMovieClip();
               this.iconImg = null;
            }
            this.gradeIconMc.__set__grade(0);
            this.luxuryMc._visible = false;
            if(this.mCoverImage != null)
            {
               this.mCoverImage._visible = false;
            }
         }
         this.dispatchEvent({type:"dataChange"});
      }
   }
   function setIcon(textureName, iconIndex)
   {
      this.__set__TEX("img://" + textureName);
      this.iconIndex = iconIndex;
      this.invalidateData();
      this.dispatchEvent({type:com.bluehole.tera.view.core.Icon.EVENT_ICON_SET_ICON});
   }
   function removeIcon()
   {
      this._TEX = "";
      if(this.bitmapIcons)
      {
         this.bitmapIcons.dispose();
         this.bitmapIcons = null;
      }
      if(this.iconImg)
      {
         this.iconImg.removeMovieClip();
         this.iconImg = null;
      }
      this.mCoverImage._visible = false;
      this.iconIndex = -1;
      this._grade = 0;
      if(this.gradeIconMc)
      {
         this.gradeIconMc.__set__grade(0);
      }
      this._luxury = false;
      if(this.luxuryMc)
      {
         this.luxuryMc._visible = false;
      }
      this.dispatchEvent({type:com.bluehole.tera.view.core.Icon.EVENT_ICON_SET_ICON});
   }
   function invalidateData()
   {
      this.dataChanged = true;
      this.invalidate();
   }
}
