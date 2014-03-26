package com.homerun.meta {
	import com.lachhhEngine.games.meta.MetaObject;

	/**
	 * @author mathieu
	 */
	public class MetaHBWeaponWall extends MetaHBWeapon {
		private var _totalDistance : Number;
		private var _NombreBall : Number;

		override public function cloneAttributes(metaObject : MetaObject) : void {
			super.cloneAttributes(metaObject);
			var metaWeapon : MetaHBWeaponWall = MetaHBWeaponWall(metaObject);
			_totalDistance = metaWeapon.totalDistance;
			_NombreBall = metaWeapon.nombreBall;
		}

		public function get totalDistance() : Number {
			return _totalDistance;
		}

		public function set totalDistance(totalDis : Number) : void {
			_totalDistance = totalDis;
		}

		public function get nombreBall() : Number {
			return _NombreBall;
		}

		public function set nombreBall(nombreBall : Number) : void {
			_NombreBall = nombreBall;
		}
	}
}
