package com.homerun.effects {
	import com.homerun.factories.HB_AnimationFactory;
	import com.lachhhEngine.games.effects.GameEffectContainerId;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.effects.GameEffectFactory;
	import com.lachhhEngine.games.effects.GameEffectManager;
	import com.lachhhEngine.games.meta.MetaManager;
	import com.lachhhEngine.games.meta.metaObject.MetaActor;
	import com.lachhhEngine.games.meta.metaObject.MetaLayer;
	import com.lachhhEngine.games.physique.Actor;

	/**
	 * @author Lachhh
	 */
	public class HB_GameEffectManager extends GameEffectManager {
		public function HB_GameEffectManager(context : Game, gameEffectFactory : GameEffectFactory) {
			super(context, gameEffectFactory);
		}
		
		public function CreateFxGroundBlood(idAnim:int, px:int, py:int, metaLayer:MetaLayer):Actor {
			var metaGameFx:MetaActor = MetaManager.instance.CreateMetaGameEffect(
					HB_GameEffectFactory.ID_FX_DESTROY_OUT_CAM, idAnim, GameEffectContainerId.BELOW, px, py, -1, false, metaLayer);
			
			var gameEffect:Actor =	Actor(Create(metaGameFx));
			InitGameFx(gameEffect);
			var idOverFx:int = -1;
			switch(idAnim) {
				case HB_AnimationFactory.ID_FX_GROUNDBLOOD_DRAW1 : idOverFx = HB_AnimationFactory.ID_FX_GROUNDBLOOD1 ; break;
				case HB_AnimationFactory.ID_FX_GROUNDBLOOD_DRAW2 : idOverFx = HB_AnimationFactory.ID_FX_GROUNDBLOOD2 ; break;
				case HB_AnimationFactory.ID_FX_GROUNDBLOOD_DRAW3 : idOverFx = HB_AnimationFactory.ID_FX_GROUNDBLOOD3 ; break;
				case HB_AnimationFactory.ID_FX_GROUNDGREENBLOOD_DRAW: idOverFx = HB_AnimationFactory.ID_FX_GROUNDBLOODGREEN ; break;
			}
			
			if(idOverFx != -1) {
				CreateStaticFx(idOverFx, GameEffectContainerId.ABOVE, px, py, metaLayer); 	
			}
			return gameEffect;
		}
		
		public function CreateFxBloodPuff(idAnim:int, idContainer:int,  px:int, py:int, vx:int, vy:int, metaLayer:MetaLayer, repeat:int = 1, loop:Boolean = false):Actor {
			var metaGameFx:MetaActor = MetaManager.instance.CreateMetaGameEffect(
					HB_GameEffectFactory.ID_FX_BLOOD_PUFF, idAnim, idContainer, px, py, repeat, loop, metaLayer);
			
			var gameEffect:Actor =	Actor(Create(metaGameFx));
			gameEffect.vx = vx;
			gameEffect.vy = vy;
			InitGameFx(gameEffect);
			return gameEffect;
		}
	}
}
