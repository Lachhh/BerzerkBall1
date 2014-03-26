package com.homerun.screens {
	import mochi.as3.MochiEvents;

	import com.homerun.HB_Game;
	import com.homerun.Main;
	import com.homerun.constants.HBConstants;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.AchievementManager;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.io.HB_LevelVaultController;
	import com.homerun.io.HB_PremiumConstants;
	import com.homerun.meta.ui.MetaGameProgress;
	import com.homerun.meta.ui.MetaUpgradeXp;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.homerun.multilingual.HB_TextFactory;
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import com.homerun.screens.view.iPhoneAdView;
	import com.homerun.screens.view.perso.StatsXpBarView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.games.sfx.Sound2D;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.JaludoNonInit;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.premiumAPI.MTVVirtualGoodsController;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class RoundCompleteScreen extends HB_Screen {
		static private var _forceFinish:Boolean = false;
		private var _context:HB_Game ;
		private var _destroyCalled:Boolean ;
		private var _wait:Number = 1;
		private var _xpStats:StatsXpBarView ;
		private var _metaXpUpgrade:MetaUpgradeXp ;
		private var _metaMoneyUpgrade:MetaUpgradeXp ;
		private var _hasLvlUp:Boolean ;
		private var _sponsorView:SponsorLogoView ;
		private var _iPhoneAd:iPhoneAdView ;
		private var _sfxLoop:Sound2D ;
		
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			if(!_forceFinish && HB_LevelVaultController.inMyFaceHighScore == null) {
				HB_LevelVaultController.CheckForInMyFace();
			}
			_iPhoneAd = new iPhoneAdView(iPhoneAdBtn);
			_context = HB_Game(context);			
			_sponsorView = new SponsorLogoView(sponsorRound);
			moreGamesBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickSponsor);
			
			if(VersionInfo.sponsorVisualFrame != VersionInfo.FRAME_JALUDO) {
				moreGamesBtn.visible = (VersionInfo.sponsorSiteMoreGamesUrl != "");
			}
			
			_metaXpUpgrade = new MetaUpgradeXp(HBConstants.GetSlaveXpArray(), new Callback(onXpFinished, this, null), new Callback(onLevelUp, this, null), (_context.xpGain)/36);
			_metaMoneyUpgrade = new MetaUpgradeXp([0], new Callback(onMoneyFinished, this, null), null, (_context.moneyGain)/36);
			
			_metaXpUpgrade.SetUpgradeBonus(metaProgress.lastSelected.xp.upgradeValue - _context.xpGain, _context.xpGain);
			_metaMoneyUpgrade.SetUpgradeBonus(0, _context.moneyGain);
			_xpStats = new StatsXpBarView(xpBar);
			_xpStats.SetMetaUpgrade(_metaXpUpgrade);
			 
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onExit);
			inventoryBtn.addEventListener(MouseEvent.MOUSE_DOWN, onInventory);
			shopBtn.addEventListener(MouseEvent.MOUSE_DOWN, onShop);
			optionsBtn.addEventListener(MouseEvent.MOUSE_DOWN, onOtions);
			highscoreBtn.addEventListener(MouseEvent.MOUSE_DOWN, onHighscore);
			diamondBtn.addEventListener(MouseEvent.MOUSE_DOWN, onDiamond);
			challengeBtn.addEventListener(MouseEvent.MOUSE_DOWN, onChallenge);
			submitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onSubmit);
			
			optionsBtn.visible = false;
			_hasLvlUp = false;
			
			_destroyCalled = false;
			_wait = 1;
		
			lvlUpPatch.visible = false;
			lvlUpPatch.gotoAndStop(1);
			
			if(_forceFinish) {
				FinishCasinoEffect();	
			}
			
			Refresh();
			
			InitOkBtn(exitBtn);
			InitOkBtn(inventoryBtn);
			InitOkBtn(shopBtn);
			InitOkBtn(optionsBtn);
			InitOkBtn(highscoreBtn);
			InitOkBtn(challengeBtn);
			InitOkBtn(diamondBtn);
			InitOkBtn(submitBtn);
			
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_SOCIAL_AFFILIATES) {
				submitBtn.visible = false;
				ExternalAPIManager.scoreAPI.SendScore(_context.geekDistance, "", HB_PremiumConstants.SCORE_BOARD);
			} else {
				submitBtn.visible = ExternalAPIManager.scoreAPI.connected ;
			}
			
			metaProgress.lastSelected.RefreshInventory();
				
			if(!HB_VersionInfo.useViralFeature) {
				challengeBtn.visible = false;
				highscoreBtn.visible = ExternalAPIManager.scoreAPI.connected ;
			} else {
				highscoreBtn.visible = false;
				submitBtn.visible = false;
			}
			
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_ADDICTINGGAMES) {
				challengeBtn.visible = true; 	
			}
			
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_SPIL_GROUP) {
				challengeBtn.visible = false; 	
			}
			
			if(!ExternalAPIManager.scoreAPI.canShowHighscore) {
				highscoreBtn.visible = false;
			}
			
			if(!HB_VersionInfo.iphoneAds) {
				visual.y = 33;
				sponsorRound.y = 470;	
			}
			
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_KEYGAMES || VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_SPELE_NL) {
				highscoreBtn.visible = false;
				submitBtn.visible = true;
				//ExternalAPIManager.scoreAPI.SendScore(_context.geekDistance, "", HB_PremiumConstants.SCORE_BOARD);
			}
		}

		private function onSubmit(event : MouseEvent) : void {			
			ExternalAPIManager.scoreAPI.SendScore(_context.geekDistance, "", HB_PremiumConstants.SCORE_BOARD);
			submitBtn.visible = false;
		}

		private function onClickSponsor(event : MouseEvent) : void {
			if(VersionInfo.sponsorVisualFrame != VersionInfo.FRAME_JALUDO) {
				VersionInfo.OnClickSponsorSite(null);
			} else {
				MochiEvents.trackEvent("Ingame", "More Games");
				(visual.root as JaludoNonInit).LogoMoreGame("");
			}
			AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_37);			
		}

		private function onLevelUp():void {
			
			lvlUpPatch.visible = true;
			lvlUpPatch.gotoAndStop(1);
			if(!_forceFinish) { 

				if(!_hasLvlUp) {
					ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_QUICK_LVL_UP_SCREEN);
					Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_CROWD);
				}	
				if(_metaXpUpgrade.crntLevel >= 5) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_15);
				if(_metaXpUpgrade.crntLevel >= 10) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_16);
				if(_metaXpUpgrade.crntLevel >= 15) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_17);
				if(_metaXpUpgrade.crntLevel >= 20) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_18);
				if(_metaXpUpgrade.crntLevel >= 25) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_44);
				if(metaProgress.allLevel10) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_33);
				
				//}
			}
			_hasLvlUp = true;
		}
		
		private function onXpFinished():void {
			DestroyLoopSound();
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_LVL_END);
		}
		
		private function onMoneyFinished():void {
			DestroyLoopSound();	
		}

		override public function ShowIdle(context : MainGame) : void {
			super.ShowIdle(context);
			if(!_forceFinish && _sfxLoop == null && !_metaXpUpgrade.hasFinished) {
				_sfxLoop = Jukebox.instance.PlaySound2D(HB_SfxFactory.ID_SFX_LVL_PROGRESS, null, true);	
			}
			_metaXpUpgrade.Update(context.game);
			_metaMoneyUpgrade.Update(context.game);
			Refresh();
			
			lvlUpPatch.nextFrame();
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			_sponsorView.Destroy();
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onExit);
			shopBtn.addEventListener(MouseEvent.MOUSE_DOWN, onShop);
			inventoryBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onInventory);
			optionsBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onOtions);
			highscoreBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onHighscore);
			diamondBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onDiamond);
			challengeBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onChallenge);
			moreGamesBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickSponsor);
			DestroyLoopSound();	
		}
		
		private function DestroyLoopSound():void {
			if(_sfxLoop != null) {
				Jukebox.instance.DestroySound(_sfxLoop);
				_sfxLoop = null;	
			}
		}
		
		private function onDiamond(event : MouseEvent) : void {
			if(!FinishCasinoEffect()) return ;
			if(VersionInfo.exclusiveStuffVisible) { 
				var c:HB_Screen = HB_Screen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_DIAMOND_SCREEN));
				c.SetLastScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
			} else {
				var t:HB_Screen = HB_Screen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_TROPHYSELECT_SCREEN));
				t.SetLastScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
			}
			Close(true);
		}
		
		private function onChallenge(event : MouseEvent) : void {
			if(!FinishCasinoEffect()) return ;
			
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_ADDICTINGGAMES) {
				var m:MTVVirtualGoodsController = (ExternalAPIManager.premiumAPI as MTVVirtualGoodsController);
				if(m) {
					if(m.loggedIn) {
						var myName:String = m.accountName;
						var myScore : int = _context.geekDistance;
						m.ShareOnFacebook("berzerkball-shared", "Berzerk Ball !", "Try to beat my score : " + Utils.PutVirgules(myScore) + " !", {name:myName, score:myScore});
						challengeBtn.visible = false;
					} else {
						m.ShowLogin();
					}	
				}
			} else {
				var c:ChallengeScreen = ChallengeScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_CHALLENGE_SCREEN));
				c.SetLastScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
				Close(true);
			}
		}

		private function onShop(event : MouseEvent) : void {
			if(!FinishCasinoEffect()) return ;
			CloseToScreen(HB_ScreenFactory.ID_SHOP_SCREEN);
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Ingame", "Shop");
		}

		/*private function onTrophy(event : MouseEvent) : void {
			ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_TROPHY_SCREEN);	
		}*/

		private function onHighscore(event : MouseEvent) : void {
			if(!FinishCasinoEffect()) return ;
			//ExternalAPIManager.scoreAPI.SendScore(_context.geekDistance, null, null);
			if(ExternalAPIManager.scoreAPI.connected) {
				ExternalAPIManager.scoreAPI.ShowHighscore(HB_PremiumConstants.SCORE_BOARD);
			} else {
				CloseToScreen(HB_ScreenFactory.ID_HIGHSCORE_SCREEN);
			}
			
		}

		private function onOtions(event : MouseEvent) : void {
			if(!FinishCasinoEffect()) return ;
			var options:OptionsIngameScreen = OptionsIngameScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_OPTIONS_INGAME_SCREEN));
			options.SetExitScreen(metaInfo.instanceType);
			Close(true);
		}

		private function onInventory(event : MouseEvent) : void {
			if(!FinishCasinoEffect()) return ;
			CloseToScreen(HB_ScreenFactory.ID_INVENTORY_SCREEN);
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Ingame", "Inventory");
		}

		private function onExit(e:MouseEvent):void {
			if(!FinishCasinoEffect()) return ;
			Close(false, new Callback(Retry, this, null));
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Ingame", "Again");
		}
		
		private function FinishCasinoEffect():Boolean {
			DestroyLoopSound();			
			if(!_metaMoneyUpgrade.hasFinished || !_metaXpUpgrade.hasFinished) {
				
				_metaMoneyUpgrade.ForceFinish();
				_metaXpUpgrade.ForceFinish();
				_forceFinish = true;
				
				return false;
			} else {
				if(HB_LevelVaultController.showInMyFaceScreen) {
					HB_LevelVaultController.showInMyFaceScreen = false;
					ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_REVENGE_SCREEN);
					return false;
				}
				
				
				_forceFinish = true;
				return true;
			}
		}

		private function Retry():void {
			if(_destroyCalled) return ;
			HB_GameProgress.gameProgress.metaProgress.lastSelected.ValideEquip();
			_context.DestroyAfterUpdate();
			_destroyCalled = true;			
		}

		override public function Update(context : MainGame) : void {
			super.Update(context);
			if(_destroyCalled && !context.game.isInit) {
				if(_wait <= 0) {
					Main(context).ClearAllCaches();
					Main(context).LaunchGame();
					ScreenManager.instance.RemoveScreen(this);
				}
				_wait -= context.game.speedManager.GetSpeed();
			}	
			
			if(lvlUpPatch) {
				
			}
		}

		override public function Refresh():void {
			xpTxt.text = Utils.PutVirgules(_metaXpUpgrade.upgradeBonusGiven) ;
			moneyTxt.text = Utils.PutVirgules(_metaMoneyUpgrade.upgradeBonusGiven) ;
			distTxt.text = Utils.PutVirgules(_context.geekDistance) + " " + TextFactory.instance.GetMsg(HB_TextFactory.ID_FEET_HIT) ;
			distHighTxt.text = Utils.PutVirgules(HB_GameProgress.gameProgress.highdistance) ;
			xpTotalTxt.text = Utils.PutVirgules(metaProgress.lastSelected.xp.upgradeValue - _context.xpGain + _metaXpUpgrade.upgradeBonusGiven) ;
			diamondTxt.text = Utils.PutVirgules(HB_GameProgress.gameProgress.diamondTotal);
			_xpStats.Refresh();
		}
		
		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_ROUNDCOMPLETE_SCREEN);
		}
		
		private function get metaProgress():MetaGameProgress {
			return HB_GameProgress.gameProgress.metaProgress;
		}
		
		//generic
		private function get exitBtn():Button {	return Button(panel.getChildByName("againBtn"));}
		private function get shopBtn():Button {return Button(panel.getChildByName("shopBtn"));}
		private function get inventoryBtn():Button {return Button(panel.getChildByName("inventoryBtn"));}
		private function get optionsBtn():Button {return Button(panel.getChildByName("optionsBtn"));}
		private function get diamondBtn():Button {return Button(panel.getChildByName("diamondBtn"));}
		private function get submitBtn():Button {return Button(panel.getChildByName("submitBtn"));}
		
		private function get challengeBtn():Button {return Button(panel.getChildByName("challengeBtn"));}
		
		//private function get trophyBtn():Button {return Button(panel.getChildByName("trophyBtn"));}
		//private function get trophyNewBtn():MovieClip {return MovieClip(trophyBtn.getChildByName("newIcon"));}
		
		//highscore
		private function get highscoreBtn():Button {return Button(panel.getChildByName("highscoreBtn"));}
		private function get distTxt():TextField {return TextField(panel.getChildByName("distTxt"));}
		private function get distHighTxt():TextField {return TextField(panel.getChildByName("distHighTxt"));}
		
		//gold
		private function get moneyTxt():TextField {return TextField(panel.getChildByName("moneyTxt"));}
		private function get diamondTxt():TextField {return TextField(panel.getChildByName("diamondTxt"));}
		
		//xp
		private function get lvlUpPatch():MovieClip {return MovieClip(panel.getChildByName("lvlUpPatch"));}
		private function get xpTxt():TextField {return TextField(panel.getChildByName("xpTxt"));}
		private function get xpTotalTxt():TextField {return TextField(panel.getChildByName("xpTotalTxt"));}
		private function get xpBar():MovieClip {return MovieClip(panel.getChildByName("xpBar"));}
		
		private function get iPhoneAdBtn():MovieClip {return MovieClip(panel.getChildByName("iPhoneAdBtn"));}
		
		private function get sponsorRound():Button {return Button(panel.getChildByName("sponsorRound"));}
		private function get moreGamesBtn():Button {return Button(panel.getChildByName("moreGamesBtn"));}
		
	
		static public function set forceFinish(forceFinish : Boolean) : void {
			_forceFinish = forceFinish;
		}
	}
}
