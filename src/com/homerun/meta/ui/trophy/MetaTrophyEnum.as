package com.homerun.meta.ui.trophy {
	import com.homerun.io.HB_PremiumConstants;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.multilingual.HB_TextFactory;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.io.externalAPI.premiumAPI.MetaExternalPremiumItem;

	/**
	 * @author Lachhh
	 */
	public class MetaTrophyEnum {
		static private var _trophyId:int = 0;
		static private var _allTrophies:Array = new Array();
		static private var _allTrophiesGroup:Array = new Array();
		
		static public var TROPHY_GROUP_1:MetaTrophyGroup = new MetaTrophyGroup(HB_TextFactory.ID_TROPHY_GROUP_1_TITLE);
		static public var TROPHY_GROUP_2:MetaTrophyGroup = new MetaTrophyGroup(HB_TextFactory.ID_TROPHY_GROUP_2_TITLE);
		static public var TROPHY_GROUP_3:MetaTrophyGroup = new MetaTrophyGroup(HB_TextFactory.ID_TROPHY_GROUP_3_TITLE);
		static public var TROPHY_GROUP_4:MetaTrophyGroup = new MetaTrophyGroup(HB_TextFactory.ID_TROPHY_GROUP_4_TITLE);
		static public var TROPHY_GROUP_5:MetaTrophyGroup = new MetaTrophyGroup(HB_TextFactory.ID_TROPHY_GROUP_5_TITLE);
		static public var TROPHY_GROUP_6:MetaTrophyGroup = new MetaTrophyGroup(HB_TextFactory.ID_TROPHY_GROUP_6_TITLE);
		static public var TROPHY_GROUP_7:MetaTrophyGroup = new MetaTrophyGroup(HB_TextFactory.ID_TROPHY_GROUP_7_TITLE);
		static public var TROPHY_GROUP_8:MetaTrophyGroup = new MetaTrophyGroup(HB_TextFactory.ID_TROPHY_GROUP_8_TITLE);
		static public var TROPHY_GROUP_9:MetaTrophyGroup = new MetaTrophyGroup(HB_TextFactory.ID_TROPHY_GROUP_9_TITLE);
		static public var TROPHY_GROUP_10:MetaTrophyGroup = new MetaTrophyGroup(HB_TextFactory.ID_TROPHY_GROUP_10_TITLE);

		static public var TROPHY_1:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_1, HB_TextFactory.ID_TROPHY_DESC_1, HB_TextFactory.ID_TROPHY_DESC2_1, HB_TextFactory.ID_AUTO_TROPHYNAME_1, 1, 5, HB_VersionInfo.urlMc, false, HB_PremiumConstants.META_SA_ACH_1);
		static public var TROPHY_2:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_2, HB_TextFactory.ID_TROPHY_DESC_2, HB_TextFactory.ID_TROPHY_DESC2_2, HB_TextFactory.ID_AUTO_TROPHYNAME_2,2, 10, HB_VersionInfo.urlHa, false, HB_PremiumConstants.META_SA_ACH_2);
		static public var TROPHY_3:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_3, HB_TextFactory.ID_TROPHY_DESC_3, HB_TextFactory.ID_TROPHY_DESC2_3, HB_TextFactory.ID_AUTO_TROPHYNAME_3,3, 15, HB_VersionInfo.urlSn, false, HB_PremiumConstants.META_SA_ACH_3);
		static public var TROPHY_4:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_4, HB_TextFactory.ID_TROPHY_DESC_4, HB_TextFactory.ID_TROPHY_DESC2_4, HB_TextFactory.ID_AUTO_TROPHYNAME_4,4, 20, HB_VersionInfo.urlTm, false, HB_PremiumConstants.META_SA_ACH_4);
		static public var TROPHY_5:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_5, HB_TextFactory.ID_TROPHY_DESC_5, HB_TextFactory.ID_TROPHY_DESC2_5, HB_TextFactory.ID_AUTO_TROPHYNAME_5,5, 25, HB_VersionInfo.urlHb, false, HB_PremiumConstants.META_SA_ACH_5);
		static public var TROPHY_6:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_6, HB_TextFactory.ID_TROPHY_DESC_6, HB_TextFactory.ID_TROPHY_DESC2_6, HB_TextFactory.ID_AUTO_TROPHYNAME_6,6, 5, HB_VersionInfo.urlMc, false,  HB_PremiumConstants.META_SA_ACH_6);
		static public var TROPHY_7:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_7, HB_TextFactory.ID_TROPHY_DESC_7, HB_TextFactory.ID_TROPHY_DESC2_7, HB_TextFactory.ID_AUTO_TROPHYNAME_7,7, 10, HB_VersionInfo.urlHa, false, HB_PremiumConstants.META_SA_ACH_7);
		static public var TROPHY_8:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_8, HB_TextFactory.ID_TROPHY_DESC_8, HB_TextFactory.ID_TROPHY_DESC2_8, HB_TextFactory.ID_AUTO_TROPHYNAME_8,8, 15, HB_VersionInfo.urlSn, false, HB_PremiumConstants.META_SA_ACH_8);
		static public var TROPHY_9:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_9, HB_TextFactory.ID_TROPHY_DESC_9, HB_TextFactory.ID_TROPHY_DESC2_9, HB_TextFactory.ID_AUTO_TROPHYNAME_9,9, 20, HB_VersionInfo.urlTm, false, HB_PremiumConstants.META_SA_ACH_9);
		static public var TROPHY_10:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_10, HB_TextFactory.ID_TROPHY_DESC_10, HB_TextFactory.ID_TROPHY_DESC2_10, HB_TextFactory.ID_AUTO_TROPHYNAME_10,10, 25, HB_VersionInfo.urlHb, false, HB_PremiumConstants.META_SA_ACH_10);
		static public var TROPHY_11:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_11, HB_TextFactory.ID_TROPHY_DESC_11, HB_TextFactory.ID_TROPHY_DESC2_11, HB_TextFactory.ID_AUTO_TROPHYNAME_11,11, 5, HB_VersionInfo.urlMc, false,  HB_PremiumConstants.META_SA_ACH_11);
		static public var TROPHY_12:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_12, HB_TextFactory.ID_TROPHY_DESC_12, HB_TextFactory.ID_TROPHY_DESC2_12, HB_TextFactory.ID_AUTO_TROPHYNAME_12,12, 10, HB_VersionInfo.urlHa, false, HB_PremiumConstants.META_SA_ACH_12);
		static public var TROPHY_13:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_13, HB_TextFactory.ID_TROPHY_DESC_13, HB_TextFactory.ID_TROPHY_DESC2_13, HB_TextFactory.ID_AUTO_TROPHYNAME_13,13, 15, HB_VersionInfo.urlSn, false, HB_PremiumConstants.META_SA_ACH_13);
		static public var TROPHY_14:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_14, HB_TextFactory.ID_TROPHY_DESC_14, HB_TextFactory.ID_TROPHY_DESC2_14, HB_TextFactory.ID_AUTO_TROPHYNAME_14,14, 20, HB_VersionInfo.urlTm, false, HB_PremiumConstants.META_SA_ACH_14);
		static public var TROPHY_15:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_15, HB_TextFactory.ID_TROPHY_DESC_15, HB_TextFactory.ID_TROPHY_DESC2_15, HB_TextFactory.ID_AUTO_TROPHYNAME_15,15, 5, HB_VersionInfo.urlHb, false,  HB_PremiumConstants.META_SA_ACH_15);
		static public var TROPHY_16:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_16, HB_TextFactory.ID_TROPHY_DESC_16, HB_TextFactory.ID_TROPHY_DESC2_16, HB_TextFactory.ID_AUTO_TROPHYNAME_16,16, 10, HB_VersionInfo.urlMc, false, HB_PremiumConstants.META_SA_ACH_16);
		static public var TROPHY_17:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_17, HB_TextFactory.ID_TROPHY_DESC_17, HB_TextFactory.ID_TROPHY_DESC2_17, HB_TextFactory.ID_AUTO_TROPHYNAME_17,17, 15, HB_VersionInfo.urlHa, false, HB_PremiumConstants.META_SA_ACH_17);
		static public var TROPHY_18:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_18, HB_TextFactory.ID_TROPHY_DESC_18, HB_TextFactory.ID_TROPHY_DESC2_18, HB_TextFactory.ID_AUTO_TROPHYNAME_18,18, 20, HB_VersionInfo.urlSn, false, HB_PremiumConstants.META_SA_ACH_18);
		static public var TROPHY_19:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_19, HB_TextFactory.ID_TROPHY_DESC_19, HB_TextFactory.ID_TROPHY_DESC2_19, HB_TextFactory.ID_AUTO_TROPHYNAME_19,19, 5, HB_VersionInfo.urlTm, false,  HB_PremiumConstants.META_SA_ACH_19);
		static public var TROPHY_20:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_20, HB_TextFactory.ID_TROPHY_DESC_20, HB_TextFactory.ID_TROPHY_DESC2_20, HB_TextFactory.ID_AUTO_TROPHYNAME_20,20, 10, HB_VersionInfo.urlHb, false, HB_PremiumConstants.META_SA_ACH_20);
		static public var TROPHY_21:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_21, HB_TextFactory.ID_TROPHY_DESC_21, HB_TextFactory.ID_TROPHY_DESC2_21, HB_TextFactory.ID_AUTO_TROPHYNAME_21,21, 15, HB_VersionInfo.urlMc, false, HB_PremiumConstants.META_SA_ACH_21);
		static public var TROPHY_22:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_22, HB_TextFactory.ID_TROPHY_DESC_22, HB_TextFactory.ID_TROPHY_DESC2_22, HB_TextFactory.ID_AUTO_TROPHYNAME_22,22, 20, HB_VersionInfo.urlHa, false, HB_PremiumConstants.META_SA_ACH_22);
		static public var TROPHY_23:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_23, HB_TextFactory.ID_TROPHY_DESC_23, HB_TextFactory.ID_TROPHY_DESC2_23, HB_TextFactory.ID_AUTO_TROPHYNAME_23,23, 5, HB_VersionInfo.urlSn, false,  HB_PremiumConstants.META_SA_ACH_23);
		static public var TROPHY_24:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_24, HB_TextFactory.ID_TROPHY_DESC_24, HB_TextFactory.ID_TROPHY_DESC2_24, HB_TextFactory.ID_AUTO_TROPHYNAME_24,24, 10, HB_VersionInfo.urlTm, false, HB_PremiumConstants.META_SA_ACH_24);
		static public var TROPHY_25:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_25, HB_TextFactory.ID_TROPHY_DESC_25, HB_TextFactory.ID_TROPHY_DESC2_25, HB_TextFactory.ID_AUTO_TROPHYNAME_25,25, 15, HB_VersionInfo.urlHb, false, HB_PremiumConstants.META_SA_ACH_25);
		static public var TROPHY_26:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_26, HB_TextFactory.ID_TROPHY_DESC_26, HB_TextFactory.ID_TROPHY_DESC2_26, HB_TextFactory.ID_AUTO_TROPHYNAME_26,26, 20, HB_VersionInfo.urlMc, false, HB_PremiumConstants.META_SA_ACH_26);
		static public var TROPHY_27:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_27, HB_TextFactory.ID_TROPHY_DESC_27, HB_TextFactory.ID_TROPHY_DESC2_27, HB_TextFactory.ID_AUTO_TROPHYNAME_27,27, 25, HB_VersionInfo.urlHa, false, HB_PremiumConstants.META_SA_ACH_27);
		static public var TROPHY_28:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_28, HB_TextFactory.ID_TROPHY_DESC_28, HB_TextFactory.ID_TROPHY_DESC2_28, HB_TextFactory.ID_AUTO_TROPHYNAME_28,28, 5, HB_VersionInfo.urlSn, false,  HB_PremiumConstants.META_SA_ACH_28);
		static public var TROPHY_29:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_29, HB_TextFactory.ID_TROPHY_DESC_29, HB_TextFactory.ID_TROPHY_DESC2_29, HB_TextFactory.ID_AUTO_TROPHYNAME_29,29, 15, HB_VersionInfo.urlTm, false, HB_PremiumConstants.META_SA_ACH_29);
		static public var TROPHY_30:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_30, HB_TextFactory.ID_TROPHY_DESC_30, HB_TextFactory.ID_TROPHY_DESC2_30, HB_TextFactory.ID_AUTO_TROPHYNAME_30,30, 25, HB_VersionInfo.urlHb, false, HB_PremiumConstants.META_SA_ACH_30);
		static public var TROPHY_31:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_31, HB_TextFactory.ID_TROPHY_DESC_31, HB_TextFactory.ID_TROPHY_DESC2_31, HB_TextFactory.ID_AUTO_TROPHYNAME_31,31, 25, HB_VersionInfo.urlMc, false, HB_PremiumConstants.META_SA_ACH_31);
		static public var TROPHY_32:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_32, HB_TextFactory.ID_TROPHY_DESC_32, HB_TextFactory.ID_TROPHY_DESC2_32, HB_TextFactory.ID_AUTO_TROPHYNAME_32,32, 25, HB_VersionInfo.urlHa, false, HB_PremiumConstants.META_SA_ACH_32);
		static public var TROPHY_33:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_33, HB_TextFactory.ID_TROPHY_DESC_33, HB_TextFactory.ID_TROPHY_DESC2_33, HB_TextFactory.ID_AUTO_TROPHYNAME_33,33, 35, HB_VersionInfo.urlSn, false, HB_PremiumConstants.META_SA_ACH_33);
		static public var TROPHY_34:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_34, HB_TextFactory.ID_TROPHY_DESC_34, HB_TextFactory.ID_TROPHY_DESC2_34, HB_TextFactory.ID_AUTO_TROPHYNAME_34,34, 15, HB_VersionInfo.urlTm, false, HB_PremiumConstants.META_SA_ACH_34);
		static public var TROPHY_35:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_35, HB_TextFactory.ID_TROPHY_DESC_35, HB_TextFactory.ID_TROPHY_DESC2_35, HB_TextFactory.ID_AUTO_TROPHYNAME_35,35, 5, HB_VersionInfo.urlHb, false,  HB_PremiumConstants.META_SA_ACH_35);
		static public var TROPHY_36:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_36, HB_TextFactory.ID_TROPHY_DESC_36, HB_TextFactory.ID_TROPHY_DESC2_36, HB_TextFactory.ID_AUTO_TROPHYNAME_36,36, 5, HB_VersionInfo.urlMc, false,  HB_PremiumConstants.META_SA_ACH_36);
		static public var TROPHY_37:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_37, HB_TextFactory.ID_TROPHY_DESC_37, HB_TextFactory.ID_TROPHY_DESC2_37, HB_TextFactory.ID_AUTO_TROPHYNAME_37,37, 25, HB_VersionInfo.urlHa, false, HB_PremiumConstants.META_SA_ACH_37);
		static public var TROPHY_38:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_38, HB_TextFactory.ID_TROPHY_DESC_38, HB_TextFactory.ID_TROPHY_DESC2_38, HB_TextFactory.ID_AUTO_TROPHYNAME_38,38, 15, HB_VersionInfo.urlSn, false, HB_PremiumConstants.META_SA_ACH_38);
		static public var TROPHY_39:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_39, HB_TextFactory.ID_TROPHY_DESC_39, HB_TextFactory.ID_TROPHY_DESC2_39, HB_TextFactory.ID_AUTO_TROPHYNAME_39,39, 5, HB_VersionInfo.urlTm, false,  HB_PremiumConstants.META_SA_ACH_39);
		static public var TROPHY_40:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_40, HB_TextFactory.ID_TROPHY_DESC_40, HB_TextFactory.ID_TROPHY_DESC2_40, HB_TextFactory.ID_AUTO_TROPHYNAME_40,40, 5, HB_VersionInfo.urlHb, false,  HB_PremiumConstants.META_SA_ACH_40);
		static public var TROPHY_41:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_41, HB_TextFactory.ID_TROPHY_DESC_41, HB_TextFactory.ID_TROPHY_DESC2_41, HB_TextFactory.ID_AUTO_TROPHYNAME_41,41, 30, HB_VersionInfo.urlTb, false,  HB_PremiumConstants.META_SA_ACH_41);
		static public var TROPHY_42:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_42, HB_TextFactory.ID_TROPHY_DESC_42, HB_TextFactory.ID_TROPHY_DESC2_42, HB_TextFactory.ID_AUTO_TROPHYNAME_42,42, 30, HB_VersionInfo.urlTb, false,  HB_PremiumConstants.META_SA_ACH_42);
		static public var TROPHY_43:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_43, HB_TextFactory.ID_TROPHY_DESC_43, HB_TextFactory.ID_TROPHY_DESC2_43, HB_TextFactory.ID_AUTO_TROPHYNAME_43,43, 30, HB_VersionInfo.urlTb, false,  HB_PremiumConstants.META_SA_ACH_43);
		static public var TROPHY_44:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_44, HB_TextFactory.ID_TROPHY_DESC_44, HB_TextFactory.ID_TROPHY_DESC2_44, HB_TextFactory.ID_AUTO_TROPHYNAME_44,44, 30, HB_VersionInfo.urlGb, false,  HB_PremiumConstants.META_SA_ACH_44);
		static public var TROPHY_45:MetaTrophy = new MetaTrophy(_trophyId++, _allTrophies, HB_TextFactory.ID_TROPHY_TITLE_45, HB_TextFactory.ID_TROPHY_DESC_45, HB_TextFactory.ID_TROPHY_DESC2_45, HB_TextFactory.ID_AUTO_TROPHYNAME_45,45, 30, HB_VersionInfo.urlGb, false,  HB_PremiumConstants.META_SA_ACH_45);
		
		static public var NULL_TROPHY:MetaTrophy = new MetaTrophy(-1, null, -1, -1, -1,-1, -1, 0, "");
		
		static public function Init():void {
			_allTrophiesGroup = [];
			_allTrophiesGroup.push(TROPHY_GROUP_1);
			_allTrophiesGroup.push(TROPHY_GROUP_2);
			_allTrophiesGroup.push(TROPHY_GROUP_3);
			_allTrophiesGroup.push(TROPHY_GROUP_4);
			_allTrophiesGroup.push(TROPHY_GROUP_5);
			_allTrophiesGroup.push(TROPHY_GROUP_6);
			_allTrophiesGroup.push(TROPHY_GROUP_7);
			_allTrophiesGroup.push(TROPHY_GROUP_8);
			_allTrophiesGroup.push(TROPHY_GROUP_9);
			_allTrophiesGroup.push(TROPHY_GROUP_10);
			
			TROPHY_GROUP_1.AddItem(TROPHY_1);
			TROPHY_GROUP_1.AddItem(TROPHY_2);
			TROPHY_GROUP_1.AddItem(TROPHY_3);
			TROPHY_GROUP_1.AddItem(TROPHY_4);
			TROPHY_GROUP_1.AddItem(TROPHY_5);
			
			TROPHY_GROUP_2.AddItem(TROPHY_6);
			TROPHY_GROUP_2.AddItem(TROPHY_7);
			TROPHY_GROUP_2.AddItem(TROPHY_8);
			TROPHY_GROUP_2.AddItem(TROPHY_9);
			TROPHY_GROUP_2.AddItem(TROPHY_10);
			
			TROPHY_GROUP_3.AddItem(TROPHY_11);
			TROPHY_GROUP_3.AddItem(TROPHY_12);
			TROPHY_GROUP_3.AddItem(TROPHY_13);
			TROPHY_GROUP_3.AddItem(TROPHY_14);
			
			TROPHY_GROUP_4.AddItem(TROPHY_15);
			TROPHY_GROUP_4.AddItem(TROPHY_16);
			TROPHY_GROUP_4.AddItem(TROPHY_17);
			TROPHY_GROUP_4.AddItem(TROPHY_18);
			
			TROPHY_GROUP_5.AddItem(TROPHY_19);
			TROPHY_GROUP_5.AddItem(TROPHY_20);
			TROPHY_GROUP_5.AddItem(TROPHY_21);
			TROPHY_GROUP_5.AddItem(TROPHY_22);
			
			if(HB_VersionInfo.showViralAchievement || HB_VersionInfo.mtvPlayerScoreLoaded) {
				TROPHY_GROUP_6.AddItem(TROPHY_23);
				TROPHY_GROUP_6.AddItem(TROPHY_24);
				TROPHY_GROUP_6.AddItem(TROPHY_25);
				TROPHY_GROUP_6.AddItem(TROPHY_26);
			}
			
			if(HB_VersionInfo.showViralAchievement) {
				TROPHY_GROUP_7.AddItem(TROPHY_30);
				TROPHY_GROUP_7.AddItem(TROPHY_31);
				TROPHY_GROUP_7.AddItem(TROPHY_32);
			}
					
			if(VersionInfo.sponsorSiteUrl != "" || VersionInfo.sponsorSiteMoreGamesUrl != "") { 
				TROPHY_GROUP_7.AddItem(TROPHY_37);
			}
			
			TROPHY_GROUP_8.AddItem(TROPHY_27);
			TROPHY_GROUP_8.AddItem(TROPHY_28);
			TROPHY_GROUP_8.AddItem(TROPHY_29);
			TROPHY_GROUP_8.AddItem(TROPHY_33);
			TROPHY_GROUP_8.AddItem(TROPHY_34);
						
			TROPHY_GROUP_9.AddItem(TROPHY_35);
			TROPHY_GROUP_9.AddItem(TROPHY_36);
			TROPHY_GROUP_9.AddItem(TROPHY_38);
			TROPHY_GROUP_9.AddItem(TROPHY_39);
			TROPHY_GROUP_9.AddItem(TROPHY_40);
			
			TROPHY_GROUP_10.AddItem(TROPHY_41);
			TROPHY_GROUP_10.AddItem(TROPHY_42);
			TROPHY_GROUP_10.AddItem(TROPHY_43);
			TROPHY_GROUP_10.AddItem(TROPHY_44);
			TROPHY_GROUP_10.AddItem(TROPHY_45);
			
			
		}
		
		static public function GetAchById(id : int) : MetaTrophy {
			for (var i : int = 0 ;i < _allTrophies.length; i++) {
				if(MetaTrophy(_allTrophies[i]).id == id) return MetaTrophy(_allTrophies[i]);
			}
			return NULL_TROPHY;
		}
		
		static public function get allTrophies() : Array {
			return _allTrophies;
		}
		
		static public function get numTrophies():int {
			var cpt:int = 0 ; 
			for (var j : int = 0; j < _allTrophiesGroup.length; j++) {
				var metaTrophyGroup:MetaTrophyGroup = _allTrophiesGroup[j];
				cpt += metaTrophyGroup.numItems; 
			}
			return cpt ;
		}

		static public function get numDiamondsEarned():int {
			var cpt:int = 0 ; 
			for (var j : int = 0; j < _allTrophiesGroup.length; j++) {
				var metaTrophyGroup:MetaTrophyGroup = _allTrophiesGroup[j];
				cpt += metaTrophyGroup.numDiamondsEarned; 
			}
			return cpt;
		}
		
		static public function get numDiamondTotal():int {
			var cpt:int = 0 ; 
			for (var j : int = 0; j < _allTrophiesGroup.length; j++) {
				var metaTrophyGroup:MetaTrophyGroup = _allTrophiesGroup[j];
				cpt += metaTrophyGroup.numDiamondsTotal; 
			}
			
			return cpt;
		}
		
		static public function get allTrophiesGroup() : Array {
			return _allTrophiesGroup;
		}
	}
}
