package com.homerun.screens {
	import com.homerun.Main;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.io.HB_LevelVaultController;
	import com.homerun.multilingual.HB_TextFactory;
	import com.homerun.screens.HB_Screen;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationCallback;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.multilingual.TextFactory;

	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class RevengeScreen extends HB_Screen {
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			whoCareBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickWho);
			revengeBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickRevenge);
			var msg:String = TextFactory.instance.GetMsg(HB_TextFactory.ID_YOUR_PWNY_SCORE).split("[x]").join(HB_LevelVaultController.inMyFaceHighScore.name); 
			msgTxt.text = msg ; 
			
			//Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_WEAPON_AIRSTRIKE);
			animation.AddCallbackAt(new AnimationCallback(5, PlaySound, this, [HB_SfxFactory.ID_SFX_WEAPON14_DINO]));
			animation.AddCallbackAt(new AnimationCallback(14, PlaySound, this, [HB_SfxFactory.ID_SFX_CHALLENGE_BELL]));
			InitOkBtn(whoCareBtn);
			InitOkBtn(revengeBtn);
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			whoCareBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickWho);
			revengeBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickRevenge);
		}

		private function PlaySound(idSound:int):void {
			Jukebox.instance.PlaySound(idSound);
		}

		private function onClickWho(event : MouseEvent) : void {
			HB_LevelVaultController.blockInMyFaceScreen = true;
			Close(true);
		}
		
		private function onClickRevenge(event : MouseEvent) : void {
			HB_LevelVaultController.SetChallengeHighscore(HB_LevelVaultController.inMyFaceHighScore);
			
			var str:String = TextFactory.instance.GetMsg(HB_TextFactory.ID_QUESTION_CHALLENGE_SET);
			str = str.split("[x]").join(HB_LevelVaultController.inMyFaceHighScore.name);
			str = str.split("[y]").join(HB_LevelVaultController.inMyFaceHighScore.highscore);
			Main.ShowMsgBoxFromString(str);
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_CHALLENGE_BELL);
			Jukebox.instance.PlaySound(HB_SfxFactory.randomMegaPunch);
			ScreenManager.instance.CreateFlashScreen(0xFFFFFF, 5);
			Close(true);
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_REVENGE_SCREEN);
		}
		
		private function get whoCareBtn():Button { return Button(visual.getChildByName("whoCareBtn")); }
		private function get revengeBtn():Button { return Button(visual.getChildByName("revengeBtn")); }
		private function get msgTxt():TextField{ return TextField(panel.getChildByName("msgTxt")); 
		}

		override protected function get idleFrame() : int {return 15;}
	}
}
