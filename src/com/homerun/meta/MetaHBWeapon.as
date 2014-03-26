package com.homerun.meta {
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.meta.metaObject.MetaWeapon;

	/**
	 * @author mathieu
	 */
	public class MetaHBWeapon extends MetaWeapon {
		private var _nShakeCamera : int;

		override public function Init(metaInfo : MetaObject, context : Game) : void {
			super.Init(metaInfo, context);
			nShakeCamera = 0;
		}

		override public function cloneAttributes(metaObject : MetaObject) : void {
			super.cloneAttributes(metaObject);
			var metaWeapon : MetaHBWeapon = MetaHBWeapon(metaObject);
			_nShakeCamera = metaWeapon.nShakeCamera;
		}

		public function get nShakeCamera() : int {
			return _nShakeCamera;
		}

		public function set nShakeCamera(nShakeCamera : int) : void {
			_nShakeCamera = nShakeCamera;
		}
	}
}
