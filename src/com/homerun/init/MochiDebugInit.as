package com.homerun.init {
	import com.lachhhEngine.initializers.preloader.berzerk.BerzerkPreloader;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.io.SiteLocking;

	/**
	 * @author Lachhh
	 */
	dynamic public class MochiDebugInit extends MochiInit {
		private const SITELOCK_AGAME:String = "agame.com";
		override protected function PreInit() : void {
			super.PreInit();
				
			
			VersionInfo.preloader = new BerzerkPreloader(640, 480, "", null, "");
			
			VersionInfo.canShowBerzerkAnims = false;
			VersionInfo.canBePlayedOffline = false;
			VersionInfo.useSiteLock = true;
			VersionInfo.urlsSiteLocks = [];
			var canShowAds:Boolean = !SiteLocking.IsInSites(root, 
				[ 
					VersionInfo.URL_SITELOCK_KONG,
					VersionInfo.URL_SITELOCK_FOG,
					SITELOCK_AGAME
				]);
				
		}
	}
}
