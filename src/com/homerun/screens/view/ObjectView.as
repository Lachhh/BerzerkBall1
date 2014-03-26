package com.homerun.screens.view {

	import flash.display.MovieClip;
	/**
	 * @author Lachhh
	 */
	public class ObjectView {
		private var _visual:MovieClip ;
	
		public function ObjectView(visual:MovieClip) {
			_visual = visual;
		}
		
		public function Destroy():void {
					
		}
		
		public function get visual() : MovieClip {
			return _visual;
		}
		
		public function Refresh():void {
			
		}
	}
}
