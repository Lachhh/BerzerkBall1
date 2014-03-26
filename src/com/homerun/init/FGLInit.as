package com.homerun.init {
	import com.berzerkstudio.exported.BERZERK_LOGO;
	import com.lachhhEngine.initializers.FGLVersionInit;
	import com.lachhhEngine.initializers.VersionInfo;
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
	public class FGLInit extends FGLVersionInit {
		private const SITELOCK_AGAME:String = "agame.com";
		
		public function FGLInit() {
		}

		override protected function PreInit() : void {
			super.PreInit();
			var isOnKong:Boolean = SiteLocking.IsInSites(root, [VersionInfo.URL_SITELOCK_KONG]);
			
			
			var canShowAds:Boolean = !SiteLocking.IsInSites(root, 
				[
					VersionInfo.URL_SITELOCK_KONG,
					VersionInfo.URL_SITELOCK_FOG,
					SITELOCK_AGAME
				]);
				
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
			
			VersionInfo.sponsorSiteUrl = VersionInfo.sponsorSiteMoreGamesUrl = " http://www.nextplay.com/?utm_medium=brandedgames_external&utm_campaign=berzerk_ball&utm_source=ingame&utm_content=ingame&logo=2";
			VersionInfo.sponsorSiteThisGameUrl = " http://www.nextplay.com/?utm_medium=brandedgames_external&utm_campaign=berzerk_ball&utm_source=ingame&utm_content=ingame&logo=2" ;
			VersionInfo.exclusiveStuffVisible = true;
			
			VersionInfo.sponsorVisualFrame = VersionInfo.FRAME_NEXTPLAY;
			 
			
			var p:NextPlayPreloader = new NextPlayPreloader(700, 550);
			VersionInfo.preloader = p;
			//VersionInfo.canShowAds = !SiteLocking.IsInSites(this, ["cdn.kaisergames.de", "playhub.com", "addictinggames.com", "agame.com", "freeonlinegames.com", "armorgames.com", "bubblebox.com", "kongregate.com"]);
			
			if(canShowAds) {
				p.cpmstarId = "3604QF994ED37";
			}
			/*
			if(canShowAds) {
				VersionInfo.preloader = new DynamicCPMPreloader(700, 550, "3604QF994ED37", new NEXT(), new PLAYHUB_PREROLL());
			} else {
				VersionInfo.preloader = new NextPlayPreloader(700, 550);
			} */
			
			VersionInfo.canBePlayedOffline = true;
			//VersionInfo.urlsSiteLocks = [""];
			 
			var b:BERZERK_LOGO ;
		}
	}
}
