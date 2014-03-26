package com.homerun.screens.view.perso {
	import com.homerun.meta.ui.MetaPerso;
	import com.homerun.screens.view.ObjectView;

	import flash.display.MovieClip;

	/**
	 * @author Lachhh
	 */
	public class PersoStatsView extends ObjectView {
		private var _xpView:StatsXpBarView ;
		private var _strView:StatsBarView ;
		private var _precisionView:StatsBarView ;
		private var _controlView:StatsBarView ;
		private var _metaPerso:MetaPerso;
		public function PersoStatsView(visual:MovieClip) {
			super(visual);
			_xpView = new StatsXpBarView(xpBar);
			_strView = new StatsBarView(strBar);
			_precisionView = new StatsBarView(precisionBar);
			_controlView = new StatsBarView(controlBar);
		}

		override public function Destroy() : void {
			super.Destroy();
		}

		public function SetMetaPerso(metaPerso:MetaPerso):void {
			_metaPerso = metaPerso;
			_xpView.SetMetaUpgrade(metaPerso.xp);
			_strView.SetMetaUpgrade(metaPerso.str);
			_precisionView.SetMetaUpgrade(metaPerso.precision);
			_controlView.SetMetaUpgrade(metaPerso.control);
			
			_strView.SetBonus(metaPerso.equippedStrBonus);
			_precisionView.SetBonus(metaPerso.equippedPrecision);
			_controlView.SetBonus(metaPerso.equippedControl);
			Refresh();
		}
		
		override public function Refresh() : void {
			super.Refresh();	
			_xpView.Refresh();
			_strView.SetBonus(metaPerso.equippedStrBonus);
			_precisionView.SetBonus(metaPerso.equippedPrecision);
			_controlView.SetBonus(metaPerso.equippedControl);
			
			_strView.Refresh();
			_precisionView.Refresh();
			_controlView.Refresh();		
		}
		
		private function get xpBar():MovieClip { return MovieClip(visual.getChildByName("xpBar")); }
		private function get strBar():MovieClip { return MovieClip(visual.getChildByName("strBar")); }
		private function get precisionBar():MovieClip { return MovieClip(visual.getChildByName("precisionBar")); }
		private function get controlBar():MovieClip { return MovieClip(visual.getChildByName("controlBar")); }
		
		public function get metaPerso() : MetaPerso {
			return _metaPerso;
		}
		
		public function get strView() : StatsBarView {
			return _strView;
		}
		
		public function get precisionView() : StatsBarView {
			return _precisionView;
		}
		
		public function get controlView() : StatsBarView {
			return _controlView;
		}
	}
}
