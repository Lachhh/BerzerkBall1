package com.homerun.screens.view.perso {
	import flash.text.TextField;
	import com.homerun.meta.ui.MetaUpgrade;
	import com.homerun.screens.view.ObjectView;

	import flash.display.MovieClip;

	/**
	 * @author Lachhh
	 */
	public class StatsBarView extends ObjectView {
		static private const BONUS_COLOR:uint = 0x00CBFF;
		static private const MALUS_COLOR:uint = 0xFF0000;
		private var _metaUpgrade:MetaUpgrade ;
		private var _bonus:int ;
		private var _showNumbers:Boolean ;
		
		public function StatsBarView(visual : MovieClip) {
			super(visual);
			_bonus = 0;
			_showNumbers = true;
		}
		
		public function SetMetaUpgrade(metaUpgrade:MetaUpgrade):void {
			_metaUpgrade = metaUpgrade;	
			Refresh();
		}
		
		public function SetBonus(bonus:int):void {
			_bonus = bonus;
		}

		override public function Refresh() : void {
			super.Refresh();
			bar8.gotoAndStop(_metaUpgrade.upgradeValue);
			bar12.gotoAndStop(_metaUpgrade.upgradeValue);
			bar16.gotoAndStop(_metaUpgrade.upgradeValue);
			
			bar8.visible = bar12.visible = bar16.visible = false;
			var nbBar:int = _metaUpgrade.GetXpNeeded(2); 
			if(nbBar <= 8) {
				bar8.visible = true;
			} else if(nbBar <= 12) {
				bar12.visible = true;
			} else {
				bar16.visible = true;
			} 
			bar8OverBonusBarMc.gotoAndStop(metaUpgrade.upgradeValue-nbBar);
			bar12OverBonusBarMc.gotoAndStop(metaUpgrade.upgradeValue-nbBar);
			bar16OverBonusBarMc.gotoAndStop(metaUpgrade.upgradeValue-nbBar);
			if(nbBar >= metaUpgrade.upgradeValue) {
				bar8OverBonusBarMc.visible = false;
				bar12OverBonusBarMc.visible = false;
				bar16OverBonusBarMc.visible = false;
			} else {
				bar8OverBonusBarMc.visible = true;
				bar12OverBonusBarMc.visible = true;
				bar16OverBonusBarMc.visible = true;
			}
			
			if(nbTxt != null) {
				nbTxt.text = (metaUpgrade.upgradeValue + _bonus)+"";
				if(_bonus > 0) {
					nbTxt.textColor = BONUS_COLOR;
				} else if(_bonus < 0){
					nbTxt.textColor = MALUS_COLOR;	
				} else {
					nbTxt.textColor = 0xFFFFFF;
				}
				nbTxt.visible = _showNumbers;
			}
		}
		
		private function get bar8():MovieClip { return MovieClip(visual.getChildByName("bar8")) ;}
		private function get bar12():MovieClip { return MovieClip(visual.getChildByName("bar12")) ;}
		private function get bar16():MovieClip { return MovieClip(visual.getChildByName("bar16")) ;}
		
		private function get bar8OverBonusBarMc():MovieClip {return MovieClip(bar8.getChildByName("overBonusBarMc"));}
		private function get bar12OverBonusBarMc():MovieClip {return MovieClip(bar12.getChildByName("overBonusBarMc"));}
		private function get bar16OverBonusBarMc():MovieClip {return MovieClip(bar16.getChildByName("overBonusBarMc"));}
		public function get nbTxt():TextField { return TextField(visual.getChildByName("nbTxt")) ;}
		
		
		public function get metaUpgrade() : MetaUpgrade {
			return _metaUpgrade;
		}
		
		public function get showNumbers() : Boolean {
			return _showNumbers;
		}
		
		public function set showNumbers(showNumbers : Boolean) : void {
			_showNumbers = showNumbers;
		}
	}
}
