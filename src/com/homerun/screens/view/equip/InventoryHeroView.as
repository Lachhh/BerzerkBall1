package com.homerun.screens.view.equip {
	import com.lachhhEngine.io.Callback;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.equip.MetaEquipment;
	import com.homerun.screens.view.equip.InventoryView;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.interfaces.forms.ButtonSelect;
	import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;

	import flash.display.MovieClip;

	/**
	 * @author Lachhh
	 */
	public class InventoryHeroView extends InventoryView {
		private var _item0View:EquipBtnView ;
		private var _item1View:EquipBtnView ;
		private var _item2View:EquipBtnView ;
		private var _btnGroup:ButtonSelectGroup ;
		
		public function InventoryHeroView(visual : MovieClip, refreshScreen:Callback) {
			super(visual, refreshScreen);
			_item0View = new EquipBtnView(item0, rollOverEquipView, rollOutEquipView, clickEquipView);
			_item1View = new EquipBtnView(item1, rollOverEquipView, rollOutEquipView, clickEquipView);
			_item2View = new EquipBtnView(item2, rollOverEquipView, rollOutEquipView, clickEquipView);
			_btnGroup = new ButtonSelectGroup();
			_btnGroup.AddButton(item0);
			_btnGroup.AddButton(item1);
			_btnGroup.AddButton(item2);
		}
		
		override public function Destroy() : void {
			super.Destroy();
			_item0View.Destroy();
			_item1View.Destroy();
			_item2View.Destroy();
		}
		
		override protected function SelectWeapon() : void {
			super.SelectWeapon();			 
			metaInventoryPanel.FeedFromInventory(HB_GameProgress.gameProgress.metaProgress.lastSelected.metaEquipInventory.GetWeaponInventory());	
		}
		
		override protected function SelectItem() : void {
			super.SelectItem();
			metaInventoryPanel.FeedFromInventory(HB_GameProgress.gameProgress.metaProgress.lastSelected.metaEquipInventory.GetItemInventory());
		}

		override protected function SelectPremium() : void {
			super.SelectPremium();
			metaInventoryPanel.FeedFromInventory(HB_GameProgress.gameProgress.metaProgress.lastSelected.metaEquipInventory.GetPremiumInventory());
		}
		
		override protected function RollOverEquip(metaEquip : MetaEquipment) : void {
			super.RollOverEquip(metaEquip);
		}

		override protected function ClickMetaEquip(metaEquip : MetaEquipment) : void {
			super.ClickMetaEquip(metaEquip);
			equipView.SetMetaEquip(metaEquip);
			Refresh();
		}
		
		override public function Refresh() : void {
			super.Refresh();
			_item0View.SetMetaEquip(MetaEquipment(metaInventoryPanel.GetRelative(0)));
			_item1View.SetMetaEquip(MetaEquipment(metaInventoryPanel.GetRelative(1)));
			_item2View.SetMetaEquip(MetaEquipment(metaInventoryPanel.GetRelative(2)));
			var b:ButtonSelect = GetBtnFromEquip(equipView.metaEquip);
			if(b == null) {
				_btnGroup.Deselect();
				equipView.SetMetaEquip(null);
			} else {
				_btnGroup.SelectButton(b);
			}
		}
		
		override protected function GetBtnFromEquip(metaEquip:MetaEquipment):ButtonSelect {
			switch(metaEquip) {
				case _item0View.metaEquipment :	return ButtonSelect(_item0View.visual) ;
				case _item1View.metaEquipment :	return ButtonSelect(_item1View.visual) ;
				case _item2View.metaEquipment :	return ButtonSelect(_item2View.visual) ; 			
			}
			return null;
		}

		private function get item0():ButtonSelect { return ButtonSelect(visual.getChildByName("item0")); }
		private function get item1():ButtonSelect { return ButtonSelect(visual.getChildByName("item1")); }
		private function get item2():ButtonSelect { return ButtonSelect(visual.getChildByName("item2")); }
	}
}
