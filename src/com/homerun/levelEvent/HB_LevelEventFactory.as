package com.homerun.levelEvent {
	import com.lachhhEngine.games.level.levelEvents.LevelEventFactory;

	/**
	 * @author Lachhh
	 */
	public class HB_LevelEventFactory extends LevelEventFactory {
		
		public function HB_LevelEventFactory() {
			super();			
			PushClassLink(LevelEvent1);
			PushClassLink(LevelEvent2);
			PushClassLink(LevelEvent3);
			PushClassLink(LevelEvent4);				
		}

	}
}
