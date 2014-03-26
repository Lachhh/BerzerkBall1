package com.homerun.screens.view.perso {
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.hero.HB_HeroManager;
	import com.homerun.hero.HB_HeroFactory;
	import com.homerun.constants.HBConstants;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.MetaGameProgress;
	import com.homerun.multilingual.HB_TextFactory;
	import com.homerun.screens.view.perso.PersoStatsView;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class PersoIconStatsView extends PersoStatsView {
		public function PersoIconStatsView(visual : MovieClip) {
			super(visual);
		}

		override public function Refresh() : void {
			super.Refresh();
			if(metaPerso.id == HB_HeroManager.PERSO_DENIZE && HB_VersionInfo.denizeSmallBoobs) {
				charIcon.gotoAndStop(metaPerso.id+2);
			} else {
				charIcon.gotoAndStop(metaPerso.id+1);
			}
			charNameTxt.text = TextFactory.instance.GetMsg(metaPerso.titleId);
			lvlTxt.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_LEVEL) + " " + metaPerso.xp.crntLevel;
			lockedCharacter.visible = !metaProgress.IsUnlocked(metaPerso);
			lockedTxt.text = metaProgress.GetUnlockTxt(metaPerso).split("[x]").join(Utils.PutVirgules(HBConstants.UNLOCK_DISTANCE_REQUIRED));
			normalStar.visible = metaPerso.hasReachUnlockThreshold ;
		}
		
		private function get metaProgress():MetaGameProgress { return HB_GameProgress.gameProgress.metaProgress; }
		public function get charIcon():MovieClip { return MovieClip(visual.getChildByName("charIcon")); }
		private function get charNameTxt():TextField { return TextField(visual.getChildByName("charNameTxt")); }
		private function get lvlTxt():TextField { return TextField(visual.getChildByName("lvlTxt")); }
		public function get lockedCharacter():MovieClip { return MovieClip(visual.getChildByName("lockedCharacter")); }
		private function get lockedTxt():TextField { return TextField(lockedCharacter.getChildByName("lockedTxt")); }
		public function get normalStar():MovieClip { return MovieClip(charIcon.getChildByName("normalStar")); }
		
	}
}
