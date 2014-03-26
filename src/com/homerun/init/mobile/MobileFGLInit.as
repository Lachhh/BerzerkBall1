package com.homerun.init.mobile {
	import com.homerun.init.HB_VersionInfo;
	import com.lachhhEngine.initializers.FGLVersionInit;
	import com.lachhhEngine.initializers.nonExVersions.ZapakNonExInit;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;

	/**
	 * @author Lachhh
	 */
	public class MobileFGLInit extends FGLVersionInit {
		override protected function PreInit() : void {
			super.PreInit();
			ExternalAPIManager.SetScoreAPI(ZapakNonExInit.zapakPreloader);				
			HB_VersionInfo.SetNonEx();
		}
	}
}
