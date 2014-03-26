package com.homerun.init {
	import com.berzerkstudio.exported.BERZERK_LOGO;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.GatchaNonExInit;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.GatchaController;

	import flash.display.StageScaleMode;

	/**
	 * @author Lachhh
	 */
	public class HB_Gatcha extends GatchaNonExInit {
		private var _gatchaControll:GatchaController;
		override protected function PreInit() : void {
			super.PreInit();
			VersionInfo.versionInfo = "v1.00";
			VersionInfo.exclusiveStuffVisible = VersionInfo.exclusiveStuffEnabled = true;
			
			_gatchaControll = new GatchaController();
			_gatchaControll.Connect(this);
			
			ExternalAPIManager.SetAchievementAPI(_gatchaControll);
			ExternalAPIManager.SetPremiumAPI(_gatchaControll);
			ExternalAPIManager.SetSaveFileAPI(_gatchaControll);
			ExternalAPIManager.SetScoreAPI(_gatchaControll);
			VersionInfo.canShowAds = false;
			
			HB_VersionInfo.useViralFeature = false;
			HB_VersionInfo.showViralAchievement = false;
			HB_VersionInfo.showSponsorPromo = false;
			HB_VersionInfo.showHostBtn = false;
			HB_VersionInfo.useMochiTrack = false ;
			
			
			
			VersionInfo.defaultScaleMode = StageScaleMode.NO_SCALE;
			
			HB_VersionInfo.showPremiumTab = true;
			
			
			var b:BERZERK_LOGO;
			//VersionInfo.urlsSiteLocks = [""];
			//VersionInfo.canBePlayedOffline = true;
			
			//GB_VersionInfo.useViralFeature = false;
		}
	}
}
