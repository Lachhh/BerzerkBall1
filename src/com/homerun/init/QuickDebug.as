package com.homerun.init {
	import com.homerun.Main;
	import flash.display.Sprite;

	/**
	 * @author LachhhSSD
	 */
	public class QuickDebug extends Sprite {
		public function QuickDebug() {
			var m:Main = new Main();
			addChild(m);
			m.Init();
		}
	}
}
