package com.homerun.io.keygames {
	import flash.display.Sprite;
	import com.lachhhEngine.initializers.preloader.IPreloader;
	import com.lachhhEngine.io.Callback;
	import com.sofie.Preloader;

	import flash.display.MovieClip;
	import flash.events.Event;

	/**
	 * @author Lachhh
	 */
	public class KeyGamesPreloader implements IPreloader {
		private var _preloader:Preloader ;
		private var _preloaderContainer:MovieClip;
		private var _w:int;
		private var _h:int;
		private var _gameId:String;
		
		private var _callback:Callback;
		public function KeyGamesPreloader(w:int, h:int, gameId:String) {
			_w = w;
			_h = h;
			_gameId = gameId;
			_preloaderContainer = new MovieClip();
		}

		public function Init() : void {
			//stop();
			
			_preloader = new Preloader(_gameId , _w, _h);
			_preloaderContainer.addChild(_preloader);
			_preloader.startPreLoader();
			_preloaderContainer.addEventListener(Event.ENTER_FRAME, handleLoading);
			
		}
		
		function handleLoading (event:Event):void{
			if(_preloader.doneLoading == true){
				_preloaderContainer.removeEventListener(Event.ENTER_FRAME, handleLoading);
				_preloaderContainer.removeChild(_preloader);
				//gotoAndStop(“Game"); // or function or specific frame to start game.
				if(_callback) _callback.DoCallback();
			}
		}
		
		public function get visual() : MovieClip {
			return _preloaderContainer;
		}
		
		public function get callback() : Callback {
			return _callback;
		}
		
		public function set callback(c : Callback) : void {
			_callback = c;
		}
		
	}
}
