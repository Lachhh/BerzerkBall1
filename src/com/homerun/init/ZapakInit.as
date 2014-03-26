package com.homerun.init {
	import com.lachhhEngine.initializers.nonExVersions.ZapakNonExInit;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.scoreAPI.ZapakExternalController;

	/**
	 * @author Lachhh
	 */
	public class ZapakInit extends ZapakNonExInit {
		override protected function PreInit() : void {
			super.PreInit();
			ExternalAPIManager.SetScoreAPI(ZapakNonExInit.zapakPreloader);				
			HB_VersionInfo.SetNonEx();
			HB_VersionInfo.URL_FACEBOOK = "http://www.facebook.com/zapak";
			HB_VersionInfo.URL_TWITTER = "http://twitter.com/zapak_news";
		}

		override protected function CreateZapakController() : ZapakExternalController {
			return new ZapakExternalController("1343", "3", 700, 550, this);
		}
	}
}
