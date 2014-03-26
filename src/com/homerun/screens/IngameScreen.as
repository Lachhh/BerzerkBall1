package com.homerun.screens {
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import com.homerun.init.HB_VersionInfo;
	import com.homerun.HB_Game;
	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.hero.Geek;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.io.HB_LevelVaultController;
	//import com.homerun.io.HB_LevelVaultModel;
	import com.homerun.meta.ui.MetaGameProgress;
	import com.homerun.multilingual.HB_TextFactory;
	import com.homerun.screens.view.OptionsWidget;
	import com.homerun.screens.view.ingame.PowerPanel;
	import com.homerun.screens.view.ingame.PrecisionPanel;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.screens.Screen;
	import com.lachhhEngine.games.screens.ScreenManager;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.io.KeyManager;
	import com.lachhhEngine.multilingual.TextFactory;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * @author Lachhh
	 */
	public class IngameScreen extends Screen {
		private var _precisionWidget:PrecisionPanel ;
		private var _powerWidget:PowerPanel ;
		private var _optionsWidget:OptionsWidget;
		private var _context:HB_Game ;
		private var _optionsInit:Boolean ;
		private var _challengeBox:ChallengeBoxScreen ;
		private var _sponsorLogoView:SponsorLogoView;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_sponsorLogoView = new SponsorLogoView(sponsorIngame);
			state = STATE_IDLE ;
			_precisionWidget = new PrecisionPanel(precisionPanel);
			_powerWidget = new PowerPanel(powerPanel);
			_optionsWidget = new OptionsWidget(optionsWidgetVisual);
			_context = HB_Game(context);
			bonusMc.gotoAndStop(bonusMc.totalFrames);
			pauseBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickPause);
			aimBtn.Destroy();
			hitBtn.Destroy();
			hitRunningBtn.Destroy();
			//aimBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickBtn);
			//hitBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickBtn);
			//hitRunningBtn.addEventListener(MouseEvent.MOUSE_DOWN, onClickBtn);
			_optionsInit = false;
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			pauseBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickPause);
			//aimBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickBtn);
			//hitBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickBtn);
			//hitRunningBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onClickBtn);
			_optionsWidget.Destroy();
			_sponsorLogoView.Destroy();
		}
		
		private function onClickPause(event : MouseEvent) : void {
			_context.PauseAndOption();
		}

		private function onClickBtn(event : MouseEvent) : void {
			if(_precisionWidget.isOn) {
				_precisionWidget.StopAndSelect();
				aimBtn.visible = false;
				hitBtn.visible = true;
				Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_ACC_CLICK);
			} else if(_powerWidget.isOn) {
				_powerWidget.StopAndSelect();
				hitBtn.visible = false;
				if(_powerWidget.isMaxed) {
					ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_KILLERSHOT_SCREEN);
				}
				if(_challengeBox != null) {
					_challengeBox.Hide();
					_challengeBox = null;
				}
			} 
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_INGAME_SCREEN);
		}
		
		public function InitShot():void {
			_precisionWidget.nbValue = (metaGameProgress.lastSelected.totalPrecision)*2+10;
			_powerWidget.nbValue = (metaGameProgress.lastSelected.totalPrecision)*2+10;
			_precisionWidget.On(new Callback(onPrecisionEnded, this, null));
			_powerWidget.Off();
			_precisionWidget.Show();
			_powerWidget.Show();
			aimBtn.visible = true;
			hitBtn.visible = false;	
			
			if(HB_LevelVaultController.myChallengerHighscore != null) {
				_challengeBox = ChallengeBoxScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_CHALLENGEBOX_SCREEN));
			}
			
			if(HB_VersionInfo.mtvPlayerScoreLoaded) {
				_challengeBox = ChallengeBoxScreen(ScreenManager.instance.ShowScreen(HB_ScreenFactory.ID_CHALLENGEBOX_SCREEN));	
			}
		}
		
		private function onPrecisionEnded():void {
			_powerWidget.On(new Callback(onPowerEnded, this, null));
			_context.hero.GatherIn();	
		}
		
		private function onPowerEnded():void {
			_context.HitGeek();
		}

		public function Show():void {
			visual.visible = true;	
		}
		
		public function Hide():void {
			visual.visible = false;	
		}
		
		public function HideWidget():void {
			_precisionWidget.Hide();
			_powerWidget.Hide();	
			aimBtn.visible = false;
			hitBtn.visible = false;
		}
		
		override public function ShowIdle(context : MainGame) : void {
			super.ShowIdle(context);
			if(!_context.isInit || _context.levelEditorMode) return ;
			
			_precisionWidget.Update();
			_powerWidget.Update();			
	
			distTxt.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_DISTANCE).split("[x]").join("\n" + Utils.PutVirgules(_context.geekDistance)) ;
			heightTxt.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_HEIGHT).split("[x]").join("\n" + Utils.PutVirgules(_context.geekHeight)) ;
			
			hitRunningBtn.visible = _context.isSuccessfulHit && _context.canHitAgain;
			if(KeyManager.IsMousePressed() && (visual.mouseX > 125 || visual.mouseY > 125) && !context.game.paused &&
				ScreenManager.instance.GetNbActiveById(HB_ScreenFactory.ID_CONTROL_SCREEN) <= 0) {
				if(_context.canHitAgain) {
					if(_context.isSuccessfulHit) {
						_context.HitRunningGeek();	
					} else {
						_context.Miss();
					}
				} else if(!_context.hasHit ) {
					onClickBtn(null);
				}
			}
			
			nbHitMc.visible = !_context.roundFinished && (_context.hero.nbHit > 0);
			nbHitTxt.text = "+" + _context.hero.nbHit;
			cashTxt.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_CASH) + " : $" + (HB_GameProgress.gameProgress.cash + _context.moneyBonus);
			
			
			if(HB_LevelVaultController.myChallengerHighscore != null) {
				challengeTxt.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_PLAYER_NAME_CHALLENGE).split("[x]").join(HB_LevelVaultController.myChallengerHighscore.name) + ":\n" + Utils.PutVirgules(HB_LevelVaultController.myChallengerHighscore.highscore) + ""  ; 
				challengeTxt.visible = true;
			} else if(HB_VersionInfo.mtvPlayerScoreLoaded) {
				challengeTxt.text = TextFactory.instance.GetMsg(HB_TextFactory.ID_PLAYER_NAME_CHALLENGE).split("[x]").join(HB_VersionInfo.mTVPlayerName) + ":\n" + Utils.PutVirgules(HB_VersionInfo.mTVPlayerScore) + ""  ;
				challengeTxt.visible = true;
			} else {
				challengeTxt.visible = false;
			}
			//challengeTxt.visible = false;
			 
			if(!_optionsInit) {
				_optionsInit = true;
				_optionsWidget.Update();
			}
			
			bonusMc.nextFrame() ;
			bonusMc.visible = (bonusMc.currentFrame < bonusMc.totalFrames);
		}
		
		public function ShowBonusTxt(str:String, x:int, y:int):void {
			bonusDynamicTxt.text = str;
			bonusMc.gotoAndStop(1);
			bonusMc.x = x;
			bonusMc.y = y;
		}
		
		private function get precisionPanel():MovieClip {return MovieClip(visual.getChildByName("precisionPanel"));}
		private function get powerPanel():MovieClip {return MovieClip(visual.getChildByName("powerPanel"));	}
		private function get geek():Geek { return _context.geek;}
		
		public function get precisionWidget() : PrecisionPanel {
			return _precisionWidget;
		}
		
		public function get powerWidget() : PowerPanel {
			return _powerWidget;
		}
		
		private function get metaGameProgress():MetaGameProgress { return HB_GameProgress.gameProgress.metaProgress ;}
				
		private function get distTxt():TextField {return TextField(visual.getChildByName("distTxt"));}
		private function get heightTxt():TextField {return TextField(visual.getChildByName("heightTxt"));}
		private function get challengeTxt():TextField {return TextField(visual.getChildByName("challengeTxt"));}
		private function get aimBtn():Button {return Button(visual.getChildByName("aimBtn"));}
		private function get hitBtn():Button {return Button(visual.getChildByName("hitBtn"));}
		private function get hitRunningBtn():Button {return Button(visual.getChildByName("hitRunningBtn"));}
		private function get nbHitMc():MovieClip {return MovieClip(visual.getChildByName("nbHitMc"));}
		private function get nbHitTxt():TextField {return TextField(nbHitMc.getChildByName("nbHitTxt"));}
		private function get cashTxt():TextField {return TextField(visual.getChildByName("cashTxt"));}
		private function get optionsWidgetVisual():MovieClip {return MovieClip(visual.getChildByName("optionsWidget"));}
		private function get bonusMc():MovieClip {return MovieClip(visual.getChildByName("bonusMc"));}
		private function get sponsorIngame():MovieClip {return MovieClip(visual.getChildByName("sponsorIngame"));}
		
		private function get bonusTxtMc():MovieClip {return MovieClip(bonusMc.getChildByName("bonusTxtMc"));}
		private function get bonusDynamicTxt():TextField {return TextField(bonusTxtMc.getChildByName("bonusDynamic"));}
		private function get pauseBtn():Button {return Button(visual.getChildByName("pauseBtn"));}
		
		public function get optionsWidget() : OptionsWidget {
			return _optionsWidget;
		}
	}
}
