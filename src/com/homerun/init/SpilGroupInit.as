package com.homerun.init {
	import com.lachhhEngine.initializers.FGLVersionInit;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.io.externalAPI.scoreAPI.SpilGroupController;
	import com.spilgames.bs.BrandingManager;

	import flash.display.StageScaleMode;

	/**
	 * @author Lachhh
	 */
	public class SpilGroupInit extends FGLVersionInit {
		override protected function PreInit() : void {
			super.PreInit();
		
			
			stage.scaleMode = StageScaleMode.EXACT_FIT;
			//HB_VersionInfo.
			VersionInfo.defaultScaleMode = StageScaleMode.EXACT_FIT;
			
			VersionInfo.useSiteLock = true;
			VersionInfo.canBePlayedOffline = true;
			VersionInfo.urlsSiteLocks.push("agame.com", "xiaoyouxi.cn", "game.com.cn", "spilgames.com");
			VersionInfo.versionInfo = "v1.02";
			VersionInfo.debugVersion = false;
			
			var a10Link:String = "http://www.a10.com" ;
			VersionInfo.exclusiveStuffEnabled = false;
			VersionInfo.exclusiveStuffVisible = false;
			VersionInfo.sponsorSiteUrl = a10Link;//BrandingManager.getInstance().getMoreGamesLink();//VersionInfo.URL_SITE_SPIL_GROUP;//SpilGame.getMoreGamesLink();
			VersionInfo.sponsorSiteMoreGamesUrl = a10Link;//BrandingManager.getInstance().getMoreGamesLink(); //VersionInfo.URL_SITE_SPIL_GROUP;//SpilGame.getMoreGamesLink();
			VersionInfo.sponsorSiteThisGameUrl = a10Link;//BrandingManager.getInstance().getMoreGamesLink();//VersionInfo.URL_SITE_SPIL_GROUP;//SpilGame.getMoreGamesLink(); 
			VersionInfo.sponsorVisualFrame = VersionInfo.FRAME_SPIL_GROUP;

			VersionInfo.canShowBerzerkAnims = true;
			HB_VersionInfo.showFaceBookButton = false;
		}
	}
}
