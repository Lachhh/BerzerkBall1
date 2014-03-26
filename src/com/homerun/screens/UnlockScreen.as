package com.homerun.screens {
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.MetaPerso;
	import com.homerun.screens.HB_Screen;
	import com.homerun.screens.view.perso.PersoIconStatsView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.interfaces.forms.Button;

	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class UnlockScreen extends HB_Screen {
		private var _persoStats:PersoIconStatsView;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_persoStats = new PersoIconStatsView(panel);
			
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			InitOkBtn(exitBtn);
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_CROWD);
		}
		
		public function SetUnlockedPerso(metaPerso:MetaPerso):void {
			_persoStats.SetMetaPerso(metaPerso);	
		}
		
		override public function RemoveListeners() : void {
			super.RemoveListeners();
			exitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
		}

		override public function ShowIdle(context : MainGame) : void {
			super.ShowIdle(context);
			_persoStats.lockedCharacter.alpha -= 0.01;
		}

		private function onClickExit(event : MouseEvent) : void {
			if(HB_GameProgress.gameProgress.metaProgress.gameCompleted) {
				var hb:HB_Screen = HB_Screen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_GAMECOMPLETED_SCREEN));
				hb.SetLastScreen(lastScreen);	
				Close(true);
			} else {
				if(lastScreen != -1) {
					CloseToScreen(lastScreen);
				} else {
					CloseToScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
				}
			}
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_UNLOCK_SCREEN);
		}
		
		private function get exitBtn():Button { return Button(panel.getChildByName("exitBtn"));}
	}
}
