package com.homerun.init {
	import flash.display.StageScaleMode;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.preloader.Chinese4399Preloader;
	import com.lachhhEngine.io.SiteLocking;

	/**
	 * @author Lachhh
	 */
	public class Chinese4399Init extends PlayHubInit {
		public function Chinese4399Init() {
		}

		override protected function PreInit() : void {
			super.PreInit();
			HB_VersionInfo.chineseEnabled = true;
			
			
			VersionInfo.defaultScaleMode = StageScaleMode.NO_SCALE; 
			VersionInfo.defaultLanguage = "cn";
			VersionInfo.defaultLanguageForcedOnLoad = true;
			VersionInfo.languageAvailables.push("cn");
			//VersionInfo.preloader = new Chinese4399Preloader("517", "d2f32de0b25929de", VersionInfo.preloader);
			
			// A enlever
			/*
			VersionInfo.urlsSiteLocks = [""];
			VersionInfo.preloader = new BerzerkPreloader(700, 550, "", null, null);
			*/			
			
		}

		/*override protected function get canPlay() : Boolean {
			return HostDomain.isHostedAt4399(this) ;
		}*/
	}
}
