package com.homerun.screens.view.trophy {
	import com.homerun.io.AchievementManager;
	import com.homerun.meta.ui.trophy.MetaTrophy;
	import com.homerun.multilingual.HB_TextFactory;
	import com.homerun.screens.view.ObjectView;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class TrophyDetailsView extends ObjectView {
		private var _metaTrophy:MetaTrophy;
		public function TrophyDetailsView(visual : MovieClip) {
			super(visual);
			tryThisBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
		}

		override public function Destroy() : void {
			super.Destroy();
			tryThisBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClick);
		}
		
		private function onClick(event : MouseEvent) : void {
			navigateToURL(new URLRequest(_metaTrophy.url));
		}

		public function SetMetaTrophy(metaTrophy:MetaTrophy):void {
			_metaTrophy = metaTrophy;
		}

		override public function Refresh() : void {
			super.Refresh();
			//nameTxt.text = TextFactory.instance.GetMsg(_metaTrophy.titleId);
			
			
			trophyIcon.gotoAndStop(_metaTrophy.iconFrame);
			tryThisBtn.visible = _metaTrophy.hasUrl ;
			 	
			if(AchievementManager.instance.IsBestowed(_metaTrophy)) {
				Utils.SetColor(trophyIcon);	
				tryThisBtn.visible = false;
				descTxt.text = TextFactory.instance.GetMsg(_metaTrophy.trophyNameId) + "\n*****\n" +  TextFactory.instance.GetMsg(_metaTrophy.desc2Id);
				trophyIcon.filters = [];
			} else {
				Utils.SetColor(trophyIcon, -255, -255, -255);
				tryThisBtn.visible = false;
				descTxt.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_LOCKED) + "\n*****\n" + TextFactory.instance.GetMsg(_metaTrophy.descId);
				var b:BlurFilter = new BlurFilter(10,10,BitmapFilterQuality.LOW);
				trophyIcon.filters = [b];	
			}
		}

		private function get nameTxt():TextField { return TextField(visual.getChildByName("nameTxt")) ;}
		private function get descTxt():TextField { return TextField(visual.getChildByName("descTxt")) ;}
		private function get trophyIcon():MovieClip { return MovieClip(visual.getChildByName("trophyIcon")) ;}
		private function get tryThisBtn():Button { return Button(visual.getChildByName("tryThisBtn")) ;
		}
		
		public function get metaTrophy() : MetaTrophy {
			return _metaTrophy;
		}
	}
}
