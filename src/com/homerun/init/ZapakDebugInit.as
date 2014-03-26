package com.homerun.init {
	import com.lachhhEngine.initializers.VersionInfo;

	/**
	 * @author Lachhh
	 */
	public class ZapakDebugInit extends ZapakInit {
		override protected function PreInit() : void {
			super.PreInit();
			VersionInfo.useSiteLock = false;
			VersionInfo.canBePlayedOffline = true;
		}
	}
}
