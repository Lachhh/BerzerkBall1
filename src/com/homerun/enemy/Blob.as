package com.homerun.enemy {
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.hero.Geek;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.equip.MetaEquipmentEnum;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.sfx.Jukebox;

	/**
	 * @author Lachhh
	 */
	public class Blob extends HB_Enemy {
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);

		}

		override protected function DoStuffOnGeek(g : Geek) : void {
			super.DoStuffOnGeek(g);
			if(!(HB_GameProgress.gameProgress.metaProgress.lastSelected.IsEquipped(MetaEquipmentEnum.EQUIP_BANDANA_8))) {
				g.vx *= .5;
				g.vy *= .5;
			}
			
			FadeTintFromTo(context, 255, 255, 255, 1, 0, 0, 0, 1, 0.1);
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_DEATH_SPIDER);
		}

		override protected function get backIdleAfterDie() : Boolean {return true;}
		override protected function get animIdleId() : int {return HB_AnimationFactory.ID_EN_BLOB_MARCHE;}
		override protected function get animDieId() : int {	return HB_AnimationFactory.ID_EN_BLOB_MARCHE;}
	}
}
