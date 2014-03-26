package com.homerun.enemy {
	import com.homerun.HB_Game;
	import com.homerun.constants.HBConstants;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.hero.Geek;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.sfx.Jukebox;

	/**
	 * @author Lachhh
	 */
	public class Coin extends HB_Enemy{
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			SetRayon(30);
			circleCol.rayon = 30;
		}

		override protected function DoStuffOnGeek(g : Geek) : void {
			super.DoStuffOnGeek(g);
			 
			FadeTintFromTo(context, 255, 255, 255, 1, 0, 0, 0, 0, 0.1);
			HB_Game(context).moneyBonus += HBConstants.CASH_BONUS; 
			HB_Game(context).ingame.ShowBonusTxt("+$"+ HBConstants.CASH_BONUS + "!", g.animationContainer.x, g.animationContainer.y );
			
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_BUY);
		}

		override protected function get animIdleId() : int {return HB_AnimationFactory.ID_ITEM_COIN;}
		override protected function get animDieId() : int {	return HB_AnimationFactory.ID_ITEM_COIN;}
	}
}
