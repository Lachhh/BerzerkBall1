package com.homerun.io {
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.homerun.meta.ui.trophy.MetaTrophy;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.homerun.screens.AchPopupScreen;
	import com.homerun.screens.HB_ScreenFactory;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.utils.Utils;

	/**
	 * @author Lachhh
	 */
	public class AchievementManager {
		static public const SEPARATOR : String = "[ACH]";
		static private var _instance : AchievementManager ; 
		static private var _nextAch : Array = new Array();
		static private var _popup : AchPopupScreen ;
		static private var _achDone : Array = new Array(); 
		static private var _hasNew:Boolean ;
		public function ProgressAchievementCheck() : void {
			
		}

		public function BestowAchievement(metaAch : MetaTrophy) : void {
			//MC2_GamerSafe.BestowGsAchievements();
			if(Utils.IsInArray(_achDone, metaAch.id) && !Utils.IsInArray(_nextAch, metaAch)) return ;
			Utils.RemoveFromArray(_nextAch, metaAch) ;
			if(_popup == null) {
				_popup = AchPopupScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_TROPHYPOPUP_SCREEN, false, true));
				_popup.ShowAch(metaAch, new Callback(onEndAchPopup, this, null));
				if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_SOCIAL_AFFILIATES) {
					ExternalAPIManager.achievementAPI.bestowAchievement(metaAch.externalAPI_ach);	
				}
			} else {
				_nextAch.push(metaAch);
			}
			Utils.AddInArrayIfNotIn(_achDone, metaAch.id);
			_hasNew = true;
		}

		public function IsBestowed(metaAch : MetaTrophy) : Boolean {
			return Utils.IsInArray(_achDone, metaAch.id);
		}

		private function CheckForNextPopup() : void {
			if(_nextAch.length > 0) {
				BestowAchievement(_nextAch[0]);
			}
		}

		private function onEndAchPopup() : void {
			_popup = null;
			CheckForNextPopup();
		}

		public function Encode() : String {
			if(_achDone.length <= 0) return "";
			return _achDone.join(SEPARATOR);
		}

		public function Decode(s : String) : void {
			Utils.ClearArray(_achDone);
			if(s == null || s == "") return ;
			var params : Array = s.split(SEPARATOR);
			while(params.length > 0) {
				_achDone.push(int(params.shift()));
			} 
		}

		public function get numBestowed() : int {
			var cpt : int = 0 ; 
			for (var i : int = 0 ;i < _achDone.length; i++) {
				if(!MetaTrophyEnum.GetAchById(_achDone[i]).isPremium) cpt++;	
			}
			return cpt;
		} 

		static public function get instance() : AchievementManager {
			if(_instance == null) _instance = new AchievementManager();
			return _instance;
		}
		
		public function get numDiamondsBestowed():int {
			var cpt:int = 0 ;
			for(var i:int = 0 ; i < MetaTrophyEnum.allTrophies.length ; i++) {
				var t:MetaTrophy = MetaTrophyEnum.allTrophies[i];
				if(IsBestowed(t)) {
					cpt += t.diamond;
				}
			} 
			return cpt;
		}
		static public function get hasNew() : Boolean {return _hasNew;}
		static public function set hasNew(hasNew : Boolean) : void {_hasNew = hasNew;}
	}
}
