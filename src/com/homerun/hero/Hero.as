package com.homerun.hero {
	import com.homerun.HB_MainLevelEditor;
	import com.homerun.init.HB_VersionInfo;
	import com.lachhhEngine.games.physique.EquationVecto;
	import com.homerun.HB_Game;
	import com.homerun.actor.HB_Actor;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.levelEvent.HB_LevelEvent;
	import com.homerun.meta.MetaHBHero;
	import com.homerun.meta.ui.equip.MetaEquipWeapon;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.AnimationCallback;
	import com.lachhhEngine.games.effects.GameEffectContainerId;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.physique.Actor;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.io.Callback;

	/**
	 * @author Lachhh
	 */
	public class Hero extends HB_Actor  {
		static public const WEAPON_GROUP_ID:int = 0 ;
		static public const BELT_GROUP_ID:int = 1 ;
		static public const BANDANA_GROUP_ID:int = 2 ;
		static public const BRACERS_GROUP_ID:int = 3 ;
		static public const TITI_NEZ_GROUP_ID:int = 4 ;		
		private var _onHitCallback:Callback ;
		private var _onEndCallback:Callback ;
		private var _nbHit:int ;
		private var _runningToGeek:Boolean ;
		private var _runningFartherThanGeek:Boolean ;
		private var _isHitting:Boolean ;
		private var _rotRunningOffset:Number ;
		override public function Init(metaObject : MetaObject, context:Game) : void {
			super.Init(metaObject, context);
			animationContainer.AddAnimationAssetGroup("weapons", WEAPON_GROUP_ID);
			animationContainer.AddAnimationAssetGroup("belt", BELT_GROUP_ID);
			animationContainer.AddAnimationAssetGroup("bandana", BANDANA_GROUP_ID);
			animationContainer.AddAnimationAssetGroup("bracers", BRACERS_GROUP_ID);
			animationContainer.AddAnimationAssetGroup("TITI_NEZ", TITI_NEZ_GROUP_ID);
			
			Idle();
			_nbHit = metaHero.metaPerso.nbHits;
			_runningToGeek = false;
			_runningFartherThanGeek = false;
			_rotRunningOffset = 0 ; 
		}		
		
		override public function Update(context:Game):void {
			super.Update(context);
			
			if(_runningToGeek) { 
				if(_runningFartherThanGeek) {
					px += HB_Game(context).geek.vx + 10;
					py = -51;	
				} else {
					_rotRunningOffset += 10 *context.speedManager.GetSpeed();
				 	var x:int = EquationVecto.MyCos(_rotRunningOffset)*25 -100;
				 	if(_rotRunningOffset > 360) _rotRunningOffset -= 360;
					 
					if(px > HB_Game(context).geek.px + x) { 
						px += ((HB_Game(context).geek.px + x)-px)*0.1;
					} else {
						px = (HB_Game(context).geek.px + x);
					}	
					py = -51;
				} 
			}
		}

		override protected function SwitchAnim(animId : int) : void {
			super.SwitchAnim(animId);
			animationContainer.SetAssetsVisible(metaHero.metaPerso.bandanaFrame <= 7, TITI_NEZ_GROUP_ID);
			animationContainer.SetFrameOfAssets(metaHero.metaPerso.weaponFrame, WEAPON_GROUP_ID);
			
			if(HB_VersionInfo.denizeSmallBoobs && metaHero.metaPerso.id == HB_HeroManager.PERSO_DENIZE) {
				animationContainer.SetFrameOfAssets(metaHero.metaPerso.beltFrame+9, BELT_GROUP_ID);
			} else {
				animationContainer.SetFrameOfAssets(metaHero.metaPerso.beltFrame, BELT_GROUP_ID);
			}
			
			animationContainer.SetFrameOfAssets(metaHero.metaPerso.bandanaFrame, BANDANA_GROUP_ID);
			animationContainer.SetFrameOfAssets(metaHero.metaPerso.bracersFrame, BRACERS_GROUP_ID);
			
		}

		public function Idle():void {
			SwitchAnim(metaHero.animIdleId);
		}
		
		public function StartRunning():void {
			SwitchAnim(metaHero.animRunningGatherIdleId);
			_runningToGeek = true;
			_runningFartherThanGeek = false;
		}
		
		public function StopRunning():void {
			_runningToGeek = false;
			SwitchAnim(metaHero.animIdleId);	
		}
		
		public function RunForwardCam():void {
			SwitchAnim(metaHero.animRunningGatherIdleId);
			anim.isPlayingAnim = true;
			_runningFartherThanGeek = true;
		}
		
		public function GatherIn():void {
			SwitchAnim(metaHero.animGatherIdleId);
			anim.AddEndCallback(new Callback(onGatherInEnd, this, null));
		}
		
		private function onGatherInEnd():void {
			SwitchAnim(metaHero.animGatherIdleId);		
		}
		
		public function HitGeek(onHitCallback:Callback, onEndCallback:Callback):void {
			
			if(_runningToGeek) {
				SwitchAnim(metaHero.animRunningGatherHitId);
				_nbHit--;
			} else {
				SwitchAnim(metaHero.animHitId);
			}
			anim.AddEndCallback(new Callback(onEndHit, this, null));
			anim.AddCallbackAt(new AnimationCallback(4, onHit, this, null));
			_onHitCallback = onHitCallback;
			_onEndCallback = onEndCallback;
			context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_IMPACT, GameEffectContainerId.ABOVE, px+100, py, layer.metaLayer);
			
			_isHitting = true;
		}
		
		private function onHit():void {
			if(_onHitCallback != null) {
				_onHitCallback.DoCallback();
				_onHitCallback = null;	
			}
		}
		
		private function onEndHit():void {
			_isHitting = false;
			anim.SetCurrentFrame(anim.totalFrames);
			anim.looping = false;
			if(_onEndCallback != null) {
				_onEndCallback.DoCallback();
				_onEndCallback = null;	
			}
		}
		
		public function get metaHero():MetaHBHero {	return MetaHBHero(metaInfo);}
		
		public function get nbHit() : int {
			return _nbHit;
		}
		
		public function get runningToGeek() : Boolean {
			return _runningToGeek;
		}
		
		public function get runningFartherThanGeek() : Boolean {
			return _runningFartherThanGeek;
		}
	}
}
