package com.homerun.io.keygames {
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.externalAPI.scoreAPI.IScoreAPI;
	import com.lachhhEngine.io.externalAPI.scoreAPI.MetaExternalScoreboard;
	import com.sofie.SofieCore;

	import flash.display.MovieClip;

	/**
	 * @author Lachhh
	 */
	public class KeyGamesScoreController implements IScoreAPI {
		private var _gameID:String;

		public function KeyGamesScoreController(gameId:String) {
			_gameID = gameId;
		}

		public function Connect(root : MovieClip, success : Callback = null, error : Callback = null) : void {
		}
		
		public function get nameOfSystem() : String {
			// TODO: Auto-generated method stub
			return null;
		}
		
		public function get connected() : Boolean {
			// TODO: Auto-generated method stub
			return null;
		}
		
		public function get loggedIn() : Boolean {
			// TODO: Auto-generated method stub
			return null;
		}
		
		public function ShowHighscore(m : MetaExternalScoreboard) : void {
		}
		
		public function SendScore(score : int, extra : Object, m : MetaExternalScoreboard) : void {
			var submitScoreToSofie:SofieCore = new SofieCore();
			//To send a score use (replace myGameID with the slug from sofie admin);
			submitScoreToSofie.submitScore({score:score, gameID:_gameID});
		}
		
		public function SendLevel(level : int, extra : Object) : void {
		}
		
		public function SendGameOver(score : int, extra : Object) : void {
		}
		
		public function get canShowHighscore() : Boolean {
			// TODO: Auto-generated method stub
			return false;
		}
	}
}
