package com.homerun.screens {
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import com.lachhhEngine.io.Callback;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.meta.ui.trophy.MetaTrophy;
	import com.homerun.screens.HB_Screen;
	import com.homerun.screens.view.trophy.TrophyGroupView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.ScreenManager;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class TrophySelectScreen extends HB_Screen {
		private var _trophyGroupView:TrophyGroupView ;
		private var _sponsorLogoView:SponsorLogoView ;
		
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			_trophyGroupView = new TrophyGroupView(trophyGroupVisual, new Callback(onSelectTrophy, this, null));
			_trophyGroupView.Refresh();
			_sponsorLogoView = new SponsorLogoView(sponsorTrophySelect);
			
			InitOkBtn(exitBtn);
			InitOkBtn(_trophyGroupView.prevBtn);
			InitOkBtn(_trophyGroupView.nextBtn);
			InitBtn(_trophyGroupView.achVisual0);
			InitBtn(_trophyGroupView.achVisual1);
			InitBtn(_trophyGroupView.achVisual2);
			InitBtn(_trophyGroupView.achVisual3);
			InitBtn(_trophyGroupView.achVisual4);
			
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			exitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			_trophyGroupView.Destroy();
			_sponsorLogoView.Destroy();
		}

		private function onSelectTrophy(metaTrophy:MetaTrophy):void {
			var t:TrophyScreen = TrophyScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_TROPHY_SCREEN));
			t.SetLastScreen(lastScreen);
			t.SetMetaTrophy(metaTrophy);
			Close(true);
		}
		
		private function onClickExit(event : MouseEvent) : void {
			if(lastScreen != -1) {
				CloseToScreen(lastScreen);
			} else {
				Close(true);
			}
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_TROPHYSELECT_SCREEN);
		}
		
		private function get exitBtn():MovieClip {return MovieClip(panel.getChildByName("exitBtn")) ;}
		private function get trophyGroupVisual():MovieClip {return MovieClip(panel.getChildByName("trophyGroupVisual")) ;}
		private function get sponsorTrophySelect():MovieClip {return MovieClip(panel.getChildByName("sponsorTrophySelect")) ;}
		
	}
}
