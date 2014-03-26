package com.homerun.io {
	import com.homerun.meta.ui.MetaGameProgress;
	import com.homerun.meta.ui.challenge.MetaChallenge;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.io.encryption.SecureNumber;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.io.files.FileManager;
	import com.lachhhEngine.io.files.GameProgress;

	/**
	 * @author Lachhh
	 */
	public class HB_GameProgress extends GameProgress {
		static public const VALUE_PER_FRIENDS:int = 25;
		static public const VALUE_PER_DAYS:int = 10;		
		private const SEPARATOR:String = "~" ;
		private var _metaMyChallenge:MetaChallenge = new MetaChallenge();
		private var _metaProgress:MetaGameProgress = new MetaGameProgress();
		

		override public function Init() : void {
			super.Init();
		}
				
		override public function Destroy() : void {
			super.Destroy();
		}

		//Save
		override public function Encode() : String {
			return  _metaMyChallenge.Encode() + SEPARATOR + _metaProgress.Encode();
		}
		
		//Load	
		override public function Decode(s : String) : void {
			var params:Array = s.split(SEPARATOR);
			 _metaMyChallenge.Decode(params.shift());
			 _metaProgress.Decode(params.shift());
			 
			 HB_LevelVaultController.InitMyInfo();
		}
				
		static public function get gameProgress():HB_GameProgress {
			return HB_GameProgress(FileManager.instance.crntGameProgress);
		}
		
		/*public function get diamonds() : int {
			if(diamondTotal < _metaProgress.numDiamondSpent) {
				ScreenManager.instance.ShowCheatScreen();
				throw new Error("CHEAT DETECTED") ;
			}
			return (diamondTotal - _metaProgress.numDiamondSpent) ;
		}*/
		
		
		public function get diamondTotal():int {
			var valueFriends:int = (HB_LevelVaultController.numFriends * VALUE_PER_FRIENDS) ;   
			var valueDays:int = (HB_LevelVaultController.numDaysPlayed * VALUE_PER_DAYS) ;
			var valueAchievement:int = AchievementManager.instance.numDiamondsBestowed;
			var valueBought:int = diamondsBought;
				 
			return valueFriends + valueDays + valueAchievement + valueBought;
		}
		
		
			
		public function get diamondsBought():int {
			var d10:int = ExternalAPIManager.premiumAPI.GetItemNumBought(HB_PremiumConstants.ITEM_DIAMOND_10)*100;
			var d50:int = ExternalAPIManager.premiumAPI.GetItemNumBought(HB_PremiumConstants.ITEM_DIAMOND_50)*250;
			var d100:int = ExternalAPIManager.premiumAPI.GetItemNumBought(HB_PremiumConstants.ITEM_DIAMOND_100)*500;
			return Math.max(0, d10 + d50 + d100);
		}

		public function get metaProgress() : MetaGameProgress {
			return _metaProgress;
		}
		
		public function get highdistance() : Number {return _metaMyChallenge.scoreToBeat;}
		public function set highdistance(highdistance : Number) : void {_metaMyChallenge.scoreToBeat = highdistance;}
		
		public function get metaMyChallenge() : MetaChallenge {
			return _metaMyChallenge;
		}
		
		public function set metaMyChallenge(metaMyChallenge : MetaChallenge) : void {
			_metaMyChallenge = metaMyChallenge;
		}
		
		public function get cash() : int {return _metaProgress.lastSelected.cash;}
		public function set cash(cash : int) : void {_metaProgress.lastSelected.cash = cash;}
	}
}
