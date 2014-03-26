package com.homerun.screens.view.equip {
	import com.homerun.multilingual.HB_TextFactory;
	import com.homerun.meta.ui.equip.MetaEquipment;
	import com.homerun.screens.view.PopupDescView;
	import com.lachhhEngine.multilingual.TextFactory;

	import flash.display.MovieClip;

	/**
	 * @author Lachhh
	 */
	public class EquipDetailsView extends PopupDescView {
		private var _metaEquip:MetaEquipment ;
		public function EquipDetailsView(visual : MovieClip) {
			super(visual);
		}
		
		public function SetMetaEquip(metaEquip:MetaEquipment):void {
			_metaEquip = metaEquip;
			if(metaEquip == null) return ;
			var title:String = TextFactory.instance.GetMsg(metaEquip.titleId);
			var desc:String = TextFactory.instance.GetMsg(metaEquip.descId);
			/*if(metaEquip.isLocked) {
				title =  TextFactory.instance.GetMsg(HB_TextFactory.ID_AUTO_EARN_MORE_TO_UNLOCK);
				desc = "?????";
			}*/
			SetText(title, desc);
		}
		
		public function get metaEquip() : MetaEquipment {
			return _metaEquip;
		}
	}
}
