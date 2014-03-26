package com.homerun.screens.view.equip {
	import com.homerun.init.HB_VersionInfo;
	import flash.text.TextField;
	import com.lachhhEngine.io.Callback;
	import com.homerun.meta.ui.equip.MetaEquipment;
	import com.homerun.meta.ui.equip.engine.MetaInventory;
	import com.homerun.meta.ui.equip.engine.MetaInventoryPanel;
	import com.homerun.screens.view.ObjectView;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.interfaces.forms.ButtonSelect;
	import com.lachhhEngine.interfaces.forms.ButtonSelectGroup;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class InventoryView extends ObjectView {
		private var _btnGroup:ButtonSelectGroup ;
		private var _metaInventoryPanel:MetaInventoryPanel;
		private var _equipView:EquipDescView ;
		private var _rollOverEquipView:Callback;
		private var _rollOutEquipView:Callback;
		private var _clickEquipView:Callback;
		private var _refreshScreen:Callback ;
		private var _equipDetailsView:EquipDetailsView ;
		private var _gotoX:int ;
		private var _gotoY:int ;
		
		
		public function InventoryView(visual : MovieClip, refreshScreen:Callback) {
			super(visual);
			_refreshScreen = refreshScreen;
			_metaInventoryPanel = CreateMetaInventoryPanel();
			_btnGroup = new ButtonSelectGroup() ;
			_equipView = CreateEquipDescView();
			_gotoX = -1;
			_gotoY = -1;
			InitButton(weaponSelect);
			InitButton(itemSelect);
			InitButton(premiumSelect);
			
			SelectWeapon();
			 
			prevBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickPrev);
			nextBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickNext);
			_rollOverEquipView = new Callback(RollOverEquip, this, null);
			_rollOutEquipView = new Callback(RollOutEquip, this, null);
			_clickEquipView = new Callback(ClickMetaEquip, this, null);
			_equipDetailsView = new EquipDetailsView(equipDetailsVisual);
			_equipDetailsView.visual.mouseChildren =_equipDetailsView.visual.mouseEnabled = false;
			_equipDetailsView.visual.alpha = 0 ; 
			//Refresh() ;
		}
		
		protected function CreateMetaInventoryPanel():MetaInventoryPanel {
			return new MetaInventoryPanel(3, 1);
		}
		
		protected function CreateEquipDescView():EquipDescView {
			return new EquipInventoryDesc(itemDescView, _refreshScreen);
		}
		 
		private function InitButton(b:ButtonSelect):void {
			b.addEventListener(MouseEvent.MOUSE_DOWN, onClickButton);
			_btnGroup.AddButton(b);
		}
		
		private function DestroyButton(b:ButtonSelect):void {
			b.removeEventListener(MouseEvent.MOUSE_DOWN, onClickButton);
		}
		
		private function onClickButton(event : MouseEvent) : void {
			var b:ButtonSelect = ButtonSelect(event.target) ;
			switch(b) {
				case weaponSelect : SelectWeapon();	break;
				case itemSelect : SelectItem(); break;
				case premiumSelect : SelectPremium(); break;	
			}
			Refresh();
		}
		
		protected function SelectWeapon():void {
			_btnGroup.SelectButton(weaponSelect);
		}
		
		protected function SelectItem():void {
			_btnGroup.SelectButton(itemSelect); 
		}
		
		protected function SelectPremium():void {
			_btnGroup.SelectButton(premiumSelect); 
		}
		
		protected function SetMetaInventory(metaInventory:MetaInventory):void {
			_metaInventoryPanel.FeedFromInventory(metaInventory);
			_metaInventoryPanel.GotoBeginning();
			//Refresh();
		}
		
		protected function RollOutEquip():void {
			_equipDetailsView.SetMetaEquip(null);
		}

		protected function RollOverEquip(metaEquip:MetaEquipment):void {
			var b:ButtonSelect = GetBtnFromEquip(metaEquip);
			_equipDetailsView.SetMetaEquip(metaEquip);
			if(_gotoX == -1 && _gotoY == -1) {
				_equipDetailsView.visual.x = b.x;
				_equipDetailsView.visual.y = b.y;
			}
			_gotoX = b.x;
			_gotoY = b.y;
			
			//_selectedItem = metaEquip;
			//_equipView.SetMetaEquip(metaEquip);
		}
		
		protected function ClickMetaEquip(metaEquip:MetaEquipment):void {
			//Do Stuff
		}
		
		override public function Destroy() : void {
			super.Destroy();
			prevBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickPrev);
			nextBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickNext);
			DestroyButton(weaponSelect);
			DestroyButton(itemSelect);
			DestroyButton(premiumSelect);
		}
		
		private function onClickNext(event : MouseEvent) : void {
			_metaInventoryPanel.NextPage();
			Refresh();
		}

		private function onClickPrev(event : MouseEvent) : void {
			_metaInventoryPanel.PrevPage();
			Refresh();
		}

		override public function Refresh() : void {
			super.Refresh();
			_equipView.Refresh();
			prevBtn.visible = !_metaInventoryPanel.indexIsOnMin;
			nextBtn.visible = !_metaInventoryPanel.indexIsOnMax;
			pageTxt.text = (_metaInventoryPanel.crntPage+1) + "/" + (_metaInventoryPanel.numPages);
			pageTxt.visible = _metaInventoryPanel.numPages > 0;
			
			if(HB_VersionInfo.showPremiumTab) {
				premiumSelect.visible = true;	
			} else {
				premiumSelect.visible = false;
			}
		}

		protected function GetBtnFromEquip(metaEquip:MetaEquipment):ButtonSelect {
			//To override 
			return null;
		}
		
		public function Update():void {
			if(_equipDetailsView.metaEquip == null) {
				_equipDetailsView.visual.alpha -= 0.2;	
			} else {
				_equipDetailsView.visual.alpha += 0.2;	
			}
			_equipDetailsView.visual.alpha = Math.min(1,Math.max(_equipDetailsView.visual.alpha,0));
			_equipDetailsView.visual.x += (_gotoX - _equipDetailsView.visual.x)*0.2;
			_equipDetailsView.visual.y += (_gotoY - _equipDetailsView.visual.y)*0.2;
		}

		
		private function get weaponSelect():ButtonSelect { return ButtonSelect(visual.getChildByName("weaponSelect")); }
		private function get itemSelect():ButtonSelect { return ButtonSelect(visual.getChildByName("itemSelect")); }
		private function get premiumSelect():ButtonSelect { return ButtonSelect(visual.getChildByName("premiumSelect")); }
		protected function get itemDescView():MovieClip { return MovieClip(visual.getChildByName("itemDescView")); }
		public function get prevBtn():Button { return Button(visual.getChildByName("prevBtn")); }
		public function get nextBtn():Button { return Button(visual.getChildByName("nextBtn"));}
		private function get pageTxt():TextField{ return TextField(visual.getChildByName("pageTxt"));}
		protected function get equipDetailsVisual():MovieClip { return MovieClip(visual.getChildByName("equipDetailsVisual")); }
		
		
		public function get metaInventoryPanel() : MetaInventoryPanel {
			return _metaInventoryPanel;
		}
		
		public function get rollOverEquipView() : Callback {
			return _rollOverEquipView;
		}
		
		public function get clickEquipView() : Callback {
			return _clickEquipView;
		}
		
		public function get equipView() : EquipDescView {
			return _equipView;
		}
		
		public function get refreshScreen() : Callback {
			return _refreshScreen;
		}
		
		public function get rollOutEquipView() : Callback {
			return _rollOutEquipView;
		}
		
		public function get equipDetailsView() : EquipDetailsView {
			return _equipDetailsView;
		}
		
		public function get gotoX() : int {
			return _gotoX;
		}
		
		public function set gotoX(gotoX : int) : void {
			_gotoX = gotoX;
		}
		
		public function get gotoY() : int {
			return _gotoY;
		}
		
		public function set gotoY(gotoY : int) : void {
			_gotoY = gotoY;
		}
	}
}
