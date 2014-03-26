package com.homerun.init {
	import com.lachhhEngine.initializers.preloader.berzerk.BerzerkPreloader;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.Initializer;

	/**
	 * @author Lachhh
	 */
	public class SiteLockTestInit extends Initializer {
		override protected function PreInit() : void {
			super.PreInit();
			VersionInfo.preloader = new BerzerkPreloader(700, 550, "", null, "");
			VersionInfo.useSiteLock = true;
			VersionInfo.urlsSiteLocks = [""];
		}
	}
}
