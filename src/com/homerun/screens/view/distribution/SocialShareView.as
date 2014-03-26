package com.homerun.screens.view.distribution {
	import com.homerun.init.HB_VersionInfo;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.utils.Utils;
	import com.homerun.screens.view.ObjectView;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	/**
	 * @author Lachhh
	 */
	public class SocialShareView extends ObjectView {
		
		
		public function SocialShareView(visual : MovieClip) {
			super(visual);
			berzerk.addEventListener(MouseEvent.MOUSE_DOWN, onClickBerzerk);
			twitter.addEventListener(MouseEvent.MOUSE_DOWN, onClickTwitter);
			facebook.addEventListener(MouseEvent.MOUSE_DOWN, onClickFacebook);
		}

		override public function Destroy() : void {
			super.Destroy();
			berzerk.addEventListener(MouseEvent.MOUSE_DOWN, onClickBerzerk);
			twitter.addEventListener(MouseEvent.MOUSE_DOWN, onClickTwitter);
			facebook.addEventListener(MouseEvent.MOUSE_DOWN, onClickFacebook);
		}
		
		private function onClickFacebook(event : MouseEvent) : void {
			Utils.navigateToURLAndRecord(new URLRequest(HB_VersionInfo.URL_FACEBOOK));
		}

		private function onClickTwitter(event : MouseEvent) : void {
			Utils.navigateToURLAndRecord(new URLRequest(HB_VersionInfo.URL_TWITTER));
		}

		private function onClickBerzerk(event : MouseEvent) : void {
			Utils.navigateToURLAndRecord(new URLRequest(HB_VersionInfo.URL_BERZERK_FORUM));
		}
		
		public function Hide():void {
			visual.visible = false;
		}
		
		public function Show():void {
			visual.visible = true;
		}

		private function get berzerk():Button { return Button(visual.getChildByName("berzerk"));}
		private function get twitter():Button { return Button(visual.getChildByName("twitter"));}
		private function get facebook():Button { return Button(visual.getChildByName("facebook"));}
	}
}
