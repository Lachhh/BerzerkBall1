package com.homerun.screens.view.ingame {
	import flash.display.MovieClip;

	/**
	 * @author Lachhh
	 */
	public class PrecisionPanel extends WidgetPanel {
		public function PrecisionPanel(visual:MovieClip) {
			super(visual);
			valueIndex = 0.5;
		}
		
		override public function Update() : void {
			super.Update();
			meter.rotation = (value * 90);	
		}
		
		override public function get isMaxed():Boolean {
			return value >= 0.45 && value <= 0.55;	
		}
		
		private function get meter():MovieClip {
			return MovieClip(visual.getChildByName("precisionMeter"));	
		}
	}
}
