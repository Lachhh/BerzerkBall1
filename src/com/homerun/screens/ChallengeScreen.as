package com.homerun.screens {
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.io.HB_LevelVaultModel;
	import com.homerun.io.stats.StatsStatic;
	import com.homerun.screens.HB_Screen;
	import com.homerun.screens.view.challenge.ChallengeView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.files.FileManager;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class ChallengeScreen extends HB_Screen {
		private var _challengeView:ChallengeView ;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_challengeView = new ChallengeView(panel);
			_challengeView.SetMetaChallenge(HB_GameProgress.gameProgress.metaMyChallenge);
			
			linkTxt.addEventListener(FocusEvent.FOCUS_IN, onFocusText);
			linkTxt.text = HB_VersionInfo.urlChallenge + ExternalAPIManager.premiumAPI.accountName;
			Utils.SetMaxSizeOfTxtField(linkTxt, 12);
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			twitterBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickTwitter);
			facebookBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickFacebook);
			highscoreBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickHighscore);
			connectBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickConnect);
			
			InitCancelBtn(exitBtn);
			InitBtn(twitterBtn);
			InitBtn(facebookBtn);
			InitOkBtn(highscoreBtn);
			InitOkBtn(connectBtn);
			 
			connectFirstMc.visible = !ExternalAPIManager.premiumAPI.loggedIn ;
			highscoreBtn.visible = !connectFirstMc.visible; 
		}
		
		private function onFocusText(event : FocusEvent) : void {
			linkTxt.stage.focus = null;
			linkTxt.setSelection(0,linkTxt.text.length);
			event.preventDefault();
		}
		
		override public function RemoveListeners() : void {
			super.RemoveListeners();
			exitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			twitterBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickTwitter);
			facebookBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickFacebook);
			highscoreBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickHighscore);
			connectBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickConnect);
			
			_challengeView.UpdateMetaChallenge();
			if(_challengeView.isDirty) {
				HB_LevelVaultModel.EditMyChallenge(HB_GameProgress.gameProgress.metaMyChallenge.Encode());
				FileManager.instance.SaveToExternalAPI();				
			}
		}
		
		private function onClickConnect(event : MouseEvent) : void {
			ExternalAPIManager.premiumAPI.ShowLogin();
		}

		private function onClickHighscore(event : MouseEvent) : void {
			var h:HighscoreScreen = HighscoreScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_HIGHSCORE_SCREEN));
			h.SetLastScreen(lastScreen);
			
			Close(true);
		}

		private function onClickFacebook(event : MouseEvent) : void {
			var url:String ; 
			if(ExternalAPIManager.premiumAPI.loggedIn) {
				url = "http://www.facebook.com/share.php?u=" + HB_VersionInfo.urlChallenge + ExternalAPIManager.premiumAPI.accountName;
			} else {
				url = "http://www.facebook.com/share.php?u=" + HB_VersionInfo.urlChallenge ;
			}
			
			//var jscommand:String = "window.open('" + url + "','win','height=400,width=600,toolbar=no,scrollbars=yes');"; 
			var urlrequest:URLRequest = new URLRequest(url); 
			Utils.navigateToURLAndRecord(urlrequest);
			
			StatsStatic.instance.AddValue(StatsStatic.ID_FACEBOOK_CLICK, 1);
		}

		private function onClickTwitter(event : MouseEvent) : void {
			Utils.navigateToURLAndRecord(new URLRequest("http://www.twitter.com"));
			StatsStatic.instance.AddValue(StatsStatic.ID_TWITTER_CLICK, 1);
			
			//AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_31);
		}

		private function onClickExit(event : MouseEvent) : void {
			if(lastScreen == -1) {
				CloseToScreen(HB_ScreenFactory.ID_SHOP_SCREEN);
			} else {
				CloseToScreen(lastScreen);
			}
		}

		override public function ShowIdle(context : MainGame) : void {
			super.ShowIdle(context);
			_challengeView.Update(context.game);
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_CHALLENGE_SCREEN);
		}
		
		private function get linkTxt():TextField { return TextField(panel.getChildByName("linkTxt"));}
		private function get exitBtn():Button{ return Button(panel.getChildByName("exitBtn"));}
		private function get twitterBtn():Button{ return Button(panel.getChildByName("twitterBtn"));}
		private function get facebookBtn():Button{ return Button(panel.getChildByName("facebookBtn"));}
		private function get highscoreBtn():Button{ return Button(panel.getChildByName("highscoreBtn"));}
		private function get connectFirstMc():MovieClip{ return MovieClip(panel.getChildByName("connectFirstMc"));}
		private function get connectBtn():Button{ return Button(connectFirstMc.getChildByName("connectBtn"));}
		
	}
}
