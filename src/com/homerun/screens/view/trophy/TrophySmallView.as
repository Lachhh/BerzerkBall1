package com.homerun.screens.view.trophy {
	import com.homerun.io.AchievementManager;
	import com.homerun.meta.ui.trophy.MetaTrophy;
	import com.homerun.screens.view.ObjectView;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class TrophySmallView extends ObjectView {
		private var _metaTrophy:MetaTrophy ;
		private var _callback:Callback;
		public function TrophySmallView(visual : MovieClip, c:Callback) {
			super(visual);
			_callback = c;
			visual.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
		}

		override public function Destroy() : void {
			super.Destroy();
			visual.removeEventListener(MouseEvent.MOUSE_DOWN, onClick);			
		}
		
		private function onClick(event : MouseEvent) : void {
			_callback.DoCallbackWithParams([_metaTrophy]);
		}

		public function SetMetaTrophy(m:MetaTrophy):void {
			_metaTrophy = m;
		}

		override public function Refresh() : void {
			super.Refresh();
			if(_metaTrophy == null) {
				visual.visible = false;
				return ;	
			}
			visual.visible = true;
			titleTxt.text = TextFactory.instance.GetMsg(_metaTrophy.titleId);
			descTxt.text = TextFactory.instance.GetMsg(_metaTrophy.descId);
			diamondTxt.text = _metaTrophy.diamond + "";
			unlockedMc.visible = AchievementManager.instance.IsBestowed(_metaTrophy);
			Utils.SetMaxSizeOfTxtField(titleTxt, 16)	;
			Utils.SetMaxSizeOfTxtField(descTxt, 12)	;
		}

		private function get titleMc():MovieClip { return MovieClip(visual.getChildByName("titleMc")); }
		private function get titleTxt():TextField { return TextField(titleMc.getChildByName("txt")); }
		private function get descMc():MovieClip { return MovieClip(visual.getChildByName("descMc")); }
		private function get descTxt():TextField { return TextField(descMc.getChildByName("txt")); }
		private function get diamondTxt():TextField { return TextField(visual.getChildByName("diamondTxt")); }
		private function get unlockedMc():MovieClip { return MovieClip(visual.getChildByName("unlockedIcon")); }	 
	}
}
