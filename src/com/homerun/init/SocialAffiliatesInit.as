package com.homerun.init {
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.SocialAffiliatesNonExInit;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.scoreAPI.SocialAffiliateScoreAPI;

	/**
	 * @author Lachhh
	 */
	public class SocialAffiliatesInit extends SocialAffiliatesNonExInit {

		override protected function PreInit() : void {
			super.PreInit();
			
			var f1:Font_ZOMBIE = new Font_ZOMBIE();
			var f2:Font_OZ = new Font_OZ() ;
			
			addChild(f1);
			addChild(f2);
			//Font.registerFont(FONT_ZOMBIE);
			//Font.registerFont(FONT_HANDICRAFT);
			
			
			var saAPI:SocialAffiliateScoreAPI = new SocialAffiliateScoreAPI();
			ExternalAPIManager.SetScoreAPI(saAPI);
			saAPI.Connect(this);
			
			
			HB_VersionInfo.showHostBtn = false;
			HB_VersionInfo.showFaceBookButton = false;
			HB_VersionInfo.SetNonEx();
			
			//TO REMOVE NOW
			//VersionInfo.useSiteLock = false;
			//VersionInfo.defaultScaleMode = StageScaleMode.NO_SCALE;
			
			//To remove on release : 
			//VersionInfo.urlsSiteLocks = [""];
			//VersionInfo.canBePlayedOffline = true;
		}
	}
}
