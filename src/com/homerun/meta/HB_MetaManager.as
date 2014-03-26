package com.homerun.meta {
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.meta.MetaFactory;
	import com.lachhhEngine.games.meta.MetaManager;
	import com.lachhhEngine.games.meta.metaObject.MetaBehavior;
	import com.lachhhEngine.games.meta.metaObject.MetaLayer;

	/**
	 * @author Lachhh
	 */
	public class HB_MetaManager extends MetaManager {
		public function HB_MetaManager(context : Game, metaFactory : MetaFactory) {
			super(context, metaFactory);
		}
		
		public function CreateCustomMetaMKActor(metaDataFactoryId:int, logicInstanceFactoryId : int, px : int, py : int, vx:int, vy:int, team : int, targetTeam:int, metaLayer : MetaLayer, metaBehavior:MetaBehavior) : MetaHBActor {
			var metaMkActor:MetaHBActor = MetaHBActor(CreateMetaData(metaDataFactoryId));
			metaMkActor.instanceType = logicInstanceFactoryId;
			metaMkActor.x = px;
			metaMkActor.y = py;
			metaMkActor.vx = vx;
			metaMkActor.vy = vy;
			metaMkActor.team = team;
			metaMkActor.targetTeam = targetTeam;
			metaMkActor.metaBehavior = metaBehavior;
			metaMkActor.metaLayer = metaLayer;
			return metaMkActor;
		}
				
		public function CreateMetaMKWeapon() : MetaHBWeapon {
			var metaMKWeapon : MetaHBWeapon = MetaHBWeapon(CreateMetaData(HB_MetaFactory.ID_META_MK_WEAPON));
			return metaMKWeapon;
		}

		public function CreateMetaMKWeaponSpread() : MetaHBWeaponSpread {
			var metaMKWeapon : MetaHBWeaponSpread = MetaHBWeaponSpread(CreateMetaData(HB_MetaFactory.ID_META_MK_WEAPON_SPREAD));
			return metaMKWeapon;
		}

		public function CreateMetaMKWeaponCircle() : MetaHBWeaponCircle {
			var metaMKWeapon : MetaHBWeaponCircle = MetaHBWeaponCircle(CreateMetaData(HB_MetaFactory.ID_META_MK_WEAPON_CIRCLE));
			return metaMKWeapon;
		}

		public function CreateMetaMKWeaponWall() : MetaHBWeaponWall {
			var metaMKWeapon : MetaHBWeaponWall = MetaHBWeaponWall(CreateMetaData(HB_MetaFactory.ID_META_MK_WEAPON_WALL));
			return metaMKWeapon;
		}
		
		static public function get typedInstance() : HB_MetaManager {
			return HB_MetaManager(instance);	
		}
	}
}
