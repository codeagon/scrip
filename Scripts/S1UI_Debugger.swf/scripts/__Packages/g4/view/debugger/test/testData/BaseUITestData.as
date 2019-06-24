class g4.view.debugger.test.testData.BaseUITestData extends g4.view.debugger.test.testData.TestDataModel
{
   var uiMode = false;
   function BaseUITestData()
   {
      super("BaseUI",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("Stage 정보 출력",this,this.showStageInfo),new g4.view.debugger.test.testData.TestDataModel("UI 모드 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("O",this,this.setUIMode,[true]),new g4.view.debugger.test.testData.TestDataModel("X",this,this.setUIMode,[false])]),new g4.view.debugger.test.testData.TestDataModel("전체 UI 스케일 설정",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("30",this,this.OnGame_ScaleUI,[30]),new g4.view.debugger.test.testData.TestDataModel("50",this,this.OnGame_ScaleUI,[50]),new g4.view.debugger.test.testData.TestDataModel("80",this,this.OnGame_ScaleUI,[80]),new g4.view.debugger.test.testData.TestDataModel("90",this,this.OnGame_ScaleUI,[90]),new g4.view.debugger.test.testData.TestDataModel("100",this,this.OnGame_ScaleUI,[100]),new g4.view.debugger.test.testData.TestDataModel("110",this,this.OnGame_ScaleUI,[110]),new g4.view.debugger.test.testData.TestDataModel("120",this,this.OnGame_ScaleUI,[120]),new g4.view.debugger.test.testData.TestDataModel("150",this,this.OnGame_ScaleUI,[150]),new g4.view.debugger.test.testData.TestDataModel("200",this,this.OnGame_ScaleUI,[200])]),new g4.view.debugger.test.testData.TestDataModel("전투 UI 스케일 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("대상 UI 설정",null,null,null,this.getCombatUIScaleTestDataArray()),new g4.view.debugger.test.testData.TestDataModel("스케일 설정",this,null,null,[new g4.view.debugger.test.testData.TestDataModel("10",this,this.setCombatUIScale,[10]),new g4.view.debugger.test.testData.TestDataModel("20",this,this.setCombatUIScale,[20]),new g4.view.debugger.test.testData.TestDataModel("30",this,this.setCombatUIScale,[30]),new g4.view.debugger.test.testData.TestDataModel("40",this,this.setCombatUIScale,[40]),new g4.view.debugger.test.testData.TestDataModel("50",this,this.setCombatUIScale,[50]),new g4.view.debugger.test.testData.TestDataModel("60",this,this.setCombatUIScale,[60]),new g4.view.debugger.test.testData.TestDataModel("70",this,this.setCombatUIScale,[70]),new g4.view.debugger.test.testData.TestDataModel("80",this,this.setCombatUIScale,[80]),new g4.view.debugger.test.testData.TestDataModel("90",this,this.setCombatUIScale,[90]),new g4.view.debugger.test.testData.TestDataModel("100",this,this.setCombatUIScale,[100]),new g4.view.debugger.test.testData.TestDataModel("130",this,this.setCombatUIScale,[130]),new g4.view.debugger.test.testData.TestDataModel("150",this,this.setCombatUIScale,[150]),new g4.view.debugger.test.testData.TestDataModel("170",this,this.setCombatUIScale,[170]),new g4.view.debugger.test.testData.TestDataModel("200",this,this.setCombatUIScale,[200])])]),new g4.view.debugger.test.testData.TestDataModel("화면 해상도 설정",null,null,null,[new g4.view.debugger.test.testData.TestDataModel("1920x1080",this,this.OnGame_ChangeResolution,[1920,1080]),new g4.view.debugger.test.testData.TestDataModel("1280x720",this,this.OnGame_ChangeResolution,[1280,720]),new g4.view.debugger.test.testData.TestDataModel("1024x768",this,this.OnGame_ChangeResolution,[1024,768])])]);
      this.init();
   }
   function init()
   {
      this.configOnGFxPlayer();
   }
   function configOnGFxPlayer()
   {
      if(!g4.util.UIUtil.isGFxPlayer())
      {
         return undefined;
      }
      var _loc4_ = 80;
      lib.gamedata.DefaultData.AddDefaultUIData("uiscale",_loc4_);
      this.OnGame_ChangeResolution(1920,1080);
      var _loc3_ = Number(lib.gamedata.DefaultData.getDefaultUIData("uiscale").param0);
      if(isNaN(_loc3_))
      {
         _loc3_ = _loc4_;
      }
      this.OnGame_ScaleUI(_loc3_);
      var _loc2_ = lib.util.CoolTime;
      _loc2_.STR_SECOND = "";
      _loc2_.STR_MINUTE = "분";
      _loc2_.STR_HOUR = "시간";
      _loc2_.STR_DAY = "일";
      g4.util.Translator.init("","분","시간","일");
      this.setUIMode(true);
      var _loc5_ = {};
      _loc5_.onKeyDown = gfx.utils.Delegate.create(this,function()
      {
         if((var _loc0_ = Key.getCode()) === 192)
         {
            this.setUIMode(!this.uiMode);
         }
      }
      );
      Key.addListener(_loc5_);
      g4.view.debugger.test.GameInterfaceProxy.openUI(g4.view.ViewID.TOOL_TIP,null);
   }
   function setUIMode(value)
   {
      this.uiMode = value;
      this.OnGameEventChangeUIMode(this.uiMode);
   }
   function getCombatUIScaleTestDataArray()
   {
      var _loc6_ = [{id:lib.gamedata.CustomizedUIDataKey.UISCALE_CHARACTERWINDOW_PERCENT,stringID:"$231225"},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_MINIMAP_PERCENT,stringID:"$231226"},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_QUESTTASKINFO_PERCENT,stringID:"$231229"},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_SHORTCUT_PERCENT,stringID:"$231230"},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_MAINMENU_PERCENT,stringID:"$231231"},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_ABNORMALITY_PERCENT,stringID:"$231232"},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_GAGEBAR_PERCENT,stringID:"$231234"},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_PARTYWINDOW_PERCENT,stringID:"$231235"},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_CROSSHAIR_PERCENT,stringID:"$231236"},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_EXTSHORTCUT_PERCENT,stringID:"$231276"},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_PARTYWINDOWRAIDINFO_PERCENT,stringID:"$231286"},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_GAMECONTROLLERSHORTCUT_PERCENT,stringID:"$231288"},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_BFSCOREBOARD_PERCENT,stringID:"$231274"},{id:lib.gamedata.CustomizedUIDataKey.UISCALE_HOMUNSHORTCUT_PERCENT,stringID:"$231233"}];
      var _loc5_ = [];
      var _loc4_ = undefined;
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      var _loc7_ = _loc6_.length;
      _loc2_ = 0;
      while(_loc2_ < _loc7_)
      {
         _loc3_ = _loc6_[_loc2_];
         _loc4_ = new g4.view.debugger.test.testData.TestDataModel(lib.util.UIString.getUIString(_loc3_.stringID),this,this.setTargetCombatUI,[_loc3_.id]);
         _loc5_.push(_loc4_);
         _loc2_ = _loc2_ + 1;
      }
      return _loc5_;
   }
   function setTargetCombatUI(id)
   {
      this.targetCombatUIID = id;
   }
   function setCombatUIScale(scalePercent)
   {
      if(this.targetCombatUIID == null)
      {
         return undefined;
      }
      this._setCombatUIScale(this.targetCombatUIID,scalePercent);
   }
   function _setCombatUIScale(id, scalePercent)
   {
      var _loc1_ = false;
      lib.gamedata.CustomizedUIDataCollection.getInstance().saveData(id,scalePercent,_loc1_);
   }
   function showStageInfo()
   {
      trace("Stage.visibleRect.left : " + Stage.visibleRect.left + "\n" + "Stage.visibleRect.right : " + Stage.visibleRect.right + "\n" + "Stage.visibleRect.top : " + Stage.visibleRect.top + "\n" + "Stage.visibleRect.bottom : " + Stage.visibleRect.bottom + "\n" + "Stage.visibleRect.width : " + Stage.visibleRect.width + "\n" + "Stage.visibleRect.height : " + Stage.visibleRect.height + "\n");
   }
   function OnGameEventChangeUIMode(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGameEventChangeUIMode",value);
   }
   function OnGame_ScaleUI(value)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_ScaleUI",value);
   }
   function OnGame_ChangeResolution(w, h)
   {
      g4.view.debugger.test.GameInterfaceProxy.OnGameEvent("OnGame_ChangeResolution",w,h);
   }
}
