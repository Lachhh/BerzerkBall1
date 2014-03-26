package com.homerun.screens.view.equip {
	import com.lachhhEngine.utils.Utils;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.screens.view.equip.EquipBtnView;
	import com.lachhhEngine.io.Callback;

	import flash.display.MovieClip;

	/**
	 * @author Lachhh
	 */
	public class EquipShopBtnView extends EquipBtnView {
		public function EquipShopBtnView(visual : MovieClip, rollOver : Callback, rollOut : Callback, click : Callback) {
			super(visual, rollOver, rollOut, click);
		}

		override public function Refresh() : void {
			super.Refresh();
			if(metaEquipment == null) {
				visual.visible = false;
				return;	
			}
			
			visual.visible = true;
			Utils.SetColor(icons);
			if(!HB_GameProgress.gameProgress.metaProgress.lastSelected.metaEquipInventory.HasItem(metaEquipment)) {
				soldOutSticker.visible = false;
				unlockSticker.visible = false;
				currencyIcon.visible = costTxt.visible = true;
				currencyIcon.gotoAndStop(metaEquipment.isPremium ? 2 : 1);
				costTxt.text = Utils.PutVirgules(metaEquipment.price) ;
				costTxt.textColor = (((metaEquipment.price > myMoney && !metaEquipment.isPremium) || (metaEquipment.isLocked && metaEquipment.isPremium)) ? 0xFF0000: 0xFFFFFF);
				visual.mouseChildren = visual.mouseEnabled = true; 
				if(metaEquipment.isLocked) {
					Utils.SetColor2(icons, 0x000000);		
				} 
			} else {
				soldOutSticker.visible = !metaEquipment.isPremium;
				unlockSticker.visible = metaEquipment.isPremium;
				currencyIcon.visible = costTxt.visible = false;	
				//visual.mouseChildren = visual.mouseEnabled = false;
			}
		}
		
		private function get myMoney():int { return HB_GameProgress.gameProgress.cash; }
	}
}
