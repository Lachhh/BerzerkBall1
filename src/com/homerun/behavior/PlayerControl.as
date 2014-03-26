package com.homerun.behavior {
	import com.homerun.enemy.HB_EnemyManager;
	import com.homerun.hero.Hero;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.behaviors.Behavior;
	import com.lachhhEngine.games.behaviors.IControllable;
	import com.lachhhEngine.games.physique.Actor;

	/**
	 * @author Lachhh
	 */
	public class PlayerControl extends Behavior {
		public function PlayerControl() {
		}

		override public function Control(context : Game, obj : IControllable) : void {
			super.Control(context, obj);
		
		}
	}
}
