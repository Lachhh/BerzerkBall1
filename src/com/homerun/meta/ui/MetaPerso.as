package com.homerun.meta.ui {
	import com.homerun.io.HB_GameProgress;
	import com.homerun.constants.HBConstants;
	import com.homerun.meta.ui.equip.MetaEquipBandana;
	import com.homerun.meta.ui.equip.MetaEquipBelt;
	import com.homerun.meta.ui.equip.MetaEquipBracers;
	import com.homerun.meta.ui.equip.MetaEquipInventory;
	import com.homerun.meta.ui.equip.MetaEquipWeapon;
	import com.homerun.meta.ui.equip.MetaEquipment;
	import com.homerun.meta.ui.equip.MetaEquipmentEnum;
	import com.lachhhEngine.io.encryption.SecureNumber;

	/**
	 * @author Lachhh
	 */
	public class MetaPerso {
		static private const SEPARATOR:String = "[PERSO]";
		static public const NUM_UPGRADE:int = 16;
		private var _id:int = 0;
		private var _xp:MetaUpgrade = new MetaUpgrade(HBConstants.GetSlaveXpArray());
		private var _cash:SecureNumber = new SecureNumber();
		private var _str:MetaUpgrade ;
		private var _precision:MetaUpgrade; 
		private var _control:MetaUpgrade ;
		private var _equippedWeapon:MetaEquipment ;
		private var _equippedBracers:MetaEquipment ;
		private var _equippedBandana:MetaEquipment ;
		private var _equippedBelt:MetaEquipment ;
		private var _titleId:int ;
		private var _metaEquipInventory:MetaEquipInventory;
		private var _hasReachUnlockThreshold:Boolean ;
		
		public function MetaPerso(id:int, titleId:int, strengthValue:int, precisionValue:int, controlValue:int, maxStr:int, maxPre:int, maxCon:int) {
			_str = new MetaUpgrade([0,maxStr]);
			_precision = new MetaUpgrade([0,maxPre]);
			_control = new MetaUpgrade([0,maxCon]);
			
			_id = id;
			_titleId = titleId;
			_str.upgradeValue = strengthValue;
			_precision.upgradeValue = precisionValue;
			_control.upgradeValue = controlValue;
			_equippedWeapon = MetaEquipmentEnum.EQUIP_WEAPON_1;
			_equippedBracers = MetaEquipmentEnum.EQUIP_NULL;
			_equippedBandana = MetaEquipmentEnum.EQUIP_NULL;
			_equippedBelt = MetaEquipmentEnum.EQUIP_NULL;
			
			_metaEquipInventory = new MetaEquipInventory();
			_metaEquipInventory.AddItem(MetaEquipmentEnum.EQUIP_WEAPON_1);
		}

		public function Encode():String {
			return xp.Encode() + SEPARATOR + 
				str.Encode() + SEPARATOR + 
				cash + SEPARATOR + 
				precision.Encode() + SEPARATOR + 	
				control.Encode() + SEPARATOR +
				_equippedWeapon.Encode() + SEPARATOR +
				_equippedBracers.Encode() + SEPARATOR +
				_equippedBandana.Encode() + SEPARATOR +
				_equippedBelt.Encode() + SEPARATOR +
				(_hasReachUnlockThreshold ? "1" : "0") + SEPARATOR + 
				_metaEquipInventory.Encode() ; 
				  
		}

		public function Decode(s:String):void {
			var params:Array = s.split(SEPARATOR);
			xp.Decode(params.shift());
			str.Decode(params.shift());
			cash = int(params.shift());
			precision.Decode(params.shift());
			control.Decode(params.shift());
			_equippedWeapon = MetaEquipmentEnum.GetFromId(int(params.shift()));
			_equippedBracers = MetaEquipmentEnum.GetFromId(int(params.shift()));
			_equippedBandana = MetaEquipmentEnum.GetFromId(int(params.shift()));
			_equippedBelt = MetaEquipmentEnum.GetFromId(int(params.shift()));
			_hasReachUnlockThreshold = String(params.shift()) == "1";
			_metaEquipInventory.Decode(params.shift());
		}
		
		public function ValideEquip():void {
			for (var i : int = 0; i < _metaEquipInventory.numItems; i++) {
				var metaEquip:MetaEquipment =  _metaEquipInventory.GetItemAt(i) as MetaEquipment;
				if(metaEquip.isPremium && metaEquip.price > HB_GameProgress.gameProgress.diamondTotal) {
					_metaEquipInventory.RemoveItem(metaEquip);
					i--;
				}
			}
			
			if(_equippedBandana.isPremium && _equippedBandana.price > HB_GameProgress.gameProgress.diamondTotal) {
				_equippedBandana = MetaEquipmentEnum.EQUIP_NULL;
			}
			
			if(_equippedBracers.isPremium && _equippedBracers.price > HB_GameProgress.gameProgress.diamondTotal) {
				_equippedBracers = MetaEquipmentEnum.EQUIP_NULL;
			}
			
			if(_equippedBelt.isPremium && _equippedBelt.price > HB_GameProgress.gameProgress.diamondTotal) {
				_equippedBelt = MetaEquipmentEnum.EQUIP_NULL;
			}
			
			if(_equippedWeapon.isPremium && _equippedWeapon.price > HB_GameProgress.gameProgress.diamondTotal) {
				_equippedWeapon = MetaEquipmentEnum.EQUIP_WEAPON_1;
			}	
		}
		
		public function Equip(metaEquipment:MetaEquipment):void {
			if(metaEquipment is MetaEquipBandana) _equippedBandana = metaEquipment;
			if(metaEquipment is MetaEquipBracers) _equippedBracers = metaEquipment;
			if(metaEquipment is MetaEquipBelt) _equippedBelt = metaEquipment;
			if(metaEquipment is MetaEquipWeapon) _equippedWeapon = metaEquipment;
			ValideEquip();
		}
		
		public function Desequip(metaEquipment:MetaEquipment):void {
			if(metaEquipment.id == _equippedBandana.id) _equippedBandana = MetaEquipmentEnum.EQUIP_NULL;
			if(metaEquipment.id == _equippedBracers.id) _equippedBracers = MetaEquipmentEnum.EQUIP_NULL;
			if(metaEquipment.id == _equippedBelt.id) _equippedBelt = MetaEquipmentEnum.EQUIP_NULL;
			if(metaEquipment.id == _equippedWeapon.id) _equippedWeapon = MetaEquipmentEnum.EQUIP_NULL;	
		}
		
		public function IsEquipped(metaEquipment:MetaEquipment):Boolean {
			if(metaEquipment.id == _equippedBandana.id) return true;
			if(metaEquipment.id == _equippedBracers.id) return true;
			if(metaEquipment.id == _equippedBelt.id) return true;
			if(metaEquipment.id == _equippedWeapon.id) return true;
			return false;
		}
		
		public function get xp() : MetaUpgrade { return _xp;}
		public function get str() : MetaUpgrade { return _str; }
		public function get precision() : MetaUpgrade {	return _precision;}
		public function get control() : MetaUpgrade { return _control;}
		
		public function get titleId() : int {
			return _titleId;
		}
		
		public function get id() : int {
			return _id;
		}
				
		public function get equippedPower():int {return _equippedWeapon.powerBonus;}
		
		public function get totalPower():int {
			var mulStr:Number = baseStr*(HBConstants.HERO_POWER_PRCT_BONUS_PER_STRENGHT/100) ;
			var addStr:int = baseStr*HBConstants.HERO_POWER_ADD_BONUS_PER_STRENGHT + equippedStrBonus;
			return equippedPower * (1+powerBonus+mulStr) + addStr;
		}
		
	
		public function get totalControl():int {return Math.max(0, baseControl + equippedControl);}
		public function get totalPrecision():int {return Math.max(0, basePrecision + equippedPrecision);}
		
		public function get baseStr():int {return str.upgradeValue ;}
		public function get basePrecision():int {return precision.upgradeValue ;}
		public function get baseControl():int {return control.upgradeValue ;}
		
		public function get allMaxed() : Boolean { 
			return _str.isMaxed && _precision.isMaxed && _control.isMaxed;
		}
		
		
		public function get totalPoints():int {
			var cpt:int = 0 ; 
			switch(xp.crntLevel) {
				case 1: cpt = HBConstants.HERO_PTS_AT_LVL_1; break ;
				case 2: cpt = HBConstants.HERO_PTS_AT_LVL_2; break ;
				case 3: cpt = HBConstants.HERO_PTS_AT_LVL_3; break ;
				case 4: cpt = HBConstants.HERO_PTS_AT_LVL_4; break ;
				case 5: cpt = HBConstants.HERO_PTS_AT_LVL_5; break ;
				case 6: cpt = HBConstants.HERO_PTS_AT_LVL_6; break ;
				case 7: cpt = HBConstants.HERO_PTS_AT_LVL_7; break ;
				case 8: cpt = HBConstants.HERO_PTS_AT_LVL_8; break ;
				case 9: cpt = HBConstants.HERO_PTS_AT_LVL_9; break ;
				case 10: cpt = HBConstants.HERO_PTS_AT_LVL_10; break ;
				case 11: cpt = HBConstants.HERO_PTS_AT_LVL_11; break ;
				case 12: cpt = HBConstants.HERO_PTS_AT_LVL_12; break ;
				case 13: cpt = HBConstants.HERO_PTS_AT_LVL_13; break ;
				case 14: cpt = HBConstants.HERO_PTS_AT_LVL_14; break ;
				case 15: cpt = HBConstants.HERO_PTS_AT_LVL_15; break ;
				case 16: cpt = HBConstants.HERO_PTS_AT_LVL_16; break ;
				case 17: cpt = HBConstants.HERO_PTS_AT_LVL_17; break ;
				case 18: cpt = HBConstants.HERO_PTS_AT_LVL_18; break ;
				case 19: cpt = HBConstants.HERO_PTS_AT_LVL_19; break ;
				case 20: cpt = HBConstants.HERO_PTS_AT_LVL_20; break ;
				case 21: cpt = HBConstants.HERO_PTS_AT_LVL_21; break ;
				case 22: cpt = HBConstants.HERO_PTS_AT_LVL_22; break ;
				case 23: cpt = HBConstants.HERO_PTS_AT_LVL_23; break ;
				case 24: cpt = HBConstants.HERO_PTS_AT_LVL_24; break ;
				case 25: cpt = HBConstants.HERO_PTS_AT_LVL_25; break ;
			}
						 
			return Math.max(0, cpt-(baseStr + basePrecision + baseControl));
		}
		
		public function get equippedStrBonus():int {return _equippedWeapon.strBonus + _equippedBandana.strBonus + _equippedBelt.strBonus + _equippedBracers.strBonus;}
		public function get equippedPrecision():int {return _equippedWeapon.precisionBonus + _equippedBandana.precisionBonus + _equippedBelt.precisionBonus + _equippedBracers.precisionBonus;}
		public function get equippedControl():int {return _equippedWeapon.controlBonus + _equippedBandana.controlBonus + _equippedBelt.controlBonus + _equippedBracers.controlBonus;}
		
		
		
		public function get weaponFrame():int {
			if(_equippedWeapon.id == MetaEquipmentEnum.EQUIP_WEAPON_15.id) return 15;
			if(_equippedWeapon.id == MetaEquipmentEnum.EQUIP_WEAPON_16.id) return 16;
			if(_equippedWeapon.id == MetaEquipmentEnum.EQUIP_WEAPON_17.id) return 17;
			return _equippedWeapon.iconId;
		}
		
		public function get bracersFrame():int {
			if(_equippedBracers.id == MetaEquipmentEnum.EQUIP_BRACERS_7.id) return 8;
			if(_equippedBracers.id == MetaEquipmentEnum.EQUIP_BRACERS_8.id) return 9;
			
			return _equippedBracers.iconId -21;
		}
		public function get bandanaFrame():int {
			if(_equippedBandana.id == MetaEquipmentEnum.EQUIP_BANDANA_7.id) return 8;
			if(_equippedBandana.id == MetaEquipmentEnum.EQUIP_BANDANA_8.id) return 9;
			return _equippedBandana.iconId -14;
		}
		public function get beltFrame():int {
			if(_equippedBelt.id == MetaEquipmentEnum.EQUIP_BELT_7.id) return 8;
			if(_equippedBelt.id == MetaEquipmentEnum.EQUIP_BELT_8.id) return 9;
			if(_equippedBelt.id == -1) return 1;
			return _equippedBelt.iconId-28;
		}
		
		public function get equippedWeapon() : MetaEquipment {
			return _equippedWeapon;
		}
		
		public function get equippedBracers() : MetaEquipment {
			return _equippedBracers;
		}
		
		public function get equippedBandana() : MetaEquipment {
			return _equippedBandana;
		}
		
		public function get equippedBelt() : MetaEquipment {
			return _equippedBelt;
		}
		
		public function get powerBonus() : Number {
			var bonus:Number = 0 ; 
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BRACERS_1)) bonus += 0.25;
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BANDANA_6)) bonus += 0.4;
			return bonus ;
		}
		
		public function get moneyBonus() : Number {
			var bonus:Number = 0 ;
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BRACERS_2)) bonus += 0.15; 
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BELT_4)) bonus += 0.3;
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BANDANA_5)) bonus += 0.3;
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BRACERS_8)) bonus += 0.2;
			
			return bonus ;
		}
		
		public function get xpBonus() : Number {
			var bonus:Number = 0 ;
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BANDANA_4)) bonus += 0.3; 
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BRACERS_2)) bonus += 0.15;
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BANDANA_5)) bonus += 0.3;
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BELT_6)) bonus += 1;
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BRACERS_7)) bonus += 1.5;
			//if(IsEquipped(MetaEquipmentEnum.EQUIP_BELT_6)) bonus += 0.4;
			
			return bonus ;
		}
		
		public function get nbHits():int {
			var cpt:int = 0;
			
			
			switch(xp.crntLevel) {
				case 1: cpt = HBConstants.HERO_HIT_AT_LVL_1; break ; 
				case 2: cpt = HBConstants.HERO_HIT_AT_LVL_2; break ;
				case 3: cpt = HBConstants.HERO_HIT_AT_LVL_3; break ;
				case 4: cpt = HBConstants.HERO_HIT_AT_LVL_4; break ;
				case 5: cpt = HBConstants.HERO_HIT_AT_LVL_5; break ;
				case 6: cpt = HBConstants.HERO_HIT_AT_LVL_6; break ;
				case 7: cpt = HBConstants.HERO_HIT_AT_LVL_7; break ;
				case 8: cpt = HBConstants.HERO_HIT_AT_LVL_8; break ;
				case 9: cpt = HBConstants.HERO_HIT_AT_LVL_9; break ;
				case 10: cpt = HBConstants.HERO_HIT_AT_LVL_10; break ;
				case 11: cpt = HBConstants.HERO_HIT_AT_LVL_11; break ;
				case 12: cpt = HBConstants.HERO_HIT_AT_LVL_12; break ;
				case 13: cpt = HBConstants.HERO_HIT_AT_LVL_13; break ;
				case 14: cpt = HBConstants.HERO_HIT_AT_LVL_14; break ;
				case 15: cpt = HBConstants.HERO_HIT_AT_LVL_15; break ;
				case 16: cpt = HBConstants.HERO_HIT_AT_LVL_16; break ;
				case 17: cpt = HBConstants.HERO_HIT_AT_LVL_17; break ;
				case 18: cpt = HBConstants.HERO_HIT_AT_LVL_18; break ;
				case 19: cpt = HBConstants.HERO_HIT_AT_LVL_19; break ;
				case 20: cpt = HBConstants.HERO_HIT_AT_LVL_20; break ;
				case 21: cpt = HBConstants.HERO_HIT_AT_LVL_21; break ;
				case 22: cpt = HBConstants.HERO_HIT_AT_LVL_22; break ;
				case 23: cpt = HBConstants.HERO_HIT_AT_LVL_23; break ;
				case 24: cpt = HBConstants.HERO_HIT_AT_LVL_24; break ;
				case 25: cpt = HBConstants.HERO_HIT_AT_LVL_25; break ;
			}
			
			if(totalPrecision >= 40) {
				cpt += HBConstants.HERO_HIT_AT_LVL_ACC_40_AND_BEYOND;  	
			} else {
				switch(totalPrecision) {
					case 0: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_0; break ;
					case 1: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_1; break ; 
					case 2: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_2; break ;
					case 3: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_3; break ;
					case 4: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_4; break ;
					case 5: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_5; break ;
					case 6: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_6; break ;
					case 7: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_7; break ;
					case 8: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_8; break ;
					case 9: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_9; break ;
					case 10: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_10; break ;
					case 11: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_11; break ;
					case 12: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_12; break ;
					case 13: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_13; break ;
					case 14: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_14; break ;
					case 15: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_15; break ;
					case 16: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_16; break ;
					case 17: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_17; break ;
					case 18: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_18; break ;
					case 19: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_19; break ;
					case 20: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_20; break ;
					case 21: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_21; break ;
					case 22: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_22; break ;
					case 23: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_23; break ;
					case 24: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_24; break ;
					case 25: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_25; break ;
					case 26: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_26; break ;
					case 27: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_27; break ;
					case 28: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_28; break ;
					case 29: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_29; break ;
					case 30: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_30; break ;
					case 31: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_31; break ;
					case 32: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_32; break ;
					case 33: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_33; break ;
					case 34: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_34; break ;
					case 35: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_35; break ;
					case 36: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_36; break ;
					case 37: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_37; break ;
					case 38: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_38; break ;
					case 39: cpt += HBConstants.HERO_HIT_AT_LVL_ACC_39; break ;
				}
			}
			
			
			
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BANDANA_3)) cpt += (cpt*.25); 
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BRACERS_4)) cpt += (cpt*.25);
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BRACERS_5)) cpt += (cpt*.50);
			if(IsEquipped(MetaEquipmentEnum.EQUIP_BRACERS_6)) cpt += (cpt*.50);
			
			return cpt;
		}
		
		public function get numDiamondSpent():int {
			var result:int = 0 ; 
			for(var i:int = 0 ; i < _metaEquipInventory.numItems ; i++) {
				var equip:MetaEquipment = MetaEquipment(_metaEquipInventory.GetItemAt(i));
				if(equip.isPremium) {
					result += equip.price ; 
				}	
			}
			return result;
		}
		
		public function RefreshInventory():void {
			if(!MetaEquipmentEnum.EQUIP_WEAPON_13.isLocked && !metaEquipInventory.HasItem(MetaEquipmentEnum.EQUIP_WEAPON_13)) metaEquipInventory.AddItem(MetaEquipmentEnum.EQUIP_WEAPON_13);
			if(!MetaEquipmentEnum.EQUIP_WEAPON_14.isLocked && !metaEquipInventory.HasItem(MetaEquipmentEnum.EQUIP_WEAPON_14)) metaEquipInventory.AddItem(MetaEquipmentEnum.EQUIP_WEAPON_14);
			if(!MetaEquipmentEnum.EQUIP_BRACERS_5.isLocked && !metaEquipInventory.HasItem(MetaEquipmentEnum.EQUIP_BRACERS_5)) metaEquipInventory.AddItem(MetaEquipmentEnum.EQUIP_BRACERS_5);
			if(!MetaEquipmentEnum.EQUIP_BRACERS_6.isLocked && !metaEquipInventory.HasItem(MetaEquipmentEnum.EQUIP_BRACERS_6)) metaEquipInventory.AddItem(MetaEquipmentEnum.EQUIP_BRACERS_6);
			if(!MetaEquipmentEnum.EQUIP_BANDANA_5.isLocked && !metaEquipInventory.HasItem(MetaEquipmentEnum.EQUIP_BANDANA_5)) metaEquipInventory.AddItem(MetaEquipmentEnum.EQUIP_BANDANA_5);
			if(!MetaEquipmentEnum.EQUIP_BANDANA_6.isLocked && !metaEquipInventory.HasItem(MetaEquipmentEnum.EQUIP_BANDANA_6)) metaEquipInventory.AddItem(MetaEquipmentEnum.EQUIP_BANDANA_6);
			if(!MetaEquipmentEnum.EQUIP_BELT_5.isLocked && !metaEquipInventory.HasItem(MetaEquipmentEnum.EQUIP_BELT_5)) metaEquipInventory.AddItem(MetaEquipmentEnum.EQUIP_BELT_5);
			if(!MetaEquipmentEnum.EQUIP_BELT_6.isLocked && !metaEquipInventory.HasItem(MetaEquipmentEnum.EQUIP_BELT_6)) metaEquipInventory.AddItem(MetaEquipmentEnum.EQUIP_BELT_6);		
		}
		
		public function get metaEquipInventory() : MetaEquipInventory {
			return _metaEquipInventory;
		}
		
		public function get hasBoughtEverythingNonPremium() : Boolean {
			for (var i:int = 0 ; i < MetaEquipmentEnum.numEquip ; i++) {
				var m:MetaEquipment = MetaEquipmentEnum.GetFromId(i);
				if(!m.isPremium && !_metaEquipInventory.HasItem(m) && m != MetaEquipmentEnum.EQUIP_NULL) return false;
			}  
			return true;
		}
		
		public function get hasReachUnlockThreshold() : Boolean {
			return _hasReachUnlockThreshold;
		}
		
		public function set hasReachUnlockThreshold(hasReachUnlockThreshold : Boolean) : void {
			_hasReachUnlockThreshold = hasReachUnlockThreshold;
		}
		
		public function get hasAttMaxed():Boolean {
			return (_control.isMaxed || _precision.isMaxed || _str.isMaxed);
		}
		
		public function get cash() : int {return _cash.value;}
		public function set cash(cash : int) : void {_cash.value = cash;}
		
		public function get controlVXBonus():Number {
			return (1+(HBConstants.HERO_CONTROL_VX_ON_HIT_BONUS/100)*control.upgradeValue);	
		}
		
		public function get controlVYBonus():Number {
			return (1+(HBConstants.HERO_CONTROL_VY_ON_HIT_BONUS/100)*control.upgradeValue);	
		}
		
		public function get autoForward():Boolean {
			return IsEquipped(MetaEquipmentEnum.EQUIP_BANDANA_1) || IsEquipped(MetaEquipmentEnum.EQUIP_BELT_3) || IsEquipped(MetaEquipmentEnum.EQUIP_BRACERS_5);	
		}
	}
}
