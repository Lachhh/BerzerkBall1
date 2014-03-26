package com.homerun.meta.ui.highscore {
	import com.homerun.meta.ui.equip.engine.MetaInventoryItem;
	import com.homerun.meta.ui.challenge.MetaChallenge;

	/**
	 * @author Lachhh
	 */
	public class MetaHighscore extends MetaInventoryItem {
		private var _levelId:int;
		private var _name:String ;
		private var _metaChallenge:MetaChallenge ;
		
		public function MetaHighscore(lvlId:int, name:String, metaChallenge:MetaChallenge) {
			_levelId = lvlId;
			_name = name;
			_metaChallenge = metaChallenge;
		}
		
		public function get name() : String {
			return _name;
		}
		
		public function get highscore() : int {	return _metaChallenge.scoreToBeat;}
		
		public function get metaChallenge() : MetaChallenge {
			return _metaChallenge;
		}
		
		public function set metaChallenge(metaChallenge : MetaChallenge) : void {
			_metaChallenge = metaChallenge;
		}
		
		public function get levelId() : int {
			return _levelId;
		}
	}
}
