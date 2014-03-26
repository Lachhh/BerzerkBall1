package com.homerun.enemy {
	import com.homerun.constants.HBConstants;
	import com.homerun.effects.HB_GameEffectManager;
	import com.homerun.enemy.HB_Enemy;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.hero.Geek;
	import com.homerun.io.AchievementManager;
	import com.homerun.io.stats.StatsStatic;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.effects.GameEffectContainerId;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.sfx.Jukebox;

	/**
	 * @author Lachhh
	 */
	public class Bee extends HB_Enemy {
		private const WAIT_BETWEEN_BLOOD:int = 1;
		private var _waitBetweenBloodSplash:Number ;
		private var _nbBloodSplash:int = 5;
		
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			vx =0 ;
			vy =0 ;  
		}

		override public function Update(context : Game) : void {
			super.Update(context);
			if(hasBeenHit) {
				px += vx*context.speedManager.GetSpeed();
				py += vy*context.speedManager.GetSpeed();
				UpdateBloodPuff();
				vy += grav*context.speedManager.GetSpeed();
				
				if(!context.camera.IsInFieldOfView(this,100)) {
					context.enemyManager.DestroyActor(this);
				}
			}
		}

		override protected function DoStuffOnGeek(g : Geek) : void {
			super.DoStuffOnGeek(g);
			if(hasBeenHit) return ;
			g.vx += HBConstants.ENEMY_BEE_VX_BONUS*controlVXBonus;
			g.vy -= HBConstants.ENEMY_BEE_VY_BONUS*controlVYBonus;
			
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_BEE);
			vx = g.vx+10+Math.random()*20;
			vy = g.vy+10+Math.random()*-20; 
			ResetBloodPuffTimer();
			StatsStatic.instance.AddValue(StatsStatic.ID_HIT_BEE, 1);
			if(StatsStatic.instance.GetValue(StatsStatic.ID_HIT_BEE) >= 100) AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_38);
		}
		
		private function UpdateBloodPuff():void {
			if(_nbBloodSplash > 0) {
				_waitBetweenBloodSplash -= context.speedManager.GetSpeed();
				if(_waitBetweenBloodSplash <= 0) {
					_waitBetweenBloodSplash = WAIT_BETWEEN_BLOOD;
					_nbBloodSplash--;
					HB_GameEffectManager(context.gameEffectManager).CreateFxBloodPuff(HB_AnimationFactory.ID_FX_BLOODPUFF2, GameEffectContainerId.ABOVE, px -vx*.5, py-vy*.5, vx*0.5, vy*0.5, layer.metaLayer);			
				}
			}
		}
		
		private function ResetBloodPuffTimer(nPuff:int = 5):void {
			_waitBetweenBloodSplash = 0 ;
			_nbBloodSplash = nPuff ;  
		}
		
		public function get hasBeenHit():Boolean {
			return (vx != 0 || vy != 0)  ;
		}
		
		override protected function afterDie() : void {}

		override protected function get animIdleId() : int {return HB_AnimationFactory.ID_EN_BEE_IDLE;}
		override protected function get animDieId() : int {	return HB_AnimationFactory.ID_EN_BEE_DIE;}
	}
}
