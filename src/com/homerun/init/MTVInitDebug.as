package com.homerun.init {
	import com.berzerkstudio.exported.ADDICTINGGAMES_SPLASH_SCREEN2;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.preloader.AddictingGamesPreloader;
	import com.lachhhEngine.initializers.preloader.berzerk.BerzerkPreloader;

	/**
	 * @author Lachhh
	 */
	dynamic public class MTVInitDebug extends MTVInit {

		override protected function PreInit() : void {
			super.PreInit();
			VersionInfo.urlsSiteLocks = [""];
			VersionInfo.preloader = new BerzerkPreloader(700, 550, "", null, "");
			
			VersionInfo.preloader = new AddictingGamesPreloader(700, 550, new ADDICTINGGAMES_SPLASH_SCREEN2(), VersionInfo.URL_SITE_ADDICTINGGAMES);
			
			HB_VersionInfo.mTVPlayerName = "Simon";
			HB_VersionInfo.mTVPlayerScore = 1234;
		}

		override public function get debugMode() : Boolean {
			return true;
		}
	}
}
