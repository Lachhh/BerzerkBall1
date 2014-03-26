package com.homerun.effects {
	import com.lachhhEngine.games.effects.GameEffectFactory;

	/**
	 * @author Lachhh
	 */
	public class HB_GameEffectFactory extends GameEffectFactory {
		static public var ID_FX_DESTROY_OUT_CAM:int ;
		static public var ID_FX_BLOOD_PUFF:int ; 
		override protected function AddGameClass():void {
			super.AddGameClass();
			ID_FX_DESTROY_OUT_CAM = PushClassLink(GameEffectDestroyOnOutCam);
			ID_FX_BLOOD_PUFF = PushClassLink(GameEffectBloodPuff );
		}
	}
}
