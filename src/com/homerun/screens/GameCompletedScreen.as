package com.homerun.screens {
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.screens.view.distribution.SocialShareView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.interfaces.forms.Button;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class GameCompletedScreen extends HB_Screen {
		private var _socialView:SocialShareView ;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);	
			_socialView = new SocialShareView(socialGameComplete);
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			InitOkBtn(exitBtn);
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_CROWD);
			
			if(!HB_VersionInfo.showFaceBookButton) {
				_socialView.Hide();
			}
		}
		
		override public function RemoveListeners() : void {
			super.RemoveListeners();
			_socialView.Destroy();
			exitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
		}

		private function onClickExit(event : MouseEvent) : void {
			if(lastScreen != -1) {
				CloseToScreen(lastScreen);
			} else {
				CloseToScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
			}
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_GAMECOMPLETED_SCREEN);
		}
		
		private function get exitBtn():Button { return Button(panel.getChildByName("exitBtn"));}
		public function get socialGameComplete():MovieClip { return MovieClip(panel.getChildByName("socialGameComplete"));}
		
	}
}
