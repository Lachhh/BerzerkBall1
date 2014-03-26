package com.homerun.init {
	import com.lachhhEngine.games.teams.TeamFactory;
	import com.lachhhEngine.initializers.nonExVersions.NextPlayNonInit;
	import com.berzerkstudio.exported.BERZERK_LOGO;
	import com.berzerkstudio.exported.PLAYHUB_PREROLL;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.preloader.MochiPreloader;
	import com.lachhhEngine.initializers.preloader.NextPlayPreloader;
	import com.lachhhEngine.initializers.preloader.PlayHubPreloader;
	import com.lachhhEngine.io.SiteLocking;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.MochiCoinController;
	import com.lachhhEngine.io.externalAPI.metricsAPI.SWFStatsController;

	/**
	 * @author Lachhh
	 */
	dynamic public class MochiInit extends NextPlayNonInit {
		
		override protected function PreInit() : void {
			super.PreInit();
				
			HB_VersionInfo.useViralFeature = false;
			HB_VersionInfo.showViralAchievement = false;
			var mochiController:MochiCoinController = new MochiCoinController("84a9dc376b36737e");
			//ExternalAPIManager.SetAchievementAPI(mochiController);
			ExternalAPIManager.SetPremiumAPI(mochiController);
			ExternalAPIManager.SetSaveFileAPI(mochiController);
			
			ExternalAPIManager.SetScoreAPI(mochiController);
			ExternalAPIManager.premiumAPI.Connect(this); 
			
			ExternalAPIManager.SetMetricsAPI(new SWFStatsController(189, "4dabe2ee-a65e-4f46-86b1-df0e26f27258", "", loaderInfo));
			
			
			HB_VersionInfo.canShowJig = false;
			
			VersionInfo.sponsorSiteUrl = VersionInfo.sponsorSiteMoreGamesUrl = "http://www.nextplay.com/?utm_medium=brandedgames_external&utm_campaign=berzerk_ball&utm_source=ingame&utm_content=ingame&logo=2";
			VersionInfo.sponsorSiteThisGameUrl = "http://www.nextplay.com/?utm_medium=brandedgames_external&utm_campaign=berzerk_ball&utm_source=ingame&utm_content=ingame&logo=2" ;

			VersionInfo.exclusiveStuffVisible = true; 
			
			HB_VersionInfo.useMochiTrack = true;
			
			VersionInfo.preloader = new MochiPreloader(700, 550, "ea29c36adcdaeccf", new NextPlayPreloader(700, 550));
			
			VersionInfo.canBePlayedOffline = true;
			VersionInfo.useSiteLock = false;

			var b:BERZERK_LOGO ;
		}
	}
}
