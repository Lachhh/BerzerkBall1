package com.homerun.meta.ui.trophy {
	import com.homerun.io.AchievementManager;
	import com.homerun.meta.ui.equip.engine.MetaInventory;

	/**
	 * @author Lachhh
	 */
	public class MetaTrophyGroup extends MetaInventory {
		private var _groupNameId : int  ;
		
		public function MetaTrophyGroup(groupNameId:int) {
			_groupNameId = groupNameId;
		}

		public function get numDiamondsEarned():int {
			var cpt:int = 0 ; 
			for (var i:int = 0 ; i < numItems ; i++) {
				var t:MetaTrophy = MetaTrophy(GetItemAt(i));
				if(AchievementManager.instance.IsBestowed(t)) {
					cpt += t.diamond;
				}
			}
			return cpt; 
		}
		
		public function get numDiamondsTotal():int {
			var cpt:int = 0 ; 
			for (var i:int = 0 ; i < numItems ; i++) {
				var t:MetaTrophy = MetaTrophy(GetItemAt(i));
				cpt += t.diamond;
			}
			return cpt; 
		}
		
		public function get groupNameId() : int {
			return _groupNameId;
		}
	}
}
