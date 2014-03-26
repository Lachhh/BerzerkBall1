package com.homerun.screens.view.perso {
	import com.homerun.HB_Game;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.hero.Hero;
	import com.homerun.io.AchievementManager;
	import com.homerun.meta.ui.MetaPerso;
	import com.homerun.meta.ui.MetaUpgrade;
	import com.homerun.meta.ui.trophy.MetaTrophyEnum;
	import com.homerun.multilingual.HB_TextFactory;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.screens.FlashScreen;
	import com.lachhhEngine.games.screens.ScreenFactory;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class PersoUpgradeView extends PersoStatsView {
		private var _persoVisual:Animation ;
		private var _context:HB_Game ;
		private var _withVisual:Boolean ;
		private var _quote : Animation;
		private var _waitQuoteTime : Number;
		private const WAIT_UNTIL_NEXT_QUOTE:int = 4*36;
		private const WAIT_UNTIL_QUOTE_DISAPPEAR:int = 1*36;
		
		public function PersoUpgradeView(visual : MovieClip, context:Game, withVisual:Boolean) {
			super(visual);
			strBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickStr);
			precisionBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickPrecision);
			controlBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickControl);
			_context = HB_Game(context);
			_withVisual = withVisual;
			
			strView.showNumbers = true;
			precisionView.showNumbers = true;
			controlView.showNumbers = true;
			
			applyPtsFx.gotoAndStop(applyPtsFx.totalFrames);
		}

		override public function Destroy() : void {
			super.Destroy();
			DestroyVisual();
			strBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickStr);
			precisionBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickPrecision);
			controlBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickControl);
		}
		
		private function DestroyVisual():void {
			if(_persoVisual != null) {
				visual.removeChild(_persoVisual);
				AnimationManager.instance.Destroy(_persoVisual);
				AnimationManager.instance.Destroy(_quote);
				_persoVisual = null;
			}	
		}

		override public function SetMetaPerso(metaPerso : MetaPerso) : void {
			super.SetMetaPerso(metaPerso);
			DestroyVisual();		
			if(_withVisual) {
				_persoVisual = AnimationManager.instance.CreateAnimation(_context.hero.metaHero.animIdleId);
				_persoVisual.AddAnimationAssetGroup("weapons", Hero.WEAPON_GROUP_ID);
				_persoVisual.AddAnimationAssetGroup("belt", Hero.BELT_GROUP_ID);
				_persoVisual.AddAnimationAssetGroup("bandana", Hero.BANDANA_GROUP_ID);
				_persoVisual.AddAnimationAssetGroup("bracers", Hero.BRACERS_GROUP_ID);
				_persoVisual.AddAnimationAssetGroup("titiNez", Hero.TITI_NEZ_GROUP_ID);
				visual.addChildAt(_persoVisual, 7);
				
				_persoVisual.x = applyPtsFx.x;
				_persoVisual.y = applyPtsFx.y-5;
				
				_quote = AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_FX_GEEKBULLANIM);
				_quote.x = _persoVisual.x;
				_quote.y = _persoVisual.y -20;
				_quote.alpha = 0;
				_quote.mouseChildren = _quote.mouseEnabled = false;
				visual.addChild(_quote);
			}
		}

		private function onClickControl(event : MouseEvent) : void {
			AddIfCan(metaPerso.control);
		}

		private function onClickPrecision(event : MouseEvent) : void {
			AddIfCan(metaPerso.precision);
		}

		private function onClickStr(event : MouseEvent) : void {
			AddIfCan(metaPerso.str);
		}
		
		private function AddIfCan(metaUpgrade:MetaUpgrade):void {
			if(metaPerso.totalPoints > 0) {
				metaUpgrade.upgradeValue++;
				if(metaUpgrade.isMaxed) {
					AchievementManager.instance.BestowAchievement(MetaTrophyEnum.TROPHY_34);	
				}
				ShowApplyPtsFx();
				
			}
			Refresh();
		}
		
		private function ShowApplyPtsFx():void {
			applyPtsFx.visible = true;
			applyPtsFx.gotoAndStop(1);	
			
			var allSnd:Array = [HB_TextFactory.ID_HERO_LVL_UP_QUOTE_1, 
				HB_TextFactory.ID_HERO_LVL_UP_QUOTE_2, 
				HB_TextFactory.ID_HERO_LVL_UP_QUOTE_3,
				HB_TextFactory.ID_HERO_LVL_UP_QUOTE_4,
				HB_TextFactory.ID_HERO_LVL_UP_QUOTE_5];
			
			_waitQuoteTime = WAIT_UNTIL_NEXT_QUOTE;
			quoteTxt.text = TextFactory.instance.GetMsg(int(Utils.PickRandomIn(allSnd)));
			Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_STAT_BOOST);
			
			var f:FlashScreen = FlashScreen(ScreenManager.instance.ShowScreen(ScreenFactory.FLASH_SCREEN));
			f.InitFlash(0xFF0000, 5);
		}
		
		override public function Refresh() : void {
			super.Refresh();
			charNameTxt.text = TextFactory.instance.GetMsg(metaPerso.titleId);
			xpTxt.text = metaPerso.xp.upgradeValue + "";
			lvlTxt.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_LVL) + " " + metaPerso.xp.crntLevel ;
			ptsTxt.text = "" + metaPerso.totalPoints ;
			
			
			strBtn.visible = (!metaPerso.str.isMaxed || metaPerso.allMaxed) && metaPerso.totalPoints > 0;
			precisionBtn.visible = (!metaPerso.precision.isMaxed || metaPerso.allMaxed) && metaPerso.totalPoints > 0;
			controlBtn.visible = (!metaPerso.control.isMaxed || metaPerso.allMaxed) && metaPerso.totalPoints > 0;
			
			strView.nbTxt.visible = !strBtn.visible;
			precisionView.nbTxt.visible = !precisionBtn.visible;
			controlView.nbTxt.visible = !controlBtn.visible;
			
			 
			//nbTxt
			nbHitMc.visible = metaPerso.nbHits > 0;
			nbHitTxt.text = "+" + metaPerso.nbHits;
		}
		
		public function Update(context:Game):void {
			if(_persoVisual != null) {
				_persoVisual.Update(context);
				_persoVisual.SetFrameOfAssets(metaPerso.weaponFrame, Hero.WEAPON_GROUP_ID);
				_persoVisual.SetFrameOfAssets(metaPerso.beltFrame, Hero.BELT_GROUP_ID);
				_persoVisual.SetFrameOfAssets(metaPerso.bandanaFrame, Hero.BANDANA_GROUP_ID);
				_persoVisual.SetFrameOfAssets(metaPerso.bracersFrame, Hero.BRACERS_GROUP_ID);
				_persoVisual.SetAssetsVisible(metaPerso.bandanaFrame <= 7, Hero.TITI_NEZ_GROUP_ID);
				
				_waitQuoteTime -= context.speedManager.GetSpeed();
				if(_waitQuoteTime > WAIT_UNTIL_QUOTE_DISAPPEAR) {
					quoteBulleAnim.alpha = Math.min(1, quoteBulleAnim.alpha + 0.1) ;
					Utils.SetColor(_persoVisual, 0,0,(1-(applyPtsFx.currentFrame/applyPtsFx.totalFrames))*150);
				} else if(_waitQuoteTime > 0) {
					quoteBulleAnim.alpha = Math.max(0, quoteBulleAnim.alpha - 0.1) ;
					Utils.SetColor(_persoVisual, 0,0,(1-(applyPtsFx.currentFrame/applyPtsFx.totalFrames))*150);
				} else {
					Utils.SetColor(_persoVisual);	
				}
				
				if(_quote != null) {
					_quote.Update(context);	
				}
			}
			applyPtsFx.nextFrame();
			applyPtsFx.visible = applyPtsFx.currentFrame < applyPtsFx.totalFrames;
		}

		private function get charNameTxt():TextField {return TextField(visual.getChildByName("charNameTxt"));}
		private function get xpTxt():TextField {return TextField(visual.getChildByName("xpTxt"));}
		private function get lvlTxt():TextField {return TextField(visual.getChildByName("lvlTxt"));}
		private function get ptsTxt():TextField {return TextField(visual.getChildByName("ptsTxt"));}
		private function get strBtn():Button {return Button(visual.getChildByName("strBtn"));}
		private function get precisionBtn():Button {return Button(visual.getChildByName("precisionBtn"));}
		private function get controlBtn():Button {return Button(visual.getChildByName("controlBtn"));}
		private function get nbHitMc():MovieClip {return MovieClip(visual.getChildByName("nbHitMc"));}
		private function get nbHitTxt():TextField {return TextField(nbHitMc.getChildByName("nbHitTxt"));}
		private function get applyPtsFx():MovieClip {return MovieClip(visual.getChildByName("applyPtsFx"));}
		

		
		
		private function get quoteBulleAnim():Animation {return Animation(_quote);}
		private function get quoteBulle():MovieClip {return MovieClip(_quote.getChildByName("bulle"));}
		private function get quoteTxt():TextField { return TextField(quoteBulle.getChildByName("dynamicText"));}		
	}
}
