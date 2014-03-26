package com.homerun.init {
	import com.berzerkstudio.exported.ADDICTINGGAMES_SPLASH_SCREEN2;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.AddictingGamesNonExInit;
	import com.lachhhEngine.initializers.preloader.AddictingGamesPreloader;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.premiumAPI.MTVVirtualGoodsController;

	import flash.display.StageScaleMode;

	/**
	 * @author Lachhh
	 */
	dynamic public class MTVInit extends AddictingGamesNonExInit {
		static private var _mtvController:MTVVirtualGoodsController ; 
		override protected function PreInit() : void {
			super.PreInit();
			VersionInfo.versionInfo = "(mtv v1.09)";
			VersionInfo.exclusiveStuffEnabled = true;
			VersionInfo.exclusiveStuffVisible = true;
			VersionInfo.sponsorSiteThisGameUrl =  VersionInfo.sponsorSiteUrl; 
			
			_mtvController = new MTVVirtualGoodsController("6264", "homeruninberzerkland", debugMode);
			ExternalAPIManager.SetPremiumAPI(_mtvController);
			ExternalAPIManager.SetSaveFileAPI(_mtvController);
			
			VersionInfo.canBePlayedOffline = true;			
			ExternalAPIManager.premiumAPI.Connect(this, new Callback(onSuccess, this, null));
			
			HB_VersionInfo.useViralFeature = false;
			HB_VersionInfo.showViralAchievement = false;
			HB_VersionInfo.showSponsorPromo = false;
			HB_VersionInfo.showHostBtn = false;
			HB_VersionInfo.useMochiTrack = false ;
			VersionInfo.defaultScaleMode = StageScaleMode.NO_SCALE;
			HB_VersionInfo.showPremiumTab = true;
			
			HB_VersionInfo.iphoneAds = false;
			HB_VersionInfo.denizeSmallBoobs = true;
			
			VersionInfo.preloader = new AddictingGamesPreloader(700, 550, new ADDICTINGGAMES_SPLASH_SCREEN2(), VersionInfo.URL_SITE_ADDICTINGGAMES);
			
			//TO REMOVE
			//VersionInfo.debugVersion = true;
		}
		
		private function onSuccess():void {
			
		}
		
		
		
		public function get debugMode():Boolean {
			return false;	
		}
	}
}
