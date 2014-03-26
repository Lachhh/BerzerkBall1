package com.homerun.items {
	import com.homerun.actor.HB_Actor;
	import com.homerun.hero.Hero;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.ammo.Ammo;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;

	/**
	 * @author Lachhh
	 */
	public class HB_Item extends HB_Actor {
		
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			SetRayon(2);
		}
		
		override protected function Hit(ammo : Ammo) : void {
			super.Hit(ammo);
			if(ammo.owner == context.GetPlayer1()) {
				var hero:Hero = Hero(context.GetPlayer1());
				Collect(hero);
				context.itemManager.DestroyActor(this);
			}
		}
		
		protected function Collect(hero:Hero):void {
			//Do Stuff
		}
	}
}
