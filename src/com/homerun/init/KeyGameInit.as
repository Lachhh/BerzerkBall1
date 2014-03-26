package com.homerun.init {
	import com.homerun.io.keygames.KeyGamesScoreController;
	import com.berzerkstudio.exported.BERZERK_LOGO;
	import com.homerun.io.keygames.KeyGamesPreloader;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.KeyGamesNonExInit;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.scoreAPI.KeyGamesNetworkController;

	import flash.net.LocalConnection;

	/**
	 * @author Lachhh
	 */
	public class KeyGameInit extends KeyGamesNonExInit {
		override protected function PreInit() : void {
			
			super.PreInit();
			HB_VersionInfo.SetNonEx();
			
			VersionInfo.canShowBerzerkAnims = true;
			HB_VersionInfo.iphoneAds = false;
			
			var kg:KeyGamesScoreController = new KeyGamesScoreController("homerun-in-berzerkland");
			kg.Connect(this);
			
			ExternalAPIManager.SetScoreAPI(kg);
			
			VersionInfo.versionInfo = "v1.05";
			HB_VersionInfo.showFaceBookButton = false;
			
			/*if(SiteLocking.IsInSite(this, VersionInfo.URL_SITELOCK_SPELE_NL)) {
				VersionInfo.sponsorSiteUrl = "http://spele.nl/games/sport/honkbal/?utm_source=games&utm_medium=exclusives&utm_campaign=homerun-in-berzerk-Land";
				VersionInfo.defaultLanguage = "du";
				VersionInfo.defaultLanguageForcedOnLoad = true;
			} else {
				VersionInfo.sponsorSiteUrl = "http://keygames.com/games/sport/baseball/?utm_source=games&utm_medium=exclusives&utm_campaign=homerun-in-bezerk-land";
			}*/
			
			var localConnection:LocalConnection = new LocalConnection();
			var localDomainName:String = localConnection.domain;
			VersionInfo.sponsorSiteUrl = "http://keygames.com/games/sport/baseball/?utm_source="+ localDomainName + "&utm_medium=exclusives&utm_campaign=homerun-in-berzerkland";
			VersionInfo.preloader = new KeyGamesPreloader(700, 550, "homerun-in-berzerkland");
				
			VersionInfo.languageAvailables = ["en", "du"];
			
			VersionInfo.urlsSiteLocks.push("keygamesnetwork.com");
			
			//To remove
			//VersionInfo.urlsSiteLocks = [""];
			//VersionInfo.canBePlayedOffline = true;
			
			var b:BERZERK_LOGO;
		}
	}
}
