package com.homerun.meta.ui.equip {
	import com.homerun.constants.HBConstants;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.meta.ui.equip.engine.MetaInventory;
	import com.homerun.multilingual.HB_TextFactory;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.io.externalAPI.EmptyController;
	import com.lachhhEngine.io.externalAPI.ExternalAPIManager;

	/**
	 * @author Lachhh
	 */
	public class MetaEquipmentEnum {
		static private var _id:int = 0 ;
		static public const EQUIP_NULL:MetaEquipment = new MetaEquipment(-1, -1,-1,-1,-1,false,0,0,0,0);
		  
		static public const EQUIP_WEAPON_1:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_1, HB_TextFactory.ID_EQUIP_DESC_WEAPON_1, HBConstants.WEAPON_1_Fly_Swatter_COST, 1, false, 		HBConstants.WEAPON_1_Fly_Swatter_POWER, 	HBConstants.WEAPON_1_Fly_Swatter_STRENGTH, 	HBConstants.WEAPON_1_Fly_Swatter_PRECISION, 	HBConstants.WEAPON_1_Fly_Swatter_CONTROL);
		static public const EQUIP_WEAPON_2:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_2, HB_TextFactory.ID_EQUIP_DESC_WEAPON_2, HBConstants.WEAPON_2_Sausage_COST, 2, false,		 	HBConstants.WEAPON_2_Sausage_POWER, 		HBConstants.WEAPON_2_Sausage_STRENGTH, 		HBConstants.WEAPON_2_Sausage_PRECISION, 		HBConstants.WEAPON_2_Sausage_CONTROL);
		static public const EQUIP_WEAPON_3:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_3, HB_TextFactory.ID_EQUIP_DESC_WEAPON_3, HBConstants.WEAPON_3_Cricket_bat_COST, 3, false, 		HBConstants.WEAPON_3_Cricket_bat_POWER, 	HBConstants.WEAPON_3_Cricket_bat_STRENGTH, 	HBConstants.WEAPON_3_Cricket_bat_PRECISION, 	HBConstants.WEAPON_3_Cricket_bat_CONTROL);
		static public const EQUIP_WEAPON_4:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_4, HB_TextFactory.ID_EQUIP_DESC_WEAPON_4, HBConstants.WEAPON_4_Hockey_Stick_COST, 5, false, 		HBConstants.WEAPON_4_Hockey_Stick_POWER, 	HBConstants.WEAPON_4_Hockey_Stick_STRENGTH, HBConstants.WEAPON_4_Hockey_Stick_PRECISION, 	HBConstants.WEAPON_4_Hockey_Stick_CONTROL);
		static public const EQUIP_WEAPON_5:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_5, HB_TextFactory.ID_EQUIP_DESC_WEAPON_5, HBConstants.WEAPON_5_Baseball_bat_COST, 4, false, 		HBConstants.WEAPON_5_Baseball_bat_POWER, 	HBConstants.WEAPON_5_Baseball_bat_STRENGTH, HBConstants.WEAPON_5_Baseball_bat_PRECISION, 	HBConstants.WEAPON_5_Baseball_bat_CONTROL);
		static public const EQUIP_WEAPON_6:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_6, HB_TextFactory.ID_EQUIP_DESC_WEAPON_6, HBConstants.WEAPON_6_Guitar_COST, 8, false, 			HBConstants.WEAPON_6_Guitar_POWER, 			HBConstants.WEAPON_6_Guitar_STRENGTH, 		HBConstants.WEAPON_6_Guitar_PRECISION, 			HBConstants.WEAPON_6_Guitar_CONTROL);
		static public const EQUIP_WEAPON_7:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_7, HB_TextFactory.ID_EQUIP_DESC_WEAPON_7, HBConstants.WEAPON_7_Wrench_COST, 7, false, 			HBConstants.WEAPON_7_Wrench_POWER, 			HBConstants.WEAPON_7_Wrench_STRENGTH, 		HBConstants.WEAPON_7_Wrench_PRECISION, 			HBConstants.WEAPON_7_Wrench_CONTROL);
		static public const EQUIP_WEAPON_8:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_8, HB_TextFactory.ID_EQUIP_DESC_WEAPON_8, HBConstants.WEAPON_8_Shotgun_COST, 6, false, 			HBConstants.WEAPON_8_Shotgun_POWER, 		HBConstants.WEAPON_8_Shotgun_STRENGTH, 		HBConstants.WEAPON_8_Shotgun_PRECISION, 		HBConstants.WEAPON_8_Shotgun_CONTROL);
		static public const EQUIP_WEAPON_9:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_9, HB_TextFactory.ID_EQUIP_DESC_WEAPON_9, HBConstants.WEAPON_9_Mace_COST, 9, false, 				HBConstants.WEAPON_9_Mace_POWER, 			HBConstants.WEAPON_9_Mace_STRENGTH, 		HBConstants.WEAPON_9_Mace_PRECISION, 			HBConstants.WEAPON_9_Mace_CONTROL);
		static public const EQUIP_WEAPON_10:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_10, HB_TextFactory.ID_EQUIP_DESC_WEAPON_10, HBConstants.WEAPON_10_War_Hammer_COST, 10, false, 	HBConstants.WEAPON_10_War_Hammer_POWER, 	HBConstants.WEAPON_10_War_Hammer_STRENGTH, 	HBConstants.WEAPON_10_War_Hammer_PRECISION, 	HBConstants.WEAPON_10_War_Hammer_CONTROL);
		static public const EQUIP_WEAPON_11:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_11, HB_TextFactory.ID_EQUIP_DESC_WEAPON_11, HBConstants.WEAPON_11_Double_Axe_COST, 11, false, 	HBConstants.WEAPON_11_Double_Axe_POWER, 	HBConstants.WEAPON_11_Double_Axe_STRENGTH, 	HBConstants.WEAPON_11_Double_Axe_PRECISION, 	HBConstants.WEAPON_11_Double_Axe_CONTROL);
		static public const EQUIP_WEAPON_12:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_12, HB_TextFactory.ID_EQUIP_DESC_WEAPON_12, HBConstants.WEAPON_12_Frost_sword_COST, 12, false, 	HBConstants.WEAPON_12_Frost_sword_POWER, 	HBConstants.WEAPON_12_Frost_sword_STRENGTH, HBConstants.WEAPON_12_Frost_sword_PRECISION, 	HBConstants.WEAPON_12_Frost_sword_CONTROL);
		static public const EQUIP_WEAPON_13:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_13, HB_TextFactory.ID_EQUIP_DESC_WEAPON_13, HBConstants.WEAPON_13_Hell_sword_COST, 13, true, 	HBConstants.WEAPON_13_Hell_sword_POWER, 	HBConstants.WEAPON_13_Hell_sword_STRENGTH, 	HBConstants.WEAPON_13_Hell_sword_PRECISION, 	HBConstants.WEAPON_13_Hell_sword_CONTROL);
		static public const EQUIP_WEAPON_14:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_14, HB_TextFactory.ID_EQUIP_DESC_WEAPON_14, HBConstants.WEAPON_14_Dino_Smasher_COST, 14, true, 	HBConstants.WEAPON_14_Dino_Smasher_POWER, 	HBConstants.WEAPON_14_Dino_Smasher_STRENGTH, HBConstants.WEAPON_14_Dino_Smasher_PRECISION, 	HBConstants.WEAPON_14_Dino_Smasher_CONTROL, HB_SfxFactory.ID_SFX_WEAPON14_DINO);

		static public const EQUIP_BANDANA_1:MetaEquipBandana = new MetaEquipBandana(_id++, HB_TextFactory.ID_EQUIP_BANDANA_1, HB_TextFactory.ID_EQUIP_DESC_BANDANA_1, HBConstants.BANDANA_1_Beer_Bunk_Helmet_COST, 16, false, 	HBConstants.BANDANA_1_Beer_Bunk_Helmet_POWER, 	HBConstants.BANDANA_1_Beer_Bunk_Helmet_STRENGTH, 	HBConstants.BANDANA_1_Beer_Bunk_Helmet_PRECISION, 	HBConstants.BANDANA_1_Beer_Bunk_Helmet_CONTROL);
		static public const EQUIP_BANDANA_2:MetaEquipBandana = new MetaEquipBandana(_id++, HB_TextFactory.ID_EQUIP_BANDANA_2, HB_TextFactory.ID_EQUIP_DESC_BANDANA_2, HBConstants.BANDANA_2_Ninja_Bandana_COST, 17, false,		HBConstants.BANDANA_2_Ninja_Bandana_POWER, 		HBConstants.BANDANA_2_Ninja_Bandana_STRENGTH, 		HBConstants.BANDANA_2_Ninja_Bandana_PRECISION, 		HBConstants.BANDANA_2_Ninja_Bandana_CONTROL);
		static public const EQUIP_BANDANA_3:MetaEquipBandana = new MetaEquipBandana(_id++, HB_TextFactory.ID_EQUIP_BANDANA_3, HB_TextFactory.ID_EQUIP_DESC_BANDANA_3, HBConstants.BANDANA_3_Rambo_Head_Band_COST, 18, false, 	HBConstants.BANDANA_3_Rambo_Head_Band_POWER, 	HBConstants.BANDANA_3_Rambo_Head_Band_STRENGTH, 	HBConstants.BANDANA_3_Rambo_Head_Band_PRECISION, 	HBConstants.BANDANA_3_Rambo_Head_Band_CONTROL);
		static public const EQUIP_BANDANA_4:MetaEquipBandana = new MetaEquipBandana(_id++, HB_TextFactory.ID_EQUIP_BANDANA_4, HB_TextFactory.ID_EQUIP_DESC_BANDANA_4, HBConstants.BANDANA_4_Winged_hat_COST, 19, false, 		HBConstants.BANDANA_4_Winged_hat_POWER, 		HBConstants.BANDANA_4_Winged_hat_STRENGTH, 			HBConstants.BANDANA_4_Winged_hat_PRECISION, 		HBConstants.BANDANA_4_Winged_hat_CONTROL);
		static public const EQUIP_BANDANA_5:MetaEquipBandana = new MetaEquipBandana(_id++, HB_TextFactory.ID_EQUIP_BANDANA_5, HB_TextFactory.ID_EQUIP_DESC_BANDANA_5, HBConstants.BANDANA_5_Rock_Star_Head_Band_COST, 20, true, HBConstants.BANDANA_5_Rock_Star_Head_Band_POWER, HBConstants.BANDANA_5_Rock_Star_Head_Band_STRENGTH, HBConstants.BANDANA_5_Rock_Star_Head_Band_PRECISION, HBConstants.BANDANA_5_Rock_Star_Head_Band_CONTROL);
		static public const EQUIP_BANDANA_6:MetaEquipBandana = new MetaEquipBandana(_id++, HB_TextFactory.ID_EQUIP_BANDANA_6, HB_TextFactory.ID_EQUIP_DESC_BANDANA_6, HBConstants.BANDANA_6_Demon_Horns_COST, 21, true, 		HBConstants.BANDANA_6_Demon_Horns_POWER, 		HBConstants.BANDANA_6_Demon_Horns_STRENGTH, 		HBConstants.BANDANA_6_Demon_Horns_PRECISION, 		HBConstants.BANDANA_6_Demon_Horns_CONTROL);

		static public const EQUIP_BRACERS_1:MetaEquipBracers = new MetaEquipBracers(_id++, HB_TextFactory.ID_EQUIP_BRACERS_1, HB_TextFactory.ID_EQUIP_DESC_BRACERS_1, HBConstants.BRACERS_1_Metal_bracer_COST, 24, false, 		HBConstants.BRACERS_1_Metal_bracer_POWER, 		HBConstants.BRACERS_1_Metal_bracer_STRENGTH, 	HBConstants.BRACERS_1_Metal_bracer_PRECISION, 	HBConstants.BRACERS_1_Metal_bracer_CONTROL);
		static public const EQUIP_BRACERS_2:MetaEquipBracers = new MetaEquipBracers(_id++, HB_TextFactory.ID_EQUIP_BRACERS_2, HB_TextFactory.ID_EQUIP_DESC_BRACERS_2, HBConstants.BRACERS_2_Stud_bracer_COST, 25, false, 		HBConstants.BRACERS_2_Stud_bracer_POWER, 		HBConstants.BRACERS_2_Stud_bracer_STRENGTH, 	HBConstants.BRACERS_2_Stud_bracer_PRECISION, 	HBConstants.BRACERS_2_Stud_bracer_CONTROL);
		static public const EQUIP_BRACERS_3:MetaEquipBracers = new MetaEquipBracers(_id++, HB_TextFactory.ID_EQUIP_BRACERS_3, HB_TextFactory.ID_EQUIP_DESC_BRACERS_3, HBConstants.BRACERS_3_Leather_bracer_COST, 26, false, 	HBConstants.BRACERS_3_Leather_bracer_POWER, 	HBConstants.BRACERS_3_Leather_bracer_STRENGTH, HBConstants.BRACERS_3_Leather_bracer_PRECISION, 	HBConstants.BRACERS_3_Leather_bracer_CONTROL);
		static public const EQUIP_BRACERS_4:MetaEquipBracers = new MetaEquipBracers(_id++, HB_TextFactory.ID_EQUIP_BRACERS_4, HB_TextFactory.ID_EQUIP_DESC_BRACERS_4, HBConstants.BRACERS_4_Taped_barcer_COST, 23, false, 		HBConstants.BRACERS_4_Taped_barcer_POWER, 		HBConstants.BRACERS_4_Taped_barcer_STRENGTH, 	HBConstants.BRACERS_4_Taped_barcer_PRECISION, 	HBConstants.BRACERS_4_Taped_barcer_CONTROL);
		static public const EQUIP_BRACERS_5:MetaEquipBracers = new MetaEquipBracers(_id++, HB_TextFactory.ID_EQUIP_BRACERS_5, HB_TextFactory.ID_EQUIP_DESC_BRACERS_5, HBConstants.BRACERS_5_Alien_Watch_COST, 28, true, 		HBConstants.BRACERS_5_Alien_Watch_POWER, 		HBConstants.BRACERS_5_Alien_Watch_STRENGTH, 	HBConstants.BRACERS_5_Alien_Watch_PRECISION, 	HBConstants.BRACERS_5_Alien_Watch_CONTROL);
		static public const EQUIP_BRACERS_6:MetaEquipBracers = new MetaEquipBracers(_id++, HB_TextFactory.ID_EQUIP_BRACERS_6, HB_TextFactory.ID_EQUIP_DESC_BRACERS_6, HBConstants.BRACERS_6_Robot_Arm_COST, 27, true, 			HBConstants.BRACERS_6_Robot_Arm_POWER, 			HBConstants.BRACERS_6_Robot_Arm_STRENGTH, 		HBConstants.BRACERS_6_Robot_Arm_PRECISION, 		HBConstants.BRACERS_6_Robot_Arm_CONTROL);

		static public const EQUIP_BELT_1:MetaEquipBelt = new MetaEquipBelt(_id++, HB_TextFactory.ID_EQUIP_BELT_1, HB_TextFactory.ID_EQUIP_DESC_BELT_1, HBConstants.BELT_1_Bottle_of_Fat_COST, 30, false, 	HBConstants.BELT_1_Bottle_of_Fat_POWER, 	HBConstants.BELT_1_Bottle_of_Fat_STRENGTH, 		HBConstants.BELT_1_Bottle_of_Fat_PRECISION, 	HBConstants.BELT_1_Bottle_of_Fat_CONTROL);
		static public const EQUIP_BELT_2:MetaEquipBelt = new MetaEquipBelt(_id++, HB_TextFactory.ID_EQUIP_BELT_2, HB_TextFactory.ID_EQUIP_DESC_BELT_2, HBConstants.BELT_2_Beer_Belt_COST, 31, false, 		HBConstants.BELT_2_Beer_Belt_POWER, 		HBConstants.BELT_2_Beer_Belt_STRENGTH, 			HBConstants.BELT_2_Beer_Belt_PRECISION, 		HBConstants.BELT_2_Beer_Belt_CONTROL);
		static public const EQUIP_BELT_3:MetaEquipBelt = new MetaEquipBelt(_id++, HB_TextFactory.ID_EQUIP_BELT_3, HB_TextFactory.ID_EQUIP_DESC_BELT_3, HBConstants.BELT_3_Chain_Belt_COST, 32, false, 		HBConstants.BELT_3_Chain_Belt_POWER, 		HBConstants.BELT_3_Chain_Belt_STRENGTH, 		HBConstants.BELT_3_Chain_Belt_PRECISION, 		HBConstants.BELT_3_Chain_Belt_CONTROL);
		static public const EQUIP_BELT_4:MetaEquipBelt = new MetaEquipBelt(_id++, HB_TextFactory.ID_EQUIP_BELT_4, HB_TextFactory.ID_EQUIP_DESC_BELT_4, HBConstants.BELT_4_Wallet_Belt_COST, 33, false, 		HBConstants.BELT_4_Wallet_Belt_POWER, 		HBConstants.BELT_4_Wallet_Belt_STRENGTH, 		HBConstants.BELT_4_Wallet_Belt_PRECISION, 		HBConstants.BELT_4_Wallet_Belt_CONTROL);
		static public const EQUIP_BELT_5:MetaEquipBelt = new MetaEquipBelt(_id++, HB_TextFactory.ID_EQUIP_BELT_5, HB_TextFactory.ID_EQUIP_DESC_BELT_5, HBConstants.BELT_5_Walkman_COST, 35, true, 			HBConstants.BELT_5_Walkman_POWER, 			HBConstants.BELT_5_Walkman_STRENGTH, 			HBConstants.BELT_5_Walkman_PRECISION, 			HBConstants.BELT_5_Walkman_CONTROL);
		static public const EQUIP_BELT_6:MetaEquipBelt = new MetaEquipBelt(_id++, HB_TextFactory.ID_EQUIP_BELT_6, HB_TextFactory.ID_EQUIP_DESC_BELT_6, HBConstants.BELT_6_Sunflower_Seed_bag_COST, 34, true, HBConstants.BELT_6_Sunflower_Seed_bag_POWER, HBConstants.BELT_6_Sunflower_Seed_bag_STRENGTH, HBConstants.BELT_6_Sunflower_Seed_bag_PRECISION, HBConstants.BELT_6_Sunflower_Seed_bag_CONTROL);
		
		static public const EQUIP_XP_PILL:MetaEquipBelt = new MetaEquipBelt(_id++, HB_TextFactory.ID_EQUIP_XP_PILLS, HB_TextFactory.ID_EQUIP_DESC_XP_PILLS, HBConstants.XP_PILLS_COST, 37, false, 0, 0, 0, 0);

		static public const EQUIP_WEAPON_15:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_15, HB_TextFactory.ID_EQUIP_DESC_WEAPON_15, HBConstants.WEAPON_15_Sand_Shovel_COST, 46, false, 	HBConstants.WEAPON_15_Sand_Shovel_POWER, HBConstants.WEAPON_15_Sand_Shovel_STRENGTH, HBConstants.WEAPON_15_Sand_Shovel_PRECISION, 			HBConstants.WEAPON_15_Sand_Shovel_CONTROL);
		static public const EQUIP_WEAPON_16:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_16, HB_TextFactory.ID_EQUIP_DESC_WEAPON_16, HBConstants.WEAPON_16_Gorrila_Arm_COST, 47, false, 	HBConstants.WEAPON_16_Gorrila_Arm_POWER, HBConstants.WEAPON_16_Gorrila_Arm_STRENGTH, HBConstants.WEAPON_16_Gorrila_Arm_PRECISION, 			HBConstants.WEAPON_16_Gorrila_Arm_CONTROL);
		static public const EQUIP_WEAPON_17:MetaEquipWeapon = new MetaEquipWeapon(_id++, HB_TextFactory.ID_EQUIP_WEAPON_17, HB_TextFactory.ID_EQUIP_DESC_WEAPON_17, HBConstants.WEAPON_17_Grim_Scythe_COST, 48, true, 	HBConstants.WEAPON_17_Grim_Scythe_POWER, HBConstants.WEAPON_17_Grim_Scythe_STRENGTH, HBConstants.WEAPON_17_Grim_Scythe_PRECISION, 			HBConstants.WEAPON_17_Grim_Scythe_CONTROL, HB_SfxFactory.ID_SFX_WEAPON14_DINO);
		
		static public const EQUIP_BANDANA_7:MetaEquipBandana = new MetaEquipBandana(_id++, HB_TextFactory.ID_EQUIP_BANDANA_7, HB_TextFactory.ID_EQUIP_DESC_BANDANA_7, HBConstants.BANDANA_7_Mask_COST, 41, false, 		HBConstants.BANDANA_7_Mask_POWER, 			HBConstants.BANDANA_7_Mask_STRENGTH, 			HBConstants.BANDANA_7_Mask_PRECISION, 			HBConstants.BANDANA_7_Mask_CONTROL);
		static public const EQUIP_BANDANA_8:MetaEquipBandana = new MetaEquipBandana(_id++, HB_TextFactory.ID_EQUIP_BANDANA_8, HB_TextFactory.ID_EQUIP_DESC_BANDANA_8, HBConstants.BANDANA_8_Goaler_Mask_COST, 42, false, HBConstants.BANDANA_8_Goaler_Mask_POWER, 	HBConstants.BANDANA_8_Goaler_Mask_STRENGTH, 	HBConstants.BANDANA_8_Goaler_Mask_PRECISION, 	HBConstants.BANDANA_8_Goaler_Mask_CONTROL);

		static public const EQUIP_BRACERS_7:MetaEquipBracers = new MetaEquipBracers(_id++, HB_TextFactory.ID_EQUIP_BRACERS_7, HB_TextFactory.ID_EQUIP_DESC_BRACERS_7, HBConstants.BRACERS_7_Plaster_COST, 39, false, 	HBConstants.BRACERS_7_Plaster_POWER, 		HBConstants.BRACERS_7_Plaster_STRENGTH, 		HBConstants.BRACERS_7_Plaster_PRECISION, 		HBConstants.BRACERS_7_Plaster_CONTROL);
		static public const EQUIP_BRACERS_8:MetaEquipBracers = new MetaEquipBracers(_id++, HB_TextFactory.ID_EQUIP_BRACERS_8, HB_TextFactory.ID_EQUIP_DESC_BRACERS_8, HBConstants.BRACERS_8_Gold_Ring_COST, 40, false, 	HBConstants.BRACERS_8_Gold_Ring_POWER, 		HBConstants.BRACERS_8_Gold_Ring_STRENGTH, 		HBConstants.BRACERS_8_Gold_Ring_PRECISION, 		HBConstants.BRACERS_8_Gold_Ring_CONTROL);

		static public const EQUIP_BELT_7:MetaEquipBelt = new MetaEquipBelt(_id++, HB_TextFactory.ID_EQUIP_BELT_7, HB_TextFactory.ID_EQUIP_DESC_BELT_7, HBConstants.BELT_7_Ammo_belt_COST, 43, false, 				HBConstants.BELT_7_Ammo_belt_POWER, 			HBConstants.BELT_7_Ammo_belt_STRENGTH, 		HBConstants.BELT_7_Ammo_belt_PRECISION, 		HBConstants.BELT_7_Ammo_belt_CONTROL);
		static public const EQUIP_BELT_8:MetaEquipBelt = new MetaEquipBelt(_id++, HB_TextFactory.ID_EQUIP_BELT_8, HB_TextFactory.ID_EQUIP_DESC_BELT_8, HBConstants.BELT_8_Champion_Belt_COST, 44, false, 			HBConstants.BELT_8_Champion_Belt_POWER, 		HBConstants.BELT_8_Champion_Belt_STRENGTH, 	HBConstants.BELT_8_Champion_Belt_PRECISION, 	HBConstants.BELT_8_Champion_Belt_CONTROL);

		static public const SHOP_WEAPON_INVENTORY:MetaInventory = new MetaInventory();
		static public const SHOP_ITEM_INVENTORY:MetaInventory = new MetaInventory();
		static public const SHOP_PREMIUM_INVENTORY:MetaInventory = new MetaInventory();
		
		static public function Init():void {
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_1);
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_2);
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_15);
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_3);
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_4);
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_5);
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_6);
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_7);
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_8);
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_9);
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_10);
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_11);
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_16);
			SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_12);
			if(HB_VersionInfo.useViralFeature || !(ExternalAPIManager.premiumAPI is EmptyController)) {
				SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_13);
				SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_14);
				SHOP_WEAPON_INVENTORY.AddItem(EQUIP_WEAPON_17);
			}
			
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BELT_1);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BELT_2);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BELT_3);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BELT_4);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BELT_5);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BELT_6);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BELT_7);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BELT_8);
			
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BRACERS_1);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BRACERS_2);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BRACERS_3);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BRACERS_4);
			if(VersionInfo.exclusiveStuffVisible) {
				SHOP_ITEM_INVENTORY.AddItem(EQUIP_BRACERS_5);
				SHOP_ITEM_INVENTORY.AddItem(EQUIP_BRACERS_6);
			}
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BRACERS_7);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BRACERS_8);
			
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BANDANA_1);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BANDANA_2);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BANDANA_3);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BANDANA_4);
			if(VersionInfo.exclusiveStuffVisible) {
				SHOP_ITEM_INVENTORY.AddItem(EQUIP_BANDANA_5);
				SHOP_ITEM_INVENTORY.AddItem(EQUIP_BANDANA_6);
			}
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BANDANA_7);
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_BANDANA_8);
			
			SHOP_PREMIUM_INVENTORY.AddItem(EQUIP_WEAPON_13);
			SHOP_PREMIUM_INVENTORY.AddItem(EQUIP_WEAPON_14);
			SHOP_PREMIUM_INVENTORY.AddItem(EQUIP_WEAPON_17);
			
			SHOP_PREMIUM_INVENTORY.AddItem(EQUIP_BELT_5);
			SHOP_PREMIUM_INVENTORY.AddItem(EQUIP_BELT_6);
			
			SHOP_PREMIUM_INVENTORY.AddItem(EQUIP_BANDANA_5);
			SHOP_PREMIUM_INVENTORY.AddItem(EQUIP_BANDANA_6);
			
			SHOP_PREMIUM_INVENTORY.AddItem(EQUIP_BRACERS_5);
			SHOP_PREMIUM_INVENTORY.AddItem(EQUIP_BRACERS_6);
			
			SHOP_ITEM_INVENTORY.AddItem(EQUIP_XP_PILL);
		} 
		
		static public function GetFromId(id:int):MetaEquipment {
			switch(id) {
				case EQUIP_WEAPON_1.id : return EQUIP_WEAPON_1 ;
				case EQUIP_WEAPON_2.id : return EQUIP_WEAPON_2 ;
				case EQUIP_WEAPON_3.id : return EQUIP_WEAPON_3 ;
				case EQUIP_WEAPON_4.id : return EQUIP_WEAPON_4 ;
				case EQUIP_WEAPON_5.id : return EQUIP_WEAPON_5 ;
				case EQUIP_WEAPON_6.id : return EQUIP_WEAPON_6 ;
				case EQUIP_WEAPON_7.id : return EQUIP_WEAPON_7 ;
				case EQUIP_WEAPON_8.id : return EQUIP_WEAPON_8 ;
				case EQUIP_WEAPON_9.id : return EQUIP_WEAPON_9 ;
				case EQUIP_WEAPON_10.id : return EQUIP_WEAPON_10 ;
				case EQUIP_WEAPON_11.id : return EQUIP_WEAPON_11 ;
				case EQUIP_WEAPON_12.id : return EQUIP_WEAPON_12 ;
				case EQUIP_WEAPON_13.id : return EQUIP_WEAPON_13 ;
				case EQUIP_WEAPON_14.id : return EQUIP_WEAPON_14 ;
				case EQUIP_WEAPON_15.id : return EQUIP_WEAPON_15 ;
				case EQUIP_WEAPON_16.id : return EQUIP_WEAPON_16 ;
				case EQUIP_WEAPON_17.id : return EQUIP_WEAPON_17 ;
				
				case EQUIP_BELT_1.id : return EQUIP_BELT_1 ;
				case EQUIP_BELT_2.id : return EQUIP_BELT_2 ;
				case EQUIP_BELT_3.id : return EQUIP_BELT_3 ;
				case EQUIP_BELT_4.id : return EQUIP_BELT_4 ;
				case EQUIP_BELT_5.id : return EQUIP_BELT_5 ;
				case EQUIP_BELT_6.id : return EQUIP_BELT_6 ;
				case EQUIP_BELT_7.id : return EQUIP_BELT_7 ;
				case EQUIP_BELT_8.id : return EQUIP_BELT_8 ;
				
				case EQUIP_BRACERS_1.id : return EQUIP_BRACERS_1 ;
				case EQUIP_BRACERS_2.id : return EQUIP_BRACERS_2 ;
				case EQUIP_BRACERS_3.id : return EQUIP_BRACERS_3 ;
				case EQUIP_BRACERS_4.id : return EQUIP_BRACERS_4 ;
				case EQUIP_BRACERS_5.id : return EQUIP_BRACERS_5 ;
				case EQUIP_BRACERS_6.id : return EQUIP_BRACERS_6 ;
				case EQUIP_BRACERS_7.id : return EQUIP_BRACERS_7 ;
				case EQUIP_BRACERS_8.id : return EQUIP_BRACERS_8 ;
				
				case EQUIP_BANDANA_1.id : return EQUIP_BANDANA_1 ;
				case EQUIP_BANDANA_2.id : return EQUIP_BANDANA_2 ;
				case EQUIP_BANDANA_3.id : return EQUIP_BANDANA_3 ;
				case EQUIP_BANDANA_4.id : return EQUIP_BANDANA_4 ;
				case EQUIP_BANDANA_5.id : return EQUIP_BANDANA_5 ;
				case EQUIP_BANDANA_6.id : return EQUIP_BANDANA_6 ;
				case EQUIP_BANDANA_7.id : return EQUIP_BANDANA_7 ;
				case EQUIP_BANDANA_8.id : return EQUIP_BANDANA_8 ; 	
			}
			return EQUIP_NULL;
		}
		
		static public function get numEquip():int {
			return _id-1 ; 
		}
		
		static public function get numNormalEquip():int {
			var cpt:int = 0;
			for (var i:int =0 ; i < numEquip ; i++) {
				var e:MetaEquipment = GetFromId(i);
				if(!e.isPremium) cpt++;	
			} 
			return cpt ; 
		}
		
		static public function DEBUGTraceConstants():void {
			for (var i:int = 0 ; i < _id ; i++) {
				var m:MetaEquipment = GetFromId(i);
				trace(m.DEBUGConstantCostName);
				trace(m.DEBUGConstantPowerName);
				trace(m.DEBUGConstantStrengthName);
				trace(m.DEBUGConstantPrecisionName);
				trace(m.DEBUGConstantControlName);
				trace();
			} 
		} 
	}
}
