package com.homerun.multilingual {
	import com.lachhhEngine.multilingual.TextFactory;

	import flash.utils.describeType;

	/**
	 * @author Lachhh
	 */
	public class HB_TextFactory extends TextFactory {
		//[Embed(source="../../../../embed/xmls/Language_ru.xml", mimeType="application/octet-stream")]
		//static private const _languageRuXML:Class ;
		
		//[Embed(source="../../../../embed/xmls/hb_lang_du.xml", mimeType="application/octet-stream")]
		//static private const _languageDuXML:Class;
		
		//***Constantes
		static public var ID_AUTO_FULL_VERSION_0:int = GetNextTextId();
		static public var ID_AUTO_GEEK_FULL_VERSION_0:int = GetNextTextId();

		static public var ID_AUTO_STATUS_0:int = GetNextTextId();
		static public var ID_AUTO__STATUS__0:int = GetNextTextId();
		
		static public const ID_AUTO_GUNBOT_0:int = GetNextTextId();
		static public const ID_AUTO_THE_BREACH_0:int = GetNextTextId();
		static public const ID_AUTO_EQUIP_THIS_IN_INVENTORY_TITLE:int = GetNextTextId();
		static public const ID_AUTO_EQUIP_THIS_IN_INVENTORY:int = GetNextTextId();
		
		static public const ID_AUTO_NOT_ENOUGH_PREMIUM_CASH:int = GetNextTextId();
		//static public const ID_AUTO_PREMIUM_ARE_YOU_SURE:int = GetNextTextId();
		
		static public const ID_AUTO_GET_MORE:int = GetNextTextId();
		static public const ID_AUTO_ONLY_ON:int = GetNextTextId();
		static public const ID_AUTO_ITEM_LOCKED:int = GetNextTextId();
		
		static public const ID_AUTO_SIMPLY_GO_TO:int = GetNextTextId();
		static public const ID_AUTO_FREE_STUFF:int = GetNextTextId();
		static public const ID_AUTO_FREE_STUFF_0:int = GetNextTextId();
		
		static public const ID_AUTO_PROMO_SPONSOR:int = GetNextTextId();
		static public const ID_AUTO_CONNECT_ON_GS_INYOURFACE:int = GetNextTextId();
		static public const ID_AUTO_CONNECT_ON_GS_HIGHSCORE:int = GetNextTextId();
		static public const ID_AUTO_CHALLENGE_YOU:int = GetNextTextId();
		static public const ID_AUTO_AGAINST:int = GetNextTextId();
		static public const ID_AUTO_FRIENDS_SCORE_LABEL:int = GetNextTextId();
		
		static public const ID_AUTO_YOUR_DAILY_HIGHSCORE:int = GetNextTextId();
		static public const ID_AUTO_YOUR_WEEKLY_HIGHSCORE:int = GetNextTextId();
		
		static public const ID_AUTO_XPBONUS_PILL:int = GetNextTextId();
		static public const ID_AUTO_GS_PLAYER_ONLY:int = GetNextTextId();
		static public const ID_AUTO_ITS_FREE:int = GetNextTextId();
		
		static public const ID_AUTO_UNLOCKED_0:int = GetNextTextId();
		static public const ID_AUTO_EARN_MORE_TO_UNLOCK:int = GetNextTextId();
		
		static public const ID_AUTO_TOTAL_DIAMONDS_FROM_ACH_0:int = GetNextTextId();
		static public const ID_AUTO_MY_DIAMONDS:int = GetNextTextId();
		static public const ID_AUTO_FORMULA_1:int = GetNextTextId();
		static public const ID_AUTO_FORMULA_2:int = GetNextTextId();
		static public const ID_AUTO_FORMULA_3:int = GetNextTextId();
		static public const ID_AUTO_FORMULA_4:int = GetNextTextId();
		static public const ID_AUTO_FORMULA_5:int = GetNextTextId();
		static public const ID_AUTO_MESS_WITH_LACHHH:int = GetNextTextId();		
		static public const ID_AUTO_DISCLAIMER_EN:int = GetNextTextId();
		static public const ID_AUTO_DISCLAIMER_FR:int = GetNextTextId();
		static public const ID_AUTO_DISCLAIMER2_EN:int = GetNextTextId();
		static public const ID_AUTO_DISCLAIMER2_FR:int = GetNextTextId();
		static public const ID_AUTO_DISCLAIMER2_CREW_EN:int = GetNextTextId();
		static public const ID_AUTO_DISCLAIMER2_CREW_FR:int = GetNextTextId();
		
		static public const ID_AUTO_GROUP_0:int = GetNextTextId();
		static public const ID_AUTO_TOTAL_0:int = GetNextTextId();
		static public const ID_AUTO_TROPHIES_0:int = GetNextTextId();
		static public const ID_AUTO_X_0:int = GetNextTextId();
		static public const ID_AUTO_ONE_0:int = GetNextTextId();
		static public const ID_AUTO_YOU_0:int = GetNextTextId();
		static public const ID_AUTO_AND_0:int = GetNextTextId();
		static public const ID_AUTO_X__0:int = GetNextTextId();
		static public const ID_AUTO_CREDITS_SCROLL_0:int = GetNextTextId();
		static public const ID_AUTO_CHALLENGE_0:int = GetNextTextId();
		static public const ID_AUTO_____0:int = GetNextTextId();
		static public const ID_AUTO_HOW_0:int = GetNextTextId();
		static public const ID_AUTO_STRENGTH_0:int = GetNextTextId();
		static public const ID_AUTO_POWER_0:int = GetNextTextId();
		static public const ID_AUTO_ACCURACY_0:int = GetNextTextId();
		static public const ID_AUTO_CONTROL_0:int = GetNextTextId();
		static public const ID_AUTO_SOLD_0:int = GetNextTextId();
		static public const ID_AUTO_NEW__0:int = GetNextTextId();
		static public const ID_AUTO_________0:int = GetNextTextId();
		static public const ID_AUTO_CHALLENGE_1:int = GetNextTextId();
		static public const ID_AUTO_POWER_1:int = GetNextTextId();
		static public const ID_AUTO_PARTY_0:int = GetNextTextId();
		static public const ID_AUTO_KICKASS___0:int = GetNextTextId();
		static public const ID_AUTO__TROPHIES__0:int = GetNextTextId();
		static public const ID_AUTO_CHALLENGE_2:int = GetNextTextId();
		static public const ID_AUTO__SHOP__0:int = GetNextTextId();
		static public const ID_AUTO__CHALLENGE__0:int = GetNextTextId();
		static public const ID_AUTO_JUST_0:int = GetNextTextId();
		static public const ID_AUTO_SHARE_0:int = GetNextTextId();
		static public const ID_AUTO_AND_1:int = GetNextTextId();
		static public const ID_AUTO_TAUNT_0:int = GetNextTextId();
		static public const ID_AUTO__DIAMONDS__0:int = GetNextTextId();
		static public const ID_AUTO_HERE_S_0:int = GetNextTextId();
		static public const ID_AUTO_CHALLENGE_3:int = GetNextTextId();
		static public const ID_AUTO_GAMER_0:int = GetNextTextId();
		static public const ID_AUTO___0:int = GetNextTextId();
		static public const ID_AUTO___1:int = GetNextTextId();
		static public const ID_AUTO___2:int = GetNextTextId();
		static public const ID_AUTO_X___0:int = GetNextTextId();
		static public const ID_AUTO___3:int = GetNextTextId();
		static public const ID_AUTO_X___1:int = GetNextTextId();
		static public const ID_AUTO______0:int = GetNextTextId();
		static public const ID_AUTO_X____0:int = GetNextTextId();
		static public const ID_AUTO_ALL_0:int = GetNextTextId();
		static public const ID_AUTO_SIMON_BERZERKSTUDIO_COM_0:int = GetNextTextId();
		static public const ID_AUTO_NOTE_0:int = GetNextTextId();
		static public const ID_AUTO_HEY_0:int = GetNextTextId();
		static public const ID_AUTO_YOUR_0:int = GetNextTextId();
		static public const ID_AUTO____0:int = GetNextTextId();
		static public const ID_AUTO____1:int = GetNextTextId();
		static public const ID_AUTO____2:int = GetNextTextId();
		static public const ID_AUTO____3:int = GetNextTextId();
		static public const ID_AUTO____4:int = GetNextTextId();
		static public const ID_AUTO_YOU_1:int = GetNextTextId();
		static public const ID_AUTO__HIGHSCORES__0:int = GetNextTextId();
		static public const ID_AUTO__OPTIONS__0:int = GetNextTextId();
		static public const ID_AUTO_MUSIC_0:int = GetNextTextId();
		static public const ID_AUTO_SOUND_0:int = GetNextTextId();
		static public const ID_AUTO_QUALITY_0:int = GetNextTextId();
		static public const ID_AUTO_LANGUAGE_0:int = GetNextTextId();
		static public const ID_AUTO_SEASON_0:int = GetNextTextId();
		static public const ID_AUTO_YOUR_1:int = GetNextTextId();
		static public const ID_AUTO_YOU_2:int = GetNextTextId();
		static public const ID_AUTO_NOW_0:int = GetNextTextId();
		static public const ID_AUTO_SAY_0:int = GetNextTextId();
		static public const ID_AUTO__IN_0:int = GetNextTextId();
		static public const ID_AUTO_GAME_0:int = GetNextTextId();
		static public const ID_AUTO_FOLLOW_0:int = GetNextTextId();
		static public const ID_AUTO_YOU_VE_0:int = GetNextTextId();
		static public const ID_AUTO__INVENTORY__0:int = GetNextTextId();
		static public const ID_AUTO_PTS_0:int = GetNextTextId();
		static public const ID_AUTO_FOLLOW_1:int = GetNextTextId();
		static public const ID_AUTO__CREDITS__0:int = GetNextTextId();
		static public const ID_AUTO__CHARACTER_0:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_1:int = GetNextTextId();
		static public const ID_AUTO_MECHANICAL_0:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_2:int = GetNextTextId();
		static public const ID_AUTO_HERO_S_0:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_3:int = GetNextTextId();
		static public const ID_AUTO_SWORDLESS_0:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_4:int = GetNextTextId();
		static public const ID_AUTO_TRAP_0:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_5:int = GetNextTextId();
		static public const ID_AUTO_HOMERUN_0:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_6:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_7:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_8:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_9:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_10:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_11:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_12:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_13:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_14:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_15:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_16:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_17:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_18:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_19:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_20:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_21:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_22:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_23:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_24:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_25:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_26:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_27:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_28:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_29:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_30:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_31:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_32:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_33:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_34:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_35:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_36:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_37:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_38:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_39:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_40:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_41:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_42:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_43:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_44:int = GetNextTextId();
		static public const ID_AUTO_TROPHYNAME_45:int = GetNextTextId();
		static public const ID_AUTO__________0:int = GetNextTextId();
		static public const ID_AUTO_ITEMS_0:int = GetNextTextId();
		static public const ID_AUTO_BEFORE_0:int = GetNextTextId();
		static public const ID_AUTO_AFTER_0:int = GetNextTextId();
		static public const ID_AUTO_PREMIUM_0:int = GetNextTextId();
		static public const ID_AUTO_WEAPONS_0:int = GetNextTextId();
		static public const ID_AUTO_ALL_1:int = GetNextTextId();
		static public const ID_AUTO_FRIENDS_0:int = GetNextTextId();
		static public const ID_AUTO_WEEKLY_0:int = GetNextTextId();
		static public const ID_AUTO_DAILY_0:int = GetNextTextId();
		static public const ID_AUTO_____1:int = GetNextTextId();
		static public const ID_AUTO_____2:int = GetNextTextId();
		static public const ID_AUTO_BUY_0:int = GetNextTextId();
		static public const ID_AUTO_HOST_0:int = GetNextTextId();
		static public const ID_AUTO_EQUIP_0:int = GetNextTextId();
		static public const ID_AUTO_HIT_0:int = GetNextTextId();
		static public const ID_AUTO_AIM_0:int = GetNextTextId();
		static public const ID_AUTO_OPTIONS_0:int = GetNextTextId();
		static public const ID_AUTO_IN_0:int = GetNextTextId();
		static public const ID_AUTO_SUBMIT_0:int = GetNextTextId();
		static public const ID_AUTO_HIGHSCORE_0:int = GetNextTextId();
		static public const ID_AUTO_BUY_1:int = GetNextTextId();
		static public const ID_AUTO_CHALLENGE_A_0:int = GetNextTextId();
		static public const ID_AUTO_INVENTORY_0:int = GetNextTextId();
		static public const ID_AUTO_START_0:int = GetNextTextId();
		static public const ID_AUTO_BACK_0:int = GetNextTextId();
		static public const ID_AUTO_WHO_0:int = GetNextTextId();
		static public const ID_AUTO_DONE__0:int = GetNextTextId();
		static public const ID_AUTO_REVENGE__0:int = GetNextTextId();
		static public const ID_AUTO_TRY_0:int = GetNextTextId();
		static public const ID_AUTO_AGAIN__0:int = GetNextTextId();
		static public const ID_AUTO_NO_0:int = GetNextTextId();
		static public const ID_AUTO_YES_0:int = GetNextTextId();
		static public const ID_AUTO_OK_0:int = GetNextTextId();
		static public const ID_AUTO_CHALLENGE_4:int = GetNextTextId();
		static public const ID_AUTO_I_LL_0:int = GetNextTextId();
		static public const ID_AUTO_CONNECT_0:int = GetNextTextId();
		static public const ID_AUTO_DELETE_0:int = GetNextTextId();
		static public const ID_AUTO_CONTROLS_0:int = GetNextTextId();
		static public const ID_AUTO_SHOP_0:int = GetNextTextId();
		static public const ID_AUTO_TROPHIES_1:int = GetNextTextId();
		static public const ID_AUTO_HOST_1:int = GetNextTextId();
		static public const ID_AUTO_HOST_2:int = GetNextTextId();
		static public const ID_AUTO_CREDITS_0:int = GetNextTextId();
		static public const ID_AUTO_MORE_0:int = GetNextTextId();
		static public const ID_AUTO_MORE_1:int = GetNextTextId();
		static public const ID_AUTO_SAVE_0:int = GetNextTextId();
		static public const ID_AUTO_RETRY_0:int = GetNextTextId();
		static public const ID_AUTO__HOMERUN____0:int = GetNextTextId();
		static public const ID_AUTO_TO_0:int = GetNextTextId();
		static public const ID_AUTO_MAX_0:int = GetNextTextId();
		static public const ID_AUTO_MIN_0:int = GetNextTextId();
		static public const ID_AUTO_LEVEL_0:int = GetNextTextId();
		static public const ID_AUTO_GREAT_0:int = GetNextTextId();
		static public const ID_AUTO_S_0:int = GetNextTextId();
		static public const ID_AUTO_U_0:int = GetNextTextId();
		static public const ID_AUTO_N_0:int = GetNextTextId();
		static public const ID_AUTO_O_0:int = GetNextTextId();
		static public const ID_AUTO_B_0:int = GetNextTextId();
		static public const ID_AUTO___4:int = GetNextTextId();
		static public const ID_AUTO_T_0:int = GetNextTextId();
		static public const ID_AUTO_H_0:int = GetNextTextId();
		static public const ID_AUTO_S_1:int = GetNextTextId();
		static public const ID_AUTO_R_0:int = GetNextTextId();
		static public const ID_AUTO_E_0:int = GetNextTextId();
		static public const ID_AUTO_L_0:int = GetNextTextId();
		static public const ID_AUTO_I_0:int = GetNextTextId();
		static public const ID_AUTO_K_0:int = GetNextTextId();
		static public const ID_AUTO___5:int = GetNextTextId();
		static public const ID_AUTO_MED_0:int = GetNextTextId();
		static public const ID_AUTO_LOW_0:int = GetNextTextId();
		static public const ID_AUTO_HIGH_0:int = GetNextTextId();
		static public const ID_AUTO_SOUND_1:int = GetNextTextId();
		static public const ID_AUTO_MUSIC_1:int = GetNextTextId();
		static public const ID_AUTO_PAUSE_0:int = GetNextTextId();
		static public const ID_AUTO_QUALITY_1:int = GetNextTextId();
		static public const ID_AUTO_MAX__0:int = GetNextTextId();
		static public const ID_AUTO_SEND_0:int = GetNextTextId();
		static public const ID_AUTO_MANEUVER_0:int = GetNextTextId();
		static public const ID_AUTO_PUNCH_0:int = GetNextTextId();
		static public const ID_AUTO_COMPLETE_0:int = GetNextTextId();
		static public const ID_AUTO__CONTROLS__0:int = GetNextTextId();
		static public const ID_AUTO_MARC_ANTOINE_0:int = GetNextTextId();
		static public const ID_AUTO_SIMON_0:int = GetNextTextId();
		static public const ID_AUTO_CHRIS_0:int = GetNextTextId();
		static public const ID_AUTO_ARTS_0:int = GetNextTextId();
		static public const ID_AUTO_PROGRAMMING_0:int = GetNextTextId();
		static public const ID_AUTO_DIRECTOR_0:int = GetNextTextId();
		static public const ID_AUTO_SPECIAL_0:int = GetNextTextId();
		static public const ID_AUTO_GAME_1:int = GetNextTextId();
		static public const ID_AUTO_SNEAKY_0:int = GetNextTextId();
		static public const ID_AUTO_MUSICS_0:int = GetNextTextId();
		static public const ID_AUTO_SPONSOR_0:int = GetNextTextId();
		static public const ID_AUTO_POWERED_0:int = GetNextTextId();
		static public const ID_AUTO_BETA_0:int = GetNextTextId();
		static public const ID_AUTO_PASCAL_0:int = GetNextTextId();
		static public const ID_AUTO_IN_1:int = GetNextTextId();
		static public const ID_AUTO_CHALLENGING__0:int = GetNextTextId();


		static public var ID_YOUR_PWNY_SCORE:int = GetNextTextId();
		static public var ID_SCORED:int = GetNextTextId();
		static public var ID_LOCKED:int = GetNextTextId();
		static public var ID_MSG:int = GetNextTextId();
		static public var ID_CASH:int = GetNextTextId();
		static public var ID_DISTANCE:int = GetNextTextId();
		static public var ID_FEET_HIT:int = GetNextTextId();
		static public var ID_HEIGHT:int = GetNextTextId();
		static public var ID_LEVEL:int = GetNextTextId();
		static public var ID_LVL:int = GetNextTextId();
		static public var ID_TROPHY:int = GetNextTextId();
		static public var ID_UNLOCKED:int = GetNextTextId();
		static public var ID_SCORE_TO_BEAT:int = GetNextTextId();
		static public var ID_CHALLENGE:int = GetNextTextId();
		static public var ID_PLAYER_NAME_CHALLENGE:int = GetNextTextId();
		static public var ID_QUESTION_CHALLENGE_SET:int = GetNextTextId();
		static public var ID_YOU_HAVE_BEAT_CHALLENGE:int = GetNextTextId();
		
		static public var ID_BALLON_REQUIREMENTS:int = GetNextTextId();
		static public var ID_MATHIEU_REQUIREMENTS:int = GetNextTextId();
		static public var ID_TITI_REQUIREMENTS:int = GetNextTextId();
		
		static public var ID_QUESTION_NOT_ENOUGH_MONEY:int = GetNextTextId();
		static public var ID_QUESTION_NOT_ENOUGH_DIAMOND:int = GetNextTextId();
		static public var ID_QUESTION_DELETE_ALL1:int = GetNextTextId();
		static public var ID_QUESTION_DELETE_ALL2:int = GetNextTextId();
		static public var ID_QUESTION_DELETE_ALL3:int = GetNextTextId();
		static public var ID_QUESTION_DELETE_ALL4_YES:int = GetNextTextId();
		static public var ID_QUESTION_DELETE_ALL4_NO:int = GetNextTextId();
		
		static public var ID_PERSO_ETIENNE:int = GetNextTextId();
		static public var ID_PERSO_LACHHH:int = GetNextTextId();
		static public var ID_PERSO_MARC:int = GetNextTextId();
		static public var ID_PERSO_MATHIEU:int = GetNextTextId();
		static public var ID_PERSO_VINCENT:int = GetNextTextId();
		static public var ID_PERSO_TITI:int = GetNextTextId();
		static public var ID_PERSO_DENIZE:int = GetNextTextId();
		
		static public var ID_SETTINGS_ON:int = GetNextTextId();
		static public var ID_SETTINGS_OFF:int = GetNextTextId();
		static public var ID_SETTINGS_LOW:int = GetNextTextId();
		static public var ID_SETTINGS_MED:int = GetNextTextId();
		static public var ID_SETTINGS_HIGH:int = GetNextTextId();
		static public var ID_SETTINGS_ENGLISH:int = GetNextTextId();
		static public var ID_SETTINGS_FRENCH:int = GetNextTextId();
		static public var ID_SETTINGS_CHINESE:int = GetNextTextId();
		
		static public var ID_SETTINGS_WINTER:int = GetNextTextId();
		static public var ID_SETTINGS_SUMMER:int = GetNextTextId();
		static public var ID_SETTINGS_FALLS:int = GetNextTextId();
		static public var ID_SETTINGS_SPRING:int = GetNextTextId();
		static public var ID_SETTINGS_RANDOM:int = GetNextTextId();
		
		static public var ID_HERO_LVL_UP_QUOTE_1:int = GetNextTextId();
		static public var ID_HERO_LVL_UP_QUOTE_2:int = GetNextTextId();
		static public var ID_HERO_LVL_UP_QUOTE_3:int = GetNextTextId();
		static public var ID_HERO_LVL_UP_QUOTE_4:int = GetNextTextId();
		static public var ID_HERO_LVL_UP_QUOTE_5:int = GetNextTextId();
		
		static public var ID_GEEK_QUOTE_1:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_2:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_3:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_4:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_5:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_6:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_7:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_8:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_9:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_10:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_11:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_12:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_13:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_14:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_15:int = GetNextTextId();
		
		
		static public var ID_GEEK_QUOTE_AFTER_1:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_AFTER_2:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_AFTER_3:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_AFTER_4:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_AFTER_5:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_AFTER_6:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_AFTER_7:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_AFTER_8:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_AFTER_9:int = GetNextTextId();
		static public var ID_GEEK_QUOTE_AFTER_10:int = GetNextTextId();
		
		static public var ID_EQUIP_WEAPON_1:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_2:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_3:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_4:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_5:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_6:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_7:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_8:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_9:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_10:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_11:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_12:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_13:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_14:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_15:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_16:int = GetNextTextId();
		static public var ID_EQUIP_WEAPON_17:int = GetNextTextId();
		
		static public var ID_EQUIP_BRACERS_1:int = GetNextTextId();
		static public var ID_EQUIP_BRACERS_2:int = GetNextTextId();
		static public var ID_EQUIP_BRACERS_3:int = GetNextTextId();
		static public var ID_EQUIP_BRACERS_4:int = GetNextTextId();
		static public var ID_EQUIP_BRACERS_5:int = GetNextTextId();
		static public var ID_EQUIP_BRACERS_6:int = GetNextTextId();
		static public var ID_EQUIP_BRACERS_7:int = GetNextTextId();
		static public var ID_EQUIP_BRACERS_8:int = GetNextTextId();
		
		static public var ID_EQUIP_BELT_1:int = GetNextTextId();
		static public var ID_EQUIP_BELT_2:int = GetNextTextId();
		static public var ID_EQUIP_BELT_3:int = GetNextTextId();
		static public var ID_EQUIP_BELT_4:int = GetNextTextId();
		static public var ID_EQUIP_BELT_5:int = GetNextTextId();
		static public var ID_EQUIP_BELT_6:int = GetNextTextId();
		static public var ID_EQUIP_BELT_7:int = GetNextTextId();
		static public var ID_EQUIP_BELT_8:int = GetNextTextId();
		
		static public var ID_EQUIP_BANDANA_1:int = GetNextTextId();
		static public var ID_EQUIP_BANDANA_2:int = GetNextTextId();
		static public var ID_EQUIP_BANDANA_3:int = GetNextTextId();
		static public var ID_EQUIP_BANDANA_4:int = GetNextTextId();
		static public var ID_EQUIP_BANDANA_5:int = GetNextTextId();
		static public var ID_EQUIP_BANDANA_6:int = GetNextTextId();
		static public var ID_EQUIP_BANDANA_7:int = GetNextTextId();
		static public var ID_EQUIP_BANDANA_8:int = GetNextTextId();
		
		static public var ID_EQUIP_XP_PILLS:int = GetNextTextId();
		
		static public var ID_EQUIP_DESC_WEAPON_1:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_2:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_3:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_4:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_5:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_6:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_7:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_8:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_9:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_10:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_11:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_12:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_13:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_14:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_15:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_16:int = GetNextTextId();
		static public var ID_EQUIP_DESC_WEAPON_17:int = GetNextTextId();
		
		static public var ID_EQUIP_DESC_BRACERS_1:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BRACERS_2:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BRACERS_3:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BRACERS_4:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BRACERS_5:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BRACERS_6:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BRACERS_7:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BRACERS_8:int = GetNextTextId();
		
		static public var ID_EQUIP_DESC_BELT_1:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BELT_2:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BELT_3:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BELT_4:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BELT_5:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BELT_6:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BELT_7:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BELT_8:int = GetNextTextId();
		
		static public var ID_EQUIP_DESC_BANDANA_1:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BANDANA_2:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BANDANA_3:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BANDANA_4:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BANDANA_5:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BANDANA_6:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BANDANA_7:int = GetNextTextId();
		static public var ID_EQUIP_DESC_BANDANA_8:int = GetNextTextId();
		
		static public var ID_EQUIP_DESC_XP_PILLS:int = GetNextTextId();
		
		static public var ID_TROPHY_GROUP_1_TITLE:int = GetNextTextId();
		static public var ID_TROPHY_GROUP_2_TITLE:int = GetNextTextId();
		static public var ID_TROPHY_GROUP_3_TITLE:int = GetNextTextId();
		static public var ID_TROPHY_GROUP_4_TITLE:int = GetNextTextId();
		static public var ID_TROPHY_GROUP_5_TITLE:int = GetNextTextId();
		static public var ID_TROPHY_GROUP_6_TITLE:int = GetNextTextId();
		static public var ID_TROPHY_GROUP_7_TITLE:int = GetNextTextId();
		static public var ID_TROPHY_GROUP_8_TITLE:int = GetNextTextId();
		static public var ID_TROPHY_GROUP_9_TITLE:int = GetNextTextId();
		static public var ID_TROPHY_GROUP_10_TITLE:int = GetNextTextId();
				
		static public var ID_TROPHY_TITLE_1:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_2:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_3:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_4:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_5:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_6:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_7:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_8:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_9:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_10:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_11:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_12:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_13:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_14:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_15:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_16:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_17:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_18:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_19:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_20:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_21:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_22:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_23:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_24:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_25:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_26:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_27:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_28:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_29:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_30:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_31:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_32:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_33:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_34:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_35:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_36:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_37:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_38:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_39:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_40:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_41:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_42:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_43:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_44:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_45:int = GetNextTextId();
		
		static public var ID_TROPHY_DESC_1:int = GetNextTextId();
		static public var ID_TROPHY_DESC_2:int = GetNextTextId();
		static public var ID_TROPHY_DESC_3:int = GetNextTextId();
		static public var ID_TROPHY_DESC_4:int = GetNextTextId();
		static public var ID_TROPHY_DESC_5:int = GetNextTextId();
		static public var ID_TROPHY_DESC_6:int = GetNextTextId();
		static public var ID_TROPHY_DESC_7:int = GetNextTextId();
		static public var ID_TROPHY_DESC_8:int = GetNextTextId();
		static public var ID_TROPHY_DESC_9:int = GetNextTextId();
		static public var ID_TROPHY_DESC_10:int = GetNextTextId();
		static public var ID_TROPHY_DESC_11:int = GetNextTextId();
		static public var ID_TROPHY_DESC_12:int = GetNextTextId();
		static public var ID_TROPHY_DESC_13:int = GetNextTextId();
		static public var ID_TROPHY_DESC_14:int = GetNextTextId();
		static public var ID_TROPHY_DESC_15:int = GetNextTextId();
		static public var ID_TROPHY_DESC_16:int = GetNextTextId();
		static public var ID_TROPHY_DESC_17:int = GetNextTextId();
		static public var ID_TROPHY_DESC_18:int = GetNextTextId();
		static public var ID_TROPHY_DESC_19:int = GetNextTextId();
		static public var ID_TROPHY_DESC_20:int = GetNextTextId();
		static public var ID_TROPHY_DESC_21:int = GetNextTextId();
		static public var ID_TROPHY_DESC_22:int = GetNextTextId();
		static public var ID_TROPHY_DESC_23:int = GetNextTextId();
		static public var ID_TROPHY_DESC_24:int = GetNextTextId();
		static public var ID_TROPHY_DESC_25:int = GetNextTextId();
		static public var ID_TROPHY_DESC_26:int = GetNextTextId();
		static public var ID_TROPHY_DESC_27:int = GetNextTextId();
		static public var ID_TROPHY_DESC_28:int = GetNextTextId();
		static public var ID_TROPHY_DESC_29:int = GetNextTextId();
		static public var ID_TROPHY_DESC_30:int = GetNextTextId();
		static public var ID_TROPHY_DESC_31:int = GetNextTextId();
		static public var ID_TROPHY_DESC_32:int = GetNextTextId();
		static public var ID_TROPHY_DESC_33:int = GetNextTextId();
		static public var ID_TROPHY_DESC_34:int = GetNextTextId();
		static public var ID_TROPHY_DESC_35:int = GetNextTextId();
		static public var ID_TROPHY_DESC_36:int = GetNextTextId();
		static public var ID_TROPHY_DESC_37:int = GetNextTextId();
		static public var ID_TROPHY_DESC_38:int = GetNextTextId();
		static public var ID_TROPHY_DESC_39:int = GetNextTextId();
		static public var ID_TROPHY_DESC_40:int = GetNextTextId();
		static public var ID_TROPHY_DESC_41:int = GetNextTextId();
		static public var ID_TROPHY_DESC_42:int = GetNextTextId();
		static public var ID_TROPHY_DESC_43:int = GetNextTextId();
		static public var ID_TROPHY_DESC_44:int = GetNextTextId();
		static public var ID_TROPHY_DESC_45:int = GetNextTextId();
		
		
		static public var ID_TROPHY_DESC2_1:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_2:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_3:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_4:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_5:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_6:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_7:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_8:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_9:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_10:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_11:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_12:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_13:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_14:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_15:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_16:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_17:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_18:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_19:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_20:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_21:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_22:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_23:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_24:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_25:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_26:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_27:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_28:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_29:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_30:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_31:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_32:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_33:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_34:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_35:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_36:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_37:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_38:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_39:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_40:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_41:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_42:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_43:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_44:int = GetNextTextId();
		static public var ID_TROPHY_DESC2_45:int = GetNextTextId();
		
		public function HB_TextFactory() {
			super();
		}
		
		override protected function AddText():void {
			super.AddText();
					
			//***Init
			LANGUAGE_EN.AddText(ID_AUTO_FULL_VERSION_0, "GET THE \nFULL VERSION !!!");
			LANGUAGE_EN.AddText(ID_AUTO_GEEK_FULL_VERSION_0, "This is too awesome for you noob! Get the full version to unleash REAL BERZERK's POWER !!!");
			
		
		
			LANGUAGE_EN.AddText(ID_AUTO_STATUS_0, "Status");
			LANGUAGE_EN.AddText(ID_AUTO__STATUS__0, "Status");
			
			LANGUAGE_EN.AddText(ID_AUTO_EQUIP_THIS_IN_INVENTORY_TITLE, "Noobz message...");
			LANGUAGE_EN.AddText(ID_AUTO_EQUIP_THIS_IN_INVENTORY, "Equip it in your inventory !");
			LANGUAGE_EN.AddText(ID_AUTO_NOT_ENOUGH_PREMIUM_CASH, "You don't have enough [x]! Do you want to get more ? ");
			
			LANGUAGE_EN.AddText(ID_AUTO_GET_MORE, "Get More [x]!");		
			LANGUAGE_EN.AddText(ID_AUTO_ONLY_ON, "only on");
			LANGUAGE_EN.AddText(ID_AUTO_ITEM_LOCKED, "This item is locked to playhub.com. Pathetic, 0/5.");
			
			LANGUAGE_EN.AddText(ID_AUTO_SIMPLY_GO_TO, "Simply go to");
			LANGUAGE_EN.AddText(ID_AUTO_FREE_STUFF, "Free Stuff!");
			LANGUAGE_EN.AddText(ID_AUTO_FREE_STUFF_0, "- Get the geek to taunt your friends with your personalized message!\n- Receive more diamonds !\n- Unlock the best items of the games !");
		
			LANGUAGE_EN.AddText(ID_AUTO_PROMO_SPONSOR, "FROM JOE : Beating my score is like you getting laid : impossible.");
			LANGUAGE_EN.AddText(ID_AUTO_CONNECT_ON_GS_INYOURFACE, "Connect on GamerSafe to rub it \nIN HIS FACE !");
			LANGUAGE_EN.AddText(ID_AUTO_CONNECT_ON_GS_HIGHSCORE, "Connect on GamerSafe, challenge your friends and collect more diamonds !");
			LANGUAGE_EN.AddText(ID_AUTO_CHALLENGE_YOU, "Nobody challenged you yet !");
			LANGUAGE_EN.AddText(ID_AUTO_AGAINST, "against");
			LANGUAGE_EN.AddText(ID_AUTO_FRIENDS_SCORE_LABEL, "*a friend's score is the highest distance when he challenged you");
			LANGUAGE_EN.AddText(ID_AUTO_YOUR_DAILY_HIGHSCORE, "Your Daily Highscore");
			LANGUAGE_EN.AddText(ID_AUTO_YOUR_WEEKLY_HIGHSCORE, "Your Weekly Highscore");
			
			LANGUAGE_EN.AddText(ID_AUTO_XPBONUS_PILL, "+ [x] XP!");
			LANGUAGE_EN.AddText(ID_AUTO_GS_PLAYER_ONLY, "GamerSafe\nplayers only !");
			LANGUAGE_EN.AddText(ID_AUTO_ITS_FREE, "It's FREE!");
			LANGUAGE_EN.AddText(ID_AUTO_UNLOCKED_0, "UNLOCKED");
			LANGUAGE_EN.AddText(ID_AUTO_EARN_MORE_TO_UNLOCK, "Earn more diamonds to unlock this !");
			
			LANGUAGE_EN.AddText(ID_AUTO_TOTAL_DIAMONDS_FROM_ACH_0, "Total diamonds earned by trophies");
			LANGUAGE_EN.AddText(ID_AUTO_MY_DIAMONDS, "MY DIAMONDS");
			LANGUAGE_EN.AddText(ID_AUTO_FORMULA_1, "People who challenged you : ");
			LANGUAGE_EN.AddText(ID_AUTO_FORMULA_2, "Days played : ");
			LANGUAGE_EN.AddText(ID_AUTO_FORMULA_3, "People you challenged : ");
			LANGUAGE_EN.AddText(ID_AUTO_FORMULA_4, "Achievements prizes : ");
			LANGUAGE_EN.AddText(ID_AUTO_FORMULA_5, "Diamonds bought : ");
			
			LANGUAGE_EN.AddText(ID_AUTO_MESS_WITH_LACHHH, "iN YOUR FACE !!!\nThat's what happens when you mess with the coder of the game !");
			LANGUAGE_EN.AddText(ID_AUTO_DISCLAIMER_EN, "-DISCLAIMER-\n***The comments you will see from Comeau in this game are actual comments we saw on gaming boards during the last year.***\n\nDo not, by any mean, try to immitate what you will see in this game. What happen in Berzerk Land must stay in Berzerk land. Do NOT hurt geeks! None of them has been hurt during the making of this game.\n\n(Except for Lachhh, but it's okay, he's a professionnal coder, he knows the drill.)\nGeeks, although really annoying, are living ...\"creatures\"... and deserves respect, like any other living stuff.\n\nOkay? Good!\nNow let's playball !!!\n\nMarc-A. Jean, Homerun's director");
			LANGUAGE_EN.AddText(ID_AUTO_DISCLAIMER_FR, "-AVIS-\n***Les commentaires exprimés par Comeau dans ce jeu sont de véritables commentaires vus sur des forums de discutions de jeux durant la dernière année.***\n\nVous ne devez pas, d'aucune façon que ce soit, essayer d'imiter ce que vous verrez dans ce jeu. Ce qui se passe à Berzerk Land doit rester à Berzerk Land.  Ne PAS molester les geeks ! Aucun d'entre eux n'a été molester durant la production de ce jeu.\n(À part peut-être pour Lachhh, mais ça va, c'est un programmeur professionnel, il connaît la musique.)\n\nLes geeks, bien que franchement détestables, sont des...\"créatures\"...vivantes et méritent le respect  comme n'importe quel autre truc vivant.\n\nD'accord ? Bien !\nC'est parti !\n\nMarc-A. Jean, Directeur de Homerun");
			
			LANGUAGE_EN.AddText(ID_AUTO_DISCLAIMER2_EN, "Hey Guys!\n\n We’ve created an awesome expansion pack: a brand new look for the game, new weapons, new items, and a sexy new character! \n\nAnd you know what? The game’s sequel is coming up!  As we know how hard it will be to wait for this next geek-smashing rumble, we made that expansion pack so that in the meantime, you finally get a chance to beat your friends! \n\nWe've also ported the game to iPhone, iPod Touch and iPad, so go check it out! \n\nYou're all awesome!");
			LANGUAGE_EN.AddText(ID_AUTO_DISCLAIMER2_FR, "Salut !\nOn a fait de nouvelles armes et items, un nouveau personnage sexy et un tout nouveau look dans cet expansion !\n\nEt vous savez quoi ? La suite du jeu s'en viens ! Alors au lieu de vous laisser attendre trop longtemps pour un autre baston de geek, on a fait cet expansion pour vous donner la chance d'enfin vaincre vos amis !  Le jeu est aussi disponible sur iPhone et iPod Touch, allez voir ça !\n\nVous êtes génial !");
			LANGUAGE_EN.AddText(ID_AUTO_DISCLAIMER2_CREW_EN, "- the Berzerk Crew");
			LANGUAGE_EN.AddText(ID_AUTO_DISCLAIMER2_CREW_FR, "- la crew de Berzerk");
			
		
			
			LANGUAGE_EN.AddText(ID_AUTO_GROUP_0, "Group Total :");
			LANGUAGE_EN.AddText(ID_AUTO_TOTAL_0, "TOTAL : ");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHIES_0, "Trophies unlocked : ");
			LANGUAGE_EN.AddText(ID_AUTO_X_0, "x");
			LANGUAGE_EN.AddText(ID_AUTO_ONE_0, "One final step!");
			LANGUAGE_EN.AddText(ID_AUTO_YOU_0, "You need to be connected on GamerSafe to get your own link! It's easy, and it's free!");
			LANGUAGE_EN.AddText(ID_AUTO_AND_0, "and receive ");
			LANGUAGE_EN.AddText(ID_AUTO_X__0, "x5 !");
			LANGUAGE_EN.AddText(ID_AUTO_CREDITS_SCROLL_0, "Credits\nscroll");
			LANGUAGE_EN.AddText(ID_AUTO_CHALLENGE_0, "Challenge your friends \nand earn more");
			LANGUAGE_EN.AddText(ID_AUTO_____0, "!!!");
			LANGUAGE_EN.AddText(ID_AUTO_HOW_0, "How do I get more of these ?");
			LANGUAGE_EN.AddText(ID_AUTO_STRENGTH_0, "Strength : Adds some punch to your hits!");
			LANGUAGE_EN.AddText(ID_AUTO_POWER_0, "Power : The higher it is, the more awesome will be your homeruns");
			LANGUAGE_EN.AddText(ID_AUTO_ACCURACY_0, "Accuracy : Slow down the gauges and gives additional Power Smashes!");
			LANGUAGE_EN.AddText(ID_AUTO_CONTROL_0, "Control : Adds bouncing on creatures and cannons. Enhance control mid-air!");
			LANGUAGE_EN.AddText(ID_AUTO_SOLD_0, "SOLD OUT !");
			LANGUAGE_EN.AddText(ID_AUTO_NEW__0, "NEW!");
			LANGUAGE_EN.AddText(ID_AUTO_________0, "1,000!!");
			LANGUAGE_EN.AddText(ID_AUTO_CHALLENGE_1, "Challenge your friends \nand get more gold!");
			LANGUAGE_EN.AddText(ID_AUTO_POWER_1, "Power Chord-like\nLevel Up!!");
			LANGUAGE_EN.AddText(ID_AUTO_PARTY_0, "PARTY ON!!!");
			LANGUAGE_EN.AddText(ID_AUTO_KICKASS___0, "Kickass!!");
			LANGUAGE_EN.AddText(ID_AUTO__TROPHIES__0, "-trophies-");
			LANGUAGE_EN.AddText(ID_AUTO_CHALLENGE_2, "Challenge your friends \nand get premium items!");
			LANGUAGE_EN.AddText(ID_AUTO__SHOP__0, "-Shop-");
			LANGUAGE_EN.AddText(ID_AUTO__CHALLENGE__0, "-CHALLENGE-");
			LANGUAGE_EN.AddText(ID_AUTO_JUST_0, "Just give this link to your friends!");
			LANGUAGE_EN.AddText(ID_AUTO_SHARE_0, "Share it on : ");
			LANGUAGE_EN.AddText(ID_AUTO_AND_1, "and get INSTANT");
			LANGUAGE_EN.AddText(ID_AUTO_TAUNT_0, "Taunt your friend ! ");
			LANGUAGE_EN.AddText(ID_AUTO__DIAMONDS__0, "-DIAMONDS-");
			LANGUAGE_EN.AddText(ID_AUTO_HERE_S_0, "Here's two ways to earn diamonds faster!");
			LANGUAGE_EN.AddText(ID_AUTO_CHALLENGE_3, "CHALLENGE YOUR FRIENDS");
			LANGUAGE_EN.AddText(ID_AUTO_GAMER_0, "GAMER GOLD");
			LANGUAGE_EN.AddText(ID_AUTO___0, "- It's FREE and it's the easiest way to earn diamonds! ");
			LANGUAGE_EN.AddText(ID_AUTO___1, "- You want the whole thing right now AND support Berzerk Studio?");
			LANGUAGE_EN.AddText(ID_AUTO___2, "= 400 GG");
			LANGUAGE_EN.AddText(ID_AUTO_X___0, "x100");
			LANGUAGE_EN.AddText(ID_AUTO___3, "= 800 GG");
			LANGUAGE_EN.AddText(ID_AUTO_X___1, "x250");
			LANGUAGE_EN.AddText(ID_AUTO______0, "= 1200 GG");
			LANGUAGE_EN.AddText(ID_AUTO_X____0, "x500");
			LANGUAGE_EN.AddText(ID_AUTO_ALL_0, "All cool kids are doing it!");
			LANGUAGE_EN.AddText(ID_AUTO_SIMON_BERZERKSTUDIO_COM_0, "simon@berzerkstudio.com");
			LANGUAGE_EN.AddText(ID_AUTO_NOTE_0, "Note to Sponsor! ");
			LANGUAGE_EN.AddText(ID_AUTO_HEY_0, "Hey there!\n\nAs you will see, this game features a new viral distribution system that rewards players who distribute the game.  This feature use the new technology offered by GamerSafe only : LevelVault.\n\nThe player is asked to share his link, exemple : \n\"www.YOURSITEHERE.com/homerun_in_berzerk_land?friend=Lachhh\"\n\nThe more he shares the link, the more he will get rewarded, simple !  Plus, players can send customized taunts to their friends for more personalized fun !\n\nAlso, the player who challenges another doesn't need to be logged into GamerSafe at all ! \n\nFinally, everytime the player opens the game, he get rewards regarding the # of plays they generated AND # of new players they dragged into the game.  \n\nFor more details about the game or the system, please email us at : \n\nEnjoy !\n              - The Berzerk Team");
			LANGUAGE_EN.AddText(ID_AUTO_YOUR_0, "Your Highscore");
			LANGUAGE_EN.AddText(ID_AUTO____0, "1.");
			LANGUAGE_EN.AddText(ID_AUTO____1, "2.");
			LANGUAGE_EN.AddText(ID_AUTO____2, "3.");
			LANGUAGE_EN.AddText(ID_AUTO____3, "4.");
			LANGUAGE_EN.AddText(ID_AUTO____4, "5.");
			LANGUAGE_EN.AddText(ID_AUTO_YOU_1, "You searching for a specific friend? \nJust go to this link and replace the last part by his GamerSafe's name!");
			LANGUAGE_EN.AddText(ID_AUTO__HIGHSCORES__0, "-Highscores-");
			LANGUAGE_EN.AddText(ID_AUTO__OPTIONS__0, "-Options-");
			LANGUAGE_EN.AddText(ID_AUTO_MUSIC_0, "Music");
			LANGUAGE_EN.AddText(ID_AUTO_SOUND_0, "Sound FX");
			LANGUAGE_EN.AddText(ID_AUTO_QUALITY_0, "Quality");
			LANGUAGE_EN.AddText(ID_AUTO_LANGUAGE_0, "Language");
			LANGUAGE_EN.AddText(ID_AUTO_SEASON_0, "Season");
			LANGUAGE_EN.AddText(ID_AUTO_YOUR_1, "Your geek-tossing skills are incredible!!!");
			LANGUAGE_EN.AddText(ID_AUTO_YOU_2, "You have unlocked");
			LANGUAGE_EN.AddText(ID_AUTO_NOW_0, "Now challenge him back!");
			LANGUAGE_EN.AddText(ID_AUTO_SAY_0, "Say it Proudly! And Loudly!");
			LANGUAGE_EN.AddText(ID_AUTO__IN_0, "-iN YOUR FACE!-");
			LANGUAGE_EN.AddText(ID_AUTO_GAME_0, "Game completed!");
			LANGUAGE_EN.AddText(ID_AUTO_FOLLOW_0, "Follow us on : ");
			LANGUAGE_EN.AddText(ID_AUTO_YOU_VE_0, "You've completed the whole game! \n\nNow try to boost your score, earn all achievements and compete against your friends! ");
			LANGUAGE_EN.AddText(ID_AUTO__INVENTORY__0, "-Inventory-");
			LANGUAGE_EN.AddText(ID_AUTO_PTS_0, "Pts");
			LANGUAGE_EN.AddText(ID_AUTO_FOLLOW_1, "Follow Berzerk Studio on:");
			LANGUAGE_EN.AddText(ID_AUTO__CREDITS__0, "-Credits-");
			LANGUAGE_EN.AddText(ID_AUTO__CHARACTER_0, "-Character Select-");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_1, "TYLER");
			LANGUAGE_EN.AddText(ID_AUTO_MECHANICAL_0, "MECHANICAL COMMANDO");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_2, "PIGWIZ");
			LANGUAGE_EN.AddText(ID_AUTO_HERO_S_0, "HERO'S ARMS");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_3, "MASKED SAMURAI");
			LANGUAGE_EN.AddText(ID_AUTO_SWORDLESS_0, "SWORDLESS NINJA");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_4, "SPIKEY STOMPERS");
			LANGUAGE_EN.AddText(ID_AUTO_TRAP_0, "TRAP MASTER");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_5, "MEAT TREE");
			LANGUAGE_EN.AddText(ID_AUTO_HOMERUN_0, "HOMERUN IN BERZERK LAND");
						
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_6, "SPECTER TROOPERS");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_7, "RATMAN");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_8, "FROG CONTENDER");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_9, "TREASURE HUNTERS");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_10, "OLD NUKE");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_11, "CATYA'S AIRCRAFT");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_12, "POWER, LIFE AND MAGIC");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_13, "MABUSHI'S 1-UP");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_14, "ROLLING BOMBER");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_15, "BASEBALL BAT");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_16, "MECHANICAL ARMOR");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_17, "RIX");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_18, "SPIKED BALL");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_19, "THERMAL BLASTER");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_20, "BEER CAP");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_21, "SPECTER MECH FIGHTER");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_22, "BAND-AID & MAGIC SODA");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_23, "MABUSHI");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_24, "FREEZING BLASTER");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_25, "HAMBURGER CLOUD");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_26, "REPAIR KIT");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_27, "POWERED-UP RIX");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_28, "HAPPY LARVA");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_29, "BLOC SET");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_30, "ICY WOMAN & TOOL STATUE ");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_31, "ENEMY TURRETS");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_32, "GIANT SQUID");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_33, "BIG JAW");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_34, "DOOM CHEST");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_35, "MONSTER TRUCK");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_36, "FRIENDLY BASE");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_37, "GORDZAK");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_38, "GORBAZAKI");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_39, "CÉZAR AND MAURICE");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_40, "COMEAU THE GEEK");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_41, "SERGEI");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_42, "PIERRE_LUC");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_43, "SPIDER EYE");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_44, "GUNBOT");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHYNAME_45, "ARMORED LIZARD");
			LANGUAGE_EN.AddText(ID_AUTO__________0, "********");
			LANGUAGE_EN.AddText(ID_AUTO_ITEMS_0, "Items");
			LANGUAGE_EN.AddText(ID_AUTO_BEFORE_0, "Before");
			LANGUAGE_EN.AddText(ID_AUTO_AFTER_0, "After");
			LANGUAGE_EN.AddText(ID_AUTO_PREMIUM_0, "Premium");
			LANGUAGE_EN.AddText(ID_AUTO_WEAPONS_0, "Weapons");
			LANGUAGE_EN.AddText(ID_AUTO_ALL_1, "All Time");
			LANGUAGE_EN.AddText(ID_AUTO_FRIENDS_0, "Friends");
			LANGUAGE_EN.AddText(ID_AUTO_WEEKLY_0, "Weekly");
			LANGUAGE_EN.AddText(ID_AUTO_DAILY_0, "Daily");
			LANGUAGE_EN.AddText(ID_AUTO_____1, "1/2");
			LANGUAGE_EN.AddText(ID_AUTO_____2, "2/2");
			LANGUAGE_EN.AddText(ID_AUTO_BUY_0, "BUY!");
			LANGUAGE_EN.AddText(ID_AUTO_HOST_0, "Host this game!");
			LANGUAGE_EN.AddText(ID_AUTO_EQUIP_0, "EQUIP!");
			LANGUAGE_EN.AddText(ID_AUTO_HIT_0, "HIT!");
			LANGUAGE_EN.AddText(ID_AUTO_AIM_0, "AIM!");
			LANGUAGE_EN.AddText(ID_AUTO_OPTIONS_0, "Options");
			LANGUAGE_EN.AddText(ID_AUTO_IN_0, "In Your FACE !!!");
			LANGUAGE_EN.AddText(ID_AUTO_SUBMIT_0, "Submit!");
			LANGUAGE_EN.AddText(ID_AUTO_HIGHSCORE_0, "Highscore");
			LANGUAGE_EN.AddText(ID_AUTO_BUY_1, "Buy!");
			LANGUAGE_EN.AddText(ID_AUTO_CHALLENGE_A_0, "Challenge\na Friend");
			LANGUAGE_EN.AddText(ID_AUTO_INVENTORY_0, "Inventory");
			LANGUAGE_EN.AddText(ID_AUTO_START_0, "Start");
			LANGUAGE_EN.AddText(ID_AUTO_BACK_0, "Back");
			LANGUAGE_EN.AddText(ID_AUTO_WHO_0, "Who Cares?");
			LANGUAGE_EN.AddText(ID_AUTO_DONE__0, "Done!");
			LANGUAGE_EN.AddText(ID_AUTO_REVENGE__0, "REVENGE!");
			LANGUAGE_EN.AddText(ID_AUTO_TRY_0, "Try this game!");
			LANGUAGE_EN.AddText(ID_AUTO_AGAIN__0, "Again!");
			LANGUAGE_EN.AddText(ID_AUTO_NO_0, "No");
			LANGUAGE_EN.AddText(ID_AUTO_YES_0, "Yes");
			LANGUAGE_EN.AddText(ID_AUTO_OK_0, "OK ! ");
			LANGUAGE_EN.AddText(ID_AUTO_CHALLENGE_4, "Challenge!");
			LANGUAGE_EN.AddText(ID_AUTO_I_LL_0, "I'll beat that!");
			LANGUAGE_EN.AddText(ID_AUTO_CONNECT_0, "Connect!");
			LANGUAGE_EN.AddText(ID_AUTO_DELETE_0, "DELETE ALL!");
			LANGUAGE_EN.AddText(ID_AUTO_CONTROLS_0, "Controls");
			LANGUAGE_EN.AddText(ID_AUTO_SHOP_0, "Shop");
			LANGUAGE_EN.AddText(ID_AUTO_TROPHIES_1, "Trophies");
			LANGUAGE_EN.AddText(ID_AUTO_HOST_1, "host this game");
			LANGUAGE_EN.AddText(ID_AUTO_HOST_2, "Host this game");
			LANGUAGE_EN.AddText(ID_AUTO_CREDITS_0, "Credits");
			LANGUAGE_EN.AddText(ID_AUTO_MORE_0, "more games");
			LANGUAGE_EN.AddText(ID_AUTO_MORE_1, "More Games");
			LANGUAGE_EN.AddText(ID_AUTO_SAVE_0, "Save and Quit to Main Menu");
			LANGUAGE_EN.AddText(ID_AUTO_RETRY_0, "Retry?");
			LANGUAGE_EN.AddText(ID_AUTO__HOMERUN____0, "-Homerun!!-");
			LANGUAGE_EN.AddText(ID_AUTO_TO_0, "To Next Level:");
			LANGUAGE_EN.AddText(ID_AUTO_MAX_0, "max");
			LANGUAGE_EN.AddText(ID_AUTO_MIN_0, "Min");
			LANGUAGE_EN.AddText(ID_AUTO_LEVEL_0, "Level Up!");
			LANGUAGE_EN.AddText(ID_AUTO_GREAT_0, "GREAT!");
			LANGUAGE_EN.AddText(ID_AUTO_S_0, "s");
			LANGUAGE_EN.AddText(ID_AUTO_U_0, "u");
			LANGUAGE_EN.AddText(ID_AUTO_N_0, "n");
			LANGUAGE_EN.AddText(ID_AUTO_O_0, "o");
			LANGUAGE_EN.AddText(ID_AUTO_B_0, "B");
			LANGUAGE_EN.AddText(ID_AUTO___4, "!");
			LANGUAGE_EN.AddText(ID_AUTO_T_0, "t");
			LANGUAGE_EN.AddText(ID_AUTO_H_0, "h");
			LANGUAGE_EN.AddText(ID_AUTO_S_1, "S");
			LANGUAGE_EN.AddText(ID_AUTO_R_0, "r");
			LANGUAGE_EN.AddText(ID_AUTO_E_0, "e");
			LANGUAGE_EN.AddText(ID_AUTO_L_0, "l");
			LANGUAGE_EN.AddText(ID_AUTO_I_0, "i");
			LANGUAGE_EN.AddText(ID_AUTO_K_0, "K");
			LANGUAGE_EN.AddText(ID_AUTO___5, "+");
			LANGUAGE_EN.AddText(ID_AUTO_MED_0, "med");
			LANGUAGE_EN.AddText(ID_AUTO_LOW_0, "low");
			LANGUAGE_EN.AddText(ID_AUTO_HIGH_0, "high");
			LANGUAGE_EN.AddText(ID_AUTO_SOUND_1, "sound");
			LANGUAGE_EN.AddText(ID_AUTO_MUSIC_1, "music");
			LANGUAGE_EN.AddText(ID_AUTO_PAUSE_0, "Pause");
			LANGUAGE_EN.AddText(ID_AUTO_QUALITY_1, "quality");
			LANGUAGE_EN.AddText(ID_AUTO_MAX__0, "Max!");
			LANGUAGE_EN.AddText(ID_AUTO_SEND_0, "Send the Geek flying by clicking with your mouse twice!");
			LANGUAGE_EN.AddText(ID_AUTO_MANEUVER_0, "Maneuver him around mid-air with the arrows!");
			LANGUAGE_EN.AddText(ID_AUTO_PUNCH_0, "Punch him again by clicking just as he's about to hit the ground!");
			LANGUAGE_EN.AddText(ID_AUTO_COMPLETE_0, "Complete Achievements and earn shiny diamonds!!");
			LANGUAGE_EN.AddText(ID_AUTO__CONTROLS__0, "-Controls-");
			LANGUAGE_EN.AddText(ID_AUTO_MARC_ANTOINE_0, "Marc-Antoine Jean");
			LANGUAGE_EN.AddText(ID_AUTO_SIMON_0, "Simon Lachance");
			LANGUAGE_EN.AddText(ID_AUTO_CHRIS_0, "To all awesome flash developer\nwho create and give free game,\nand receive bad and unconstructive comments\n for all their efforts\n---\nareagle\nrocketman\nozdy\nrosedragon\npault107\nbenologist\nVortixGamesStudio\nGMaker0507\nZrbNG\nDJamieson\nrobscherer123\nMehled\nsbat\neduGameDev\nKidgamez\nkevintrepanier\nhybrid\nXDdev\nDVGmusic\ntriplefox\nGamingYourWay\nTightyWhitey\nl33tSt0rmy\nstupidlikeafox\nDudeJonne\ncongruent2006\nSiamJai\nanchux\nimperator87\n\nChris Hughes and all the Team from\nflash Game License");
			LANGUAGE_EN.AddText(ID_AUTO_ARTS_0, "Arts");
			LANGUAGE_EN.AddText(ID_AUTO_PROGRAMMING_0, "Programming");
			LANGUAGE_EN.AddText(ID_AUTO_DIRECTOR_0, "Director");
			LANGUAGE_EN.AddText(ID_AUTO_SPECIAL_0, "Special thanks");
			LANGUAGE_EN.AddText(ID_AUTO_GAME_1, "Game Design");
			LANGUAGE_EN.AddText(ID_AUTO_SNEAKY_0, "Sneaky Nerd : Alexander Khaskin\nSpacejam : Marc Pattison\nBums & Noses : Dynamedion Royalty-free\nThese Go To 11 : Peter Armstrong");
			LANGUAGE_EN.AddText(ID_AUTO_MUSICS_0, "Musics");
			LANGUAGE_EN.AddText(ID_AUTO_SPONSOR_0, "Sponsor");
			LANGUAGE_EN.AddText(ID_AUTO_POWERED_0, "Powered by");
			LANGUAGE_EN.AddText(ID_AUTO_BETA_0, "Beta test");
			LANGUAGE_EN.AddText(ID_AUTO_PASCAL_0, "Pascal Gagnon ");
			LANGUAGE_EN.AddText(ID_AUTO_IN_1, "In your face!!!");
			LANGUAGE_EN.AddText(ID_AUTO_CHALLENGING__0, "challenging:");
				
			LANGUAGE_EN.AddText(ID_YOUR_PWNY_SCORE, "Your puny little record as been totally pwned by [x]. Noob.");
			LANGUAGE_EN.AddText(ID_SCORED, "Scored");
			LANGUAGE_EN.AddText(ID_LOCKED, "LOCKED!");
			LANGUAGE_EN.AddText(ID_MSG, "English");
			LANGUAGE_EN.AddText(ID_CASH, "Cash");
			
			LANGUAGE_EN.AddText(ID_DISTANCE, "Distance: [x]\'");
			
			LANGUAGE_EN.AddText(ID_FEET_HIT, "Feet Hit!!!");
			LANGUAGE_EN.AddText(ID_HEIGHT, "Height: [x]\'");
			LANGUAGE_EN.AddText(ID_LEVEL, "Level");
			LANGUAGE_EN.AddText(ID_LVL, "Lvl.");
			LANGUAGE_EN.AddText(ID_TROPHY, "Trophy");
			LANGUAGE_EN.AddText(ID_UNLOCKED, "unlocked");
			LANGUAGE_EN.AddText(ID_SCORE_TO_BEAT, "Score To beat");
			LANGUAGE_EN.AddText(ID_CHALLENGE, "Challenge");
			LANGUAGE_EN.AddText(ID_PLAYER_NAME_CHALLENGE, "[x]'s\n Challenge");
			
			LANGUAGE_EN.AddText(ID_QUESTION_CHALLENGE_SET, "You are now challenging :\n[x]\n\n Score To beat : \n[y]");
			LANGUAGE_EN.AddText(ID_YOU_HAVE_BEAT_CHALLENGE, "You have beaten [x] challenge!");
			
			
			LANGUAGE_EN.AddText(ID_BALLON_REQUIREMENTS, "Reach [x] feet with Etienne.");
			LANGUAGE_EN.AddText(ID_MATHIEU_REQUIREMENTS, "Reach [x] feet with Lachhh.");
			LANGUAGE_EN.AddText(ID_TITI_REQUIREMENTS, "Reach [x] feet with Marcus.");			
			
			
			LANGUAGE_EN.AddText(ID_QUESTION_NOT_ENOUGH_MONEY, "Go get some more money noobz!!!\nPff, worst try ever... lolz roflmao!");
			LANGUAGE_EN.AddText(ID_QUESTION_NOT_ENOUGH_DIAMOND, "Go get some more diamonds noobz!!!\nUnlock achievements THEN come back!");
			
			
			LANGUAGE_EN.AddText(ID_QUESTION_DELETE_ALL1, "This will DESTROY all progress you have made so far, are we clear?!");
			LANGUAGE_EN.AddText(ID_QUESTION_DELETE_ALL2, "Are you REALLY sure you want to delete your progress?");
			LANGUAGE_EN.AddText(ID_QUESTION_DELETE_ALL3, "You confirm that you WON'T sue us after deleting your own progress?");
			LANGUAGE_EN.AddText(ID_QUESTION_DELETE_ALL4_NO, "Your saved files have NOT been deleted, everything's fine.  Don't worry. (Phew, That was close!)");
			LANGUAGE_EN.AddText(ID_QUESTION_DELETE_ALL4_YES, "There you go then!  Step 0 again! Good Luck!");
			
			
		
			LANGUAGE_EN.AddText(ID_PERSO_ETIENNE, "Étienne");
			LANGUAGE_EN.AddText(ID_PERSO_LACHHH, "Lachhh");
			LANGUAGE_EN.AddText(ID_PERSO_MARC, "Marcus");
			LANGUAGE_EN.AddText(ID_PERSO_MATHIEU, "Mathieu");
			LANGUAGE_EN.AddText(ID_PERSO_VINCENT, "Ballon");
			LANGUAGE_EN.AddText(ID_PERSO_TITI, "Titi Z9944-X");
			LANGUAGE_EN.AddText(ID_PERSO_DENIZE, "Denize");
						
			LANGUAGE_EN.AddText(ID_SETTINGS_ON, "On");
			LANGUAGE_EN.AddText(ID_SETTINGS_OFF, "Off");
			LANGUAGE_EN.AddText(ID_SETTINGS_LOW, "Low");
			LANGUAGE_EN.AddText(ID_SETTINGS_MED, "Med");
			LANGUAGE_EN.AddText(ID_SETTINGS_HIGH, "High");
			LANGUAGE_EN.AddText(ID_SETTINGS_ENGLISH, "English");
			LANGUAGE_EN.AddText(ID_SETTINGS_FRENCH, "Français");
			LANGUAGE_EN.AddText(ID_SETTINGS_CHINESE, "Chinese");
			
			
			LANGUAGE_EN.AddText(ID_SETTINGS_WINTER, "Winter");
			LANGUAGE_EN.AddText(ID_SETTINGS_SUMMER, "Summer");
			LANGUAGE_EN.AddText(ID_SETTINGS_FALLS, "Falls");
			LANGUAGE_EN.AddText(ID_SETTINGS_SPRING, "Spring");
			LANGUAGE_EN.AddText(ID_SETTINGS_RANDOM, "Cycle");
			
			LANGUAGE_EN.AddText(ID_HERO_LVL_UP_QUOTE_1, "Yeaaahhhhhh! Bring it on!");
			LANGUAGE_EN.AddText(ID_HERO_LVL_UP_QUOTE_2, "It's geek tossing time!");
			LANGUAGE_EN.AddText(ID_HERO_LVL_UP_QUOTE_3, "Rock on!");
			LANGUAGE_EN.AddText(ID_HERO_LVL_UP_QUOTE_4, "Yeah! Feel the power!");
			LANGUAGE_EN.AddText(ID_HERO_LVL_UP_QUOTE_5, "Time to kick some asses!");
			
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_1, "Expansion packs are lame");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_2, "Same gameplay, booooooring.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_3, "Oh wow, ANOTHER rip-off.  They should learn how to code a game.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_4, "Again with premium content? The game's good, their morals aren't.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_5, "LOLZ ! This is so a rip-off of Homerun in Berzerk Land!");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_6, "Nothing new except the visuals, characters, weapons, items, worlds...");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_7, "Game was good but no mute button 2/5.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_8, "Pathetic excuse to promote their mobile game.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_9, "This game has been made a million times before.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_10, "lol..... hamburger clouds.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_11, "Your weapon is not even magical, and I'm like lvl 99 lol. Noob");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_12, "Boobies are better than this game. I’ve never seen any though.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_13, "My mom thinks this game sucks.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_14, "They could at least have made me thinner in this expansion pack.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_15, "This expansion pack is so boring.");
			
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_AFTER_1, "This expansion pack is still lame.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_AFTER_2, "Dodged! I used a dexterity spell +1.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_AFTER_3, "I had my shield lvl 37 on. Whatever.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_AFTER_4, "I lost my magic card +1 on the way ! You're so in trouble!");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_AFTER_5, "I'd own you on D&D anytime.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_AFTER_6, "*Rolling dices* Pew ! Critical hit +37 dmg LOL");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_AFTER_7, "Zzz, uh? Sorry, was sleeping, didn't see your pathetic shot.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_AFTER_8, "Noob shot! Didn't get that far lolz!");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_AFTER_9, "This is physical abuse, I'm suing you.");
			LANGUAGE_EN.AddText(ID_GEEK_QUOTE_AFTER_10, "Missed! I had my invisibility cape.");

			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_1, "Fly Swatter");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_2, "Sausage");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_3, "Cricket bat");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_4, "Hockey Stick");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_5, "Baseball bat");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_6, "Guitar");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_7, "Wrench");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_8, "Shotgun");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_9, "Mace");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_10, "War Hammer");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_11, "Double Axe");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_12, "Frost Sword");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_13, "Hell Sword");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_14, "Dino Smasher");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_15, "Sand Shovel");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_16, "Gorilla Arm");
			LANGUAGE_EN.AddText(ID_EQUIP_WEAPON_17, "Grim's Scythe");
			
			LANGUAGE_EN.AddText(ID_EQUIP_BRACERS_1, "Metal bracer");
			LANGUAGE_EN.AddText(ID_EQUIP_BRACERS_2, "Stud bracer");
			LANGUAGE_EN.AddText(ID_EQUIP_BRACERS_3, "Leather bracer");
			LANGUAGE_EN.AddText(ID_EQUIP_BRACERS_4, "Taped barcer");
			LANGUAGE_EN.AddText(ID_EQUIP_BRACERS_5, "Alien Watch");
			LANGUAGE_EN.AddText(ID_EQUIP_BRACERS_6, "Robot Arm");
			LANGUAGE_EN.AddText(ID_EQUIP_BRACERS_7, "Plaster");
			LANGUAGE_EN.AddText(ID_EQUIP_BRACERS_8, "Gold Ring");
			
			LANGUAGE_EN.AddText(ID_EQUIP_BELT_1, "Fat Bottle");
			LANGUAGE_EN.AddText(ID_EQUIP_BELT_2, "Beer Belt");
			LANGUAGE_EN.AddText(ID_EQUIP_BELT_3, "Chain Belt");
			LANGUAGE_EN.AddText(ID_EQUIP_BELT_4, "Wallet Belt");
			LANGUAGE_EN.AddText(ID_EQUIP_BELT_5, "Walkman");
			LANGUAGE_EN.AddText(ID_EQUIP_BELT_6, "Sunflower Seed bag");
			LANGUAGE_EN.AddText(ID_EQUIP_BELT_7, "Ammo belt");
			LANGUAGE_EN.AddText(ID_EQUIP_BELT_8, "Champion belt");
			
			LANGUAGE_EN.AddText(ID_EQUIP_BANDANA_1, "Beer Bunk Helmet");
			LANGUAGE_EN.AddText(ID_EQUIP_BANDANA_2, "Ninja Headband");
			LANGUAGE_EN.AddText(ID_EQUIP_BANDANA_3, "Rambo Headband");
			LANGUAGE_EN.AddText(ID_EQUIP_BANDANA_4, "Winged Headband");
			LANGUAGE_EN.AddText(ID_EQUIP_BANDANA_5, "Rock Star Headband");
			LANGUAGE_EN.AddText(ID_EQUIP_BANDANA_6, "Demon Horns");
			LANGUAGE_EN.AddText(ID_EQUIP_BANDANA_7, "Wielding Mask");
			LANGUAGE_EN.AddText(ID_EQUIP_BANDANA_8, "Goalie's mask");
			
			LANGUAGE_EN.AddText(ID_EQUIP_XP_PILLS, "Xp Pills");
			
			
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_1, "Everybody has to start somewhere...");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_2, "Yummy indeed, but stay focused, it's for throwing purposes only.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_3, "A whole new way to play cricket.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_4, "Canadian Style! It's aboot time, Heh?!");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_5, "The whole concept of the game start from this piece of wood, heh!");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_6, "With the volume already set to 11.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_7, "Stole from a plumber who thinks he rescues princess.  We told him to stay away from those mushrooms.  Poor guy.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_8, "Ammo not included. Send $1,000 and a tuna sandwich to Berzerk Studio to get some.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_9, "Starting to get serious here.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_10, "Thanks for lending us this Thor, we owe you one.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_11, "For double ze fun.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_12, "We got this sword in exchange for a pogo ball from a stupid kid.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_13, "Even the artist's hand melted drawing that.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_14, "You thought a meteor got rid of dinosaurs? Nope, Dino Smasher did.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_15, "Good at building sand castle, but can also pack some heat when used as a weapon.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_16, "A ripped gorilla arm...That's what you get for throwing barrels at people's head! You bastard.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_WEAPON_17, "Good ol' Grim decided to modernize his stuff a bit, got himself a neat Combine Harvester, so he lend us his trusty scythe! =) ");
		
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BRACERS_1, "+25% of equipped weapon's power.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BRACERS_2, "+15% extra money and XP each round.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BRACERS_3, "+50% Mines and Mechanical Commandos encounters.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BRACERS_4, "+25% extra Power Smash hits each round.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BRACERS_5, "+50% extra Power Smash hits. Auto-forward.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BRACERS_6, "+50% extra Power Smash hits. Power Smashes are easier to pull off.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BRACERS_7, "+150% +Xp");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BRACERS_8, "+20% cash, -15% speed lost when touching ground");
			
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BELT_1, "-30% geek's speed lost when touching ground.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BELT_2, "+50% Spiders and Berzerkers encounters.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BELT_3, "Auto-forward.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BELT_4, "+30% extra money each round.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BELT_5, "Huge stats boost!");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BELT_6, "+100% extra XP each round.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BELT_7, "+50% canon push");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BELT_8, "+20% all encounters");
			
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BANDANA_1, "Auto-forward.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BANDANA_2, "+50% Bees and Cannons encounters.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BANDANA_3, "+25% extra Power Smash hits each round.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BANDANA_4, "+30% extra XP.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BANDANA_5, "+30% extra money and XP each round.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BANDANA_6, "+40% of equipped weapon's power.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BANDANA_7, "+100% Cannon encounters.");
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_BANDANA_8, "Blobs are uneffective.");
			
			LANGUAGE_EN.AddText(ID_EQUIP_DESC_XP_PILLS, "Converts cash into XP. Who would have ever thought old Halloween leftovers could prove so useful after all these years?");
			
			LANGUAGE_EN.AddText(ID_TROPHY_GROUP_1_TITLE, "Distance Trophies");
			LANGUAGE_EN.AddText(ID_TROPHY_GROUP_2_TITLE, "Height Trophies");
			LANGUAGE_EN.AddText(ID_TROPHY_GROUP_3_TITLE, "Power Smash Trophies");
			LANGUAGE_EN.AddText(ID_TROPHY_GROUP_4_TITLE, "Level-Up Trophies");
			LANGUAGE_EN.AddText(ID_TROPHY_GROUP_5_TITLE, "Money Trophies");
			LANGUAGE_EN.AddText(ID_TROPHY_GROUP_6_TITLE, "Beat Friends Trophies");
			LANGUAGE_EN.AddText(ID_TROPHY_GROUP_7_TITLE, "Berzerk Support Trophies");
			LANGUAGE_EN.AddText(ID_TROPHY_GROUP_8_TITLE, "Unique Trophies (1/2)");
			LANGUAGE_EN.AddText(ID_TROPHY_GROUP_9_TITLE, "Unique Trophies (2/2)");
			LANGUAGE_EN.AddText(ID_TROPHY_GROUP_10_TITLE, "Master's Challenges ");
			
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_1, "Local Homerun");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_2, "Regional Homerun");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_3, "National Homerun");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_4, "World Class Homerun");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_5, "Universal Homerun");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_6, "Pop Fly");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_7, "Sky Fly");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_8, "Moon Fly");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_9, "Solar Fly");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_10, "Outer Dimensional Fly");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_11, "Hop-Up!");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_12, "One-Two Punch");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_13, "Good Things Comes in Threes");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_14, "Omnismash!!");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_15, "Young Gun");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_16, "Whacking Veteran ");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_17, "Homerun Hero");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_18, "Legendary Smasher");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_19, "Not a Hobo Anymore");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_20, "Start Bragging Now");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_21, "Enough to Buy All Rambo Tapes");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_22, "More $$$ Than You Can Shake a Stick at");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_23, "In Your Face!");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_24, "That's all you've got?!");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_25, "Ass-Kicking Frenzy");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_26, "Not Cool to be Your Friend...");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_27, "Power buyer");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_28, "Can't stop doing it");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_29, "Bring It!");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_30, "Bar Open");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_31, "Tell The World");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_32, "Hello World !");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_33, "Power Play");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_34, "Top Notch!");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_35, "Can't Wait to Try it!");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_36, "Brutal Shopping");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_37, "A word from our sponsor");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_38, "Me again!");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_39, "I'll be Waiting");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_40, "One Timer Smash Hit");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_41, "Unlimited Homerun");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_42, "Time Warp fly");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_43, "Raging Berzerker");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_44, "Legendary-Power-Hero");
			LANGUAGE_EN.AddText(ID_TROPHY_TITLE_45, "Girls Rocks");
			
			
			
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_1, "Hit the geek 10,000 feet away.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_2, "Hit the geek 50,000 feet away.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_3, "Hit the geek 250,000 feet away. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_4, "Hit the geek 500,000 feet away. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_5, "Hit the geek 1,000,000 feet away. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_6, "Hit the geek 1,000 feet high.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_7, "Hit the geek 3,000 feet high.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_8, "Hit the geek 7,500 feet high. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_9, "Hit the geek 12,000 feet high. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_10, "Hit the geek 20,000 feet high. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_11, "Hit the geek with a Power Smash.  ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_12, "Power Smash the geek twice during the same shot.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_13, "Power Smash the geek three times during the same shot. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_14, "Power Smash the geek four times during the same shot. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_15, "Reach level 5 with any character");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_16, "Reach level 10 with any character");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_17, "Reach level 15 with any character");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_18, "Reach level 20 with any character");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_19, "Earn $500");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_20, "Earn $2500");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_21, "Earn $10,000");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_22, "Earn $100,000");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_23, "Break one of your friend's record.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_24, "Break the record of 5 of your friends. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_25, "Break the record of 10 of your friends. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_26, "Break the record of 20 of your friends. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_27, "Purchased everything in the shop that can be bought with dollars."); //***
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_28, "Hit on the geek once he's walking back"); //***
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_29, "Perform 3 Killer Shot"); //***
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_30, "Share the game on Facebook. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_31, "Share the game on Twitter.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_32, "Login in [x]. "); //***
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_33, "Reach level 10 with all characters.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_34, "Maxed an Attribute. "); //***
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_35, "Purchased an item in the shop.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_36, "Purchased a weapon in the shop. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_37, "Click on our sponsor's logo.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_38, "Hit 100 Bees");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_39, "Wait for the geek to walk all the way back to the left once he has landed.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_40, "Hit the geek with a Power Smash in under 2 seconds after the initial hit.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_41, "Hit the geek 2,000,000 feet away.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_42, "Hit the geek 50,000 feet high.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_43, "Power Smash the geek five times during the same shot.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_44, "Reach level 25 with any character");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC_45, "Play as Denize and hit the geek 50 times");
			
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_1, "Hero of Mechanical Commando 2:Invasion, Tylers proves everyone that being a farmer doesn't keep you from kicking some serious asses driving a mechanoid armored walking battle tank. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_2, "The Pigwiz's main purpose in life is to annoy people that enters their territory by casting nasty spells at them. Oh well, at least they smell like bacon.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_3, "From Swordless Ninja, those guys are nothing more than pathetic losers stuck in their halloween costumes. They need a woman. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_4, "The handy dandy Spikey Stompers inspired lots of revolutionary architechs in their jobs. Now, a luxurious bathroom without a fancy Stompers on the ceiling bleeding all over the place just isn't quite the same. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_5, "Meat trees...You WISH they were real! ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_6, "Some say the Specter Troopers are bad, but in truth, they're just misunderstood teenagers that grew up in anger. I blame the parents.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_7, "Ratman was originally supposed to be Batman's sidekick, but at the last moment a little girly circus boy showed up in green tights and stole the spotlight away from the poor, beleaguered Ratman. Now, he's just a lower thug in Hero's Arms.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_8, "Those frogs are always looking for a challenge. While not beating the crap out of any ninja bean they meat, they enjoy cooking, limbo and embroidery. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_9, "Ok, so those guys' hobby is to brainlessly rush into attack on a bleeding, spikey, organic-looking treasure chest through deadly spikes, fire, lava, monsters, acid, mines, and their dead buddies' corpses all day long. Now that's METAL !! \\m/");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_10, "Some old nuke used in Berzerk Land mainly to power up nuclear-powered amps for guitars while taking a walk outside, since playing unplugged would be totally unmetal and lame.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_11, "Katia's Aircraft. Katia's hot. And dinosaurs rock!");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_12, "The three symbols of Rix's attributes. One you'd got those at level 21, very few asses remained unkicked.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_13, "Mabushi's 1-Ups were quite useful during his quest to find his girlfriend. Gave the little guy some brutal, bean-fueled farts later on that day, though. That's right, fart joke, plain and simple.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_14, "Moving forward on a giant bomb is like running backward.\nP.S. Moonwalking doesn't work.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_15, "The icon of Homerun in Berzerk Land, the Baseball Bat is great to send things flying. Not that good to play hockey, though.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_16, "With such an armor, I wouldn't mind being the goalie in a dart game.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_17, "The main character of Hero's Arms, Rix is small but strong and brave. If you think a wood stick is a boring weapon, just tell yourself he often sticks the tip of it in poop before fighting monsters, that should help.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_18, "A Spiked Ball from Swordless Ninja. Accidently falling asleep on one of those can be lethal, be careful.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_19, "The Thermal Blasters worked great just beside of your Doom Chest to knock off the few guys that might have survive the ride that far. Can also be a lifesaver if your microwaves oven is down at lunch.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_20, "The Beer Cap is worth 10 dollars in Berzerk Land. If this currency was also true in real life, the Berzerk's studio would be a real gold mine.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_21, "The Specter Mech Fighter is one bad mutha. Careful when you see it.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_22, "Used by Rix to refills his life and magic meter. Magic Soda tastes pretty good, Band-Aid not that much. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_23, "Mabushi, star of Swordless Ninja. Some japanese-culture geek say he's not that cool, he's just a bean, don't even have a sword, blah blah blah... Well, at least, HE's got a girlfriend! OH SNAP!");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_24, "The Freezing Blaster was okay in Trap Master, but it really shines when you need to add some ice into your cooler to keep the drinks cold.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_25, "Hmmm Hamburger...:)");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_26, "After all, robots need to get cuddled too!");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_27, "Wow, what a cool shield!! No wait, there's someone behind, it's Rix!!");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_28, "This larva seems pretty happy, it probably never saw it's own reflection in the mirror. BAM!");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_29, "...\n...What a dull trophy.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_30, "It's funny how the woman's legs are in the same angle as the clamps' lower part. Don't think too much here, there's no hidden meaning, just two different drawings put together for fun.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_31, "Those enemy turrets can be really annoying sometimes, but in the end, that's what makes us so attached to them.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_32, "Yeah, sure it's scary and intimidating like this, but it would look stupid and disabled on a hockey ice.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_33, "Open up and say 'Aaaaaah'.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_34, "A secret, organic, bleeding chest guarded by a couple of monsters in a creepy dungeon... We don't know what it contains, but I doubt it's something all family should enjoy...");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_35, "When you ain't sure about something, just throw in a monster truck, everything's always better with more monster trucks.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_36, "Initially an underwear industrial complex for overweight people, those buildings are now used as friendly bases in Mechanical Commando 2: Invasion. Careful not to go too medieval on it when you see one!");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_37, "By seeing Gordzak as he is on this trophy, one would never guess he's a hardcore Ernest's movies fan. Also, he made his armor all by himself out of an old garbage can and some aluminium paper he recycled from some oven baked potatoes.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_38, "Gorbazaki's a low-life demon that hangs around all day long in underwear, scratching his ass... or except maybe for that time he stole stuff from a kid.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_39, "Cézar and Maurice are the keepers of the Doom Chest in Trap Master. When not eating and stomping humans, they're currently writing a book about how to raise children in a 'prehistoric thunderness' way, whatever that means... ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_40, "The ultimate geek from Homerun in Berzerk Land. He represents all of the annoying, overly sarcastic geeks that populates the internet discussion's boards. If you saw one your past comments coming out of him, well, you've been PWNED!!");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_41, "'Hi there! Sergei here! I'm a man in the early thirties, I like snowboarding and 3D puzzles. You might also remember me in 'The Breach', where I kill the shit out of sick monsters in a spaceship gone completely crazy. I'm looking for a nice women that has skills in the kitchen as well as for massage after a long, hard monster- slaughtering day.'");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_42, "Pierre-Luc is a shining exemple of acnea gone bad. That's what happen when you eat too much fast food and do not shower on a daily basis. Tentacles and stuffs.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_43, "The Spider Eye is a vicious flying enemy in The Breach. Also got a judiciary case for voyeurism at its female schoolmates after gym. It really was a crazy time back in the 80's.");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_44, "Gunbot is the star of the game... Gunbot. DUH!!\nIf you think that robot-cowboy-wizards that shoots alien dinosaurs right in their face aren't cool, then just say 'Hi' to mister Boredom and miss Annoying when you see them. I guess they must be close friend to you. ");
			LANGUAGE_EN.AddText(ID_TROPHY_DESC2_45, "He used to be dentist, but then the tool he was using has been declared 'dangerous'. Now he's looking for new customers on some wild planets.");
			
			
			LANGUAGE_EN.AddText(ID_AUTO_GUNBOT_0, "GUNBOT");
			LANGUAGE_EN.AddText(ID_AUTO_THE_BREACH_0, "THE BREACH");
			
			
			//***Init
			LANGUAGE_FR.AddText(ID_AUTO_FULL_VERSION_0, "ESSAIE LA\nVERSION COMPLETE !");
			LANGUAGE_FR.AddText(ID_AUTO_GEEK_FULL_VERSION_0, "C'est trop cool pour toi amateur! Essaie la version complète et relâche le VRAI POUVOIR BERZERK !!!");
			
			LANGUAGE_FR.AddText(ID_AUTO_STATUS_0, "Status");
			LANGUAGE_FR.AddText(ID_AUTO__STATUS__0, "Status");
			LANGUAGE_FR.AddText(ID_AUTO_EQUIP_THIS_IN_INVENTORY_TITLE, "");
			LANGUAGE_FR.AddText(ID_AUTO_EQUIP_THIS_IN_INVENTORY, "Équipe ça à partir de ton inventaire !");
			LANGUAGE_FR.AddText(ID_AUTO_NOT_ENOUGH_PREMIUM_CASH, "T'as pas assez de [x]! Est-ce que t'en veux plus? ");
			LANGUAGE_FR.AddText(ID_AUTO_GET_MORE, "Plus de \n[x]!");
			LANGUAGE_FR.AddText(ID_AUTO_ONLY_ON, "seulement sur");
			LANGUAGE_FR.AddText(ID_AUTO_ITEM_LOCKED, "Cet item est verrouillé pour playhub.com. Pathétique, 0/5.");
			
			LANGUAGE_FR.AddText(ID_AUTO_SIMPLY_GO_TO, "Vas simplement sur :");
			LANGUAGE_FR.AddText(ID_AUTO_FREE_STUFF, "Trucs gratos!");
			LANGUAGE_FR.AddText(ID_AUTO_FREE_STUFF_0, "- Utilise le geek pour provoquer tes amis avec ton message personnalisé !\n- Gagne plus de diamants !\n- Débloque les meilleurs items du jeu!");
			
			LANGUAGE_FR.AddText(ID_AUTO_PROMO_SPONSOR, "De la part de Joe : Impossible de battre mon score, t'es trop nul.");
			LANGUAGE_FR.AddText(ID_AUTO_CONNECT_ON_GS_INYOURFACE, "Connecte-toi à GamerSafe et dis-lui\nDANS TA FACE!");
			LANGUAGE_FR.AddText(ID_AUTO_CONNECT_ON_GS_HIGHSCORE, "Connecte-toi à GamerSafe, défie tes amis et ramasse plus de diamants !");
			LANGUAGE_FR.AddText(ID_AUTO_CHALLENGE_YOU, "Personne ne t'as encore défié !");
			LANGUAGE_FR.AddText(ID_AUTO_AGAINST, "Contre");
			LANGUAGE_FR.AddText(ID_AUTO_FRIENDS_SCORE_LABEL, "*Le pointage d'un ami est la plus grande distance parcourue durant un défi contre vous.");
			LANGUAGE_FR.AddText(ID_AUTO_YOUR_DAILY_HIGHSCORE, "Votre pointage du jour");
			LANGUAGE_FR.AddText(ID_AUTO_YOUR_WEEKLY_HIGHSCORE, "Votre pointage de la semaine");
			
			LANGUAGE_FR.AddText(ID_AUTO_XPBONUS_PILL, "+ [x] XP!");
			LANGUAGE_FR.AddText(ID_AUTO_GS_PLAYER_ONLY, "Seulement sur\nGamerSafe!");
			LANGUAGE_FR.AddText(ID_AUTO_ITS_FREE, "C'est GRATUIT!");
			LANGUAGE_FR.AddText(ID_AUTO_UNLOCKED_0, "GAGNÉ!");
			LANGUAGE_FR.AddText(ID_AUTO_EARN_MORE_TO_UNLOCK, "Ramasse plus de diamants pour gagner ceci !");
			
			LANGUAGE_FR.AddText(ID_AUTO_TOTAL_DIAMONDS_FROM_ACH_0, "Total des diamants gagnés par des succès.");
			LANGUAGE_FR.AddText(ID_AUTO_MY_DIAMONDS, "MES DIAMANTS");
			LANGUAGE_FR.AddText(ID_AUTO_FORMULA_1, "Personne qui t'ont défié : ");
			LANGUAGE_FR.AddText(ID_AUTO_FORMULA_2, "Jours joués : ");
			LANGUAGE_FR.AddText(ID_AUTO_FORMULA_3, "Personnes défiées : ");
			LANGUAGE_FR.AddText(ID_AUTO_FORMULA_4, "Diamants gagnés avec les succès : ");
			LANGUAGE_FR.AddText(ID_AUTO_FORMULA_5, "Diamants achetés : ");
			
			LANGUAGE_FR.AddText(ID_AUTO_MESS_WITH_LACHHH, "DANS TA FACE !!!\nC'est ce qui arrive quand tu niaises avec le programmeur de ton jeu !");
			LANGUAGE_FR.AddText(ID_AUTO_DISCLAIMER_EN, "-DISCLAIMER-\n***The comments you will see from Comeau in this game are actual comments we saw on gaming boards during the last year.***\n\nDo not, by any mean, try to immitate what you will see in this game. What happen in Berzerk Land must stay in Berzark land. Do NOT hurt geeks! None of them has been hurt during the making of this game.\n\n(Except for Lachhh, but it's okay, he's a professionnal coder, he knows the drill.)\nGeeks, although really annoying, are living ...\"creatures\"... and deserves respect, like any other living stuff.\n\nOkay? Good!\nNow let's playball !!!\n\nMarc-A. Jean, Homerun's director");
			LANGUAGE_FR.AddText(ID_AUTO_DISCLAIMER_FR, "-AVIS-\n***Les commentaires exprimés par Comeau dans ce jeu sont de véritables commentaires lus sur des forums de discussions sur les jeux au cours de la dernière année.***\n\nVous ne devez pas, d'aucune façon que ce soit, essayer d'imiter ce que vous verrez dans ce jeu. Ce qui se passe à Berzerk Land doit rester à Berzerk Land.  Ne PAS molester les geeks ! Aucun d'entre eux n'a été molester durant la production de ce jeu.\n(À part peut-être pour Lachhh, mais ça va, c'est un programmeur professionnel, il connaît la musique.)\n\nLes geeks, bien que franchement détestables, sont des...\"créatures\"...vivantes et méritent le respect  comme n'importe quel autre truc vivant.\n\nD'accord ? Bien !\nC'est parti !\n\nMarc-A. Jean, Directeur de Homerun");
			
			LANGUAGE_FR.AddText(ID_AUTO_DISCLAIMER2_EN, "Hey Guys!\n\n We’ve created an awesome expansion pack: a brand new look for the game, new weapons, new items, and a sexy new character! \n\nAnd you know what? The game’s sequel is coming up!  As we know how hard it will be to wait for this next geek-smashing rumble, we made that expansion pack so that in the meantime, you finally get a chance to beat your friends! \n\nWe've also ported the game to iPhone, iPod Touch and iPad, so go check it out! \n\nYou're all awesome!");
			LANGUAGE_FR.AddText(ID_AUTO_DISCLAIMER2_FR, "Salut !\nOn a fait de nouvelles armes et items, un nouveau personnage sexy et un tout nouveau look dans cet expansion !\n\nEt vous savez quoi ? La suite du jeu s'en viens ! Alors au lieu de vous laisser attendre trop longtemps pour un autre baston de geek, on a fait cet expansion pour vous donner la chance d'enfin vaincre vos amis !  Le jeu est aussi disponible sur iPhone et iPod Touch, allez voir ça !\n\nVous êtes génial !");
			LANGUAGE_FR.AddText(ID_AUTO_DISCLAIMER2_CREW_EN, "- the Berzerk Crew");
			LANGUAGE_FR.AddText(ID_AUTO_DISCLAIMER2_CREW_FR, "- la crew de Berzerk");
			
			
			LANGUAGE_FR.AddText(ID_AUTO_GROUP_0, "Total de groupe:");
			LANGUAGE_FR.AddText(ID_AUTO_TOTAL_0, "TOTAL : ");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHIES_0, "Trophées déverrouillés: ");
			LANGUAGE_FR.AddText(ID_AUTO_X_0, "x");
			LANGUAGE_FR.AddText(ID_AUTO_ONE_0, "La dernière étape !");
			LANGUAGE_FR.AddText(ID_AUTO_YOU_0, "Vous devez être connecté à GamerSafe pour avoir votre propre lien ! C'est facile, et c'est gratuit !");
			LANGUAGE_FR.AddText(ID_AUTO_AND_0, "et recevez");
			LANGUAGE_FR.AddText(ID_AUTO_X__0, "x5 !");
			LANGUAGE_FR.AddText(ID_AUTO_CREDITS_SCROLL_0, "Générique");
			LANGUAGE_FR.AddText(ID_AUTO_CHALLENGE_0, "Défiez vos amis,\n ça rapporte");
			LANGUAGE_FR.AddText(ID_AUTO_____0, "!!!");
			LANGUAGE_FR.AddText(ID_AUTO_HOW_0, "Comment je peux gagner un max de ça ?");
			LANGUAGE_FR.AddText(ID_AUTO_STRENGTH_0, "Force: Augmente votre force de frappe !");
			LANGUAGE_FR.AddText(ID_AUTO_POWER_0, "Puissance: Plus c'est haut, plus forts seront vos homeruns !");
			LANGUAGE_FR.AddText(ID_AUTO_ACCURACY_0, "Précision: Ralentit les jauges et augmente vos Power Smashes !");
			LANGUAGE_FR.AddText(ID_AUTO_CONTROL_0, "Contrôle: Ajoute du rebond sur les ennemis. Améliore le contrôle aérien !");
			LANGUAGE_FR.AddText(ID_AUTO_SOLD_0, "ÉPUISÉ!");
			LANGUAGE_FR.AddText(ID_AUTO_NEW__0, "WOW!");
			LANGUAGE_FR.AddText(ID_AUTO_________0, "1,000!!");
			LANGUAGE_FR.AddText(ID_AUTO_CHALLENGE_1, "Défiez vos amis et \ngagnez des diamants !");
			LANGUAGE_FR.AddText(ID_AUTO_POWER_1, "Power Chord-like\nNiveau Supérieur !!");
			LANGUAGE_FR.AddText(ID_AUTO_PARTY_0, "ÇA DÉCHIRE !!!");
			LANGUAGE_FR.AddText(ID_AUTO_KICKASS___0, "Botte-cul !!");
			LANGUAGE_FR.AddText(ID_AUTO__TROPHIES__0, "-trophées-");
			LANGUAGE_FR.AddText(ID_AUTO_CHALLENGE_2, "Défiez vos amis et \recevez des items précieux !");
			LANGUAGE_FR.AddText(ID_AUTO__SHOP__0, "-Magasin-");
			LANGUAGE_FR.AddText(ID_AUTO__CHALLENGE__0, "-DÉFI-");
			LANGUAGE_FR.AddText(ID_AUTO_JUST_0, "Refilez ce lien à vos amis !");
			LANGUAGE_FR.AddText(ID_AUTO_SHARE_0, "Partagez ça sur: ");
			LANGUAGE_FR.AddText(ID_AUTO_AND_1, "et recevez INSTANTANÉMENT");
			LANGUAGE_FR.AddText(ID_AUTO_TAUNT_0, "Provoquez vos amis! ");
			LANGUAGE_FR.AddText(ID_AUTO__DIAMONDS__0, "-DIAMANTS-");
			LANGUAGE_FR.AddText(ID_AUTO_HERE_S_0, "Voici deux façon de gagner des diamants plus rapidement:");
			LANGUAGE_FR.AddText(ID_AUTO_CHALLENGE_3, "DÉFIEZ VOS AMIS");
			LANGUAGE_FR.AddText(ID_AUTO_GAMER_0, "GAMER GOLD");
			LANGUAGE_FR.AddText(ID_AUTO___0, "- C'est GRATUIT et c'est le moyen le plus facile d'accumuler des diamants!");
			LANGUAGE_FR.AddText(ID_AUTO___1, "- Vous voulez tout le matos ET supporter Berzerk Studio ?");
			LANGUAGE_FR.AddText(ID_AUTO___2, "= 400 GG");
			LANGUAGE_FR.AddText(ID_AUTO_X___0, "x100");
			LANGUAGE_FR.AddText(ID_AUTO___3, "= 800 GG");
			LANGUAGE_FR.AddText(ID_AUTO_X___1, "x250");
			LANGUAGE_FR.AddText(ID_AUTO______0, "  1200 GG");
			LANGUAGE_FR.AddText(ID_AUTO_X____0, "x500=");
			LANGUAGE_FR.AddText(ID_AUTO_ALL_0, "Tous ceux qui sont dans le vent le font !");
			LANGUAGE_FR.AddText(ID_AUTO_SIMON_BERZERKSTUDIO_COM_0, "simon@berzerkstudio.com");
			LANGUAGE_FR.AddText(ID_AUTO_NOTE_0, "Note to Sponsor ! ");
			LANGUAGE_FR.AddText(ID_AUTO_HEY_0, "Hey there!\n\nAs you will see, this game features a new viral distribution system that reward players who distribute the game.  This feature use the new technology offered by GamerSafe only : LevelVault.\n\nThe player is asked to share his link, exemple : \n\"www.YOURSITEHERE.com/homerun_in_berzerk_land?friend=Lachhh\"\n\nThe more he share the link, the more he get rewarded, simple !  Plus, players can send customized taunts to their friends for more personalized fun !\n\nAlso, the player who challenge another doesn't need to be logged in GamerSafe at all ! \n\nFinally, everytime the player open the game, he get rewards regarding the # of plays he generated AND # of new players he dragged into the game.  \n\nFor more details about the game or the system, please email us at : \n\nEnjoy !\n              - The Berzerk Team");
			LANGUAGE_FR.AddText(ID_AUTO_YOUR_0, "Votre pointage");
			LANGUAGE_FR.AddText(ID_AUTO____0, "1.");
			LANGUAGE_FR.AddText(ID_AUTO____1, "2.");
			LANGUAGE_FR.AddText(ID_AUTO____2, "3.");
			LANGUAGE_FR.AddText(ID_AUTO____3, "4.");
			LANGUAGE_FR.AddText(ID_AUTO____4, "5.");
			LANGUAGE_FR.AddText(ID_AUTO_YOU_1, "Vous cherchez un ami en particulier ? \nRendez-vous simplement sur ce lien et remplacez la dernière partie par son nom GamerSafe !");
			LANGUAGE_FR.AddText(ID_AUTO__HIGHSCORES__0, "-Pointage-");
			LANGUAGE_FR.AddText(ID_AUTO__OPTIONS__0, "-Options-");
			LANGUAGE_FR.AddText(ID_AUTO_MUSIC_0, "Musique");
			LANGUAGE_FR.AddText(ID_AUTO_SOUND_0, "Effets sonores");
			LANGUAGE_FR.AddText(ID_AUTO_QUALITY_0, "Qualité");
			LANGUAGE_FR.AddText(ID_AUTO_LANGUAGE_0, "Language");
			LANGUAGE_FR.AddText(ID_AUTO_SEASON_0, "Saison");
			LANGUAGE_FR.AddText(ID_AUTO_YOUR_1, "Vos compétences de lancer de geek sont incroyables !!!");
			LANGUAGE_FR.AddText(ID_AUTO_YOU_2, "Vous avez déverouillé:");
			LANGUAGE_FR.AddText(ID_AUTO_NOW_0, "Allez, prenez votre revanche !");
			LANGUAGE_FR.AddText(ID_AUTO_SAY_0, "Dîtes-le haut et fort !");
			LANGUAGE_FR.AddText(ID_AUTO__IN_0, "-DANS TA FACE !-");
			LANGUAGE_FR.AddText(ID_AUTO_GAME_0, "Jeu complété !");
			LANGUAGE_FR.AddText(ID_AUTO_FOLLOW_0, "Suivez nous sur : ");
			LANGUAGE_FR.AddText(ID_AUTO_YOU_VE_0, "Vous avez complété le jeu au complet ! \n\nMaintenant, essayez de rehausser votre pointage, remportez tous les succès et compétitionnez avec vos amis !");
			LANGUAGE_FR.AddText(ID_AUTO__INVENTORY__0, "-Inventaire-");
			LANGUAGE_FR.AddText(ID_AUTO_PTS_0, "Pts");
			LANGUAGE_FR.AddText(ID_AUTO_FOLLOW_1, "Suivez Berzerk Studio sur:");
			LANGUAGE_FR.AddText(ID_AUTO__CREDITS__0, "-Générique-");
			LANGUAGE_FR.AddText(ID_AUTO__CHARACTER_0, "-Sélection de personnages-");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_1, "TYLER");
			LANGUAGE_FR.AddText(ID_AUTO_MECHANICAL_0, "MECHANICAL COMMANDO");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_2, "PIGWIZ");
			LANGUAGE_FR.AddText(ID_AUTO_HERO_S_0, "HERO'S ARMS");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_3, "SAMURAI MASQUÉ");
			LANGUAGE_FR.AddText(ID_AUTO_SWORDLESS_0, "SWORDLESS NINJA");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_4, "ÉCRASEUR DENTELÉ");
			LANGUAGE_FR.AddText(ID_AUTO_TRAP_0, "TRAP MASTER");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_5, "ARBRE À VIANDE");
			LANGUAGE_FR.AddText(ID_AUTO_HOMERUN_0, "HOMERUN IN BERZERK LAND");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_6, "SOLDAT SPECTRE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_7, "RATMAN");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_8, "GRENOUILLE CHALLENGER");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_9, "CHASSEURS DE TRÉSOR");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_10, "VIEILLE OGIVE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_11, "AVION DE KATIA");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_12, "PUISSANCE, VIE ET MAGIE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_13, "1-UP DE MABUSHI");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_14, "BOMBARDIER ROULANT");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_15, "BÂTON DE BASEBALL");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_16, "ARMURE MÉCANIQUE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_17, "RIX");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_18, "BOULE PIQUANTE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_19, "CRACHEUR THERMIQUE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_20, "BOUCHON DE BIÈRE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_21, "COMBATTANT MÉCANIQUE SPECTRE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_22, "PANSEMENT & SODA MAGIQUE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_23, "MABUSHI");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_24, "CRACHEUR GLACIAL");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_25, "NUAGE HAMBURGER");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_26, "TROUSSE DE RÉPARATION");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_27, "RIX MAXIMAL");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_28, "LARVE JOYEUSE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_29, "ENSEMBLE DE BLOCS");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_30, "STATUE DE GLACE FEMME & OUTIL");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_31, "TOURELLE ENNEMIS");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_32, "PIEUVRE GÉANTE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_33, "MÂCHOIRE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_34, "COFFRE MAUDIT");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_35, "CAMIONOSAURE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_36, "BASE ALLIÉE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_37, "GORDZAK");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_38, "GORBAZAKI");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_39, "CÉZAR ET MAURICE");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_40, "COMEAU LE GEEK");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_41, "SERGEI");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_42, "PIERRE-LUC");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_43, "Peil-Araignée");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_44, "GUNBOT");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHYNAME_45, "LÉZARMURE");
			LANGUAGE_FR.AddText(ID_AUTO__________0, "********");
			LANGUAGE_FR.AddText(ID_AUTO_ITEMS_0, "Items");
			LANGUAGE_FR.AddText(ID_AUTO_BEFORE_0, "Avant");
			LANGUAGE_FR.AddText(ID_AUTO_AFTER_0, "Après");
			LANGUAGE_FR.AddText(ID_AUTO_PREMIUM_0, "Précieux");
			LANGUAGE_FR.AddText(ID_AUTO_WEAPONS_0, "Armes");
			LANGUAGE_FR.AddText(ID_AUTO_ALL_1, "Tous les temps");
			LANGUAGE_FR.AddText(ID_AUTO_FRIENDS_0, "Amis");
			LANGUAGE_FR.AddText(ID_AUTO_WEEKLY_0, "Hebdomadaire");
			LANGUAGE_FR.AddText(ID_AUTO_DAILY_0, "Quotidien");
			LANGUAGE_FR.AddText(ID_AUTO_____1, "1/2");
			LANGUAGE_FR.AddText(ID_AUTO_____2, "2/2");
			LANGUAGE_FR.AddText(ID_AUTO_BUY_0, "ACHETER !");
			LANGUAGE_FR.AddText(ID_AUTO_HOST_0, "Héberger ce jeu !");
			LANGUAGE_FR.AddText(ID_AUTO_EQUIP_0, "ÉQUIPER !");
			LANGUAGE_FR.AddText(ID_AUTO_HIT_0, "COGNEZ !");
			LANGUAGE_FR.AddText(ID_AUTO_AIM_0, "VISEZ !");
			LANGUAGE_FR.AddText(ID_AUTO_OPTIONS_0, "Options");
			LANGUAGE_FR.AddText(ID_AUTO_IN_0, "Dans ta FACE !!!");
			LANGUAGE_FR.AddText(ID_AUTO_SUBMIT_0, "Soumettre !");
			LANGUAGE_FR.AddText(ID_AUTO_HIGHSCORE_0, "Pointage");
			LANGUAGE_FR.AddText(ID_AUTO_BUY_1, "Acheter !");
			LANGUAGE_FR.AddText(ID_AUTO_CHALLENGE_A_0, "Défier\nun(e) ami(e)");
			LANGUAGE_FR.AddText(ID_AUTO_INVENTORY_0, "Inventaire");
			LANGUAGE_FR.AddText(ID_AUTO_START_0, "Commencer");
			LANGUAGE_FR.AddText(ID_AUTO_BACK_0, "Retour");
			LANGUAGE_FR.AddText(ID_AUTO_WHO_0, "Rien à foutre !");
			LANGUAGE_FR.AddText(ID_AUTO_DONE__0, "Go!");
			LANGUAGE_FR.AddText(ID_AUTO_REVENGE__0, "REVANCHE!");
			LANGUAGE_FR.AddText(ID_AUTO_TRY_0, "Essayez ce jeu !");
			LANGUAGE_FR.AddText(ID_AUTO_AGAIN__0, "Encore!");
			LANGUAGE_FR.AddText(ID_AUTO_NO_0, "Non");
			LANGUAGE_FR.AddText(ID_AUTO_YES_0, "Oui");
			LANGUAGE_FR.AddText(ID_AUTO_OK_0, "OK ! ");
			LANGUAGE_FR.AddText(ID_AUTO_CHALLENGE_4, "Défier !");
			LANGUAGE_FR.AddText(ID_AUTO_I_LL_0, "J'te pète !");
			LANGUAGE_FR.AddText(ID_AUTO_CONNECT_0, "Se connecter !");
			LANGUAGE_FR.AddText(ID_AUTO_DELETE_0, "EFFACER TOUT !");
			LANGUAGE_FR.AddText(ID_AUTO_CONTROLS_0, "Contrôles");
			LANGUAGE_FR.AddText(ID_AUTO_SHOP_0, "Magasin");
			LANGUAGE_FR.AddText(ID_AUTO_TROPHIES_1, "Trophées");
			LANGUAGE_FR.AddText(ID_AUTO_HOST_1, "Héberger ce jeu");
			LANGUAGE_FR.AddText(ID_AUTO_HOST_2, "Héberger ce jeu");
			LANGUAGE_FR.AddText(ID_AUTO_CREDITS_0, "Crédits");
			LANGUAGE_FR.AddText(ID_AUTO_MORE_0, "Plus de jeux");
			LANGUAGE_FR.AddText(ID_AUTO_MORE_1, "Plus de jeux");
			LANGUAGE_FR.AddText(ID_AUTO_SAVE_0, "Sauvegarder et quitter jusqu'au menu");
			LANGUAGE_FR.AddText(ID_AUTO_RETRY_0, "Réessayer ?");
			LANGUAGE_FR.AddText(ID_AUTO__HOMERUN____0, "-Homerun!!-");
			LANGUAGE_FR.AddText(ID_AUTO_TO_0, "Niveau suivant:");
			LANGUAGE_FR.AddText(ID_AUTO_MAX_0, "Max");
			LANGUAGE_FR.AddText(ID_AUTO_MIN_0, "Min");
			LANGUAGE_FR.AddText(ID_AUTO_LEVEL_0, "Niveau supérieur !");
			LANGUAGE_FR.AddText(ID_AUTO_GREAT_0, "SUPER !");
			LANGUAGE_FR.AddText(ID_AUTO_S_0, "s");
			LANGUAGE_FR.AddText(ID_AUTO_U_0, "u");
			LANGUAGE_FR.AddText(ID_AUTO_N_0, "n");
			LANGUAGE_FR.AddText(ID_AUTO_O_0, "o");
			LANGUAGE_FR.AddText(ID_AUTO_B_0, "B");
			LANGUAGE_FR.AddText(ID_AUTO___4, "!");
			LANGUAGE_FR.AddText(ID_AUTO_T_0, "t");
			LANGUAGE_FR.AddText(ID_AUTO_H_0, "h");
			LANGUAGE_FR.AddText(ID_AUTO_S_1, "S");
			LANGUAGE_FR.AddText(ID_AUTO_R_0, "r");
			LANGUAGE_FR.AddText(ID_AUTO_E_0, "e");
			LANGUAGE_FR.AddText(ID_AUTO_L_0, "l");
			LANGUAGE_FR.AddText(ID_AUTO_I_0, "i");
			LANGUAGE_FR.AddText(ID_AUTO_K_0, "K");
			LANGUAGE_FR.AddText(ID_AUTO___5, "+");
			LANGUAGE_FR.AddText(ID_AUTO_MED_0, "Moy");
			LANGUAGE_FR.AddText(ID_AUTO_LOW_0, "Bas");
			LANGUAGE_FR.AddText(ID_AUTO_HIGH_0, "Haut");
			LANGUAGE_FR.AddText(ID_AUTO_SOUND_1, "Sons");
			LANGUAGE_FR.AddText(ID_AUTO_MUSIC_1, "Musique");
			LANGUAGE_FR.AddText(ID_AUTO_PAUSE_0, "Pause");
			LANGUAGE_FR.AddText(ID_AUTO_QUALITY_1, "Qualité");
			LANGUAGE_FR.AddText(ID_AUTO_MAX__0, "Max !");
			LANGUAGE_FR.AddText(ID_AUTO_SEND_0, "Envoyez valser le Geek en cliquant deux fois avec votre souris !");
			LANGUAGE_FR.AddText(ID_AUTO_MANEUVER_0, "Manoeuvrez-le dans les airs avec les flèches !");
			LANGUAGE_FR.AddText(ID_AUTO_PUNCH_0, "Frappez-le encore juste avant qu'il frappe le sol !");
			LANGUAGE_FR.AddText(ID_AUTO_COMPLETE_0, "Remportez des trophées et méritez des diamants !");
			LANGUAGE_FR.AddText(ID_AUTO__CONTROLS__0, "-Contrôles-");
			LANGUAGE_FR.AddText(ID_AUTO_MARC_ANTOINE_0, "Marc-Antoine Jean");
			LANGUAGE_FR.AddText(ID_AUTO_SIMON_0, "Simon Lachance");
			LANGUAGE_FR.AddText(ID_AUTO_CHRIS_0, "À tous les developpeurs Flash\nqui créent et donnent des jeux gratuits,\net reçoivent des mauvais commentaires\n pour leur efforts\n---\nareagle\nrocketman\nozdy\nrosedragon\npault107\nbenologist\nVortixGamesStudio\nGMaker0507\nZrbNG\nDJamieson\nrobscherer123\nMehled\nsbat\neduGameDev\nKidgamez\nkevintrepanier\nhybrid\nXDdev\nDVGmusic\ntriplefox\nGamingYourWay\nTightyWhitey\nl33tSt0rmy\nstupidlikeafox\nDudeJonne\ncongruent2006\nSiamJai\nanchux\nimperator87\n\nChris Hughes et toute l'équipe de \nFlash Game License ");
			LANGUAGE_FR.AddText(ID_AUTO_ARTS_0, "Arts");
			LANGUAGE_FR.AddText(ID_AUTO_PROGRAMMING_0, "Programmation");
			LANGUAGE_FR.AddText(ID_AUTO_DIRECTOR_0, "Directeur");
			LANGUAGE_FR.AddText(ID_AUTO_SPECIAL_0, "Remerciements spéciaux");
			LANGUAGE_FR.AddText(ID_AUTO_GAME_1, "Conception de jeu");
			LANGUAGE_FR.AddText(ID_AUTO_SNEAKY_0, "Sneaky Nerd : Alexander Khaskin\nSpacejam : Marc Pattison\nBums & Noses : Dynamedion Royalty-free\nThese Go To 11 : Peter Armstrong");
			LANGUAGE_FR.AddText(ID_AUTO_MUSICS_0, "Musique");
			LANGUAGE_FR.AddText(ID_AUTO_SPONSOR_0, "Commanditaire");
			LANGUAGE_FR.AddText(ID_AUTO_POWERED_0, "Supporté par");
			LANGUAGE_FR.AddText(ID_AUTO_BETA_0, "Beta test");
			LANGUAGE_FR.AddText(ID_AUTO_PASCAL_0, "Pascal Gagnon ");
			LANGUAGE_FR.AddText(ID_AUTO_IN_1, "Dans ta face !!!");
			LANGUAGE_FR.AddText(ID_AUTO_CHALLENGING__0, "Défiant:");
				
			
			LANGUAGE_FR.AddText(ID_PERSO_ETIENNE, "Étienne");
			LANGUAGE_FR.AddText(ID_PERSO_LACHHH, "Lachhh");
			LANGUAGE_FR.AddText(ID_PERSO_MARC, "Marcus");
			LANGUAGE_FR.AddText(ID_PERSO_MATHIEU, "Mathieu");
			LANGUAGE_FR.AddText(ID_PERSO_VINCENT, "Ballon");
			LANGUAGE_FR.AddText(ID_PERSO_TITI, "Titi Z9944-X");
			LANGUAGE_FR.AddText(ID_PERSO_DENIZE, "Denize");
			
			LANGUAGE_FR.AddText(ID_SETTINGS_ON, "Avec");
			LANGUAGE_FR.AddText(ID_SETTINGS_OFF, "Sans");
			LANGUAGE_FR.AddText(ID_SETTINGS_LOW, "Bas");
			LANGUAGE_FR.AddText(ID_SETTINGS_MED, "Moy");
			LANGUAGE_FR.AddText(ID_SETTINGS_HIGH, "Haut");
			LANGUAGE_FR.AddText(ID_SETTINGS_ENGLISH, "English");
			LANGUAGE_FR.AddText(ID_SETTINGS_FRENCH, "Français");
			LANGUAGE_FR.AddText(ID_SETTINGS_CHINESE, "Chinese");
			LANGUAGE_FR.AddText(ID_SETTINGS_WINTER, "Hiver");
			LANGUAGE_FR.AddText(ID_SETTINGS_SUMMER, "Été");
			LANGUAGE_FR.AddText(ID_SETTINGS_FALLS, "Automne");
			LANGUAGE_FR.AddText(ID_SETTINGS_SPRING, "Printemps");
			LANGUAGE_FR.AddText(ID_SETTINGS_RANDOM, "Cycle");
			
			LANGUAGE_FR.AddText(ID_HERO_LVL_UP_QUOTE_1, "Amène-toi !");
			LANGUAGE_FR.AddText(ID_HERO_LVL_UP_QUOTE_2, "Ça va être ta fête!");
			LANGUAGE_FR.AddText(ID_HERO_LVL_UP_QUOTE_3, "J'suis au top !");
			LANGUAGE_FR.AddText(ID_HERO_LVL_UP_QUOTE_4, "C'est pas beau ça ?");
			LANGUAGE_FR.AddText(ID_HERO_LVL_UP_QUOTE_5, "Il y en aura pour tout le monde !");
						
			LANGUAGE_FR.AddText(ID_YOUR_PWNY_SCORE, "Votre record s'est fait atomiser par [x]. Noob.");
			LANGUAGE_FR.AddText(ID_SCORED, "Atteint");
			LANGUAGE_FR.AddText(ID_LOCKED, "VERROUILLÉ !");
			LANGUAGE_FR.AddText(ID_MSG, "Français");
			LANGUAGE_FR.AddText(ID_CASH, "Argent");
			LANGUAGE_FR.AddText(ID_DISTANCE, "Distance : [x] \'");
			LANGUAGE_FR.AddText(ID_FEET_HIT, "Pieds !!!");
			LANGUAGE_FR.AddText(ID_HEIGHT, "Hauteur : [x]\'");
			LANGUAGE_FR.AddText(ID_LEVEL, "Niveau");
			LANGUAGE_FR.AddText(ID_LVL, "Nvl.");
			LANGUAGE_FR.AddText(ID_TROPHY, "Trophée");
			LANGUAGE_FR.AddText(ID_UNLOCKED, "Déverrouillé");
			LANGUAGE_FR.AddText(ID_SCORE_TO_BEAT, "Pointage à battre");
			LANGUAGE_FR.AddText(ID_CHALLENGE, "Défi");
			LANGUAGE_FR.AddText(ID_PLAYER_NAME_CHALLENGE, "Défi de \n[x]");
			LANGUAGE_FR.AddText(ID_QUESTION_CHALLENGE_SET, "Vous défiez en ce moment :\n[x]\n\n Pointage à battre : \n[y]");
			LANGUAGE_FR.AddText(ID_YOU_HAVE_BEAT_CHALLENGE, "Vous avez relevé le défi de [x] !");
			
			LANGUAGE_FR.AddText(ID_BALLON_REQUIREMENTS, "Atteignez [x] pieds avec Etienne.");
			LANGUAGE_FR.AddText(ID_MATHIEU_REQUIREMENTS, "Atteignez [x] pieds avec Lachhh.");
			LANGUAGE_FR.AddText(ID_TITI_REQUIREMENTS, "Atteignez [x] pieds avec Marcus.");
			
			LANGUAGE_FR.AddText(ID_QUESTION_NOT_ENOUGH_MONEY, "Faites-vous couper les cheveux, trouvez-vous un vrai travail et revenez quand vous aurez de l'argent !");
			LANGUAGE_FR.AddText(ID_QUESTION_NOT_ENOUGH_DIAMOND, "Hé les SDF ! Vous voulez des diamants ?\nEt bien allez vous chercher quelques trophées et on en reparlera !");
			
			LANGUAGE_FR.AddText(ID_QUESTION_DELETE_ALL1, "Cette action va effacer toute votre progression, on s'entend ? ");
			LANGUAGE_FR.AddText(ID_QUESTION_DELETE_ALL2, "Êtes-vous VRAIMENT sûr que vous voulez effacer vos progrès ?");
			LANGUAGE_FR.AddText(ID_QUESTION_DELETE_ALL3, "Vous confirmez que vous n'allez pas nous poursuivre une fois que ce sera fait ?");
			LANGUAGE_FR.AddText(ID_QUESTION_DELETE_ALL4_NO, "Votre progression n'a PAS été effacé, tout va bien, ne vous inquiétez pas. (Ouf, il était moins une !)");
			LANGUAGE_FR.AddText(ID_QUESTION_DELETE_ALL4_YES, "Voilà ! Retour à la case départ ! Bon courage !");
			
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_1, "Une expansion ça craint");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_2, "Même gameplay, teeeeeellement nul.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_3, "Oh wow, UN AUTRE plagiat.  Vous devriez apprendre à coder.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_4, "Encore des items premium  ? Le jeu est bon, pas vos morales");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_5, "LOLZ ! C'est tellement un plagiat de Homerun in Berzerk Land!");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_6, "Rien de nouveau excepté le visuel, les personnages, les armes, les items...");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_7, "Le jeu était bon mais pas de bouton mute. 2/5.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_8, "Excuse pathétic pour faire la promo du jeu iPhone.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_9, "Ce jeu a été fait des millions de fois.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_10, "lol..... des nuages en hamburger.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_11, "Ton arme n'est même pas magique, et je suis lvl 99 lol. Noob");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_12, "Des nichons c'est mieux que ce jeu, j'en ai jamais vu par contre.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_13, "Ma maman pense que ce jeu est nul.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_14, "Cet expansion aurait dû m'avoir fait plus mince.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_15, "Cet expansion est tellement ennuyant.");
			
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_AFTER_1, "Cet expansion est encore nul.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_AFTER_2, "Évité! J'avais utilisé un sort de dextérité +1.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_AFTER_3, "J'avais un bouclier lvl 37 d'équippé.  Tellement non-effectif.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_AFTER_4, "J'ai perdu ma carte magique sur le chemin ! T'es tellement edans le trouble!");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_AFTER_5, "J'te clanche à D&D n'importe quand.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_AFTER_6, "*Roule des dés* Paw ! Critical hit +37 de dmg LOL");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_AFTER_7, "Zzz, uh ? Désolé, je dormais, J'ai pas vu ton coup pathétique.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_AFTER_8, "Lancé de noob ! Ça n'a même pas été si loin que ça lolz!");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_AFTER_9, "Ceci est un abus physique, j'te poursuis en justice.");
			LANGUAGE_FR.AddText(ID_GEEK_QUOTE_AFTER_10, "Manqué! J'avais ma cape d'invisibilité."); 

			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_1, "Tapette à Mouche");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_2, "Saucisse");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_3, "Bâton de Criquet");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_4, "Bâton de Hockey");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_5, "Bâton de Baseball");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_6, "Guitare");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_7, "Clef Anglaise");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_8, "Fusil à Pompe");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_9, "Massue");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_10, "Marteau de Guerre");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_11, "Hache Double");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_12, "Épée Glaciale");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_13, "Épée Infernale");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_14, "Casseur Dinosaurien");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_15, "Pelle de plage");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_16, "Bras de Gorille");
			LANGUAGE_FR.AddText(ID_EQUIP_WEAPON_17, "La Faucheuse");
			
			
			LANGUAGE_FR.AddText(ID_EQUIP_BRACERS_1, "Bracelet de Métal");
			LANGUAGE_FR.AddText(ID_EQUIP_BRACERS_2, "Bracelet de Piques");
			LANGUAGE_FR.AddText(ID_EQUIP_BRACERS_3, "Bracelet de Cuir");
			LANGUAGE_FR.AddText(ID_EQUIP_BRACERS_4, "Bracelet de Tissue");
			LANGUAGE_FR.AddText(ID_EQUIP_BRACERS_5, "Bracelet Extra-Terrestre");
			LANGUAGE_FR.AddText(ID_EQUIP_BRACERS_6, "Bras Robotique");
			LANGUAGE_FR.AddText(ID_EQUIP_BRACERS_7, "Plâtre");
			LANGUAGE_FR.AddText(ID_EQUIP_BRACERS_8, "Bracelet");
			
			LANGUAGE_FR.AddText(ID_EQUIP_BELT_1, "Bouteille de Gras");
			LANGUAGE_FR.AddText(ID_EQUIP_BELT_2, "Barillet de Bière");
			LANGUAGE_FR.AddText(ID_EQUIP_BELT_3, "Ceinture de Chaîne");
			LANGUAGE_FR.AddText(ID_EQUIP_BELT_4, "Bourse");
			LANGUAGE_FR.AddText(ID_EQUIP_BELT_5, "Lecteur de Cassettes");
			LANGUAGE_FR.AddText(ID_EQUIP_BELT_6, "Sac de Graines de Tournesol");
			LANGUAGE_FR.AddText(ID_EQUIP_BELT_7, "Ceinture de balles");
			LANGUAGE_FR.AddText(ID_EQUIP_BELT_8, "Ceinture de champion");
			
			LANGUAGE_FR.AddText(ID_EQUIP_BANDANA_1, "Casque de Bière");
			LANGUAGE_FR.AddText(ID_EQUIP_BANDANA_2, "Bandeau de Ninja");
			LANGUAGE_FR.AddText(ID_EQUIP_BANDANA_3, "Bandeau de Rambo");
			LANGUAGE_FR.AddText(ID_EQUIP_BANDANA_4, "Bandeau Ailé");
			LANGUAGE_FR.AddText(ID_EQUIP_BANDANA_5, "Bandeau de Rock Star");
			LANGUAGE_FR.AddText(ID_EQUIP_BANDANA_6, "Bandeau Cornu Démoniaque");
			LANGUAGE_FR.AddText(ID_EQUIP_BANDANA_7, "Masque de soudure");
			LANGUAGE_FR.AddText(ID_EQUIP_BANDANA_8, "Masque de goaler");
			
			LANGUAGE_FR.AddText(ID_EQUIP_XP_PILLS, "Pilules d'XP");
			
			
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_1, "Tout le monde doit commencer quelque part...");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_2, "Ça a l'air bon, c'est sûr, mais restez concentrés...c'est pour frapper seulement.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_3, "Une toute nouvelle façon de jouer au criquet !");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_4, "Style canadien ! Il était temps, non?!");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_5, "Tout le concept du jeu vient de ce morceau de bois après tout !");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_6, "Avec le volume déjà règlé à 11 !");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_7, "Volé d'un plombier qui s'imagine avoir sauvé des princesses...Pauvre type, on lui a dit de rester loin des champignons.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_8, "Cartouches non comprises ! Envoyez 1000$ et un sandwich au thon à Berzerk Studio pour en avoir !");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_9, "Ça devient sérieux là.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_10, "Merci de nous avoir prêté ça Thor, on t'en doit une !");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_11, "Pour deux fois plus de plaisir.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_12, "Nous avons reçu cette épée en échange d'un pogoball d'un enfant un peu demeuré.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_13, "Même la main de l'artiste a fondu en dessinant ce truc !");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_14, "Vous croyez qu'une météorite est venue à bout des dinosaures ? Nah, c'était le Casseur Dinosaurien.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_15, "Bonne pour construire des château de sable, mais peu aussi avoir du répondant lorsqu'utiliser comme une arme.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_16, "Un bras de gorille arraché...C'est ça qui arrive à ceux qui balance des tonneaux à la tête des gens. Enfoiré !");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_WEAPON_17, "Cette bonne vieille Faucheuse a décidée de se moderniser en s'achetant une moissonneuse-batteuse toute neuve, et elle nous prête sa faux !=) ");
			
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BRACERS_1, "+25% à la puissance de l'arme équipée.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BRACERS_2, "+15% d'argent supplémentaire gagné à chaque manche.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BRACERS_3, "+50% de rencontres de Mines et de Mechanical Commandos Mines.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BRACERS_4, "+25% de coups Power Smash supplémentaires à chaque manche.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BRACERS_5, "+50% de coups Power Smash supplémentaires à chaque manche. Poussée automatique.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BRACERS_6, "+50% de coups Power Smash supplémentaires à chaque manche. Les Power Smashes sont plus faciles à réussir.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BRACERS_7, "+150% d'XP");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BRACERS_8, "+20% d'rgent -15% à la perte de vitesse du geek quand il touche le sol.");
			
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BELT_1, "-30% à la perte de vitesse du geek quand il touche le sol.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BELT_2, "+50% de rencontres d'Araignées et de Berzerkers.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BELT_3, "Poussée automatique.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BELT_4, "+30% d'argent supplémentaire gagné à chaque manche.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BELT_5, "Statistiques stéroïdes !");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BELT_6, "+100% d'XP supplémentaire gagné à chaque manche.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BELT_7, "+30% de puissance des canons");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BELT_8, "+20% sur toutes les rencontres");
			
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BANDANA_1, "Poussée automatique.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BANDANA_2, "+50% de rencontres d'Abeilles et de Canons.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BANDANA_3, "+25% de coups Power Smash supplémentaires à chaque manche.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BANDANA_4, "+30% d'XP supplémentaire gagné à chaque manche.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BANDANA_5, "+30% d'argent et d'XP supplémentaire gagné à chaque manche.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BANDANA_6, "+40% à la puissance de l'arme équipée.");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BANDANA_7, "+100% de rencontres de canons");
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_BANDANA_8, "Annule l'effet des blobs");
			
			LANGUAGE_FR.AddText(ID_EQUIP_DESC_XP_PILLS, "Convertissent l'argent en XP. Qui aurait cru que des vieux bonbons d'Halloween auraient pu se montrer si utiles après toutes ces années ?");
			
			LANGUAGE_FR.AddText(ID_TROPHY_GROUP_1_TITLE, "Trophées de Distance");
			LANGUAGE_FR.AddText(ID_TROPHY_GROUP_2_TITLE, "Trophées de Hauteur");
			LANGUAGE_FR.AddText(ID_TROPHY_GROUP_3_TITLE, "Trophées de Power Smash");
			LANGUAGE_FR.AddText(ID_TROPHY_GROUP_4_TITLE, "Trophées de Niveaux");
			LANGUAGE_FR.AddText(ID_TROPHY_GROUP_5_TITLE, "Trophées d'Argent");
			LANGUAGE_FR.AddText(ID_TROPHY_GROUP_6_TITLE, "Trophées de Victoires");
			LANGUAGE_FR.AddText(ID_TROPHY_GROUP_7_TITLE, "Trophées de Support de Berzerk");
			LANGUAGE_FR.AddText(ID_TROPHY_GROUP_8_TITLE, "Trophées Uniques (1/2)");
			LANGUAGE_FR.AddText(ID_TROPHY_GROUP_9_TITLE, "Trophées Uniques (2/2)");
			LANGUAGE_FR.AddText(ID_TROPHY_GROUP_10_TITLE, "Défis des maîtres");
			
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_1, "Homerun Local");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_2, "Homerun Régional");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_3, "Homerun National");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_4, "Homerun Mondial");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_5, "Homerun Universel");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_6, "Petite Chandelle");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_7, "Chandelle Stratosphérique");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_8, "Chandelle Lunaire");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_9, "Chandelle Solaire");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_10, "Chandelle Inter-dimensionnelle");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_11, "Allez, Hop !");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_12, "Un, Deux, Punch !!");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_13, "Jamais Deux Sans Trois");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_14, "Omnismash!!");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_15, "Étoile Montante");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_16, "Vétéran de la Frappe");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_17, "Héros du Homerun");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_18, "Smasher Légendaire");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_19, "Plus jamais un SDF");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_20, "On se la Raconte");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_21, "Assez Pour Acheter Toutes les Cassettes de Rambo");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_22, "De l'Argent à ne Plus Savoir Quoi en Faire");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_23, "Dans ta Face !");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_24, "C'est tout ce que t'as dans le ventre ?!");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_25, "Frénésie Botte-Cul");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_26, "C'est pas Cool d'Être ton Pote...");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_27, "Magasinage Extrême");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_28, "J'peux pas m'arrêter !");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_29, "Amène-toi !");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_30, "À Volonté");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_31, "Dis-le au Monde");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_32, "Salut tout le monde !");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_33, "Jeu de Puissance");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_34, "Au Top !");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_35, "J'ai Hâte de l'Essayer !");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_36, "Magasinage Extrême");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_37, "Un mot de notre sponsor...");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_38, "Encore Moi !");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_39, "J'attendrai...");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_40, "Power Smash sur Réception");
			
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_41, "Homerun Illimité");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_42, "Chandelle Extra-Temporelle");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_43, "Berzerker Enragé");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_44, "Héros-Ultra-Légendaire");
			LANGUAGE_FR.AddText(ID_TROPHY_TITLE_45, "Femme Fatale");			
			
			
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_1, "Frappez le geek à 10,000 pieds de distance.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_2, "Frappez le geek à 50,000 pieds de distance.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_3, "Frappez le geek à 250,000 pieds de distance.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_4, "Frappez le geek à 500,000 pieds de distance.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_5, "Frappez le geek à 1,000,000 pieds de distance.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_6, "Frappez le geek à 1,000 pieds de hauteur.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_7, "Frappez le geek à 3,000 pieds de hauteur.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_8, "Frappez le geek à 7,500 pieds de hauteur.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_9, "Frappez le geek à 12,000 pieds de hauteur.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_10, "Frappez le geek à 20,000 pieds de hauteur.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_11, "Frappez le geek avec un Power Smash.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_12, "Frappez le geek avec un Power Smash deux fois dans la même manche.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_13, "Frappez le geek avec un Power Smash trois fois dans la même manche.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_14, "Frappez le geek avec un Power Smash quatre fois dans la même manche.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_15, "Atteignez le niveau 5 avec n'importe quel personnage.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_16, "Atteignez le niveau 10 avec n'importe quel personnage.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_17, "Atteignez le niveau 15 avec n'importe quel personnage.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_18, "Atteignez le niveau 20 avec n'importe quel personnage.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_19, "Gagnez 500$");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_20, "Gagnez 2500$");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_21, "Gagnez 10,000$");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_22, "Gagnez 100,000$");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_23, "Brisez le record d'un(e) de vos ami(e).");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_24, "Brisez le record de 5 de vos ami(e)s.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_25, "Brisez le record de 10 de vos ami(e)s.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_26, "Brisez le record de 20 de vos ami(e)s.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_27, "Achetez tout ce qui peux s'acheter dans le magasin"); //***
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_28, "Frappez le geek quand il revient à la marche"); //***
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_29, "Réussissez 3 Killer Shots"); //***
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_30, "Partagez le jeu sur Facebook.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_31, "Partagez le jeu sur Twitter.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_32, "Connecte-toi sur [x].");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_33, "Atteignez le niveau 10 avec tous les personnages.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_34, "Maximisez un attribut.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_35, "Achetez un item dans le magasin.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_36, "Achetez une arme dans le magasin.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_37, "Allez sur le site de notre sponsor.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_38, "Frappez 100 abeilles.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_39, "Attendez que le geek revienne à la marche jusqu'au monticule après avoir atterri.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_40, "Frappez le geek avec un Power Smash moins de 2 secondes après le coup initial.");
			
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_41, "Frappez le geek à 2,000,000 pieds de distance.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_42, "Frappez le geek à 50,000 pieds de hauteurs.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_43, "Frappez le geek avec un Power Smash cinq fois dans la même manche.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_44, "Atteignez le niveau 25 avec n'importe quel personnage.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC_45, "Jouez en tant que Denize et frappez le geek 50 fois.");
			
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_1, "Héros de Mechanical Commando 2:Invasion, Tyler prouve à tout le monde qu'être un fermier n'empêche aucunement de botter de sérieux derrières en conduisant un tank mécanique armuré de bataille marcheur.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_2, "Le but principal de Pigwiz dans la vie est d'emmerder les gens qui entrent sur son territoire en leur lançant des sorts de toutes sortes. Tant pis, au moins ils sentent le bacon !");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_3, "Tiré de Swordless Ninja, ces gars-là ne sont rien de plus que des ringuards pathétiques pris dans leur costume d'Halloween. Il leur faut une femme.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_4, "Les pratico-pratiques Écraseurs Dentelés ont inspiré beaucoup d'architectes révolutionnaires dans leur travail. De nos jours, une salle de bain luxueuse sans un Écraseur tout dégoulinant de sang au plafond n'est plus du tout aussi clinquante.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_5, "Des arbres à viande...Vous SOUHAITERIEZ qu'ils existent !");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_6, "Certaines personnes disent que les Soldats Spectres sont vilains, mais en vérité, ils ne sont que des adolescents incompris qui ont grandi dans la colère. Je blâme les parents.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_7, "À l'origine, Ratman était supposé être l'acolyte de Batman, mais à la dernière minute, il fut remplacé par un petit garçon de cirque efféminé en collants verts qui lui vola la vedette. Maintenant, il n'est plus qu'un petit voyou de bas étage dans Hero's Arms.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_8, "Ces grenouilles sont constamment en quête de défi. Quand elles ne sont pas en train de faire leur fête aux ninja en forme de fève qu'ils rencontrent, elles aiment la cuisine, le limbo et la broderie.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_9, "Ok, alors le passe-temps favori de ces gars est de courir comme des malades pour attaquer un coffre saignant, piquant, semi-organique à travers des pièges, du feu, de la lave, des monstres, de l'acide et les cadavres de leur amis toute la journée. ÇA, c'est MÉTAL ! \\m/");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_10, "Une vieille bombe atomique utilisée à Berzerk Land principalement pour alimenter les amplificateurs nucléaires pour jouer de la guitare lors d'une marche à l'extérieur, puisque jouer acoustique serait totalement rasoir et non-métal.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_11, "L'avion de Katia. Katia c'est une bombe. Et les dinosaures rockent !");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_12, "Les trois symboles d'attributs de Rix. Une fois qu'ils furent maximisés au niveau 21, très peu de gueules demeuraient «déséclatées».");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_13, "Les 1-Ups de Mabushi étaient bien utiles durant sa quête pour retrouver sa copine. Le pauvre petit à lâché des caisses d'haricots d'enfer le soir venu, cependant. Hé ouais ! Une blague de flatulence, simple et efficace.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_14, "Aller de l'avant sur une bombe géante, c'est comme courir à reculons.\nP.S. Le Moonwalk ne compte pas.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_15, "Véritable icône de Homerun à Berzerk Land, le Bâton de Baseball est parfait pour balancer des trucs dans les airs. C'est pas très bon pour le hockey, par contre.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_16, "Avec une pareille armure, j'voudrais bien être gardien de but dans une partie de dards.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_17, "Personnage principal de Hero's Arms, Rix est petit, mais courageux et coriace. Si vous croyez qu'une branche de bois n'est pas très cool comme arme, et ben dites-vous qu'il y plante souvent la pointe dans un caca avant d'aller battre des monstres avec, ça devrait aider.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_18, "Une Boule Piquante de Swordless Ninja. Tomber endormi accidentellement sur un de ces trucs peu être fatal, faites gaffe !");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_19, "Les Cracheurs Thermiques fonctionnaient bien juste à côté du Doom Chest pour balayer quiconque aurait pu se rendre jusque là. Peut aussi vous sauver carrément la vie si votre four à micro-ondes est H.S. au dîner.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_20, "Le Bouchon de Bière vaut 10 dollars à Berzerk Land. Si cette monnaie était aussi vraie dans la vie, le studio de Berzerk serait une vrai mine d'or !.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_21, "Le Combattant Mécanique Spectre est plutôt du genre furax. Faites gaffe quand vous en verrez un.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_22, "Utilisés par Rix pour récupérer ses barres de magie et de vie. Le Soda Magique est assez savoureux, les pansements, eux, pas tellement.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_23, "Mabushi, vedette de Swordless Ninja. Certains geeks de la culture japonaise prétendent qu'il n'est pas cool... Un haricot miteux, qui n'a même pas d'épée, blah, blah, blah... Hé ben au moins, LUI, il a une copine ! ET VLAN, DANS LES DENTS !");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_24, "Le Cracheur Glacial était bien dans Trap Master, mais là où il brille vraiment, c'est pour remplir la glacière pour garder les breuvages au frais en pique-nique.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_25, "Hmmm Hamburger...:)");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_26, "Après tout, les robots aussi ont besoin d'affection !");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_27, "Wow, ça c'est un beau bouclier !! Non, attendez, il y a quelqu'un derrière, c'est Rix !!!");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_28, "Cette larve a l'air plutôt joyeuse. C'est probablement parce qu'elle ne s'est jamais vue dans un miroir. BAM!");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_29, "...\n...Quel trophée ennuyeux.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_30, "C'est drôle de constater comment les jambes de la femme sont dans le même angle que les poignées de la pince. Surtout ne réfléchissez pas trop, il n'y a pas de signification cachée, c'est juste deux trucs dessinés ensemble pour rire.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_31, "Ces tourettes ennemies peuvent vraiment être emmerdantes par moment, mais au fond, c'est ce qui les rend tellement attachantes.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_32, "Oui, bien sûr que ça a l'air effrayant comme ça, mais je vous assure que sur une patinoire de hockey, ces trucs sont davantage ridicules et pathétiques qu'effrayants.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_33, "Ouvrez la bouche et dites «Aaaaaah».");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_34, "Un coffre mystérieux, organique et dégoulinant de sang, gardé par une poignée de monstres dans un donjon louche et sordide... Personne ne sait ce qui se trouve à l'intérieur, mais je doute que ce soit quelque chose de très familial...");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_35, "Quand vous n'êtes pas sûr de quelque chose, il n'y a qu'à y ajouter des Camionosaures. Tout est toujours mieux avec des Camionosaures.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_36, "Originellement, un complexe industriel de sous-vêtements pour personnes obèses, ces bâtiments sont maintenant utilisés comme base alliée dans Mechanical Commando 2: Invasion. Attention de ne pas agir de façon trop médiévale sur elles quand vous en verrez !");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_37, "En voyant Gordzak comme il apparaît sur ce trophée, on ne se douterait jamais qu'il est un fan invétéré des films d'Ernest. Aussi, c'est lui-même seul qui a fabriqué son armure à partir d'une vieille poubelle et de papier d'aluminium recyclé d'emballages de patates au four.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_38, "Gorbazaki est un démon clodo qui passe son temps à zoner en sous-vêtements toute la journée en se grattant les fesses et en mangeant des pretzels bon-marchés...à part peut-être cette fois où il a volé un enfant. C'est pas chic.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_39, "Cézar et Maurice sont les gardiens du Coffre Maudit dans Trap Master. Quand il ne sont pas en train de manger et d'écraser des humains, ils sont présentement en train d'écrire un livre qui porte sur comment élever les enfants de façon «vélocirapcriss»...quelqu'en soit la signification... ");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_40, "L'ultime geek de Homerun à Berzerk Land. Il représente tous ceux qui sont abusivement sarcastiques, emmerdants et chiants et qui peuplent les forums de discussions sur Internet. Si vous avez reconnu un de vos commentaires venant de lui, eh ben, vous vous êtes bien fait niquer la gueule !!");
			
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_41, "'Coucou ! Je suis Sergei ! Je suis dans la mi-trentaine, j'aime la planche à neige et les casses-têtes en 3D. Vous vous souviendrez aussi peut-être de moi dans 'The Breach' où j'éclate un paquet de monstres dégueux dans un vaisseau spatial. Je suis à la recherche d'une femme sympa qui se débrouille aussi bien dans la cuisine que dans les massages de pieds.'");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_42, "Pierre-Luc est l'exemple frappant des méfaits de l'acné. C'est ce qui se produit quand on mange trop de friture et qu'on ne se lave pas sur une base quotidienne. Les tentacules et tout le bordel.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_43, "L'Oeil-Araingée est un enemie volant très vicieux dans The Breach. Il a aussi un casier judiciaire pour voyeurisme à l'endroit de ses copines de classe après les cours de gym. Les années 80 étaient vraiment une folle époque !");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_44, "Gunbot est la star du jeu...Gunbot. DUH !!\nSi vous croyez qu'un robot-cowboy-magicien qui tire des dinosaures extra-terrestres en pleine gueule c'est pas cool, et bien passez le bonjour à monsieur Ennuyeux et madame Emmerdante de ma part. J'imagine qu'ils doivent être de bons amis à vous.");
			LANGUAGE_FR.AddText(ID_TROPHY_DESC2_45, "Il a déjà été dentiste, mais depuis ses outils ont été déclarés 'à risque'. Il cherche maintenant une nouvelle clientèle sur des planètes sauvages.");
			
			LANGUAGE_FR.AddText(ID_AUTO_GUNBOT_0, "GUNBOT");
			LANGUAGE_FR.AddText(ID_AUTO_THE_BREACH_0, "THE BREACH");
					
					
					
					
			/*		
			if(_languageRuXML != null && LANGUAGE_RU.isAvailable) {
				LANGUAGE_RU.DecodeFromXML(classToXML(_languageRuXML));
			}
			*/
			/*if(_languageDuXML != null && LANGUAGE_DU.isAvailable) {
				LANGUAGE_DU.DecodeFromXML(classToXML(_languageDuXML));
			}*/
			
		}
		
		static public function DEBUGGetNameOfVarForI(index:int):String {
			var thisClass : Class = HB_TextFactory;
			//Get an XML description of this class 
			//and return the variable types as XMLList with e4x
			var xml:XML = flash.utils.describeType(thisClass); 
			var varList:XMLList = flash.utils.describeType(thisClass)..variable;
			var constList:XMLList = flash.utils.describeType(thisClass)..constant;
			
			for(var i:int; i < varList.length(); i++){
				if(thisClass[varList[i].@name] == index) {
					return varList[i].@name;
				}
			}
			
			for(var j:int; j < constList.length(); j++){
				if(thisClass[constList[j].@name] == index) {
					return constList[j].@name;
				}
			}
			/*
			for (var i:Object in thisClass) {
				if(index == TextFactory[i]) {
					return i+"";
				}
			}*/
			return "";
		}
	}
}
