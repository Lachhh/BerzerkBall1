package com.homerun.screens {
	import mochi.as3.MochiEvents;

	import com.homerun.HB_Game;
	import com.homerun.Main;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.AchievementManager;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.io.HB_LevelVaultController;
	import com.homerun.meta.ui.MetaGameProgress;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.homerun.screens.view.distribution.SocialShareView;
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.initializers.nonExVersions.JaludoNonInit;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	/**
	 * @author Lachhh
	 */
	public class TitleScreen extends HB_Screen {
		private var _main:Main ;
		private var _socialView:SocialShareView ;
		private var _sponsorLogoView:SponsorLogoView ;
		
		public function TitleScreen() {
			super();
		}

		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_socialView = new SocialShareView(followTitle);
			hostBtn.visible = HB_VersionInfo.showHostBtn;
			if(!HB_VersionInfo.showFaceBookButton) {
				_socialView.Hide();
				hostBtn.visible = false;
			}
			
			_sponsorLogoView = new SponsorLogoView(sponsorTitle);
						
			_main = HB_Game(context).main;			
			start.addEventListener(MouseEvent.MOUSE_DOWN, onClickStart);
			credits.addEventListener(MouseEvent.MOUSE_DOWN, onClickCredits);
			//moreGamesBtn.addEventListener(MouseEvent.MOUSE_DOWN, OnClickSponsorMoreGames);
			hostBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickHost);
			jig.addEventListener(MouseEvent.MOUSE_DOWN, onClickJig);
			optionsBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickOptions);
			trophyBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickTrophy);
			
			
			Jukebox.instance.FadeToMusic(HB_SfxFactory.ID_MUSIC_TITLE, 36);
			
			InitOkBtn(start);
			InitOkBtn(credits);
			InitOkBtn(moreGamesBtn);
			InitOkBtn(hostBtn);
			Main.CheckAllAchievements();
			HB_LevelVaultController.CheckForInMyFace();
			jig.visible = HB_VersionInfo.canShowJig;
			ExternalAPIManager.premiumAPI.ShowBar();
			
			if(VersionInfo.sponsorVisualFrame != VersionInfo.FRAME_JALUDO) {
				moreGamesBtn.visible = (VersionInfo.sponsorSiteMoreGamesUrl != "");
			}
			
			if((VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_KEYGAMES) || (VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_SPELE_NL)) {
				moreGamesBtn.visible = false;
				moreGamesBtn.addEventListener(MouseEvent.MOUSE_DOWN, onHighscore);
			} else {
				moreGamesBtn.addEventListener(MouseEvent.MOUSE_DOWN, VersionInfo.OnClickSponsorMoreGames);
				moreGamesBtn.visible = (VersionInfo.sponsorSiteMoreGamesUrl != "");
			}
			
			denizeBig.visible = !HB_VersionInfo.denizeSmallBoobs;
			//var str:String = TextFactory.instance.LANGUAGE_CN.ExportInAS3();
			//ExternalLanguageController.SaveString(str, "AS3Code.txt");
		}

		private function onHighscore(event : MouseEvent) : void {
			ExternalAPIManager.scoreAPI.ShowHighscore(null);
		}

		
		private function onClickHost(event : MouseEvent) : void {
			Utils.navigateToURLAndRecord(new URLRequest(VersionInfo.URL_BERZERK_DISTRIBUTION));
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			_socialView.Destroy();
			_sponsorLogoView.Destroy();
			start.removeEventListener(MouseEvent.MOUSE_DOWN, onClickStart);
			credits.removeEventListener(MouseEvent.MOUSE_DOWN, onClickCredits);
			moreGamesBtn.removeEventListener(MouseEvent.MOUSE_DOWN, OnClickSponsorMoreGames);
			hostBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickHost);
			optionsBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickOptions);
			jig.removeEventListener(MouseEvent.MOUSE_DOWN, onClickJig);
			trophyBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickTrophy);
		}
		
		private function OnClickSponsorMoreGames(event : MouseEvent) : void {
			
			AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_37);
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) {
				MochiEvents.trackEvent("Main Menu", "More Game");
				(visual.root as JaludoNonInit).LogoMoreGame("");
			} else {
				VersionInfo.OnClickSponsorMoreGames(null);	
			}			
		}
		
		private function onClickTrophy(event : MouseEvent) : void {
			ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_TROPHYSELECT_SCREEN);
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Main Menu", "Trophies");
		}

		private function onClickOptions(event : MouseEvent) : void {
			ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_OPTIONS_TITLE_SCREEN);
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Main Menu", "Options");
		}

		private function onClickJig(event : MouseEvent) : void {
			navigateToURL(new URLRequest(HB_VersionInfo.JIG_URL));
		}

		private function onClickCredits(event : MouseEvent) : void {
			ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_CREDITS_SCREEN);
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Main Menu", "Credits");
		}

		private function onClickStart(event : MouseEvent) : void {
			var c:CharacterScreen = CharacterScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_CHARACTER_SCREEN));
			c.SetCallback(new Callback(StartGame, this, null));
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Main Menu", "Start");
		}

		override public function ShowIdle(context : MainGame) : void {
			super.ShowIdle(context);
			if(HB_LevelVaultController.showInMyFaceScreen) {
				HB_LevelVaultController.showInMyFaceScreen = false;
				ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_REVENGE_SCREEN);
			}
		}

		private function StartGame():void {
			Close(true, new Callback(LaunchGame, this, null));
		}
		
		private function LaunchGame():void {
			_main.LaunchGame();
		}
		
		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_TITLE_SCREEN);
		}

		override protected function get playOpenSound() : Boolean {
			return false;
		}		
		
		private function get metaProgress():MetaGameProgress {return HB_GameProgress.gameProgress.metaProgress;}
		
		private function get start():Button { return Button(panel.getChildByName("startTitleBtn")); }
		private function get moreGamesBtn():Button { return Button(panel.getChildByName("moreGamesBtn")); }
		private function get hostBtn():Button { return Button(panel.getChildByName("hostBtn")); }
		private function get optionsBtn():Button { return Button(panel.getChildByName("optionsBtn")); }
		private function get trophyBtn():Button { return Button(panel.getChildByName("trophyBtn")); }
		private function get credits():Button { return Button(panel.getChildByName("creditsBtn")); }
		private function get jig():Button { return Button(panel.getChildByName("jig")); }
		private function get followTitle():MovieClip { return MovieClip(panel.getChildByName("followTitle")); }
		
		private function get splash():MovieClip { return MovieClip(panel.getChildByName("splash")); }
		private function get denizeBig():MovieClip { return MovieClip(splash.getChildByName("denizeBig")); }
		
		
		
		private function get sponsorTitle():Button { return Button(panel.getChildByName("sponsorTitle")); }
	}
}
