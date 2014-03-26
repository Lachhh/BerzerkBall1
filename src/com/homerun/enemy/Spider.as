package com.homerun.enemy {
	import com.homerun.constants.HBConstants;
	import com.homerun.effects.HB_GameEffectManager;
	import com.homerun.enemy.HB_Enemy;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.hero.Geek;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.sfx.Jukebox;

	/**
	 * @author Lachhh
	 */
	public class Spider extends HB_Enemy {
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
		}

		override protected function DoStuffOnGeek(g : Geek) : void {
			super.DoStuffOnGeek(g);
			var vyBonus:Number = HBConstants.ENEMY_SPIDER_VY_BONUS*controlVYBonus;
			
			g.vx += HBConstants.ENEMY_SPIDER_VX_BONUS*controlVXBonus;
			g.vy += (g.vy > 0 ? vyBonus : -vyBonus);
			if(g.vy > 0)g.vy*=-1;
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_DEATH_SPIDER);
			
			
			CreateGroundBlood(px, py);
		}
		
		private function CreateGroundBlood(x:int, y:int):void {
			var animId:int = HB_AnimationFactory.ID_FX_GROUNDGREENBLOOD_DRAW ;
			HB_GameEffectManager(context.gameEffectManager).CreateFxGroundBlood(animId, x, y, layer.metaLayer);
		}
		
		override protected function get animIdleId() : int {return HB_AnimationFactory.ID_EN_SPIDER_IDLE;}
		override protected function get animDieId() : int {	return HB_AnimationFactory.ID_EN_SPIDER_DIE;}
	}
}
