package com.homerun.meta.ui.equip {
	import com.lachhhEngine.games.meta.metaObject.MetaWeapon;
	import com.homerun.meta.ui.equip.engine.MetaInventory;

	/**
	 * @author Lachhh
	 */
	public class MetaEquipInventory extends MetaInventory {
		public function MetaEquipInventory() {
		}
		
		override public function Encode():String {
			var result:String = "";
			for (var i:int = 0 ; i < numItems ; i++) {
				if(!MetaEquipment(GetItemAt(i)).isPremium) {
					result += GetItemAt(i).Encode() + MetaInventory.SEPARATOR;
				}
			}
			
			return result.substr(0, result.length - MetaInventory.SEPARATOR.length);
		}
		
		
		public function GetWeaponInventory():MetaInventory {
			var result:MetaInventory = new MetaInventory();
			for(var i:int = 0 ; i < numItems ; i++) {
				var item:MetaEquipment = MetaEquipment(GetItemAt(i));
				if(item is MetaEquipWeapon) {
					result.AddItem(item);	
				}
			}	
			
			return result;
		}
		
		public function GetItemInventory():MetaInventory {
			var result:MetaInventory = new MetaInventory();
			for(var i:int = 0 ; i < numItems ; i++) {
				var item:MetaEquipment = MetaEquipment(GetItemAt(i));
				if(!(item is MetaEquipWeapon)) {
					result.AddItem(item);	
				}
			}
			
			
			return result;
		}
		
		public function GetPremiumInventory():MetaInventory {
			var result:MetaInventory = new MetaInventory();
			for(var i:int = 0 ; i < numItems ; i++) {
				var item:MetaEquipment = MetaEquipment(GetItemAt(i));
				if(item.isPremium) {
					result.AddItem(item);	
				}
			}	
			return result;
		}
		
		public function get numNormalItems():int {
			var cpt:int = 0 ; 
			 
			for (var i:int = 0 ; i < numItems ; i++) {
				var e:MetaEquipment = MetaEquipment(GetItemAt(i));
				if(!e.isPremium) cpt ++;	
			}
			return cpt;
		}
		
		public function get hasEveryNormalItems():Boolean {
			return numNormalItems >= MetaEquipmentEnum.numNormalEquip;	
		}
		
		public function get numWeapons():int {
			var cpt:int = 0 ; 
			 
			for (var i:int = 0 ; i < numItems ; i++) {
				var e:MetaEquipment = MetaEquipment(GetItemAt(i));
				if(e is MetaEquipWeapon) cpt++;	
			}
			return cpt;	
		}
		
		public function get hasBoughtWeapon():Boolean {
			return numWeapons >= 2; 	
		}  
		
		public function get hasBoughtItem():Boolean {
			return numNormalItems > numWeapons; 	
		}  
	}
}
