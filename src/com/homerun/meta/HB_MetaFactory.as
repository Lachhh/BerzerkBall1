package com.homerun.meta {
	import com.lachhhEngine.games.meta.MetaFactory;

	/**
	 * @author Lachhh
	 */
	public class HB_MetaFactory extends MetaFactory {
		static public var ID_META_MK_ACTOR:int ;
		static public var ID_META_MK_HERO:int ;
		static public var ID_META_MK_GEEK:int ;
		static public var ID_META_MK_ENEMY:int ;
		
		static public var ID_META_MK_WEAPON:int ;
		static public var ID_META_MK_WEAPON_SPREAD:int ;
		static public var ID_META_MK_WEAPON_CIRCLE:int ;
		static public var ID_META_MK_WEAPON_WALL:int ;
		
		public function HB_MetaFactory() {
			super();
			ID_META_MK_ACTOR = PushClassLink(MetaHBActor);
			ID_META_MK_HERO = PushClassLink(MetaHBHero);
			ID_META_MK_GEEK = PushClassLink(MetaHBGeek);
			ID_META_MK_ENEMY = PushClassLink(MetaHBEnemy);
			
			ID_META_MK_WEAPON = PushClassLink(MetaHBWeapon);
			ID_META_MK_WEAPON_SPREAD = PushClassLink(MetaHBWeaponSpread);
			ID_META_MK_WEAPON_CIRCLE = PushClassLink(MetaHBWeaponCircle);
			ID_META_MK_WEAPON_WALL = PushClassLink(MetaHBWeaponWall);
		}
	}
}
