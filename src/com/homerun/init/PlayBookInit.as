package com.homerun.init {
	import com.adobe.licensing.LicenseManager;
	import com.berzerkstudio.exported.BERZERK_LOGO;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.NextPlayNonInit;
	import com.lachhhEngine.initializers.preloader.NextPlayPreloader;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.SiteLocking;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.GamerSafeController;
	import com.lachhhEngine.io.externalAPI.metricsAPI.SWFStatsController;
	import com.lachhhEngine.io.externalAPI.premiumAPI.KongAPIController;

	/**
	 * @author Lachhh
	 */
	public class PlayBookInit extends NextPlayNonInit {
		private const SITELOCK_AGAME:String = "agame.com";
		
		
		/**
		 * MY_APPLICATION_KEY is a unique 32 digit GUID value that you must create for your
		 * application.  The number is immutable for the lifetime of the application.
		 */
		private static const MY_APPLICATION_KEY:String = "EDA4775B-FAA2-C604-3A5A-5DB00E5DD70C";
		
		/**
		 * If true, the implementation should check for app updates and facilitate the app
		 * update process. If false, no update should be performed.
		 */
		private static var UPDATE_MODE:Boolean = true;
		
		/**
		 * This parameter is used to facilitate the licensing during the development of the
		 * application. When debugMode = true, the license provider should display a UI that
		 * allows the developer to "skip" the licensing check, or "reset/clear" the current
		 * license.checkLicense
		 */
		private static var DEBUG_MODE:Boolean = false;
		

		override protected function PreInit() : void {
			super.PreInit();
			var licenseManager:LicenseManager = new LicenseManager();
			licenseManager.checkLicense( this, MY_APPLICATION_KEY, UPDATE_MODE, DEBUG_MODE );
			
			
			var isOnKong:Boolean = SiteLocking.IsInSites(root, [VersionInfo.URL_SITELOCK_KONG]);
			
			HB_VersionInfo.useViralFeature = !SiteLocking.IsInSites(root, 
				[
					VersionInfo.URL_SITELOCK_KONG,
					SITELOCK_AGAME
				]);
			
			
			HB_VersionInfo.showFaceBookButton = !SiteLocking.IsInSites(root, 
				[
					SITELOCK_AGAME
				]); 
			
			
			VersionInfo.canHaveExternalLinks = HB_VersionInfo.sponsorLogoClickable = !SiteLocking.IsInSites(root, 
				[
					SITELOCK_AGAME
				]);	
			
			
			HB_VersionInfo.useViralFeature = false;
			
			if(HB_VersionInfo.useViralFeature) {
				var gsController:GamerSafeController = new GamerSafeController("96f12135c5b5ed600ef8b58db49fb669ac4c0356", "G14ee377f9f31911e551069d128baeb778c5d61175:1263192510");
				ExternalAPIManager.SetAchievementAPI(gsController);
				ExternalAPIManager.SetPremiumAPI(gsController);
				ExternalAPIManager.SetSaveFileAPI(gsController);
				//ExternalAPIManager.SetScoreAPI(gsController);
				ExternalAPIManager.premiumAPI.Connect(this, new Callback(HB_VersionInfo.afterGSConnect, this, null)); 
			} else {
				if(isOnKong) {
					var kongController:KongAPIController = new KongAPIController();
					ExternalAPIManager.SetPremiumAPI(kongController);
					kongController.Connect(this);
					HB_VersionInfo.showViralAchievement = false;
				} else {
					HB_VersionInfo.showSponsorPromo = true;
				}	
			}
			
			//DEBUG
			/*
			HB_VersionInfo.useViralFeature = false;
			HB_VersionInfo.showViralAchievement = false;
			var kongController:KongAPIController = new KongAPIController();
			ExternalAPIManager.SetPremiumAPI(kongController);
			kongController.Connect(this);
			*/
			
			ExternalAPIManager.SetMetricsAPI(new SWFStatsController(1291, "86761e4a931f", "", loaderInfo));
			
			HB_VersionInfo.canShowJig = false;
			
			VersionInfo.sponsorSiteUrl = VersionInfo.sponsorSiteMoreGamesUrl = "http://www.nextplay.com/?utm_medium=brandedgames_external&utm_campaign=berzerk_ball&utm_source=ingame&utm_content=ingame&logo=2";
			VersionInfo.sponsorSiteThisGameUrl = "http://www.nextplay.com/?utm_medium=brandedgames_external&utm_campaign=berzerk_ball&utm_source=ingame&utm_content=ingame&logo=2" ;
			VersionInfo.exclusiveStuffVisible = true; 
			
			var p:NextPlayPreloader = (VersionInfo.preloader) as NextPlayPreloader;
			
			VersionInfo.canShowAds = !SiteLocking.IsInSites(this, ["berzerkstudio.com", "cdn.kaisergames.de", "playhub.com", "nextplay.com", "addictinggames.com", "agame.com", "freeonlinegames.com", "armorgames.com", "bubblebox.com", "kongregate.com"]);
			
			if(VersionInfo.canShowAds) {
				p.cpmstarId = "3604QF994ED37";
			}
			/*
			if(canShowAds) {
				VersionInfo.preloader = new DynamicCPMPreloader(700, 550, "3604QF994ED37", new NEXT(), new PLAYHUB_PREROLL());
			} else {
				VersionInfo.preloader = new NextPlayPreloader(700, 550);
			} */
			
			
			VersionInfo.canBePlayedOffline = true;
			VersionInfo.useSiteLock = false;
			VersionInfo.versionInfo = "v1.13";
			var b:BERZERK_LOGO ;
		}
	}
}
