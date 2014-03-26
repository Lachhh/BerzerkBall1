package com.homerun.init {
	import mochi.as3.MochiServices;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.JaludoNonInit;

	/**
	 * @author Lachhh
	 */
	public class JaludoInit extends JaludoNonInit {
		public function JaludoInit() {
		}

		override protected function PreInit() : void {
			super.PreInit();
			
			//Remove
			//VersionInfo.urlsSiteLocks = [""];
			//VersionInfo.canBePlayedOffline = true;
			
			VersionInfo.versionInfo = "v1.01 (Jaludo)";
			VersionInfo.canHaveExternalLinks = false;
			HB_VersionInfo.showHostBtn = false;
			HB_VersionInfo.showFaceBookButton = false;
			HB_VersionInfo.iphoneAds = false;
			HB_VersionInfo.showViralAchievement = false;
			HB_VersionInfo.useViralFeature = false;
			MochiServices.connect("6c8ba9ad58f41bdc", this);
		}

		override public function GetGameName() : String {
			return "Berzerk Ball";
		}

		override public function GetMochiBotKey() : String {
			return "fa2e9097";
		}

		override public function GetWouter() : String {
			return "2b9tf5tw";
		}
	}
}
