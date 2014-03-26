package com.homerun.init {
	import com.berzerkstudio.exported.BERZERK_LOGO;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.BubbleBoxNonExInit;

	/**
	 * @author Lachhh
	 */
	public class BubbleBoxInit extends BubbleBoxNonExInit {
		override protected function PreInit() : void {
			super.PreInit();
			HB_VersionInfo.SetNonEx();
			
			VersionInfo.sponsorSiteUrl = VersionInfo.sponsorSiteMoreGamesUrl = "http://www.bubblebox.com/";
			//VersionInfo.urlsSiteLocks.push("");
			VersionInfo.canBePlayedOffline = true;
			HB_VersionInfo.showFaceBookButton = false;
			
			var b:BERZERK_LOGO;
		}
	}
}
