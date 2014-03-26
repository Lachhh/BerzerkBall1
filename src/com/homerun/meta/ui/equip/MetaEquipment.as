package com.homerun.meta.ui.equip {
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.homerun.io.AchievementManager;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.equip.engine.MetaInventoryItem;
	import com.lachhhEngine.io.encryption.SecureNumber;
	import com.lachhhEngine.multilingual.TextFactory;

	/**
	 * @author Lachhh
	 */
	public class MetaEquipment extends MetaInventoryItem{
		private var _powerBonus:SecureNumber = new SecureNumber();
		private var _strBonus:SecureNumber = new SecureNumber();
		private var _precisionBonus:SecureNumber = new SecureNumber();
		private var _controlBonus:SecureNumber = new SecureNumber();
		private var _titleId:int ;
		private var _descId:int ;
		private var _price:SecureNumber = new SecureNumber() ;
		private var _iconId:int ;
		private var _isPremium:Boolean ;
		private var _id:int ;
		
		public function MetaEquipment(id:int, titleId:int, descId:int, price:int, iconId:int, isPremium:Boolean = false, pPowerBonus:int = 0, pStrBonus:int = 0, pPrecisionBonus:int = 0, pControlBonus:int = 0) {
			_id = id;
			_titleId = titleId;
			_descId = descId;
			_price.value = price;
			_iconId = iconId;
			_isPremium = isPremium;
			powerBonus = pPowerBonus;
			strBonus = pStrBonus;
			precisionBonus = pPrecisionBonus;
			controlBonus = pControlBonus;
		}

		override public function Decode(s : String) : void {
			//Done in inventory
		}

		override public function Encode() : String {
			return id+ "";
		}

		public function get powerBonus() : int {return _powerBonus.value; }
		public function set powerBonus(powerBonus : int) : void {_powerBonus.value = powerBonus;}
		public function get strBonus() : int { return _strBonus.value;}
		public function set strBonus(strBonus : int) : void { _strBonus.value = strBonus;}
		public function get precisionBonus() : int { return _precisionBonus.value;}
		public function set precisionBonus(precisionBonus : int) : void { _precisionBonus.value = precisionBonus;}
		public function get controlBonus() : int { return _controlBonus.value; }
		public function set controlBonus(controlBonus : int) : void { _controlBonus.value = controlBonus;}
		
		public function get titleId() : int { return _titleId;}
		public function get descId() : int { return _descId;}
		public function get iconId() : int { return _iconId;}
		public function get price() : int {return _price.value;}
		
		public function get id() : int {
			return _id;
		}
		
		
		public function get isLockedToSponsor():Boolean {
			return HB_VersionInfo.showSponsorPromo && isPremium && price > MetaTrophyEnum.numDiamondTotal;
		}
		
		public function get isPremium() : Boolean {
			return _isPremium;
		}
		
		public function get isLocked():Boolean {
			return isPremium && HB_GameProgress.gameProgress.diamondTotal < price;	
		}
		
		protected function get DEBUGTypeName():String {
			if(this is MetaEquipBandana) return "BANDANA";
			if(this is MetaEquipWeapon) return "WEAPON";
			if(this is MetaEquipBracers) return "BRACERS";
			if(this is MetaEquipBelt) return "BELT";
			return "";
		}
		public function get DEBUGConstantCostName():String { return "static public var " + DEBUGTypeName + "_" + DEBUGTypeid + "_" + DEBUGNAme + "_COST:int = " + price + ";";}
		public function get DEBUGConstantPowerName():String { return "static public var " + DEBUGTypeName + "_" + DEBUGTypeid + "_" + DEBUGNAme + "_POWER:int = " + powerBonus + ";";}
		public function get DEBUGConstantStrengthName():String { return "static public var " + DEBUGTypeName + "_" + DEBUGTypeid + "_" + DEBUGNAme + "_STRENGTH:int = " + strBonus + ";";}
		public function get DEBUGConstantPrecisionName():String { return "static public var " + DEBUGTypeName + "_" + DEBUGTypeid + "_" + DEBUGNAme + "_PRECISION:int = " + precisionBonus + ";";}
		public function get DEBUGConstantControlName():String { return "static public var " + DEBUGTypeName + "_" + DEBUGTypeid + "_" + DEBUGNAme + "_CONTROL:int = " + controlBonus + ";";}
		private function get DEBUGTypeid():int {
			if(this is MetaEquipBandana) return id-14+1;
			if(this is MetaEquipWeapon) return id+1;
			if(this is MetaEquipBracers) return id-20+1;
			if(this is MetaEquipBelt) return id-26+1;
			return -1;
		}
		
		private function get DEBUGNAme():String {
			return TextFactory.instance.GetMsg(titleId).split(" ").join("_"); 		
		}
	}
}
