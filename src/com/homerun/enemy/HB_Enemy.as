package com.homerun.enemy {
	import com.homerun.HB_Game;
	import com.homerun.actor.HB_Actor;
	import com.homerun.constants.HBConstants;
	import com.homerun.hero.Geek;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.equip.MetaEquipmentEnum;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.ammo.Ammo;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.io.Callback;

	/**
	 * @author Lachhh
	 */
	public class HB_Enemy extends HB_Actor {
		private var _canBeHitWait:Number ;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			SwitchAnim(animIdleId);
			SetRayon(animationContainer.height/2);
			circleCol.rayon = animationContainer.height/2;
			circleColOffset.y = -animationContainer.height/2;
			_canBeHitWait = 0 ; 
		}

		override public function Update(context : Game) : void {
			super.Update(context);
			if(IsDead()) return ;
			if(!context.camera.IsInFieldOfView(this,100)) {
				context.enemyManager.DestroyActor(this);
			}			
			
			if(_canBeHitWait >0) {
				_canBeHitWait -= context.speedManager.GetSpeed();	
			}
		}

		override protected function Hit(ammo : Ammo) : void {
			super.Hit(ammo);
			var geek:Geek = ammo.owner as Geek;
			if(geek == null || !canBeHit) return ;
			DoStuffOnGeek(geek);
			SwitchAnim(animDieId);
			anim.AddEndCallback(new Callback(afterDie, this, null));
			_canBeHitWait = 30;
		}
		
		protected function afterDie():void {
			
			if(backIdleAfterDie) {
				SwitchAnim(animIdleId)	;
			} else {
				context.enemyManager.DestroyActor(this);				
			}
		}
		
		protected function DoStuffOnGeek(g:Geek):void {
			//context.camera.SetDynamicFollow(this);
			
		}
		
		protected function get canBeHit():Boolean {
			return _canBeHitWait <= 0 ;	
		}
		protected function get backIdleAfterDie():Boolean { return false; }		
		protected function get animIdleId():int { return -1;}
		protected function get animDieId():int { return -1;}
		
		protected function get theGeek():Geek {
			return (context == null ? null : HB_Game(context).geek);
		}			
		
		protected function get controlVXBonus():Number {
			return (1+(HBConstants.HERO_CONTROL_VX_ON_HIT_BONUS/100)*HB_GameProgress.gameProgress.metaProgress.lastSelected.totalControl);	
		}
		
		protected function get controlVYBonus():Number {
			return (1+(HBConstants.HERO_CONTROL_VY_ON_HIT_BONUS/100)*HB_GameProgress.gameProgress.metaProgress.lastSelected.totalControl);	
		}
		
	}
}
