package com.homerun.init {
	import com.berzerkstudio.exported.BERZERK_LOGO;
	import com.berzerkstudio.exported.PLAYHUB_LOGO;
	import com.berzerkstudio.exported.PLAYHUB_PREROLL;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.PlayHubNonInit;
	import com.lachhhEngine.initializers.preloader.DynamicCPMPreloader;
	import com.lachhhEngine.initializers.preloader.PlayHubPreloader;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.SiteLocking;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.GamerSafeController;
	import com.lachhhEngine.io.externalAPI.metricsAPI.SWFStatsController;
	import com.lachhhEngine.io.externalAPI.premiumAPI.KongAPIController;

	/**
	 * @author Lachhh
	 */
	public class KongDebugInit extends PlayHubNonInit {
		override protected function PreInit() : void {
			super.PreInit();
			
			
			
			//DEBUG
			
			HB_VersionInfo.useViralFeature = false;
			HB_VersionInfo.showViralAchievement = false;
			var kongController:KongAPIController = new KongAPIController();
			ExternalAPIManager.SetPremiumAPI(kongController);
			kongController.Connect(this);
			
			
			ExternalAPIManager.SetMetricsAPI(new SWFStatsController(189, "4dabe2ee-a65e-4f46-86b1-df0e26f27258", "", loaderInfo));
			
			HB_VersionInfo.canShowJig = false;
			
			VersionInfo.sponsorSiteUrl = VersionInfo.sponsorSiteMoreGamesUrl = "http://www.playhub.com/?utm_medium=brandedgames_external&utm_campaign=homerun_bezerk&utm_source=ingame&utm_content=ingame";
			VersionInfo.sponsorSiteThisGameUrl = "http://www.playhub.com/fun-games/6282/Homerun-in-Berzerk-Land.html" ;
			VersionInfo.exclusiveStuffVisible = true; 
			
			VersionInfo.preloader = new DynamicCPMPreloader(700, 550, "1886QC32435D5", new PLAYHUB_LOGO(), new PLAYHUB_PREROLL());
		
			 
			
			//VersionInfo.showCannotPublishSticker = true;
			
			//VersionInfo.urlsSiteLocks.push("");
			VersionInfo.canBePlayedOffline = true;
			VersionInfo.useSiteLock = false;
			VersionInfo.showCannotPublishSticker = true;
			
			
			 
			var b:BERZERK_LOGO ;
		}
	}
}
