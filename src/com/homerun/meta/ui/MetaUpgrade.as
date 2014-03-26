package com.homerun.meta.ui {

	import com.lachhhEngine.io.encryption.SecureNumber;
	/**
	 * @author Lachhh
	 */
	public class MetaUpgrade {
		private var _upgradeRange : Array ;
		
		private var _upgrade : SecureNumber = new SecureNumber() ;
		public function MetaUpgrade(xpRange : Array) {
			_upgradeRange = xpRange;
		}
		
		public function Encode():String {
			return _upgrade.value + "";
		}

		public function Decode(s:String):void {
			_upgrade.value = int(s);	
		}
		
		public function GetXpNeeded(lvlToReach : int) : int {
			if(lvlToReach > 0 && lvlToReach <= _upgradeRange.length) {
				return _upgradeRange[lvlToReach - 1];
			} else {
				return -1;	
			}	
		}

		public function GetLevelAt(xp : int) : int {
			for (var i : int = 0 ;i < _upgradeRange.length; i++) {
				if(_upgradeRange[i] > xp) {
					return i;	
				}
			} 	
			return _upgradeRange.length;
		}

		public function get isMaxed() : Boolean {
			return GetLevelAt(upgradeValue) >= numLevels; 	
		}

		public function get numLevels() : int {
			return _upgradeRange.length ;	
		} 

		public function get crntLevel() : int {
			return GetLevelAt(upgradeValue);
		}

		public function get lvlProgressPrct() : Number {
			if(isMaxed) return 0;
			var nextLvlXp : int = GetXpNeeded(crntLevel + 1);
			var crntLvlXp : int = GetXpNeeded(crntLevel);
			var xpDiff : int = nextLvlXp - crntLvlXp;
			return (upgradeValue - crntLvlXp) / xpDiff;
		}

		public function get upgradeValue() : Number {
			return _upgrade.value;
		}
		
		public function set upgradeValue(pts : Number) : void {
			_upgrade.value = pts;
		}		
	}
}
