package com.homerun.effects {
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.effects.GameEffect;

	/**
	 * @author Lachhh
	 */
	public class GameEffectDestroyOnOutCam extends GameEffect {
		public function GameEffectDestroyOnOutCam() {
		}

		override public function Update(context : Game) : void {
			super.Update(context);
			if(metaInfo != null && !context.camera.IsInFieldOfView(this)) {
				//context.gameEffectManager.DestroyGameEffect(this);	
			}
		}
	}
}
