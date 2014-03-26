package com.homerun.screens {
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import flash.display.MovieClip;
	import com.lachhhEngine.io.Callback;
	import flash.events.MouseEvent;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.Game;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.screens.HB_Screen;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.interfaces.forms.Button;

	/**
	 * @author Lachhh
	 */
	public class ControlsScreen extends HB_Screen {
		private var _context:Game ;
		private var _wasPause:Boolean ;
		private var _sponsorView:SponsorLogoView;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_sponsorView = new SponsorLogoView(sponsorControls);
			
			exitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			_context = context;
			_wasPause = context.paused ;
			if(!_wasPause) { 
				context.Pause(true);
			}
			
			InitOkBtn(exitBtn);
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			exitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickExit);
			_sponsorView.Destroy();
		}
		
		private function onClickExit(event : MouseEvent) : void {
			Close(true, new Callback(onEndExit, this, null));
		}
		
		private function onEndExit():void {
			if(!_wasPause) {
				_context.Pause(false);
			}
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_CONTROL_SCREEN);
		}
		
		protected function get exitBtn():Button { return Button(panel.getChildByName("exitBtn")); }
		protected function get sponsorControls():MovieClip { return MovieClip(panel.getChildByName("sponsorControls")); }
		
	}
}
