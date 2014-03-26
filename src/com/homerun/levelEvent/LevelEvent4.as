package com.homerun.levelEvent {
	import com.homerun.factories.HB_AnimationFactory;
	import com.lachhhEngine.games.effects.GameEffectContainerId;

	/**
	 * @author Lachhh
	 */
	public class LevelEvent4 extends HB_LevelEvent {
		override protected function CreateAllNuageId(a : Array) : void {
			a.push(HB_AnimationFactory.ID_DECOR_NUAGE3_1);
			a.push(HB_AnimationFactory.ID_DECOR_NUAGE3_2);
			a.push(HB_AnimationFactory.ID_DECOR_NUAGE3_3);
		}
		
		override protected function get nuageForeGrounId():int {
			return HB_AnimationFactory.ID_FX_DECOR_NUAGE_FOREGROUND2 ;	
		}
		
		override protected function get edgeAnimId():int { return HB_AnimationFactory.ID_START_EDGE_LVL4 ;}
		override public function get runningSmokeId():int { return HB_AnimationFactory.ID_FX_RUNNINGSMOKE;}
		
		override protected function PushDecor(aDecors:Array):void {
			aDecors.push(context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_DECOR_LVL4_1, GameEffectContainerId.BELOW, -500, 0, context.levelManager.GetLayer(2).metaLayer, -1, true));
			aDecors.push(context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_DECOR_LVL4_2, GameEffectContainerId.BELOW, -500, 0, context.levelManager.GetLayer(2).metaLayer, -1, true));
			aDecors.push(context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_DECOR_LVL4_3, GameEffectContainerId.BELOW, -500, 0, context.levelManager.GetLayer(2).metaLayer, -1, true));
			aDecors.push(context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_DECOR_LVL4_4, GameEffectContainerId.BELOW, -500, 0, context.levelManager.GetLayer(2).metaLayer, -1, true));
		}
	}
}
