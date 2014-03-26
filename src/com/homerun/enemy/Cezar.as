package com.homerun.enemy {
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
	public class Cezar extends HB_Enemy {
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);

		}

		override protected function DoStuffOnGeek(g : Geek) : void {
			super.DoStuffOnGeek(g);
			g.vx *= 0;
			g.vy *= 0;
		}

		override protected function get animIdleId() : int {return HB_AnimationFactory.ID_EN_CEZAR;	}
		override protected function get animDieId() : int {	return HB_AnimationFactory.ID_EN_CEZAR;}
	}
}
