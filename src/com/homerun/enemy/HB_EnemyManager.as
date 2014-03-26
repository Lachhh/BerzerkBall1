package com.homerun.enemy {
	import com.homerun.meta.HB_MetaFactory;
	import com.homerun.meta.HB_MetaManager;
	import com.homerun.meta.MetaHBEnemy;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.enemy.EnemyFactory;
	import com.lachhhEngine.games.enemy.EnemyManager;

	/**
	 * @author Lachhh
	 */
	public class HB_EnemyManager extends EnemyManager {
		public function HB_EnemyManager(context : Game, enemyFactory : EnemyFactory) {
			super(context, enemyFactory);
		}
		
		public function CreateBee(x:int, y:int):Bee {
			var metaMkActor:MetaHBEnemy = MetaHBEnemy(HB_MetaManager.typedInstance.CreateCustomMetaMKActor(HB_MetaFactory.ID_META_MK_ENEMY, HB_EnemyFactory.ID_BEE, x, y, 0, 0, context.teamFactory.ENEMY1_TEAM, context.teamFactory.ALLY1_TEAM, context.actionLayer.metaLayer, null));
			return Bee(CreateActor(metaMkActor));
		}
		
		public function CreateBerzerker(x:int):Berzerker {
			var metaMkActor:MetaHBEnemy = MetaHBEnemy(HB_MetaManager.typedInstance.CreateCustomMetaMKActor(HB_MetaFactory.ID_META_MK_ENEMY, HB_EnemyFactory.ID_BERZERKER, x, 0, 0, 0, context.teamFactory.ENEMY1_TEAM, context.teamFactory.ALLY1_TEAM, context.actionLayer.metaLayer, null));
			return Berzerker(CreateActor(metaMkActor));
		}
		
		public function CreateBlob(x:int):Blob {
			var metaMkActor:MetaHBEnemy = MetaHBEnemy(HB_MetaManager.typedInstance.CreateCustomMetaMKActor(HB_MetaFactory.ID_META_MK_ENEMY, HB_EnemyFactory.ID_BLOB, x, 0, 0, 0, context.teamFactory.ENEMY1_TEAM, context.teamFactory.ALLY1_TEAM, context.actionLayer.metaLayer, null));
			return Blob(CreateActor(metaMkActor));
		}
		
		public function CreateCanon(x:int):Canon {
			var metaMkActor:MetaHBEnemy = MetaHBEnemy(HB_MetaManager.typedInstance.CreateCustomMetaMKActor(HB_MetaFactory.ID_META_MK_ENEMY, HB_EnemyFactory.ID_CANON, x, 0, 0, 0, context.teamFactory.ENEMY1_TEAM, context.teamFactory.ALLY1_TEAM, context.actionLayer.metaLayer, null));
			return Canon(CreateActor(metaMkActor));
		}
		
		public function CreateCezar(x:int, y:int):Cezar {
			var metaMkActor:MetaHBEnemy = MetaHBEnemy(HB_MetaManager.typedInstance.CreateCustomMetaMKActor(HB_MetaFactory.ID_META_MK_ENEMY, HB_EnemyFactory.ID_CEZAR, x, y, 0, 0, context.teamFactory.ENEMY1_TEAM, context.teamFactory.ALLY1_TEAM, context.actionLayer.metaLayer, null));
			return Cezar(CreateActor(metaMkActor));
		}
		
		public function CreateCoin(x:int, y:int):Coin {
			var metaMkActor:MetaHBEnemy = MetaHBEnemy(HB_MetaManager.typedInstance.CreateCustomMetaMKActor(HB_MetaFactory.ID_META_MK_ENEMY, HB_EnemyFactory.ID_COIN, x, y, 0, 0, context.teamFactory.ENEMY1_TEAM, context.teamFactory.ALLY1_TEAM, context.actionLayer.metaLayer, null));
			return Coin(CreateActor(metaMkActor));
		}
		
		public function CreateMechComm(x:int):MechComm {
			var metaMkActor:MetaHBEnemy = MetaHBEnemy(HB_MetaManager.typedInstance.CreateCustomMetaMKActor(HB_MetaFactory.ID_META_MK_ENEMY, HB_EnemyFactory.ID_MECHCOMM, x, 0, 0, 0, context.teamFactory.ENEMY1_TEAM, context.teamFactory.ALLY1_TEAM, context.actionLayer.metaLayer, null));
			return MechComm(CreateActor(metaMkActor));
		}
		
		public function CreateMine(x:int):Mine {
			var metaMkActor:MetaHBEnemy = MetaHBEnemy(HB_MetaManager.typedInstance.CreateCustomMetaMKActor(HB_MetaFactory.ID_META_MK_ENEMY, HB_EnemyFactory.ID_MINE, x, 0, 0, 0, context.teamFactory.ENEMY1_TEAM, context.teamFactory.ALLY1_TEAM, context.actionLayer.metaLayer, null));
			return Mine(CreateActor(metaMkActor));
		}
		
		public function CreateSpider(x:int):Spider {
			var metaMkActor:MetaHBEnemy = MetaHBEnemy(HB_MetaManager.typedInstance.CreateCustomMetaMKActor(HB_MetaFactory.ID_META_MK_ENEMY, HB_EnemyFactory.ID_SPIDER, x, 0, 0, 0, context.teamFactory.ENEMY1_TEAM, context.teamFactory.ALLY1_TEAM, context.actionLayer.metaLayer, null));
			return Spider(CreateActor(metaMkActor));
		}
	}
}
