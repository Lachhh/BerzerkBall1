package com.homerun {
	import com.lachhhEngine.io.externalAPI.premiumAPI.MTVVirtualGoodsController;
	import com.lachhhEngine.io.externalAPI.GamerSafeController;
	import com.homerun.ammo.HB_AmmoFactory;
	import com.homerun.behavior.HB_BehaviorFactory;
	import com.homerun.behavior.HB_BehaviorManager;
	import com.homerun.debug.HB_Debug;
	import com.homerun.effects.HB_GameEffectFactory;
	import com.homerun.effects.HB_GameEffectManager;
	import com.homerun.enemy.HB_EnemyFactory;
	import com.homerun.enemy.HB_EnemyManager;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.hero.HB_HeroFactory;
	import com.homerun.hero.HB_HeroManager;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.AchievementManager;
	import com.homerun.io.HB_GamePrefs;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.io.HB_GameProgressFactory;
	import com.homerun.io.HB_LevelVaultController;
	import com.homerun.io.HB_LevelVaultModel;
	import com.homerun.io.stats.StatsStatic;
	import com.homerun.items.HB_ItemFactory;
	import com.homerun.items.HB_ItemManager;
	import com.homerun.levelEvent.AllMetaLevels;
	import com.homerun.levelEvent.HB_LevelEventFactory;
	import com.homerun.meta.HB_MetaFactory;
	import com.homerun.meta.HB_MetaManager;
	import com.homerun.meta.MetaHBActor;
	import com.homerun.meta.ui.MetaGameProgress;
	import com.homerun.meta.ui.equip.MetaEquipmentEnum;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.homerun.multilingual.HB_TextFactory;
	import com.homerun.screens.HB_Screen;
	import com.homerun.screens.HB_ScreenFactory;
	import com.homerun.screens.QuestionBoxScreen;
	import com.lachhhEngine.games.GameManagers;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.SpeedManager;
	import com.lachhhEngine.games.ammo.AmmoManager;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.level.levelEvents.LevelEventManager;
	import com.lachhhEngine.games.meta.MetaManager;
	import com.lachhhEngine.games.meta.metaObject.MetaLevel;
	import com.lachhhEngine.games.physique.PhysicFactory;
	import com.lachhhEngine.games.physique.PhysicManager;
	import com.lachhhEngine.games.screens.Screen;
	import com.lachhhEngine.games.screens.ScreenFactory;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.games.teams.TeamFactory;
	import com.lachhhEngine.games.weapon.WeaponFactory;
	import com.lachhhEngine.games.weapon.WeaponManager;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.metricsAPI.MetricGroup;
	import com.lachhhEngine.io.files.FileManager;
	import com.lachhhEngine.io.files.GamePrefs;
	import com.lachhhEngine.multilingual.ExternalLanguageController;
	import com.lachhhEngine.multilingual.LanguageFontReplace;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.Event;

	/**
	 * @author Lachhh
	 */
	public class Main extends MainGame {

		private var _screens:MovieClip = new MovieClip();
		private var _vraimentUnTestBidonAntiHack:Array = new Array();
		private var _lastLvl:MetaLevel;
		
		//[Embed(source="../../../../embed/fonts/DS Zombie Cyr.TFF", fontName='DS Zombie Cyr',  mimeType="application/x-font-truetype")]
		
      	
      	
		public function Main() {
			//Un test pour voir si chu capable de changer les positions en mémoire des variables
			//à chaque run du jeu.  Pour pas que kekun donne un addresse mémoire a tout le monde.
			var n:int = Math.random()*100 ;
			for (var i:int = 0 ; i <= n ; i++) {
				_vraimentUnTestBidonAntiHack.push(Math.random());
			}  
			
			
   		 
			
		
			//_screenMgr.ShowSuiteScreen([ScreenFactory(_screenMgr.factory).BERZERK_INTRO, ScreenFactory(_screenMgr.factory).LACHHH_ENGINE_INTRO, TestGameScreenFactory.ID_TITLE_SCREEN]);
			addChild(_screens);
			
			//Init();
			
			//ForceLink()
			
			/*addChild(mc);
			mc.x = 200;
			mc.y = 200;*/
			
		}
		
	
		override protected function CreateManagers():void {
			_game = new HB_Game(this);
			
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_KEYGAMES || VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_SPELE_NL) {
				FileManager.DATA_NAME = "Key_GAMEData";	
			}
			
			TextFactory.CreateInstance(new HB_TextFactory());
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_SOCIAL_AFFILIATES) {				
				TextFactory.instance.LANGUAGE_RU.AddFontReplace(new LanguageFontReplace("Allstar", "DS Zombie Cyr"));
				TextFactory.instance.LANGUAGE_RU.AddFontReplace(new LanguageFontReplace("j.d.", "OzHandicraft Win95BT", 14));
				TextFactory.instance.LANGUAGE_RU.AddFontReplace(new LanguageFontReplace("Cooper Std", "OzHandicraft Win95BT", 14));
				TextFactory.instance.LANGUAGE_RU.AddFontReplace(new LanguageFontReplace("Cooper Std Black", "OzHandicraft Win95BT", 14));
				TextFactory.instance.LANGUAGE_RU.AddFontReplace(new LanguageFontReplace("Calibri", "OzHandicraft Win95BT", 14));
				
			}
			
			
			_animMgr = new AnimationManager(new HB_AnimationFactory());
			_jukeBox = new Jukebox(new HB_SfxFactory());
			_screenMgr = new ScreenManager(this, _screens, new HB_ScreenFactory(), _game);
			_physicMgr = new PhysicManager(_game, new PhysicFactory());
			
			_gameManagers = new GameManagers( 
				new AmmoManager(_game, new HB_AmmoFactory()),
				new HB_BehaviorManager(_game, new HB_BehaviorFactory()),
				new HB_GameEffectManager(_game, new HB_GameEffectFactory()),
				new HB_EnemyManager(_game, new HB_EnemyFactory()), 
				new LevelEventManager(_game, new HB_LevelEventFactory()),
				new HB_HeroManager(_game, new HB_HeroFactory()),
				new HB_ItemManager(_game, new HB_ItemFactory()), 
				new HB_MetaManager(_game, new HB_MetaFactory()), 
				new SpeedManager(), 
				new WeaponManager(_game, new WeaponFactory()), 
				new TeamFactory());
				
			_metaGame = MetaManager.instance.CreateMetaGame(700, 550);
			_metaGame.debug = false;
			_metaGame.gameManagers = _gameManagers;
			
			_game.Init(_metaGame);
			
			new FileManager(this, new HB_GameProgressFactory(), 1, "Game");
			
			addChildAt(_game, 0);
			HB_Debug.Init(_game);
			_game.camera.SetEase(1, 1, 0.085);
		}

		override public function Init():void {
			super.Init();
			
			
			
			MetaEquipmentEnum.Init();
			MetaTrophyEnum.Init();
			
			AllMetaLevels.Init(_game);
			
			if(this is HB_MainLevelEditor) return ;
			
			FileManager.instance.SelectGameProgress(FileManager.instance.GetGameProgress(0));
			HB_LevelVaultController.Init();
			
			var firstScreen:int = HB_VersionInfo.showSponsorMsg ? HB_ScreenFactory.ID_SPONSOR_SCREEN : HB_ScreenFactory.ID_DISCLAIMER2_SCREEN;
			
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_KEYGAMES || VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_SPELE_NL) {
				firstScreen = HB_ScreenFactory.ID_DISCLAIMER_SCREEN;
			}
			
			if(VersionInfo.canShowBerzerkAnims) {
				ScreenManager.instance.ShowSuiteScreen([HB_ScreenFactory.ID_BERZERKLOGO_SCREEN, firstScreen]);
			} else {
				ScreenManager.instance.ShowScreen(firstScreen);
			}
			
			//LaunchGame();
			root.loaderInfo.addEventListener(Event.UNLOAD, handleUnload);
			_game.speedManager.SetSpeed(0.72);
			Jukebox.instance.SetMusicVolume(0.75);
			/*
			if(VersionInfo.debugVersion) {
				stage.scaleMode = StageScaleMode.NO_SCALE ;
			} else {
				stage.scaleMode = VersionInfo.defaultScaleMode;
			}
			*/
			
			
			
			//HB_LevelVaultController.InitGameInfo();
			//MetaEquipmentEnum.DEBUGTraceConstants();
			ExternalAPIManager.premiumAPI.onPurchaseCallback = new Callback(onPurchaseExternalContent, this, null);
			ExternalAPIManager.premiumAPI.onLogInCallback = new Callback(ResetDiamondScreen, this, null);
			
			HB_LevelVaultModel.InitGameInfo();
			if(HB_VersionInfo.challengeWith != "") {
				HB_LevelVaultModel.LoadChallengeOf(HB_VersionInfo.challengeWith);
				ExternalAPIManager.metricsAPI.RecordStats(VersionInfo.sponsorName + "::REFERRED_PLAYER", MetricGroup.VIRAL);
			}
		
			
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_ANDKON) {
				TextFactory.instance.LANGUAGE_EN.ReplaceText(HB_TextFactory.ID_AUTO_MORE_0, "Andkon");
				TextFactory.instance.LANGUAGE_EN.ReplaceText(HB_TextFactory.ID_AUTO_MORE_1, "Andkon");
				TextFactory.instance.LANGUAGE_FR.ReplaceText(HB_TextFactory.ID_AUTO_MORE_0, "Andkon");
				TextFactory.instance.LANGUAGE_FR.ReplaceText(HB_TextFactory.ID_AUTO_MORE_1, "Andkon");
				
				HB_GamePrefs(FileManager.instance.gamePrefs).SetQuality(GamePrefs.QUALITY_HIGH);	
			}
			
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_ADDICTINGGAMES) {
				TextFactory.instance.LANGUAGE_EN.ReplaceText(HB_TextFactory.ID_AUTO_CONNECT_ON_GS_INYOURFACE, "Connect on AddictingGames to rub it IN HIS FACE !");
				TextFactory.instance.LANGUAGE_EN.ReplaceText(HB_TextFactory.ID_AUTO_CONNECT_ON_GS_HIGHSCORE, "Connect on AddictingGames, challenge your friends and collect more diamonds !");
				TextFactory.instance.LANGUAGE_EN.ReplaceText(HB_TextFactory.ID_AUTO_YOU_0, "You need to be connected on AddictingGames to get your own link! It's easy, and it's free!");
				TextFactory.instance.LANGUAGE_EN.ReplaceText(HB_TextFactory.ID_AUTO_YOU_1, "You searching for a specific friend? \nJust go to this link and replace the last part by his GamerSafe's name!");
				TextFactory.instance.LANGUAGE_EN.ReplaceText(HB_TextFactory.ID_AUTO_GS_PLAYER_ONLY, "AddictingGames\nplayers only !");
				TextFactory.instance.LANGUAGE_EN.ReplaceText(HB_TextFactory.ID_AUTO___2, "= 10 AG Bucks");
				TextFactory.instance.LANGUAGE_EN.ReplaceText(HB_TextFactory.ID_AUTO___3, "= 20 AG Bucks");
				TextFactory.instance.LANGUAGE_EN.ReplaceText(HB_TextFactory.ID_AUTO______0, "= 30 AG Bucks");
				
				
				
				
				
				TextFactory.instance.LANGUAGE_FR.ReplaceText(HB_TextFactory.ID_AUTO_CONNECT_ON_GS_INYOURFACE, "Connecte-toi à AddictingGames et dis-lui DANS TA FACE!");
				TextFactory.instance.LANGUAGE_FR.ReplaceText(HB_TextFactory.ID_AUTO_CONNECT_ON_GS_HIGHSCORE, "Connecte-toi à AddictingGames, défie tes amis et ramasse plus de diamants !");
				TextFactory.instance.LANGUAGE_FR.ReplaceText(HB_TextFactory.ID_AUTO_YOU_0, "Vous devez être connecté à AddictingGames pour avoir votre propre lien ! C'est facile, et c'est gratuit !");
				TextFactory.instance.LANGUAGE_FR.ReplaceText(HB_TextFactory.ID_AUTO_YOU_1, "Vous cherchez un ami en particulier ? \nRendez-vous simplement sur ce lien et remplacez la dernière partie par son nom GamerSafe !");
				TextFactory.instance.LANGUAGE_FR.ReplaceText(HB_TextFactory.ID_AUTO_GS_PLAYER_ONLY, "AddictingGames\n seulement!");	
			}
			
			if(HB_VersionInfo.loadExternalLanguage) {
				//ExternalLanguageController.LoadExternal("hb_lang_du.xml", TextFactory.instance.LANGUAGE_FR);
				ExternalLanguageController.SaveString(TextFactory.instance.LANGUAGE_EN.ExportInXML(), "hb_lang_en.xml");
				
			}
			//ExternalLanguageController.Save(TextFactory.instance.LANGUAGE_CN)
			
			TextFactory.instance.ReplaceTextFromIdOnAllLang("[x]", ExternalAPIManager.premiumAPI.goldAcronym, HB_TextFactory.ID_AUTO_GET_MORE);
			TextFactory.instance.ReplaceTextFromIdOnAllLang("[x]", ExternalAPIManager.premiumAPI.nameOfSystem, HB_TextFactory.ID_TROPHY_DESC_32);
			
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_ZAPAK) {
				TextFactory.instance.LANGUAGE_EN.ReplaceText(HB_TextFactory.ID_AUTO_FOLLOW_1, "Follow Us on : ");
				TextFactory.instance.LANGUAGE_FR.ReplaceText(HB_TextFactory.ID_AUTO_FOLLOW_1, "Suivez-nous sur : ");
			}
			
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_KEYGAMES || VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_SPELE_NL) {
				TextFactory.instance.LANGUAGE_EN.ReplaceText(HB_TextFactory.ID_AUTO_MORE_0, TextFactory.instance.LANGUAGE_EN.GetText(HB_TextFactory.ID_AUTO_HIGHSCORE_0));
				TextFactory.instance.LANGUAGE_DU.ReplaceText(HB_TextFactory.ID_AUTO_MORE_0, TextFactory.instance.LANGUAGE_DU.GetText(HB_TextFactory.ID_AUTO_HIGHSCORE_0));
				TextFactory.instance.LANGUAGE_EN.ReplaceText(HB_TextFactory.ID_AUTO_MORE_1, TextFactory.instance.LANGUAGE_EN.GetText(HB_TextFactory.ID_AUTO_HIGHSCORE_0));
				TextFactory.instance.LANGUAGE_DU.ReplaceText(HB_TextFactory.ID_AUTO_MORE_1, TextFactory.instance.LANGUAGE_DU.GetText(HB_TextFactory.ID_AUTO_HIGHSCORE_0));
				//TextFactory.instance.ReplaceTextFromIdOnAllLang("More Games", TextFactory.Get, GB_TextFactory.ID_AUTO_MORE_0);
			}
			
			var mtvController:MTVVirtualGoodsController = ExternalAPIManager.premiumAPI as MTVVirtualGoodsController;
			if(mtvController) { 
				mtvController.GetParameterFromURL("name", new Callback(onGetParamPlayerName, this, null));
			}		
		}

		private function onGetParamPlayerName(obj:Object):void {
			HB_VersionInfo.mTVPlayerName = obj as String;
			
			var mtvController:MTVVirtualGoodsController = ExternalAPIManager.premiumAPI as MTVVirtualGoodsController;
			mtvController.GetParameterFromURL("score", new Callback(onGetParamPlayerScore, this, null));
		}
		
		private function onGetParamPlayerScore(obj:Object):void {
			HB_VersionInfo.mTVPlayerScore = parseInt(obj as String) ;
		}

		
		public function LaunchGame():void {
			var lvl:MetaLevel ;
			switch(HB_GamePrefs(FileManager.instance.gamePrefs).seasonId) { 
				case HB_GamePrefs.SEASON_RANDOM :
					switch(_lastLvl) {
						case null: lvl = MetaLevel(Utils.PickRandomIn([AllMetaLevels.FALL, AllMetaLevels.WINTER, AllMetaLevels.SUMMER, AllMetaLevels.SPRING])); break;
						case AllMetaLevels.FALL : lvl = AllMetaLevels.WINTER; break;
						case AllMetaLevels.WINTER : lvl = AllMetaLevels.SPRING; break;
						case AllMetaLevels.SPRING : lvl = AllMetaLevels.SUMMER; break;
						case AllMetaLevels.SUMMER : lvl = AllMetaLevels.FALL; break;
						
					}
					break;
					
				case HB_GamePrefs.SEASON_FALLS : lvl = AllMetaLevels.FALL; break;
				case HB_GamePrefs.SEASON_SUMMER : lvl = AllMetaLevels.SUMMER; break;
				case HB_GamePrefs.SEASON_WINTER : lvl = AllMetaLevels.WINTER; break;
				case HB_GamePrefs.SEASON_SPRING : lvl = AllMetaLevels.SPRING; break;
			}
			_lastLvl = lvl;
			_game.LoadLevel(lvl, new Callback(LevelLoaded, this, null), null);	
		}
		 
		public function LevelLoaded():void {
			var metaHero:MetaHBActor = HB_HeroManager(_game.heroManager).CreateMetaGeek();
			
			_game.AddPlayerFromMeta(metaHero, false);
			addChildAt(_game, 0);
		}

		override protected function afterSavedFiledRetreived() : void {
			var data:String = ExternalAPIManager.savedFileAPI.savedData;
			if(ExternalAPIManager.savedFileAPI is GamerSafeController) {
				var gs:GamerSafeController = ExternalAPIManager.savedFileAPI as GamerSafeController;
				gs.idSavedGame = 1;
				
				if(gs.isEmpty) {
					gs.SaveData(data, null);
				}
			} 
		
			super.afterSavedFiledRetreived();
			FileManager.instance.SelectGameProgress(FileManager.instance.GetGameProgress(0));
			
			for (var i:int = 0 ; i < ScreenManager.instance.activeFactoryObjects.length ; i++) {
				var s:Screen = ScreenManager.instance.activeFactoryObjects[i] as Screen ;
				if(s.metaInfo.instanceType == HB_ScreenFactory.ID_CHALLENGE_SCREEN || 
				s.metaInfo.instanceType == HB_ScreenFactory.ID_HIGHSCORE_SCREEN) {
					var hb:HB_Screen = HB_Screen(s);
					var newScreen:HB_Screen = HB_Screen(ScreenManager.instance.ShowScreen(s.metaInfo.instanceType));
					newScreen.SetLastScreen(hb.lastScreen);
					hb.Close(true);
					break;
				}
			}
			
			HB_LevelVaultModel.InitMyInfo(HB_GameProgress.gameProgress.metaMyChallenge.Encode());
			
			
			AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_32);
			
			
			if(!game.isInit) {
				HB_GamePrefs(FileManager.instance.gamePrefs).UpdateQuality(GamePrefs.QUALITY_HIGH);
			}
			
			HB_LevelVaultModel.InitGameInfo();
			
			if(_game.isInit) {
				 HB_LevelVaultController.onceMyInfoRetreived = new Callback(ResendScore, this, [HB_Game(_game).geekDistance]);	
			}
			ResetDiamondScreen();
		}
		
		public function ResendScore(score:int):void {
			if(score <= 0) return ;
			HB_LevelVaultModel.SendNewScore(score);
			HB_LevelVaultController.SetHasChallenged(score);
			HB_LevelVaultController.InHisFace();
		}
		
		private function onPurchaseExternalContent():void {
			ResetDiamondScreen();
		}
		
		private function ResetDiamondScreen():void {
			for (var i:int = 0 ; i < ScreenManager.instance.activeFactoryObjects.length ; i++) {
				var s:Screen = ScreenManager.instance.activeFactoryObjects[i] as Screen;
				if(s.metaInfo.instanceType == HB_ScreenFactory.ID_DIAMOND_SCREEN) {
					var hb:HB_Screen = HB_Screen(s);
					var newScreen:HB_Screen = HB_Screen(ScreenManager.instance.ShowScreen(s.metaInfo.instanceType));
					newScreen.SetLastScreen(hb.lastScreen);
					hb.Close(true);
					break;
				}
			}
		}

		
		

		static public function CheckAllAchievements():void {
			
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXDISTANCE) > 10000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_1);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXDISTANCE) > 50000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_2);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXDISTANCE) > 250000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_3);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXDISTANCE) > 500000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_4);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXDISTANCE) > 1000000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_5);
			
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXHEIGHT) > 1000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_6);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXHEIGHT) > 3000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_7);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXHEIGHT) > 7500) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_8);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXHEIGHT) > 12000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_9);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXHEIGHT) > 20000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_10);
			
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXPOWERSMASH) >= 1) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_11);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXPOWERSMASH) >= 2) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_12);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXPOWERSMASH) >= 3) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_13);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXPOWERSMASH) >= 4) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_14);
			
			if(metaProgress.IsLvlHigherOrEqualThan(5)) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_15);
			if(metaProgress.IsLvlHigherOrEqualThan(10)) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_16);
			if(metaProgress.IsLvlHigherOrEqualThan(15)) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_17);
			if(metaProgress.IsLvlHigherOrEqualThan(20)) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_18);
			
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MONEY_EARNED) >= 500) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_19);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MONEY_EARNED) >= 2500) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_20);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MONEY_EARNED) >= 10000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_21);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MONEY_EARNED) >= 100000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_22);
			
			if(StatsStatic.instance.GetValue(StatsStatic.ID_INYOURFACES) >= 1) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_23);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_INYOURFACES) >= 5) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_24);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_INYOURFACES) >= 10) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_25);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_INYOURFACES) >= 20) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_26);
			
			if(metaProgress.hasBoughtEverythingNonPremium) 	AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_27);
			//*** Hit geek once he walks back				AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_28);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_KILLER_SHOT) >= 3) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_29);
			
			
			if(StatsStatic.instance.GetValue(StatsStatic.ID_FACEBOOK_CLICK) >= 1) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_30);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_TWITTER_CLICK) >= 1) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_31);
			//***Link to Connect on GamerSafe => AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_32);
			
			if(metaProgress.allLevel10) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_33);
			
			if(metaProgress.hasAttMaxed) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_34);
			if(metaProgress.hasBoughtAnItem) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_35);
			if(metaProgress.hasBoughtAWeapon) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_36);
			
			
			//***Go On sponsor site. AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_37);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_HIT_BEE) >= 100) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_38);
			
			//***Wait for geek to arrive. AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_39);
			
			//***PowerSmash before 2 seconds AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_40);
			
			
			
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXDISTANCE) >= 2000000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_41);
			
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXHEIGHT) >= 50000) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_42);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_MAXPOWERSMASH) >= 5) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_43);
			if(metaProgress.IsLvlHigherOrEqualThan(25)) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_44);
			if(metaProgress.denizeShot >= 50) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_45);
			
			
			
		}
		
		static private function get metaProgress():MetaGameProgress {return HB_GameProgress.gameProgress.metaProgress;}
		
		private function handleUnload(e:Event):void {
			Destroy();
		}
		
		static public function PlayRollOverSound(e:Event = null):void {
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_UI_ROLLOVER);
		}
		
		static public function PlayOkSound(e:Event = null):void {
			
		}
		
		static public function PlayCancelSound(e:Event = null):void {
			
		}
		
		static public function ShowMsgBox(msgId : int, yesCallback : Callback = null, noCallback : Callback = null, size:int = 24, typeMsg : int = 0):void {
			var q:QuestionBoxScreen = QuestionBoxScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_MSGBOX_SCREEN));
			q.InitMsgBox(msgId, yesCallback, noCallback, size, typeMsg);			
		} 
		
		static public function ShowMsgBoxFromString(msgText : String, yesCallback : Callback = null, noCallback : Callback = null):void {
			var q:QuestionBoxScreen = QuestionBoxScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_MSGBOX_SCREEN));
			q.InitMsgBoxWithString(msgText, yesCallback, noCallback);			
		}
	}
}
