package com.homerun.effects {
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.effects.GameEffect;

	/**
	 * @author Lachhh
	 */
	public class GameEffectBloodPuff extends GameEffect {
		override public function Update(context : Game) : void {
			super.Update(context);
			px += vx*context.speedManager.GetSpeed();
			py += vy*context.speedManager.GetSpeed();
		}
	}
}
