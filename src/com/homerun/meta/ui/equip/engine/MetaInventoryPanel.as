package com.homerun.meta.ui.equip.engine {
	import com.lachhhEngine.utils.Utils;

	/**
	 * @author Lachhh
	 */
	public class MetaInventoryPanel {
		private var _column:int ;
		private var _row:int ;
		private var _index:int = 0;
		private var _items:Array = new Array();
		
		public function MetaInventoryPanel(column:int, row:int) {
			_column = column;
			_row = row;
		}
		
		public function NextRow():void {
			_index = Math.min(_index+_column, numItems);
		}
		
		public function PrevRow():void {
			_index = Math.max(_index-_column, 0);	
		}
		
		public function NextColumn():void {
			_index = Math.min(_index+_row, numItems);
		}
		
		public function PrevColumn():void {
			_index = Math.max(_index-_row, 0);	
		}
		
		public function NextPage():void {
			_index = Math.min(_index + (_row * _column), numItems);
		}
		
		public function PrevPage():void {
			_index = Math.max(_index - (_row * _column), 0);	
		}
		
		public function GotoBeginning():void {
			_index = 0;	
		}
		
		public function get numItems():int {
			return _items.length;	
		}
		
		public function get numPerPage():int {
			return _column * _row;	
		}
		
		public function GetRelative(i:int):MetaInventoryItem {
			return _items[i+index];
		}
		
		public function GetAbsolute(i:int):MetaInventoryItem {
			return _items[i];
		}
		
		public function AddItem(equip:MetaInventoryItem):void {
			_items.push(equip);
		}
		
		public function Clear():void {
			while(_items.length > 0) _items.shift();
		}

		public function FeedFromInventory(metaInventory:MetaInventory):void {
			Utils.ClearArray(_items);
			for (var i:int = 0 ; i < metaInventory.numItems ; i++) {
				var item:MetaInventoryItem = metaInventory.GetItemAt(i);
				AddItem(item);
			}	
			index = Math.max(Math.min(index, numItems - numPerPage), 0) ; 
		}
		
		public function get crntPage():int { return Math.floor(_index/numPerPage); }
		public function get numPages():int { return Math.ceil(numItems/numPerPage); }
		
		public function get indexIsOnMin():Boolean { return _index <= 0 ; }
		public function get indexIsOnMax():Boolean { return _index >= (numItems - numPerPage) ; }
		
		public function get column() : int {return _column;}
		public function get row() : int {return _row;}
		
		
		protected function get items():Array { return _items ;}
		protected function get index() : int {return _index;}
		protected function set index(index : int) : void {_index = index;}
	}
}
