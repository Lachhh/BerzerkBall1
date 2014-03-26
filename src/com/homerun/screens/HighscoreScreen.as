package com.homerun.screens {
	import com.homerun.Main;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.HB_LevelVaultController;
	import com.homerun.meta.ui.highscore.MetaHighscore;
	import com.homerun.multilingual.HB_TextFactory;
	import com.homerun.screens.HB_Screen;
	import com.homerun.screens.view.highscore.HighscoreView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class HighscoreScreen extends HB_Screen {
		private var _highscorePanelView:HighscoreView ;

		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_highscorePanelView = new HighscoreView(panel, new Callback(ChallengePlayer, this, null));
			_highscorePanelView.SetMetaHighscorePanel(HB_LevelVaultController.dailyScores, HB_LevelVaultController.weeklyScores, HB_LevelVaultController.alltimeScores, HB_LevelVaultController.friends);
			
			linkTxt.text = HB_VersionInfo.urlChallenge + "[MY_FRIEND]";
			linkTxt.addEventListener(FocusEvent.FOCUS_IN, onFocusText);
			Utils.SetMaxSizeOfTxtField(linkTxt, 12);
			challengeBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickChallenge);
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			
			InitOkBtn(challengeBtn);
			InitOkBtn(exitBtn);
			InitOkBtn(_highscorePanelView.nobodyChallengeConnect);
		}
		
		private function onFocusText(event : FocusEvent) : void {
			linkTxt.setSelection(0,0);
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			_highscorePanelView.Destroy();
			
			challengeBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickChallenge);
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
		}
		
		private function onClickExit(event : MouseEvent) : void {
			CloseToScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
		}

		private function onClickChallenge(event : MouseEvent) : void {
			var c:HB_Screen = HB_Screen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_CHALLENGE_SCREEN));
			c.SetLastScreen(HB_ScreenFactory.ID_HIGHSCORE_SCREEN);
			Close(true);
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_HIGHSCORE_SCREEN);
		}
		
		private function ChallengePlayer(metaHighscore:MetaHighscore):void {
			HB_LevelVaultController.SetChallengeHighscore(metaHighscore);
			CloseToScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
			
			var str:String = TextFactory.instance.GetMsg(HB_TextFactory.ID_QUESTION_CHALLENGE_SET);
			str = str.split("[x]").join(metaHighscore.name);
			str = str.split("[y]").join(metaHighscore.highscore);
			Main.ShowMsgBoxFromString(str);
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_CHALLENGE_BELL);
			Jukebox.instance.PlaySound(HB_SfxFactory.randomMegaPunch);
			ScreenManager.instance.CreateFlashScreen(0xFFFFFF, 5);
		}		
		
		override public function Refresh():void {
			_highscorePanelView.Refresh();
		}
		
		private function get challengeBtn():Button { return Button(panel.getChildByName("challengeBtn"));}
		private function get exitBtn():Button { return Button(panel.getChildByName("exitBtn"));}
		private function get linkTxt():TextField { return TextField(panel.getChildByName("linkTxt"));}
		
						
	}
}
