package com.homerun.init {
	import com.berzerkstudio.exported.BERZERK_LOGO;
	import com.berzerkstudio.exported.PLAYHUB_LOGO;
	import com.berzerkstudio.exported.PLAYHUB_PREROLL;
	import com.lachhhEngine.initializers.BerzerkDebugVersionInit;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.preloader.DynamicCPMPreloader;
	import com.lachhhEngine.initializers.preloader.PlayHubPreloader;
	import com.lachhhEngine.initializers.preloader.berzerk.BerzerkPreloader;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.SiteLocking;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.GamerSafeController;
	import com.lachhhEngine.io.externalAPI.metricsAPI.SWFStatsController;

	/**
	 * @author Lachhh
	 */
	public class DebugInit extends BerzerkDebugVersionInit {
		private const SITELOCK_AGAME:String = "agame.com";
		override protected function PreInit() : void {
			super.PreInit();
			
			
			
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
				ExternalAPIManager.SetScoreAPI(gsController);
				ExternalAPIManager.premiumAPI.Connect(this, new Callback(HB_VersionInfo.afterGSConnect, this, null));
			
			} else {
				HB_VersionInfo.showSponsorPromo = true;	
			}
			ExternalAPIManager.SetMetricsAPI(new SWFStatsController(1291, "86761e4a931f", "", loaderInfo));
			
			HB_VersionInfo.canShowJig = false;
			
			VersionInfo.sponsorSiteUrl = VersionInfo.sponsorSiteMoreGamesUrl = "http://www.playhub.com/?utm_medium=brandedgames_external&utm_campaign=homerun_bezerk&utm_source=ingame&utm_content=ingame";
			VersionInfo.sponsorSiteThisGameUrl = "http://www.playhub.com/fun-games/6282/Homerun-in-Berzerk-Land.html" ;
			VersionInfo.exclusiveStuffVisible = true;
			
			//VersionInfo.canShowBerzerkAnims = true;  
			/*
			if(canShowAds) {
				VersionInfo.preloader = new DynamicCPMPreloader(700, 550, "1886QC32435D5", new PLAYHUB_LOGO(), new PLAYHUB_PREROLL());
			} else {
				VersionInfo.preloader = new PlayHubPreloader(700, 550, new PLAYHUB_PREROLL(), VersionInfo.sponsorSiteUrl, HB_VersionInfo.sponsorLogoClickable);
			} 
			*/
			//VersionInfo.showCannotPublishSticker = true;
			
			//VersionInfo.urlsSiteLocks.push("");
			//VersionInfo.canBePlayedOffline = true;
			//VersionInfo.useSiteLock = false;
			
			HB_VersionInfo.showFaceBookButton = false;
			 
			var b:BERZERK_LOGO ;
		}
	}
}
