class g4.view.soloDungeon.SoloDungeon_DungeonResult extends MovieClip
{
   function SoloDungeon_DungeonResult()
   {
      super();
   }
   function onLoad()
   {
      this.mTitle.textField.text = lib.util.UIString.getUIString("$461055");
      this.mClearTime.textField.text = lib.util.UIString.getUIString("$461056");
      this.mBestTime.tBestTime.text = lib.util.UIString.getUIString("$461057");
      this.mBestTime.tNewRecord.text = lib.util.UIString.getUIString("$461058");
      this.mNewRecord.stop();
      this.mNewRecord._visible = false;
   }
   function initButton($buttonHandler)
   {
      this.bBoard = (lib.controls.S_TxtBtn)this.mButtonGroup.bBoard;
      this.bClose = (lib.controls.S_TxtBtn)this.mButtonGroup.bClose;
      this.bBoard.__get__txtBtn().setText(lib.util.UIString.getUIString("$461059"));
      this.bClose.__get__txtBtn().setText(lib.util.UIString.getUIString("$461060"));
      this.bBoard.__get__txtBtn().setRelease(com.bluehole.teraUI.util.Delegate.create(this,$buttonHandler,3));
      this.bClose.__get__txtBtn().setRelease(com.bluehole.teraUI.util.Delegate.create(this,$buttonHandler,4));
   }
   function dungeonResult($clearTime, $bestTime, $isBest)
   {
      if($isBest)
      {
         this.mClearTimeValue.textField.textColor = 8447772;
         this.mBestTime.tNewRecord._visible = true;
         this.mBestTime.tBestTime._visible = false;
         this.mBestTime.tBestTimeValue._visible = false;
         this.mNewRecord.gotoAndPlay(2);
         this.mNewRecord._visible = true;
      }
      else
      {
         this.mClearTimeValue.textField.textColor = 9685238;
         this.mBestTime.tNewRecord._visible = false;
         this.mBestTime.tBestTime._visible = true;
         this.mBestTime.tBestTimeValue._visible = true;
         this.mBestTime.tBestTimeValue.text = $bestTime;
         this.mBestTime.tBestTime._width = Math.round(this.mBestTime.tBestTime.textWidth + 4);
         this.mBestTime.tBestTimeValue._width = Math.round(this.mBestTime.tBestTimeValue.textWidth + 4);
         var _loc2_ = Math.round((415 - (this.mBestTime.tBestTime._width + this.mBestTime.tBestTimeValue._width + 7)) / 2);
         this.mBestTime.tBestTime._x = _loc2_;
         _loc2_ = _loc2_ + (this.mBestTime.tBestTime._width + 7);
         this.mBestTime.tBestTimeValue._x = _loc2_;
         this.mNewRecord.stop();
         this.mNewRecord._visible = false;
      }
      this.mClearTimeValue.textField.text = $clearTime;
      this.gotoAndPlay(2);
   }
}
