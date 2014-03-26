package com.homerun.screens.view {
	import com.homerun.io.AchievementManager;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.io.HB_LevelVaultController;
	import com.homerun.screens.view.ObjectView;

	import flash.display.MovieClip;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class DiamondView extends ObjectView {
		public function DiamondView(visual : MovieClip) {
			super(visual);
		}

		override public function Refresh() : void {
			super.Refresh();
			foruma1ValueTxt.text = HB_LevelVaultController.numFriends + " x " + valuePerFriends + " = " + (HB_LevelVaultController.numFriends * valuePerFriends) ;   
			foruma2ValueTxt.text = HB_LevelVaultController.numDaysPlayed+ " x " + valuePerDays + " = " + (HB_LevelVaultController.numDaysPlayed * valuePerDays) ;
			foruma4ValueTxt.text = AchievementManager.instance.numDiamondsBestowed +"";
			foruma5ValueTxt.text = HB_GameProgress.gameProgress.diamondsBought + "";
			totalTxt.text = HB_GameProgress.gameProgress.diamondTotal + "";
		}
		
		private function get valuePerFriends():int { return HB_GameProgress.VALUE_PER_FRIENDS ;}

		private function get valuePerDays():int { return HB_GameProgress.VALUE_PER_DAYS ;}
		
		
		public function get foruma1ValueTxt():TextField { return TextField(visual.getChildByName("foruma1ValueTxt"));}
		public function get foruma2ValueTxt():TextField { return TextField(visual.getChildByName("foruma2ValueTxt"));}
		
		public function get foruma4ValueTxt():TextField { return TextField(visual.getChildByName("foruma4ValueTxt"));}
		public function get foruma5ValueTxt():TextField { return TextField(visual.getChildByName("foruma5ValueTxt"));}
		public function get totalTxt():TextField { return TextField(visual.getChildByName("totalTxt"));}
		
	}
}
