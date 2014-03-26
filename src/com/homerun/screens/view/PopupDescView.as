package com.homerun.screens.view {
	import com.homerun.screens.view.ObjectView;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class PopupDescView extends ObjectView {
		public function PopupDescView(visual:MovieClip) {
			super(visual);
		}
		
		public function SetText(title:String, desc:String):void {
			titleTxt.text = title;
			descTxt.text = desc;
			Utils.SetMaxSizeOfTxtField(titleTxt, 16);
			Utils.SetMaxSizeOfTxtField(descTxt, 12);
		}

		private function get titleTxt():TextField {return TextField(visual.getChildByName("titleTxt"));}
		private function get descTxt():TextField {return TextField(visual.getChildByName("descTxt"));}
	}
}
