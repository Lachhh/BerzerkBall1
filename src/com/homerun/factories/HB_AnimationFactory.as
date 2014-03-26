package com.homerun.factories {
	import com.homerun.exported.*;
	import com.homerun.hero.Hero;
	import com.lachhhEngine.games.animation.AnimationAsset;
	import com.lachhhEngine.games.factory.AnimationFactory;
	import com.lachhhEngine.utils.Utils;

	/**
	 * @author Lachhh
	 */
	public class HB_AnimationFactory extends AnimationFactory {		
		static private var _instance:HB_AnimationFactory ;
		static private var ALL_BANDANA:Array = [BANDANA_DENIZE1, BANDANA_DENIZE2, BANDANA_BALLON, BANDANA_ETIENNE, BANDANA_LACHHH, BANDANA_MARCUS, BANDANA_MATHIEU, BANDANA_TITI] ;
		static private var ALL_BELT:Array = [BELT_DENIZE1, BELT_DENIZE2, BELT_DENIZE3, BELT_BALLON, BELT_ETIENNE, BELT_LACHHH1, BELT_LACHHH2, BELT_LACHHH3, BELT_MARCUS, BELT_MATHIEU, BELT_TITI1, BELT_TITI2] ;
		static private var ALL_BRACERS:Array = [BRACER_DENIZE, BRACER_BALLON, BRACER_LACHHH, BRACER_MARCUS, BRACER_MATHIEU, BRACER_TITI, BRACER_ETIENNE] ;
		static private var ALL_NEZ:Array = [TITI_NEZ] ;
		
		
		static public var ID_CHARACTER_SCREEN:int ;
		static public var ID_INYOURFACE_SCREEN:int ;
		
		static public var ID_MSGBOX_SCREEN:int ;
		static public var ID_TROPHY_SCREEN:int ;
		static public var ID_TROPHYPOPUP_SCREEN:int ;
		static public var ID_CREDITS_SCREEN:int ;
		static public var ID_OPTION_SCREEN:int ;
		static public var ID_INVENTORY_SCREEN:int ;
		static public var ID_SHOP_SCREEN:int ;
		static public var ID_TITLE_SCREEN:int ;
		static public var ID_ROUNDCOMPLETE_SCREEN:int ;
		static public var ID_INGAME_SCREEN:int ;
		static public var ID_CHALLENGE_SCREEN:int ;
		static public var ID_HIGHSCORE_SCREEN:int ;
		static public var ID_KILLERSHOT_SCREEN:int ;
		static public var ID_UNLOCK_SCREEN:int ;	
		static public var ID_SPONSOR_SCREEN:int ;
		static public var ID_QUICKLVLUP_SCREEN:int ;
		static public var ID_CONTROL_SCREEN:int ;
		static public var ID_GAMECOMPLETED_SCREEN:int ;
		static public var ID_DIAMOND_SCREEN:int ;
		static public var ID_TROPHYSELECT_SCREEN:int ;
		static public var ID_REVENGE_SCREEN:int ;
		static public var ID_CHALLENGEBOX_SCREEN:int ;
		static public var ID_DISCLAIMER_SCREEN:int ;
		static public var ID_DISCLAIMER2_SCREEN:int ;
	
		static public var ID_OPTIONS_WIDGET:int ;




		
		
		

		static public var ID_LEVELACTION:int ;
		static public var ID_LEVELBACK1:int ;
		static public var ID_LEVELBACK2:int ;
		static public var ID_LEVEL2BACK1:int ;
		static public var ID_LEVEL2ACTION:int ;
		static public var ID_LEVEL2BACK2:int ;
		
		static public var ID_LEVEL3ACTION:int ;
		static public var ID_LEVEL3BACK1:int ;
		static public var ID_LEVEL3BACK2:int ;
		static public var ID_LEVEL4ACTION:int ;
		static public var ID_LEVEL4BACK1:int ;
		static public var ID_LEVEL4BACK2:int ;
		
		
		
		
				
				
		
		static public var ID_BALLON_GATHERIDLE:int ;
		static public var ID_BALLON_GATHERIN:int ;
		static public var ID_BALLON_HIT:int ;
		static public var ID_BALLON_IDLE:int ;
		static public var ID_BALLON_RUNNING_HIT:int ;
		static public var ID_BALLON_RUNNING_IDLE:int ;
		
		static public var ID_ETIENNE_GATHERIDLE:int ;
		static public var ID_ETIENNE_GATHERIN:int ;
		static public var ID_ETIENNE_HIT:int ;
		static public var ID_ETIENNE_IDLE:int ;
		static public var ID_ETIENNE_RUNNING_HIT:int ;
		static public var ID_ETIENNE_RUNNING_IDLE:int ;
		
		static public var ID_LACHHH_GATHERIDLE:int ;
		static public var ID_LACHHH_GATHERIN:int ;
		static public var ID_LACHHH_HIT:int ;
		static public var ID_LACHHH_IDLE:int ;
		static public var ID_LACHHH_RUNNING_HIT:int ;
		static public var ID_LACHHH_RUNNING_IDLE :int ;
		
		static public var ID_MARCUS_GATHERIDLE:int ;
		static public var ID_MARCUS_GATHERIN:int ;
		static public var ID_MARCUS_HIT:int ;
		static public var ID_MARCUS_IDLE:int ;
		static public var ID_MARCUS_RUNNING_HIT:int ;
		static public var ID_MARCUS_RUNNING_IDLE:int ;
		
		static public var ID_MATHIEU_GATHERIDLE:int ;
		static public var ID_MATHIEU_GATHERIN:int ;
		static public var ID_MATHIEU_HIT:int ;
		static public var ID_MATHIEU_IDLE:int ;
		static public var ID_MATHIEU_RUNNING_HIT:int ;
		static public var ID_MATHIEU_RUNNING_IDLE:int ;
		
		static public var ID_TITI_GATHERIDLE:int ;
		static public var ID_TITI_GATHERIN:int ;
		static public var ID_TITI_HIT:int ;
		static public var ID_TITI_IDLE:int ;
		static public var ID_TITI_RUNNING_HIT:int ;
		static public var ID_TITI_RUNNING_IDLE:int ;
		
		static public var ID_DENIZE_GATHERIDLE:int ;
		static public var ID_DENIZE_GATHERIN:int ;
		static public var ID_DENIZE_HIT:int ;
		static public var ID_DENIZE_IDLE:int ;
		static public var ID_DENIZE_RUNNING_HIT:int ;
		static public var ID_DENIZE_RUNNING_IDLE:int ;
		
		

		
		static public var ID_BANDANA_BALLON:int ;
		static public var ID_BANDANA_ETIENNE:int ;
		static public var ID_BANDANA_LACHHH:int ;
		static public var ID_BANDANA_MARCUS:int ;
		static public var ID_BANDANA_MATHIEU:int ;
		static public var ID_BANDANA_TITI:int ;
		static public var ID_BELT_BALLON:int ;
		static public var ID_BELT_ETIENNE:int ;
		static public var ID_BELT_LACHHH1:int ;
		static public var ID_BELT_LACHHH2:int ;
		static public var ID_BELT_LACHHH3:int ;
		static public var ID_BELT_MARCUS:int ;
		static public var ID_BELT_MATHIEU:int ;
		static public var ID_BELT_TITI1:int ;
		static public var ID_BELT_TITI2:int ;
		static public var ID_BRACER_BALLON:int ;
		static public var ID_BRACER_LACHHH:int ;
		static public var ID_BRACER_MARCUS:int ;
		static public var ID_BRACER_MATHIEU:int ;
		static public var ID_BRACER_TITI:int ;
		static public var ID_BRACER_ETIENNE:int ;
		static public var ID_WEAPONS:int ;
		
	
		static public var ID_GEEK_COMPUTER_IDLE:int ;
		static public var ID_GEEK_COMPUTER_WALK:int ;
		static public var ID_GEEK_COMPUTER_FLY:int ;
		static public var ID_GEEK_COMPUTER_HIT1:int ;
		static public var ID_GEEK_COMPUTER_HIT2:int ;
		static public var ID_GEEK_COMPUTER_HIT3:int ;
		static public var ID_GEEK_COMPUTER_LANDED:int ;
		
		
		static public var ID_DECOR_NUAGE1:int ;
		static public var ID_DECOR_NUAGE2:int ;
		static public var ID_DECOR_NUAGE3:int ;		
		static public var ID_DECOR_NUAGE2_1:int ;
		static public var ID_DECOR_NUAGE2_2:int ;
		static public var ID_DECOR_NUAGE2_3:int ;
		static public var ID_DECOR_NUAGE3_1:int ;
		static public var ID_DECOR_NUAGE3_2:int ;
		static public var ID_DECOR_NUAGE3_3:int ;
		
		static public var ID_FX_DECOR_1:int ;
		static public var ID_FX_DECOR_2:int ;
		static public var ID_FX_DECOR_3:int ;
		static public var ID_FX_DECOR_4:int ;
		static public var ID_FX_DECOR_NUAGE_FOREGROUND:int ;
		static public var ID_FX_DECOR_NUAGE_FOREGROUND2:int ;
		
		
		static public var ID_FX_DECOR_LVL2_1:int ;
		static public var ID_FX_DECOR_LVL2_2:int ;
		static public var ID_FX_DECOR_LVL2_3:int ;
		static public var ID_FX_DECOR_LVL2_4:int ;
		static public var ID_FX_GEEKBULLANIM:int ;
		
		static public var ID_FX_BLOODPUFF1:int ;
		static public var ID_FX_DECOR_LVL3_1:int ;
		static public var ID_FX_DECOR_LVL3_2:int ;
		static public var ID_FX_DECOR_LVL3_3:int ;
		static public var ID_FX_DECOR_LVL3_4:int ;
		
		static public var ID_FX_DECOR_LVL4_1:int ;
		static public var ID_FX_DECOR_LVL4_2:int ;
		static public var ID_FX_DECOR_LVL4_3:int ;
		static public var ID_FX_DECOR_LVL4_4:int ;
		static public var ID_FX_FIRE:int ;
		static public var ID_FX_GROUNDBLOOD1:int ;
		static public var ID_FX_GROUNDBLOOD2:int ;
		static public var ID_FX_GROUNDBLOOD3:int ;
		static public var ID_FX_GROUNDBLOOD_DRAW1:int ;
		static public var ID_FX_GROUNDBLOOD_DRAW2:int ;
		static public var ID_FX_GROUNDBLOOD_DRAW3:int ;
				
		static public var ID_FX_RUNNINGSMOKE:int ;
		static public var ID_FX_RUNNINGSMOKE2:int ;
		static public var ID_FX_SCORE_SIGN:int ;
		static public var ID_FX_MECHCOMMCROSSFIRE:int ;
		static public var ID_FX_MECHCOMMCROSSFIRELOCKED:int ;
		static public var ID_FX_BLOODPUFF2:int ;
		static public var ID_FX_CANONFIRE:int ;
		static public var ID_FX_GEEK_CURSOR:int ;
		static public var ID_FX_GROUNDBLOODGREEN:int ;
		static public var ID_FX_GROUNDGREENBLOOD_DRAW:int ;
		static public var ID_FX_GEEK_CONTROL_BACKWARD:int ;
		static public var ID_FX_GEEK_CONTROL_FORWARD:int ;
		
		
		
		
				
		static public var ID_START_EDGE_LVL3:int ;
		
		
		
		
				
				
		static public var ID_START_EDGE_LVL2:int ;
		static public var ID_START_EDGE_LVL4:int ;
		
		
		
				
				
		static public var ID_ITEM_COIN:int ;
		static public var ID_START_EDGE:int ;
		static public var ID_FX_IMPACT:int ;
		static public var ID_BTN_GETMOTE:int ;	
		static public var ID_BTN_MOREGAMEINGAME:int ;		
		static public var ID_BTN_INVENTORY:int ;
		static public var ID_BTN_HIGHSCORE:int ;		
		static public var ID_BTN_BUY:int ;
		static public var ID_BTN_OPTIONS:int ;
		static public var ID_BTN_SUBMIT:int ;
		static public var ID_BTN_EQUIP:int ;
		static public var ID_BTN_PLUS:int ;
		static public var ID_BTN_EXIT:int ;
		static public var ID_BTN_ARROW:int ;
		static public var ID_BTN_TROPHY:int ;
		static public var ID_BTN_CREDITS:int ;
		static public var ID_BTN_STARTTITLE:int ;
		static public var ID_BTN_OPTIONSTITLE:int ;
		static public var ID_BTN_SPONSOR:int ;
		static public var ID_BTN_START:int ;
		static public var ID_BTN_RETRY:int ;
		static public var ID_BTN_SAVEQUIT:int ;
		static public var ID_BTN_SHOP:int ;
		static public var ID_BTN_CHALLENGE:int ;
		static public var ID_BTN_CHALLENGEMYFRIEND:int ;
		static public var ID_BTN_VIEW:int ;
		static public var ID_BTN_AIM:int ;
		static public var ID_BTN_HIT:int ;
		static public var ID_BTN_CLEARALLDATA:int ;
		static public var ID_BTN_NO:int ;
		static public var ID_BTN_YES:int ;
		static public var ID_BTN_AGAIN:int ;
		static public var ID_BTN_TROPHYICON:int ;
		static public var ID_BTN_TRYTHISGAME:int ;
		static public var ID_BTN_OK:int ;
		static public var ID_BTN_BACK:int ;
		static public var ID_BTN_FACEBOOKICON:int ;
		static public var ID_BTN_TWITICON:int ;	
		static public var ID_BTN_MUSIC:int ;
		static public var ID_BTN_SOUND:int ;
		static public var ID_BTN_SPECIALFEATURE:int ;
		static public var ID_BTN_PAUSE:int ;		
		static public var ID_BTN_DIAMOND:int ;				
		static public var ID_BTN_LOGOTITLE:int ;
		static public var ID_BTN_LOGOSMEDIUMCREDITS:int ;
		static public var ID_BTN_LOGOSINGAME:int ;
		static public var ID_BTN_BZRICON:int ;
		static public var ID_BTN_HOSTHISGAME:int ;
		static public var ID_BTN_JIG:int ;
		static public var ID_BTN_CHALLENGEFRIEND:int ;		
		static public var ID_BTN_BUYSMALL:int ;
		static public var ID_BTN_INYOURFACE:int ;	
		static public var ID_BTN_CONNECT:int ;
		static public var ID_BTN_CONTROLS:int ;		
		static public var ID_BTN_CON:int ;
		static public var ID_BTN_POW:int ;
		static public var ID_BTN_PRE:int ;
		static public var ID_BTN_STR:int ;
		static public var ID_BTN_SMALLACH:int ;
		static public var ID_BTN_REVENGE:int ;
		static public var ID_BTN_WHOCARES:int ;
		static public var ID_BTN_IPHONEAD:int ;

		
		
		static public var ID_BTNS_WEAPONS:int ;
		static public var ID_BTNS_PREMIUM:int ;
		static public var ID_BTNS_ITEMS:int ;
		static public var ID_BTNS_ITEM:int ;
		static public var ID_BTNS_AFTERHIT:int ;
		static public var ID_BTNS_BEFOREHIT:int ;
		static public var ID_BTNS_ALLTIME:int ;
		static public var ID_BTNS_DAILY:int ;
		static public var ID_BTNS_WEEKLY:int ;
		static public var ID_BTNS_MYFRIENDS:int ;
		static public var ID_BTNS_HIGH:int ;
		static public var ID_BTNS_LOW:int ;
		static public var ID_BTNS_MED:int ;
		
		
		
		

		
		
		static public var ID_EN_GRBERZ_PUNCH:int ;
		static public var ID_EN_BEE_IDLE:int ;
		static public var ID_EN_BEE_DIE:int ;
		static public var ID_EN_SPIDER_IDLE:int ;
		static public var ID_EN_SPIDER_DIE:int ;
		static public var ID_EN_BLOB_MARCHE:int ;
		static public var ID_EN_CEZAR:int ;
		static public var ID_EN_MECHCOMM_WALK:int ;
		static public var ID_EN_WOODENCANNON_IDLE:int ;
		static public var ID_EN_WOODENCANNON_MOVING:int ;
		static public var ID_EN_GRBERZ_MARCHE:int ;
		static public var ID_EN_MINE:int ;
		static public var ID_EN_MINE_DIE:int ;
		
		static public var ID_PLAYBOOKWIREFRAME:int ;



		




		
		public function HB_AnimationFactory() {
			super();
			if(_instance != null) {
				throw new Error("instance already created");
			}
			_instance = this;
			ID_ITEM_COIN = PushClassLink(ITEM_COIN);
			ID_START_EDGE = PushClassLink(START_EDGE);
			ID_WEAPONS = PushClassLink(WEAPONS);
			ID_FX_IMPACT = PushClassLink(FX_IMPACT);
			ID_BTN_GETMOTE = PushClassLink(BTN_GETMOTE);
			ID_BTN_MOREGAMEINGAME = PushClassLink(BTN_MOREGAMEINGAME);
			ID_BTN_INVENTORY = PushClassLink(BTN_INVENTORY);
			ID_BTN_HIGHSCORE = PushClassLink(BTN_HIGHSCORE);
			ID_BTN_BUY = PushClassLink(BTN_BUY);
			ID_BTN_OPTIONS = PushClassLink(BTN_OPTIONS);
			ID_BTN_SUBMIT = PushClassLink(BTN_SUBMIT);
			ID_BTN_EQUIP = PushClassLink(BTN_EQUIP);
			ID_BTN_PLUS = PushClassLink(BTN_PLUS);
			ID_BTN_EXIT = PushClassLink(BTN_EXIT);
			ID_BTN_ARROW = PushClassLink(BTN_ARROW);
			ID_BTN_TROPHY = PushClassLink(BTN_TROPHY);
			ID_BTN_CREDITS = PushClassLink(BTN_CREDITS);
			ID_BTN_STARTTITLE = PushClassLink(BTN_STARTTITLE);
			ID_BTN_OPTIONSTITLE = PushClassLink(BTN_OPTIONSTITLE);
			ID_BTN_SPONSOR = PushClassLink(BTN_SPONSOR);
			
			ID_BTN_START = PushClassLink(BTN_START);
			//ID_BTN_RETRY = PushClassLink(BTN_RETRY);
			ID_BTN_SAVEQUIT = PushClassLink(BTN_SAVEQUIT);
			ID_BTN_SHOP = PushClassLink(BTN_SHOP);
			ID_BTN_CHALLENGE = PushClassLink(BTN_CHALLENGE);
			ID_BTN_CHALLENGEMYFRIEND = PushClassLink(BTN_CHALLENGEMYFRIEND);
			ID_BTN_VIEW = PushClassLink(BTN_VIEW);
			ID_BTN_AIM = PushClassLink(BTN_AIM);
			ID_BTN_HIT = PushClassLink(BTN_HIT);
			ID_BTN_CLEARALLDATA = PushClassLink(BTN_CLEARALLDATA);
			ID_BTN_NO = PushClassLink(BTN_NO);
			ID_BTN_YES = PushClassLink(BTN_YES);
			ID_BTN_AGAIN = PushClassLink(BTN_AGAIN);
			ID_BTN_TROPHYICON = PushClassLink(BTN_TROPHYICON);
			ID_BTN_TRYTHISGAME = PushClassLink(BTN_TRYTHISGAME);
			ID_BTN_OK = PushClassLink(BTN_OK);
			ID_BTN_BACK = PushClassLink(BTN_BACK);
			ID_BTN_FACEBOOKICON = PushClassLink(BTN_FACEBOOKICON);
			ID_BTN_TWITICON = PushClassLink(BTN_TWITICON);
			ID_BTN_MUSIC = PushClassLink(BTN_MUSIC);
			ID_BTN_SOUND = PushClassLink(BTN_SOUND);
			//ID_BTN_SPECIALFEATURE = PushClassLink(BTN_SPECIALFEATURE);
			ID_BTN_PAUSE = PushClassLink(BTN_PAUSE);
			ID_BTN_DIAMOND = PushClassLink(BTN_DIAMOND);
			ID_BTN_LOGOTITLE = PushClassLink(BTN_LOGOTITLE);
			ID_BTN_LOGOSMEDIUMCREDITS = PushClassLink(BTN_LOGOSMEDIUMCREDITS);
			ID_BTN_LOGOSINGAME = PushClassLink(BTN_LOGOSINGAME);
			ID_BTN_BZRICON = PushClassLink(BTN_BZRICON);
			ID_BTN_HOSTHISGAME = PushClassLink(BTN_HOSTHISGAME);
			ID_BTN_JIG = PushClassLink(BTN_JIG);
			ID_BTN_CHALLENGEFRIEND = PushClassLink(BTN_CHALLENGEFRIEND);
			ID_BTN_BUYSMALL = PushClassLink(BTN_BUYSMALL);
			ID_BTN_INYOURFACE = PushClassLink(BTN_INYOURFACE);
			ID_BTN_CONNECT = PushClassLink(BTN_CONNECT);
			ID_BTN_CONTROLS = PushClassLink(BTN_CONTROLS);
			ID_BTN_CON = PushClassLink(BTN_CON);
			ID_BTN_POW = PushClassLink(BTN_POW);
			ID_BTN_PRE = PushClassLink(BTN_PRE);
			ID_BTN_STR = PushClassLink(BTN_STR);
			ID_BTN_SMALLACH = PushClassLink(BTN_SMALLACH);
			ID_BTN_REVENGE = PushClassLink(BTN_REVENGE);
			ID_BTN_WHOCARES = PushClassLink(BTN_WHOCARES);
			ID_BTN_IPHONEAD = PushClassLink(BTN_IPHONEAD);
			
			ID_BTNS_WEAPONS = PushClassLink(BTNS_WEAPONS);
			ID_BTNS_PREMIUM = PushClassLink(BTNS_PREMIUM);
			ID_BTNS_ITEMS = PushClassLink(BTNS_ITEMS);
			ID_BTNS_ITEM = PushClassLink(BTNS_ITEM);
			ID_BTNS_AFTERHIT = PushClassLink(BTNS_AFTERHIT);
			ID_BTNS_BEFOREHIT = PushClassLink(BTNS_BEFOREHIT);
			ID_BTNS_ALLTIME = PushClassLink(BTNS_ALLTIME);
			ID_BTNS_DAILY = PushClassLink(BTNS_DAILY);
			ID_BTNS_WEEKLY = PushClassLink(BTNS_WEEKLY);
			ID_BTNS_MYFRIENDS = PushClassLink(BTNS_MYFRIENDS);
			ID_BTNS_HIGH = PushClassLink(BTNS_HIGH);
			ID_BTNS_LOW = PushClassLink(BTNS_LOW);
			ID_BTNS_MED = PushClassLink(BTNS_MED);
			
			ID_EN_GRBERZ_PUNCH = PushClassLink(EN_GRBERZ_PUNCH);
			ID_EN_BEE_IDLE = PushClassLink(EN_BEE_IDLE);
			ID_EN_BEE_DIE = PushClassLink(EN_BEE_DIE);
			ID_EN_SPIDER_IDLE = PushClassLink(EN_SPIDER_IDLE);
			ID_EN_SPIDER_DIE = PushClassLink(EN_SPIDER_DIE);
			ID_EN_BLOB_MARCHE = PushClassLink(EN_BLOB_MARCHE);
			ID_EN_CEZAR = PushClassLink(EN_CEZAR);
			ID_EN_MECHCOMM_WALK = PushClassLink(EN_MECHCOMM_WALK);
			ID_EN_WOODENCANNON_IDLE = PushClassLink(EN_WOODENCANNON_IDLE);
			ID_EN_WOODENCANNON_MOVING = PushClassLink(EN_WOODENCANNON_MOVING);
			ID_EN_GRBERZ_MARCHE = PushClassLink(EN_GRBERZ_MARCHE);
			ID_EN_MINE = PushClassLink(EN_MINE);
			ID_EN_MINE_DIE = PushClassLink(EN_MINE_DIE);
			
			ID_PLAYBOOKWIREFRAME = PushClassLink(PLAYBOOKWIREFRAME);
			
			ID_CHARACTER_SCREEN = PushClassLink(CHARACTER_SCREEN);
			ID_INYOURFACE_SCREEN = PushClassLink(INYOURFACE_SCREEN);
			ID_MSGBOX_SCREEN = PushClassLink(MSGBOX_SCREEN);
			ID_TROPHY_SCREEN = PushClassLink(TROPHY_SCREEN);
			ID_TROPHYPOPUP_SCREEN = PushClassLink(TROPHYPOPUP_SCREEN);
			ID_CREDITS_SCREEN = PushClassLink(CREDITS_SCREEN);
			ID_OPTION_SCREEN = PushClassLink(OPTION_SCREEN);
			ID_INVENTORY_SCREEN = PushClassLink(INVENTORY_SCREEN);
			ID_SHOP_SCREEN = PushClassLink(SHOP_SCREEN);
			ID_TITLE_SCREEN = PushClassLink(TITLE_SCREEN);
			ID_ROUNDCOMPLETE_SCREEN = PushClassLink(ROUNDCOMPLETE_SCREEN);
			ID_INGAME_SCREEN = PushClassLink(INGAME_SCREEN);
			ID_CHALLENGE_SCREEN = PushClassLink(CHALLENGE_SCREEN);
			ID_HIGHSCORE_SCREEN = PushClassLink(HIGHSCORE_SCREEN);
			ID_KILLERSHOT_SCREEN = PushClassLink(KILLERSHOT_SCREEN);
			ID_UNLOCK_SCREEN = PushClassLink(UNLOCK_SCREEN);
			ID_SPONSOR_SCREEN = PushClassLink(SPONSOR_SCREEN);
			ID_QUICKLVLUP_SCREEN = PushClassLink(QUICKLVLUP_SCREEN);
			ID_CONTROL_SCREEN = PushClassLink(CONTROL_SCREEN);
			ID_GAMECOMPLETED_SCREEN = PushClassLink(GAMECOMPLETED_SCREEN);
			ID_DIAMOND_SCREEN = PushClassLink(DIAMOND_SCREEN);
			ID_TROPHYSELECT_SCREEN = PushClassLink(TROPHYSELECT_SCREEN);
			ID_REVENGE_SCREEN = PushClassLink(REVENGE_SCREEN);
			ID_CHALLENGEBOX_SCREEN = PushClassLink(CHALLENGEBOX_SCREEN);
			ID_DISCLAIMER_SCREEN = PushClassLink(DISCLAIMER_SCREEN);
			ID_DISCLAIMER2_SCREEN = PushClassLink(DISCLAIMER2_SCREEN);
			
			
			ID_OPTIONS_WIDGET = PushClassLink(OPTIONS_WIDGET);
			
			ID_LEVELACTION = PushClassLink(LEVELACTION);
			ID_LEVELBACK1 = PushClassLink(LEVELBACK1);
			ID_LEVELBACK2 = PushClassLink(LEVELBACK2);
			
			ID_LEVEL2BACK1 = PushClassLink(LEVEL2BACK1);
			ID_LEVEL2ACTION = PushClassLink(LEVEL2ACTION);
			ID_LEVEL2BACK2 = PushClassLink(LEVEL2BACK2);
			
			ID_LEVEL3ACTION = PushClassLink(LEVEL3ACTION);
			ID_LEVEL3BACK1 = PushClassLink(LEVEL3BACK1);
			ID_LEVEL3BACK2 = PushClassLink(LEVEL3BACK2);
			
			ID_LEVEL4ACTION = PushClassLink(LEVEL4ACTION);
			ID_LEVEL4BACK1 = PushClassLink(LEVEL4BACK1);
			ID_LEVEL4BACK2 = PushClassLink(LEVEL4BACK2);

			
			ID_BALLON_GATHERIDLE = PushClassLink(BALLON_GATHERIDLE);
			ID_BALLON_GATHERIN = PushClassLink(BALLON_GATHERIN);
			ID_BALLON_HIT = PushClassLink(BALLON_HIT);
			ID_BALLON_IDLE = PushClassLink(BALLON_IDLE);
			ID_BALLON_RUNNING_HIT = PushClassLink(BALLON_RUNNING_HIT);
			ID_BALLON_RUNNING_IDLE = PushClassLink(BALLON_RUNNING_IDLE);
			
			ID_ETIENNE_GATHERIDLE = PushClassLink(ETIENNE_GATHERIDLE);
			ID_ETIENNE_GATHERIN = PushClassLink(ETIENNE_GATHERIN);
			ID_ETIENNE_HIT = PushClassLink(ETIENNE_HIT);
			ID_ETIENNE_IDLE = PushClassLink(ETIENNE_IDLE);
			ID_ETIENNE_RUNNING_HIT = PushClassLink(ETIENNE_RUNNING_HIT);
			ID_ETIENNE_RUNNING_IDLE = PushClassLink(ETIENNE_RUNNING_IDLE);
			
			ID_LACHHH_GATHERIDLE = PushClassLink(LACHHH_GATHERIDLE);
			ID_LACHHH_GATHERIN = PushClassLink(LACHHH_GATHERIN);
			ID_LACHHH_HIT = PushClassLink(LACHHH_HIT);
			ID_LACHHH_IDLE = PushClassLink(LACHHH_IDLE);
			ID_LACHHH_RUNNING_HIT = PushClassLink(LACHHH_RUNNING_HIT);
			ID_LACHHH_RUNNING_IDLE = PushClassLink(LACHHH_RUNNING_IDLE);
			
			ID_MARCUS_GATHERIDLE = PushClassLink(MARCUS_GATHERIDLE);
			ID_MARCUS_GATHERIN = PushClassLink(MARCUS_GATHERIN);
			ID_MARCUS_HIT = PushClassLink(MARCUS_HIT);
			ID_MARCUS_IDLE = PushClassLink(MARCUS_IDLE);
			ID_MARCUS_RUNNING_HIT = PushClassLink(MARCUS_RUNNING_HIT);
			ID_MARCUS_RUNNING_IDLE = PushClassLink(MARCUS_RUNNING_IDLE);
			
			ID_MATHIEU_GATHERIDLE = PushClassLink(MATHIEU_GATHERIDLE);
			ID_MATHIEU_GATHERIN = PushClassLink(MATHIEU_GATHERIN);
			ID_MATHIEU_HIT = PushClassLink(MATHIEU_HIT);
			ID_MATHIEU_IDLE = PushClassLink(MATHIEU_IDLE);
			ID_MATHIEU_RUNNING_HIT = PushClassLink(MATHIEU_RUNNING_HIT);
			ID_MATHIEU_RUNNING_IDLE = PushClassLink(MATHIEU_RUNNING_IDLE);
			
			ID_TITI_GATHERIDLE = PushClassLink(TITI_GATHERIDLE);
			ID_TITI_GATHERIN = PushClassLink(TITI_GATHERIN);
			ID_TITI_HIT = PushClassLink(TITI_HIT);
			ID_TITI_IDLE = PushClassLink(TITI_IDLE);
			ID_TITI_RUNNING_HIT = PushClassLink(TITI_RUNNING_HIT);
			ID_TITI_RUNNING_IDLE = PushClassLink(TITI_RUNNING_IDLE);
			
			ID_BANDANA_BALLON = PushClassLink(BANDANA_BALLON);
			ID_BANDANA_ETIENNE = PushClassLink(BANDANA_ETIENNE);
			ID_BANDANA_LACHHH = PushClassLink(BANDANA_LACHHH);
			ID_BANDANA_MARCUS = PushClassLink(BANDANA_MARCUS);
			ID_BANDANA_MATHIEU = PushClassLink(BANDANA_MATHIEU);
			ID_BANDANA_TITI = PushClassLink(BANDANA_TITI);
			
			ID_BELT_BALLON = PushClassLink(BELT_BALLON);
			ID_BELT_ETIENNE = PushClassLink(BELT_ETIENNE);
			ID_BELT_LACHHH1 = PushClassLink(BELT_LACHHH1);
			ID_BELT_LACHHH2 = PushClassLink(BELT_LACHHH2);
			ID_BELT_LACHHH3 = PushClassLink(BELT_LACHHH3);
			ID_BELT_MARCUS = PushClassLink(BELT_MARCUS);
			ID_BELT_MATHIEU = PushClassLink(BELT_MATHIEU);
			ID_BELT_TITI1 = PushClassLink(BELT_TITI1);
			ID_BELT_TITI2 = PushClassLink(BELT_TITI2);
			
			ID_BRACER_BALLON = PushClassLink(BRACER_BALLON);
			ID_BRACER_LACHHH = PushClassLink(BRACER_LACHHH);
			ID_BRACER_MARCUS = PushClassLink(BRACER_MARCUS);
			ID_BRACER_MATHIEU = PushClassLink(BRACER_MATHIEU);
			ID_BRACER_TITI = PushClassLink(BRACER_TITI);
			ID_BRACER_ETIENNE = PushClassLink(BRACER_ETIENNE);
			
			ID_WEAPONS = PushClassLink(WEAPONS);
			
			ID_GEEK_COMPUTER_IDLE = PushClassLink(GEEK_COMPUTER_IDLE);
			ID_GEEK_COMPUTER_WALK = PushClassLink(GEEK_COMPUTER_WALK);
			ID_GEEK_COMPUTER_FLY = PushClassLink(GEEK_COMPUTER_FLY);
			ID_GEEK_COMPUTER_HIT1 = PushClassLink(GEEK_COMPUTER_HIT1);
			ID_GEEK_COMPUTER_HIT2 = PushClassLink(GEEK_COMPUTER_HIT2);
			ID_GEEK_COMPUTER_HIT3 = PushClassLink(GEEK_COMPUTER_HIT3);
			ID_GEEK_COMPUTER_LANDED = PushClassLink(GEEK_COMPUTER_LANDED);
			
			ID_FX_DECOR_1 = PushClassLink(FX_DECOR_1);
			ID_FX_DECOR_2 = PushClassLink(FX_DECOR_2);
			ID_FX_DECOR_3 = PushClassLink(FX_DECOR_3);
			ID_FX_DECOR_4 = PushClassLink(FX_DECOR_4);
			ID_FX_DECOR_NUAGE_FOREGROUND = PushClassLink(FX_DECOR_NUAGE_FOREGROUND);
			ID_FX_DECOR_NUAGE_FOREGROUND2 = PushClassLink(FX_DECOR_NUAGE_FOREGROUND2);
			
			
			ID_FX_DECOR_LVL2_1 = PushClassLink(FX_DECOR_LVL2_1);
			ID_FX_DECOR_LVL2_2 = PushClassLink(FX_DECOR_LVL2_2);
			ID_FX_DECOR_LVL2_3 = PushClassLink(FX_DECOR_LVL2_3);
			ID_FX_DECOR_LVL2_4 = PushClassLink(FX_DECOR_LVL2_4);
			ID_FX_GEEKBULLANIM = PushClassLink(FX_GEEKBULLANIM);
			
			ID_FX_BLOODPUFF1 = PushClassLink(FX_BLOODPUFF1);
			ID_FX_DECOR_LVL3_1 = PushClassLink(FX_DECOR_LVL3_1);
			ID_FX_DECOR_LVL3_2 = PushClassLink(FX_DECOR_LVL3_2);
			ID_FX_DECOR_LVL3_3 = PushClassLink(FX_DECOR_LVL3_3);
			ID_FX_DECOR_LVL3_4 = PushClassLink(FX_DECOR_LVL3_4);
			ID_FX_FIRE = PushClassLink(FX_FIRE);
			ID_FX_GROUNDBLOOD1 = PushClassLink(FX_GROUNDBLOOD1);
			ID_FX_GROUNDBLOOD2 = PushClassLink(FX_GROUNDBLOOD2);
			ID_FX_GROUNDBLOOD3 = PushClassLink(FX_GROUNDBLOOD3);
			ID_FX_GROUNDBLOOD_DRAW1 = PushClassLink(FX_GROUNDBLOOD_DRAW1);
			ID_FX_GROUNDBLOOD_DRAW2 = PushClassLink(FX_GROUNDBLOOD_DRAW2);
			ID_FX_GROUNDBLOOD_DRAW3 = PushClassLink(FX_GROUNDBLOOD_DRAW3);
			ID_FX_RUNNINGSMOKE = PushClassLink(FX_RUNNINGSMOKE);
			ID_FX_RUNNINGSMOKE2 = PushClassLink(FX_RUNNINGSMOKE2);
			ID_FX_SCORE_SIGN = PushClassLink(FX_SCORE_SIGN);
			ID_FX_MECHCOMMCROSSFIRE = PushClassLink(FX_MECHCOMMCROSSFIRE);
			ID_FX_MECHCOMMCROSSFIRELOCKED = PushClassLink(FX_MECHCOMMCROSSFIRELOCKED);
			
			ID_FX_BLOODPUFF2 = PushClassLink(FX_BLOODPUFF2);
			ID_FX_CANONFIRE = PushClassLink(FX_CANONFIRE);
			ID_FX_GEEK_CURSOR = PushClassLink(FX_GEEK_CURSOR);
			ID_FX_GROUNDBLOODGREEN = PushClassLink(FX_GROUNDBLOODGREEN);
			ID_FX_GROUNDGREENBLOOD_DRAW = PushClassLink(FX_GROUNDGREENBLOOD_DRAW);
			ID_FX_GEEK_CONTROL_BACKWARD = PushClassLink(FX_GEEK_CONTROL_BACKWARD);
			ID_FX_GEEK_CONTROL_FORWARD = PushClassLink(FX_GEEK_CONTROL_FORWARD);
			
			ID_START_EDGE_LVL3 = PushClassLink(START_EDGE_LVL3);
			
			ID_START_EDGE_LVL2 = PushClassLink(START_EDGE_LVL2);
			
			ID_DECOR_NUAGE1 = PushClassLink(DECOR_NUAGE1);
			ID_DECOR_NUAGE2 = PushClassLink(DECOR_NUAGE2);
			ID_DECOR_NUAGE3 = PushClassLink(DECOR_NUAGE3);
			ID_DECOR_NUAGE2_1 = PushClassLink(DECOR_NUAGE2_1);
			ID_DECOR_NUAGE2_2 = PushClassLink(DECOR_NUAGE2_2);
			ID_DECOR_NUAGE2_3 = PushClassLink(DECOR_NUAGE2_3);
			
			ID_DECOR_NUAGE3_1 = PushClassLink(DECOR_NUAGE3_1);
			ID_DECOR_NUAGE3_2 = PushClassLink(DECOR_NUAGE3_2);
			ID_DECOR_NUAGE3_3 = PushClassLink(DECOR_NUAGE3_3);
			ID_DENIZE_GATHERIDLE = PushClassLink(DENIZE_GATHERIDLE);
			ID_DENIZE_GATHERIN = PushClassLink(DENIZE_GATHERIN);
			ID_DENIZE_HIT = PushClassLink(DENIZE_HIT);
			ID_DENIZE_IDLE = PushClassLink(DENIZE_IDLE);
			ID_DENIZE_RUNNING_HIT = PushClassLink(DENIZE_RUNNING_HIT);
			ID_DENIZE_RUNNING_IDLE = PushClassLink(DENIZE_RUNNING_IDLE);
			ID_FX_DECOR_LVL4_1 = PushClassLink(FX_DECOR_LVL4_1);
			ID_FX_DECOR_LVL4_2 = PushClassLink(FX_DECOR_LVL4_2);
			ID_FX_DECOR_LVL4_3 = PushClassLink(FX_DECOR_LVL4_3);
			ID_FX_DECOR_LVL4_4 = PushClassLink(FX_DECOR_LVL4_4);
			ID_START_EDGE_LVL4 = PushClassLink(START_EDGE_LVL4);
		}
		
		
		override public function GetAnimationAssetGroup(a:AnimationAsset):int {
			//To override
			if(a is WEAPONS) return Hero.WEAPON_GROUP_ID;
			if(Utils.IsInstanceOfClass(a, ALL_BANDANA)) return Hero.BANDANA_GROUP_ID;
			if(Utils.IsInstanceOfClass(a, ALL_BELT)) return Hero.BELT_GROUP_ID;
			if(Utils.IsInstanceOfClass(a, ALL_BRACERS)) return Hero.BRACERS_GROUP_ID;
			if(Utils.IsInstanceOfClass(a, ALL_NEZ)) return Hero.TITI_NEZ_GROUP_ID;
			
			return super.GetAnimationAssetGroup(a);
		}
		
		
		static public function get instance() : HB_AnimationFactory {
			return _instance;
		}
		
	}
}
