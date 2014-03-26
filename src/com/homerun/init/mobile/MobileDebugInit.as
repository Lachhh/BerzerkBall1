package com.homerun.init.mobile {
	import com.homerun.init.HB_VersionInfo;
	import com.lachhhEngine.initializers.BerzerkDebugVersionInit;

	/**
	 * @author Lachhh
	 */
	public class MobileDebugInit extends BerzerkDebugVersionInit {
		override protected function PreInit() : void {
			super.PreInit();
			HB_VersionInfo.SetNonEx();
		}
	}
}
