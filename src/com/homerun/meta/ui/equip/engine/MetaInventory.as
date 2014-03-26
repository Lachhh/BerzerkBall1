package com.homerun.meta.ui.equip.engine {
	import com.homerun.meta.ui.equip.MetaEquipmentEnum;
	import com.homerun.meta.ui.equip.MetaEquipment;
	import com.lachhhEngine.utils.Utils;

	/**
	 * @author Lachhh
	 */
	public class MetaInventory {
		static public const SEPARATOR:String = "[INV]";
		private var _items:Array = new Array();
		
		public function Encode():String {
			var result:String = "";
			for (var i:int = 0 ; i < _items.length ; i++) {
				result += GetItemAt(i).Encode() + SEPARATOR;
			}
			
			return result.substr(0, result.length - SEPARATOR.length);
		}
		
		public function Decode(s:String):void {
			var params:Array = s.split(SEPARATOR);
			Utils.ClearArray(_items);
			while(params.length > 0) {
				var id : int = int(params.shift());
				var item:MetaEquipment = MetaEquipmentEnum.GetFromId(id);
				AddItem(item);
			}
		}
		 
		public function AddItem(metaItem:MetaInventoryItem):void {
			_items.push(metaItem);
		}
		
		public function RemoveItem(metaItem:MetaInventoryItem):void {
			Utils.RemoveFromArray(_items, metaItem);
		}
		
		public function HasItem(metaItem:MetaInventoryItem):Boolean {
			return Utils.IsInArray(_items, metaItem);
		}
		
		public function get isFull():Boolean {
			return false;	
		}
		
		public function GetItemAt(i:int):MetaInventoryItem {
			return MetaInventoryItem(_items[i]);
		}
		
		public function get numItems() : int {
			return _items.length;
		}
	}
}
