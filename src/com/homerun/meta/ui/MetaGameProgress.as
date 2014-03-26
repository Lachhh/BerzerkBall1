package com.homerun.meta.ui {
	import com.lachhhEngine.multilingual.TextFactory;
	import com.homerun.constants.HBConstants;
	import com.homerun.hero.HB_HeroManager;
	import com.homerun.meta.ui.equip.MetaEquipInventory;
	import com.homerun.meta.ui.equip.MetaEquipmentEnum;
	import com.homerun.multilingual.HB_TextFactory;

	/**
	 * @author Lachhh
	 */
	public class MetaGameProgress {
		static private const SEPARATOR:String = "[ALLPERSO]";
		private var _metaEtienne:MetaPerso ;
		private var _metaLachhh:MetaPerso ;
		private var _metaMarc:MetaPerso ;
		private var _metaMathieu:MetaPerso ;
		private var _metaTiti:MetaPerso ;
		private var _metaVincent:MetaPerso ;
		private var _metaDenize:MetaPerso ;
		private var _lastSelected:MetaPerso ;
		
		private var _denizeShot:int = 0 ;
		
		
		public function MetaGameProgress() {
			_metaEtienne = new MetaPerso(HB_HeroManager.PERSO_ETIENNE, HB_TextFactory.ID_PERSO_ETIENNE, HBConstants.HERO_ETIENNE_STARTING_STR, 	HBConstants.HERO_ETIENNE_STARTING_ACC, 	HBConstants.HERO_ETIENNE_STARTING_CON, 	HBConstants.HERO_ETIENNE_MAX_STR, 	HBConstants.HERO_ETIENNE_MAX_ACC, 	HBConstants.HERO_ETIENNE_MAX_CON);
			_metaLachhh = new MetaPerso(HB_HeroManager.PERSO_LACHHH, HB_TextFactory.ID_PERSO_LACHHH, 	HBConstants.HERO_LACHHH_STARTING_STR, 	HBConstants.HERO_LACHHH_STARTING_ACC, 	HBConstants.HERO_LACHHH_STARTING_CON, 	HBConstants.HERO_LACHHH_MAX_STR, 	HBConstants.HERO_LACHHH_MAX_ACC, 	HBConstants.HERO_LACHHH_MAX_CON);
			_metaMarc = new MetaPerso(HB_HeroManager.PERSO_MARC, HB_TextFactory.ID_PERSO_MARC, 			HBConstants.HERO_MARC_STARTING_STR, 	HBConstants.HERO_MARC_STARTING_ACC, 	HBConstants.HERO_MARC_STARTING_CON, 	HBConstants.HERO_MARC_MAX_STR, 		HBConstants.HERO_MARC_MAX_ACC, 		HBConstants.HERO_MARC_MAX_CON);
			_metaVincent = new MetaPerso(HB_HeroManager.PERSO_VINCENT, HB_TextFactory.ID_PERSO_VINCENT, HBConstants.HERO_BALLON_STARTING_STR, 	HBConstants.HERO_BALLON_STARTING_ACC, 	HBConstants.HERO_BALLON_STARTING_CON, 	HBConstants.HERO_BALLON_MAX_STR, 	HBConstants.HERO_BALLON_MAX_ACC, 	HBConstants.HERO_BALLON_MAX_CON);
			_metaMathieu = new MetaPerso(HB_HeroManager.PERSO_MATHIEU, HB_TextFactory.ID_PERSO_MATHIEU, HBConstants.HERO_MATHIEU_STARTING_STR, 	HBConstants.HERO_MATHIEU_STARTING_ACC, 	HBConstants.HERO_MATHIEU_STARTING_CON, 	HBConstants.HERO_MATHIEU_MAX_STR, 	HBConstants.HERO_MATHIEU_MAX_ACC, 	HBConstants.HERO_MATHIEU_MAX_CON);
			_metaTiti = new MetaPerso(HB_HeroManager.PERSO_TITI, HB_TextFactory.ID_PERSO_TITI, 			HBConstants.HERO_TITI_STARTING_STR, 	HBConstants.HERO_TITI_STARTING_ACC, 	HBConstants.HERO_TITI_STARTING_CON, 	HBConstants.HERO_TITI_MAX_STR, 		HBConstants.HERO_TITI_MAX_ACC, 		HBConstants.HERO_TITI_MAX_CON);
			_metaDenize = new MetaPerso(HB_HeroManager.PERSO_DENIZE, HB_TextFactory.ID_PERSO_DENIZE, 	HBConstants.HERO_DENIZE_STARTING_STR, 	HBConstants.HERO_DENIZE_STARTING_ACC, 	HBConstants.HERO_DENIZE_STARTING_CON, 	HBConstants.HERO_DENIZE_MAX_STR, 	HBConstants.HERO_DENIZE_MAX_ACC, 	HBConstants.HERO_DENIZE_MAX_CON);
			
			_lastSelected = _metaDenize; 
		}
		
		public function Encode():String {
			var lastSelectedId:int = _lastSelected.id;
			if(_lastSelected == _metaDenize) {
				lastSelectedId = _metaEtienne.id;
			}
			
			return _metaEtienne.Encode() + SEPARATOR + 
				_metaLachhh.Encode() + SEPARATOR + 
				_metaMarc.Encode() + SEPARATOR +
				_metaMathieu.Encode() + SEPARATOR + 
				_metaTiti.Encode() + SEPARATOR +
				_metaVincent.Encode() + SEPARATOR + 
				lastSelectedId + SEPARATOR + 
				_metaDenize.Encode() + SEPARATOR + _denizeShot;
		}

		public function Decode(s:String):void {
			var params:Array = s.split(SEPARATOR);
			_metaEtienne.Decode(params.shift());
			_metaLachhh.Decode(params.shift());
			_metaMarc.Decode(params.shift());
			_metaMathieu.Decode(params.shift());
			_metaTiti.Decode(params.shift());
			_metaVincent.Decode(params.shift());
			_lastSelected = GetFromId(int(params.shift()));
			if(params.length > 0) {
				_metaDenize.Decode(params.shift());
			}
			if(params.length > 0) {
				_denizeShot = params.shift();
			}
			
		}
		
		public function GetFromId(id:int):MetaPerso {
			switch(id) {
				case HB_HeroManager.PERSO_ETIENNE: return _metaEtienne; break;
				case HB_HeroManager.PERSO_LACHHH: return _metaLachhh; break;
				case HB_HeroManager.PERSO_MARC: return _metaMarc; break;
				case HB_HeroManager.PERSO_MATHIEU: return _metaMathieu; break;
				case HB_HeroManager.PERSO_VINCENT: return _metaVincent; break;
				case HB_HeroManager.PERSO_TITI: return _metaTiti; break;
				case HB_HeroManager.PERSO_DENIZE: return _metaDenize;	break;
			}
			return null;
		}
		
		public function get lastSelected() : MetaPerso {
			return _lastSelected;
		}
		
		public function IsUnlocked(metaPerso:MetaPerso):Boolean {
			switch(metaPerso) {
				case _metaEtienne : return true;
				case _metaLachhh : return true;
				case _metaMarc : return true;
				case _metaMathieu : return _metaLachhh.hasReachUnlockThreshold;
				case _metaVincent : return _metaEtienne.hasReachUnlockThreshold;
				case _metaTiti : return _metaMarc.hasReachUnlockThreshold;
				case _metaDenize: return true;
			}
			return false;
		}
		
		public function get gameCompleted():Boolean {
			return IsUnlocked(_metaMathieu) && IsUnlocked(_metaVincent) && IsUnlocked(_metaTiti);
		}
		
		public function get hasAttMaxed():Boolean {
			return _metaEtienne.hasAttMaxed  &&	
				_metaLachhh.hasAttMaxed &&
				_metaMarc.hasAttMaxed &&
				_metaMathieu.hasAttMaxed &&
				_metaVincent.hasAttMaxed &&
				_metaTiti.hasAttMaxed && 
				_metaDenize.hasAttMaxed ;
			
		} 
		
		public function get allLevel10():Boolean {
			return _metaEtienne.xp.crntLevel >= 10 &&	
				_metaLachhh.xp.crntLevel >= 10 &&
				_metaMarc.xp.crntLevel >= 10 &&
				_metaMathieu.xp.crntLevel >= 10 &&
				_metaVincent.xp.crntLevel >= 10 &&
				_metaTiti.xp.crntLevel >= 10 && 
				_metaDenize.xp.crntLevel >= 10 ;
			
		} 
		
		public function IsLvlHigherOrEqualThan(lvl:int):Boolean {
			return _metaEtienne.xp.crntLevel >= lvl ||	
				_metaLachhh.xp.crntLevel >= lvl ||
				_metaMarc.xp.crntLevel >= lvl ||
				_metaMathieu.xp.crntLevel >= lvl ||
				_metaVincent.xp.crntLevel >= lvl ||
				_metaTiti.xp.crntLevel >= lvl || 
				_metaDenize.xp.crntLevel >= lvl ;
		}
		
		public function get numDiamondSpent():int {
			return _metaEtienne.numDiamondSpent +
				_metaLachhh.numDiamondSpent + 
				_metaMarc.numDiamondSpent + 
				_metaMathieu.numDiamondSpent + 
				_metaVincent.numDiamondSpent + 
				_metaTiti.numDiamondSpent + 
				_metaDenize.numDiamondSpent ;  
		}

		public function get hasBoughtAnItem():Boolean {
			return _metaEtienne.metaEquipInventory.hasBoughtItem || 
				_metaLachhh.metaEquipInventory.hasBoughtItem ||
				_metaMarc.metaEquipInventory.hasBoughtItem ||
				_metaMathieu.metaEquipInventory.hasBoughtItem ||
				_metaVincent.metaEquipInventory.hasBoughtItem ||
				_metaTiti.metaEquipInventory.hasBoughtItem || 
				_metaDenize.metaEquipInventory.hasBoughtItem ;
		}
		
		public function get hasBoughtAWeapon():Boolean {
			return _metaEtienne.metaEquipInventory.hasBoughtWeapon|| 
				_metaLachhh.metaEquipInventory.hasBoughtWeapon ||
				_metaMarc.metaEquipInventory.hasBoughtWeapon ||
				_metaMathieu.metaEquipInventory.hasBoughtWeapon ||
				_metaVincent.metaEquipInventory.hasBoughtWeapon ||
				_metaTiti.metaEquipInventory.hasBoughtWeapon ||
				_metaDenize.metaEquipInventory.hasBoughtWeapon ;
		}
		
	/*	public function get hasBoughtEverything():Boolean {
			return _metaEtienne.metaEquipInventory.hasEveryNormalItems || 
				_metaLachhh.metaEquipInventory.hasEveryNormalItems ||
				_metaMarc.metaEquipInventory.hasEveryNormalItems ||
				_metaMathieu.metaEquipInventory.hasEveryNormalItems ||
				_metaVincent.metaEquipInventory.hasEveryNormalItems ||
				_metaTiti.metaEquipInventory.hasEveryNormalItems ;
		}
		*/
		
		public function get hasBoughtEverythingNonPremium():Boolean {
			return _metaEtienne.hasBoughtEverythingNonPremium || 
				_metaLachhh.hasBoughtEverythingNonPremium ||
				_metaMarc.hasBoughtEverythingNonPremium ||
				_metaMathieu.hasBoughtEverythingNonPremium ||
				_metaVincent.hasBoughtEverythingNonPremium ||
				_metaTiti.hasBoughtEverythingNonPremium || 
				_metaDenize.hasBoughtEverythingNonPremium ;
		}
		
		public function GetUnlockTxt(metaPerso:MetaPerso):String {
			switch(metaPerso) {
				case _metaMathieu : return TextFactory.instance.GetMsg(HB_TextFactory.ID_MATHIEU_REQUIREMENTS);
				case _metaVincent : return TextFactory.instance.GetMsg(HB_TextFactory.ID_BALLON_REQUIREMENTS);
				case _metaTiti : return TextFactory.instance.GetMsg(HB_TextFactory.ID_TITI_REQUIREMENTS);	
			}
			return "";
		}
		
		
				
		public function set lastSelected(lastSelected : MetaPerso) : void {
			_lastSelected = lastSelected;
		}
		
		public function get denizeShot() : int {
			return _denizeShot;
		}
		
		public function set denizeShot(denizeShot : int) : void {
			_denizeShot = denizeShot;
		}
		
		public function get metaDenize() : MetaPerso {
			return _metaDenize;
		}
	}
}
