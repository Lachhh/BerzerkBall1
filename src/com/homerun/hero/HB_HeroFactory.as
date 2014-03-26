package com.homerun.hero {
	import com.lachhhEngine.games.hero.HeroFactory;

	/**
	 * @author Lachhh
	 */
	public class HB_HeroFactory extends HeroFactory {
		static public var ID_HERO:int ;
		static public var ID_GEEK:int ;
		
		static private var _instance:HB_HeroFactory ;
		public function HB_HeroFactory() {
			super();
			_instance = this;
		}
		
		override protected function AddGameClass():void {
			super.AddGameClass();
			ID_HERO = PushClassLink(Hero);
			ID_GEEK = PushClassLink(Geek);
		}

	}
}
