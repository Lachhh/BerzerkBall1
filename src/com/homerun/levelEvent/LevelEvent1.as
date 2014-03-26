package com.homerun.levelEvent {
	import com.homerun.factories.HB_AnimationFactory;
	import com.lachhhEngine.games.effects.GameEffectContainerId;

	/**
	 * @author Lachhh
	 */
	public class LevelEvent1 extends HB_LevelEvent {
		override protected function get edgeAnimId():int { return HB_AnimationFactory.ID_START_EDGE ;}
		override public function get runningSmokeId():int { return HB_AnimationFactory.ID_FX_RUNNINGSMOKE;}
		
		override protected function PushDecor(aDecors:Array):void {
			aDecors.push(context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_DECOR_1, GameEffectContainerId.BELOW, -500, 0, context.levelManager.GetLayer(2).metaLayer, -1, true));
			aDecors.push(context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_DECOR_2, GameEffectContainerId.BELOW, -500, 0, context.levelManager.GetLayer(2).metaLayer, -1, true));
			aDecors.push(context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_DECOR_3, GameEffectContainerId.BELOW, -500, 0, context.levelManager.GetLayer(2).metaLayer, -1, true));
			aDecors.push(context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_DECOR_4, GameEffectContainerId.BELOW, -500, 0, context.levelManager.GetLayer(2).metaLayer, -1, true));
		}		
	}
}
