package com.homerun.enemy {
	import com.homerun.constants.HBConstants;
	import com.homerun.enemy.HB_Enemy;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.hero.Geek;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.FlashScreen;
	import com.lachhhEngine.games.screens.ScreenFactory;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;

	/**
	 * @author Lachhh
	 */
	public class Berzerker extends HB_Enemy {
		private var _attacked:Boolean ;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);			
			_attacked = false;
		}

		override protected function DoStuffOnGeek(g : Geek) : void {
			super.DoStuffOnGeek(g);
			var vyBonus:Number = HBConstants.ENEMY_BERZERKER_VY_BONUS*controlVYBonus;
			g.vx += HBConstants.ENEMY_BERZERKER_VX_BONUS*controlVXBonus;
			g.vy += (g.vy > 0 ? vyBonus : -vyBonus);
			if(g.vy > 0) g.vy*=-1;
			
			_attacked = true; 
			Jukebox.instance.PlaySound(HB_SfxFactory.randomMegaPunch);
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_WEAPON_AIRSTRIKE);
			
			var flash:FlashScreen = FlashScreen(ScreenManager.instance.ShowScreen(ScreenFactory.FLASH_SCREEN));
			flash.InitFlash(0xFF0000, 5);
			
			g.HitByBerzerker(this);
		}

		override protected function afterDie() : void {
			super.afterDie();
			_attacked = false;
		}

		override public function Update(context : Game) : void {
			super.Update(context);
			if(_attacked) return ;
			px += -5;
			
			
		}

		override protected function get backIdleAfterDie() : Boolean {return true;}
		override protected function get animIdleId() : int {return HB_AnimationFactory.ID_EN_GRBERZ_MARCHE;	}
		override protected function get animDieId() : int {	return HB_AnimationFactory.ID_EN_GRBERZ_PUNCH;}
	}
}
