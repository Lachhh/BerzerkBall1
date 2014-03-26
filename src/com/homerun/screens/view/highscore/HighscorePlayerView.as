package com.homerun.screens.view.highscore {
	import com.homerun.io.HB_LevelVaultController;
	import com.homerun.meta.ui.highscore.MetaHighscore;
	import com.homerun.screens.view.ObjectView;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class HighscorePlayerView extends ObjectView {
		private var _metaHighscore:MetaHighscore;
		private var _clickCallback:Callback;
		private var _canBeat:Boolean ;
		public function HighscorePlayerView(visual : MovieClip, clickBack:Callback) {
			super(visual);
			beatThatBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickBeat);
			_clickCallback = clickBack;
			_canBeat = false;
		}

		override public function Destroy() : void {
			super.Destroy();
			beatThatBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickBeat);
		}

		public function SetMetaHighscorePlayer(metaHighscore:MetaHighscore):void {
			_metaHighscore = metaHighscore;
			Refresh();
		}
		
		private function onClickBeat(event : MouseEvent) : void {
			if(_clickCallback != null) {
				_clickCallback.DoCallbackWithParams([_metaHighscore]);
			}
		}
		
		override public function Refresh():void {
			if(_metaHighscore != null) { 
				nameTxt.text = _metaHighscore.name;
				highscoreTxt.text = Utils.PutVirgules(_metaHighscore.highscore)+ "";
				beatThatBtn.visible = _canBeat && (_metaHighscore.name != HB_LevelVaultController.myName);
			} else {
				nameTxt.text = "";
				highscoreTxt.text = "";
				beatThatBtn.visible = false;
			}
			Utils.SetMaxSizeOfTxtField(nameTxt, 22);
			Utils.SetMaxSizeOfTxtField(highscoreTxt, 22);
		}
		
		private function get nameTxt():TextField {return TextField(visual.getChildByName("nameTxt")); }
		private function get highscoreTxt():TextField {return TextField(visual.getChildByName("highscoreTxt")); }
		private function get beatThatBtn():Button {return Button(visual.getChildByName("beatThatBtn"));}
		public function get name():String {return _metaHighscore != null ? _metaHighscore.name : "";}
		public function get score():int {return _metaHighscore != null ? _metaHighscore.highscore : 0;}
		
		public function get canBeat() : Boolean {
			return _canBeat;
		}
		
		public function set canBeat(canBeat : Boolean) : void {
			_canBeat = canBeat;
		}
		
		public function get metaHighscore() : MetaHighscore {
			return _metaHighscore;
		}
	}
}
