package com.homerun.items {
	import com.homerun.meta.MetaHBActor;
	import com.homerun.meta.HB_MetaFactory;
	import com.homerun.meta.HB_MetaManager;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.items.ItemFactory;
	import com.lachhhEngine.games.items.ItemManager;

	/**
	 * @author Lachhh
	 */
	public class HB_ItemManager extends ItemManager {
		public function HB_ItemManager(context : Game, itemFactory : ItemFactory) {
			super(context, itemFactory);
		}		
	}
}
