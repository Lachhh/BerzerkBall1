package com.homerun.screens.view.equip {
	import com.lachhhEngine.initializers.VersionInfo;
	import com.homerun.io.AchievementManager;
	import com.homerun.multilingual.HB_TextFactory;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.MetaPerso;
	import com.lachhhEngine.io.Callback;
	import com.homerun.meta.ui.equip.MetaEquipment;
	import com.homerun.screens.view.ObjectView;
	import com.lachhhEngine.multilingual.TextFactory;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class EquipBtnView extends ObjectView {
		private var _metaEquipment:MetaEquipment ;
		private var _rollOver:Callback ;
		private var _rollOut:Callback ;
		private var _click:Callback ;
		public function EquipBtnView(visual : MovieClip, rollOver:Callback, rollOut:Callback, click:Callback) {
			super(visual);
			visual.addEventListener(MouseEvent.MOUSE_OVER, onRollOver);
			visual.addEventListener(MouseEvent.MOUSE_OUT, onRollOut);
			visual.addEventListener(MouseEvent.MOUSE_DOWN, onClick);
			_rollOver = rollOver;
			_rollOut = rollOut;
			_click = click;
		}

		override public function Destroy() : void {
			super.Destroy();
			visual.removeEventListener(MouseEvent.MOUSE_OVER, onRollOver);
			visual.removeEventListener(MouseEvent.MOUSE_OUT, onRollOut);
			visual.removeEventListener(MouseEvent.MOUSE_DOWN, onClick);			
		}
		
		private function onRollOut(event : MouseEvent) : void {
			if(_metaEquipment != null && _metaEquipment.isLockedToSponsor) {
				return ; 
			}
			
			if(_rollOut != null) {
				_rollOut.DoCallback();	
			}
		}		

		private function onRollOver(event : MouseEvent) : void {
			if(_metaEquipment != null && _metaEquipment.isLockedToSponsor) {
				return ; 
			}
			if(_rollOver != null) {
				_rollOver.DoCallbackWithParams([_metaEquipment]);	
			}
		}

		private function onClick(event : MouseEvent) : void {
			if(_metaEquipment != null && _metaEquipment.isLockedToSponsor) {
				VersionInfo.OnClickSponsorThisGame(null);
				return ;	
			}
			
			if(_click != null) {
				_click.DoCallbackWithParams([_metaEquipment]);	
			}
		}

		public function SetMetaEquip(metaEquip:MetaEquipment):void {
			if(metaEquip != null && !VersionInfo.exclusiveStuffVisible && metaEquip.isPremium && metaEquip.price >= 500) {
				_metaEquipment = null;	
			} else {
				_metaEquipment = metaEquip;
			}
			Refresh();
		}

		override public function Refresh() : void {
			super.Refresh();
			if(_metaEquipment != null) {
				//descTxt.text = TextFactory.instance.GetMsg(_metaEquipment.titleId);
				equipIcon.visible = metaPerso.IsEquipped(_metaEquipment);
				icons.gotoAndStop(_metaEquipment.iconId);
				visual.visible = true;
				geekLocked.visible = false;
				
				if(_metaEquipment.isLockedToSponsor) {
					geekLocked.visible = true;	
				}
				geekLockedText.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_AUTO_ITEM_LOCKED);
				
			} else {
				visual.visible = false;
			}
			costTxt.visible = currencyIcon.visible = soldOutSticker.visible = unlockSticker.visible = false;	
		}
				
		//protected function get descTxt():TextField { return TextField(visual.getChildByName("descTxt")); }
		protected function get equipIcon():MovieClip { return MovieClip(visual.getChildByName("equipIcon")); }
		protected function get icons():MovieClip { return MovieClip(visual.getChildByName("icons")); }
		protected function get soldOutSticker():MovieClip { return MovieClip(visual.getChildByName("soldOutSticker")); }
		protected function get unlockSticker():MovieClip { return MovieClip(visual.getChildByName("unlockSticker")); }
		
		protected function get currencyIcon():MovieClip { return MovieClip(visual.getChildByName("currencyIcon")); }
		protected function get costTxt():TextField { return TextField(visual.getChildByName("costTxt")); }
		
		protected function get geekLocked():MovieClip { return MovieClip(visual.getChildByName("geekLocked")); }
		protected function get geekLockedText():TextField { return TextField(geekLocked.getChildByName("AUTO_0")); }
		
		
		public function get metaPerso():MetaPerso { return HB_GameProgress.gameProgress.metaProgress.lastSelected ;}
		public function get metaEquipment() : MetaEquipment {
			return _metaEquipment;
		}
	}
}
