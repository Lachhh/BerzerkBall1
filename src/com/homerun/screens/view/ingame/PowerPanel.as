package com.homerun.screens.view.ingame {

	import flash.display.MovieClip;
	/**
	 * @author Lachhh
	 */
	public class PowerPanel extends WidgetPanel {
		public function PowerPanel(visual:MovieClip) {
			super(visual);	
		}

		override public function Update() : void {
			super.Update();
			meter.y = (value)*-160;
		}

		private function get meter():MovieClip {
			return MovieClip(visual.getChildByName("powerMeter"));	
		}

		override public function set nbValue(speed : Number) : void {
			super.nbValue = speed;
			/*for (var i:int = 0 ; i < valueArray.length ; i++) {
				valueArray[i] *= valueArray[i];
			}*/
		}
	}
}
