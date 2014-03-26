package com.homerun.meta {
	import com.lachhhEngine.games.meta.MetaObject;

	/**
	 * @author mathieu
	 */
	public class MetaHBWeaponSpread extends MetaHBWeapon {
		private var _totalAngle : Number;
		private var _NombreBall : Number;

		override public function cloneAttributes(metaObject : MetaObject) : void {
			super.cloneAttributes(metaObject);
			var metaWeapon : MetaHBWeaponSpread = MetaHBWeaponSpread(metaObject);
			_totalAngle = metaWeapon.totalAngle;
			_NombreBall = metaWeapon.nombreBall;
		}

		public function get totalAngle() : Number {
			return _totalAngle;
		}

		public function set totalAngle(totalAngle : Number) : void {
			_totalAngle = totalAngle;
		}

		public function get nombreBall() : Number {
			return _NombreBall;
		}

		public function set nombreBall(nombreBall : Number) : void {
			_NombreBall = nombreBall;
		}
	}
}
