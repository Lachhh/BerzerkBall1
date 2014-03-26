package com.homerun.init {
	import com.homerun.constants.HBConstants;
	import com.lachhhEngine.initializers.BerzerkDebugVersionInit;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.GamerSafeController;
	import com.lachhhEngine.io.externalAPI.metricsAPI.SWFStatsController;

	/**
	 * @author Lachhh
	 */
	public class BalancingInit extends BerzerkDebugVersionInit {
		override protected function PreInit() : void {
			super.PreInit();
			var gsController:GamerSafeController = new GamerSafeController("96f12135c5b5ed600ef8b58db49fb669ac4c0356", "G14ee377f9f31911e551069d128baeb778c5d61175:1263192510");
			ExternalAPIManager.SetAchievementAPI(gsController);
			ExternalAPIManager.SetPremiumAPI(gsController);
			ExternalAPIManager.SetSaveFileAPI(gsController);
			ExternalAPIManager.SetScoreAPI(gsController);
			ExternalAPIManager.SetMetricsAPI(new SWFStatsController(1291, "86761e4a931f", "", loaderInfo));
			VersionInfo.canBePlayedOffline = true;
			//HB_VersionInfo.traceExternalConstant = true;
			
			HB_VersionInfo.showSponsorMsg = false;
			HB_VersionInfo.loadExternalConstant = true;
			
			ExternalAPIManager.premiumAPI.Connect(this, new Callback(HB_VersionInfo.afterGSConnect, this, null));
			//HB_VersionInfo.loadExternalLanguage = true;
			//HB_VersionInfo.challengeWith = HB_VersionInfo.GetChallengerFromURL(this);
			HBConstants.instance.Init();
		}
	}
}
