package com.homerun.screens.view.challenge {
	import com.lachhhEngine.io.Callback;
	import flash.events.MouseEvent;
	import com.homerun.screens.view.ObjectView;
	import com.lachhhEngine.interfaces.forms.Button;

	import flash.display.MovieClip;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class ChallengeQuoteView extends ObjectView {
		private var _clickCallback:Callback ;
		private var _oldQuote:String ;
		public function ChallengeQuoteView(visual : MovieClip, clickCallback:Callback) {
			super(visual);
			viewBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickView);
			_clickCallback = clickCallback;
			quoteTxt.restrict = "^[]";
			quoteTxt.maxChars = 40;
			viewBtn.tabEnabled = false;
		}

		override public function Destroy() : void {
			super.Destroy();
			viewBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickView);			
		}
		
		private function onClickView(event : MouseEvent) : void {
			if(_clickCallback != null) {
				_clickCallback.DoCallbackWithParams([quote]);	
			}
		}

		public function SetQuote(quote:String):void {
			quoteTxt.text = _oldQuote = quote;
		}
		
		public function get quote():String { return quoteTxt.text ; }
		public function get isDirty():Boolean { return quoteTxt.text != _oldQuote ;}

		private function get viewBtn():Button { return Button(visual.getChildByName("viewBtn"));}
		private function get quoteTxt():TextField { return TextField(visual.getChildByName("quoteTxt"));}
		
	}
}
