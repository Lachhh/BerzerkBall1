package com.homerun.hero {
	import com.homerun.meta.ui.trophy.MetaTrophy;

	import flash.events.MouseEvent;
	import com.homerun.HB_Game;
	import com.homerun.actor.HB_Actor;
	import com.homerun.constants.HBConstants;
	import com.homerun.effects.HB_GameEffectManager;
	import com.homerun.enemy.Berzerker;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.io.AchievementManager;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.io.HB_LevelVaultController;
	import com.homerun.meta.MetaHBGeek;
	import com.homerun.meta.ui.MetaPerso;
	import com.homerun.meta.ui.equip.MetaEquipmentEnum;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.homerun.multilingual.HB_TextFactory;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.effects.GameEffectContainerId;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.physique.Actor;
	import com.lachhhEngine.games.physique.EquationVecto;
	import com.lachhhEngine.games.physique.Line;
	import com.lachhhEngine.games.physique.Moteur;
	import com.lachhhEngine.games.physique.PhysicManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.io.KeyManager;
	import com.lachhhEngine.io.encryption.SecureNumber;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.geom.Point;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class Geek extends HB_Actor {
		private const WAIT_UNTIL_NEXT_QUOTE:int = 5*36;
		private const WAIT_UNTIL_QUOTE_DISAPPEAR:int = 1*36;
		private const Y_GROUND:int = 0 ; 
		private var _line:Line ;
		private var _allLine:Array = new Array();
		private var _hasBeenHit:Boolean ;
		private var _applyGrav:Boolean ;
		private var _goingBack:Boolean ;
		private var _waitBeforeGetUP:Number ;
		private var _landed:Boolean ;
		private var _quote:Actor ;
		private var _fire:Actor ;
		private var _fxCtrlBack:Actor ;
		private var _fxCtrlFront:Actor ;
		private var _fxCursor:Actor ;
		private var _waitQuoteTime:Number ;
		private var _lastQuote:int ;
		private var _lastSnd:int;
		private var _hasRebound:Boolean ;
		private var _reboundRot:Number ;
		
		private const WAIT_BETWEEN_BLOOD:int = 1;
		private var _waitBetweenBloodSplash:Number ;
		private var _nbBloodSplash:int = 5;
		private var _waitBerzerker:Number ;
		
		private var _controlSteeringX:SecureNumber = new SecureNumber();
		private var _controlSteeringY:SecureNumber = new SecureNumber();
		private var _controlSteeringDirection:Point = new Point();
		private var _isInCannon:Boolean ;
		private var _hitByBerzerk:Berzerker;
		private var _punched:Number = 0;
		
		private var _px:SecureNumber = new SecureNumber();
		private var _py:SecureNumber = new SecureNumber();
		private var _vx:SecureNumber = new SecureNumber();
		private var _vy:SecureNumber = new SecureNumber(); 
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			SwitchAnim(metaGeek.animIdleId);
			
			_line = PhysicManager.instance.CreateLine(0, 100, 0, 0, false, false);
			layer.AddLine(_line);
			_allLine.push(_line);
			mass = HBConstants.GEEK_MASS/100;
			
			SetRayon(34);
			_nBounce = 0.75;
			_hasBeenHit = false;
			_applyGrav = false;
			_goingBack = false;
			_waitBeforeGetUP = 30;
			_landed = false;
			_quote = context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_GEEKBULLANIM, GameEffectContainerId.ABOVE, px, py, layer.metaLayer, -1, true);
			_fire = context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_FIRE, GameEffectContainerId.ABOVE, px, py, layer.metaLayer, -1, true);
			
			_fxCtrlBack = context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_GEEK_CONTROL_BACKWARD, GameEffectContainerId.ABOVE, px, py, layer.metaLayer, -1, true);
			_fxCtrlFront = context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_GEEK_CONTROL_FORWARD, GameEffectContainerId.ABOVE, px, py, layer.metaLayer, -1, true);
			_fxCursor = context.gameEffectManager.CreateStaticFx(HB_AnimationFactory.ID_FX_GEEK_CURSOR, GameEffectContainerId.ABOVE, px, py, layer.metaLayer, -1, true);
			
			quoteBulleAnim.alpha = 0;
			_waitQuoteTime = WAIT_UNTIL_QUOTE_DISAPPEAR;
			_lastQuote = -1;
			_lastSnd = -1;
			_hasRebound = false;
			_reboundRot = 0 ; 
			_waitBetweenBloodSplash = 0 ;
			_nbBloodSplash = 5 ;
			_fire.animationContainer.visible = _fxCtrlBack.animationContainer.visible = _fxCtrlFront.animationContainer.visible = _fxCursor.animationContainer.visible =  false;
			controlSteeringY = controlSteeringX = 0 ;
			_waitBerzerker = 7;
			
			animationContainer.addEventListener(MouseEvent.MOUSE_DOWN, onClickGeek) ;
		}

		override public function Destroy() : void {
			animationContainer.removeEventListener(MouseEvent.MOUSE_DOWN, onClickGeek) ;
			super.Destroy();
			
			_allLine.shift();
			layer.RemoveLine(_line);
			PhysicManager.instance.DestroyPhysicObject(_line);			
			_line = null;
		}
		
		private function onClickGeek(event : MouseEvent) : void {
			if(_landed) {
				SwitchAnim(metaGeek.animFlyId);
				anim.rotation = 45;
				_punched = 5;
				Jukebox.instance.PlaySound(HB_SfxFactory.randomMegaPunch);
				context.camera.ShakeCamera(25);
				HB_GameEffectManager(context.gameEffectManager).CreateFxBloodPuff(HB_AnimationFactory.ID_FX_BLOODPUFF1, GameEffectContainerId.ABOVE, px, py-30, Math.random()*5+10, Math.random()*5-10, layer.metaLayer);
				animationContainer.buttonMode = animationContainer.mouseEnabled = animationContainer.mouseChildren = false;
				
				AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_28);
			}
		}

		public function HitByPerso(x:Number, y:Number):void {
			_hasBeenHit = true;
			_hasRebound = false;
			_applyGrav = true;
			vx = x;
			vy = y;
			SwitchAnim(metaGeek.animFlyId);
			animationContainer.rotation = Utils.GetHomingAngle(animationContainer.rotation-90, 0, 0, vx, vy, 1)+90;
			
			DoForceFx();			
		}
		
		public function HitByBerzerker(b:Berzerker):void {
			_hitByBerzerk = b;
			_waitBerzerker = 14;
		}
		
		public function HideAndPause():void {
			animationContainer.visible = false;
			SetEnable(false);
			_isInCannon = true;		
		}
		
		public function ShowAndUnpause():void {
			animationContainer.visible = true;
			SetEnable(true);	
			_isInCannon = false;
		}
		 
		private function DoForceFx():void {
			var force:Number = (vx*vx+vy+vy);
			ResetBloodPuffTimer(Math.min(force/1000, 40));
		}
				
		override public function Update(context : Game) : void {
			super.Update(context);
			
			if(_punched > 0) {
				_punched -= context.speedManager.GetSpeed();
				if(_punched <= 0) {
					_punched = 0 ; 
					GetUp();
				}	
				return ;
			}
			
			if(!_hasBeenHit) {
				animationContainer.rotation = 0;
				UpdateQuote();
				return ;
			}
			
			
			if(_landed) {
				if(_goingBack) {
					UpdateQuote();
					px += -5*context.speedManager.GetSpeed();
					if(px <= -50) {
						AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_39);	
					}	
				} else {
					_waitBeforeGetUP -= context.speedManager.GetSpeed();
					if(_waitBeforeGetUP <= 0) {
						GetUp();
					}
				}
				animationContainer.rotation = 0;
			} else {
				
				quoteBulleAnim.alpha -= 0.1 ;
				if(quoteBulleAnim.alpha <= 0) {
					quoteBulleAnim.alpha = 0 ;
				}
			
				vy += grav * context.speedManager.GetSpeed();
				
				px += (vx + controlVx) * context.speedManager.GetSpeed();
				py += (vy + controlVy) * context.speedManager.GetSpeed();
				if(py >= -rayon+Y_GROUND) {
					if((vx < 3)) {
						Land();
					} else {
						px -= (vx + controlVx) * context.speedManager.GetSpeed();
						py -= (vy + controlVy) * context.speedManager.GetSpeed();
						_line.x1 = px - Math.max(30, rayon+vx);
						_line.x2 = px + Math.max(30, rayon+vx);
						
						Moteur.JustRebound(context, this, _allLine, null);
						Rebound();
					}
				}
				
				Blur(vx/50);
				context.ammoManager.DoDamageAt(context, px, py, vx, vy, rayon, 0, metaGeek.targetTeam, this, layer.metaLayer);
				UpdateControl();
				//_distance.value += vx;
			}
			
			if(isFlyAnim) {
				animationContainer.rotation = Utils.GetHomingAngle(animationContainer.rotation-90, 0, 0, vx, vy*4, 1)+90;
			} else if(isHitAnim) {
				animationContainer.rotation += _reboundRot*context.speedManager.GetSpeed();
				_reboundRot *= 0.99; 
			}
			
			if(isOffScreen) {
				_fire.animationContainer.visible = true ;
				_fxCursor.animationContainer.visible = true;
				_fxCursor.px = px;
				_fxCursor.py = context.camera.GetYUpBorder(layer);
			} else {
				_fxCursor.animationContainer.visible = false;
			}

			if(_landed || (_controlSteeringDirection.x == 0 && _controlSteeringDirection.y == 0)) {
				_fxCtrlBack.animationContainer.visible = false;
				_fxCtrlFront.animationContainer.visible = false;
			} else {
				if(_controlSteeringDirection.x > 0) {
					_fxCtrlBack.animationContainer.visible = false;
					_fxCtrlFront.animationContainer.visible = true;
				} else if(_controlSteeringDirection.x < 0) {
					_fxCtrlBack.animationContainer.visible = true;
					_fxCtrlFront.animationContainer.visible = false;
				} else {
					if(vy*_controlSteeringDirection.y > 0) {
						_fxCtrlBack.animationContainer.visible = false;
						_fxCtrlFront.animationContainer.visible = true;
					} else {
						_fxCtrlBack.animationContainer.visible = true;
						_fxCtrlFront.animationContainer.visible = false;
					}
				}
			}
			
			_fxCtrlBack.animationContainer.rotation = _fxCtrlFront.animationContainer.rotation = EquationVecto.GetRotation(0, _controlSteeringDirection.x, 0, _controlSteeringDirection.y);
			
			UpdateBloodPuff();
			
			_fxCtrlFront.px = _fxCtrlBack.px = _fire.px = px;
			_fxCtrlFront.py = _fxCtrlBack.py = _fire.py = py;
			_fire.animationContainer.rotation = Utils.GetHomingAngle(animationContainer.rotation-90, 0, 0, vx, vy*4, 1)+90;
			if(_isInCannon) {
				_fire.animationContainer.visible = false ;
				_fxCtrlBack.animationContainer.visible = false;
				_fxCtrlFront.animationContainer.visible = false;
			}
		}
		
		private function UpdateControl():void {
			_controlSteeringDirection.y = _controlSteeringDirection.x = 0 ;
			if(metaPerso.autoForward) _controlSteeringDirection.x = 1;
			if(KeyManager.IsKeyDownAtLeast(HB_Game.KEYS_LEFT)) _controlSteeringDirection.x = -1;
			if(KeyManager.IsKeyDownAtLeast(HB_Game.KEYS_RIGHT)) _controlSteeringDirection.x = 1; 
			//if(KeyManager.IsKeyDownAtLeast(HB_Game.KEYS_UP)) _controlSteeringDirection.y = 1; 
			//if(KeyManager.IsKeyDownAtLeast(HB_Game.KEYS_DOWN)) _controlSteeringDirection.y = -1;
			controlSteeringX += _controlSteeringDirection.x*(((metaPerso.totalControl)/30) * context.speedManager.GetSpeed());
			controlSteeringY += _controlSteeringDirection.y*(((metaPerso.totalControl)/30) * context.speedManager.GetSpeed());  
			controlSteeringX *= 0.95;
			controlSteeringY *= 0.95;
			controlSteeringX = Math.min(Math.max(controlSteeringX, -1), 1);
			controlSteeringY = Math.min(Math.max(controlSteeringY, -1), 1);
		}
		
		private function ResetBloodPuffTimer(nPuff:int = 5):void {
			_waitBetweenBloodSplash = 0 ;
			_nbBloodSplash = nPuff ;  
		}
		
		private function UpdateBloodPuff():void {
			if(_nbBloodSplash > 0) {
				_waitBetweenBloodSplash -= context.speedManager.GetSpeed();
				if(_waitBetweenBloodSplash <= 0) {
					_waitBetweenBloodSplash = WAIT_BETWEEN_BLOOD;
					_nbBloodSplash--;
					HB_GameEffectManager(context.gameEffectManager).CreateFxBloodPuff(HB_AnimationFactory.ID_FX_BLOODPUFF1, GameEffectContainerId.ABOVE, px -vx*.5, py-vy*.5, vx*0.5, vy*0.5, layer.metaLayer);			
				}
			}
		}
		
		private function CreateGroundBlood(x:int, y:int):void {
			var animId:int = int(Utils.PickRandomIn([HB_AnimationFactory.ID_FX_GROUNDBLOOD_DRAW1,HB_AnimationFactory.ID_FX_GROUNDBLOOD_DRAW2, HB_AnimationFactory.ID_FX_GROUNDBLOOD_DRAW3]));
			HB_GameEffectManager(context.gameEffectManager).CreateFxGroundBlood(animId, x, y, layer.metaLayer);
		}
		
		private function UpdateQuote():void {
			_quote.px = px;
			_quote.py = py;
			_waitQuoteTime -= context.speedManager.GetSpeed();
			if(_waitQuoteTime > WAIT_UNTIL_QUOTE_DISAPPEAR) {
				quoteBulleAnim.alpha = Math.min(1, quoteBulleAnim.alpha + 0.1) ;
			} else if(_waitQuoteTime > 0) {
				quoteBulleAnim.alpha = Math.max(0, quoteBulleAnim.alpha - 0.1) ;
			} else {
				ShowRandomQuote();
			}
		}
		
		private function Blur(x:int):void {
			if(x <= 0) return ;
			if(x >= 50) x = 25;
			var b:BlurFilter = new BlurFilter(x,x,BitmapFilterQuality.LOW);
			animationContainer.filters = [b];	
		}
		
		private function Rebound():void {
			var force:Number = (vx*vx+vy+vy);
			_fire.animationContainer.visible = false;
			
			CreateGroundBlood(px, Y_GROUND);
			
			DoForceFx();
			
			var bonus:Number = 0;
			
			if(HB_GameProgress.gameProgress.metaProgress.lastSelected.IsEquipped(MetaEquipmentEnum.EQUIP_BELT_1)) {
				bonus += 0.10;
			} 
			if(HB_GameProgress.gameProgress.metaProgress.lastSelected.IsEquipped(MetaEquipmentEnum.EQUIP_BRACERS_8)) {
				bonus += 0.05;
			}
			vx *= (0.75 + bonus);
			
			SwitchAnimRandomHit();
			context.camera.ShakeCamera(10);
			Jukebox.instance.PlaySound(HB_SfxFactory.randomMegaPunch);
			_hasRebound = true;
			_reboundRot = force/500;
			
			
		}
		
		private function SwitchAnimRandomHit():void {
			var a:Array = metaGeek.animAirIdle.slice();
			Utils.RemoveFromArray(a, anim.metaAnimation.instanceType);
			SwitchAnim(int(Utils.PickRandomIn(a))); 
		}
		
		private function Land():void {
			if(_landed) return ;
			_landed = true;
			_hasRebound = true;
			SwitchAnim(metaGeek.animLanded);
			_applyGrav = false;
			py = -52 + Y_GROUND;
			vx = 0 ;
			vy = 0 ; 
			HB_Game(context).FinishRound();
		}
		
		private function GetUp():void {
			SwitchAnim(HB_AnimationFactory.ID_GEEK_COMPUTER_WALK);
			_goingBack = true;
			anim.scaleX = -1;
			_waitQuoteTime = 0;
			animationContainer.buttonMode = animationContainer.mouseEnabled = animationContainer.mouseChildren = true;
		}
		
		public function ShowRandomQuote():void {
			var allQuotes:Array ;
			var allSnd:Array = [HB_SfxFactory.ID_SFX_GEEK_CAVE1, 
					HB_SfxFactory.ID_SFX_GEEK_CAVE2, 
					HB_SfxFactory.ID_SFX_GEEK_CAVE3,
					HB_SfxFactory.ID_SFX_GEEK_CAVE4,
					HB_SfxFactory.ID_SFX_GEEK_CAVE5,
					HB_SfxFactory.ID_SFX_GEEK_CAVE6];
			Utils.RemoveFromArray(allSnd, _lastSnd);
			_lastSnd = int(Utils.PickRandomIn(allSnd));
			
			if(HB_LevelVaultController.myChallengerHighscore == null) {
				if(!_hasBeenHit) { 
					allQuotes = [HB_TextFactory.ID_GEEK_QUOTE_1, 
							HB_TextFactory.ID_GEEK_QUOTE_2, 
							HB_TextFactory.ID_GEEK_QUOTE_3, 
							HB_TextFactory.ID_GEEK_QUOTE_4, 
							HB_TextFactory.ID_GEEK_QUOTE_5, 
							HB_TextFactory.ID_GEEK_QUOTE_6,
							HB_TextFactory.ID_GEEK_QUOTE_7,
							HB_TextFactory.ID_GEEK_QUOTE_8,
							HB_TextFactory.ID_GEEK_QUOTE_9,
							HB_TextFactory.ID_GEEK_QUOTE_10,
							HB_TextFactory.ID_GEEK_QUOTE_11,
							HB_TextFactory.ID_GEEK_QUOTE_12,
							HB_TextFactory.ID_GEEK_QUOTE_13,
							HB_TextFactory.ID_GEEK_QUOTE_14,
							HB_TextFactory.ID_GEEK_QUOTE_15,
							];
							
				} else if(_goingBack) {
					allQuotes = [HB_TextFactory.ID_GEEK_QUOTE_AFTER_1, 
						HB_TextFactory.ID_GEEK_QUOTE_AFTER_2, 
						HB_TextFactory.ID_GEEK_QUOTE_AFTER_3, 
						HB_TextFactory.ID_GEEK_QUOTE_AFTER_4, 
						HB_TextFactory.ID_GEEK_QUOTE_AFTER_5, 
						HB_TextFactory.ID_GEEK_QUOTE_AFTER_6,
						HB_TextFactory.ID_GEEK_QUOTE_AFTER_7,
						HB_TextFactory.ID_GEEK_QUOTE_AFTER_8,
						HB_TextFactory.ID_GEEK_QUOTE_AFTER_9,
						HB_TextFactory.ID_GEEK_QUOTE_AFTER_10];
				}
					
				Utils.RemoveFromArray(allQuotes, _lastQuote);
				_lastQuote = int(Utils.PickRandomIn(allQuotes));
				ShowQuote(TextFactory.instance.GetMsg(_lastQuote));
			} else {
				if(!_hasBeenHit) { 
					ShowQuote(HB_LevelVaultController.myChallengerHighscore.metaChallenge.PickRandomBeforeQuote());
				} else if(_goingBack) {
					ShowQuote(HB_LevelVaultController.myChallengerHighscore.metaChallenge.PickRandomAfterQuote());
				}
			}
			
			
			//quoteBulleAnim.SetCurrentFrame(1);
			_waitQuoteTime = WAIT_UNTIL_NEXT_QUOTE;
			 
		}
		
		
		public function ShowQuote(txt:String):void {
			quoteTxt.text = txt;
			Utils.SetMaxSizeOfTxtField(quoteTxt, 16);
			Jukebox.instance.PlaySound(_lastSnd);
		}
				
		private function get metaGeek():MetaHBGeek {
			return MetaHBGeek(metaInfo);
		}
		
		private function get quoteBulleAnim():Animation {
			return Animation(_quote.animationContainer.getChildAt(0));	
		}
			
		private function get quoteBulle():MovieClip {
			return MovieClip(quoteBulleAnim.getChildByName("bulle"));
		}
		private function get quoteTxt():TextField {
			return TextField(quoteBulle.getChildByName("dynamicText"));
		}
		
		public function get landed() : Boolean {
			return _landed;
		}
		
		private function get metaPerso():MetaPerso {
			return HB_Game(context).hero.metaHero.metaPerso;
		}
		
		public function get controlVx():int {
			return Math.min(Math.max(-500, controlSteeringX * (vx * 0.5)*(1+(metaPerso.totalControl) / 60)), 500);
		}

		public function get controlVy():int {
			return Math.min(Math.max(-500, controlSteeringY * (vy * 0.5)*(1+(metaPerso.totalControl) / 60)), 500);			
		}
				
		public function get isFlyAnim():Boolean { return !_hasRebound && _hasBeenHit;}
		public function get isHitAnim():Boolean { return _hasRebound ; 
		}
		
		public function get isInCannon() : Boolean {
			return _isInCannon;
		}
		
		public function get isOffScreen():Boolean  {
			return py < -10000;
		}
		
		public function get waitBerzerker() : Number {
			return _waitBerzerker;
		}
		
		public function get hitByBerzerk() : Berzerker {
			return _hitByBerzerk;
		}
		
		public function set waitBerzerker(waitBerzerker : Number) : void {
			_waitBerzerker = waitBerzerker;
		}
		
		public function get distance() : int {return px;}
		public function get height() : int {return py;}
		
		public function get controlSteeringX() : Number {return _controlSteeringX.value;}
		public function set controlSteeringX(controlSteeringX : Number) : void {_controlSteeringX.value = controlSteeringX;}
		public function get controlSteeringY() : Number{return _controlSteeringY.value;}
		public function set controlSteeringY(controlSteeringY : Number) : void {_controlSteeringY.value = controlSteeringY;
		}
		
		public function get punched() : Number {
			return _punched;
		}

		override public function get px() : Number {return _px.value;}
		override public function get py() : Number {return _py.value;}
		override public function get vx() : Number {return _vx.value;}
		override public function get vy() : Number {return _vy.value;}

		override public function set px(px : Number) : void {_px.value = px;}
		override public function set py(py : Number) : void {_py.value = py;}
		override public function set vx(vx : Number) : void {_vx.value = vx;}
		override public function set vy(vy : Number) : void {_vy.value = vy;}
	}
}