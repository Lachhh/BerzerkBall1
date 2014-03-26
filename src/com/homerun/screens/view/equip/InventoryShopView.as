package com.homerun.screens.view.equip {
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.equip.MetaEquipment;
	import com.homerun.meta.ui.equip.MetaEquipmentEnum;
	import com.homerun.meta.ui.equip.engine.MetaInventoryPanel;
	import com.homerun.multilingual.HB_TextFactory;
	import com.homerun.screens.HB_Screen;
	import com.homerun.screens.HB_ScreenFactory;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.interfaces.forms.ButtonSelect;
	import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class InventoryShopView extends InventoryView {
		private var _item0View:EquipBtnView ;
		private var _item1View:EquipBtnView ;
		private var _item2View:EquipBtnView ;
		private var _item3View:EquipBtnView ;
		private var _item4View:EquipBtnView ;
		private var _item5View:EquipBtnView ;
		private var _btnGroup:ButtonSelectGroup ;
		private var _hbScreen:HB_Screen ;
		public function InventoryShopView(hbScreen:HB_Screen, visual : MovieClip, refreshScreen:Callback) {
			super(visual, refreshScreen);
			_hbScreen = hbScreen;
			_item0View = new EquipShopBtnView(item0, rollOverEquipView, rollOutEquipView, clickEquipView);
			_item1View = new EquipShopBtnView(item1, rollOverEquipView, rollOutEquipView, clickEquipView);
			_item2View = new EquipShopBtnView(item2, rollOverEquipView, rollOutEquipView, clickEquipView);
			_item3View = new EquipShopBtnView(item3, rollOverEquipView, rollOutEquipView, clickEquipView);
			_item4View = new EquipShopBtnView(item4, rollOverEquipView, rollOutEquipView, clickEquipView);
			_item5View = new EquipShopBtnView(item5, rollOverEquipView, rollOutEquipView, clickEquipView);
			_btnGroup = new ButtonSelectGroup();
			_btnGroup.AddButton(item0);
			_btnGroup.AddButton(item1);
			_btnGroup.AddButton(item2);
			_btnGroup.AddButton(item3);
			_btnGroup.AddButton(item4);
			_btnGroup.AddButton(item5);
		}

		override public function Destroy() : void {
			super.Destroy();
			_item0View.Destroy();
			_item1View.Destroy();
			_item2View.Destroy();
			_item3View.Destroy();
			_item4View.Destroy();
			_item5View.Destroy();
		}
		
		override protected function CreateMetaInventoryPanel():MetaInventoryPanel {
			return new MetaInventoryPanel(3, 2);
		}
		
		override protected function CreateEquipDescView() : EquipDescView {
			return new EquipBuyDescView(itemDescView, refreshScreen);
		}

		override protected function SelectWeapon() : void {
			super.SelectWeapon();
			SetMetaInventory(MetaEquipmentEnum.SHOP_WEAPON_INVENTORY);
		}
		
		override protected function SelectItem() : void {
			super.SelectItem();
			SetMetaInventory(MetaEquipmentEnum.SHOP_ITEM_INVENTORY);
		}

		override protected function SelectPremium() : void {
			super.SelectPremium();
			SetMetaInventory(MetaEquipmentEnum.SHOP_PREMIUM_INVENTORY);
		}

		override protected function RollOverEquip(metaEquip : MetaEquipment) : void {
			super.RollOverEquip(metaEquip);
			if(HB_GameProgress.gameProgress.metaProgress.lastSelected.metaEquipInventory.HasItem(metaEquip)) {
				equipDetailsView.SetText(TextFactory.instance.GetMsg(HB_TextFactory.ID_AUTO_EQUIP_THIS_IN_INVENTORY_TITLE), TextFactory.instance.GetMsg(HB_TextFactory.ID_AUTO_EQUIP_THIS_IN_INVENTORY));
			}
		}

		override protected function ClickMetaEquip(metaEquip : MetaEquipment) : void {
			super.ClickMetaEquip(metaEquip);
			if(!HB_VersionInfo.useViralFeature && metaEquip.isPremium && metaEquip.price > HB_GameProgress.gameProgress.diamondTotal && VersionInfo.exclusiveStuffVisible) {
				var c:HB_Screen = HB_Screen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_DIAMOND_SCREEN));
				c.SetLastScreen(HB_ScreenFactory.ID_ROUNDCOMPLETE_SCREEN);
				_hbScreen.Close(true);
			} else {
				equipView.SetMetaEquip(metaEquip);
				Refresh();
			}
		}

		override public function Refresh() : void {
			super.Refresh();
			_item0View.SetMetaEquip(MetaEquipment(metaInventoryPanel.GetRelative(0)));
			_item1View.SetMetaEquip(MetaEquipment(metaInventoryPanel.GetRelative(1)));
			_item2View.SetMetaEquip(MetaEquipment(metaInventoryPanel.GetRelative(2)));
			_item3View.SetMetaEquip(MetaEquipment(metaInventoryPanel.GetRelative(3)));
			_item4View.SetMetaEquip(MetaEquipment(metaInventoryPanel.GetRelative(4)));
			_item5View.SetMetaEquip(MetaEquipment(metaInventoryPanel.GetRelative(5)));
			
			var b:ButtonSelect = GetBtnFromEquip(equipView.metaEquip);
			if(b == null) {
				_btnGroup.Deselect();
				equipView.SetMetaEquip(null);
			} else {
				_btnGroup.SelectButton(b);
			}
			
			moneyTxt.text = Utils.PutVirgules(HB_GameProgress.gameProgress.cash);
			diamondTxt.text = Utils.PutVirgules(HB_GameProgress.gameProgress.diamondTotal);
		}
		
		override protected function GetBtnFromEquip(metaEquip:MetaEquipment):ButtonSelect {
			switch(metaEquip) {
				case _item0View.metaEquipment :	return ButtonSelect(_item0View.visual) ;
				case _item1View.metaEquipment :	return ButtonSelect(_item1View.visual) ;
				case _item2View.metaEquipment :	return ButtonSelect(_item2View.visual) ;
				case _item3View.metaEquipment :	return ButtonSelect(_item3View.visual) ;
				case _item4View.metaEquipment :	return ButtonSelect(_item4View.visual) ;
				case _item5View.metaEquipment :	return ButtonSelect(_item5View.visual) ; 			
			}
			return null;
		}
		
		private function get item0():ButtonSelect { return ButtonSelect(visual.getChildByName("item0")); }
		private function get item1():ButtonSelect { return ButtonSelect(visual.getChildByName("item1")); }
		private function get item2():ButtonSelect { return ButtonSelect(visual.getChildByName("item2")); }
		private function get item3():ButtonSelect { return ButtonSelect(visual.getChildByName("item3")); }
		private function get item4():ButtonSelect { return ButtonSelect(visual.getChildByName("item4")); }
		private function get item5():ButtonSelect { return ButtonSelect(visual.getChildByName("item5")); }
		private function get moneyTxt():TextField { return TextField(visual.getChildByName("moneyTxt")); }
		private function get diamondTxt():TextField { return TextField(visual.getChildByName("diamondTxt")); }
		
		
	}
}
