package com.homerun.meta {
	import com.lachhhEngine.games.meta.MetaObject;

	/**
	 * @author mathieu
	 */
	public class MetaHBWeaponCircle extends MetaHBWeapon {
		private var _SpreadVelocity : Number;
		private var _NombreBall : Number;

		override public function cloneAttributes(metaObject : MetaObject) : void {
			super.cloneAttributes(metaObject);
			var metaWeapon : MetaHBWeaponCircle = MetaHBWeaponCircle(metaObject);
			_SpreadVelocity = metaWeapon.spreadVelocity;
			_NombreBall = metaWeapon.nombreBall;
		}

		public function get spreadVelocity() : Number {
			return _SpreadVelocity;
		}

		public function set spreadVelocity(spreadVelocity : Number) : void {
			_SpreadVelocity = spreadVelocity;
		}

		public function get nombreBall() : Number {
			return _NombreBall;
		}

		public function set nombreBall(nombreBall : Number) : void {
			_NombreBall = nombreBall;
		}
	}
}
