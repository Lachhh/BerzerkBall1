package com.homerun.meta.ui {
	import com.lachhhEngine.games.Game;
	import com.homerun.meta.ui.MetaUpgrade;
	import com.lachhhEngine.io.Callback;

	/**
	 * @author Lachhh
	 */
	public class MetaUpgradeXp extends MetaUpgrade {
		private var _ptsPerUpdate : Number = 1 ;
		private var _upgradeBonus : Number;
		private var _upgradeBonusGiven : Number;
		private var _levelUpCallback : Callback ;
		private var _onFinished : Callback ;
		private var _isReady:Boolean ;
		
		public function MetaUpgradeXp(xpRange : Array, onFinished:Callback, levelUpCallback:Callback, updateSpeed : Number = 1) {
			super(xpRange) ;			
			
			_levelUpCallback = levelUpCallback;
			_onFinished = onFinished;
			_ptsPerUpdate = Math.max(1, updateSpeed);
			
			_upgradeBonusGiven = 0 ;
			_isReady = false; 
		}

		public function SetUpgradeBonus(oldUpgradePts:Number, upgradeBonus : Number):void {
			if(_isReady) return ;
			_isReady = true;
			upgradeValue = oldUpgradePts;
			_upgradeBonus = upgradeBonus;	
			_upgradeBonusGiven = 0 ; 
		}
		
		public function Update(context:Game) : void {
			GiveXp(_ptsPerUpdate * context.speedManager.GetSpeed());
		}

		private function GiveXp(xp : Number) : void {
			var frameBonus : Number = Math.min(xp, _upgradeBonus);
		
			upgradeValue += frameBonus;
			_upgradeBonus -= frameBonus;
			_upgradeBonusGiven += frameBonus;
			
			if(GetLevelAt(upgradeValue - frameBonus) < GetLevelAt(upgradeValue)) {
				LevelUp();
			} 
			
			if(_isReady && _upgradeBonus <= 0) {
				_isReady = false;	
				if(_onFinished != null) {
					_onFinished.DoCallback();	
				}
			}
		}

		protected function LevelUp() : void {
			if(_levelUpCallback != null) _levelUpCallback.DoCallback();
		}

		public function ForceFinish() : void {
			GiveXp(_upgradeBonus);
		}
		
		public function get hasFinished() : Boolean {return _upgradeBonus <= 0;	}
		public function get xpBonus() : Number {return _upgradeBonus;
		}
		
		public function get upgradeBonus() : Number {
			return _upgradeBonus;
		}
		
		public function get upgradeBonusGiven() : Number {
			return _upgradeBonusGiven;
		}
	}
}
