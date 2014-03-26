package com.homerun.init {
	import com.berzerkstudio.exported.BERZERK_LOGO;
	import com.berzerkstudio.exported.BERZERK_LOGO_STATIC;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.BerzerkNonExInit;
	import com.lachhhEngine.initializers.preloader.DynamicCPMPreloader;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.GamerSafeController;
	import com.lachhhEngine.io.externalAPI.metricsAPI.SWFStatsController;

	/**
	 * @author Lachhh
	 */
	public class BerzerkInit extends BerzerkNonExInit {
		override protected function PreInit() : void {
			super.PreInit();
			var gsController:GamerSafeController = new GamerSafeController("96f12135c5b5ed600ef8b58db49fb669ac4c0356", "G14ee377f9f31911e551069d128baeb778c5d61175:1263192510");
			ExternalAPIManager.SetAchievementAPI(gsController);
			ExternalAPIManager.SetPremiumAPI(gsController);
			ExternalAPIManager.SetSaveFileAPI(gsController);
			//ExternalAPIManager.SetScoreAPI(gsController);
			ExternalAPIManager.premiumAPI.Connect(this, new Callback(HB_VersionInfo.afterGSConnect, this, null));
			
			ExternalAPIManager.SetMetricsAPI(new SWFStatsController(189, "4dabe2ee-a65e-4f46-86b1-df0e26f27258", "", loaderInfo)); 
			
			HB_VersionInfo.canShowJig = false;
			VersionInfo.exclusiveStuffVisible = true;
			
			VersionInfo.preloader = new DynamicCPMPreloader(700, 550, "1886QC32435D5", new BERZERK_LOGO_STATIC(), null);
			HB_VersionInfo.cookieUrl = "http://www.berzerkstudio.com/games/homerun_in_berzerk_land/challenge.php?load";
			HB_VersionInfo.urlChallenge = "www.berzerkstudio.com/games/homerun_in_berzerk_land/challenge.php?friend=";
			
			var b:BERZERK_LOGO ;
			
			//VersionInfo.urlsSiteLocks = [""];
			//VersionInfo.canBePlayedOffline = true;
		}
	}
}
