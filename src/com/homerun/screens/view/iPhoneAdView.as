package com.homerun.screens.view {
	import com.homerun.init.HB_VersionInfo;
	import flash.net.URLRequest;
	import com.lachhhEngine.utils.Utils;
	import flash.events.MouseEvent;
	import com.lachhhEngine.games.screens.view.ObjectView;

	import flash.display.MovieClip;

	/**
	 * @author Lachhh
	 */
	public class iPhoneAdView extends ObjectView {
		public function iPhoneAdView(visual : MovieClip) {
			super(visual);
			visual.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			visual.addEventListener(MouseEvent.MOUSE_OVER, onOver);
			visual.buttonMode = true;
			visual.visible = HB_VersionInfo.iphoneAds;
		}

		override public function Destroy() : void {
			super.Destroy();
			visual.removeEventListener(MouseEvent.MOUSE_DOWN, onClick);
			visual.removeEventListener(MouseEvent.MOUSE_OVER, onOver);
		}

		private function onOver(event : MouseEvent) : void {
			if(iPhoneAd.currentFrame == 56) {
				iPhoneAd.gotoAndPlay("OVER");
			}
		}

		private function onClick(event : MouseEvent) : void {
			Utils.navigateToURLAndRecord(new URLRequest(HB_VersionInfo.urliPhone));
		}
		
		public function get iPhoneAd():MovieClip { return MovieClip(visual.getChildByName("iPhoneAd"));}
	}
}
