package com.homerun.meta.ui.equip {

	/**
	 * @author Lachhh
	 */
	public class MetaEquipWeapon extends MetaEquipment {
		private var _idSound:int ;
		public function MetaEquipWeapon(id:int, titleId:int, descId:int, price:int, iconId:int, isPremium:Boolean, pow:int, str:int, pre:int, con:int, idSound:int = -1) {
			super(id, titleId, descId, price, iconId, isPremium, pow, str, pre, con);
			_idSound = idSound;
		}
		
		public function get idSound() : int {
			return _idSound;
		}
		
	}
}
