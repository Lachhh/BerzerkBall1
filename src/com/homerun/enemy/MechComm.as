package com.homerun.enemy {
	import com.homerun.constants.HBConstants;
	import com.lachhhEngine.games.screens.ScreenFactory;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.screens.FlashScreen;
	import com.lachhhEngine.games.effects.GameEffect;
	import com.lachhhEngine.io.Callback;
	import com.homerun.enemy.HB_Enemy;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.hero.Geek;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.effects.GameEffectContainerId;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.physique.Actor;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.games.sfx.Sound2D;

	/**
	 * @author Lachhh
	 */
	public class MechComm extends HB_Enemy {
		private var _fxCrossFire:Actor ;
		private var _fxCrossFireLocked:GameEffect ;
		private var _lockedOnTarget:Boolean ;
		private var _mechCommSound2D:Sound2D ;
		private var _waitLock:Number ;
		private var _hasShot:Boolean ;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_fxCrossFire = context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_MECHCOMMCROSSFIRE, GameEffectContainerId.ABOVE, px, py, layer.metaLayer, -1, true);
			
			_lockedOnTarget = false;
			_mechCommSound2D = Jukebox.instance.PlaySound2D(HB_SfxFactory.ID_SFX_LEGS2, this, true);
			_waitLock = 15;
			_hasShot = false;
		}

		override public function Destroy() : void {
			if(_fxCrossFire != null && _fxCrossFire.metaInfo != null) {
				context.gameEffectManager.DestroyGameEffect(_fxCrossFire);
				_fxCrossFire = null;	
			}
			
			if(_fxCrossFireLocked != null && _fxCrossFireLocked.metaInfo != null) {
				context.gameEffectManager.DestroyGameEffect(_fxCrossFireLocked);
				_fxCrossFireLocked = null;	
			}
			
			if(_mechCommSound2D != null) {
				Jukebox.instance.DestroySound(_mechCommSound2D);
				_mechCommSound2D = null;	
			}
			super.Destroy();
		}

		override public function Update(context : Game) : void {
			super.Update(context);
			if(_fxCrossFire == null || theGeek == null) return ;
			if(!context.camera.IsInFieldOfView(this,100)) {
				context.enemyManager.DestroyActor(this);
				return ;
			}	
			if(!_lockedOnTarget) {
				var dx:int = theGeek.px - _fxCrossFire.px;
				var dy:int = theGeek.py - _fxCrossFire.py;
				if(dx*dx+dy*dy < 5000) {
					_fxCrossFire.animationContainer.visible = false;
					_lockedOnTarget = true;
					Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_LOCKED_TARGET);
					_fxCrossFireLocked = GameEffect(context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_MECHCOMMCROSSFIRELOCKED, GameEffectContainerId.ABOVE, px, py, layer.metaLayer));
					//_fxCrossFireLocked.animation.AddEndCallback(new Callback(DoStuffOnGeek, this, [theGeek]));
				} else {
					if(Math.abs(dx) > 100) {
						_fxCrossFire.px += dx*0.05;
					} else {
						_fxCrossFire.px += dx*0.2;
					}
					
					if(Math.abs(dy) > 100) { 
						_fxCrossFire.py += dy*0.05;
					} else {
						_fxCrossFire.py += dy*0.2;
					}
				}
			} else {
				_fxCrossFireLocked.px = theGeek.px;
				_fxCrossFireLocked.py = theGeek.py;
				_waitLock-= context.speedManager.GetSpeed();
				if(_waitLock <= 0 && !_hasShot) {
					DoStuffOnGeek(theGeek);
					_hasShot = true;	
				}	
			}
			px += 5;
		}

		override protected function DoStuffOnGeek(g : Geek) : void {
			super.DoStuffOnGeek(g);
			var vyBonus:Number = HBConstants.ENEMY_MECHCOMM_VY_BONUS*controlVYBonus;
			
			g.vx += HBConstants.ENEMY_MECHCOMM_VX_BONUS*controlVXBonus;
			g.vy += (g.vy > 0 ? vyBonus : -vyBonus);
			if(g.vy > 0) g.vy*=-1;
			
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_EXPLOSION);
			var flash:FlashScreen = FlashScreen(ScreenManager.instance.ShowScreen(ScreenFactory.FLASH_SCREEN));
			flash.InitFlash(0xFFFFFF, 10);
		}

		override protected function get canBeHit() : Boolean {
			return false;
		}

		override protected function get animIdleId() : int {return HB_AnimationFactory.ID_EN_MECHCOMM_WALK;}
		override protected function get animDieId() : int {	return HB_AnimationFactory.ID_EN_MECHCOMM_WALK;}
	}
}
