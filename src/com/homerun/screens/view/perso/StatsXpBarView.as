package com.homerun.screens.view.perso {
	import com.homerun.screens.view.perso.StatsBarView;

	import flash.display.MovieClip;

	/**
	 * @author Lachhh
	 */
	public class StatsXpBarView extends StatsBarView {
		public function StatsXpBarView(visual : MovieClip) {
			super(visual);
		}

		override public function Refresh() : void {
			//super.Refresh();
			
			theBar.scaleX = metaUpgrade.lvlProgressPrct;
		}
		
		private function get theBar():MovieClip { return MovieClip(visual.getChildByName("theBar")); }
	}
}
