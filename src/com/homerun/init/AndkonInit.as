package com.homerun.init {
	import com.berzerkstudio.exported.BERZERK_LOGO;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.AndkonNonExInit;

	/**
	 * @author Lachhh
	 */
	public class AndkonInit extends AndkonNonExInit {
		override protected function PreInit() : void {
			super.PreInit();
			HB_VersionInfo.SetNonEx();
			
			VersionInfo.sponsorSiteUrl = VersionInfo.sponsorSiteMoreGamesUrl = "http://www.andkon.com/arcade/";

					
			//VersionInfo.urlsSiteLocks = [""];
			//VersionInfo.canBePlayedOffline = true;
			
			HB_VersionInfo.showFaceBookButton = false;
			HB_VersionInfo.iphoneAds = false;
			var b:BERZERK_LOGO;
		}
	}
}
