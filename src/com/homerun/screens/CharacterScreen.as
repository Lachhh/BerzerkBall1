package com.homerun.screens {
	import com.homerun.screens.view.distribution.SponsorLogoView;
	import mochi.as3.MochiEvents;

	import com.homerun.factories.HB_AnimationFactory;
	import com.homerun.factories.HB_SfxFactory;
	import com.homerun.hero.HB_HeroManager;
	import com.homerun.io.HB_GameProgress;
	import com.homerun.meta.ui.MetaGameProgress;
	import com.homerun.screens.view.perso.PersoIconStatsView;
	import com.lachhhEngine.games.Game;
	import com.lachhhEngine.games.MainGame;
	import com.lachhhEngine.games.animation.Animation;
	import com.lachhhEngine.games.animation.AnimationManager;
	import com.lachhhEngine.games.meta.MetaObject;
	import com.lachhhEngine.games.sfx.Jukebox;
	import com.lachhhEngine.initializers.VersionInfo;
	import com.lachhhEngine.interfaces.forms.Button;
	import com.lachhhEngine.io.Callback;
	import com.lachhhEngine.utils.Utils;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	/**
	 * @author Lachhh
	 */
	public class CharacterScreen extends HB_Screen {
		private var _persoStats:PersoIconStatsView;
		private var _selectCallback:Callback ;
		private var _color:Number ; 
		private var _sponsorLogo:SponsorLogoView ;
		override public function Init(metaObject : MetaObject, context : Game) : void {
			super.Init(metaObject, context);
			_sponsorLogo = new SponsorLogoView(sponsorCharacter);
			_persoStats = new PersoIconStatsView(panel);
			metaProgress.lastSelected = metaProgress.metaDenize;
			_persoStats.SetMetaPerso(metaProgress.metaDenize);
			nextBtn.addEventListener(MouseEvent.MOUSE_DOWN, onNext);
			prevBtn.addEventListener(MouseEvent.MOUSE_DOWN, onPrev);
			startBtn.addEventListener(MouseEvent.MOUSE_DOWN, onStart);
			backBtn.addEventListener(MouseEvent.MOUSE_DOWN, onBack);
			_color = 0 ;
			Refresh();
			
			InitCancelBtn(backBtn);
			InitOkBtn(nextBtn);
			InitOkBtn(prevBtn);
			InitOkBtn(startBtn);
		}

		override public function RemoveListeners() : void {
			super.RemoveListeners();
			nextBtn.addEventListener(MouseEvent.MOUSE_DOWN, onNext);
			prevBtn.addEventListener(MouseEvent.MOUSE_DOWN, onPrev);
			startBtn.addEventListener(MouseEvent.MOUSE_DOWN, onStart);
			backBtn.addEventListener(MouseEvent.MOUSE_DOWN, onBack);
			_sponsorLogo.Destroy();
		}
		
		private function onBack(event : MouseEvent) : void {
			Close(true);
			animation.SetCurrentFrame(45);
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Character Screen", "Back");
		}

		public function SetCallback(selectCallback:Callback):void {
			_selectCallback = selectCallback;
		}
		
		private function onStart(event : MouseEvent) : void {
			if(!metaProgress.IsUnlocked(metaProgress.lastSelected)) return ;
			if(_selectCallback != null) {
				Close(true, _selectCallback);
				Jukebox.instance.PlaySound(HB_SfxFactory.ID_SFX_SIDE_ARTWORK);
			}
			if(VersionInfo.sponsorVisualFrame == VersionInfo.FRAME_JALUDO) MochiEvents.trackEvent("Character Screen", "Start");
		}

		private function onPrev(event : MouseEvent) : void {
			Select(-1);
		}

		private function onNext(event : MouseEvent) : void {
			Select(1);	
		}
		
		private function Select(mod:int):void {
			var id:int = Utils.CropIn(metaProgress.lastSelected.id+mod, HB_HeroManager.PERSO_ETIENNE, HB_HeroManager.PERSO_DENIZE);
			metaProgress.lastSelected = metaProgress.GetFromId(id);
			_persoStats.SetMetaPerso(metaProgress.lastSelected);
			Refresh();
			_color = 255;
		}

		override public function ShowIdle(context : MainGame) : void {
			super.ShowIdle(context);
			if(_color > 0) {
				_color -= 50*context.game.speedManager.GetSpeed();
				Utils.SetColor(charIcon, _color, _color, _color);
			} else {
				Utils.SetColor(charIcon);	
			}
		}

		override public function CreateVisual() : Animation {
			return AnimationManager.instance.CreateAnimation(HB_AnimationFactory.ID_CHARACTER_SCREEN);
		}
		
		override public function Refresh():void {
			_persoStats.Refresh();
		}
		
		private function get metaProgress():MetaGameProgress {
			return HB_GameProgress.gameProgress.metaProgress;	
		}

		override protected function get playOpenSound() : Boolean {
			return false;
		}		 

		private function get prevBtn():Button { return Button(panel.getChildByName("prevBtn")); }
		private function get nextBtn():Button { return Button(panel.getChildByName("nextBtn")); }
		
		private function get startBtn():Button { return Button(panel.getChildByName("startBtn")); }
		private function get backBtn():Button { return Button(panel.getChildByName("backBtn")); }
		private function get charIcon():MovieClip { return MovieClip(panel.getChildByName("charIcon")); }
		private function get sponsorCharacter():MovieClip { return MovieClip(panel.getChildByName("sponsorCharacter")); }
		
	}
}
