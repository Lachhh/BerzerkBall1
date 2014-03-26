package com.homerun.screens.view {
	import com.homerun.Main;
	import com.lachhhEngine.io.Callback;

	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class Slider {
		private var _visual : MovieClip ;
		private var _slideCallback : Callback ;
		private var _prct : Number = 1;
		private var _stage : Stage ;

		public function Slider(visual : MovieClip, slideCallback : Callback) {
			_visual = visual;
			_visual.addEventListener(MouseEvent.MOUSE_DOWN, onClickSlider);
			_visual.addEventListener(MouseEvent.MOUSE_OVER, Main.PlayRollOverSound);
			_visual.buttonMode = true;
			
			_slideCallback = slideCallback;
			UpdateVisual();
		}

		public function Destroy() : void {
			_visual.removeEventListener(MouseEvent.MOUSE_DOWN, onClickSlider);
			_visual.removeEventListener(MouseEvent.MOUSE_OVER, Main.PlayRollOverSound);
			StopSoundSlider();
			_stage = null;
			_visual = null;
			_slideCallback.Destroy();
			_slideCallback = null;
		}

		private function UpdateVisual() : void {
			var frame : int = Math.floor((_prct) * (_visual.totalFrames - 1) + 1);
			_visual.gotoAndStop(frame);
		}

		private function onClickSlider(event : MouseEvent) : void {
			if(_stage == null) {
				_stage = _visual.stage;
			}
			_stage.addEventListener(MouseEvent.MOUSE_MOVE, SetPrctOnMove);
			_stage.addEventListener(MouseEvent.MOUSE_UP, StopSoundSlider);
			SetPrctOnMove();
		}

		private function StopSoundSlider(e : Event = null) : void {
			if(_stage == null) return ;			
			_stage.removeEventListener(MouseEvent.MOUSE_MOVE, SetPrctOnMove);
			_stage.removeEventListener(MouseEvent.MOUSE_UP, StopSoundSlider);	
		}

		private function SetPrctOnMove(e : Event = null) : void {
			prct = (_visual.mouseX / (_visual.width)) + (1 / _visual.totalFrames) ;
			_slideCallback.DoCallback();
		}

		public function get prct() : Number {
			return _prct;
		}

		public function set prct(prct : Number) : void {
			_prct = Math.max(0, Math.min(1, prct));
			UpdateVisual();
		}
	}
}
