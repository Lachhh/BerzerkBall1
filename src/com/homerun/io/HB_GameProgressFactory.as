package com.homerun.io {
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.io.files.GamePrefs;
	import com.lachhhEngine.io.files.GameProgress;
	import com.lachhhEngine.io.files.GameProgressFactory;

	/**
	 * @author Lachhh
	 */
	public class HB_GameProgressFactory extends GameProgressFactory {
		override public function GetNewGamePrefs(main:MainGame) : GamePrefs {
			return new HB_GamePrefs(main);
		}

		override public function GetNewInstance() : GameProgress {
			return new HB_GameProgress();
		}
	}
}
