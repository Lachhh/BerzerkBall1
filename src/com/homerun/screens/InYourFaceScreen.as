package com.homerun.screens {
	import com.homerun.HB_Game;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.AchievementManager;
	import com.homerun.io.HB_LevelVaultController;
	import com.homerun.io.stats.StatsStatic;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.homerun.multilingual.HB_TextFactory;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.externalAPI.premiumAPI.MTVVirtualGoodsController;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class InYourFaceScreen extends HB_Screen {
		private var _context:HB_Game ;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_context = HB_Game(context);	
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			inYourFaceBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickInYourFace);
			connectBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickConnect);
			InitOkBtn(exitBtn);
			InitOkBtn(inYourFaceBtn);
			
			inYourFaceBtn.visible = false;
			challengeHimBack1.visible = false;
			challengeHimBack2.visible = false;
				
			if(HB_LevelVaultController.myChallengerHighscore) {
				challengerNameTxt.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_YOU_HAVE_BEAT_CHALLENGE).split("[x]").join(HB_LevelVaultController.myChallengerHighscore.name);
				HB_LevelVaultController.InHisFace();
			} else if(HB_VersionInfo.mtvPlayerScoreLoaded) {
				challengerNameTxt.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_YOU_HAVE_BEAT_CHALLENGE).split("[x]").join(HB_VersionInfo.mTVPlayerName);
			}
			
			StatsStatic.instance.AddValue(StatsStatic.ID_INYOURFACES, 1);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_INYOURFACES) >= 1) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_23);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_INYOURFACES) >= 5) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_24);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_INYOURFACES) >= 10) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_25);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_INYOURFACES) >= 20) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_26);
			
			
				
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_CROWD);
			
		}
		
		override public function RemoveListeners() : void {
			super.RemoveListeners();
			exitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			inYourFaceBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickInYourFace);
			connectBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickConnect);
		}
		
		private function onClickConnect(event : MouseEvent) : void {
			ExternalAPIManager.premiumAPI.ShowLogin();
		}

		private function onClickInYourFace(event : MouseEvent) : void {
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_ADDICTINGGAMES) {
				var m:MTVVirtualGoodsController = (ExternalAPIManager.premiumAPI as MTVVirtualGoodsController);
				if(m) {
					var myName:String = m.accountName;
					var myScore : int = _context.geekDistance;
					m.ShareOnFacebook("berzerkball-shared", "Berzerk Ball !", "Try to beat my score : " + Utils.PutVirgules(myScore) + " !", {name:myName, score:myScore});
					ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);	
				}
			} else {
				var c:ChallengeScreen = ChallengeScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_CHALLENGE_SCREEN));
				c.SetLastScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
			}
			Close(true);
		}

		private function onClickExit(event : MouseEvent) : void {
			CloseToScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
		}

		override public function Update(context : MainGame) : void {
			super.Update(context);
			if(connectOnTxt == null) return;
			if(ExternalAPIManager.premiumAPI.loggedIn) {
				connectOnTxt.visible = false;
				connectBtn.visible = false;
				
				challengeHimBack1.visible = true;
				challengeHimBack2.visible = true;
				inYourFaceBtn.visible = true;
			} else {
				connectOnTxt.visible = true;
				connectBtn.visible = true;
				
				challengeHimBack1.visible = false;
				challengeHimBack2.visible = false;
				inYourFaceBtn.visible = false;	
			}
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_INYOURFACE_SCREEN);
		}
		
		private function get exitBtn():Button { return Button(panel.getChildByName("exitBtn"));}
		private function get inYourFaceBtn():Button { return Button(panel.getChildByName("inYourFaceBtn"));}
		private function get challengerNameTxt():TextField{ return TextField(panel.getChildByName("challengerNameTxt"));}
		private function get challengeHimBack1():TextField{ return TextField(panel.getChildByName("AUTO_0"));}
		private function get challengeHimBack2():TextField{ return TextField(panel.getChildByName("AUTO_1"));}
		
		private function get connectOnTxt():TextField{ return TextField(panel.getChildByName("connectOnTxt"));}
		private function get connectBtn():Button { return Button(panel.getChildByName("connectBtn"));}
		

		
	}
}
