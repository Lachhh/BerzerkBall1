package com.homerun.behavior {
	import com.lachhhEngine.games.behaviors.Behavior;
	import com.lachhhEngine.games.behaviors.BehaviorFactory;

	/**
	 * @author Lachhh
	 */
	public class HB_BehaviorFactory extends BehaviorFactory {
		static public const BEHAVIOR_NULL:Behavior = new Behavior() ;
		static public var ID_BEHAVIOR_NULL:int ;
		static public var ID_BEHAVIOR_PLAYER:int ;
		static public var ID_BEHAVIOR_ENEMY_1:int ;
		public function HB_BehaviorFactory() {
			super();
			ID_BEHAVIOR_PLAYER = PushClassLink(PlayerControl);
			ID_BEHAVIOR_ENEMY_1 = PushClassLink(BehaviorEnemy1);
		}
	}
}
