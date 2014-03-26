package com.homerun.meta.ui.trophy {

	import com.lachhhEngine.io.externalAPI.achievementAPI.MetaExternalAchievement;
	import com.homerun.meta.ui.equip.engine.MetaInventoryItem;
	import com.lachhhEngine.io.encryption.SecureNumber;
	/**
	 * @author Lachhh
	 */
	public class MetaTrophy extends MetaInventoryItem {
		private var _id:int ;
		private var _titleId:int ;
		private var _descId:int ;
		private var _desc2Id:int ;
		private var _iconFrame:int ;
		private var _diamond:SecureNumber = new SecureNumber(0);
		private var _url: String;
		private var _isPremium: Boolean;
		private var _trophyNameId: int;
		private var _externalAPI_ach: MetaExternalAchievement;
		
		public function MetaTrophy(id:int, refArray:Array,  titleId:int, descId:int, desc2Id:int, trophyNameId:int, iconFrame:int, diamond:int,  url:String = "", isPremium:Boolean = false, saId:MetaExternalAchievement = null) {
			_id = id;
			_titleId = titleId;
			_descId = descId;
			_desc2Id = desc2Id;
			_iconFrame = iconFrame;
			_diamond.value = diamond;
			_url = url;
			_isPremium = isPremium;
			_trophyNameId = trophyNameId;
			_externalAPI_ach = saId;
			if(refArray != null) refArray.push(this);
		}
		
		public function get titleId() : int {return _titleId;}
		public function get descId() : int {return _descId;}
		public function get iconFrame() : int {return _iconFrame;}
		public function get diamond() : int {return _diamond.value;}
		public function get url() : String {return _url;}
		public function get hasUrl() : Boolean {return (_url != "");}
		
		public function get id() : int {
			return _id;
		}
		
		public function get isPremium() : Boolean {
			return _isPremium;
		}
		
		public function get desc2Id() : int {
			return _desc2Id;
		}
		
		public function get trophyNameId() : int {
			return _trophyNameId;
		}
		
		public function get externalAPI_ach() : MetaExternalAchievement {
			return _externalAPI_ach;
		}
	}
}
