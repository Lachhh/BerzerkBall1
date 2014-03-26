package com.homerun.init {
	import com.berzerkstudio.exported.BERZERK_LOGO;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.BerzerkNonExInit;
	import com.lachhhEngine.io.SiteLocking;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.metricsAPI.SWFStatsController;

	/**
	 * @author Lachhh
	 */
	public class DebugAIRInit extends BerzerkNonExInit {
		
		private const SITELOCK_AGAME:String = "agame.com";
		
		/**
		 * MY_APPLICATION_KEY is a unique 32 digit GUID value that you must create for your
		 * application.  The number is immutable for the lifetime of the application.
		 */
		private static const MY_APPLICATION_KEY:String = "86E12B78-95CC-6C2D-DE1D-C1FEFA8259B8";
		
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
		private static var DEBUG_MODE:Boolean = true;
				
				
		override protected function PreInit() : void {
			super.PreInit();
			
			//var licenseManager:LicenseManager = new LicenseManager();
			//licenseManager.checkLicense( this, MY_APPLICATION_KEY, UPDATE_MODE, DEBUG_MODE );
		
			
		
			ExternalAPIManager.SetMetricsAPI(new SWFStatsController(1291, "86761e4a931f", "", loaderInfo));
			
			HB_VersionInfo.useViralFeature = false;
			HB_VersionInfo.canShowJig = false;
			
			VersionInfo.exclusiveStuffVisible = false; 
			/*
			if(canShowAds) {
				VersionInfo.preloader = new DynamicCPMPreloader(700, 550, "1886QC32435D5", new PLAYHUB_LOGO(), new PLAYHUB_PREROLL());
			} else {
				VersionInfo.preloader = new PlayHubPreloader(700, 550, new PLAYHUB_PREROLL(), VersionInfo.sponsorSiteUrl, HB_VersionInfo.sponsorLogoClickable);
			} 
			*/
			//VersionInfo.showCannotPublishSticker = true;
			
			//VersionInfo.defaultScaleMode = StageScaleMode.EXACT_FIT;
			VersionInfo.urlsSiteLocks = [""];
			VersionInfo.canBePlayedOffline = true;
			VersionInfo.useSiteLock = false;
			
			HB_VersionInfo.showFaceBookButton = false;
			 
			var b:BERZERK_LOGO ;
		}
	}
}
