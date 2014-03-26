package com.homerun.screens {
	import com.lachhhEngine.games.screens.ScreenFactory;

	/**
	 * @author Lachhh
	 */
	public class HB_ScreenFactory extends ScreenFactory {

		static public var ID_DIAMOND_SCREEN:int;
		static public var ID_GAMECOMPLETED_SCREEN:int;
		static public var ID_UNLOCK_SCREEN:int;
		static public var ID_ROUNDCOMPLETE_SCREEN:int;
		static public var ID_INGAME_SCREEN:int;
		static public var ID_CHARACTER_SCREEN:int;
		static public var ID_CREDITS_SCREEN:int;
		static public var ID_INVENTORY_SCREEN:int;
		static public var ID_OPTIONS_INGAME_SCREEN:int;
		static public var ID_OPTIONS_TITLE_SCREEN:int;
		static public var ID_SHOP_SCREEN:int;
		static public var ID_TITLE_SCREEN:int;
		static public var ID_SPONSOR_SCREEN:int;
		static public var ID_TROPHY_SCREEN:int;
		static public var ID_TROPHYSELECT_SCREEN:int;
		static public var ID_TROPHYPOPUP_SCREEN:int;
		static public var ID_HIGHSCORE_SCREEN:int;
		static public var ID_CHALLENGE_SCREEN:int;
		static public var ID_CONTROL_SCREEN:int;
		static public var ID_INYOURFACE_SCREEN:int;
		
		static public var ID_KILLERSHOT_SCREEN:int;
		static public var ID_BONUS_SCREEN:int;
		
		static public var ID_QUICK_LVL_UP_SCREEN:int;
		static public var ID_MSGBOX_SCREEN:int;
		
		static public var ID_REVENGE_SCREEN:int;
		static public var ID_CHALLENGEBOX_SCREEN:int;
		static public var ID_DISCLAIMER_SCREEN:int;
		static public var ID_DISCLAIMER2_SCREEN:int;
		
		static public var ID_BERZERKLOGO_SCREEN:int;
		
		public function HB_ScreenFactory() {
			super();
			ID_DIAMOND_SCREEN = PushClassLink(DiamondScreen);
			ID_GAMECOMPLETED_SCREEN = PushClassLink(GameCompletedScreen);
			ID_INGAME_SCREEN = PushClassLink(IngameScreen);
			ID_UNLOCK_SCREEN = PushClassLink(UnlockScreen);
			ID_ROUNDCOMPLETE_SCREEN = PushClassLink(RoundCompleteScreen);
			
			ID_CHARACTER_SCREEN = PushClassLink(CharacterScreen);
			ID_CREDITS_SCREEN = PushClassLink(CreditsScreen);
			ID_INVENTORY_SCREEN = PushClassLink(InventoryScreen);
			ID_OPTIONS_INGAME_SCREEN = PushClassLink(OptionsIngameScreen);
			ID_OPTIONS_TITLE_SCREEN = PushClassLink(OptionsTitleScreen);
			ID_SHOP_SCREEN = PushClassLink(ShopScreen);
			ID_TITLE_SCREEN = PushClassLink(TitleScreen);
			ID_SPONSOR_SCREEN = PushClassLink(SponsorScreen);
			ID_TROPHY_SCREEN = PushClassLink(TrophyScreen);
			ID_TROPHYSELECT_SCREEN = PushClassLink(TrophySelectScreen);
			ID_TROPHYPOPUP_SCREEN = PushClassLink(AchPopupScreen);
			
			ID_HIGHSCORE_SCREEN = PushClassLink(HighscoreScreen);
			ID_CHALLENGE_SCREEN = PushClassLink(ChallengeScreen);
			ID_CONTROL_SCREEN = PushClassLink(ControlsScreen);
			ID_INYOURFACE_SCREEN = PushClassLink(InYourFaceScreen);
			
			ID_KILLERSHOT_SCREEN = PushClassLink(KillerShotScreen);
			ID_BONUS_SCREEN = PushClassLink(BonusShotScreen);
			
			
			ID_QUICK_LVL_UP_SCREEN = PushClassLink(QuickLvlUpScreen);
			ID_MSGBOX_SCREEN = PushClassLink(QuestionBoxScreen);
			
			ID_REVENGE_SCREEN = PushClassLink(RevengeScreen);
			ID_CHALLENGEBOX_SCREEN = PushClassLink(ChallengeBoxScreen);
			ID_DISCLAIMER_SCREEN = PushClassLink(DisclaimerScreen);
			ID_DISCLAIMER2_SCREEN = PushClassLink(Disclaimer2Screen);
			ID_BERZERKLOGO_SCREEN = PushClassLink(BerzerkLogo);
		}
	}
}
