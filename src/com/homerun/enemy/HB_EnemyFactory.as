package com.homerun.enemy {
	import com.lachhhEngine.games.enemy.EnemyFactory;

	/**
	 * @author Lachhh
	 */
	public class HB_EnemyFactory extends EnemyFactory {
		static private var _instance:HB_EnemyFactory ;
		
		static public var ID_BEE:int ;
		static public var ID_BERZERKER:int ;
		static public var ID_BLOB:int ;
		static public var ID_CANON:int ;
		static public var ID_CEZAR:int ;
		static public var ID_COIN:int ;
		static public var ID_MECHCOMM:int ;
		static public var ID_MINE:int ;
		static public var ID_SPIDER:int ;
		
	
		
		  
		public function HB_EnemyFactory() {
			super();
			if(_instance != null) {
				throw new Error("instance already created");	
			} 
			_instance = this;
			ID_BEE = PushClassLink(Bee);
			ID_BERZERKER = PushClassLink(Berzerker);
			ID_BLOB = PushClassLink(Blob);
			ID_CANON = PushClassLink(Canon);
			ID_CEZAR = PushClassLink(Cezar);
			ID_COIN = PushClassLink(Coin);
			ID_MECHCOMM = PushClassLink(MechComm);
			ID_MINE = PushClassLink(Mine);
			ID_SPIDER = PushClassLink(Spider);
		}
		
		override protected function AddGameClass():void {
			super.AddGameClass();
			ID_MINE = PushClassLink(Mine);
		}
		
		static public function get instance() : HB_EnemyFactory {
			return _instance;
		}
	}
}
