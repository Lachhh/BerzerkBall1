package com.homerun.factories {
	import com.homerun.exported.*;
	import com.lachhhEngine.games.factory.SfxFactory;
	import com.lachhhEngine.utils.Utils;

	/**
	 * @author Lachhh
	 */
	public class HB_SfxFactory extends SfxFactory {
	
		static private var _instance:HB_SfxFactory ;
		static public var ID_MUSIC_HIT:int ;
		static public var ID_MUSIC_GEEK:int ;
		static public var ID_MUSIC_TITLE:int ;
		static public var ID_MUSIC_HIT2:int ;
		static public var ID_MUSIC_HIT3:int ;
		
		static public var ID_SFX_EXPLOSION:int ;
		static public var ID_SFX_WEAPON_AIRSTRIKE:int ;
		static public var ID_SFX_SWORD_SWING2:int ;
		
		static public var ID_SFX_GEEK_CAVE6:int ;
		static public var ID_SFX_GEEK_CAVE1:int ;
		static public var ID_SFX_GEEK_CAVE2:int ;
		static public var ID_SFX_GEEK_CAVE3:int ;
		static public var ID_SFX_GEEK_CAVE4:int ;
		static public var ID_SFX_GEEK_CAVE5:int ;
		
		static public var ID_SFX_WEAPON14_DINO:int ;
		static public var ID_SFX_CROWD:int ;
		static public var ID_SFX_BUY:int ;
		static public var ID_SFX_EQUIP:int ;
		static public var ID_SFX_DEATH_SPIDER:int ;
		
		static public var ID_SFX_BEE:int ;
		static public var ID_SFX_BLOB:int ;
		static public var ID_SFX_UI_ROLLOVER:int ;
		static public var ID_SFX_LOCKED_TARGET:int ;
		static public var ID_SFX_LEGS2:int ;
		
		static public var ID_SFX_UI_OPEN1:int ;
		static public var ID_SFX_UI_OPEN2:int ;
		static public var ID_SFX_MEGA_FACE_PUNCH1:int ;
		static public var ID_SFX_MEGA_FACE_PUNCH2:int ;
		static public var ID_SFX_MEGA_FACE_PUNCH3:int ;
		static public var ID_SFX_MEGA_FACE_PUNCH4:int ;
		static public var ID_SFX_MEGA_FACE_PUNCH5:int ;
		static public var ID_SFX_MEGA_FACE_PUNCH6:int ;
	
		
		
		static public var ID_SFX_CANON:int ;
		static public var ID_SFX_SIDE_ARTWORK:int ;
		static public var ID_SFX_ACC_CLICK:int ;
		static public var ID_SFX_HIT_GEEK1:int ;
		static public var ID_SFX_HIT_GEEK2:int ;
		static public var ID_SFX_LEVEL_UP:int ;
		static public var ID_SFX_STAT_BOOST:int ;
		static public var ID_SFX_UI_CANCEL:int ;
		static public var ID_SFX_UI_OK2:int ;
		static public var ID_SFX_UI_OK3:int ;
		static public var ID_SFX_UI_OK4:int ;
		static public var ID_SFX_CHALLENGE_BELL:int ;
		static public var ID_SFX_LVL_END:int ;
		static public var ID_SFX_LVL_PROGRESS:int ;
		
		
		
		
				
				
				
		
				

		public function HB_SfxFactory() {
			super();
			if(_instance != null) {
				throw new Error("instance already created");
			}
			_instance = this;
			
			ID_MUSIC_HIT = PushClassLink(MUSIC_HIT);
			ID_MUSIC_HIT2 = PushClassLink(MUSIC_HIT2);
			ID_MUSIC_HIT3 = PushClassLink(MUSIC_HIT3);
		
			ID_MUSIC_GEEK = PushClassLink(MUSIC_GEEK);
			ID_MUSIC_TITLE = PushClassLink(MUSIC_TITLE);
			ID_SFX_SWORD_SWING2 = PushClassLink(SFX_SWORD_SWING2);
			ID_SFX_EXPLOSION = PushClassLink(SFX_EXPLOSION);
			ID_SFX_WEAPON_AIRSTRIKE = PushClassLink(SFX_WEAPON_AIRSTRIKE);
			ID_SFX_GEEK_CAVE6 = PushClassLink(SFX_GEEK_CAVE6);
			ID_SFX_GEEK_CAVE1 = PushClassLink(SFX_GEEK_CAVE1);
			ID_SFX_GEEK_CAVE2 = PushClassLink(SFX_GEEK_CAVE2);
			ID_SFX_GEEK_CAVE3 = PushClassLink(SFX_GEEK_CAVE3);
			ID_SFX_GEEK_CAVE4 = PushClassLink(SFX_GEEK_CAVE4);
			ID_SFX_GEEK_CAVE5 = PushClassLink(SFX_GEEK_CAVE5);
			

			ID_SFX_WEAPON14_DINO = PushClassLink(SFX_WEAPON14_DINO);
			ID_SFX_CROWD = PushClassLink(SFX_CROWD);
			ID_SFX_BUY = PushClassLink(SFX_BUY);
			ID_SFX_EQUIP = PushClassLink(SFX_EQUIP);
			ID_SFX_DEATH_SPIDER = PushClassLink(SFX_DEATH_SPIDER);
			ID_SFX_BEE = PushClassLink(SFX_BEE);
			ID_SFX_BLOB = PushClassLink(SFX_BLOB);
			ID_SFX_UI_ROLLOVER = PushClassLink(SFX_UI_ROLLOVER);
			ID_SFX_LOCKED_TARGET = PushClassLink(SFX_LOCKED_TARGET);	
			ID_SFX_LEGS2 = PushClassLink(SFX_LEGS2);
			
			ID_SFX_UI_OPEN1 = PushClassLink(SFX_UI_OPEN1);
			ID_SFX_UI_OPEN2 = PushClassLink(SFX_UI_OPEN2);
			ID_SFX_MEGA_FACE_PUNCH1 = PushClassLink(SFX_MEGA_FACE_PUNCH1);
			ID_SFX_MEGA_FACE_PUNCH2 = PushClassLink(SFX_MEGA_FACE_PUNCH2);
			ID_SFX_MEGA_FACE_PUNCH3 = PushClassLink(SFX_MEGA_FACE_PUNCH3);
			ID_SFX_MEGA_FACE_PUNCH4 = PushClassLink(SFX_MEGA_FACE_PUNCH4);
			ID_SFX_MEGA_FACE_PUNCH5 = PushClassLink(SFX_MEGA_FACE_PUNCH5);
			ID_SFX_MEGA_FACE_PUNCH6 = PushClassLink(SFX_MEGA_FACE_PUNCH6);
			
			
			ID_SFX_CANON = PushClassLink(SFX_CANON);
			ID_SFX_SIDE_ARTWORK = PushClassLink(SFX_SIDE_ARTWORK);
			ID_SFX_ACC_CLICK = PushClassLink(SFX_ACC_CLICK);
			ID_SFX_HIT_GEEK1 = PushClassLink(SFX_HIT_GEEK1);
			ID_SFX_HIT_GEEK2 = PushClassLink(SFX_HIT_GEEK2);
			ID_SFX_LEVEL_UP = PushClassLink(SFX_LEVEL_UP);
			ID_SFX_STAT_BOOST = PushClassLink(SFX_STAT_BOOST);
			ID_SFX_UI_CANCEL = PushClassLink(SFX_UI_CANCEL);
			ID_SFX_UI_OK2 = PushClassLink(SFX_UI_OK2);
			ID_SFX_UI_OK3 = PushClassLink(SFX_UI_OK3);
			ID_SFX_UI_OK4 = PushClassLink(SFX_UI_OK4);
			
			ID_SFX_CHALLENGE_BELL = PushClassLink(SFX_CHALLENGE_BELL);
			ID_SFX_LVL_END = PushClassLink(SFX_LVL_END);
			ID_SFX_LVL_PROGRESS = PushClassLink(SFX_LVL_PROGRESS);
		}

		static public function get randomMegaPunch():int {
			return int(Utils.PickRandomIn([HB_SfxFactory.ID_SFX_MEGA_FACE_PUNCH1,
				HB_SfxFactory.ID_SFX_MEGA_FACE_PUNCH2, 
				HB_SfxFactory.ID_SFX_MEGA_FACE_PUNCH3, 
				HB_SfxFactory.ID_SFX_MEGA_FACE_PUNCH4, 
				HB_SfxFactory.ID_SFX_MEGA_FACE_PUNCH5, 
				HB_SfxFactory.ID_SFX_MEGA_FACE_PUNCH6]));	
		}
		
		static public function get randomHitGeek():int {
			return int(Utils.PickRandomIn([HB_SfxFactory.ID_SFX_HIT_GEEK1,
				HB_SfxFactory.ID_SFX_HIT_GEEK2]));	
		}
		
		static public function get randomUiOpen():int {
			return int(Utils.PickRandomIn([HB_SfxFactory.ID_SFX_UI_OPEN1,
				HB_SfxFactory.ID_SFX_UI_OPEN2]));
		}
		
		static public function get randomOk():int {
			return int(Utils.PickRandomIn([HB_SfxFactory.ID_SFX_UI_OK2,
				HB_SfxFactory.ID_SFX_UI_OK3, 
				HB_SfxFactory.ID_SFX_UI_OK4]));	
		}
		
		static public function get instance() : HB_SfxFactory {
			return _instance;
		}

		override public function get uiCancelSoundId() : int {return ID_SFX_UI_CANCEL;}
		override public function get uiOkSoundId() : int {return randomOk;}
		override public function get uiRollOverSoundId() : int { return ID_SFX_UI_ROLLOVER;}
	}
}
