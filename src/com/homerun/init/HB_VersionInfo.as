package com.homerun.init {
	import com.lachhhEngine.initializers.VersionInfo;

	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	/**
	 * @author Lachhh
	 */
	public class HB_VersionInfo {
		//http://www.adobe.com/devnet/facebook/
		//http://apiwiki.twitter.com/Libraries#ActionScript/Flash
		//http://www.berzerkstudio.com/games/homerun_in_berzerk_land?friend=caca
		//http://www.berzerkstudio.com/games/homerun_in_berzerk_land?friend=Test11_pzskdmo2
		static public var URL_BERZERK_FORUM : String = "http://www.berzerkstudio.com/forum";
		static public var URL_TWITTER : String = "http://twitter.com/berzerkstudio";
		static public var URL_FACEBOOK : String = "http://www.facebook.com/pages/Berzerk-Studio/184038174958740";
		
		static private var _loader:URLLoader;
		static private var _cookieUrl:String = "http://www.berzerkstudio.com/games/berzerk_ball/index.php?load";
		static private var _urlMc:String = "http://www.berzerkstudio.com";
		static private var _urlHa:String = "http://www.berzerkstudio.com";
		static private var _urlSn:String = "http://www.berzerkstudio.com";
		static private var _urlTm:String = "http://www.berzerkstudio.com";
		static private var _urlHb:String = "http://www.berzerkstudio.com";
		static private var _urlGb:String = "http://www.berzerkstudio.com";
		static private var _urlTb:String = "http://www.berzerkstudio.com";
		
		static private var _urliPhone:String = "http://itunes.apple.com/app/id406919685?mt=8#";
		
		static public const JIG_URL:String = "http://www.jayisgame.com";
		
		static private var _MTVPlayerName:String = "";
		static private var _MTVPlayerScore:int = 0;
		
		
		static private var _urlChallenge:String = "www.berzerkstudio.com/games/berzerk_ball?friend=";
		static private var _canShowJig:Boolean = false;
		static private var _loadExternalLanguage:Boolean = false;
		static private var _loadExternalConstant:Boolean ;
		static private var _traceExternalConstant:Boolean ;
		static private var _showSponsorMsg:Boolean = false;
		static private var _challengeWith:String = "";
		static private var _isOnPrimarySite:Boolean ;
		static private var _useViralFeature:Boolean = true;
		static private var _showSponsorPromo:Boolean = false;
		static private var _showFaceBookButton:Boolean = true;
		static private var _sponsorLogoClickable:Boolean = true;
		static private var _showHostBtn:Boolean = true;
		
		static private var _showViralAchievement:Boolean = true;
		static private var _chineseEnabled:Boolean = false;
		static private var _useMochiTrack:Boolean = true;						
		
		static private var _useExactFit:Boolean = true;
		static private var _showPremiumTab:Boolean = false;
		static private var _iphoneAds:Boolean = true;
		static private var _denizeSmallBoobs:Boolean = false;
		
		
		static public function get traceExternalConstant() : Boolean {
			return _traceExternalConstant;
			
		}
		
		static public function set traceExternalConstant(traceExternalConstant : Boolean) : void {
			_traceExternalConstant = traceExternalConstant;
		}
		
		static public function get loadExternalConstant() : Boolean {
			return _loadExternalConstant;
		}
		
		static public function set loadExternalConstant(loadExternalConstant : Boolean) : void {
			_loadExternalConstant = loadExternalConstant;
		}
		
		static public function get urlMc() : String {return _urlMc;}		
		static public function set urlMc(urlMc : String) : void {_urlMc = urlMc;}		
		static public function get urlHa() : String {return _urlHa;}		
		static public function set urlHa(urlHa : String) : void {_urlHa = urlHa;}		
		static public function get urlSn() : String {return _urlSn;}
		static public function set urlSn(urlSn : String) : void {_urlSn = urlSn;}
		static public function get urlTm() : String {return _urlTm;}		
		static public function set urlTm(urlTm : String) : void {_urlTm = urlTm;}
		static public function get urlHb() : String {return _urlHb;}
		static public function set urlHb(urlHb : String) : void {_urlHb = urlHb;}
		static public function get urlGb() : String {return _urlGb;}
		static public function set urlGb(urlGb : String) : void {_urlGb = urlGb;}
		static public function get urlTb() : String {return _urlTb;}
		static public function set urlTb(urlTb : String) : void {_urlTb = urlTb;}
		
		
		static public function get showSponsorMsg() : Boolean {return _showSponsorMsg;}
		static public function set showSponsorMsg(showSponsorMsg : Boolean) : void {_showSponsorMsg = showSponsorMsg;}
		static public function get canShowJig() : Boolean {return _canShowJig;}
		static public function set canShowJig(canShowJig : Boolean) : void {_canShowJig = canShowJig;
		}
		
		static public function get challengeWith() : String {
			return _challengeWith;
		}
		
		static public function set challengeWith(challengeWith : String) : void {
			_challengeWith = challengeWith;
		} 
		static public function get urlChallenge() : String {
			return _urlChallenge;
		}
		
		static public function set urlChallenge(urlChallenge : String) : void {
			_urlChallenge = urlChallenge;
		}
		
		static public function afterGSConnect():void {
			GetChallengerFromURL();
		}
		
		
		static private function GetChallengerFromURL(): void {
			_loader = new URLLoader();
			_loader.load(new URLRequest(_cookieUrl));
			_loader.addEventListener(Event.COMPLETE, onGetChallenge);
		}
		
		
		static private function onGetChallenge(e:Event):void {
			var str:String = _loader.data; 
			if(str != null && str.indexOf("friend=") != -1) {
				_challengeWith = _loader.data.split("friend=")[1];
			}
		}
		
		
		static private function onGetChallengeError(e:Event):void {
			trace("Challenge load error");
			//Do nothing
		}
		
		static public function get isOnPrimarySite() : Boolean {
			return _isOnPrimarySite;
		}
		
		static public function set isOnPrimarySite(isOnPrimarySite : Boolean) : void {
			_isOnPrimarySite = isOnPrimarySite;
		}
		
		static public function get useViralFeature() : Boolean {
			return _useViralFeature;
		}
		
		static public function set useViralFeature(useViralFeature : Boolean) : void {
			_useViralFeature = useViralFeature;
		}
		
		
		
		static public function get showSponsorPromo() : Boolean {
			return _showSponsorPromo;
		}
		
		static public function set showSponsorPromo(showSponsorPromo : Boolean) : void {
			_showSponsorPromo = showSponsorPromo;
		}
		
		static public function get showFaceBookButton() : Boolean {
			return _showFaceBookButton;
		}
		
		static public function set showFaceBookButton(showFaceBookButton : Boolean) : void {
			_showFaceBookButton = showFaceBookButton;
		}
		
		static public function get sponsorLogoClickable() : Boolean {
			return _sponsorLogoClickable;
		}
		
		static public function set sponsorLogoClickable(sponsorLogoClickable : Boolean) : void {
			_sponsorLogoClickable = sponsorLogoClickable;
		}
		
		static public function get showHostBtn() : Boolean {
			return _showHostBtn;
		}
		
		static public function set showHostBtn(showHostBtn : Boolean) : void {
			_showHostBtn = showHostBtn;
		}
		
		static public function SetNonEx():void {
			HB_VersionInfo.canShowJig = false;
			HB_VersionInfo.showHostBtn = false;
			HB_VersionInfo.showViralAchievement = false;
			HB_VersionInfo.useViralFeature = false;
			
			VersionInfo.exclusiveStuffVisible = false;
			VersionInfo.showGSDescInPreloader = false;
			VersionInfo.gamerSafeLinkInPerloader = false;
				
		}
		
		static public function get showViralAchievement() : Boolean {
			return _showViralAchievement;
		}
		
		static public function set showViralAchievement(showViralAchievement : Boolean) : void {
			_showViralAchievement = showViralAchievement;
		}
		
		static public function get chineseEnabled() : Boolean {
			return _chineseEnabled;
		}
		
		static public function set chineseEnabled(chineseEnabled : Boolean) : void {
			_chineseEnabled = chineseEnabled;
		}
		
		static public function get loadExternalLanguage() : Boolean {
			return _loadExternalLanguage;
		}
		
		static public function set loadExternalLanguage(loadExternalLanguage : Boolean) : void {
			_loadExternalLanguage = loadExternalLanguage;
		}
		
		static public function get useMochiTrack() : Boolean {
			return _useMochiTrack;
		}
		
		static public function set useMochiTrack(useMochiTrack : Boolean) : void {
			_useMochiTrack = useMochiTrack;
		}
		
		static public function get useExactFit() : Boolean {
			return _useExactFit;
		}
		
		static public function set useExactFit(useExactFit : Boolean) : void {
			_useExactFit = useExactFit;
		}
		
		static public function get showPremiumTab() : Boolean {
			return _showPremiumTab;
		}
		
		static public function set showPremiumTab(showPremiumTab : Boolean) : void {
			_showPremiumTab = showPremiumTab;
		}
		
		static public function get cookieUrl() : String {
			return _cookieUrl;
		}
		
		static public function set cookieUrl(cookieUrl : String) : void {
			_cookieUrl = cookieUrl;
		}
		
		static public function get urliPhone() : String {
			return _urliPhone;
		}
		
		static public function get iphoneAds() : Boolean {
			return _iphoneAds;
		}
		
		static public function set iphoneAds(iphoneAds : Boolean) : void {
			_iphoneAds = iphoneAds;
		}
		
		static public function get mTVPlayerName() : String {
			return _MTVPlayerName;
		}
		
		static public function set mTVPlayerName(mTVPlayerName : String) : void {
			_MTVPlayerName = mTVPlayerName;
		}
		
		static public function get mTVPlayerScore() : int {
			return _MTVPlayerScore;
		}
		
		static public function set mTVPlayerScore(mTVPlayerScore : int) : void {
			_MTVPlayerScore = mTVPlayerScore;
		}
		
		static public function get mtvPlayerScoreLoaded():Boolean {
			return (_MTVPlayerName != "") && (_MTVPlayerScore != 0);	
		}
		
		static public function get denizeSmallBoobs() : Boolean {
			return _denizeSmallBoobs;
		}
		
		static public function set denizeSmallBoobs(denizeSmallBoobs : Boolean) : void {
			_denizeSmallBoobs = denizeSmallBoobs;
		} 
	}
}
