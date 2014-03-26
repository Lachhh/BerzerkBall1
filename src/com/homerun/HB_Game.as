package com.homerun {
	import mochi.as3.MochiEvents;

	import com.homerun.constants.HBConstants;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.hero.Geek;
	import com.homerun.hero.HB_HeroManager;
	import com.homerun.hero.Hero;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.AchievementManager;
	import com.homerun.io.HB_GamePrefs;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.io.HB_LevelVaultController;
	import com.homerun.io.HB_LevelVaultModel;
	import com.homerun.io.HB_PremiumConstants;
	import com.homerun.io.stats.HB_KongStats;
	import com.homerun.io.stats.StatsStatic;
	import com.homerun.meta.ui.MetaGameProgress;
	import com.homerun.meta.ui.MetaPerso;
	import com.homerun.meta.ui.equip.MetaEquipWeapon;
	import com.homerun.meta.ui.equip.MetaEquipmentEnum;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.homerun.screens.HB_Screen;
	import com.homerun.screens.HB_ScreenFactory;
	import com.homerun.screens.IngameScreen;
	import com.homerun.screens.OptionsIngameScreen;
	import com.homerun.screens.RoundCompleteScreen;
	import com.homerun.screens.UnlockScreen;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.meta.metaObject.MetaGame;
	import com.lachhhEngine.games.physique.EquationVecto;
	import com.lachhhEngine.games.screens.ScreenFactory;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.KeyManager;
	import com.lachhhEngine.io.encryption.SecureNumber;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.files.FileManager;
	import com.lachhhEngine.utils.Utils;

	import flash.ui.Keyboard;

	/**
	 * @author Lachhh
	 */
	public class HB_Game extends Game {
		private static const TWO_SECONDS : Number = 50*2;
		static public var KEYS_OK:Array = [Keyboard.ENTER, Keyboard.SPACE, 90, 75, 88, 76];
		static public var KEYS_CANCEL:Array = [Keyboard.BACKSPACE];
		static public var KEYS_JUMP:Array = [90, 75];
		static public var KEYS_SHOOT:Array = [88, 76]; 
		static public var KEYS_LEFT:Array = [37, 65];
		static public var KEYS_RIGHT:Array = [39, 68];
		static public var KEYS_UP:Array = [38, 87];
		static public var KEYS_DOWN:Array = [40, 83];
		static public var KEYS_PAUSE:Array = [80, 79];
		private var _main:Main;
		private var _hero:Hero  ;
		private var _ingame:IngameScreen ;
		
		private var _hasHit:Boolean ;
		private var _roundFinished:Boolean ;
		private var _farthestDistance:SecureNumber = new SecureNumber() ;
		private var _farthestHeight:SecureNumber = new SecureNumber();
		private var _xpBonus:SecureNumber = new SecureNumber();
		private var _moneyBonus:SecureNumber = new SecureNumber();
		private var _hasShownControls:Boolean ;
		private var _newlyUnlockedPerso:MetaPerso;
		private var _hasCompletedGame:Boolean;
		private var _pauseScreen:OptionsIngameScreen;
		private var _successfulPowerSmash:int =0 ;
		private var _hitPowerSmash2Second:Number ;
		
		private var _mtvScoreBeaten:Boolean = false; 
		
		public function HB_Game(main:Main) {
			super();
			_main = main;
			_hasShownControls = false;
		}

		override public function Init(metaGame : MetaGame) : void {
			super.Init(metaGame);
			_ingame = IngameScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_INGAME_SCREEN));
			_ingame.Hide();
			
		}

		override protected function LevelLoaded(c : Callback) : void {
			super.LevelLoaded(c);
			
			_hero = HB_HeroManager(heroManager).CreateFromHeroProgress();
			Jukebox.instance.FadeToMusic(HB_SfxFactory.ID_MUSIC_GEEK);
			
			if(levelEditorMode) return ;
			_ingame.Show();		
			_ingame.InitShot();
			
			_hasHit = false;	
			_roundFinished = false;
			_farthestDistance.value = 0 ;
			_farthestHeight.value = 0 ;  
			_xpBonus.value = 0;
			_moneyBonus.value = 0;
			_successfulPowerSmash = 0;
			ExternalAPIManager.premiumAPI.HideBar();
			
			if(FileManager.instance.firstPlay && !_hasShownControls) {
				ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_CONTROL_SCREEN);
				_hasShownControls = true;
			}
			_newlyUnlockedPerso = null;
			_hasCompletedGame = false;
			Pause(false);
			HB_GamePrefs(FileManager.instance.gamePrefs).UpdateQuality();
			
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.startPlay();
		}

		override protected function Destroy() : void {
			super.Destroy();
		}
		
		public function HitGeek():void {
			_hitPowerSmash2Second = 0;
			var rnd:int = int(Utils.PickRandomIn([HB_SfxFactory.ID_MUSIC_HIT, HB_SfxFactory.ID_MUSIC_HIT2, HB_SfxFactory.ID_MUSIC_HIT3]));
			
			Jukebox.instance.FadeToMusic(rnd, 1);
			
			if(_ingame.powerWidget.isMaxed) {
				Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_EXPLOSION);
				Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_SIDE_ARTWORK);	
				StatsStatic.instance.AddValue(StatsStatic.ID_KILLER_SHOT, 1);
				if(StatsStatic.instance.GetValue(StatsStatic.ID_KILLER_SHOT) >= 3) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_29);
			}
			
			hero.HitGeek(new Callback(PropulseGeek, this, null), new Callback(FollowGeek, this, null));
			if(MetaEquipWeapon(hero.metaHero.metaPerso.equippedWeapon).idSound != -1) {
				Jukebox.instance.PlaySound(MetaEquipWeapon(hero.metaHero.metaPerso.equippedWeapon).idSound);
			} else {
				Jukebox.instance.PlaySound(HB_SfxFactory.randomHitGeek);
			
			}
			
			if(hero.metaHero.metaPerso.id == HB_HeroManager.PERSO_DENIZE) {
				if(metaGameProgress.denizeShot >= 50) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_45);
				metaGameProgress.denizeShot++;
			}
			ExternalAPIManager.metricsAPI.RecordAPlay();
			//Jukebox.instance.PlaySound(HB_SfxFactory.randomMegaPunch);
		}
		
		public function HitRunningGeek():void { 
			_hasHit = false;
			hero.HitGeek(new Callback(PropulseRunningGeek, this, null), new Callback(FollowGeek, this, null));
			if(MetaEquipWeapon(hero.metaHero.metaPerso.equippedWeapon).idSound != -1) {
				Jukebox.instance.PlaySound(MetaEquipWeapon(hero.metaHero.metaPerso.equippedWeapon).idSound);
			} else {
				Jukebox.instance.PlaySound(HB_SfxFactory.randomHitGeek);
			}
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_SIDE_ARTWORK);	
			ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_BONUS_SCREEN);
			//Jukebox.instance.PlaySound(HB_SfxFactory.randomMegaPunch);
			_successfulPowerSmash++;
			if(_successfulPowerSmash >= 1) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_11);
			if(_successfulPowerSmash >= 2) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_12);
			if(_successfulPowerSmash >= 3) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_13);
			if(_successfulPowerSmash >= 4) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_14);
			if(_successfulPowerSmash >= 5) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_43);
			
			StatsStatic.instance.SetValue(StatsStatic.ID_MAXPOWERSMASH, Math.max(StatsStatic.instance.GetValue(StatsStatic.ID_MAXPOWERSMASH), _successfulPowerSmash));
			
			if(_hitPowerSmash2Second < TWO_SECONDS) {
				AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_40);	
			}
			
			if(hero.metaHero.metaPerso.id == HB_HeroManager.PERSO_DENIZE) {
				if(metaGameProgress.denizeShot >= 50) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_45);
				metaGameProgress.denizeShot++;
			}
		}
		
		
		public function Miss():void {
			_hasHit = false; 
			hero.HitGeek(null, new Callback(FollowGeek, this, null));
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_GEEK_CAVE6);
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_SWORD_SWING2);
		}
		
		private function PropulseRunningGeek():void {
			var vx:Number = (geek.vx * HBConstants.HERO_HIT_VX_MUL) + HBConstants.HERO_HIT_VX_ADD + (metaGameProgress.lastSelected.baseStr*HBConstants.HERO_HIT_VX_MUL_PER_STR);
			var vy:Number = -Math.abs(geek.vy * HBConstants.HERO_HIT_VY_MUL) - HBConstants.HERO_HIT_VY_ADD - (metaGameProgress.lastSelected.baseStr*HBConstants.HERO_HIT_VY_MUL_PER_STR);
			//vx = Math.min(vx, 1000);
			//vy = Math.max(vy, -250);
			geek.HitByPerso(vx, vy);	
			camera.ShakeCamera(50);
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_EXPLOSION);
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_WEAPON_AIRSTRIKE);
		} 
		
		private function PropulseGeek():void {
			var rot:Number = (1-_ingame.precisionWidget.value)*90;
			var vx:Number = EquationVecto.MyCos(rot);
			var vy:Number = EquationVecto.MySin(rot);
			vx *= _ingame.powerWidget.value * (metaGameProgress.lastSelected.totalPower)*5;
			vy *= _ingame.powerWidget.value * (metaGameProgress.lastSelected.totalPower)*-3;
			geek.HitByPerso(vx, vy);	
			camera.ShakeCamera(10);
			if(_ingame.powerWidget.isMaxed) {
				_xpBonus.value = HBConstants.KILLER_SHOT_XP_BONUS;	
			}
		} 
		
		private function FollowGeek():void {
			_hasHit = true;	
			_ingame.HideWidget();
		}
		
		public function FinishRound():void {
			
			HB_KongStats.SendAll(geekDistance, _farthestHeight.value);
			
			HB_GameProgress.gameProgress.metaProgress.lastSelected.xp.upgradeValue += xpGain;
			HB_GameProgress.gameProgress.cash += moneyGain;
			StatsStatic.instance.AddValue(StatsStatic.ID_MONEY_EARNED, moneyGain);
			moneyBonus = 0; 
			
			HB_GameProgress.gameProgress.highdistance = Math.max(HB_GameProgress.gameProgress.highdistance, geekDistance);
			
			
			
			Jukebox.instance.FadeToMusic(HB_SfxFactory.ID_MUSIC_GEEK);
			RoundCompleteScreen.forceFinish = false;
			
			ExternalAPIManager.premiumAPI.ShowBar();
			_roundFinished = true;
			
			HB_LevelVaultModel.SendNewScore(geekDistance);
			HB_LevelVaultController.SetHasChallenged(geekDistance);			
			if(geekDistance >= HBConstants.UNLOCK_DISTANCE_REQUIRED) {
				var metaPerso:MetaPerso = metaGameProgress.lastSelected; 
				if(!metaPerso.hasReachUnlockThreshold) {
					metaPerso.hasReachUnlockThreshold = true;
					switch(metaPerso.id) {
						case HB_HeroManager.PERSO_MARC :
							_newlyUnlockedPerso = metaGameProgress.GetFromId(HB_HeroManager.PERSO_TITI);
							break;
						case HB_HeroManager.PERSO_LACHHH :
							_newlyUnlockedPerso = metaGameProgress.GetFromId(HB_HeroManager.PERSO_MATHIEU);
							break;
						case HB_HeroManager.PERSO_ETIENNE :
							_newlyUnlockedPerso = metaGameProgress.GetFromId(HB_HeroManager.PERSO_VINCENT);
							break;
					}
				}
			}
			
			var lastScreen:int = -1;
			if(HB_LevelVaultController.myChallengerHighscore != null) {
				if(geekDistance >= HB_LevelVaultController.myChallengerHighscore.highscore) {
					lastScreen = HB_ScreenFactory.ID_INYOURFACE_SCREEN;
				}
			} else if(HB_VersionInfo.mtvPlayerScoreLoaded) {
				if(geekDistance >= HB_VersionInfo.mTVPlayerScore && !_mtvScoreBeaten) {
					lastScreen = HB_ScreenFactory.ID_INYOURFACE_SCREEN;
					_mtvScoreBeaten = true;
				}
			}
			
			var hb:HB_Screen ;
			if(_newlyUnlockedPerso != null) {
				var unlock:UnlockScreen = UnlockScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_UNLOCK_SCREEN));
				unlock.SetUnlockedPerso(_newlyUnlockedPerso);
				unlock.SetLastScreen(lastScreen);	
			} else if(_hasCompletedGame) {
				hb = HB_Screen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_GAMECOMPLETED_SCREEN));
				hb.SetLastScreen(lastScreen);
			} else {
				if(lastScreen != -1) {
					ScreenManager.instance.ShowScreen(lastScreen);	
				} else {
					ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
				}
			}
			
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MONEY_EARNED) >= 500) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_19);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MONEY_EARNED) >= 2500) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_20);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MONEY_EARNED) >= 10000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_21);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MONEY_EARNED) >= 100000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_22);
			
			if(StatsStatic.instance.GetValue(StatsStatic.ID_FACEBOOK_CLICK) >= 1) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_30);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_TWITTER_CLICK) >= 1) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_31);
			
			
			if(AchievementManager.instance.numBestowed >= 5) ExternalAPIManager.achievementAPI.bestowAchievement(HB_PremiumConstants.META_GS_ACH_5);
			if(AchievementManager.instance.numBestowed >= 10) ExternalAPIManager.achievementAPI.bestowAchievement(HB_PremiumConstants.META_GS_ACH_10);
			if(AchievementManager.instance.numBestowed >= 25) ExternalAPIManager.achievementAPI.bestowAchievement(HB_PremiumConstants.META_GS_ACH_25);
			if(AchievementManager.instance.numBestowed >= 40) ExternalAPIManager.achievementAPI.bestowAchievement(HB_PremiumConstants.META_GS_ACH_40);
			FileManager.instance.SaveToExternalAPI();
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.endPlay();
		}
		
		override public function Update() : void {
			super.Update();
			if(!isInit) return ;
			if(!_roundFinished) {
				_farthestDistance.value = Math.max(_farthestDistance.value, geek.distance-250);
				_farthestHeight.value = Math.max(_farthestHeight.value, Math.abs(geekHeight));
				
				StatsStatic.instance.SetValue(StatsStatic.ID_MAXDISTANCE, Math.max(StatsStatic.instance.GetValue(StatsStatic.ID_MAXDISTANCE), _farthestDistance.value*pixelToDistance));
				StatsStatic.instance.SetValue(StatsStatic.ID_MAXHEIGHT, Math.max(StatsStatic.instance.GetValue(StatsStatic.ID_MAXHEIGHT), _farthestHeight.value));
				
				if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXDISTANCE) >= 10000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_1);
				if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXDISTANCE) >= 50000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_2);
				if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXDISTANCE) >= 250000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_3);
				if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXDISTANCE) >= 500000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_4);
				if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXDISTANCE) >= 1000000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_5);
				if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXDISTANCE) >= 2000000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_41);
				if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXHEIGHT) >= 1000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_6);
				if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXHEIGHT) >= 3000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_7);
				if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXHEIGHT) >= 7500) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_8);
				if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXHEIGHT) >= 12000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_9);
				if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXHEIGHT) >= 20000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_10);
				if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXHEIGHT) >= 50000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_42);
				_hitPowerSmash2Second += speedManager.GetSpeed();	
			}
			
			
			
			if(KeyManager.IsKeyPressedAtLeast(KEYS_PAUSE) && !_roundFinished) {
				PauseAndOption();	
			}
			
			if(!_roundFinished && !ExternalAPIManager.premiumAPI.InUse() && ScreenManager.instance.GetNbActiveById(ScreenFactory.DEBUG_SCREEN) <= 0) {
				stage.focus = null;
			}
		}
		
		public function PauseAndOption():void {
			if(paused && _pauseScreen != null) {
				_pauseScreen.CloseOptions();
				_pauseScreen = null;
				return ;
			}
			
			Pause(true);
			_pauseScreen = OptionsIngameScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_OPTIONS_INGAME_SCREEN));
			_pauseScreen.SetCloseCallback(new Callback(Unpause, this, null));
		}
		
		public function Unpause():void {
			Pause(false);
			_ingame.optionsWidget.Update();
		}

		public function get hero() : Hero {
			return _hero;
		}
		
		public function get geek() : Geek {
			return Geek(GetPlayer1());
		}
		
		public function get hasHit() : Boolean {
			return _hasHit;
		}
		
		public function get canHitAgain() : Boolean {
			return _hasHit && hero.nbHit > 0 && hero.runningToGeek && !hero.runningFartherThanGeek ;
		}
		
		public function get isSuccessfulHit() : Boolean {
			if(metaGameProgress.lastSelected.IsEquipped(MetaEquipmentEnum.EQUIP_BRACERS_6)) {
				return geekHeight/pixelToDistance < 200 ;
			} else {
				return geekHeight/pixelToDistance < 100 ;
			}
		}
		
		private function get metaGameProgress():MetaGameProgress { return HB_GameProgress.gameProgress.metaProgress ;}
		public function get moneyGain():int {
			var bonus:Number = hero.metaHero.metaPerso.moneyBonus +1; 
			return ((geekDistance/pixelToDistance)*(HBConstants.CASH_DISTANCE_RATIO)/100)*bonus + _moneyBonus.value;	
		}
		
		public function get xpGain():int {
			var bonus:Number = hero.metaHero.metaPerso.xpBonus +1;
			return ((geekDistance/pixelToDistance)*(HBConstants.XP_DISTANCE_RATIO)/100)*bonus + _xpBonus.value ;
		}
		 
		public function get geekDistance():int {return (_farthestDistance.value)*pixelToDistance;}
		public function get geekHeight():int {return Math.abs(geek.height)*pixelToDistance;}
		public function get pixelToDistance():Number { return 0.2; }
		
		public function get highscoreBeaten():Boolean {return geekDistance >= HB_GameProgress.gameProgress.highdistance;}
		public function get roundFinished() : Boolean {return _roundFinished;}
		public function get main() : Main {	return _main;
		}
		
		public function get moneyBonus() : int {
			return _moneyBonus.value;
		}
		
		public function set moneyBonus(moneyBonus : int) : void {
			_moneyBonus.value = moneyBonus;
		}
		
		public function get ingame() : IngameScreen {
			return _ingame;
		}
		
		public function get hasCompletedGame() : Boolean {
			return _hasCompletedGame;
		}
		
		public function get newlyUnlockedPerso() : MetaPerso {
			return _newlyUnlockedPerso;
		}
	}
}
