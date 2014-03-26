package com.homerun.meta.ui.highscore {
	import com.homerun.meta.ui.equip.engine.MetaInventoryPanel;

	/**
	 * @author Lachhh
	 */
	public class MetaHighscorePanel extends MetaInventoryPanel {
		public function MetaHighscorePanel(column:int, row:int) {
			super(column, row);
		}
		
		public function get highscorePlayer0():MetaHighscore { return MetaHighscore(GetRelative(0)) ;}
		public function get highscorePlayer1():MetaHighscore { return MetaHighscore(GetRelative(1)) ;}
		public function get highscorePlayer2():MetaHighscore { return MetaHighscore(GetRelative(2)) ;}
		public function get highscorePlayer3():MetaHighscore { return MetaHighscore(GetRelative(3)) ;}
		public function get highscorePlayer4():MetaHighscore { return MetaHighscore(GetRelative(4)) ;}
		
		public function SortByHighscore():void {
			items.sort(sortOnHighscore);
		} 
		
		private function sortOnHighscore(a:MetaHighscore, b:MetaHighscore):int {
			if(a.highscore > b.highscore) return 1 ;
			if(a.highscore < b.highscore) return -1 ;
			return 0 ;
		}
	}
}
