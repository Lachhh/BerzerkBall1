package com.homerun.screens.view.equip {
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.MetaPerso;
	import com.homerun.meta.ui.equip.MetaEquipWeapon;
	import com.homerun.screens.view.equip.EquipDescView;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.Callback;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class EquipInventoryDesc extends EquipDescView {
		private var _refreshScreen:Callback ;
		public function EquipInventoryDesc(visual : MovieClip, refreshScreen:Callback) {
			super(visual);
			equipBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			_refreshScreen = refreshScreen;
		}

		override public function Destroy() : void {
			super.Destroy();
			equipBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClick);
		}

		private function onClick(event : MouseEvent) : void {
			if(!metaPerso.IsEquipped(metaEquip)) {
				metaPerso.Equip(metaEquip);
				if(metaEquip is MetaEquipWeapon && MetaEquipWeapon(metaEquip).idSound != -1) {
					Jukebox.instance.PlaySound(MetaEquipWeapon(metaEquip).idSound);
				} else {
					Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_EQUIP);	
				}
			} else {
				//metaPerso.Desequip(metaEquip);
			}
			_refreshScreen.DoCallback();
		}

		override public function Refresh() : void {
			super.Refresh();
			equipBtn.visible = (metaEquip != null);
		}
		
		private function get metaPerso():MetaPerso{ return HB_GameProgress.gameProgress.metaProgress.lastSelected ;}
		private function get equipBtn():Button { return Button(visual.getChildByName("equipBtn"));}
		
	}
}
