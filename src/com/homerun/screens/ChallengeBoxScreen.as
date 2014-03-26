package com.homerun.screens {
	import com.homerun.init.HB_VersionInfo;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.io.HB_LevelVaultController;
	import com.homerun.multilingual.HB_TextFactory;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.WaitForTheEndScreen;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.multilingual.TextFactory;

	import flash.display.MovieClip;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class ChallengeBoxScreen extends WaitForTheEndScreen {
		
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			if(HB_LevelVaultController.myChallengerHighscore) {
				challengedNameTxt.text = HB_LevelVaultController.myChallengerHighscore.name + "\n" + TextFactory.instance.GetMsg(HB_TextFactory.ID_SCORED) + " : " + HB_LevelVaultController.myChallengerHighscore.metaChallenge.scoreToBeat;
			} else if(HB_VersionInfo.mtvPlayerScoreLoaded) {
				challengedNameTxt.text = HB_VersionInfo.mTVPlayerName + "\n" + TextFactory.instance.GetMsg(HB_TextFactory.ID_SCORED) + " : " + HB_VersionInfo.mTVPlayerScore;
			}
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_CHALLENGE_BELL);
		}		

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_CHALLENGEBOX_SCREEN);
		}

		public function Hide():void {
			animation.SetCurrentFrame(110);	
		}
		
		override public function Skip() : void {
			super.Skip();
			ScreenManager.instance.RemoveScreen(this);
		}

		private function get panel():MovieClip { return MovieClip(visual.getChildByName("panel"));}
		private function get challengedNameTxt():TextField { return TextField(panel.getChildByName("challengedNameTxt"));}
	}
}
