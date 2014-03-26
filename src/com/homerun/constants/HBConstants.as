package com.homerun.constants {
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	/**
	 * @author Lachhh
	 */
	public class HBConstants extends ExternalConstants {
		static private var _instance : HBConstants = new HBConstants();
		
		static public var HERO_XP:String = "0,1500,5250,12000,18600,32400,53400,85200,158775,237800,348725,503150,789600,1104000,1513600,2036800,2821560,3672480,4725000,6029520,7029520,8029520,9029520,10029520,11029520";
		static public var CASH_BONUS:Number = 10;
		static public var KILLER_SHOT_XP_BONUS:Number = 1000;
		static public var UNLOCK_DISTANCE_REQUIRED:Number = 100000;
		static public var GEEK_MASS:Number = 75;
		static public var CASH_DISTANCE_RATIO:Number = 0.1;
		static public var XP_DISTANCE_RATIO:Number = 5;
		static public var HERO_POWER_PRCT_BONUS_PER_STRENGHT:Number = 1;
		static public var HERO_POWER_ADD_BONUS_PER_STRENGHT:Number = 1;
		static public var HERO_HIT_AT_LVL_ACC_0:Number = 0;
		static public var HERO_HIT_AT_LVL_ACC_1:Number = 0;
		static public var HERO_HIT_AT_LVL_ACC_2:Number = 0;
		static public var HERO_HIT_AT_LVL_ACC_3:Number = 1;
		static public var HERO_HIT_AT_LVL_ACC_4:Number = 1;
		static public var HERO_HIT_AT_LVL_ACC_5:Number = 1;
		static public var HERO_HIT_AT_LVL_ACC_6:Number = 2;
		static public var HERO_HIT_AT_LVL_ACC_7:Number = 2;
		static public var HERO_HIT_AT_LVL_ACC_8:Number = 2;
		static public var HERO_HIT_AT_LVL_ACC_9:Number = 3;
		static public var HERO_HIT_AT_LVL_ACC_10:Number = 3;
		static public var HERO_HIT_AT_LVL_ACC_11:Number = 3;
		static public var HERO_HIT_AT_LVL_ACC_12:Number = 4;
		static public var HERO_HIT_AT_LVL_ACC_13:Number = 4;
		static public var HERO_HIT_AT_LVL_ACC_14:Number = 4;
		static public var HERO_HIT_AT_LVL_ACC_15:Number = 5;
		static public var HERO_HIT_AT_LVL_ACC_16:Number = 5;
		static public var HERO_HIT_AT_LVL_ACC_17:Number = 5;
		static public var HERO_HIT_AT_LVL_ACC_18:Number = 6;
		static public var HERO_HIT_AT_LVL_ACC_19:Number = 6;
		static public var HERO_HIT_AT_LVL_ACC_20:Number = 6;
		static public var HERO_HIT_AT_LVL_ACC_21:Number = 6;
		static public var HERO_HIT_AT_LVL_ACC_22:Number = 7;
		static public var HERO_HIT_AT_LVL_ACC_23:Number = 7;
		static public var HERO_HIT_AT_LVL_ACC_24:Number = 7;
		static public var HERO_HIT_AT_LVL_ACC_25:Number = 7;
		static public var HERO_HIT_AT_LVL_ACC_26:Number = 8;
		static public var HERO_HIT_AT_LVL_ACC_27:Number = 8;
		static public var HERO_HIT_AT_LVL_ACC_28:Number = 8;
		static public var HERO_HIT_AT_LVL_ACC_29:Number = 8;
		static public var HERO_HIT_AT_LVL_ACC_30:Number = 9;
		static public var HERO_HIT_AT_LVL_ACC_31:Number = 9;
		static public var HERO_HIT_AT_LVL_ACC_32:Number = 9;
		static public var HERO_HIT_AT_LVL_ACC_33:Number = 9;
		static public var HERO_HIT_AT_LVL_ACC_34:Number = 9;
		static public var HERO_HIT_AT_LVL_ACC_35:Number = 10;
		static public var HERO_HIT_AT_LVL_ACC_36:Number = 10;
		static public var HERO_HIT_AT_LVL_ACC_37:Number = 10;
		static public var HERO_HIT_AT_LVL_ACC_38:Number = 10;
		static public var HERO_HIT_AT_LVL_ACC_39:Number = 10;
		static public var HERO_HIT_AT_LVL_ACC_40_AND_BEYOND:Number = 10;
		static public var HERO_CONTROL_VX_ON_HIT_BONUS:Number = 4;
		static public var HERO_CONTROL_VY_ON_HIT_BONUS:Number = 2;
		static public var HERO_PTS_AT_LVL_1:Number = 6;
		static public var HERO_PTS_AT_LVL_2:Number = 8;
		static public var HERO_PTS_AT_LVL_3:Number = 10;
		static public var HERO_PTS_AT_LVL_4:Number = 12;
		static public var HERO_PTS_AT_LVL_5:Number = 14;
		static public var HERO_PTS_AT_LVL_6:Number = 16;
		static public var HERO_PTS_AT_LVL_7:Number = 18;
		static public var HERO_PTS_AT_LVL_8:Number = 20;
		static public var HERO_PTS_AT_LVL_9:Number = 22;
		static public var HERO_PTS_AT_LVL_10:Number = 24;
		static public var HERO_PTS_AT_LVL_11:Number = 26;
		static public var HERO_PTS_AT_LVL_12:Number = 28;
		static public var HERO_PTS_AT_LVL_13:Number = 29;
		static public var HERO_PTS_AT_LVL_14:Number = 30;
		static public var HERO_PTS_AT_LVL_15:Number = 31;
		static public var HERO_PTS_AT_LVL_16:Number = 32;
		static public var HERO_PTS_AT_LVL_17:Number = 33;
		static public var HERO_PTS_AT_LVL_18:Number = 34;
		static public var HERO_PTS_AT_LVL_19:Number = 35;
		static public var HERO_PTS_AT_LVL_20:Number = 36;
		static public var HERO_PTS_AT_LVL_21:Number = 37;
		static public var HERO_PTS_AT_LVL_22:Number = 38;
		static public var HERO_PTS_AT_LVL_23:Number = 39;
		static public var HERO_PTS_AT_LVL_24:Number = 40;
		static public var HERO_PTS_AT_LVL_25:Number = 41;
		
		static public var HERO_HIT_AT_LVL_1:Number = 0;
		static public var HERO_HIT_AT_LVL_2:Number = 0;
		static public var HERO_HIT_AT_LVL_3:Number = 0;
		static public var HERO_HIT_AT_LVL_4:Number = 0;
		static public var HERO_HIT_AT_LVL_5:Number = 0;
		static public var HERO_HIT_AT_LVL_6:Number = 0;
		static public var HERO_HIT_AT_LVL_7:Number = 0;
		static public var HERO_HIT_AT_LVL_8:Number = 0;
		static public var HERO_HIT_AT_LVL_9:Number = 0;
		static public var HERO_HIT_AT_LVL_10:Number = 0;
		static public var HERO_HIT_AT_LVL_11:Number = 0;
		static public var HERO_HIT_AT_LVL_12:Number = 0;
		static public var HERO_HIT_AT_LVL_13:Number = 0;
		static public var HERO_HIT_AT_LVL_14:Number = 0;
		static public var HERO_HIT_AT_LVL_15:Number = 0;
		static public var HERO_HIT_AT_LVL_16:Number = 0;
		static public var HERO_HIT_AT_LVL_17:Number = 0;
		static public var HERO_HIT_AT_LVL_18:Number = 0;
		static public var HERO_HIT_AT_LVL_19:Number = 0;
		static public var HERO_HIT_AT_LVL_20:Number = 0;
		static public var HERO_HIT_AT_LVL_21:Number = 0;
		static public var HERO_HIT_AT_LVL_22:Number = 0;
		static public var HERO_HIT_AT_LVL_23:Number = 0;
		static public var HERO_HIT_AT_LVL_24:Number = 0;
		static public var HERO_HIT_AT_LVL_25:Number = 0;
		static public var HERO_HIT_VX_MUL:Number = 1.3;
		static public var HERO_HIT_VY_MUL:Number = 1;
		static public var HERO_HIT_VX_ADD:Number = 40;
		static public var HERO_HIT_VY_ADD:Number = 20;
		static public var HERO_HIT_VX_MUL_PER_STR:Number = 7;
		static public var HERO_HIT_VY_MUL_PER_STR:Number = 2.5;
		static public var HERO_LACHHH_STARTING_STR:Number = 1;
		static public var HERO_LACHHH_STARTING_ACC:Number = 2;
		static public var HERO_LACHHH_STARTING_CON:Number = 3;
		static public var HERO_LACHHH_MAX_STR:Number = 8;
		static public var HERO_LACHHH_MAX_ACC:Number = 12;
		static public var HERO_LACHHH_MAX_CON:Number = 16;
		static public var HERO_MARC_STARTING_STR:Number = 2;
		static public var HERO_MARC_STARTING_ACC:Number = 3;
		static public var HERO_MARC_STARTING_CON:Number = 1;
		static public var HERO_MARC_MAX_STR:Number = 12;
		static public var HERO_MARC_MAX_ACC:Number = 16;
		static public var HERO_MARC_MAX_CON:Number = 8;
		static public var HERO_ETIENNE_STARTING_STR:Number = 3;
		static public var HERO_ETIENNE_STARTING_ACC:Number = 1;
		static public var HERO_ETIENNE_STARTING_CON:Number = 2;
		static public var HERO_ETIENNE_MAX_STR:Number = 16;
		static public var HERO_ETIENNE_MAX_ACC:Number = 8;
		static public var HERO_ETIENNE_MAX_CON:Number = 12;
		static public var HERO_MATHIEU_STARTING_STR:Number = 1;
		static public var HERO_MATHIEU_STARTING_ACC:Number = 3;
		static public var HERO_MATHIEU_STARTING_CON:Number = 2;
		static public var HERO_MATHIEU_MAX_STR:Number = 8;
		static public var HERO_MATHIEU_MAX_ACC:Number = 16;
		static public var HERO_MATHIEU_MAX_CON:Number = 12;
		static public var HERO_BALLON_STARTING_STR:Number = 3;
		static public var HERO_BALLON_STARTING_ACC:Number = 2;
		static public var HERO_BALLON_STARTING_CON:Number = 1;
		static public var HERO_BALLON_MAX_STR:Number = 16;
		static public var HERO_BALLON_MAX_ACC:Number = 12;
		static public var HERO_BALLON_MAX_CON:Number = 8;
		static public var HERO_TITI_STARTING_STR:Number = 2;
		static public var HERO_TITI_STARTING_ACC:Number = 1;
		static public var HERO_TITI_STARTING_CON:Number = 3;
		static public var HERO_TITI_MAX_STR:Number = 12;
		static public var HERO_TITI_MAX_ACC:Number = 8;
		static public var HERO_TITI_MAX_CON:Number = 16;
		
		static public var HERO_DENIZE_STARTING_STR:Number = 2;
		static public var HERO_DENIZE_STARTING_ACC:Number = 2;
		static public var HERO_DENIZE_STARTING_CON:Number = 2;
		static public var HERO_DENIZE_MAX_STR:Number = 12;
		static public var HERO_DENIZE_MAX_ACC:Number = 12;
		static public var HERO_DENIZE_MAX_CON:Number = 12;
		
		static public var ENEMY_BEE_VX_BONUS:Number = 0;
		static public var ENEMY_BEE_VY_BONUS:Number = 25;
		static public var ENEMY_BERZERKER_VX_BONUS:Number = 80;
		static public var ENEMY_BERZERKER_VY_BONUS:Number = 50;
		static public var ENEMY_MECHCOMM_VX_BONUS:Number = 100;
		static public var ENEMY_MECHCOMM_VY_BONUS:Number = 50;
		static public var ENEMY_MINE_VX_BONUS:Number = 15;
		static public var ENEMY_MINE_VY_BONUS:Number = 50;
		static public var ENEMY_SPIDER_VX_BONUS:Number = 10;
		static public var ENEMY_SPIDER_VY_BONUS:Number = 10;
		static public var ENEMY_CANON_FORCE_BONUS:Number = 50;
		static public var ENEMY_BEE_RATE:Number = 22;
		static public var ENEMY_BERZERKER_RATE:Number = 3;
		static public var ENEMY_BLOB_RATE:Number = 4;
		static public var ENEMY_CANON_RATE:Number = 5;
		static public var ENEMY_CEZAR_RATE:Number = 0;
		static public var ENEMY_COIN_RATE:Number = 15;
		static public var ENEMY_MECHCOMM_RATE:Number = 4;
		static public var ENEMY_MINE_RATE:Number = 8;
		static public var ENEMY_SPIDER_RATE:Number = 11;
		static public var WEAPON_1_Fly_Swatter_COST:Number = 0;
		static public var WEAPON_1_Fly_Swatter_POWER:Number = 15;
		static public var WEAPON_1_Fly_Swatter_STRENGTH:Number = 0;
		static public var WEAPON_1_Fly_Swatter_PRECISION:Number = 0;
		static public var WEAPON_1_Fly_Swatter_CONTROL:Number = 0;
		static public var WEAPON_2_Sausage_COST:Number = 250;
		static public var WEAPON_2_Sausage_POWER:Number = 18;
		static public var WEAPON_2_Sausage_STRENGTH:Number = 0;
		static public var WEAPON_2_Sausage_PRECISION:Number = 0;
		static public var WEAPON_2_Sausage_CONTROL:Number = 0;
		static public var WEAPON_3_Cricket_bat_COST:Number = 1250;
		static public var WEAPON_3_Cricket_bat_POWER:Number = 25;
		static public var WEAPON_3_Cricket_bat_STRENGTH:Number = -1;
		static public var WEAPON_3_Cricket_bat_PRECISION:Number = 0;
		static public var WEAPON_3_Cricket_bat_CONTROL:Number = 2;
		static public var WEAPON_4_Hockey_Stick_COST:Number = 1250;
		static public var WEAPON_4_Hockey_Stick_POWER:Number = 25;
		static public var WEAPON_4_Hockey_Stick_STRENGTH:Number = 0;
		static public var WEAPON_4_Hockey_Stick_PRECISION:Number = 2;
		static public var WEAPON_4_Hockey_Stick_CONTROL:Number = -1;
		static public var WEAPON_5_Baseball_bat_COST:Number = 1250;
		static public var WEAPON_5_Baseball_bat_POWER:Number = 25;
		static public var WEAPON_5_Baseball_bat_STRENGTH:Number = 2;
		static public var WEAPON_5_Baseball_bat_PRECISION:Number = -1;
		static public var WEAPON_5_Baseball_bat_CONTROL:Number = 0;
		static public var WEAPON_6_Guitar_COST:Number = 2500;
		static public var WEAPON_6_Guitar_POWER:Number = 35;
		static public var WEAPON_6_Guitar_STRENGTH:Number = -1;
		static public var WEAPON_6_Guitar_PRECISION:Number = 0;
		static public var WEAPON_6_Guitar_CONTROL:Number = 3;
		static public var WEAPON_7_Wrench_COST:Number = 2500;
		static public var WEAPON_7_Wrench_POWER:Number = 35;
		static public var WEAPON_7_Wrench_STRENGTH:Number = 0;
		static public var WEAPON_7_Wrench_PRECISION:Number = 3;
		static public var WEAPON_7_Wrench_CONTROL:Number = -1;
		static public var WEAPON_8_Shotgun_COST:Number = 2500;
		static public var WEAPON_8_Shotgun_POWER:Number = 35;
		static public var WEAPON_8_Shotgun_STRENGTH:Number = 3;
		static public var WEAPON_8_Shotgun_PRECISION:Number = -1;
		static public var WEAPON_8_Shotgun_CONTROL:Number = 0;
		static public var WEAPON_9_Mace_COST:Number = 5000;
		static public var WEAPON_9_Mace_POWER:Number = 45;
		static public var WEAPON_9_Mace_STRENGTH:Number = -2;
		static public var WEAPON_9_Mace_PRECISION:Number = 0;
		static public var WEAPON_9_Mace_CONTROL:Number = 4;
		static public var WEAPON_10_War_Hammer_COST:Number = 5000;
		static public var WEAPON_10_War_Hammer_POWER:Number = 45;
		static public var WEAPON_10_War_Hammer_STRENGTH:Number = 4;
		static public var WEAPON_10_War_Hammer_PRECISION:Number = -2;
		static public var WEAPON_10_War_Hammer_CONTROL:Number = 0;
		static public var WEAPON_11_Double_Axe_COST:Number = 5000;
		static public var WEAPON_11_Double_Axe_POWER:Number = 45;
		static public var WEAPON_11_Double_Axe_STRENGTH:Number = 0;
		static public var WEAPON_11_Double_Axe_PRECISION:Number = 4;
		static public var WEAPON_11_Double_Axe_CONTROL:Number = -2;
		static public var WEAPON_12_Frost_sword_COST:Number = 10000;
		static public var WEAPON_12_Frost_sword_POWER:Number = 50;
		static public var WEAPON_12_Frost_sword_STRENGTH:Number = 4;
		static public var WEAPON_12_Frost_sword_PRECISION:Number = 4;
		static public var WEAPON_12_Frost_sword_CONTROL:Number = 4;
		static public var WEAPON_13_Hell_sword_COST:Number = 1000;
		static public var WEAPON_13_Hell_sword_POWER:Number = 62;
		static public var WEAPON_13_Hell_sword_STRENGTH:Number = 6;
		static public var WEAPON_13_Hell_sword_PRECISION:Number = 6;
		static public var WEAPON_13_Hell_sword_CONTROL:Number = 6;
		static public var WEAPON_14_Dino_Smasher_COST:Number = 1000;
		static public var WEAPON_14_Dino_Smasher_POWER:Number = 85;
		static public var WEAPON_14_Dino_Smasher_STRENGTH:Number = 24;
		static public var WEAPON_14_Dino_Smasher_PRECISION:Number = -6;
		static public var WEAPON_14_Dino_Smasher_CONTROL:Number = -6;
		
		static public var WEAPON_15_Sand_Shovel_COST:Number = 1250;
		static public var WEAPON_15_Sand_Shovel_POWER:Number = 28;
		static public var WEAPON_15_Sand_Shovel_STRENGTH:Number = -1;
		static public var WEAPON_15_Sand_Shovel_PRECISION:Number = 0;
		static public var WEAPON_15_Sand_Shovel_CONTROL:Number = 1;
		
		static public var WEAPON_16_Gorrila_Arm_COST:Number = 10000;
		static public var WEAPON_16_Gorrila_Arm_POWER:Number = 50;
		static public var WEAPON_16_Gorrila_Arm_STRENGTH:Number = 12;
		static public var WEAPON_16_Gorrila_Arm_PRECISION:Number = 0;
		static public var WEAPON_16_Gorrila_Arm_CONTROL:Number = 0;
		
		static public var WEAPON_17_Grim_Scythe_COST:Number = 1350;
		static public var WEAPON_17_Grim_Scythe_POWER:Number = 75;
		static public var WEAPON_17_Grim_Scythe_STRENGTH:Number = 5;
		static public var WEAPON_17_Grim_Scythe_PRECISION:Number = 7;
		static public var WEAPON_17_Grim_Scythe_CONTROL:Number = 5;
		
		static public var BANDANA_1_Beer_Bunk_Helmet_COST:Number = 1000;
		static public var BANDANA_1_Beer_Bunk_Helmet_POWER:Number = 0;
		static public var BANDANA_1_Beer_Bunk_Helmet_STRENGTH:Number = 2;
		static public var BANDANA_1_Beer_Bunk_Helmet_PRECISION:Number = 1;
		static public var BANDANA_1_Beer_Bunk_Helmet_CONTROL:Number = 1;
		static public var BANDANA_2_Ninja_Bandana_COST:Number = 1000;
		static public var BANDANA_2_Ninja_Bandana_POWER:Number = 0;
		static public var BANDANA_2_Ninja_Bandana_STRENGTH:Number = 2;
		static public var BANDANA_2_Ninja_Bandana_PRECISION:Number = -1;
		static public var BANDANA_2_Ninja_Bandana_CONTROL:Number = 0;
		static public var BANDANA_3_Rambo_Head_Band_COST:Number = 1000;
		static public var BANDANA_3_Rambo_Head_Band_POWER:Number = 0;
		static public var BANDANA_3_Rambo_Head_Band_STRENGTH:Number = -1;
		static public var BANDANA_3_Rambo_Head_Band_PRECISION:Number = 0;
		static public var BANDANA_3_Rambo_Head_Band_CONTROL:Number = 2;
		static public var BANDANA_4_Winged_hat_COST:Number = 1000;
		static public var BANDANA_4_Winged_hat_POWER:Number = 0;
		static public var BANDANA_4_Winged_hat_STRENGTH:Number = 0;
		static public var BANDANA_4_Winged_hat_PRECISION:Number = 2;
		static public var BANDANA_4_Winged_hat_CONTROL:Number = -1;
		static public var BANDANA_5_Rock_Star_Head_Band_COST:Number = 750;
		static public var BANDANA_5_Rock_Star_Head_Band_POWER:Number = 0;
		static public var BANDANA_5_Rock_Star_Head_Band_STRENGTH:Number = 2;
		static public var BANDANA_5_Rock_Star_Head_Band_PRECISION:Number = 2;
		static public var BANDANA_5_Rock_Star_Head_Band_CONTROL:Number = 2;
		static public var BANDANA_6_Demon_Horns_COST:Number = 750;
		static public var BANDANA_6_Demon_Horns_POWER:Number = 0;
		static public var BANDANA_6_Demon_Horns_STRENGTH:Number = 2;
		static public var BANDANA_6_Demon_Horns_PRECISION:Number = 2;
		static public var BANDANA_6_Demon_Horns_CONTROL:Number = 2;
		
		static public var BANDANA_7_Mask_COST:Number = 1000;
		static public var BANDANA_7_Mask_POWER:Number = 0;
		static public var BANDANA_7_Mask_STRENGTH:Number = 1;
		static public var BANDANA_7_Mask_PRECISION:Number = 1;
		static public var BANDANA_7_Mask_CONTROL:Number = -2;
		
		static public var BANDANA_8_Goaler_Mask_COST:Number = 1000;
		static public var BANDANA_8_Goaler_Mask_POWER:Number = 0;
		static public var BANDANA_8_Goaler_Mask_STRENGTH:Number = 3;
		static public var BANDANA_8_Goaler_Mask_PRECISION:Number = 2;
		static public var BANDANA_8_Goaler_Mask_CONTROL:Number = -1;
		
		static public var BRACERS_1_Metal_bracer_COST:Number = 1000;
		static public var BRACERS_1_Metal_bracer_POWER:Number = 0;
		static public var BRACERS_1_Metal_bracer_STRENGTH:Number = 0;
		static public var BRACERS_1_Metal_bracer_PRECISION:Number = -1;
		static public var BRACERS_1_Metal_bracer_CONTROL:Number = 2;
		static public var BRACERS_2_Stud_bracer_COST:Number = 1000;
		static public var BRACERS_2_Stud_bracer_POWER:Number = 0;
		static public var BRACERS_2_Stud_bracer_STRENGTH:Number = 1;
		static public var BRACERS_2_Stud_bracer_PRECISION:Number = 1;
		static public var BRACERS_2_Stud_bracer_CONTROL:Number = 2;
		static public var BRACERS_3_Leather_bracer_COST:Number = 1000;
		static public var BRACERS_3_Leather_bracer_POWER:Number = 0;
		static public var BRACERS_3_Leather_bracer_STRENGTH:Number = -1;
		static public var BRACERS_3_Leather_bracer_PRECISION:Number = 2;
		static public var BRACERS_3_Leather_bracer_CONTROL:Number = 0;
		static public var BRACERS_4_Taped_barcer_COST:Number = 1000;
		static public var BRACERS_4_Taped_barcer_POWER:Number = 0;
		static public var BRACERS_4_Taped_barcer_STRENGTH:Number = 2;
		static public var BRACERS_4_Taped_barcer_PRECISION:Number = 0;
		static public var BRACERS_4_Taped_barcer_CONTROL:Number = -1;
		static public var BRACERS_5_Alien_Watch_COST:Number = 500;
		static public var BRACERS_5_Alien_Watch_POWER:Number = 0;
		static public var BRACERS_5_Alien_Watch_STRENGTH:Number = 2;
		static public var BRACERS_5_Alien_Watch_PRECISION:Number = 2;
		static public var BRACERS_5_Alien_Watch_CONTROL:Number = 2;
		static public var BRACERS_6_Robot_Arm_COST:Number = 500;
		static public var BRACERS_6_Robot_Arm_POWER:Number = 0;
		static public var BRACERS_6_Robot_Arm_STRENGTH:Number = 2;
		static public var BRACERS_6_Robot_Arm_PRECISION:Number = 2;
		static public var BRACERS_6_Robot_Arm_CONTROL:Number = 2;
		
		static public var BRACERS_7_Plaster_COST:Number = 1000;
		static public var BRACERS_7_Plaster_POWER:Number = 0;
		static public var BRACERS_7_Plaster_STRENGTH:Number = -3;
		static public var BRACERS_7_Plaster_PRECISION:Number = -3;
		static public var BRACERS_7_Plaster_CONTROL:Number = -3;
		
		static public var BRACERS_8_Gold_Ring_COST:Number = 500;
		static public var BRACERS_8_Gold_Ring_POWER:Number = 0;
		static public var BRACERS_8_Gold_Ring_STRENGTH:Number = 1;
		static public var BRACERS_8_Gold_Ring_PRECISION:Number = 2;
		static public var BRACERS_8_Gold_Ring_CONTROL:Number = -1;
		
		static public var BELT_1_Bottle_of_Fat_COST:Number = 1000;
		static public var BELT_1_Bottle_of_Fat_POWER:Number = 0;
		static public var BELT_1_Bottle_of_Fat_STRENGTH:Number = 2;
		static public var BELT_1_Bottle_of_Fat_PRECISION:Number = -1;
		static public var BELT_1_Bottle_of_Fat_CONTROL:Number = 0;
		static public var BELT_2_Beer_Belt_COST:Number = 1000;
		static public var BELT_2_Beer_Belt_POWER:Number = 0;
		static public var BELT_2_Beer_Belt_STRENGTH:Number = -1;
		static public var BELT_2_Beer_Belt_PRECISION:Number = 0;
		static public var BELT_2_Beer_Belt_CONTROL:Number = 2;
		static public var BELT_3_Chain_Belt_COST:Number = 1000;
		static public var BELT_3_Chain_Belt_POWER:Number = 0;
		static public var BELT_3_Chain_Belt_STRENGTH:Number = 1;
		static public var BELT_3_Chain_Belt_PRECISION:Number = 2;
		static public var BELT_3_Chain_Belt_CONTROL:Number = 1;
		static public var BELT_4_Wallet_Belt_COST:Number = 1000;
		static public var BELT_4_Wallet_Belt_POWER:Number = 0;
		static public var BELT_4_Wallet_Belt_STRENGTH:Number = 0;
		static public var BELT_4_Wallet_Belt_PRECISION:Number = 2;
		static public var BELT_4_Wallet_Belt_CONTROL:Number = -1;
		static public var BELT_5_Walkman_COST:Number = 250;
		static public var BELT_5_Walkman_POWER:Number = 0;
		static public var BELT_5_Walkman_STRENGTH:Number = 5;
		static public var BELT_5_Walkman_PRECISION:Number = 5;
		static public var BELT_5_Walkman_CONTROL:Number = 5;
		static public var BELT_6_Sunflower_Seed_bag_COST:Number = 250;
		static public var BELT_6_Sunflower_Seed_bag_POWER:Number = 0;
		static public var BELT_6_Sunflower_Seed_bag_STRENGTH:Number = 2;
		static public var BELT_6_Sunflower_Seed_bag_PRECISION:Number = 2;
		static public var BELT_6_Sunflower_Seed_bag_CONTROL:Number = 2;
		
		static public var BELT_7_Ammo_belt_COST:Number = 1000;
		static public var BELT_7_Ammo_belt_POWER:Number = 0;
		static public var BELT_7_Ammo_belt_STRENGTH:Number = -3;
		static public var BELT_7_Ammo_belt_PRECISION:Number = 1;
		static public var BELT_7_Ammo_belt_CONTROL:Number = 1;
		
		static public var BELT_8_Champion_Belt_COST:Number = 1000;
		static public var BELT_8_Champion_Belt_POWER:Number = 0;
		static public var BELT_8_Champion_Belt_STRENGTH:Number = 1;
		static public var BELT_8_Champion_Belt_PRECISION:Number = 1;
		static public var BELT_8_Champion_Belt_CONTROL:Number = 2;
		
		static public var XP_PILLS_COST:Number = 2000;
		static public var XP_PILLS_XP_BONUS:Number = 50000;

				
				
		public function HBConstants() {
			super();
		}
		
		static public function GetSlaveXpArray():Array {
			return HERO_XP.split(",");
		}
		
		static public function GetSlaveLvl(xp : int) : int {
			var lvl : int = 0 ; 
			var params : Array = HERO_XP.split(",");
			while(params.length > 0 && uint(params.shift()) <= xp) lvl++;
			return lvl;
		} 
		
		static public function get instance() : HBConstants {
			return _instance;
		}
		
		static public function DEBUGTraceXML():void {
			var thisClass : Class = Class(getDefinitionByName(getQualifiedClassName(instance)));
			for (var i:Object in thisClass) {
				trace(i + "/" + thisClass[i]);
			}
		}
	}
}
