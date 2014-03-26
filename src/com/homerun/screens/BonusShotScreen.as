package com.homerun.screens {
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.hero.HB_HeroManager;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.MetaPerso;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.WaitForTheEndScreen;

	import flash.display.MovieClip;

	/**
	 * @author Lachhh
	 */
	public class BonusShotScreen extends WaitForTheEndScreen {

		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			animation.playChildren = false;
			killerShot.visible = false;
			bonus.gotoAndPlay(1);
			
			var metaPerso:MetaPerso = HB_GameProgress.gameProgress.metaProgress.lastSelected;
			if(metaPerso.id == HB_HeroManager.PERSO_DENIZE && HB_VersionInfo.denizeSmallBoobs) {
				persoArt.gotoAndStop(metaPerso.id+2);
			} else {
				persoArt.gotoAndStop(metaPerso.id+1);
			}
			
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_KILLERSHOT_SCREEN) ;
		}
		
		private function get persoArt():MovieClip { return MovieClip(visual.getChildByName("persoArt")) ;}
		private function get bonus():MovieClip { return MovieClip(visual.getChildByName("bonus")) ;}
		private function get killerShot():MovieClip { return MovieClip(visual.getChildByName("killerShot")) ;}
	}
}
