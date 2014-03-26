package com.homerun.init {
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.MaxGamesNonExInit;

	/**
	 * @author Lachhh
	 */
	public class MaxGamesInit extends MaxGamesNonExInit {
		override protected function PreInit() : void {
			VersionInfo.gameTitle = "Berzerk Ball";
			super.PreInit();
			HB_VersionInfo.SetNonEx();
			
			VersionInfo.canShowBerzerkAnims = false;
			HB_VersionInfo.iphoneAds = false;
			
			//To remove
			//VersionInfo.urlsSiteLocks = [""];
			//VersionInfo.canBePlayedOffline = true;
			
			
			//var b:BERZERK_LOGO;
		}
	}
}
