package com.homerun.screens {
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.screens.view.distribution.SocialShareView;
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.interfaces.forms.Button;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class CreditsScreen extends HB_Screen {
		private var _sponsorView:SponsorLogoView ;
		private var _socialView:SocialShareView ;
		private var _sponsor:SponsorLogoView;
		
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_sponsor = new SponsorLogoView(sponsorCredits);
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			
			InitOkBtn(exitBtn);
			_sponsorView = new SponsorLogoView(sponsor);
			_socialView = new SocialShareView(followCredits);
			if(!HB_VersionInfo.showFaceBookButton) {
				_socialView.Hide();
			}
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			exitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			_sponsorView.Destroy();
			_socialView.Destroy();
		}
		
		private function onClickExit(event : MouseEvent) : void {
			Close(true);
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_CREDITS_SCREEN);
		}
		
		private function get exitBtn():Button { return Button(panel.getChildByName("exitBtn")); }
		private function get creditsScroll():MovieClip { return MovieClip(panel.getChildByName("creditsScroll")); }
		private function get creditsDefile():MovieClip { return MovieClip(creditsScroll.getChildByName("creditsDefile")); }
		private function get sponsor():Button { return Button(creditsDefile.getChildByName("sponsor")); }
		private function get followCredits():MovieClip { return MovieClip(panel.getChildByName("followCredits")); }
		public function get sponsorCredits():MovieClip { return (panel.getChildByName("sponsorCredits")) as MovieClip;}
		
	}
}
