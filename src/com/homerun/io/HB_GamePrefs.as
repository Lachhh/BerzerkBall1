package com.homerun.io {
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.stats.StatsStatic;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.io.files.GamePrefs;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.display.StageQuality;

	/**
	 * @author Lachhh
	 */
	public class HB_GamePrefs extends GamePrefs {
		static public const SEASON_WINTER:int  = 0 ;
		static public const SEASON_SUMMER:int  = 1 ; 
		static public const SEASON_FALLS:int  = 2 ;
		static public const SEASON_RANDOM:int  = 3 ;
		static public const SEASON_SPRING:int  = 4 ;  
		private var _seasonId:int = SEASON_RANDOM ; 
		private var _soundVolume : Number = 100 ;
		private var _musicVolume : Number = 100 ;
		private var _defaultQuality : int = GamePrefs.QUALITY_HIGH;
		

		public function HB_GamePrefs(main : MainGame) {
			super(main);
	
		}

		override public function Encode() : String {
			return quality + SEPARATOR + 
				language + SEPARATOR + 
				(musicOn ? "1" : "0") + SEPARATOR + 
				(soundOn ? "1" : "0") + SEPARATOR + 
				(haveASaveFileOnPremiumAPI ? "1" : "0") + SEPARATOR + 
				_soundVolume + SEPARATOR + 
				_musicVolume + SEPARATOR + 
				AchievementManager.instance.Encode() + SEPARATOR + 
				_seasonId + SEPARATOR + 
				StatsStatic.instance.Encode();
		}

		override public function Decode(s : String) : void {
			var params : Array = s.split(SEPARATOR);
			quality = int(params.shift());
			language = params.shift();
			musicOn = params.shift() == "1";
			soundOn = params.shift() == "1";
			haveASaveFileOnPremiumAPI = params.shift() == "1";
			_soundVolume = int(params.shift()) ;
			_musicVolume = int(params.shift()) ;
			AchievementManager.instance.Decode(params.shift());
			_seasonId = int(params.shift()) ;
			StatsStatic.instance.Decode(params.shift());
			if(language == "null" || language == null || VersionInfo.defaultLanguageForcedOnLoad) {
				language = VersionInfo.defaultLanguage;
			}
			
			SetLanguage(language);
			SetQuality(quality);
			Jukebox.instance.SetFxVolume(_soundVolume / 100);
			Jukebox.instance.SetMusicVolume(_musicVolume / 100);
			SetMusicOn(musicOn);
			SetSoundOn(soundOn);
		}

		override public function SetQuality(iQuality : int) : void {
			super.SetQuality(iQuality);
			_defaultQuality = iQuality;
			UpdateQuality(iQuality);
		}

		public function UpdateQuality(i : int = -1) : void {
			if(i == -1) {
				i = _defaultQuality ;
			}
			
			switch(i) {
				case QUALITY_LOW:
					main.stage.quality = StageQuality.LOW ;
					main.game.speedManager.SetSpeed(0.6);
					main.stage.frameRate = 50;
					//GameLoop.instance.SetFPS(36);
					break;
				case QUALITY_MED:
					main.stage.quality = StageQuality.LOW ;
					main.game.speedManager.SetSpeed(0.6);
					main.stage.frameRate = 50;
					//GameLoop.instance.SetFPS(40);
					break;
				case QUALITY_HIGH:
					main.stage.quality = StageQuality.MEDIUM ;
					main.game.speedManager.SetSpeed(0.6);
					main.stage.frameRate = 50;
					//GameLoop.instance.SetFPS(50);
					break;
				default :
					throw new Error("Wrong QualityId : Use GamePrefs.QUALITY_XXX");	
			}
		}

		public function get soundVolume() : Number {
			return _soundVolume;
		}

		public function set soundVolume(soundVolume : Number) : void {
			_soundVolume = soundVolume;
			Jukebox.instance.SetFxVolume(soundVolume / 100);
		}

		public function get musicVolume() : Number {
			return _musicVolume;
		}

		public function set musicVolume(musicVolume : Number) : void {
			_musicVolume = musicVolume;
			Jukebox.instance.SetMusicVolume(musicVolume / 100);
		}
		/*
		public function PrevLanguage():void {
			var index:int = Utils.CropIn(_textAvailable.indexOf(language)-1, 0, _textAvailable.length-1);
			SetLanguage(_textAvailable[index]);
		}
		
		public function NextLanguage():void {
			var index:int = Utils.CropIn(_textAvailable.indexOf(language)+1, 0, _textAvailable.length-1);
			SetLanguage(_textAvailable[index]);	
		}*/
		
		public function PrevSeason():void {
			_seasonId = Utils.CropIn(_seasonId-1, SEASON_WINTER, SEASON_SPRING);
		}

		public function NextSeason():void {
			_seasonId = Utils.CropIn(_seasonId+1, SEASON_WINTER, SEASON_SPRING);	
		}
		
		public function get seasonId() : int {
			return _seasonId;
		}
	}
}
