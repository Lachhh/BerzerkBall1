package com.homerun.screens {
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.io.AchievementManager;
	import com.homerun.meta.ui.trophy.MetaTrophy;
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import com.homerun.screens.view.trophy.TrophySelectorView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.interfaces.forms.Button;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class TrophyScreen extends HB_Screen {
		private var _trophySelector:TrophySelectorView ;
		private var _sponsorView:SponsorLogoView;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_sponsorView = new SponsorLogoView(sponsorTrophy);
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			_trophySelector = new TrophySelectorView(panel);
			AchievementManager.hasNew = false;
			InitOkBtn(exitBtn);
			InitOkBtn(_trophySelector.prevBtn);
			InitOkBtn(_trophySelector.nextBtn);
		}
	
		override public function RemoveListeners() : void {
			super.RemoveListeners();
			exitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			_trophySelector.Destroy();
			_sponsorView.Destroy();
		}
		
		public function SetMetaTrophy(mt:MetaTrophy):void {
			_trophySelector.SetMetaTrophy(mt);
			_trophySelector.Refresh();
		}

		private function onClickExit(event : MouseEvent) : void {
			var t:TrophySelectScreen = TrophySelectScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_TROPHYSELECT_SCREEN));
			t.SetLastScreen(lastScreen);
			Close(true);	
		}
		
		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_TROPHY_SCREEN);
		}
		
		private function get exitBtn():Button { return Button(panel.getChildByName("exitBtn"));}
		public function get sponsorTrophy():MovieClip { return (panel.getChildByName("sponsorTrophy")) as MovieClip;}	
	}
}
