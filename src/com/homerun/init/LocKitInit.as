package com.homerun.init {
	import com.lachhhEngine.initializers.BerzerkDebugVersionInit;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.GamerSafeController;
	import com.lachhhEngine.io.externalAPI.dataSharingAPI.GamerSafeFBDataShareAPI;
	import com.lachhhEngine.io.externalAPI.metricsAPI.SWFStatsController;
	import com.lachhhEngine.io.externalAPI.socialNetworkAPI.GamerSafeFBController;

	/**
	 * @author Lachhh
	 */
	public class LocKitInit extends BerzerkDebugVersionInit {

		override protected function PreInit() : void {
			super.PreInit();
			
			//VersionInfo.exclusiveStuffEnabled = true;
			//GB_VersionInfo.useMochiScore = false;
			
			HB_VersionInfo.SetNonEx();
			
			VersionInfo.canShowBerzerkAnims = true;
			HB_VersionInfo.iphoneAds = false;
			/*
			var gsController:GamerSafeController = new GamerSafeController("f259294531669b7544bc11b2714ce5e693022fdf", "G19d4c9fe383aef34270edc8a8aad5587199ab612e:1275363423");
			ExternalAPIManager.SetPremiumAPI(gsController);
			ExternalAPIManager.SetScoreAPI(gsController);
			ExternalAPIManager.SetSaveFileAPI(gsController);
			ExternalAPIManager.SetAchievementAPI(gsController);
			gsController.Connect(this);
			
			var gsFB:GamerSafeFBController = new GamerSafeFBController(gsController);  
			ExternalAPIManager.SetSocialNetwrokAPI(gsFB);
			
			var gsData:GamerSafeFBDataShareAPI = new GamerSafeFBDataShareAPI(gsController, gsFB);
			ExternalAPIManager.SetDataSharing(gsData);
			gsData.Connect(this);
			
			var swfStats:SWFStatsController = new SWFStatsController(469, "34138484-e21d-4000-a096-9af1d646c58d", this.loaderInfo.url);
			ExternalAPIManager.SetMetricsAPI(swfStats);
			swfStats.Connect(this);*/
			
			/*
			GB_VersionInfo.showSubmitButton = false;
			GB_VersionInfo.showHostThisGame = false;
			GB_VersionInfo.showWalkthroughButton = false;
			GB_VersionInfo.showSponsorMsg = false;*/
			
			HB_VersionInfo.loadExternalLanguage = true;
			
			VersionInfo.defaultLanguage = "fr";
			
			VersionInfo.urlsSiteLocks = [""];
			VersionInfo.showCannotPublishSticker = true;
			
		}
	}
}
