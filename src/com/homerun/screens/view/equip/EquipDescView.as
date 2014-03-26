package com.homerun.screens.view.equip {
	import com.homerun.meta.ui.equip.MetaEquipment;
	import flash.text.TextField;
	import com.homerun.screens.view.ObjectView;

	import flash.display.MovieClip;

	/**
	 * @author Lachhh
	 */
	public class EquipDescView extends ObjectView {
		private var _metaEquip:MetaEquipment;
		public function EquipDescView(visual : MovieClip) {
			super(visual);
		}
		
		public function SetMetaEquip(metaEquip:MetaEquipment):void {
			_metaEquip = metaEquip;
			Refresh();
		}

		override public function Refresh() : void {
			super.Refresh();
			if(_metaEquip != null) {
				SetText(powerTxt, _metaEquip.powerBonus);
				SetText(strTxt, _metaEquip.strBonus);
				SetText(precisionTxt, _metaEquip.precisionBonus);
				SetText(controlTxt, _metaEquip.controlBonus);
				/*if(_metaEquip.isLocked) {
					powerTxt.text = "??";
					strTxt.text = "??";
					precisionTxt.text = "??";
					controlTxt.text = "??";
				}*/
			} else {
				powerTxt.text = "-" ;
				strTxt.text = "-" ;
				precisionTxt.text = "-" ;
				controlTxt.text = "-" ;
			}
		}
		
		private function SetText(t:TextField, value:int):void {
			t.text = (value > 0 ? "+" : "") + value; 
		}

		private function get powerTxt():TextField { return TextField(visual.getChildByName("powerTxt")); }
		private function get strTxt():TextField { return TextField(visual.getChildByName("strTxt")); }
		private function get precisionTxt():TextField { return TextField(visual.getChildByName("precisionTxt")); }
		private function get controlTxt():TextField { return TextField(visual.getChildByName("controlTxt"));}
		
		public function get metaEquip() : MetaEquipment {
			return _metaEquip;
		}
	}
}
