package com.homerun.enemy {
	import com.homerun.constants.HBConstants;
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
	public class Mine extends HB_Enemy {
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
		}

		override protected function DoStuffOnGeek(g : Geek) : void {
			super.DoStuffOnGeek(g);
			var vyBonus:Number = HBConstants.ENEMY_MINE_VY_BONUS*controlVYBonus;
			
			g.vx += HBConstants.ENEMY_MINE_VX_BONUS*controlVXBonus;
			g.vy += (g.vy > 0 ? vyBonus : -vyBonus);
			if(g.vy > 0)g.vy*=-1;
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_CANON);
			
			context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_CANONFIRE, GameEffectContainerId.ABOVE, px, py+50, layer.metaLayer);
			
			
		}

		override protected function get animIdleId() : int {return HB_AnimationFactory.ID_EN_MINE;	}
		override protected function get animDieId() : int {	return HB_AnimationFactory.ID_EN_MINE_DIE;}
	}
}
