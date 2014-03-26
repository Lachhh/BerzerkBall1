package com.homerun.io {
	import com.lachhhEngine.io.externalAPI.scoreAPI.MetaExternalScoreboard;
	import com.lachhhEngine.io.externalAPI.achievementAPI.MetaExternalAchievement;
	import com.lachhhEngine.io.externalAPI.premiumAPI.MetaExternalPremiumItem;

	/**
	 * @author Lachhh
	 */
	public class HB_PremiumConstants {
		private static const ACHIEVEMENT_GAIN_5_TROPHIES:int = 572;
        private static const ACHIEVEMENT_GAIN_10_TROPHIES:int = 573;
        private static const ACHIEVEMENT_GAIN_25_TROPHIES:int = 574;
        private static const ACHIEVEMENT_GAIN_40_TROPHIES:int = 575;
        
		private static const ITEM_DIAMOND__10:int = 373;
        private static const ITEM_DIAMOND__100:int = 375;
        private static const ITEM_DIAMOND__50:int = 374;
        
        public static const SCORE_BOARD:MetaExternalScoreboard = new MetaExternalScoreboard(-1, "0d99d617e1a36e41");
        
        public static const ITEM_DIAMOND_10:MetaExternalPremiumItem = new MetaExternalPremiumItem(ITEM_DIAMOND__10, "1e2e73ee2eaccebe", "homeruninberzerkland_diamonds_x100", "", "diamond100", 150, "Click pay to get 100 diamonds.");
        public static const ITEM_DIAMOND_50:MetaExternalPremiumItem = new MetaExternalPremiumItem(ITEM_DIAMOND__50, "d6e72c93ecb57f53", "homeruninberzerkland_diamonds_x250", "", "diamond250", 275, "Click pay to get 250 diamonds.");
        public static const ITEM_DIAMOND_100:MetaExternalPremiumItem = new MetaExternalPremiumItem(ITEM_DIAMOND__100, "05230a1f731c8c60", "homeruninberzerkland_diamonds_x500", "", "diamond500", 400, "Click pay to get 500 diamonds.");
        
        public static const META_GS_ACH_5:MetaExternalAchievement = new MetaExternalAchievement(ACHIEVEMENT_GAIN_5_TROPHIES);
        public static const META_GS_ACH_10:MetaExternalAchievement = new MetaExternalAchievement(ACHIEVEMENT_GAIN_10_TROPHIES);
        public static const META_GS_ACH_25:MetaExternalAchievement = new MetaExternalAchievement(ACHIEVEMENT_GAIN_25_TROPHIES);
        public static const META_GS_ACH_40:MetaExternalAchievement = new MetaExternalAchievement(ACHIEVEMENT_GAIN_40_TROPHIES);
        
        public static const META_SA_ACH_1:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR1");
        public static const META_SA_ACH_2:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR2");
        public static const META_SA_ACH_3:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR3");
        public static const META_SA_ACH_4:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR4");
        public static const META_SA_ACH_5:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR5");
        public static const META_SA_ACH_6:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR6");
        public static const META_SA_ACH_7:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR7");
        public static const META_SA_ACH_8:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR8");
        public static const META_SA_ACH_9:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR9");
        public static const META_SA_ACH_10:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR10");
        public static const META_SA_ACH_11:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR11");
        public static const META_SA_ACH_12:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR12");
        public static const META_SA_ACH_13:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR13");
        public static const META_SA_ACH_14:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR14");
        public static const META_SA_ACH_15:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR15");
        public static const META_SA_ACH_16:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR16");
        public static const META_SA_ACH_17:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR17");
        public static const META_SA_ACH_18:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR18");
        public static const META_SA_ACH_19:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR19");
        public static const META_SA_ACH_20:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR20");
        public static const META_SA_ACH_21:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR21");
        public static const META_SA_ACH_22:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR22");
        public static const META_SA_ACH_23:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR23");
        public static const META_SA_ACH_24:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR24");
        public static const META_SA_ACH_25:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR25");
        public static const META_SA_ACH_26:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR26");
        public static const META_SA_ACH_27:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR27");
        public static const META_SA_ACH_28:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR28");
        public static const META_SA_ACH_29:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR29");
        public static const META_SA_ACH_30:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR30");
        public static const META_SA_ACH_31:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR31");
        public static const META_SA_ACH_32:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR32");
        public static const META_SA_ACH_33:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR33");
        public static const META_SA_ACH_34:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR34");
        public static const META_SA_ACH_35:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR35");
        public static const META_SA_ACH_36:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR36");
        public static const META_SA_ACH_37:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR37");
        public static const META_SA_ACH_38:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR38");
        public static const META_SA_ACH_39:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR39");
        public static const META_SA_ACH_40:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR40");
        
        
        
        public static const META_SA_ACH_41:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR41");
        public static const META_SA_ACH_42:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR42");
        public static const META_SA_ACH_43:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR43");
        public static const META_SA_ACH_44:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR44");
        public static const META_SA_ACH_45:MetaExternalAchievement = new MetaExternalAchievement(-1, -1, "", "", null, "", "HB_ACH_TR45"); 
	}
}
